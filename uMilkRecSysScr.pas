{
   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   03/07/17 [V5.6 R9.1] /MK Bug Fix - MilkAnalysis - Access Violation error appearing at Details Monthly Comparison stage of report due to BreedingDataHelper being free'd.
}

unit uMilkRecSysScr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RxLookup, StdCtrls, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  Grids, DBGrids, RXDBCtrl, Menus, Mask, ToolEdit, RXSpin, Qrctrls,
  QuickRpt, QRExport, cxControls, cxContainer, cxEdit, cxCheckBox,
  uBreedingDataHelper;

type
  TfMilkRecSysScr = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    MyQuery: TQuery;
    qRecDate: TQuery;
    dsMilkRecDate: TDataSource;
    qMilkSys: TQuery;
    qHerdCount: TQuery;
    pmSort: TPopupMenu;
    NationalIDNumber1: TMenuItem;
    AnimalNumber1: TMenuItem;
    LactationNumber1: TMenuItem;
    DateOfCalving1: TMenuItem;
    DaysInMilk1: TMenuItem;
    CumulativeYield1: TMenuItem;
    AvgYieldPerDay1: TMenuItem;
    N1: TMenuItem;
    Ascending1: TMenuItem;
    Decending1: TMenuItem;
    sbSortBy: TRxSpeedButton;
    dsGroups: TDataSource;
    qGroups: TQuery;
    ToolButton4: TToolButton;
    qRecDateID: TIntegerField;
    qRecDateRecordingDate: TDateField;
    ToolButton5: TToolButton;
    MilkRecDate: TRxDBLookupCombo;
    Label1: TLabel;
    rgType: TRadioGroup;
    Groups: TRxDBGrid;
    rgMeasure: TRadioGroup;
    gbRepTypes: TGroupBox;
    cbLact: TCheckBox;
    cbCalvingMonth: TCheckBox;
    cbDailyYield: TCheckBox;
    cbMilkRecRpt: TCheckBox;
    pbMilk: TProgressBar;
    Panel3: TPanel;
    Label2: TLabel;
    seNumLact: TRxSpinEdit;
    qrMilkRep1: TQuickRep;
    QRBand7: TQRBand;
    QRLabel281: TQRLabel;
    QRLabel282: TQRLabel;
    QRLabel283: TQRLabel;
    QRLabel284: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel285: TQRLabel;
    lName1: TQRLabel;
    lName2: TQRLabel;
    lAdd1: TQRLabel;
    lAdd2: TQRLabel;
    lAdd3: TQRLabel;
    lAdd4: TQRLabel;
    lMonth: TQRLabel;
    lYear: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel286: TQRLabel;
    QRLabel287: TQRLabel;
    QRLabel288: TQRLabel;
    QRLabel289: TQRLabel;
    QRLabel290: TQRLabel;
    QRLabel291: TQRLabel;
    QRLabel292: TQRLabel;
    l1: TQRLabel;
    l2: TQRLabel;
    QRLabel295: TQRLabel;
    l3: TQRLabel;
    l4: TQRLabel;
    lLact1: TQRLabel;
    lLact2: TQRLabel;
    lLact3: TQRLabel;
    llCowsHfrs1: TQRLabel;
    llCowsHfrs2: TQRLabel;
    llCowsHfrs3: TQRLabel;
    lAYPDTM1: TQRLabel;
    lAYPDTM2: TQRLabel;
    lAYPDTM3: TQRLabel;
    lAYPDLM1: TQRLabel;
    lAYPDLM2: TQRLabel;
    lAYPDLM3: TQRLabel;
    lMeanDiff1: TQRLabel;
    lMeanDiff2: TQRLabel;
    lMeanDiff3: TQRLabel;
    lMeanToDate1: TQRLabel;
    lMeanToDate2: TQRLabel;
    lMeanToDate3: TQRLabel;
    lAvgDYield1: TQRLabel;
    lAvgDYield2: TQRLabel;
    lAvgDYield3: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel301: TQRLabel;
    lTotalAnimalsInMilk: TQRLabel;
    lAvgYPDayTM: TQRLabel;
    lAvgYPDayLM: TQRLabel;
    lMeanDiff: TQRLabel;
    lMeanToDate: TQRLabel;
    lAvgDailyYieldToDate: TQRLabel;
    lLact4: TQRLabel;
    llCowsHfrs4: TQRLabel;
    lAYPDTM4: TQRLabel;
    lAYPDLM4: TQRLabel;
    lMeanDiff4: TQRLabel;
    lMeanToDate4: TQRLabel;
    lAvgDYield4: TQRLabel;
    lLact5: TQRLabel;
    llCowsHfrs5: TQRLabel;
    lAYPDTM5: TQRLabel;
    lAYPDLM5: TQRLabel;
    lMeanDiff5: TQRLabel;
    lMeanToDate5: TQRLabel;
    lAvgDYield5: TQRLabel;
    lLact6: TQRLabel;
    llCowsHfrs6: TQRLabel;
    lAYPDTM6: TQRLabel;
    lAYPDLM6: TQRLabel;
    lMeanDiff6: TQRLabel;
    lMeanToDate6: TQRLabel;
    lAvgDYield6: TQRLabel;
    lLact7: TQRLabel;
    llCowsHfrs7: TQRLabel;
    lAYPDTM7: TQRLabel;
    lAYPDLM7: TQRLabel;
    lMeanDiff7: TQRLabel;
    lMeanToDate7: TQRLabel;
    lAvgDYield7: TQRLabel;
    lLact8: TQRLabel;
    llCowsHfrs8: TQRLabel;
    lAYPDTM8: TQRLabel;
    lAYPDLM8: TQRLabel;
    lMeanDiff8: TQRLabel;
    lMeanToDate8: TQRLabel;
    lAvgDYield8: TQRLabel;
    lLact9: TQRLabel;
    llCowsHfrs9: TQRLabel;
    lAYPDTM9: TQRLabel;
    lAYPDLM9: TQRLabel;
    lMeanDiff9: TQRLabel;
    lMeanToDate9: TQRLabel;
    lAvgDYield9: TQRLabel;
    lLact10: TQRLabel;
    llCowsHfrs10: TQRLabel;
    lAYPDTM10: TQRLabel;
    lAYPDLM10: TQRLabel;
    lMeanDiff10: TQRLabel;
    lMeanToDate10: TQRLabel;
    lAvgDYield10: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel309: TQRLabel;
    VerLabel4: TQRLabel;
    LookupEvents: TTable;
    QRLabel1: TQRLabel;
    lRecordIn: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    rgMeasure2: TRadioGroup;
    qAnimals: TQuery;
    cbFavourite: TcxCheckBox;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure MilkRecDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupsDblClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure NationalIDNumber1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
     dThisMonth : TDateTime;
     dLastMonth : TDateTime;
     Lact1TotCowsHFRSTM,
     Lact2TotCowsHFRSTM,
     Lact3TotCowsHFRSTM,
     Lact4TotCowsHFRSTM,
     Lact5TotCowsHFRSTM,
     Lact6TotCowsHFRSTM,
     Lact7TotCowsHFRSTM,
     Lact8TotCowsHFRSTM,
     Lact9TotCowsHFRSTM,
     Lact10UpTotCowsHFRSTM,
     Lact1TotCowsHFRSLM,
     Lact2TotCowsHFRSLM,
     Lact3TotCowsHFRSLM,
     Lact4TotCowsHFRSLM,
     Lact5TotCowsHFRSLM,
     Lact6TotCowsHFRSLM,
     Lact7TotCowsHFRSLM,
     Lact8TotCowsHFRSLM,
     Lact9TotCowsHFRSLM,
     Lact10UpTotCowsHFRSLM,
     AnimalCount : Integer;
     TotalYieldPerAnimal,
     TotalDYield,
     TotYield1,
     TotLact1YieldTM,
     TotLact2YieldTM,
     TotLact3YieldTM,
     TotLact4YieldTM,
     TotLact5YieldTM,
     TotLact6YieldTM,
     TotLact7YieldTM,
     TotLact8YieldTM,
     TotLact9YieldTM,
     TotLact10UpYieldTM,
     TotLact1YieldLM,
     TotLact2YieldLM,
     TotLact3YieldLM,
     TotLact4YieldLM,
     TotLact5YieldLM,
     TotLact6YieldLM,
     TotLact7YieldLM,
     TotLact8YieldLM,
     TotLact9YieldLM,
     TotLact10UpYieldLM,
     Lact1AvgYieldTM,
     Lact2AvgYieldTM,
     Lact3AvgYieldTM,
     Lact4AvgYieldTM,
     Lact5AvgYieldTM,
     Lact6AvgYieldTM,
     Lact7AvgYieldTM,
     Lact8AvgYieldTM,
     Lact9AvgYieldTM,
     Lact10UpAvgYieldTM,
     Lact1AvgYieldLM,
     Lact2AvgYieldLM,
     Lact3AvgYieldLM,
     Lact4AvgYieldLM,
     Lact5AvgYieldLM,
     Lact6AvgYieldLM,
     Lact7AvgYieldLM,
     Lact8AvgYieldLM,
     Lact9AvgYieldLM,
     Lact10UpAvgYieldLM : Double;
     LactNumTM,
     LactNumLM : Integer;
     Cow1Count,
     Cow2Count,
     Cow3Count,
     Cow4Count,
     Cow5Count,
     Cow6Count,
     Cow7Count,
     Cow8Count,
     Cow9Count,
     Cow10Count,
     Hfr1Count,
     Hfr2Count,
     Hfr3Count,
     Hfr4Count,
     Hfr5Count,
     Hfr6Count,
     Hfr7Count,
     Hfr8Count,
     Hfr9Count,
     Hfr10Count,
     JanCows,
     JanHfrs,
     FebCows,
     FebHfrs,
     MarCows,
     MarHfrs,
     AprCows,
     AprHfrs,
     MayCows,
     MayHfrs,
     JunCows,
     JunHfrs,
     JulCows,
     JulHfrs,
     AugCows,
     AugHfrs,
     SepCows,
     SepHfrs,
     OctCows,
     OctHfrs,
     NovCows,
     NovHfrs,
     DecCows,
     DecHfrs : Integer;
     TLact,
     MyTable,
     TempTable : TTable;
     UseSolids,
     UseBFat,
     UseProt,
     UseGallons,
     UseKilos : Boolean;
     NoHfrDry,
     NoCowDry : Integer;
     MACount : Integer; // MACount = MilkingAnimalsCount
     eYear,
     eMonth,
     eDay,
     nYear,
     nMonth,
     nDay : Word;
     CutOffDryDate : TDateTime;
     CJanFrom,
     CJanTo,
     CFebFrom,
     CFebTo,
     CMarFrom,
     CMarTo,
     CAprFrom,
     CAprTo,
     CMayFrom,
     CMayTo,
     CJunFrom,
     CJunTo,
     CJulFrom,
     CJulTo,
     CAugFrom,
     CAugTo,
     CSepFrom,
     CSepTo,
     COctFrom,
     COctTo,
     CNovFrom,
     CNovTo,
     CDecFrom,
     CDecTo : TDateTime;
     CalcDYieldTM,
     CalcDYieldLM,
     CalcYieldDiffPrec,
     TotalYieldToDate,
     AvgDYToDate: Double;
     orderbystring,
     sortbystring,
     OrderFieldName,
     SortFieldName : String;
     Divider : Double;
     Sorted : Boolean;
     OldValue : String;

     SelectedGroups : String;

     procedure TempTables;
     procedure DoSummary;
     procedure IniVariables;
     procedure DoOwner;
     procedure DoMeanDiff;
     procedure DoTotals;
     procedure MilkAnalysis;
     procedure DailyYieldForHerd;
     procedure HerdCount;
     procedure MeasType;
     procedure DailyYieldPercHerd;
     procedure CalvMonthAna;
     procedure MonthlyPercs(Month : String);
     procedure GetDaysInMonth(Month : Integer);
     procedure TotalMilkProd;
     procedure GetTempData;
     procedure ClearGroups;
  public
    { Public declarations }
  end;

procedure ShowTheForm;

var
  fMilkRecSysScr : TfMilkRecSysScr;

implementation
uses
    DairyData,
    GenTypesConst, uMilkRep, KRoutines;

{$R *.DFM}

procedure ShowTheForm;
begin
end;

procedure TfMilkRecSysScr.GetTempData;
begin
   // First get all Animals that are in HerdCombo.
   With MyQuery do
      begin
         SQL.Clear;
         SQL.Add('Delete From TempMilkAna ');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO TempMilkAna (AnimalID, AnimalCode, LactNo, MDTID, DateOfRecording, DailyYield, DailyBFatPerc, DailyProtPerc, ');
         SQL.Add('                         DailyLactPerc, SCC, CumYield, CumBFatPerc, CumProtPerc, CumLactPerc, NoOfRecordings, DaysInMilk, Yield305,');
         SQL.Add('                         BFat305Perc, Prot305Perc, Lact305Perc ');
         if SelectedGroups <> '' then
            SQL.Add('            , GroupID, GroupName ) ')
         else
            SQL.Add('                        ) ');
         SQL.Add('SELECT DISTINCT          A.ID, M.AnimalCode, M.LactNo, M.MDTID, M.DateOfRecording, M.DailyYield, M.DailyBFatPerc, M.DailyProtPerc, ');
         SQL.Add('                         M.DailyLactPerc, M.SCC, M.CumYield, M.CumBFatPerc, M.CumProtPerc, M.CumLactPerc, M.NoOfRecordings, M.DaysInMilk, M.Yield305,');
         SQL.Add('                         M.BFat305Perc, M.Prot305Perc, M.Lact305Perc ');
         if SelectedGroups <> '' then
            SQL.Add('                      , GR.ID   , GR.Description');
         SQL.Add('FROM Animals A                                     ');
         SQL.Add('LEFT JOIN MilkDiskTrans M ON (M.AnimalID = A.ID)   ');

         if SelectedGroups <> '' then
            begin
               SQL.Add('LEFT JOIN GrpLinks GG ON (A.ID = GG.AnimalID)           ');
               SQL.Add('LEFT JOIN Grps GR ON (GR.ID = GG.GroupID)               ');
               SQL.Add('WHERE GG.GroupID IN ' + SelectedGroups + '               '); //A.ID IN (SELECT G.AnimalID From GrpLinks G        ');
               SQL.Add('AND (A.HerdID = "'+HerdCombo.Value+'")                  ');
               SQL.Add('AND GR.Selected = True                                  ');
               SQL.Add('AND GR.GroupType = "Batch"                              ');
            end
         else
            SQL.Add('WHERE (A.HerdID = "'+HerdCombo.Value+'")                   ');

         SQL.Add('AND A.Sex = "Female"                                    ');
         SQL.Add('AND A.LactNo > 0                                        ');
         SQL.Add('AND A.AnimalDeleted = False                             ');
         SQL.Add('AND A.ID IN (Select AnimalID From MilkDiskTrans)        ');

         ExecSQL;
      end;
end;

procedure TfMilkRecSysScr.DoSummary;
Var
   l,
   i : Integer;
   YieldToDate : Double;
begin
   l := (seNumLact.AsInteger);

   pbMilk.Max := ( seNumLact.AsInteger * 2 ) + 5;
   With MyQuery do
      begin
         SQL.Clear;
         SQL.Add('Delete From TLact ');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO TLact (AnimalID, AnimalCode, LactNo, DailyYield, CumYield, DaysInMilk, DailyBFatPerc, DailyProtPerc, CumBFatPerc, CumProtPerc) ');
         SQL.Add('SELECT DISTINCT    AnimalID, AnimalCode, LactNo, DailyYield, CumYield, DaysInMilk, DailyBFatPerc, DailyProtPerc, CumBFatPerc, CumProtPerc');
         SQL.Add('FROM TempMilkAna M ');
         SQL.Add('LEFT JOIN MDT D ON (D.ID=M.MDTID) ');
         SQL.Add('Where (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
         ExecSQL;
      end;
   pbMilk.StepIt;

   YieldToDate := 0;
   LactNumTM := 1;
   for i := 1 to L do
      begin
        With MyQuery do
           begin
              SQL.Clear;
              case rgMeasure.ItemIndex of
                 0 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyYield) AS TotalYield, Sum(CumYield) AS CumYield, Avg(DaysInMilk) AS DaysInMilk');
                 1 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyBFatPerc) AS TotalYield, Sum(CumBFatPerc) AS CumYield, Avg(DaysInMilk) AS DaysInMilk');
                 2 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyProtPerc) AS TotalYield, Sum(CumProtPerc) AS CumYield, Avg(DaysInMilk) AS DaysInMilk');
                 3 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyYield) AS TotalYield, Sum(CumBFatPerc) AS TCumBFatPerc, Sum(CumProtPerc)AS TCumProtPerc, Avg(DaysInMilk) AS DaysInMilk');
              end;
              SQL.Add('FROM TLact ');
              case L of
                 3 : if LactNumTM < 3 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 3 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                 4 : if LactNumTM < 4 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 4 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                 5 : if LactNumTM < 5 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 5 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                 6 : if LactNumTM < 6 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 6 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                 7 : if LactNumTM < 7 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 7 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                 8 : if LactNumTM < 8 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 8 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                 9 : if LactNumTM < 9 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 9 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
                10 : if LactNumTM < 10 then
                        SQL.Add('Where (LactNo = ' + IntToStr(LactNumTM) + ')')
                     else if LactNumTM = 10 then
                        SQL.Add('Where (LactNo >= ' + IntToStr(LactNumTM) + ')');
              end;
              Open;
              case LactNumTM of
                 1 : begin
                        if Not ISEmpty then
                           begin
                              Lact1TotCowsHFRSTM := StrToInt(MyQuery.FieldByName('AnimalCount').AsString);
                              llCowsHfrs1.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs1.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate1.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0) and
                                (Lact1TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact1YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact1TotCowsHFRSTM);
                                 TotLact1YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact1YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact1YieldTM));
                                 if TotLact1YieldTM > 0 then
                                    Lact1AvgYieldTM := (TotLact1YieldTM / Lact1TotCowsHFRSTM);
                                 lAYPDTM1.Caption := FloatToStrF(Lact1AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM1.Caption := '0';
                        end
                     else if ((rgMeasure.ItemIndex = 2) or (rgMeasure.ItemIndex = 1) or (rgMeasure.ItemIndex = 0))  then
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate1.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact1YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact1YieldTM > 0 then
                                    Lact1AvgYieldTM := (TotLact1YieldTM / Lact1TotCowsHFRSTM);
                                 lAYPDTM1.Caption := FloatToStrF(Lact1AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM1.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate1.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield1.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield1.Caption := '0';
                        end;

                     end;
                 2 : begin
                        if Not ISEmpty then
                           begin
                              Lact2TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs2.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs2.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate2.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0) or
                                (Lact2TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact2YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact2TotCowsHFRSTM);
                                 TotLact2YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact2YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact2YieldTM));
                                 if TotLact2YieldTM > 0 then
                                    Lact2AvgYieldTM := (TotLact2YieldTM / Lact2TotCowsHFRSTM);
                                 lAYPDTM2.Caption := FloatToStrF(Lact2AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM2.Caption := '0';
                        end
                     else if ((rgMeasure.ItemIndex = 2) or (rgMeasure.ItemIndex = 1) or (rgMeasure.ItemIndex = 0))  then
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate2.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact2YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact2YieldTM > 0 then
                                    Lact2AvgYieldTM := (TotLact2YieldTM / Lact2TotCowsHFRSTM);
                                 lAYPDTM2.Caption := FloatToStrF(Lact2AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM2.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate2.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield2.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield2.Caption := '0';
                        end;
                     end;
                 3 : begin
                        if Not ISEmpty then
                           begin
                              Lact3TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs3.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs3.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate3.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact3TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact3YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact3TotCowsHFRSTM);
                                 TotLact3YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact3YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact3YieldTM));
                                 if TotLact3YieldTM > 0 then
                                    Lact3AvgYieldTM := (TotLact3YieldTM / Lact3TotCowsHFRSTM);
                                 lAYPDTM3.Caption := FloatToStrF(Lact3AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM3.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate3.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact3YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact3YieldTM > 0 then
                                    Lact3AvgYieldTM := (TotLact3YieldTM / Lact3TotCowsHFRSTM);
                                 lAYPDTM3.Caption := FloatToStrF(Lact3AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM3.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate3.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield3.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield3.Caption := '0';
                        end;
                     end;
                 4 : begin

                        if Not ISEmpty then
                           begin
                              Lact4TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs4.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs4.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate4.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact4TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact4YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact4TotCowsHFRSTM);
                                 TotLact4YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact4YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact4YieldTM));
                                 if TotLact4YieldTM > 0 then
                                    Lact4AvgYieldTM := (TotLact4YieldTM / Lact4TotCowsHFRSTM);
                                 lAYPDTM4.Caption := FloatToStrF(Lact4AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM4.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate4.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact4YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact4YieldTM > 0 then
                                    Lact4AvgYieldTM := (TotLact4YieldTM / Lact4TotCowsHFRSTM);
                                 lAYPDTM4.Caption := FloatToStrF(Lact4AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM4.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate4.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield4.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield4.Caption := '0';
                        end;
                     end;
                 5 : begin
                        if Not ISEmpty then
                           begin
                              Lact5TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs5.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs5.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate5.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact5TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact5YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact5TotCowsHFRSTM);
                                 TotLact5YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact5YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact5YieldTM));
                                 if TotLact5YieldTM > 0 then
                                    Lact5AvgYieldTM := (TotLact5YieldTM / Lact5TotCowsHFRSTM);
                                 lAYPDTM5.Caption := FloatToStrF(Lact5AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM5.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate5.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact5YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact5YieldTM > 0 then
                                    Lact5AvgYieldTM := (TotLact5YieldTM / Lact5TotCowsHFRSTM);
                                 lAYPDTM5.Caption := FloatToStrF(Lact5AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM5.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate5.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield5.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield5.Caption := '0';
                        end;
                     end;
                 6 : begin
                        if Not ISEmpty then
                           begin
                              Lact6TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs6.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs6.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate6.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact6TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact6YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact6TotCowsHFRSTM);
                                 TotLact6YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact6YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact6YieldTM));
                                 if TotLact6YieldTM > 0 then
                                    Lact6AvgYieldTM := (TotLact6YieldTM / Lact6TotCowsHFRSTM);
                                 lAYPDTM6.Caption := FloatToStrF(Lact6AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM6.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate6.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact6YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact6YieldTM > 0 then
                                    Lact6AvgYieldTM := (TotLact6YieldTM / Lact6TotCowsHFRSTM);
                                 lAYPDTM6.Caption := FloatToStrF(Lact6AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM2.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate6.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield6.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield6.Caption := '0';
                        end;
                     end;
                 7 : begin
                        if Not ISEmpty then
                           begin
                              Lact7TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs7.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs7.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate7.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact7TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact7YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact7TotCowsHFRSTM);
                                 TotLact7YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact7YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact7YieldTM));
                                 if TotLact7YieldTM > 0 then
                                    Lact7AvgYieldTM := (TotLact7YieldTM / Lact7TotCowsHFRSTM);
                                 lAYPDTM7.Caption := FloatToStrF(Lact7AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM7.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate7.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact7YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact7YieldTM > 0 then
                                    Lact7AvgYieldTM := (TotLact7YieldTM / Lact7TotCowsHFRSTM);
                                 lAYPDTM7.Caption := FloatToStrF(Lact7AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM7.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate7.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield7.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield7.Caption := '0';
                        end;
                     end;
                 8 : begin
                        if Not ISEmpty then
                           begin
                              Lact8TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs8.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs8.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate8.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact8TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact8YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact8TotCowsHFRSTM);
                                 TotLact8YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact8YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact8YieldTM));
                                 if TotLact8YieldTM > 0 then
                                    Lact8AvgYieldTM := (TotLact8YieldTM / Lact8TotCowsHFRSTM);
                                 lAYPDTM8.Caption := FloatToStrF(Lact8AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM8.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate8.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact8YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact8YieldTM > 0 then
                                    Lact8AvgYieldTM := (TotLact8YieldTM / Lact8TotCowsHFRSTM);
                                 lAYPDTM8.Caption := FloatToStrF(Lact8AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM8.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate8.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield8.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield8.Caption := '0';
                        end;
                     end;
                 9 : begin
                        if Not ISEmpty then
                           begin
                              Lact9TotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs9.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs9.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate9.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact9TotCowsHFRSTM > 0)) then
                              begin
                                 TotLact9YieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact9TotCowsHFRSTM);
                                 TotLact9YieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact9YieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact9YieldTM));
                                 if TotLact9YieldTM > 0 then
                                    Lact9AvgYieldTM := (TotLact9YieldTM / Lact9TotCowsHFRSTM);
                                 lAYPDTM9.Caption := FloatToStrF(Lact9AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM9.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate9.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact9YieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact9YieldTM > 0 then
                                    Lact9AvgYieldTM := (TotLact9YieldTM / Lact9TotCowsHFRSTM);
                                 lAYPDTM9.Caption := FloatToStrF(Lact9AvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM9.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate9.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield9.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield9.Caption := '0';
                        end;
                     end;
                10 : begin
                        if Not ISEmpty then
                           begin
                              Lact10UpTotCowsHFRSTM := StrToInt(FieldByName('AnimalCount').AsString);
                              llCowsHfrs10.Caption := FieldByName('AnimalCount').AsString;
                           end
                        else
                           llCowsHfrs10.Caption := '0';

                     if rgMeasure.ItemIndex = 3 then
                        begin
                           if StrToInt(MyQuery.FieldByName('AnimalCount').AsString) > 0 then
                              if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)) then
                                 lMeanToDate10.Caption :=  FloatToStrF(((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)+(StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString))) / (StrToFloat(MyQuery.FieldByName('AnimalCount').AsString))),ffFixed,8,2);

                           if ((MyQuery.FieldByName('TCumBFatPerc').AsFloat > 0) or
                                (MyQuery.FieldByName('TCumProtPerc').AsFloat > 0)or
                                (MyQuery.FieldByName('TotalYield').AsFloat > 0)or
                                (Lact10UpTotCowsHFRSTM > 0)) then
                              begin
                                 TotLact10UpYieldTM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ Lact10UpTotCowsHFRSTM);
                                 TotLact10UpYieldTM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact10UpYieldTM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact10UpYieldTM));
                                 if TotLact10UpYieldTM > 0 then
                                    Lact10UpAvgYieldTM := (TotLact10UpYieldTM / Lact10UpTotCowsHFRSTM);
                                 lAYPDTM10.Caption := FloatToStrF(Lact10UpAvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM10.Caption := '0';
                        end
                     else
                        begin
                           if StrToInt(FieldByName('AnimalCount').AsString) > 0 then
                              if FieldByName('CumYield').AsFloat > 0 then
                                 lMeanToDate10.Caption :=  FloatToStrF(StrToFloat(FieldByName('CumYield').AsString) / StrToFloat(FieldByName('AnimalCount').AsString),ffFixed,8,2);

                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact10UpYieldTM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact10UpYieldTM > 0 then
                                    Lact10UpAvgYieldTM := (TotLact10UpYieldTM / Lact10UpTotCowsHFRSTM);
                                 lAYPDTM10.Caption := FloatToStrF(Lact10UpAvgYieldTM,ffFixed,8,2);
                              end
                           else
                              lAYPDTM10.Caption := '0';
                        end;

                        try
                           if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                              YieldToDate := StrToFloat(lMeanToDate10.Caption) / StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString);
                           lAvgDYield10.Caption := FloatToStrF(YieldToDate,ffFixed,8,2);
                        except
                           lAvgDYield10.Caption := '0';
                        end;
                     end;
              end;
              Inc(LactNumTM);
           end;
           pbMilk.StepIt;
      end;

   With MyQuery do
      begin
         SQL.Clear;
         SQL.Add('Delete From TLact ');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO TLact (AnimalID, AnimalCode, LactNo, DailyYield, CumYield, DaysInMilk,DailyBFatPerc, DailyProtPerc, CumBFatPerc, CumProtPerc) ');
         SQL.Add('SELECT DISTINCT    AnimalID, AnimalCode, LactNo, DailyYield, CumYield, DaysInMilk, DailyBFatPerc, DailyProtPerc, CumBFatPerc, CumProtPerc');
         SQL.Add('FROM TempMilkAna M ');
         SQL.Add('Where (DateOfRecording = "' + FormatDateTime(cUSDateStyle,dLastMonth) + '")');
         ExecSQL;
      end;
   pbMilk.StepIt;

   LactNumLM := 1;
   L := (seNumLact.AsInteger);
   for i := 1 to L do
      begin
         With MyQuery do
            begin
              SQL.Clear;
              case rgMeasure.ItemIndex of
                 0 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyYield) AS TotalYield, Sum(CumYield) AS CumYield, Avg(DaysInMilk) AS DaysInMilk');
                 1 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyBFatPerc) AS TotalYield, Sum(CumBFatPerc) AS CumYield, Avg(DaysInMilk) AS DaysInMilk');
                 2 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyProtPerc) AS TotalYield, Sum(CumProtPerc) AS CumYield, Avg(DaysInMilk) AS DaysInMilk');
                 3 : SQL.Add('SELECT Count(AnimalID) AnimalCount, SUM(DailyYield) AS TotalYield, Sum(CumBFatPerc) AS TCumBFatPerc, Sum(CumProtPerc)AS TCumProtPerc, Avg(DaysInMilk) AS DaysInMilk');
               end;
               SQL.Add('FROM TLact' ); //  (' + TThisMonth.TableName + ')');
               case L of
                  3 : begin
                         if LactNumLM < 3 then
                            SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                         else if LactNumLM = 3 then
                            SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                      end;
                  4 : begin
                         if LactNumLM < 4 then
                            SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                         else if LactNumLM = 4 then
                            SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                      end;
                  5 : begin
                        if LactNumLM < 5 then
                           SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                        else if LactNumLM = 5 then
                           SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                      end;
                  6 : begin
                        if LactNumLM < 6 then
                           SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                        else if LactNumLM = 6 then
                           SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                      end;
                  7 :  begin
                          if LactNumLM < 7 then
                             SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                          else if LactNumLM = 7 then
                             SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                       end;
                  8 :  begin
                          if LactNumLM < 8 then
                             SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                          else if LactNumLM = 8 then
                             SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                       end;
                  9 :  begin
                          if LactNumLM < 9 then
                             SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                          else if LactNumLM = 9 then
                             SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                       end;
                 10 :  begin
                          if LactNumLM < 10 then
                             SQL.Add('Where (LactNo = ' + IntToStr(LactNumLM) + ')')
                          else if LactNumLM = 10 then
                             SQL.Add('Where (LactNo >= ' + IntToStr(LactNumLM) + ')');
                       end;
               end;
               Open;
               Case LactNumLM of
                 1 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact1TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact1YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact1YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact1YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact1YieldLM));
                                 if TotLact1YieldLM > 0 then
                                    Lact1AvgYieldLM := (TotLact1YieldLM / Lact1TotCowsHFRSLM);
                                 lAYPDLM1.Caption := FloatToStrF(Lact1AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM1.Caption := '0';
                        end
                     else
                        begin
                           Lact1TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact1YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact1YieldLM > 0 then
                                    Lact1AvgYieldLM := (TotLact1YieldLM / Lact1TotCowsHFRSLM);
                                 lAYPDLM1.Caption := FloatToStrF(Lact1AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM1.Caption := '0';
                        end;
                     end;
                 2 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact2TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact2YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact2YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact2YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact2YieldLM));
                                 if TotLact2YieldLM > 0 then
                                    Lact2AvgYieldLM := (TotLact2YieldLM / Lact2TotCowsHFRSLM);
                                 lAYPDLM2.Caption := FloatToStrF(Lact2AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM2.Caption := '0';
                        end
                     else
                        begin
                           Lact2TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact2YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact2YieldLM > 0 then
                                    Lact2AvgYieldLM := (TotLact2YieldLM / Lact2TotCowsHFRSLM);
                                 lAYPDLM2.Caption := FloatToStrF(Lact2AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM2.Caption := '0';
                        end;
                     end;
                 3 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact3TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact3YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact3YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact3YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact3YieldLM));
                                 if TotLact3YieldLM > 0 then
                                    Lact3AvgYieldLM := (TotLact3YieldLM / Lact3TotCowsHFRSLM);
                                 lAYPDLM3.Caption := FloatToStrF(Lact3AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM3.Caption := '0';
                        end
                     else
                        begin
                           Lact3TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact3YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact3YieldLM > 0 then
                                    Lact3AvgYieldLM := (TotLact3YieldLM / Lact3TotCowsHFRSLM);
                                 lAYPDLM3.Caption := FloatToStrF(Lact3AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM3.Caption := '0';
                        end;
                     end;
                 4 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact4TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact4YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact4YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact4YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact4YieldLM));
                                 if TotLact4YieldLM > 0 then
                                    Lact4AvgYieldLM := (TotLact4YieldLM / Lact4TotCowsHFRSLM);
                                 lAYPDLM4.Caption := FloatToStrF(Lact4AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM4.Caption := '0';
                        end
                     else
                        begin
                           Lact4TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact4YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact4YieldLM > 0 then
                                    Lact4AvgYieldLM := (TotLact4YieldLM / Lact4TotCowsHFRSLM);
                                 lAYPDLM4.Caption := FloatToStrF(Lact4AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM4.Caption := '0';
                        end;
                     end;
                 5 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact5TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact5YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact5YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact5YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact5YieldLM));
                                 if TotLact5YieldLM > 0 then
                                    Lact5AvgYieldLM := (TotLact5YieldLM / Lact5TotCowsHFRSLM);
                                 lAYPDLM5.Caption := FloatToStrF(Lact5AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM5.Caption := '0';
                        end
                     else
                        begin
                           Lact5TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact5YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact5YieldLM > 0 then
                                    Lact5AvgYieldLM := (TotLact5YieldLM / Lact5TotCowsHFRSLM);
                                 lAYPDLM5.Caption := FloatToStrF(Lact5AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM5.Caption := '0';
                        end;
                     end;
                 6 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact6TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact6YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact6YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact6YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact6YieldLM));
                                 if TotLact6YieldLM > 0 then
                                    Lact6AvgYieldLM := (TotLact6YieldLM / Lact6TotCowsHFRSLM);
                                 lAYPDLM6.Caption := FloatToStrF(Lact6AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM6.Caption := '0';
                        end
                     else
                        begin
                           Lact6TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact6YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact6YieldLM > 0 then
                                    Lact6AvgYieldLM := (TotLact6YieldLM / Lact6TotCowsHFRSLM);
                                 lAYPDLM6.Caption := FloatToStrF(Lact6AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM6.Caption := '0';
                        end;
                     end;
                 7 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact7TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact7YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact7YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact7YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact7YieldLM));
                                 if TotLact7YieldLM > 0 then
                                    Lact7AvgYieldLM := (TotLact7YieldLM / Lact7TotCowsHFRSLM);
                                 lAYPDLM7.Caption := FloatToStrF(Lact7AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM7.Caption := '0';
                        end
                     else
                        begin
                           Lact7TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact7YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact7YieldLM > 0 then
                                    Lact7AvgYieldLM := (TotLact7YieldLM / Lact7TotCowsHFRSLM);
                                 lAYPDLM7.Caption := FloatToStrF(Lact7AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM7.Caption := '0';
                        end;
                     end;
                 8 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact8TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact8YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact8YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact8YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact8YieldLM));
                                 if TotLact8YieldLM > 0 then
                                    Lact8AvgYieldLM := (TotLact8YieldLM / Lact8TotCowsHFRSLM);
                                 lAYPDLM8.Caption := FloatToStrF(Lact8AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM8.Caption := '0';
                        end
                     else
                        begin
                           Lact8TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact8YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact8YieldLM > 0 then
                                    Lact8AvgYieldLM := (TotLact8YieldLM / Lact8TotCowsHFRSLM);
                                 lAYPDLM8.Caption := FloatToStrF(Lact8AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM8.Caption := '0';
                        end;
                     end;

                 9 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact9TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact9YieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact9YieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact9YieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact9YieldLM));
                                 if TotLact9YieldLM > 0 then
                                    Lact9AvgYieldLM := (TotLact9YieldLM / Lact9TotCowsHFRSLM);
                                 lAYPDLM9.Caption := FloatToStrF(Lact9AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM9.Caption := '0';
                        end
                     else
                        begin
                           Lact9TotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact9YieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                 if TotLact9YieldLM > 0 then
                                    Lact9AvgYieldLM := (TotLact9YieldLM / Lact9TotCowsHFRSLM);
                                 lAYPDLM9.Caption := FloatToStrF(Lact9AvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM9.Caption := '0';
                        end;
                     end;
                 10 : begin
                     if rgMeasure.ItemIndex = 3 then
                        begin
                           Lact10UpTotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                           if (NOT(FieldByName('TotalYield').AsString = '')) then
                              begin
                                 TotLact10UpYieldLM := (StrToFloat(MyQuery.FieldByName('TotalYield').AsString)/ StrToFloat(FieldByName('AnimalCount').AsString));
                                 TotLact10UpYieldLM := (((StrToFloat(MyQuery.FieldByName('TCumBFatPerc').AsString)/100)* TotLact10UpYieldLM) +((StrToFloat(MyQuery.FieldByName('TCumProtPerc').AsString) /100)* TotLact10UpYieldLM));
                                 if TotLact10UpYieldLM > 0 then
                                    Lact10UpAvgYieldLM := (TotLact10UpYieldLM / Lact10UpTotCowsHFRSLM);
                                 lAYPDLM10.Caption := FloatToStrF(Lact10UpAvgYieldLM,ffFixed,8,2);
                              end
                           else
                              lAYPDLM10.Caption := '0';
                        end
                     else
                        begin
                           Lact10UpTotCowsHFRSLM := StrToInt(FieldByName('AnimalCount').AsString);
                               if (NOT(FieldByName('TotalYield').AsString = '')) then
                                  begin
                                     TotLact10UpYieldLM := StrToFloat(FieldByName('TotalYield').AsString);
                                     if TotLact10UpYieldLM > 0 then
                                        Lact10UpAvgYieldLM := (TotLact10UpYieldLM / Lact10UpTotCowsHFRSLM);
                                     lAYPDLM10.Caption := FloatToStrF(Lact10UpAvgYieldLM,ffFixed,8,2);
                                  end
                               else
                                  lAYPDLM10.Caption := '0';
                              end;
                     end;
               end;
               Inc(LactNumLM);
            end;
            pbMilk.StepIt;
      end;

   for i := 0 to 1 do
      With MyQuery do
         begin
            SQL.Clear;
            case rgMeasure.ItemIndex of
               0 : SQL.Add('SELECT DISTINCT Sum(M.DailyYield) CalcYield, Count(M.AnimalID) AnimalCount');
               1 : SQL.Add('SELECT DISTINCT Sum(M.DailyBFatPerc) CalcYield, Count(M.AnimalID) AnimalCount');
               2 : SQL.Add('SELECT DISTINCT Sum(M.DailyProtPerc) CalcYield, Count(M.AnimalID) AnimalCount');
               3 : SQL.Add('SELECT DISTINCT Sum(M.DailyYield) CalcYield, Count(M.AnimalID) AnimalCount');
             end;
            SQL.Add('FROM TempMilkAna M');
            if i = 0 then
               SQL.Add('Where (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")')
            else
               SQL.Add('Where (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dLastMonth) + '")');
            Open;
            if NOT IsEmpty then
               begin
                  try
                     if i = 0 then
                        begin
                           if FieldByName('CalcYield').AsFloat > 0 then
                              begin
                                 CalcDYieldTM := (StrToFloat(FieldByName('CalcYield').AsString) / StrToInt(FieldByName('AnimalCount').AsString));
                                 lAvgYPDayTM.Caption := FloatToStrF(CalcDYieldTM,ffFixed,8,2);
                              end;
                        end
                     else
                        begin
                           if FieldByName('CalcYield').AsFloat > 0 then
                              begin
                                 CalcDYieldLM := (StrToFloat(FieldByName('CalcYield').AsString) / StrToInt(FieldByName('AnimalCount').AsString));
                                 lAvgYPDayLM.Caption := FloatToStrF(CalcDYieldLM,ffFixed,8,2);
                              end;
                        end;
                  except
                     //
                  end;
               end;
            pbMilk.StepIt;
         end;
   Divider := 0;
   if ((CalcDYieldTM > 0) AND (CalcDYieldLM > 0)) then
      begin
         Divider := ((CalcDYieldTM) - (CalcDYieldLM));
         lMeanDiff.Caption := FloatToStrF((Divider) / (CalcDYieldLM) * 100,ffFixed,8,2);
      end
   else if ((CalcDYieldTM > 0) AND (CalcDYieldLM <= 0)) then
      lMeanDiff.Caption := '100.00'
   else if ((CalcDYieldTM <= 0) AND (CalcDYieldLM > 0)) then
      lMeanDiff.Caption := '-100.00';
   pbMilk.StepIt;
   With MyQuery do
      begin
         SQL.Clear;
         case rgMeasure.ItemIndex of
            0 : SQL.Add('SELECT DISTINCT Sum(M.CumYield) CumYield, Count(M.AnimalID) AnimalCount, Avg(M.DaysInMilk) DaysInMilk');
            1 : SQL.Add('SELECT DISTINCT Sum(M.CumBFatPerc) CumYield, Count(M.AnimalID) AnimalCount, Avg(M.DaysInMilk) DaysInMilk');
            2 : SQL.Add('SELECT DISTINCT Sum(M.CumProtPerc) CumYield, Count(M.AnimalID) AnimalCount, Avg(M.DaysInMilk) DaysInMilk');
            3 : SQL.Add('SELECT DISTINCT Sum(M.CumBFatPerc + M.CumProtPerc) CumYield, Count(M.AnimalID) AnimalCount, Avg(M.DaysInMilk) DaysInMilk');
          end;
         SQL.Add('FROM TempMilkAna M');
         SQL.Add('where (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
         Open;
         if NOT IsEmpty then
            begin
               if MyQuery.FieldByName('CumYield').AsString <> '' then
                 lMeanToDate.Caption := FloatToStrF((StrToFloat(MyQuery.FieldByName('CumYield').AsString) / StrToInt(MyQuery.FieldByName('AnimalCount').AsString)),ffFixed,8,2);

               if MyQuery.FieldByName('DaysInMilk').AsString <> '' then
                 lAvgDailyYieldToDate.Caption := FloatToStrF((StrToFloat(lMeanToDate.Caption) / Trunc(StrToFloat(MyQuery.FieldByName('DaysInMilk').AsString))),ffFixed,8,2);
            end;
      end;
end;

procedure TfMilkRecSysScr.DoTotals;
begin
   // Total/Cows And Heifers
   lTotalAnimalsInMilk.Caption := IntToStr(Lact1TotCowsHFRSTM + Lact2TotCowsHFRSTM + Lact3TotCowsHFRSTM +
                                                    Lact4TotCowsHFRSTM + Lact5TotCowsHFRSTM + Lact6TotCowsHFRSTM +
                                                    Lact7TotCowsHFRSTM + Lact8TotCowsHFRSTM + Lact9TotCowsHFRSTM +
                                                    Lact10upTotCowsHFRSTM);
   pbMilk.StepIt;
end;

procedure TfMilkRecSysScr.DoMeanDiff;

   function GetMeanDiff(AvgYieldTM : Double; AvgYieldLM : Double) : String;
   var
      Divid,
      MeanDiff  : Double;
   begin
      try
         Divider := 0.00;

         if ((AvgYieldTM > 0) AND (AvgYieldLM > 0)) then
            begin
               Divider  := ((AvgYieldTM) - (AvgYieldLM));
               MeanDiff := ((Divider) / (AvgYieldLM)*100);
               RESULT   := FloatToStrF(MeanDiff,ffFixed,8,2);
            end
         else if (( AvgYieldTM  > 0 ) AND ( AvgYieldTM <= 0 )) then
            RESULT := '100.00'
         else if (( AvgYieldTM <= 0 ) AND ( AvgYieldTM > 0  )) then
            RESULT := '-100.00'

      except
         RESULT := '0.00';
      end;
   end;
begin
   lMeanDiff1.Caption  := GetMeanDiff(Lact1AvgYieldTM, Lact1AvgYieldLM);
   lMeanDiff2.Caption  := GetMeanDiff(Lact2AvgYieldTM, Lact2AvgYieldLM);
   lMeanDiff3.Caption  := GetMeanDiff(Lact3AvgYieldTM, Lact3AvgYieldLM);
   lMeanDiff4.Caption  := GetMeanDiff(Lact4AvgYieldTM, Lact4AvgYieldLM);
   lMeanDiff5.Caption  := GetMeanDiff(Lact5AvgYieldTM, Lact5AvgYieldLM);
   lMeanDiff6.Caption  := GetMeanDiff(Lact6AvgYieldTM, Lact6AvgYieldLM);
   lMeanDiff7.Caption  := GetMeanDiff(Lact7AvgYieldTM, Lact7AvgYieldLM);
   lMeanDiff8.Caption  := GetMeanDiff(Lact8AvgYieldTM, Lact8AvgYieldLM);
   lMeanDiff9.Caption  := GetMeanDiff(Lact9AvgYieldTM, Lact9AvgYieldLM);
   lMeanDiff10.Caption := GetMeanDiff(Lact10UpAvgYieldTM, Lact10UpAvgYieldLM);
   pbMilk.StepIt;
   pbMilk.Position := 100;
end;

procedure TfMilkRecSysScr.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfMilkRecSysScr.TempTables;
begin
   with TLact do
      begin
         TLact := TTable.Create(nil);
         TLact.TableName := 'TLact';
         TLact.DatabaseName := WinData.KingData.DatabaseName;

         TLact.Active := False;

         TLact.FieldDefs.Clear;
         TLact.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
         TLact.FieldDefs.Add('AnimalCode',ftString,15,FALSE);
         TLact.FieldDefs.Add('LactNo',ftInteger,0,FALSE);
         TLact.FieldDefs.Add('DailyYield',ftFloat,0,FALSE);
         TLact.FieldDefs.Add('CumYield',ftFloat,0,FALSE);
         TLact.FieldDefs.Add('DaysInMilk',ftInteger,0,FALSE);
         TLact.FieldDefs.Add('DailyBfatPerc',ftFloat,0,FALSE);
         TLact.FieldDefs.Add('DailyProtPerc',ftFloat,0,FALSE);
         TLact.FieldDefs.Add('CumBfatPerc',ftFloat,0,FALSE);
         TLact.FieldDefs.Add('CumProtPerc',ftFloat,0,FALSE);
         TLact.CreateTable;
         TLact.Open;
      end;

      with MyTable do
         begin
            MyTable := TTable.Create(nil);
            MyTable.TableName := 'TMilk';
            MyTable.DatabaseName := WinData.KingData.DatabaseName;

            MyTable.FieldDefs.Clear;
            MyTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
            MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
            MyTable.FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
            MyTable.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
            MyTable.FieldDefs.Add('SortNatID',ftString,20,FALSE);
            MyTable.FieldDefs.Add('LactNo',ftInteger,0,FALSE);
            MyTable.FieldDefs.Add('CalvingDate',ftDate,0,FALSE);
            MyTable.FieldDefs.Add('DueCalvingDate',ftDate,0,FALSE);
            MyTable.FieldDefs.Add('DaysInMilk',ftInteger,0,FALSE);
            MyTable.FieldDefs.Add('CumYield',ftFloat,0,FALSE);  // Cum Yield Last Lactation
            MyTable.FieldDefs.Add('DailyYieldTM',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('DailyYieldLM',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('YieldToDate',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('AvgDYDiffPerc',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('YieldLastLact',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('AvgYPerDayToDate',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('SireNo',ftString,10,FALSE);
            MyTable.FieldDefs.Add('GroupName',ftString,30,FALSE);
            MyTable.FieldDefs.Add('EventDesc',ftString,30,FALSE);
            MyTable.FieldDefs.Add('DailyBfatPerc',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('DailyProtPerc',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('CumBfatPerc',ftFloat,0,FALSE);
            MyTable.FieldDefs.Add('CumProtPerc',ftFloat,0,FALSE);

            MyTable.CreateTable;
            MyTable.Open;
         end;

      with TempTable do
         begin
            TempTable := TTable.Create(nil);
            TempTable.DatabaseName := WinData.KingData.DatabaseName;
            TempTable.TableName := 'TempMilkAna.db';

            TempTable.FieldDefs.Clear;
            TempTable.FieldDefs.Add('ID',ftAutoInc,0,FALSE);
            TempTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
            TempTable.FieldDefs.Add('AnimalCode',ftString,15,FALSE);
            TempTable.FieldDefs.Add('LactNo',ftSmallInt,0,FALSE);
            TempTable.FieldDefs.Add('MDTID',ftInteger,0,FALSE);
            TempTable.FieldDefs.Add('DateOfRecording',ftDate,0,FALSE);
            TempTable.FieldDefs.Add('DailyYield',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('DailyBfatPerc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('DailyProtPerc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('DailyLactPerc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('SCC',ftSmallInt,0,FALSE);
            TempTable.FieldDefs.Add('CumYield',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('CumBfatPerc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('CumProtPerc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('CumLactPerc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('NoOfRecordings',ftSmallInt,0,FALSE);
            TempTable.FieldDefs.Add('DaysInMilk',ftSmallInt,0,FALSE);
            TempTable.FieldDefs.Add('Yield305',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('Bfat305Perc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('Prot305Perc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('Lact305Perc',ftFloat,0,FALSE);
            TempTable.FieldDefs.Add('GroupID',ftInteger,0,FALSE);
            TempTable.FieldDefs.Add('GroupName',ftString,30,FALSE);
            TempTable.FieldDefs.Add('DryBeforeThisMonth',ftBoolean);
            TempTable.FieldDefs.Add('DryBeforeLastMonth',ftBoolean);
            TempTable.CreateTable;
            TempTable.Open;
         end;
end;

procedure TfMilkRecSysScr.sbViewClick(Sender: TObject);
var
   Groups : String;
begin
   sbView.Enabled := False;
   sbPrint.Enabled := False;
   try
      Application.CreateForm(TfMilkRep, fMilkRep);
      if ( rgType.ItemIndex = 1 ) then
         begin
            WinData.GetSelectedGroups(SelectedGroups);
            if SelectedGroups = '' then
               begin
                  MessageDlg('You must select a group',mtInformation,[mbOK],0);
                  Exit;
               end;
         end;

      MilkRecDateExit(Sender);
      IniVariables;
      DoOwner;
      MeasType;
      GetTempData;

      pbMilk.Show;
      if cbLact.Checked then
         begin
            cbLact.Font.Color := clRed;
            cbLact.Font.Style := [fsBold];
            Update;
            DoSummary;
            DoMeanDiff;
            DoTotals;
            pbMilk.Position := 0;
            cbLact.Font.Color := clWindowText;
            cbLact.Font.Style := [];
            Update;
         end;

      if cbDailyYield.Checked then
         begin
            cbDailyYield.Font.Color := clRed;
            cbDailyYield.Font.Style := [fsBold];
            Update;
            HerdCount;
            DailyYieldForHerd;
            cbDailyYield.Font.Color := clWindowText;
            cbDailyYield.Font.Style := [];
            Update;
         end;

      if cbCalvingMonth.Checked then
         begin
            cbCalvingMonth.Font.Color := clRed;
            cbCalvingMonth.Font.Style := [fsBold];
            Update;
            pbMilk.Max := 30;
            pbMilk.Step := 1;
            CalvMonthAna;
            cbCalvingMonth.Font.Color := clWindowText;
            cbCalvingMonth.Font.Style := [];
            Update;
         end;

      if cbMilkRecRpt.Checked then
         begin
            cbMilkRecRpt.Font.Color := clRed;
            cbMilkRecRpt.Font.Style := [fsBold];
            Update;
            MilkAnalysis;
            with qMilkSys do
               begin
                  SQl.Clear;
                  SQL.Add('Select * From TMilk ');
                  if NOT Sorted then
                     begin
                        orderbystring := 'SortAnimalNo';
                        sortbystring  := 'Asc';
                     end;
                  SQL.Add('ORDER BY ' + orderbystring + ' ' + sortbystring + ' ');
                  Open;
               end;
            pbMilk.Position := 0;
            cbMilkRecRpt.Font.Color := clWindowText;
            cbMilkRecRpt.Font.Style := [];
            Update;
         end;

      if cbLact.Checked then
         if (Sender As TRxSpeedButton).Hint = 'View' then
            qrMilkRep1.Preview
         else
            qrMilkRep1.Print;

      if cbMilkRecRpt.Checked then
         if (Sender As TRxSpeedButton).Hint = 'View' then
            fMilkRep.qrMilkRep2.Preview
         else
            fMilkRep.qrMilkRep2.Print;

      if cbDailyYield.Checked then
         if (Sender As TRxSpeedButton).Hint = 'View' then
            fMilkRep.qrMilkRep4.Preview
         else
            fMilkRep.qrMilkRep4.Print;

      if cbCalvingMonth.Checked then
         if (Sender As TRxSpeedButton).Hint = 'View' then
            fMilkRep.qrMilkRep3.Preview
         else
            fMilkRep.qrMilkRep3.Print;

   finally
      pbMilk.Position := 0;
      pbMilk.Hide;
      sbView.Enabled := True;
      sbPrint.Enabled := True;
      if fMilkRep <> nil then
         fMilkRep.Free;
   end;
end;

procedure TfMilkRecSysScr.IniVariables;
begin
   CalcDYieldTM := 0;
   CalcDYieldLM := 0;
   CalcYieldDiffPrec := 0;
   TotalYieldToDate := 0;
   AvgDYToDate := 0;
   Lact1TotCowsHFRSTM  := 0;
   Lact2TotCowsHFRSTM  := 0;
   Lact3TotCowsHFRSTM  := 0;
   Lact4TotCowsHFRSTM  := 0;
   Lact5TotCowsHFRSTM  := 0;
   Lact6TotCowsHFRSTM  := 0;
   Lact7TotCowsHFRSTM  := 0;
   Lact8TotCowsHFRSTM  := 0;
   Lact9TotCowsHFRSTM  := 0;
   Lact10UpTotCowsHFRSTM  := 0;
   Lact1TotCowsHFRSLM  := 0;
   Lact2TotCowsHFRSLM  := 0;
   Lact3TotCowsHFRSLM  := 0;
   Lact4TotCowsHFRSLM  := 0;
   Lact5TotCowsHFRSLM  := 0;
   Lact6TotCowsHFRSLM  := 0;
   Lact7TotCowsHFRSLM  := 0;
   Lact8TotCowsHFRSLM  := 0;
   Lact9TotCowsHFRSLM  := 0;
   Lact10UpTotCowsHFRSLM  := 0;
   TotLact1YieldTM  := 0;
   TotLact2YieldTM  := 0;
   TotLact3YieldTM  := 0;
   TotLact4YieldTM  := 0;
   TotLact5YieldTM  := 0;
   TotLact6YieldTM  := 0;
   TotLact7YieldTM  := 0;
   TotLact8YieldTM  := 0;
   TotLact9YieldTM  := 0;
   TotLact10UpYieldTM  := 0;
   TotLact1YieldLM  := 0;
   TotLact2YieldLM  := 0;
   TotLact3YieldLM  := 0;
   TotLact4YieldLM  := 0;
   TotLact5YieldLM  := 0;
   TotLact6YieldLM  := 0;
   TotLact7YieldLM  := 0;
   TotLact8YieldLM  := 0;
   TotLact9YieldLM  := 0;
   TotLact10UpYieldLM  := 0;
   Lact1AvgYieldTM  := 0;
   Lact2AvgYieldTM  := 0;
   Lact3AvgYieldTM  := 0;
   Lact4AvgYieldTM  := 0;
   Lact5AvgYieldTM  := 0;
   Lact6AvgYieldTM  := 0;
   Lact7AvgYieldTM  := 0;
   Lact8AvgYieldTM  := 0;
   Lact9AvgYieldTM  := 0;
   Lact10upAvgYieldTM  := 0;
   Lact1AvgYieldLM  := 0;
   Lact2AvgYieldLM  := 0;
   Lact3AvgYieldLM  := 0;
   Lact4AvgYieldLM  := 0;
   Lact5AvgYieldLM  := 0;
   Lact6AvgYieldLM  := 0;
   Lact7AvgYieldLM  := 0;
   Lact8AvgYieldLM  := 0;
   Lact9AvgYieldLM  := 0;
   Lact10UpAvgYieldLM  := 0;
   Cow1Count  := 0;
   Cow2Count  := 0;
   Cow3Count  := 0;
   Cow4Count  := 0;
   Cow5Count  := 0;
   Cow6Count  := 0;
   Cow7Count  := 0;
   Cow8Count  := 0;
   Cow9Count  := 0;
   Cow10Count  := 0;
   Hfr1Count  := 0;
   Hfr2Count  := 0;
   Hfr3Count  := 0;
   Hfr4Count  := 0;
   Hfr5Count  := 0;
   Hfr6Count  := 0;
   Hfr7Count  := 0;
   Hfr8Count  := 0;
   Hfr9Count  := 0;
   Hfr10Count  := 0;
end;

procedure TfMilkRecSysScr.MilkRecDateExit(Sender: TObject);
begin
   if (MilkRecDate.Value <> '') then
      dThisMonth := StrToDate(MilkRecDate.Value);
   if dThisMonth > 0 then
      if dsMilkRecDate.DataSet.Locate('RecordingDate',DateToStr(DThisMonth),[]) then
         begin
            dsMilkRecDate.DataSet.Next; // Go to next date.
            if dsMilkRecDate.DataSet.FieldByName('RecordingDate').AsDateTime > 0 then
               dLastMonth := dsMilkRecDate.DataSet.FieldByName('RecordingDate').AsDateTime;
         end;
end;

procedure TfMilkRecSysScr.FormShow(Sender: TObject);
var
   i : Integer;
begin
   WinData.dsGroups.DataSet.Filter := 'GroupType = ''Batch''';
   WinData.dsGroups.DataSet.Filtered:= True;
   Sorted := False;
   pbMilk.Hide;

   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   // There is a slight problem that i'm having here.
   // There's nothing i can do to make sure that the Herd and Milk Rec Month are related to each other.
   // There was the milk recording id introduced, but most milk recordings are completed without this ID Number!
   // So ensure that all animals reported on are in herd selected.
   qRecDate.Params[0].AsDateTime := 0;
   qRecDate.Open;

   dsMilkRecDate.DataSet.First;// Go to the last MilkRec, List is sorted Desc
   MilkRecDate.Value := DateToStr(dsMilkRecDate.DataSet.FieldByName('RecordingDate').AsDateTime);

   LactNumLM := 1;

   rgMeasure.ItemIndex := 0;
   rgType.ItemIndex := 0;

   for i := 0 to gbRepTypes.ControlCount-1 do
      if NOT(gbRepTypes.Controls[i] as TCheckBox ).Checked then
        (gbRepTypes.Controls[i] as TCheckBox ).Checked := TRUE;

   qGroups.SQL.Clear;
   qGroups.SQL.Text := 'Select * From Grps where GroupType = "Feed"';
   qGroups.Open;

   sbView.Enabled := True;
   sbPrint.Enabled := True;

   //   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cMonthSumAnalysisRep);
   WinData.UpdateRecentReportUsage(cMonthSumAnalysisRep);
end;

procedure TfMilkRecSysScr.DoOwner;
var
   Date: String;
begin
   fMilkRep.VerLabel1.Caption := 'Herd Management '+HerdVerNo;
   fMilkRep.VerLabel2.Caption := 'Herd Management '+HerdVerNo;
   fMilkRep.VerLabel3.Caption := 'Herd Management '+HerdVerNo;
   VerLabel4.Caption := 'Herd Management '+HerdVerNo;
   if WinData.OwnerFile.Locate('ID',HerdCombo.Value,[]) then
      begin
         if WinData.OwnerFile.FieldByName('Country').AsInteger = 1 then
            begin
               lName1.Caption  := WinData.OwnerFile.FieldByName('Name').AsString;
               lName2.Caption  := WinData.OwnerFile.FieldByName('Address1').AsString;
               lAdd1.Caption   := WinData.OwnerFile.FieldByName('Address2').AsString;
               lAdd2.Caption   := WinData.OwnerFile.FieldByName('Address3').AsString;
               lAdd3.Caption   := WinData.OwnerFile.FieldByName('Address4').AsString;
               lAdd4.Caption   := '';
               fMilkRep.lName12.Caption := lName1.Caption;
               fMilkRep.lName22.Caption := lName2.Caption;
               fMilkRep.lAdd12.Caption  := lAdd1.Caption;
               fMilkRep.lAdd22.Caption  := lAdd2.Caption;
               fMilkRep.lAdd32.Caption  := lAdd3.Caption;
               fMilkRep.lAdd42.Caption  := '';
               fMilkRep.lName13.Caption := lName1.Caption;
               fMilkRep.lName23.Caption := lName2.Caption;
               fMilkRep.lAdd13.Caption  := lAdd1.Caption;
               fMilkRep.lAdd23.Caption  := lAdd2.Caption;
               fMilkRep.lAdd33.Caption  := lAdd3.Caption;
               fMilkRep.lAdd43.Caption  := '';
               fMilkRep.lName14.Caption := lName1.Caption;
               fMilkRep.lName24.Caption := lName2.Caption;
               fMilkRep.lAdd14.Caption  := lAdd1.Caption;
               fMilkRep.lAdd24.Caption  := lAdd2.Caption;
               fMilkRep.lAdd34.Caption  := lAdd3.Caption;
               fMilkRep.lAdd44.Caption  := '';
            end
         else
            begin
               lName1.Caption  := WinData.OwnerFile.FieldByName('Name').AsString;
               lName2.Caption  := WinData.OwnerFile.FieldByName('SurName').AsString;
               lAdd1.Caption   := WinData.OwnerFile.FieldByName('Address1').AsString;
               lAdd2.Caption   := WinData.OwnerFile.FieldByName('Address2').AsString;
               lAdd3.Caption   := WinData.OwnerFile.FieldByName('Address3').AsString;
               lAdd4.Caption   := WinData.OwnerFile.FieldByName('Address4').AsString;
               fMilkRep.lName12.Caption := lName1.Caption;
               fMilkRep.lName22.Caption := lName2.Caption;
               fMilkRep.lAdd12.Caption  := lAdd1.Caption;
               fMilkRep.lAdd22.Caption  := lAdd2.Caption;
               fMilkRep.lAdd32.Caption  := lAdd3.Caption;
               fMilkRep.lAdd42.Caption  := lAdd4.Caption;
               fMilkRep.lName13.Caption := lName1.Caption;
               fMilkRep.lName23.Caption := lName2.Caption;
               fMilkRep.lAdd13.Caption  := lAdd1.Caption;
               fMilkRep.lAdd23.Caption  := lAdd2.Caption;
               fMilkRep.lAdd33.Caption  := lAdd3.Caption;
               fMilkRep.lAdd43.Caption  := lAdd4.Caption;
               fMilkRep.lName14.Caption := lName1.Caption;
               fMilkRep.lName24.Caption := lName2.Caption;
               fMilkRep.lAdd14.Caption  := lAdd1.Caption;
               fMilkRep.lAdd24.Caption  := lAdd2.Caption;
               fMilkRep.lAdd34.Caption  := lAdd3.Caption;
               fMilkRep.lAdd44.Caption  := lAdd4.Caption;
            end;
      end;

   Date := MilkRecDate.Value;
  if (Copy(Date,4,2) = '01') then
      begin
         lMonth.Caption := 'JAN';
         fMilkRep.lMonth2.Caption := 'JAN';
         fMilkRep.lMonth4.Caption := 'JAN';
      end
   else if (Copy(Date,4,2) = '02') then
      begin
         lMonth.Caption := 'FEB';
         fMilkRep.lMonth2.Caption := 'FEB';
         fMilkRep.lMonth4.Caption := 'FEB';
      end
   else if (Copy(Date,4,2) = '03') then
      begin
         lMonth.Caption := 'MAR';
         fMilkRep.lMonth2.Caption := 'MAR';
         fMilkRep.lMonth4.Caption := 'MAR';
      end
   else if (Copy(Date,4,2) = '04') then
      begin
         lMonth.Caption := 'APR';
         fMilkRep.lMonth2.Caption := 'APR';
         fMilkRep.lMonth4.Caption := 'APR';
      end
   else if (Copy(Date,4,2) = '05') then
      begin
         lMonth.Caption := 'MAY';
         fMilkRep.lMonth2.Caption := 'MAY';
         fMilkRep.lMonth4.Caption := 'MAY';
      end
   else if (Copy(Date,4,2) = '06') then
      begin
         lMonth.Caption := 'JUN';
         fMilkRep.lMonth2.Caption := 'JUN';
         fMilkRep.lMonth4.Caption := 'JUN';
      end
   else if (Copy(Date,4,2) = '07') then
      begin
         lMonth.Caption := 'JUL';
         fMilkRep.lMonth2.Caption := 'JUL';
         fMilkRep.lMonth4.Caption := 'JUL';
      end
   else if (Copy(Date,4,2) = '08') then
      begin
         lMonth.Caption := 'AUG';
         fMilkRep.lMonth2.Caption := 'AUG';
         fMilkRep.lMonth4.Caption := 'AUG';
      end
   else if (Copy(Date,4,2) = '09') then
      begin
         lMonth.Caption := 'Sep';
         fMilkRep.lMonth2.Caption := 'Sep';
         fMilkRep.lMonth4.Caption := 'Sep';
      end
   else if (Copy(Date,4,2) = '10') then
      begin
         lMonth.Caption := 'OCT';
         fMilkRep.lMonth2.Caption := 'OCT';
         fMilkRep.lMonth4.Caption := 'OCT';
      end
   else if (Copy(Date,4,2) = '11') then
      begin
         lMonth.Caption := 'NOV';
         fMilkRep.lMonth2.Caption := 'NOV';
         fMilkRep.lMonth4.Caption := 'NOV';
      end
   else if (Copy(Date,4,2) = '12') then
      begin
         lMonth.Caption := 'DEC';
         fMilkRep.lMonth2.Caption := 'DEC';
         fMilkRep.lMonth4.Caption := 'DEC';
      end
   else
      begin
         lMonth.Caption := Copy(Date,4,2);
         fMilkRep.lMonth2.Caption := Copy(Date,4,2);
         fMilkRep.lMonth4.Caption := Copy(Date,4,2);
      end;
   lYear.Caption := Copy(Date,7,4);
   fMilkRep.lYear2.Caption := Copy(Date,7,4);
   fMilkRep.lYear4.Caption := Copy(Date,7,4);
   fMilkRep.lDateRec.Caption := MilkRecDate.Text;
   fMilkRep.lHerdID.Caption := HerdCombo.Text;

   case rgMeasure.ItemIndex of
      0: lRecordIn.Caption := 'Yield';
      1: lRecordIn.Caption := 'Butter Fat Percentage';
      2: lRecordIn.Caption := 'Protien Percentage';
      3: lRecordIn.Caption := 'Solids';
   end;

   case rgMeasure.ItemIndex of
      0: fMilkRep.lRecordingIn.Caption := 'Yield';
      1: fMilkRep.lRecordingIn.Caption := 'Butter Fat Percentage';
      2: fMilkRep.lRecordingIn.Caption := 'Protien Percentage';
      3: fMilkRep.lRecordingIn.Caption := 'Solids';
   end;

   case rgMeasure.ItemIndex of
      0: fMilkRep.lRecordIn.Caption := 'Yield';
      1: fMilkRep.lRecordIn.Caption := 'Butter Fat Percentage';
      2: fMilkRep.lRecordIn.Caption := 'Protien Percentage';
      3: fMilkRep.lRecordIn.Caption := 'Solids';
   end;
end;

procedure TfMilkRecSysScr.MilkAnalysis;
var
   PrevLactNo : Integer;
   Divider : Double;
   Gestation : Integer;
   DueToCalve,
   ServiceDate : TDateTime;
   s : String;
   BreedingDataHelper : TBreedingDataHelper;
begin

   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('Delete From TMilk ');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO TMilk (AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID, LactNo, ');
         SQL.Add('                     DaysInMilk, DailyYieldTM, YieldToDate, GroupName, SireNo) ');
         case rgMeasure.ItemIndex of
            0 : begin
                   SQL.Add('SELECT DISTINCT     (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.LactNo, ');
                   SQL.Add('                     M.DaysInMilk, M.DailyYield, M.CumYield , M.GroupName, S.AnimalNo');
                end;
            1 : begin
                   SQL.Add('SELECT DISTINCT     (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.LactNo, ');
                   SQL.Add('                     M.DaysInMilk, M.DailyBfatPerc, M.CumBFatPerc , M.GroupName, S.AnimalNo');
                end;
            2 : begin
                   SQL.Add('SELECT DISTINCT     (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.LactNo, ');
                   SQL.Add('                     M.DaysInMilk, M.DailyProtPerc, M.CumProtPerc, M.GroupName, S.AnimalNo');
                end;
            3 : begin
                   SQL.Add('SELECT DISTINCT     (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.LactNo, ');
                   SQL.Add('                     M.DaysInMilk, (((M.DailyProtPerc + M.DailyBfatPerc)/100) * M.DailyYield), (((M.CumBFatPerc + M.CumProtPerc)/100) * M.CumYield), M.GroupName, S.AnimalNo');
                end;
         end;

         SQL.Add('FROM TempMilkAna M');
         SQL.Add('LEFT JOIN Animals A ON (M.AnimalID=A.ID)');
         SQL.Add('LEFT JOIN MDT D ON (M.MDTID=D.ID) ');
         SQL.Add('LEFT JOIN Animals S ON (A.SireID=S.ID)');
         if (SelectedGroups <> '') then
            begin
               SQL.Add('WHERE M.AnimalID IN (SELECT G.AnimalID From GrpLinks G         ');
               SQL.Add('                     WHERE G.GroupID IN ' + SelectedGroups + ') ');
               SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")')
            end
         else
            SQL.Add('WHERE (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
         ExecSQL;
      end;

   if ( MyTable.RecordCount > 0 ) then
      try
         BreedingDataHelper := TBreedingDataHelper.Create();
         BreedingDataHelper.CreateTempBreedingDataTables;
         pbMilk.Min := 0;
         pbMilk.Max := MyTable.RecordCount;
         MyTable.First;
         while ( not(MyTable.Eof) ) do
            begin
               Application.ProcessMessages;
               MyTable.Edit;

               { Get last Calving Date }
               BreedingDataHelper.TempCalvings.Filter := '(AnimalID = '+IntToStr(MyTable.FieldByName('AnimalID').AsInteger)+') And (AnimalLactNo = '+IntToStr(MyTable.FieldByName('LactNo').AsInteger)+')';
               BreedingDataHelper.TempCalvings.Filtered := True;
               if BreedingDataHelper.TempCalvings.FindLast then
                  MyTable.FieldByName('CalvingDate').AsDateTime := BreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime;
               BreedingDataHelper.TempCalvings.Filter := '';
               BreedingDataHelper.TempCalvings.Filtered := False;

               { Get last Service Date }
               BreedingDataHelper.TempServices.Filter := '(AnimalID = '+IntToStr(MyTable.FieldByName('AnimalID').AsInteger)+') And (AnimalLactNo = '+IntToStr(MyTable.FieldByName('LactNo').AsInteger)+')';
               BreedingDataHelper.TempServices.Filtered := True;
               if BreedingDataHelper.TempServices.FindLast then
                  begin
                     Gestation := 283;
                     ServiceDate := BreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                     if WinData.LookUpServices.Locate('EventID',BreedingDataHelper.TempServices.FieldByName('EventID').AsInteger,[]) then
                        Gestation := BreedingDataHelper.GetGestation(WinData.LookUpServices.FieldByName('ServiceBull').AsInteger);
                     DueToCalve := ServiceDate+Gestation;
                     if DueToCalve > 0 then
                        MyTable.FieldByName('DueCalvingDate').AsDateTime := DueToCalve;
                  end;
               BreedingDataHelper.TempServices.Filter := '';
               BreedingDataHelper.TempServices.Filtered := False;

               { Get last Health Date }
               WinData.CheckEvents.Filter := '';
               WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(MyTable.FieldByName('AnimalID').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(MyTable.FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CHealthEvent) + ')';
               WinData.CheckEvents.Filtered := True;
               if WinData.CheckEvents.FindLast then
                  MyTable.FieldByName('EventDesc').AsString := WinData.CheckEvents.FieldByName('EventDesc').AsString;
               WinData.CheckEvents.Filter := '';
               WinData.CheckEvents.Filtered := False;

               PrevLactNo := MyTable.FieldByName('LactNo').AsInteger-1;

               // Get the 305 Yield for the last lact, if not found then presume its 0
               if ( PrevLactNo > 0 ) then
                  with MyQuery do
                     begin
                        SQL.Clear;
                        case rgMeasure.ItemIndex of
                           0 : SQL.Add('SELECT (Yield305) Yield305 ');
                           1 : SQL.Add('SELECT (BFatPerc305) Yield305 ');
                           2 : SQL.Add('SELECT (ProtPerc305) Yield305 ');
                           3 : SQL.Add('SELECT (((BFatPerc305 + ProtPerc305)/100) * Yield305) Yield305 ');
                        end;
                        SQL.Add('FROM MilkDisk M');
                        SQL.Add('WHERE (M.AnimalID = ' + IntToStr( MyTable.FieldByName('AnimalID').AsInteger ) + ')');
                        SQL.Add('AND M.LactNo = ' + IntToStr(PrevLactNo) + ' ');
                        Open;
                        First;
                        if NOT IsEmpty then
                           begin
                              if MyQuery.FieldByName('Yield305').AsFloat > 0 then
                                 MyTable.FieldByName('YieldLastLact').AsFloat := MyQuery.FieldByName('Yield305').AsFloat
                              else
                                 MyTable.FieldByName('YieldLastLact').AsFloat := 0;
                           end
                        else
                           MyTable.FieldByName('YieldLastLact').AsFloat := 0;
                    end;

               // Get the Daily Yield for the last month, if not found then presume its 0
               with MyQuery do
                  begin
                     SQL.Clear;
                     case rgMeasure.ItemIndex of
                        0 : SQL.Add('SELECT (DailyYield) DailyYield');
                        1 : SQL.Add('SELECT (DailyBFatPerc)  DailyYield');
                        2 : SQL.Add('SELECT (DailyProtPerc) DailyYield');
                        3 : SQL.Add('SELECT (((DailyProtPerc + DailyBfatPerc)/100) * DailyYield) DailyYield ');
                     end;
                     SQL.Add('FROM MilkDiskTrans M');
                     SQL.Add('WHERE M.AnimalID = ' + IntToStr(MyTable.FieldByName('AnimalID').AsInteger) + '');
                     SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dLastMonth) + '")');
                     Open;
                     First;

                     if NOT IsEmpty then
                        MyTable.FieldByName('DailyYieldLM').AsFloat := StrToFloat(FieldByName('DailyYield').AsString)
                     else
                        MyTable.FieldByName('DailyYieldLM').AsFloat := 0;
                  end;

               // Formula = (((ThisMonth - LastMonth) = x ) - ((LastMonth) * 100))
               if ((MyTable.FieldByName('DailyYieldTM').AsFloat > 0) AND (MyTable.FieldByName('DailyYieldLM').AsFloat > 0)) then
                  begin
                     Divider := 0;
                     Divider := ((MyTable.FieldByName('DailyYieldTM').AsFloat) - (MyTable.FieldByName('DailyYieldLM').AsFloat));
                     MyTable.FieldByName('AvgDYDiffPerc').AsFloat := Round(((Divider) / (MyTable.FieldByName('DailyYieldLM').AsFloat))*100);
                  end
               else if (MyTable.FieldByName('DailyYieldTM').AsFloat > 0) then
                  MyTable.FieldByName('AvgDYDiffPerc').AsFloat := 100
               else if (MyQuery.FieldByName('DailyYield').AsFloat > 0) then
                  MyTable.FieldByName('AvgDYDiffPerc').AsFloat := 100;

               try
                  MyTable.FieldByName('AvgYPerDayToDate').AsFloat := ((MyTable.FieldByName('YieldToDate').AsFloat) / (MyTable.FieldByName('DaysInMilk').AsInteger));
               except
                  MyTable.FieldByName('AvgYPerDayToDate').AsFloat := 0.00;
               end;

               MyTable.Post;
               MyTable.Next;
               pbMilk.Position := MyTable.RecNo;
            end;
      finally
         //   03/07/17 [V5.6 R9.1] /MK Bug Fix - Access Violation error appearing at Details Monthly Comparison stage of report due to BreedingDataHelper being free'd.
         if ( BreedingDataHelper <> nil ) then
            FreeAndNil(BreedingDataHelper);
      end;
end;

procedure TfMilkRecSysScr.NationalIDNumber1Click(Sender: TObject);
var
   TempStr : String;
   i : Integer;
begin
   Sorted := True;
   orderbystring := '';
   sortbystring  := '';

   (Sender As TMenuItem).Checked := True;
   for i := 0 to pmSort.Items.Count-1 do
      begin
         if pmSort.Items[i].GroupIndex = 1 then
            begin
               if pmSort.Items[i].Checked then
                  begin
                     Orderbystring := pmSort.Items[i].Hint;
                     TempStr := (sender as Tmenuitem).Caption;
                     if POS('&', TempStr) > 0 then
                        Delete(TempStr,POS('&',TempStr),1);
                     OrderFieldName := TempStr;
                  end;
            end
         else
            begin
               if pmSort.Items[i].Checked then
                  begin
                     sortbystring := pmSort.Items[i].Hint;
                     TempStr := (sender as Tmenuitem).Caption;
                     if POS('&', TempStr) > 0 then
                        Delete(TempStr,POS('&',TempStr),1);
                     SortFieldName := TempStr;
                  end;
            end;
      end;

end;

procedure TfMilkRecSysScr.HerdCount;
begin
   MACount := 0;
   dThisMonth := 0;
   dThisMonth := StrToDate(MilkRecDate.Value);
   with qHerdCount do
      begin
         SQL.Clear;
         SQL.Add('Select Count(AnimalID) MACount ');
         SQL.Add('From MilkDiskTrans ');
         SQL.Add('Where (DateOfRecording= "' + FormatDateTime(cUSDateStyle,dThisMonth) + '") ');
         Open;
      end;
   MACount := StrToInt(qHerdCount.FieldByName('MACount').AsString);
end;

procedure TfMilkRecSysScr.DailyYieldForHerd;
var
   AnimalCount,
   i,
   j : Integer;
   DYFrom,
   DYTo : String;
   res : boolean;
   FemaleCount : Integer;
begin
   AnimalCount := 0;
   HerdCount;
   NoHfrDry := 0;
   NoCowDry := 0;
   pbMilk.Max := 20;
   for i := 1 to 10 do
      begin
         if UseGallons then
            begin
               Case i of
                  1 : begin
                         DYFrom := '0.1';
                         DYTo   := '0.99';
                      end;
                  2 : begin
                         DYFrom := '1.0';
                         DYTo   := '1.99';
                      end;
                  3 : begin
                         DYFrom := '2.0';
                         DYTo   := '2.99';
                      end;
                  4 : begin
                         DYFrom := '3.0';
                         DYTo   := '3.99';
                      end;
                  5 : begin
                         DYFrom := '4.0';
                         DYTo   := '4.99';
                      end;
                  6 : begin
                         DYFrom := '5.0';
                         DYTo   := '5.99';
                      end;
                  7 : begin
                         DYFrom := '6.0';
                         DYTo   := '6.99';
                      end;
                  8 : begin
                         DYFrom := '7.0';
                         DYTo   := '7.99';
                      end;
                  9 : begin
                         DYFrom := '8.0';
                         DYTo   := '8.99';
                      end;
                 10 : begin
                         DYFrom := '9.0';
                      end;
               end;
            end
         else if UseKilos then
            begin
               Case i of
                  1 : begin
                         DYFrom := '0';
                         DYTo   := '4.99';
                      end;
                  2 : begin
                         DYFrom := '5';
                         DYTo   := '9.99';
                     end;
                  3 : begin
                         DYFrom := '10';
                         DYTo   := '14.99';
                      end;
                  4 : begin
                         DYFrom := '15';
                         DYTo   := '19.99';
                      end;
                  5 : begin
                         DYFrom := '20';
                         DYTo   := '24.99';
                      end;
                  6 : begin
                         DYFrom := '25';
                         DYTo   := '29.99';
                      end;
                  7 : begin
                         DYFrom := '30';
                         DYTo   := '34.99';
                      end;
                  8 : begin
                         DYFrom := '35';
                         DYTo   := '39.99';
                      end;
                  9 : begin
                         DYFrom := '40';
                         DYTo   := '44.99';
                      end;
                 10 : begin
                         DYFrom := '45';
                      end;
               end;
            end
         else if (UseBFat or UseProt) then
            begin
               Case i of
                  1 : begin
                         DYFrom := '0';
                         DYTo   := '2.99';
                      end;
                  2 : begin
                         DYFrom := '3';
                         DYTo   := '3.19';
                     end;
                  3 : begin
                         DYFrom := '3.2';
                         DYTo   := '3.29';
                      end;
                  4 : begin
                         DYFrom := '3.3';
                         DYTo   := '3.39';
                      end;
                  5 : begin
                         DYFrom := '3.4';
                         DYTo   := '3.49';
                      end;
                  6 : begin
                         DYFrom := '3.5';
                         DYTo   := '3.59';
                      end;
                  7 : begin
                         DYFrom := '3.6';
                         DYTo   := '3.69';
                      end;
                  8 : begin
                         DYFrom := '3.7';
                         DYTo   := '3.79';
                      end;
                  9 : begin
                         DYFrom := '3.8';
                         DYTo   := '4.0';
                      end;
                 10 : begin
                         DYFrom := '40';
                      end;
               end;
            end
         else if (UseSolids) then
            begin
               Case i of
                  1 : begin
                         DYFrom := '0';
                         DYTo   := '10';
                      end;
                  2 : begin
                         DYFrom := '10';
                         DYTo   := '14';
                     end;
                  3 : begin
                         DYFrom := '14';
                         DYTo   := '16';
                      end;
                  4 : begin
                         DYFrom := '16';
                         DYTo   := '18';
                      end;
                  5 : begin
                         DYFrom := '18';
                         DYTo   := '20';
                      end;
                  6 : begin
                         DYFrom := '20';
                         DYTo   := '22';
                      end;
                  7 : begin
                         DYFrom := '22';
                         DYTo   := '24';
                      end;
                  8 : begin
                         DYFrom := '24';
                         DYTo   := '26';
                      end;
                  9 : begin
                         DYFrom := '26';
                         DYTo   := '20';
                      end;
                 10 : begin
                         DYFrom := '30';
                      end;
               end;
            end;

         // Loop through and Get the Number of Heifers and Cows with DailyYields is between Variables DYFrom to DYTo
         // when it gets to 10 it calulates all animals with with daily yield over 45 kilograms.
         With MyQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT Count(M.AnimalID) AnimalCount ');
               SQL.Add('FROM TempMilkAna M                   ');
               SQL.Add('WHERE (M.AnimalID > 0)');
               if rgMeasure.ItemIndex = 0 then
                  begin
                     if i > 9 then
                        SQL.Add('AND M.DailyYield > ' + DYFrom + '')
                     else
                        SQL.Add('AND M.DailyYield Between ' + DYFrom + ' AND ' + DYTo + '');
                  end
               else if rgMeasure.ItemIndex = 1 then
                  begin
                     if i > 9 then
                        SQL.Add('AND M.DailyBfatPerc > ' + DYFrom + '')
                     else
                        SQL.Add('AND M.DailyBfatPerc Between ' + DYFrom + ' AND ' + DYTo + '');
                  end
               else if rgMeasure.ItemIndex = 2 then
                  begin
                     if i > 9 then
                        SQL.Add('AND M.DailyProtPerc > ' + DYFrom + '')
                     else
                        SQL.Add('AND M.DailyProtPerc Between ' + DYFrom + ' AND ' + DYTo + '');
                  end
               else if rgMeasure.ItemIndex = 3 then
                  begin
                     if i > 9 then
                        SQL.Add('AND (((M.DailyProtPerc + M.DailyBfatPerc)/100) * M.DailyYield)  > ' + DYFrom + '')
                     else
                        SQL.Add('AND (((M.DailyProtPerc + M.DailyBfatPerc)/100) * M.DailyYield) Between ' + DYFrom + ' AND ' + DYTo + '');
                  end;
               SQL.Add('AND (M.LactNo < 2) ');
               SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
               Open;

               if NOT IsEmpty then
                  begin
                     Case i of
                        1 : begin
                               fMilkRep.lNoHfs1.Caption := FieldByName('AnimalCount').AsString;
                               Hfr1Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        2 : begin
                               fMilkRep.lNoHfs2.Caption := FieldByName('AnimalCount').AsString;
                               Hfr2Count := StrToInt(FieldByName('AnimalCount').AsString);
                             end;
                        3 : begin
                               fMilkRep.lNoHfs3.Caption := FieldByName('AnimalCount').AsString;
                               Hfr3Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        4 : begin
                               fMilkRep.lNoHfs4.Caption := FieldByName('AnimalCount').AsString;
                               Hfr4Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        5 : begin
                               fMilkRep.lNoHfs5.Caption := FieldByName('AnimalCount').AsString;
                               Hfr5Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        6 : begin
                               fMilkRep.lNoHfs6.Caption := FieldByName('AnimalCount').AsString;
                               Hfr6Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        7 : begin
                               fMilkRep.lNoHfs7.Caption := FieldByName('AnimalCount').AsString;
                               Hfr7Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        8 : begin
                               fMilkRep.lNoHfs8.Caption := FieldByName('AnimalCount').AsString;
                               Hfr8Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        9 : begin
                               fMilkRep.lNoHfs9.Caption := FieldByName('AnimalCount').AsString;
                               Hfr9Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                       10 : begin
                               fMilkRep.lNoHfs10.Caption := FieldByName('AnimalCount').AsString;
                               Hfr10Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                     end;
                  end;
            end;

         // Loop through and Get the Number of Heifers and Cows with DailyYields is between Variables DYFrom to DYTo
         // when it gets to 10 it calulates all animals with with daily yield over 45 kilograms.
         With MyQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT Count(M.AnimalID) AnimalCount ');
               SQL.Add('FROM TempMilkAna M ');
               SQL.Add('WHERE (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
               SQL.Add('AND (LactNo >= 2) ');
               if rgMeasure.ItemIndex = 0 then
                  begin
                     if i > 9 then
                        SQL.Add('AND M.DailyYield > ' + DYFrom + '')
                     else
                        SQL.Add('AND M.DailyYield Between ' + DYFrom + ' AND ' + DYTo + '');
                  end
               else if rgMeasure.ItemIndex = 1 then
                  begin
                     if i > 9 then
                        SQL.Add('AND M.DailyBfatPerc > ' + DYFrom + '')
                     else
                        SQL.Add('AND M.DailyBfatPerc Between ' + DYFrom + ' AND ' + DYTo + '');
                  end
               else if rgMeasure.ItemIndex = 2 then
                  begin
                     if i > 9 then
                        SQL.Add('AND M.DailyProtPerc > ' + DYFrom + '')
                     else
                        SQL.Add('AND M.DailyProtPerc Between ' + DYFrom + ' AND ' + DYTo + '');
                  end
               else if rgMeasure.ItemIndex = 3 then
                  begin
                     if i > 9 then
                        SQL.Add('AND (((M.DailyProtPerc + M.DailyBfatPerc)/100) * M.DailyYield)  > ' + DYFrom + '')
                     else
                        SQL.Add('AND (((M.DailyProtPerc + M.DailyBfatPerc)/100) * M.DailyYield) Between ' + DYFrom + ' AND ' + DYTo + '');
                  end;
               Open;

               if NOT IsEmpty then
                  begin
                     Case i of
                        1 : begin
                               fMilkRep.lNoCows1.Caption := FieldByName('AnimalCount').AsString;
                               Cow1Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        2 : begin
                               fMilkRep.lNoCows2.Caption := FieldByName('AnimalCount').AsString;
                               Cow2Count := StrToInt(FieldByName('AnimalCount').AsString);
                             end;
                        3 : begin
                               fMilkRep.lNoCows3.Caption := FieldByName('AnimalCount').AsString;
                               Cow3Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        4 : begin
                               fMilkRep.lNoCows4.Caption := FieldByName('AnimalCount').AsString;
                               Cow4Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        5 : begin
                               fMilkRep.lNoCows5.Caption := FieldByName('AnimalCount').AsString;
                               Cow5Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        6 : begin
                               fMilkRep.lNoCows6.Caption := FieldByName('AnimalCount').AsString;
                               Cow6Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        7 : begin
                               fMilkRep.lNoCows7.Caption := FieldByName('AnimalCount').AsString;
                               Cow7Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        8 : begin
                               fMilkRep.lNoCows8.Caption := FieldByName('AnimalCount').AsString;
                               Cow8Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                        9 : begin
                               fMilkRep.lNoCows9.Caption := FieldByName('AnimalCount').AsString;
                               Cow9Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                       10 : begin
                               fMilkRep.lNoCows10.Caption := FieldByName('AnimalCount').AsString;
                               Cow10Count := StrToInt(FieldByName('AnimalCount').AsString);
                            end;
                     end;
                   end;
            end;
         pbMilk.StepBy(2);
      end;
    DailyYieldPercHerd;
end;

procedure TfMilkRecSysScr.DailyYieldPercHerd;
   function AssignCaps(CowHeif : Integer; MilkAnimals : Integer) : String;
   var
      Perc : Double;
   begin
      try
         Perc := (((CowHeif) / (MilkAnimals)) * 100);
         RESULT := FloatToStrF(Perc,ffFixed,3,2);
      except
         RESULT := '0.00';
      end;
   end;
var
   HfrTotal,
   CowTotal : Integer;
   PercDryMilk : Double;
begin
   HfrTotal := (Hfr1Count+Hfr2Count+Hfr3Count+Hfr4Count+Hfr5Count+Hfr6Count+Hfr7Count+Hfr8Count+Hfr9Count+Hfr10Count+NoHfrDry);
   CowTotal := (Cow1Count+Cow2Count+Cow3Count+Cow4Count+Cow5Count+Cow6Count+Cow7Count+Cow8Count+Cow9Count+Cow10Count+NoCowDry);
   fMilkRep.lTotalHfrs.Caption := IntToStr(HfrTotal);
   fMilkRep.lTotalCows.Caption := IntToStr(CowTotal);

   HerdCount;

   fMilkRep.lPerc1.Caption  := AssignCaps(Hfr1Count+Cow1Count, MACount);
   fMilkRep.lPerc2.Caption  := AssignCaps(Hfr2Count+Cow2Count, MACount);
   fMilkRep.lPerc3.Caption  := AssignCaps(Hfr3Count+Cow3Count, MACount);
   fMilkRep.lPerc4.Caption  := AssignCaps(Hfr4Count+Cow4Count, MACount);
   fMilkRep.lPerc5.Caption  := AssignCaps(Hfr5Count+Cow5Count, MACount);
   fMilkRep.lPerc6.Caption  := AssignCaps(Hfr6Count+Cow6Count, MACount);
   fMilkRep.lPerc7.Caption  := AssignCaps(Hfr7Count+Cow7Count, MACount);
   fMilkRep.lPerc8.Caption  := AssignCaps(Hfr8Count+Cow8Count, MACount);
   fMilkRep.lPerc9.Caption  := AssignCaps(Hfr9Count+Cow9Count, MACount);
   fMilkRep.lPerc10.Caption := AssignCaps(Hfr10Count+Cow10Count, MACount);
   try
      PercDryMilk := ( ((NoHfrDry+NoCowDry) / (MACount)) * 100);
      fMilkRep.lPercHerdDry.Caption := FloatToStrF(PercDryMilk,ffFixed,3,2);
   except
    //
   end;
   fMilkRep.lTotalHerdPerc.Caption := '100.00';
   TotalMilkProd;
   pbMilk.position := 100;
end;

procedure TfMilkRecSysScr.MeasType;
begin
   UseSolids  := False;
   UseBFat    := False;
   UseProt    := False;
   UseGallons := False;
   UseKilos   := False;
   if rgMeasure2.ItemIndex = 1 then
      begin
         l1.Caption := '(Gls)';
         l2.Caption := '(Gls)';
         l3.Caption := '(Gls)';
         l4.Caption := '(Gls)';
         fMilkRep.l5.Caption := '(Gls)';
         fMilkRep.l6.Caption := '(Gls)';
         fMilkRep.l7.Caption := '(Gls)';
         fMilkRep.l8.Caption := '(Gls)';
         fMilkRep.l9.Caption := '(Gls)';
         fMilkRep.l10.Caption := '(Gls)';
         fMilkRep.l11.Caption := '(Gls)';
      end
   else
      begin
         l1.Caption := '(Kgs)';
         l2.Caption := '(Kgs)';
         l3.Caption := '(Kgs)';
         l4.Caption := '(Kgs)';
         fMilkRep.l5.Caption := '(Kgs)';
         fMilkRep.l6.Caption := '(Kgs)';
         fMilkRep.l7.Caption := '(Kgs)';
         fMilkRep.l8.Caption := '(Kgs)';
         fMilkRep.l9.Caption := '(Kgs)';
         fMilkRep.l10.Caption := '(Kgs)';
         fMilkRep.l11.Caption := '(Kgs)';
      end;
   if ((rgMeasure.ItemIndex = 0) and (rgMeasure2.ItemIndex = 1))  then
      begin
         fMilkRep.lMeas1.Caption  := '9.0 or more';
         fMilkRep.lMeas2.Caption  := '8.0 to 8.9';
         fMilkRep.lMeas3.Caption  := '7.0 to 7.9';
         fMilkRep.lMeas4.Caption  := '6.0 to 6.9';
         fMilkRep.lMeas5.Caption  := '5.0 to 5.9';
         fMilkRep.lMeas6.Caption  := '4.0 to 4.9';
         fMilkRep.lMeas7.Caption  := '3.0 to 3.9';
         fMilkRep.lMeas8.Caption  := '2.0 to 2.9';
         fMilkRep.lMeas9.Caption  := '1.0 to 1.9';
         fMilkRep.lMeas10.Caption := '0.1 to 0.9';
         UseGallons := True;
      end;
   if ((rgMeasure.ItemIndex = 0) and (rgMeasure2.ItemIndex = 0))  then
      begin
         fMilkRep.lMeas1.Caption  := '45 or more';
         fMilkRep.lMeas2.Caption  := '40 to 45';
         fMilkRep.lMeas3.Caption  := '35 to 40';
         fMilkRep.lMeas4.Caption  := '30 to 35';
         fMilkRep.lMeas5.Caption  := '25 to 30';
         fMilkRep.lMeas6.Caption  := '20 to 25';
         fMilkRep.lMeas7.Caption  := '15 to 20';
         fMilkRep.lMeas8.Caption  := '10 to 15';
         fMilkRep.lMeas9.Caption  := ' 5 to 10';
         fMilkRep.lMeas10.Caption := ' 0 to  5';
         UseKilos := True;
      end;
   if ((rgMeasure.ItemIndex = 1) or (rgMeasure.ItemIndex = 2))  then
      begin
         fMilkRep.lMeas1.Caption  := '4.0 or more';
         fMilkRep.lMeas2.Caption  := '3.8 to 4.0';
         fMilkRep.lMeas3.Caption  := '3.7 to 3.8';
         fMilkRep.lMeas4.Caption  := '3.6 to 3.7';
         fMilkRep.lMeas5.Caption  := '3.5 to 3.6';
         fMilkRep.lMeas6.Caption  := '3.4 to 3.5';
         fMilkRep.lMeas7.Caption  := '3.3 to 3.4';
         fMilkRep.lMeas8.Caption  := '3.2 to 3.3';
         fMilkRep.lMeas9.Caption  := '3.0 to 3.2';
         fMilkRep.lMeas10.Caption := '0 to 3';
         if (rgMeasure.ItemIndex = 1) then
            UseBFat := True;
         if (rgMeasure.ItemIndex = 2) then
            UseProt := True;
      end;
   if (rgMeasure.ItemIndex = 3) then
      begin
         fMilkRep.lMeas1.Caption  := '3.0 or more';
         fMilkRep.lMeas2.Caption  := '2.6 to 3.0';
         fMilkRep.lMeas3.Caption  := '2.4 to 2.6';
         fMilkRep.lMeas4.Caption  := '2.2 to 2.4';
         fMilkRep.lMeas5.Caption  := '2.0 to 2.2';
         fMilkRep.lMeas6.Caption  := '1.8 to 2.0';
         fMilkRep.lMeas7.Caption  := '1.6 to 1.8';
         fMilkRep.lMeas8.Caption  := '1.4 to 1.6';
         fMilkRep.lMeas9.Caption  := '1.0 to 1.4';
         fMilkRep.lMeas10.Caption := '0 to 1.0';
         UseSolids := True;
      end;
end;

procedure TfMilkRecSysScr.GroupsDblClick(Sender: TObject);
begin
    with Groups.DataSource do
       if DataSet.RecordCount > 0 then
          begin
             DataSet.Edit;
             DataSet.FieldByName('Selected').AsBoolean := NOT ( DataSet.FieldByName('Selected').AsBoolean );
             DataSet.Post;
          end;
end;

procedure TfMilkRecSysScr.CalvMonthAna;

   function AssignCaps(Yield : String; AnimalCount : String) : String;
   begin
      try
         RESULT := FloatToStrF((StrToFloat(Yield)) / (StrToFloat(AnimalCount)),ffFixed,8,2);
      except
         RESULT := '0.00';
      end;
   end;

   function DiffInYield(YieldTM : String; YieldLM : String) : String;
   var
      Divd : Double;
   begin
      try
         Divd    := 0;
         Divd    := ((StrToFloat(YieldTM)) - (StrToFloat(YieldLM)));
         RESULT  := FloatToStrF((Divd) / (StrToFloat(YieldLM)) * 100,ffFixed,8,2);
      except
         RESULT := '0.00';
      end;
   end;

var
   k,
   m,
   i,
   j,
   s : Integer;
   NonCalvedCows, NonCalvedHeifers : Integer;
begin
   s := 0;
   LookupEvents.Open;
   LookupEvents.Filter := '(EventType = ' + IntToStr(CCalvingEvent) + ')';
   LookupEvents.Filtered := True;
   for j := 0 to 1 do
      begin
         JanCows := 0;
         JanHfrs := 0;
         FebCows := 0;
         FebHfrs := 0;
         MarCows := 0;
         MarHfrs := 0;
         AprCows := 0;
         AprHfrs := 0;
         MayCows := 0;
         MayHfrs := 0;
         JunCows := 0;
         JunHfrs := 0;
         JulCows := 0;
         JulHfrs := 0;
         AugCows := 0;
         AugHfrs := 0;
         SepCows := 0;
         SepHfrs := 0;
         OctCows := 0;
         OctHfrs := 0;
         NovCows := 0;
         NovHfrs := 0;
         DecCows := 0;
         DecHfrs := 0;
         if j = 0 then
            CutOffDryDate := dThisMonth
         else
            CutOffDryDate := dLastMonth;

         // assign count of heifers and cows

         NonCalvedCows := 0; NonCalvedHeifers := 0;
         for i := 0 to 1 do
            begin
               With MyQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT AnimalID, LactNo');
                     SQL.Add('FROM TempMilkAna M');
                     SQL.Add('WHERE (M.AnimalID IN (SELECT E.AnimalID From Events E '); //, Events E2 ');
                     SQL.Add('                      WHERE ((E.EventType = ' + IntToStr(CCalvingEvent) + ') ');
                     //SQL.Add('                      AND    (NOT(E2.EventType = ' + IntToStr(CDryOffEvent) + '))');
                     SQL.Add('                      AND    (E.AnimalID=M.AnimalID) ');
                     SQL.Add('                      AND    (E.AnimalLactNo=M.LactNo) ');
                     SQL.Add('                      AND    (E.EventDate <= "' + FormatDateTime(cUSDateStyle,CutOffDryDate) + '")  ');
                     SQL.Add('      )              )                                                                            ) ');
                     SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,CutOffDryDate) + '")');
                     if i = 0 then
                        SQL.Add('AND (M.LactNo < 2) ')
                     else
                        SQL.Add('AND (M.LactNo >= 2) ');
                     Open;

                     MyQuery.First;
                     While NOT MyQuery.Eof do
                        begin
                          Application.ProcessMessages;
                          DecodeDate(CutOffDryDate, nYear, nMonth, nDay);
                          if LookupEvents.Locate('AnimalID;AnimalLactNo;EventType',VarArrayOf([MyQuery.FieldByName('AnimalID').AsInteger,MyQuery.FieldByName('LactNo').AsInteger,CCalvingEvent]),[] ) then
                             DecodeDate(LookupEvents.FieldByName('EventDate').AsDateTime, eYear, eMonth, eDay);
                          // Check if Calving is Within year of Last Milk Date.
                          if LookupEvents.FieldByName('EventDate').AsDateTime > IncMonth(CutOffDryDate, -12) then
                             begin
                                if i = 0 then
                                    // Get all the Calvings in each month of current year for "HEIFERS"
                                   case eMonth of
                                      1 : Inc(JanHfrs);
                                      2 : Inc(FebHfrs);
                                      3 : Inc(MarHfrs);
                                      4 : Inc(AprHfrs);
                                      5 : Inc(MayHfrs);
                                      6 : Inc(JunHfrs);
                                      7 : Inc(JulHfrs);
                                      8 : Inc(AugHfrs);
                                      9 : Inc(SepHfrs);
                                     10 : Inc(OctHfrs);
                                     11 : Inc(NovHfrs);
                                     12 : Inc(DecHfrs);
                                   end
                                else
                                   // Get all the Calvings in each month of current year for "COWS"
                                   case eMonth of
                                      1 : Inc(JanCows);
                                      2 : Inc(FebCows);
                                      3 : Inc(MarCows);
                                      4 : Inc(AprCows);
                                      5 : Inc(MayCows);
                                      6 : Inc(JunCows);
                                      7 : Inc(JulCows);
                                      8 : Inc(AugCows);
                                      9 : Inc(SepCows);
                                     10 : Inc(OctCows);
                                     11 : Inc(NovCows);
                                     12 : Inc(DecCows);
                                   end;
                             end
                          else
                             begin

                                if j = 0 then
                                   begin
                                      if i = 0 then
                                         begin
                                            inc(NonCalvedHeifers);
                                            fMilkRep.lTMCowsNotCalved.Caption := IntToStr(NonCalvedHeifers);
                                         end
                                      else
                                         begin
                                            inc(NonCalvedCows);
                                            fMilkRep.lTMHrfsNotCalved.Caption := IntToStr(NonCalvedCows);
                                         end;
                                   end
                                else
                                   begin
                                      if i = 0 then
                                         begin
                                            inc(NonCalvedHeifers);
                                            fMilkRep.lLMCowsNotCalved.Caption := IntToStr(NonCalvedHeifers);
                                         end
                                      else
                                         begin
                                            inc(NonCalvedCows);
                                            fMilkRep.lLMHrfsNotCalved.Caption := IntToStr(NonCalvedCows);
                                         end;
                                   end;
                             end;
                             Next;
                        end;
                      Inc(s);
                      pbMilk.Position := S;
                  end;
               LookupEvents.Filter := '';
               LookupEvents.Filtered := False;
            end;

         if j = 0 then
            begin
               fMilkRep.lCowsTM1.Caption  := IntToStr(JanCows);
               fMilkRep.lHfsTM1.Caption   := IntToStr(JanHfrs);
               fMilkRep.lCowsTM2.Caption  := IntToStr(FebCows);
               fMilkRep.lHfsTM2.Caption   := IntToStr(FebHfrs);
               fMilkRep.lCowsTM3.Caption  := IntToStr(MarCows);
               fMilkRep.lHfsTM3.Caption   := IntToStr(MarHfrs);
               fMilkRep.lCowsTM4.Caption  := IntToStr(AprCows);
               fMilkRep.lHfsTM4.Caption   := IntToStr(AprHfrs);
               fMilkRep.lCowsTM5.Caption  := IntToStr(MayCows);
               fMilkRep.lHfsTM5.Caption   := IntToStr(MayHfrs);
               fMilkRep.lCowsTM6.Caption  := IntToStr(JunCows);
               fMilkRep.lHfsTM6.Caption   := IntToStr(JunHfrs);
               fMilkRep.lCowsTM7.Caption  := IntToStr(JulCows);
               fMilkRep.lHfsTM7.Caption   := IntToStr(JulHfrs);
               fMilkRep.lCowsTM8.Caption  := IntToStr(AugCows);
               fMilkRep.lHfsTM8.Caption   := IntToStr(AugHfrs);
               fMilkRep.lCowsTM9.Caption  := IntToStr(SepCows);
               fMilkRep.lHfsTM9.Caption   := IntToStr(SepHfrs);
               fMilkRep.lCowsTM10.Caption := IntToStr(OctCows);
               fMilkRep.lHfsTM10.Caption  := IntToStr(OctHfrs);
               fMilkRep.lCowsTM11.Caption := IntToStr(NovCows);
               fMilkRep.lHfsTM11.Caption  := IntToStr(NovHfrs);
               fMilkRep.lCowsTM12.Caption := IntToStr(DecCows);
               fMilkRep.lHfsTM12.Caption  := IntToStr(DecHfrs);
               fMilkRep.TotalCowsTM.Caption  := IntToStr(JanCows+FebCows+MarCows+AprCows+MayCows+JunCows+JulCows+AugCows+SepCows+OctCows+NovCows+DecCows + NonCalvedCows);
               fMilkRep.TotalHrfrsTM.Caption := IntToStr(JanHfrs+FebHfrs+MarHfrs+AprHfrs+MayHfrs+JunHfrs+JulHfrs+AugHfrs+SepHfrs+OctHfrs+NovHfrs+DecHfrs + NonCalvedHeifers);
               MonthlyPercs('ThisMonth');
            end
         else
            begin
               fMilkRep.lCowsLM1.Caption  := IntToStr(JanCows);
               fMilkRep.lHfsLM1.Caption   := IntToStr(JanHfrs);
               fMilkRep.lCowsLM2.Caption  := IntToStr(FebCows);
               fMilkRep.lHfsLM2.Caption   := IntToStr(FebHfrs);
               fMilkRep.lCowsLM3.Caption  := IntToStr(MarCows);
               fMilkRep.lHfsLM3.Caption   := IntToStr(MarHfrs);
               fMilkRep.lCowsLM4.Caption  := IntToStr(AprCows);
               fMilkRep.lHfsLM4.Caption   := IntToStr(AprHfrs);
               fMilkRep.lCowsLM5.Caption  := IntToStr(MayCows);
               fMilkRep.lHfsLM5.Caption   := IntToStr(MayHfrs);
               fMilkRep.lCowsLM6.Caption  := IntToStr(JunCows);
               fMilkRep.lHfsLM6.Caption   := IntToStr(JunHfrs);
               fMilkRep.lCowsLM7.Caption  := IntToStr(JulCows);
               fMilkRep.lHfsLM7.Caption   := IntToStr(JulHfrs);
               fMilkRep.lCowsLM8.Caption  := IntToStr(AugCows);
               fMilkRep.lHfsLM8.Caption   := IntToStr(AugHfrs);
               fMilkRep.lCowsLM9.Caption  := IntToStr(SepCows);
               fMilkRep.lHfsLM9.Caption   := IntToStr(SepHfrs);
               fMilkRep.lCowsLM10.Caption := IntToStr(OctCows);
               fMilkRep.lHfsLM10.Caption  := IntToStr(OctHfrs);
               fMilkRep.lCowsLM11.Caption := IntToStr(NovCows);
               fMilkRep.lHfsLM11.Caption  := IntToStr(NovHfrs);
               fMilkRep.lCowsLM12.Caption := IntToStr(DecCows);
               fMilkRep.lHfsLM12.Caption  := IntToStr(DecHfrs);
               fMilkRep.TotalCowsLM.Caption := IntToStr(JanCows+FebCows+MarCows+AprCows+MayCows+JunCows+JulCows+AugCows+SepCows+OctCows+NovCows+DecCows + NonCalvedCows);
               fMilkRep.TotalHrfrsLM.Caption := IntToStr(JanHfrs+FebHfrs+MarHfrs+AprHfrs+MayHfrs+JunHfrs+JulHfrs+AugHfrs+SepHfrs+OctHfrs+NovHfrs+DecHfrs + NonCalvedHeifers);
               MonthlyPercs('LastMonth');
            end;

          Inc(s);
          pbMilk.Position := S;
          for m := 1 to 12 do
            begin
               with MyQuery do
                  begin
                     SQL.Clear;
                     case rgMeasure.ItemIndex of
                        0 : SQL.Add('SELECT Count(M.AnimalID) AnimalCount, Sum(DailyYield) TotalDYield');
                        1 : SQL.Add('SELECT Count(M.AnimalID) AnimalCount, Sum(DailyBFatPerc) TotalDYield');
                        2 : SQL.Add('SELECT Count(M.AnimalID) AnimalCount, Sum(DailyProtPerc) TotalDYield');
                        3 : SQL.Add('SELECT Count(M.AnimalID) AnimalCount, Sum(((DailyBFatPerc + DailyProtPerc)/100)* DailyYield) TotalDYield');
                     end;
                     SQL.Add('FROM TempMilkAna M');
                     SQL.Add('WHERE (M.AnimalID IN (Select E.AnimalID From Events E '); //, Events E2 ');
                     SQL.Add('                         Where (                                 ');
                     SQL.Add('                                (E.EventType = ' + IntToStr(CCalvingEvent) + ') ');
//                     SQL.Add('                         AND    (NOT(E2.EventType = ' + IntToStr(CDryOffEvent) + '))');
                     SQL.Add('                         AND    (E.AnimalID=M.AnimalID) ');
                     SQL.Add('                         AND    (E.AnimalLactNo=M.LactNo) ');
                     SQL.Add('                         AND    (E.EventDate <= "' + FormatDateTime(cUSDateStyle,CutOffDryDate) + '") ');
                     case m of  // m = month
                        1 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CJanFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CJanTo) + '") ')
                            end;
                        2 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CFebFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CFebTo) + '") ')
                            end;
                        3 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CMarFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CMarTo) + '")  ')
                            end;
                        4 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CAprFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CAprTo) + '")  ')
                            end;
                        5 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CMayFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CMayTo) + '")  ')
                            end;
                        6 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CJunFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CJunTo) + '")  ')
                            end;
                        7 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CJulFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CJulTo) + '")  ')
                            end;
                        8 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CAugFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CAugTo) + '")  ')
                            end;
                        9 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CSepFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CSepTo) + '")  ')
                            end;
                       10 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,COctFrom) + '" AND "' + FormatDateTime(cUSDateStyle,COctTo) + '")  ')
                            end;
                       11 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CNovFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CNovTo) + '")  ')
                            end;
                       12 : begin
                               GetDaysInMonth(m);
                               SQL.Add('                      AND    (E.EventDate Between "' + FormatDateTime(cUSDateStyle,CDecFrom) + '" AND "' + FormatDateTime(cUSDateStyle,CDecTo) + '")  ');
                            end;
                     end;
                     SQL.Add('                                                                                                     )))');
                     if j = 0 then
                        SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")')
                     else
                        SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dLastMonth) + '")');
                     Open;

                     MyQuery.First;
                     While Not MyQuery.Eof do
                        if j = 0 then
                           begin
                              case m of
                                 1 : fMilkRep.lDYieldTM1.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 2 : fMilkRep.lDYieldTM2.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 3 : fMilkRep.lDYieldTM3.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 4 : fMilkRep.lDYieldTM4.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 5 : fMilkRep.lDYieldTM5.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 6 : fMilkRep.lDYieldTM6.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 7 : fMilkRep.lDYieldTM7.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 8 : fMilkRep.lDYieldTM8.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 9 : fMilkRep.lDYieldTM9.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                10 : fMilkRep.lDYieldTM10.Caption := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                11 : fMilkRep.lDYieldTM11.Caption := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                12 : fMilkRep.lDYieldTM12.Caption := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                              end;
                              Next;
                           end
                        else
                           begin
                              case m of
                                 1 : fMilkRep.lDYieldLM1.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 2 : fMilkRep.lDYieldLM2.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 3 : fMilkRep.lDYieldLM3.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 4 : fMilkRep.lDYieldLM4.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 5 : fMilkRep.lDYieldLM5.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 6 : fMilkRep.lDYieldLM6.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 7 : fMilkRep.lDYieldLM7.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 8 : fMilkRep.lDYieldLM8.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                 9 : fMilkRep.lDYieldLM9.Caption  := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                10 : fMilkRep.lDYieldLM10.Caption := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                11 : fMilkRep.lDYieldLM11.Caption := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                                12 : fMilkRep.lDYieldLM12.Caption := AssignCaps(MyQuery.FieldByName('TotalDYield').AsString,  MyQuery.FieldByName('AnimalCount').AsString);
                              end;
                              Next;
                           end;
                  end;
               Inc(s);
               pbMilk.Position := S;
            end;
      end;

    fMilkRep.lChange1.Caption  := DiffInYield(fMilkRep.lDYieldTM1.Caption, fMilkRep.lDYieldLM1.Caption);
    fMilkRep.lChange2.Caption  := DiffInYield(fMilkRep.lDYieldTM2.Caption, fMilkRep.lDYieldLM2.Caption);
    fMilkRep.lChange3.Caption  := DiffInYield(fMilkRep.lDYieldTM3.Caption, fMilkRep.lDYieldLM3.Caption);
    fMilkRep.lChange4.Caption  := DiffInYield(fMilkRep.lDYieldTM4.Caption, fMilkRep.lDYieldLM4.Caption);
    fMilkRep.lChange5.Caption  := DiffInYield(fMilkRep.lDYieldTM5.Caption, fMilkRep.lDYieldLM5.Caption);
    fMilkRep.lChange6.Caption  := DiffInYield(fMilkRep.lDYieldTM6.Caption, fMilkRep.lDYieldLM6.Caption);
    fMilkRep.lChange7.Caption  := DiffInYield(fMilkRep.lDYieldTM7.Caption, fMilkRep.lDYieldLM7.Caption);
    fMilkRep.lChange8.Caption  := DiffInYield(fMilkRep.lDYieldTM8.Caption, fMilkRep.lDYieldLM8.Caption);
    fMilkRep.lChange9.Caption  := DiffInYield(fMilkRep.lDYieldTM9.Caption, fMilkRep.lDYieldLM9.Caption);
    fMilkRep.lChange10.Caption := DiffInYield(fMilkRep.lDYieldTM10.Caption, fMilkRep.lDYieldLM10.Caption);
    fMilkRep.lChange11.Caption := DiffInYield(fMilkRep.lDYieldTM11.Caption, fMilkRep.lDYieldLM11.Caption);
    fMilkRep.lChange12.Caption := DiffInYield(fMilkRep.lDYieldTM12.Caption, fMilkRep.lDYieldLM12.Caption);

    pbMilk.StepIt;
    Inc(s);
    pbMilk.Position := S;
    LookupEvents.Close;
end;

procedure TfMilkRecSysScr.MonthlyPercs(Month : String);

   function AssignCaps(CowsHeifs : Integer; HC : Integer) : String;
   begin
      try
         RESULT := FloatToStr((CowsHeifs/HC)*100);
      except
         RESULT := '0.00';
      end;
   end;

var
   HerdCount : Integer;
begin
   with qHerdCount do
      begin
         // Get number of milking animals in Herd, use as base figure for percentage comparision
         SQL.Clear;
         SQL.Add('SELECT Count(M.AnimalID) AnimalCount ');
         SQL.Add('FROM TempMilkAna M                   ');
               SQL.Add('WHERE (M.AnimalID > 0)');
         if Month = 'ThisMonth' then
            SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")')
         else
            SQL.Add('AND (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dLastMonth) + '")');
         Open;

         if NOT IsEmpty then
            HerdCount := StrToInt(FieldByName('AnimalCount').AsString);
      end;

   if Month = 'ThisMonth' then
      begin
         fMilkRep.lPercHerdTM1.Caption  := AssignCaps(JanCows+JanHfrs, HerdCount);
         fMilkRep.lPercHerdTM2.Caption  := AssignCaps(FebCows+FebHfrs, HerdCount);
         fMilkRep.lPercHerdTM3.Caption  := AssignCaps(MarCows+MarHfrs, HerdCount);
         fMilkRep.lPercHerdTM4.Caption  := AssignCaps(AprCows+AprHfrs, HerdCount);
         fMilkRep.lPercHerdTM5.Caption  := AssignCaps(MayCows+MayHfrs, HerdCount);
         fMilkRep.lPercHerdTM6.Caption  := AssignCaps(JunCows+JunHfrs, HerdCount);
         fMilkRep.lPercHerdTM7.Caption  := AssignCaps(JulCows+JulHfrs, HerdCount);
         fMilkRep.lPercHerdTM8.Caption  := AssignCaps(AugCows+AugHfrs, HerdCount);
         fMilkRep.lPercHerdTM9.Caption  := AssignCaps(SepCows+SepHfrs, HerdCount);
         fMilkRep.lPercHerdTM10.Caption := AssignCaps(OctCows+OctHfrs, HerdCount);
         fMilkRep.lPercHerdTM11.Caption := AssignCaps(NovCows+NovHfrs, HerdCount);
         fMilkRep.lPercHerdTM12.Caption := AssignCaps(DecCows+DecHfrs, HerdCount);
      end
   else
      begin
         fMilkRep.lPercHerdLM1.Caption  := AssignCaps(JanCows+JanHfrs, HerdCount);
         fMilkRep.lPercHerdLM2.Caption  := AssignCaps(FebCows+FebHfrs, HerdCount);
         fMilkRep.lPercHerdLM3.Caption  := AssignCaps(MarCows+MarHfrs, HerdCount);
         fMilkRep.lPercHerdLM4.Caption  := AssignCaps(AprCows+AprHfrs, HerdCount);
         fMilkRep.lPercHerdLM5.Caption  := AssignCaps(MayCows+MayHfrs, HerdCount);
         fMilkRep.lPercHerdLM6.Caption  := AssignCaps(JunCows+JunHfrs, HerdCount);
         fMilkRep.lPercHerdLM7.Caption  := AssignCaps(JulCows+JulHfrs, HerdCount);
         fMilkRep.lPercHerdLM8.Caption  := AssignCaps(AugCows+AugHfrs, HerdCount);
         fMilkRep.lPercHerdLM9.Caption  := AssignCaps(SepCows+SepHfrs, HerdCount);
         fMilkRep.lPercHerdLM10.Caption := AssignCaps(OctCows+OctHfrs, HerdCount);
         fMilkRep.lPercHerdLM11.Caption := AssignCaps(NovCows+NovHfrs, HerdCount);
         fMilkRep.lPercHerdLM12.Caption := AssignCaps(DecCows+DecHfrs, HerdCount);
      end
end;

procedure TfMilkRecSysScr.GetDaysInMonth(Month : Integer);
var
   iYear,
   iMonth,
   iDay : Word;
   Year1,
   Year2,
   Year3,
   Year4,
   Year5,
   Year6,
   Year7,
   Year8,
   Year9,
   Year10,
   Year11,
   Year12 : Integer;

   procedure GetYear(Month : Integer);
   begin
      Case Month of
         01 : begin
                 Year1  := iYear;
                 Year2  := iYear-1;
                 Year3  := iYear-1;
                 Year4  := iYear-1;
                 Year5  := iYear-1;
                 Year6  := iYear-1;
                 Year7  := iYear-1;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         02 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear-1;
                 Year4  := iYear-1;
                 Year5  := iYear-1;
                 Year6  := iYear-1;
                 Year7  := iYear-1;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         03 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear-1;
                 Year5  := iYear-1;
                 Year6  := iYear-1;
                 Year7  := iYear-1;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         04 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear-1;
                 Year6  := iYear-1;
                 Year7  := iYear-1;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         05 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear-1;
                 Year7  := iYear-1;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         06 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear-1;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         07 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear;
                 Year8  := iYear-1;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         08 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear;
                 Year8  := iYear;
                 Year9  := iYear-1;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         09 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear;
                 Year8  := iYear;
                 Year9  := iYear;
                 Year10 := iYear-1;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         10 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear;
                 Year8  := iYear;
                 Year9  := iYear;
                 Year10 := iYear;
                 Year11 := iYear-1;
                 Year12 := iYear-1;
              end;
         11 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear;
                 Year8  := iYear;
                 Year9  := iYear;
                 Year10 := iYear;
                 Year11 := iYear;
                 Year12 := iYear-1;
              end;
         12 : begin
                 Year1  := iYear;
                 Year2  := iYear;
                 Year3  := iYear;
                 Year4  := iYear;
                 Year5  := iYear;
                 Year6  := iYear;
                 Year7  := iYear;
                 Year8  := iYear;
                 Year9  := iYear;
                 Year10 := iYear;
                 Year11 := iYear;
                 Year12 := iYear;
              end;
      end;
   end;

begin

   decodeDate(dThisMonth, iYear, iMonth, iDay);


   GetYear(iMonth);
   case Month of
      1 : begin
             CJanFrom := StrToDate('01/01/'+IntToStr(Year1));
             CJanTo   := StrToDate('31/01/'+IntToStr(Year1));
          end;
      2 : if IsLeapYear(nYear) then
             begin
                CFebFrom := StrToDate('01/02/'+IntToStr(Year2));
                CFebTo   := StrToDate('29/02/'+IntToStr(Year2));
             end
          else
             begin
                CFebFrom := StrToDate('01/02/'+IntToStr(Year2));
                CFebTo   := StrToDate('28/02/'+IntToStr(Year2));
             end;
      3 : begin
             CMarFrom := StrToDate('01/03/'+IntToStr(Year3));
             CMarTo   := StrToDate('31/03/'+IntToStr(Year3));
          end;
      4 : begin
             CAprFrom := StrToDate('01/04/'+IntToStr(Year4));
             CAprTo   := StrToDate('30/04/'+IntToStr(Year4));
          end;
      5 : begin
             CMayFrom := StrToDate('01/05/'+IntToStr(Year5));
             CMayTo   := StrToDate('31/05/'+IntToStr(Year5));
          end;
      6 : begin
             CJunFrom := StrToDate('01/06/'+IntToStr(Year6));
             CJunTo   := StrToDate('30/06/'+IntToStr(Year6));
          end;
      7 : begin
             CJulFrom := StrToDate('01/07/'+IntToStr(Year7));
             CJulTo   := StrToDate('31/07/'+IntToStr(Year7));
          end;
      8 : begin
             CAugFrom := StrToDate('01/08/'+IntToStr(Year8));
             CAugTo   := StrToDate('31/08/'+IntToStr(Year8));
          end;
      9 : begin
             CSepFrom := StrToDate('01/09/'+IntToStr(Year9));
             CSepTo   := StrToDate('30/09/'+IntToStr(Year9));
          end;
      10 : begin
              COctFrom := StrToDate('01/10/'+IntToStr(Year10));
              COctTo   := StrToDate('31/10/'+IntToStr(Year10));
           end;
      11 : begin
              CNovFrom := StrToDate('01/11/'+IntToStr(Year11));
              CNovTo   := StrToDate('30/11/'+IntToStr(Year11));
           end;
      12 : begin
              CDecFrom := StrToDate('01/12/'+IntToStr(Year12));
              CDecTo   := StrToDate('31/12/'+IntToStr(Year12));
           end;
   end;
end;

procedure TfMilkRecSysScr.TotalMilkProd;
Var
   Days,  // InMilk & EventDays
   Count,
   TotalEDays : Integer;
begin
   Days := 0;
   Count      := 0;
   TotalEDays := 0;
   Divider    := 0;

   with qHerdCount do
      begin
         SQL.Clear;
         SQL.Add('SELECT Count(AnimalID) AnimalCount, Sum(CumYield) TotalYield, Sum(DaysInMilk) DaysInMilk');
         SQL.Add('FROM TempMilkAna M ');
         SQL.Add('WHERE (DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
         Open;

         if NOT IsEmpty then
            begin
               // Total Yield Produced

               fMilkRep.lTMP.Caption := FloatToStrF(qHerdCount.FieldByName('TotalYield').AsFloat,ffNumber, 8,0);
               // Average DaysInMilk
               if qHerdCount.FieldByName('DaysInMilk').AsString <> '' then
                  Days := StrToInt(qHerdCount.FieldByName('DaysInMilk').AsString);
               if qHerdCount.FieldByName('AnimalCount').AsString <> '' then
                  Count      := StrToInt(qHerdCount.FieldByName('AnimalCount').AsString);
               if (Days > 0) and (Count > 0) then
                  begin
                     Divider    := (Days / Count);
                     fMilkRep.lADM.Caption := FloatToStrF(Divider,ffFixed,8,2);
                  end;
            end;
      end;

   with qHerdCount do
      begin
         SQL.Clear;
         SQL.Add('SELECT Avg(E.EventDate) AvgCalvDate ');
         SQL.Add('FROM Events E, TempMilkAna M        ');
         SQL.Add('WHERE (M.AnimalID=E.AnimalID)       ');
         SQL.Add('AND  (E.EventType = ' + IntToStr(CCalvingEvent) + ')');
         SQL.Add('AND  (E.AnimalLactNo=M.LactNo)       ');
         SQL.Add('AND  (M.DateOfRecording = "' + FormatDateTime(cUSDateStyle,dThisMonth) + '")');
         Open;
         if NOT IsEmpty then
            fMilkRep.lMCD.Caption := DateToStr(FieldByName('AvgCalvDate').AsDateTime);
      end;
end;

procedure TfMilkRecSysScr.rgTypeClick(Sender: TObject);
begin
   if rgtype.ItemIndex = 0 then
      begin
         ClearGroups;
         Groups.Enabled := False;
      end
   else
      Groups.Enabled := True;
   if WinData.dsGroups.DataSet.Active = True then
      WinData.dsGroups.DataSet.Refresh;
end;

procedure TfMilkRecSysScr.FormDestroy(Sender: TObject);
begin
   ClearGroups;
   if TempTable.Exists then
      begin
         TempTable.Close;
         TempTable.DeleteTable;
         TempTable.Free;
      end;
   if TLact.Exists then
      begin
         TLact.Close;
         TLact.DeleteTable;
         TLact.Free;
      end;
   if MyTable.Exists then
      begin
         MyTable.Close;
         MyTable.DeleteTable;
         MyTable.Free;
      end;
end;

procedure TfMilkRecSysScr.FormCreate(Sender: TObject);
begin
   if WinData.dsGroups.DataSet.State in dsEditModes then
      WinData.dsGroups.DataSet.Cancel;

   qrMilkRep1.Hide;
   HerdCombo.LookupSource:= WinData.dsHerdDefaults;
   Groups.DataSource:= WinData.dsGroups;
   TempTables;
end;

procedure TfMilkRecSysScr.ClearGroups;
begin
   try
      with qGroups do
         begin
            SQL.Clear;
            SQL.Add('Update Grps SET Selected=False');
            ExecSQL;
         end;
   except
      //
   end;
end;

procedure TfMilkRecSysScr.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if (seNumLact.Value = 3) then
      begin
         lLact3.Caption := '3 or >';
         // Hide Fourth lactation details
         lLact4.Visible := False;
         llCowsHfrs4.Visible := False;
         lAYPDTM4.Visible := False;
         lAYPDLM4.Visible := False;
         lMeanDiff4.Visible := False;
         lMeanToDate4.Visible := False;
         lAvgDYield4.Visible := False;

         lLact5.Visible := False;
         llCowsHfrs5.Visible := False;
         lAYPDTM5.Visible := False;
         lAYPDLM5.Visible := False;
         lMeanDiff5.Visible := False;
         lMeanToDate5.Visible := False;
         lAvgDYield5.Visible := False;

         lLact6.Visible := False;
         llCowsHfrs6.Visible := False;
         lAYPDTM6.Visible := False;
         lAYPDLM6.Visible := False;
         lMeanDiff6.Visible := False;
         lMeanToDate6.Visible := False;
         lAvgDYield6.Visible := False;

         lLact7.Visible := False;
         llCowsHfrs7.Visible := False;
         lAYPDTM7.Visible := False;
         lAYPDLM7.Visible := False;
         lMeanDiff7.Visible := False;
         lMeanToDate7.Visible := False;
         lAvgDYield7.Visible := False;

         lLact8.Visible := False;
         llCowsHfrs8.Visible := False;
         lAYPDTM8.Visible := False;
         lAYPDLM8.Visible := False;
         lMeanDiff8.Visible := False;
         lMeanToDate8.Visible := False;
         lAvgDYield8.Visible := False;

         lLact9.Visible := False;
         llCowsHfrs9.Visible := False;
         lAYPDTM9.Visible := False;
         lAYPDLM9.Visible := False;
         lMeanDiff9.Visible := False;
         lMeanToDate9.Visible := False;
         lAvgDYield9.Visible := False;

         lLact10.Visible := False;
         llCowsHfrs10.Visible := False;
         lAYPDTM10.Visible := False;
         lAYPDLM10.Visible := False;
         lMeanDiff10.Visible := False;
         lMeanToDate10.Visible := False;
         lAvgDYield10.Visible := False;
      end
   else if seNumLact.Value = 4 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4 or >';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := FALSE;
         llCowsHfrs5.Enabled := FALSE;
         lAYPDTM5.Enabled := FALSE;
         lAYPDLM5.Enabled := FALSE;
         lMeanDiff5.Enabled := FALSE;
         lMeanToDate5.Enabled := FALSE;
         lAvgDYield5.Enabled := FALSE;

         lLact6.Enabled := FALSE;
         llCowsHfrs6.Enabled := FALSE;
         lAYPDTM6.Enabled := FALSE;
         lAYPDLM6.Enabled := FALSE;
         lMeanDiff6.Enabled := FALSE;
         lMeanToDate6.Enabled := FALSE;
         lAvgDYield6.Enabled := FALSE;

         lLact7.Enabled := FALSE;
         llCowsHfrs7.Enabled := FALSE;
         lAYPDTM7.Enabled := FALSE;
         lAYPDLM7.Enabled := FALSE;
         lMeanDiff7.Enabled := FALSE;
         lMeanToDate7.Enabled := FALSE;
         lAvgDYield7.Enabled := FALSE;

         lLact8.Enabled := FALSE;
         llCowsHfrs8.Enabled := FALSE;
         lAYPDTM8.Enabled := FALSE;
         lAYPDLM8.Enabled := FALSE;
         lMeanDiff8.Enabled := FALSE;
         lMeanToDate8.Enabled := FALSE;
         lAvgDYield8.Enabled := FALSE;

         lLact9.Enabled := FALSE;
         llCowsHfrs9.Enabled := FALSE;
         lAYPDTM9.Enabled := FALSE;
         lAYPDLM9.Enabled := FALSE;
         lMeanDiff9.Enabled := FALSE;
         lMeanToDate9.Enabled := FALSE;
         lAvgDYield9.Enabled := FALSE;

         lLact10.Enabled := FALSE;
         llCowsHfrs10.Enabled := FALSE;
         lAYPDTM10.Enabled := FALSE;
         lAYPDLM10.Enabled := FALSE;
         lMeanDiff10.Enabled := FALSE;
         lMeanToDate10.Enabled := FALSE;
         lAvgDYield10.Enabled := FALSE;
      end
   else if seNumLact.Value = 5 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4';
         lLact5.Caption := '5 or >';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := TRUE;
         llCowsHfrs5.Enabled := TRUE;
         lAYPDTM5.Enabled := TRUE;
         lAYPDLM5.Enabled := TRUE;
         lMeanDiff5.Enabled := TRUE;
         lMeanToDate5.Enabled := TRUE;
         lAvgDYield5.Enabled := TRUE;

         lLact6.Enabled := FALSE;
         llCowsHfrs6.Enabled := FALSE;
         lAYPDTM6.Enabled := FALSE;
         lAYPDLM6.Enabled := FALSE;
         lMeanDiff6.Enabled := FALSE;
         lMeanToDate6.Enabled := FALSE;
         lAvgDYield6.Enabled := FALSE;

         lLact7.Enabled := FALSE;
         llCowsHfrs7.Enabled := FALSE;
         lAYPDTM7.Enabled := FALSE;
         lAYPDLM7.Enabled := FALSE;
         lMeanDiff7.Enabled := FALSE;
         lMeanToDate7.Enabled := FALSE;
         lAvgDYield7.Enabled := FALSE;

         lLact8.Enabled := FALSE;
         llCowsHfrs8.Enabled := FALSE;
         lAYPDTM8.Enabled := FALSE;
         lAYPDLM8.Enabled := FALSE;
         lMeanDiff8.Enabled := FALSE;
         lMeanToDate8.Enabled := FALSE;
         lAvgDYield8.Enabled := FALSE;

         lLact9.Enabled := FALSE;
         llCowsHfrs9.Enabled := FALSE;
         lAYPDTM9.Enabled := FALSE;
         lAYPDLM9.Enabled := FALSE;
         lMeanDiff9.Enabled := FALSE;
         lMeanToDate9.Enabled := FALSE;
         lAvgDYield9.Enabled := FALSE;

         lLact10.Enabled := FALSE;
         llCowsHfrs10.Enabled := FALSE;
         lAYPDTM10.Enabled := FALSE;
         lAYPDLM10.Enabled := FALSE;
         lMeanDiff10.Enabled := FALSE;
         lMeanToDate10.Enabled := FALSE;
         lAvgDYield10.Enabled := FALSE;
      end
   else if seNumLact.Value = 6 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4';
         lLact5.Caption := '5';
         lLact6.Caption := '6 or >';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := TRUE;
         llCowsHfrs5.Enabled := TRUE;
         lAYPDTM5.Enabled := TRUE;
         lAYPDLM5.Enabled := TRUE;
         lMeanDiff5.Enabled := TRUE;
         lMeanToDate5.Enabled := TRUE;
         lAvgDYield5.Enabled := TRUE;

         lLact6.Enabled := TRUE;
         llCowsHfrs6.Enabled := TRUE;
         lAYPDTM6.Enabled := TRUE;
         lAYPDLM6.Enabled := TRUE;
         lMeanDiff6.Enabled := TRUE;
         lMeanToDate6.Enabled := TRUE;
         lAvgDYield6.Enabled := TRUE;

         lLact7.Enabled := FALSE;
         llCowsHfrs7.Enabled := FALSE;
         lAYPDTM7.Enabled := FALSE;
         lAYPDLM7.Enabled := FALSE;
         lMeanDiff7.Enabled := FALSE;
         lMeanToDate7.Enabled := FALSE;
         lAvgDYield7.Enabled := FALSE;

         lLact8.Enabled := FALSE;
         llCowsHfrs8.Enabled := FALSE;
         lAYPDTM8.Enabled := FALSE;
         lAYPDLM8.Enabled := FALSE;
         lMeanDiff8.Enabled := FALSE;
         lMeanToDate8.Enabled := FALSE;
         lAvgDYield8.Enabled := FALSE;

         lLact9.Enabled := FALSE;
         llCowsHfrs9.Enabled := FALSE;
         lAYPDTM9.Enabled := FALSE;
         lAYPDLM9.Enabled := FALSE;
         lMeanDiff9.Enabled := FALSE;
         lMeanToDate9.Enabled := FALSE;
         lAvgDYield9.Enabled := FALSE;

         lLact10.Enabled := FALSE;
         llCowsHfrs10.Enabled := FALSE;
         lAYPDTM10.Enabled := FALSE;
         lAYPDLM10.Enabled := FALSE;
         lMeanDiff10.Enabled := FALSE;
         lMeanToDate10.Enabled := FALSE;
         lAvgDYield10.Enabled := FALSE;
      end
   else if seNumLact.Value = 7 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4';
         lLact5.Caption := '5';
         lLact6.Caption := '6';
         lLact7.Caption := '7 or >';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := TRUE;
         llCowsHfrs5.Enabled := TRUE;
         lAYPDTM5.Enabled := TRUE;
         lAYPDLM5.Enabled := TRUE;
         lMeanDiff5.Enabled := TRUE;
         lMeanToDate5.Enabled := TRUE;
         lAvgDYield5.Enabled := TRUE;

         lLact6.Enabled := TRUE;
         llCowsHfrs6.Enabled := TRUE;
         lAYPDTM6.Enabled := TRUE;
         lAYPDLM6.Enabled := TRUE;
         lMeanDiff6.Enabled := TRUE;
         lMeanToDate6.Enabled := TRUE;
         lAvgDYield6.Enabled := TRUE;

         lLact7.Enabled := TRUE;
         llCowsHfrs7.Enabled := TRUE;
         lAYPDTM7.Enabled := TRUE;
         lAYPDLM7.Enabled := TRUE;
         lMeanDiff7.Enabled := TRUE;
         lMeanToDate7.Enabled := TRUE;
         lAvgDYield7.Enabled := TRUE;

         lLact8.Enabled := FALSE;
         llCowsHfrs8.Enabled := FALSE;
         lAYPDTM8.Enabled := FALSE;
         lAYPDLM8.Enabled := FALSE;
         lMeanDiff8.Enabled := FALSE;
         lMeanToDate8.Enabled := FALSE;
         lAvgDYield8.Enabled := FALSE;

         lLact9.Enabled := FALSE;
         llCowsHfrs9.Enabled := FALSE;
         lAYPDTM9.Enabled := FALSE;
         lAYPDLM9.Enabled := FALSE;
         lMeanDiff9.Enabled := FALSE;
         lMeanToDate9.Enabled := FALSE;
         lAvgDYield9.Enabled := FALSE;

         lLact10.Enabled := FALSE;
         llCowsHfrs10.Enabled := FALSE;
         lAYPDTM10.Enabled := FALSE;
         lAYPDLM10.Enabled := FALSE;
         lMeanDiff10.Enabled := FALSE;
         lMeanToDate10.Enabled := FALSE;
         lAvgDYield10.Enabled := FALSE;
      end
   else if seNumLact.Value = 8 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4';
         lLact5.Caption := '5';
         lLact6.Caption := '6';
         lLact7.Caption := '7';
         lLact8.Caption := '8 or >';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := TRUE;
         llCowsHfrs5.Enabled := TRUE;
         lAYPDTM5.Enabled := TRUE;
         lAYPDLM5.Enabled := TRUE;
         lMeanDiff5.Enabled := TRUE;
         lMeanToDate5.Enabled := TRUE;
         lAvgDYield5.Enabled := TRUE;

         lLact6.Enabled := TRUE;
         llCowsHfrs6.Enabled := TRUE;
         lAYPDTM6.Enabled := TRUE;
         lAYPDLM6.Enabled := TRUE;
         lMeanDiff6.Enabled := TRUE;
         lMeanToDate6.Enabled := TRUE;
         lAvgDYield6.Enabled := TRUE;

         lLact7.Enabled := TRUE;
         llCowsHfrs7.Enabled := TRUE;
         lAYPDTM7.Enabled := TRUE;
         lAYPDLM7.Enabled := TRUE;
         lMeanDiff7.Enabled := TRUE;
         lMeanToDate7.Enabled := TRUE;
         lAvgDYield7.Enabled := TRUE;

         lLact8.Enabled := TRUE;
         llCowsHfrs8.Enabled := TRUE;
         lAYPDTM8.Enabled := TRUE;
         lAYPDLM8.Enabled := TRUE;
         lMeanDiff8.Enabled := TRUE;
         lMeanToDate8.Enabled := TRUE;
         lAvgDYield8.Enabled := TRUE;

         lLact9.Enabled := FALSE;
         llCowsHfrs9.Enabled := FALSE;
         lAYPDTM9.Enabled := FALSE;
         lAYPDLM9.Enabled := FALSE;
         lMeanDiff9.Enabled := FALSE;
         lMeanToDate9.Enabled := FALSE;
         lAvgDYield9.Enabled := FALSE;

         lLact10.Enabled := FALSE;
         llCowsHfrs10.Enabled := FALSE;
         lAYPDTM10.Enabled := FALSE;
         lAYPDLM10.Enabled := FALSE;
         lMeanDiff10.Enabled := FALSE;
         lMeanToDate10.Enabled := FALSE;
         lAvgDYield10.Enabled := FALSE;
      end
   else if seNumLact.Value = 9 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4';
         lLact5.Caption := '5';
         lLact6.Caption := '6';
         lLact7.Caption := '7';
         lLact8.Caption := '8';
         lLact9.Caption := '9 or >';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := TRUE;
         llCowsHfrs5.Enabled := TRUE;
         lAYPDTM5.Enabled := TRUE;
         lAYPDLM5.Enabled := TRUE;
         lMeanDiff5.Enabled := TRUE;
         lMeanToDate5.Enabled := TRUE;
         lAvgDYield5.Enabled := TRUE;

         lLact6.Enabled := TRUE;
         llCowsHfrs6.Enabled := TRUE;
         lAYPDTM6.Enabled := TRUE;
         lAYPDLM6.Enabled := TRUE;
         lMeanDiff6.Enabled := TRUE;
         lMeanToDate6.Enabled := TRUE;
         lAvgDYield6.Enabled := TRUE;

         lLact7.Enabled := TRUE;
         llCowsHfrs7.Enabled := TRUE;
         lAYPDTM7.Enabled := TRUE;
         lAYPDLM7.Enabled := TRUE;
         lMeanDiff7.Enabled := TRUE;
         lMeanToDate7.Enabled := TRUE;
         lAvgDYield7.Enabled := TRUE;

         lLact8.Enabled := TRUE;
         llCowsHfrs8.Enabled := TRUE;
         lAYPDTM8.Enabled := TRUE;
         lAYPDLM8.Enabled := TRUE;
         lMeanDiff8.Enabled := TRUE;
         lMeanToDate8.Enabled := TRUE;
         lAvgDYield8.Enabled := TRUE;

         lLact9.Enabled := TRUE;
         llCowsHfrs9.Enabled := TRUE;
         lAYPDTM9.Enabled := TRUE;
         lAYPDLM9.Enabled := TRUE;
         lMeanDiff9.Enabled := TRUE;
         lMeanToDate9.Enabled := TRUE;
         lAvgDYield9.Enabled := TRUE;

         lLact10.Enabled := FALSE;
         llCowsHfrs10.Enabled := FALSE;
         lAYPDTM10.Enabled := FALSE;
         lAYPDLM10.Enabled := FALSE;
         lMeanDiff10.Enabled := FALSE;
         lMeanToDate10.Enabled := FALSE;
         lAvgDYield10.Enabled := FALSE;
      end
   else if seNumLact.Value = 10 then
      begin
         lLact3.Caption := '3';
         lLact4.Caption := '4';
         lLact5.Caption := '5';
         lLact6.Caption := '6';
         lLact7.Caption := '7';
         lLact8.Caption := '8';
         lLact9.Caption := '9';

         lLact4.Enabled := TRUE;
         llCowsHfrs4.Enabled := TRUE;
         lAYPDTM4.Enabled := TRUE;
         lAYPDLM4.Enabled := TRUE;
         lMeanDiff4.Enabled := TRUE;
         lMeanToDate4.Enabled := TRUE;
         lAvgDYield4.Enabled := TRUE;

         lLact5.Enabled := TRUE;
         llCowsHfrs5.Enabled := TRUE;
         lAYPDTM5.Enabled := TRUE;
         lAYPDLM5.Enabled := TRUE;
         lMeanDiff5.Enabled := TRUE;
         lMeanToDate5.Enabled := TRUE;
         lAvgDYield5.Enabled := TRUE;

         lLact6.Enabled := TRUE;
         llCowsHfrs6.Enabled := TRUE;
         lAYPDTM6.Enabled := TRUE;
         lAYPDLM6.Enabled := TRUE;
         lMeanDiff6.Enabled := TRUE;
         lMeanToDate6.Enabled := TRUE;
         lAvgDYield6.Enabled := TRUE;

         lLact7.Enabled := TRUE;
         llCowsHfrs7.Enabled := TRUE;
         lAYPDTM7.Enabled := TRUE;
         lAYPDLM7.Enabled := TRUE;
         lMeanDiff7.Enabled := TRUE;
         lMeanToDate7.Enabled := TRUE;
         lAvgDYield7.Enabled := TRUE;

         lLact8.Enabled := TRUE;
         llCowsHfrs8.Enabled := TRUE;
         lAYPDTM8.Enabled := TRUE;
         lAYPDLM8.Enabled := TRUE;
         lMeanDiff8.Enabled := TRUE;
         lMeanToDate8.Enabled := TRUE;
         lAvgDYield8.Enabled := TRUE;

         lLact9.Enabled := TRUE;
         llCowsHfrs9.Enabled := TRUE;
         lAYPDTM9.Enabled := TRUE;
         lAYPDLM9.Enabled := TRUE;
         lMeanDiff9.Enabled := TRUE;
         lMeanToDate9.Enabled := TRUE;
         lAvgDYield9.Enabled := TRUE;

         lLact10.Enabled := TRUE;
         llCowsHfrs10.Enabled := TRUE;
         lAYPDTM10.Enabled := TRUE;
         lAYPDLM10.Enabled := TRUE;
         lMeanDiff10.Enabled := TRUE;
         lMeanToDate10.Enabled := TRUE;
         lAvgDYield10.Enabled := TRUE;
      end;
end;

procedure TfMilkRecSysScr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   WinData.dsGroups.DataSet.Filter:='';
   WinData.dsGroups.DataSet.Filtered:= False;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfMilkRecSysScr.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cMonthSumAnalysisRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cMonthSumAnalysisRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
