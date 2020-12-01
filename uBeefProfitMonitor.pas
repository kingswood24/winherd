{
  Unit Created : 16/12/2008 [Dev V3.9 R 6.1]  /SP

  16/02/2009 [Dev V3.9 R 6.4] /SP  - Default to last year, report is based on calendar year - GL

  15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
}

unit uBeefProfitMonitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxControls, cxGridCustomView, ExtCtrls, cxClasses, cxGridLevel, cxGrid,
  ActnList, dxBar, dxBarExtItems, cxPC, cxLabel, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Db, DBTables, cxMemo,
  StdCtrls, cxButtons, cxStyles, uLivestockData, dxStatusBar, DateUtil,
  KDBRoutines, uFrameHerdIDPanel, cxGroupBox, dxPSCore, dxPScxCommon,
  dxPScxGridLnk,GenTypesConst, cxCheckBox;

type

  TProfitMonitorReportType = (pmrtAll, pmrtSalesPurchases, pmrtSummary);
  TLivestockNumbers = record
    SucklerCows,
    StockBulls,
    Cattle0To6MthsMale,
    Cattle0To6MthsFemale,
    Cattle6To12MthsMale,
    Cattle6To12MthsFemale,
    Cattle1To2YrsMale,
    Cattle1To2YrsFemale,
    Cattle2PlusYrsMale,
    Cattle2PlusYrsFemale : Integer;
    SucklerCowsTotal,
    StockBullsTotal,
    Cattle0To6MthsMaleTotal,
    Cattle0To6MthsFemaleTotal,
    Cattle6To12MthsMaleTotal,
    Cattle6To12MthsFemaleTotal,
    Cattle1To2YrsMaleTotal,
    Cattle1To2YrsFemaleTotal,
    Cattle2PlusYrsMaleTotal,
    Cattle2PlusYrsFemaleTotal,
    SucklerCowsTotalLW,
    StockBullsTotalLW,
    Cattle0To6MthsMaleTotalLW,
    Cattle0To6MthsFemaleTotalLW,
    Cattle6To12MthsMaleTotalLW,
    Cattle6To12MthsFemaleTotalLW,
    Cattle1To2YrsMaleTotalLW,
    Cattle1To2YrsFemaleTotalLW,
    Cattle2PlusYrsMaleTotalLW,
    Cattle2PlusYrsFemaleTotalLW : Double;
  end;

  TfmBeefProfitMonitor = class(TForm)
    BarManager: TdxBarManager;
    pcProfitMonitor: TcxPageControl;
    tsLiveStockMovements: TcxTabSheet;
    blbExit: TdxBarLargeButton;
    ActionList: TActionList;
    actExit: TAction;
    tsProfitMonitorSummary: TcxTabSheet;
    LSMovementsGridLevel: TcxGridLevel;
    LSMovementsGrid: TcxGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    LSMovementsGridBandedTableView: TcxGridBandedTableView;
    LSMovementsGridBandedTableViewLSCategory: TcxGridBandedColumn;
    LSMovementsGridBandedTableViewSalesNumber: TcxGridBandedColumn;
    LSMovementsGridBandedTableViewSalesTotal: TcxGridBandedColumn;
    LSMovementsGridBandedTableViewSalesTotalLW: TcxGridBandedColumn;
    LSMovementsGridBandedTableViewPurchasesNumber: TcxGridBandedColumn;
    LSMovementsGridBandedTableViewPurchasesTotal: TcxGridBandedColumn;
    LSMovementsGridBandedTableViewPurchasesTotalLW: TcxGridBandedColumn;
    QueryEvents: TQuery;
    cxButton1: TcxButton;
    BarControlContainerForHerdID: TdxBarControlContainerItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleNormal: TcxStyle;
    cxStyleStatic: TcxStyle;
    Panel5: TPanel;
    cxLabel3: TcxLabel;
    LSSummary: TcxGrid;
    LSSummaryGridLevel: TcxGridLevel;
    LSSummaryTableView: TcxGridTableView;
    LSSummaryTableViewCategory: TcxGridColumn;
    LSSummaryTableViewStart: TcxGridColumn;
    LSSummaryTableViewEndFeb: TcxGridColumn;
    LSSummaryTableViewEndJan: TcxGridColumn;
    LSSummaryTableViewEndMar: TcxGridColumn;
    LSSummaryTableViewEndApr: TcxGridColumn;
    LSSummaryTableViewEndMay: TcxGridColumn;
    LSSummaryTableViewEndJun: TcxGridColumn;
    LSSummaryTableViewEndJul: TcxGridColumn;
    LSSummaryTableViewEndAug: TcxGridColumn;
    LSSummaryTableViewEndSep: TcxGridColumn;
    LSSummaryTableViewEndOct: TcxGridColumn;
    LSSummaryTableViewEndNov: TcxGridColumn;
    LSSummaryTableViewEndDec: TcxGridColumn;
    cmboMonth: TcxComboBox;
    cxLabel4: TcxLabel;
    LSSummaryTableViewTotal: TcxGridColumn;
    LSSummaryTableViewAverage: TcxGridColumn;
    StatusBar: TdxStatusBar;
    Panel6: TPanel;
    btnExportProfitMonitorSummary: TcxButton;
    btnPrintProfitMonitorSummary: TcxButton;
    btnExportLivestockSalesAndPurchases: TcxButton;
    btnPrintLivestockSalesAndPurchases: TcxButton;
    cxLabel5: TcxLabel;
    cmboYear: TcxComboBox;
    cxButton6: TcxButton;
    cxStyleHeader: TcxStyle;
    frmHerdID: TfrmHerdIDPanel;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    FromDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    ToDate: TcxDateEdit;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinterLSMovements: TdxGridReportLink;
    dxComponentPrinterProfitMonitorSummary: TdxGridReportLink;
    actExportLivestockSalesAndPurchases: TAction;
    actPrintLivestockSalesAndPurchases: TAction;
    SaveDialog: TSaveDialog;
    actExportProfitMonitorSummary: TAction;
    actPrintProfitMonitorSummary: TAction;
    DataTimer: TTimer;
    cxStyleStartMonth: TcxStyle;
    pFavourite: TPanel;
    cbFavourite: TcxCheckBox;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    procedure actExitExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure LSMovementsGridBandedTableViewLSCategoryStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure LSSummaryTableViewCategoryStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure LSSummaryTableViewCanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure LSSummaryTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure LSMovementsGridBandedTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure LSMovementsGridBandedTableViewCanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure cxButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frmHerdIDHerdComboPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmboMonthPropertiesChange(Sender: TObject);
    procedure FromDatePropertiesChange(Sender: TObject);
    procedure actExportLivestockSalesAndPurchasesExecute(Sender: TObject);
    procedure actPrintLivestockSalesAndPurchasesExecute(Sender: TObject);
    procedure actExportProfitMonitorSummaryExecute(Sender: TObject);
    procedure actPrintProfitMonitorSummaryExecute(Sender: TObject);
    procedure DataTimerTimer(Sender: TObject);
    procedure pcProfitMonitorChange(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    LSNumbers : TLivestockNumbers;
    FHerdID : Integer;
    FLivestockData : TLivestockData;
    FBeefLivestockType : TBeefLivestockType;
    FFormShowing : Boolean;
    FProfitMonitorReportType : TProfitMonitorReportType;
    FInDebugMode : Boolean;
    procedure SetupLivestockMovements;
    procedure SetupLivestockSummary;
    procedure GetPurchaseSaleData(var ALivestockNumbers : TLivestockNumbers; AEventType : Integer);
    procedure LoadLivestockMovementData;
    procedure LoadLivestockSummaryData;
    procedure LoadAllData;
    procedure ClearLivestockMovementData;
    procedure ClearLivestockSummaryData;
    procedure CheckInputDates;
    procedure SetDefaultDates;
    procedure EnableControls(AEnable : Boolean);
    function CalcLW(AColdWeight, ALiveWeight, AKillOutPerc : Double) : Double;

  public
    { Public declarations }
    class procedure Execute(AHerdID : Integer; const AProfitMonitorReportType : TProfitMonitorReportType = pmrtAll);
  end;

const
  LS_Category = 0;
  LS_SalesNumber = 1;
  LS_SalesTotal = 2;
  LS_SalesTotalLW = 3;

  LS_PurchasesNumber = 4;
  LS_PurchasesTotal = 5;
  LS_PurchasesTotalLW = 6;

  LS_Start = 1;
  LS_Jan = 2;
  LS_Feb = 3;
  LS_Mar = 4;
  LS_Apr = 5;
  LS_May = 6;
  LS_Jun = 7;
  LS_Jul = 8;
  LS_Aug = 9;
  LS_Sep = 10;
  LS_Oct = 11;
  LS_Nov = 12;
  LS_Dec = 13;
  LS_MonthTotal = 14;
  LS_MonthAverage = 15;


  LS_SucklerCowsRecIndex = 0;
  LS_StockBullsRecIndex = 1;
  LS_Cattle0To6MthsMaleRecIndex = 2;
  LS_Cattle0To6MthsFemaleRecIndex = 3;
  LS_Cattle6To12MthsMaleRecIndex = 4;
  LS_Cattle6To12MthsFemaleRecIndex = 5;
  LS_Cattle1To2YrsMaleRecIndex = 6;
  LS_Cattle1To2YrsFemaleRecIndex = 7;
  LS_Cattle2PlusYrsMaleRecIndex = 8;
  LS_Cattle2PlusYrsFemaleRecIndex = 9;
  LS_CategoryTotal = 10;

  cSucklerCows = 'Suckler Cows';
  cStockBulls = 'Stock Bulls';
  cCattle0To6MthsMale = 'Cattle 0-6 Mth Male';
  cCattle0To6MthsFemale = 'Cattle 0-6 Mth Female';
  cCattle6To12MthsMale = 'Cattle 6-12 Mth Male';
  cCattle6To12MthsFemale = 'Cattle 6-12 Mth Female';
  cCattle1To2YrsMale = 'Cattle 1-2 Yrs Male';
  CCattle1To2YrsFemale = 'Cattle 1-2 Yrs Female';
  cCattle2PlusYrsMale = 'Cattle 2+ Yrs Male';
  cCattle2PlusYrsFemale = 'Cattle 2+ Yrs Female';
  cTotal = 'Total';

var
  fmBeefProfitMonitor: TfmBeefProfitMonitor;

implementation

uses SQLHelper, SysConst, uImageStore, cxExportGrid4Link,
  KRoutines, DairyData, ChkDebug;

{$R *.DFM}

procedure TfmBeefProfitMonitor.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmBeefProfitMonitor.SetupLivestockMovements;
begin
   SetDefaultDates;
   with LSMovementsGridBandedTableView.DataController do
      begin
         RecordCount := 11;
         Values[LS_SucklerCowsRecIndex,LS_Category] := cSucklerCows;
         Values[LS_StockBullsRecIndex,LS_Category] := cStockBulls;
         Values[LS_Cattle0To6MthsMaleRecIndex,LS_Category] := cCattle0To6MthsMale;
         Values[LS_Cattle0To6MthsFemaleRecIndex,LS_Category] := cCattle0To6MthsFemale;
         Values[LS_Cattle6To12MthsMaleRecIndex,LS_Category] := cCattle6To12MthsMale;
         Values[LS_Cattle6To12MthsFemaleRecIndex,LS_Category] := cCattle6To12MthsFemale;
         Values[LS_Cattle1To2YrsMaleRecIndex,LS_Category] := cCattle1To2YrsMale;
         Values[LS_Cattle1To2YrsFemaleRecIndex,LS_Category] := CCattle1To2YrsFemale;
         Values[LS_Cattle2PlusYrsMaleRecIndex,LS_Category] := cCattle2PlusYrsMale;
         Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_Category] := cCattle2PlusYrsFemale;
         Values[LS_CategoryTotal,LS_Category] := 'Total';
         ClearLivestockMovementData;
      end;
end;

procedure TfmBeefProfitMonitor.GetPurchaseSaleData(var ALivestockNumbers : TLivestockNumbers; AEventType : Integer);
var
   i : Integer;
   FirstCalvingDate : TDateTime;
   WeightField : string;
   KillOutPerc : Double;
begin
   FillChar(ALivestockNumbers, SizeOf(TLivestockNumbers),0);


   if ( AEventType = cSaleDeathEvent ) then
      WeightField := 'D.ColdDeadWt, D.Weight'
   else if ( CPurchaseEvent = cPurchaseEvent ) then
      WeightField := 'D.Weight';

   with QueryEvents do
      begin
         Close;

         SQL.Clear;
         SQL.Add( InsertSELECT(['E.AnimalID','E.EventDate','A.DateOfBirth', 'A.Sex', 'A.LactNo', 'A.Breeding', 'A.PrimaryBreed', 'D.Price',WeightField]));
         SQL.Add( InsertFROM(['Events E']));
         SQL.Add( InsertJOIN('Animals A','A.ID','E.AnimalID',jtLEFT));
         if (AEventType = 11) then
            SQL.Add( InsertJOIN('SalesDeaths D','D.EventID','E.ID',jtLEFT))
         else if (AEventType = 12) then
            SQL.Add( InsertJOIN('Purchases D','D.EventID','E.ID',jtLEFT));

         SQL.Add( InsertWHERE(['A.AnimalDeleted'],['False'],opEquals));
         SQL.Add( InsertAND(['E.HerdID'],[':HerdID'],opEquals));
         SQL.Add( InsertAND(['E.EventType'],[':EventType'],opEquals));
         if (AEventType = 11) then
            SQL.Add( InsertAND(['D.Sold'],['True'],opEquals));
         Params[0].asInteger := FHerdID;
         Params[1].asInteger := AEventType;
         if (FromDate.Date >0) and (ToDate.Date >0) then
            begin
               SQL.Add( InsertBETWEEN('E.EventDate',':Date1',':Date2'));
               Params[2].AsDateTime := FromDate.Date;
               Params[3].AsDateTime := ToDate.Date;
            end
         else if (FromDate.Date >0) and (ToDate.Date <=0) then
            begin
               SQL.Add( InsertAND(['E.EventDate'],[':Date1'],opGreaterThan));
               Params[2].AsDateTime := FromDate.Date;
            end
         else if (FromDate.Date <=0) and (ToDate.Date >0) then
            begin
               SQL.Add( InsertAND(['E.EventDate'],[':Date1'],opLessThan));
               Params[2].AsDateTime := ToDate.Date;
            end;
         Open;

         First;

         while not eof do
            begin

               FirstCalvingDate := 0;
               if UPPERCASE(FieldByName('Sex').AsString) = UPPERCASE(cSEX_FEMALE) then
                  FirstCalvingDate := WinData.EventDataHelper.GetFirstEventDate(QueryEvents.FieldByName('AnimalID').AsInteger,CCalvingEvent);

               FBeefLivestockType := FLivestockData.GetBeefLivestockType(FieldByName('EventDate').AsDateTime,
                  FieldByName('Sex').AsString,
                  FieldByName('LactNo').AsInteger,
                  FieldByName('Breeding').AsBoolean,
                  FieldByName('DateOfBirth').AsDateTime,
                  FirstCalvingDate,
                  0,0,0);

               // KillOutPerc calc done at the behest of Christy Watson.
               KillOutPerc := FLivestockData.KillOutCalculator.Calculate(FieldByName('AnimalID').AsInteger);

               {if FInDebugMode then
                  begin
                  end;}

               case FBeefLivestockType of
                  atSucklerCow :
                  begin
                     Inc(ALivestockNumbers.SucklerCows);
                     ALivestockNumbers.SucklerCowsTotal := ALivestockNumbers.SucklerCowsTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.SucklerCowsTotalLW := ALivestockNumbers.SucklerCowsTotalLW + CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.SucklerCowsTotalLW := ALivestockNumbers.SucklerCowsTotalLW + FieldByName('Weight').AsFloat;
                  end;
                  atStockBull :
                  begin
                     Inc(ALivestockNumbers.StockBulls);
                     ALivestockNumbers.StockBullsTotal := ALivestockNumbers.StockBullsTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.StockBullsTotalLW := ALivestockNumbers.StockBullsTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.StockBullsTotalLW := ALivestockNumbers.StockBullsTotalLW+FieldByName('Weight').AsFloat;
                  end;
                  atCattle0To6MthsMale :
                  begin
                     Inc(ALivestockNumbers.Cattle0To6MthsMale);
                     ALivestockNumbers.Cattle0To6MthsMaleTotal := ALivestockNumbers.Cattle0To6MthsMaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle0To6MthsMaleTotalLW := ALivestockNumbers.Cattle0To6MthsMaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle0To6MthsMaleTotalLW := ALivestockNumbers.Cattle0To6MthsMaleTotalLW+FieldByName('Weight').AsFloat;
                  end;
                  atCattle0To6MthsFemale :
                  begin
                     Inc(ALivestockNumbers.Cattle0To6MthsFemale);
                     ALivestockNumbers.Cattle0To6MthsFemaleTotal := ALivestockNumbers.Cattle0To6MthsFemaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle0To6MthsFemaleTotalLW := ALivestockNumbers.Cattle0To6MthsFemaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle0To6MthsFemaleTotalLW := ALivestockNumbers.Cattle0To6MthsFemaleTotalLW+FieldByName('Weight').AsFloat;
                  end;
                  atCattle6To12MthsMale :
                  begin
                     Inc(ALivestockNumbers.Cattle6To12MthsMale);
                     ALivestockNumbers.Cattle6To12MthsMaleTotal := ALivestockNumbers.Cattle6To12MthsMaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle6To12MthsMaleTotalLW := ALivestockNumbers.Cattle6To12MthsMaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle6To12MthsMaleTotalLW := ALivestockNumbers.Cattle6To12MthsMaleTotalLW+FieldByName('Weight').AsFloat;
                  end;
                  atCattle6To12MthsFemale :
                  begin
                     Inc(ALivestockNumbers.Cattle6To12MthsFemale);
                     ALivestockNumbers.Cattle6To12MthsFemaleTotal := ALivestockNumbers.Cattle6To12MthsFemaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle6To12MthsFemaleTotalLW := ALivestockNumbers.Cattle6To12MthsFemaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle6To12MthsFemaleTotalLW := ALivestockNumbers.Cattle6To12MthsFemaleTotalLW+FieldByName('Weight').AsFloat;
                  end;
                  atCattle1To2YrsMale :
                  begin
                     Inc(ALivestockNumbers.Cattle1To2YrsMale);
                     ALivestockNumbers.Cattle1To2YrsMaleTotal := ALivestockNumbers.Cattle1To2YrsMaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle1To2YrsMaleTotalLW := ALivestockNumbers.Cattle1To2YrsMaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle1To2YrsMaleTotalLW := ALivestockNumbers.Cattle1To2YrsMaleTotalLW+FieldByName('Weight').AsFloat
                  end;
                  atCattle1To2YrsFemale :
                  begin
                     Inc(ALivestockNumbers.Cattle1To2YrsFemale);
                     ALivestockNumbers.Cattle1To2YrsFemaleTotal := ALivestockNumbers.Cattle1To2YrsFemaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle1To2YrsFemaleTotalLW := ALivestockNumbers.Cattle1To2YrsFemaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle1To2YrsFemaleTotalLW := ALivestockNumbers.Cattle1To2YrsFemaleTotalLW+FieldByName('Weight').AsFloat
                  end;
                  atCattle2PlusYrsMale :
                  begin
                     Inc(ALivestockNumbers.Cattle2PlusYrsMale);
                     ALivestockNumbers.Cattle2PlusYrsMaleTotal := ALivestockNumbers.Cattle2PlusYrsMaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle2PlusYrsMaleTotalLW := ALivestockNumbers.Cattle2PlusYrsMaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle2PlusYrsMaleTotalLW := ALivestockNumbers.Cattle2PlusYrsMaleTotalLW+FieldByName('Weight').AsFloat
                  end;
                  atCattle2PlusYrsFemale :
                  begin
                     Inc(ALivestockNumbers.Cattle2PlusYrsFemale);
                     ALivestockNumbers.Cattle2PlusYrsFemaleTotal := ALivestockNumbers.Cattle2PlusYrsFemaleTotal+FieldByName('Price').AsFloat;
                     if ( AEventType = cSaleDeathEvent ) then
                        ALivestockNumbers.Cattle2PlusYrsFemaleTotalLW := ALivestockNumbers.Cattle2PlusYrsFemaleTotalLW+CalcLW( FieldByName('ColdDeadWt').AsFloat, FieldByName('Weight').AsFloat,KillOutPerc)
                     else
                        ALivestockNumbers.Cattle2PlusYrsFemaleTotalLW := ALivestockNumbers.Cattle2PlusYrsFemaleTotalLW+FieldByName('Weight').AsFloat
                  end;
               end;
               Next;
            end;
         Close;
      end;
end;

class procedure TfmBeefProfitMonitor.Execute(AHerdID: Integer; const AProfitMonitorReportType : TProfitMonitorReportType);
begin
   with TfmBeefProfitMonitor.Create(nil) do
      try
         FHerdID := AHerdID;
         frmHerdID.HerdCombo.EditValue := FHerdID;
         FProfitMonitorReportType := AProfitMonitorReportType;
         SetupLivestockMovements;
         SetupLivestockSummary;
         if FProfitMonitorReportType = pmrtSummary then
            pcProfitMonitor.ActivePage := tsProfitMonitorSummary
         else
            pcProfitMonitor.ActivePage := tsLiveStockMovements;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmBeefProfitMonitor.cxButton1Click(Sender: TObject);
begin
   LoadLivestockMovementData;
end;

procedure TfmBeefProfitMonitor.LSMovementsGridBandedTableViewLSCategoryStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
   AStyle := cxStyleStatic;
end;

procedure TfmBeefProfitMonitor.LoadAllData;
begin
   LoadLivestockMovementData;
   LoadLivestockSummaryData;
end;

procedure TfmBeefProfitMonitor.LoadLivestockMovementData;
var
   i, j : Integer;
   vTotal : Variant;
begin
   EnableControls(False);
   Screen.Cursor := crHourGlass;
   try
      StatusBar.Panels[0].Text := 'Compiling Sale and Purchase Details, please wait...';
      dxComponentPrinterLSMovements.ReportTitle.Text := Format('Beef Profit Monitor - Livestock Sales and Purchases Details - %s to %s',[FromDate.Text,ToDate.Text]);
      Update;
      with LSMovementsGridBandedTableView.DataController do
         begin
            ClearLivestockMovementData;

            GetPurchaseSaleData(LSNumbers, 11);

            Values[LS_SucklerCowsRecIndex,LS_SalesNumber] := LSNumbers.SucklerCows;
            Values[LS_StockBullsRecIndex,LS_SalesNumber] := LSNumbers.StockBulls;
            Values[LS_Cattle0To6MthsMaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle0To6MthsMale;
            Values[LS_Cattle0To6MthsFemaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle0To6MthsFemale;
            Values[LS_Cattle6To12MthsMaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle6To12MthsMale;
            Values[LS_Cattle6To12MthsFemaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle6To12MthsFemale;
            Values[LS_Cattle1To2YrsMaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle1To2YrsMale;
            Values[LS_Cattle1To2YrsFemaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle1To2YrsFemale;
            Values[LS_Cattle2PlusYrsMaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle2PlusYrsMale;
            Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_SalesNumber] := LSNumbers.Cattle2PlusYrsFemale;

            { Suckler Cow }
            if ( LSNumbers.SucklerCows > 0 ) then
               Values[LS_SucklerCowsRecIndex,LS_SalesTotal] := LSNumbers.SucklerCowsTotal;

            { Stock Bulls }
            if ( LSNumbers.StockBulls > 0 ) then
               Values[LS_StockBullsRecIndex,LS_SalesTotal] := LSNumbers.StockBullsTotal;

            { Cattle 0-6 Months }
            if ( LSNumbers.Cattle0To6MthsMale > 0 ) then
               Values[LS_Cattle0To6MthsMaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle0To6MthsMaleTotal;
            if ( LSNumbers.Cattle0To6MthsFemale > 0 ) then
               Values[LS_Cattle0To6MthsFemaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle0To6MthsFemaleTotal;

            { Cattle 6-12 Months }
            if ( LSNumbers.Cattle6To12MthsMale > 0 ) then
               Values[LS_Cattle6To12MthsMaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle6To12MthsMaleTotal;
            if ( LSNumbers.Cattle6To12MthsFemale > 0 ) then
               Values[LS_Cattle6To12MthsFemaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle6To12MthsFemaleTotal;

            { Cattle 1-2 Years }
            if ( LSNumbers.Cattle1To2YrsMale > 0 ) then
               Values[LS_Cattle1To2YrsMaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle1To2YrsMaleTotal;
            if ( LSNumbers.Cattle1To2YrsFemale > 0 ) then
               Values[LS_Cattle1To2YrsFemaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle1To2YrsFemaleTotal;

            { Cattle 2+ Years }
            if ( LSNumbers.Cattle2PlusYrsMale > 0 ) then
               Values[LS_Cattle2PlusYrsMaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle2PlusYrsMaleTotal;
            if ( LSNumbers.Cattle2PlusYrsFemale > 0 ) then
               Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_SalesTotal] := LSNumbers.Cattle2PlusYrsFemaleTotal;

            { Suckler Cow }
            if ( LSNumbers.SucklerCows > 0 ) then
               Values[LS_SucklerCowsRecIndex,LS_SalesTotalLW] := LSNumbers.SucklerCowsTotalLW;
            { Stock Bulls }
            if ( LSNumbers.StockBulls > 0 ) then
               Values[LS_StockBullsRecIndex,LS_SalesTotalLW] := LSNumbers.StockBullsTotalLW;
            { Cattle 0-6 Months }
            if ( LSNumbers.Cattle0To6MthsMale > 0 ) then
               Values[LS_Cattle0To6MthsMaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle0To6MthsMaleTotalLW;
            if ( LSNumbers.Cattle0To6MthsFemale > 0 ) then
               Values[LS_Cattle0To6MthsFemaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle0To6MthsFemaleTotalLW;
            { Cattle 6-12 Months }
            if ( LSNumbers.Cattle6To12MthsMale > 0 ) then
               Values[LS_Cattle6To12MthsMaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle6To12MthsMaleTotalLW;
            if ( LSNumbers.Cattle6To12MthsFemale > 0 ) then
               Values[LS_Cattle6To12MthsFemaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle6To12MthsFemaleTotalLW;
            { Cattle 1-2 Years }
            if ( LSNumbers.Cattle1To2YrsMale > 0 ) then
               Values[LS_Cattle1To2YrsMaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle1To2YrsMaleTotalLW;
            if ( LSNumbers.Cattle1To2YrsFemale > 0 ) then
               Values[LS_Cattle1To2YrsFemaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle1To2YrsFemaleTotalLW;
            { Cattle 2+ Years }
            if ( LSNumbers.Cattle2PlusYrsMale > 0 ) then
               Values[LS_Cattle2PlusYrsMaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle2PlusYrsMaleTotalLW;
            if ( LSNumbers.Cattle2PlusYrsFemale > 0 ) then
               Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_SalesTotalLW] := LSNumbers.Cattle2PlusYrsFemaleTotalLW;

            GetPurchaseSaleData(LSNumbers, 12);

            Values[LS_SucklerCowsRecIndex,LS_PurchasesNumber] := LSNumbers.SucklerCows;
            Values[LS_StockBullsRecIndex,LS_PurchasesNumber] := LSNumbers.StockBulls;
            Values[LS_Cattle0To6MthsMaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle0To6MthsMale;
            Values[LS_Cattle0To6MthsFemaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle0To6MthsFemale;
            Values[LS_Cattle6To12MthsMaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle6To12MthsMale;
            Values[LS_Cattle6To12MthsFemaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle6To12MthsFemale;
            Values[LS_Cattle1To2YrsMaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle1To2YrsMale;
            Values[LS_Cattle1To2YrsFemaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle1To2YrsFemale;
            Values[LS_Cattle2PlusYrsMaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle2PlusYrsMale;
            Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_PurchasesNumber] := LSNumbers.Cattle2PlusYrsFemale;

            { Suckler Cow }
            if ( LSNumbers.SucklerCows > 0 ) then
               Values[LS_SucklerCowsRecIndex,LS_PurchasesTotal] := LSNumbers.SucklerCowsTotal;

            { Stock Bulls }
            if ( LSNumbers.StockBulls > 0 ) then
               Values[LS_StockBullsRecIndex,LS_PurchasesTotal] := LSNumbers.StockBullsTotal;

            { Cattle 0-6 Months }
            if ( LSNumbers.Cattle0To6MthsMale > 0 ) then
               Values[LS_Cattle0To6MthsMaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle0To6MthsMaleTotal;
            if ( LSNumbers.Cattle0To6MthsFemale > 0 ) then
               Values[LS_Cattle0To6MthsFemaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle0To6MthsFemaleTotal;

            { Cattle 6-12 Months }
            if ( LSNumbers.Cattle6To12MthsMale > 0 ) then
               Values[LS_Cattle6To12MthsMaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle6To12MthsMaleTotal;
            if ( LSNumbers.Cattle6To12MthsFemale > 0 ) then
               Values[LS_Cattle6To12MthsFemaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle6To12MthsFemaleTotal;

            { Cattle 1-2 Years }
            if ( LSNumbers.Cattle1To2YrsMale > 0 ) then
               Values[LS_Cattle1To2YrsMaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle1To2YrsMaleTotal;
            if ( LSNumbers.Cattle1To2YrsFemale > 0 ) then
               Values[LS_Cattle1To2YrsFemaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle1To2YrsFemaleTotal;

            { Cattle 2+ Years }
            if ( LSNumbers.Cattle2PlusYrsMale > 0 ) then
               Values[LS_Cattle2PlusYrsMaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle2PlusYrsMaleTotal;
            if ( LSNumbers.Cattle2PlusYrsFemale > 0 ) then
               Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_PurchasesTotal] := LSNumbers.Cattle2PlusYrsFemaleTotal;

            { Suckler Cow }
            if ( LSNumbers.SucklerCows > 0 ) then
               Values[LS_SucklerCowsRecIndex,LS_PurchasesTotalLW] := LSNumbers.SucklerCowsTotalLW;
            { Stock Bulls }
            if ( LSNumbers.StockBulls > 0 ) then
               Values[LS_StockBullsRecIndex,LS_PurchasesTotalLW] := LSNumbers.StockBullsTotalLW;
            { Cattle 0-6 Months }
            if ( LSNumbers.Cattle0To6MthsMale > 0 ) then
               Values[LS_Cattle0To6MthsMaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle0To6MthsMaleTotalLW;
            if ( LSNumbers.Cattle0To6MthsFemale > 0 ) then
               Values[LS_Cattle0To6MthsFemaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle0To6MthsFemaleTotalLW;
            { Cattle 6-12 Months }
            if ( LSNumbers.Cattle6To12MthsMale > 0 ) then
               Values[LS_Cattle6To12MthsMaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle6To12MthsMaleTotalLW;
            if ( LSNumbers.Cattle6To12MthsFemale > 0 ) then
               Values[LS_Cattle6To12MthsFemaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle6To12MthsFemaleTotalLW;
            { Cattle 1-2 Years }
            if ( LSNumbers.Cattle1To2YrsMale > 0 ) then
               Values[LS_Cattle1To2YrsMaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle1To2YrsMaleTotalLW;
            if ( LSNumbers.Cattle1To2YrsFemale > 0 ) then
               Values[LS_Cattle1To2YrsFemaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle1To2YrsFemaleTotalLW;
            { Cattle 2+ Years }
            if ( LSNumbers.Cattle2PlusYrsMale > 0 ) then
               Values[LS_Cattle2PlusYrsMaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle2PlusYrsMaleTotalLW;
            if ( LSNumbers.Cattle2PlusYrsFemale > 0 ) then
               Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_PurchasesTotalLW] := LSNumbers.Cattle2PlusYrsFemaleTotalLW;
         end;


      for i := LS_SalesNumber to LS_PurchasesTotalLW do
         begin
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               begin
                  if not VarIsNull(LSMovementsGridBandedTableView.DataController.Values[j,i]) then
                     vTotal := vTotal + LSMovementsGridBandedTableView.DataController.Values[j,i];
               end;
            if (vTotal > 0) then
               begin
                  LSMovementsGridBandedTableView.DataController.Values[LS_CategoryTotal,i] := vTotal;
               end;
         end;
   finally
      StatusBar.Panels[0].Text := '';
      Screen.Cursor := crDefault;
      EnableControls(True);
   end;
end;

procedure TfmBeefProfitMonitor.SetupLivestockSummary;
var
   y, m, d : word;
   i, j : Integer;
begin
   { Get list of Years, work back from current year by 4 }

   DecodeDate(Date,y,m,d);

   cmboYear.Properties.Items.Clear;
   cmboYear.Properties.Items.Add(IntToStr(y));
   cmboYear.Properties.Items.Add(IntToStr(y-1));
   cmboYear.Properties.Items.Add(IntToStr(y-2));
   cmboYear.Properties.Items.Add(IntToStr(y-3));
   cmboYear.Properties.Items.Add(IntToStr(y-4));
   cmboYear.ItemIndex := 1;// default to last year, report is based on calendar year - GL 16/02/2009

   cmboMonth.Properties.Items.Clear;
   cmboMonth.Properties.Items.Add(SLongMonthNameJan);
   cmboMonth.Properties.Items.Add(SLongMonthNameFeb);
   cmboMonth.Properties.Items.Add(SLongMonthNameMar);
   cmboMonth.Properties.Items.Add(SLongMonthNameApr);
   cmboMonth.Properties.Items.Add(SLongMonthNameMay);
   cmboMonth.Properties.Items.Add(SLongMonthNameJun);
   cmboMonth.Properties.Items.Add(SLongMonthNameJul);
   cmboMonth.Properties.Items.Add(SLongMonthNameAug);
   cmboMonth.Properties.Items.Add(SLongMonthNameSep);
   cmboMonth.Properties.Items.Add(SLongMonthNameOct);
   cmboMonth.Properties.Items.Add(SLongMonthNameNov);
   cmboMonth.Properties.Items.Add(SLongMonthNameDec);
   cmboMonth.ItemIndex := 11; // default to December, report is based on calendar year - GL 16/02/2009


   with LSSummaryTableView.DataController do
      begin
         RecordCount := 11;
         Values[LS_SucklerCowsRecIndex,LS_Category] := cSucklerCows;
         Values[LS_StockBullsRecIndex,LS_Category] := cStockBulls;
         Values[LS_Cattle0To6MthsMaleRecIndex,LS_Category] := cCattle0To6MthsMale;
         Values[LS_Cattle0To6MthsFemaleRecIndex,LS_Category] := cCattle0To6MthsFemale;
         Values[LS_Cattle6To12MthsMaleRecIndex,LS_Category] := cCattle6To12MthsMale;
         Values[LS_Cattle6To12MthsFemaleRecIndex,LS_Category] := cCattle6To12MthsFemale;
         Values[LS_Cattle1To2YrsMaleRecIndex,LS_Category] := cCattle1To2YrsMale;
         Values[LS_Cattle1To2YrsFemaleRecIndex,LS_Category] := CCattle1To2YrsFemale;
         Values[LS_Cattle2PlusYrsMaleRecIndex,LS_Category] := cCattle2PlusYrsMale;
         Values[LS_Cattle2PlusYrsFemaleRecIndex,LS_Category] := cCattle2PlusYrsFemale;
         Values[LS_CategoryTotal,LS_Category] := cTotal;

         ClearLivestockSummaryData;
      end;
   FLivestockData := TLivestockData.Create(FHerdID);

end;

procedure TfmBeefProfitMonitor.LSSummaryTableViewCategoryStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
   AStyle := cxStyleStatic;
end;

procedure TfmBeefProfitMonitor.LSSummaryTableViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
   AAllow := False;
end;

procedure TfmBeefProfitMonitor.LSSummaryTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
   AAllow := False;
end;

procedure TfmBeefProfitMonitor.LSMovementsGridBandedTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
   AAllow := False;

end;

procedure TfmBeefProfitMonitor.LSMovementsGridBandedTableViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
   AAllow := False;

end;

procedure TfmBeefProfitMonitor.FormShow(Sender: TObject);
begin
   Panel4.Visible := False;

   //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cProfitMonSumRep);
   WinData.UpdateRecentReportUsage(cProfitMonSumRep);
end;

procedure TfmBeefProfitMonitor.LoadLivestockSummaryData;
var
   EndOfMth : TDateTime;
   LivestockNumbers : TLivestockNumbers;
   i, j : Integer;
   ColIndex : Integer;
   nMonth, nYear : Integer;
   StartDate : TDateTime;
   Month : Integer;
   sl : TStringList;
   vTotal : Variant;
   function ColumnHeaderCaption(ADate : TDateTime;const AStartMonth : Boolean=False) : string;
   begin
      if not AStartMonth then
         Result := FormatDateTime('MMM yyyy',ADate)
      else
         Result := 'Start '+FormatDateTime('MMM YY',ADate);
   end;

begin
   EnableControls(False);
   Screen.Cursor := crHourGlass;
   try
      dxComponentPrinterProfitMonitorSummary.ReportTitle.Text := Format('Beef Profit Monitor - Monthly Livestock Table to end of month %s in the year %s',[cmboMonth.Text,cmboYear.Text]);
      StatusBar.Panels[0].Text := 'Compiling Livestock Table Details, please wait...';
      Update;
      ClearLivestockSummaryData;
      FLivestockData.BuildSummaryData;

      nMonth := cmboMonth.ItemIndex + 1;
      nYear := StrToInt(cmboYear.Text);

      StartDate := FLivestockData.EndOfMonth(nYear-1, nMonth);
      for i := 11 downto -1 do
      begin
         { First get iterative date }
         FillChar(LivestockNumbers, SizeOf(TLivestockNumbers),0);

         Month := ((nMonth+12-i) mod 12);
         if Month = 0 then
            Month := 12;
          if i = -1 then
             EndOfMth := StartDate
          else if nMonth - i > 0 then   //Year does not need changing
             EndOfMth := FLivestockData.EndOfMonth(nYear, Month  )
          else
             EndOfMth := FLivestockData.EndOfMonth(nYear- 1, Month);

   //       sl := TStringList.Create;
           with FLivestockData.LivestockTable do
             begin
                First;
                while not eof do
                   begin
                      if FLivestockData.InSummary( EndOfMth ) then
                         begin
                            FBeefLivestockType := FLivestockData.GetBeefLivestockType(
                              EndOfMth,
                              FieldByName('Sex').AsString,
                              FieldByName('LactNo').AsInteger,
                              FieldByName('Breeding').AsBoolean,
                              FieldByName('DateOfBirth').AsDateTime,
                              FieldByName('FirstCalvingDate').AsDateTime,
                              FieldByName('HeiferCalvingDate').AsDateTime, // << check for projected calving of heifer
                              0,0);



                            case FBeefLivestockType of
                            atSucklerCow : Inc(LivestockNumbers.SucklerCows);
                            atStockBull : Inc(LivestockNumbers.StockBulls);
                            atCattle0To6MthsMale : Inc(LivestockNumbers.Cattle0To6MthsMale);
                            atCattle0To6MthsFemale : Inc(LivestockNumbers.Cattle0To6MthsFemale);
                            atCattle6To12MthsMale : Inc(LivestockNumbers.Cattle6To12MthsMale);
                            atCattle6To12MthsFemale : Inc(LivestockNumbers.Cattle6To12MthsFemale);
                            atCattle1To2YrsMale : Inc(LivestockNumbers.Cattle1To2YrsMale);
                            atCattle1To2YrsFemale : Inc(LivestockNumbers.Cattle1To2YrsFemale);
                            atCattle2PlusYrsMale : Inc(LivestockNumbers.Cattle2PlusYrsMale);
                            atCattle2PlusYrsFemale : Inc(LivestockNumbers.Cattle2PlusYrsFemale);
                            end;

                            {
                            if i = -1 then
                               begin
                                  sl.Add( FieldByName('NatIDNum').AsString);
                               end;
                            }
                         end;
                      Next;
                   end;
   //             sl.SaveToFile(Format('C:\Summary_%d.txt',[i]));
     //           sl.Free;
             end;

            if i = -1 then
               ColIndex := 1
            else
               begin
                  ColIndex := ((nMonth+12-i) mod 12);
                  if ColIndex = 0 then
                     ColIndex := 12 + 1 // Month Index 12 (DEC) + 2 extra two are for category and start
                  else
                     ColIndex := ColIndex +1;
               end;

            if i = -1 then
               LSSummaryTableView.FindItemByID( ColIndex ).Caption := ColumnHeaderCaption(EndOfMth+1,True)
            else
               LSSummaryTableView.FindItemByID( ColIndex ).Caption := ColumnHeaderCaption(EndOfMth);

            with LSSummaryTableView.DataController do
               begin
                  Values[LS_SucklerCowsRecIndex,ColIndex] := LivestockNumbers.SucklerCows;
                  Values[LS_StockBullsRecIndex,ColIndex] := LivestockNumbers.StockBulls;
                  Values[LS_Cattle0To6MthsMaleRecIndex,ColIndex] := LivestockNumbers.Cattle0To6MthsMale;
                  Values[LS_Cattle0To6MthsFemaleRecIndex,ColIndex] := LivestockNumbers.Cattle0To6MthsFemale;
                  Values[LS_Cattle6To12MthsMaleRecIndex,ColIndex] := LivestockNumbers.Cattle6To12MthsMale;
                  Values[LS_Cattle6To12MthsFemaleRecIndex,ColIndex] := LivestockNumbers.Cattle6To12MthsFemale;
                  Values[LS_Cattle1To2YrsMaleRecIndex,ColIndex] := LivestockNumbers.Cattle1To2YrsMale;
                  Values[LS_Cattle1To2YrsFemaleRecIndex,ColIndex] := LivestockNumbers.Cattle1To2YrsFemale;
                  Values[LS_Cattle2PlusYrsMaleRecIndex,ColIndex] := LivestockNumbers.Cattle2PlusYrsMale;
                  Values[LS_Cattle2PlusYrsFemaleRecIndex,ColIndex] := LivestockNumbers.Cattle2PlusYrsFemale;
               end;
      end;

      with LSSummaryTableView.DataController do // Calc Totals/Averages
         begin
            // Start Month Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Start]) then
                  vTotal := vTotal + Values[j,LS_Start];
            Values[LS_CategoryTotal,LS_Start] := vTotal;

            // Jan Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Jan]) then
                  vTotal := vTotal + Values[j,LS_Jan];
            Values[LS_CategoryTotal,LS_Jan] := vTotal;

            // Feb Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Feb]) then
                  vTotal := vTotal + Values[j,LS_Feb];
            Values[LS_CategoryTotal,LS_Feb] := vTotal;

            // Mar Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Mar]) then
                  vTotal := vTotal + Values[j,LS_Mar];
            Values[LS_CategoryTotal,LS_Mar] := vTotal;

            // Apr Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Apr]) then
                  vTotal := vTotal + Values[j,LS_Apr];
            Values[LS_CategoryTotal,LS_Apr] := vTotal;

            // May Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_May]) then
                  vTotal := vTotal + Values[j,LS_May];
            Values[LS_CategoryTotal,LS_May] := vTotal;

            // Jun Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Jun]) then
                  vTotal := vTotal + Values[j,LS_Jun];
            Values[LS_CategoryTotal,LS_Jun] := vTotal;

            // Jul Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Jul]) then
                  vTotal := vTotal + Values[j,LS_Jul];
            Values[LS_CategoryTotal,LS_Jul] := vTotal;

            // Aug Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Aug]) then
                  vTotal := vTotal + Values[j,LS_Aug];
            Values[LS_CategoryTotal,LS_Aug] := vTotal;

            // Sept Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Sep]) then
                  vTotal := vTotal + Values[j,LS_Sep];
            Values[LS_CategoryTotal,LS_Sep] := vTotal;

            // Oct Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Oct]) then
                  vTotal := vTotal + Values[j,LS_Oct];
            Values[LS_CategoryTotal,LS_Oct] := vTotal;

            // Nov Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Nov]) then
                  vTotal := vTotal + Values[j,LS_Nov];
            Values[LS_CategoryTotal,LS_Nov] := vTotal;

            // Dec Totals
            vTotal := 0;
            for j := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               if not VarIsNull(Values[j,LS_Dec]) then
                  vTotal := vTotal + Values[j,LS_Dec];
            Values[LS_CategoryTotal,LS_Dec] := vTotal;

            for i := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
               begin
                  vTotal := 0;
                  for j := LS_Jan to LS_Dec do
                     if not VarIsNull(Values[i,j]) then
                        vTotal := vTotal + Values[i,j];
                  if (vTotal > 0) then
                     begin
                        Values[i,LS_MonthTotal] := vTotal;
                        Values[i,LS_MonthAverage] := vTotal/12;
                     end;
               end;
         end;
   finally
      StatusBar.Panels[0].Text := '';
      Screen.Cursor := crDefault;
      EnableControls(True);

   end;
end;

procedure TfmBeefProfitMonitor.cxButton6Click(Sender: TObject);
begin
   LoadLivestockSummaryData;
end;

procedure TfmBeefProfitMonitor.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
   FreeAndNil(FLivestockData);
   FreeAndNil(ImageStore);
end;

procedure TfmBeefProfitMonitor.FormCreate(Sender: TObject);
begin
   FInDebugMode := IsWinherdDebugging;
   BarControlContainerForHerdID.Control := frmHerdID;
   FFormShowing := False;
   ImageStore := TImageStore.Create(nil);
end;

procedure TfmBeefProfitMonitor.frmHerdIDHerdComboPropertiesChange(
  Sender: TObject);
begin
   if FFormShowing then
      begin
         FHerdID := frmHerdID.HerdCombo.EditValue;
         if MessageDlg('Reload Profit Monitor data?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               LoadAllData;
            end;
      end;
end;

procedure TfmBeefProfitMonitor.FormActivate(Sender: TObject);
begin
   if not FFormShowing then
      begin
         FFormShowing := True;
         Update;
         DataTimer.Enabled := True;
      end;
end;

procedure TfmBeefProfitMonitor.cmboMonthPropertiesChange(Sender: TObject);
begin

   if FFormShowing then
      begin
         if MessageDlg('Do you want to recalculate '+tsProfitMonitorSummary.Caption+'?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               LoadLivestockSummaryData;
            end;
      end;

end;

procedure TfmBeefProfitMonitor.FromDatePropertiesChange(Sender: TObject);
begin
   if FFormShowing then
      begin
         if MessageDlg('Do you want to recalculate '+tsLiveStockMovements.Caption+'?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               LoadLivestockMovementData;
            end;
      end;
end;

procedure TfmBeefProfitMonitor.actExportLivestockSalesAndPurchasesExecute(
  Sender: TObject);
begin
   SaveDialog.InitialDir := ApplicationPath;
   if SaveDialog.Execute then
      begin
         if FileExists(SaveDialog.FileName) then
            if MessageDlg(cFileOverwrite,mtConfirmation,[mbYes,mbNo],0) = idNo then
               exit;

         ExportGrid4ToExcel(SaveDialog.FileName,LSMovementsGrid);
         if FileExists(SaveDialog.FileName) then
            MessageDlg(Format(cFileCreated,[SaveDialog.FileName]),mtInformation,[mbOK],0)
         else
            MessageDlg(cFileCreateError,mtError,[mbOK],0);
      end;
end;

procedure TfmBeefProfitMonitor.actPrintLivestockSalesAndPurchasesExecute(
  Sender: TObject);
begin
   if Length(dxComponentPrinter1.PrintTitle) = 0 then
      dxComponentPrinter1.PrintTitle := 'Kingswood Grid Print';
   if not dxComponentPrinterLSMovements.PreviewExists then
      dxComponentPrinterLSMovements.Preview
end;

procedure TfmBeefProfitMonitor.actExportProfitMonitorSummaryExecute(
  Sender: TObject);
begin
   SaveDialog.InitialDir := ApplicationPath;
   if SaveDialog.Execute then
      begin
         if FileExists(SaveDialog.FileName) then
            if MessageDlg(cFileOverwrite,mtConfirmation,[mbYes,mbNo],0) = idNo then
               exit;

         ExportGrid4ToExcel(SaveDialog.FileName,LSSummary);
         if FileExists(SaveDialog.FileName) then
            MessageDlg(Format(cFileCreated,[SaveDialog.FileName]),mtInformation,[mbOK],0)
         else
            MessageDlg(cFileCreateError,mtError,[mbOK],0);
      end;
end;

procedure TfmBeefProfitMonitor.actPrintProfitMonitorSummaryExecute(
  Sender: TObject);
begin
   if Length(dxComponentPrinter1.PrintTitle) = 0 then
      dxComponentPrinter1.PrintTitle := 'Kingswood Grid Print';
   if not dxComponentPrinterProfitMonitorSummary.PreviewExists then
      dxComponentPrinterProfitMonitorSummary.Preview
end;

procedure TfmBeefProfitMonitor.ClearLivestockMovementData;
var
   i,j : Integer;
begin
   for i := LS_SucklerCowsRecIndex to LS_Cattle2PlusYrsFemaleRecIndex do
      for j := LS_SalesNumber to LS_PurchasesTotalLW do
         LSMovementsGridBandedTableView.DataController.Values[i,j] := Null;
end;

procedure TfmBeefProfitMonitor.ClearLivestockSummaryData;
var
   i,j : Integer;
begin
   for i := LS_SucklerCowsRecIndex to LS_CategoryTotal do
      for j := LS_Start to LS_MonthAverage do
         LSSummaryTableView.DataController.Values[i,j] := Null;
end;

procedure TfmBeefProfitMonitor.CheckInputDates;
begin
   if ( FromDate.Date > ToDate.Date ) then
      begin
         MessageDlg('"From Date" must be on or before "To Date" - resetting dates',mtError,[mbOK],0);
         SetDefaultDates;
         Abort;
      end;
end;

procedure TfmBeefProfitMonitor.SetDefaultDates;
var
   y, m, d : word;
begin
   // default to last year, report is based on calendar year - GL 16/02/2009
   DecodeDate(Date, y, m, d);
   FromDate.Date := EncodeDate(y-1, 1, 1);
   ToDate.Date := EncodeDate(y-1, 12, 31);
end;

procedure TfmBeefProfitMonitor.DataTimerTimer(Sender: TObject);
begin
   DataTimer.Enabled := False;
   if FProfitMonitorReportType = pmrtSalesPurchases then
      begin
         LoadLivestockMovementData;
      end
   else if FProfitMonitorReportType = pmrtSummary then
      begin
         LoadLivestockSummaryData;
      end
   else
      begin
         LoadAllData;
      end;
end;

procedure TfmBeefProfitMonitor.EnableControls(AEnable: Boolean);
begin
   pcProfitMonitor.Enabled := AEnable;
   frmHerdID.Enabled := AEnable;
   actPrintLivestockSalesAndPurchases.Enabled := AEnable;
   actPrintProfitMonitorSummary.Enabled := AEnable;
   actExit.Enabled := AEnable;
   actExportLivestockSalesAndPurchases.Enabled := AEnable;
   actExportProfitMonitorSummary.Enabled := AEnable;
   actHelp.Enabled := AEnable;
end;

procedure TfmBeefProfitMonitor.pcProfitMonitorChange(Sender: TObject);
begin
   if pcProfitMonitor.ActivePage = tsProfitMonitorSummary then
      StatusBar.Panels[1].Text := 'Note: If the Monthly Livestock Table includes future dates, it may include projected births'
   else
      StatusBar.Panels[1].Text := '';
end;

function TfmBeefProfitMonitor.CalcLW(AColdWeight, ALiveWeight, AKillOutPerc : Double) : Double;
begin
   Result := 0;
   if (AColdWeight <= 0 ) or (AKillOutPerc <= 0) then
      Result := ALiveWeight
   else if (AColdWeight > 0 ) and (ALiveWeight > 0) then
      begin
         if ((ALiveWeight / AColdWeight) > 1.5 ) then
            Result := ALiveWeight
         else
            Result := (( AColdWeight * 100) / ( AKillOutPerc ));
      end
   else if (AColdWeight > 0 ) and (AKillOutPerc > 0) then
      Result := (( AColdWeight * 100) / ( AKillOutPerc ));
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmBeefProfitMonitor.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cProfitMonSumRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cProfitMonSumRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.

