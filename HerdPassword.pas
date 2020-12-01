{
   28/03/13 [V5.1 R5.4] /MK Additional Feature - Added new TPasswordAction for BullsInUse - call WinData.ClearAllBullsInUse.

   11/05/15 [V5.4 R5.6] /MK Additional Feature - Added new TPasswordAction for UpdateCustomerSupplierNames.

   26/01/16 [V5.5 R2.3] /MK Additional Feature - Added new TPasswordAction for UpdateEventsLactNo.
                                               - Added new TPasswordAction for paClearSoldAnimalTransponders.

   18/03/16 [V5.5 R4.4] /MK Additional Feature - Added new TPasswordAction/Procedure for FixAnimalLactNos.

   16/02/17 [V5.6 R4.5] /MK Additional Feature - Added new TPasswordAction/Procedure for FixHerdDesignator.

   06/03/17 [V5.6 R6.5] /MK Additional Feature - Added new TPasswordAction for paDeleteSelectedAnimal.

   17/08/17 [V5.7 R2.0] /MK Additional Feature - Added new TPasswordAction for paDeleteAllMedicinesNeverUsed.

   03/10/17 [V5.7 R3.5] /MK Change - Increase RelinkCalvesToDams to 12 months - GL request.

   09/04/18 [V5.7 R8.7] /MK Additional Feature - New utility added to allow the comments of service events to be updated
                                                 by the count of services in the current lactation and the event date.

   15/10/18 [V5.8 R3.1] /MK Additional Feature - Added new TPasswordAction for paClearDiseaseTestDates.

   03/03/20 [V5.9 R2.7] /MK Additional Feature - Added new TPasswordAction for paResetBullsInUse which takes bulls from current services,
                                                 from sires of calves in the last year and any planned bull events.
}

unit HerdPassword;

interface

uses
   Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
   Buttons, uChangeCustomerSupplierNames, db, dbTables, uSPParser,
   KRoutines, uMedicineClearUp, uProgressIndicator, uDataBackup,
   uClearDiseaseTestDate, DateUtil, uMessageScr;

type
  TPasswordAction = ( CalvingEvents, BeefPremiums, SlaughterPremiums, HerdEntry, BullsInUse,
                      UpdateCustomerSupplierNames, UpdateEventsLactNo, paClearSoldAnimalTransponders,
                      paFixAnimalLactNos, paFixHerdDesignator, paDeleteSelectedAnimal,
                      paDeleteAllMedicinesNeverUsed, paFixDuplicateMedicines,
                      paUpdateServiceComment, paClearDiseaseTestDates,
                      paResetBullsInUse); { Herdentry moved to uSetupUsers.pas}

  TfHerdPassword = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    PassAttempts : Byte;
    PasswordAction : TPasswordAction;
    procedure UpdateEvents;
    procedure ClearSoldAnimalTransponders;
    procedure FixAnimalLactNos;
    procedure FixIETagHerdDesignator;
    procedure DeleteAllMedicinesNeverUsed;
    procedure FixDuplicateMedicines;
    procedure UpdateServiceComment;
    procedure ClearDiseaseTestDates;
    procedure ResetBullsInUse;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure CreateAndShow(PasswdAction : TPasswordAction);

var
  fHerdPassword: TfHerdPassword;

implementation
uses
    Dialogs,
    DairyData,
    GenTypesConst;

{$R *.DFM}
   procedure CreateAndShow(PasswdAction : TPasswordAction);
   begin
      try
         try
            Application.CreateForm(TfHerdPassword, fHerdPassword);
            with fHerdPassword do
               begin
                  PasswordAction := PasswdAction;
                  PassAttempts := 0;
                  ShowModal;
               end;
         except
            ErrorMsg.Create(cFormCreateError);
         end;

      finally
         with fHerdPassword do
            Free;
      end;

end;

procedure TfHerdPassword.OKBtnClick(Sender: TObject);
begin
   if ( PasswordAction = HerdEntry ) then
      begin
         if Password.Text <> WinData.HerdDBPassword then
            begin
               Inc(PassAttempts);
               if PassAttempts = 3 then
                  begin
                     MessageDlg('Invalid password entered, program will now shut!', mtError, [mbOK],0);
                     Halt(1);
                  end
               else
                  raise Exception.Create('Invalid password entered, please try again');
            end
         else
            Close
      end
   else
      begin
          if UPPERCASE(Password.Text) = cPassword then
             begin
                OKBtn.SetFocus;
                case PasswordAction of
                   //   09/02/13 [V5.1 R4.1] /MK Change - Run RelinkCalvesToDams here for 3 months.
                   //   03/10/17 [V5.7 R3.5] /MK Change - Increase RelinkCalvesToDams to 12 months - GL request.
                   CalvingEvents     : //WinData.ReLinkCalvesToDams(True,cCheckCalvesForThreeMonth);
                                       WinData.CheckForRelinkCalvesToDams(cCheckCalvesForTwoFourMonths);

                   BeefPremiums      : begin
                                          WinData.KingData.Close;
                                          if (WinData.CheckPremiumEligibility) then
                                             begin
                                                WinData.OpenAndCheckTables;
                                                MessageDLG('Beef Premium Eligibility Date ReCalculated',mtInformation,[mbOK],0)
                                             end
                                          else
                                             begin
                                                WinData.OpenAndCheckTables;
                                                MessageDLG('Beef Premium Eligibility Date ReCalculation FAILED',mtInformation,[mbOK],0);
                                             end;
                                       end;
                   SlaughterPremiums : begin
                                          WinData.KingData.Close;
                                          if (WinData.CheckSlaughterEligibility) then
                                             begin
                                                WinData.OpenAndCheckTables;
                                                MessageDLG('Slaughter Premium Eligibility ReCalculated',mtInformation,[mbOK],0)
                                             end
                                          else
                                             begin
                                                WinData.OpenAndCheckTables;
                                                MessageDLG('Slaughter Premium Eligibility ReCalculation FAILED',mtInformation,[mbOK],0);
                                             end;
                                       end;
                   BullsInUse        : WinData.ClearAllBullsInUse;
                   UpdateCustomerSupplierNames : TfmChangeCustomerSupplierNames.ShowForm;
                   UpdateEventsLactNo : UpdateEvents;
                   paClearSoldAnimalTransponders : ClearSoldAnimalTransponders;
                   paFixAnimalLactNos : FixAnimalLactNos;
                   paFixHerdDesignator : FixIETagHerdDesignator;
                   paDeleteSelectedAnimal : WinData.DeleteSelectedAnimalOnMainGrid := True;
                   paDeleteAllMedicinesNeverUsed : DeleteAllMedicinesNeverUsed;
                   paFixDuplicateMedicines : FixDuplicateMedicines;
                   paUpdateServiceComment : UpdateServiceComment;
                   paClearDiseaseTestDates : ClearDiseaseTestDates;
                   paResetBullsInUse : ResetBullsInUse;
                end;
                Close;
             end
          else
             begin
                ShowMessage('Wrong Password entered');
                Password.Clear;
                Password.SetFocus;
             end;
      end;
end;

procedure TfHerdPassword.CancelBtnClick(Sender: TObject);
begin
   if PasswordAction = HerdEntry then
      begin
         Application.Terminate;
         Application.ProcessMessages;
      end;

end;

// This procedure will move all events based on their eventdates into their appropriate lactation number
// based on the calving lactation that occurred after the event date.
procedure TfHerdPassword.UpdateEvents;
var
   qAnimals,
   qCalvings,
   qEvents,
   qUpdateEvents : TQuery;
   i,
   iAnimalID,
   iCalvingLactNo,
   iCalvingEventID : Integer;
   iCalvingDate : TDateTime;
   slEventsToChange : TStringList;
   sEvent,
   sEventID,
   sNewEventLactNo : String;
   Parser : TSPParser;

   function DryOffAlreadyExists ( AAnimalID, AAnimalLactNo : Integer ) : Boolean;
   begin
      Result := False;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM Events');
            SQL.Add('WHERE AnimalID = :AAnimalID');
            SQL.Add('AND   AnimalLactNo = :AAnimalLactNo');
            SQL.Add('AND   EventType = 4');
            Params[0].AsInteger := AAnimalID;
            Params[1].AsInteger := AAnimalLactNo;
            try
               Open;
               Result := ( RecordCount > 0 );
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   Screen.Cursor := crHourGlass;
   qAnimals := TQuery.Create(nil);
   qCalvings := TQuery.Create(nil);
   qEvents := TQuery.Create(nil);

   slEventsToChange := TStringList.Create;

   Parser := TSPParser.Create(nil);
   Parser.Sepchar := ',';

   with qAnimals do
      try
          // Get all cows in the herd.
          DatabaseName := AliasName;
          SQL.Clear;
          SQL.Add('SELECT ID');
          SQL.Add('FROM Animals');
          SQL.Add('WHERE (InHerd = TRUE)');
          SQL.Add('AND   (AnimalDeleted = FALSE)');
          SQL.Add('AND   (HerdID IN (SELECT DefaultHerdID FROM Defaults))');
          SQL.Add('AND   (LactNo > 0)');
          SQL.Add('AND   (Upper(Sex)="FEMALE")');
          try
             Open;
             First;
             while ( not(Eof) ) do
                begin
                   iAnimalID := 0;
                   iAnimalID := Fields[0].AsInteger;

                   // For each cow get their calving event id, date and lactation number.
                   with qCalvings do
                      try
                         DatabaseName := AliasName;
                         SQL.Clear;
                         SQL.Add('SELECT ID, AnimalLactNo, EventDate');
                         SQL.Add('FROM Events');
                         SQL.Add('WHERE (EventType = 5)');
                         SQL.Add('AND   (AnimalID = '+IntToStr(iAnimalID)+')');
                         try
                            iCalvingLactNo := 0;
                            iCalvingEventID := 0;
                            iCalvingDate := 0;

                            Open;
                            First;
                            while ( not(Eof) ) do
                               begin
                                  iCalvingEventID := Fields[0].AsInteger;
                                  iCalvingLactNo := Fields[1].AsInteger;
                                  iCalvingDate := Fields[2].AsDateTime;

                                  // For each calving of the cow find what events occurred before the calving event but have the same eventlactno as the calving event.
                                  // These events should have an eventlactno less than the calving eventlactno. 
                                  with qEvents do
                                     try
                                        DatabaseName := AliasName;
                                        SQL.Clear;
                                        SQL.Add('SELECT ID, EventType, EventDate');
                                        SQL.Add('FROM Events');
                                        SQL.Add('WHERE (EventDate < "'+FormatDateTime(cUSDateStyle,iCalvingDate)+'")');
                                        SQL.Add('AND   (AnimalID = '+IntToStr(iAnimalID)+')');
                                        SQL.Add('AND   (AnimalLactNo = '+IntToStr(iCalvingLactNo)+')');
                                        try
                                           Open;
                                           First;
                                           while ( not(Eof) ) do
                                              begin
                                                 // Add these events to string list containing the eventid, the eventlactno before the calving and the animal id.
                                                 if ( Fields[1].AsInteger = 4 ) then
                                                    begin
                                                       if ( not(DryOffAlreadyExists(iAnimalID,iCalvingLactNo-1)) ) then
                                                          slEventsToChange.Add(IntToStr(Fields[0].AsInteger)+','+IntToStr(iCalvingLactNo-1)+','+IntToStr(iAnimalID)+','+IntToStr(Fields[1].AsInteger));
                                                    end
                                                 else
                                                    slEventsToChange.Add(IntToStr(Fields[0].AsInteger)+','+IntToStr(iCalvingLactNo-1)+','+IntToStr(iAnimalID)+','+IntToStr(Fields[1].AsInteger));
                                                 Next;
                                              end;
                                        except
                                           on e : Exception do
                                              ShowMessage(e.Message);
                                        end;
                                     finally
                                     end;
                                  Next;
                               end;
                         except
                            on e : Exception do
                               ShowMessage(e.Message);
                         end;
                      finally
                      end;

                   Next;
                end;
          except
             on e : Exception do
                ShowMessage(e.Message);
          end;

          // Run an sql to update the eventlactno of the event before the calving to the lactno of the cow before the calving.
          if ( slEventsToChange.Count > 0 ) then
             begin
                qUpdateEvents := TQuery.Create(nil);
                qUpdateEvents.DatabaseName := AliasName;
                for i := 0 to slEventsToChange.Count-1 do
                   begin
                      sEvent := slEventsToChange[i];
                      Parser.Parse(sEvent);
                      sNewEventLactNo := '';
                      sEventID := '';
                      sEventID := Parser.Fields[1];
                      sNewEventLactNo := Parser.Fields[2];
                      with qUpdateEvents do
                         begin
                            SQL.Clear;
                            SQL.Add('UPDATE Events');
                            SQL.Add('SET AnimalLactNo = '+sNewEventLactNo+',');
                            SQL.Add('    IsSynchronized = FALSE,');
                            SQL.Add('    EventSource = '+IntToStr(sEVENTLACTNOUTILITY));
                            SQL.Add('WHERE ID = '+sEventID+'');
                            try
                               ExecSQL;
                            except
                               on e : Exception do
                                  ShowMessage(e.Message);
                            end;
                         end;
                   end;

                Screen.Cursor := crDefault;
                MessageDlg('Update Complete',mtInformation,[mbOK],0);
                FreeAndNil(qUpdateEvents);
             end;

      finally
      end;

   FreeAndNil(qAnimals);
   FreeAndNil(qCalvings);
   FreeAndNil(qEvents);
end;

// This procedure will clear off the transponder numbers for sold animals.
procedure TfHerdPassword.ClearSoldAnimalTransponders;
begin
   Screen.Cursor := crHourGlass;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ID)');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE (TransponderNo IS NOT NULL)');
         SQL.Add('AND   (HerdID IN (SELECT DefaultHerdID FROM Defaults))');
         SQL.Add('AND   (InHerd = FALSE)');
         SQL.Add('AND   (AnimalDeleted = FALSE)');
         SQL.Add('AND   (ID IN (SELECT AnimalID');
         SQL.Add('              FROM Events');
         SQL.Add('              WHERE EventType = :SaleEvent))');
         Params[0].AsInteger := CSaleDeathEvent;
         try
            Open;
            if ( Fields[0].AsInteger = 0 ) then
               begin
                  MessageDlg('No animals to update.',mtError,[mbOK],0);
                  Exit;
               end
            else
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE Animals');
                  SQL.Add('SET TransponderNo = NULL');
                  SQL.Add('WHERE ID IN (SELECT ID');
                  SQL.Add('             FROM Animals');
                  SQL.Add('             WHERE (TransponderNo IS NOT NULL)');
                  SQL.Add('             AND   (HerdID IN (SELECT DefaultHerdID FROM Defaults))');
                  SQL.Add('             AND   (InHerd = FALSE)');
                  SQL.Add('             AND   (AnimalDeleted = FALSE)');
                  SQL.Add('             AND   (ID IN (SELECT AnimalID');
                  SQL.Add('                           FROM Events');
                  SQL.Add('                           WHERE EventType = '+IntToStr(CSaleDeathEvent)+')))');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
         MessageDlg('Update complete.',mtInformation,[mbOK],0);
         Screen.Cursor := crDefault;
      end;
end;

procedure TfHerdPassword.FixAnimalLactNos;
var
   iaAnimalArray : array of Integer;
   i,
   iLactNo,
   iCorrectLactNo,
   iEventToUpdate : Integer;
   slAnimalLacts : TStringList;
   sLine : String;
   Parser : TSPParser;
   qUpdateEvents : TQuery;
begin
   Screen.Cursor := crHourGlass;
   qUpdateEvents := TQuery.Create(nil);
   with qUpdateEvents do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, LactNo, AnimalNo, NatIDNum');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE Upper(Sex) = "FEMALE"');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            First;
            slAnimalLacts := TStringList.Create();
            while ( not(Eof) ) do
               begin
                  slAnimalLacts.Add(IntToStr(Fields[0].AsInteger)+','+IntToStr(Fields[1].AsInteger)+','+
                                             Fields[2].AsString+','+Fields[3].AsString);
                  Next;
               end;
            Close;
            if ( slAnimalLacts.Count = 0 ) then Exit;
            Parser := TSPParser.Create(nil);
            Parser.SepChar := ',';
            for i := 0 to slAnimalLacts.Count-1 do
               begin
                  sLine := slAnimalLacts.Strings[i];
                  Parser.Parse(sLine);
                  SQL.Clear;
                  SQL.Add('SELECT ID, EventDate, AnimalLactNo');
                  SQL.Add('FROM Events');
                  SQL.Add('WHERE AnimalID = '+Parser.Fields[1]+'');
                  SQL.Add('AND EventType = 5');
                  SQL.Add('ORDER BY EventDate DESC');
                  Open;
                  iLactNo := 0;
                  iCorrectLactNo := 0;
                  iEventToUpdate := 0;
                  if ( RecordCount > 0 ) then
                     begin
                        First;
                        while ( not(Eof) ) do
                           begin
                              if ( RecNo = 1 ) then
                                 begin
                                    iEventToUpdate := Fields[0].AsInteger;
                                    iLactNo := Fields[2].AsInteger;
                                 end
                              else if ( RecNo = 2 ) and ( Fields[2].AsInteger >= iLactNo ) then
                                 iCorrectLactNo := Fields[2].AsInteger+1
                              else
                                  Break;
                              Next;
                           end;
                     end;

                  if ( iCorrectLactNo > 0 ) then
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add('UPDATE Events');
                        SQL.Add('SET AnimalLactNo = '+IntToStr(iCorrectLactNo)+'');
                        SQL.Add('WHERE (ID = '+IntToStr(iEventToUpdate)+')');
                        ExecSQL;

                        SQL.Clear;
                        SQL.Add('UPDATE Animals');
                        SQL.Add('SET LactNo = '+IntToStr(iCorrectLactNo)+'');
                        SQL.Add('WHERE (ID = '+Parser.Fields[1]+')');
                        SQL.Add('AND   (LactNo <= '+IntToStr(iCorrectLactNo)+')');
                        ExecSQL;
                     end;
               end;

         SQL.Clear;
         SQL.Add('UPDATE Animals A');
         SQL.Add('SET A.LactNo = (SELECT Max(E.AnimalLactNo)');
         SQL.Add('		  FROM Events E');
         SQL.Add('		  WHERE E.AnimalID = A.ID');
         SQL.Add('		  )');
         SQL.Add('WHERE UPPER(A.Sex) = "FEMALE"');
         SQL.Add('AND A.ID IN (SELECT E.AnimalID');
         SQL.Add('             FROM Events E');
         SQL.Add('             WHERE E.EventType = 5)');
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE Defaults');
         SQL.Add('SET AnimalLactNoFixCompleted = True');
         ExecSQL;

         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

      finally
         Free;
         if ( Parser <> nil ) then
            FreeAndNil(Parser);
         if ( slAnimalLacts <> nil ) then
            FreeAndNil(slAnimalLacts);
         Screen.Cursor := crDefault;
         MessageDlg('Animal lactations updated.',mtInformation,[mbOK],0);
      end;
end;

procedure TfHerdPassword.FixIETagHerdDesignator;
var
   slAnimalsToUpdate : TStringList;
   sOldNatID,
   sNewNatID,
   sSortNatID,
   sLine : String;
   i : Integer;
   Parser : TSPParser;
   qAnimals : TQuery;

   function TagOnlyHasNumericValues ( ATagNumber : String ) : Boolean;
   var
      j : Integer;
   begin
      Result := False;
      if ( Length(ATagNumber) = 0 ) then Exit;
      for j := 1 to Length(ATagNumber) do
         begin
            Result := ATagNumber[j] in ['0'..'9'];
            if ( not(Result) ) then
               Break;
         end;
   end;

   procedure UpdateTagPrefix;
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Owners');
            SQL.Add('SET TagPrefix = "'+cTagPreFix_372+'"');
            SQL.Add('WHERE ID = '+IntToStr(WinData.UserDefaultHerdID)+'');
            ExecSQL;
         finally
            Free;
         end;
   end;

begin
   inherited;
   try
      Screen.Cursor := crHourGlass;
      qAnimals := TQuery.Create(nil);
      with qAnimals do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID, NatIDNum');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE (SearchNatID LIKE "%IE'+WinData.UserDefaultHerdDesignator+'%")');
            try
               Open;
               if ( qAnimals.RecordCount = 0 ) then
                  begin
                     MessageDlg('No animals to update.',mtInformation,[mbOK],0);
                     UpdateTagPrefix;
                     Exit;
                  end;
               qAnimals.First;
               slAnimalsToUpdate := TStringList.Create();
               while ( not(qAnimals.Eof) ) do
                  begin
                     sOldNatID := '';
                     sOldNatID := StripAllSpaces(qAnimals.Fields[1].AsString);
                     sNewNatID := '';
                     sNewNatID := '372' + ' ' + Copy(sOldNatID,3,2) + ' ' + Copy(sOldNatID,5,5) + ' ' + Copy(sOldNatID,10,1) + ' ' + Copy(sOldNatID,11,4);
                     slAnimalsToUpdate.Add(IntToStr(qAnimals.Fields[0].AsInteger)+','+sNewNatID);
                     Next;
                  end;
               Close;
               Parser := TSPParser.Create(nil);
               Parser.SepChar := ',';
               try
                  Update;
                  for i := 0 to slAnimalsToUpdate.Count-1 do
                     begin
                        sLine := '';
                        sLine := slAnimalsToUpdate.Strings[i];
                        Parser.Parse(sLine);
                        sSortNatID := '';
                        sSortNatID := CreateSortNatIDString(StripAllSpaces(Parser.Fields[2]),WinData.UserDefaultHerdID);
                        SQL.Clear;
                        SQL.Add('UPDATE Animals');
                        SQL.Add('SET NatIDNum = "'+Parser.Fields[2]+'",');
                        SQL.Add('    SortNatID = "'+sSortNatID+'",');
                        SQL.Add('    IsSynchronized = FALSE');
                        SQL.Add('WHERE ID = '+Parser.Fields[1]+'');
                        ExecSQL;
                        Update;
                     end;
               finally
                  MessageDlg('Update of animal tag numbers complete.',mtInformation,[mbOK],0);
                  WinData.IETagDesignatorUpdated := True;
                  UpdateTagPrefix;
               end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfHerdPassword.DeleteAllMedicinesNeverUsed;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         Close;
         SQL.Clear;
         SQL.Add('DELETE FROM Medicine');
         if ( Length(GetAllMedicineIDsUsedToArray) > 0 ) then
            SQL.Add('WHERE ID NOT IN '+IntArrayToSQLInString(GetAllMedicineIDsUsedToArray)+'');
         ExecSQL;
      finally
         Free;
      end;
end;

procedure TfHerdPassword.FixDuplicateMedicines;
begin
   FixDuplicateVPANumbers_Names(ftVPA);
   FixDuplicateVPANumbers_Names(ftName);
end;

procedure TfHerdPassword.UpdateServiceComment;
var
   qServices,
   qUpdate : TQuery;
   iAnimalID,
   iServiceCount : Integer;
begin
   if ( MessageDlg('Before using the block utility it is strongly advised that you'+cCRLF+
                   'take a backup in case a mistake is made with updating the service comments.'+cCRLFx2+
                   'Do you want to backup your data now?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
      TfmDataBackup.Execute(daBackup);

   iAnimalID := 0;
   iServiceCount := 1;
   qServices := TQuery.Create(nil);
   qUpdate := TQuery.Create(nil);
   try
      qServices.DatabaseName := AliasName;
      qServices.SQL.Clear;
      qServices.SQL.Add('SELECT E.ID EventID, E.AnimalID, E.EventDate, E.EventDesc, B.AnimalNo ServiceBull');
      qServices.SQL.Add('FROM Events E');
      qServices.SQL.Add('LEFT JOIN Animals A On ( (A.ID = E.AnimalID) AND (A.LactNo = E.AnimalLactNo) )');
      qServices.SQL.Add('LEFT JOIN Services S On (S.EventID = E.ID)');
      qServices.SQL.Add('LEFT JOIN Animals B On (B.ID = S.ServiceBull)');
      qServices.SQL.Add('WHERE (E.EventType = :ServiceEvent)');
      qServices.SQL.Add('AND   (A.InHerd = True)');
      qServices.SQL.Add('AND   (A.AnimalDeleted = False)');
      qServices.SQL.Add('AND   (A.HerdID In (Select D.DefaultHerdID From Defaults D))');
      qServices.SQL.Add('ORDER BY E.AnimalID, E.EventDate');
      qServices.Params[0].AsInteger := CServiceEvent;
      qServices.Open;
      if ( qServices.RecordCount = 0 ) then
         begin
            MessageDlg('There are no services for the animals currently in your herd.',mtInformation,[mbOK],0);
            Exit;
         end;

      qUpdate := TQuery.Create(nil);
      qUpdate.DatabaseName := AliasName;

      ShowProgressIndicator('Updating Service Event Comments',0,qServices.RecordCount,1);
      ProgressIndicator.Max := qServices.RecordCount;
      Application.ProcessMessages;
      Update;
      qServices.First;
      while ( not(qServices.Eof) ) do
         begin
            if ( iAnimalID <> qServices.FieldByName('AnimalID').AsInteger ) then
               begin
                  iAnimalID := qServices.FieldByName('AnimalID').AsInteger;
                  iServiceCount := 1;
               end;

            try
               qUpdate.SQL.Clear;
               qUpdate.SQL.Add('UPDATE Events');
               qUpdate.SQL.Add('SET EventDesc = "Service '+IntToStr(iServiceCount)+ ' / '+qServices.FieldByName('ServiceBull').AsString+'"');
               qUpdate.SQL.Add('WHERE ID = :EventID');
               qUpdate.Params[0].AsInteger := qServices.FieldByName('EventID').AsInteger;
               qUpdate.ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;

            Inc(iServiceCount);
            ProgressIndicator.Position := ProgressIndicator.Position + 1;
            qServices.Next;
         end;
      ProgressIndicator.Close;
      Application.ProcessMessages;
      Update;
   finally
      if ( qServices <> nil ) then
         begin
            qServices.Close;
            FreeAndNil(qServices);
         end;
      if ( qUpdate <> nil ) then
         begin
            qUpdate.Close;
            FreeAndNil(qUpdate);
         end;
   end;
end;

procedure TfHerdPassword.ClearDiseaseTestDates;
begin
   TfmClearDiseaseTestDate.DiseaseTestDatesCleared;
end;

procedure TfHerdPassword.ResetBullsInUse;
var
   qBullsInUse : TQuery;
   BullIDArray : array of Integer;
begin
   qBullsInUse := TQuery.Create(nil);
   try
      Screen.Cursor := crHourGlass;
      qBullsInUse.DatabaseName := AliasName;
      try
         qBullsInUse.Close;
         qBullsInUse.SQL.Clear;
         qBullsInUse.SQL.Add('SELECT DISTINCT(S.ServiceBull)');
         qBullsInUse.SQL.Add('FROM Services S');
         qBullsInUse.SQL.Add('LEFT JOIN Events E ON (E.ID = S.EventID)');
         qBullsInUse.SQL.Add('WHERE (E.EventDate BETWEEN "01/01/'+IntToStr(ExtractYear(IncYear(Date,-1)))+'" AND "'+FormatDate(Date,dsUS)+'")');
         qBullsInUse.SQL.Add('AND   (E.EventType = 2)');
         qBullsInUse.SQL.Add('AND   (E.HerdID = :HerdID)');
         qBullsInUse.Params[0].AsInteger := WinData.UserDefaultHerdID;
         qBullsInUse.Open;
         if ( qBullsInUse.RecordCount > 0 ) then
            begin
               qBullsInUse.First;
               while ( not(qBullsInUse.Eof) ) do
                  begin
                     if ( not(InArray(qBullsInUse.FieldByName('ServiceBull').AsInteger,BullIDArray)) ) then
                        begin
                           SetLength(BullIDArray,Length(BullIDArray)+1);
                           BullIDArray[Length(BullIDArray)-1] := qBullsInUse.FieldByName('ServiceBull').AsInteger
                        end;
                     qBullsInUse.Next;
                  end;
            end;

         qBullsInUse.Close;
         qBullsInUse.SQL.Clear;
         qBullsInUse.SQL.Add('SELECT DISTINCT(B.PlannedBull)');
         qBullsInUse.SQL.Add('FROM Bullings B');
         qBullsInUse.SQL.Add('LEFT JOIN Events E ON (E.ID = B.EventID)');
         qBullsInUse.SQL.Add('WHERE (E.EventDate BETWEEN "01/01/'+IntToStr(ExtractYear(IncYear(Date,-1)))+'" AND "'+FormatDate(Date,dsUS)+'")');
         qBullsInUse.SQL.Add('AND   (E.EventType = 1)');
         qBullsInUse.SQL.Add('AND   (E.HerdID = :HerdID)');
         qBullsInUse.Params[0].AsInteger := WinData.UserDefaultHerdID;
         qBullsInUse.Open;
         if ( qBullsInUse.RecordCount > 0 ) then
            begin
               qBullsInUse.First;
               while ( not(qBullsInUse.Eof) ) do
                  begin
                     if ( not(InArray(qBullsInUse.FieldByName('PlannedBull').AsInteger,BullIDArray)) ) then
                        begin
                           SetLength(BullIDArray,Length(BullIDArray)+1);
                           BullIDArray[Length(BullIDArray)-1] := qBullsInUse.FieldByName('PlannedBull').AsInteger
                        end;
                     qBullsInUse.Next;
                  end;
            end;

         qBullsInUse.Close;
         qBullsInUse.SQL.Clear;
         qBullsInUse.SQL.Add('SELECT DISTINCT(A.SireID)');
         qBullsInUse.SQL.Add('FROM Animals A');
         qBullsInUse.SQL.Add('WHERE (A.DateOfBirth BETWEEN "01/01/'+IntToStr(ExtractYear(IncYear(Date,-1)))+'"  AND "'+FormatDate(Date,dsUS)+'")');
         qBullsInUse.SQL.Add('AND   (A.HerdID = :HerdID)');
         qBullsInUse.SQL.Add('AND   (A.AnimalDeleted = False)');
         qBullsInUse.Params[0].AsInteger := WinData.UserDefaultHerdID;
         qBullsInUse.Open;
         if ( qBullsInUse.RecordCount > 0 ) then
            begin
               qBullsInUse.First;
               while ( not(qBullsInUse.Eof) ) do
                  begin
                     if ( not(InArray(qBullsInUse.FieldByName('SireID').AsInteger,BullIDArray)) ) then
                        begin
                           SetLength(BullIDArray,Length(BullIDArray)+1);
                           BullIDArray[Length(BullIDArray)-1] := qBullsInUse.FieldByName('SireID').AsInteger
                        end;
                     qBullsInUse.Next;
                  end;
            end;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;
   finally
      Screen.Cursor := crDefault;
      if ( Length(BullIDArray) > 0 ) then
         if ( TfmMessageScr.ConfirmMessage(mtUpdateBulls) = mrOK ) then
            try
               Screen.Cursor := crHourGlass;
               try
                  qBullsInUse.Close;
                  qBullsInUse.SQL.Clear;
                  qBullsInUse.SQL.Add('UPDATE BullSemenStk');
                  qBullsInUse.SQL.Add('SET InUse = False');
                  qBullsInUse.SQL.Add('WHERE AnimalID NOT IN '+IntArrayToSQLInString(BullIDArray));
                  qBullsInUse.ExecSQL;

                  qBullsInUse.Close;
                  qBullsInUse.SQL.Clear;
                  qBullsInUse.SQL.Add('UPDATE BullSemenStk');
                  qBullsInUse.SQL.Add('SET InUse = TRUE');
                  qBullsInUse.SQL.Add('WHERE AnimalID IN '+IntArrayToSQLInString(BullIDArray));
                  qBullsInUse.ExecSQL;

                  qBullsInUse.Close;
                  qBullsInUse.SQL.Clear;
                  qBullsInUse.SQL.Add('UPDATE Animals');
                  qBullsInUse.SQL.Add('SET Breeding = TRUE');
                  qBullsInUse.SQL.Add('WHERE ID IN '+IntArrayToSQLInString(BullIDArray));
                  qBullsInUse.ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Screen.Cursor := crDefault;
            end;
   end;
end;

end.

