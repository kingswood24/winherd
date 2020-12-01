unit uLivestockSum;

{
   12/06/2000      KVB Added a new IF statement in BuildREPS to only check the First Calving Date if LactNum = 1. Problem
                   arose when LactNum > 1 and no calving history existed. Incorrectly classifying Dairy/Suckler Cows
                   as Cattle2PlusYrs.
   ______________________________________________________________________________

   08/03/2003 - Shane Pilkington
   Total revamp of Livestock inventory for developement KHM V3.6 R5.5.
   ______________________________________________________________________________

   16/02/09 [Dev 3.9 6.1] /SP Bug Fix - Livestock Inventory Report - Purchases events with the same date as opening stock date
                                        where not being included in the Brought Forward Column.

   20/04/09 [V3.9 R6.7] /MK Bug Fix - change made to bring animals into the Heifer category that has
                                      a calving date on the first date of the Inventory.
                                      Change from "WHERE (e5.EventDate <= "' + FormatDateTime" to "WHERE (e5.EventDate < "' + FormatDateTime".
   ______________________________________________________________________________

   18/11/09 [V4.0 R0.4] /MK Additional Feature - Radio Group to select whether Commercial or Pedigree Values to be brought from
                                                 Livestock Values. The Radio Group will also select whether the animals on the
                                                 report are Pedigree or Commercial.

   01/06/10 [V4.0 R3.6] /MK Bug Fix - cbYearREPS was NOT defaulting to this year on FormShow.

   21/01/2011 [V4.0 R7.4] - SP - Livestock Valuation Boundaries

   02/04/2011 [V4.0 R9.1] - MK - If No First Or Second Calving Date And LactNo > 1 Then Animal Is Cow Else Heifer.

   02/04/2011 [V4.0 R9.1] - MK - Check For Cows That Have Second Lactation And No First Calving, If Exists Show Check Calving Consistency Screen.

   04/04/2011 [V4.0 R9.2] - MK - Program was including purchases in birth calculations.

   ______________________________________________________________________________

   *** NOTE ***
   Dry Cows were removed from this report as, to an Accountant, there is very little
   difference in the value of a Dry Cow and the value of a Milking Cow.
   Cull Cows, however, would have a greater difference in value than a Milking Cow.
   ______________________________________________________________________________

   02/12/11 [V5.0 R2.4] /MK Change - New Item For rgEnterpriseType For All. On SQL If Commercial Only Show Non-Pedigree Animals.

   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   27/11/12 [V5.1 R3.2] /MK Change - Removed date validation on date change to stop errors from appearing. Moved date validation to sbViewOnClick.

   07/05/13 [V5.1 R7.1] /MK Bug Fix - rtLSInventory - Only run lactation check for animals that are in herd.

   16/09/13 [V5.2 R1.3] /MK Additional Feature - Added AFromBordBia boolean to ShowTheForm to tell if unit is opened from Bord Bia screen.
                                               - If AFromBordBia then default to Deaths only and last 12 months for date.

   01/04/14 [V5.2 R9.3] /MK Additional Feature - Change the tile of the repor to Annual Livestock Movements if Bord Bia.

   17/08/15 [V5.4 R7.4] /MK Change - pREPS - Removed word "REPS" from Label1 as REPS is no longer used.

   03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.

   08/08/18 [V5.8 R2.2] /MK Change - If ReportType is rtLSInventory and not from BordBia menu then change Caption to Annual Livestock Inventory - GL request.

   29/01/20 [V5.9 R2.1] /MK Change - GetAnimals - GetEligibleAnimalType - If the HerdType is beef then the cull cows should be cows not breeding
                                                                          for Dairy/Suckler herds it should be cows with a culling date - Tom O'Keeffe
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, ExtCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin, Mask,
  ToolEdit, Qrctrls, quickrpt, Db, DBTables, CurrEdit, TeEngine, Series,
  TeeProcs, Chart, DBChart, DBCtrls, DateUtil, DairyData,cxProgressBar,
  cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup,
  GenTypesConst, cxCheckBox, uApplicationLog, uHerdLookup;

type
  TReportType = (rtREPS, rtLSInventory, Extens, RepsStkInventSilent);

  TCalfRecord = class
    DamNo : String[10];
    DamID : Integer;
    DOB  : TDateTime;
    constructor Create(ADamID : Integer; ADOB : TDateTime);
  end;

  TAgeOfAnimal = (UpTo6Mths, Over6MthsUpTo12Mths, Over12MthsUpTo18Mths, Over18MthsUpTo24Mths, Over24Mths );
  TLivestockColumnType = (ctBroughtForward, ctCarriedForward, ctBirths, ctDeaths, ctSales, ctPurchases);
  TfLivestockSum = class(TForm)
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
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    pREPS: TPanel;
    pProjection: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    cbMonthREPS: TComboBox;
    cbYearREPS: TComboBox;
    Label3: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    eLUEF0to6mths: TEdit;
    eLUEF6to12mths: TEdit;
    eLUEF1to2yrs: TEdit;
    eLUEF2plusyrs: TEdit;
    qLivestockSum: TQuery;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    eLUEFCattle0to6mths: TEdit;
    eLUEFCattle6to12mths: TEdit;
    eLUEFCattle1to2yrs: TEdit;
    eLUEFCattle2plusYrs: TEdit;
    eProjDate: TEdit;
    Label35: TLabel;
    eLUEFCows2plusYrs: TEdit;
    tLUDate: TTable;
    qProjChart: TQuery;
    dsLivestockSum: TDataSource;
    qSeries1: TQuery;
    Label37: TLabel;
    ceForageHectares: TCurrencyEdit;
    Label38: TLabel;
    ComboLUDensity: TComboBox;
    qGeneral: TQuery;
    Label40: TLabel;
    Label41: TLabel;
    eLUEFDairyCows: TEdit;
    eLUEFSucklerCows: TEdit;
    tExtDefaults: TTable;
    dsExtDefaults: TDataSource;
    pStockCtrl: TPanel;
    pDateRange: TPanel;
    SwitchLabel: TLabel;
    lTo: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    Label5: TLabel;
    qExtra: TQuery;
    pExtensification: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lProgBar: TLabel;
    lPleaseWait: TLabel;
    lDate6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    deExtRep1: TDateEdit;
    deExtRep3: TDateEdit;
    deExtRep5: TDateEdit;
    deExtRep2: TDateEdit;
    deExtRep4: TDateEdit;
    ceNumEwes: TCurrencyEdit;
    pbExten: TProgressBar;
    deExtRep6: TDateEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit3: TComboBox;
    Edit4: TComboBox;
    Edit6: TComboBox;
    Edit1: TComboBox;
    Edit2: TComboBox;
    Edit5: TComboBox;
    Label22: TLabel;
    pProgress: TPanel;
    Label23: TLabel;
    pbStockCtrl: TProgressBar;
    ToolButton4: TToolButton;
    sbLiveStkProj: TRxSpeedButton;
    Label24: TLabel;
    GenQuery: TQuery;
    btnCancel: TButton;
    ceForageArea: TCurrencyEdit;
    ProgressBar1: TProgressBar;
    btnLivestockInventValues: TcxButton;
    cbUseFilter: TCheckBox;
    rgEnterpriseType: TcxRadioGroup;
    cbFavourite: TcxCheckBox;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eLUEFCattle0to6mthsChange(Sender: TObject);
    procedure eLUEFCattle6to12mthsChange(Sender: TObject);
    procedure eLUEFCattle1to2yrsChange(Sender: TObject);
    procedure eLUEFCattle2plusYrsChange(Sender: TObject);
    procedure eLUEFCows2plusYrsChange(Sender: TObject);
    procedure eLUEF0to6mthsChange(Sender: TObject);
    procedure eLUEF6to12mthsChange(Sender: TObject);
    procedure eLUEF1to2yrsChange(Sender: TObject);
    procedure eLUEF2plusyrsChange(Sender: TObject);
    procedure eLUEFDairyCowsChange(Sender: TObject);
    procedure eLUEFSucklerCowsChange(Sender: TObject);
    procedure ceForageHectaresChange(Sender: TObject);
    procedure ceForageArea2Change(Sender: TObject);
    procedure ComboHerdChange(Sender: TObject);
    procedure deExtRep1Change(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure deExtRep1Exit(Sender: TObject);
    procedure deExtRep2Exit(Sender: TObject);
    procedure deExtRep3Exit(Sender: TObject);
    procedure deExtRep4Exit(Sender: TObject);
    procedure deExtRep5Exit(Sender: TObject);
    procedure deExtRep6Exit(Sender: TObject);
    procedure ceNumEwesEnter(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure sbLiveStkProjClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ceForageAreaExit(Sender: TObject);
    procedure ceNumEwesExit(Sender: TObject);
    procedure ceForageAreaEnter(Sender: TObject);
    procedure GenQueryAfterOpen(DataSet: TDataSet);
    procedure GenQueryBeforeOpen(DataSet: TDataSet);
    procedure Edit7DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLivestockInventValuesClick(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    LULimit,
    MinLU,
    MaxLU,
    Date4LU,
    Date5LU,
    Date6LU,
    AvLU,
    SD4,
    SD5,
    SD6 : Double;
    tLivestockSum : TTable;
    tLivestockCategoryByStockDate : TTable;
//    NumAnimals : Integer;
    NoDetails  : Integer;
    NumDays : Integer;
    LastDate   : TDateTime;
    Gain,
    LastWeight : Double;
    ExtCount0to6mths : Integer;
    ExtCount6to12mths : Integer;
    ExtCount1to2yrs : Integer;
    ExtCount2plusYrs : Integer;
    ExtMthTot : Integer;
    NumDates : Integer;
    ExtMthLUTot : Double;
    Coeff1,
    Coeff2,
    Coeff3,
    Coeff4,
    Coeff5,
    Coeff6,
    LUsBS1,
    LUsBS2,
    LUsBS3,
    LUsBS4,
    LUsBS5,
    LUsBS6,
    ExtTotalAdjust,
    ExtAdjustLUs,
    ExtTotalForecastBovineLUs : Double;
    FirstDate : Boolean;
    Month_6, Month_12, Month_18, Month_24 : TDateTime;
    FromCows, ToCows, FromCulledAnimals, ToCulledAnimals,
    BirthsInMilk, BirthsDry, BirthsBullBeef06Mth, BirthsBullBeef612Mth, BirthsBullBeef12PlusMth, BirthsBullBreed,
    BirthsHeifer6, BirthsHeifer12, BirthsHeifer18, BirthsHeifer24, BirthsHeifer24Plus, BirthsSteer6, BirthsSteer12,
    BirthsSteer18, BirthsSteer24, BirthsSteer24Plus, DeathsInMilk, DeathsDry, DeathsBullBeef06Mth, DeathsBullBeef612Mth,
    DeathsBullBeef12PlusMth, DeathsBullBreed, DeathsHeifer6, DeathsHeifer12, DeathsHeifer18, DeathsHeifer24, DeathsHeifer24Plus,
    DeathsSteer6, DeathsSteer12, DeathsSteer18, DeathsSteer24, DeathsSteer24Plus, BoughtInMilk, BoughtDry, BoughtBullBeef06Mth,
    BoughtBullBeef612Mth, BoughtBullBeef12PlusMth, BoughtBullBreed, BoughtHeifer6, BoughtHeifer12, BoughtHeifer18, BoughtHeifer24,
    BoughtHeifer24Plus, BoughtSteer6, BoughtSteer12, BoughtSteer18, BoughtSteer24, BoughtSteer24Plus, SoldInMilk, SoldDry,
    SoldBullBeef06Mth, SoldBullBeef612Mth, SoldBullBeef12PlusMth, SoldBullBreed, SoldHeifer6, SoldHeifer12, SoldHeifer18,
    SoldHeifer24, SoldHeifer24Plus, SoldSteer6, SoldSteer12, SoldSteer18, SoldSteer24, SoldSteer24Plus: Integer;
    nFromBullBeef06Mth, nFromBullBeef612Mth, nFromBullBeef12PlusMth, nFromBullBreed, nFromHeifer6, nFromHeifer12,
    nFromHeifer18, nFromHeifer24, nFromHeifer24Plus, nToHeifer6, nToHeifer12, nToHeifer18, nToHeifer24, nToHeifer24Plus,
    nFromSteer6, nFromSteer12, nFromSteer18, nFromSteer24, nFromSteer24Plus, nToSteer6, nToSteer12, nToSteer18, nToSteer24,
    nToSteer24Plus, nToBullBreed, nToBullBeef06Mth, nToBullBeef612Mth, nToBullBeef12PlusMth : Integer;
    StockDate,
    DFromDate,
    DToDate: TDate;
    TimesOpened : Integer;
    fProgressBar : TcxProgressBar;
    FWhichRepType : TReportType;
    FHerdType : THerdType;
    DebugMode : Boolean;
//    FCowsWithIncompleteLactations : TTable;
    procedure GetAnimals(AStockDate : TDateTime; ALivestockColumnType : TLivestockColumnType);
    procedure DeleteTableContents(TableName : String);
    procedure NetTransfers;
    procedure Total;
    procedure BuildREPS;
    procedure BuildProj;
    Function GetMth(MthName : String) : String;
    Function GetEndOfMth(Mth, Yr : Integer) : Integer;
    Function GetEndOfMthDate(Mth, Yr : Integer) : TDate;
    Procedure RepHeaderYears(Mth, Yr : Integer);
    procedure CreatetLivestockSum;
    procedure CreatetLUDate;
    Function ProjFactorsTest : Integer;
    procedure ExtQuery (ExtDate : TDateTime);
    procedure StockCtrlRep(Sender: TObject);
    function AgeCalc(BirthDate: TDateTime; AgeLimit: Integer): String;
    function CalcDay(Day, Month, Year: String): String;
    procedure IniStkInvCaptions(BFClear, BirthsClear, SalesDeathClear,
                                BoughtClear, NetTransfersClear, CFClear, TotalsClear : Boolean);
    procedure ClearCaptions;
    procedure InitializeLIVars;
    procedure PopulateTempLIAnimals;
    procedure RunSilentLI(Sender: TObject);
//    function GetLabelValue(Labels : array of TQRLabel) : Integer;
    function CaptionToInt(QRLabel : TQRLabel) : Integer;
    function GetAgeOfAnimal(ADateOfBirth, ACompareTo : TDateTime) : TAgeOfAnimal;

    procedure AddToLivestockCategoryByStockDate(AStockDate : TDateTime; Category : string; ADataset : TDataset);

  public
    FFromBordBia : Boolean;
    RepType : TReportType;
//     StockDate : TDateTime;
    { Public declarations }
  end;

var
  fLivestockSum: TfLivestockSum;
//  TempMilk,
//  TempDry,
//  FromInMilk,
//  FromDry,
//  ToInMilk,
//  ToDry,
  TempAnimals : TTable;
  DebugTable : TTable;
  WhichReg : TCountry;

procedure ShowTheForm(WhichRepType : TReportType; ProgBar : TcxProgressBar;
   const ACaption : String = ''; const AFromBordBia : Boolean = False);

implementation

uses uLiveStockInvent, uLiveStockUnitProj, LiveStkClass, uAccsReps, uREPs,
     KRoutines, LivestockInventory, uLiveStockValues, KDBRoutines,
     ChkDebug, uLactationConsistencyChecker;
    { Public declarations }

{$R *.DFM}

procedure ShowTheForm(WhichRepType : TReportType; ProgBar : TcxProgressBar;
   const ACaption : String = ''; const AFromBordBia : Boolean = False);
var
   Sender : TObject;
begin
   try
      try
         if (fLivestockSum = nil) then
            Application.CreateForm(TfLivestockSum, fLivestockSum);

         with fLivestockSum do
            begin
               FFromBordBia := AFromBordBia;
               fProgressBar := ProgBar;
               RepType := WhichRepType;
               FWhichRepType := WhichRepType;
               FHerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
               case FWhichRepType of
                  rtREPS  : begin
                             Caption := ACaption;
                             pREPS.Show;
                             ComboHerd.DisplayEmpty := 'Select Herd';
                             ShowModal;
                          end;
                  rtLSInventory :
                          begin
                             ToDate.Date := Date;
                             if ( AFromBordBia ) then
                                begin
                                   FromDate.Date := IncYear(Date,-1);
                                   Caption := 'Annual Livestock Movements';
                                   Label5.Caption := 'Produce Annual Livestock Movement Report between dates below';
                                end
                             else
                                begin
                                   FromDate.Date := EnCodeDate(CurrentYear, 1, 1);
                                   Caption := 'Annual Livestock Inventory';
                                   Label5.Caption := 'Produce Annual Livestock Valuation Report between dates below';
                                end;
                             pStockCtrl.Show;
                             ComboHerd.DisplayEmpty := 'Select Herd';
                             if ( WinData.FBordBiaBlockPrint ) then
                                begin
                                   ComboHerd.Value := IntToStr(WinData.DefaultHerdID);
                                   sbPrint.Click
                                end
                             else
                                ShowModal;
                          end;
                  RepsStkInventSilent : RunSilentLI(Sender);
               end;

            end;
      except
         ShowMessage('Cannot create form - close program and re-boot');
      end;
   finally
      FreeAndNil(fLivestockSum);
   end;
end;

procedure TfLivestockSum.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

function TfLivestockSum.GetMth(MthName : String) : String;
begin
   if MthName = 'January' then
      Result := '01'
   else if MthName = 'February' then
      Result := '02'
   else if MthName = 'March' then
      Result := '03'
   else if MthName = 'April' then
      Result := '04'
   else if MthName = 'May' then
      Result := '05'
   else if MthName = 'June' then
      Result := '06'
   else if MthName = 'July' then
      Result := '07'
   else if MthName = 'August' then
      Result := '08'
   else if MthName = 'September' then
      Result := '09'
   else if MthName = 'October' then
      Result := '10'
   else if MthName = 'November' then
      Result := '11'
   else if MthName = 'December' then
      Result := '12';
end;

function TfLivestockSum.GetEndOfMth(Mth, Yr: Integer): Integer;
begin
   case Mth of
      1: Result := 31;
      2: begin
            if ((Yr mod 4) = 0) then
               Result := 29
            else
               Result := 28;
         end;
      3: Result := 31;
      4: Result := 30;
      5: Result := 31;
      6: Result := 30;
      7: Result := 31;
      8: Result := 31;
      9: Result := 30;
      10:Result := 31;
      11:Result := 30;
      12:Result := 31;
   end;
end;

function TfLivestockSum.GetEndOfMthDate(Mth, Yr: Integer): TDate;
begin
   case Mth of
      0: Result := StrToDateTime('31/12/' + IntToStr(Yr));
      1: Result := StrToDateTime('31/01/' + IntToStr(Yr));
      2: begin
            if ((Yr mod 4) = 0) then
               Result := StrToDateTime('29/02/' + IntToStr(Yr))
             else
               Result := StrToDateTime('28/02/' + IntToStr(Yr));
         end;
      3: Result := StrToDateTime('31/03/' + IntToStr(Yr));
      4: Result := StrToDateTime('30/04/' + IntToStr(Yr));
      5: Result := StrToDateTime('31/05/' + IntToStr(Yr));
      6: Result := StrToDateTime('30/06/' + IntToStr(Yr));
      7: Result := StrToDateTime('31/07/' + IntToStr(Yr));
      8: Result := StrToDateTime('31/08/' + IntToStr(Yr));
      9: Result := StrToDateTime('30/09/' + IntToStr(Yr));
      10:Result := StrToDateTime('31/10/' + IntToStr(Yr));
      11:Result := StrToDateTime('30/11/' + IntToStr(Yr));
      12:Result := StrToDateTime('31/12/' + IntToStr(Yr));
   end;
end;

procedure TfLivestockSum.RepHeaderYears(Mth, Yr: Integer);
begin
   with fmREPs do
      begin
         // First initialise all the values
         JanYr1.Caption := cbYearREPS.Text;  //This value is always this year
         FebYr1.Caption := '';
         MarYr1.Caption := '';
         AprYr1.Caption := '';
         MayYr1.Caption := '';
         JunYr1.Caption := '';
         JulYr1.Caption := '';
         AugYr1.Caption := '';
         SepYr1.Caption := '';
         OctYr1.Caption := '';
         NovYr1.Caption := '';
         DecYr1.Caption := '';
         JanYr2.Caption := '';
         FebYr2.Caption := '';
         MarYr2.Caption := '';
         AprYr2.Caption := '';
         MayYr2.Caption := '';
         JunYr2.Caption := '';
         JulYr2.Caption := '';
         AugYr2.Caption := '';
         SepYr2.Caption := '';
         OctYr2.Caption := '';
         NovYr2.Caption := '';
         DecYr2.Caption := '';

         //Now to fill in correct values
         Case Mth of
              1 : Begin   //End Date of January
                       FebYr2.Caption := IntToStr(Yr - 1);
                       MarYr2.Caption := IntToStr(Yr - 1);
                       AprYr2.Caption := IntToStr(Yr - 1);
                       MayYr2.Caption := IntToStr(Yr - 1);
                       JunYr2.Caption := IntToStr(Yr - 1);
                       JulYr2.Caption := IntToStr(Yr - 1);
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              2 : Begin   //End Date of February
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr2.Caption := IntToStr(Yr - 1);
                       AprYr2.Caption := IntToStr(Yr - 1);
                       MayYr2.Caption := IntToStr(Yr - 1);
                       JunYr2.Caption := IntToStr(Yr - 1);
                       JulYr2.Caption := IntToStr(Yr - 1);
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              3 : Begin   //End Date of March
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr2.Caption := IntToStr(Yr - 1);
                       MayYr2.Caption := IntToStr(Yr - 1);
                       JunYr2.Caption := IntToStr(Yr - 1);
                       JulYr2.Caption := IntToStr(Yr - 1);
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              4 : Begin   //End Date of April
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr2.Caption := IntToStr(Yr - 1);
                       JunYr2.Caption := IntToStr(Yr - 1);
                       JulYr2.Caption := IntToStr(Yr - 1);
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              5 : Begin   //End Date of May
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr2.Caption := IntToStr(Yr - 1);
                       JulYr2.Caption := IntToStr(Yr - 1);
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              6 : Begin   //End Date of June
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr2.Caption := IntToStr(Yr - 1);
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              7 : Begin   //End Date of July
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr1.Caption := cbYearREPS.Text;
                       AugYr2.Caption := IntToStr(Yr - 1);
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              8 : Begin   //End Date of August
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr1.Caption := cbYearREPS.Text;
                       AugYr1.Caption := cbYearREPS.Text;
                       SepYr2.Caption := IntToStr(Yr - 1);
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              9 : Begin   //End Date of September
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr1.Caption := cbYearREPS.Text;
                       AugYr1.Caption := cbYearREPS.Text;
                       SepYr1.Caption := cbYearREPS.Text;
                       OctYr2.Caption := IntToStr(Yr - 1);
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              10 : Begin   //End Date of October
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr1.Caption := cbYearREPS.Text;
                       AugYr1.Caption := cbYearREPS.Text;
                       SepYr1.Caption := cbYearREPS.Text;
                       OctYr1.Caption := cbYearREPS.Text;
                       NovYr2.Caption := IntToStr(Yr - 1);
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              11 : Begin   //End Date of November
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr1.Caption := cbYearREPS.Text;
                       AugYr1.Caption := cbYearREPS.Text;
                       SepYr1.Caption := cbYearREPS.Text;
                       OctYr1.Caption := cbYearREPS.Text;
                       NovYr1.Caption := cbYearREPS.Text;
                       DecYr2.Caption := IntToStr(Yr - 1);
                  End;
              12 : Begin   //End Date of December
                       FebYr1.Caption := cbYearREPS.Text;
                       MarYr1.Caption := cbYearREPS.Text;
                       AprYr1.Caption := cbYearREPS.Text;
                       MayYr1.Caption := cbYearREPS.Text;
                       JunYr1.Caption := cbYearREPS.Text;
                       JulYr1.Caption := cbYearREPS.Text;
                       AugYr1.Caption := cbYearREPS.Text;
                       SepYr1.Caption := cbYearREPS.Text;
                       OctYr1.Caption := cbYearREPS.Text;
                       NovYr1.Caption := cbYearREPS.Text;
                       DecYr1.Caption := cbYearREPS.Text;
                  End;
         End;
      end;
end;

procedure TfLivestockSum.BuildREPS;
Var
   InputDate : TDate;
   FirstDate : TDate;
   CalcDate : TDate;
   CalcDay,
   CalcMonth,
   CalcYear : String;
   TwoYear,
   OneYear,
   SixMonth : TDateTime;
   i : Integer;
   MthNum : Integer;
   YrNum : Integer;
   Count0to6mths : Integer;
   Count6to12mths : Integer;
   Count1to2yrs : Integer;
   Count2plusYrs : Integer;
   CountDairyCows : Integer;       //KVB
   CountSucklerCows : Integer;     //KVB
   Tot0to6mths : Integer;
   Tot6to12mths : Integer;
   Tot1to2yrs : Integer;
   Tot2plusYrs : Integer;
   TotDairyCows : Integer;    //KVB
   TotSucklerCows : Integer;  //KVB
   MthTot : Integer;
   YearTot : Integer;
   MthLUTot : Extended;
   YearLUTot : Extended;
begin
   progressbar1.Position := 0;
   progressbar1.Show;
   with fmREPs do
      Try
         //First get date represented by input year and month

         if Assigned(tLivestockCategoryByStockDate) then SQLEmptyTable(tLivestockCategoryByStockDate.TableName);

         MthNum := StrToInt(GetMth(cbMonthREPS.Text));
         YrNum := StrToInt(cbYearREPS.Text);
         InputDate := GetEndOfMthDate(MthNum, YrNum);
         //Now to fill in Herd ID and Report End Date
         If WinData.OwnerFile.Locate('ID',ComboHerd.Value,[]) then
            HerdID.Caption := WinData.OwnerFile.FieldByName('HerdIdentity').AsString;
         RepEndDate.Caption := DateToStr(InputDate);
         //Now to enter the Year next to the Months in the Report Header
         RepHeaderYears(MthNum, YrNum);
         VerLabel.Caption := 'Herd Management ' + HerdVerNo;
         //Now get the Date of the first month in the REPS Report
         If MthNum = 12 then     //No change in Year number
            FirstDate := GetEndOfMthDate(((StrToInt(GetMth(cbMonthREPS.Text))+12-11) mod 12), StrToInt(cbYearREPS.Text))
         Else         //Change year number
            FirstDate := GetEndOfMthDate(((StrToInt(GetMth(cbMonthREPS.Text))+12-11) mod 12), (StrToInt(cbYearREPS.Text) - 1));
         //Now clear out table
         WinData.tIntHerd.Open;

         qLivestockSum.SQL.Clear;
         qLivestockSum.SQL.Add('DELETE FROM tLivestockSum');
         qLivestockSum.ExecSQL;
         Application.processmessages;

         //Now to create a table of all possible animals
         //First select animals whose Date Of Birth is before last date in REPS report
         qLivestockSum.SQL.Clear;
         qLivestockSum.SQL.Add('INSERT INTO tLivestockSum (AnimalID, NatIdNum, DOB, Sex, LactNum, PrimaryBreed)');
         qLivestockSum.SQL.Add('SELECT DISTINCT D.ID, D.NatIdNum, D.DateOfBirth, D.Sex, D.LactNo, D.PrimaryBreed');
         qLivestockSum.SQL.Add('FROM "Animals.db" D');
         qLivestockSum.SQL.Add('WHERE (not( D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
         qLivestockSum.SQL.Add(' AND ( D.AnimalDeleted = False )');   //Excludes deleted animals
         if (Length(ComboHerd.Value) > 0 ) then
            qLivestockSum.SQL.Add(' AND ( D.HerdID = "' + ComboHerd.Value + '" ) ');
         //Now to select required animals by DOB - must be <= Input Date
         qLivestockSum.SQL.Add(' AND (D.DateOfBirth <= "' + FormatDateTime(cUSDateStyle,(InputDate)) + '" ) ');
         //OPEN SQL - do not return results
         qLivestockSum.ExecSQL;

         // new queries to account for interherd movements - 11/4/00 - kr
         // adds animals moved OFF herd after date FROM
         with qLivestockSum do
            begin
               SQL.Clear;
               SQL.Add('INSERT INTO tLivestockSum (AnimalID, NatIdNum, DOB, Sex, LactNum, PrimaryBreed)');
               SQL.Add('SELECT DISTINCT D.ID, D.NatIdNum, D.DateOfBirth, D.Sex, D.LactNo, D.PrimaryBreed');
               SQL.Add('FROM "Animals.db" D');
               SQL.Add('LEFT JOIN IHM.db I ON (D.ID = I.AnimalID)');
               SQL.Add('WHERE (I.LastHerdID = "' + ComboHerd.Value + '" )');
               SQL.Add('AND   (I.DateMoved <= "' + FormatDateTime(cUSDateStyle,(InputDate)) + '")');
               SQL.Add('AND   (D.AnimalDeleted = False)');
               ExecSql;
            end;
         Application.processmessages;
         // Removes animals moved ON herd after Date TO
         with qLivestockSum do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM tLivestockSum.db L');
               SQL.Add('WHERE L.AnimalID IN');
               SQL.Add('     (SELECT DISTINCT I.AnimalID');
               SQL.Add('      FROM IHM.db I');
               SQL.Add('	WHERE (I.NewHerdID = "' + ComboHerd.Value + '" )');
               SQL.Add('	AND   (I.DateMoved > "' + FormatDateTime(cUSDateStyle,(InputDate)) + '"))');
               ExecSql;
             end;

         Application.processmessages;
         //Now to update tLivestockSum table with Include field set to True
         qLivestockSum.SQL.Clear;
         qLivestockSum.SQL.Add('UPDATE ' + tLivestockSum.TableName + ' SET Include = True, EligibleForPremium = FALSE');   //Set Include to true for all animals
         qLivestockSum.ExecSQL;
         ProgressBar1.StepIt;
         //Now to add Date of Purchase and Date of Sale/Death and compare these dates
         //with the earliest (FirstDate) and latest dates (InputDate) in REPS Report.
         //Set Include = False for all animals outside date ranges

         { Ensure CheckEvents is not filtered }
         WinData.CheckEvents.Filter := '';
         WinData.CheckEvents.Filtered := False;

         with tLivestockSum do
            begin
               First;
               while NOT (tLivestockSum.EOF) do
                   begin
                      Application.processmessages;
                      Edit;
                      //First get the Purchase event (if any) and exclude those animals
                      //purchased after last date in REPS report
                      if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CPurchaseEvent]),[] ) then
                         Begin
                            tLivestockSum.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                            If WinData.CheckEvents.FieldByName('EventDate').AsDateTime > InputDate then
                               tLivestockSum.FieldByName('Include').AsBoolean := FALSE    //Purchased after last date in REPS Report
                         End;
                      //Second - if still included, get the Sale/Death event (if any)
                      //and exclude those sold/died on or before first date in REPS Report
                      if (tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CSaleDeathEvent]),[] )) then
                         Begin
                            tLivestockSum.FieldByName('SaleDeathDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                            If WinData.CheckEvents.FieldByName('EventDate').AsDateTime <= FirstDate then
                               tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before earliest date in REPS Report
                         End;
                      if ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.tIntHerd.Locate('AnimalID',tLivestockSum.FieldByName('AnimalID').AsVariant,[] ) )) then
                         begin
                            if WinData.tIntHerd.FieldByName('LastHerdID').AsInteger = StrToInt(ComboHerd.Value) then
                               begin
                                  tLivestockSum.FieldByName('DateMovedOff').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                                  //If tLivestockSum.FieldByName('DateMovedOff').AsDateTime <= FirstDate then
                                   //   tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before earliest date in REPS Report
                               end
                            else if WinData.tIntHerd.FieldByName('NewHerdID').AsInteger = StrToInt(ComboHerd.Value) then
                               begin
                                  tLivestockSum.FieldByName('DateMovedOn').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                                  //If tLivestockSum.FieldByName('DateMovedOn').AsDateTime > InPutDate then
                                     // tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before earliest date in REPS Report
                               end;
                         end;
                      //Now to check the breeds table and determine whether eligible for Premium
                      If ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.Breeds.Locate('ID',tLivestockSum.FieldByName('PrimaryBreed').AsVariant,[] ) )) then
                         Begin  //If still included and has a nonzero BreedID, then get Premium Indicator.
                            tLivestockSum.FieldByName('EligibleForPremium').AsBoolean := WinData.Breeds.FieldByName('EligibleForPremium').AsBoolean;
                         End;
                      //Now need to get first calving date (if it exists)
                      If ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (tLivestockSum.FieldByName('LactNum').AsInteger > 0)) then
                         Begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                            If ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CCalvingEvent]),[] )) then
                               tLivestockSum.FieldByName('FirstCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                         End;
                      Post;
                      Next;
                   End;   //EndWhile Not (tLivestockSum.EOF) do
            End;   //EndWith tLivestockSum do
         ProgressBar1.StepBy(20);

            //Now have a subset of animals that will appear in the REPS report with DOB,
            //Lactation Number, EligibleForPremium, Purchase date (if any) and Sold/Died Date (if any)
            //Now need to compare dates on a month by month basis

      //First initialise some variables
      Tot0to6mths := 0;
      Tot6to12mths := 0;
      Tot1to2yrs := 0;
      Tot2plusYrs := 0;
      TotDairyCows := 0;     //KVB
      TotSucklerCows := 0;   //KVB
      YearTot := 0;
      YearLUTot := 0;

      for i := 11 downto 0 do
         begin
            //First get iterative date
            if (StrToInt(GetMth(cbMonthREPS.Text))-i) > 0 then   //Year does not need changing
               CalcDate := GetEndOfMthDate(((StrToInt(GetMth(cbMonthREPS.Text))+12-i) mod 12), StrToInt(cbYearREPS.Text))
            else
               CalcDate := GetEndOfMthDate(((StrToInt(GetMth(cbMonthREPS.Text))+12-i) mod 12), (StrToInt(cbYearREPS.Text) - 1));

            //Next go through the tLivestockSum table and count the desired animals
            with tLivestockSum do
               begin
                  //First initialise variables
                  Count0to6mths := 0;
                  Count6to12mths := 0;
                  Count1to2yrs := 0;
                  Count2plusYrs := 0;
                  CountDairyCows := 0;     //KVB
                  CountSucklerCows := 0;   //KVB
                  First;     //Gets first animal in table
                  while NOT (tLivestockSum.EOF) do
                     begin
                        { This is a complete mess }
                        Application.processmessages;
                        //Now to check if the animal should be counted and if so
                        //to determine how old the animal is
                        if ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (tLivestockSum.FieldByName('DOB').AsDateTime <= CalcDate) AND
                           (tLivestockSum.FieldByName('PurchDate').AsDateTime <= CalcDate)) then      //PurchDate must be <= CalcDate (if PurchDate does not exist, then PurchDate = 0)
                           begin
                                //Need to check if a Sold/Died Date exists
                              if ( tLivestockSum.FieldByName('SaleDeathDate').AsDateTime > 0 ) and (tLivestockSum.FieldByName('SaleDeathDate').AsDateTime <= CalcDate) then
                                 Next
                              else if ( tLivestockSum.FieldByName('DateMovedOn').AsDateTime > 0 ) and ( tLivestockSum.FieldByName('DateMovedOn').AsDateTime > CalcDate ) then
                                 Next
                              else if ( tLivestockSum.FieldByName('DateMovedOff').AsDateTime > 0 ) and ( tLivestockSum.FieldByName('DateMovedOff').AsDateTime <= CalcDate ) then
                                 Next            //Animal Sold/Died on or before CalcDate
                              else
                                 begin
                                    if ( tLivestockSum.FieldByName('LactNum').asInteger > 1 ) AND ( tLivestockSum.FieldByName('FirstCalvingDate').AsDateTime <= CalcDate ) then
                                        begin    //Animal Calved - now a Cow. Must determine whether a Dairy Or Suckler Cow
                                                 //Need to include checks for Suckler Cows and Dairy Cows here
                                           if ( tLivestockSum.FieldByName('EligibleForPremium').AsBoolean = True ) then
                                              begin
                                                 CountSucklerCows := CountSucklerCows + 1;
                                                 AddToLivestockCategoryByStockDate(Calcdate, 'Suckler Cow', tLivestockSum);
                                              end
                                           else
                                              begin
                                                 CountDairyCows := CountDairyCows + 1;
                                                 AddToLivestockCategoryByStockDate(Calcdate, 'Dairy Cow', tLivestockSum);
                                              end;
                                        end   //EndIf LactNum > 1
                                     else
                                        begin   //LactNum < 2   Animal may have calved. Need to check when
                                           if (( tLivestockSum.FieldByName('LactNum').AsInteger = 1 ) AND ( tLivestockSum.FieldByName('FirstCalvingDate').AsDateTime <= CalcDate )) then
                                              begin    //Animal Calved - now a cow. Must determine whether a Dairy Or Suckler Cow
                                                      //Need to include checks for Suckler Cows and Dairy Cows here
                                                 if ( tLivestockSum.FieldByName('EligibleForPremium').AsBoolean = True ) then
                                                    begin
                                                       CountSucklerCows := CountSucklerCows + 1;
                                                       AddToLivestockCategoryByStockDate(Calcdate, 'Suckler Cow', tLivestockSum);
                                                    end
                                                 else
                                                    begin
                                                       CountDairyCows := CountDairyCows + 1;
                                                       AddToLivestockCategoryByStockDate(Calcdate, 'Dairy Cow', tLivestockSum);
                                                    end;
                                              end   //EndIf Dairy Or Suckler Cow
                                            else   //LactNum = 0
                                              begin
                                                 if (tLivestockSum.FieldByName('DOB').AsDateTime <= (CalcDate - 731)) then
                                                    begin
                                                       Count2plusYrs := Count2plusYrs + 1;      //<= two years or more old
                                                       AddToLivestockCategoryByStockDate(Calcdate, 'Cattle 2Yr Plus', tLivestockSum);
                                                    end
                                                 else If ((tLivestockSum.FieldByName('DOB').AsDateTime > (CalcDate - 731)) AND
                                                          (tLivestockSum.FieldByName('DOB').AsDateTime <= (CalcDate - 365))) then
                                                           begin
                                                              Count1to2yrs := Count1to2yrs + 1;     //1 to 2 years old
                                                              AddToLivestockCategoryByStockDate(Calcdate, 'Cattle 1-2 Yr', tLivestockSum);
                                                           end
                                                 else If ((tLivestockSum.FieldByName('DOB').AsDateTime > (CalcDate - 365)) AND
                                                          (tLivestockSum.FieldByName('DOB').AsDateTime <= (CalcDate - 183))) then
                                                           begin
                                                              Count6to12mths := Count6to12mths + 1;     //6 to 12 months old
                                                              AddToLivestockCategoryByStockDate(Calcdate, 'Cattle 6-12 Mth', tLivestockSum);
                                                           end
                                                 else If (tLivestockSum.FieldByName('DOB').AsDateTime > (CalcDate - 183)) then
                                                           begin
                                                              Count0to6mths := Count0to6mths + 1;     //Less than 6 months old
                                                              AddToLivestockCategoryByStockDate(Calcdate, 'Cattle 0-6 Mth', tLivestockSum);
                                                           end;

                                              end;  //EndElse LactNum = 0
                                        end;  //EndElse LactNum < 2
                                    Next;    //Get Next animal
                                 end;      //End of DOB and PurchDate
                           end
                        else
                           Next;
                   end;   //EndWhile Not (tLivestockSum.EOF) do

         Application.processmessages;
                   //Now to do some calculations
                   MthTot := Count0to6mths + Count6to12mths + Count1to2yrs + Count2plusYrs + CountDairyCows + CountSucklerCows;
                   MthLUTot := ((Count0to6mths * StrToFloat(eLUEF0to6mths.Text)) + (Count6to12mths * StrToFloat(eLUEF6to12mths.Text)) +
                                (Count1to2yrs * StrToFloat(eLUEF1to2yrs.Text)) + (Count2plusYrs * StrToFloat(eLUEF2plusYrs.Text)) +
                                (CountDairyCows * StrToFloat(eLUEFDairyCows.Text)) + (CountSucklerCows * StrToFloat(eLUEFSucklerCows.Text)));
                   //Now to write the counts to the REPS Report totals
                   Case ((StrToInt(GetMth(cbMonthREPS.Text))+12-i) mod 12) of
                        1 : Begin     //January
                                 Jan1Tot.Caption := IntToStr(Count0to6mths);
                                 Jan2Tot.Caption := IntToStr(Count6to12mths);
                                 Jan3Tot.Caption := IntToStr(Count1to2yrs);
                                 Jan4Tot.Caption := IntToStr(Count2plusYrs);
                                 Jan5Tot.Caption := IntToStr(CountDairyCows);
                                 Jan6Tot.Caption := IntToStr(CountSucklerCows);
                                 JanTot.Caption := IntToStr(MthTot);
                                 JanLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        2 : Begin     //February
                                 Feb1Tot.Caption := IntToStr(Count0to6mths);
                                 Feb2Tot.Caption := IntToStr(Count6to12mths);
                                 Feb3Tot.Caption := IntToStr(Count1to2yrs);
                                 Feb4Tot.Caption := IntToStr(Count2plusYrs);
                                 Feb5Tot.Caption := IntToStr(CountDairyCows);
                                 Feb6Tot.Caption := IntToStr(CountSucklerCows);
                                 FebTot.Caption := IntToStr(MthTot);
                                 FebLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        3 : Begin     //March
                                 Mar1Tot.Caption := IntToStr(Count0to6mths);
                                 Mar2Tot.Caption := IntToStr(Count6to12mths);
                                 Mar3Tot.Caption := IntToStr(Count1to2yrs);
                                 Mar4Tot.Caption := IntToStr(Count2plusYrs);
                                 Mar5Tot.Caption := IntToStr(CountDairyCows);
                                 Mar6Tot.Caption := IntToStr(CountSucklerCows);
                                 MarTot.Caption := IntToStr(MthTot);
                                 MarLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        4 : Begin     //April
                                 Apr1Tot.Caption := IntToStr(Count0to6mths);
                                 Apr2Tot.Caption := IntToStr(Count6to12mths);
                                 Apr3Tot.Caption := IntToStr(Count1to2yrs);
                                 Apr4Tot.Caption := IntToStr(Count2plusYrs);
                                 Apr5Tot.Caption := IntToStr(CountDairyCows);
                                 Apr6Tot.Caption := IntToStr(CountSucklerCows);
                                 AprTot.Caption := IntToStr(MthTot);
                                 AprLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        5 : Begin     //May
                                 May1Tot.Caption := IntToStr(Count0to6mths);
                                 May2Tot.Caption := IntToStr(Count6to12mths);
                                 May3Tot.Caption := IntToStr(Count1to2yrs);
                                 May4Tot.Caption := IntToStr(Count2plusYrs);
                                 May5Tot.Caption := IntToStr(CountDairyCows);
                                 May6Tot.Caption := IntToStr(CountSucklerCows);
                                 MayTot.Caption := IntToStr(MthTot);
                                 MayLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        6 : Begin     //June
                                 Jun1Tot.Caption := IntToStr(Count0to6mths);
                                 Jun2Tot.Caption := IntToStr(Count6to12mths);
                                 Jun3Tot.Caption := IntToStr(Count1to2yrs);
                                 Jun4Tot.Caption := IntToStr(Count2plusYrs);
                                 Jun5Tot.Caption := IntToStr(CountDairyCows);
                                 Jun6Tot.Caption := IntToStr(CountSucklerCows);
                                 JunTot.Caption := IntToStr(MthTot);
                                 JunLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        7 : Begin     //July
                                 Jul1Tot.Caption := IntToStr(Count0to6mths);
                                 Jul2Tot.Caption := IntToStr(Count6to12mths);
                                 Jul3Tot.Caption := IntToStr(Count1to2yrs);
                                 Jul4Tot.Caption := IntToStr(Count2plusYrs);
                                 Jul5Tot.Caption := IntToStr(CountDairyCows);
                                 Jul6Tot.Caption := IntToStr(CountSucklerCows);
                                 JulTot.Caption := IntToStr(MthTot);
                                 JulLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                       8 : Begin     //August
                                 Aug1Tot.Caption := IntToStr(Count0to6mths);
                                 Aug2Tot.Caption := IntToStr(Count6to12mths);
                                 Aug3Tot.Caption := IntToStr(Count1to2yrs);
                                 Aug4Tot.Caption := IntToStr(Count2plusYrs);
                                 Aug5Tot.Caption := IntToStr(CountDairyCows);
                                 Aug6Tot.Caption := IntToStr(CountSucklerCows);
                                 AugTot.Caption := IntToStr(MthTot);
                                 AugLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        9 : Begin     //September
                                 Sep1Tot.Caption := IntToStr(Count0to6mths);
                                 Sep2Tot.Caption := IntToStr(Count6to12mths);
                                 Sep3Tot.Caption := IntToStr(Count1to2yrs);
                                 Sep4Tot.Caption := IntToStr(Count2plusYrs);
                                 Sep5Tot.Caption := IntToStr(CountDairyCows);
                                 Sep6Tot.Caption := IntToStr(CountSucklerCows);
                                 SepTot.Caption := IntToStr(MthTot);
                                 SepLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        10 : Begin     //October
                                 Oct1Tot.Caption := IntToStr(Count0to6mths);
                                 Oct2Tot.Caption := IntToStr(Count6to12mths);
                                 Oct3Tot.Caption := IntToStr(Count1to2yrs);
                                 Oct4Tot.Caption := IntToStr(Count2plusYrs);
                                 Oct5Tot.Caption := IntToStr(CountDairyCows);
                                 Oct6Tot.Caption := IntToStr(CountSucklerCows);
                                 OctTot.Caption := IntToStr(MthTot);
                                 OctLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                            End;
                        11 : Begin    //November
                                 Nov1Tot.Caption := IntToStr(Count0to6mths);
                                 Nov2Tot.Caption := IntToStr(Count6to12mths);
                                 Nov3Tot.Caption := IntToStr(Count1to2yrs);
                                 Nov4Tot.Caption := IntToStr(Count2plusYrs);
                                 Nov5Tot.Caption := IntToStr(CountDairyCows);
                                 Nov6Tot.Caption := IntToStr(CountSucklerCows);
                                 NovTot.Caption := IntToStr(MthTot);
                                 NovLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                             End;
                        0 : Begin    //December - mod calculation produces 0 for December
                                 Dec1Tot.Caption := IntToStr(Count0to6mths);
                                 Dec2Tot.Caption := IntToStr(Count6to12mths);
                                 Dec3Tot.Caption := IntToStr(Count1to2yrs);
                                 Dec4Tot.Caption := IntToStr(Count2plusYrs);
                                 Dec5Tot.Caption := IntToStr(CountDairyCows);
                                 Dec6Tot.Caption := IntToStr(CountSucklerCows);
                                 DecTot.Caption := IntToStr(MthTot);
                                 DecLU.Caption := FloatToStr(MthLUTot);
                                 Tot0to6mths := Tot0to6mths + Count0to6mths;
                                 Tot6to12mths := Tot6to12mths + Count6to12mths;
                                 Tot1to2yrs := Tot1to2yrs + Count1to2yrs;
                                 Tot2plusYrs := Tot2plusYrs + Count2plusYrs;
                                 TotDairyCows := TotDairyCows + CountDairyCows;
                                 TotSucklerCows := TotSucklerCows + CountSucklerCows;
                                 YearTot := YearTot + MthTot;
                                 YearLUTot := YearLUTot + MthLUTot;
                             End;
                   End;    //EndCase i of
            End;   //EndWith tLivestockSum do
         ProgressBar1.StepIt;
      end;  //EndFor i = 11 downto 0 do
            //Now to write the REPS report totals figures

            Year1Tot.Caption := IntToStr(Tot0to6mths);
            Year2Tot.Caption := IntToStr(Tot6to12mths);
            Year3Tot.Caption := IntToStr(Tot1to2yrs);
            Year4Tot.Caption := IntToStr(Tot2plusYrs);
            Year5Tot.Caption := IntToStr(TotDairyCows);
            Year6Tot.Caption := IntToStr(TotSucklerCows);
            TotNum.Caption := IntToStr(YearTot);
            TotLU.Caption := FloatToStr(YearLUTot);


            Year1Avg.Caption := FloatToStrF(Tot0to6mths / 12, ffFixed, 8, 1);
            Year2Avg.Caption := FloatToStrF(Tot6to12mths / 12, ffFixed, 8, 1);
            Year3Avg.Caption := FloatToStrF(Tot1to2yrs  / 12,ffFixed,  8, 1);
            Year4Avg.Caption := FloatToStrF(Tot2plusYrs  / 12, ffFixed, 8, 1);
            Year5Avg.Caption := FloatToStrF(TotDairyCows  / 12, ffFixed, 8, 1);
            Year6Avg.Caption := FloatToStrF(TotSucklerCows  / 12, ffFixed, 8, 1);

            AvgNum.Caption := FloatToStrF( (Tot0to6mths +
                                          Tot6to12mths +
                                          Tot1to2yrs +
                                          Tot2plusYrs +
                                          TotDairyCows +
                                          TotSucklerCows ) / 12, ffFixed, 8, 1);

{
            Year1Avg.Caption := IntToStr(Trunc(WinData.RoundUp((Tot0to6mths) / 12)));
            Year2Avg.Caption := IntToStr(Trunc(WinData.RoundUp((Tot6to12mths) / 12)));
            Year3Avg.Caption := IntToStr(Trunc(WinData.RoundUp((Tot1to2yrs)  / 12)));
            Year4Avg.Caption := IntToStr(Trunc(WinData.RoundUp((Tot2plusYrs)  / 12)));
            Year5Avg.Caption := IntToStr(Trunc(WinData.RoundUp((TotDairyCows)  / 12)));
            Year6Avg.Caption := IntToStr(Trunc(WinData.RoundUp((TotSucklerCows)  / 12)));

            AvgNum.Caption := IntToStr(Trunc( WinData.RoundUp( StrToInt ( Year1Avg.Caption ) +
                                                               StrToInt ( Year2Avg.Caption ) +
                                                               StrToInt ( Year3Avg.Caption ) +
                                                               StrToInt ( Year4Avg.Caption ) +
                                                               StrToInt ( Year5Avg.Caption ) +
                                                               StrToInt ( Year6Avg.Caption ) / 12)));
}

            AvgLU.Caption := FloatToStrF((YearLUTot  / 12), ffFixed, 8, 2);

        finally
           WinData.tIntHerd.Close;
        end;
   if Assigned(tLivestockCategoryByStockDate) then DBIForceWrite(tLivestockCategoryByStockDate);
end;

procedure TfLivestockSum.CreatetLivestockSum;
begin
    tLivestockSum := TTable.Create(nil);
     with tLivestockSum do      //Procedure to create table
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'tLivestockSum';
           FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
           FieldDefs.Add('NatIDNum',ftString,20);
           FieldDefs.Add('Sex',ftString,10,FALSE);
           FieldDefs.Add('DOB',ftDate,0,FALSE);
           FieldDefs.Add('LactNum',ftSmallint,0,FALSE);
           FieldDefs.Add('PrimaryBreed',ftInteger,0,FALSE);
           FieldDefs.Add('EligibleForPremium',ftBoolean,0,FALSE);
           FieldDefs.Add('PurchDate',ftDate,0,FALSE);
           FieldDefs.Add('SaleDeathDate',ftDate,0,FALSE);
           FieldDefs.Add('FirstCalvingDate',ftDate,0,FALSE);
           FieldDefs.Add('Include',ftBoolean,0,FALSE);
           FieldDefs.Add('DateMovedOn',ftDate,0,FALSE);
           FieldDefs.Add('DateMovedOff',ftDate,0,FALSE);
           CreateTable;
           Open;
        end;    //EndWith
end;

procedure TfLivestockSum.ExtQuery(ExtDate: TDateTime);
var
   i,
   Num : Integer;
   CalfList : TStringList;
   CalvingInfo : TCalvingInfo;
begin
   // clear table
   with qLivestockSum do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM tLivestockSum');
         ExecSQL;
      end;
   // create a table of all possible animals
   with qLivestockSum do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO tLivestockSum (AnimalID, LactNum, Sex, DOB)');
         SQL.Add('SELECT DISTINCT D.ID, D.LactNo, D.Sex, D.DateOfBirth');
         SQL.Add('FROM "Animals.db" D');
         SQL.Add('WHERE (not( D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
         SQL.Add(' AND ( D.AnimalDeleted = False )');
         if ( Length(ComboHerd.Value) > 0 ) then
         SQL.Add(' AND ( D.HerdID = "' + ComboHerd.Value + '" ) ');
         SQL.Add(' AND (D.DateOfBirth <= "' + FormatDateTime(cUSDateStyle,(ExtDate)) + '" ) ');
         ExecSQL;
      end;
   // new queries to account for interherd movements - 11/4/00 - kr
   // adds animals moved OFF herd after date FROM
   with qLivestockSum do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO tLivestockSum.db (AnimalID, LactNum, Sex, DOB)');
         SQL.Add('SELECT DISTINCT A.ID, A.LactNo, A.Sex, A.DateOfBirth');
         SQL.Add('FROM Animals.db A');
         SQL.Add('LEFT JOIN IHM.db I ON (A.ID = I.AnimalID)');
         SQL.Add('WHERE (I.LastHerdID = "' + ComboHerd.Value + '" )');
         SQL.Add('AND   (I.DateMoved >= "' + FormatDateTime(cUSDateStyle,(ExtDate)) + '")');
         SQL.Add('AND   (A.AnimalDeleted = False)');
         ExecSql;
      end;
   // Removes animals moved ON herd after Date TO
   with qLivestockSum do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM tLivestockSum.db L');
         SQL.Add('WHERE L.AnimalID IN');
         SQL.Add('     (SELECT DISTINCT I.AnimalID');
         SQL.Add('      FROM IHM.db I');
         SQL.Add('	WHERE (I.NewHerdID = "' + ComboHerd.Value + '" )');
         SQL.Add('	AND   (I.DateMoved > "' + FormatDateTime(cUSDateStyle,(ExtDate)) + '"))');
         ExecSql;
       end;
   //Now to update tLivestockSum table with Include field set to True
   qLivestockSum.SQL.Clear;
   qLivestockSum.SQL.Add('UPDATE ' + tLivestockSum.TableName + ' SET Include=True');
   qLivestockSum.ExecSQL;
   // get record count for progress bar
   qLivestockSum.SQL.Clear;
   qLivestockSum.SQL.Add('SELECT COUNT(AnimalID) CowCount FROM tLivestockSum.db');
   qLivestockSum.Open;
   // set progress bar parameters
   pbExten.Min := 0;
   pbExten.Max := (qLivestockSum.FieldByName('CowCount').AsInteger * 2);
   pbExten.Step := 1;
   //add Date of Purchase and Date of Sale/Death and compare these dates
   //with the earliest (MinDate) and latest dates (MaxDate).
   //Set Include = False for all animals outside date ranges

   { Ensure CheckEvents is not filtered }
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   With tLivestockSum do
      Begin
         First;
         While Not (tLivestockSum.EOF) do
            Begin
               Edit;
               //First get the Purchase event (if any) and exclude those animals
               //purchased after MaxDate
               if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CPurchaseEvent]),[] ) then
                  Begin
                     tLivestockSum.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     If WinData.CheckEvents.FieldByName('EventDate').AsDateTime > ExtDate then
                        tLivestockSum.FieldByName('Include').AsBoolean := FALSE
                  End;
               //Second - if still included, get the Sale/Death event (if any)
               //and exclude those sold/died on or before MinDate
               if (tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CSaleDeathEvent]),[] )) then
                  Begin
                     tLivestockSum.FieldByName('SaleDeathDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     If WinData.CheckEvents.FieldByName('EventDate').AsDateTime <= ExtDate then
                        tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before MinDate
                  End;
               //Now need to get first calving date (if it exists)
               If ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (tLivestockSum.FieldByName('LactNum').AsInteger > 0)) then
                  Begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                     If ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CCalvingEvent]),[] )) then
                        tLivestockSum.FieldByName('FirstCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                  End;
               Post;
               Next;
               pbExten.Stepit;
            End;
      End;

   // get female and create new records for any expected calves.
   with tLivestockSum do
      try
         CalfList := TStringList.Create;
         WinData.CheckEvents.Close;
         try
            WinData.CheckEvents.Open;
         except
            on E : Exception do
               raise Exception.Create(e.Message);
         end;
         First;
         while NOT (tLivestockSum.EOF) do
            begin
               Application.ProcessMessages;
               if (tLivestockSum.FieldByName('Include').AsBoolean = True) AND (tLivestockSum.FieldByName('Sex').AsString = 'Female') then
                  begin
                     CalvingInfo := WinData.GetProjCalvingInfo(tLivestockSum.FieldByName('AnimalID').AsInteger, tLivestockSum.FieldByName('LactNum').AsInteger);
                     case CalvingInfo.PregStatus of
                        { Use Projected calvings where Service/PD or both havew taken place }
                        psPregnant, psUndefined :
                        begin
                           if (( CalvingInfo.ProjCalvingDate > 0 ) and ( CalvingInfo.NoCalves > 0 )) then
                              begin
                                 // Only use predicted calves if the predicted date is > Today & ExtDate
                                 if (( CalvingInfo.ProjCalvingDate > Now ) and
                                     ( ExtDate > Now ) and (CalvingInfo.ProjCalvingDate <= ExtDate)) then
                                    begin   //Add a maximum of four animals only, any more and can not input
                                       if ( CalvingInfo.NoCalves > 4 ) then
                                          Num := 4
                                       else
                                          Num := CalvingInfo.NoCalves;
                                       for i := 1 to Num do
                                          CalfList.AddObject('', TCalfRecord.Create(tLivestockSum.FieldByName('AnimalID').AsInteger,
                                                                 CalvingInfo.ProjCalvingDate));
                                       // After projecting calves, update Dam Status.
                                       // If the Dam is 0 lactation heifer under two years of age (.6 LU),
                                       // change the status of the heifer to a cow.
                                       // This can be done by incrementing the lactation number by 1. (1 LU )
                                       if ( tLivestockSum.FieldByName('LactNum').AsInteger = 0 ) then
                                          if ( tLivestockSum.FieldByName('DOB').AsDateTime ) > IncMonth(Date, -24) then
                                             begin
                                                tLivestockSum.Edit;
                                                tLivestockSum.FieldByName('LactNum').AsInteger := 1;
                                                tLivestockSum.Post;
                                             end;
                                    end;
                              end;
                        end;
                     end;
                  end;
               Next;
               pbExten.Stepit;
            end;
      finally
         for i := 0 to CalfList.Count-1 do
            begin
               if CalfList.Objects[i] <> nil then
                  begin
                     tLivestockSum.Insert;   // Inserts a new blank record for a calf
                     tLivestockSum.FieldByName('AnimalID').AsInteger := 0;
                     tLivestockSum.FieldByName('DOB').AsDateTime := TCalfRecord(CalfList.Objects[i]).DOB;
                     if i < 999999 then
                        tLivestockSum.FieldByName('Sex').AsString := 'Calf' + IntToStr(i+1)
                     else
                        tLivestockSum.FieldByName('Sex').AsString := 'Calf';
                     tLivestockSum.FieldByName('Include').AsBoolean := True;
                     tLivestockSum.Post;    //Posts new calf record
                     // Debug CalfList.Strings[i] := 'Dam: '+ TCalfRecord(CalfList.Objects[i]).DamNo +', Proj: '+ DateToStr(TCalfRecord(CalfList.Objects[i]).DOB);
                     TCalfRecord(CalfList.Objects[i]).Free;
                  end;
            end;
         // Debug CalfList.SaveToFile('C:\Date ' +FormatDateTime('dd-mm-yyyy', ExtDate) +' ProjCalvings.txt');
         FreeAndNil(CalfList);
      end;

   pbExten.Position := (qLivestockSum.FieldByName('CowCount').AsInteger * 2);
   Application.ProcessMessages;
end;

procedure TfLivestockSum.BuildProj;
Var
   BeginDt : TDate;
   EndDt : TDate;
   MthNum : Integer;
   YrNum : Integer;
   MaxValue : Integer;
   MinValue : Integer;
   Cattle0to6mths : Integer;
   Cattle6to12mths : Integer;
   Cattle1to2yrs : Integer;
   Cattle2PlusYrs : Integer;
   Cows2PlusYrs : Integer;
   i : Integer;
   NoOfCalves : Integer;
   TempDate : TDateTime;
   Num : Integer;
   IsPreg : String;
Begin
     Try
        with fmLiveStockUnitProj do
           begin
              ProjVerLabel.Caption := 'Herd Management ' + HerdVerNo;

              //First get Beginning Date and End Date for the Report
              BeginDt := Date;
              MthNum := StrToInt(FormatDateTime('m',(Date + 365)));
              YrNum := StrToInt(FormatDateTime('yyyy',(Date + 365)));
              EndDt := GetEndOfMthDate(MthNum, YrNum);
              NumDays := Round(EndDt - BeginDt); //Does not include both end date - Strt date reppresented as "Date + 0"
              //Now to fill in Herd ID and Report End Date
              If WinData.OwnerFile.Locate('ID',ComboHerd.Value,[]) then
                 lProjHerdID.Caption := WinData.OwnerFile.FieldByName('HerdIdentity').AsString;
              lProjEndDate.Caption := FormatDateTime(cIrishDateStyle, EndDt);

              //Now clear out table
              qLivestockSum.SQL.Clear;
              qLivestockSum.SQL.Add('DELETE FROM tLivestockSum');
              qLivestockSum.ExecSQL;

              //Now to create a table of all possible animals
              //First select all animals in the Herd (their Date Of Birth will automatically be
              //less than the system date which is the date the report commences from)
              qLivestockSum.SQL.Clear;
              qLivestockSum.SQL.Add('INSERT INTO tLivestockSum (AnimalID, LactNum, DOB, Sex)');
              qLivestockSum.SQL.Add('SELECT DISTINCT D.ID, D.LactNo, D.DateOfBirth, D.Sex');
              qLivestockSum.SQL.Add('FROM "Animals.db" D');
              qLivestockSum.SQL.Add('WHERE (D.InHerd=TRUE) AND (not( D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
              qLivestockSum.SQL.Add(' AND ( D.AnimalDeleted = False )');   //Excludes deleted animals
              if ( Length(ComboHerd.Value) > 0 ) then
                qLivestockSum.SQL.Add(' AND ( D.HerdID = "' + ComboHerd.Value + '" ) ');
              //OPEN SQL - do not return results
              qLivestockSum.ExecSQL;      //Populates tLivestockSum

              //************
              //Now need to add records to tLivestockSum for calves due
              //Need to look for animals with a gender of female and create new records for
              //any expected calves.
              With tLivestockSum do
                Begin
                     First;
                     While Not (tLivestockSum.EOF) do
                           Begin
                                If (tLivestockSum.FieldByName('Sex').AsString = 'Female') then
                                   Begin
                                        TempDate := WinData.GetProjCalving(tLivestockSum.FieldByName('AnimalID').AsInteger, tLivestockSum.FieldByName('LactNum').AsInteger, NoOfCalves,IsPreg);  //Lactation 0 is current lactation. Assume all prior lactations have had calves input
                                        if TempDate > StrToDate(eProjDate.Text) then
                                           If ( NoOfCalves > 0 ) then
                                              Begin   //Add a maximum of four animals only, any more and can not input
                                                   If ( NoOfCalves > 4 ) then
                                                      Num := 4
                                                   Else
                                                       Num := NoOfCalves;
                                                   For i := 1 to Num do
                                                       Begin
                                                            //tLivestockSum.Prior;    //Moves one record back
                                                            tLivestockSum.Insert;   //Inserts a new blank record for a calf
                                                            tLivestockSum.FieldByName('AnimalID').AsInteger := 0;
                                                            tLivestockSum.FieldByName('DOB').AsDateTime := TempDate;
                                                            tLivestockSum.FieldByName('Sex').AsString := 'Calf' + IntToStr(Num);
                                                            tLivestockSum.Post;    //Posts new calf record
                                                            tLivestockSum.Next;    //Moves back to cow record
                                                       End;  //EndIf
                                              End;  //EndIf
                                   End;
                                Next;   //Get next animal
                           End;   //EndWhile Not (tLivestockSum.EOF) do
                End;   //EndWith tLivestockSum do

              //**********

              //Now have all animals plus calves due
              //Now create the date table for the graph
              CreatetLUDate;                //Procedure to create tLivestockSum

              //Now need to count any animals that are two or more years old by gender
              //and to populate the tLUDate table with the changes in each category.
              //First initialise some variables
              Cattle0to6mths := 0;
              Cattle6to12mths := 0;
              Cattle1to2yrs := 0;
              Cattle2PlusYrs := 0;
              Cows2PlusYrs := 0;
              tLivestockSum.First;     //Gets first animal in table
              While Not (tLivestockSum.EOF) do
                    Begin
                         If tLivestockSum.FieldByName('DOB').AsDateTime < (Date - 730) then
                            Begin
                                  If tLivestockSum.FieldByName('Sex').AsString = 'Female' then
                                     Begin
                                          Cows2PlusYrs := Cows2PlusYrs + 1;   //Add one to initial count
                                     End
                                  Else
                                      Begin
                                           Cattle2PlusYrs := Cattle2PlusYrs + 1;   //Add one to initial count
                                      End;
                            End  //EndIf DOB < two years before report start date
                         Else
                             Begin   //Need to record changes in categories throughout the year
                                  If ( tLivestockSum.FieldByName('DOB').AsDateTime >= (Date - 730) ) AND ( tLivestockSum.FieldByName('DOB').AsDateTime < (Date - 365) ) then
                                    Begin  //Between 1 to 2 yrs old
                                         Cattle1to2yrs := Cattle1to2yrs + 1;    //Add one to initial count
                                         If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 730 ), []) ) then
                                            Begin   //Need to record one less 1 to 2 yr old and one more 2 plus yrs old
                                                 tLUDate.Edit;
                                                 tLUDate.FieldByName('Cattle1to2yrs').AsInteger := tLUDate.FieldByName('Cattle1to2yrs').AsInteger - 1;
                                                 If tLivestockSum.FieldByName('Sex').AsString = 'Female' then
                                                    tLUDate.FieldByName('Cows2plusYrs').AsInteger := tLUDate.FieldByName('Cows2plusYrs').AsInteger + 1
                                                 Else
                                                     tLUDate.FieldByName('Cattle2plusYrs').AsInteger := tLUDate.FieldByName('Cattle2plusYrs').AsInteger + 1;
                                                 tLUDate.Post;
                                            End;  //EndIf tLUDate.Locate('Date')
                                    End  //EndIf DOB between 1 to 2 yrs ago
                                  Else
                                      Begin   //Animal less than 1 yr old
                                           If ( tLivestockSum.FieldByName('DOB').AsDateTime >= (Date - 365) ) AND ( tLivestockSum.FieldByName('DOB').AsDateTime < (Date - 182) ) then
                                              Begin   //Animal between 6 to 12 mths old
                                                   Cattle6to12mths := Cattle6to12mths + 1;    //Add one to initial count
                                                   If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 365 ), []) ) then
                                                      Begin   //Need to record one less 6 to 12 mth old and one more 1 to 2 yrs old
                                                           tLUDate.Edit;
                                                           tLUDate.FieldByName('Cattle6to12mths').AsInteger := tLUDate.FieldByName('Cattle6to12mths').AsInteger - 1;
                                                           tLUDate.FieldByName('Cattle1to2yrs').AsInteger := tLUDate.FieldByName('Cattle1to2yrs').AsInteger + 1;
                                                           tLUDate.Post;
                                                      End;  //EndIf tLUDate.Locate('Date')

                                                   //Now need to check if animal has second birthday within period
                                                   If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 730 ), []) ) then
                                                      Begin   //Need to record one less 1 to 2 yr old and one more 2 plus yrs old
                                                            tLUDate.Edit;
                                                            tLUDate.FieldByName('Cattle1to2yrs').AsInteger := tLUDate.FieldByName('Cattle1to2yrs').AsInteger - 1;
                                                            If tLivestockSum.FieldByName('Sex').AsString = 'Female' then
                                                               tLUDate.FieldByName('Cows2plusYrs').AsInteger := tLUDate.FieldByName('Cows2plusYrs').AsInteger + 1
                                                            Else
                                                                tLUDate.FieldByName('Cattle2plusYrs').AsInteger := tLUDate.FieldByName('Cattle2plusYrs').AsInteger + 1;
                                                            tLUDate.Post;
                                                      End;  //EndIf tLUDate.Locate('Date')

                                              End   //EndIf Animal is between 6 to 12 mths old
                                           Else
                                               Begin  //Animal less than 6 mths old
                                                    If ( tLivestockSum.FieldByName('DOB').AsDateTime >= (Date - 182) ) AND ( tLivestockSum.FieldByName('DOB').AsDateTime < (Date + 1) ) then
                                                       Begin   //Animal between 0 and 6 mths old
                                                            Cattle0to6mths := Cattle0to6mths + 1;    //Add one to initial count
                                                            If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 183 ), []) ) then
                                                               Begin   //Need to record one less 0 to 6 mth old and one more 6 to 12 mth old
                                                                    tLUDate.Edit;
                                                                    tLUDate.FieldByName('Cattle0to6mths').AsInteger := tLUDate.FieldByName('Cattle0to6mths').AsInteger - 1;
                                                                    tLUDate.FieldByName('Cattle6to12mths').AsInteger := tLUDate.FieldByName('Cattle6to12mths').AsInteger + 1;
                                                                    tLUDate.Post;
                                                               End;  //EndIf tLUDate.Locate('Date')

                                                            //Now need to alter figures for first birthday
                                                            If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 365 ), []) ) then
                                                               Begin   //Need to record one less 6 to 12 mth old and one more 1 to 2 yrs old
                                                                    tLUDate.Edit;
                                                                    tLUDate.FieldByName('Cattle6to12mths').AsInteger := tLUDate.FieldByName('Cattle6to12mths').AsInteger - 1;
                                                                    tLUDate.FieldByName('Cattle1to2yrs').AsInteger := tLUDate.FieldByName('Cattle1to2yrs').AsInteger + 1;
                                                                    tLUDate.Post;
                                                               End;  //EndIf tLUDate.Locate('Date')

                                                       End  //EndIf Animal is between 0 and 6 mths old
                                                    Else
                                                        Begin   //Animal not yet born
                                                             //No initial count
                                                             If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime ), []) ) then
                                                                Begin   //Need to record one more 0 to 6 mth old
                                                                     tLUDate.Edit;
                                                                     tLUDate.FieldByName('Cattle0to6mths').AsInteger := tLUDate.FieldByName('Cattle0to6mths').AsInteger + 1;
                                                                     tLUDate.Post;
                                                                End;  //EndIf tLUDate.Locate('Date')

                                                             If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 183 ), []) ) then
                                                                Begin   //Need to record one less 0 to 6 mth old and one more 6 to 12 mth old
                                                                     tLUDate.Edit;
                                                                     tLUDate.FieldByName('Cattle0to6mths').AsInteger := tLUDate.FieldByName('Cattle0to6mths').AsInteger - 1;
                                                                     tLUDate.FieldByName('Cattle6to12mths').AsInteger := tLUDate.FieldByName('Cattle6to12mths').AsInteger + 1;
                                                                     tLUDate.Post;
                                                                End;  //EndIf tLUDate.Locate('Date')

                                                             //Now need to alter figures for first birthday
                                                             If ( tLUDate.Locate('DateTotalLU',( tLivestockSum.FieldByName('DOB').AsDateTime + 365 ), []) ) then
                                                                Begin   //Need to record one less 6 to 12 mth old and one more 1 to 2 yrs old
                                                                     tLUDate.Edit;
                                                                     tLUDate.FieldByName('Cattle6to12mths').AsInteger := tLUDate.FieldByName('Cattle6to12mths').AsInteger - 1;
                                                                     tLUDate.FieldByName('Cattle1to2yrs').AsInteger := tLUDate.FieldByName('Cattle1to2yrs').AsInteger + 1;
                                                                     tLUDate.Post;
                                                                End;  //EndIf tLUDate.Locate('Date')


                                                        End;  //EndElse Animal not yet born
                                               End;   //EndElse DOB > 6 mths ago
                                      End;   //EndElse DOB > 1 yr ago
                             End;   //EndElse DOB > 2 yrs ago
                         tLivestockSum.Next;
                    End;   //EndWhile Not (tLivestockSum.EOF)
              //Now to record date 0 values
              tLUDate.First;
              tLUDate.Edit;
              tLUDate.FieldByName('Cattle0to6mths').AsInteger := Cattle0to6mths;
              tLUDate.FieldByName('Cattle6to12mths').AsInteger := Cattle6to12mths;
              tLUDate.FieldByName('Cattle1to2yrs').AsInteger := Cattle1to2yrs;
              tLUDate.FieldByName('Cattle2plusYrs').AsInteger := Cattle2plusYrs;
              tLUDate.FieldByName('Cows2plusYrs').AsInteger := Cows2plusYrs;
              tLUDate.Post;
              //Now need to initialise values
              Cattle0to6mths := 0;
              Cattle6to12mths := 0;
              Cattle1to2yrs := 0;
              Cattle2plusYrs := 0;
              Cows2plusYrs := 0;
              //Now need to go through the tLUDate table calculating the daily TotalLU amount
              tLUDate.First;
              While ( Not tLUDate.EOF ) do
                    Begin
                         Cattle0to6mths := Cattle0to6mths + tLUDate.FieldByName('Cattle0to6mths').AsInteger;
                         Cattle6to12mths := Cattle6to12mths + tLUDate.FieldByName('Cattle6to12mths').AsInteger;
                         Cattle1to2yrs := Cattle1to2yrs + tLUDate.FieldByName('Cattle1to2yrs').AsInteger;
                         Cattle2plusYrs := Cattle2plusYrs + tLUDate.FieldByName('Cattle2plusYrs').AsInteger;
                         Cows2plusYrs := Cows2plusYrs + tLUDate.FieldByName('Cows2plusYrs').AsInteger;
                         tLUDate.Edit;
                         tLUDate.FieldByName('TotalLU').AsFloat := ( Cattle0to6mths * StrToFloat(eLUEFCattle0to6mths.Text) ) +
                                                           ( Cattle6to12mths * StrToFloat(eLUEFCattle6to12mths.Text) ) +
                                                           ( Cattle1to2yrs * StrToFloat(eLUEFCattle1to2yrs.Text) ) +
                                                           ( Cattle2plusYrs * StrToFloat(eLUEFCattle2plusYrs.Text) ) +
                                                           ( Cows2plusYrs * StrToFloat(eLUEFCows2plusYrs.Text) );
                         tLUDate.Post;
                         tLUDate.Next;
                    End;  //EndWhile Not tLUDate.EOF

              //Now need to extract the information required for the chart
              qLivestockSum.Close;
              qLivestockSum.SQL.Clear;
              qLivestockSum.SQL.Add('Select Max(TotalLU) dbMax, Min(TotalLU) dbMin From tLUDate');
              qLivestockSum.Open;
              if NOT qLivestockSum.IsEmpty then
                 begin
                    MaxLU := qLiveStockSum.FieldByName('dbMax').AsFloat;
                    MinLU := qLiveStockSum.FieldByName('dbMin').AsFloat;
                    if ( LULimit > MaxLU ) then
                       MaxLU := LULimit;
                    if ( LULimit < MinLU ) then
                       MinLU := LULimit;
                    MaxLU := MaxLU + ( MaxLU-MinLU ) * 0.05;
                    MinLU := MinLU - ( MaxLU-MinLU ) * 0.05;
                 end;
           end;

   finally
   end;
End;

procedure TfLivestockSum.CreatetLUDate;
Var
   i : integer;

begin
     //First clear out table
     {
     qLivestockSum.SQL.Clear;
     qLivestockSum.SQL.Add('DELETE FROM tLUDate');
     qLivestockSum.ExecSQL;
     }

     with tLUDate do      //Procedure to create table
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'tLUDate';
           FieldDefs.Clear;
           //Need to define fields in the table
           FieldDefs.Add('ID',ftInteger,0,FALSE);       //Count 1 to 365
           FieldDefs.Add('DateTotalLU',ftDate,0,FALSE);        //Actual date
           FieldDefs.Add('Cattle0to6mths',ftInteger,0,FALSE);   //Change in number of animals 0 to 6 mths old
           FieldDefs.Add('Cattle6to12mths',ftInteger,0,FALSE);  //Change in number of animals 6 to 12 mths old
           FieldDefs.Add('Cattle1to2yrs',ftInteger,0,FALSE);    //Change in number of animals 1 to 2 yrs old
           FieldDefs.Add('Cattle2plusYrs',ftinteger,0,FALSE);   //Change in number of cattle 2 plus yrs old
           FieldDefs.Add('Cows2plusYrs',ftInteger,0,FALSE);     //Change in number of cows 2 plus yrs old
           FieldDefs.Add('TotalLU',ftFloat,0,FALSE);            //Total LU's
           FieldDefs.Add('LULimit',ftFloat,0,FALSE);            //LU Limit

           CreateTable;

           Open;

           //Now to input the ID and Dates
           For i := 0 to NumDays do
               Begin
                    Append;
                    FieldByName('ID').AsInteger := i;
                    FieldByName('DateTotalLU').AsDateTime := (Date + i);
                    FieldByName('LULimit').AsFloat := LULimit;
                    Post;
               End;  //EndFor i := 0 to 365 do
        end;    //EndWith
end;

procedure TfLivestockSum.sbViewClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   try
      sbView.Enabled := False;
      sbPrint.Enabled := False;
      lPleaseWait.Visible := True;
      lPleaseWait.Refresh;

      CreatetLivestockSum;

      if (ComboHerd.Value = '0') then //and (rgSelReport.ItemIndex <> 1) then
         MessageDlg('Please select a Herd', mtinformation, [mbok],0)
      else
         begin
            WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,ComboHerd.Value);
            { }
            case FWhichRepType of
                    rtREPS: begin
                          Application.CreateForm(TfmREPs, fmREPs);
                          fmReps.RptTitle.Caption := Self.Caption;
                          with fmReps.REPSRep do
                             try
                                // First check that a year and month have been selected
                                if ((cbMonthREPS.Text = '') OR (cbYearREPS.Text = '')) then
                                   Messagedlg('Please Select a Month and a Year',mtinformation,[mbok],0)
                                else    //Now to check that valid LUEF have been entered
                                   If ((StrToFloat(eLUEF0to6mths.Text) < 0) OR (StrToFloat(eLUEF0to6mths.Text) > 1) OR
                                       (StrToFloat(eLUEF6to12mths.Text) < 0) OR (StrToFloat(eLUEF6to12mths.Text) > 1) OR
                                       (StrToFloat(eLUEF1to2yrs.Text) < 0) OR (StrToFloat(eLUEF1to2yrs.Text) > 1) OR
                                       (StrToFloat(eLUEF2plusyrs.Text) < 0) OR (StrToFloat(eLUEF2plusyrs.Text) > 1) OR
                                       (StrToFloat(eLUEFDairyCows.Text) < 0) OR (StrToFloat(eLUEFDairyCows.Text) > 2) OR
                                       (StrToFloat(eLUEFSucklerCows.Text) < 0) OR (StrToFloat(eLUEFSucklerCows.Text) > 2) ) then
                                       Messagedlg('Please input valid Livestock Unit Equivalent Factors',mtinformation,[mbok],0)
                                   else if ((StrToFloat(eLUEF0to6mths.Text) <> 0) OR (StrToFloat(eLUEF6to12mths.Text) <> 0.6) OR
                                            (StrToFloat(eLUEF1to2yrs.Text) <> 0.6) OR (StrToFloat(eLUEF2plusyrs.Text) <> 1.0) OR
                                            (StrToFloat(eLUEFDairyCows.Text) <> 1.0) OR (StrToFloat(eLUEFSucklerCows.Text) <> 1.0) ) then
                                            begin    //LUEF not correct // SP
                                               if MessageDlg('The Livestock Unit Equivalent Factors are not valid. Do you wish to continue?',mtWarning,[mbYes,mbNo],0) = mrYes then
                                                  Begin   //Produce Report
                                                     BuildREPS;    // Calls Procedure to build the REPS report
                                                     progressbar1.Position := 0;
                                                     progressbar1.Hide;

                                                     // Now to determine whether the sbview or sbprint button was clicked
                                                     if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                                                        with fmReps.REPSRep do     // View Report
                                                             Begin
                                                                  fmReps.REPSDetail.Font.Color := clNavy;
                                                                  fmReps.RptTitle.Font.Color := clRed;
                                                                  fmReps.REPSRep.Preview;
                                                             End    //EndWith
                                                     else
                                                         with fmReps.REPSRep do     // Print Report
                                                              begin
                                                                   fmReps.REPSDetail.Font.Color := clBlack;
                                                                   fmReps.RptTitle.Font.Color := clBlack;
                                                                   fmReps.REPSRep.Print;
                                                              end;    //EndWith

                                                  end;   //EndIf Warning is mrYes
                                            end   //EndIf LUEF not correct
                                        else  //Produce report
                                            Begin
                                                 BuildREPS;    // Calls Procedure to build the REPS report
                                                     progressbar1.Position := 0;
                                                     progressbar1.Hide;

                                                 // Now to determine whether the sbview or sbprint button was clicked
                                                 if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                                                    with fmReps.REPSRep do     // View Report
                                                         Begin
                                                              fmReps.REPSDetail.Font.Color := clNavy;
                                                              fmReps.RptTitle.Font.Color := clRed;
                                                              fmReps.REPSRep.Preview;
                                                         End    //EndWith
                                                 else
                                                     with fmReps.REPSRep do     // Print Report
                                                          begin
                                                               fmReps.REPSDetail.Font.Color := clBlack;
                                                               fmReps.RptTitle.Font.Color := clBlack;
                                                               fmReps.REPSRep.Print;
                                                          end;
                                            end;
                             finally
                                FreeAndNil(fmREPs);
                             end;
                       end;
                    rtLSInventory : try
                                     Application.CreateForm(TfmLiveStockInvent, fmLiveStockInvent);

                                     //   27/11/12 [V5.1 R3.2] /MK Change - Removed date validation on date change to stop errors from appearing.
                                     //                                     Moved date validation to sbViewOnClick.
                                     if FromDate.Date <= 0 then
                                        begin
                                           MessageDlg('From date must have a value.'+cCRLF+
                                                      'Resetting to first date of current year.',mtError,[mbOK],0);
                                           FromDate.Date := EnCodeDate(CurrentYear, 1, 1);
                                           Exit;
                                        end;

                                     if (FromDate.Date > Date) then
                                       begin
                                          MessageDlg('From Date cannot be after Today''s date!',mtError,[mbOK],0);
                                          FromDate.Date := Date;
                                          Exit;
                                       end;

                                     if ((ToDate.Date > 0) and (ToDate.Date < FromDate.Date)) then
                                       begin
                                          MessageDlg('To Date cannot be before From Date!',mtError,[mbOK],0);
                                          if (FromDate.Date <= Date) then
                                             ToDate.Date := FromDate.Date
                                          else
                                             ToDate.Date := Date;
                                          Exit;
                                       end;

                                     if (ToDate.Date > Date) then
                                       begin
                                          MessageDlg('To Date cannot be after Today''s date!',mtError,[mbOK],0);
                                          ToDate.Date := Date;
                                          Exit;
                                       end;

                                     if ( ToDate.Date - FromDate.Date ) > 366 then
                                        MessageDlg('Please limit the date duration of the Annual Livestock Valuations Report to One Year.', mtWarning, [mbOK], 0 )
                                     else
                                        StockCtrlRep(Sender);
                                  finally
                                     FreeAndNil(fmLiveStockInvent);
                                  end;
               end;
       end;
     finally
        if tLivestockSum <> nil then
        try
           tLivestockSum.Close;
           tLivestockSum.DeleteTable;
           tLivestockSum.Free;
        except
        end;

        if tLUDate <> nil then
        try
           tLUDate.Close;
           tLUDate.DeleteTable;
        except
        end;

        sbView.Enabled := True;
        sbPrint.Enabled := True;
     end;
end;

function TfLivestockSum.ProjFactorsTest : Integer;
begin
   //If LU Density not standard, then query if wish to continue
   if ((( StrToFloat(comboLUDensity.Text) <> StrToFloat(MinLUPH)) AND ( StrToFloat(comboLUDensity.Text) <> StrToFloat(MaxLUPH) )) AND
       ( MessageDlg('The Livestock Unit Per Hectare Factor is not valid for Year 2000. Do you wish to continue?',mtWarning,[mbYes,mbNo],0) = mrNo )) then
      Result := -1  //Do not wish to continue, return to report screen
   else
   //If LUEF not standard, then query if wish to continue
   if ((( StrToFloat(eLUEFCattle0to6mths.Text) <> 0 ) OR
        ( StrToFloat(eLUEFCattle6to12mths.Text) <> 0.6 ) OR
        ( StrToFloat(eLUEFCattle1to2yrs.Text) <> 0.6 ) OR
        ( StrToFloat(eLUEFCattle2plusyrs.Text) <> 1.0 ) OR
        ( StrToFloat(eLUEFCows2plusYrs.Text) <> 1.0 )) AND
        ( MessageDlg('The Livestock Unit Equivalent Factors are not valid for Year 2000. Do you wish to continue?',mtWarning,[mbYes,mbNo],0) = mrNo )) then
        Result := -1  //Do not wish to continue, return to screen
   else
       Result := 1;   //Proceed with report
end;

procedure TfLivestockSum.FormShow(Sender: TObject);
Var
   FarmsOpen : Boolean;
begin
   lProgBar.Hide;
   pbExten.Hide;
   lPleaseWait.Hide;
   // hide 6th date
   deExtRep6.Hide;
   deExtRep6.Text := '  /  /    ';
   lDate6.Hide;
   Edit6.Hide;
   Edit12.Hide;
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   ComboHerdChange(Sender);
   if cbYearREPS.Items.Count = 0 then
      begin
         cbYearREPS.Items.Add(FormatDateTime('yyyy',Date));           //Current year
         cbYearREPS.Items.Add(FormatDateTime('yyyy',(Date - 365)));   //Previous year
         cbYearREPS.Items.Add(FormatDateTime('yyyy',(Date - 730)));   //Two years prior
         cbYearREPS.Items.Add(FormatDateTime('yyyy',(Date - 1095)));  //Three years prior
         cbYearREPS.Items.Add(FormatDateTime('yyyy',(Date - 1460)));  //Four years prior
      end;
   eLUEFCattle0to6mths.Text := FloatToStr(WinData.LUEF0to6mths);
   eLUEFCattle6to12mths.Text := FloatToStr(WinData.LUEF6to12mths);
   eLUEFCattle1to2yrs.Text := FloatToStr(WinData.LUEF1to2yrs);
   eLUEFCattle2plusyrs.Text := FloatToStr(WinData.LUEF2plusyrs);
   eLUEFCows2plusyrs.Text := FloatToStr(WinData.LUEF2plusyrsCows);
   eLUEF0to6mths.Text := FloatToStr(WinData.LUEF0to6mths);
   eLUEF6to12mths.Text := FloatToStr(WinData.LUEF6to12mths);
   eLUEF1to2yrs.Text := FloatToStr(WinData.LUEF1to2yrs);
   eLUEF2plusyrs.Text := FloatToStr(WinData.LUEF2plusyrs);
   eLUEFDairyCows.Text := FloatToStr(WinData.LUEF2plusyrsCows);
   eLUEFSucklerCows.Text := FloatToStr(WinData.LUEFSucklerCows);
   eProjDate.Text := FormatDateTime(cIrishDateStyle, (GetEndOfMthDate(StrToInt(FormatDateTime('m',(Date + 365))), StrToInt(FormatDateTime('yyyy',(Date + 365))))));
   ceNumEwes.AsInteger := 0;
   If cbYearREPS.Text = '' then
      cbYearREPS.ItemIndex := 0;  //Current Year
   If cbMonthREPS.Text = '' then
      cbMonthREPS.ItemIndex := (StrToInt(FormatDateTime('mm',Date)) - 1);   //Selects Current Month
   If ComboLUDensity.Items.Count = 0 then
      Begin
         ComboLUDensity.Items.Add(MinLUPH);
         ComboLUDensity.Items.Add(MaxLUPH);
         ComboLUDensity.ItemIndex := 0;
      End;
   tExtDefaults.Open;
   if tExtDefaults.Locate('HerdID',ComboHerd.Value,[]) then
      begin
         ceForageArea.Value := tExtDefaults.FieldByName('ForageAreaHa').AsFloat;
         ceNumEwes.AsInteger := tExtDefaults.FieldByName('NumEwes').AsInteger;
      end;
   tExtDefaults.Close;

   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   if ( FWhichRepType = rtREPS ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cRepsRep);
         WinData.UpdateRecentReportUsage(cRepsRep);
      end
   else if ( FWhichRepType = rtLSInventory ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cLivestockInvRep);
         WinData.UpdateRecentReportUsage(cLivestockInvRep);
      end;
end;

procedure TfLivestockSum.eLUEFCattle0to6mthsChange(Sender: TObject);
begin
   WinData.LUEF0to6mths := StrToFloat(eLUEFCattle0to6mths.Text);
   eLUEF0to6mths.Text := FloatToStr(WinData.LUEF0to6mths);
end;

procedure TfLivestockSum.eLUEFCattle6to12mthsChange(Sender: TObject);
begin
   WinData.LUEF6to12mths := StrToFloat(eLUEFCattle6to12mths.Text);
   eLUEF6to12mths.Text := FloatToStr(WinData.LUEF6to12mths);
end;

procedure TfLivestockSum.eLUEFCattle1to2yrsChange(Sender: TObject);
begin
   WinData.LUEF1to2yrs := StrToFloat(eLUEFCattle1to2yrs.Text);
   eLUEF1to2yrs.Text := FloatToStr(WinData.LUEF1to2yrs);
end;

procedure TfLivestockSum.eLUEFCattle2plusYrsChange(Sender: TObject);
begin
   WinData.LUEF2plusyrs := StrToFloat(eLUEFCattle2plusyrs.Text);
   eLUEF2plusyrs.Text := FloatToStr(WinData.LUEF2plusyrs);
end;

procedure TfLivestockSum.eLUEFCows2plusYrsChange(Sender: TObject);
begin
   WinData.LUEF2plusyrsCows := StrToFloat(eLUEFCows2plusyrs.Text);
   eLUEFDairyCows.Text := FloatToStr(WinData.LUEF2plusyrsCows);
end;

procedure TfLivestockSum.eLUEF0to6mthsChange(Sender: TObject);
begin
   WinData.LUEF0to6mths := StrToFloat(eLUEF0to6mths.Text);
   eLUEFCattle0to6mths.Text := FloatToStr(WinData.LUEF0to6mths);
end;

procedure TfLivestockSum.eLUEF6to12mthsChange(Sender: TObject);
begin
   WinData.LUEF6to12mths := StrToFloat(eLUEF6to12mths.Text);
   eLUEFCattle6to12mths.Text := FloatToStr(WinData.LUEF6to12mths);
end;

procedure TfLivestockSum.eLUEF1to2yrsChange(Sender: TObject);
begin
   WinData.LUEF1to2yrs := StrToFloat(eLUEF1to2yrs.Text);
   eLUEFCattle1to2yrs.Text := FloatToStr(WinData.LUEF1to2yrs);
end;

procedure TfLivestockSum.eLUEF2plusyrsChange(Sender: TObject);
begin
   WinData.LUEF2plusyrs := StrToFloat(eLUEF2plusyrs.Text);
   eLUEFCattle2plusyrs.Text := FloatToStr(WinData.LUEF2plusyrs);
end;

procedure TfLivestockSum.eLUEFDairyCowsChange(Sender: TObject);
begin
   WinData.LUEF2plusyrsCows := StrToFloat(eLUEFDairyCows.Text);
   eLUEFCows2plusyrs.Text := FloatToStr(WinData.LUEF2plusyrsCows);
end;

procedure TfLivestockSum.eLUEFSucklerCowsChange(Sender: TObject);
begin
   WinData.LUEFSucklerCows := StrToFloat(eLUEFSucklerCows.Text);
end;

procedure TfLivestockSum.ceForageHectaresChange(Sender: TObject);
begin
   ceForageArea.Value := ceForageHectares.Value;
end;

procedure TfLivestockSum.ceForageArea2Change(Sender: TObject);
begin
   ceForageHectares.Value := ceForageArea.Value;
end;

procedure TfLivestockSum.ComboHerdChange(Sender: TObject);
Var
   ExtOpen : Boolean;
begin
   //Set Extensification Table open boolean
   ExtOpen := True;
   if (tExtDefaults.State = dsInactive) then
      begin
         tExtDefaults.Open;
         ExtOpen := False;
      end;
   tExtDefaults.First;
   if (ComboHerd.Value <> '0') then
      begin
         WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,ComboHerd.Value);
         if (WhichReg <> Ireland) then
            begin
               deExtRep6.Show;
               deExtRep6.Text := '  /  /    ';
               lDate6.Show;
               Edit6.Show;
               Edit12.Show;
               Edit7.Show;
               Edit8.Show;
               Edit9.Show;
               Edit10.Show;
               Edit11.Show;
               Edit12.Show;
               Refresh;
            end
         else
            begin
               deExtRep6.Hide;
               deExtRep6.Text := '  /  /    ';
               lDate6.Hide;
               Edit6.Hide;
               Edit12.Hide;
               Edit7.Show;
               Edit8.Show;
               Edit9.Show;
               Edit10.Show;
               Edit11.Show;
            end;

         if ((StrToInt(ComboHerd.Value) > 0) AND (tExtDefaults.Locate('HerdID',ComboHerd.Value,[]))) then
            begin
               ceForageHectares.Value := tExtDefaults.FieldByName('FHect').AsFloat;
               ceForageArea.Value     := tExtDefaults.FieldByName('ForageAreaHa').AsFloat;
               deExtRep1.Date         := tExtDefaults.FieldByName('ExtDate1').AsDateTime;
               deExtRep2.Date         := tExtDefaults.FieldByName('ExtDate2').AsDateTime;
               deExtRep3.Date         := tExtDefaults.FieldByName('ExtDate3').AsDateTime;
               deExtRep4.Date         := tExtDefaults.FieldByName('ExtDate4').AsDateTime;
               deExtRep5.Date         := tExtDefaults.FieldByName('ExtDate5').AsDateTime;
               deExtRep6.Date         := tExtDefaults.FieldByName('ExtDate6').AsDateTime;
           end
         else
            begin
               ceForageHectares.Value := 0;
               ceForageArea.Value     := 0;
               deExtRep1.Text         := '  /  /    ';
               deExtRep2.Text         := '  /  /    ';
               deExtRep3.Text         := '  /  /    ';
               deExtRep4.Text         := '  /  /    ';
               deExtRep5.Text         := '  /  /    ';
               deExtRep6.Text         := '  /  /    ';
            end;
      end
   else
      begin
         ceForageHectares.Value := 0;
         ceForageArea.Value     := 0;
         deExtRep1.Text         := FormatDateTime(cIrishDateStyle,Date);
         deExtRep2.Text         := '  /  /    ';
         deExtRep3.Text         := '  /  /    ';
         deExtRep4.Text         := '  /  /    ';
      end;
   deExtRep1Exit(Sender);
   deExtRep2Exit(Sender);
   deExtRep3Exit(Sender);
   deExtRep4Exit(Sender);
   deExtRep5Exit(Sender);
   Edit3.Text := '1';
   Edit4.Text := '1';
   Edit5.Text := '1';
   Edit6.Text := '1';
   Edit7.Text := '0.0';
   Edit8.Text := '0.0';
   Edit9.Text := '0.0';
   Edit10.Text := '0.0';
   Edit11.Text := '0.0';
   Edit12.Text := '0.0';
   if ExtOpen = False then
      tExtDefaults.Close;
end;

procedure TfLivestockSum.deExtRep1Change(Sender: TObject);
begin
   if (tExtDefaults.State = dsInactive) then
      tExtDefaults.Open;
   if (ComboHerd.Value <> '0') then
      begin
         // create record if none exists
         if NOT (tExtDefaults.Locate('HerdID',ComboHerd.Value,[])) then
            with tExtDefaults do
               begin
                  Append;
                  FieldByName('HerdID').AsInteger := StrToInt(ComboHerd.Value);
                  Post;
               end;

         // save date to tExtDefaults
         with tExtDefaults do
            begin
               Edit;
               if ((Sender as TDateEdit).Name = 'deExtRep1') then
                  FieldByName('ExtDate1').AsDateTime := deExtRep1.Date;
               if ((Sender as TDateEdit).Name = 'deExtRep2') then
                  FieldByName('ExtDate2').AsDateTime := deExtRep2.Date;
               if ((Sender as TDateEdit).Name = 'deExtRep3') then
                  FieldByName('ExtDate3').AsDateTime := deExtRep3.Date;
               if ((Sender as TDateEdit).Name = 'deExtRep4') then
                  FieldByName('ExtDate4').AsDateTime := deExtRep4.Date;
               if ((Sender as TDateEdit).Name = 'deExtRep5') then
                  FieldByName('ExtDate5').AsDateTime := deExtRep5.Date;  // SP 26/06/02
               if ((Sender as TDateEdit).Name = 'deExtRep6') then
                  FieldByName('ExtDate6').AsDateTime := deExtRep6.Date;  // SP 26/06/02
               Post;
            end
      end;
      deExtRep1Exit(Sender);
      deExtRep2Exit(Sender);
      deExtRep3Exit(Sender);
      deExtRep4Exit(Sender);
      deExtRep5Exit(Sender);
      deExtRep6Exit(Sender);
end;


procedure TfLivestockSum.sbHelpClick(Sender: TObject);
begin
   if pExtensification.Showing OR pREPS.Showing then
      WinData.HTMLHelp('extrepsrpt.htm');
end;

procedure TfLivestockSum.IniStkInvCaptions(BFClear, BirthsClear, SalesDeathClear,
                                BoughtClear, NetTransfersClear, CFClear, TotalsClear : Boolean);
begin
   with fmLiveStockInvent do
      begin //First Initialise all report variables
         //Brought Forward Column
         if BFClear then
            Begin
               CowInMilk.Caption           := '0';
               CowDry.Caption              := '0';
               BBreedBF.Caption            := '0';
               BBeefBF06Mth.Caption        := '0';
               BBeefBF612Mth.Caption       := '0';
               BBeefBF12PMth.Caption       := '0';
               Heifs06.Caption             := '0';
               Heifs12.Caption             := '0';
               Heifs18.Caption             := '0';
               Heifs24.Caption             := '0';
               HeifsOver24.Caption         := '0';
               Steers06.Caption            := '0';
               Steers12.Caption            := '0';
               Steers18.Caption            := '0';
               Steers24.Caption            := '0';
               SteersOver24.Caption        := '0';
            end;
        //Birth Column
         if BirthsClear then
            Begin
               CIMBirth.Caption            := '0';
               CDryBirth.Caption           := '0';
               BBreedBirth.Caption         := '0';
               BBeefBirth06Mth.Caption     := '0';
               BBeefBirth612Mth.Caption    := '0';
               BBeefBirth12PMth.Caption    := '0';
               H06Birth.Caption            := '0';
               H12Birth.Caption            := '0';
               H18Birth.Caption            := '0';
               H24Birth.Caption            := '0';
               HOver24Birth.Caption        := '0';
               S06Birth.Caption            := '0';
               S12Birth.Caption            := '0';
               S18Birth.Caption            := '0';
               S24Birth.Caption            := '0';
               SOver24Birth.Caption        := '0';
            end;
         //Death Column
         if SalesDeathClear then
            Begin
               CIMDeath.Caption            := '0';
               CDryDeath.Caption           := '0';
               BBreedDeath.Caption         := '0';
               BBeefDeath06Mth.Caption     := '0';
               BBeefDeath612Mth.Caption    := '0';
               BBeefDeath12PMth.Caption    := '0';
               H06Death.Caption            := '0';
               H12Death.Caption            := '0';
               H18Death.Caption            := '0';
               H24Death.Caption            := '0';
               HOver24Death.Caption        := '0';
               S06Death.Caption            := '0';
               S12Death.Caption            := '0';
               S18Death.Caption            := '0';
               S24Death.Caption            := '0';
               SOver24Death.Caption        := '0';
               //Sold Column
               CIMSale.Caption             := '0';
               CDrySale.Caption            := '0';
               BBreedSale.Caption          := '0';
               BBeefSale06Mth.Caption      := '0';
               BBeefSale612Mth.Caption     := '0';
               BBeefSale12PMth.Caption     := '0';
               H06Sale.Caption             := '0';
               H12Sale.Caption             := '0';
               H18Sale.Caption             := '0';
               H24Sale.Caption             := '0';
               HOver24Sale.Caption         := '0';
               S06Sale.Caption             := '0';
               S12Sale.Caption             := '0';
               S18Sale.Caption             := '0';
               S24Sale.Caption             := '0';
               SOver24Sale.Caption         := '0';
            end;

         //Purchased Column
         if BoughtClear then
            Begin
               CIMPurch.Caption            := '0';
               CDryPurch.Caption           := '0';
               BBreedPurch.Caption         := '0';
               BBeefPurch06Mth.Caption     := '0';
               BBeefPurch612Mth.Caption    := '0';
               BBeefPurch12PMth.Caption    := '0';
               H06Purch.Caption            := '0';
               H12Purch.Caption            := '0';
               H18Purch.Caption            := '0';
               H24Purch.Caption            := '0';
               HOver24Purch.Caption        := '0';
               S06Purch.Caption            := '0';
               S12Purch.Caption            := '0';
               S18Purch.Caption            := '0';
               S24Purch.Caption            := '0';
               SOver24Purch.Caption        := '0';
            end;

         //Transfer  Column
         if NetTransfersClear then
            Begin
               CIMTr.Caption               := '0';
               CDryTr.Caption              := '0';
               BBreedTr.Caption            := '0';
               BBeefTr06Mth.Caption        := '0';
               BBeefTr612Mth.Caption       := '0';
               BBeefTr12PMth.Caption       := '0';
               H06Tr.Caption               := '0';
               H12Tr.Caption               := '0';
               H18Tr.Caption               := '0';
               H24Tr.Caption               := '0';
               HOver24Tr.Caption           := '0';
               S06Tr.Caption               := '0';
               S12Tr.Caption               := '0';
               S18Tr.Caption               := '0';
               S24Tr.Caption               := '0';
               SOver24Tr.Caption           := '0';
            end;

         //Carried Forward Column
         if CFClear then
            Begin
               CIMCF.Caption               := '0';
               CDryCF.Caption              := '0';
               BBreedCF.Caption            := '0';
               BBeefCF06Mth.Caption        := '0';
               BBeefCF612Mth.Caption       := '0';
               BBeefCF12PMth.Caption       := '0';
               H06CF.Caption               := '0';
               H12CF.Caption               := '0';
               H18CF.Caption               := '0';
               H24CF.Caption               := '0';
               HOver24CF.Caption           := '0';
               S06CF.Caption               := '0';
               S12CF.Caption               := '0';
               S18CF.Caption               := '0';
               S24CF.Caption               := '0';
               SOver24CF.Caption           := '0';
            end;

         //Total Column
         if TotalsClear then
            Begin
               TotalBF.Caption             := '0';
               TotalCF.Caption             := '0';
               TotalPurch.Caption          := '0';
               TotalDeath.Caption          := '0';
               TotalBirth.Caption          := '0';
               TotalSale.Caption           := '0';
               TotalTr.Caption             := '0';
            end;
      end;
end;



{-------------------------------Begin livestock Invetory---------------------------------------------------------------}

{----------------------------------------------------------------------------------------------------------------------}
{ The tables have been created to make it easier to make the values of transfers easier to calculate                   }
{ Each section of the inventory report is seperated to make it easier for bug fixes                                     }
{ Joanne Tighe  CO-OP Student Feb - Aug 2002 - Redone by SP 03/2003                                                                           }
{----------------------------------------------------------------------------------------------------------------------}

// New Livestock Inventory Report - Jan'01 - KR
procedure TfLivestockSum.StockCtrlRep(Sender: TObject);
var
   ShowLactationHistoryWarning : Boolean;
   TempQuery : TQuery;

   procedure FindPurchase;
   begin
      if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([TempAnimals.FieldByName('ID').AsInteger, CPurchaseEvent]),[]) then
         TempAnimals.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
   end;

   procedure FindSaleDeath;
   begin
      if TempAnimals.FieldByName('InHerd').AsBoolean then Exit;

      if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([TempAnimals.FieldByName('ID').AsInteger, CSaleDeathEvent]),[]) then
         begin
            TempAnimals.FieldByName('LeaveDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
            if WinData.LookUpSaleDeath.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger, []) then
               TempAnimals.FieldByName('Sold').AsBoolean := WinData.LookUpSaleDeath.FieldByName('Sold').AsBoolean
            else
               TempAnimals.FieldByName('Sold').AsBoolean := True; { Assume its sold }
         end;
   end;

   procedure FindCalvingDates;
   var
      CalvingDate : TDateTime;
   begin
      TempAnimals.FieldByName('CalveDate1').Value := Null;
      TempAnimals.FieldByName('CalveDate2').Value := Null;
      if (TempAnimals.FieldByName('Sex').AsString = cSex_Female) and (TempAnimals.FieldByName('LactNo').AsInteger > 0) then
         begin
            CalvingDate := WinData.EventDataHelper.GetLastEventDate(TempAnimals.FieldByName('ID').AsInteger, CCalvingEvent, FromDate.Date);
            if ( CalvingDate > 0 ) then
               TempAnimals.FieldByName('CalveDate1').AsDateTime := CalvingDate;

            CalvingDate := WinData.EventDataHelper.GetLastEventDate(TempAnimals.FieldByName('ID').AsInteger, CCalvingEvent, ToDate.Date+1 );
            if ( CalvingDate > 0 ) then
               TempAnimals.FieldByName('CalveDate2').AsDateTime := CalvingDate;

            if (TempAnimals.FieldByName('LactNo').AsInteger <= 2) then
               begin
                  TempQuery := TQuery.Create(nil);
                  with TempQuery do
                     try
                        DatabaseName := AliasName;
                        SQL.Clear;
                        //   07/05/13 [V5.1 R7.1] /MK Bug Fix - Only run lactation check for animals that are in herd.
                        SQL.Add('SELECT E.ID EventID, A.ID AnimalID');
                        SQL.Add('FROM EVENTS E');
                        SQL.Add('LEFT JOIN Animals A ON (A.ID = E.AnimalID)');
                        SQL.Add('WHERE (E.AnimalId=:AnimalId)');
                        SQL.Add('AND (EventType=:EventType)');
                        SQL.Add('AND (A.InHerd = True)');
                        SQL.Add('AND (InHerd=True)');
                        SQL.Add('AND (AnimalDeleted=False)');
                        SQL.Add('AND (HerdId=:HerdID)');
                        Params[0].AsInteger := TempAnimals.FieldByName('Id').AsInteger;
                        Params[1].AsInteger := cCalvingEvent;
                        Params[2].AsInteger := StrToInt(ComboHerd.Value);
                        Open;
                        try
                           First;
                           if ( RecordCount > 0 ) then
                              if ( RecordCount <> TempAnimals.FieldByName('LactNo').AsInteger ) then
                                 ShowLactationHistoryWarning := True;
                        finally
                           Close;
                        end;
                     finally
                        Free;
                     end;
               end;
         end;
   end;

   procedure FindCullDate;
   var
      CulledDate : TDateTime;
   begin
      TempAnimals.FieldByName('CulledDate').Value := Null;
      CulledDate := WinData.EventDataHelper.GetLastEventDate(TempAnimals.FieldByName('ID').AsInteger, CToBeCulledEvent);
      if ( CulledDate > 0 ) then
         TempAnimals.FieldByName('CulledDate').Value := CulledDate;
   end;

var
   LSInventory : TLivestockInventory;
   fName : string;
   MCalvingDate : TDateTime;
   CalvingCount : Byte;
begin
   ShowLactationHistoryWarning := False;
   if fProgressBar <> nil then // in silent mode, create output file
      fProgressBar.Position := 0;

   try
      pbStockCtrl.Position := 0;
      InitializeLIVars;
      ClearCaptions;
      pbStockCtrl.Max   := 11;
      pbStockCtrl.Step  := 1;
      pProgress.Visible := True;
      WinData.CheckEvents.Open;
      WinData.LookUpSaleDeath.Open;

      with TempAnimals do
         begin
            TempAnimals := TTable.Create(nil);
            DatabaseName := WinData.KingData.DatabaseName;
            TableName := 'LIAnimals';

            FieldDefs.Clear;
            FieldDefs.Add('ID',ftInteger,0,False);
            FieldDefs.Add('NatIDNum',ftString,20,False);
            FieldDefs.Add('DateOfBirth',ftDate,0,False);
            FieldDefs.Add('Sex',ftString,10,False);
            FieldDefs.Add('LactNo',ftInteger,0,False);
            FieldDefs.Add('Breeding',ftBoolean,0,False);
            FieldDefs.Add('InHerd',ftBoolean,0,False);
            FieldDefs.Add('PurchDate',ftDate,0,False);
            FieldDefs.Add('LeaveDate' ,ftDate,0,False);
            FieldDefs.Add('CalveDate1',ftDate,0,False);
            FieldDefs.Add('CalveDate2',ftDate,0,False);
            FieldDefs.Add('Sold',ftBoolean,0,False);
            FieldDefs.Add('CalvingCount',ftInteger,0,False);
            FieldDefs.Add('Pedigree',ftBoolean,0,False);
            FieldDefs.Add('CulledDate',ftDate,0,False);
            CreateTable;
            Open;
         end;

      if fProgressBar = (nil) then
         pbStockCtrl.StepIt
      else
         fProgressBar.Position := fProgressBar.Position +1;

      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO "'+TempAnimals.TableName+'"                 ');
            SQL.Add(' (ID, DateOfBirth, Sex, LactNo, Breeding, InHerd, NatIDNum, Pedigree )      ');
            SQL.Add('SELECT A.ID, A.DateOfBirth, A.Sex, A.LactNo, A.Breeding,');
            SQL.Add('       A.InHerd, A.NatIDNum, A.Pedigree                            ');
            SQL.Add('FROM Animals A                                          ');
            if cbUseFilter.Checked then
               SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
            SQL.Add('WHERE (A.AnimalDeleted=False)                           ');
            SQL.Add('AND   (A.HerdID = '+ComboHerd.Value+')                  ');

            // rgEnterpriseType.ItemIndex = 0 = All Animals
            if rgEnterpriseType.ItemIndex = 1 then
               begin
                  SQL.Add('AND ( Pedigree = False                            ');
                  SQL.Add('      Or Pedigree Is Null )                       ');
               end
            else if rgEnterpriseType.ItemIndex = 2 then
               SQL.Add('AND (A.Pedigree = True)                              ');

            SQL.Add('AND NOT (A.ID IN (SELECT E.AnimalID FROM events E');
            SQL.Add('                  WHERE (E.EventDate <= "' + FormatDateTime(cUSDateStyle,FromDate.Date-1) + '")');
            SQL.Add('                  AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')))');
            ExecSQL;

            // Delete based on Inter Herd Transfers
            SQL.Clear;
            SQL.Add('DELETE FROM "'+TempAnimals.TableName+'" S');
            SQL.Add('WHERE S.ID IN');
            SQL.Add('      (SELECT DISTINCT I.AnimalID');
            SQL.Add('       FROM IHM.db I');
            SQL.Add('	 WHERE (I.NewHerdID = "' +  ComboHerd.Value + '" )');
            if FirstDate then
               SQL.Add('	 AND   (I.DateMoved > "' + FormatDateTime(cUSDateStyle,StockDate) + '"))')
            else
               SQL.Add('	 AND   (I.DateMoved > "' + FormatDateTime(cUSDateStyle,StockDate) + '"))');
            ExecSQL;
         end;

      if fProgressBar = (nil) then
         pbStockCtrl.StepIt
      else
         fProgressBar.Position := fProgressBar.Position +1;

//      FCowsWithIncompleteLactations.Close;
//      FCowsWithIncompleteLactations.EmptyTable;
//      FCowsWithIncompleteLactations.Open;

      with TempAnimals do
         begin
            First;
            while not eof do
               begin
                  Edit;
                  if FieldByName('Sex').AsString = cSex_Female then
                     begin
                        FindCalvingDates;
                        FindCullDate;
                     end;
                  FindPurchase;
                  FindSaleDeath;
                  Post;
                  Next;
               end;
         end;

      if ShowLactationHistoryWarning then
         begin
            if MessageDlg('A number of cow records have been found with incomplete lactation history.'+ cCRLF +
                          'This report can only work correctly when the calving history is present and correct for each cow.'+ cCRLFx2 +
                          'Do you want to correct these cow records now?',mtWarning,[mbYes,mbNo],0) = idYes then
               begin
                  TfmLactationConsistencyChecker.ShowForm(StrToInt(ComboHerd.Value), 2 );
                  Exit;
               end;
         end;

      if fProgressBar = (nil) then
         pbStockCtrl.StepIt
      else
         fProgressBar.Position := fProgressBar.Position +1;

      if WinData.DataForAccounts then
         begin
            ComboHerd.KeyValue := WinData.UserDefaultHerdID;
         end;
      fmLiveStockInvent.HerdID :=  ComboHerd.KeyValue;

      try
         WinData.LiveStockValues.Open;
         if WinData.LiveStockValues.Locate('HerdID', ComboHerd.KeyValue, []) then
            WinData.LiveStockValues.Edit
         else
            begin
               WinData.LiveStockValues.Append;
               WinData.LiveStockValues.FieldByName('HerdID').AsInteger := ComboHerd.KeyValue
            end;

         WinData.LiveStockValues.FieldByName('FromDate').AsDateTime := FromDate.Date;
         WinData.LiveStockValues.FieldByName('ToDate').AsDateTime := ToDate.Date;
         WinData.LiveStockValues.Post;
         WinData.LiveStockValues.Close;
      except

      end;

      with GenQuery do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT ID, NatIDNum, DateOfBirth, Sex, LactNo, ');
            SQL.Add('Breeding, CulledDate, PurchDate, LeaveDate, Sold,');
            SQL.Add('CalveDate1, CalveDate2');
            SQL.Add('FROM LIAnimals');
            Open;
            try
               // The brought forward numbers should match the stock on hand numbers for the From Date - 1 day.
               // Run as stock on hand for StockDate-1 day.

               // Example From Date 01/01/2010 - To Date 31/12/2010
               // - The brought forward column should show stock as of 31/12/2009
               // - The carried forward column should show stock as of 31/12/2010

               // - The births, deaths, sales and purchases columns should include animals with respective events
               // between and *including* brought forward and carried forward dates.

               // These changes came into effect as of 24/01/2011 V4.0 R7.8 due to
               // clarification by Nick Kearney's account.

               GetAnimals(FromDate.Date-1, ctBroughtForward);
               if fProgressBar = (nil) then
                  pbStockCtrl.StepIt
               else
                 fProgressBar.Position := fProgressBar.Position +1;

               GetAnimals(ToDate.Date, ctCarriedForward);
               if fProgressBar = (nil) then
                  pbStockCtrl.StepIt
               else
                 fProgressBar.Position := fProgressBar.Position +1;

               { Births }
               GetAnimals(ToDate.Date, ctBirths);
               if fProgressBar = (nil) then
                  pbStockCtrl.StepIt
               else
                 fProgressBar.Position := fProgressBar.Position +1;

               { Purchases }
               GetAnimals(ToDate.Date, ctPurchases);
               if fProgressBar = (nil) then
                  pbStockCtrl.StepIt
               else
                 fProgressBar.Position := fProgressBar.Position +1;

               { SalesDeaths }
               GetAnimals(ToDate.Date, ctDeaths);
               if fProgressBar = (nil) then
                  pbStockCtrl.StepIt
               else
                 fProgressBar.Position := fProgressBar.Position +1;

               { Sales }
               GetAnimals(ToDate.Date, ctSales);
               if fProgressBar = (nil) then
                  pbStockCtrl.StepIt
               else
                 fProgressBar.Position := fProgressBar.Position +1;
            finally
               Close;
            end;
         end;
      { Transfers }
      NetTransfers;
      { Totals }
      Total;
      if fProgressBar = (nil) then
         pbStockCtrl.StepIt
      else
        fProgressBar.Position := fProgressBar.Position +1;

      if Assigned(tLivestockCategoryByStockDate) then DBIForceWrite(tLivestockCategoryByStockDate);

      if not (WinData.DataForAccounts) then
         begin
            with fmLiveStockInvent do
               begin //First Initialise all report variables
                  lHerd.Caption := ComboHerd.Text;
                  LFromDate.Caption := FromDate.Text;
                  LToDate.Caption := ToDate.Text;

                  // print report
                  if ((Sender as TRxSpeedButton).Name = 'sbView') then
                     qrStockCtrl.Preview
                  else
                     qrStockCtrl.Print;
                  DFromDate := FromDate.Date;
                  DToDate   := ToDate.Date;
               end;
         end
      else
         with fmLiveStockInvent do
            begin // ouput figures to file
               LSInventory := TLivestockInventory.Create(DataDir);
               try
                   LSInventory.CowsInMilkBF := CaptionToInt(CowInMilk);
                   LSInventory.CowsDryBF := CaptionToInt(CowDry);
                   LSInventory.BreedingBullsBF := CaptionToInt(BBreedBF);
                   LSInventory.BeefBullsBF06Mth := CaptionToInt(BBeefBF06Mth);
                   LSInventory.BeefBullsBF612Mth := CaptionToInt(BBeefBF612Mth);
                   LSInventory.BeefBullsBF12PMth := CaptionToInt(BBeefBF12PMth);
                   LSInventory.Heifers06BF := CaptionToInt(Heifs06);
                   LSInventory.Heifers12BF := CaptionToInt(Heifs12);
                   LSInventory.Heifers18BF := CaptionToInt(Heifs18);
                   LSInventory.Heifers24BF := CaptionToInt(Heifs24);
                   LSInventory.Heifers24PlusBF := CaptionToInt(HeifsOver24);
                   LSInventory.Steers06BF := CaptionToInt(Steers06);
                   LSInventory.Steers12BF := CaptionToInt(Steers12);
                   LSInventory.Steers18BF := CaptionToInt(Steers18);
                   LSInventory.Steers24BF := CaptionToInt(Steers24);
                   LSInventory.Steers24PlusBF := CaptionToInt(SteersOver24);

                   LSInventory.CowsInMilkCF := CaptionToInt(CIMCF);
                   LSInventory.CowsDryCF := CaptionToInt(CDryCF);
                   LSInventory.BreedingBullsCF := CaptionToInt(BBreedCF);
                   LSInventory.BeefBullsCF06Mth := CaptionToInt(BBeefCF06Mth);
                   LSInventory.BeefBullsCF612Mth := CaptionToInt(BBeefCF612Mth);
                   LSInventory.BeefBullsCF12PMth := CaptionToInt(BBeefCF12PMth);
                   LSInventory.Heifers06CF := CaptionToInt(H06CF);
                   LSInventory.Heifers12CF := CaptionToInt(H12CF);
                   LSInventory.Heifers18CF := CaptionToInt(H18CF);
                   LSInventory.Heifers24CF := CaptionToInt(H24CF);
                   LSInventory.Heifers24PlusCF := CaptionToInt(HOver24CF);
                   LSInventory.Steers06CF := CaptionToInt(S06CF);
                   LSInventory.Steers12CF := CaptionToInt(S12CF);
                   LSInventory.Steers18CF := CaptionToInt(S18CF);
                   LSInventory.Steers24CF := CaptionToInt(S24CF);
                   LSInventory.Steers24PlusCF := CaptionToInt(SOver24CF);

                   LSInventory.StartDate := FromDate.Date;
                   LSInventory.EndDate := ToDate.Date;

                   SaveLiveStockCurrencyValues;
               finally
                  FreeAndNil(LSInventory);
               end;
            end;
   finally
      fProgressbar := nil;
      TempAnimals.Close;
      TempAnimals.DeleteTable;
      TempAnimals.Free;
      pProgress.Visible := False;
   end;
end;

function TfLivestockSum.GetAgeOfAnimal(ADateOfBirth, ACompareTo : TDateTime) : TAgeOfAnimal;
var
   Mth_6, Mth_12, Mth_18, Mth_24 : TDateTime;
begin
   { TAgeOfAnimal = (UpTo6Mths, Over6MthsUpTo12Mths, Over12MthsUpTo18Mths, Over18MthsUpTo24Mths, Over24Mths ); }
   Mth_6  := IncMonth(ACompareTo, -6);
   Mth_12 := IncMonth(ACompareTo, -12);
   Mth_18 := IncMonth(ACompareTo, -18);
   Mth_24 := IncMonth(ACompareTo, -24);

   if ( ADateOfBirth >= Mth_6 ) and ( ADateOfBirth <= ACompareTo ) then
       Result := UpTo6Mths
   else if ( ADateOfBirth >= Mth_12 ) and ( ADateOfBirth < Mth_6 ) then
       Result := Over6MthsUpTo12Mths
   else if ( ADateOfBirth >= Mth_18 ) and ( ADateOfBirth < Mth_12 ) then
       Result := Over12MthsUpTo18Mths
   else if ( ADateOfBirth >= Mth_24 ) and ( ADateOfBirth < Mth_18 ) then
       Result := Over18MthsUpTo24Mths
   else if ( ADateOfBirth < Mth_24 ) then
       Result := Over24Mths;
end;

procedure TfLivestockSum.GetAnimals(AStockDate: TDateTime; ALivestockColumnType : TLivestockColumnType);
type
   TAnimalType = (atCow, atHeifer, atSteer, atBreedingBull, atBeefBull, atUnknown, atCulledCow);
var
   nHeifer6, nHeifer12, nHeifer18, nHeifer24, nHeifer24Plus,
   nSteer6, nSteer12, nSteer18, nSteer24, nSteer24Plus,
   nBeefBull6, nBeefBull12, nBeefBullOver12, nBullBreeding,
   nCows, nCulledCows : Integer;

   AgeOfAnimal : TAgeOfAnimal;
   AnimalType : TAnimalType;

   TempFile : TextFile;
   TempText : String;

   function GetEligibleAnimalType : TAnimalType;
   begin
      Result := atUnknown;
      if (ALivestockColumnType in ([ctBroughtForward,ctCarriedForward])) then
         begin
            if ( GenQuery.FieldByName('DateOfBirth').AsDateTime > 0 ) and ( GenQuery.FieldByName('DateOfBirth').AsDateTime > AStockDate ) then
               Exit;
            if ( GenQuery.FieldByName('LeaveDate').AsDateTime > 0 ) and ( GenQuery.FieldByName('LeaveDate').AsDateTime <= AStockDate ) then
               Exit;
            if ( GenQuery.FieldByName('PurchDate').AsDateTime > 0 ) and ( GenQuery.FieldByName('PurchDate').AsDateTime > AStockDate ) then
               Exit;

            //   29/01/20 [V5.9 R2.1] /MK Change - If the HerdType is beef then the cull cows should be cows not breeding 
            //                                     for Dairy/Suckler herds it should be cows with a culling date - Tom O'Keeffe 
            if ( ((FHerdType <> htBeef) and
                  (GenQuery.FieldByName('CulledDate').AsDateTime > 0) and
                  (GenQuery.FieldByName('CulledDate').AsDateTime <= AStockDate) and
                  (GenQuery.FieldByName('Sex').AsString = 'Female') and
                  (GenQuery.FieldByName('LactNo').AsInteger > 0)) or
                 ((FHerdType = htBeef) and
                  (GenQuery.FieldByName('Sex').AsString = 'Female') and
                  (GenQuery.FieldByName('LactNo').AsInteger > 0) and
                  (not(GenQuery.FieldByName('Breeding').AsBoolean))) ) then
               Result := atCulledCow
            else if ( GenQuery.FieldByName('Sex').AsString = 'Female' ) then
               begin
                  if GenQuery.FieldByName('LactNo').AsInteger = 0 then
                     Result := atHeifer
                  else if ALivestockColumnType = ctBroughtForward then
                     begin
                        if ( GenQuery.FieldByName('CalveDate1').AsDateTime <= AStockDate ) and
                           ( GenQuery.FieldByName('CalveDate1').AsDateTime > 0 )
                        then // calving before FromDate, class as cow
                           Result := atCow
                        else if ((( GenQuery.FieldByName('CalveDate1').AsDateTime = 0 ) and
                                  ( GenQuery.FieldByName('CalveDate2').AsDateTime = 0 )) and
                                  ( GenQuery.FieldByName('LactNo').AsInteger > 1 )) then
                           Result := atCow // Animal with Lact > 0 and no calving date, assume animal was cow
                        else if ( GenQuery.FieldByName('CalveDate1').AsDateTime = 0 ) then // no calving before FromDate
                           Result := atHeifer
                        //else
                        //   ShowMessage( GenQuery.FieldByName('NatIdNum').AsString);
                     end
                  else if ALivestockColumnType = ctCarriedForward then
                     begin
                        if ( GenQuery.FieldByName('CalveDate2').AsDateTime <= AStockDate ) and
                           ( GenQuery.FieldByName('CalveDate2').AsDateTime > 0 )
                        then // calving before ToDate, class as cow
                           Result := atCow
                        else if ((( GenQuery.FieldByName('CalveDate1').AsDateTime = 0 ) and
                                  ( GenQuery.FieldByName('CalveDate2').AsDateTime = 0 )) and
                                  ( GenQuery.FieldByName('LactNo').AsInteger > 1 )) then
                           Result := atCow // Animal with Lact > 0 and no calving date, assume animal was cow
                        else if ( GenQuery.FieldByName('CalveDate2').AsDateTime = 0 ) then // no calving before FromDate
                           Result := atHeifer
                        //else
                        //   ShowMessage( GenQuery.FieldByName('NatIdNum').AsString);
                     end;
               end
            else if ( GenQuery.FieldByName('Sex').AsString = 'Steer' ) then
               Result := atSteer
            else if ( GenQuery.FieldByName('Sex').AsString = 'Bull' ) then
               begin
                  if ( GenQuery.FieldByName('Breeding').AsBoolean ) then
                     Result := atBreedingBull
                  else
                     Result := atBeefBull;
               end;
         end
      else
         begin
            if (ALivestockColumnType in ([ctBirths])) then
               begin
                  if ( GenQuery.FieldByName('PurchDate').AsDateTime > 0 ) then  Exit;

                  if (( GenQuery.FieldByName('DateOfBirth').AsDateTime < FromDate.Date ) or
                      ( GenQuery.FieldByName('DateOfBirth').AsDateTime > ToDate.Date )) then
                     Exit;
               end
            else if (ALivestockColumnType = ctDeaths) then
               begin
                  if ( GenQuery.FieldByName('LeaveDate').AsDateTime = 0 ) then  Exit;

                  if ( GenQuery.FieldByName('Sold').AsBoolean = True ) then
                     Exit;

                  if (( GenQuery.FieldByName('LeaveDate').AsDateTime < FromDate.Date ) or
                      ( GenQuery.FieldByName('LeaveDate').AsDateTime > ToDate.Date )) then
                     begin
                        Exit;
                     end;
               end
            else if (ALivestockColumnType = ctSales) then
               begin
                  if ( GenQuery.FieldByName('LeaveDate').AsDateTime = 0 ) then  Exit;

                  if ( GenQuery.FieldByName('Sold').AsBoolean = False ) then
                     Exit;

                  if (( GenQuery.FieldByName('LeaveDate').AsDateTime < FromDate.Date ) or
                      ( GenQuery.FieldByName('LeaveDate').AsDateTime > ToDate.Date )) then
                     begin
                        Exit;
                     end;
               end
            else if (ALivestockColumnType = ctPurchases) then
               begin
                  if ( GenQuery.FieldByName('PurchDate').AsDateTime <= 0 ) then  Exit;

                  if (( GenQuery.FieldByName('PurchDate').AsDateTime < FromDate.Date ) or
                      ( GenQuery.FieldByName('PurchDate').AsDateTime > ToDate.Date )) then
                     Exit;
               end;

            if ( ((FHerdType <> htBeef) and
                  (GenQuery.FieldByName('CulledDate').AsDateTime > 0) and
                  (GenQuery.FieldByName('CulledDate').AsDateTime <= AStockDate) and
                  (GenQuery.FieldByName('Sex').AsString = 'Female') and
                  (GenQuery.FieldByName('LactNo').AsInteger > 0)) or
                 ((FHerdType = htBeef) and
                  (GenQuery.FieldByName('Sex').AsString = 'Female') and
                  (GenQuery.FieldByName('LactNo').AsInteger > 0)  and
                  (not(GenQuery.FieldByName('Breeding').AsBoolean))) ) then
               Result := atCulledCow
            else if ( GenQuery.FieldByName('Sex').AsString = 'Steer' ) then
               Result := atSteer
            else if ( GenQuery.FieldByName('Sex').AsString = 'Bull' ) then
               begin
                  if ( GenQuery.FieldByName('Breeding').AsBoolean ) then
                     Result := atBreedingBull
                  else
                     Result := atBeefBull;
               end
            else if ( GenQuery.FieldByName('Sex').AsString = cSex_Female ) then
               begin
                  if (( GenQuery.FieldByName('CalveDate1').AsDateTime = 0 ) and ( GenQuery.FieldByName('CalveDate2').AsDateTime = 0 )) then
                     Result := atHeifer
                  else if ((( GenQuery.FieldByName('CalveDate1').AsDateTime <= ToDate.Date ) or
                            ( GenQuery.FieldByName('CalveDate2').AsDateTime <= ToDate.Date )) or
                            ((( GenQuery.FieldByName('CalveDate1').AsDateTime = 0 ) and
                              ( GenQuery.FieldByName('CalveDate2').AsDateTime = 0 )) and
                              ( GenQuery.FieldByName('LactNo').AsInteger > 0 ))) then
                       begin
                          Result := atCow;
                       end;
               end;
         end;
   end;

begin
   nHeifer6 := 0;
   nHeifer12 := 0;
   nHeifer18 := 0;
   nHeifer24 := 0;
   nHeifer24Plus := 0;
   nSteer6 := 0;
   nSteer12 := 0;
   nSteer18 := 0;
   nSteer24 := 0;
   nSteer24Plus := 0;
   nBeefBull6 := 0;
   nBeefBull12 := 0;
   nBeefBullOver12 := 0;
   nBullBreeding := 0;
   nCows := 0;
   nCulledCows := 0;

   GenQuery.First;
   while not GenQuery.eof do
      begin
         { TAgeOfAnimal = (UpTo6Mths, Over6MthsUpTo12Mths, Over12MthsUpTo18Mths, Over18MthsUpTo24Mths, Over24Mths ); }
         AnimalType := GetEligibleAnimalType;
         if AnimalType = atUnknown then
            begin
               // do nothing!
            end
         else if AnimalType = atCulledCow then
            begin
               Inc(nCulledCows);
               if ALivestockColumnType = ctBroughtForward then
                  begin
                     //AddToLivestockCategoryByStockDate(AStockDate, 'BF - Culled Cows', GenQuery);
                  end
               else if ALivestockColumnType = ctCarriedForward then
                  begin
                     //AddToLivestockCategoryByStockDate(AStockDate, 'CF - Culled Cows', GenQuery);
                  end;
            end
         else if AnimalType = atCow then
            begin
               Inc(nCows);
               if ALivestockColumnType = ctBroughtForward then
                  begin
                     AddToLivestockCategoryByStockDate(AStockDate, 'BF - Milking Cows', GenQuery);
                  end
               else if ALivestockColumnType = ctCarriedForward then
                  begin
                     AddToLivestockCategoryByStockDate(AStockDate, 'CF - Milking Cows', GenQuery);
                  end;
            end
         else if AnimalType = atBreedingBull then
            begin
               Inc(nBullBreeding);
               if ALivestockColumnType = ctBroughtForward then
                  begin
                     //AddToLivestockCategoryByStockDate(AStockDate, 'BF - Bull Breeding', GenQuery);
                  end
               else if ALivestockColumnType = ctCarriedForward then
                  begin
                     //AddToLivestockCategoryByStockDate(AStockDate, 'CF - Bull Breeding', GenQuery);
                  end;
            end
         else if AnimalType = atBreedingBull then
            begin
               Inc(nBullBreeding);
            end
         else
            begin
               if (ALivestockColumnType = ctBirths) then
                  // Calc the age of animal from dob, this will always be 0, therefore animal will always fall into 0-6 month category
                  AgeOfAnimal := GetAgeOfAnimal(GenQuery.FieldByName('DateOfBirth').AsDateTime, GenQuery.FieldByName('DateOfBirth').AsDateTime )
               else if (ALivestockColumnType in [ctSales,ctDeaths]) then
                  // Calc what the age of the animal is on LeaveDate
                  AgeOfAnimal := GetAgeOfAnimal(GenQuery.FieldByName('DateOfBirth').AsDateTime, GenQuery.FieldByName('LeaveDate').AsDateTime )
               else if (ALivestockColumnType in [ctSales,ctDeaths]) then
                  // Calc what the age of the animal is on PurchDate
                  AgeOfAnimal := GetAgeOfAnimal(GenQuery.FieldByName('DateOfBirth').AsDateTime, GenQuery.FieldByName('PurchDate').AsDateTime )               else
                  // Calc what the age of the animal is on StockDate.
                  AgeOfAnimal := GetAgeOfAnimal(GenQuery.FieldByName('DateOfBirth').AsDateTime, AStockDate );

               case AgeOfAnimal of
                UpTo6Mths :
                begin
                   if ( AnimalType = atHeifer ) then
                      Inc(nHeifer6)
                   else if ( AnimalType = atSteer ) then
                      begin
                      Inc(nSteer6);
                         if (ALivestockColumnType = ctBirths) then
                            AddToLivestockCategoryByStockDate(AStockDate, 'Steers 0To6', GenQuery);
                      end
                   else if ( AnimalType = atBeefBull ) then
                      Inc(nBeefBull6);
                end;
                Over6MthsUpTo12Mths :
                begin
                   if ( AnimalType = atHeifer ) then
                      Inc(nHeifer12)
                   else if ( AnimalType = atSteer ) then
                      Inc(nSteer12)
                   else if ( AnimalType = atBeefBull ) then
                      Inc(nBeefBull12);
                end;
                Over12MthsUpTo18Mths :
                begin
                   if ( AnimalType = atHeifer ) then
                      Inc(nHeifer18)
                   else if ( AnimalType = atSteer ) then
                      Inc(nSteer18)
                   else if ( AnimalType = atBeefBull ) then
                      Inc(nBeefBullOver12);
                end;
                Over18MthsUpTo24Mths :
                begin
                   if ( AnimalType = atHeifer ) then
                      Inc(nHeifer24)
                   else if ( AnimalType = atSteer ) then
                      Inc(nSteer24)
                   else if ( AnimalType = atBeefBull ) then
                      Inc(nBeefBullOver12);
                end;
                Over24Mths :
                begin
                   if ( AnimalType = atHeifer ) then
                      begin
                         Inc(nHeifer24Plus);
                      end
                   else if ( AnimalType = atSteer ) then
                      Inc(nSteer24Plus)
                   else if ( AnimalType = atBeefBull ) then
                      Inc(nBeefBullOver12);
                end;
               end;
            end;
         GenQuery.Next;
      end;

    if (ALivestockColumnType = ctBroughtForward) then
      begin
         { Heifers }
         nFromHeifer6 := nHeifer6;
         nFromHeifer12 := nHeifer12;
         nFromHeifer18 := nHeifer18;
         nFromHeifer24 := nHeifer24;
         nFromHeifer24Plus := nHeifer24Plus;
         fmLiveStockInvent.Heifs06.Caption := IntToStr(nFromHeifer6);
         fmLiveStockInvent.Heifs12.Caption := IntToStr(nFromHeifer12);
         fmLiveStockInvent.Heifs18.Caption := IntToStr(nFromHeifer18);
         fmLiveStockInvent.Heifs24.Caption := IntToStr(nFromHeifer24);
         fmLiveStockInvent.HeifsOver24.Caption := IntToStr(nFromHeifer24Plus);

         { Steers }
         nFromSteer6 := nSteer6;
         nFromSteer12 := nSteer12;
         nFromSteer18 := nSteer18;
         nFromSteer24 := nSteer24;
         nFromSteer24Plus := nSteer24Plus;
         fmLiveStockInvent.Steers06.Caption := IntToStr(nFromSteer6);
         fmLiveStockInvent.Steers12.Caption := IntToStr(nFromSteer12);
         fmLiveStockInvent.Steers18.Caption := IntToStr(nFromSteer18);
         fmLiveStockInvent.Steers24.Caption := IntToStr(nFromSteer24);
         fmLiveStockInvent.SteersOver24.Caption := IntToStr(nFromSteer24Plus);

         { Beef Bulls }
         nFromBullBeef06Mth := nBeefBull6;
         nFromBullBeef612Mth := nBeefBull12;
         nFromBullBeef12PlusMth := nBeefBullOver12;
         fmLiveStockInvent.BBeefBF06Mth.Caption := IntToStr(nFromBullBeef06Mth);
         fmLiveStockInvent.BBeefBF612Mth.Caption := IntToStr(nFromBullBeef612Mth);
         fmLiveStockInvent.BBeefBF12PMth.Caption := IntToStr(nFromBullBeef12PlusMth);

         { Breeding Bulls }
         nFromBullBreed := nBullBreeding;
         fmLiveStockInvent.BBreedBF.Caption := IntToStr(nFromBullBreed);

         { Cows Milking/Lactating }
         FromCows := nCows;
         fmLiveStockInvent.CowInMilk.Caption := IntToStr(FromCows);

         { Culled Animals }
         FromCulledAnimals := nCulledCows;
         fmLiveStockInvent.CowDry.Caption := IntToStr(FromCulledAnimals);
      end
   else if (ALivestockColumnType = ctCarriedForward) then
      begin
         { Heifers }
         nToHeifer6 := nHeifer6;
         nToHeifer12 := nHeifer12;
         nToHeifer18 := nHeifer18;
         nToHeifer24 := nHeifer24;
         nToHeifer24Plus := nHeifer24Plus;
         fmLiveStockInvent.H06CF.Caption := IntToStr(nToHeifer6);
         fmLiveStockInvent.H12CF.Caption := IntToStr(nToHeifer12);
         fmLiveStockInvent.H18CF.Caption := IntToStr(nToHeifer18);
         fmLiveStockInvent.H24CF.Caption := IntToStr(nToHeifer24);
         fmLiveStockInvent.HOver24CF.Caption := IntToStr(nToHeifer24Plus);

         { Steers }
         nToSteer6 := nSteer6;
         nToSteer12 := nSteer12;
         nToSteer18 := nSteer18;
         nToSteer24 := nSteer24;
         nToSteer24Plus := nSteer24Plus;
         fmLiveStockInvent.S06CF.Caption := IntToStr(nToSteer6);
         fmLiveStockInvent.S12CF.Caption := IntToStr(nToSteer12);
         fmLiveStockInvent.S18CF.Caption := IntToStr(nToSteer18);
         fmLiveStockInvent.S24CF.Caption := IntToStr(nToSteer24);
         fmLiveStockInvent.SOver24CF.Caption := IntToStr(nToSteer24Plus);

         { Beef Bulls }
         nToBullBeef06Mth := nBeefBull6;
         nToBullBeef612Mth := nBeefBull12;
         nToBullBeef12PlusMth := nBeefBullOver12;
         fmLiveStockInvent.BBeefCF06Mth.Caption := IntToStr(nToBullBeef06Mth);
         fmLiveStockInvent.BBeefCF612Mth.Caption := IntToStr(nToBullBeef612Mth);
         fmLiveStockInvent.BBeefCF12PMth.Caption := IntToStr(nToBullBeef12PlusMth);

         { Breeding Bulls }
         nToBullBreed := nBullBreeding;
         fmLiveStockInvent.BBreedCF.Caption := IntToStr(nToBullBreed);

         { Cows Milking/Lactating }
         ToCows := nCows;
         fmLiveStockInvent.CIMCF.Caption := IntToStr(ToCows);

         { Culled Animals }
         ToCulledAnimals := nCulledCows;
         fmLiveStockInvent.CDryCF.Caption := IntToStr(ToCulledAnimals);
      end
   else if (ALivestockColumnType = ctBirths) then
      begin
         { Heifers }
         BirthsHeifer6 := nHeifer6;
         BirthsHeifer12 := nHeifer12;
         BirthsHeifer18 := nHeifer18;
         BirthsHeifer24 := nHeifer24;
         BirthsHeifer24Plus := nHeifer24Plus;
         fmLiveStockInvent.H06Birth.Caption := IntToStr(BirthsHeifer6);
         fmLiveStockInvent.H12Birth.Caption := IntToStr(BirthsHeifer12);
         fmLiveStockInvent.H18Birth.Caption := IntToStr(BirthsHeifer18);
         fmLiveStockInvent.H24Birth.Caption := IntToStr(BirthsHeifer24);
         fmLiveStockInvent.HOver24Birth.Caption := IntToStr(BirthsHeifer24Plus);

         BirthsSteer6 := nSteer6;
         BirthsSteer12 := nSteer12;
         BirthsSteer18 := nSteer18;
         BirthsSteer24 := nSteer24;
         BirthsSteer24Plus := nSteer24Plus;
         fmLiveStockInvent.S06Birth.Caption := IntToStr(BirthsSteer6);
         fmLiveStockInvent.S12Birth.Caption := IntToStr(BirthsSteer12);
         fmLiveStockInvent.S18Birth.Caption := IntToStr(BirthsSteer18);
         fmLiveStockInvent.S24Birth.Caption := IntToStr(BirthsSteer24);
         fmLiveStockInvent.SOver24Birth.Caption := IntToStr(BirthsSteer24Plus);

         { Beef Bulls }
         BirthsBullBeef06Mth := nBeefBull6;
         BirthsBullBeef612Mth := nBeefBull12;
         BirthsBullBeef12PlusMth := nBeefBullOver12;
         fmLiveStockInvent.BBeefBirth06Mth.Caption := IntToStr(BirthsBullBeef06Mth);
         fmLiveStockInvent.BBeefBirth612Mth.Caption := IntToStr(BirthsBullBeef612Mth);
         fmLiveStockInvent.BBeefBirth12PMth.Caption := IntToStr(BirthsBullBeef12PlusMth);

         { Breeding Bulls }
         BirthsBullBreed := nBullBreeding;
         fmLiveStockInvent.BBreedBirth.Caption := IntToStr(BirthsBullBreed);

         { Cows Milking/Lactating }
         BirthsInMilk := nCows;
         fmLiveStockInvent.CIMBirth.Caption := IntToStr(BirthsInMilk);

         { Culled Animals }
         BirthsDry := nCulledCows;
         fmLiveStockInvent.CDryBirth.Caption := IntToStr(BirthsDry);
      end
   else if (ALivestockColumnType = ctDeaths) then
      begin
         { Heifers }
         DeathsHeifer6 := nHeifer6;
         fmLiveStockInvent.H06Death.Caption := IntToStr(DeathsHeifer6);
         DeathsHeifer12 := nHeifer12;
         fmLiveStockInvent.H12Death.Caption := IntToStr(DeathsHeifer12);
         DeathsHeifer18 := nHeifer18;
         fmLiveStockInvent.H18Death.Caption := IntToStr(DeathsHeifer18);
         DeathsHeifer24 := nHeifer24;
         fmLiveStockInvent.H24Death.Caption := IntToStr(DeathsHeifer24);
         DeathsHeifer24Plus := nHeifer24Plus;
         fmLiveStockInvent.HOver24Death.Caption := IntToStr(DeathsHeifer24Plus);

         { Steers }
         DeathsSteer6 := nSteer6;
         fmLiveStockInvent.S06Death.Caption := IntToStr(DeathsSteer6);
         DeathsSteer12 := nSteer12;
         fmLiveStockInvent.S12Death.Caption := IntToStr(DeathsSteer12);
         DeathsSteer18 := nSteer18;
         fmLiveStockInvent.S18Death.Caption := IntToStr(DeathsSteer18);
         DeathsSteer24 := nSteer24;
         fmLiveStockInvent.S24Death.Caption := IntToStr(DeathsSteer24);
         DeathsSteer24Plus := nSteer24Plus;
         fmLiveStockInvent.SOver24Death.Caption := IntToStr(DeathsSteer24Plus);

         { Beef Bulls }
         DeathsBullBeef06Mth :=  nBeefBull6;
         fmLiveStockInvent.BBeefDeath06Mth.Caption := IntToStr(DeathsBullBeef06Mth);
         DeathsBullBeef612Mth := nBeefBull12;
         fmLiveStockInvent.BBeefDeath612Mth.Caption := IntToStr(DeathsBullBeef612Mth);
         DeathsBullBeef12PlusMth := nBeefBullOver12;
         fmLiveStockInvent.BBeefDeath12PMth.Caption := IntToStr(DeathsBullBeef12PlusMth);

         { Breeding Bulls }
         DeathsBullBreed := nBullBreeding;
         fmLiveStockInvent.BBreedDeath.Caption := IntToStr(DeathsBullBreed);

         { Cows Milking/Lactating }
         DeathsInMilk := nCows;
         fmLiveStockInvent.CIMDeath.Caption := IntToStr(DeathsInMilk);

         { Culled Animals }
         DeathsDry := nCulledCows;
         fmLiveStockInvent.CDryDeath.Caption := IntToStr(DeathsDry);
      end
   else if (ALivestockColumnType = ctSales) then
      begin
         { Heifers }
         SoldHeifer6 := nHeifer6;
         fmLiveStockInvent.H06Sale.Caption := IntToStr(SoldHeifer6);
         SoldHeifer12 := nHeifer12;
         fmLiveStockInvent.H12Sale.Caption := IntToStr(SoldHeifer12);
         SoldHeifer18 := nHeifer18;
         fmLiveStockInvent.H18Sale.Caption := IntToStr(SoldHeifer18);
         SoldHeifer24 := nHeifer24;
         fmLiveStockInvent.H24Sale.Caption := IntToStr(SoldHeifer24);
         SoldHeifer24Plus := nHeifer24Plus;
         fmLiveStockInvent.HOver24Sale.Caption := IntToStr(SoldHeifer24Plus);

         { Steers }
         SoldSteer6 := nSteer6;
         fmLiveStockInvent.S06Sale.Caption := IntToStr(SoldSteer6);
         SoldSteer12 := nSteer12;
         fmLiveStockInvent.S12Sale.Caption := IntToStr(SoldSteer12);
         SoldSteer18 := nSteer18;
         fmLiveStockInvent.S18Sale.Caption := IntToStr(SoldSteer18);
         SoldSteer24 := nSteer24;
         fmLiveStockInvent.S24Sale.Caption := IntToStr(SoldSteer24);
         SoldSteer24Plus := nSteer24Plus;
         fmLiveStockInvent.SOver24Sale.Caption := IntToStr(SoldSteer24Plus);

         { Beef Bulls }
         SoldBullBeef06Mth := nBeefBull6;
         fmLiveStockInvent.BBeefSale06Mth.Caption := IntToStr(SoldBullBeef06Mth);
         SoldBullBeef612Mth := nBeefBull12;
         fmLiveStockInvent.BBeefSale612Mth.Caption := IntToStr(SoldBullBeef612Mth);
         SoldBullBeef12PlusMth := nBeefBullOver12;
         fmLiveStockInvent.BBeefSale12PMth.Caption := IntToStr(SoldBullBeef12PlusMth);

         { Breeding Bulls }
         SoldBullBreed := nBullBreeding;
         fmLiveStockInvent.BBreedSale.Caption := IntToStr(SoldBullBreed);

         { Cows Milking/Lactating }
         SoldInMilk := nCows;
         fmLiveStockInvent.CIMSale.Caption := IntToStr(SoldInMilk);

         { Culled Animals }
         SoldDry := nCulledCows;
         fmLiveStockInvent.CDrySale.Caption := IntToStr(SoldDry);
      end
   else if (ALivestockColumnType = ctPurchases) then
      begin
         { Heifers }
         BoughtHeifer6 := nHeifer6;
         fmLiveStockInvent.H06Purch.Caption := IntToStr(BoughtHeifer6);
         BoughtHeifer12 := nHeifer12;
         fmLiveStockInvent.H12Purch.Caption := IntToStr(BoughtHeifer12);
         BoughtHeifer18 := nHeifer18;
         fmLiveStockInvent.H18Purch.Caption := IntToStr(BoughtHeifer18);
         BoughtHeifer24 := nHeifer24;
         fmLiveStockInvent.H24Purch.Caption := IntToStr(BoughtHeifer24);
         BoughtHeifer24Plus := nHeifer24Plus;
         fmLiveStockInvent.HOver24Purch.Caption := IntToStr(BoughtHeifer24Plus);

         { Steers }
         BoughtSteer6 := nSteer6;
         fmLiveStockInvent.S06Purch.Caption := IntToStr(BoughtSteer6);
         BoughtSteer12 := nSteer12;
         fmLiveStockInvent.S12Purch.Caption := IntToStr(BoughtSteer12);
         BoughtSteer18 := nSteer18;
         fmLiveStockInvent.S18Purch.Caption := IntToStr(BoughtSteer18);
         BoughtSteer24 := nSteer24;
         fmLiveStockInvent.S24Purch.Caption := IntToStr(BoughtSteer24);
         BoughtSteer24Plus := nSteer24Plus;
         fmLiveStockInvent.SOver24Purch.Caption := IntToStr(BoughtSteer24Plus);

         { Beef Bulls }
         BoughtBullBeef06Mth := nBeefBull6;
         fmLiveStockInvent.BBeefPurch06Mth.Caption := IntToStr(BoughtBullBeef06Mth);
         BoughtBullBeef612Mth := nBeefBull12;
         fmLiveStockInvent.BBeefPurch612Mth.Caption := IntToStr(BoughtBullBeef612Mth);
         BoughtBullBeef12PlusMth := nBeefBullOver12;
         fmLiveStockInvent.BBeefPurch12PMth.Caption := IntToStr(BoughtBullBeef12PlusMth);

         { Breeding Bulls }
         BoughtBullBreed := nBullBreeding;
         fmLiveStockInvent.BBreedPurch.Caption := IntToStr(BoughtBullBreed);

         { Cows Milking/Lactating }
         BoughtInMilk := nCows;
         fmLiveStockInvent.CIMPurch.Caption := IntToStr(BoughtInMilk);

         { Culled Animals }
         BoughtDry := nCulledCows;
         fmLiveStockInvent.CDryPurch.Caption := IntToStr(BoughtDry);
      end;
end;

procedure TfLivestockSum.DeleteTableContents(TableName: String);
begin
   with GenQuery do
      begin
         Close;
         SQL.Clear;
         SQL.Add('Delete From '+TableName);
         ExecSQL;
         Application.ProcessMessages;
         Close;
         SQL.Clear;
      end;

end;

                  { --------------------------------------------Total---------------------------------------------------- }
procedure TfLivestockSum.Total;
begin
   with fmLiveStockInvent do
      begin
//         TotalCF.Caption := IntToStr(ToInMilk.RecordCount + ToDry.RecordCount + nToBullBreed + nToBullBeef06Mth + nToBullBeef612Mth + nToBullBeef12PlusMth + nToHeifer6 + nToHeifer12 + nToHeifer18 + nToHeifer24 + nToHeifer24Plus + nToSteer6 + nToSteer12 + nToSteer18 + nToSteer24 + nToSteer24Plus);
//         TotalBF.Caption := IntToStr(FromInMilk.RecordCount + FromDry.RecordCount + nFromBullBreed + nFromBullBeef06Mth + nFromBullBeef612Mth + nFromBullBeef12PlusMth + nFromHeifer6 + nFromHeifer12 + nFromHeifer18 + nFromHeifer24 + nFromHeifer24Plus + nFromSteer6 + nFromSteer12 + nFromSteer18 + nFromSteer24 + nFromSteer24Plus);

         TotalCF.Caption := IntToStr(ToCows + ToCulledAnimals + nToBullBreed + nToBullBeef06Mth + nToBullBeef612Mth + nToBullBeef12PlusMth + nToHeifer6 + nToHeifer12 + nToHeifer18 + nToHeifer24 + nToHeifer24Plus + nToSteer6 + nToSteer12 + nToSteer18 + nToSteer24 + nToSteer24Plus);
         TotalBF.Caption := IntToStr(FromCows + FromCulledAnimals + nFromBullBreed + nFromBullBeef06Mth + nFromBullBeef612Mth + nFromBullBeef12PlusMth + nFromHeifer6 + nFromHeifer12 + nFromHeifer18 + nFromHeifer24 + nFromHeifer24Plus + nFromSteer6 + nFromSteer12 + nFromSteer18 + nFromSteer24 + nFromSteer24Plus);

         TotalBirth.Caption := IntToStr(BirthsInMilk + BirthsDry + BirthsBullBeef06Mth + BirthsBullBeef612Mth + BirthsBullBeef12PlusMth + BirthsBullBreed + BirthsHeifer6 + BirthsHeifer12 + BirthsHeifer18 + BirthsHeifer24 + BirthsHeifer24Plus + BirthsSteer6 + BirthsSteer12 + BirthsSteer18 + BirthsSteer24 + BirthsSteer24Plus);
         TotalDeath.Caption := IntToStr(DeathsInMilk + DeathsDry + DeathsBullBeef06Mth + DeathsBullBeef612Mth + DeathsBullBeef12PlusMth + DeathsBullBreed + DeathsHeifer6 + DeathsHeifer12 + DeathsHeifer18 + DeathsHeifer24 + DeathsHeifer24Plus + DeathsSteer6 + DeathsSteer12 + DeathsSteer18 + DeathsSteer24 + DeathsSteer24Plus);
         TotalPurch.Caption := IntToStr(BoughtInMilk + BoughtDry + BoughtBullBeef06Mth + BoughtBullBeef612Mth + BoughtBullBeef12PlusMth + BoughtBullBreed + BoughtHeifer6 + BoughtHeifer12 + BoughtHeifer18 + BoughtHeifer24 + BoughtHeifer24Plus + BoughtSteer6 + BoughtSteer12 + BoughtSteer18 + BoughtSteer24 + BoughtSteer24Plus);
         TotalSale.Caption := IntToStr(SoldInMilk + SoldDry + SoldBullBeef06Mth + SoldBullBeef612Mth + SoldBullBeef12PlusMth + SoldBullBreed + SoldHeifer6 + SoldHeifer12 + SoldHeifer18 + SoldHeifer24 + SoldHeifer24Plus + SoldSteer6 + SoldSteer12 + SoldSteer18 + SoldSteer24 + SoldSteer24Plus);
         TotalTr.Caption := IntToStr(StrToInt(CIMTr.Caption) + StrToInt(CDryTr.Caption) + StrToInt(BBreedTr.Caption) + StrToInt(BBeefTr06Mth.Caption) + StrToInt(BBeefTr612Mth.Caption) + StrToInt(BBeefTr12PMth.Caption) + StrToInt(H06Tr.Caption) + StrToInt(H12Tr.Caption) + StrToInt(H18Tr.Caption) + StrToInt(H24Tr.Caption) + StrToInt(HOver24Tr.Caption) + StrToInt(S06Tr.Caption) + StrToInt(S12Tr.Caption) + StrToInt(S18Tr.Caption) + StrToInt(S24Tr.Caption) + StrToInt(SOver24Tr.Caption));
      end;
    pbStockCtrl.StepIt;
end;
                  { ----------------------------------------End Total------------------------------------------------ }
                  { ----------------------------------------Net Transfers------------------------------------------------ }

procedure TfLivestockSum.NetTransfers;
begin
   with fmLiveStockInvent do
      begin
         CIMTr.Caption    := IntToStr( ToCows - (FromCows + BirthsInMilk - DeathsInMilk + BoughtInMilk - SoldInMilk));
         CDryTr.Caption   := IntToStr( ToCulledAnimals - (FromCulledAnimals - DeathsDry + BirthsDry - SoldDry + BoughtDry));
         BBreedTr.Caption := IntToStr(nToBullBreed - (nFromBullBreed + BirthsBullBreed - DeathsBullBreed + BoughtBullBreed - SoldBullBreed));
         BBeefTr06Mth.Caption  := IntToStr(nToBullBeef06Mth - (nFromBullBeef06Mth + BoughtBullBeef06Mth - DeathsBullBeef06Mth + BirthsBullBeef06Mth - SoldBullBeef06Mth));
         BBeefTr612Mth.Caption  := IntToStr(nToBullBeef612Mth - (nFromBullBeef612Mth + BoughtBullBeef612Mth - DeathsBullBeef612Mth + BirthsBullBeef612Mth - SoldBullBeef612Mth));
         BBeefTr12PMth.Caption  := IntToStr(nToBullBeef12PlusMth - (nFromBullBeef12PlusMth + BoughtBullBeef12PlusMth - DeathsBullBeef12PlusMth + BirthsBullBeef12PlusMth - SoldBullBeef12PlusMth));
         H06Tr.Caption := IntToStr(nToHeifer6 - (nFromHeifer6 + BirthsHeifer6 - DeathsHeifer6 + BoughtHeifer6 - SoldHeifer6));
         H12Tr.Caption := IntToStr(nToHeifer12 - (nFromHeifer12 + BirthsHeifer12 - DeathsHeifer12 + BoughtHeifer12 - SoldHeifer12));
         H18Tr.Caption := IntToStr(nToHeifer18 - (nFromHeifer18 + BirthsHeifer18 - DeathsHeifer18 + BoughtHeifer18 - SoldHeifer18 ));
         H24Tr.Caption := IntToStr(nToHeifer24 - (nFromHeifer24 + BirthsHeifer24 - DeathsHeifer24 + BoughtHeifer24 - SoldHeifer24 ));
         HOver24Tr.Caption := IntToStr(nToHeifer24Plus - (nFromHeifer24Plus + BirthsHeifer24Plus - DeathsHeifer24Plus + BoughtHeifer24Plus - SoldHeifer24Plus ));
         S06Tr.Caption := IntToStr(nToSteer6 - (nFromSteer6 + BirthsSteer6 - DeathsSteer6 + BoughtSteer6 - SoldSteer6 ));
         S12Tr.Caption := IntToStr(nToSteer12 - (nFromSteer12 + BirthsSteer12 - DeathsSteer12 + BoughtSteer12 - SoldSteer12));
         S18Tr.Caption := IntToStr(nToSteer18 - (nFromSteer18 + BirthsSteer18 - DeathsSteer18 + BoughtSteer18 - SoldSteer18));
         S24Tr.Caption := IntToStr(nToSteer24 - (nFromSteer24 + BirthsSteer24 - DeathsSteer24 + BoughtSteer24 - SoldSteer24 ));
         SOver24Tr.Caption := IntToStr(nToSteer24Plus - (nFromSteer24Plus + BirthsSteer24Plus - DeathsSteer24Plus + BoughtSteer24Plus - SoldSteer24Plus ));
      end;
end;
                  { --------------------------------------End Net Transfers---------------------------------------------- }

                  { -----------------------------------End livestock Inventory-------------------------------------------- }
function TfLivestockSum.AgeCalc(BirthDate: TDateTime; AgeLimit: Integer): String;
var
   TempDay,
   TempMonth,
   TempYear,
   NewDay,
   NewMonth,
   NewYear : String;
begin
   // assign to variables
   TempDay   := Copy(FormatDateTime(cIrishDateStyle,BirthDate),1,2);
   TempMonth := Copy(FormatDateTime(cUSDateStyle,BirthDate),1,2);
   TempYear  := Copy(FormatDateTime('yyyy/mm/dd',BirthDate),1,4);
   // calculate new date
   if (AgeLimit = 6) then
      begin
         NewMonth := IntToStr(StrToInt(TempMonth)-6);
         if (StrToInt(NewMonth)<1) then
            begin
               NewMonth := IntToStr(StrToInt(NewMonth)+12);
               NewYear  := IntToStr(StrToInt(TempYear)-1);
            end
         else
            NewYear := TempYear;
         NewDay := CalcDay(TempDay,NewMonth,NewYear);
      end
   else if (AgeLimit = 12) then
      begin
         NewDay   := TempDay;
         NewMonth := TempMonth;
         NewYear  := IntToStr(StrToInt(TempYear)-1);
      end
   else if (AgeLimit = 18) then
      begin
         NewMonth := IntToStr(StrToInt(TempMonth)-6);
         if (StrToInt(NewMonth)<1) then
            begin
               NewMonth := IntToStr(StrToInt(NewMonth)+12);
               NewYear  := IntToStr(StrToInt(TempYear)-2);
            end
         else
            NewYear := IntToStr(StrToInt(TempYear)-1);
         NewDay := CalcDay(TempDay,NewMonth,NewYear);
      end
   else if (AgeLimit = 24) then
      begin
         NewDay   := TempDay;
         NewMonth := TempMonth;
         NewYear  := IntToStr(StrToInt(TempYear)-2);
      end;
   RESULT := (NewMonth+'/'+NewDay+'/'+NewYear);
end;

function TfLivestockSum.CalcDay(Day, Month, Year: String): String;
begin
   if (StrToInt(Day)>28) then
      begin
         if (Month = '02') then
            begin
               if ((StrToInt(Year) MOD 4)=0) then
                  RESULT := '29'
               else
                  RESULT := '28';
            end
         else if (StrToInt(Month) in [4,6,9,11]) then
            begin
               if (Day = '31') then
                  RESULT := '30'
               else
                  RESULT := Day;
            end
         else
            RESULT := Day;
      end
   else
      RESULT := Day;
end;

procedure TfLivestockSum.deExtRep1Exit(Sender: TObject);
begin
   if (deExtRep1.Date > 0) then
      begin
         if (deExtRep1.Date < Now()) then
            begin
               Edit7.Hide;
               Edit7.Text := '0.0';
            end
         else
            Edit7.Show;
      end
   else
      Edit7.Hide;
end;

procedure TfLivestockSum.deExtRep2Exit(Sender: TObject);
begin
   if (deExtRep2.Date > 0) then
      begin
         if (deExtRep2.Date < Now()) then
            begin
               Edit8.Hide;
               Edit8.Text := '0.0';
            end
         else
            Edit8.Show;
      end
   else
      Edit8.Hide;
end;

procedure TfLivestockSum.deExtRep3Exit(Sender: TObject);
begin
   if (deExtRep3.Date > 0) then
      begin
         if (deExtRep3.Date < Now()) then
            begin
               Edit9.Hide;
               Edit9.Text := '0.0';
            end
         else
            Edit9.Show;
      end
   else
      Edit9.Hide;
end;

procedure TfLivestockSum.deExtRep4Exit(Sender: TObject);
begin
   if (deExtRep4.Date > 0) then
      begin
         if (deExtRep4.Date < Now()) then
            begin
               Edit10.Hide;
               Edit10.Text := '0.0';
            end
         else
            Edit10.Show;
      end
   else
      Edit10.Hide;

end;

procedure TfLivestockSum.deExtRep5Exit(Sender: TObject);
begin
   if (deExtRep5.Date > 0) then
      begin
         if (deExtRep5.Date < Now()) then
            begin
               Edit11.Hide;
               Edit11.Text := '0.0';
            end
         else
            Edit11.Show;
      end
   else
      Edit11.Hide;

end;

procedure TfLivestockSum.deExtRep6Exit(Sender: TObject);
begin
   if (WhichReg <> Ireland) then
      begin
         if (deExtRep6.Date > 0) then
            begin
               if (deExtRep6.Date < Now()) then
                  begin
                     Edit12.Hide;
                     Edit12.Text := '0.0';
                  end
               else
                  Edit12.Show;
            end
         else
            Edit12.Hide;
      end;
end;

procedure TfLivestockSum.Edit7Exit(Sender: TObject);
begin
   if (((Sender As TEdit ).Text = '0') or (Trim((Sender As TEdit).Text) = '')  or ((Sender As TEdit ).Text = '00')) then
      (Sender As TEdit ).Text := '0.0';
end;

procedure TfLivestockSum.sbLiveStkProjClick(Sender: TObject);
begin
   if not (Sender as TrxSpeedButton).Down then
      begin
         (Sender as TrxSpeedButton).Caption := '&Extensification Simplified Scheme';
         Font.Size:=9;
         pProjection.Hide;
         ComboHerd.DisplayEmpty := 'Select Herd';
         ComboHerdChange(Sender);
         pExtensification.Top := 66;
         pExtensification.Show;
      end
   else
      begin
         (Sender as TrxSpeedButton).Caption := '&Extensification Census';
         pExtensification.Hide;
         ComboHerd.DisplayEmpty := 'Select Herd';
         pProjection.Top := 66;
         pProjection.Show;
         ceForageHectares.SetFocus;
      end;
end;

procedure TfLivestockSum.ClearCaptions;
begin
   with fmLiveStockInvent do
      begin
         CowInMilk.Caption           := '0';
         CowDry.Caption              := '0';
         BBreedBF.Caption            := '0';
         BBeefBF06Mth.Caption        := '0';
         BBeefBF612Mth.Caption       := '0';
         BBeefBF12PMth.Caption       := '0';
         Heifs06.Caption             := '0';
         Heifs12.Caption             := '0';
         Heifs18.Caption             := '0';
         Heifs24.Caption             := '0';
         HeifsOver24.Caption         := '0';
         Steers06.Caption            := '0';
         Steers12.Caption            := '0';
         Steers18.Caption            := '0';
         Steers24.Caption            := '0';
         SteersOver24.Caption        := '0';
         CIMBirth.Caption            := '0';
         CDryBirth.Caption           := '0';
         BBreedBirth.Caption         := '0';
         BBeefBirth06Mth.Caption     := '0';
         BBeefBirth612Mth.Caption    := '0';
         BBeefBirth12PMth.Caption    := '0';
         H06Birth.Caption            := '0';
         H12Birth.Caption            := '0';
         H18Birth.Caption            := '0';
         H24Birth.Caption            := '0';
         HOver24Birth.Caption        := '0';
         S06Birth.Caption            := '0';
         S12Birth.Caption            := '0';
         S18Birth.Caption            := '0';
         S24Birth.Caption            := '0';
         SOver24Birth.Caption        := '0';
         CIMDeath.Caption            := '0';
         CDryDeath.Caption           := '0';
         BBreedDeath.Caption         := '0';
         BBeefDeath06Mth.Caption     := '0';
         BBeefDeath612Mth.Caption    := '0';
         BBeefDeath12PMth.Caption    := '0';
         H06Death.Caption            := '0';
         H12Death.Caption            := '0';
         H18Death.Caption            := '0';
         H24Death.Caption            := '0';
         HOver24Death.Caption        := '0';
         S06Death.Caption            := '0';
         S12Death.Caption            := '0';
         S18Death.Caption            := '0';
         S24Death.Caption            := '0';
         SOver24Death.Caption        := '0';
         //Sold Column
         CIMSale.Caption             := '0';
         CDrySale.Caption            := '0';
         BBreedSale.Caption          := '0';
         BBeefSale06Mth.Caption      := '0';
         BBeefSale612Mth.Caption     := '0';
         BBeefSale12PMth.Caption     := '0';
         H06Sale.Caption             := '0';
         H12Sale.Caption             := '0';
         H18Sale.Caption             := '0';
         H24Sale.Caption             := '0';
         HOver24Sale.Caption         := '0';
         S06Sale.Caption             := '0';
         S12Sale.Caption             := '0';
         S18Sale.Caption             := '0';
         S24Sale.Caption             := '0';
         SOver24Sale.Caption         := '0';
         CIMPurch.Caption            := '0';
         CDryPurch.Caption           := '0';
         BBreedPurch.Caption         := '0';
         BBeefPurch06Mth.Caption     := '0';
         BBeefPurch612Mth.Caption    := '0';
         BBeefPurch12PMth.Caption    := '0';
         H06Purch.Caption            := '0';
         H12Purch.Caption            := '0';
         H18Purch.Caption            := '0';
         H24Purch.Caption            := '0';
         HOver24Purch.Caption        := '0';
         S06Purch.Caption            := '0';
         S12Purch.Caption            := '0';
         S18Purch.Caption            := '0';
         S24Purch.Caption            := '0';
         SOver24Purch.Caption        := '0';
         CIMTr.Caption               := '0';
         CDryTr.Caption              := '0';
         BBreedTr.Caption            := '0';
         BBeefTr06Mth.Caption        := '0';
         BBeefTr612Mth.Caption       := '0';
         BBeefTr12PMth.Caption       := '0';
         H06Tr.Caption               := '0';
         H12Tr.Caption               := '0';
         H18Tr.Caption               := '0';
         H24Tr.Caption               := '0';
         HOver24Tr.Caption           := '0';
         S06Tr.Caption               := '0';
         S12Tr.Caption               := '0';
         S18Tr.Caption               := '0';
         S24Tr.Caption               := '0';
         SOver24Tr.Caption           := '0';
         CIMCF.Caption               := '0';
         CDryCF.Caption              := '0';
         BBreedCF.Caption            := '0';
         BBeefCF06Mth.Caption        := '0';
         BBeefCF612Mth.Caption       := '0';
         BBeefCF12PMth.Caption       := '0';
         H06CF.Caption               := '0';
         H12CF.Caption               := '0';
         H18CF.Caption               := '0';
         H24CF.Caption               := '0';
         HOver24CF.Caption           := '0';
         S06CF.Caption               := '0';
         S12CF.Caption               := '0';
         S18CF.Caption               := '0';
         S24CF.Caption               := '0';
         SOver24CF.Caption           := '0';
         TotalBF.Caption             := '0';
         TotalCF.Caption             := '0';
         TotalPurch.Caption          := '0';
         TotalDeath.Caption          := '0';
         TotalBirth.Caption          := '0';
         TotalSale.Caption           := '0';
         TotalTr.Caption             := '0';
         BCostInMilk.Caption         := '0';
         BCostDry.Caption            := '0';
         BCostBreedBull.Caption      := '0';
         BCostBeefBull06Mth.Caption  := '0';
         BCostBeefBull612Mth.Caption := '0';
         BCostBeefBull12PMth.Caption := '0';
         BCostH6.Caption             := '0';
         BCostH12.Caption            := '0';
         BCostH18.Caption            := '0';
         BCostH24.Caption            := '0';
         BCostH24Plus.Caption        := '0';
         BCostS6.Caption             := '0';
         BCostS12.Caption            := '0';
         BCostS18.Caption            := '0';
         BCostS24.Caption            := '0';
         BCostS24Plus.Caption        := '0';
         CCostS24Plus.Caption        := '0';
         CCostS24.Caption            := '0';
         CCostS18.Caption            := '0';
         CCostS12.Caption            := '0';
         CCostS6.Caption             := '0';
         CCostH24Plus.Caption        := '0';
         CCostH24.Caption            := '0';
         CCostH18.Caption            := '0';
         CCostH12.Caption            := '0';
         CCostH6.Caption             := '0';
         CCostBeefBull06Mth.Caption  := '0';
         CCostBeefBull612Mth.Caption := '0';
         CCostBeefBull12PMth.Caption := '0';
         CCostBreedBull.Caption      := '0';
         CCostDry.Caption            := '0';
         CCostInMilk.Caption         := '0';
         CCostTotal.Caption          := '0';
         BCostTotal.Caption          := '0';
      end;
end;

procedure TfLivestockSum.btnCancelClick(Sender: TObject);
begin
   pbStockCtrl.Hide;
   pbStockCtrl.Position := 0;
   sbView.Enabled := True;
   sbPrint.Enabled := True;
   btnCancel.Visible := False;
   Abort;
end;

procedure TfLivestockSum.ceForageAreaEnter(Sender: TObject);
begin
   ceForageArea.SelectAll;
end;

procedure TfLivestockSum.ceForageAreaExit(Sender: TObject);
begin
   tExtDefaults.Open;
   if tExtDefaults.Locate('HerdID',ComboHerd.Value,[]) then
      begin
         tExtDefaults.Edit;
         tExtDefaults.FieldByName('ForageAreaHa').AsFloat := ceForageArea.Value;
         tExtDefaults.Post;
      end
   else
      MessageDlg('Cannot save defaults until a herd is selected',mtInformation,[mbOK],0);
   tExtDefaults.Close;
end;

procedure TfLivestockSum.ceNumEwesEnter(Sender: TObject);
begin
   ceNumEwes.SelectAll;
end;

procedure TfLivestockSum.ceNumEwesExit(Sender: TObject);
begin
   tExtDefaults.Open;
   if tExtDefaults.Locate('HerdID',ComboHerd.Value,[]) then
      begin
         tExtDefaults.Edit;
         tExtDefaults.FieldByName('NumEwes').AsInteger := ceNumEwes.AsInteger;
         tExtDefaults.Post;
      end
   else
      MessageDlg('Cannot save defaults until a herd is selected',mtInformation,[mbOK],0);
   tExtDefaults.Close;
end;

procedure TfLivestockSum.GenQueryAfterOpen(DataSet: TDataSet);
begin
   Application.ProcessMessages;
end;

procedure TfLivestockSum.GenQueryBeforeOpen(DataSet: TDataSet);
begin
   Application.ProcessMessages;
   GenQuery.Prepare;
end;

procedure TfLivestockSum.InitializeLIVars;
begin
    BirthsInMilk := 0; BirthsDry := 0; BirthsBullBeef06Mth := 0; BirthsBullBeef612Mth := 0; BirthsBullBeef12PlusMth := 0; BirthsHeifer6 := 0;
    BirthsHeifer12 := 0; BirthsHeifer18 := 0; BirthsHeifer24 := 0; BirthsHeifer24Plus := 0; BirthsSteer6:= 0;
    BirthsSteer12 := 0; BirthsSteer18 := 0; BirthsSteer24 := 0; BirthsSteer24Plus := 0; DeathsInMilk := 0;
    DeathsDry := 0; DeathsBullBeef06Mth := 0; DeathsBullBeef612Mth := 0; DeathsBullBeef12PlusMth := 0; DeathsBullBreed := 0; DeathsHeifer6 := 0; DeathsHeifer12 := 0; DeathsHeifer18 := 0;
    DeathsHeifer24 := 0; DeathsHeifer24Plus := 0; DeathsSteer6 := 0; DeathsSteer12 := 0; DeathsSteer18 := 0; DeathsSteer24 := 0;
    DeathsSteer24Plus := 0; BoughtInMilk := 0; BoughtDry := 0; BoughtBullBeef06Mth := 0; BoughtBullBeef612Mth := 0; BoughtBullBeef12PlusMth := 0; BoughtBullBreed := 0; BoughtHeifer6 := 0;
    BoughtHeifer12 := 0; BoughtHeifer18 := 0; BoughtHeifer24 := 0; BoughtHeifer24Plus := 0; BoughtSteer6 := 0; BoughtSteer12 := 0;
    BoughtSteer18 := 0; BoughtSteer24 := 0; BoughtSteer24Plus := 0; SoldInMilk := 0; SoldDry := 0; SoldBullBeef06Mth := 0; SoldBullBeef612Mth := 0; SoldBullBeef12PlusMth := 0; SoldBullBreed := 0;
    SoldHeifer6 := 0; SoldHeifer12 := 0; SoldHeifer18 := 0; SoldHeifer24 := 0; SoldHeifer24Plus := 0; SoldSteer6 := 0; SoldSteer12 := 0;
    SoldSteer18 := 0; SoldSteer24 := 0; SoldSteer24Plus := 0; nFromBullBeef06Mth := 0; nFromBullBeef612Mth := 0; nFromBullBeef12PlusMth := 0; nFromBullBreed := 0; nFromHeifer6 := 0; nFromHeifer12 := 0;
    nFromHeifer18 := 0; nFromHeifer24 := 0; nFromHeifer24Plus := 0; nToHeifer6 := 0; nToHeifer12 := 0; nToHeifer18 := 0; nToHeifer24 := 0;
    nToHeifer24Plus := 0; nFromSteer6 := 0; nFromSteer12 := 0; nFromSteer18 := 0; nFromSteer24 := 0; nFromSteer24Plus := 0; nToSteer6 := 0;
    nToSteer12 := 0; nToSteer18 := 0; nToSteer24 := 0; nToSteer24Plus := 0; nToBullBreed := 0; nToBullBeef06Mth := 0; nToBullBeef612Mth := 0; nToBullBeef12PlusMth := 0;
end;

procedure TfLivestockSum.PopulateTempLIAnimals;
begin
  //
end;

procedure TfLivestockSum.Edit7DblClick(Sender: TObject);
begin
   if (Sender is TEdit) then
      (Sender as TEdit).SelectAll;
end;

{ TCalfRecord }

constructor TCalfRecord.Create(ADamID: Integer; ADOB: TDateTime);
begin
  DOB := ADOB;
  DamID := ADamID;
end;


procedure TfLivestockSum.RunSilentLI(Sender: TObject);
var
   FinancialYearData : TFINANCIALYEAR;
begin
   FinancialYearData := GetFinancialYearData(WinData.UserDefaultHerdID);

//   if FinancialYearData.Year <> CurrentYear then // do not do check GL 02/06/2006
//      begin
         { Get the Start Date from Year End Period }
         { Use the Year End "Year/Month" and default start day = 1 to calc valid start period }
         DFromDate := EncodeDate( FinancialYearData.Year, FinancialYearData.Month, 1);
         { Calc From Period, DFromData + 12 months }
         DToDate := IncMonth(DFromDate, 12);
         { Subtract 1 day, will point to end of previous month}
         DToDate := DToDate - 1;
         if ( DToDate > Date ) then // if DToDate < Today default DToDate to Today.
            DToDate := Date;
//      end
//   else
//      begin
         { if in current year, take from begining of year --> today }
//         DFromDate := EncodeDate(CurrentYear, 1, 1);
//         DToDate := Date;
//      end;

   if (DToDate - DFromDate) > 366 then
      begin
         MessageDlg('Please limit the date duration of the Livestock Inventory Report to One Year.', mtWarning, [mbOK], 0 );
         Exit;
      end;

   FromDate.Date := DFromDate;
   ToDate.Date := DToDate;

   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   tLivestockSum := TTable.Create(nil);
   CreatetLivestockSum;
   Application.CreateForm(TfmLiveStockInvent, fmLiveStockInvent);

   try
      StockCtrlRep(Sender);
   finally
      fmLiveStockInvent.Free;
      tLivestockSum.Close;
      tLivestockSum.Free;
   end;

end;

procedure TfLivestockSum.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   DebugMode := False;
   if DevMachine then
      begin
         tLivestockCategoryByStockDate := CreateLivestockCategoryByStockDateTable;
         DebugMode := False;
      end;

   progressbar1.Position := 0;
   progressbar1.Hide;
{
   FCowsWithIncompleteLactations := TTable.Create(nil);
   with FCowsWithIncompleteLactations do
      begin
         DatabaseName := WinData.KingData.DatabaseName;
         TableName := 'CowsIncompLacts';

         FieldDefs.Clear;
         FieldDefs.Add('ID',ftInteger,0,False);
         FieldDefs.Add('NatIDNum',ftString,20,False);
         FieldDefs.Add('DateOfBirth',ftDate,0,False);
         FieldDefs.Add('Sex',ftString,10,False);
         FieldDefs.Add('LactNo',ftInteger,0,False);
         FieldDefs.Add('NoOfCalvings',ftInteger,0,False);
         CreateTable;
         Open;
      end;
}

end;

function TfLivestockSum.CaptionToInt(QRLabel: TQRLabel): Integer;
begin
   try
      Result := StrToInt(QRLabel.Caption);
   except
      Result := 0;
   end;
end;

procedure TfLivestockSum.btnLivestockInventValuesClick(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmLiveStockValues);
end;

procedure TfLivestockSum.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Font.Color := clBlue;
      end
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TfLivestockSum.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   if Assigned(tLivestockCategoryByStockDate) then
     begin
        tLivestockCategoryByStockDate.Close;
        tLivestockCategoryByStockDate.DeleteTable;
        FreeAndNil(tLivestockCategoryByStockDate);
     end;

 {  if Assigned(FCowsWithIncompleteLactations) then
     begin
        FCowsWithIncompleteLactations.Close;
        FreeAndNil(FCowsWithIncompleteLactations);
     end;}

end;

procedure TfLivestockSum.AddToLivestockCategoryByStockDate(AStockDate : TDateTime;
Category : string; ADataset : TDataset);
begin
      if not Assigned(tLivestockCategoryByStockDate) then exit;

      tLivestockCategoryByStockDate.Append;
      if ADataset.FindField( 'AnimalID') <> nil then
         tLivestockCategoryByStockDate.FieldByName('AnimalID').AsInteger := ADataset.FieldByName('AnimalID').AsInteger
      else if ADataset.FindField( 'ID') <> nil then
         tLivestockCategoryByStockDate.FieldByName('AnimalID').AsInteger := ADataset.FieldByName('ID').AsInteger;
      if AStockDate > 0 then
         tLivestockCategoryByStockDate.FieldByName('StockDate').AsDateTime := AStockDate;
      if ADataset.FindField( 'NatIDNum') <> nil then
        tLivestockCategoryByStockDate.FieldByName('NatIDNum').AsString := ADataset.FieldByName('NatIDNum').AsString;
      if ADataset.FindField( 'DOB') <> nil then
         tLivestockCategoryByStockDate.FieldByName('DateOfBirth').AsDateTime := ADataset.FieldByName('DOB').AsDateTime
      else if ADataset.FindField( 'DateOfBirth') <> nil then
         tLivestockCategoryByStockDate.FieldByName('DateOfBirth').AsDateTime := ADataset.FieldByName('DateOfBirth').AsDateTime;
      if ADataset.FindField( 'LactNum') <> nil then
         tLivestockCategoryByStockDate.FieldByName('LactNo').AsInteger := ADataset.FieldByName('LactNum').AsInteger
      else if ADataset.FindField( 'LactNo') <> nil then
         tLivestockCategoryByStockDate.FieldByName('LactNo').AsInteger := ADataset.FieldByName('LactNo').AsInteger;
      if ADataset.FindField( 'Sex') <> nil then
         tLivestockCategoryByStockDate.FieldByName('Sex').AsString := ADataset.FieldByName('Sex').AsString;
      if ADataset.FindField( 'PurchDate') <> nil then
         tLivestockCategoryByStockDate.FieldByName('PurchDate').AsDateTime := ADataset.FieldByName('PurchDate').AsDateTime;
      if ADataset.FindField( 'SaleDeathDate') <> nil then
         tLivestockCategoryByStockDate.FieldByName('SaleDeathDate').AsDateTime := ADataset.FieldByName('SaleDeathDate').AsDateTime
      else if ADataset.FindField( 'LeaveDate') <> nil then
         tLivestockCategoryByStockDate.FieldByName('SaleDeathDate').AsDateTime := ADataset.FieldByName('LeaveDate').AsDateTime;
      if ADataset.FindField( 'FirstCalvingDate') <> nil then
         tLivestockCategoryByStockDate.FieldByName('FirstCalvingDate').AsDateTime := ADataset.FieldByName('FirstCalvingDate').AsDateTime;
      if ADataset.FindField( 'CalveDate1') <> nil then
         tLivestockCategoryByStockDate.FieldByName('CalveDate1').AsDateTime := ADataset.FieldByName('CalveDate1').AsDateTime;
      if ADataset.FindField( 'CalveDate2') <> nil then
         tLivestockCategoryByStockDate.FieldByName('CalveDate2').AsDateTime := ADataset.FieldByName('CalveDate2').AsDateTime;

      tLivestockCategoryByStockDate.FieldByName('Category').AsString := Category;
      tLivestockCategoryByStockDate.Post;
end;

procedure TfLivestockSum.FormActivate(Sender: TObject);
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

procedure TfLivestockSum.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TfLivestockSum.cbFavouritePropertiesChange(Sender: TObject);

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
   if ( FWhichRepType = rtREPS ) then
      AddRemoveFavourite(cbFavourite.Checked,cRepsRep)
   else if ( FWhichRepType = rtLSInventory ) then
      AddRemoveFavourite(cbFavourite.Checked,cLivestockInvRep);
end;

end.
