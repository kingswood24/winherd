{
   08/11/11 [V5.0 R1.9] /MK Change - New way of checking for Non Detected Oestrus.

   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   02/07/12 [V5.0 R7.4] /MK Change - LCalv2Serv.AutoSize := True.

   13/09/12 [V5.0 R9.9] /MK Bug Fix - Fixed Breeding Start date printing showing 30/12/1899
                                    - "No services" message was show "#13" in message instead of showing on new line.

   16/10/14 [V5.3 R8.5] /MK Additional Feature - Added percentage of first 6 weeks calvings to report - Donal Kiely.

   21/10/14 [V5.3 R8.6] /MK Change - Moved 6 week calving percentage before Breeding Started Date - GL request.

   24/10/14 [V5.3 R8.6] /MK Change - Round 6 week calving percentage - GL Request.

   09/09/19 [V5.9 R0.3] /MK Additional Feature - Added herd fertility performance to the end of the report similar to ICBF - Captal/GL request.
                            Change - Changed the ShowTheForm form procedure to a Class Procedure so that it could be free'd when the form closes.

   12/09/19 [V5.9 R0.3] /MK Change - GL asked that TotalCows = AllServedCows. If the user records To Be Culled events then add (Cows Not Served & Not To Be Culled)) to TotalCows.
                                   - MoveCalculations - GL asked that we use new TotalCows replaces NoCowsServed, NoCowsPregAll, NoCowsCalvedForOestrusCalc and Eligibility so that there would
                                                        be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.

   18/09/19 [V5.9 R0.5] /MK Change - Added Cows Served and Breeding Cows Not Served counts beside Breeding Started - GL request.
                                   - Add legend at the bottom of the report to explain Breeding Cows Not Served and Pregnancy Rate star indicators - GL request.

   19/09/19 [V5.9 R0.5] /MK Bug Fix - AnimalsPregnant - Was not checking to see if the cows PregDiag date was after its last service date - Milo Murphy.                                    
}

unit uFertIndicesRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DBLookup, ComCtrls, Db,
  DBTables, ToolEdit, RXLookup, RXDBCtrl, RXSpin, Menus, Qrctrls, quickrpt,
  RXCtrls, ToolWin, QRExport, cxControls, cxContainer, cxEdit, cxCheckBox,
  KRoutines, uBreedingDataHelper, uApplicationLog;

type
  TfFertIndicesRpt = class(TForm)
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
    HerdNum: TRxDBLookupCombo;
    GenQuery: TQuery;
    qrFertIndices: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    Jan: TQRLabel;
    Feb: TQRLabel;
    Mar: TQRLabel;
    Apr: TQRLabel;
    May: TQRLabel;
    Jun: TQRLabel;
    Jul: TQRLabel;
    Aug: TQRLabel;
    Sep: TQRLabel;
    Oct: TQRLabel;
    Nov: TQRLabel;
    Dec: TQRLabel;
    LFeb: TQRLabel;
    LMar: TQRLabel;
    LApr: TQRLabel;
    LMay: TQRLabel;
    LJan: TQRLabel;
    LJun: TQRLabel;
    LJul: TQRLabel;
    LAug: TQRLabel;
    LSep: TQRLabel;
    LOct: TQRLabel;
    LNov: TQRLabel;
    LDec: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    LMeanCalv: TQRLabel;
    LBreedStart: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    LTarget: TQRLabel;
    QRLabel23: TQRLabel;
    LPregRate: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    LPregRateCalc: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    LServPerConCalc: TQRLabel;
    LCalv2ServCalc: TQRLabel;
    LCalv2ConcCalc: TQRLabel;
    LSubRateCalc: TQRLabel;
    LOestrusCalc: TQRLabel;
    LReturnsCalc: TQRLabel;
    LFertRateCalc: TQRLabel;
    LHeatRateCalc: TQRLabel;
    LServPerCon: TQRLabel;
    LCalv2Serv: TQRLabel;
    LCalv2Conc: TQRLabel;
    LSubRate: TQRLabel;
    LOestrus: TQRLabel;
    LReturns: TQRLabel;
    LFertRate: TQRLabel;
    LHeatRate: TQRLabel;
    QRLabel18: TQRLabel;
    LCalvFrom: TQRLabel;
    QRLabel19: TQRLabel;
    LCalvTo: TQRLabel;
    QRLabel13: TQRLabel;
    LSeasonFrom: TQRLabel;
    QRLabel48: TQRLabel;
    LSeasonTo: TQRLabel;
    LLactFrom: TQRLabel;
    QRLabel52: TQRLabel;
    LLactTo: TQRLabel;
    lforlactations: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QLSeason: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRBand2: TQRBand;
    LFooter1: TQRLabel;
    LFooter2: TQRLabel;
    TempEvents: TTable;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    btnFertBenchmarks: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    LFromDate: TLabel;
    LToDate: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LSeason: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pBarWait: TProgressBar;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    RadioGroup1: TRadioGroup;
    rbSpring: TRadioButton;
    rbAutumn: TRadioButton;
    eFirstLact: TRxSpinEdit;
    eLastLact: TRxSpinEdit;
    deStartBreed: TDateEdit;
    VoluntaryWaitingPeriod: TRxSpinEdit;
    cbFavourite: TcxCheckBox;
    qrlPerSixWeekCalvings: TQRLabel;
    qrlSixWeekPerc: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    l6WeekCowsHead: TQRLabel;
    l6WeekInCalfHead: TQRLabel;
    l6WeekPercHead: TQRLabel;
    lOvAllCowsHead: TQRLabel;
    lOvAllInCalfHead: TQRLabel;
    lOvAllPercHead: TQRLabel;
    lServConcServesHead: TQRLabel;
    lServConcInCalfHead: TQRLabel;
    lServConcNumHead: TQRLabel;
    l6WeekCows: TQRLabel;
    lOverallPregRate: TQRLabel;
    lServesConcep: TQRLabel;
    qrl6WkCowLact1: TQRLabel;
    qrl6WkCowLact2: TQRLabel;
    qrl6WkCowLact3To5: TQRLabel;
    qrl6WkCowLact6Plus: TQRLabel;
    qrl6WkCowCount: TQRLabel;
    qrl6WkInCalfLact1: TQRLabel;
    qrl6WkInCalfLact2: TQRLabel;
    qrl6WkInCalfLact3To5: TQRLabel;
    qrl6WkInCalfLact6Plus: TQRLabel;
    qrl6WkInCalfCount: TQRLabel;
    qrl6WkPercLact1: TQRLabel;
    qrl6WkPercLact2: TQRLabel;
    qrl6WkPercLact3To5: TQRLabel;
    qrl6WkPercLact6Plus: TQRLabel;
    qrl6WkPercCount: TQRLabel;
    qrlLact1Desc: TQRLabel;
    qrlLact2Desc: TQRLabel;
    qrlLact3To5Desc: TQRLabel;
    qrlLact6PlusDesc: TQRLabel;
    qrlOvAllDesc: TQRLabel;
    QRShape1: TQRShape;
    QRLabel22: TQRLabel;
    qrlOvAllCowLact1: TQRLabel;
    qrlOvAllCowLact2: TQRLabel;
    qrlOvAllCowLact3To5: TQRLabel;
    qrlOvAllCowLact6Plus: TQRLabel;
    qrlOvAllCowCount: TQRLabel;
    qrlOvAllInCalfLact1: TQRLabel;
    qrlOvAllInCalfLact2: TQRLabel;
    qrlOvAllInCalfLact3To5: TQRLabel;
    qrlOvAllInCalfLact6Plus: TQRLabel;
    qrlOvAllInCalfCount: TQRLabel;
    qrlOvAllPercLact1: TQRLabel;
    qrlOvAllPercLact2: TQRLabel;
    qrlOvAllPercLact3To5: TQRLabel;
    qrlOvAllPercLact6Plus: TQRLabel;
    qrlOvAllPercCount: TQRLabel;
    qrlServConcServesLact1: TQRLabel;
    qrlServConcServesLact2: TQRLabel;
    qrlServConcServesLact3To5: TQRLabel;
    qrlServConcServesLact6Plus: TQRLabel;
    qrlServConcServesOvAll: TQRLabel;
    qrlServConcInCalfLact1: TQRLabel;
    qrlServConcInCalfLact2: TQRLabel;
    qrlServConcInCalfLact3To5: TQRLabel;
    qrlServConcInCalfLact6Plus: TQRLabel;
    qrlServConcInCalfOvAll: TQRLabel;
    qrlServConcNumLact1: TQRLabel;
    qrlServConcNumLact2: TQRLabel;
    qrlServConcNumLact3To5: TQRLabel;
    qrlServConcNumLact6Plus: TQRLabel;
    qrlServConcNumOvAll: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel38: TQRLabel;
    cbIncludeRawData: TCheckBox;
    qrlCowsServed: TQRLabel;
    qrlCowsServedCount: TQRLabel;
    qrlBreedingCows: TQRLabel;
    qrlBreedingCowsCount: TQRLabel;
    qrlBreedingCowInfo: TQRLabel;
    qrlPregnancyRateInfo: TQRLabel;
    procedure ViewBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure rbSpringClick(Sender: TObject);
    procedure rbAutumnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure deStartBreedAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure HerdNumCloseUp(Sender: TObject);
    procedure FromDateChange(Sender: TObject);
    procedure ToDateChange(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure LBreedStartPrint(sender: TObject; var Value: String);
    procedure qrFertIndicesBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    function GetNonDetectedOestrusCheckDate: TDateTime;
    procedure CreateHerdPerfByLactTable;
    procedure AddHerdPerfByLactTableData;
  private
    { Private declarations }
    // Variables to store all Calculations
    TotalCows,
    NoCowsPregFirst,
    NoCowsPregAll,
    CalvToServ,
    CalvToConc,
    DaysToServ,
    DaysToConc,
    DaysToBull,
    NoCowsServed,
    NDOestrus,
    NoCowsCalvedForOestrusCalc,
    NoCowsCalvedForOestrusCalcNoServiceOrBulling,
    Eligibility,
    EligibleServed,
    TotalServices,
    TotalInterval,
    Returns,
    MissHeat,
    CowsServedPregnant,
    NotServedOrCull : Integer;
    CalvPerMonth : packed Array [1..12] of Integer;
    year, month, day : word;
    AverageDate,
    MinCalvDate,
    present,
    MaxCalvDate,
    StartBreed : tDateTime;
    MyTable : TTable;
    DisplayMessage : Boolean;
    UserChange : Boolean;
    BreedingDataHelper : TBreedingDataHelper;
    HerdPerfByLactTable : TTable;
    HasToBeCulledRecs : Boolean;
    procedure CreateTempTable;
    procedure InsertCalvings;
    procedure CalvDateQuery;
    procedure DoCalculations;
    procedure MoveCalculations;
    procedure AnimalsPregnant ( AID, LactNo : Integer; CalvingDate : tDateTime; ANatIdNo : string = '' );
    procedure StartOfBreedingSeason;
    procedure GetSixWeekCalvingPerc;

    property NonDetectedOestrusCheckDate : TDateTime read GetNonDetectedOestrusCheckDate ;

  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

implementation
uses
   GenTypesConst,
   DairyData,
   Printers,
   Def;

var
   fFertIndicesRpt: TfFertIndicesRpt;
   WhichReg : TCountry;

const
   cSixWeeksInDays = 42;

{$R *.DFM}

procedure TfFertIndicesRpt.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   HerdNum.LookupSource := WinData.OwnerSource;
   HerdNum.LookupField := 'ID';
   HerdNum.LookupDisplay := 'HerdIdentity';
   BreedingDataHelper := TBreedingDataHelper.Create();
   BreedingDataHelper.CreateTempBreedingDataTables;
   CreateHerdPerfByLactTable;
end;

procedure TfFertIndicesRpt.CreateTempTable;
begin
     WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,HerdNum.Value);
     with MyTable Do
        Begin
           Close;
           TableType := ttParadox;
           TableName := 'TempIndices';
           DataBaseName := WinData.KingData.DatabaseName;
           with FieldDefs do
              begin
                 Clear;
                 Add('AID',ftInteger,0,False);
                 Add('LactNo',ftInteger,0,False);
                 Add('CalvingDate',ftDate,0,False);
                 Add('BullingDate',ftDate,0,False);
                 Add('ServiceDate',ftDate,0,False);
                 Add('LastServiceDate',ftDate,0,False);
                 Add('PregDiagDate',ftDate,0,False);
                 Add('ServCount',ftInteger,0,False);
                 Add('PregDiagResult',ftBoolean,0,False);
                 Add('DaysSinceCalving',ftInteger,0,False);
                 Add('WasServedInPeriod',ftBoolean,0,False);
                 Add('ToBeCulled',ftBoolean,0,False);
                 Add('NatIdNo',ftString,20);
              end;
           with IndexDefs do
              begin
                 Clear;
                 Add('', 'AID', [ixPrimary, ixUnique]);
              end;
           CreateTable;
           Open;
        end;
end;

procedure TfFertIndicesRpt.InsertCalvings;
begin
    // Delete All Records
    with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('DELETE FROM ' + MyTable.TableName);
          ExecSQL;
       end;

   with GenQuery do
      begin
         SQL.Clear;
         // Select Events of Calving type and their associated Animal file info.
         SQL.Add('INSERT INTO ' + MyTable.TableName + '(AID, LactNo, CalvingDate, NatIdNo)');
         SQL.Add('SELECT DISTINCT A.ID, E.AnimalLactNo, E.EventDate, A.NatIdNum');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN '+BreedingDataHelper.TempCalvings.TableName+' E ON (E.AnimalID = A.ID)');
         SQL.Add('WHERE (A.LactNo>0)');
         SQL.Add('AND   (E.AnimalLactNo BETWEEN ' + eFirstLact.Text + ' AND ' + eLastLact.Text + ')');
         SQL.Add('AND   (A.AnimalDeleted=FALSE)');
         SQL.Add('AND   (E.EventDate Between "' + FormatDateTime(cUSDateStyle,FromDate.Date) + '" And "' + FormatDateTime(cUSDateStyle,ToDate.Date) + '")');
         SQL.Add('AND   (A.Sex="Female")');
         SQL.Add('AND   (A.HerdID= ' + HerdNum.Value + ')');
         SQL.Add('AND   (A.InHerd = True)');
         ExecSQL;
      end;
end;

procedure TfFertIndicesRpt.CalvDateQuery;
var
   CalvDateCount : Integer;
begin
   with GenQuery do
      // Calving per month calculation
      for CalvDateCount := 1 to 12 do
         begin
            SQL.Clear;
            SQL.Add('SELECT COUNT(DISTINCT A.AID) CalvPerMonth');
            SQL.Add('FROM ' + MyTable.TableName + ' A');
            SQL.Add('WHERE (EXTRACT (MONTH FROM A.CalvingDate ) = ' + IntToStr(CalvDateCount) + ')');
            Open;
            if NOT IsEmpty then
               CalvPerMonth[CalvDateCount] := FieldByName('CalvPerMonth').AsInteger;
         end;

   with GenQuery do
      // Mean, Min & Max Calving Date Calculations
      begin
         SQL.Clear;
         SQL.Add('SELECT AVG (A.CalvingDate) AverageDate, MIN (A.CalvingDate) MinDate, MAX (A.CalvingDate) MaxDate');
         SQL.Add('FROM ' + MyTable.TableName + ' A');
         Open;
         if NOT IsEmpty then
            AverageDate := FieldByName('AverageDate').AsDateTime;
            MinCalvDate := FieldByName('MinDate').AsDateTime;
            MaxCalvDate := FieldByName('MaxDate').AsDateTime;
      end;
end;

procedure TfFertIndicesRpt.AnimalsPregnant(AID,LactNo: Integer; CalvingDate: tDateTime; ANatIdNo : string = '' );
var
   DaysFromPDToNow,
   DaysFromCalvToNow,
   TempDaysToConc,
   Interval : integer;
   ThisServiceDate : tDateTime;
   MyDataDir : string;
   IsPreg : string;
   ServCount : Integer;
begin
   MyDataDir := DataDir;

   DaysFromPDToNow   := 0;
   DaysFromCalvToNow := 0;
   TempDaysToConc    := 0;
   Interval          := 0;

   IsPreg := 'UNDEF';

   // Check the Animal is Eligible for Submission Rate Calc.
   if (CalvingDate + VoluntaryWaitingPeriod.AsInteger) <= StartBreed then
      Inc(Eligibility);

   // find first service
   BreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ')';
   BreedingDataHelper.TempServices.Filtered := True;

   ServCount := BreedingDataHelper.TempServices.RecordCount;
   if ( ServCount = 1 ) then
      Inc(NoCowsPregFirst);

   MyTable.Edit;
   MyTable.FieldByName('WasServedInPeriod').AsBoolean := False;
   MyTable.Post;

   if BreedingDataHelper.TempServices.FindFirst then
      // calculate calving to service
      begin
         DaysToServ := Round(BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime - CalvingDate);

         MyTable.Edit;
         MyTable.FieldByName('ServiceDate').AsDateTime := BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
         MyTable.FieldByName('WasServedInPeriod').AsBoolean := ( ( MyTable.FieldByName('ServiceDate').AsDateTime > 0 ) and
                                                                 ( MyTable.FieldByName('ServiceDate').AsDateTime <= NonDetectedOestrusCheckDate ) );
         MyTable.Post;
         // if the Animal is Eligible for Submission Rate Calc.
         // Check the First Service against Breeding season start + 22
         if (CalvingDate + VoluntaryWaitingPeriod.AsInteger) <= StartBreed then
            if (BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime) <= (StartBreed + 22) then
               Inc(EligibleServed);
      end;

   // check if pregnant (for cows with one service event ONLY)
   if ( NOT BreedingDataHelper.TempServices.Eof ) and ( BreedingDataHelper.TempServices.RecordCount = 1 ) then
      begin
         // Find PD Record if it exists
         if BreedingDataHelper.TempPregDiag.Locate('AnimalID;AnimalLactNo',VarArrayOf([AID,LactNo]),[]) then
            if ( BreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime >
                 BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime ) then
               begin  // Found PD event
                  if WinData.LookUpPDs.Locate('EventID',BreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger,[] ) and
                     WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                     IsPreg := 'YES'
                  else
                     begin
                        IsPreg := 'NO';
                        if ( NoCowsPregFirst > 0 ) then
                           NoCowsPregFirst := NoCowsPregFirst - 1;
                     end;
               end;
         {
         else
            // if no present PD, check next lactation for PD (retrospective only)
            begin
               if BreedingDataHelper.TempCalvings.Locate('AnimalID;AnimalLactNo',VarArrayOf([AID,LactNo+1]),[]) then
                  Inc(NoCowsPregFirst)
               else
                  // if no PD, calculate days since service for pregnancy
                  begin
                     DaysFromPDToNow := Round(( Now() - BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime));
                     if (DaysFromPDToNow > 56) and (DaysFromPDToNow < 313) then
                        Inc(NoCowsPregFirst)
                  end;
            end;
         }
      end;

   // if not eof, assign currentservice record to variable
   if NOT BreedingDataHelper.TempServices.Eof then
      ThisServiceDate := BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;

   // loop to Calculate 18-24 day returns and missed heats (by next record search)
   while BreedingDataHelper.TempServices.FindNext do
      begin
         Inc(TotalInterval);
         Interval := Round(BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime - ThisServiceDate);
         if Interval in [18..24] then
            Inc(Returns);
         if Interval in [36..48] then
            MissHeat := MissHeat + 1
         // 49 to 54 ??
         else if Interval in [55..70] then
            MissHeat := MissHeat + 2
         // 71 to 74 ??
         else if Interval in [75..90] then
            MissHeat := MissHeat + 3;
         ThisServiceDate := BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
      end;

   // check if pregnant (for cows with MORE THAN one service event)
   if BreedingDataHelper.TempServices.FindLast then
      begin
         // calculate calving to conception
         TempDaysToConc := Round(BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime - CalvingDate);
         DaysToConc := TempDaysToConc;

         MyTable.Edit;
         MyTable.FieldByName('LastServiceDate').AsDateTime := BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
         MyTable.Post;

         // Find PD Record if it exists
         if BreedingDataHelper.TempPregDiag.Locate('AnimalID;AnimalLactNo',VarArrayOf([AID,LactNo]),[]) then
            if ( BreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime >
                 BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime ) then
               begin  // Found PD event
                  if ( WinData.LookUpPDs.Locate('EventID', BreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger,[]) ) and
                     ( WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean ) then
                     begin
                        Inc(NoCowsPregAll);
                     end;
                  MyTable.Edit;
                  MyTable.FieldByName('PregDiagDate').AsDateTime := BreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
                  MyTable.FieldByName('PregDiagResult').AsBoolean := WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean;
                  MyTable.Post;
               end;
            {
            begin
               // if no present PD, check next lactation for PD (retrospective only)
               if BreedingDataHelper.TempPregDiag.Locate('AnimalID;AnimalLactNo',VarArrayOf([AID,LactNo+1]),[] ) then
                  begin
                     Inc(NoCowsPregAll);
                     DaysToConc := TempDaysToConc;
                  end;
               // if no PD, calculate days since service for pregnancy
               DaysFromPDToNow := Round(( Now() - BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime));
               if (DaysFromPDToNow > 56) and (DaysFromPDToNow < 313) then
                  begin
                     Inc(NoCowsPregAll);
                     DaysToConc := TempDaysToConc;
                  end;
            end;
            }
      end;

   // calculate calving to Bulling
   BreedingDataHelper.TempBullings.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ')';
   BreedingDataHelper.TempBullings.Filtered := True;
   // find bulling event
   if BreedingDataHelper.TempBullings.FindFirst then
      begin
         // if event exists
         MyTable.Edit;
         MyTable.FieldByName('BullingDate').AsDateTime := BreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
         MyTable.Post;
      end;
   BreedingDataHelper.TempBullings.Filter := '';
   BreedingDataHelper.TempBullings.Filtered := FALSE;

   MyTable.Edit;
   MyTable.FieldByName('DaysSinceCalving').AsInteger := Trunc( NonDetectedOestrusCheckDate - MyTable.FieldByName('CalvingDate').AsDateTime );
   MyTable.FieldByName('ServCount').AsInteger := ServCount;
   MyTable.Post;

   if ( MyTable.FieldByName('DaysSinceCalving').AsInteger > 42 ) then
      begin
         Inc(NoCowsCalvedForOestrusCalc);
         if ( MyTable.FieldByName('BullingDate').AsDateTime = 0 ) and ( not(MyTable.FieldByName('WasServedInPeriod').AsBoolean) ) then
            Inc(NoCowsCalvedForOestrusCalcNoServiceOrBulling);
      end;

   if ( MyTable.FieldByName('ServiceDate').AsDateTime > 0 ) then
      if ( (MyTable.FieldByName('PregDiagDate').AsDateTime = 0) or (MyTable.FieldByName('PregDiagDate').AsVariant = Null) ) or
         ( (MyTable.FieldByName('PregDiagDate').AsDateTime > 0) and (MyTable.FieldByName('PregDiagResult').AsBoolean) ) then
      Inc(CowsServedPregnant);
end;

procedure TfFertIndicesRpt.DoCalculations;
var
   i : Integer;
   bToBeCulled : Boolean;
begin
    TotalCows       := 0;
    NoCowsPregFirst := 0;
    NoCowsPregAll   := 0;
    CalvToServ      := 0;
    CalvToConc      := 0;
    NDOestrus       := 0;
    NoCowsCalvedForOestrusCalc := 0;
    NoCowsCalvedForOestrusCalcNoServiceOrBulling := 0;
    NoCowsServed    := 0;
    Eligibility     := 0;
    EligibleServed  := 0;
    TotalServices   := 0;
    TotalInterval   := 0;
    Returns         := 0;
    MissHeat        := 0;
    CowsServedPregnant := 0;
    NotServedOrCull := 0;
    pBarWait.Min    := 0;

    if mytable.recordcount > 0 then
       pBarWait.Max    := mytable.recordcount
    else
       pBarWait.Max    := 1;

    for i := 1 to 12 do CalvPerMonth[i] := 0;

    // Total No of Calved Cows
    with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT COUNT(DISTINCT A.AID) TotalCows');
            SQL.Add('FROM ' + MyTable.TableName + ' A');
            Open;
            if NOT IsEmpty then
               TotalCows := FieldByName('TotalCows').AsInteger;
         end;

    if TotalCows > 0 then
       begin
          // Total No of Served Animals
          with GenQuery do
             begin
                SQL.Clear;
                SQL.Add('SELECT COUNT(DISTINCT A.AID) NoCowsServed');
                SQL.Add('FROM '+MyTable.TableName+' A');
                SQL.Add('LEFT JOIN '+BreedingDataHelper.TempServices.TableName+' E ON (E.AnimalID = A.AID)');
                SQL.Add('WHERE (E.EventDate > "' + FormatDateTime(cUSDateStyle,FromDate.Date) + '" )');
                Open;
                if IsEmpty then
                   NoCowsServed := 0
                else
                   NoCowsServed := FieldByName('NoCowsServed').AsInteger;
             end;

          for i := 1 to MyTable.RecordCount do
             begin
                MyTable.RecNo := i;
                BreedingDataHelper.TempToBeCulled.Filter := '';
                BreedingDataHelper.TempToBeCulled.Filtered := False;
                BreedingDataHelper.TempToBeCulled.Filter := Format('(AnimalID = %d) AND (AnimalLactNo = %d)',
                                                                   [MyTable.FieldByName('AID').AsInteger,
                                                                    MyTable.FieldByName('LactNo').AsInteger]);
                BreedingDataHelper.TempToBeCulled.Filtered := True;
                bToBeCulled := BreedingDataHelper.TempToBeCulled.FindFirst;
                MyTable.Edit;
                MyTable.FieldByName('ToBeCulled').AsBoolean := bToBeCulled;
                MyTable.Post;
             end;

          // Total No of Services
          with GenQuery do
             begin
                SQL.Clear;
                SQL.Add('SELECT COUNT(E.EventID) TotalServices');
                SQL.Add('FROM '+MyTable.TableName+' A');
                SQL.Add('LEFT JOIN '+BreedingDataHelper.TempServices.TableName+' E ON (E.AnimalID = A.AID)');
                SQL.Add('WHERE (A.LactNo=E.AnimalLactNo)');
                Open;
                if IsEmpty then
                   TotalServices := 0
                else
                   TotalServices := FieldByName('TotalServices').AsInteger;
             end;

          // Calculate Calvings Per Month
          CalvDateQuery;

          // Get Perc of first 6 week calves from total calvings in current calving season.
          GetSixWeekCalvingPerc;

          // Set Temp Table to First Record
          with MyTable do
             begin
                First;
                while NOT EOF do
                   begin
                      Application.ProcessMessages;

                      DaysToServ      := 0;
                      DaysToConc      := 0;
                      DaysToBull      := 0;

                      // Get no. cows pregnant/serviced & days to pregnant/serviced & Oestrus Rate
                      // and Submission Rate
                      AnimalsPregnant(FieldByName('AID').AsInteger,
                          FieldByName('LactNo').AsInteger,
                          FieldByName('CalvingDate').AsDateTime,
                          FieldByName('NatIdNo').AsString);

                      CalvToConc := (CalvToConc + DaysToConc);
                      CalvToServ := (CalvToServ + DaysToServ);
                      // increment progress bar
                      pBarWait.StepIt;
                      Next;  // Next Record in the Temp Table
                   end;
             end;

          TotalCows := NoCowsServed;
          HasToBeCulledRecs := False;
          with GenQuery do
             begin
                SQL.Clear;
                SQL.Add('SELECT COUNT(AID)');
                SQL.Add('FROM '+MyTable.TableName);
                SQL.Add('WHERE ToBeCulled = False');
                Open;
                HasToBeCulledRecs := ( Fields[0].AsInteger < MyTable.RecordCount );
                if HasToBeCulledRecs then
                   begin
                      Close;
                      SQL.Clear;
                      SQL.Add('SELECT COUNT(AID) NotServedOrCull');
                      SQL.Add('FROM '+MyTable.TableName);
                      SQL.Add('WHERE ((ServiceDate IS NULL) AND (ToBeCulled = False))');
                      Open;
                      if ( RecordCount > 0 ) and ( FieldByName('NotServedOrCull').AsInteger > 0 ) then
                         begin
                            NotServedOrCull := FieldByName('NotServedOrCull').AsInteger;
                            TotalCows := TotalCows + NotServedOrCull;
                         end;
                   end;
             end;

          AddHerdPerfByLactTableData;
       end;
end;

procedure TfFertIndicesRpt.MoveCalculations;
begin
// Calving Pattern
   LJan.caption := IntToStr(CalvPerMonth[1]);
   if LJan.caption = '0' then
      LJan.caption := ' ';
   LFeb.caption := IntToStr(CalvPerMonth[2]);
   if LFeb.caption = '0' then
      LFeb.caption := ' ';
   LMar.caption := IntToStr(CalvPerMonth[3]);
   if LMar.caption = '0' then
      LMar.caption := ' ';
   LApr.caption := IntToStr(CalvPerMonth[4]);
   if LApr.caption = '0' then
      LApr.caption := ' ';
   LMay.caption := IntToStr(CalvPerMonth[5]);
   if LMay.caption = '0' then
      LMay.caption := ' ';
   LJun.caption := IntToStr(CalvPerMonth[6]);
   if LJun.caption = '0' then
      LJun.caption := ' ';
   LJul.caption := IntToStr(CalvPerMonth[7]);
   if LJul.caption = '0' then
      LJul.caption := ' ';
   LAug.caption := IntToStr(CalvPerMonth[8]);
   if LAug.caption = '0' then
      LAug.caption := ' ';
   LSep.caption := IntToStr(CalvPerMonth[9]);
   if LSep.caption = '0' then
      LSep.caption := ' ';
   LOct.caption := IntToStr(CalvPerMonth[10]);
   if LOct.caption = '0' then
      LOct.caption := ' ';
   LNov.caption := IntToStr(CalvPerMonth[11]);
   if LNov.caption = '0' then
      LNov.caption := ' ';
   LDec.caption := IntToStr(CalvPerMonth[12]);
   if LDec.caption = '0' then
      LDec.caption := ' ';

// User Defined Parameters
   present := StrToDate(FromDate.Text);
   decodedate (present, year, month, day );
   if rbAutumn.checked then
      qlSeason.Caption := 'Autumn Season ' + IntToStr(year)
   else
      qlSeason.Caption := 'Spring Season ' + IntToStr(year);
   QRLabel1.Caption := IntToStr(Year)+ ' Calving Pattern';
   LSeasonFrom.caption := FromDate.Text;
   LSeasonTo.caption   := ToDate.Text;
   LLactFrom.caption   := eFirstLact.Text;
   LLactTo.caption     := eLastLact.Text;

// Calculated Season Dates
   LCalvFrom.caption   := DateToStr(MinCalvDate);
   LCalvTo.caption     := DateToStr(MaxCalvDate);
   LMeanCalv.caption   := DateToStr(AverageDate);

   LBreedStart.caption := DateToStr(StartBreed);
   qrlCowsServedCount.Caption := IntToStr(NoCowsServed);
   qrlBreedingCowsCount.Caption := IntToStr(NotServedOrCull) + ' *';

// Pregnancy Rate 1st Service
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces NoCowsServed so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LPregRate.Caption := '(' + IntToStr(NoCowsPregFirst) + '/' + IntToStr(TotalCows) + ')';
   if NoCowsServed > 0 then
      LPregRateCalc.Caption := FloatToStrF((NoCowsPregFirst / TotalCows)*100,ffFixed,4,0)
   else
      LPregRateCalc.Caption := '0';

// Services per Conception
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces NoCowsPregAll so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LServPerCon.Caption := '(' + IntToStr(TotalServices) + '/' + IntToStr(TotalCows) + ')';
   if (TotalCows) > 0 then
      LServPerConCalc.Caption := FormatFloat('0.0',TotalServices/TotalCows)
   else
      LServPerConCalc.Caption := '0';

// Calving to Service
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces NoCowsServed so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LCalv2Serv.Caption := '(' + IntToStr(CalvToServ) + '/' + IntToStr(TotalCows) + ')';
   if NoCowsServed > 0 then
      LCalv2ServCalc.Caption := FloatToStrF((CalvToServ / TotalCows),ffFixed,4,0)
   else
      LCalv2ServCalc.Caption := '0';

// Calving to Conception
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces NoCowsPregAll so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LCalv2Conc.Caption := '(' + IntToStr(CalvToConc) + '/' + IntToStr(TotalCows) + ')';
   if (TotalCows) > 0 then
      LCalv2ConcCalc.Caption := FloatToStrF(CalvToConc / (TotalCows),ffFixed,4,0)
   else
      LCalv2ConcCalc.Caption := '0';

// Submission rate
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces NoCowsCalvedForOestrusCalc so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LSubRate.Caption := '(' + IntToStr(EligibleServed) + '/' + IntToStr(TotalCows) + ')';
   if TotalCows > 0 then
      LSubRateCalc.Caption := FloatToStrF((EligibleServed / TotalCows)*100,ffFixed,4,0)
   else
      LSubRateCalc.Caption := '0';

// Non-detected Oestrus rate
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces Eligibility so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LOestrus.Caption := '(' + IntToStr(NoCowsCalvedForOestrusCalcNoServiceOrBulling) + '/' + IntToStr(TotalCows) + ')';
   if NoCowsCalvedForOestrusCalcNoServiceOrBulling > 0 then
      LOestrusCalc.Caption := FloatToStrF((NoCowsCalvedForOestrusCalcNoServiceOrBulling / TotalCows)*100,ffFixed,4,0)
   else
      LOestrusCalc.Caption := '0';
   {
   LOestrus.Caption := '(' + IntToStr(NoCowsCalvedForOestrusCalcNoServiceOrBulling) + '/' + IntToStr(NoCowsCalvedForOestrusCalc) + ')';
   if NoCowsCalvedForOestrusCalcNoServiceOrBulling > 0 then
      LOestrusCalc.Caption := FloatToStrF((NoCowsCalvedForOestrusCalcNoServiceOrBulling / NoCowsCalvedForOestrusCalc)*100,ffFixed,4,0)
   else
      LOestrusCalc.Caption := '0';
   }
   {
   LOestrus.Caption := '(' + IntToStr(NDOestrus) + '/' + IntToStr(TotalCows) + ')';
   if TotalCows > 0 then
      LOestrusCalc.Caption := FloatToStrF((NDOestrus / TotalCows)*100,ffFixed,4,0)
   else
      LOestrusCalc.Caption := '0';
   }

// 18-24 day returns
   LReturns.Caption := '(' + IntToStr(Returns) + '/' + IntToStr(TotalInterval) + ')';
   if TotalInterval > 0 then
      LReturnsCalc.Caption := FloatToStrF((Returns / TotalInterval)*100,ffFixed,4,0)
   else
      LReturnsCalc.Caption := '0';

// Infertile Rate
   // 12/09/19 [V5.9 R0.3] /MK Change - GL asked that we use new TotalCows replaces NoCowsPregAll so that there would
   //                                   be no questions when comparing TotalCows with Overall Served on new Herd Fertility Performance By Lactation.
   LFertRate.Caption := '(' + IntToStr(TotalCows - CowsServedPregnant) + '/' + IntToStr(TotalCows)+ ')';
   if ( TotalCows > 0 ) and (TotalCows - CowsServedPregnant > 0)  then
      LFertRateCalc.Caption := FloatToStrF(((TotalCows - CowsServedPregnant) / TotalCows)*100,ffFixed,4,0)
   else
      LFertRateCalc.Caption := '0';

// Heat Detection Rate
   LHeatRate.Caption := '(' + IntToStr(TotalServices) + '/' + IntToStr(TotalServices + MissHeat) + ')';
   if (TotalServices + MissHeat) > 0 then
      LHeatRateCalc.Caption := FloatToStrF((TotalServices / (TotalServices + MissHeat))*100,ffFixed,4,0)
   else
      LHeatRateCalc.Caption := '0';

// Performance Band
   HerdPerfByLactTable.Close;
   HerdPerfByLactTable.Open;
   HerdPerfByLactTable.First;
   while ( not(HerdPerfByLactTable.Eof) ) do
      begin
         case HerdPerfByLactTable.RecNo of
            1 : begin
                   qrlLact1Desc.Caption := HerdPerfByLactTable.FieldByName('LactDesc').AsString;
                   qrl6WkCowLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekCows').AsInteger);
                   qrl6WkInCalfLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInCalf').AsInteger);
                   qrl6WkPercLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInPerc').AsInteger);
                   qrlOvAllCowLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallCows').AsInteger);
                   qrlOvAllInCalfLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInCalf').AsInteger);
                   qrlOvAllPercLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInPerc').AsInteger);
                   qrlServConcServesLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepServes').AsInteger); 
                   qrlServConcInCalfLact1.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepInCalf').AsInteger);
                   qrlServConcNumLact1.Caption := FormatFloat('0.0',HerdPerfByLactTable.FieldByName('ServesConcepNum').AsFloat);
                end;
            2 : begin
                   qrlLact2Desc.Caption := HerdPerfByLactTable.FieldByName('LactDesc').AsString;
                   qrl6WkCowLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekCows').AsInteger);
                   qrl6WkInCalfLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInCalf').AsInteger);
                   qrl6WkPercLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInPerc').AsInteger);
                   qrlOvAllCowLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallCows').AsInteger);
                   qrlOvAllInCalfLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInCalf').AsInteger);
                   qrlOvAllPercLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInPerc').AsInteger);
                   qrlServConcServesLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepServes').AsInteger);
                   qrlServConcInCalfLact2.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepInCalf').AsInteger);
                   qrlServConcNumLact2.Caption := FormatFloat('0.0',HerdPerfByLactTable.FieldByName('ServesConcepNum').AsFloat);
                end;
            3 : begin
                   qrlLact3To5Desc.Caption := HerdPerfByLactTable.FieldByName('LactDesc').AsString;
                   qrl6WkCowLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekCows').AsInteger);
                   qrl6WkInCalfLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInCalf').AsInteger);
                   qrl6WkPercLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInPerc').AsInteger);
                   qrlOvAllCowLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallCows').AsInteger);
                   qrlOvAllInCalfLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInCalf').AsInteger);
                   qrlOvAllPercLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInPerc').AsInteger);
                   qrlServConcServesLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepServes').AsInteger);
                   qrlServConcInCalfLact3To5.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepInCalf').AsInteger);
                   qrlServConcNumLact3To5.Caption := FormatFloat('0.0',HerdPerfByLactTable.FieldByName('ServesConcepNum').AsFloat);
                end;
            4 : begin
                   qrlLact6PlusDesc.Caption := HerdPerfByLactTable.FieldByName('LactDesc').AsString;
                   qrl6WkCowLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekCows').AsInteger);
                   qrl6WkInCalfLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInCalf').AsInteger);
                   qrl6WkPercLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('SixWeekInPerc').AsInteger);
                   qrlOvAllCowLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallCows').AsInteger);
                   qrlOvAllInCalfLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInCalf').AsInteger);
                   qrlOvAllPercLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('OverallInPerc').AsInteger);
                   qrlServConcServesLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepServes').AsInteger);
                   qrlServConcInCalfLact6Plus.Caption := IntToStr(HerdPerfByLactTable.FieldByName('ServesConcepInCalf').AsInteger);
                   qrlServConcNumLact6Plus.Caption := FormatFloat('0.0',HerdPerfByLactTable.FieldByName('ServesConcepNum').AsFloat);
                end;
         end;
         HerdPerfByLactTable.Next;
      end;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT SUM(SixWeekCows), SUM(SixWeekInCalf), AVG(SixWeekInPerc),');
         SQL.Add('       SUM(OverallCows), SUM(OverallInCalf), AVG(OverallInPerc),');
         SQL.Add('       SUM(ServesConcepServes), SUM(ServesConcepInCalf), AVG(ServesConcepNum)');
         SQL.Add('FROM '+HerdPerfByLactTable.TableName);
         Open;
         qrl6WkCowCount.Caption := IntToStr(Fields[0].AsInteger);
         qrl6WkInCalfCount.Caption := IntToStr(Fields[1].AsInteger);
         qrl6WkPercCount.Caption := IntToStr(Fields[2].AsInteger);
         qrlOvAllCowCount.Caption := IntToStr(Fields[3].AsInteger);
         qrlOvAllInCalfCount.Caption := IntToStr(Fields[4].AsInteger);
         qrlOvAllPercCount.Caption := IntToStr(Fields[5].AsInteger);
         qrlServConcServesOvAll.Caption := IntToStr(Fields[6].AsInteger);
         qrlServConcInCalfOvAll.Caption := IntToStr(Fields[7].AsInteger);
         qrlServConcNumOvAll.Caption := FormatFloat('0.0',Fields[8].AsFloat);
      finally
         Free;
      end;

// Footer Band
   LFooter2.caption := 'Herd Management ' + HerdVerNo;
end;

procedure TfFertIndicesRpt.ViewBtnClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   sbView.Enabled := False;
   sbPrint.Enabled := False;

   if HerdNum.Value <> '0' then
      try
         if (deStartBreed.Date = 0 )then
            MessageDlg('No service events have been found for the selected period.' +cCRLF+
                       'Therefore the calculations will not produce meaningful results.',mtInformation,[mbOK],0);

         // Delete All Records
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM ' + MyTable.TableName);
               ExecSQL;
            end;

         If HerdNum.Value = '' then
            MessageDlg('Please select a Herd', mtinformation, [mbok],0)
         else
            begin
               // Insert all Calving between the Dates
               InsertCalvings;

               // show progress bar and initialise
               pBarWait.Show;
               pBarWait.step := 1;
               // Do all calculations on Temp Table;
               DoCalculations;

               if TotalCows > 0 then
                  begin
                     // Move Calculations to Report
                     MoveCalculations;
                     // Get herd country
                     WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,HerdNum.Value);
                     // change caption if N.Ireland
                     if ( WhichReg = NIreland ) then
                        LTarget.Caption := 'Target'
                     else
                        LTarget.Caption := 'Moorepark Target';

                     if ( Sender as tRxSpeedButton ).Name = 'sbView' Then
                        qrFertIndices.Preview
                     else
                        qrFertIndices.Print;
                  end
               else
                  begin
                     pBarWait.Hide;
                     ShowMessage('No Calving Data for specified period');
                  end;
            end;
      finally
         sbView.Enabled := True;
         sbPrint.Enabled := True;
      end
   else
      begin
          ShowMessage('You must select a Herd');
          HerdNum.DropDown;
          HerdNum.SetFocus;
      end;
end;

procedure TfFertIndicesRpt.rbSpringClick(Sender: TObject);
begin
   if rbSpring.checked then
      present := now;
      decodedate (present, year, month, day );
      if month < 4 then
         year := year-1;

   UserChange := True;
   FromDate.Text := '01/01/' + IntToStr(Year);
   ToDate.Text := '30/06/' + IntToStr(Year);
   StartOfBreedingSeason;
   UserChange := False;
end;

procedure TfFertIndicesRpt.rbAutumnClick(Sender: TObject);
begin
   if rbAutumn.checked then
      present := now;
      decodedate (present, year, month, day );
      if month < 10 then
         year := year-1;

   UserChange := True;
   FromDate.Text := '01/07/' + IntToStr(Year);
   ToDate.Text := '31/12/' + IntToStr(Year);
   StartOfBreedingSeason;
   UserChange := False;
end;

procedure TfFertIndicesRpt.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   pBarWait.Hide;
   present := now;
   decodedate (present, year, month, day );
   if month < 4 then
      year := year-1;
   UserChange := True;
   FromDate.Text := '01/01/' + IntToStr(Year);
   ToDate.Text := '30/06/' + IntToStr(Year);
   StartOfBreedingSeason;
   UserChange := False;

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

procedure TfFertIndicesRpt.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('herdfertrpt.htm');
end;

procedure TfFertIndicesRpt.deStartBreedAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   StartBreed := ADate;
end;

procedure TfFertIndicesRpt.HerdNumCloseUp(Sender: TObject);
begin
   StartOfBreedingSeason
end;

procedure TfFertIndicesRpt.FromDateChange(Sender: TObject);
begin
   if not UserChange then
      StartOfBreedingSeason;
end;

procedure TfFertIndicesRpt.ToDateChange(Sender: TObject);
begin
   if not UserChange then
      StartOfBreedingSeason;
end;

procedure TfFertIndicesRpt.StartOfBreedingSeason;
begin
   Screen.Cursor := crHourGlass;
   Update;
   try
      InsertCalvings;
      with GenQuery do
         // Breeding Season Start Query
         begin
            SQL.Clear;
            SQL.Add('SELECT MIN(E.Eventdate) StartBreed');
            SQL.Add('FROM '+MyTable.TableName+' A');
            SQL.Add('LEFT JOIN '+BreedingDataHelper.TempServices.TableName+' E ON (E.AnimalID = A.AID)');
            SQL.Add('WHERE (E.EventDate > "' + FormatDateTime(cUSDateStyle,FromDate.Date) + '" )');
            Open;
            try
               if NOT IsEmpty then
                  begin
                     StartBreed := FieldByName('StartBreed').AsDateTime;
                     deStartBreed.Date := StartBreed;
                  end;
            finally
               Close;
            end;
         end;
  finally
      Screen.Cursor := crdefault;
      Update;
  end;
end;

procedure TfFertIndicesRpt.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

function TfFertIndicesRpt.GetNonDetectedOestrusCheckDate: TDateTime;
begin
   if ( deStartBreed.Date = 0 ) then
      Result := 0
   else
      Result := deStartBreed.Date + 28;
end;

procedure TfFertIndicesRpt.FormShow(Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cSeasonCalvHerdRep);
   WinData.UpdateRecentReportUsage(cSeasonCalvHerdRep);
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TfFertIndicesRpt.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cSeasonCalvHerdRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cSeasonCalvHerdRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfFertIndicesRpt.LBreedStartPrint(sender: TObject;
  var Value: String);
begin
   if ( Value = '30/12/1899' ) then
      Value := '';
end;

procedure TfFertIndicesRpt.GetSixWeekCalvingPerc;
var
   iTotCalvings,
   iSixWeekCalvings : Integer;
   TempQuery : TQuery;
begin
   iTotCalvings := 0;
   iSixWeekCalvings := 0;
   qrlSixWeekPerc.Caption := '';

   TempQuery := TQuery.Create(nil);
   with TempQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT COUNT(AID)');
         SQL.Add('FROM '+MyTable.TableName+'');
         SQL.Add('WHERE (CalvingDate BETWEEN "' + FormatDateTime(cUSDateStyle,MinCalvDate) + '" AND "' + FormatDateTime(cUSDateStyle,ToDate.Date) + '")');
         try
            Open;
            // Get total calvings from the 1st calving date of the year to the end of the breeding date.
            iTotCalvings := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(AID)');
         SQL.Add('FROM '+MyTable.TableName+'');
         SQL.Add('WHERE (CalvingDate BETWEEN "' + FormatDateTime(cUSDateStyle,MinCalvDate) + '" AND "' + FormatDateTime(cUSDateStyle,MinCalvDate+cSixWeeksInDays) + '")');
         try
            Open;
            // Get total number of calvings from 6 weeks from 1st calving date.
            iSixWeekCalvings:= Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         //   24/10/14 [V5.3 R8.6] /MK Change - Round 6 week calving percentage - GL Request.
         qrlSixWeekPerc.Caption := FloatToStr(KRound(MakePercentage(iSixWeekCalvings,iTotCalvings)));

      finally
         Free;
      end;
end;

procedure TfFertIndicesRpt.CreateHerdPerfByLactTable;
begin
   HerdPerfByLactTable := TTable.Create(nil);
   HerdPerfByLactTable.DatabaseName := AliasName;
   HerdPerfByLactTable.TableName := 'tmpHerdPrefByLact';
   HerdPerfByLactTable.FieldDefs.Clear;
   HerdPerfByLactTable.FieldDefs.Add('ID',ftAutoInc);
   HerdPerfByLactTable.FieldDefs.Add('LactDesc',ftString,5);
   HerdPerfByLactTable.FieldDefs.Add('SixWeekCows',ftInteger);
   HerdPerfByLactTable.FieldDefs.Add('SixWeekInCalf',ftInteger);
   HerdPerfByLactTable.FieldDefs.Add('SixWeekInPerc',ftFloat);
   HerdPerfByLactTable.FieldDefs.Add('OverallCows',ftInteger);
   HerdPerfByLactTable.FieldDefs.Add('OverallInCalf',ftInteger);
   HerdPerfByLactTable.FieldDefs.Add('OverallInPerc',ftFloat);
   HerdPerfByLactTable.FieldDefs.Add('ServesConcepServes',ftInteger);
   HerdPerfByLactTable.FieldDefs.Add('ServesConcepInCalf',ftInteger);
   HerdPerfByLactTable.FieldDefs.Add('ServesConcepNum',ftFloat);
   HerdPerfByLactTable.IndexDefs.Clear;
   HerdPerfByLactTable.IndexDefs.Add('iId','ID',[ixPrimary, ixUnique]);
   HerdPerfByLactTable.CreateTable;
   HerdPerfByLactTable.Open;
end;

procedure TfFertIndicesRpt.AddHerdPerfByLactTableData;
var
   i,
   iSixWeekCows,
   iSixWeekInCalf,
   iOverallCows,
   iOverallInCalf,
   iServesConcepServes,
   iServesConcepInCalf,
   iLactServCount,
   iLactServInCalf : Integer;
   fSixWeekInPerc,
   fOverallInPerc,
   fServesConcepNum : Double;

   procedure UpdateVars;
   begin
      if ( MyTable.FieldByName('LastServiceDate').AsDateTime > 0 ) then
         begin
            iLactServCount := iLactServCount + MyTable.FieldByName('ServCount').AsInteger;
            Inc(iOverallCows);
            if ( (MyTable.FieldByName('PregDiagDate').AsDateTime = 0) or (MyTable.FieldByName('PregDiagDate').AsVariant = Null) ) or
               ( (MyTable.FieldByName('PregDiagDate').AsDateTime > 0) and (MyTable.FieldByName('PregDiagResult').AsBoolean) ) then
               begin
                  iLactServInCalf := iLactServInCalf + MyTable.FieldByName('ServCount').AsInteger;
                  Inc(iOverallInCalf);
               end;

            if ( MyTable.FieldByName('LastServiceDate').AsDateTime <= (StartBreed + 42) ) then
               begin
                  if ( (MyTable.FieldByName('PregDiagDate').AsDateTime = 0) or (MyTable.FieldByName('PregDiagDate').AsVariant = Null) ) or
                     ( (MyTable.FieldByName('PregDiagDate').AsDateTime > 0) and (MyTable.FieldByName('PregDiagResult').AsBoolean) ) then
                     Inc( iSixWeekInCalf);
               end;
         end
      else if ( HasToBeCulledRecs ) and ( not(MyTable.FieldByName('ToBeCulled').AsBoolean) ) then
         Inc(iOverallCows);
   end;

begin
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('DELETE FROM '+HerdPerfByLactTable.TableName);
   GenQuery.ExecSQL;

   for i := 1 to 4 do
      begin
         MyTable.Filter := '';
         MyTable.Filtered := False;

         HerdPerfByLactTable.Append;

         case i of
            1 : begin
                   MyTable.Filter := '(LactNo = 1)';
                   HerdPerfByLactTable.FieldByName('LactDesc').AsString := '1';
                end;
            2 : begin
                   MyTable.Filter := '(LactNo = 2)';
                   HerdPerfByLactTable.FieldByName('LactDesc').AsString := '2';
                end;
            3 : begin
                   MyTable.Filter := '(LactNo >= 3) AND (LactNo <= 5)';
                   HerdPerfByLactTable.FieldByName('LactDesc').AsString := '3-5';
                end;
            4 : begin
                   MyTable.Filter := '(LactNo >= 6)';
                   HerdPerfByLactTable.FieldByName('LactDesc').AsString := '6+';
                end;
         end;

         iSixWeekCows := 0;
         iSixWeekInCalf := 0;
         iOverallCows := 0;
         iOverallInCalf := 0;
         iServesConcepServes := 0;
         iServesConcepInCalf := 0;
         fSixWeekInPerc := 0;
         fOverallInPerc := 0;
         fServesConcepNum := 0;
         iLactServCount := 0;
         iLactServInCalf := 0;

         MyTable.Filtered := True;
         MyTable.FindFirst;
         UpdateVars;
         while ( MyTable.FindNext ) do
            UpdateVars;

         HerdPerfByLactTable.FieldByName('SixWeekCows').AsInteger := iOverallCows;
         HerdPerfByLactTable.FieldByName('SixWeekInCalf').AsInteger := iSixWeekInCalf;
         HerdPerfByLactTable.FieldByName('SixWeekInPerc').AsFloat := MakePercentage(iSixWeekInCalf,iOverallCows);
         HerdPerfByLactTable.FieldByName('OverallCows').AsInteger := iOverallCows;
         HerdPerfByLactTable.FieldByName('OverallInCalf').AsInteger := iOverallInCalf;
         HerdPerfByLactTable.FieldByName('OverallInPerc').AsFloat := MakePercentage(iOverallInCalf,iOverallCows);
         HerdPerfByLactTable.FieldByName('ServesConcepServes').AsInteger := iLactServCount;
         HerdPerfByLactTable.FieldByName('ServesConcepInCalf').AsInteger := iOverallInCalf;
         if ( iLactServCount > 0 ) and ( iLactServInCalf > 0 ) then
            HerdPerfByLactTable.FieldByName('ServesConcepNum').AsFloat := iLactServCount/iOverallInCalf;
         HerdPerfByLactTable.Post;
      end;

   MyTable.Filter := '';
   MyTable.Filtered := False;
end;

procedure TfFertIndicesRpt.ExitBtnClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

procedure TfFertIndicesRpt.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   if ( HerdPerfByLactTable <> nil ) then
      begin
         if ( HerdPerfByLactTable.Active ) then
            HerdPerfByLactTable.Close;
         HerdPerfByLactTable.DeleteTable;
         FreeAndNil(HerdPerfByLactTable);
      end;
   if BreedingDataHelper <> nil then
      FreeAndNil(BreedingDataHelper);
end;

class procedure TfFertIndicesRpt.ShowTheForm;
begin
   with TfFertIndicesRpt.Create(nil) do
   try
      HerdNum.Value := IntToStr(WinData.UserDefaultHerdID);
      DisplayMessage := False;

      // Create the Temporary Table
      MyTable := TTable.Create(nil);
      CreateTempTable;
      qrFertIndices.Hide;
      TempEvents.Open;
      ShowModal;
   finally
      MyTable.Close;
      MyTable.DeleteTable;
      MyTable.Free;
      TempEvents.Close;
      Free;
   end;
end;

procedure TfFertIndicesRpt.qrFertIndicesBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   LPregRate.Enabled := cbIncludeRawData.Checked;
   LServPerCon.Enabled := LPregRate.Enabled;
   LCalv2Serv.Enabled := LPregRate.Enabled;
   LCalv2Conc.Enabled := LPregRate.Enabled;
   LSubRate.Enabled := LPregRate.Enabled;
   LOestrus.Enabled := LPregRate.Enabled;
   LReturns.Enabled := LPregRate.Enabled;
   LFertRate.Enabled := LPregRate.Enabled;
   LHeatRate.Enabled := LPregRate.Enabled;
end;

end.
