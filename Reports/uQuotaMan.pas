{
 This unit was ported from uQuotaManagement due to curruption
 with the .dfm file.

 All links with DairyData were being lost.
 SP 20/1/2003.

 15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
}

unit uQuotaMan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RxLookup, RXCtrls, ComCtrls, ToolWin, ExtCtrls, CurrEdit,
  StdCtrls, DBCtrls, ToolEdit, RXDBCtrl, Mask, Math, QRCtrls, QuickRpt,
  QRExport, cxControls, cxContainer, cxEdit, cxCheckBox, uBreedingDataHelper;

type
  TfQuotaMan = class(TForm)
    pcQuota: TPageControl;
    tsQuotaFigures: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lLitresOrGallons: TLabel;
    Label8: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lReferenceBFat: TLabel;
    lExpectedBFat: TLabel;
    lAdjustAmount: TLabel;
    lQuotaAmount: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    dbeAnnualQuota: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    cbLitresOrGallons: TDBComboBox;
    cbAdjustBFat: TDBCheckBox;
    dbeReferenceBFat: TDBEdit;
    dbeExpectedBFat: TDBEdit;
    mAdjustBFat: TMemo;
    dbeAdjustAmount: TDBEdit;
    dbeQuotaAmount: TDBEdit;
    LastMilkDate: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    tsQuotaResults: TTabSheet;
    l1: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    l8: TLabel;
    l10: TLabel;
    lQuotaResult: TLabel;
    l2: TLabel;
    l11: TLabel;
    l13: TLabel;
    dbeQuotaToUse: TDBEdit;
    rA1: TCurrencyEdit;
    rA2: TCurrencyEdit;
    rA3: TCurrencyEdit;
    rA4: TCurrencyEdit;
    rA5: TCurrencyEdit;
    rSupplyThisYear: TCurrencyEdit;
    rA7: TCurrencyEdit;
    rQuotaResult: TCurrencyEdit;
    DBEdit13: TDBEdit;
    TotalSupply: TCurrencyEdit;
    pDoingSomething: TPanel;
    Label7: TLabel;
    DoingSomething: TProgressBar;
    rA6: TCurrencyEdit;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbPreview: TRxSpeedButton;
    sbMoreDetail: TRxSpeedButton;
    sbCullList: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    pHerd: TPanel;
    Label10: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    GenQuery: TQuery;
    dsQuotaDefaults: TDataSource;
    Label19: TLabel;
    Label21: TLabel;
    qrQuotaResults: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRSysData7: TQRSysData;
    QRSysData8: TQRSysData;
    QRShape5: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    qQuotaResults: TQuery;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel10: TQRLabel;
    l: TQRLabel;
    cbFavourite: TcxCheckBox;
    procedure sbExitClick(Sender: TObject);
    procedure cbLitresOrGallonsExit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure sbPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbMoreDetailClick(Sender: TObject);
    procedure sbCullListClick(Sender: TObject);
    procedure pcQuotaChange(Sender: TObject);
    procedure cbDefaultHerdChange(Sender: TObject);
    procedure cbAdjustBFatClick(Sender: TObject);
    procedure dbeAnnualQuotaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure LastMilkDateExit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure dbeAdjustAmountChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeReferenceBFatExit(Sender: TObject);
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure pcQuotaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure lPrint(sender: TObject; var Value: String);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    { Private declarations }
    MyQuery : TQuery;      // Used to update the Tables if new Fields need to be added.
    NoCalves  : Integer;

    A1,                 // Cull/Barren * DaysToDry * Daily Yield
    A2,                 // 1st Calvers * DaysToDry * Daily Yield
    A3,                 // Older Cows  * DaysToDry * Daily Yield
    A4,                 // 1st Calvers * DaysToMarch * Daily Yield
    A5,                 // Older Cows  * DaysToMarch * Daily Yield
    A6,                 // Sum(PriorNumOfCalves)   //KVB
    A7,                 // PriorNumOfCalves * PriorDaysFedMilk * LitreGallonsPerDay   //KVB
    A8,                 // Sum(NumOfCalves)   //KVB
    A9        : Double; // NumOfCalves * DaysFedMilk * LitreGallonsPerDay   //KVB

    FirstPass : Boolean;

    TempTable : TTable;
    QuotaTable : TTable;
    TempSource : TDataSource;
    LitresGallonsPerDay : Double;

    MilkStatementDate,                          // Today's Date

    ProjCalvingDate,
    LastCalvingDate,
    PriorCalvingDate,
    AuxCalvingDate : TDateTime;

    ProjNumOfCalves,
    LastNumOfCalves,
    PriorNumOfCalves,
    AuxNumOfCalves : SmallInt;

    LastServiceDate,
    ProjDryOffDate,
    LastDryOffDate,
    PriorDryOffDate,
    AuxDryOffDate : TDateTime;

    DryYear,
    DryMonth,
    DryDay,

    ThisYear,
    ThisMonth,
    ThisDay     : Word;

    FirstJanFieldNo,
    SecJanFieldNo,
    StopMonth,
    StartMonth  : Integer;  // FieldIndex for the 'Jan' Field

    CalvedBefore,
    Served,
    DryOff,                     //KVB
    Pregnant        : Boolean;

    Gestation       : Integer;
    Cull        : Boolean;
    StopDate,                            // CutOffDate or CullCutOffDate depending on Category of animal
    CutOffDate,                          // MarchDate.
    CullCutOffDate,                      // Lesser of CutOffDate and Cull/Sale Date
    MarchDate : TDateTime;               // This is the end of Milk Quota Year
    DaysFedMilk : Integer;
    ValidProjDate : Boolean;
    MilkDays : Double;

    FBreedingDataHelper : TBreedingDataHelper;

    procedure CreateTables;
    procedure CloseAndFree;
    procedure LoadAnimals;
    function CheckAnimal ( AnimalToSeek, LactNo : Integer ) : Boolean;
    function GetDaysLeftOrBefore ( BeforeOrLeft, DayToUse, MonthToCheck : Integer ) : Integer;
    procedure SetValuesForMonths ( FirstOrSec, StartMonth, StopMonth, EndDay, DayToUse, MonthToUse : Integer );
    procedure SeekLastService(AnimalID, LactNo : Integer);
    procedure SeekLastPD(AnimalID, LactNo : Integer);
    procedure SeekLastDryOff(AnimalID, LactNo : Integer);

    procedure SetMilkFedToCalves;
    procedure SetPriorDaysFedMilk;
    procedure SetActualDaysFedMilk;
    procedure SetPriorMilkDays;
    procedure SetActualMilkDays;
    procedure SetProduction;
    procedure ResetData;
  public
    { Public declarations }
    qDetails : TQuery;
    dsDetails : TDataSource;
  end;


Const
  FirstCalvers = 1;
  OlderCows    = 2;
  CullBarren   = 3;

  FourMonthPeriod = 120;
  DefaultGestationPeriod = 283;

procedure ShowForm;

var
  fQuotaMan: TfQuotaMan;

implementation

uses
    uQuotaSummary,
    GenTypesConst,
    DairyData, KRoutines;

const
     Msg1 = 'NOTE';
     Msg2 = 'Cows are deemed to be culls if they have been calved more than 4 months and NOT served';
     Msg3 = 'OR if they have been confirmed NOT pregnant';

{$R *.DFM}


procedure ShowForm;
begin
   try
      Application.CreateForm(TfQuotaMan, fQuotaMan);
   except
      raise ErrorMsg.Create('Unable to create Quota form, contact Kingswood');
   end;

   with fQuotaMan do
      try
         CreateTables;
         FirstPass := True;     //???
         cbAdjustBFatClick(nil); // Set the Show options for Bfat Adjustment
         ShowModal;
      finally
         CloseAndFree;
         Free;
      end;
end;

function TfQuotaMan.CheckAnimal(AnimalToSeek, LactNo: Integer): Boolean;

   function GetNumOfCalves(EventID : Integer) : Byte;
   var
      i : Byte;
   begin
      Result := 0;

      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID1,ID2,ID3,ID4 From Calvings Where EventID=:EventID');
            Params[0].AsInteger := EventID;
            Open;
            try
               First;

               for i := 1 to 4 do
                  if ( FieldByName('ID' + IntToStr(i)).AsInteger > 0 ) then
                     Inc(Result)
                  else { No more calves on and after first 0 ID }
                     Break;
            finally
               Close;
            end;
         finally
            Free;
         end;

   end;
Var
   NoDaysPreg,
   ServiceDate,
   i : Integer;  //KVB
begin
   Result := False;
   ResetData;
   // Clear the Filter                   //KVB
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;
   // This checks the animals status cull "True/False"
   //Use Lactation Number to determine whether first calver or not  //KVB
   //Need to find two calving dates (if they exist). The most recent may be a Projected Calving Date
   // Check the all Calving Records irrespective of Lactation Number
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalToSeek) + ') And (EventType = ' + IntToStr(CCalvingEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then
      begin
         CalvedBefore := TRUE;
         LastCalvingDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
         LastNumOfCalves := GetNumOfCalves(WinData.CheckEvents.FieldByName('ID').AsInteger);
         if WinData.CheckEvents.FindPrior then { Now to find the previous Calving Date }
            begin
               PriorCalvingDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               PriorNumOfCalves := GetNumOfCalves(WinData.CheckEvents.FieldByName('ID').AsInteger);

               if WinData.CheckEvents.FindPrior then { Now to find the Auxiliary Calving Date }
                  begin
                     AuxCalvingDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     AuxNumOfCalves := GetNumOfCalves(WinData.CheckEvents.FieldByName('ID').AsInteger);
                  end
               else
                  AuxCalvingDate := 0;
            end
         else
            begin
               PriorCalvingDate := 0;
               AuxCalvingDate := 0;
            end;
      end
   else
      begin // No Calving Dates Exist
         CalvedBefore := FALSE;
         LastCalvingDate := 0;
         PriorCalvingDate := 0;
         AuxCalvingDate := 0;
      end;
   //Now have 0,1,or 2 Calving Dates plus Number Of Calves for each calving
   //PriorCalvingDate < LastCalvingDate
   //Now look to for a service that is more recent than the last Calving
   //This will give a Projected Calving Date
   // Check the Last Service and compare against LastCalvingDate.
   SeekLastService(AnimalToSeek, LactNo);
   //Now have Calving dates and any post Calving Service date
   SeekLastPD(AnimalToSeek, LactNo);
   //Now to get Dry Off Dates - want up to three Dry Off Dates
   //Want Dry Off Dates irrespective of Lactation Number.
   SeekLastDryOff(AnimalToSeek, LactNo);
   //Now have Calving Dates, a post Calving Service Date and any Post Calving PD Date
   //NB:  Still need to consider Herd Dry Off date but include this date if required later
   //     to ensure that animal data is correct and does not need to be obtained again.
   //Now to determine whether animal is a Cull Animal or not.
   if ((( Served ) and ( not Pregnant )) or
       ((not Served ) and ( CalvedBefore ) and ((LastMilkDate.Date - LastCalvingDate) >= FourMonthPeriod ))) then
      Result := ( LactNo > 0 )  { Heifer cannot be cull }    // Cull Animal
   else
      Result := FALSE;   // Not Cull Animal

   { Exclude Heifers from report if not serviced or not pregnant }
   if ( LactNo = 0 ) and ( not Served ) and ( not Pregnant ) then
      begin
         TempTable.FieldByName('ExcludeFromReport').AsBoolean := True;
      end;
end;

procedure TfQuotaMan.CloseAndFree;
begin
   fQuotaMan.TempTable.Close;
   fQuotaMan.TempTable.DeleteTable;
   fQuotaMan.TempTable.Free;
   fQuotaMan.TempSource.Free;

end;

procedure TfQuotaMan.CreateTables;
begin
   with TempTable do
      try
         TempTable := TTable.Create(Nil);
         TempTable.TableName := 'QuotaTemp.db';
         TempTable.TableType := ttParadox;
         TempTable.DatabaseName := WinData.KingData.DatabaseName;
         with TempTable.FieldDefs do
            begin
               Add('ID',ftInteger,0,True);
               Add('LactNo',ftSmallInt,0,False);
               Add('Category',ftSmallInt,0,False);
               Add('AnimalNo',ftString,10,False);
               Add('PriorCalvingDate',ftDate,0,False);
               Add('LastCalvingDate',ftDate,0,False);
               Add('PriorDryingOffDate',ftDate,0,False);
               Add('DryingOffDate',ftDate,0,False);
               Add('PriorMilkDays',ftFloat,0,False);
               Add('MilkDays',ftFloat,0,False);
               Add('PriorNumOfCalves',ftSmallInt,0,False);
               Add('NumOfCalves',ftSmallInt,0,False);
               Add('PriorDaysFedMilk',ftFloat,0,False);
               Add('DaysFedMilk',ftFloat,0,False);
               Add('PriorProduction',ftFloat,0,False);
               Add('Production',ftFloat,0,False);
               Add('PriorMilkFed',ftFloat,0,False);
               Add('MilkFed',ftFloat,0,False);
               Add('TotalYield',ftFloat,0,False);
               Add('ProdJan',ftSmallInt,0,False);
               Add('ProdFeb',ftSmallInt,0,False);
               Add('ProdMar',ftSmallInt,0,False);
               Add('ProdApr',ftSmallInt,0,False);
               Add('ProdMay',ftSmallInt,0,False);
               Add('ProdJun',ftSmallInt,0,False);
               Add('ProdJul',ftSmallInt,0,False);
               Add('ProdAug',ftSmallInt,0,False);
               Add('ProdSep',ftSmallInt,0,False);
               Add('ProdOct',ftSmallInt,0,False);
               Add('ProdNov',ftSmallInt,0,False);
               Add('ProdDec',ftSmallInt,0,False);
               Add('FreshCalver',ftBoolean);
               Add('ExcludeFromReport',ftBoolean);
            end;
         with TempTable.IndexDefs do
            begin
               Add('','ID',[ixPrimary, ixUnique]);
               Add('iDryOffDate','DryingOffDate',[ixCaseInsensitive]);
               Add('iCategory','Category',[ixCaseInsensitive]);
            end;
         TempTable.CreateTable;
         TempTable.Open;
      except
         Raise ErrorMsg.CreateFmt('Unable to create temporary table %s, contact Kingswood',[TableName]);
      end;

  // now to get QuotaDefaults.db table
  QuotaTable := TTable.Create(nil);
  QuotaTable.DatabaseName := WinData.KingData.DatabaseName;
  QuotaTable.TableName := 'QuotaDefaults';
  dsQuotaDefaults.DataSet := QuotaTable;
  QuotaTable.Active       := True;
end;

function TfQuotaMan.GetDaysLeftOrBefore(BeforeOrLeft, DayToUse,
  MonthToCheck: Integer): Integer;
begin
   Case MonthToCheck of

        1,3,5,7,8,10,
        12 : if BeforeOrLeft = 1 then
                Result := 31-DayToUse
             else
                Result := 31-DayToUse;
        4,6,9,
        11 : if BeforeOrLeft = 1 then
                Result := 30-DayToUse
             else
                Result := 30-DayToUse;
        2  : {
             if BeforeOrLeft = 2 then
                Result := TodayDay-1
             else}
             if IsLeapYear ( ThisYear ) then
                ReSult := 29-DayToUse
             else
                ReSult := 28-DayToUse;
   end;
end;

procedure TfQuotaMan.LoadAnimals;
begin
     FirstPass := False;
     pDoingSomething.Show;
     pDoingSomething.Refresh;
     DoingSomething.Step := 1;

     NoCalves            := 0;
     DaysFedMilk         := QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger;
     LitresGallonsPerDay := QuotaTable.FieldByName('LitreGallonsPerDay').AsFloat;
     MilkStatementDate   := QuotaTable.FieldByName('LastMilkDate').AsDateTime ;// Date();
     DeCodeDate ( MilkStatementDate, ThisYear, ThisMonth, ThisDay );

     //Determines whether the appropriate 31st March Date is this year or next
     if ( ThisMonth In [4..12] ) then // Check if March is this or next year
        MarchDate := (StrToDate('31/03/' + IntToStr(ThisYear+1)))
     else
        MarchDate := (StrToDate('31/03/' + IntToStr(ThisYear)));

     CutOffDate := MarchDate;  //CutOffDate is now only MarchDate  KVB 21/02/2001

     if ( QuotaTable.FieldByName('ACullBarrenDate').AsDateTime < CutOffDate ) then
        begin
           if DBCheckBox1.Checked then
              CullCutOffDate := DBDateEdit2.Date
           else
              CullCutOffDate := QuotaTable.FieldByName('ACullBarrenDate').AsDateTime
        end
     else
        CullCutOffDate := CutOffDate;

     // Empty the Temporary Table
     TempTable.Close;
     TempTable.EmptyTable;
     TempTable.Open;

     //Fills TempTable with the animals
     with GenQuery do
        begin    //KVB We are assuming that LastMilkDate is today's date and is near enough not to be concerned with IHM, etc.
           SQL.Clear;
           SQL.Add('SELECT ID, AnimalNo, LactNo FROM Animals.db');
           SQL.Add('WHERE ( Sex = "Female" )');
           SQL.Add('AND   ( InHerd = TRUE )');
           SQL.Add('AND   ( AnimalDeleted = FALSE )');
           SQL.Add('AND NOT ( HerdID = ' + IntToStr(WinData.NONEHerdID) + ')');
           if cbDefaultHerd.Value <> '0' then
              SQL.Add('AND (HerdID= ' + cbDefaultHerd.Value + ')');
           Open;
           DoingSomething.Max := RecordCount;
        end;

     GenQuery.First;
     DoingSomething.StepIt;
     while not GenQuery.EOF do
        begin
           TempTable.Insert;
           TempTable.FieldByName('ExcludeFromReport').AsBoolean := False;
           TempTable.FieldByName('ID').AsInteger := GenQuery.FieldByName('ID').AsInteger;
           TempTable.FieldByName('AnimalNo').AsString := GenQuery.FieldByName('AnimalNo').AsString;
{           if TempTable.FieldByName('AnimalNo').AsString = '217' then
              begin

                  ShowMessage('217');
              end;
}
           TempTable.FieldByName('LactNo').AsInteger := GenQuery.FieldByName('LactNo').AsInteger;
           // Check for Cull, Service Dates etc
           Cull := CheckAnimal(GenQuery.FieldByName('ID').AsInteger, GenQuery.FieldByName('LactNo').AsInteger);

           if ( not Cull ) then
              begin    { Not Cull Animal - check Lactation Number }
                 case GenQuery.FieldByName('LactNo').AsInteger of
                    2..99 : TempTable.FieldByName('Category').AsInteger := OlderCows  // Category 1 Animals
                 else
                    begin
                       TempTable.FieldByName('Category').AsInteger := FirstCalvers;
                    end;
                 end;   // Category 2 Animals

                 // Now Record StopDate
                 StopDate := CutOffDate;
              end     // EndIf NOT Cull then
           else
              begin
                 TempTable.FieldByName('Category').AsInteger := CullBarren;  //Category 3 Animals - Cull/Barren Cows
                 StopDate := CullCutOffDate;
              end;
              // EndElse ( Cull )

           if ((( ProjCalvingDate > 0 ) and ( ProjCalvingDate <= MarchDate )) or    //ProjCalvingDate exists and is less than MarchDate, ie this year
               (( ProjDryOffDate > 0 ) and (ProjDryOffDate <= MarchDate ))) then      // ProjDryOffDate exists and is less than MarchDate, ie this year
              // Cull Animal and has NOT been served after last calving, ie if served then has ProjCalvingDate but does not count as animal is being Culled - probably "not taken"
              begin   // Use Projected and LastDates
                 // Input Calving Dates, DryingOff Dates and Number of Calves

                 if ProjCalvingDate > 0 then
                    begin
                       TempTable.FieldByName('LastCalvingDate').AsDateTime := ProjCalvingDate;
                       TempTable.FieldByName('PriorCalvingDate').AsDateTime := LastCalvingDate;
                    end
                 else if LastCalvingDate > 0 then
                    begin
                       TempTable.FieldByName('LastCalvingDate').AsDateTime := LastCalvingDate;
                       TempTable.FieldByName('PriorCalvingDate').AsDateTime := PriorCalvingDate;
                    end;

                 // NB Need to consider the possibility of a ProjCalvingDate being calculated based
                 // on a Service or PD but the cow still has not calved after this ProjCalvingDate. Must then
                 // take MilkStatementDate as the best estimate of the ProjCalvingDate.
{                 if (ProjCalvingDate > 0) and ( ProjCalvingDate < MilkStatementDate ) then
                    begin
                       TempTable.FieldByName('LastCalvingDate').AsDateTime := MilkStatementDate;
                       ProjCalvingDate := MilkStatementDate;
                    end
                 else
                    TempTable.FieldByName('LastCalvingDate').AsDateTime := ProjCalvingDate;}

                 //Now to use HerdDryOffDate if applicable

                 if (( QuotaTable.FieldByName('UseHerdDryOff').AsBoolean ) and
                     ( QuotaTable.FieldByName('HerdDryOffDate').AsDateTime < ProjCalvingDate ) and
                     ( QuotaTable.FieldByName('HerdDryOffDate').AsDateTime > LastCalvingDate )) then
                    begin
                       ProjDryOffDate := QuotaTable.FieldByName('HerdDryOffDate').AsDateTime;
                       TempTable.FieldByName('DryingOffDate').AsDateTime := QuotaTable.FieldByName('HerdDryOffDate').AsDateTime;
                       TempTable.FieldByName('PriorDryingOffDate').AsDateTime := LastDryOffDate;
                    end
                 else
                    begin
                       TempTable.FieldByName('DryingOffDate').AsDateTime := ProjDryOffDate;
                       TempTable.FieldByName('PriorDryingOffDate').AsDateTime := LastDryOffDate;
                    end;

                 TempTable.FieldByName('PriorDryingOffDate').AsDateTime := LastDryOffDate;
                 TempTable.FieldByName('PriorNumOfCalves').AsInteger := LastNumOfCalves;
                 TempTable.FieldByName('NumOfCalves').AsInteger := ProjNumOfCalves;

                 ValidProjDate := TRUE;    // KVB
              end
           else
              begin
                 // Use Last and Prior Dates

                 // Input Calving Dates, DryingOff Dates and Number of Calves
                 TempTable.FieldByName('LastCalvingDate').AsDateTime := LastCalvingDate;
                 TempTable.FieldByName('PriorCalvingDate').AsDateTime := PriorCalvingDate;
                 TempTable.FieldByName('PriorDryingOffDate').AsDateTime := PriorDryOffDate;

                 // Now to use HerdDryOffDate if applicable
                 if (( QuotaTable.FieldByName('UseHerdDryOff').AsBoolean ) and
                     ( QuotaTable.FieldByName('HerdDryOffDate').AsDateTime < LastCalvingDate ) and
                     ( QuotaTable.FieldByName('HerdDryOffDate').AsDateTime > PriorCalvingDate )) then
                       TempTable.FieldByName('DryingOffDate').AsDateTime := QuotaTable.FieldByName('HerdDryOffDate').AsDateTime
                 else
                    TempTable.FieldByName('DryingOffDate').AsDateTime := LastDryOffDate;

                 TempTable.FieldByName('PriorNumOfCalves').AsInteger := PriorNumOfCalves;
                 TempTable.FieldByName('NumOfCalves').AsInteger := LastNumOfCalves;

                 // Now update Last & Proj variables so that the rest of the code will work correctly.

                 ProjCalvingDate  := LastCalvingDate;
                 LastCalvingDate  := PriorCalvingDate;
                 PriorCalvingDate := AuxCalvingDate;
                 ProjDryOffDate   := LastDryOffDate;
                 LastDryOffDate   := PriorDryOffDate;
                 PriorDryOffDate  := AuxDryOffDate;
                 ProjNumOfCalves  := LastNumOfCalves;
                 LastNumOfCalves  := PriorNumOfCalves;
                 PriorNumOfCalves := AuxNumOfCalves;
                 ValidProjDate := TRUE;
              end;


           // NB: PriorDryOffDate < PriorCalvingDate < LastDryOffDate < LastCalvingDate < ProjDryOffDate < ProjCalvingDate
           // NB: LastCalvingDate : PriorDaysFedMilk // ProjCalvingDate : DaysFedMilk
           // NB: LastCalvingDate : PriorMilkDays : ProjDryOffDate < ProjCalvingDate : MilkDays

           // First input dates - need to check which two of the three sets of Dates to use
           // Now calculate the Prior Days Feed Milk

           // Now calculate the Days Feed Milk - NB Not Using CullCutOffDate as it does not matter
           // when Cull Cows are sold, their calves still need to be fed
           // NB Not CullCutOffDate as it does not matter when Cull Cows are sold, their Calves still need to be fed.
           SetPriorDaysFedMilk;
           SetActualDaysFedMilk;
           SetPriorMilkDays;
           SetActualMilkDays;
           SetMilkFedToCalves;
           SetProduction;
           TempTable.Post;
           GenQuery.Next;
           DoingSomething.Stepit;
        end;
     pDoingSomething.Hide;
end;

procedure TfQuotaMan.ResetData;
begin
   ProjCalvingDate := 0;
   LastCalvingDate := 0;
   PriorCalvingDate := 0;
   AuxCalvingDate := 0;

   ProjNumOfCalves := 0;
   LastNumOfCalves := 0;
   PriorNumOfCalves := 0;
   AuxNumOfCalves := 0;

   ProjDryOffDate := 0;
   LastDryOffDate := 0;
   PriorDryOffDate := 0;
   AuxDryOffDate := 0;
   LastServiceDate := 0;

   DryOff := False;
   Served := False;
   Pregnant := False;
   CalvedBefore := False;
   Gestation := 0;
end;

procedure TfQuotaMan.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfQuotaMan.SeekLastDryOff(AnimalID, LactNo: Integer);
begin
   with WinData.CheckEvents do
      begin
         Filter := '';
         Filtered := False;
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (EventType = ' + IntToStr(CDryOffEvent) + ')';
         WinData.CheckEvents.Filtered := True;

         if WinData.CheckEvents.FindLast then
            begin
               // Finds last Dry Off Date
               if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > LastCalvingDate) then
                  begin   // Dried Off more recently than Calved
                     DryOff := True;
                     ProjDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

                     if WinData.CheckEvents.FindPrior then
                        begin
                           LastDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                           if WinData.CheckEvents.FindPrior then
                              PriorDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                           else if ( LactNo = 3 ) then
                              PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger
                           else
                              PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                        end
                     else
                        case LactNo of // Only one Dry Off Date
                           2 : begin
                                  LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                                  PriorDryOffDate := 0;
                               end;
                           3 : begin
                                  LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                  PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                               end;
                           4 : begin
                                  LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                  PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                               end;
                        end;
                  end
               else
                  // Let DryOff date apply if there it exists, if not then use herd dry off
                  // First check to see if Herd DryOff
                  if QuotaTable.FieldByName('UseHerdDryOff').AsBoolean then
                     begin
                        case LactNo of
                           0     : ProjDryOffDate := 0;
                           1..99 : ProjDryOffDate := QuotaTable.FieldByName('HerdDryOffDate').AsDateTime;
                        end;   //EndCase LactNo of
                        // ProjDryOffDate := QuotaTable.FieldByName('HerdDryOffDate').AsDateTime;
                        if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > PriorCalvingDate ) then
                           LastDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        //Previous DryOff Date Found
                        if WinData.CheckEvents.FindPrior then
                           If ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > AuxCalvingDate ) then
                              PriorDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                     end
                  else
                     begin  // Calved More Recently than Dried Off
                        case LactNo of
                           0     : ProjDryOffDate := 0;
                           1     : ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                           2..99 : ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                        end;   //EndCase LactNo of

                        DryOff := False;
                        if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > PriorCalvingDate ) then
                           LastDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                        else
                           begin
                              case LactNo of
                                 0,1   : LastDryOffDate := 0;
                                 2     : LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                                 3..99 : LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                              end;

                              if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > AuxCalvingDate ) then
                                 PriorDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                              else
                                 case LactNo of
                                    0..2  : PriorDryOffDate := 0;
                                    3     : PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                                    4..99 : PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                 end;
                           end;

                        // Now to get previous DryOff Date
                        if WinData.CheckEvents.FindPrior then
                           begin    //Previous DryOff Date Found
                              if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > AuxCalvingDate ) then
                                 PriorDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                              else
                                 begin
                                    case LactNo of
                                       0..2  : PriorDryOffDate := 0;
                                       3     : PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                                       4..99 : PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                    end;   //EndCase LactNo of
                                 end;

                              // Now to get previous DryOff Date
                              if WinData.CheckEvents.FindPrior then
                                    AuxDryOffDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime //Previous DryOff Date Found
                              else if ( LactNo = 3 ) then
                                 AuxDryOffDate := AuxCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger
                              else
                                 AuxDryOffDate := AuxCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                           end
                        else
                           case LactNo of // Only one Dry Off Date
                              2 : begin // Cow has Calved at least once, hence LactNo >= 1
                                     PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                                     AuxDryOffDate := 0;
                                  end;
                              3 : begin
                                     PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                     AuxDryOffDate := AuxCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                                  end;
                              4 : begin
                                    PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                    AuxDryOffDate := AuxCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                                  end;
                        end;
                     end;
            end
         else
            begin  // No DryOff Events - no ProjDryOffDate
               DryOff := False;
               case LactNo Of
                  0,1 : begin    // LactNo <= 1, hence no DryOff Dates are possible yet
                           ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                           LastDryOffDate := 0;
                           PriorDryOffDate := 0;
                           AuxDryOffDate := 0;
                        end;
                  2 :  begin   // Cow has Calved twice, hence only one DryOff Date is possible
                          ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                          PriorDryOffDate := 0;
                          AuxDryOffDate := 0;
                       end;
                  3 :  begin
                          ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                          AuxDryOffDate := 0;
                       end;
                  4 :  begin
                          ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          AuxDryOffDate := AuxCalvingDate - QuotaTable.FieldByName('AFirstCalverDtoDO').AsInteger;
                       end;
                  5..
                  99 : begin
                          ProjDryOffDate := ProjCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          LastDryOffDate := LastCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          PriorDryOffDate := PriorCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                          AuxDryOffDate := AuxCalvingDate - QuotaTable.FieldByName('AOlderCowsDtoDO').AsInteger;
                       end;
               end;
            end;
      end;
end;

procedure TfQuotaMan.SeekLastPD(AnimalID, LactNo: Integer);
var
   NoDaysPreg : Integer;
   PDDate : TDateTime;
begin
   // Check for a PD Scan - want a PD Scan more recent than last calving
   with WinData.CheckEvents do
      begin
         Filter := '';
         Filtered := False;
         Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
         Filtered := True;
         if FindLast then
            begin
               If ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > LastCalvingDate ) then
                  Begin   { PD'd more recently than Calved }
                     // Now do a check to make sure that there hasnt' been a Service event
                     if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > LastServiceDate then
                        begin
                           // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
                           if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                              if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                                 begin
                                    Pregnant := TRUE;
                                    if Gestation = 0 then
                                       Gestation := 283;
                                    PDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                    if (WinData.LookUpPDs.FieldByName('NoCalves').AsInteger > 0 ) then
                                       ProjNumOfCalves := WinData.LookUpPDs.FieldByName('NoCalves').AsInteger  //KVB
                                    else
                                       ProjNumOfCalves := 1;  //Assume Pregnant with one live calf
                                    NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                                    if ( NoDaysPreg > 0 ) and ( NoDaysPreg <= 283 ) then
                                       ProjCalvingDate := PDDate + (Gestation - NoDaysPreg) // Projected Date
                                    else if ( ProjCalvingDate <= 0 ) then // if not predicted from service
                                       begin
                                          { IF NO ProjCalvingDate predicted from service, default ProjCalvingDate to PDDate + Gestation (days) }
                                          ProjCalvingDate := PDDate + Gestation; // Projected Date
                                       end;
//                                    else if ProjCalvingDate = 0 then { Can not produce a Projected Calving Date from a PD without a Number Of Days Pregnant }
  //                                     ProjCalvingDate := MilkStatementDate;   //Assume the animal calves today
//                                    ************************************
                                 end
                              else   //Not Pregnant
                                 Begin
                                    //Need to consider removing any ProjCalvingDate from a Service - may have lost calf etc.
                                    //The only way to remove a Calf due to a miscarriage is to PD as not pregnant or to
                                    //modify the only PD as Not Pregnant
                                    Pregnant := FALSE;
                                    ProjCalvingDate := 0;
                                    ProjNumOfCalves := 0;
                                 End;
                        end
                     else if LastServiceDate > LastCalvingDate then
                        Pregnant := True; // Assume it is pregnant now.
                  end;
            end; // Leave Pregant and ProjCalvingDate alone
      end;
end;

procedure TfQuotaMan.SeekLastService(AnimalID, LactNo: Integer);
begin
   with WinData.CheckEvents do
      begin
        Filter := '';
        Filtered := False;
        Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
        Filtered := True;
        if FindLast then
           begin
              if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > LastCalvingDate ) then
                 begin
                    LastServiceDate := FieldByName('EventDate').AsDateTime;
                    if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                       ProjCalvingDate := LastServiceDate + FBreedingDataHelper.GetGestation ( WinData.LookUpServices.FieldByName('ServiceBull').AsInteger )
                    else
                       ProjCalvingDate := ( LastServiceDate + DefaultGestationPeriod);
                    Served := TRUE;
                    ProjNumOfCalves := 1;
                    Pregnant        := True;
                 end
              else
                 begin
                    Served := False;
                    Pregnant := False;
                    ProjNumOfCalves := 0;
                 end;
           end;
      end
end;

procedure TfQuotaMan.SetPriorDaysFedMilk;
begin
   { Prior Days Fed Milk }
   if (( LastCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) < MilkStatementDate ) then
      TempTable.FieldByName('PriorDaysFedMilk').AsInteger := 0 { MilkStatementDate more recent than Calf Feeding }
   else if (( LastCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) < StopDate ) then
     { Calf Feeding more recent than LastMilkDate }
      TempTable.FieldByName('PriorDaysFedMilk').AsFloat := Min( (( LastCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) - MilkStatementDate ), QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger )
   else
      TempTable.FieldByName('PriorDaysFedMilk').AsFloat := Min (( StopDate - LastCalvingDate ), ( StopDate - MilkStatementDate ));

end;

procedure TfQuotaMan.SetActualDaysFedMilk;
begin
   { Days Fed Milk }
   if ( ProjCalvingDate <= StopDate ) then
      begin  // Calved before any cut off dates
         if ( ProjCalvingDate < MilkStatementDate ) then { Now to consider whether ProjCalvingDate is prior to MilkStatementDate }
            begin  { ProjCalvingDate prior to MilkStatementDate }
               if (( ProjCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) < StopDate ) then
                  begin   { DaysFedMilk ends prior to CutOffDate }
                     if (( ProjCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) < MilkStatementDate ) then
                        TempTable.FieldByName('DaysFedMilk').AsFloat := 0 { Calf Feeding stopped prior to MilkStatementDate }
                     else
                        { ProjCalvingDate before MilkStatementDate AND Calf Feeding continued after MilkStatementDate But ended before CutOffDate }
                        TempTable.FieldByName('DaysFedMilk').AsFloat := (( ProjCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) - MilkStatementDate );
                  end
               else
                  { ProjCalvingDate before MilkStatementDate AND DaysFedMilk ends after CutOffDate }
                  TempTable.FieldByName('DaysFedMilk').AsFloat := ( StopDate - MilkStatementDate );
            end
         else
            begin
               { if the Projected Calving Date < MilkStatementDate }
               if (( ProjCalvingDate + QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger ) < StopDate ) then
                  { ProjCalvingDate after to MilkStatementDate AND DaysFedMilk ends prior to CutOffDate }
                  TempTable.FieldByName('DaysFedMilk').AsFloat := QuotaTable.FieldByName('AvgDaysCalvesFed').AsInteger
               else
                  { ProjCalvingDate after to MilkStatementDate But before CutOffDate AND DaysFedMilk ends after CutOffDate }
                  TempTable.FieldByName('DaysFedMilk').AsFloat := ( StopDate - ProjCalvingDate );
            end;
      end
   else
      TempTable.FieldByName('DaysFedMilk').AsInteger := 0; { Calved after cut off dates }
end;

procedure TfQuotaMan.SetMilkFedToCalves;
begin
   // Now Calculate PriorMilkFed & MilkFed fields
   if Cull then  { Cull animals only have End Of Lactation Feeding }
      TempTable.FieldByName('MilkFed').AsFloat := ( TempTable.FieldByName('DaysFedMilk').AsFloat *
                                                    TempTable.FieldByName('NumOfCalves').AsInteger *
                                                    QuotaTable.FieldByName('LitreGallonsPerDay').AsFloat )
   else
      begin
         { Not Cull Animal - may have two lactations }
         TempTable.FieldByName('PriorMilkFed').AsFloat := ( TempTable.FieldByName('PriorDaysFedMilk').AsFloat *
                                                            TempTable.FieldByName('PriorNumOfCalves').AsInteger *
                                                            QuotaTable.FieldByName('LitreGallonsPerDay').AsFloat );
         TempTable.FieldByName('MilkFed').AsFloat := ( TempTable.FieldByName('DaysFedMilk').AsFloat *
                                                       TempTable.FieldByName('NumOfCalves').AsInteger *
                                                       QuotaTable.FieldByName('LitreGallonsPerDay').AsFloat );
      end;
end;

procedure TfQuotaMan.SetActualMilkDays;
var
   DateToUse : TDateTime;
begin

   // Now Calculate MilkDays - NO actual DryOff Date.
   // Need to use CullCutOffDate as Cull Animal stops production at that date.
   // Use StopDate.
   if ( TempTable.FieldByName('Category').AsInteger <> CullBarren ) then
      begin
         if TempTable.FieldByName('FreshCalver').AsBoolean then
            begin
               // Animal has no projected calving after statement date or before 31st date.
               // Animal is still on current lactation with no projected dates
               if ( MarchDate - MilkStatementDate > 0 ) then
                  TempTable.FieldByName('MilkDays').AsFloat := MarchDate - MilkStatementDate;
            end
         else
            begin
               DateToUse := 0;

               if ( ProjCalvingDate >= MilkStatementDate ) and ( ProjCalvingDate <= MarchDate ) then
                  DateToUse := ProjCalvingDate
               else if ( LastCalvingDate >= MilkStatementDate ) and ( LastCalvingDate <= MarchDate ) then
                  DateToUse := LastCalvingDate;
               if DateToUse <= 0 then
                  begin
                     TempTable.FieldByName('MilkDays').AsFloat := 0;
                     Exit;
                  end;

               MilkDays := ( StopDate - DateToUse );

               if  ( MilkDays > 0 ) then        //Calved animals can produce milk for over a year if not calved.
                  TempTable.FieldByName('MilkDays').AsFloat := MilkDays
               else
                  TempTable.FieldByName('MilkDays').AsFloat := 0;
            end;
      end;

end;

procedure TfQuotaMan.SetPriorMilkDays;
var
   DateToUse : TDateTime;
begin

   if TempTable.FieldByName('Category').AsInteger = CullBarren then
      begin

         if (( LastCalvingDate > 0 ) and ( ProjDryOffDate > MilkStatementDate )) or
            (( ProjCalvingDate > ProjDryOffDate ) and ( ProjCalvingDate < MilkStatementDate )) or
            (( LastCalvingDate > ProjDryOffDate ) and (LastCalvingDate < MilkStatementDate )) then
              if StopDate > MilkStatementDate then
                 TempTable.FieldByName('PriorMilkDays').AsFloat := ( StopDate - MilkStatementDate)// case of cull

      end
   else
      begin

   // Now Calculate PriorMilkDays - check actual ProjDryOffDate
//   if ( ProjDryOffDate < MilkStatementDate ) then
//         TempTable.FieldByName('PriorMilkDays').AsInteger := 0 { MilkStatementDate more recent than Drying Off }
//   else
//}

{   DateToUse := 0;

   if ( ProjCalvingDate > 0) and ( ProjCalvingDate < MilkStatementDate ) then
      DateToUse := ProjCalvingDate;

   if ( LastCalvingDate > 0) and  ( LastCalvingDate < MilkStatementDate ) then
      DateToUse := LastCalvingDate;

   if DateToUse <= 0 then
      begin
         TempTable.FieldByName('PriorMilkDays').AsFloat := 0;
         Exit;
      end;

   if DateToUse > LastCalvingDate then
      TempTable.FieldByName('PriorMilkDays').AsFloat := ( MarchDate - MilkStatementDate)
   else
      begin
         if ProjDryOffDate < MarchDate then
            if ProjDryOffDate > MilkStatementDate then // has produced some milk after Milk Statement Date.
            TempTable.FieldByName('PriorMilkDays').AsFloat := ProjDryOffDate - MilkStatementDate;
      end;
   }
       If ( ProjCalvingDate > 0 ) and ( ProjDryOffDate > 0 ) then
          begin
             If ( ProjCalvingDate < MilkStatementDate ) and ( ProjDryOffDate < MilkStatementDate ) then
                 Begin
                     // Animal has no projected calving after statement date or before 31st date.
                     // Animal is still on current lactation with no projected dates
                    If ProjCalvingDate > ProjDryOffDate then
                       Begin
                          TempTable.FieldByName('FreshCalver').AsBoolean := TRUE;
                          Exit;
                       End;
                 End
             else If ( LastCalvingDate > 0 ) then
                begin
                   If ( LastCalvingDate < MilkStatementDate ) and ( LastDryOffDate < MilkStatementDate ) then
                       Begin
                          //   Animal has no last calving after statement date or before 31st date.
                          // ok what happens if Last Calving is before Statementdate and ProjDryOff > Std and < 31st
                          If LastCalvingDate > LastDryOffDate then
                              Begin
                                 if ( ProjDryOffDate > 0 ) and ( ProjDryOffDate > MilkStatementDate ) and ( ProjDryOffDate < MarchDate ) then
                                 // ProjDryOffDate must be the cutoff date.
                                    begin
                                       TempTable.FieldByName('PriorMilkDays').AsFloat := ProjDryOffDate - MilkStatementDate;
                                    end
                                 else if ( ProjDryOffDate > 0 ) and ( ProjDryOffDate > MarchDate ) then
                                    // MarchDate must be the cutoff date.
                                    TempTable.FieldByName('PriorMilkDays').AsFloat := MarchDate - MilkStatementDate;

                              End;
                       end
                end;
          End
       else If ( LastCalvingDate > 0 ) and ( LastDryOffDate > 0 ) then
          Begin
             If ( LastCalvingDate < MilkStatementDate ) and ( LastDryOffDate < MilkStatementDate ) then
                 Begin
                    //   Animal has no last calving after statement date or before 31st date.
                    If LastCalvingDate > LastDryOffDate then
                        Begin
                           TempTable.FieldByName('PriorMilkDays').AsFloat := MarchDate - MilkStatementDate;
                        End;
                 End
          End;
      End;
end;

procedure TfQuotaMan.SetProduction;
begin
   // Now Calculate PriorProduction & Production fields
   if Cull then { Cull animals only have End Of Lactation Feeding }
      TempTable.FieldByName('PriorProduction').AsFloat := ( TempTable.FieldByName('PriorMilkDays').AsFloat *
                                                       QuotaTable.FieldByName('ACullBarrenDY').AsFloat )
   else
      { Not Cull Animal - may have two lactations - need to consider Lactation Number }
      Case TempTable.FieldByName('LactNo').AsInteger Of
         0     : begin
                    TempTable.FieldByName('PriorProduction').AsFloat := 0;
                    TempTable.FieldByName('Production').AsFloat := ( TempTable.FieldByName('MilkDays').AsFloat * QuotaTable.FieldByName('BFirstCalverDY').AsFloat );
                 end;
         1     : begin
                    TempTable.FieldByName('PriorProduction').AsFloat := ( TempTable.FieldByName('PriorMilkDays').AsFloat * QuotaTable.FieldByName('AFirstCalverDY').AsFloat );
                    TempTable.FieldByName('Production').AsFloat := ( TempTable.FieldByName('MilkDays').AsFloat * QuotaTable.FieldByName('BOlderCowsDY').AsFloat );
                 end;
         2     : begin
                    TempTable.FieldByName('PriorProduction').AsFloat := ( TempTable.FieldByName('PriorMilkDays').AsFloat * QuotaTable.FieldByName('AOlderCowsDY').AsFloat );
                    TempTable.FieldByName('Production').AsFloat := ( TempTable.FieldByName('MilkDays').AsFloat * QuotaTable.FieldByName('BOlderCowsDY').AsFloat );
                 end;
         3..99 : begin
                    TempTable.FieldByName('PriorProduction').AsFloat := ( TempTable.FieldByName('PriorMilkDays').AsFloat * QuotaTable.FieldByName('AOlderCowsDY').AsFloat );
                    TempTable.FieldByName('Production').AsFloat := ( TempTable.FieldByName('MilkDays').AsFloat * QuotaTable.FieldByName('BOlderCowsDY').AsFloat );
                 end;
         end;

   //Now Calculate Total Milk Yield for this Cow
   TempTable.FieldByName('TotalYield').AsFloat := (( TempTable.FieldByName('PriorProduction').AsFloat +
                                                     TempTable.FieldByName('Production').AsFloat ) -
                                                   ( TempTable.FieldByName('PriorMilkFed').AsFloat +
                                                     TempTable.FieldByName('MilkFed').AsFloat ));
end;

procedure TfQuotaMan.dbeAnnualQuotaChange(Sender: TObject);
begin
   if (Sender as TDBEdit).Field.DataSet.Active then
      begin
         if NOT ( QuotaTable.State In [dsEdit, dsInsert] ) then
           QuotaTable.Edit;
         if cbAdjustBFat.Field.AsBoolean then
            dbeReferenceBFatExit(Sender);
      end;
end;

procedure TfQuotaMan.SetValuesForMonths(FirstOrSec, StartMonth, StopMonth,
  EndDay, DayToUse, MonthToUse: Integer);
Var
   NoDays,
   i,
   Start,
   Stop : Integer;
   UseArray : packed array [1..12] of Boolean;
begin    //KVB Do not know what this procedure is for.
   FillChar ( UseArray, SizeOf(UseArray),False );
   Start := StartMonth;
   Stop  := StopMonth;
 if Start > Stop then
      begin
         for i := Start To 12 do
           UseArray[i] := True;
         for i := 1 to Stop do
           UseArray[i] := True;
      end
   else
      for i := Start To Stop do
         UseArray[i] := True;

   for i := 1 to 12 do
      if UseArray[i] then
         begin
            if ( Start = Stop ) And ( FirstOrSec = 1 ) then
               NoDays := EndDay
            else if ( Start = Stop ) And ( FirstOrSec = 2 ) then
               NoDays := EndDay-DayToUse
            else if ( i = MonthToUse ) And ( FirstOrSec = 1 ) then
               NoDays := GetDaysLeftOrBefore ( 2,DayToUse, i )
            else if i = StopMonth then
               NoDays := EndDay
            else if ( i = Start ) And ( FirstOrSec = 2 ) then
               NoDays := GetDaysLeftOrBefore ( 2, DayToUse, i )
            else
               NoDays := GetDaysLeftOrBefore ( 1, 0, i );
            if FirstOrSec = 1 then
             //  TempTable.Fields[FirstJanFieldNo+i-1].AsInteger := TempTable.Fields[FirstJanFieldNo+i-1].AsInteger + NoDays
            else
              // TempTable.Fields[SecJanFieldNo+i-1].AsInteger := TempTable.Fields[SecJanFieldNo+i-1].AsInteger + NoDays;
         end;

end;

procedure TfQuotaMan.cbDefaultHerdChange(Sender: TObject);
begin
   FirstPass := True; { Set FirstPass to take account of Change }
end;

procedure TfQuotaMan.cbAdjustBFatClick(Sender: TObject);
begin
   if ( cbAdjustBFat.State = cbChecked ) then { KVB Done }
      begin
         lReferenceBFat.Show;
         lExpectedBFat.Show;
         dbeReferenceBFat.Show;
         dbeExpectedBFat.Show;
         mAdjustBFat.Show;
         lAdjustAmount.Show;
         dbeAdjustAmount.Show;
         dbeQuotaAmount.Show;
         lQuotaAmount.Show;
      end
   else
      begin
         lReferenceBFat.Hide;
         lExpectedBFat.Hide;
         dbeReferenceBFat.Hide;
         dbeExpectedBFat.Hide;
         mAdjustBFat.Hide;
         lAdjustAmount.Hide;
         dbeAdjustAmount.Hide;
         dbeQuotaAmount.Hide;
         lQuotaAmount.Hide;
      end;
end;

procedure TfQuotaMan.pcQuotaChange(Sender: TObject);
Var
   TempFloat : Double;
begin

     //if pUserInputs.Visible then
     if (Sender as TPageControl).ActivePage = tsQuotaResults then
        begin
           sbPreview.Enabled := True;   //KVB 05/02/2001
           sbMoreDetail.Enabled := True;  //KVB 05/02/2001
           sbCullList.Enabled := True;   //KVB 05/02/2001
           pHerd.Hide;
           Refresh;

           // Only calculate if Items modified or first change of tab
           if QuotaTable.Modified Or FirstPass then
              Begin
                 //First need to erase all fields on second TabSheet
                 rA1.Text := '';
                 rA2.Text := '';
                 rA3.Text := '';
                 rA4.Text := '';
                 rA5.Text := '';
                 rA6.Text := '';
                 rA7.Text := '';
                 //rA8.Text := '';
                 //rA9.Text := '';
                 rSupplyThisYear.Text := '';
                 TotalSupply.Text := '';
                 rQuotaResult.Text := '';
                 lQuotaResult.Caption := '';
                 LoadAnimals;
              End;

           if QuotaTable.State In [dsEdit,dsInsert] then
              QuotaTable.Post;

           // Calculate the Results
           with GenQuery do
              begin
                 //End Lactation - Cull Cow Production
                 SQL.Clear;
                 SQL.Add('SELECT SUM(PriorProduction) Result FROM QuotaTemp');     //KVB
                 SQL.Add('WHERE Category = 3');
                 Open;
                 A1 := GenQuery.FieldByName('Result').AsFloat;
                 rA1.Text := FloatToStr(A1);


                 //End Lactation - 1st Calver Production
                 SQL.Clear;
                 SQL.Add('SELECT SUM(PriorProduction) Result FROM QuotaTemp');   //KVB
                 SQL.Add('WHERE Category = 1');
                 Open;
                 A2 := GenQuery.FieldByName('Result').AsFloat;
                 rA2.Text := FloatToStr(A2);

                 //End Lactation - Older Cow Production
                 SQL.Clear;
                 SQL.Add('SELECT SUM(PriorProduction) Result FROM QuotaTemp');  //KVB
                 SQL.Add('WHERE Category = 2');
                 Open;
                 A3 := GenQuery.FieldByName('Result').AsFloat;
                 rA3.Text := FloatToStr(A3);


                 //Next Lactation - 1st Calver Production
                 SQL.Clear;
                 SQL.Add('SELECT SUM(Production) Result FROM QuotaTemp');  //KVB
                 //SQL.Add('WHERE Category = 1');
                 SQL.Add('WHERE ((Category = 1) AND (LactNo = 0))');
                 Open;
                 A4 := GenQuery.FieldByName('Result').AsFloat;
                 rA4.Text := FloatToStr(A4);


                 //Next Lactation - Older Cow Production
                 SQL.Clear;
                 SQL.Add('SELECT SUM(Production) Result FROM QuotaTemp');    //KVB
                 //SQL.Add('WHERE Category = 2');
                 SQL.Add('WHERE ((Category = 2) OR ((Category = 1) AND (LactNo = 1)))');
                 Open;
                 A5 := GenQuery.FieldByName('Result').AsFloat;
                 rA5.Text := FloatToStr(A5);

                 // End Lactation - Number Of Calves
                 SQL.Clear;
                 SQL.Add('SELECT SUM(PriorNumOfCalves) Result FROM QuotaTemp');    //KVB
                 SQL.Add('WHERE (((Category = 1) OR (Category = 2)) AND (PriorDaysFedMilk > 0))');  //KVB
                 Open;

                 A6 := GenQuery.FieldByName('Result').AsFloat;
                 SQL.Clear;
                 SQL.Add('SELECT SUM(NumOfCalves) Result FROM QuotaTemp');    //KVB
                 SQL.Add('WHERE ((Category = 3) AND (DaysFedMilk > 0))');      //KVB
                 Open;
                 A6 := A6 + GenQuery.FieldByName('Result').AsFloat;

                 //Next Lactation - Number Of Calves
                 SQL.Clear;
                 SQL.Add('SELECT SUM(NumOfCalves) Result FROM QuotaTemp');    //KVB
                 SQL.Add('WHERE (((Category = 1) OR (Category = 2)) AND (DaysFedMilk > 0))');    //KVB
                 Open;

                 A8 := GenQuery.FieldByName('Result').AsFloat;

                 rA6.Text := FloatToStr(A6 + A8);

                 //End Lactation - Milk Fed to Calves
                 SQL.Clear;
                 SQL.Add('SELECT SUM(PriorMilkFed) Result FROM QuotaTemp');    //KVB
                 SQL.Add('WHERE (Category = 1) OR (Category = 2)');
                 Open;
                 A7 := GenQuery.FieldByName('Result').AsFloat;

                 SQL.Clear;
                 SQL.Add('SELECT SUM(MilkFed) Result FROM QuotaTemp');    //KVB
                 SQL.Add('WHERE (Category = 3)');
                 Open;
                 A7 := A7 + GenQuery.FieldByName('Result').AsFloat;
                 rA7.Text := FloatToStr(A7);

                 //Next Lactation - Milk Fed to Calves
                 SQL.Clear;
                 SQL.Add('SELECT SUM(MilkFed) Result FROM QuotaTemp');    //KVB
                 SQL.Add('WHERE (Category = 1) OR (Category = 2)');
                 Open;
                 A9 := GenQuery.FieldByName('Result').AsFloat;
                 //rA9.Text := FloatToStr(A9);
                 rA7.Text := FloatToStr(A7 + A9);

                 // Supply This Quota Year
                 TempFloat := ( A1 + A2 + A3 + A4 + A5 + QuotaTable.FieldByName('MilkSupply').AsFloat );
                 rSupplyThisYear.Text := FloatToStr(TempFloat);
                 // Supply less the Amount fed to Calves
                 TotalSupply.Text := FloatToStr( TempFloat - ( A7 + A9 ) );
                 //Quota Result
                 if NOT QuotaTable.FieldByName('AdjustQuota').AsBoolean then
                    begin
                       dbeQuotaToUse.DataField := 'AnnualQuota';
                       l1.Caption := 'Annual Quota';  //KVB 07/02/2001
                       TempFloat := QuotaTable.FieldByName('AnnualQuota').AsFloat - ( TempFloat - ( A7 + A9 ));
                    end
                 else
                    begin
                       dbeQuotaToUse.DataField := 'QuotaAmount';
                       l1.Caption := 'Butterfat Adjusted Annual Quota';  //KVB 07/02/2001
                       TempFloat := QuotaTable.FieldByName('QuotaAmount').AsFloat - ( TempFloat - ( A7 + A9 ));
                    end;

                 if ( TempFloat < 0 ) then
                    begin
                       TempFloat := 0-TempFloat;
                       rQuotaResult.Font.Color := clRed;
                       lQuotaResult.Font.Color := clRed;
                       lQuotaResult.Caption := 'Over Quota';
                    end
                 else if ( TempFloat > 0 ) then
                    begin
                       rQuotaResult.Font.Color := clGreen;
                       lQuotaResult.Font.Color := clGreen;
                       lQuotaResult.Caption := 'Under Quota';
                    end
                 else
                    begin  // Equal Zero
                       rQuotaResult.Font.Color := clGreen;
                       lQuotaResult.Font.Color := clGreen;
                       lQuotaResult.Caption := 'Even Quota';
                    end;
                 rQuotaResult.Text := FloatToStr(TempFloat);
              end;

        end
     else
        begin
           // Show the UserInputs Panel
           sbPreview.Enabled := False;    //KVB 05/02/2001
           sbMoreDetail.Enabled := False;  //KVB 05/02/2001
           sbCullList.Enabled := False;   //KVB 05/02/2001
           pHerd.Show;
        end;
end;


procedure TfQuotaMan.sbCullListClick(Sender: TObject);
begin
    with uQuotaSummary.TfQuotaSummary.Create(nil) do
       try
         qrMAssumedCulls.Lines.Clear;
         qrMAssumedCulls.Lines.Append(msg1);
         qrMAssumedCulls.Lines.Append(msg2);
         qrMAssumedCulls.Lines.Append(msg3);

         // Run the Query to get the Avg for each Month
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT AnimalNo, DryingOffDate, LactNo FROM QuotaTemp');
               SQL.Add('WHERE category = 3');
               SQL.Add('GROUP BY AnimalNo, DryingOffDate, LactNo');
               Open;
            end;

          rCullList.DataSet := GenQuery;
          CowNo.DataSet := GenQuery;
          CowNo.DataField := 'AnimalNo';
          DryDate.DataSet := GenQuery;
          DryDate.DataField := 'DryingOffDate';
          LactNo.DataSet := GenQuery;
          LactNo.DataField := 'LactNo';
          rCullList.Preview;
       finally
          Free;
       end;
end;


procedure TfQuotaMan.cbLitresOrGallonsExit(Sender: TObject);
begin
   if UpperCase(cbLitresOrGallons.Text) = 'GALLONS' then
      lLitresOrGallons.Caption := 'Gallons Fed per Day'
   else
      lLitresOrGallons.Caption := 'Litres Fed per Day';
end;

procedure TfQuotaMan.DBEdit3Exit(Sender: TObject);
begin
     if QuotaTable.FieldByName('AOlderCowsDY').AsFloat = 0 then
        QuotaTable.FieldByName('AOlderCowsDY').AsFloat := QuotaTable.FieldByName('AFirstCalverDY').AsFloat;
     if QuotaTable.FieldByName('ACullBarrenDY').AsFloat = 0 then
        QuotaTable.FieldByName('ACullBarrenDY').AsFloat := QuotaTable.FieldByName('AFirstCalverDY').AsFloat;
end;

procedure TfQuotaMan.DBEdit8Exit(Sender: TObject);
begin
     if QuotaTable.FieldByName('BOlderCowsDY').AsFloat = 0 then
        QuotaTable.FieldByName('BOlderCowsDY').AsFloat := QuotaTable.FieldByName('BFirstCalverDY').AsFloat;

end;

procedure TfQuotaMan.sbPreviewClick(Sender: TObject);
begin
    with uQuotaSummary.TfQuotaSummary.Create(nil) do
       try
          qrMSummary.Lines.Clear;
          qrMSummary.Lines.Append(msg1);
          qrMSummary.Lines.Append(msg2);
          qrMSummary.Lines.Append(msg3);

          t1.Caption := l1.Caption;
          t2.Caption := l2.Caption;
          t3.Caption := l3.Caption;
          t4.Caption := l4.Caption;
          t5.Caption := l5.Caption;
          t6.Caption := l6.Caption;
          t7.Caption := l7.Caption;
          t8.Caption := l8.Caption;
          //t9.Caption := l9.Caption;
          t10.Caption := l10.Caption;
          t11.Caption := l11.Caption;
          //t12.Caption := l12.Caption;   //KVB
          t13.Caption := l13.Caption;   //KVB
          //t14.Caption := l14.Caption;   //KVB

          //d1.Caption := QuotaTable.FieldByName('AnnualQuota').AsString;
          If dbeQuotaToUse.Text <> '' then
             d1.Caption := dbeQuotaToUse.Text  //KVB 07/02/2001
          Else
             d1.Caption := '0';
          //d2.Caption := QuotaTable.FieldByName('MilkSupply').AsString;
          If dbEdit13.Text <> '' then
             d2.Caption := dbEdit13.Text  //KVB 07/02/2001
          Else
             d2.Caption := '0';
          If rA1.Text <> '' then
             d3.Caption := rA1.Text
          Else
             d3.Caption := '0';
          If rA2.Text <> '' then
             d4.Caption := rA2.Text
          Else
             d4.Caption := '0';
          If rA3.Text <> '' then
             d5.Caption := rA3.Text
          Else
             d5.Caption := '0';
          If rA4.Text <> '' then
             d6.Caption := rA4.Text
          Else
             d6.Caption := '0';
          If rA5.Text <> '' then
             d7.Caption := rA5.Text
          Else
             d7.Caption := '0';
          If rSupplyThisYear.Text <> '' then
             d8.Caption := rSupplyThisYear.Text
          Else
             d8.Caption := '0';
          If rA6.Text <> '' then
             d9.Caption := rA6.Text
          Else
             d9.Caption := '0';
          If rA7.Text <> '' then
             d12.Caption := rA7.Text
          Else
             d12.Caption := '0';
          {If rA8.Text <> '' then
             d13.Caption := rA8.Text
          Else
             d13.Caption := '0';
          If rA9.Text <> '' then
             d14.Caption := rA9.Text
          Else
             d14.Caption := '0';  }
          If TotalSupply.Text <> '' then
             d10.Caption := TotalSupply.Text
          Else
             d10.Caption := '0';
          rlQuotaResult.Caption := lQuotaResult.Caption;
          rlQuotaResult.Font.Color := rQuotaResult.Font.Color;
          d11.Font.Color := rQuotaResult.Font.Color;
          If rQuotaResult.Text <> '' then
             d11.Caption := rQuotaResult.Text
          Else
             d11.Caption := '0';
          RepQuotaSummary.Preview;
       finally
          Free;
       end;
end;

procedure TfQuotaMan.FormCreate(Sender: TObject);
begin
   // Hide the Results Panel.
   qrQuotaResults.Hide;
   cbDefaultHerd.DataSource := WinData.dsHerdDefaults;
   sbPreview.Enabled := False;    //KVB 05/02/2001
   sbMoreDetail.Enabled := False;  //KVB 05/02/2001
   sbCullList.Enabled := False;   //KVB 05/02/2001
   pHerd.Show;
   cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   pcQuota.ActivePage := tsQuotaFigures;
   with QuotaTable do
      begin
         QuotaTable := TTable.Create(nil);
         QuotaTable.DatabaseName := WinData.KingData.DatabaseName;
         QuotaTable.TableName := 'QuotaDefaults';
         QuotaTable.Active := True;
      end;
   FBreedingDataHelper := TBreedingDataHelper.Create();
end;

procedure TfQuotaMan.sbMoreDetailClick(Sender: TObject);
begin
   try
      qQuotaResults.Active := True;
      try
         qrQuotaResults.Preview;
      finally
         qQuotaResults.Active := False;
      end;
   except
      MessageDlg('Cannot preview Quota Results - close program and retry again',mtError,[mbOK],0);
   end;
end;

procedure TfQuotaMan.FormShow(Sender: TObject);
begin
   //Need to determine which Dry Off Fields to show
   If QuotaTable.FieldByName('UseHerdDryOff').AsBoolean then
      Begin   //Show Herd Dry Off Date field and hide the other Dry Off Date fields
         Label11.Show;
         DBDateEdit2.Show;

         Label26.Hide;
         Label27.Hide;
         Label28.Hide;
         DBEdit6.Hide;
         DBEdit7.Hide;
         DBDateEdit1.Hide;
      End
   Else
      Begin
         Label11.Hide;
         DBDateEdit2.Hide;

         Label26.Show;
         Label27.Show;
         Label28.Show;
         DBEdit6.Show;
         DBEdit7.Show;
         DBDateEdit1.Show;
      End;

   //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cMilkQuotaPlanRep);
   WinData.UpdateRecentReportUsage(cMilkQuotaPlanRep);
end;

procedure TfQuotaMan.DBCheckBox1Click(Sender: TObject);
begin
   //Need to determine which Dry Off Fields to show
   If DBCheckBox1.Checked then
      Begin   //Show Herd Dry Off Date field and hide the other Dry Off Date fields
         Label11.Show;
         DBDateEdit2.Show;
         If QuotaTable.FieldByName('HerdDryOffDate').AsDateTime < QuotaTable.FieldByName('LastMilkDate').AsDateTime then
            Begin
               If QuotaTable.State = dsBrowse then
                  QuotaTable.Edit;
               QuotaTable.FieldByName('HerdDryOffDate').AsDateTime := QuotaTable.FieldByName('LastMilkDate').AsDateTime;
            End;
         Label26.Hide;
         Label27.Hide;
         Label28.Hide;
         DBEdit6.Hide;
         DBEdit7.Hide;
         DBDateEdit1.Hide;
      End
   Else
      Begin
         Label11.Hide;
         DBDateEdit2.Hide;

         Label26.Show;
         Label27.Show;
         Label28.Show;
         DBEdit6.Show;
         DBEdit7.Show;
         DBDateEdit1.Show;
      End;
end;

procedure TfQuotaMan.LastMilkDateExit(Sender: TObject);
begin
   //Need to ensure that HerdDryOffDate is not less than MilkStatementDate
   If QuotaTable.FieldByName('HerdDryOffDate').AsDateTime < QuotaTable.FieldByName('LastMilkDate').AsDateTime then
      QuotaTable.FieldByName('HerdDryOffDate').AsDateTime := QuotaTable.FieldByName('LastMilkDate').AsDateTime;

end;

procedure TfQuotaMan.DBEdit2Exit(Sender: TObject);
begin
   //Need to ensure that HerdDryOffDate is not less than MilkStatementDate
   If QuotaTable.FieldByName('HerdDryOffDate').AsDateTime < QuotaTable.FieldByName('LastMilkDate').AsDateTime then
      QuotaTable.FieldByName('HerdDryOffDate').AsDateTime := QuotaTable.FieldByName('LastMilkDate').AsDateTime;

end;

procedure TfQuotaMan.dbeAdjustAmountChange(Sender: TObject);
begin
   if (Sender as TDBEdit).Field.DataSet.Active then
      if (Sender as TDBEdit).Field.Value < 0 then
         dbeAdjustAmount.Font.Color := clRed
      else
         dbeAdjustAmount.Font.Color := clBlack;
end;

procedure TfQuotaMan.FormDestroy(Sender: TObject);
begin
   try
      QuotaTable.DisableControls;
      QuotaTable.Close;
      if FBreedingDataHelper <> nil then
         FreeAndNil(FBreedingDataHelper);
   except
      //
   end;
end;

procedure TfQuotaMan.dbeReferenceBFatExit(Sender: TObject);
Var
   Diff : Double;
begin      //KVB Done
     // Calculate the Butterfat adjustment required
     if NOT ( QuotaTable.State In [dsEdit,dsInsert] ) then
        QuotaTable.Edit;
     Diff := 0;
     if ( dbeReferenceBFat.Field.AsFloat > 0 ) And ( dbeExpectedBFat.Field.AsFloat > 0 ) then
        begin
           Diff := ( dbeReferenceBFat.Field.AsFloat - dbeExpectedBFat.Field.AsFloat );
           if ( Diff <> 0 ) then
              begin
//                 Diff := dbeAnnualQuota.Field.AsFloat * 0.18 * Diff;
                 Diff := dbeAnnualQuota.Field.AsFloat * 0.09 * Diff; // GL 18/06/2010
                 dbeQuotaAmount.Field.AsInteger := Round(dbeAnnualQuota.Field.AsFloat + Diff);
                 if Diff < 0 then
                    dbeAdjustAmount.Font.Color := clRed
                 else
                    dbeAdjustAmount.Font.Color := clBlack;
                 dbeAdjustAmount.Field.AsInteger := Round(Diff);
              end
           else
              begin
                 dbeQuotaAmount.Field.AsFloat := dbeAnnualQuota.Field.AsFloat;
                 dbeAdjustAmount.Field.AsInteger := 0;
              end;
        end
     else
        begin
           dbeQuotaAmount.Field.AsFloat := dbeAnnualQuota.Field.AsFloat;
           dbeAdjustAmount.Field.AsInteger := 0;
        end;
end;

procedure TfQuotaMan.DBDateEdit2Exit(Sender: TObject);
begin
   //Need to ensure that HerdDryOffDate is not less than MilkStatementDate
   if QuotaTable.FieldByName('HerdDryOffDate').AsDateTime < QuotaTable.FieldByName('LastMilkDate').AsDateTime then
      QuotaTable.FieldByName('HerdDryOffDate').AsDateTime := QuotaTable.FieldByName('LastMilkDate').AsDateTime;
end;

procedure TfQuotaMan.pcQuotaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if ( LastMilkDate.Field.AsDateTime <= 0 ) then
      MessageDlg('No Last Milk Statement Date Entered',mtWarning,[mbOK],0)
   else if ( LastMilkDate.Field.AsDateTime < Date - 35 ) then // 5 weeks
      AllowChange := MessageDlg(Format('Last Milk Statement Date is %s ', [FormatDateTime('dd/mm/yyyy', LastMilkDate.Field.AsDateTime)]),mtWarning,[mbOK,mbCancel],0) = mrOK;

end;

procedure TfQuotaMan.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if (( qQuotaResults.FieldByName('PriorProduction').AsFloat + qQuotaResults.FieldByName('Production').AsFloat ) - ( qQuotaResults.FieldByName('MilkFed').AsFloat )) > 0 then
      QRExpr1.Mask := '#.##'
   else
      QRExpr1.Mask := '';
end;

procedure TfQuotaMan.QRDBText3Print(sender: TObject; var Value: String);
begin
   if ((Sender as TQRDBText).DataSet.FieldByName( (Sender as TQRDBText).DataField ).AsDateTime <= 0)// or
     // ( qQuotaResults.FieldByName('Category').AsInteger = CullBarren )
       then
      Value := '';
end;

procedure TfQuotaMan.QRDBText11Print(sender: TObject; var Value: String);
begin
   try
      if StrToFloat(Value) <= 0 then
         Value := '0';
   except
   end;
end;

procedure TfQuotaMan.QRLabel8Print(sender: TObject; var Value: String);
begin
   if ( qQuotaResults.FieldByName('Category').AsInteger <> CullBarren ) then
     Value := ''
   else
     Value := '*';
end;

procedure TfQuotaMan.lPrint(sender: TObject; var Value: String);
begin
   Value := HerdVerNo;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfQuotaMan.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cMilkQuotaPlanRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cMilkQuotaPlanRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
