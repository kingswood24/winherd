{

  04/02/2009 [Dev 3.9 5.9] /SP Bug Fix - Copy first [12] hars of NatIDNum after NatIDNum is stripped of all non alpha chars

  11/08/10 [V4.0 R4.3] /MK Bug - Export UKAICode instead of BullAnimalNo Where UKAICode Exists.  

}
unit uHUKIFarmEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Db, DBTables,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cxShellComboBox, cxDBShellComboBox, cxMemo, ExtCtrls;

type
  TMilkState = (msMilking, msDry);
  TfmHUKIFarmEvents = class(TForm)
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    GenQuery: TQuery;
    deStartDate: TcxDateEdit;
    SaveDialog: TSaveDialog;
    mWarnings: TcxMemo;
    Label1: TLabel;
    cxButton2: TcxButton;
    Bevel1: TBevel;
    cxLabel2: TcxLabel;
    deMilkRecordingDate: TcxDateEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
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
    procedure GetData;
    procedure AddFileHeader;
    procedure AddLeftHerdData;
    procedure AddPurchaseData;
    procedure AddCalvingData;
    procedure AddBreedingData;
    procedure AddPregDiagData;
    procedure AddAbortData;
    procedure AddDryOffData;
    function CheckMilkState(AID, LactNo : Integer) : TMilkState;
    function CheckValidAICode(AICode: String): Boolean;
    function GetServiceCount(AID, LactNo : Integer) : Integer;
    function CheckValidAnimalNo(var AAnimalNo : String) : Boolean;
    procedure StripCountryIdFromTag(var ATag : string);
    procedure CheckOldNatIDStyle (var ATag : string);
  public
    { Public declarations }
    class procedure InitializeExport(AHerdID : Integer);
  end;

var
  fmHUKIFarmEvents: TfmHUKIFarmEvents;

implementation

uses KRoutines, GenTypesConst, DairyData, uMilkData;

{$R *.DFM}

{ TfmHUKIFarmEvents }

procedure TfmHUKIFarmEvents.GetData;
begin
   mWarnings.Lines.Clear;
   AddFileHeader;
   AddLeftHerdData;
   AddPurchaseData;
   AddCalvingData;
   AddBreedingData;
   AddPregDiagData;
   AddAbortData;
   AddDryOffData;
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
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.AnimalNo, A.Name, MAX(E.EventDate) EventDate, S.Sold ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E          ON (E.AnimalID = A.ID)      ');
         Sql.Add('LEFT JOIN SalesDeaths S     ON (S.EventID = E.ID)       ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')     ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.AnimalNo, A.Name, S.Sold ');
         Open;

           if RecordCount > 0 then
              begin
               First;
               while not eof do
                  begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if CheckValidAnimalNo(AnimalNo) then
                        begin
                           if bWriteHeader then
                              begin
                                 bWriteHeader := False;
                                 DataList.Add('C:Left herd data block');
                                 DataList.Add('D:cownum\4,barnname\20,LHDAT\8,lhreason\2;');
                              end;

                        AnimalNo   := PadLeft( AnimalNo, '0', 4 );
                        AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                        if HerdPrefix <> '' then
                           begin
                              if Pos(HerdPrefix,AnimalName)>0 then
                                 begin
                                     System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                     AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                                 end;
                           end;
                        EventDate  := FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime);
                        if not GenQuery.FieldByName('Sold').AsBoolean then  // dead
                           lhReason := '01'
                        else
                           lhReason := '14'; // sold
                        DataList.Add(AnimalNo+AnimalName+EventDate+lhReason);
                        end;
                     Next;
                  end;
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
   deStartDate.PostEditValue;
   GetData;
end;

procedure TfmHUKIFarmEvents.AddPurchaseData;
var
   ehCode, DOB, CalveDate, PedBreed : String;
   bWriteHeader : Boolean;
   
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.LactNo, A.DateOfBirth, A.Name, Max(E.EventDate) EventDate, ');
         Sql.Add('     E.AnimalLactNo, B.PedigreeBreed, C.Eventdate       ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         Sql.Add('LEFT JOIN Events C        ON (C.AnimalID = A.ID)        ');
         Sql.Add('LEFT JOIN Purchases P     ON (P.EventID = E.ID)         ');
         Sql.Add('LEFT JOIN Breeds B        ON (B.ID = A.PrimaryBreed)    ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (A.InHerd=True)                            ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CPurchaseEvent)+')      ');
         Sql.Add('AND   (C.EventType = '+IntToStr(CCalvingEvent)+')      ');
         Sql.Add('AND   (C.AnimalLactNo = A.LactNo)      ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.ID, A.AnimalNo, A.NatIDNum, A.LactNo, A.DateOfBirth, A.Name, ');
         Sql.Add('     E.AnimalLactNo, B.PedigreeBreed,C.Eventdate  ');
         Open;

           if RecordCount > 0 then
              begin

               First;

               while not eof do
                  begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if CheckValidAnimalNo(AnimalNo) then
                        begin
                           if bWriteHeader then
                              begin
                                 bWriteHeader := False;
                                 DataList.Add('C:Purchased cows data block');
                                 DataList.Add('D:cownum\4,eartag\12,birthdt\8,purchdt\8,ehcode\1,Lactno/2,CLVDAT/8,NMRBrd/2;');
                              end;

                           AnimalNo   :=   PadLeft( AnimalNo, '0', 4 );

                           // 04/02/2009 [Dev 3.9 5.9] /SP
                           AnimalNatIDNum := StripAllNomNumAlpha( GenQuery.FieldByName('NatIDNum').AsString );
                           StripCountryIdFromTag(AnimalNatIDNum);
                           AnimalNatIDNum := Copy(AnimalNatIDNum,1,12);
                           AnimalNatIDNum := PadRight(AnimalNatIDNum  ,' ',12);

                           EventDate  := PadLeft( FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8 );
                           AnimalLactNo := PadLeft( GenQuery.FieldByName('AnimalLactNo').AsString, '0', 2 );
                           DOB := PadLeft( FormatDateTime('yyyymmdd',GenQuery.FieldByName('DateOfBirth').AsDateTime), ' ', 8 );
                           CalveDate := PadLeft( FormatDateTime('yyyymmdd',GenQuery.FieldByName('Eventdate').AsDateTime), ' ', 8);
                           PedBreed := PadRight( GenQuery.FieldByName('PedigreeBreed').AsString, ' ', 2 );

                           { ehCode D Dry / M In Milk / Y Young Stock }
                           if GenQuery.FieldByName('AnimalLactNo').AsInteger = 0 then
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


end;

function TfmHUKIFarmEvents.CheckMilkState(AID,
  LactNo: Integer): TMilkState;
var
   dryExists : Boolean;
begin
   dryExists := False;
   TempEvents.Filter := 'AnimalID = '+IntToStr( AID ) + ' and AnimalLactNo = '+ IntToStr( LactNo ) ;
   TempEvents.Filtered := True;

   try
      if TempEvents.FindFirst then
         begin
            repeat
               dryExists := TempEvents.FieldByName('eventtype').AsInteger = CDryOffEvent;
            until
               ( TempEvents.FindNext <> false ) or ( dryExists );
         end;
      if dryExists then
         result := msMilking
      else
         result := msDry;
   finally
      TempEvents.Filter := '' ;
      TempEvents.Filtered := False;
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
   if LastMilkRecording >0 then
      begin
         deMilkRecordingDate.Date := LastMilkRecording;
         deStartDate.Date := LastMilkRecording - 5;
      end
   else
      deStartDate.Date := incMonth(Date, -1); // revert ot one month ago.
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


   tmpCalfName : String;
   DOB, clfEase, clfBrd,
   clf1Sex, clf1ID, clf1Name, clf1Tag, clf1VID,
   clf2Sex, clf2ID, clf2Name, clf2Tag, clf2VID : String;

begin
   CalvingQuery := TQuery.Create(nil);
   CalvingQuery.DatabaseName := AliasName;
   CalvingQuery.SQL.Text := 'Select C.ID1, C.ID2, G.LookupCode From Calvings C Left Join GenLook G on (G.ID=C.BirthType) Where EventID = :EID ';

   CalveQuery := TQuery.Create(nil);
   CalveQuery.DatabaseName := AliasName;

   CalveQuery.SQL.Text := 'Select A.Sex, A.AnimalNo, A.Name, A.NatIDNum, B.PedigreeBreed, A.Inherd '+
                          'From Animals A '+
                          'Left Join Breeds B On (B.ID=A.PrimaryBreed) '+
                          'Where A.ID = :AID ';

   bWriteHeader := True;
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.DateOfBirth, A.Name, Max(E.EventDate) EventDate , ');
         Sql.Add('     E.AnimalLactNo, E.ID EventID, B.PedigreeBreed              ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         Sql.Add('LEFT JOIN Breeds B        ON (B.ID = A.PrimaryBreed)    ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.Sex="Female")                            ');
         Sql.Add('AND   (A.InHerd=True)                            ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+') ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.ID, A.AnimalNo, A.NatIDNum, A.DateOfBirth, A.Name,  ');
         Sql.Add('     E.AnimalLactNo, E.ID, B.PedigreeBreed              ');
         Open;

         if recordcount > 0 then
            begin

               First;

         while not eof do
            begin
               AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
               if CheckValidAnimalNo(AnimalNo) then
                  begin
                     if bWriteHeader then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Calving data block');
                           DataList.Add('D:cownum\4,eartag\12,birthdt\8,CLVDAT\8,clf1sex\1,clf1id\4,clf1name\20,clf1tag\12,clf1vid\4,clf1ease\1,clf2sex\1,clf2id\4,clf2name\20,clf2tag\12,clf2vid\4,clf2ease\1,calfbrd\2;');
                        end;

                      clf1Sex := '';
                      clf1ID  := '';
                      clf1Name := '';
                      clf1Tag := '';
                      clf1VID := '';

                      clf2Sex := '';
                      clf2ID  := '';
                      clf2Name := '';
                      clf2Tag := '';
                      clf2VID := '';


                      // 04/02/2009 [Dev 3.9 5.9] /SP
                     AnimalNo :=  PadLeft( AnimalNo, '0', 4 );
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

                     clfEase := PadLeft(CalvingQuery.FieldByName( 'LookupCode').AsString, '0', 1);
                     if ( CalvingQuery.FieldByName('ID1').AsInteger > 0 ) then
                        begin
                           with CalveQuery do
                              begin
                                 Close;
                                 Params[0].AsInteger := CalvingQuery.FieldByName('ID1').AsInteger;
                                 Open;

                                 First;
                                 if CalveQuery.FieldByName('Sex').AsString <> cSex_Female then
                                    clf1Sex := '1'
                                 else
                                    clf1Sex := '2';
                                 if CalveQuery.FieldByName('Inherd').AsBoolean then
                                    clf1ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 4 )
                                 else
                                    clf1ID := PadLeft( clf1ID, ' ', 4);

                                 if HerdPrefix <> '' then
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


                                 if CalveQuery.FieldByName('Inherd').AsBoolean then
                                    clf1Tag := StripAllNomNumAlpha( CalveQuery.FieldByName('NatIDNum').AsString )
                                 else
                                    clf1Tag := '';
                                 // 04/02/2009 [Dev 3.9 5.9] /SP
                                 StripCountryIdFromTag( clf1Tag );
                                 clf1Tag := Copy(clf1Tag,1,12);
                                 clf1Tag := PadRight(clf1Tag,' ',12);
                                 clf1VID := clf1ID;
                                 clfBrd := PadRight( CalveQuery.FieldByName('PedigreeBreed').AsString, ' ', 2 );
                              end;
                        end
                     else
                        begin
                           clf1Sex := PadRight( clf1Sex, ' ', 1);
                           clf1ID  := PadRight( clf1ID, ' ', 4);
                           clf1Name := PadRight( clf1Name, ' ', 20);
                           clf1Tag := PadRight( clf1Tag, ' ', 12);
                           clf1VID := PadRight( clf1VID, ' ', 4);
                        end;

                     if ( CalvingQuery.FieldByName('ID2').AsInteger > 0 ) then
                        begin
                           with CalveQuery do
                              begin
                                 Close;
                                 Params[0].AsInteger := CalvingQuery.FieldByName('ID2').AsInteger;

                                 Open;

                                 First;
                                 if CalveQuery.FieldByName('Sex').AsString <> cSex_Female then
                                    clf2Sex := '1'
                                 else
                                    clf2Sex := '2';

                                 if CalveQuery.FieldByName('Inherd').AsBoolean then
                                    clf2ID := PadLeft( Copy(CalveQuery.FieldByName('AnimalNo').AsString,1,4), '0', 4 )
                                 else
                                    clf2ID := PadLeft( clf2ID, ' ', 4);

                                 if HerdPrefix <> '' then
                                    begin
                                       tmpCalfName := CalveQuery.FieldByName('Name').AsString;
                                       if Pos(HerdPrefix,tmpCalfName)>0 then
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

                                 if CalveQuery.FieldByName('Inherd').AsBoolean then
                                    clf2Tag := StripAllNomNumAlpha( CalveQuery.FieldByName('NatIDNum').AsString )
                                 else
                                    clf2Tag := '';
                                 // 04/02/2009 [Dev 3.9 5.9] /SP
                                 StripCountryIdFromTag( clf2Tag );
                                 clf2Tag := Copy(clf2Tag,1,12);
                                 clf2Tag := PadRight(clf2Tag,' ',12);
                                 clf2VID := clf2ID;
                              end;
                        end
                     else
                        begin
                           clf2Sex := PadRight( clf2Sex, ' ', 1);
                           clf2ID  := PadRight( clf2ID, ' ', 4);
                           clf2Name := PadRight( clf2Name, ' ', 20);
                           clf2Tag := PadRight( clf2Tag, ' ', 12);
                           clf2VID := PadRight( clf2VID, ' ', 4);
                        end;
                     DataList.Add(AnimalNo+AnimalNatIDNum+DOB+EventDate+clf1Sex+clf1ID+clf1Name+clf1Tag+clf1VID+clfEase+clf2Sex+clf2ID+clf2Name+clf2Tag+clf2VID+' '+clfBrd);
                  end;
               Next;
            end;
           end;
//       clfEase := ' ';
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
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.Name, A.LactNo, SA.AnimalNo BullAnimalNo, SA.UKAISireCode, ');
         Sql.Add(' SA.HerdBookNo BullHerdBookNo, SA.NatIDNum BullNatIDNum, SA.Name BullName, G.Description, Max(E.EventDate) EventDate , ');
         Sql.Add('     E.AnimalLactNo, SB.PedigreeBreed BullBreed ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         Sql.Add('LEFT JOIN Services S     ON (S.EventID = E.ID)          ');
         Sql.Add('LEFT JOIN Animals SA ON (SA.ID = S.ServiceBull)          ');
         Sql.Add('LEFT JOIN Breeds SB     ON (SB.ID = SA.PrimaryBreed)    ');
         Sql.Add('LEFT JOIN GenLook G     ON (G.ID = S.Technician)        ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (A.InHerd=True)                            ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')      ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.ID, A.AnimalNo, A.Name, A.LactNo, SA.AnimalNo , SA.UKAISireCode, ');
         Sql.Add(' SA.HerdBookNo , SA.NatIDNum , SA.Name, G.Description, ');
         Sql.Add('     E.AnimalLactNo, SB.PedigreeBreed  ');

         Open;

         if recordcount > 0 then
            begin

               First;

               while not eof do
                  begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if CheckValidAnimalNo(AnimalNo) then
                        begin
                           if bWriteHeader then
                              begin
                                 bWriteHeader := False;
                                 DataList.Add('C:Breeding data block');
                                 DataList.Add('D:cownum\4,barnname\20,SRVDAT\8,breed\2,SRVSIRE\10,HBN\12,SRVTECH\4,tbrd\2;');
                              end;

                           AnimalNo :=  PadLeft( AnimalNo, '0', 4 );
                           AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                           if HerdPrefix <> '' then
                              begin
                                 if Pos(HerdPrefix,AnimalName)>0 then
                                    begin
                                        System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                        AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                                    end;
                               end;
                           EventDate  := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8);
                           BullBreed := PadLeft( GenQuery.FieldByName('BullBreed').AsString ,' ',2);

                           // 04/02/2009 [Dev 3.9 5.9] /SP Program Bug - Copy first [12] hars of NatIDNum after NatIDNum is stripped of all non alpha chars
                           BullNatID := StripAllNomNumAlpha( GenQuery.FieldByName('BullNatIDNum').AsString );
                           StripCountryIdFromTag( BullNatID );
                           BullNatID := Copy(BullNatID,1,12);
                           BullNatID := PadRight(BullNatID,' ',12);

                           UKBullAICode := GenQuery.FieldByName('UKAISireCode').AsString;
                           if UKBullAICode <> '' then
                              BullAnimalNo := PadRight(UKBullAICode,' ',10)
                           else
                              BullAnimalNo := PadRight( GenQuery.FieldByName('BullAnimalNo').AsString ,' ',10);

                           BullName  :=  PadRight( Copy(GenQuery.FieldByName('BullName').AsString,1, 12) ,' ',12);

                           if not CheckValidAICode(BullAnimalNo) then
                              begin
                                 if BullList.IndexOf(BullAnimalNo) = -1 then
                                    begin
                                        BullList.Add(BullAnimalNo);
                                        mWarnings.Lines.Add(Trim(BullAnimalNo) + ' - not a recognised AI Code');
                                        //ShowMessage( BullAnimalNo + ' is not a recognised AI Code');
                                    end;
                              end;

                           BullHerdBookNo := StripAllNomNumAlpha( GenQuery.FieldByName('BullHerdBookNo').AsString);
                           if Length(GenQuery.FieldByName('BullHerdBookNo').AsString) > 12 then
                              begin
                                 if BullHBNList.IndexOf(BullHerdBookNo) = -1 then
                                    begin
                                       BullHBNList.Add(BullHerdBookNo);
                                       mWarnings.Lines.Add(Trim(BullHerdBookNo) + ' - Herdbook No. has been truncated.');
                                    end;
                                 BullHerdBookNo := Copy(BullHerdBookNo, Length(BullHerdBookNo)-11, MaxInt);
                              end;
                           BullHerdBookNo := PadRight(BullHerdBookNo,' ',12);

                           if Trim(BullHerdBookNo) = '' then
                              begin
                                 BullHerdBookNo := BullNatID; // use natid where herdbookno is blank
                                 if Trim(BullHerdBookNo) <> '' then
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
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.AnimalNo, A.Name, Max(E.EventDate) EventDate, P.PregnancyStatus ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         Sql.Add('LEFT JOIN PregnancyDiag P ON (P.EventID = E.ID)         ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (A.InHerd=True)                            ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CPregDiagEvent)+')      ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.AnimalNo, A.Name, P.PregnancyStatus');
         Open;

         if recordcount > 0 then
            begin

               First;
         while not eof do
            begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if CheckValidAnimalNo(AnimalNo) then
                  begin
                     if bWriteHeader then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Pregnancy data block');
                           DataList.Add('D:cownum\4,barnname\20,PRGDAT\8,PRGDIAG\1;');
                        end;

                     AnimalNo   :=  PadLeft( AnimalNo, '0', 4 );
                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if HerdPrefix <> '' then
                        begin
                           if Pos(HerdPrefix,AnimalName)>0 then
                              begin
                                  System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                  AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);                              end;
                         end;
                     EventDate  := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ', 8);
                     if GenQuery.FieldByName('PregnancyStatus').AsBoolean then
                        PDResult := '7' // Pregnant
                     else if GenQuery.FieldByName('PregnancyStatus').AsBoolean = False then
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
end;

procedure TfmHUKIFarmEvents.AddAbortData;
var
   bWriteHeader : Boolean;
begin
   bWriteHeader := True;
   with GenQuery do
      begin
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.AnimalNo, A.Name, Max(E.EventDate) EventDate ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (A.InHerd=True)                            ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CAbortionEvent)+')      ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.AnimalNo, A.Name ');
         Open;

         if recordcount > 0 then
         begin

            First;

         while not eof do
            begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if CheckValidAnimalNo(AnimalNo) then
                   begin
                       if bWriteHeader then
                          begin
                             bWriteHeader := False;
                             DataList.Add('C:Abort data block');
                             DataList.Add('D:cownum\4,barnname\20,abrtdt\8;');
                          end;
                     AnimalNo   :=  PadLeft( AnimalNo, '0', 4 );
                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if HerdPrefix <> '' then
                        begin
                           if Pos(HerdPrefix,AnimalName)>0 then
                              begin
                                  System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                  AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);                              end;
                        end;
                     EventDate  := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ',8);
                     DataList.Add(AnimalNo+AnimalName+EventDate);
                  end;
               Next;
            end;
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
         Sql.Clear;
         Sql.Add('SELECT DISTINCT A.AnimalNo, A.Name,  Max(E.EventDate) EventDate ');
         Sql.Add('FROM Animals A                                          ');
         Sql.Add('LEFT JOIN Events E        ON (E.AnimalID = A.ID)        ');
         Sql.Add('WHERE (A.AnimalNo IS NOT NULL)                          ');
         Sql.Add('AND   (A.AnimalDeleted=False)                           ');
         Sql.Add('AND   (A.HerdID='+IntToStr(HerdIdentity)+')             ');
         Sql.Add('AND   (A.InHerd=True)                            ');
         Sql.Add('AND   (E.EventType = '+IntToStr(CDryOffEvent)+')      ');
         Sql.Add('AND   (E.EventDate >= '''+FormatDateTime(cUSDateStyle,deStartDate.Date)+''')');
         Sql.Add('GROUP BY A.AnimalNo, A.Name ');
         Open;

         if recordcount > 0 then
            begin
               First;

         while not eof do
            begin
                     AnimalNo := GenQuery.FieldByName('AnimalNo').AsString;
                     if CheckValidAnimalNo(AnimalNo) then
                  begin
                     if bWriteHeader then
                        begin
                           bWriteHeader := False;
                           DataList.Add('C:Dry cows data block');
                           DataList.Add('D:cownum\4,barnname\20,DRYDAT\8;');
                        end;

                     AnimalNo   :=  PadLeft( AnimalNo, '0', 4 );
                     AnimalName := Copy(PadRight(Trim( GenQuery.FieldByName('Name').AsString ),' ',20),1,20);
                     if HerdPrefix <> '' then
                        begin
                           if Pos(HerdPrefix,AnimalName)>0 then
                              begin
                                  System.Delete(AnimalName,Pos(HerdPrefix,AnimalName), Length(HerdPrefix));
                                  AnimalName := PadRight(TrimLeft(AnimalName), ' ', 20);
                              end;
                        end;
                     EventDate  := PadLeft(FormatDateTime('yyyymmdd',GenQuery.FieldByName('EventDate').AsDateTime), ' ',8);
                     DataList.Add(AnimalNo+AnimalName+EventDate);
                  end;

               Next;
                  end;
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
   if ( Copy(ATag, 1, 2) = 'UK' ) or ( Copy(ATag, 1, 2) = 'IE' ) then
      Delete(ATag, 1, 2);
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
begin
   Result := False;
   if (Length(AAnimalNo) in [1..4]) then
      Result := True
   else
      begin
         // Check if animal renumbered, if it has been restore the animalno
         // back to its orginal value
         if Pos('/', AAnimalNo) > 0 then
            begin
               AAnimalNo := Copy(AAnimalNo, 1, Pos('/', AAnimalNo)-1);
               if (Length(AAnimalNo) in [1..4]) then
                  Result := True;
            end
         else if Pos('(', AAnimalNo) > 0 then
            begin
               AAnimalNo := Copy(AAnimalNo, 1, Pos('(', AAnimalNo)-1);
               if (Length(AAnimalNo) in [1..4]) then
                  Result := True;
            end;
      end;

end;

procedure TfmHUKIFarmEvents.cxButton2Click(Sender: TObject);
begin
   Close;
end;

end.
