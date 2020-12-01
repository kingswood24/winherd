{
   12/11/10 [V4.0 R5.6] /MK Additional Feature - If Country Is England Then Move SCC To Bottom Of SortOptions.

   29/11/10 [V4.0 R6.0] /MK Additional Feature - Second Show Option For Milk Value or Solids.
                                               - Saving of New Radion Group In Report Defaults.

   30/11/10 [V4.0 R6.1] /MK Bug - Hide Hint On Milk Pricing Click.

   22/12/10 [V4.0 R7.3] /MK Change - Move Total Solids after Total Yield in Sort Options.
                                   - DO NOT SAVE REPORT DEFAULTS For ShowSccOrIndex Or ShowSoldsOrValue.

   18/01/11 [V4.0 R7.7] /MK Change - TotalTotalSolids Change to 305TotalSolids - GL.

   17/02/11 [V4.0 R8.2] /MK Bug Fix - BestCowsReportQuery Was Not Checking If Month Between From Month And To Month.

   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   06/03/13 [V5.1 R5.0] /MK Bug Fix - If FeedCosts is null then set Feed Costs to zero(0) so Margin calculation works.
                                    - On rgShowSolidsorValue.OnClick not showing SortOptions.Item.Caption as Milk Value.

   04/11/13 [V5.2 R5.1] /MK Bug Fix - Summary at the end of the report was only showing for Milk Value.

   28/01/14 [V5.2 R7.8] /MK Change - Change all instances of Calving Index to Calving Interval - GL Request.

   18/04/16 [V5.5 R5.0] /MK Bug Fix - Average in summary was only showing Milk Value - DOM reported.
}

unit BreedingAnalysisFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBTables, RXSpin, Gauges, DbPrgrss,
  RXLookup, RXCtrls, ComCtrls, ToolWin, ReportDefaults, GenTypesConst,
  cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TBreedingAnalysisFilter = class(TForm)
    pBestCowsInHerd: TPanel;
    SortOptions: TRadioGroup;
    CalfLabel: TLabel;
    LactLabel: TLabel;
    MonthToLabel: TLabel;
    CalfToLabel: TLabel;
    rgShowSCCorInterval: TRadioGroup;
    LactationRadioGroup: TRadioGroup;
    TopTenCow: TCheckBox;
    AscendingRadioGroup: TRadioGroup;
    FromCalf: TRxSpinEdit;
    FromLact: TRxSpinEdit;
    ToCalf: TRxSpinEdit;
    ToLact: TRxSpinEdit;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    TempTable: TTable;
    TempQuery: TQuery;
    sbPricing: TRxSpeedButton;
    ToolButton4: TToolButton;
    cbUseFilter: TCheckBox;
    rgShowSolidsorValue: TRadioGroup;
    cbFavourite: TcxCheckBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgShowSCCorIntervalClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbPricingClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure rgShowSolidsorValueClick(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    BestCowsInHerdDefaults : TBestCowsInHerdDefaults;
    WhichReg : TCountry;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
    function GetSortOptionSelection : String;
  public
    { Public declarations }
  end;

  procedure ShowForm;

var
   BreedingAnalysisFilter: TBreedingAnalysisFilter;

implementation

uses
   DairyData,
  // CowsInMilk,
   BestCowsInHerd,
   uMilkPricing;

{$R *.DFM}

  procedure ShowForm;
  begin
     Application.CreateForm(TBreedingAnalysisFilter, BreedingAnalysisFilter);
     try
        if not WinData.ExportToPDA then
           BreedingAnalysisFilter.ShowModal
        else
           BreedingAnalysisFilter.sbView.Click;
     finally
        BreedingAnalysisFilter.Free;
     end;
  end;

procedure TBreedingAnalysisFilter.ExitBtnClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

procedure TBreedingAnalysisFilter.FormShow(Sender: TObject);
begin
   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   cbUseFilter.Visible := WinData.ActiveFilter;
   if not cbUseFilter.Visible then
      begin
         cbUseFilter.Checked := False;
         cbUseFilter.Top := 5;
         SortOptions.Top := 29;
         SortOptions.Height := 320;
      end
   else
      cbUseFilter.Checked := True;

   SortOptions.Items.Clear;
   WhichReg := WinData.DefCountry( WinData.AnimalFileByIDHerdID.AsInteger);

   SortOptions.Items.Add('Cow Number');
   SortOptions.Items.Add('Lactation Number');
   SortOptions.Items.Add('Calving Month');
   SortOptions.Items.Add('Calving Year');
   SortOptions.Items.Add('Days In Milk');
   SortOptions.Items.Add('EBI');
   SortOptions.Items.Add('S.C.C.');
   SortOptions.Items.Add('305 Day Yield');
   SortOptions.Items.Add('Total Yield');
   SortOptions.Items.Add('305 Butterfat %');
   SortOptions.Items.Add('305 Butterfat (Kg)');
   SortOptions.Items.Add('Total Butterfat (&Kgs)');
   SortOptions.Items.Add('305 Protein %');
   SortOptions.Items.Add('305 Protein (K&gs)');
   SortOptions.Items.Add('Total Protein (Kgs)');
   SortOptions.Items.Add('Total Solids');
   SortOptions.Items.Add('Feed Costs');
   SortOptions.Items.Add('Feed Margin');

   LoadScreenDefaults;

   //   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cBestCowsInHerdRep);
   WinData.UpdateRecentReportUsage(cBestCowsInHerdRep);
end;

procedure TBreedingAnalysisFilter.ViewBtnClick(Sender: TObject);
var
   IsPreg   : String;
   TempDate : TDateTime;
   NoCalves : Integer;  // Needed to allow the GetProjCalving Function Run
   BestProgressBar : TProgressBar;
   SortSelection : string;
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   sbView.Enabled := False;
   sbPrint.Enabled := False;

   try
      TempTable.DatabaseName := WinData.KingData.DatabaseName;
      TempTable.TableName := 'BestCowsInHerd';
      // Create a Temporary table to hold IDs for Valid Animals
      with TempTable do
         begin
            FieldDefs.Clear;
            FieldDefs.Add('AID',ftInteger,0,FALSE);
            FieldDefs.Add('ALactNo',ftInteger,0,FALSE);
            FieldDefs.Add('ThisLactCalvingDate',ftDate,0,FALSE);
            FieldDefs.Add('NextLactCalvingDate',ftDate,0,FALSE);
            FieldDefs.Add('EventType',ftInteger,0,FALSE);
            FieldDefs.Add('FeedCosts',ftFloat,0,FALSE);
            // Put ID and LactNo as a primary index to stop duplicates
            IndexDefs.Clear;
            // All Lactations DO NOT ALLOW Dup IDs/LactNo
            if LactationRadioGroup.ItemIndex = 0 then
               IndexDefs.Add('','AID;ALactNo',[ixPrimary,ixUnique])
            else  // Last Lactation DO NOT ALLOW Dup IDs
               IndexDefs.Add('','AID',[ixPrimary,ixUnique]);
            CreateTable;
         end;
      with TempQuery do
         begin
            // Insert All Dried off Records for the Current lactation
            SQL.Clear;
            SQL.Add('INSERT INTO BestCowsInHerd');
            SQL.Add('(AID, ALactNo,ThisLactCalvingDate,EventType)');
            SQL.Add('SELECT A.ID AID, A.LactNo ALactNo, E.EventDate, E.EventType');
            SQL.Add('FROM Animals A, Events E');
            if cbUseFilter.Checked then
               begin
                  SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
               end;
            SQL.Add('WHERE (A.ID=E.AnimalID)');
            SQL.Add('AND (A.LactNo=E.AnimalLactNo)');
            SQL.Add('AND (A.LactNo >= ' + FromLact.Text + ') and (A.Lactno <= ' + ToLact.Text + ')');
            SQL.Add('AND (E.EventType = ' + IntToStr(CDryOffEvent) + ')');
            SQL.Add('AND (EXTRACT(MONTH From E.EventDate) >= ' + FromCalf.Text + ') and (EXTRACT(MONTH From E.EventDate) <= ' + ToCalf.Text + ')');
            SQL.Add('AND (A.InHerd  = TRUE)');
            SQL.Add('AND (A.AnimalDeleted=FALSE)');
            try
               ExecSQL;
            except
               //
            end;
         end;
      if LactationRadioGroup.ItemIndex = 0 then
         with TempQuery do
            begin
               // All Lactations
               // Insert All Last Calving ID's LactNo's
               // The Primary Index will stop a Duplicate of ID/LactNo
               SQL.Clear;
               SQL.Add('INSERT INTO BestCowsInHerd');
               SQL.Add('(AID, ALactNo,ThisLactCalvingDate,EventType)');
               SQL.Add('SELECT E.AnimalID AID, E.AnimalLactNo ALactNo, E.EventDate, E.EventType');
               SQL.Add('FROM Events E, Animals A');
               if cbUseFilter.Checked then
                  begin
                     SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
                  end;
               SQL.Add('WHERE (E.AnimalID=A.ID)');
               SQL.Add('AND (E.AnimalLactNo<=A.LactNo)');
               SQL.Add('AND (E.EventType = ' + IntToStr(cCalvingEvent) + ')');
               SQL.Add('AND (EXTRACT(MONTH From E.EventDate) >= ' + FromCalf.Text + ') and (EXTRACT(MONTH From E.EventDate) <= ' + ToCalf.Text + ')');
               SQL.Add('AND (E.AnimalLactNo >= ' + FromLact.Text + ') and (E.AnimalLactno <= ' + ToLact.Text + ')');
               SQL.Add('AND (A.InHerd  = TRUE)');
               SQL.Add('AND (A.AnimalDeleted=FALSE)');
               try
                  ExecSQL;
               except
                  //
               end;
            end
      else
         with TempQuery do
            begin
               // Last Completed
               // Insert All Calving for the Previous Lactation
               // The Primary Index will stop a Duplicate of ID/LactNo
               SQL.Clear;
               SQL.Add('INSERT INTO BestCowsInHerd');
               SQL.Add('(AID, ALactNo,ThisLactCalvingDate,EventType)');
               SQL.Add('SELECT E.AnimalID AID, E.AnimalLactNo ALactNo, E.EventDate,E.EventType');
               SQL.Add('FROM Events E, Animals A');
               if cbUseFilter.Checked then
                  begin
                     SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
                  end;
               SQL.Add('WHERE (E.AnimalID = A.ID)');
               SQL.Add('AND (E.AnimalLactNo = A.LactNo-1) AND (A.LactNo > 1)');
               SQL.Add('AND (E.EventType = ' + IntToStr(cCalvingEvent) + ')');
               SQL.Add('AND (EXTRACT(MONTH From E.EventDate) >= ' + FromCalf.Text + ') and (EXTRACT(MONTH From E.EventDate) <= ' + ToCalf.Text + ')');
               SQL.Add('AND (A.LactNo-1 >= ' + FromLact.Text + ') and (A.Lactno-1 <= ' + ToLact.Text + ')');
               SQL.Add('AND (A.InHerd  = True)');
               SQL.Add('AND (A.AnimalDeleted=FALSE)');
               try
                  ExecSQL;
               except
                  //
               end;
            end;

      with TempTable do
         begin
            // Last Completed
            // Process the Temp Table to get The NextCalvingDate or if
            // Dried Off record the Projected Calving Index
            Open;
            First;
            try
               BestProgressBar := TProgressBar.Create(nil);
               BestProgressBar.Parent := pBestCowsInHerd;
               BestProgressBar.Align := alBottom;
               BestProgressBar.BringToFront;
               BestProgressBar.Step := 1;
               pBestCowsInHerd.Refresh;
               BestProgressBar.Min := 0;
               BestProgressBar.Max := (RecordCount*2);
            except
               BestProgressBar.Free;
            end;
            // Feed Costs added 23/11/00 - kr
            while (NOT TempTable.EOF) do
               begin
                  with TempQuery do
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add('SELECT * FROM FeedEvents F, Animals A');
                        SQL.Add('WHERE (F.AnimalID = A.ID)');
                        SQL.Add('And (F.AnimalID = "' + TempTable.FieldByName('AID').AsString + '")');
                        SQL.Add('And (F.Lact = "' + TempTable.FieldByName('ALactNo').AsString + '")');
                        Open;
                        First;
                        while (NOT TempQuery.EOF) do
                           begin
                              TempTable.Edit;
                              if fieldByName('EndDate').asfloat = 0 then
                                 TempTable.FieldByName('FeedCosts').AsFloat := ((TempTable.FieldByName('FeedCosts').AsFloat) + (FieldByName('CostDay').AsFloat*(Date()- FieldByName('AllocDate').AsDateTime)))
                              else
                                 TempTable.FieldByName('FeedCosts').AsFloat := ((TempTable.FieldByName('FeedCosts').AsFloat) +
                                                                                (FieldByName('CostDay').AsFloat*(FieldByName('EndDate').AsDateTime-FieldByName('AllocDate').AsDateTime)));
                              TempTable.Post;
                              TempQuery.Next;
                           end;
                     end;
                  TempTable.Next;
                  try
                     BestProgressBar.StepIt;
                  except
                     //
                  end;

                 // Check whether conversion is done then find out if pound r euro is selected.
                 if ((WinData.UseEuro) AND NOT(WinData.ReportInEuro)) then
                       try
                          with TempQuery do
                             begin
                                SQL.Clear;
                                SQL.Add('UPDATE '+TempTable.TableName+' Set FeedCosts = (FeedCosts*'+FloatToStr(cEuro)+')');
                                ExecSQL;
                             end;
                       except
                          //
                       end;
               end;
            // back to start
            First;
            while NOT EOF do
               begin
                  // Find the Last Calving Record
                  if (FieldByName('EventType').AsInteger = cDryOffEvent) then
                     begin
                        // Using Drying Off Record so Get This Lact Calving Date
                        Edit;
                        // Get the Projected Calving Date save as NEXT Calving Date
                        TempDate := WinData.GetProjCalving(FieldByName('AID').AsInteger,FieldByName('ALactNo').AsInteger,NoCalves, IsPreg);
                        if TempDate <> 0 then
                           FieldByName('NextLactCalvingDate').AsDateTime := TempDate;
                        // Get the Current Calving Date
                        if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                           VarArrayOf([FieldByName('AID').AsInteger,FieldByName('ALactNo').AsInteger,cCalvingEvent]),
                           [] ) then
                           FieldByName('ThisLactCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     end
                  else  // Get the Next Calving Date
                     if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                        VarArrayOf([FieldByName('AID').AsInteger,FieldByName('ALactNo').AsInteger+1,cCalvingEvent]),
                        [] ) then
                        begin
                           Edit;
                           FieldByName('NextLactCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        end;
                  Next;
                  try
                     BestProgressBar.StepIt;
                  except
                     //
                  end;
               end;
            Close;
            try
               BestProgressBar.Free;
            except
               //
            end;
         end;

      //   06/03/13 [V5.1 R5.0] /MK Bug Fix - If FeedCosts is null then set Feed Costs to zero(0) so Margin calculation works.
      TempQuery.SQL.Clear;
      TempQuery.SQL.Add('UPDATE '+TempTable.TableName+' SET FeedCosts = 0 WHERE FeedCosts Is Null');
      TempQuery.ExecSQL;

      BestCowsInHerdScr := TBestCowsInHerdScr.Create(nil);
      if (pBestCowsInHerd.Visible) then
         begin
            // Hide the Headings
            with BestCowsInHerdScr do
               begin
                  if rgShowSCCorInterval.ItemIndex = 0 then // Show SCC
                     begin
                        lCalvingInterval.Caption := '';
                        lCalvingInterval.Caption := 'S.C.C.';
                        CalvingInterval.DataField := 'SCC';
                     end
                  else
                     begin
                        lCalvingInterval.Caption := '';
                        lCalvingInterval.Caption := 'Calving Interval';
                        CalvingInterval.DataField := 'CalvingInterval';
                     end;
                  if rgShowSolidsorValue.ItemIndex = 0 then // Show SCC
                     begin
                        lMilkValue.Caption := '';
                        lMilkValue.Caption := 'Total Solids';
                        MilkValue.DataField := 'TotalSolidsTotalKgs';
                     end
                  else
                     begin
                        lMilkValue.Caption := '';
                        lMilkValue.Caption := 'Milk Value';
                        MilkValue.DataField := 'MilkValue';
                     end;
               end;
            BestCowsInHerdScr.qBestCowsInHerd.SQL.Clear;
            BestCowsInHerdScr.qBestCowsInHerd.Close;
            with BestCowsInHerdScr.qBestCowsInHerd do
               begin
                  SQL.Add('SELECT DISTINCT A.AnimalNo, A.SortAnimalNo, A.InHerd, TA.ALactNo LactNo, TA.FeedCosts FeedCosts,');
                  SQL.Add('M.DailyYield,');
                  SQL.Add('M.SCC,');
                  SQL.Add('M.DailyBfatPerc, M.DailyProtPerc, M.DailyLactosePerc,');
                  SQL.Add('M.CumYield, M.CumBfatPerc,');
                  SQL.Add('M.CumProtPerc, M.CumLactosePerc, M.NoOfRecordings,');
                  SQL.Add('M.DaysInMilk, M.Yield305, M.BfatPerc305, M.ProtPerc305,');
                  SQL.Add('M.LactosePerc305, Extract(Year From TA.ThisLactCalvingDate ) as CalfYear,');
                  SQL.Add('TA.ThisLactCalvingDate, Extract(MONTH From TA.ThisLactCalvingDate ) as CalfMonth,');
                  SQL.Add('(M.Yield305*M.BfatPerc305)/100 BFat305Kgs,');
                  SQL.Add('(M.CumYield*M.CumBFatPerc)/100 BFatTotalKgs,');
                  SQL.Add('(M.Yield305*M.ProtPerc305)/100 Prot305Kgs,');
                  SQL.Add('(M.CumYield*M.CumProtPerc)/100 ProtTotalKgs,');
                  SQL.Add('((M.Yield305*M.ProtPerc305)/100+(M.Yield305*M.BfatPerc305)/100) TotalSolids305Kgs,');
                  SQL.Add('((M.CumYield*M.CumProtPerc)/100+(M.CumYield*M.CumBFatPerc)/100) TotalSolidsTotalKgs,');
                  if ((WinData.UseEuro) AND NOT(WinData.ReportInEuro)) then
                     begin
                        if WinData.OwnerFileMeasure.AsBoolean then // metric
                           begin
                              SQL.Add('(((M.CumYield/1.0297)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100)*'+FloatToStr(cEuro)+') MilkValue,');
                              SQL.Add('((((M.CumYield/1.0297)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100)-TA.FeedCosts)*'+FloatToStr(cEuro)+') Margin,');
                           end
                        else  // imperial
                           begin
                              SQL.Add('(((M.CumYield/4.6811)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100)*'+FloatToStr(cEuro)+') MilkValue,');
                              SQL.Add('((((M.CumYield/4.6811)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100)-TA.FeedCosts)*'+FloatToStr(cEuro)+') Margin,');
                           end;
                        BestCowsInHerdScr.lMilkValue.Caption := BestCowsInHerdScr.lMilkValue.Caption + ' ' + '£';
                        BestCowsInHerdScr.lTotal.Caption := BestCowsInHerdScr.lTotal.Caption + ' ' + '£';
                        BestCowsInHerdScr.lMargin.Caption := BestCowsInHerdScr.lMargin.Caption + ' ' + '£';
                     end
                  else
                     begin
                        if WinData.OwnerFileMeasure.AsBoolean then // metric
                           begin
                              SQL.Add('((M.CumYield/1.0297)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100) MilkValue,');
                              SQL.Add('(((M.CumYield/1.0297)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100)-TA.FeedCosts) Margin,');
                           end
                        else  // imperial
                           begin
                              SQL.Add('((M.CumYield/4.6811)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100) MilkValue,');
                              SQL.Add('(((M.CumYield/4.6811)*(O.MilkPrice+(((M.CumBFatPerc-O.BFatPerc)*O.BFatVar)*100)+(((M.CumProtPerc-O.ProtPerc)*O.ProtVar)*100))/100)-TA.FeedCosts) Margin,');
                           end;

                        if rgShowSolidsorValue.ItemIndex = 1 then
                           BestCowsInHerdScr.lMilkValue.Caption := BestCowsInHerdScr.lMilkValue.Caption + ' ' +'€';

                        BestCowsInHerdScr.lTotal.Caption := BestCowsInHerdScr.lTotal.Caption + ' ' +'€';
                        BestCowsInHerdScr.lMargin.Caption := BestCowsInHerdScr.lMargin.Caption + ' ' +'€';
                     end;

                   SQL.Add('(TA.NextLactCalvingDate-TA.ThisLactCalvingDate) CalvingInterval, TA.EventType, C.EBI');
                 end;

            with BestCowsInHerdScr.qBestCowsInHerd do
               begin // Set Up the Main Query use the TempTable
                 SQL.Add('FROM Animals A');
                 SQL.Add('INNER JOIN ' + TempTable.TableName + ' TA ON (TA.AID = A.ID)');
                 SQL.Add('INNER JOIN Owners  O  ON (O.ID = A.HerdID)');
                 SQL.Add('LEFT  JOIN MilkDisk M ON (TA.AID = M.AnimalID ) ');
                 SQL.Add('LEFT  JOIN CowExt   C ON (C.AnimalID=TA.AID)');
                 SQL.Add('WHERE (TA.ALactNo = M.LactNo)');
                 SQL.Add('AND (EXTRACT(MONTH From TA.ThisLactCalvingDate) >= ' + FromCalf.Text + ') and (EXTRACT(MONTH From TA.ThisLactCalvingDate) <= ' + ToCalf.Text + ')');
              end;

            if (Length(HerdCombo.value) > 0) Then
               BestCowsInHerdScr.qBestCowsInHerd.SQL.ADD(' AND ( A.HerdID = "' + HerdCombo.value + '" )');

            SortSelection := GetSortOptionSelection;
            if SortSelection = 'EBI' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by EBI');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.EBI.Font.Color := clRed;
                  BestCowsInHerdScr.EBI.Font.Style := [fsBold];
               end
            else if SortSelection = 'S.C.C.' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by M.SCC');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.CalvingInterval.Font.Color := clRed;
                  BestCowsInHerdScr.CalvingInterval.Font.Style := [fsBold];
               end
            else if SortSelection = 'Calving Interval' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by CalvingInterval');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.CalvingInterval.Font.Color := clRed;
                  BestCowsInHerdScr.CalvingInterval.Font.Style := [fsBold];
               end
            else if SortSelection = '305 Day Yield' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by M.Yield305');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.KGS305.Font.Color := clRed;
                  BestCowsInHerdScr.KGS305.Font.Style := [fsBold];
               end
            else if SortSelection = 'Total Yield' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by M.CumYield');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.KGSYIELD.Font.Color := clRed;
                  BestCowsInHerdScr.KGSYIELD.Font.Style := [fsBold];
               end
            else if SortSelection = '305 Butterfat %' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by M.CumBFatPerc');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.AvgBFat.Font.Color := clRed;
                  BestCowsInHerdScr.AvgBFat.Font.Style := [fsBold];
               end
            else if SortSelection = '305 Butterfat (Kg)' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by BFat305Kgs');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.BFat305Kgs.Font.Color := clRed;
                  BestCowsInHerdScr.BFat305Kgs.Font.Style := [fsBold];
               end
            else if SortSelection = 'Total Butterfat (&Kgs)' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by BFatTotalKgs');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.BFatTotalKgs.Font.Color := clRed;
                  BestCowsInHerdScr.BFatTotalKgs.Font.Style := [fsBold];
               end
            else if SortSelection = '305 Protein %' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by ProtPerc305 ');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.AvgProt.Font.Color := clRed;
                  BestCowsInHerdScr.AvgProt.Font.Style := [fsBold];
               end
            else if SortSelection = 'Total Protein (Kgs)' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by ProtTotalKgs');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.ProtTotalKgs.Font.Color := clRed;
                  BestCowsInHerdScr.ProtTotalKgs.Font.Style := [fsBold];
               end
            else if SortSelection = '305 Protein (K&gs)' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by Prot305Kgs');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.Prot305Kgs.Font.Color := clRed;
                  BestCowsInHerdScr.Prot305Kgs.Font.Style := [fsBold];
               end
            else if SortSelection = 'Cow Number' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by A.SortAnimalNo');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.AnimalNo.Font.Color := clRed;
                  BestCowsInHerdScr.AnimalNo.Font.Style := [fsBold];
               end
            else if SortSelection = 'Lactation Number' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by TA.ALactNo');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.LactNo.Font.Color := clRed;
                  BestCowsInHerdScr.LactNo.Font.Style := [fsBold];
               end
            else if SortSelection = 'Calving Month' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by CalfMonth');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.CalveDate.Font.Color := clRed;
                  BestCowsInHerdScr.CalveDate.Font.Style := [fsBold];
               end
            else if SortSelection = 'Calving Year' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('order by CalfYear');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.CalveDate.Font.Color := clRed;
                  BestCowsInHerdScr.CalveDate.Font.Style := [fsBold];
               end
            else if SortSelection = 'Days In Milk' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by M.DaysInMilk');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.DaysInMilk.Font.Color := clRed;
                  BestCowsInHerdScr.DaysInMilk.Font.Style := [fsBold];
               end
            else if SortSelection = 'Milk Value'then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by MilkValue');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection + ' ' + CurrencyString;
                  BestCowsInHerdScr.MilkValue.Font.Color := clRed;
                  BestCowsInHerdScr.MilkValue.Font.Style := [fsBold];
               end
            else if SortSelection = 'Total Solids'then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by TotalSolidsTotalKgs');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection;
                  BestCowsInHerdScr.MilkValue.Font.Color := clRed;
                  BestCowsInHerdScr.MilkValue.Font.Style := [fsBold];
               end
            else if SortSelection = 'Feed Costs' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by FeedCosts');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection + ' ' + CurrencyString;
                  BestCowsInHerdScr.FeedCosts.Font.Color := clRed;
                  BestCowsInHerdScr.FeedCosts.Font.Style := [fsBold];
               end
            else if SortSelection = 'Feed Margin' then
               begin
                  BestCowsInHerdScr.qBestCowsInHerd.SQL.Add('Order by Margin');
                  BestCowsInHerdScr.SortedByLabel.Caption := SortSelection + ' ' + CurrencyString;
                  BestCowsInHerdScr.Margin.Font.Color := clRed;
                  BestCowsInHerdScr.Margin.Font.Style := [fsBold];
               end;

            case AscendingRadioGroup.ItemIndex Of
               0: begin
                     BestCowsInHerdScr.qBestCowsInHerd.SQL.Add(' Asc');
                     BestCowsInHerdScr.OrderLabel.Caption := 'In Ascending Order';
                  end;
               1: begin
                     BestCowsInHerdScr.qBestCowsInHerd.SQL.Add(' Desc');
                     BestCowsInHerdScr.OrderLabel.Caption := 'In Descending Order';
                  end;
         end;

            BestCowsInHerdScr.qBestCowsInHerd.Open;
            // set captions for metric/imperial
            if WinData.OwnerFileMeasure.AsBoolean then // metric
               begin
                  //
               end
            else // imperial
               begin
                  //
               end;

            //   04/11/13 [V5.2 R5.1] /MK Bug Fix - Summary at the end of the report was only showing for Milk Value.
            if ( rgShowSolidsorValue.ItemIndex = 0 ) then
               begin
                  BestCowsInHerdScr.QRExpr18.Expression := 'SUM(qBestCowsInHerd.TotalSolidsTotalKgs)';
                  //   18/04/16 [V5.5 R5.0] /MK Bug Fix - Average in summary was only showing Milk Value - DOM reported.
                  BestCowsInHerdScr.QRExpr19.Expression := 'AVERAGE(qBestCowsInHerd.TotalSolidsTotalKgs)';
               end
            else if ( rgShowSolidsorValue.ItemIndex = 1 ) then
               begin
                  BestCowsInHerdScr.QRExpr18.Expression := 'SUM(qBestCowsInHerd.MilkValue)';
                  //   18/04/16 [V5.5 R5.0] /MK Bug Fix - Average in summary was only showing Milk Value - DOM reported.
                  BestCowsInHerdScr.QRExpr19.Expression := 'AVERAGE(qBestCowsInHerd.MilkValue)';
               end;

            if not WinData.ExportToPDA then
               begin

                  if (Sender as TRxSpeedButton).Name = 'sbView' then
                     begin
                         with BestCowsInHerdScr.qBestCowsInHerd DO
                            begin
                               BestCowsInHerdScr.RptTitle.Font.Color := clRed;
                               BestCowsInHerdScr.Detail.Font.Color := clNavy;
                               BestCowsInHerdScr.Summary.Font.Color := clNavy;
                               BestCowsInHerdScr.Preview;
                            end;
                     end
                  else
                     begin
                        with BestCowsInHerdScr.qBestCowsInHerd Do
                           begin
                              BestCowsInHerdScr.RptTitle.Font.Color := ClBlack;
                              BestCowsInHerdScr.Detail.Font.Color := ClBlack;
                              BestCowsInHerdScr.Summary.Font.Color := ClBlack;
                              Windata.CallPrintDialog(BestCowsInHerdScr);
                           end;
                     end;
               end
            else
               begin
                  WinData.PDALinkExport.ExportReport( BestCowsInHerdScr );
               end;

         end;
   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
      BestCowsInHerdScr.Free;
      if TempTable.Active then
         TempTable.Close;
      TempTable.DeleteTable;
   end;
end;

procedure TBreedingAnalysisFilter.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
      sbExit.Click;
end;

procedure TBreedingAnalysisFilter.rgShowSCCorIntervalClick(Sender: TObject);
var
   i : Integer;
begin
   //for i := Sortoptions.Items.Count-1 downto 16 do
   //   SortOptions.Items.Delete(i);

   // Changed by Shane Pilkington.
   // Rename SCC or Calving Index based on User selection.
   if rgShowSCCorInterval.ItemIndex = 0 then // SCC
      begin
         if SortOptions.Items.IndexOf('Calving Interval') > -1 then
            SortOptions.Items[SortOptions.Items.IndexOf('Calving Interval')] := 'S.C.C.';
      end
   else  // Calving Index
      begin
         if SortOptions.Items.IndexOf('S.C.C.') > -1 then
            SortOptions.Items[SortOptions.Items.IndexOf('S.C.C.')] := 'Calving Interval';
      end;
end;

procedure TBreedingAnalysisFilter.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('BestCows.htm');
end;

procedure TBreedingAnalysisFilter.sbPricingClick(Sender: TObject);
begin
   // open milk pricing screen
   WinData.cxHint.HideHint;
   WinData.CreateAndShowForm(TfMilkPricing);
end;

procedure TBreedingAnalysisFilter.LoadScreenDefaults;
var
   IR : TIntRange;
begin
   BestCowsInHerdDefaults := TBestCowsInHerdDefaults.Create(cRD_BestCowsInHerd);
   try
//      rgShowSCCorIndex.ItemIndex := BestCowsInHerdDefaults.ShowSCCorIndex;
//      rgShowSolidsorValue.ItemIndex := BestCowsInHerdDefaults.ShowSolidsorValue;
      SortOptions.ItemIndex := BestCowsInHerdDefaults.SortField;
      AscendingRadioGroup.ItemIndex := BestCowsInHerdDefaults.SortOrder;
      LactationRadioGroup.ItemIndex := BestCowsInHerdDefaults.LactationType;
      TopTenCow.Checked := BestCowsInHerdDefaults.PrintTopTenPerc;

      IR := BestCowsInHerdDefaults.LactRange;
      FromLact.AsInteger := IR.IntFrom;
      ToLact.AsInteger  := IR.IntTo;

      if IR.IntTo = 0 then ToLact.Value := 30;

      IR := BestCowsInHerdDefaults.CalvingMonth;
      FromCalf.AsInteger := IR.IntFrom;
      ToCalf.AsInteger := IR.IntTo;

      if IR.IntTo = 0 then ToCalf.Value := 12;
   finally
      FreeAndNil(BestCowsInHerdDefaults);
   end;
end;

procedure TBreedingAnalysisFilter.SaveScreenDefaults;
var
   IR : TIntRange;
begin
   BestCowsInHerdDefaults := TBestCowsInHerdDefaults.Create(cRD_BestCowsInHerd);
   try
//      BestCowsInHerdDefaults.ShowSCCorIndex := rgShowSCCorIndex.ItemIndex;
//      BestCowsInHerdDefaults.ShowSolidsorValue := rgShowSolidsorValue.ItemIndex;
      BestCowsInHerdDefaults.SortField := SortOptions.ItemIndex;
      BestCowsInHerdDefaults.SortOrder := AscendingRadioGroup.ItemIndex;
      BestCowsInHerdDefaults.LactationType := LactationRadioGroup.ItemIndex;
      BestCowsInHerdDefaults.PrintTopTenPerc := TopTenCow.Checked;
      IR.IntFrom := FromLact.AsInteger;
      IR.IntTo := ToLact.AsInteger;
      BestCowsInHerdDefaults.LactRange := IR;
      IR.IntFrom := FromCalf.AsInteger;
      IR.IntTo := ToCalf.AsInteger;
      BestCowsInHerdDefaults.CalvingMonth := IR;
   finally
      FreeAndNil(BestCowsInHerdDefaults);
   end;
end;

procedure TBreedingAnalysisFilter.FormDestroy(Sender: TObject);
begin
   SaveScreenDefaults;
   WinData.cxHint.HideHint;
end;

procedure TBreedingAnalysisFilter.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      cbUseFilter.Font.Color := clBlue
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TBreedingAnalysisFilter.FormActivate(Sender: TObject);
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

procedure TBreedingAnalysisFilter.sbViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   WinData.cxHint.HideHint;
end;

procedure TBreedingAnalysisFilter.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
end;

function TBreedingAnalysisFilter.GetSortOptionSelection: String;
begin
   Result := SortOptions.Items[SortOptions.ItemIndex];
end;

procedure TBreedingAnalysisFilter.rgShowSolidsorValueClick(
  Sender: TObject);
begin
   if ( rgShowSolidsorValue.ItemIndex = 0 ) then // Milk Value
      begin
         if SortOptions.Items.IndexOf('Milk Value') > -1 then
            SortOptions.Items[SortOptions.Items.IndexOf('Milk Value')] := 'Total Solids';
      end
   else if ( rgShowSolidsorValue.ItemIndex = 1 ) then // Total Solids
      begin
         if SortOptions.Items.IndexOf('Total Solids') > -1 then
            SortOptions.Items[SortOptions.Items.IndexOf('Total Solids')] := 'Milk Value';
      end;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TBreedingAnalysisFilter.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cBestCowsInHerdRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cBestCowsInHerdRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
