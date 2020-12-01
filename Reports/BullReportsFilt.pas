{
   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   09/09/14 [V5.3 R6.0] /MK Bug Fix - BuildTable - Including bulls that were deleted.

   23/10/14 [V5.3 R8.6] /MK Change - New logic applied to get conception rates based on pregnancy diag event of cows found.

   03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.
}

unit BullReportsFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXSpin, dbTables, RXCtrls, ComCtrls, ToolWin,
  cxControls, cxContainer, cxEdit, cxCheckBox, KRoutines;

type
  //   14/04/12 [V5.0 R4.9] /MK Additional Feature - New Type Added For ReportType.
  TReportType = (rtBullReport, rtSireSelect);
  TBullReportsFilter = class(TForm)
    pBullsInHerd: TPanel;
    cbNotAvail: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToBullStat: TRxSpinEdit;
    FromLocation: TRxSpinEdit;
    ToLocation: TRxSpinEdit;
    FromBullStat: TRxSpinEdit;
    MyBatchMove: TBatchMove;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    main: TPanel;
    pSireSelection: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    RBIFrom: TRxSpinEdit;
    RBITo: TRxSpinEdit;
    MilkKgsFrom: TRxSpinEdit;
    MilkKgsTo: TRxSpinEdit;
    FatKgsFrom: TRxSpinEdit;
    FatKgsTo: TRxSpinEdit;
    FatPercFrom: TRxSpinEdit;
    FatPercTo: TRxSpinEdit;
    ProtKgsFrom: TRxSpinEdit;
    ProtKgsTo: TRxSpinEdit;
    ProtPercFrom: TRxSpinEdit;
    ProtPercTo: TRxSpinEdit;
    ReliabFrom: TRxSpinEdit;
    ReliabTo: TRxSpinEdit;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    ToCalvInt: TRxSpinEdit;
    FromCalvInt: TRxSpinEdit;
    FromSurviv: TRxSpinEdit;
    ToSurviv: TRxSpinEdit;
    FromOverAllUdder: TRxSpinEdit;
    ToOverAllUdder: TRxSpinEdit;
    FromFeetLegs: TRxSpinEdit;
    ToFeetLegs: TRxSpinEdit;
    ExtFilt: TButton;
    cbAllSires: TCheckBox;
    cbFavourite: TcxCheckBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExtFiltClick(Sender: TObject);
    procedure cbAllSiresClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbFavouriteClick(Sender: TObject);
  private
    { Private declarations }
    BullRepReport : Integer;
    MyTable : TTable;
    MyQuery : TQuery;
    procedure BuildTable(Sender: TObject);
    procedure SetReportType(RptType : Integer);
  public
    { Public declarations }
  end;


Var
   fBullReportsFilt : TBullReportsFilter;
   //   14/04/12 [V5.0 R4.9] /MK Additional Feature - New Variable For ReportType.
   ReportType : TReportType;

Procedure ShowForm ( WhichReport : Integer );

implementation
uses
    DB,
    GenTypesConst,
    DairyData, BullReport, SireSelection, ExtSiresFilt;
{$R *.DFM}

Procedure ShowForm ( WhichReport : Integer );
begin
     with TBullReportsFilter.Create(nil) do
        try
           // Set the Report to print in the class
//           BullRepReport := WhichReport;
           SetReportType(WhichReport);
           ShowModal;
        finally
           Free;
        end;
end;

procedure TBullReportsFilter.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TBullReportsFilter.BuildTable(Sender: TObject);
var
   LastEvent : Variant;
   i,
   LastLact,
   LastAnimal,
   LastType,
   CurrType,
   CurrLact,
   CurrAnimal,
   NoCowsInCalfToBull : Integer;

   function GetNoCowsInCalfToBull ( ABullID : Integer ) : Integer;
   var
      CowID, CowLactNo : Integer;
      BullQuery,
      EventQuery : TQuery;
      LastServiceDate : TDateTime;
   begin
      Result := 0;
      if ( ABullID = 0 ) then Exit;

      CowID := 0;
      CowLactNo := 0;

      EventQuery := TQuery.Create(nil);
      EventQuery.DatabaseName := AliasName;

      BullQuery := TQuery.Create(nil);
      with BullQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT A.ID, A.LactNo');
            SQL.Add('FROM Animals A');
            SQL.Add('LEFT JOIN Events E ON (A.ID = E.AnimalID)');
            SQL.Add('LEFT JOIN Services S ON (E.ID = S.EventID)');
            SQL.Add('WHERE (A.Sex = "Female")');
            SQL.Add('AND   (A.Breeding = True)');
            SQL.Add('AND   (A.InHerd=True)');
            SQL.Add('AND   (A.AnimalDeleted=False)');
            SQL.Add('AND   (A.LactNo=E.AnimalLactNo)');
            SQL.Add('AND   (S.ServiceBull = '+IntToStr(ABullID)+')');
            SQL.Add('ORDER BY A.ID');
            try
               Open;
               First;
               while ( not(Eof) ) do
                  begin
                     if ( Fields[0].AsInteger = CowID ) then
                        Next
                     else
                        begin
                           CowID := 0;
                           CowLactNo := 0;

                           CowID := Fields[0].AsInteger;
                           CowLactNo := Fields[1].AsInteger;

                           // Get the service events and PD events of each cow for the bull.
                           EventQuery.SQL.Clear;
                           EventQuery.SQL.Add('SELECT E.EventDate, S.ServiceBull, E.EventType, P.PregnancyStatus');
                           EventQuery.SQL.Add('FROM Events E');
                           EventQuery.SQL.Add('LEFT JOIN Services S On (S.EventID = E.ID)');
                           EventQuery.SQL.Add('LEFT JOIN PregnancyDiag P On (P.EventID = E.ID)');
                           EventQuery.SQL.Add('WHERE E.AnimalID = '+IntToStr(CowID)+'');
                           EventQuery.SQL.Add('AND E.AnimalLactNo = '+IntToStr(CowLactNo)+'');
                           EventQuery.SQL.Add('ORDER BY E.EventDate');
                           try
                              EventQuery.Open;

                              // Of these events filter by services.
                              EventQuery.Filtered := False;
                              EventQuery.Filter := '';
                              EventQuery.Filter := 'EventType = '+IntToStr(CServiceEvent)+'';
                              EventQuery.Filtered := True;

                              EventQuery.FindLast;
                              // Go to the last service event and see if the bull matches the bull in question.
                              if ( EventQuery.FieldByName('ServiceBull').AsInteger = ABullID ) then
                                 begin
                                    LastServiceDate := EventQuery.FieldByName('EventDate').AsDateTime;

                                    // If the bull matches then filter the events found by PD events.
                                    EventQuery.Filtered := False;
                                    EventQuery.Filter := '';
                                    EventQuery.Filter := 'EventType = '+IntToStr(CPregDiagEvent)+'';
                                    EventQuery.Filtered := True;

                                    EventQuery.FindLast;
                                    // If the PD event date is greater than the last service date and if this PD result is true the increment the no cows.
                                    if ( EventQuery.FieldByName('EventDate').AsDateTime > LastServiceDate ) then
                                       if ( EventQuery.FieldByName('PregnancyStatus').AsBoolean ) then
                                          Inc(Result);
                                 end;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;

                           Next;
                        end;
                  end;
            except
               on e : Exception do
                 ShowMessage(e.Message);
            end;
         finally
            Free;
         end;

      EventQuery.Free;
   end;

begin
     Try
        MyTable := TTable.Create(nil);
        MyQuery := TQuery.Create(nil);
        MyTable.DatabaseName := WinData.KingData.DatabaseName;
        MyTable.TableType := ttParadox;
        MyTable.TableName := 'BullsUsedInHerd';

        MyTable.FieldDefs.Clear;
        MyTable.FieldDefs.Add('ID',ftInteger,0,True);
        MyTable.FieldDefs.Add('AnimalNo',ftString,10,False);
        MyTable.FieldDefs.Add('SortAnimalNo',ftString,10,False);
        MyTable.FieldDefs.Add('Name',ftString,40,False);
        MyTable.FieldDefs.Add('SemenStk',ftFloat,0,False);
        MyTable.FieldDefs.Add('PricePerStraw',ftCurrency,0,False);
        MyTable.FieldDefs.Add('TimesUsed',ftFloat,0,False);
        MyTable.FieldDefs.Add('NoOfCowsUsed',ftInteger,0,False);
        MyTable.FieldDefs.Add('NoCurrSucc',ftInteger,0,False);
        MyTable.FieldDefs.Add('NoSucc',ftInteger,0,False);
        MyTable.FieldDefs.Add('ConcPerCow',ftFloat,0,False);
        MyTable.FieldDefs.Add('ConcepPerc',ftFloat,0,False);
        MyTable.FieldDefs.Add('Status',ftString,10,False);
        MyTable.FieldDefs.Add('Location',ftString,10,False);
        MyTable.FieldDefs.Add('InUse',ftBoolean,0,False);
        MyTable.FieldDefs.Add('DateLastUsed',ftDateTime);
        MyTable.FieldDefs.Add('BCode',ftString,6,False);

        MyTable.IndexDefs.Clear;
        MyTable.IndexDefs.Add('','ID',[ixPrimary, ixUnique]);

        MyTable.CreateTable;
        MyTable.Open;

        MyQuery.Close;
        MyQuery.DatabaseName := MyTable.DatabaseName;

        MyQuery.SQL.Clear;

        MyQuery.SQL.Add('INSERT INTO '+MyTable.TableName+' (ID, AnimalNo, SortAnimalNo, Name, SemenStk, TimesUsed, InUse,');
        MyQuery.SQL.Add('                                   PricePerStraw, DateLastUsed, BCode)');
        MyQuery.SQL.Add('SELECT DISTINCT(A.ID), A.AnimalNo, A.SortAnimalNo, A.Name, B.OpeningSemen, B.SemenStrawsAdded, B.InUse,');
        MyQuery.SQL.Add('               B.PricePerStraw, B.DateLastUsed, Bd.Code');
        MyQuery.SQL.Add('FROM Animals A');
        MyQuery.SQl.Add('LEFT JOIN BullSemenStk B ON (B.AnimalID = A.ID)');
        MyQuery.SQL.Add('RIGHT JOIN Breeds Bd ON (Bd.ID = A.PrimaryBreed)');
        MyQuery.SQL.Add('WHERE (A.ID = B.AnimalID)');
        MyQuery.SQL.Add('AND   (A.Breeding=TRUE)');
        MyQuery.SQL.Add('AND   (A.Sex="Bull")');
        //   09/09/14 [V5.3 R6.0] /MK Bug Fix - Including bulls that were deleted.
        MyQuery.SQL.Add('AND   (A.AnimalDeleted = False)');
        // This will print ONLY bulls IN USE
        if ( cbNotAvail.Checked = False ) then
           begin
              MyQuery.SQL.Add('AND B.InUse = True');
              BullRptscr.lBullsUsed.Caption := '';
           end
        else
           BullRptscr.lBullsUsed.Caption := 'Including Bulls Not In Use';
        MyQuery.ExecSQL;

        // Move the Info to the table.
        {
        MyBatchMove.Destination := MyTable;
        MyBatchMove.Source := MyQuery;
        MyBatchMove.Execute;
        }

        {
        // get the Count of times used for service
        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('SELECT COUNT(ServiceBull) NoServes, ServiceBull Bull');
        MyQuery.SQL.Add('FROM Services');
        MyQuery.SQL.Add('WHERE ServiceBull <> 0'); // Illiminate Bulls not selected
        MyQuery.SQL.Add('GROUP BY ServiceBull');
        MyQuery.Open;

        MyQuery.First;
        while NOT MyQuery.EOF do
           begin
              if MyTable.Locate('ID',MyQuery.FieldByName('Bull').Value,[]) then
                 begin
                    MyTable.Edit;
                    MyTable.FieldByName('TimesUsed').Value := MyQuery.FieldByName('NoServes').Value;
                    MyTable.Post;
                 end;
              MyQuery.Next;
           end;
        }

        // get the Count of Successfull calvings
        WinData.LookupDamSire.Filter := '';
        WinData.LookupDamSire.Filtered := False;
        MyQuery.SQL.Clear;

        // Look through each calf in the calvings table for success rate.
        for i := 1 to 4 do
           begin
              MyQuery.SQL.Clear;
              MyQuery.SQL.Add('SELECT ID'+IntToStr(i)+' ');
              MyQuery.SQL.Add('FROM Calvings');
              MyQuery.Open;
              MyQuery.First;
              while NOT MyQuery.Eof do
                 begin
                    Application.ProcessMessages;
                    if ( MyQuery.FieldByName('ID'+IntToStr(i)+'').AsInteger > 0 ) then
                       if WinData.LookupDamSire.Locate('ID', MyQuery.FieldByName('ID'+IntToStr(i)+'').AsInteger, [] ) then  // Locate calf rec
                          if MyTable.Locate('ID', WinData.LookupDamSire.FieldByName('SireID').AsInteger, []) then // Now try locate sire in BullsUsedInHerd, inc success if found
                             begin
                                MyTable.Edit;
                                MyTable.FieldByName('NoSucc').AsInteger := MyTable.FieldByName('NoSucc').AsInteger + 1;
                                MyTable.Post;
                             end;
                    MyQuery.Next;
                 end;
           end;

        // Get Conception Rate (Cow's PD'd positive to bull / Total Services (straws) by that bull).
        // Get all bulls that have been used for services in cows current lactation & number of cows served by this bull.
        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('SELECT S.ServiceBull Bull, Count(S.ServiceBull) BullCount,');
        MyQuery.SQL.Add('       Count (Distinct A.ID) NoOfCows                     ');
        MyQuery.SQL.Add('FROM Animals A                                            ');
        MyQuery.SQL.Add('LEFT JOIN Events E ON (A.ID = E.AnimalID)                 ');
        MyQuery.SQL.Add('LEFT JOIN Services S ON (E.ID = S.EventID)                ');
        MyQuery.SQL.Add('WHERE (A.Sex = "Female")                                  ');
        MyQuery.SQL.Add('AND   (A.Breeding = True)                                 ');
        MyQuery.SQL.Add('AND   (A.InHerd=True)                                     ');
        MyQuery.SQL.Add('AND   (A.AnimalDeleted=False)                             ');
        MyQuery.SQL.Add('AND   (A.LactNo=E.AnimalLactNo)                           ');
        MyQuery.SQL.Add('AND   (S.ServiceBull > 0)                                 ');
        MyQuery.SQL.Add('GROUP BY S.ServiceBull                                    ');
        try
           MyQuery.Open;
           MyQuery.First;
           while ( not(MyQuery.Eof) ) do
              begin
                 if MyTable.Locate('ID', MyQuery.FieldByName('Bull').AsInteger, []) then // Now try locate sire in BullsUsedInHerd, inc success if found
                    begin
                       NoCowsInCalfToBull := 0;
                       // Of these cows that were by each bull get the number of cows that had a positive PD after the service for the bull.
                       NoCowsInCalfToBull := GetNoCowsInCalfToBull(MyQuery.FieldByName('Bull').AsInteger);
                       try
                          MyTable.Edit;
                          MyTable.FieldByName('NoCurrSucc').AsInteger := MyQuery.FieldByName('BullCount').AsInteger;
                          MyTable.FieldByName('NoOfCowsUsed').AsInteger := NoCowsInCalfToBull;
                          // If positive pd found after the bull service then increase conception percentage.
                          if ( NoCowsInCalfToBull > 0 ) then
                             // Round conception rate.
                             MyTable.FieldByName('ConcPerCow').AsFloat := ( KRound((NoCowsInCalfToBull/MyQuery.FieldByName('BullCount').AsInteger)* 100) )
                          else
                             MyTable.FieldByName('ConcPerCow').AsFloat := 0;
                          MyTable.Post;
                       except
                          on e : Exception do
                             ShowMessage(e.Message);
                       end;
                    end;
                 MyQuery.Next;
              end;
        except
           on e : Exception do
              ShowMessage(e.Message);
        end;

        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('SELECT S.ServiceBull Bull, Count(S.ServiceBull) BullCount ');
        MyQuery.SQL.Add('FROM Animals A                                ');
        MyQuery.SQL.Add('LEFT JOIN Events E ON (A.ID = E.AnimalID)     ');
        MyQuery.SQL.Add('LEFT JOIN Services S ON (E.ID = S.EventID)    ');
        MyQuery.SQL.Add('WHERE (A.Sex = "Female")                      ');
        MyQuery.SQL.Add('AND   (A.Breeding = True)                     ');
        MyQuery.SQL.Add('AND   (A.AnimalDeleted=False)                 ');
        MyQuery.SQL.Add('AND   (A.LactNo<>E.AnimalLactNo)              ');
        MyQuery.SQL.Add('AND   (S.ServiceBull > 0)                     ');
        MyQuery.SQL.Add('GROUP BY S.ServiceBull                        ');
        MyQuery.Open;
        MyQuery.First;
        while not MyQuery.Eof do
           begin
              Application.ProcessMessages;
              if MyTable.Locate('ID', MyQuery.FieldByName('Bull').AsInteger, []) then // Now try locate sire in BullsUsedInHerd, inc success if found
                  begin
                     MyTable.Edit;
                     MyTable.FieldByName('TimesUsed').Value := MyQuery.FieldByName('BullCount').Value;
                     MyTable.Post;
                  end;
              MyQuery.Next;
           end;

        {
        // get the Count of Successfull PDS
        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('SELECT *');
        MyQuery.SQL.Add('FROM Events');
        MyQuery.SQL.Add('WHERE ( EventType = 2 ) OR ( EventType = 3 )'); // Illiminate Bulls not selected
        MyQuery.SQL.Add('ORDER BY AnimalID, AnimalLactNo, EventType, EventDate');
        MyQuery.Open;

        MyQuery.First;
        if NOT MyQuery.EOF then
           begin
              LastAnimal := MyQuery.FieldByName('AnimalId').Value;
              LastLact := MyQuery.FieldByName('AnimalLactNo').Value;
              LastType := MyQuery.FieldByName('EventType').Value;
              CurrAnimal := MyQuery.FieldByName('AnimalId').Value;
              CurrLact := MyQuery.FieldByName('AnimalLactNo').Value;
              CurrType := MyQuery.FieldByName('EventType').Value;
              while NOT MyQuery.EOF do
                begin
                  LastEvent := MyQuery.FieldByName('Id').Value;
                  // Next Record
                  MyQuery.Next;
                  CurrAnimal := MyQuery.FieldByName('AnimalId').Value;
                  CurrLact := MyQuery.FieldByName('AnimalLactNo').Value;
                  CurrType := MyQuery.FieldByName('EventType').Value;
                  if ( CurrAnimal <> LastAnimal ) or
                     ( CurrLact <> LastLact ) or
                     ( CurrType <> LastType ) then
                     begin
                       // Check event and add to successes
                       if WinData.LookUpServices.Locate('EventID',LastEvent,[] ) then
                         if MyTable.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').Value,[]) then
                           begin
                             MyTable.Edit;
                             MyTable.FieldByName('NoSucc').AsInteger := MyTable.FieldByName('NoSucc').AsInteger + 1;
                             MyTable.Post;
                          end;
                     end;
                  LastAnimal := MyQuery.FieldByName('AnimalId').Value;
                  LastLact := MyQuery.FieldByName('AnimalLactNo').Value;
                  LastType := MyQuery.FieldByName('EventType').Value;
                end;
           end;
        }

     // Update for Euro
     if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
        with MyQuery do
           begin
              SQL.Clear;
              SQL.Add('UPDATE BullsUsedInHerd Set PricePerStraw = PricePerStraw * '+FloatToStr(cEuro)+' ');
              ExecSQL;
           end;

        with BullrptScr Do
           begin
              qBull2.Close;
              qBull2.SQL.Clear;

              qBull2.SQL.Add('SELECT *');
              qBull2.SQL.Add('FROM "BullsUsedInHerd"');
              qBull2.SQL.Add('ORDER BY SortAnimalNo');

              qBull2.Open;
           end;

        if ( Sender as TRxSpeedButton ).Name = 'sbView' then
           Begin
              With BullRptScr.qBull2 do
                 BullRptScr.Preview;
           End
        else
           Begin
              With BullRptScr.qBull2 do
                   begin
                      If Windata.PrintDialog1.Execute then
                         begin
                              BullRptScr.PrinterSettings.FirstPage := Windata.PrintDialog1.FromPage;
                              BullRptScr.PrinterSettings.LastPage := Windata.PrintDialog1.ToPage;
                              BullRptScr.PrinterSettings.Copies := Windata.PrintDialog1.Copies;
                              BullRptScr.Print;
                         End;
                   End;
           End;
     finally
        MyTable.Close;
        MyTable.DeleteTable;
        MyTable.Free;
        MyQuery.Close;
        MyQuery.Free;
     end;
end;

procedure TBullReportsFilter.ViewBtnClick(Sender: TObject);
begin

   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   sbView.Enabled := False;
   sbPrint.Enabled := False;

   try
      If pBullsInHerd.Visible Then
         Try
            BullRptscr := TBullRptscr.Create(nil);
            With bullRptScr Do
               begin
                  VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
                  BuildTable(Sender);
               End;
         finally
            BullRptscr.Free;
         end
      // Sire Selection Rep.
      else if pSireSelection.Visible then
         try
            SireSelectionScr := TSireSelectionScr.Create(nil);
            with SireSelectionScr do
              begin
                 WinData.qBull.SQL.Clear;
                 WinData.qBull.Close;
                 VerLabel1.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
                 WinData.qBull.SQL.Add('SELECT DISTINCT (D.AICode), D.Name, D.MilkPredDiff, D.RBI, D.FatKgs, D.FatPerc, ');
                 WinData.qBull.SQL.Add('                D.ProtKgs, D.ProtPerc, D.Reliability, D.CalvingInterval, D.Survival, D.Udder, D.Legs');
                 WinData.qBull.SQL.Add('FROM "Sires.DB" D');
                 If (cbAllSires.Checked = False) then
                    begin
                       SireSelectionScr.lUsingFilter.Caption := 'Filtered Sire Selection';
                       WinData.qBull.SQL.Add('WHERE ( D.RBI Between ' +  RBIFrom.Text + ' And ' + RBITo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.MilkPredDiff Between ' + MilkKgsFrom.Text + ' And ' + MilkKgsTo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.FatKgs Between ' + FatKgsFrom.Text + ' And ' + FatKgsTo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.FatPerc Between ' + FatPercFrom.Text + ' And ' + FatPercTo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.ProtKgs Between ' + ProtKgsFrom.Text + ' And ' + ProtKgsTo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.ProtPerc Between ' + ProtPercFrom.Text + ' And ' + ProtPercTo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.Reliability Between ' + ReliabFrom.Text + ' And ' + ReliabTo.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.CalvingInterval Between ' + FromCalvInt.Text + ' And ' + ToCalvInt.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.Survival Between ' + FromSurviv.Text + ' And ' + ToSurviv.Text + ') ');
                       WinData.qBull.SQL.Add('And ( D.Udder Between ' + FromOverAllUdder.Text + ' And ' + ToOverAllUdder.Text + ')');
                       WinData.qBull.SQL.Add('And ( D.Legs Between ' + FromFeetLegs.Text + ' And ' + ToFeetLegs.Text + ')');
                    end
                 else
                    SireSelectionScr.lUsingFilter.Caption := 'All Sires Selected';

                 WinData.qBull.SQL.Add('ORDER BY D.AICode, D.Name');
                 Windata.qBull.Open;
                 if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                    Begin
                       With WinData.qBull do
                            begin
                                 SireSelectionScr.RptTitle.Font.Color := ClRed;
                                 SireSelectionScr.Detail.Font.Color := ClNavy;
                                 SireSelectionScr.Summary.Font.Color := ClNavy;
                                 SireSelectionScr.Preview;
                            End;
                    End
                 else
                    Begin
                       With WinData.qBull do
                            begin
                                 SireSelectionScr.RptTitle.Font.Color := ClBlack;
                                 SireSelectionScr.Detail.Font.Color := ClBlack;
                                 SireSelectionScr.Summary.Font.Color := ClBlack;
                                 Windata.CallPrintDialog(SireSelectionScr);
                            End;
                    End;
              end;
         finally
            SireSelectionScr.Free;
         end;
   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TBullReportsFilter.FormShow(Sender: TObject);
begin
   If pBullsInHerd.Visible Then
      begin
         cbNotAvail.Checked := False;
      end
   else if pSireSelection.Visible Then
      begin
         RBIFrom.SetFocus;
      end;
end;

procedure TBullReportsFilter.ExtFiltClick(Sender: TObject);
begin
{   //Visible := False;
   // Hide;
   Width := 10;
   Height := 10;
   Left := 400;
   Close; }
   WinData.CreateAndShowForm(TfExtSiresFilt);
end;

procedure TBullReportsFilter.cbAllSiresClick(Sender: TObject);
begin
   If (cbAllSires.Checked = True) then
      main.Enabled := False
   else
      main.Enabled := True;
end;

procedure TBullReportsFilter.sbHelpClick(Sender: TObject);
begin
  if Caption = 'Sire Selection' then
     WinData.HTMLHelp('bullsudinhdrpt.htm');
end;

procedure TBullReportsFilter.SetReportType(RptType: Integer);
begin
   if ( RptType = 1 ) then
      begin
         //   14/04/12 [V5.0 R4.9] /MK Additional Feature - New Variable For ReportType.
         ReportType := rtSireSelect;
         cbFavourite.Checked := WinData.IsReportFavourite(cSireSelectRep);
         WinData.UpdateRecentReportUsage(cSireSelectRep);
         Caption := 'Sire Selection';
         pBullsInHerd.Hide;
         pSireSelection.Show;
      end
   else
      begin
         //   14/04/12 [V5.0 R4.9] /MK Additional Feature - New Variable For ReportType.
         ReportType := rtBullReport;
         cbFavourite.Checked := WinData.IsReportFavourite(cBullRep);
         WinData.UpdateRecentReportUsage(cBullRep);
         main.Hide;
         Caption := 'Bulls Used In Herd';
         pSireSelection.Hide;
         pBullsInHerd.Show;
         cbAllSires.Visible := False;
         ExtFilt.Visible    := False;
         Width:= 400;
         Height := 250;
      end;
end;

procedure TBullReportsFilter.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;
end;

procedure TBullReportsFilter.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TBullReportsFilter.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TBullReportsFilter.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TBullReportsFilter.cbFavouriteClick(Sender: TObject);

   procedure AddRemoveFavourite ( AAddRemove : Boolean; AReportConst : String );
   begin
      if AAddRemove then
         begin
            WinData.SetReportAsFavourite(AReportConst,True);
            cbFavourite.Style.TextColor := clBlue;
            cbFavourite.StyleHot.TextColor := clBlue;
         end
      else
         begin
            WinData.SetReportAsFavourite(AReportConst,False);
            cbFavourite.Style.TextColor := clBlack;
            cbFavourite.StyleHot.TextColor := clBlack;
         end;
      Application.ProcessMessages;
      Update;
   end;

begin
   if ( ReportType = rtBullReport ) then
      AddRemoveFavourite(cbFavourite.Checked,cBullRep)
   else if ( ReportType = rtSireSelect ) then
      AddRemoveFavourite(cbFavourite.Checked,cSireSelectRep);
end;

end.
