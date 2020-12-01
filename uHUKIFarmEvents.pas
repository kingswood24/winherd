{
  04/02/2009 [Dev 3.9 5.9] /SP Bug Fix - Copy first [12] hars of NatIDNum after NatIDNum is stripped of all non alpha chars

  11/08/10 [V4.0 R4.3] /MK Bug - Export UKAICode instead of BullAnimalNo Where UKAICode Exists.

  02/09/10 [V4.0 R4.7] /MK Additional Feature -  New Tick Box "Export QMMS" if ticked then the New Procedure AddQMMSMilkData
                                                 will export Milk Data for QMMS.

  29/10/10 [V4.0 R5.3] /MK/SP Change - Purchase Records exports Milking Cows as Dry.

  23/11/10 [V4.0 R5.7] /MK Change - Purchase Records SQL Was Not Creating Calving Date Properly.

  24/02/11 [V4.0 R8.4] /MK Additional Feature - Check For UKMilkRecorder String - If CIS Export PedigreeBreed, If NMR/QMMS Export BreedCode.

  31/03/11 [V4.0 R9.1] /MK Modification - Program Not Exporting Calf2Ease To File - Change Made To Export Calf2Ease.

  18/05/11 [V4.1 R1.4] /MK Modification - Export Pedigree Code If Country Is UK.
                                        - Strip /Year or )Year From AnimalNo If AnimalNumber < 4.
                                        - Strip / or ) From AnimalNo If AnimalNumber < 4.

  20/06/11 [V4.1 R1.9] /MK Bug Fix - CheckValidAnimalNo Was Not Returning True If AnimalNo < 4 Without / or (.

  21/06/11 [V4.1 R2.1] /MK Bug Fix - If QMMS Then Default Start Date To 01/01/1990.
                                   - Changed Order Of PurchaseData So Its At The Start and Sale/Deat Is At The End Of The File.

  30/06/11 [V4.1 R2.1] /MK Bug Fix - BullPBrd Variable Set But Not Needed For Export Line.
                                   - CalfPBrd Variable Set But Not Needed For Export Line.

  22/07/11 [V4.1 R4.2] /MK Bug Fix - Do Not Export PurchaseData or AbortData If Not CowNumber.
                                   - Check If AnimalNo Has Lettering - If So Then Replace Lettering With Zero(0).

  02/08/11 [V4.1 R4.3] /MK Additional Feature - Export CalfUsage - If SireBreedType Is Beef Then Calf Usage Is B Else Calf Usage Is D.
                                                                 - If First Calf Is Female Then Calf Usage Is D Else B.

  03/04/12 [V5.0 R4.6] /MK Bug Fix - CheckValidAnimalNo - No Else Check Added If Length(AnimalNo) In [1..4] And Sold.

  28/03/13 [V5.1 R5.4] /MK Change - If CIS or NMR export PedigreeBreedCode.

  02/04/13 [V5.1 R5.4] /MK Bug Fix - AddLeftHerdData was at end of block of events where it should be at the start - J.W CIS.

  07/08/13 [V5.1 R9.0] /MK Bug Fix - AddQMMSMilkData - SQL needs to contain Animals.InHerd field for CheckAnimalsExist to work.

  21/11/13 [V5.2 R5.7] /MK Bug Fix - Old method of MilkState was crashing.

  03/11/15 [V5.4 R9.9] /MK Bug Fix - AddCalvingData - Setting of calf breeding boolean code was completely opposite to rule above.

  16/11/15 [V5.5 R0.7] /MK Bug Fix - AddCalvingData - Setting of calf sex was opposite to what is required - Helen Whittaker NMR.

  17/11/15 [V5.5 R0.8] /MK Change - Calf usage should be first assigned from SireBreed - Helen Whittaker NMR.
                                  - If calf is male then calf usage is B regardless of sire breed - Helen Whittaker NMR.

  12/02/16 [V5.5 R3.8] /MK Bug Fix - Only add a the event block if the event date is greater than zero as SQL's brings up a blank record - GL/Helen Whittaker reported.

  30/03/16 [V5.5 R4.6] /MK Bug Fix - AddCalvingData - clf2Sex was assigned below instead of clf1Sex - Jim Westaway reported.

  05/04/16 [V5.5 R4.8] /MK Bug Fix - AddCalvingData - Calf Breed was not padded out where there was no calf in the calving event
                                                      i.e. if the cow was brougt over from another herd as calved without the calf.

  04/07/17 [V5.6 R9.1] /MK Change - FormCreate - Set caption to be like MenuUnit and MilkRecording file export captions.

  25/02/19 [V5.8 R8.0] /MK Change - NMR asked that we allow for a 5 digit line number/cow number - changes made to all events to all for this.
                                  - Checked with Jim Westaway (CIS) who said that they allow for the 5 digit line number/cow number but for cows
                                    with a letter in their animal number the letter must always appear first. For this reason I have had to apply
                                    the 5 digit line number/cow number only to NMR customers.
                                  - Jim Westaway (CIS) asked that we supply just the 12 digit tag number i.e. leave out the country code.

  15/08/19 [V5.8 R9.9] /MK Change - GetData - NMR no longer require the Milk Date - Helen Whitaker (NMR)/Yvonne Fleetham (NMR).

  03/10/19 [V5.9 R0.7] /MK Bug Fix - AddCalvingData - clf1VID and clf2VID were incorrectly padded to 5 for non NMR customers.

  18/10/19 [V5.9 R1.0] /MK Bug Fix - CheckMilkState - Using record count check on SQL when Count(ID) was used, changed Count(ID) to * then RecordCount will work - Jim Westaway.

  07/09/20 [V5.9 R6.0] /MK Change - Output 5 character line number for both NMR and CIS - Jim Westaway.
                                  - Output the stripped back tag number of an animal to CIS Left Herd Block - Jim Westaway.
                                  - If the animal was sold and it has a culling reason then out reason as 03 for CIS usrs - Jim Westaway.
                           Additional Feature - Added a Health Data block that holds Mastitis and Lameness event for CIS users - Jim Westaway.         
}

unit uHUKIFarmEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Db, DBTables,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cxShellComboBox, cxDBShellComboBox, cxMemo, ExtCtrls, cxCheckBox;

type
  TMilkRecorder = (mrCIS, mrNMR, mrQMMS);
  TMilkState = (msMilking, msDry);
  TfmHUKIFarmEvents = class(TForm)
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    GenQuery: TQuery;
    deStartDate: TcxDateEdit;
    SaveDialog: TSaveDialog;
    mWarnings: TcxMemo;
    Label1: TLabel;
    cxClose: TcxButton;
    Bevel1: TBevel;
    cxLabel2: TcxLabel;
    deMilkRecordingDate: TcxDateEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxCloseClick(Sender: TObject);
  private
    { Private declarations }
    TempEvents : TTable;
    AnimalNo,
    AnimalNatIDNum,
    AnimalName,
    AnimalLactNo,
    EventDate : String;
    DataList : TStringList;
    BullList : TStringList;
    BullHBNList : TStringList;
    HerdIdentity : Integer;
    HerdPrefix : String;
    TempQuery : TQuery;
    FMilkRecorder : TMilkRecorder;
    procedure GetData;
    procedure AddFileHeader;
    procedure AddLeftHerdData;
    procedure AddPurchaseData;
    procedure AddCalvingData;
    procedure AddBreedingData;
    procedure AddPregDiagData;
    procedure AddAbortData;
    procedure AddDryOffData;
    procedure AddQMMSMilkData;
    procedure AddHealthData;
    procedure StripCountryIdFromTag(var ATag : string);
    procedure CheckOldNatIDStyle (var ATag : string);

    function CheckMilkState(AID, LactNo : Integer) : TMilkState;
    function CheckValidAICode(AICode: String): Boolean;
    function GetServiceCount(AID, LactNo : Integer) : Integer;
    function CheckValidAnimalNo(var AAnimalNo : String) : Boolean;
  public
    { Public declarations }
    class procedure InitializeExport(AHerdID : Integer);
  end;

var
  fmHUKIFarmEvents: TfmHUKIFarmEvents;

implementation

uses KRoutines, GenTypesConst, DairyData, uMilkData, uHerdSetUp;

{$R *.DFM}

{ TfmHUKIFarmEvents }

procedure TfmHUKIFarmEvents.GetData;
begin
   mWarnings.Lines.Clear;
   AddFileHeader;
   //   02/04/13 [V5.1 R5.4] /MK Bug Fix - AddLeftHerdData was at end of block of events where it should be at the start - J.W CIS.
   AddLeftHerdData;
   AddPurchaseData;
   AddCalvingData;
   AddBreedingData;
   AddPregDiagData;
   AddAbortData;
   AddDryOffData;
   if ( FMilkRecorder = mrCIS ) then
      AddHealthData;

   //   15/08/19 [V5.8 R9.9] /MK Change - NMR no longer require the Milk Date - Helen Whitaker (NMR)/Yvonne Fleetham (NMR).
   if ( FMilkRecorder = mrQMMS ) then
      AddQMMSMilkData;

   SetCurrentDir(ApplicationPath);
   ForceApplicationDirectories('HUKI Farm Events');
   DataList.SaveToFile(ApplicationPath + 'HUKI Farm Events\UNI2FOX.CIS');

   if SaveDialog.Execute then
      begin
         DataList.SaveToFile(SaveDialog.FileName);
         MessageDlg('File "'+SaveDialog.FileName + '" successfully created.',mtInformation,[mbOK],0);
      end;
   //Close;
end;

procedure TfmHUKIFarmEvents.AddLeftHerdData;
var
   lhReason : String[2];
   bWriteHeader : Boolean;
   sNatID : String;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.AnimalNo, A.NatIDNum, A.Name, A.InHerd, MAX(E.EventDate) EventDate, S.Sold, S.Culled');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         SQL.Add('LEFT JOIN SalesDeaths S     ON (S.EventID = E.ID)       ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')     ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.AnimalNo, A.NatIDNum, A.Name, A.InHerd, S.Sold, S.Culled');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Left herd data block');
                           if ( FMilkRecorder = mrCIS ) then
                              DataList.Add('D:cownum\5,barnname\20,LHDAT\8,lhreason\2,eartag\12;')
                           else
                              DataList.Add('D:cownum\5,barnname\20,LHDAT\8,lhreason\2;');
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:cownum\5,barnname\20,LHDAT\8,lhreason\2;')
                           else
                              DataList.Add('D:cownum\4,barnname\20,LHDAT\8,lhreason\2;')
                           }
                        end;
                     AnimalNo := PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo := PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo := PadLeft( AnimalNo, '0', 4 );
                     }

                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if ( HerdPrefix <> '' ) and ( Length(HerdPrefix) > 0 ) then
                        begin
                           if ( Pos(HerdPrefix,AnimalName) > 0 ) then
                              begin
                                 System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                 AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                              end;
                        end;
                     EventDate := FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime);

                     if ( not(GenQuery.FieldByName('Sold').AsBoolean) ) then  // dead
                        lhReason := '01'
                     else
                        begin
                           if ( GenQuery.FieldByName('Culled').AsInteger > 0 ) and ( FMilkRecorder = mrCIS ) then
                              lhReason := '03'
                           else
                              lhReason := '14'; // sold
                        end;

                     sNatID := GenQuery.FieldByName('NatIDNum').AsString;
                     if ( IsNewIrishNatID(sNatID) ) then
                        sNatID := StripIrishCountryPrefixFromNatID(sNatID)
                     else if ( IsNINatID(sNatID) ) then
                        sNatID := StripNIPrefixFromNatID(sNatID)
                     else if ( IsEngNatID(sNatID) ) then
                        sNatID := StripUKPrefixFromNatID(sNatID);
                     sNatID := PadLeft(sNatID,' ',12);
                     if ( Length(sNatID) > 12 ) then
                        sNatID := '';

                     if ( FMilkRecorder = mrCIS ) then
                        DataList.Add(AnimalNo+AnimalName+EventDate+lhReason+sNatID)
                     else
                        DataList.Add(AnimalNo+AnimalName+EventDate+lhReason);
                  end;
               Next;
            end;
      end;
end;

procedure TfmHUKIFarmEvents.AddFileHeader;
var
   FileCreationDate,
   FileCreationTime,
   StartDateData,
   Herdnumber,
   Farmname,
   FarmAddress,
   FarmZip,
   FarmCity : string;
begin
   DataList.Add('C:Herd data event');
   DataList.Add('D:FileCreationDate\8,FileCreationTime\6,StartDateData\8,Herdnumber\9,Farmname\20,FarmAddress\20,FarmZip\6,FarmCity\20;');

   FileCreationDate := PadLeft(FormatDateTime('yyyymmdd',Date), ' ', 8 );
   FileCreationTime := PadLeft(FormatDateTime('hhnnss',Now), ' ', 6 );
   StartDateData := PadLeft(FormatDateTime('yyyymmdd',deStartDate.Date), ' ', 8 );
   if WinData.OwnerFile.Locate('ID', HerdIdentity, []) then
      begin
         Herdnumber := PadRight(Trim( WinData.OwnerFileHerdIdentity.AsString), ' ', 9);
         Farmname   := PadRight(Trim( WinData.OwnerFileHerdPreFix.AsString), ' ', 20);
         FarmAddress := PadRight(Trim( WinData.OwnerFileAddress1.AsString), ' ', 20);
         FarmZip := PadRight(FarmZip, ' ', 6);
         FarmCity := PadRight(Trim( WinData.OwnerFileAddress2.AsString), ' ', 20);
      end;
   DataList.Add(FileCreationDate+FileCreationTime+StartDateData+Herdnumber+Farmname+FarmAddress+FarmZip+FarmCity);
end;

class procedure TfmHUKIFarmEvents.InitializeExport(AHerdID: Integer);
begin
   with TfmHUKIFarmEvents.Create(nil) do
      try
         HerdIdentity := AHerdID;
         HerdPrefix := WinData.PedigreeNamePrefix(HerdIdentity);
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmHUKIFarmEvents.cxButton1Click(Sender: TObject);
begin
   try
      Screen.Cursor := crHourGlass;
      deStartDate.PostEditValue;
      GetData;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmHUKIFarmEvents.AddPurchaseData;
var
   ehCode, DOB, CalveDate, Breed, PedBreed : String;
   bWriteHeader : Boolean;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.PrimaryBreed, A.LactNo, A.DateOfBirth, A.Name, A.InHerd, Max(E.EventDate) EventDate, ');
         SQL.Add('                E.AnimalLactNo, B.PedigreeBreed, B.Code BreedCode, C.Eventdate CEventDate       ');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         SQL.Add('LEFT JOIN Events C        ON (C.AnimalID = A.ID)        ');
         SQL.Add('LEFT JOIN Purchases P     ON (P.EventID = E.ID)         ');
         SQL.Add('LEFT JOIN Breeds B        ON (B.ID = A.PrimaryBreed)    ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (E.EventType = '+IntToStr(CPurchaseEvent)+')      ');
         SQL.Add('AND   (C.EventType = '+IntToStr(CCalvingEvent)+')      ');
         SQL.Add('AND   (C.AnimalLactNo = A.LactNo)      ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.ID, A.AnimalNo, A.NatIDNum, A.PrimaryBreed, A.LactNo, A.DateOfBirth, A.Name, A.InHerd, ');
         SQL.Add('     E.AnimalLactNo, B.PedigreeBreed, B.Code, C.Eventdate  ');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Purchased cows data block');
                           DataList.Add('D:cownum\5,eartag\12,birthdt\8,purchdt\8,ehcode\1,Lactno/2,CLVDAT/8,NMRBrd/2;')
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:cownum\5,eartag\12,birthdt\8,purchdt\8,ehcode\1,Lactno/2,CLVDAT/8,NMRBrd/2;')
                           else
                              DataList.Add('D:cownum\4,eartag\12,birthdt\8,purchdt\8,ehcode\1,Lactno/2,CLVDAT/8,NMRBrd/2;');
                           }
                        end;

                     AnimalNo := PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo := PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo := PadLeft( AnimalNo, '0', 4 );
                     }

                     // 04/02/2009 [Dev 3.9 5.9] /SP
                     AnimalNatIDNum := StripAllNomNumAlpha( GenQuery.FieldByName('NatIDNum').AsString );
                     StripCountryIdFromTag(AnimalNatIDNum);
                     AnimalNatIDNum := Copy(AnimalNatIDNum,1,12);
                     AnimalNatIDNum := PadRight(AnimalNatIDNum  ,' ',12);

                     EventDate  := PadLeft( FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8 );
                     AnimalLactNo := PadLeft( GenQuery.FieldByName('AnimalLactNo').AsString, '0', 2 );
                     DOB := PadLeft( FormatDateTime('yyyymmdd',GenQuery.FieldByName('DateOfBirth').AsDateTime), ' ', 8 );
                     CalveDate := PadLeft( FormatDateTime('yyyymmdd',GenQuery.FieldByName('CEventDate').AsDateTime), ' ', 8);

                     if ( WinData.UserDefaultHerdCountry = NIreland ) then
                        begin
                          //   28/03/13 [V5.1 R5.4] /MK Change - If CIS or NMR export PedigreeBreedCode.
                          if ( FMilkRecorder in [mrCIS, mrNMR] ) then
                              PedBreed := PadRight( GenQuery.FieldByName('PedigreeBreed').AsString, ' ', 2 )
                           else
                              PedBreed := PadRight( GenQuery.FieldByName('BreedCode').AsString, ' ', 3 );
                        end
                     else
                        PedBreed := PadRight( GenQuery.FieldByName('PedigreeBreed').AsString, ' ', 2 );

                     { ehCode D Dry / M In Milk / Y Young Stock }
                     if ( GenQuery.FieldByName('AnimalLactNo').AsInteger = 0 ) then
                        ehCode := 'Y'
                     else
                        begin
                           // Check animal status when purchased into herd.
                           if CheckMilkState( GenQuery.FieldByName('ID').AsInteger, GenQuery.FieldByName('AnimalLactNo').AsInteger ) = msMilking then
                              ehCode := 'M'
                           else
                              ehCode := 'D';
                        end;
                     DataList.Add(AnimalNo+AnimalNatIDNum+DOB+EventDate+ehCode+AnimalLactNo+CalveDate+PedBreed);
                  end;
               Next;
            end;
      end;
end;

function TfmHUKIFarmEvents.CheckMilkState(AID, LactNo: Integer): TMilkState;
begin
   //   18/11/13 [V5.2 R5.7] /MK Bug Fix - Old method of MilkState was crashing.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (AnimalID = :AnimalID)');
         SQL.Add('AND   (AnimalLactNo = :LactNo)');
         SQL.Add('AND   (EventType = :AEventType)');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := LactNo;
         Params[2].AsInteger := CDryOffEvent;
         Open;
         try
            First;
            if ( RecordCount = 0 ) then
               Result := msMilking
            else
               Result := msDry;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmHUKIFarmEvents.FormCreate(Sender: TObject);
var
   LastMilkRecording : TDateTime;
begin
   DataList := TStringList.Create;
   BullList := TStringList.Create;
   BullHBNList := TStringList.Create;

   TempEvents := TTable.Create(nil);
   TempEvents.DatabaseName := AliasName;
   TempEvents.TableName := 'events';
   TempEvents.Active := True;

   TempQuery := TQuery.Create(nil);
   TempQuery.DatabaseName := AliasName;

   LastMilkRecording := TMilkData.GetLastRecordingDate;

   //   04/07/17 [V5.6 R9.1] /MK Change - Set caption to be like MenuUnit and MilkRecording file export captions.
   Caption := 'Create Export File';
   if ( Length(WinData.OwnerFileUKMilkRecorder.AsString) > 0 ) then
      begin
         Caption := 'Create '+WinData.OwnerFileUKMilkRecorder.AsString+' Export File';
         if ( WinData.OwnerFileUKMilkRecorder.AsString = cUKMilkRecorder_CIS ) then
            FMilkRecorder := mrCIS
         else if ( WinData.OwnerFileUKMilkRecorder.AsString = cUKMilkRecorder_NMR ) then
            FMilkRecorder := mrNMR
         else if ( WinData.OwnerFileUKMilkRecorder.AsString = cUKMilkRecorder_QMMS ) then
            FMilkRecorder := mrQMMS;
      end;

   if FMilkRecorder = mrQMMS then
      deStartDate.Date := StrToDate('01/01/1990')
   else
      begin
         if LastMilkRecording >0 then
            begin
               deMilkRecordingDate.Date := LastMilkRecording;
               deStartDate.Date := LastMilkRecording - 5;
            end
         else
            deStartDate.Date := incMonth(Date, -1); // revert ot one month ago.
      end;
end;

procedure TfmHUKIFarmEvents.FormDestroy(Sender: TObject);
begin
   if TempEvents <> nil then
      begin
         TempEvents.Close;
         TempEvents.Free;
      end;
   if DataList <> nil then FreeAndNil(DataList);
   if BullList <> nil then FreeAndNil(BullList);
   if BullHBNList <> nil then FreeAndNil(BullHBNList);
end;

procedure TfmHUKIFarmEvents.AddCalvingData;
var
   AnimalNo,
   AnimalNatIDNum,
   AnimalLactNo,
   EventDate : String;
   CalveQuery : TQuery;
   CalvingQuery : TQuery;
   bWriteHeader : Boolean;
   ASireID,
   ASireBreed : Integer;
   ACalfUsage : String;

   tmpCalfName : String;
   DOB, clf1Ease, clf2Ease, clfBrd,
   clf1Sex, clf1ID, clf1Name, clf1Tag, clf1VID,
   clf2Sex, clf2ID, clf2Name, clf2Tag, clf2VID : String;

begin
   WinData.AnimalFileByID.Close;
   WinData.AnimalFileByID.Open;

   CalvingQuery := TQuery.Create(nil);
   CalvingQuery.DatabaseName := AliasName;
   CalvingQuery.SQL.Text := 'Select C.ID1, C.ID2, G.LookupCode From Calvings C Left Join GenLook G on (G.ID=C.BirthType) Where EventID = :EID ';

   CalveQuery := TQuery.Create(nil);
   CalveQuery.DatabaseName := AliasName;

   CalveQuery.SQL.Text := 'Select A.Sex, A.AnimalNo, A.Name, A.NatIDNum, A.PrimaryBreed, B.Code BreedCode, B.PedigreeBreed, A.Inherd '+
                          'From Animals A '+
                          'Left Join Breeds B On (B.ID=A.PrimaryBreed) '+
                          'Where A.ID = :AID ';

   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.DateOfBirth, A.PrimaryBreed, A.Name, A.InHerd, Max(E.EventDate) EventDate , ');
         SQL.Add('                E.AnimalLactNo, E.ID EventID, B.PedigreeBreed, B.Code BreedCode');
         //   22/07/11 [V4.1 R4.3] /MK Additional Feature - Export SireBreed For New CalfUsage Field
         SQL.Add('                ,SA.SireID, SA.PrimaryBreed BBreed, SB.EligibleForPremium');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         SQL.Add('LEFT JOIN Breeds B        ON (B.ID = A.PrimaryBreed)    ');
         SQL.Add('LEFT JOIN Animals SA      ON (SA.ID = A.ID)    ');
         SQL.Add('LEFT JOIN Breeds SB       ON (SB.ID = SA.PrimaryBreed)    ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.Sex="Female")                            ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+') ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.ID, A.AnimalNo, A.NatIDNum, A.PrimaryBreed, A.DateOfBirth, A.Name, A.InHerd, ');
         SQL.Add('	   E.AnimalLactNo, E.ID, B.PedigreeBreed, B.Code, SA.SireID, SA.PrimaryBreed, SB.EligibleForPremium');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Calving data block');
                           DataList.Add('D:cownum\5,eartag\12,birthdt\8,CLVDAT\8,clf1sex\1,clf1id\5,clf1name\20,clf1tag\12,clf1vid\5,clf1ease\1,clf2sex\1,clf2id\5,clf2name\20,clf2tag\12,clf2vid\5,clf2ease\1,calfbrd\2,CalfUsage\1;')
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:cownum\5,eartag\12,birthdt\8,CLVDAT\8,clf1sex\1,clf1id\5,clf1name\20,clf1tag\12,clf1vid\5,clf1ease\1,clf2sex\1,clf2id\5,clf2name\20,clf2tag\12,clf2vid\5,clf2ease\1,calfbrd\2,CalfUsage\1;')
                           else
                              DataList.Add('D:cownum\4,eartag\12,birthdt\8,CLVDAT\8,clf1sex\1,clf1id\4,clf1name\20,clf1tag\12,clf1vid\4,clf1ease\1,clf2sex\1,clf2id\4,clf2name\20,clf2tag\12,clf2vid\4,clf2ease\1,calfbrd\2,CalfUsage\1;');
                           }
                        end;

                     clf1Sex := '';
                     clf1ID  := '';
                     clf1Name := '';
                     clf1Tag := '';
                     clf1VID := '';
                     clfBrd := '';
                     clf1Ease := '';


                     clf2Sex := '';
                     clf2ID  := '';
                     clf2Name := '';
                     clf2Tag := '';
                     clf2VID := '';
                     clf2Ease := '';

                      // 04/02/2009 [Dev 3.9 5.9] /SP
                     AnimalNo :=  PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo :=  PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo :=  PadLeft( AnimalNo, '0', 4 );
                     }
                     AnimalNatIDNum := StripAllNomNumAlpha( GenQuery.FieldByName('NatIDNum').AsString );
                     StripCountryIdFromTag( AnimalNatIDNum );
                     AnimalNatIDNum := Copy(AnimalNatIDNum,1,12);
                     CheckOldNatIDStyle ( AnimalNatIDNum );
                     AnimalNatIDNum := PadRight( AnimalNatIDNum  ,' ',12);

                     EventDate  := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8);
                     AnimalLactNo := PadLeft( GenQuery.FieldByName('AnimalLactNo').AsString, '0', 2 );
                     DOB := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('DateOfBirth').AsDateTime), ' ', 8);

                     CalvingQuery.Close;
                     CalvingQuery.Params[0].AsInteger := GenQuery.FieldByName('EventID').AsInteger;
                     CalvingQuery.Open;
                     CalvingQuery.First;

                     //   22/07/11 [V4.1 R4.3] /MK Additional Feature - Export SireBreed For New CalfUsage Field
                     //   17/11/15 [V5.5 R0.8] /MK Change - Calf usage should be first assigned from SireBreed - Helen Whittaker NMR.
                     if ( GenQuery.FieldByName('EligibleforPremium').AsBoolean ) then
                        ACalfUsage := 'B'
                     else
                        ACalfUsage := 'D';

                     if ( CalvingQuery.FieldByName('ID1').AsInteger > 0 ) then
                        begin
                           with CalveQuery do
                              begin
                                 Close;
                                 Params[0].AsInteger := CalvingQuery.FieldByName('ID1').AsInteger;
                                 Open;

                                 First;

                                 //   22/07/11 [V4.1 R4.3] /MK Additional Feature - If Calf Is Female Then Calf Useage Is Dairy Else Beef
                                 //   03/11/15 [V5.4 R9.9] /MK Bug Fix - Code below was completely opposite to rule above.
                                 //   Calf sex is 2 for female and 1 for male.
                                 if CalveQuery.FieldByName('Sex').AsString <> cSex_Female then
                                    begin
                                       clf1Sex := '1';
                                       //   17/11/15 [V5.5 R0.8] /MK Change - If calf is male then calf usage is B regardless of sire breed - Helen Whittaker NMR.
                                       ACalfUsage := 'B';
                                    end
                                 else
                                    //   30/03/16 /MK Bug Fix - clf2Sex was assigned below instead of clf1Sex - Jim Westaway reported.
                                    clf1Sex := '2';

                                 if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                    clf1ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 5 )
                                 else
                                    clf1ID := PadLeft( clf1ID, ' ', 5);
                                 {
                                 if ( FMilkRecorder = mrNMR ) then
                                    begin
                                       if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                          clf1ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 5 )
                                       else
                                          clf1ID := PadLeft( clf1ID, ' ', 5);
                                    end
                                 else
                                    begin
                                       if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                          clf1ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 4 )
                                       else
                                          clf1ID := PadLeft( clf1ID, ' ', 4);
                                    end;
                                 }

                                 if ( Length(HerdPrefix) > 0 ) then
                                    begin
                                       tmpCalfName := CalveQuery.FieldByName('Name').AsString;
                                       if Pos(HerdPrefix,tmpCalfName)>0 then
                                          System.Delete(tmpCalfName,Pos(HerdPrefix,tmpCalfName), Length(HerdPrefix));
                                       tmpCalfName := Copy(tmpCalfName, Length(CalveQuery.FieldByName('Name').AsString), -19);
                                       clf1Name := PadRight(Trim( tmpCalfName ),' ',20);
                                    end
                                 else
                                    begin
                                       tmpCalfName := Copy(CalveQuery.FieldByName('Name').AsString, Length(CalveQuery.FieldByName('Name').AsString), -19);
                                       if Pos(HerdPrefix,tmpCalfName)>0 then
                                          System.Delete(tmpCalfName,Pos(HerdPrefix,tmpCalfName), Length(HerdPrefix));
                                       clf1Name := PadRight(Trim( tmpCalfName ),' ',20);
                                    end;

                                 if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                    clf1Tag := StripAllNomNumAlpha( CalveQuery.FieldByName('NatIDNum').AsString )
                                 else
                                    clf1Tag := '';

                                 // 04/02/2009 [Dev 3.9 5.9] /SP
                                 StripCountryIdFromTag( clf1Tag );
                                 clf1Tag := Copy(clf1Tag,1,12);
                                 clf1Tag := PadRight(clf1Tag,' ',12);
                                 clf1VID := clf1ID;

                                 //   30/06/11 [V4.1 R2.1] /MK Bug Fix - CalfPBrd Variable Set But Not Needed For Export Line.
                                 if ( WinData.UserDefaultHerdCountry = NIreland ) then
                                    begin
                                       //   28/03/13 [V5.1 R5.4] /MK Change - If CIS or NMR export PedigreeBreedCode.
                                       if ( FMilkRecorder in [mrCIS, mrNMR] ) then
                                          clfBrd := PadRight( CalveQuery.FieldByName('PedigreeBreed').AsString, ' ', 2 )
                                       else
                                          clfBrd := PadRight( CalveQuery.FieldByName('BreedCode').AsString, ' ', 3 );
                                    end
                                 else
                                    clfBrd := PadRight( CalveQuery.FieldByName('PedigreeBreed').AsString, ' ', 2 );

                                 clf1Ease := PadLeft(CalvingQuery.FieldByName('LookupCode').AsString, '0', 1);
                              end;
                        end
                     else
                        begin
                           clf1Sex := PadRight( clf1Sex, ' ', 1);
                           clf1ID  := PadRight( clf1ID, ' ', 5);
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              clf1ID  := PadRight( clf1ID, ' ', 5)
                           else
                              clf1ID  := PadRight( clf1ID, ' ', 4);
                           }
                           clf1Name := PadRight( clf1Name, ' ', 20);
                           clf1Tag := PadRight( clf1Tag, ' ', 12);

                           //   03/10/19 [V5.9 R0.7] /MK Bug Fix - clf2VID was incorrectly padded to 5 for non NMR customers.
                           clf1VID  := PadRight( clf1VID, ' ', 5);
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              clf1VID  := PadRight( clf1VID, ' ', 5)
                           else
                              clf1VID  := PadRight( clf1VID, ' ', 4);
                           }

                           //   05/04/16 [V5.5 R5.7] /MK Bug Fix - Calf Breed was not padded out where there was no calf in the calving event
                           //                                      i.e. if the cow was brougt over from another herd as calved without the calf.
                           clfBrd := PadRight( clfBrd, ' ', 2);

                           clf1ease := ' ';
                        end;

                     if ( CalvingQuery.FieldByName('ID2').AsInteger > 0 ) then
                        begin
                           with CalveQuery do
                              begin
                                 Close;
                                 Params[0].AsInteger := CalvingQuery.FieldByName('ID2').AsInteger;
                                 Open;
                                 First;
                                 if ( CalveQuery.FieldByName('Sex').AsString <> cSex_Female ) then
                                    clf2Sex := '1'
                                 else
                                    clf2Sex := '2';

                                 if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                    clf2ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 5 )
                                 else
                                    clf2ID := PadLeft( clf2ID, ' ', 5);
                                 {
                                 if ( FMilkRecorder = mrNMR ) then
                                    begin
                                       if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                          clf2ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 5 )
                                       else
                                          clf2ID := PadLeft( clf2ID, ' ', 5);
                                    end
                                 else
                                    begin
                                       if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                          clf2ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 4 )
                                       else
                                          clf2ID := PadLeft( clf2ID, ' ', 4);
                                    end;
                                 }

                                 if ( Length(HerdPrefix) > 0 ) then
                                    begin
                                       tmpCalfName := CalveQuery.FieldByName('Name').AsString;
                                       if ( Pos(HerdPrefix,tmpCalfName) > 0 ) then
                                          System.Delete(tmpCalfName,Pos(HerdPrefix,tmpCalfName), Length(HerdPrefix));
                                       tmpCalfName := Copy(tmpCalfName, Length(CalveQuery.FieldByName('Name').AsString), -19);
                                       clf2Name := PadRight(Trim( tmpCalfName ),' ',20);
                                    end
                                 else
                                    begin
                                       tmpCalfName := Copy(CalveQuery.FieldByName('Name').AsString, Length(CalveQuery.FieldByName('Name').AsString), -19);
                                       if Pos(HerdPrefix,tmpCalfName)>0 then
                                          System.Delete(tmpCalfName,Pos(HerdPrefix,tmpCalfName), Length(HerdPrefix));
                                       clf2Name := PadRight(Trim( tmpCalfName ),' ',20);
                                    end;

                                 if ( CalveQuery.FieldByName('Inherd').AsBoolean ) then
                                    clf2Tag := StripAllNomNumAlpha( CalveQuery.FieldByName('NatIDNum').AsString )
                                 else
                                    clf2Tag := '';

                                 // 04/02/2009 [Dev 3.9 5.9] /SP
                                 StripCountryIdFromTag( clf2Tag );
                                 clf2Tag := Copy(clf2Tag,1,12);
                                 clf2Tag := PadRight(clf2Tag,' ',12);
                                 clf2VID := clf2ID;

                                 clf2Ease := PadLeft(CalvingQuery.FieldByName('LookupCode').AsString, '0', 1);
                              end;
                        end
                     else
                        begin
                           clf2Sex := PadRight( clf2Sex, ' ', 1);
                           clf2ID  := PadRight( clf2ID, ' ', 5);
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              clf2ID  := PadRight( clf2ID, ' ', 5)
                           else
                              clf2ID  := PadRight( clf2ID, ' ', 4);
                           }
                           clf2Name := PadRight( clf2Name, ' ', 20);
                           clf2Tag := PadRight( clf2Tag, ' ', 12);

                           //   03/10/19 [V5.9 R0.7] /MK Bug Fix - clf2VID was incorrectly padded to 5 for non NMR customers.
                           clf2VID := PadRight( clf2VID, ' ', 5);
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              clf2VID := PadRight( clf2VID, ' ', 5)
                           else
                              clf2VID := PadRight( clf2VID, ' ', 4);
                           }

                           clf2Ease := ' ';
                        end;
                     //   22/07/11 [V4.1 R4.3] /MK Additional Feature - Export Calf Usage.
                     DataList.Add(AnimalNo+AnimalNatIDNum+DOB+EventDate+clf1Sex+clf1ID+clf1Name+clf1Tag+clf1VID+clf1Ease+clf2Sex+clf2ID+clf2Name+clf2Tag+clf2VID+clf2Ease+clfBrd+ACalfUsage);
                  end;
               Next;
         end;
      end;
   CalveQuery.Close;
   CalveQuery.Free;
   CalvingQuery.Close;
   CalvingQuery.Free;
end;

procedure TfmHUKIFarmEvents.AddBreedingData;
var
   BullNatID, BullAnimalNo, BullHerdBookNo, BullBreed, UKBullAICode : String;
   BullName : string;
   ServTech, ServiceCount : String;
   bWriteHeader : Boolean;

begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.Name, A.LactNo, A.PrimaryBreed, A.InHerd, SA.AnimalNo BullAnimalNo, SA.UKAISireCode, ');
         SQL.Add('SA.HerdBookNo BullHerdBookNo, SA.NatIDNum BullNatIDNum, SA.Name BullName, G.Description, Max(E.EventDate) EventDate , ');
         SQL.Add('E.AnimalLactNo, SB.PedigreeBreed BullPBreed, SB.Code BullBreed ');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         SQL.Add('LEFT JOIN Services S     ON (S.EventID = E.ID)          ');
         SQL.Add('LEFT JOIN Animals SA ON (SA.ID = S.ServiceBull)          ');
         SQL.Add('LEFT JOIN Breeds SB     ON (SB.ID = SA.PrimaryBreed)    ');
         SQL.Add('LEFT JOIN GenLook G     ON (G.ID = S.Technician)        ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')      ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.ID, A.AnimalNo, A.Name, A.LactNo, A.PrimaryBreed, A.InHerd, SA.AnimalNo , SA.UKAISireCode, ');
         SQL.Add('SA.HerdBookNo , SA.NatIDNum , SA.Name, G.Description, ');
         SQL.Add('E.AnimalLactNo, SB.PedigreeBreed, SB.Code  ');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Breeding data block');
                           DataList.Add('D:cownum\5,barnname\20,SRVDAT\8,breed\2,SRVSIRE\10,HBN\12,SRVTECH\4,tbrd\2;')
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:cownum\5,barnname\20,SRVDAT\8,breed\2,SRVSIRE\10,HBN\12,SRVTECH\4,tbrd\2;')
                           else
                              DataList.Add('D:cownum\4,barnname\20,SRVDAT\8,breed\2,SRVSIRE\10,HBN\12,SRVTECH\4,tbrd\2;');
                           }
                        end;

                     AnimalNo := PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo := PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo := PadLeft( AnimalNo, '0', 4 );
                     }
                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if ( Length(HerdPrefix) > 0 ) then
                        begin
                           if ( Pos(HerdPrefix,AnimalName) > 0 ) then
                              begin
                                  System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                  AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                              end;
                         end;
                     EventDate  := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8);

                     //   30/06/11 [V4.1 R2.1] /MK Bug Fix - BullPBrd Variable Set But Not Needed For Export Line.
                     if ( WinData.UserDefaultHerdCountry = NIreland ) then
                        begin
                           //   28/03/13 [V5.1 R5.4] /MK Change - If CIS or NMR export PedigreeBreedCode.
                           if ( FMilkRecorder in [mrCIS, mrNMR] ) then
                              BullBreed := PadLeft( GenQuery.FieldByName('BullPBreed').AsString ,' ',2)
                           else
                              BullBreed := PadLeft( GenQuery.FieldByName('BullBreed').AsString ,' ',2);
                        end
                     else
                        BullBreed := PadLeft( GenQuery.FieldByName('BullPBreed').AsString ,' ',2);

                     // 04/02/2009 [Dev 3.9 5.9] /SP Program Bug - Copy first [12] hars of NatIDNum after NatIDNum is stripped of all non alpha chars
                     BullNatID := StripAllNomNumAlpha( GenQuery.FieldByName('BullNatIDNum').AsString );
                     StripCountryIdFromTag( BullNatID );
                     BullNatID := Copy(BullNatID,1,12);
                     BullNatID := PadRight(BullNatID,' ',12);

                     UKBullAICode := GenQuery.FieldByName('UKAISireCode').AsString;
                     if ( Length(UKBullAICode) > 0 ) then
                        BullAnimalNo := PadRight(UKBullAICode,' ',10)
                     else
                        BullAnimalNo := PadRight( GenQuery.FieldByName('BullAnimalNo').AsString ,' ',10);

                     BullName  :=  PadRight( Copy(GenQuery.FieldByName('BullName').AsString,1, 12) ,' ',12);

                     if ( not(CheckValidAICode(BullAnimalNo)) ) then
                        begin
                           if ( BullList.IndexOf(BullAnimalNo) = -1 ) then
                              begin
                                  BullList.Add(BullAnimalNo);
                                  mWarnings.Lines.Add(Trim(BullAnimalNo) + ' - not a recognised AI Code');
                                  //ShowMessage( BullAnimalNo + ' is not a recognised AI Code');
                              end;
                        end;

                     BullHerdBookNo := StripAllNomNumAlpha( GenQuery.FieldByName('BullHerdBookNo').AsString);
                     if ( Length(GenQuery.FieldByName('BullHerdBookNo').AsString) > 12 ) then
                        begin
                           if BullHBNList.IndexOf(BullHerdBookNo) = -1 then
                              begin
                                 BullHBNList.Add(BullHerdBookNo);
                                 mWarnings.Lines.Add(Trim(BullHerdBookNo) + ' - Herdbook No. has been truncated.');
                              end;
                           BullHerdBookNo := Copy(BullHerdBookNo, Length(BullHerdBookNo)-11, MaxInt);
                        end;
                     BullHerdBookNo := PadRight(BullHerdBookNo,' ',12);

                     if ( Length(Trim(BullHerdBookNo)) = 0 ) then
                        begin
                           BullHerdBookNo := BullNatID; // use natid where herdbookno is blank
                           if ( Length(Trim(BullHerdBookNo)) > 0 ) then
                              mWarnings.Lines.Add(Trim(BullHerdBookNo) + ' - Herdbook No. has been not been found.')
                           else
                              mWarnings.Lines.Add(Trim(BullName) + ' - Herdbook No. has been not been found.')
                        end;

                     ServTech := PadRight( Copy(GenQuery.FieldByName('Description').AsString, 1, 4), ' ', 4);
                     ServiceCount := PadLeft( IntToStr(GetServiceCount(GenQuery.FieldByName('ID').AsInteger, GenQuery.FieldByName('LactNo').AsInteger)), '0', 2);
                     DataList.Add(AnimalNo+AnimalName+EventDate+BullBreed+BullAnimalNo+BullHerdBookNo+ServTech+ServiceCount);
                  end;
               Next;
            end;
      end;
end;

function TfmHUKIFarmEvents.CheckValidAICode(AICode: String): Boolean;
begin
   Result := False;
   AICode := Trim(AICode);
   if ( Length(AICode) = 6 ) then
      begin
         if ( AICode[1] in ['A'..'Z', 'a'..'z'] ) and ( (AICode[2] in ['A'..'Z', 'a'..'z'] ) or ( AICode[2] = ' ' )) and
            ( AICode[3] in ['0'..'9'] ) and (AICode[4] in ['0'..'9']) and ( AICode[5] in ['0'..'9'] ) and
            (AICode[6] in ['0'..'9']) then
            Result := True;
      end;
end;

procedure TfmHUKIFarmEvents.AddPregDiagData;
var
   PDResult : String;
   bWriteHeader : Boolean;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.AnimalNo, A.Name, A.InHerd, Max(E.EventDate) EventDate, P.PregnancyStatus ');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         SQL.Add('LEFT JOIN PregnancyDiag P ON (P.EventID = E.ID)         ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (E.EventType = '+IntToStr(CPregDiagEvent)+')      ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.AnimalNo, A.Name, A.InHerd, P.PregnancyStatus');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Pregnancy data block');
                           DataList.Add('D:cownum\5,barnname\20,PRGDAT\8,PRGDIAG\1;');
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:cownum\5,barnname\20,PRGDAT\8,PRGDIAG\1;')
                           else
                              DataList.Add('D:cownum\4,barnname\20,PRGDAT\8,PRGDIAG\1;');
                           }
                        end;

                     AnimalNo := PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo := PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo := PadLeft( AnimalNo, '0', 4 );
                     }
                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if ( Length(HerdPrefix) > 0 ) then
                        begin
                           if ( Pos(HerdPrefix,AnimalName) > 0 ) then
                              begin
                                 System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                 AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                              end;
                         end;
                     EventDate := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8);
                     if ( GenQuery.FieldByName('PregnancyStatus').AsBoolean ) then
                        PDResult := '7' // Pregnant
                     else if ( not(GenQuery.FieldByName('PregnancyStatus').AsBoolean) ) then
                        PDResult := '9' // not Pregnant
                     else if GenQuery.FieldByName('PregnancyStatus').IsNull then
                        PDResult := '8'; // '8' Pregnant Unknown, but checked
                     // '6' Barren
                     DataList.Add(AnimalNo+AnimalName+EventDate+PDResult);
                  end;
               Next;
            end;
      end;
end;

procedure TfmHUKIFarmEvents.AddAbortData;
var
   bWriteHeader : Boolean;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.AnimalNo, A.Name, A.InHerd, Max(E.EventDate) EventDate ');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (E.EventType = '+IntToStr(CAbortionEvent)+')      ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.AnimalNo, A.Name, A.InHerd');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               if ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) and
                  ( Length(GenQuery.FieldByName('AnimalNo').AsString) > 0 ) then
                  begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if ( CheckValidAnimalNo(AnimalNo) ) then
                        begin
                          if ( bWriteHeader ) then
                             begin
                                bWriteHeader := False;
                                DataList.Add('C:Abort data block');
                                DataList.Add('D:cownum\5,barnname\20,abrtdt\8;')
                                {
                                if ( FMilkRecorder = mrNMR ) then
                                   DataList.Add('D:cownum\5,barnname\20,abrtdt\8;')
                                else
                                   DataList.Add('D:cownum\4,barnname\20,abrtdt\8;');
                                }
                             end;
                          AnimalNo := PadLeft( AnimalNo, '0', 5 );
                          {
                          if ( FMilkRecorder = mrNMR ) then
                             AnimalNo := PadLeft( AnimalNo, '0', 5 )
                          else
                             AnimalNo := PadLeft( AnimalNo, '0', 4 );
                          }
                          AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                          if ( Length(HerdPrefix) > 0 ) then
                             begin
                                if ( Pos(HerdPrefix,AnimalName) > 0 ) then
                                   begin
                                      System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                      AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                                   end;
                             end;
                          EventDate := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ',8);
                          DataList.Add(AnimalNo+AnimalName+EventDate);
                        end;
                  end;
               Next;
            end;
      end;
end;

procedure TfmHUKIFarmEvents.AddDryOffData;
var
   bWriteHeader : Boolean;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.AnimalNo, A.Name, A.InHerd, Max(E.EventDate) EventDate ');
         SQL.Add('FROM Animals A                                          ');
         SQL.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         SQL.Add('AND   (A.AnimalDeleted=False)                           ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (E.EventType = '+IntToStr(CDryOffEvent)+')      ');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.AnimalNo, A.Name, A.InHerd');
         Open;
         if ( GenQuery.RecordCount = 0 ) then Exit;
         GenQuery.First;
         while ( not(GenQuery.Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  //   12/02/16 [V5.5 R3.8] /MK Bug Fix - Only add a block if dry off date is greater than zero as above SQL brings up a blank record.
                  ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Dry cows data block');
                           DataList.Add('D:cownum\5,barnname\20,DRYDAT\8;');
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:cownum\5,barnname\20,DRYDAT\8;')
                           else
                              DataList.Add('D:cownum\4,barnname\20,DRYDAT\8;');
                           }
                        end;
                     AnimalNo := PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo := PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo := PadLeft( AnimalNo, '0', 4 );
                     }
                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if ( Length(HerdPrefix) > 0 ) then
                        begin
                           if Pos(HerdPrefix,AnimalName)>0 then
                              begin
                                  System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                  AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                              end;
                        end;
                     EventDate := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ',8);
                     DataList.Add(AnimalNo+AnimalName+EventDate);
                  end;
               GenQuery.Next;
            end;
      end;
end;

function TfmHUKIFarmEvents.GetServiceCount(AID, LactNo: Integer): Integer;
begin
   with TempQuery do
      begin
         Close;
         SQL.Clear;
         SQL.Add('Select Count(E.ID) CountOfServices From Events E Where (E.AnimalID=:AID) and (E.AnimalLactNo=:ALactNo) and (E.EventType=4)');
         params[0].AsInteger := AID;
         params[1].AsInteger := LactNo;
         Open;
         try
            First;
            Result := FieldByName('CountOfServices').AsInteger;
         finally
            Close;
         end;
      end;
end;

procedure TfmHUKIFarmEvents.StripCountryIdFromTag(var ATag: string);
begin
   if ( Copy(ATag, 1, 2) = 'UK' ) then
      Delete(ATag, 1, 2)
   else
      ATag := StripIrishCountryPrefixFromNatID(ATag);
end;

procedure TfmHUKIFarmEvents.CheckOldNatIDStyle(var ATag: string);
begin
    ATag := StripAllNomNumAlpha (ATag);
    if (ATag <> '') and (Length(ATag) > 6) then
       begin
          if ATag [Length(ATag)] in ['A'..'Z','a'..'z'] then
             begin
                 insert ('/', ATag, 7);
             end;
       end
end;

function TfmHUKIFarmEvents.CheckValidAnimalNo(var AAnimalNo: String): Boolean;
var
   InHerd : Boolean;
begin
   Result := False;
   InHerd := GenQuery.FieldByName('InHerd').AsBoolean;
   if (Length(AAnimalNo) > 5 ) then
      begin
         // Check if animal renumbered, if it has been restore the animalno
         // back to its orginal value
         if Pos('/', AAnimalNo) > 0 then
            begin
               AAnimalNo := Copy(AAnimalNo, 1, Pos('/', AAnimalNo)-1);
               if (Length(AAnimalNo) in [1..5]) then
                  Result := True;
            end
         else if Pos('(', AAnimalNo) > 0 then
            begin
               AAnimalNo := Copy(AAnimalNo, 1, Pos('(', AAnimalNo)-1);
               if (Length(AAnimalNo) in [1..5]) then
                  Result := True;
            end;
      end
   else if ( (Length(AAnimalNo) in [1..5]) and not ( InHerd ) ) then
      begin
         if Pos('/', AAnimalNo) > 0 then
            begin
               AAnimalNo := Copy(AAnimalNo, 1, Pos('/', AAnimalNo)-1);
               if (Length(AAnimalNo) in [1..5]) then
                  Result := True;
            end
         else if Pos('(', AAnimalNo) > 0 then
            begin
               AAnimalNo := Copy(AAnimalNo, 1, Pos('(', AAnimalNo)-1);
               if (Length(AAnimalNo) in [1..5]) then
                  Result := True;
            end
         else
            //   03/04/12 [V5.0 R4.6] /MK Bug Fix - No Else Check Added.
            Result := True;
      end
   //   22/07/11 [V4.1 R4.3] /MK Additional Feature - Added Check For A..Z On Animal No.
   else if (AAnimalNo <> '') and (Length(AAnimalNo) <= 5) and ( InHerd ) then
       begin
          if AAnimalNo [Length(AAnimalNo)] in ['A'..'Z','a'..'z'] then
             begin
                 AAnimalNo := WinData.StripAllAlphaButNum(AAnimalNo);
                 Result := True;
             end
          else
             Result := True;
       end
   else if ( (Length(AAnimalNo) in [1..5]) and ( InHerd ) ) then
      begin
         if ( ( Pos('/', AAnimalNo) > 0 ) or ( Pos('(', AAnimalNo) > 0 )) then
            begin
               AAnimalNo := WinData.StripAllNomNumAlpha(AAnimalNo);
               Result := True;
            end
         else
            Result := True;
      end
   else
      Result := True;
end;

procedure TfmHUKIFarmEvents.cxCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmHUKIFarmEvents.AddQMMSMilkData;
var
   bWriteHeader : Boolean;
   DailyYield : String;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.AnimalNo, A.InHerd, M.DateOfRecording, M.DailyYield           ');
         SQL.Add('FROM Animals A                                                                  ');
         SQL.Add('LEFT JOIN MilkDiskTrans M ON (M.AnimalID = A.ID)                                ');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)                                                  ');
         SQL.Add('AND   (M.LactNo = A.LactNo)                                                     ');
         SQL.Add('AND   (A.AnimalDeleted=False)                                                   ');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')                                     ');
         SQL.Add('AND   (A.InHerd = True)                                                         ');
         SQL.Add('AND   (M.DateOfRecording >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('GROUP BY A.AnimalNo, A.InHerd, M.DateOfRecording, M.DailyYield                  ');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if ( CheckValidAnimalNo(AnimalNo) ) and
                  ( GenQuery.FieldByName('DateOfRecording').AsDateTime > 0 ) then
                  begin
                     if ( bWriteHeader ) then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Record Type 13');
                           DataList.Add('D:CowNum\5,Recording,13,EventDate\8,DailyYield\3;');
                           {
                           if ( FMilkRecorder = mrNMR ) then
                              DataList.Add('D:CowNum\5,Recording,13,EventDate\8,DailyYield\3;')
                           else
                              DataList.Add('D:CowNum\4,Recording,13,EventDate\8,DailyYield\3;');
                           }
                        end;
                     AnimalNo := PadLeft( AnimalNo, '0', 5 );
                     {
                     if ( FMilkRecorder = mrNMR ) then
                        AnimalNo := PadLeft( AnimalNo, '0', 5 )
                     else
                        AnimalNo := PadLeft( AnimalNo, '0', 4 );
                     }
                     EventDate := PadLeft(FormatDateTime('dd/mm/yy',GenQuery.FieldByName('DateOfRecording').AsDateTime), ' ',8);
                     DailyYield := GenQuery.FieldByName('DailyYield').AsString;
                     DataList.Add(AnimalNo + 'Recording' + '13' + EventDate + DailyYield);
                  end;
               Next;
            end;
      end;
end;

procedure TfmHUKIFarmEvents.AddHealthData;
var
   bWriteHeader : Boolean;
   sEventType : String;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.AnimalNo, A.Name, A.InHerd, E.EventDate, E.EventType, G.Description GLDesc');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Events E ON ( E.AnimalId = A.Id )');
         SQL.Add('LEFT JOIN Health H ON ( H.EventId = E.Id )');
         SQL.Add('LEFT JOIN GenLook G ON ( G.ID = H.FarmCode )');
         SQL.Add('WHERE (A.AnimalNo IS NOT NULL)');
         SQL.Add('AND   (A.AnimalDeleted=False)');
         SQL.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')');
         SQL.Add('AND   (A.InHerd=True)');
         SQL.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         SQL.Add('AND   (E.EventType IN ('+IntToStr(CHealthEvent)+','+IntToStr(CNewMastitisEvent)+','+IntToStr(CLamenessEvent)+'))');
         SQL.Add('GROUP BY A.AnimalNo, A.Name, A.InHerd, E.EventDate, E.EventType, G.Description');
         Open;
         if ( RecordCount = 0 ) then Exit;
         First;
         while ( not(Eof) ) do
            begin
               if ( GenQuery.FieldByName('EventType').AsInteger in [CNewMastitisEvent, CLamenessEvent] ) or
                  ( (UpperCase(GenQuery.FieldByName('GLDesc').AsString) = 'MASTITIS') or
                    (UpperCase(GenQuery.FieldByName('GLDesc').AsString) = 'LAMENESS') ) then
                  begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if ( CheckValidAnimalNo(AnimalNo) ) and
                        ( GenQuery.FieldByName('EventDate').AsDateTime > 0 ) then
                        begin
                           if ( bWriteHeader ) then
                              begin
                                 bWriteHeader := False;
                                 DataList.Add('C:Health data block');
                                 DataList.Add('D:cownum\5,barnname\20,HEALTHDATE\8;EVENT\2;');
                              end;
                           AnimalNo := PadLeft( AnimalNo, '0', 5 );

                           AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                           if ( Length(HerdPrefix) > 0 ) then
                              begin
                                 if Pos(HerdPrefix,AnimalName)>0 then
                                    begin
                                        System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                        AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                                    end;
                              end;

                           EventDate := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ',8);

                           sEventType := '';
                           if ( (GenQuery.FieldByName('EventType').AsInteger = CNewMastitisEvent) or
                                (UpperCase(GenQuery.FieldByName('GLDesc').AsString) = 'MASTITIS') ) then
                              sEventType := '73'
                           else if ( (GenQuery.FieldByName('EventType').AsInteger = CLamenessEvent) or
                                (UpperCase(GenQuery.FieldByName('GLDesc').AsString) = 'LAMENESS') ) then
                              sEventType := '76';

                           DataList.Add(AnimalNo+AnimalName+EventDate+sEventType);
                        end;
                  end;
               Next;
            end;
      end;
end;

end.
