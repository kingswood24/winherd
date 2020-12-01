{
  08/01/09 [V3.9 R5.6] /SP Additional Feature : Proc AddCow - Default Cow To Pedigree if pedigree module present

  17/09/10 [V4.0 R4.8] /MK Additional Feature - Incorporated WinData.CheckEventExists Into btnServiceData.

  08/12/10 [V4.0 R6.1] /MK Bug - Program Was No Reading In Second Service Date From File - Tony Doorley.

  21/11/12 [V5.1 R3.2] /MK Additional Feature - Added import of Weighing Events for zero lact in herd animals.

  14/03/13 [V5.1 R5.3] /MK Change - Finished off the coding for Pedigree Import.

  14/11/13 [V5.2 R5.4] /MK Change - Pedigree Records - Program will now update the pedigree (name,herdbookno) details
                                                       of AID record/animal on the ICBF File.

  21/11/13 [V5.2 R5.8] /MK Additional Feature - Import Service Events and bulls for the previous lactation if ICBF Service Date is
                                                greater than the previous lactation calving date.

  26/11/13 [V5.2 R5.9] /MK Bug Fix - Changed AddBull to set Breeding to False if Pedigree but True if Service Bull.

  09/12/13 [V5.2 R6.1] /MK Bug Fix - Source code was never carried over from my old PC for this unit
                                     which had the Service Event problem fixed. This version has this new set of code.

  25/02/14 [V5.2 R8.6] /MK Bug Fix - btnServiceDataClick - Procedure add to set bulls as active/not active if in service events within/less than 12 months ago - GL Request.

  04/03/14 [V5.2 R8.8] /MK Bug Fix - btnPedigreeClick - If animal exists then still update DamID/Sire of updated animal.

  18/03/14 [V5.2 R9.0] /MK Additional Feature - Added the capability of downloading mail attachments through Gmail.

  21/03/14 [V5.2 R9.0] /MK Additional Feature - Added the capability of not showing the Modal if there are no attachments (from Links menu only).

  21/05/14 [V5.3 R0.5]/[V5.3 R1.5] /MK Change - New Boolean Variable, FOnlyShowForm, created to show the form instead of email prompt
                                                for MenuUnit/Import and MenuUnit/Herd/ImportICBFData.

  25/08/14 [V5.3 R5.7] /MK Additional Feature - On btnMilkRecords.Click check for animals that have a calving date in the ICBF file but this
                                                calving event does not exist in the cows current lactation. This option can be used to allow Dairy
                                                farmers to import calving events from the ICBF file after a new milking cow has been purchased into
                                                the herd. If a farmer is buying back in an animal then the Transfers In file is best used so all
                                                breeding data comes back into the herd.

  15/09/14 [V5.3 R6.2] /MK Additional Feature - Check WinData.FAttachmentsDownloaded to see whether attachments were downloaded
                                                by the user and if they were then just show attachment screen. If they were not then
                                                just download the attachments withouth any question to user - request by GL/Agents meeting 11/09/14.

  04/11/14 [V5.3 R8.8] /MK Bug Fix - GetICBFFile - Showing confirmation message when none required for new Links approach.

  01/03/15 [V5.4 R1.7] /MK Change - btnServiceDataClick - Bring in SireBreed of Service Sire from ICBF file.
                                  - AddCow/AddBull - Don't default breed to FR, just create a breed from breed code - SP/GL request.

  07/08/15 [V5.4 R7.2] /MK Change - btnWeighingRecordsOnClick - Weighing events should be imported for animals that had left the herd - Ger Dineen request.

  02/10/15 [V5.4 R9.3] /MK Bug Fix - btnServiceDataClick - First check to make sure that the event does not exist.
                                                         - Assign previous lactation to the event.

  02/12/15 [V5.5 R1.4] /MK Change - EnableGroupBox - Milk Recording group box should only be available with Milk Recording module.
                           Additional Feature - FormActivate - Check HerdType and change EBI Group Box to Maternal Index if HerdType is Suckler.
                                              - btnEBIDataClick - Added code to import the maternal index from the ICBF file for Suckler herds.

  29/01/16 [V5.5 R3.4] /MK Additional Feature - New feature added to add animals from ICBF file that are not in database - GL request.
                                              - Only show the import animals group box if in test version.

  02/03/16 [V5.5 R5.2] /MK Bug Fix - AddBull - Was not taking into account that the bull being added was a stock bull/calf.

  10/03/16 [V5.5 R5.4] /MK Change - btnEBIDataClick - Set new IgnoreEBIUpdate boolean in CowExt to true so that this animals EBI values
                                                      will not be updated by the Create YoungStock EBI procedure in MenuUnit/DairyData.

  18/03/16 [V5.5 R4.3] /MK Change - Gray out all buttons as problem with Nick Kearney animal lactations happened with this screen.

  18/03/16 [V5.5 R4.4] /MK Bug Fix - ImportCalvings - Check for AAllLacts and also move this block into the ICBFCalvingDownload.AnimalOnFile block.
                                                    - Assisgn iMaxAnimalLactNo to zero to start with as when SQL to update animals was being executed
                                                      Delphi was assigning a default large value as iMaxAnimalLactNo so the SQL was being executed.
                                   - Added all buttons back in again bar the Import Animals.

  09/09/16 [V5.5 R9.4] /MK Change - btnWeighingRecordsClick - Removed zero lactation check because Ger Dineen and Gerry (Kingswood) decided that it should be restricted.

  26/04/16 [V5.6 R7.1] /MK Change - btnServiceDataClick - Refactored the code so that the TServiceEvent isn't called twice for service before or after calving.
                           Additional Feature - btnImportPlannedBulls - New button added to import the planned bull events from the ICBF file.

  30/05/17 [V5.6 R8.6] /MK Bug Fix - AddBull - Check to see if the bull is not in the herd, doesn't have a tag number but does have an animal number.
                                   - EnableGroupBox - Trying to enable cxGroupBox.Controls[j] here because of copy/paste bug.

  08/12/17 [V5.7 R6.1] /MK Incorporated Source From Release - btnServiceDataClick - Blank technician was being created if no technican name was in ICBF.

  07/06/19 [V5.8 R9.3] /MK Change - ActivateDeactiveBulls - Made this procedure quicker - Pauline Ryan took over 2 minutes to run now takes a second.

  23/08/19 [V5.9 R0.1] /MK Change - btnMilkRecordsClick - Give back result if Milk Recording file is saved.

  29/01/20 [V5.9 R2.1] /MK Change - Added sICBF_GENERATION EventSource to Planned Bull, Service and Weighing Records import.    
}

unit uICBFPCDownloadImporter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxLabel, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox,
  Db, DBTables, SQLHelper, cxProgressBar, cxDBProgressBar,
  uFileAttachmentImport, uMailBoxHelper, uHerdLookup, ICBFPCDownload,
  dxStatusBar, DateUtil, uDataBackup, uBreedingDataHelper, uApplicationLog;

type
   TAncestryTree = record
     AID,
     SIR, ASS, SSS, SSD,
          ASD, SDS, SDD,
     DAM, ADS, DSS, DSD,
          ADD, DDS, DDD : Integer;
  end;
  TUpdateAnimalSexType = (uasBull, uasCow, uasAID);
  TfmICBFPCDownloadImporter = class(TForm)
    gsEBIData: TcxGroupBox;
    btnEBIData: TcxButton;
    lEBIInfo: TcxLabel;
    QueryAnimals: TQuery;
    OpenDialog: TOpenDialog;
    gbServiceData: TcxGroupBox;
    btnServiceData: TcxButton;
    cxLabel3: TcxLabel;
    gbPedigreeData: TcxGroupBox;
    cxLabel4: TcxLabel;
    btnPedigree: TcxButton;
    gbMilkData: TcxGroupBox;
    cxLabel5: TcxLabel;
    btnMilkRecords: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel7: TcxLabel;
    lFileStatus: TcxLabel;
    btnClose: TcxButton;
    btnBrowse: TcxButton;
    gbWeighingData: TcxGroupBox;
    cxLabel2: TcxLabel;
    btnWeighingRecords: TcxButton;
    PBar: TcxProgressBar;
    gbImportPlannedBulls: TcxGroupBox;
    lImportPlannedBullsInfo: TcxLabel;
    btnImportPlannedBulls: TcxButton;
    StatusBar: TdxStatusBar;
    btnImportAnimals: TcxButton;
    procedure btnEBIDataClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnServiceDataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPedigreeClick(Sender: TObject);
    procedure btnMilkRecordsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnWeighingRecordsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnImportAnimalsClick(Sender: TObject);
    procedure btnImportPlannedBullsClick(Sender: TObject);
  private
    { Private declarations }
    FUpdated : Integer;
    ICBFFileName : string;
    FHerdIdentity : string;
    FResult : Boolean;
    RemoveFile : Boolean;
    FSireUpdated, FDamUpdated, FAISUpdated : Boolean;
    FFromEmail : Boolean;
    FHerdType : THerdType;
    FNewAnimalsAdded : Integer;
    function GetHerdIdentity : String;
    procedure EnableGroupBox(AEnable : Boolean; AGroupBoxTag : Integer);
    function AddBull(ACode, ABreed, AName, AHerdBook, ATagType: string;
      ADateOfBirth: TDateTime; const ABreeding : Boolean = False;
      const ATagNumber : String = ''; const AInHerdAnimal : Boolean = False) : Integer;
    function AddCow(ACode, ABreed, AName, AHerdBook: string;
      ADateOfBirth: TDateTime; const ATagNumber : string = '';
      const ALactNo : Integer = 0; const AInHerdAnimal : Boolean = False): Integer;
    function UpdateAnimal(AExistID : Integer;
      ACode, ABreed, AName, AHerdBook: string;
      ADateOfBirth: TDateTime;
      AUpdateAnimalSexType : TUpdateAnimalSexType;
      const ABreeding : Boolean = False ) : Integer;
    function SetAncestorID (AAnimal, AFieldValue : Integer; AField : String) : Boolean;
    function GetLastEventDate(const AID, AEventType, ALactNo: Integer): TDateTime;
    function GetFresianBreedID : Integer;
    function GetICBFFile : string;
    procedure StepProgress;
    procedure ImportCalvings ( const AAllLacts : Boolean = False );
    function CreateBreedFromBreedCode ( ABreedCode : String ) : Integer;
    function GetExistingAnimalID (AICBFAnimal : TICBFAnimal) : Integer;
    procedure ActivateDeactiveBulls(AActivate: Boolean; AEventType : Integer);
    function GetBull(ABullTag, ATagType: string): Integer;
    procedure UpdateBullInUseStatus(AID: Integer);
  public
    { Public declarations }
    class function Execute(AHerdId : Integer; AShowFormOnly : Boolean;
       var ANewAnimalsAdded : Integer; const AShowForNoAttachments : Boolean = True) : Boolean;
  end;

var
  fmICBFPCDownloadImporter: TfmICBFPCDownloadImporter;
  FShowForNoAttachments : Boolean;
  FOnlyShowForm : Boolean;
  FHerdId : Integer;

implementation

uses DairyData, GenTypesConst, EventRecording,
     uICBFMilkDataSelect, uMilkRec, KRoutines, Def, KDBRoutines;

const
   cQueryAnimalsText = 'SELECT ID, AnimalNo, NatIDNum, LactNo, Breeding, SearchNatID, HerdID, InHerd'+cCRLF+
                       'FROM Animals'+cCRLF+
                       'WHERE (Upper(Sex) = "FEMALE")'+cCRLF+
                       'AND   (AnimalDeleted = False)'+cCRLF+
                       'AND   (HerdID = :AHerdID)';

   cQueryBreedingInHerdAnimalsText = 'SELECT ID, NatIDNum, LactNo, Breeding, SearchNatID, HerdID, InHerd'+cCRLF+
                                     'FROM Animals'+cCRLF+
                                     'WHERE (Upper(Sex) = "FEMALE")'+cCRLF+
                                     'AND   (AnimalDeleted = False)'+cCRLF+
                                     'AND   (InHerd = True)'+cCRLF+
                                     'AND   (HerdID = :AHerdID)'+cCRLF+
                                     'AND   (Breeding = True)';

{$R *.DFM}

{ TfmICBFPCDownloadImporter }

class function TfmICBFPCDownloadImporter.Execute(AHerdId : Integer; AShowFormOnly : Boolean;
   var ANewAnimalsAdded : Integer; const AShowForNoAttachments : Boolean = True): Boolean;
begin
   FHerdId := AHerdID;
   FShowForNoAttachments := AShowForNoAttachments;
   FOnlyShowForm := AShowFormOnly;
   with TfmICBFPCDownloadImporter.Create(nil) do
      try
         FNewAnimalsAdded := ANewAnimalsAdded;
         if ( ICBFFileName <> '' ) or ( AShowForNoAttachments ) then
            ShowModal;
         ANewAnimalsAdded := FNewAnimalsAdded;
         Result := FResult;
      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.FormCreate(Sender: TObject);
var
   i : Integer;
begin
   PBar.Visible := False;
   pBar.Width := 618;

   RemoveFile := False;
   EnableGroupBox(False, 1);
   EnableGroupBox(False, 2);
   EnableGroupBox(False, 3);
   EnableGroupBox(False, 4);
   EnableGroupBox(False, 5);
   EnableGroupBox(False, 6);

   WinData.MilkRecDir := GetSpecialFolder(CSIDL_DESKTOP);

   FHerdIdentity := GetHerdIdentity;

   ICBFFileName := GetICBFFile;

   btnImportAnimals.Visible := ( DirExists('C:\Kingswd') ) or ( DirExists('C:\Kingswood\Delphi Development\Delphi 5\Herd') );
   if ( btnImportAnimals.Visible ) then
      begin
         pBar.Width := 524;
         btnImportAnimals.Enabled := ( FileExists(ICBFFileName) );
      end;
end;

function TfmICBFPCDownloadImporter.GetHerdIdentity: String;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := 'kingswd';
         SQL.Add('Select HerdIdentity From Owners Where ID = :AID');
         Params[0].AsInteger := FHerdID;
         Open;
         try
            First;
            Result := FieldByName('HerdIdentity').AsString;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.btnBrowseClick(Sender: TObject);
begin
   with OpenDialog do
      begin
         if Execute then
            begin
               if FileExists(FileName) then
                  begin
                     ICBFFileName := FileName;
                     lFileStatus.Caption := ICBFFileName;
                     EnableGroupBox(True, 1);
                     EnableGroupBox(True, 2);
                     EnableGroupBox(True, 3);
                     EnableGroupBox(True, 4);
                     EnableGroupBox(True, 5);
                     EnableGroupBox(True, 6);
                     btnImportAnimals.Enabled := btnImportAnimals.Visible;
                  end
               else
                  begin
                     EnableGroupBox(False, 1);
                     EnableGroupBox(False, 2);
                     EnableGroupBox(False, 3);
                     EnableGroupBox(False, 4);
                     EnableGroupBox(False, 5);
                     EnableGroupBox(False, 6);
                     btnImportAnimals.Enabled := btnImportAnimals.Visible;
                  end;
            end;
      end;
end;

{ EBI DATA }
procedure TfmICBFPCDownloadImporter.btnEBIDataClick(Sender: TObject);
var
   fEBI,
   fMaternalIndex : Double;
   bFound : Boolean;
   ICBFEBIDownload : TICBFEBIDownload;
   ICBFMaternalIndexDownload : TICBFMaternalIndices;
   TempQuery : TQuery;
begin
   FUpdated := 0;
   Screen.Cursor := crHourGlass;
   try
      TempQuery := TQuery.Create(nil);
      TempQuery.DatabaseName := AliasName;
      if ( FHerdType = htDairy ) then
         begin
            ICBFEBIDownload := TICBFEBIDownload.Create(ICBFFileName,FHerdIdentity);
            try
               with QueryAnimals do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT ID, NatIDNum, LactNo, HerdID');
                     SQL.Add('FROM Animals');
                     SQL.Add('WHERE (Sex = "Female")');
                     SQL.Add('AND   (AnimalDeleted = False)');
                     SQL.Add('AND   (HerdID = :AHerdID)');
                     Params[0].AsInteger := FHerdId;
                     Open;
                     try
                        First;
                        while not eof do
                           begin
                              if ICBFEBIDownload.AnimalOnFile(FieldByName('NatIDNum').AsString) then
                                 begin
                                    ICBFEBIDownload.MoveFirst;
                                    fEBI := ICBFEBIDownload.EBI;

                                    if ( fEBI <> 0 ) then
                                       begin
                                          with TempQuery do
                                             begin
                                                SQL.Clear;
                                                SQL.Add('Select AnimalId From CowExt');
                                                SQL.Add('Where AnimalId = :AID');
                                                Params[0].AsInteger := QueryAnimals.FieldByName('ID').AsInteger;
                                                try
                                                   Open;
                                                   bFound := FieldByName('AnimalID').AsInteger>0;
                                                finally
                                                   Close;
                                                end;

                                                if ( not(bFound) ) then
                                                   begin
                                                      SQL.Clear;
                                                      SQL.Add(Format('INSERT INTO CowExt (AnimalID) VALUES (%d) ',[QueryAnimals.FieldByName('ID').AsInteger]));
                                                      ExecSQL;
                                                   end;

                                                //   10/03/16 [V5.5 R5.4] /MK Change - Set new IgnoreEBIUpdate boolean in CowExt to true so that this animals EBI values
                                                //                                     will not be updated by the Create YoungStock EBI procedure in MenuUnit/DairyData.
                                                if ( WinData.CurrentDBVersion >= 5563 ) then
                                                   begin
                                                      SQL.Clear;
                                                      SQL.Add(Format('UPDATE CowExt Set EBI = "%g", IgnoreEBIUpdate = True Where AnimalId = %d ', [fEBI,QueryAnimals.FieldByName('ID').AsInteger]));
                                                      ExecSQL;
                                                   end;

                                                Inc(FUpdated);
                                                if not FResult then
                                                   FResult := True;
                                             end;

                                       end;
                                 end;
                              Next;
                           end;
                     finally
                        Close;
                        if not RemoveFile then
                           RemoveFile := True;
                        if ( FUpdated > 0 ) then
                           MessageDlg(Format('%d EBI records updated.',[FUpdated]),mtInformation,[mbOK],0);
                     end;
                  end;
            finally
               FreeAndNil(ICBFEBIDownload);
            end;
         end
      //   02/12/15 [V5.5 R1.4] /MK Additional Feature - Added code to import the maternal index from the ICBF file for Suckler herds.
      else if ( FHerdType = htSuckler ) then
         begin
            ICBFMaternalIndexDownload := TICBFMaternalIndices.Create(ICBFFileName,FHerdIdentity);
            try
               with QueryAnimals do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT ID, NatIDNum, LactNo, HerdID, Sex');
                     SQL.Add('FROM Animals');
                     SQL.Add('WHERE ( (Upper(Sex) = "FEMALE") OR (Upper(Sex) = "BULL") )');
                     SQL.Add('AND   (AnimalDeleted = False)');
                     SQL.Add('AND   (HerdID = :AHerdID)');
                     Params[0].asInteger := FHerdId;
                     Open;
                     try
                        First;
                        while not eof do
                           begin
                              if ICBFMaternalIndexDownload.AnimalOnFile(FieldByName('NatIDNum').AsString) then
                                 begin
                                    ICBFMaternalIndexDownload.MoveFirst;
                                    fMaternalIndex := ICBFMaternalIndexDownload.MaternalIndex;

                                    if fMaternalIndex <> 0 then
                                       begin
                                          with TempQuery do
                                             begin
                                                if ( UpperCase(QueryAnimals.FieldByName('Sex').AsString) = 'FEMALE' ) then
                                                   begin
                                                      SQL.Clear;
                                                      SQL.Add('SELECT AnimalID');
                                                      SQL.Add('FROM CowExt');
                                                      SQL.Add('WHERE AnimalId = :AID');
                                                      Params[0].AsInteger := QueryAnimals.FieldByName('ID').AsInteger;
                                                      try
                                                         Open;
                                                         bFound := ( FieldByName('AnimalID').AsInteger > 0 );
                                                      finally
                                                         Close;
                                                      end;

                                                      if ( not(bFound) ) then
                                                         begin
                                                            SQL.Clear;
                                                            SQL.Add(Format('INSERT INTO CowExt (AnimalID) VALUES (%d) ',[QueryAnimals.FieldByName('ID').AsInteger]));
                                                            ExecSQL;
                                                         end;

                                                      SQL.Clear;
                                                      SQL.Add(Format('UPDATE CowExt Set EBI = "%g" Where AnimalId = %d ', [fMaternalIndex,QueryAnimals.FieldByName('ID').AsInteger]));
                                                      ExecSQL;
                                                   end
                                                else if ( UpperCase(QueryAnimals.FieldByName('Sex').AsString) = 'BULL' ) then
                                                   begin
                                                      SQL.Clear;
                                                      SQL.Add('SELECT AnimalID');
                                                      SQL.Add('FROM BullExt');
                                                      SQL.Add('WHERE AnimalID = :AnimalID');
                                                      Params[0].AsInteger := QueryAnimals.FieldByName('ID').AsInteger;
                                                      try
                                                         Open;
                                                         bFound := ( FieldByName('AnimalID').AsInteger > 0 );
                                                      finally
                                                         Close;
                                                      end;

                                                      if ( not(bFound) ) then
                                                         begin
                                                            SQL.Clear;
                                                            SQL.Add('INSERT INTO BullExt ( AnimalID )');
                                                            SQL.Add('VALUES (:AnimalID)');
                                                            Params[0].AsInteger := QueryAnimals.FieldByName('ID').AsInteger;
                                                            ExecSQL;
                                                         end;

                                                      SQL.Clear;
                                                      SQL.Add('UPDATE BullExt');
                                                      SQL.Add('SET RBI = :MaternalIndex');
                                                      SQL.Add('WHERE AnimalID = :AnimalID');
                                                      Params[0].AsFloat := fMaternalIndex;
                                                      Params[1].AsInteger := QueryAnimals.FieldByName('ID').AsInteger;
                                                      ExecSQL;
                                                   end;

                                                Inc(FUpdated);
                                                if ( not(FResult) ) then
                                                   FResult := True;
                                             end;

                                       end;
                                 end;
                              Next;
                           end;
                     finally
                        Close;
                        if not RemoveFile then
                           RemoveFile := True;
                        if ( FUpdated > 0 ) then
                           MessageDlg(Format('%d Maternal Index records updated.',[FUpdated]),mtInformation,[mbOK],0);
                     end;
                  end;
            finally
               FreeAndNil(ICBFMaternalIndexDownload);
            end;
         end;
   finally
      FreeAndNil(TempQuery);
   end;

   Screen.Cursor := crDefault;
end;

{ SERVICE DATA }
procedure TfmICBFPCDownloadImporter.btnServiceDataClick(Sender: TObject);
var
   ICBFAISDownload : TICBFAISDownload;
   ServiceEvent : TServiceEvent;
   AICode : string;
   iEventLactNo,
   iExistAITechnician,
   iServiceBull : Integer;
begin
   FUpdated := 0;
   Screen.Cursor := crHourGlass;
   ICBFAISDownload := TICBFAISDownload.Create(ICBFFileName,FHerdIdentity);
   try
      with QueryAnimals do
         begin
            Close;
            SQL.Text := cQueryBreedingInHerdAnimalsText;
            Params[0].AsInteger := FHerdId;
            Open;
            if ( QueryAnimals.RecordCount = 0 ) then
               begin
                  MessageDlg('No eligible animals to import planned bull events for.',mtInformation,[mbOK],0);
                  Exit;
               end;
            PBar.Visible := True;
            PBar.Properties.Min := 1;
            PBar.Properties.Max := QueryAnimals.RecordCount;
            Update;
            try
               First;
               while ( not(Eof) ) do
                  begin
                     if ( ICBFAISDownload.AnimalOnFile(QueryAnimals.FieldByName('NatIDNum').AsString) ) then
                        begin
                           ICBFAISDownload.MoveFirst;
                           while ( not(ICBFAISDownload.Eof) ) do
                              begin
                                 if ( not WinData.CheckEventExists(FieldByName('ID').AsInteger,cServiceEvent,ICBFAISDownload.AIDate) ) then
                                    begin
                                       iEventLactNo := 0;
                                       iEventLactNo := WinData.FBreedingDataHelper.BreedingEventLactNo(QueryAnimals.FieldByName('ID').AsInteger,
                                                                                                       QueryAnimals.FieldByName('LactNo').AsInteger,
                                                                                                       ICBFAISDownload.AIDate);

                                       iServiceBull := GetBull(ICBFAISDownload.AITag, ICBFAISDownload.AITagType);
                                       if ( iServiceBull <= 0 ) then
                                          begin
                                             with ICBFAISDownload do
                                                begin
                                                   //   01/03/15 [V5.4 R1.7] /MK Change - Bring in SireBreed of Service Sire from ICBF file.
                                                   if ( Length(ICBFAISDownload.AICode1) = 2 ) and (ICBFAISDownload.AICode1[1] in ['0'..'9']) and (ICBFAISDownload.AICode1[2] in ['0'..'9']) then
                                                      AICode := WinData.GetBreedCodeByPedigreeBreed(AICode1)
                                                   else
                                                      AICode := ICBFAISDownload.AICode1;
                                                   iServiceBull := AddBull(AITag, AICode, AIPedName, AIHerdBook, AITagType, AIDateOfBirth, True );
                                                end;
                                          end
                                       else
                                          UpdateBullInUseStatus(iServiceBull);

                                       try
                                          ServiceEvent := TServiceEvent.Create('AIS');
                                          ServiceEvent.Append;
                                          try
                                             ServiceEvent.AnimalID     := FieldByName('ID').AsInteger;
                                             ServiceEvent.AnimalLactNo := iEventLactNo;
                                             ServiceEvent.AnimalHerdID := FHerdID;
                                             ServiceEvent.EventDate    := ICBFAISDownload.AIDate;
                                             ServiceEvent.EventComment := 'Service';
                                             ServiceEvent.EventSource := sICBF_GENERATION;

                                             //   08/12/17 [V5.7 R6.1] /MK Bug Fix - Blank technician was being created if no technican name was in ICBF. 
                                             if ( Length(ICBFAISDownload.AITechName) > 0 ) then
                                                begin
                                                   iExistAITechnician := ServiceEvent.GenLookRecord.Locate('',ICBFAISDownload.AITechName,10);
                                                   if ( iExistAITechnician > 0 ) then
                                                      ServiceEvent.Technician := iExistAITechnician
                                                   else
                                                      ServiceEvent.Technician := ServiceEvent.GenLookRecord.AddRecord(Copy(ICBFAISDownload.AITechName,1,3),ICBFAISDownload.AITechName,10);
                                                end;

                                             ServiceEvent.ServiceType := ServiceEvent.GenLookRecord.Locate('',cServiceType_AI,1);
                                             ServiceEvent.ServiceBull := iServiceBull;
                                             ServiceEvent.AmountOfStraw := 1;
                                             ServiceEvent.Post;
                                             Inc(FUpdated);
                                             if not FResult then
                                                FResult := True;
                                          except
                                             ServiceEvent.Cancel;
                                          end;
                                       finally
                                          FreeAndNil(ServiceEvent);
                                       end;
                                    end;
                                 ICBFAISDownload.MoveNext;
                              end;
                        end;
                     StepProgress;
                     QueryAnimals.Next;
                  end;
            finally
               QueryAnimals.Close;
               if ( FUpdated > 0 ) then
                  begin
                     // Set bulls as not active if in service events more than 12 months ago - GL Request.
                     ActivateDeactiveBulls(False,CServiceEvent);
                     // Set bulls as active if in service events within the last 12 months - GL Request.
                     ActivateDeactiveBulls(True,CServiceEvent);
                  end;
               PBar.Visible := False;
               Update;
               if ( not(RemoveFile) ) then
                  RemoveFile := True;
               if ( FUpdated > 0 ) then
                  MessageDlg(Format('%d service records created.',[FUpdated]),mtInformation,[mbOK],0);
               SQL.Text := cQueryAnimalsText;
               Application.ProcessMessages;
               Update;
            end;
         end;
   finally
      FreeAndNil(ICBFAISDownload);
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmICBFPCDownloadImporter.EnableGroupBox(AEnable: Boolean; AGroupBoxTag: Integer);
var
   i, j : integer;
   cxGroupBox : TcxGroupBox;
begin
   for i := 0 to ControlCount-1 do
      begin
         if Controls[i] is TcxGroupBox then
            cxGroupBox := TcxGroupBox(Controls[i]);
         if cxGroupBox.Tag = AGroupBoxTag then
            begin
               for j := 0 to cxGroupBox.ControlCount-1 do
                  begin
                     if ( AGroupBoxTag = gbMilkData.Tag ) then
                        //   02/12/15 [V5.5 R1.4] /MK Change - Milk Recording group box should only be available with Milk Recording module.
                        cxGroupBox.Controls[j].Enabled := ( (AEnable) and (Def.Definition.dUseMilkRec) )
                     else if ( AGroupBoxTag = gbImportPlannedBulls.Tag ) then
                        //   02/05/17 [V5.6 R6.2] /MK Change - Planned Bull group box should only be available for test version users.
                        cxGroupBox.Controls[j].Enabled := ( (AEnable) and (HerdLookup.DefaultsUpdateNo >= 5672) )
                     else
                        cxGroupBox.Controls[j].Enabled := AEnable;
                  end;

               //   02/12/15 [V5.5 R1.4] /MK Change - Milk Recording group box should only be available with Milk Recording module.
               if ( AGroupBoxTag = gbMilkData.Tag ) then
                  cxGroupBox.Enabled := ( (AEnable) and (Def.Definition.dUseMilkRec) )
               //   02/05/17 [V5.6 R7.3] /MK Change - Planned Bull group box should only be available for test version users.
               //   30/05/17 [V5.6 R8.6] /MK Bug Fix - Trying to enable cxGroupBox.Controls[j] here because of copy/paste bug.
               else if ( AGroupBoxTag = gbImportPlannedBulls.Tag ) then
                  cxGroupBox.Enabled := ( (AEnable) and (HerdLookup.DefaultsUpdateNo >= 5672) )
               else
                  cxGroupBox.Enabled := AEnable;
               Break;
            end;
      end;
end;

//   20/11/12 [V5.1 R1.0] /MK Additional Feature - New Weighing Events panel added to import weighing events.
procedure TfmICBFPCDownloadImporter.btnWeighingRecordsClick(
  Sender: TObject);
var
   ICBFWeighDownload : TICBFAWTDownload;
   WeighingEvent : TWeighingEvent;
begin
   FUpdated := 0;
   Screen.Cursor := crHourGlass;
   ICBFWeighDownload := TICBFAWTDownload.Create(ICBFFileName,FHerdIdentity);
   WeighingEvent := TWeighingEvent.Create('icbfweigh');
   try
      with QueryAnimals do
         begin
            Close;
            SQL.Clear;
            // Set Query Animals Text to zero lact animals that are in herd.
            SQL.Add('SELECT ID, NatIDNum, LactNo');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE (AnimalDeleted = False)');
            SQL.Add('AND   (HerdID = :AHerdID)');
            SQL.Add('AND   ( (InHerd = True)');
            //   07/08/15 [V5.4 R7.2] /MK Change - Weighing events should be imported for animals that had left the herd - Ger Dineen request.
            SQL.Add('         OR (InHerd = False) AND (HerdID <> '+IntToStr(WinData.NONEHerdID)+') )');
            //   09/09/16 [V5.5 R9.4] /MK Change - Removed zero lactation check because Ger Dineen and Gerry (Kingswood) decided that it should be restricted.
            //SQL.Add('AND   (LactNo = 0)');
            Params[0].AsInteger := FHerdId;
            Open;
            try
               First;
               while ( not(Eof) ) do
                  begin
                     if ( ICBFWeighDownload.AnimalOnFile(FieldByName('NatIDNum').AsString) ) then
                        begin
                           ICBFWeighDownload.MoveFirst;
                           while ( not(ICBFWeighDownload.Eof) ) do
                              begin
                                 if ( ICBFWeighDownload.SaleDate = 0 ) or
                                    ( (ICBFWeighDownload.SaleDate > 0) and (ICBFWeighDownload.WeighDate < ICBFWeighDownload.SaleDate) ) then
                                    if ( ICBFWeighDownload.WeighDate > 0 ) and
                                       ( ICBFWeighDownload.Weight > 0 ) and
                                       ( not WinData.CheckEventExists(FieldByName('ID').AsInteger,CWeightEvent,ICBFWeighDownload.WeighDate) ) then
                                       begin
                                          WeighingEvent.Append;
                                          try
                                             WeighingEvent.AnimalID     := FieldByName('ID').AsInteger;
                                             WeighingEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                                             WeighingEvent.AnimalHerdID := FHerdID;
                                             WeighingEvent.EventDate    := ICBFWeighDownload.WeighDate;
                                             WeighingEvent.EventSource  := sICBF_GENERATION;
                                             WeighingEvent.Weight       := ICBFWeighDownload.Weight;
                                             Inc(FUpdated);
                                             if not FResult then
                                                FResult := True;
                                          except
                                             WeighingEvent.Cancel;
                                          end;
                                       end;
                                 ICBFWeighDownload.MoveNext;
                              end;
                        end;
                     Next;
                  end;
            finally
               Close;
               if not RemoveFile then
                  RemoveFile := True;
               if ( FUpdated > 0 ) then
                  MessageDlg(Format('%d weighing records created.',[FUpdated]),mtInformation,[mbOK],0);
            end;
         end;
   finally
      FreeAndNil(ICBFWeighDownload);
      FreeAndNil(WeighingEvent);
      Screen.Cursor := crDefault;

      // Set Query Animals Text back to original text just in case user clicks on add event button out of sequence.
      with QueryAnimals do
         begin
            SQL.Clear;
            SQL.Text := 'SELECT ID, NatIDNum, LactNo, SearchNatID'+cCRLF+
                        'FROM Animals'+cCRLF+
                        'WHERE (Sex = "Female")'+cCRLF+
                        'AND   (AnimalDeleted = False)'+cCRLF+
                        'AND   (HerdID = :AHerdID)';
         end;
   end;
end;

procedure TfmICBFPCDownloadImporter.btnPedigreeClick(Sender: TObject);
var
   ICBFDownloadAnimals : TICBFDownloadAnimals;
   ICBFAnimal : TICBFAnimal;
   i : Integer;
   AncestryTree : TAncestryTree;
begin
   Screen.Cursor := crHourGlass;
   PBar.Visible := True;
   if PBar <> nil then
      PBar.Position := 0;
   FUpdated := 0;
   ICBFDownloadAnimals := TICBFDownloadAnimals.Create(ICBFFileName,FHerdIdentity);
   try
      with QueryAnimals do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ID, NatIDNum, LactNo');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE AnimalDeleted = False');
            SQL.Add('AND HerdID = :AHerdID');
            Params[0].asInteger := FHerdId;
            Open;
            try
               First;
               if ( RecordCount > 0 ) then
                  PBar.Properties.Max := RecordCount;
               while ( not(Eof) ) do
                  begin
                     FDamUpdated := False;
                     FSireUpdated := False;
                     FAISUpdated := False;
                     StepProgress;
                     if ( ICBFDownloadAnimals.AnimalOnFile(FieldByName('NatIDNum').AsString) ) then
                        begin
                           //   14/11/13 [V5.2 R5.4] /MK Change - Program will now update the pedigree (name,herdbookno) details of AID record/animal on the ICBF File.
                           if ( ICBFDownloadAnimals.ICBFHerdAnimal.OnFile ) then
                              begin
                                 ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal;
                                 AncestryTree.AID := GetExistingAnimalID(ICBFAnimal);
                                 UpdateAnimal(AncestryTree.AID,ICBFDownloadAnimals.ICBFHerdAnimal.JumboTag,
                                              ICBFDownloadAnimals.ICBFHerdAnimal.BreedCode1, ICBFDownloadAnimals.ICBFHerdAnimal.PedigreeName,
                                              ICBFDownloadAnimals.ICBFHerdAnimal.HerdBook, ICBFDownloadAnimals.ICBFHerdAnimal.BirthDate, uasAID);
                              end;

                           ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('DAM');
                           if ( ICBFAnimal.OnFile ) then
                              begin
                                 AncestryTree.DAM := GetExistingAnimalID(ICBFAnimal);
                                 if ( AncestryTree.DAM <= 0 ) then
                                    begin
                                       // Create Dam Rec
                                       FDamUpdated := True;
                                       AncestryTree.DAM := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                       SetAncestorID( FieldByName('ID').AsInteger, AncestryTree.DAM, 'DamID' );
                                    end
                                 else
                                    begin
                                       // Update Dam Rec
                                       UpdateAnimal(AncestryTree.DAM, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                       SetAncestorID( FieldByName('ID').AsInteger, AncestryTree.DAM, 'DamID' );
                                    end;

                                 ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('ADD');
                                 if ( ICBFAnimal.OnFile ) then
                                    begin
                                       AncestryTree.ADD := GetExistingAnimalID(ICBFAnimal);
                                       if ( AncestryTree.ADD <= 0 ) then
                                          begin
                                             // Create Dam Rec
                                             AncestryTree.ADD := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                             SetAncestorID( AncestryTree.DAM, AncestryTree.ADD, 'DamID' );
                                          end
                                       else
                                          begin
                                             // Update Dam Rec
                                             UpdateAnimal(AncestryTree.ADD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                             SetAncestorID( AncestryTree.DAM, AncestryTree.ADD, 'DamID' );
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('DDD');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.DDD := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.DDD <= 0 ) then
                                                begin
                                                   // Create Dam Rec
                                                   AncestryTree.DDD := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                                   SetAncestorID( AncestryTree.ADD, AncestryTree.DDD, 'DamID' );
                                                end
                                             else
                                                begin
                                                   // Update Rec
                                                   UpdateAnimal(AncestryTree.DDD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                                   SetAncestorID( AncestryTree.ADD, AncestryTree.DDD, 'DamID' );
                                                end;
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('DDS');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.DDS := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.DDS <= 0 ) then
                                                begin
                                                   // Create Rec
                                                   AncestryTree.DDS := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '', ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ADD, AncestryTree.DDS, 'SireID' );
                                                end
                                             else
                                                begin
                                                   // Update Rec
                                                   UpdateAnimal(AncestryTree.DDS, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                                   SetAncestorID(AncestryTree.ADD, AncestryTree.DDS, 'SireID' );
                                                end;
                                          end;
                                    end;

                                 ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('ADS');
                                 if ( ICBFAnimal.OnFile ) then
                                    begin
                                       AncestryTree.ADS := GetExistingAnimalID(ICBFAnimal);
                                       if ( AncestryTree.ADS <= 0 ) then
                                          begin
                                             // Create Rec
                                             AncestryTree.ADS := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '', ICBFAnimal.BirthDate);
                                             SetAncestorID(AncestryTree.DAM, AncestryTree.ADS, 'SireID' );
                                          end
                                       else
                                          begin
                                             // Update Rec
                                             UpdateAnimal(AncestryTree.ADS, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                             SetAncestorID(AncestryTree.DAM, AncestryTree.ADS, 'SireID' );
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('DSD');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.DSD := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.DSD <= 0 ) then
                                                begin
                                                   // Create Dam Rec
                                                   AncestryTree.DSD := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ADS, AncestryTree.DSD, 'DamID' );
                                                end
                                             else
                                                begin
                                                   // Update Rec
                                                   UpdateAnimal(AncestryTree.DSD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                                   SetAncestorID(AncestryTree.ADS, AncestryTree.DSD, 'DamID' );
                                                end;
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('DSS');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.DSS := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.DSS <= 0 ) then
                                                begin
                                                   // Create Rec
                                                   AncestryTree.DSS := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '',ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ADS, AncestryTree.DSS, 'SireID' );
                                                end
                                             else
                                                begin
                                                   // Update Rec
                                                   UpdateAnimal(AncestryTree.DSS, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                                   SetAncestorID(AncestryTree.ADS, AncestryTree.DSS, 'SireID' );
                                                end;
                                          end;

                                    end;
                              end;

                           ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('SIR');
                           if ( ICBFAnimal.OnFile ) then
                              begin
                                 AncestryTree.SIR := GetExistingAnimalID(ICBFAnimal);
                                 if ( AncestryTree.SIR <= 0 ) then
                                    begin
                                       // Create Sire Rec
                                       AncestryTree.SIR := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '', ICBFAnimal.BirthDate);
                                       SetAncestorID(FieldByName('ID').AsInteger, AncestryTree.SIR, 'SireID' );
                                       FSireUpdated := True;
                                    end
                                 else
                                    begin
                                       // Update Sire Rec
                                       UpdateAnimal(AncestryTree.SIR, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                       SetAncestorID(FieldByName('ID').AsInteger, AncestryTree.SIR, 'SireID' );
                                    end;

                                 ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('ASD');
                                 if ( ICBFAnimal.OnFile ) then
                                    begin
                                       AncestryTree.ASD := GetExistingAnimalID(ICBFAnimal);
                                       if ( AncestryTree.ASD <= 0 ) then
                                          begin
                                             // Create Sire Dam Rec
                                             AncestryTree.ASD := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                             SetAncestorID(AncestryTree.SIR, AncestryTree.ASD, 'DamID' );
                                          end
                                       else
                                          begin
                                             // Update Sire Dam Rec
                                             UpdateAnimal(AncestryTree.ASD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                             SetAncestorID(AncestryTree.SIR, AncestryTree.ASD, 'DamID' );
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('SDD');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.SDD := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.SDD <= 0 ) then
                                                begin
                                                   // Create Sire Dam Dam Rec
                                                   AncestryTree.SDD := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ASD, AncestryTree.SDD, 'DamID' );
                                                end
                                             else
                                                begin
                                                   // Update Sire Dam Dam Rec
                                                   UpdateAnimal(AncestryTree.SDD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                                   SetAncestorID(AncestryTree.ASD, AncestryTree.SDD, 'DamID' );
                                                end;
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('SDS');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.SDS := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.SDS <= 0 ) then
                                                begin
                                                   // Create Sires Dam Sire Rec
                                                   AncestryTree.SDS := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '', ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ASD, AncestryTree.SDS, 'SireID' );
                                                end
                                             else
                                                begin
                                                   // Update Sires Dam Sire Rec
                                                   UpdateAnimal(AncestryTree.SDS, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                                   SetAncestorID(AncestryTree.ASD, AncestryTree.SDS, 'SireID' );
                                                end;
                                          end;
                                    end;

                                 ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('ASS');
                                 if ( ICBFAnimal.OnFile ) then
                                    begin
                                       AncestryTree.ASS := GetExistingAnimalID(ICBFAnimal);
                                       if ( AncestryTree.ASS <= 0 ) then
                                          begin
                                             // Create Sires Sire Rec
                                             AncestryTree.ASS := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '', ICBFAnimal.BirthDate);
                                             SetAncestorID(AncestryTree.SIR, AncestryTree.ASS, 'SireID' );
                                          end
                                       else
                                          begin
                                             // Update Sires Sire Rec
                                             UpdateAnimal(AncestryTree.ASS, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                             SetAncestorID(AncestryTree.SIR, AncestryTree.ASS, 'SireID' );
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('SSD');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.SSD := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.SSD <= 0 ) then
                                                begin
                                                   // Create Sires Sire Dam Rec
                                                   AncestryTree.SSD := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ASS, AncestryTree.SSD, 'DamID' );
                                                end
                                             else
                                                begin
                                                   // Update Sires Sire Dam Rec
                                                   UpdateAnimal(AncestryTree.SSD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                                   SetAncestorID(AncestryTree.ASS, AncestryTree.SSD, 'DamID' );
                                                end;
                                          end;

                                       ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('SSS');
                                       if ( ICBFAnimal.OnFile ) then
                                          begin
                                             AncestryTree.SSS := GetExistingAnimalID(ICBFAnimal);
                                             if ( AncestryTree.SSS <= 0 ) then
                                                begin
                                                   // Create Sires Sire Sire Rec
                                                   AncestryTree.SSD := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '', ICBFAnimal.BirthDate);
                                                   SetAncestorID(AncestryTree.ASS, AncestryTree.SSS, 'SireID' );
                                                end
                                             else
                                                begin
                                                   // Update Sires Sire Sire Rec
                                                   UpdateAnimal(AncestryTree.SSD, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1, ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull);
                                                   SetAncestorID(AncestryTree.ASS, AncestryTree.SSS, 'SireID' );
                                                end;
                                          end;
                                    end;
                              end;
                        end;
                     if ( FDamUpdated ) or ( FSireUpdated ) or ( FAISUpdated ) then
                        begin
                           Inc(FUpdated);
                           if not FResult then
                              FResult := True;
                        end;
                     Next;
                  end;
            finally
               if ( FUpdated > 0 ) then
                  MessageDlg(IntToStr(FUpdated)+' Pedigree records updated.',mtInformation,[mbOK],0);
               Close;
               SQL.Text := '';
               SQL.Text := cQueryAnimalsText;
            end;
         end;
   finally
      PBar.Position := 0;
      PBar.Visible := False;
      Screen.Cursor := crDefault;
      FreeAndNil(ICBFDownloadAnimals);
   end;
end;

function TfmICBFPCDownloadImporter.AddBull(ACode, ABreed, AName, AHerdBook, ATagType: string;
  ADateOfBirth: TDateTime; const ABreeding : Boolean = False;
  const ATagNumber : String = ''; const AInHerdAnimal : Boolean = False) : Integer;
var
   ID, BreedID : Integer;
   AnimalRecord : TAnimalRecord;
begin
   Result := 0;
   AnimalRecord := TAnimalRecord.Create;
   try
      try
         AnimalRecord.Add;
         AnimalRecord.ValidateColour := False;
         if ( not(AInHerdAnimal) ) then
            begin
               AnimalRecord.ValidateBreed := False;
               AnimalRecord.ValidateDOB := False;
               AnimalRecord.ValidateIdTags := False;
               AnimalRecord.AddToNoneHerd;
            end
         else
            AnimalRecord.HerdID := FHerdId;
         //   02/03/16 [V5.5 R5.2] /MK Bug Fix - AddBull - Was not taking into account that the bull being added was a stock bull/calf.
         if ( AInHerdAnimal ) and ( Length(ATagNumber) > 0 ) then
            AnimalRecord.NatIDNum := ATagNumber
         // 30/05/17 [V5.6 R8.6] /MK Bug Fix - AddBull - Check to see if the bull is not in the herd, doesn't have a tag number but does have an animal number.
         else if ( not(AInHerdAnimal) ) and ( Length(ACode) > 0 ) then
            AnimalRecord.AnimalNo := ACode;
         if ( ADateOfBirth > 0 ) then
            AnimalRecord.DateOfBirth := ADateOfBirth;
         AnimalRecord.Sex := 'Bull';
         AnimalRecord.LactNo := 0;
         AnimalRecord.Name := AName;
         AnimalRecord.HerdBookNo := AHerdBook;
         AnimalRecord.InHerd := True;
         AnimalRecord.Breeding := ABreeding;
         AnimalRecord.AnimalDeleted := False;
         BreedID := WinData.GetBreedID(ABreed);
         if BreedID > 0 then
            AnimalRecord.PrimaryBreed := BreedID
         else
            //   01/03/15 [V5.4 R1.7] /MK Change - Don't default breed to FR, just create a breed from breed code - SP/GL request.
            AnimalRecord.PrimaryBreed := CreateBreedFromBreedCode(ABreed);
         AnimalRecord.Save;
      except
         if ( AInHerdAnimal ) and ( Length(ATagNumber) > 0 ) then
            ApplicationLog.LogError(Format('Error posting animal record for tag %s',[ATagNumber]))
         else
            ApplicationLog.LogError(Format('Error posting animal record for animal number %s',[ACode]));
      end;
      Result := AnimalRecord.ID;
   finally
      FreeAndNil(AnimalRecord);
   end;
end;

function TfmICBFPCDownloadImporter.AddCow(ACode, ABreed, AName, AHerdBook: string;
  ADateOfBirth: TDateTime; const ATagNumber : string = '';
  const ALactNo : Integer = 0; const AInHerdAnimal : Boolean = False): Integer;
var
   ID, BreedID : Integer;
   AnimalRecord : TAnimalRecord;
begin
   Result := 0;
   AnimalRecord := TAnimalRecord.Create;
   try
      try
         AnimalRecord.Add;
         AnimalRecord.ValidateColour := False;
         if ( not(AInHerdAnimal) ) then
            AnimalRecord.AddToNoneHerd
         else
            AnimalRecord.HerdID := FHerdId;
         AnimalRecord.AnimalNo := ACode;
         if ( Length(ATagNumber) > 0 ) then
            AnimalRecord.NatIDNum := ATagNumber;
         AnimalRecord.DateOfBirth := ADateOfBirth;
         AnimalRecord.Sex := 'Female';
         AnimalRecord.LactNo := ALactNo;
         AnimalRecord.Name := AName;
         AnimalRecord.HerdBookNo := AHerdBook;
         AnimalRecord.InHerd := True;
         AnimalRecord.Breeding := True;
         AnimalRecord.AnimalDeleted := False;

         // 08/01/2009 V3.9 R5.6 /SP Default Dam To Pedigree
         AnimalRecord.Pedigree := Def.Definition.dUsePedigree;

         BreedID := WinData.GetBreedID(ABreed);
         if BreedID > 0 then
            AnimalRecord.PrimaryBreed := BreedID
         else
            //AnimalRecord.PrimaryBreed := GetFresianBreedID;
            //   01/03/15 [V5.4 R1.7] /MK Change - Don't default breed to FR, just create a breed from breed code - SP/GL request.
            AnimalRecord.PrimaryBreed := CreateBreedFromBreedCode(ABreed);
         AnimalRecord.Save;
      except
         ApplicationLog.LogError(Format('Error posting animal record for tag %s',[ATagNumber]));
      end;
      Result := AnimalRecord.ID;
   finally
      FreeAndNil(AnimalRecord);
   end;
end;

function TfmICBFPCDownloadImporter.SetAncestorID(AAnimal, AFieldValue: Integer;
  AField: String): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add(Format('UPDATE Animals SET %s = %d WHERE ID = %d',[AField, AFieldValue, AAnimal]));
         ExecSQL;
         Result := True;
      finally
         Free;
      end;
end;

function TfmICBFPCDownloadImporter.GetLastEventDate(const AID, AEventType,
   ALactNo: Integer): TDateTime;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT Max(EventDate) EDate');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (AnimalID = :AID)');
         SQL.Add('AND   (EventType =:EID)');
         SQL.Add('AND   (AnimalLactNo =:ALactNo)');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := AEventType;
         Params[2].AsInteger := ALactNo;
         Open;
         try
            First;
            Result := FieldByName('EDate').AsDateTime;
         finally
            Close;
         end;

      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.btnMilkRecordsClick(Sender: TObject);
var
   ImportType : TImportType;
   ICBFMMRDownload : TICBFMMRDownload;
   LactExists : Boolean;
   FileSaved : Boolean;
begin
   ImportCalvings;
   FileSaved := False;
   TfMilkRec.ImportICBFFile(ICBFFileName,FileSaved,False,True,);
   if ( not(RemoveFile) ) then
      RemoveFile := FileSaved;
   if not FResult then
      FResult := FileSaved;
end;

function TfmICBFPCDownloadImporter.GetICBFFile: string;
var
   ICBFFileLocation : String;
   FileCount : Integer;
begin
   if ( WinData.GlobalSettings.DownloadMailAttachments ) and ( not(FOnlyShowForm) ) then
      begin
         FileCount := 0;
         if ( not(WinData.FAttachmentsDownloaded) ) then
            begin
               //   04/11/14 [V5.3 R8.8] /MK Bug Fix - Showing confirmation message when none required for new Links approach.
               Update;
               FileCount := WinData.DownloadEmailAttachments(FHerdIdentity);
               if ( not(FileCount > 0) ) then
                  MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
               Update;
            end;

         Result := TfmFileAttachmentImport.execute(itICBF, FHerdIdentity, FileCount, FShowForNoAttachments);
         if ( Result = '' ) and ( FileCount = 0 ) and ( not(FShowForNoAttachments) ) then
            MessageDlg('No outstanding Files files to import.',mtInformation,[mbOK],0);
      end
   else
      begin
         ICBFFileLocation := GetSpecialFolder(CSIDL_DESKTOP);
         Result := KRoutines.GetICBFFile(ICBFFileLocation,FHerdIdentity).FileName;
      end;
end;

procedure TfmICBFPCDownloadImporter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if RemoveFile then
      begin
         if ( WinData.GlobalSettings.DownloadMailAttachments ) then
            TfmFileAttachmentImport.MarkAttachmentAsRead(ICBFFileName)
         else
            DeleteFile(ICBFFileName, True);
      end;
end;

function TfmICBFPCDownloadImporter.UpdateAnimal(AExistID : Integer;
   ACode, ABreed, AName, AHerdBook: string;
   ADateOfBirth: TDateTime;
   AUpdateAnimalSexType : TUpdateAnimalSexType;
   const ABreeding : Boolean = False): Integer;
type
   TUpdateAnimalType = (uatName, uatHerdBook);

   procedure UpdateAnimalNameHerdBookNo(AUpdateAnimalType : TUpdateAnimalType);
   var
      BreedID : Integer;
      AllowUpdate : Boolean;
      TempQuery : TQuery;
   begin
      TempQuery := TQuery.Create(nil);
      with TempQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;

            AllowUpdate := False;
            SQL.Add('SELECT Name, HerdBookNo, PrimaryBreed');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE ID = '+IntToStr(AExistID)+'');
            Open;
            if AUpdateAnimalType = uatName then
               AllowUpdate := ( not(Fields[0].AsString = AName) ) or ( Fields[2].AsInteger = 0 )
            else if AUpdateAnimalType = uatHerdBook then
               AllowUpdate := ( not(Fields[1].AsString = AHerdBook) ) or ( Fields[2].AsInteger = 0 );

            if AllowUpdate then
               try
                  SQL.Clear;
                  if ( AUpdateAnimalType = uatName ) then
                     SQL.Add('UPDATE Animals SET Name = "'+AName+'"')
                  else if ( AUpdateAnimalType = uatHerdBook ) then
                     SQL.Add('UPDATE Animals SET HerdBookNo = "'+AHerdBook+'"');
                  BreedID := WinData.GetBreedID(ABreed);
                  if BreedID > 0 then
                     SQL.Add(', PrimaryBreed = '+IntToStr(BreedID)+'');
                  if ABreeding then
                     SQL.Add(', Breeding = True');
                  SQL.Add('WHERE ID = '+IntToStr(AExistID)+'');

                  try
                     ExecSQL;
                  except

                  end;
               finally
                  FAISUpdated := AUpdateAnimalSexType = ( uasAID );
                  FSireUpdated := AUpdateAnimalSexType = ( uasBull );
                  FDamUpdated := AUpdateAnimalSexType = ( uasCow );
               end;

         finally
            Close;
            Free;
         end;
   end;

begin
   Result := 0;
   if ( AName <> '' ) then
      UpdateAnimalNameHerdBookNo(uatName);
   if ( AHerdBook <> '' ) then
      UpdateAnimalNameHerdBookNo(uatHerdBook);
   if ( AHerdBook <> '' ) or ( AName <> '' ) then
      Result := AExistID;
end;

procedure TfmICBFPCDownloadImporter.StepProgress;
begin
   PBar.Position := PBar.Position +1;
   Update;
end;

function TfmICBFPCDownloadImporter.GetFresianBreedID: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Breeds');
         SQL.Add('WHERE Code = "FR"');
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.ImportCalvings ( const AAllLacts : Boolean = False );
var
   fICBFCalvingDate : TDateTime;
   bFound : Boolean;
   ICBFCalvingDownload : TICBFCalvingDownload;
   iMaxAnimalLactNo,
   iICBFCalvingLactNo : Integer;
   qTempQuery : TQuery;

   function CurrLactCalvingExists ( AAnimalID, ALactNo : Integer ) : Boolean;
   var
      qCalving : TQuery;
   begin
      qCalving := TQuery.Create(nil);
      with qCalving do
         try
            DatabaseName := AliasName;
            SQL.Add('SELECT ID');
            SQL.Add('FROM Events');
            SQL.Add('WHERE (AnimalID = '+IntToStr(AAnimalID)+')');
            SQL.Add('AND   (AnimalLactNo = '+IntToStr(ALactNo)+')');
            SQL.Add('AND   (EventType = '+IntToStr(CCalvingEvent)+')');
            try
               Open;
               Result := ( Fields[0].AsInteger > 0 );
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

   // Get the id of the calf from the animals table by the damId and date of birth of the calf.
   function ExistingCalfArray ( ADamID : Integer; ADateOfBirth : TDateTime ) : PIntegerArray;
   begin
      SetLength(Result,0);
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE DateOfBirth = "'+FormatDateTime(cUSDateStyle,ADateOfBirth)+'"');
            SQL.Add('AND DamID = '+IntToStr(ADamID)+'');
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               First;
               while ( not(Eof) ) do
                  begin
                     SetLength(Result,Length(Result)+1);
                     Result[Length(Result)-1] := Fields[0].AsInteger;
                     Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

   // Add the calving event and then update the id record of the calving with the calfs ID.
   procedure AddCalving(AAnimalID, ALactNo, AHerdID : Integer; ACalvingDate : TDateTime);
   var
      CalvingEvent : TCalvingEvent;
      i,
      iCalvingEventID : Integer;
      iaCalfArray : PIntegerArray;
   begin
      iCalvingEventID := 0;
      CalvingEvent := TCalvingEvent.Create('calvingdb');
      CalvingEvent.Append;
      try
         CalvingEvent.AnimalID := AAnimalID;
         CalvingEvent.EventDate := ACalvingDate;
         CalvingEvent.EventComment := 'Calving';
         CalvingEvent.AnimalLactNo := ALactNo;
         CalvingEvent.EventSource := sICBF_GENERATION;
         CalvingEvent.AnimalHerdID := AHerdID;
         CalvingEvent.Post;
         iCalvingEventID := CalvingEvent.EventID;
      except
         CalvingEvent.Cancel;
      end;
      FreeAndNil(CalvingEvent);

      SetLength(iaCalfArray,0);
      iaCalfArray := ExistingCalfArray(AAnimalID, ACalvingDate);
      if ( iCalvingEventID > 0 ) and ( Length(iaCalfArray) > 0 ) then
         for i := 0 to Length(iaCalfArray)-1 do
            begin
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add('SELECT *');
                     SQL.Add('FROM Calvings');
                     SQL.Add('WHERE EventID = '+IntToStr(iCalvingEventID)+'');
                     try
                        Open;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;

                     if ( RecordCount > 0 ) then
                         begin
                            Close;
                            SQL.Clear;
                            SQL.Add('UPDATE Calvings');
                            SQL.Add('SET ID'+IntToStr(i+1)+' = '+IntToStr(iaCalfArray[i])+',');
                            SQL.Add('    ID'+IntToStr(i+1)+'Notified = True');
                            SQL.Add('WHERE EventID = '+IntToStr(iCalvingEventID)+'');
                            try
                               ExecSQL;
                            except
                               on e : Exception do
                                  ShowMessage(e.Message);
                            end;
                         end;
                  finally
                     Free;
                  end;
            end;
   end;

begin
   //   18/03/16 [V5.5 R4.4] /MK Bug Fix - Assisgn iMaxAnimalLactNo to zero to start with as when SQL to update animals was being executed
   //                                      Delphi was assigning a default large value as iMaxAnimalLactNo so the SQL was being executed.
   iMaxAnimalLactNo := 0;
   ICBFCalvingDownload := TICBFCalvingDownload.Create(ICBFFileName,FHerdIdentity,AAllLacts);
   try
      with QueryAnimals do
         begin
            Close;
            SQL.Clear;
            SQL.Text := cQueryAnimalsText;
            // Find animals that are eligible to calve i.e more than 2 years old.
            SQL.Add('AND DateOfBirth < "'+FormatDateTime(cUSDateStyle,IncYear(Date,-2))+'"');
            Params[0].asInteger := FHerdId;
            Open;
            try
               if ( RecordCount = 0 ) then Exit;
               StatusBar.Panels[0].Text := '';
               PBar.Visible := True;
               if ( PBar <> nil ) then
                  PBar.Position := 0;
               Screen.Cursor := crHourGlass;
               First;
               while ( not(Eof) ) do
                  begin
                     StepProgress;
                     if ( ICBFCalvingDownload.AnimalOnFile(QueryAnimals.FieldByName('NatIDNum').AsString) ) then
                        begin
                           if ( Length(StatusBar.Panels[0].Text) = 0 ) then
                              StatusBar.Panels[0].Text := ' Updating animals calving history. ';
                           iMaxAnimalLactNo := 0;
                           ICBFCalvingDownload.MoveFirst;
                           while ( not(ICBFCalvingDownload.Eof) ) do
                              begin
                                 fICBFCalvingDate := ICBFCalvingDownload.CalvingDate;
                                 iICBFCalvingLactNo := ICBFCalvingDownload.CalvingLactNo;
                                 if ( fICBFCalvingDate > 0 ) then
                                    if ( AAllLacts ) then
                                       begin
                                          // Create calving event record for the calving date for the cows ICBF lactation records.
                                          // if calving event on the ICBF lactation doesn't already exist.
                                          if ( WinData.EventDataHelper.GetLastEventDate(QueryAnimals.FieldByName('ID').AsInteger,
                                                                                        iICBFCalvingLactNo,
                                                                                        CCalvingEvent) = 0 ) then
                                             begin
                                                AddCalving(QueryAnimals.FieldByName('ID').AsInteger,
                                                           iICBFCalvingLactNo,
                                                           QueryAnimals.FieldByName('HerdID').AsInteger,
                                                           fICBFCalvingDate);
                                                if ( iICBFCalvingLactNo > iMaxAnimalLactNo ) then
                                                    iMaxAnimalLactNo := iICBFCalvingLactNo;
                                             end;
                                       end
                                    else
                                       begin
                                          // Create calving event record for the calving date within animals current lactation
                                          // if calving event on current lactation does not exist.
                                          if ( QueryAnimals.FieldByName('LactNo').AsInteger > 0 ) then
                                             if ( iICBFCalvingLactNo = QueryAnimals.FieldByName('LactNo').AsInteger ) then
                                                if ( not(CurrLactCalvingExists(QueryAnimals.FieldByName('ID').AsInteger,QueryAnimals.FieldByName('LactNo').AsInteger)) ) then
                                                   AddCalving(QueryAnimals.FieldByName('ID').AsInteger,
                                                              QueryAnimals.FieldByName('LactNo').AsInteger,
                                                              QueryAnimals.FieldByName('HerdID').AsInteger,
                                                              fICBFCalvingDate);
                                       end;
                                 ICBFCalvingDownload.MoveNext;
                              end;
                           //   18/03/16 [V5.5 R4.4] /MK Bug Fix - Check for AAllLacts and also move this block into the ICBFCalvingDownload.AnimalOnFile block.
                           if ( AAllLacts ) and ( iMaxAnimalLactNo > 0 ) then
                              begin
                                 qTempQuery := TQuery.Create(nil);
                                 with qTempQuery do
                                    try
                                       DatabaseName := AliasName;
                                       SQL.Clear;
                                       SQL.Add('UPDATE Animals');
                                       SQL.Add('SET LactNo = '+IntToStr(iMaxAnimalLactNo)+', IsSynchronized = False');
                                       SQL.Add('WHERE ID = '+IntToStr(QueryAnimals.FieldByName('ID').AsInteger)+'');
                                       try
                                          ExecSQL;
                                       except
                                          on e : Exception do
                                             ShowMessage(e.Message);
                                       end;
                                    finally
                                       Free;
                                    end;
                              end;
                        end;
                     Next;
                  end;
            finally
               Close;
               if ( not(AAllLacts) ) then
                  if ( not(RemoveFile) ) then
                     RemoveFile := True;
               SQL.Text := cQueryAnimalsText;
            end;
         end;
   finally
      FreeAndNil(ICBFCalvingDownload);
      PBar.Position := 0;
      PBar.Visible := False;
      Screen.Cursor := crDefault;
   end;
end;

function TfmICBFPCDownloadImporter.CreateBreedFromBreedCode(
  ABreedCode: String): Integer;
begin
   Result := 0;
   if ( Length(ABreedCode) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('INSERT INTO Breeds (Code, Name, EligibleforPremium, Selected, InUse)');
         SQL.Add('VALUES("'+UpperCase(ABreedCode)+'","'+UpperCase(ABreedCode)+'",FALSE,FALSE,TRUE)');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Breeds');
         SQL.Add('WHERE (Upper(Code) = "'+UpperCase(ABreedCode)+'")');
         try
            Open;
            if ( Fields[0].AsInteger > 0 ) then
               Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.FormActivate(Sender: TObject);
begin
   if ( FHerdID = 0 ) then Exit;
   FHerdType := HerdLookup.GetHerdType(FHerdID);
   if ( FHerdType = htSuckler ) then
      begin
         gsEBIData.Caption := 'Maternal Indices';
         lEBIInfo.Caption := 'Update your maternal indices with the latest data contained on the ICBF PC Download File.';
         btnEBIData.Caption := 'Indices';
      end
   else if ( FHerdType = htDairy ) then
      begin
         gsEBIData.Caption := 'EBI Data';
         lEBIInfo.Caption := 'Update all your animal EBI records with the latest EBI data contained on the ICBF PC Download File.';
         btnEBIData.Caption := 'EBI Records';
      end;

   if FileExists(ICBFFileName) then
      begin
         lFileStatus.Caption := 'File found: "'+ ExcludeTrailingBackslash(ICBFFileName) + '"';
         EnableGroupBox(True, 1);
         EnableGroupBox(True, 2);
         EnableGroupBox(True, 3);
         EnableGroupBox(True, 4);
         EnableGroupBox(True, 5);
         EnableGroupBox(True, 6);
      end
   else
      begin
         lFileStatus.Caption := 'No ICBF file has been found in "'+ExcludeTrailingBackslash(WinData.MilkRecDir) +'"';
         ActiveControl := btnClose;
         btnClose.Default := True;
      end;
end;

function TfmICBFPCDownloadImporter.GetExistingAnimalID( AICBFAnimal : TICBFAnimal ) : Integer;
const
   cSelectIDFromAnimals = 'SELECT ID FROM Animals';
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         if ( Length(AICBFAnimal.AnimalTag) > 0 ) then
            begin
               if ( Length(AICBFAnimal.Sex) > 0 ) then
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE SearchNatID = :NatIDNum AND Upper(Sex) = "'+UpperCase(AICBFAnimal.Sex)+'"'
               else
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE SearchNatID = :NatIDNum';
               Params[0].AsString := AICBFAnimal.AnimalTag;
            end
         else if ( Length(AICBFAnimal.JumboTag) > 0 ) then
            begin
               if ( Length(AICBFAnimal.Sex) > 0 ) then
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE AnimalNo = :AnimalNo AND Upper(Sex) = "'+UpperCase(AICBFAnimal.Sex)+'"'
               else
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE AnimalNo = :AnimalNo';
               Params[0].AsString := AICBFAnimal.JumboTag;
            end;
         Open;
         try
            Result := FieldByName('ID').AsInteger;
         finally
            Close;
         end;

         if ( Result = 0 ) then
            begin
               SQL.Clear;
               if ( Length(AICBFAnimal.Sex) > 0 ) then
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE HerdBookNo = :HerdBookNo AND Upper(Sex) = "'+UpperCase(AICBFAnimal.Sex)+'"'
               else
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE HerdBookNo = :HerdBookNo';
               Params[0].AsString := AICBFAnimal.HerdBook;
               Open;
               try
                  Result := FieldByName('ID').AsInteger;
               finally
                  Close;
               end;
            end;

         if ( Result = 0 ) then
            begin
               SQL.Clear;
               if ( Length(AICBFAnimal.Sex) > 0 ) then
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE Name = :Name AND Upper(Sex) = "'+UpperCase(AICBFAnimal.Sex)+'"'
               else
                  SQL.Text := cSelectIDFromAnimals+ ' WHERE Name = :Name';
               Params[0].AsString := AICBFAnimal.PedigreeName;
               Open;
               try
                  Result := FieldByName('ID').AsInteger;
               finally
                  Close;
               end;
            end;

      finally
         Free;
      end;
end;

//   29/01/16 [V5.5 R3.4] /MK Additional Feature - New feature added to add animals from ICBF file that are not in database.
procedure TfmICBFPCDownloadImporter.btnImportAnimalsClick(Sender: TObject);
var
   ICBFDownloadAnimals : TICBFDownloadAnimals;
   ICBFHerdAnimal : TICBFHerdAnimal;
   ICBFCalvingDownload : TICBFCalvingDownload;
   PurchEvent : TPurchaseEvent;
   i, NewAnimalID, iDamCalvingsUpdated : Integer;
   sAnimalTag : String;
   CalvingEvent : TCalvingEvent;
   ICBFAnimal : TICBFAnimal;
   AncestryTree : TAncestryTree;
   saNewNatIDArray : array of String;
   qAnimals : TQuery;

   function ICBFAnimalInDatabaseAnimalID ( ANatIDStr : String ) : Integer;
   begin
      Result := 0;
      if ( ANatIDStr = '' ) or ( Length(ANatIDStr) = 0 ) then Exit;
      ANatIDStr := StripAllSpaces(StripAllAlphaButNum(ANatIDStr));
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE SearchNatID LIKE "%'+ANatIDStr+'%"');
            try
               Open;
               Result := FieldByName('ID').AsInteger;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   if ( MessageDLG('Before Import animals from the ICBF it is strongly advised that a backup is taken.'+cCRLFx2+
                   'Do you want to backup your data now?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
      TfmDataBackup.execute(daBackup);

   Screen.Cursor := crHourGlass;
   PBar.Visible := True;
   if ( PBar <> nil ) then
      PBar.Position := 0;
   FUpdated := 0;

   // Go through the ICBF file and add animals that are on the file in the herd but are not in the database.
   ICBFDownloadAnimals := TICBFDownloadAnimals.Create(ICBFFileName,FHerdIdentity);
   try
      if ( ICBFDownloadAnimals.FList.Count > 0 ) then
         begin
            PBar.Properties.Max := ICBFDownloadAnimals.FList.Count;
            SetLength(saNewNatIDArray,0);
            for i := 0 to ICBFDownloadAnimals.FList.Count-1 do
               try
                  StepProgress;
                  ICBFHerdAnimal := TICBFHerdAnimal.Create;
                  ICBFHerdAnimal := ICBFDownloadAnimals.FList[i];
                  if ( ICBFHerdAnimal.SaleDate = 0 ) and ( ICBFHerdAnimal.DeathDate = 0 ) then
                     if ( Length(ICBFHerdAnimal.AnimalTag) > 0 ) then
                        begin
                           sAnimalTag := UpperCase(ICBFHerdAnimal.AnimalTag);
                           sAnimalTag := StripIrishCountryPrefixFromNatID(sAnimalTag);
                           if ( ICBFAnimalInDatabaseAnimalID(sAnimalTag) = 0 ) then
                              begin
                                  if ( Length(StatusBar.Panels[0].Text) = 0 ) then
                                     StatusBar.Panels[0].Text := ' Adding new ICBF animals. ';
                                  NewAnimalID := 0;
                                  if ( UpperCase(ICBFHerdAnimal.Sex) = 'FEMALE' ) then
                                     begin
                                        if ( Length(ICBFHerdAnimal.AnimalTag) > 0 ) then
                                           NewAnimalID := AddCow(ICBFHerdAnimal.JumboTag, ICBFHerdAnimal.BreedCode1, ICBFHerdAnimal.PedigreeName,
                                                                 ICBFHerdAnimal.HerdBook, ICBFHerdAnimal.BirthDate, ICBFHerdAnimal.AnimalTag,
                                                                 ICBFHerdAnimal.LactNo, True)
                                        else if ( Length(ICBFHerdAnimal.AnimalTag) = 0 ) then
                                           ApplicationLog.LogError('Could not create ICBF animal record as there is not tag number for this cow');
                                     end
                                  else
                                     begin
                                        if ( Length(ICBFHerdAnimal.AnimalTag) > 0 ) or ( Length(ICBFHerdAnimal.JumboTag) > 0 ) then
                                           NewAnimalID := AddBull(ICBFHerdAnimal.JumboTag, ICBFHerdAnimal.BreedCode1, ICBFHerdAnimal.PedigreeName,
                                                                  ICBFHerdAnimal.HerdBook, ICBFHerdAnimal.TagType ICBFHerdAnimal.BirthDate, False,
                                                                  ICBFHerdAnimal.AnimalTag, True)
                                        else if ( (Length(ICBFHerdAnimal.AnimalTag) = 0) and (Length(ICBFHerdAnimal.JumboTag) = 0) ) then
                                           ApplicationLog.LogError('Could not create ICBF animal record as there is not tag number or jumbo tag for this bull');
                                     end;
                                  if ( NewAnimalID > 0 ) then
                                     begin
                                        if ( ICBFHerdAnimal.PurchDate > 0 ) then
                                           begin
                                              PurchEvent := TPurchaseEvent.Create('icbfpe');
                                              try
                                                 PurchEvent.Append;
                                                 PurchEvent.EventType := TPurchase;
                                                 PurchEvent.AnimalID := NewAnimalID;
                                                 PurchEvent.AnimalLactNo := ICBFHerdAnimal.LactNo;
                                                 PurchEvent.EventDate := ICBFHerdAnimal.PurchDate;
                                                 PurchEvent.EventComment := 'Purchase';
                                                 PurchEvent.AnimalHerdID := FHerdId;
                                                 PurchEvent.EventSource := sICBF_GENERATION;
                                                 PurchEvent.Post;
                                              finally
                                                 FreeAndNil(PurchEvent);
                                              end;
                                           end;

                                        SetLength(saNewNatIDArray,Length(saNewNatIDArray)+1);
                                        saNewNatIDArray[Length(saNewNatIDArray)-1] := ICBFHerdAnimal.AnimalTag;

                                        Inc(FUpdated);
                                     end;
                              end;
                        end;
               finally

               end;
         end;
   finally
      FreeAndNil(ICBFDownloadAnimals);
      PBar.Position := 0;
      PBar.Visible := False;
      Screen.Cursor := crDefault;
   end;

   // Get the dam and sire information of the animals that were added.
   if ( Length(saNewNatIDArray) > 0 ) then
      begin
         Screen.Cursor := crHourGlass;
         StatusBar.Panels[0].Text := '';
         PBar.Visible := True;
         if ( PBar <> nil ) then
            PBar.Position := 0;
         ICBFDownloadAnimals := TICBFDownloadAnimals.Create(ICBFFileName,FHerdIdentity);
         try
            PBar.Properties.Max := Length(saNewNatIDArray);
            for i := 0 to Length(saNewNatIDArray)-1 do
               begin
                  StepProgress;
                  if ( ICBFDownloadAnimals.AnimalOnFile(saNewNatIDArray[i]) ) then
                     begin
                         if ( Length(StatusBar.Panels[0].Text) = 0 ) then
                            StatusBar.Panels[0].Text := ' Adding new ICBF animals ancestry records. ';

                        if ( ICBFDownloadAnimals.ICBFHerdAnimal.OnFile ) then
                           begin
                              ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal;

                              sAnimalTag := '';
                              sAnimalTag := UpperCase(ICBFAnimal.AnimalTag);
                              sAnimalTag := StripIrishCountryPrefixFromNatID(sAnimalTag);
                              AncestryTree.AID := ICBFAnimalInDatabaseAnimalID(sAnimalTag);
                           end;

                        ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('DAM');
                        if ( ICBFAnimal.OnFile ) then
                           begin
                              AncestryTree.DAM := GetExistingAnimalID(ICBFAnimal);
                              if ( AncestryTree.DAM <= 0 ) then
                                 begin
                                    // Create Dam Rec
                                    FDamUpdated := True;
                                    AncestryTree.DAM := AddCow(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1,
                                                               ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook,
                                                               ICBFAnimal.BirthDate);
                                    SetAncestorID(AncestryTree.AID, AncestryTree.DAM, 'DamID');
                                 end
                              else
                                 begin
                                    // Update Dam Rec
                                    UpdateAnimal(AncestryTree.DAM, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1,
                                                 ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasCow);
                                    SetAncestorID(AncestryTree.AID, AncestryTree.DAM, 'DamID');
                                 end;
                           end;

                        ICBFAnimal := ICBFDownloadAnimals.ICBFHerdAnimal.GetAncestorRecord('SIR');
                        if ( ICBFAnimal.OnFile ) then
                           begin
                              AncestryTree.SIR := GetExistingAnimalID(ICBFAnimal);
                              if ( AncestryTree.SIR <= 0 ) then
                                 begin
                                    // Create Sire Rec and mark it as breeding so that it appears in calving record for dam.
                                    AncestryTree.SIR := AddBull(ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1,
                                                                ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, '',
                                                                ICBFAnimal.BirthDate, True);
                                    SetAncestorID(AncestryTree.AID, AncestryTree.SIR, 'SireID');
                                    FSireUpdated := True;
                                 end
                              else
                                 begin
                                    // Update Sire Rec and mark it as breeding so that if appears in calving record for dam.
                                    UpdateAnimal(AncestryTree.SIR, ICBFAnimal.JumboTag, ICBFAnimal.BreedCode1,
                                                 ICBFAnimal.PedigreeName, ICBFAnimal.HerdBook, ICBFAnimal.BirthDate, uasBull, True);
                                    SetAncestorID(AncestryTree.AID, AncestryTree.SIR, 'SireID');
                                 end;
                           end;
                     end;
               end;
         finally
            FreeAndNil(ICBFDownloadAnimals);
            PBar.Position := 0;
            PBar.Visible := False;
            Screen.Cursor := crDefault;
         end;
      end;

   // Add the calving dates of all animals that are in the herd and that are on the file.
   ImportCalvings(True);

   FNewAnimalsAdded := FUpdated;
   if ( not(FResult) ) then
      FResult := ( FNewAnimalsAdded > 0 );
   if ( FResult ) then
      begin
         if ( Length(StatusBar.Panels[0].Text) > 0 ) then
            StatusBar.Panels[0].Text := '';
         MessageDlg(Format('%s new animals created from ICBF.',[IntToStr(FUpdated)]),mtInformation,[mbOK],0);
      end;
end;

function TfmICBFPCDownloadImporter.GetBull(ABullTag : String; ATagType : string) : Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select ID From Animals Where ');
         if ( ATagType = '7' ) then
            SQL.Add('NatIDNum = :ANatIDNum')
         else
            SQL.Add('AnimalNo = :AAnimalNo');
         Params[0].AsString := ABullTag;
         Open;
         try
            First;
            Result := FieldByName('ID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.UpdateBullInUseStatus ( AID : Integer );
begin
   if AID = 0 then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM BullSemenStk');
         SQL.Add('WHERE AnimalID = :AID');
         Params[0].AsInteger := AID;
         Open;
         try
            First;
            if RecordCount = 0 then
               begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO BullSemenStk ( AnimalID, InUse )');
                  SQL.Add('VALUES (:AnimalID, :InUse ) ');
                  Params[0].AsInteger := AID;
                  Params[1].AsBoolean := True;
                  try
                     ExecSQL;
                  except

                  end;
               end
            else
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE BullSemenStk');
                  SQL.Add('SET InUse = True');
                  SQL.Add('WHERE AnimalID = :AID');
                  Params[0].AsInteger := AID;
                  try
                     ExecSQL;
                  except

                  end;
               end;

         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmICBFPCDownloadImporter.ActivateDeactiveBulls ( AActivate : Boolean; AEventType : Integer );
var
   qActivateCurrentBulls : TQuery;
   TempBullSemenStk : TTable;
   sFieldName,
   sTableName : String;
begin
   if ( AEventType = 0 ) then Exit;
   TempBullSemenStk := TTable.Create(nil);
   try
      TempBullSemenStk.DatabaseName := AliasName;
      TempBullSemenStk.TableName := 'tmpBullSemen';
      TempBullSemenStk.FieldDefs.Clear;
      TempBullSemenStk.FieldDefs.Add('ID',ftAutoInc);
      TempBullSemenStk.FieldDefs.Add('BullID',ftInteger);
      TempBullSemenStk.IndexDefs.Clear;
      TempBullSemenStk.IndexDefs.Add('iID','ID',[ixUnique,ixPrimary]);
      TempBullSemenStk.IndexDefs.Add('iBullID','BullID',[ixUnique]);
      TempBullSemenStk.CreateTable;
      TempBullSemenStk.Open;

      case AEventType of
         CServiceEvent : begin
                            sFieldName := 'ServiceBull';
                            sTableName := 'Services';
                         end;
         CBullingEvent : begin
                            sFieldName := 'PlannedBull';
                            sTableName := 'Bullings';
                         end;
      end;

      qActivateCurrentBulls := TQuery.Create(nil);
      with qActivateCurrentBulls do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Distinct(B.AnimalID) BullID');
            SQL.Add('FROM BullSemenStk B');
            SQL.Add('LEFT JOIN '+sTableName+' S ON (S.'+sFieldName+' = B.AnimalID)');
            SQL.Add('LEFT JOIN Events E ON (E.ID = S.EventID)');
            if AActivate then
               SQL.Add('WHERE E.EventDate >= "'+FormatDateTime(cUSDateStyle,IncYear(Date,-1))+'"')
            else
               SQL.Add('WHERE E.EventDate < "'+FormatDateTime(cUSDateStyle,IncYear(Date,-1))+'"');
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  TempBullSemenStk.Append;
                  TempBullSemenStk.FieldByName('BullID').AsInteger := FieldByName('BullID').AsInteger;
                  TempBullSemenStk.Post;
                  Next;
               end;

            TempBullSemenStk.Close;
            TempBullSemenStk.Open;

            Close;
            SQL.Clear;
            SQL.Add('UPDATE BullSemenStk');
            if AActivate then
               SQL.Add('SET InUse = True')
            else
               SQL.Add('SET InUse = False');
            SQL.Add('WHERE AnimalID IN (SELECT BullID FROM '+TempBullSemenStk.TableName+')');
            try
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
            Close;
         finally
            FreeAndNil(qActivateCurrentBulls);
         end;
   finally
      if ( TempBullSemenStk <> nil ) then
         begin
            TempBullSemenStk.Close;
            TempBullSemenStk.DeleteTable;
            FreeAndNil(TempBullSemenStk);
         end;
   end;
end;

procedure TfmICBFPCDownloadImporter.btnImportPlannedBullsClick(Sender: TObject);
var
   ICBFPBUDownload : TICBFPBUDownload;
   PlannedBullEvent : TPlannedBullEventRec;
   PlannedBullBreedCode : string;
   iEventLactNo,
   iPlannedBull,
   iRcmdBullInd : Integer;

   function PlannedBullEventsExists (AID, APlannedBullID : Integer; AEventDate : TDateTime) : Boolean;
   var
      qPlannedBullEvent : TQuery;
   begin
      Result := False;
      if ( AID = 0 ) or ( APlannedBullID = 0 ) or ( AEventDate = 0 ) then Exit;
      qPlannedBullEvent := TQuery.Create(nil);
      with qPlannedBullEvent do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT E.ID, E.EventDate, PB.PlannedBull');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Bullings PB ON (PB.EventID = E.ID)');
            SQL.Add('WHERE (E.AnimalID = '+IntToStr(AID)+')');
            SQL.Add('AND   (E.EventType = '+IntToStr(CPlannedBull)+')');
            SQL.Add('AND   (E.EventDate = "'+FormatDateTime(cUSDateStyle,AEventDate)+'")');
            SQL.Add('AND   (PB.PlannedBull = '+IntToStr(APlannedBullID)+')');
            try
               Open;
               Result := ( RecordCount > 0 );
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            FreeAndNil(qPlannedBullEvent);
         end;
   end;

begin
   FUpdated := 0;
   Screen.Cursor := crHourGlass;
   ICBFPBUDownload := TICBFPBUDownload.Create(ICBFFileName,FHerdIdentity);
   try
      with QueryAnimals do
         begin
            QueryAnimals.Close;
            QueryAnimals.SQL.Text := cQueryBreedingInHerdAnimalsText;
            Params[0].AsInteger := FHerdId;
            QueryAnimals.Open;
            if ( QueryAnimals.RecordCount = 0 ) then
               begin
                  MessageDlg('No eligible animals to import planned bull events for.',mtInformation,[mbOK],0);
                  Exit;
               end;
            PBar.Visible := True;
            PBar.Properties.Min := 1;
            PBar.Properties.Max := QueryAnimals.RecordCount;
            Update;
            try
               QueryAnimals.First;
               while ( not(QueryAnimals.Eof) ) do
                  begin
                     if ( ICBFPBUDownload.AnimalOnFile(QueryAnimals.FieldByName('NatIDNum').AsString) ) then
                        begin
                           iRcmdBullInd := 1;
                           ICBFPBUDownload.MoveFirst;
                           while ( not(ICBFPBUDownload.Eof) ) do
                              begin
                                 if ( ICBFPBUDownload.PlannedBullDate > 0 ) and ( Length(ICBFPBUDownload.PlannedBull) > 0 ) then
                                    begin
                                       iEventLactNo := 0;
                                       iEventLactNo := WinData.FBreedingDataHelper.BreedingEventLactNo(QueryAnimals.FieldByName('ID').AsInteger,
                                                                                                       QueryAnimals.FieldByName('LactNo').AsInteger,
                                                                                                       ICBFPBUDownload.PlannedBullDate);

                                       iPlannedBull := GetBull(ICBFPBUDownload.PlannedBull, ICBFPBUDownload.PlannedBullTagType);
                                       if ( iPlannedBull <= 0 ) then
                                          begin
                                             with ICBFPBUDownload do
                                                begin
                                                   PlannedBullBreedCode := '';
                                                   if ( ICBFPBUDownload.PlannedBullBreedCode1Perc > ICBFPBUDownload.PlannedBullBreedCode2Perc ) then
                                                      PlannedBullBreedCode := ICBFPBUDownload.PlannedBullBreedCode1
                                                   else if ( ICBFPBUDownload.PlannedBullBreedCode1Perc < ICBFPBUDownload.PlannedBullBreedCode2Perc ) then
                                                      PlannedBullBreedCode := ICBFPBUDownload.PlannedBullBreedCode2
                                                   else if ( ICBFPBUDownload.PlannedBullBreedCode1Perc = ICBFPBUDownload.PlannedBullBreedCode2Perc ) then
                                                      PlannedBullBreedCode := ICBFPBUDownload.PlannedBullBreedCode1;

                                                   if ( Length(PlannedBullBreedCode) = 2 ) and (PlannedBullBreedCode[1] in ['0'..'9']) and (PlannedBullBreedCode[2] in ['0'..'9']) then
                                                      PlannedBullBreedCode := WinData.GetBreedCodeByPedigreeBreed(PlannedBullBreedCode);

                                                   iPlannedBull := AddBull(PlannedBull, PlannedBullBreedCode, PlannedBullPedName,
                                                                          PlannedBullHerdBook, PlannedBullTagType, PlannedBullDateOfBirth, True );
                                                end;
                                          end
                                       else
                                          UpdateBullInUseStatus(iPlannedBull);

                                       if ( not(PlannedBullEventsExists(QueryAnimals.FieldByName('ID').AsInteger,iPlannedBull,ICBFPBUDownload.PlannedBullDate)) ) then
                                          try
                                             PlannedBullEvent := TPlannedBullEventRec.Create('PBU');
                                             PlannedBullEvent.Append;
                                             try
                                                PlannedBullEvent.AnimalID     := FieldByName('ID').AsInteger;
                                                PlannedBullEvent.AnimalLactNo := iEventLactNo;
                                                PlannedBullEvent.AnimalHerdID := FHerdID;
                                                PlannedBullEvent.EventDate    := ICBFPBUDownload.PlannedBullDate;
                                                PlannedBullEvent.EventComment := 'Bull '+IntToStr(iRcmdBullInd)+' : ' + Format('%s', [ICBFPBUDownload.PlannedBull]);
                                                PlannedBullEvent.EventSource := sICBF_GENERATION;
                                                PlannedBullEvent.PlannedBull  := iPlannedBull;
                                                PlannedBullEvent.RcmdBullInd  := iRcmdBullInd;
                                                PlannedBullEvent.Post;
                                                Inc(FUpdated);
                                                if not FResult then
                                                   FResult := True;
                                             except
                                                PlannedBullEvent.Cancel;
                                             end;
                                          finally
                                             FreeAndNil(PlannedBullEvent);
                                          end;
                                    end;
                                 Inc(iRcmdBullInd);
                                 WinData.SetIsSynchronizedFlag(QueryAnimals.FieldByName('ID').AsInteger);
                                 ICBFPBUDownload.MoveNext;
                              end;
                        end;
                     StepProgress;
                     QueryAnimals.Next;
                  end;
            finally
               QueryAnimals.Close;
               if ( FUpdated > 0 ) then
                  begin
                     // Set bulls as not active if in planned bull events more than 12 months ago - GL Request.
                     ActivateDeactiveBulls(False,CPlannedBull);
                     // Set bulls as active if in planned bull events within the last 12 months - GL Request.
                     ActivateDeactiveBulls(True,CPlannedBull);
                  end;
               PBar.Visible := False;
               Update;
               if ( not(RemoveFile) ) then
                  RemoveFile := True;
               if ( FUpdated > 0 ) then
                  MessageDlg(Format('%d planned bull records created.',[FUpdated]),mtInformation,[mbOK],0);
               SQL.Text := cQueryAnimalsText;
            end;
         end;
   finally
      FreeAndNil(ICBFPBUDownload);
      Screen.Cursor := crDefault;
   end;
end;

end.
