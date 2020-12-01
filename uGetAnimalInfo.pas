unit uGetAnimalInfo;

interface

procedure LactSummCalcs;
procedure CurrFertCalcs( AID, LactNo, EventType : Integer);
procedure SucklerTabCalcs;
procedure GetCalvingDates ( AID, LactNo : Integer;
                                var CalvingDate : TDateTime;
                                var CalvingEventID : Integer );
procedure GetCalfTypes ( CalfBirthID : Integer; var CalfAnimalNo : string;
                             var AnimalIDs : String; var BirthType : string);
function  GetNoOfServes ( AID, LactNo : Integer ) : String;
function  GetDateDry ( AID, LactNo : integer ) : string;
procedure GetEventDetails ( AID, LactNo, EventType, PrevDate : Integer;
                              FirstPass : Boolean; var EventDate : TDateTime;
                              var EventInterval : Integer );
procedure GetServiceInfo(EventID : Integer; var ServiceType : Integer; var BullUsed : string);
procedure GetMilkInfo;

implementation
uses
    SetUpAnimals;

procedure LactSummCalcs;
var
   CalfAnimalNo,
   CalfSex,
   BirthType,
   TempCalvingIndex : String;
   CalfBirthID,
   NumCalves   : integer;
   PCalvDate,
   CCalvDate,
   ProjCalving : TDateTime;
begin
   // only calculate if tab showing
   if NOT tsLactSumm.Showing then Exit;
   Refresh;
   if ( UpperCase(ThisHerdType) = 'SUCKLER' ) then
      begin
         lCDaysMilk.Caption := 'Days Suckling';
         lDateDry.Caption := 'Date Weaned';
         eLastTest.Hide;
         eBFat.Hide;
         eProt.Hide;
         e305Y.Hide;
         eTotalY.Hide;
         lLastTest.Hide;
         lBFat.Hide;
         lProt.Hide;
         l305Y.Hide;
         lTotalY.Hide;
      end
   else
      begin
         lCDaysMilk.Caption := 'Days in Milk';
         lDateDry.Caption := 'Date Dry';
         eLastTest.Show;
         eBFat.Show;
         eProt.Show;
         e305Y.Show;
         eTotalY.Show;
         lLastTest.Show;
         lBFat.Show;
         lProt.Show;
         l305Y.Show;
         lTotalY.Show;
      end;
// Initialise
   // Current Lact Data
   eCCalvDate.Text := '';
   eCCalfType.Text := '';
   eCDaysMilk.Text := '';
   eProjCInd.Text  := '';
   eCNumServ.Text  := '';
   eDateDry.Text   := '';
   // Previous Lact Data
   ePCalvDate.Text := '';
   ePCalfType.Text := '';
   ePDaysMilk.Text := '';
   eLastCInd.Text  := '';
   ePNumServ .Text := '';
   eLastDry.Text   := '';
   // Initialise Milk Data
   eLastTest.Text  := '';
   eBFat.Text      := '';
   eProt.Text      := '';
   e305Y.Text      := '';
   eTotalY.Text    := '';
   // initialise for suckler only
   eCBirthType.Text := '';
   ePBirthType.Text := '';
   // local variables
   PCalvDate := 0;
   CCalvDate := 0;

// Get projected calving date
   if WinData.GetProjCalving(WinData.AnimalFileByIdID.AsInteger,
                             WinData.AnimalFileByIdLactNo.AsInteger, NumCalves ) > 0 then
      ProjCalving := WinData.GetProjCalving(WinData.AnimalFileByIdID.AsInteger,
                                         WinData.AnimalFileByIdLactNo.AsInteger,
                                         NumCalves );

// Get current calving records
   // Get calving date
   GetCalvingDates ( WinData.AnimalFileByIdID.AsInteger,
                     WinData.AnimalFileByIdLactNo.AsInteger,
                     CCalvDate,
                     CalfBirthID );
   if CCalvDate >0 then
      eCCalvDate.Text := FormatDateTime('dd/mm/yyyy', CCalvDate);
   // calculate calving index
   if Round(ProjCalving-CCalvDate) > 0 then
      eProjCInd.Text := IntToStr(Round(ProjCalving-CCalvDate));
   // get calf types
   GetCalfTypes(CalfBirthID, CalfAnimalNo, CalfSex, BirthType);
   eCCalfType.Text := CalfSex;
   eCBirthType.Text := Copy(BirthType,1,13);

// get previous calving records
   // Get calving date
   GetCalvingDates ( WinData.AnimalFileByIdID.AsInteger,
                     WinData.AnimalFileByIdLactNo.AsInteger-1,
                     PCalvDate,
                     CalfBirthID );
   if PcalvDate > 0 then
      ePCalvDate.Text := FormatDateTime('dd/mm/yyyy', PCalvDate);
   // calculate calving index
   if Round(CCalvDate-PCalvDate) > 0 then
      eLastCInd.Text := IntToStr(Round(CCalvDate-PCalvDate));
   // get calf types
   GetCalfTypes(CalfBirthID, CalfAnimalNo, CalfSex, BirthType);
   ePCalfType.Text := CalfSex;
   ePBirthType.Text := Copy(BirthType,1,13);

// get date dry
   // current
   eDateDry.Text := GetDateDry ( WinData.AnimalFileByIdID.AsInteger,
                                 WinData.AnimalFileByIdLactNo.AsInteger);
   // previous
   eLastDry.Text := GetDateDry ( WinData.AnimalFileByIdID.AsInteger,
                                 WinData.AnimalFileByIdLactNo.AsInteger-1);

// get days suckling
   if ( UpperCase(ThisHerdType) = 'SUCKLER' ) then
      // current
      if (eDateDry.Text <> '') And (Round(StrToDate(eDateDry.Text) - CCalvDate) > 0) then
         eCDaysMilk.Text := IntToStr(Round(StrToDate(eDateDry.Text) - CCalvDate));
      // previous
      if (eLastDry.Text <> '') And (Round(StrToDate(eLastDry.Text) - PCalvDate) > 0) then
         ePDaysMilk.Text := IntToStr(Round(StrToDate(eLastDry.Text) - PCalvDate));

// get no. of serves
   // current
   eCNumServ.Text := GetNoOfServes(WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger);
   if eCNumServ.Text = '0' then
      eCNumServ.Text := '';
   // previous
   ePNumServ.Text := GetNoOfServes(WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger-1);
   if ePNumServ.Text = '0' then
      ePNumServ.Text := '';

// get milk recinfo (dairy only)
   if ( UpperCase(ThisHerdType) = 'DAIRY' ) then
      GetMilkInfo;
end;

procedure CurrFertCalcs( AID, LactNo, EventType : Integer );
var
   CCalvDate,
   LastEventDate,
   ThisEventDate : TDateTime;
   PlanBull,
   BullUsedNo : String;
   ServiceType,
   CalfBirthID,
   CalvToEvent,
   EventInterval,
   NumCalves,
   EventCount,
   a : integer;
begin
   if NOT tsCurrFert.Showing then Exit;
   Refresh;
   // clear grid
   // clear text boxes
   if EventType = cBullingEvent then
      begin
         for a := 0 to 20 do
//         for a := 0 to sgBullings.rowcount do
            begin
               sgBullings.cells[ 1, a ] := '' ;
               sgBullings.cells[ 2, a ] := '' ;
            end;
         eTotBull.Text  := '';
         ePlanBull.Text := '';
      end
   else
      begin
//         for a := 0 to sgServices.rowcount do
         for a := 0 to 20 do
            begin
               sgServices.cells[ 1, a ] := '' ;
               sgServices.cells[ 2, a ] := '' ;
            end;
         eTotServ.Text  := '';
         eDaysLast.Text := '';
         eLastCalv.Text := '';
         eProjCalv.Text := '';
      end;
   // initialise variables
   CCalvDate      := 0;
   LastEventDate  := 0;
   ThisEventDate  := 0;
   CalvToEvent    := 0;
   EventInterval  := 0;
   EventCount     := 0;
   BullUsedNo     := '';
   PlanBull       := '';
   // Get current calving date
   GetCalvingDates ( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger,
                     CCalvDate, CalfBirthID );
   if CCalvDate > 0 then
      begin
         eLastCalv.Text := FormatDateTime('dd/mm/yyyy', CCalvDate);
         // Get projected calving date
         if WinData.GetProjCalving(WinData.AnimalFileByIdID.AsInteger,
                                   WinData.AnimalFileByIdLactNo.AsInteger, NumCalves ) > 0 then
         eProjCalv.Text := FormatDateTime('dd/mm/yyyy', WinData.GetProjCalving(WinData.AnimalFileByIdID.AsInteger,
                                                        WinData.AnimalFileByIdLactNo.AsInteger,
                                                        NumCalves ));
{         // get service details
         GetEventDetails ( WinData.AnimalFileByIdID.AsInteger, WinData.AnimalFileByIdLactNo.AsInteger, cServiceEvent, CCalvDate, True,
                           ThisEventDate, CalvToEvent );
}         // set filters
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(EventType) + ')';
         WinData.CheckEvents.Filtered := True;
         // find and evaluate first record
         if WinData.CheckEvents.FindFirst then
            begin
               if Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - CCalvDate) >= 0 then
                  CalvToEvent := Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - CCalvDate);
               LastEventDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               // set event counter to 1
               EventCount := 1;
               // move calcs to grid
               if EventType = cBullingEvent then
                  begin
                     sgBullings.Cells[ 1, EventCount-1] := IntToStr(EventCount);
                     sgBullings.Cells[ 2, EventCount-1] := ' ' + DateToStr(LastEventDate) + '     ' + IntToStr(CalvToEvent) + ' days from calving';
                  end
               else
                  begin
                     sgServices.Cells[ 1, EventCount-1] := IntToStr(EventCount);
                     // search for service bull
                     GetServiceInfo ( WinData.CheckEvents.FieldByName('ID').AsInteger, ServiceType, BullUsedNo );
                     if BullUsedNo = '' then
                        sgServices.Cells[ 2, EventCount-1] := ' ' + DateToStr(LastEventDate) + '    ' + IntToStr(CalvToEvent) + ' days from Calving  ,  No Bull Used'
                     else
                        sgServices.Cells[ 2, EventCount-1] := ' ' + DateToStr(LastEventDate) + '    ' + IntToStr(CalvToEvent) + ' days from calving  ,  Bull ' + BullUsedNo + ' Used';
                  end;
               // find and evaluate subsequent records
               while WinData.CheckEvents.FindNext do
                  begin
                     // re-initialise variables in loop
                     BullUsedNo := '';
                     // find event date and calculate interval from last
                     ThisEventDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     EventInterval := Round(ThisEventDate - LastEventDate);
                     // increment event counter
                     inc(EventCount);
                     // move calcs to grid
                     if EventType = cBullingEvent then
                        begin
                           sgBullings.Cells[ 1, EventCount-1] := IntToStr(EventCount);
                           sgBullings.Cells[ 2, EventCount-1] := ' ' + DateToStr(ThisEventDate) + '     ' + IntToStr(EventInterval) + ' days from last Bulling';
                        end
                     else
                        begin
                           sgServices.Cells[ 1, EventCount-1] := IntToStr(EventCount);
                           // search for service bull
                           GetServiceInfo ( WinData.CheckEvents.FieldByName('ID').AsInteger, ServiceType, BullUsedNo );
                           BullUsedNo := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                           if BullUsedNo = '' then
                              sgServices.Cells[ 2, EventCount-1] := ' ' + DateToStr(ThisEventDate) + '    ' + IntToStr(EventInterval) + ' days from last Service  ,  No Bull Used'
                           else
                              sgServices.Cells[ 2, EventCount-1] := ' ' + DateToStr(ThisEventDate) + '    ' + IntToStr(EventInterval) + ' days from last Service  ,  Bull ' + BullUsedNo + ' Used';
                        end;
                     LastEventDate := ThisEventDate;
                  end;
               // Calculate Days from last service
               if EventType = cServiceEvent then
                  eDaysLast.Text := IntToStr(Round(Now() - LastEventDate));
               // move calcs to text
               if EventType = cBullingEvent then
                  begin
                     // search for planned bull
                     WinData.LookUpBullings.Locate('EventID',
                                    WinData.CheckEvents.FieldByName('ID').AsInteger,[] );
                     WinData.LookUpDamSire.Locate('ID',WinData.LookUpBullings.FieldByName('PlannedBull').AsInteger,[] );
                     PlanBull := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                     if PlanBull = '' then
                        ePlanBull.Text := 'None'
                     else
                        ePlanBull.Text := PlanBull;
                     eTotBull.Text := IntToStr(EventCount);
                  end
               else
                  begin
                     eTotServ.Text := IntToStr(EventCount);
                  end;
         end;
      end;
end;

procedure SucklerTabCalcs;
begin
   if NOT tsCalfPerform.Showing then Exit;
   Refresh;
   // insert headings into grid
   sgPastFert.Cells[ 0,0 ] := 'Lact';
   sgPastFert.Cells[ 1,0 ] := 'Calv Date';
   sgPastFert.Cells[ 2,0 ] := 'Calf Type';
   sgPastFert.Cells[ 3,0 ] := 'Birth Type';
   sgPastFert.Cells[ 4,0 ] := 'Last Calf';
   sgPastFert.Cells[ 5,0 ] := ' Serves';
   sgPastFert.Cells[ 6,0 ] := 'Bull Used';
   sgPastFert.Cells[ 7,0 ] := 'Serv Type';
   sgPastFert.Cells[ 8,0 ] := 'Serv Date';
   sgPastFert.Cells[ 9,0 ] := 'Calv Conc';
   sgPastFert.Cells[10,0 ] := 'CalvIndex';
end;

procedure GetCalvingDates ( AID, LactNo : Integer; var CalvingDate : TDateTime;
                            var CalvingEventID : Integer );
begin
   with qLactSumm do
   // get calving date and event ID
      begin
         SQL.Clear;
         SQL.Add('SELECT A.ID, A.LactNo, E.EventDate CalvDate, E.ID CalfID');
         SQL.Add('FROM   Animals A, Events E');
         SQL.Add('WHERE (A.ID = E.AnimalID)');
         SQL.Add('AND   (A.ID = ' + IntToStr(AID) + ')');
         SQL.Add('AND   (A.LactNo > 0)');
         SQL.Add('AND   (E.AnimalLactNo = ' + IntToStr(LactNo) + ')');
         SQL.Add('AND   (A.AnimalDeleted = FALSE)');
         SQL.Add('AND   (E.EventType = ' + IntToStr(cCalvingEvent) + ')');
         SQL.Add('AND   (A.Sex = "Female")');
         Open;
         CalvingEventID := 0;
         if NOT IsEmpty then
            begin
               CalvingEventID := FieldByName('CalfID').AsInteger;
               CalvingDate := FieldByName ('CalvDate').AsDateTime;
            end;
      end;
end;

procedure GetCalfTypes ( CalfBirthID : Integer; var CalfAnimalNo : String;
                                         var AnimalIDs : string; var BirthType : string );
var
   BirthTypeID : integer;
begin
   BirthTypeID  :=  0;
   BirthType    := '';
   CalfAnimalNo := '';
   AnimalIDs    := '';
   with qLactSumm do
   // get calf sex type(s)
      begin
         // get calf id(s)
         SQL.Clear;
         SQL.Add('SELECT C.BirthType BirthID, C.ID1, C.ID2, C.ID3, C.ID4');
         SQL.Add('FROM   Calvings C');
         SQL.Add('WHERE (C.EventID = ' + IntToStr(CalfBirthID) + ')');
         Open;
         if NOT IsEmpty then
            BirthTypeID := FieldByName('BirthID').AsInteger;
            if ( FieldByName('ID1').AsInteger > 0 ) then
               begin
                  // add calfid(s) to string
                  AnimalIDS := FieldByName('ID1').AsString;
                  if ( FieldByName('ID2').AsInteger > 0 ) then
                     AnimalIDS := AnimalIDS + ',' + FieldByName('ID2').AsString;
                  if ( FieldByName('ID3').AsInteger > 0 ) then
                     AnimalIDS := AnimalIDS + ',' + FieldByName('ID3').AsString;
                  if ( FieldByName('ID4').AsInteger > 0 ) then
                     AnimalIDS := AnimalIDS + ',' + FieldByName('ID4').AsString;
                  // find calf sex
                  SQL.Clear;
                  SQL.Add('SELECT A.Sex, A.AnimalNo');
                  SQL.Add('FROM   Animals A');
                  SQL.Add('WHERE (A.ID IN (' + AnimalIDS + '))');
                  Open;
                  if NOT IsEmpty then
                     begin
                        AnimalIDS := '';
                        CalfAnimalNo := '';
                        First;
                        // Loop to transfer sql data to strings
                        while NOT EOF do
                           begin
                              // copy sex of calf to string
                              if AnimalIDS = '' then
                                 AnimalIDS := Copy(FieldByName('Sex').AsString,1,3)
                              else
                                 AnimalIDS := AnimalIDS + '/' + Copy(FieldByName('Sex').AsString,1,3);
                              // Copy Calf AnimalNumbers to String
                              if CalfAnimalNo = '' then
                                 CalfAnimalNo := FieldByName('AnimalNo').AsString
                              else
                                 CalfAnimalNo := CalfAnimalNo + '/' + FieldByName('AnimalNo').AsString;
                              Next;
                           end;
                     end;
               end;
            // Find Birth Type
            SQL.Clear;
            SQL.Add('SELECT G.ID, G.Description');
            SQL.Add('FROM   GenLook G');
            SQL.Add('WHERE (G.ID = ' + IntToStr(BirthTypeID) + ')');
            Open;
            BirthType := FieldByName('Description').AsString;
      end;
end;

function GetNoOfServes ( AID,LactNo : Integer ) : String;
begin
   RESULT := '';
   with qLactSumm do
   // get no. of serves
      begin
         SQL.Clear;
         SQL.Add('SELECT COUNT(E.ID) AS ServeCount ');
         SQL.Add('FROM   Animals A, Events E');
         SQL.Add('WHERE (A.ID = E.AnimalID)');
         SQL.Add('AND   (A.ID = ' + IntToStr(AID) + ')');
         SQL.Add('AND   (E.AnimalLactNo = ' + IntToStr(LactNo) + ')');
         SQL.Add('AND   (A.AnimalDeleted = FALSE)');
         SQL.Add('AND   (E.EventType = ' + IntToStr(cServiceEvent) + ')');
         SQL.Add('AND   (A.Sex = "Female")');
         Open;
         if NOT IsEmpty then
            RESULT := FieldByName('ServeCount').AsString;
      end;
end;

function GetDateDry ( AID, LactNo : Integer ) : string;
begin
   Result := '';
   if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                          VarArrayOf([ AID, LactNo, cDryOffEvent]),[] ) then
      Result := FormatDateTime('dd/mm/yyyy',WinData.CheckEvents.FieldByName('EventDate').AsDateTime);
end;

procedure GetEventDetails ( AID, LactNo, EventType, PrevDate : Integer;
                            FirstPass : Boolean; var EventDate : TDateTime;
                            var EventInterval : Integer );
begin
   if firstpass then
      begin
         // set filters
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(EventType) + ')';
         WinData.CheckEvents.Filtered := True;
         if WinData.CheckEvents.FindFirst then
            begin
               if Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - PrevDate) >= 0 then
                  EventInterval := Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - PrevDate);
               EventDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
            end
         else
            EventInterval := 0;
            EventDate := 0;
      end
   else
      begin
         if WinData.CheckEvents.FindNext then
            begin
               if Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - PrevDate) >= 0 then
                  EventInterval := Round(WinData.CheckEvents.FieldByName('EventDate').AsDateTime - PrevDate);
               EventDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
            end
         else
            EventInterval := 0;
            EventDate := 0;
      end;
end;

procedure GetServiceInfo ( EventID : Integer; var ServiceType : Integer;
                           var BullUsed : string );
begin
   if WinData.LookUpServices.Locate('EventID',EventID,[] ) then
      begin
         if WinData.LookUpServices.FieldByName('ServiceType').AsInteger > 0 then
            ServiceType := WinData.LookUpServices.FieldByName('ServiceType').AsInteger
         else
            ServiceType := 0;
         if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
            BullUsed := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString
         else
            BullUsed := '';
      end;
end;

procedure GetMilkInfo;
begin
   // get milk data for current lactation
   try
      WinData.LookUpMilkDisk.Open;
      with WinData.LookUpMilkDisk do
         begin
            if Locate('AnimalID;LactNo',
               VarArrayOf([WinData.AnimalFileByIdID.AsString,
                           WinData.AnimalFileByIdLactNo.AsString]),[] ) then
               begin
                  eCDaysMilk.Text := FieldByName('DaysInMilk').AsString;
                  eLastTest.Text  := FieldByName('DailyYield').AsString;
                  eBFat.Text      := FieldByName('DailyBFatPerc').AsString;
                  eProt.Text      := FieldByName('DailyProtPerc').AsString;
                  e305y.Text      := FieldByName('Yield305').AsString;
                  eTotalY.Text    := FieldByName('CumYield').AsString;
               end;
            if Locate('AnimalID;LactNo',
               VarArrayOf([WinData.AnimalFileByIdID.AsString,
                     WinData.AnimalFileByIdLactNo.AsInteger-1]),[] ) then
               ePDaysMilk.Text := FieldByName('DaysInMilk').AsString;
         end;
   finally
      WinData.LookUpMilkDisk.Close;
   end;
end;

end.
