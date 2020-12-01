{
   02/04/12 [V5.0 R4.8] /MK Additional Feature - No Favourite For This Report As Only QuickReport Shows OnClick.
}

unit uReproductiveSummaryInterface;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, uReproductiveSummary, Grids, DBGrids, Db, DBTables,
  MemTable, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, QuickRpt, QRCtrls, ExtCtrls, QRExport, GenTypesConst;

type
  TfmReproductiveSummaryInterface = class(TForm)
    btnCalcSummary: TcxButton;
    Label1: TLabel;
    MemoryTable1: TMemoryTable;
    MemoryTable1ID: TIntegerField;
    MemoryTable1AnimalID: TIntegerField;
    MemoryTable1AnimalLactNo: TIntegerField;
    MemoryTable1EventType: TIntegerField;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    BatchMove1: TBatchMove;
    cxLabel23: TcxLabel;
    ReproductiveSummaryReportExtended: TQuickRep;
    ReproductiveSummaryReport: TQuickRep;
    QRBand4: TQRBand;
    QRLabel15: TQRLabel;
    QRBand5: TQRBand;
    QRShape34: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    lFirstLactUpToVWP: TQRLabel;
    lFirstLactVWPTo100: TQRLabel;
    lFirstLact100Plus: TQRLabel;
    lSecondLactUpToVWP: TQRLabel;
    lSecondLactVWPTo100: TQRLabel;
    lSecondLact100Plus: TQRLabel;
    lThirdPlusLactUpToVWP: TQRLabel;
    lThirdPlusLactVWPTo100: TQRLabel;
    lThirdPlusLact100Plus: TQRLabel;
    lAllLactUpToVWP: TQRLabel;
    lAllLactVWPTo100: TQRLabel;
    lAllLact100Plus: TQRLabel;
    lPercOfFirstServiceFewerThanVWP: TQRLabel;
    lPercOfFirstServiceVWPto100: TQRLabel;
    lPercOfFirstServiceOver100: TQRLabel;
    QRLabel61: TQRLabel;
    lFirstLactAvgDaysToFirstService: TQRLabel;
    lSecondLactAvgDaysToFirstService: TQRLabel;
    lThirdPlusLactAvgDaysToFirstService: TQRLabel;
    lAllLactAvgDaysToFirstService: TQRLabel;
    lFirstLactServicesPerPregCows: TQRLabel;
    lSecondLactServicesPerPregCows: TQRLabel;
    lThirdPlusLactServicesPerPregCows: TQRLabel;
    lAllLactServicesPerPregCows: TQRLabel;
    lFirstLactServicesPerAllCows: TQRLabel;
    lSecondLactServicesPerAllCows: TQRLabel;
    lThirdPlusLactServicesPerAllCows: TQRLabel;
    lAllLactServicesPerAllCows: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    lHeatServiceIntervalLessThan18: TQRLabel;
    lHeatServiceInterval18to24: TQRLabel;
    lHeatServiceInterval36To48: TQRLabel;
    lHeatServiceIntervalOther: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    lService12MthFirstServices: TQRLabel;
    lService12MthSecondServices: TQRLabel;
    lService12MthThirdPlusServices: TQRLabel;
    lService12MthTotalServices: TQRLabel;
    QRLabel96: TQRLabel;
    lService12MthFirstServiceSuccessRate: TQRLabel;
    lService12MthSecondServiceSuccessRate: TQRLabel;
    lService12MthThirdPlusServiceSuccessRate: TQRLabel;
    lService12MthTotalServicesSuccessRate: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRBand6: TQRBand;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    lFirstLactCalvingInterval: TQRLabel;
    lSecondLactCalvingInterval: TQRLabel;
    lThirdPlusLactCalvingInterval: TQRLabel;
    lAllLactCalvingInterval: TQRLabel;
    lAllLactDaysOpen: TQRLabel;
    lThirdPlusLactDaysOpen: TQRLabel;
    lSecondLactDaysOpen: TQRLabel;
    lFirstLactDaysOpen: TQRLabel;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRShape25: TQRShape;
    QRShape12: TQRShape;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrlFirstLactUpToVWP: TQRLabel;
    qrlFirstLactVWPTo100: TQRLabel;
    qrlFirstLact100Plus: TQRLabel;
    qrlSecondLactUpToVWP: TQRLabel;
    qrlSecondLactVWPTo100: TQRLabel;
    qrlSecondLact100Plus: TQRLabel;
    qrlThirdPlusLactUpToVWP: TQRLabel;
    qrlThirdPlusLactVWPTo100: TQRLabel;
    qrlThirdPlusLact100Plus: TQRLabel;
    qrlAllLactUpToVWP: TQRLabel;
    qrlAllLactVWPTo100: TQRLabel;
    qrlAllLact100Plus: TQRLabel;
    qrlPercOfFirstServiceFewerThanVWP: TQRLabel;
    qrlPercOfFirstServiceVWPto100: TQRLabel;
    qrlPercOfFirstServiceOver100: TQRLabel;
    QRLabel13: TQRLabel;
    qrlFirstLactAvgDaysToFirstService: TQRLabel;
    qrlSecondLactAvgDaysToFirstService: TQRLabel;
    qrlThirdPlusLactAvgDaysToFirstService: TQRLabel;
    qrlAllLactAvgDaysToFirstService: TQRLabel;
    qrlFirstLactServicesPerPregCows: TQRLabel;
    qrlSecondLactServicesPerPregCows: TQRLabel;
    qrlThirdPlusLactServicesPerPregCows: TQRLabel;
    qrlAllLactServicesPerPregCows: TQRLabel;
    qrlFirstLactServicesPerAllCows: TQRLabel;
    qrlSecondLactServicesPerAllCows: TQRLabel;
    qrlThirdPlusLactServicesPerAllCows: TQRLabel;
    qrlAllLactServicesPerAllCows: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrlHeatServiceIntervalLessThan18: TQRLabel;
    qrlHeatServiceInterval18to24: TQRLabel;
    qrlHeatServiceInterval36To48: TQRLabel;
    qrlHeatServiceIntervalOther: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    qrlService12MthFirstServices: TQRLabel;
    qrlService12MthSecondServices: TQRLabel;
    qrlService12MthThirdPlusServices: TQRLabel;
    qrlService12MthTotalServices: TQRLabel;
    QRLabel32: TQRLabel;
    qrlService12MthFirstServiceSuccessRate: TQRLabel;
    qrlService12MthSecondServiceSuccessRate: TQRLabel;
    qrlService12MthThirdPlusServiceSuccessRate: TQRLabel;
    qrlService12MthTotalServicesSuccessRate: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape18: TQRShape;
    QRShape20: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRBand3: TQRBand;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel35: TQRLabel;
    lCurrentActualCalvingInterval: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure FormCreate(Sender: TObject);
    procedure btnCalcSummaryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ReproductiveSummary : TTotalHerdReproductiveSummary;
  public
    { Public declarations }
  end;

  procedure PreviewReproductiveSummary;

var
  fmReproductiveSummaryInterface: TfmReproductiveSummaryInterface;

implementation

uses DairyData;

{$R *.DFM}

  procedure PreviewReproductiveSummary;
  begin
     with TfmReproductiveSummaryInterface.Create(nil) do
        try
           btnCalcSummary.Click;
        finally
           Free;
        end;
  end;


procedure TfmReproductiveSummaryInterface.FormCreate(Sender: TObject);
begin
   if ReproductiveSummary = nil then
      ReproductiveSummary := TTotalHerdReproductiveSummary.Create;
   ReproductiveSummaryReport.Hide;
   cxSpinEdit1.Value := 1;
   cxSpinEdit2.Value := 30;
   Label1.Caption := '';
   WinData.UpdateRecentReportUsage(cSpreadCalvHerdRep);
end;

procedure TfmReproductiveSummaryInterface.btnCalcSummaryClick(
  Sender: TObject);
var
  CBRValue: TCowByRange;
  LRValue: TLactationRange;
begin
   Label1.Caption := '';
   with ReproductiveSummary do
   try
   ReproductiveSummary.QueryHerdID := WinData.UserDefaultHerdID;
   CBRValue.ByLactation := True;
   CBRValue.EventType := 0;
   CBRValue.EventDateRange.EventDateStart := 0;
   CBRValue.EventDateRange.EventDateEnd := 0;
   ReproductiveSummary.CowByRange := CBRValue;
   ReproductiveSummary.ServiceCalcAnimals := iaAll;

   LRValue.LactationStart := cxSpinEdit1.Value;
   LRValue.LactationEnd := cxSpinEdit2.Value;
   ReproductiveSummary.LactationRange := LRValue;

   Screen.Cursor := crHourGlass;
   try
      //StartTime := GetTickCount;
      ReproductiveSummary.CalcSummary;
      //EndTime := GetTickCount;
      //cxLabel23.Caption := Format('Elapsed Seconds: %d',[Trunc((EndTime - StartTime / 1000))]);
   finally
      Screen.Cursor := crDefault;
   end;

   with ReproductiveSummary do
   begin
      {   Label1.Caption                                  := Format('Total Records: %d',[RecordCount]);

         qrlFirstLactUpToVWP.Caption                        := IntToStr(FirstLactFewerThanVWP);
         qrlFirstLactVWPTo100.Caption                       := IntToStr(FirstLactVWPto100);
         qrlFirstLact100Plus.Caption                        := IntToStr(FirstLactOver100);
         qrlFirstLactAvgDaysToFirstService.Caption          := IntToStr(FirstLactAvgDaysToFirstService);
         qrlFirstLactServicesPerPregCows.Caption            := IntToStr(FirstLactServesPerPregCows);
         qrlFirstLactServicesPerAllCows.Caption             := IntToStr(FirstLactServesPerAllCows);

         qrlSecondLactUpToVWP.Caption                       := IntToStr(SecondLactFewerThanVWP);
         qrlSecondLactVWPTo100.Caption                      := IntToStr(SecondLactVWPto100);
         qrlSecondLact100Plus.Caption                       := IntToStr(SecondLactOver100);
         qrlSecondLactAvgDaysToFirstService.Caption         := IntToStr(SecondLactAvgDaysToFirstService);
         qrlSecondLactServicesPerPregCows.Caption           := IntToStr(SecondLactServesPerPregCows);
         qrlSecondLactServicesPerAllCows.Caption            := IntToStr(SecondLactServesPerAllCows);

         qrlThirdPlusLactUpToVWP.Caption                    := IntToStr(ThirdPlusLactFewerThanVWP);
         qrlThirdPlusLactVWPTo100.Caption                   := IntToStr(ThirdPlusLactVWPto100);
         qrlThirdPlusLact100Plus.Caption                    := IntToStr(ThirdPlusLactOver100);
         qrlThirdPlusLactAvgDaysToFirstService.Caption      := IntToStr(ThirdPlusLactAvgDaysToFirstService);
         qrlThirdPlusLactServicesPerPregCows.Caption        := IntToStr(ThirdPlusLactServesPerPregCows);
         qrlThirdPlusLactServicesPerAllCows.Caption         := IntToStr(ThirdPlusLactServesPerAllCows);

         qrlAllLactUpToVWP.Caption                          := IntToStr(AllLactFewerThanVWP);
         qrlAllLactVWPTo100.Caption                         := IntToStr(AllLactVWPto100);
         qrlAllLact100Plus.Caption                          := IntToStr(AllLactOver100);
         qrlAllLactAvgDaysToFirstService.Caption            := IntToStr(AllLactAvgDaysToFirstService);
         qrlAllLactServicesPerPregCows.Caption              := IntToStr(AllLactServesPerPregCows);
         qrlAllLactServicesPerAllCows.Caption               := IntToStr(AllLactServesPerAllCows);

         qrlHeatServiceIntervalLessThan18.Caption           := IntToStr(HeatsServicesIntervals.IntervalLessThan18);;
         qrlHeatServiceInterval18to24.Caption               := IntToStr(HeatsServicesIntervals.Interval18To24);
         qrlHeatServiceInterval36To48.Caption               := IntToStr(HeatsServicesIntervals.Interval36To48);
         qrlHeatServiceIntervalOther.Caption                := IntToStr(HeatsServicesIntervals.IntervalOther);

         qrlService12MthFirstServices.Caption               := IntToStr(ServicesRecord.NoFirstServices);;
         qrlService12MthFirstServiceSuccessRate.Caption     := FormatFloat('#.##', ServicesRecord.NoFirstServicesSuccessRatePerc);

         qrlService12MthSecondServices.Caption              := IntToStr(ServicesRecord.NoSecondServices);;
         qrlService12MthSecondServiceSuccessRate.Caption    := FormatFloat('#.##', ServicesRecord.NoSecondServicesSuccessRatePerc);

         qrlService12MthThirdPlusServices.Caption           := IntToStr(ServicesRecord.NoThirdPlusServices);
         qrlService12MthThirdPlusServiceSuccessRate.Caption := FormatFloat('#.##', ServicesRecord.NoThirdPlusServicesSuccessRatePerc);

         qrlService12MthTotalServices.Caption               := IntToStr(ServicesRecord.NoTotalServices);;
         qrlService12MthTotalServicesSuccessRate.Caption    := FormatFloat('#.##', ServicesRecord.NoTotalServicesServicesSuccessRatePerc);

         qrlPercOfFirstServiceFewerThanVWP.Caption          :=  FormatFloat('#.##', PercOfFirstServiceFewerThanVWP);
         qrlPercOfFirstServiceVWPto100.Caption              :=  FormatFloat('#.##', PercOfFirstServiceVWPto100);
         qrlPercOfFirstServiceOver100.Caption               :=  FormatFloat('#.##', PercOfFirstServiceOver100);
       }

         lFirstLactUpToVWP.Caption                        := IntToStr(FirstLactFewerThanVWP);
         lFirstLactVWPTo100.Caption                       := IntToStr(FirstLactVWPto100);
         lFirstLact100Plus.Caption                        := IntToStr(FirstLactOver100);
         lFirstLactAvgDaysToFirstService.Caption          := IntToStr(FirstLactAvgDaysToFirstService);
         lFirstLactServicesPerPregCows.Caption            := IntToStr(FirstLactServesPerPregCows);
         lFirstLactServicesPerAllCows.Caption             := IntToStr(FirstLactServesPerAllCows);
         lFirstLactCalvingInterval.Caption                := IntToStr(FirstLactCalvingInterval);
         lFirstLactDaysOpen.Caption                       := IntToStr(FirstLactDaysOpen);

         lSecondLactUpToVWP.Caption                       := IntToStr(SecondLactFewerThanVWP);
         lSecondLactVWPTo100.Caption                      := IntToStr(SecondLactVWPto100);
         lSecondLact100Plus.Caption                       := IntToStr(SecondLactOver100);
         lSecondLactAvgDaysToFirstService.Caption         := IntToStr(SecondLactAvgDaysToFirstService);
         lSecondLactServicesPerPregCows.Caption           := IntToStr(SecondLactServesPerPregCows);
         lSecondLactServicesPerAllCows.Caption            := IntToStr(SecondLactServesPerAllCows);
         lSecondLactCalvingInterval.Caption               := IntToStr(SecondLactCalvingInterval);
         lSecondLactDaysOpen.Caption                      := IntToStr(SecondLactDaysOpen);

         lThirdPlusLactUpToVWP.Caption                    := IntToStr(ThirdPlusLactFewerThanVWP);
         lThirdPlusLactVWPTo100.Caption                   := IntToStr(ThirdPlusLactVWPto100);
         lThirdPlusLact100Plus.Caption                    := IntToStr(ThirdPlusLactOver100);
         lThirdPlusLactAvgDaysToFirstService.Caption      := IntToStr(ThirdPlusLactAvgDaysToFirstService);
         lThirdPlusLactServicesPerPregCows.Caption        := IntToStr(ThirdPlusLactServesPerPregCows);
         lThirdPlusLactServicesPerAllCows.Caption         := IntToStr(ThirdPlusLactServesPerAllCows);
         lThirdPlusLactCalvingInterval.Caption            := IntToStr(ThirdPlusLactCalvingInterval);
         lThirdPlusLactDaysOpen.Caption                   := IntToStr(ThirdPlusLactDaysOpen);

         lAllLactUpToVWP.Caption                          := IntToStr(AllLactFewerThanVWP);
         lAllLactVWPTo100.Caption                         := IntToStr(AllLactVWPto100);
         lAllLact100Plus.Caption                          := IntToStr(AllLactOver100);
         lAllLactAvgDaysToFirstService.Caption            := IntToStr(AllLactAvgDaysToFirstService);
         lAllLactServicesPerPregCows.Caption              := IntToStr(AllLactServesPerPregCows);
         lAllLactServicesPerAllCows.Caption               := IntToStr(AllLactServesPerAllCows);
         lAllLactCalvingInterval.Caption                  := IntToStr(AllLactCalvingInterval);
         lAllLactDaysOpen.Caption                         := IntToStr(AllLactDaysOpen);

         lHeatServiceIntervalLessThan18.Caption           := IntToStr(HeatsServicesIntervals.IntervalLessThan18);;
         lHeatServiceInterval18to24.Caption               := IntToStr(HeatsServicesIntervals.Interval18To24);
         lHeatServiceInterval36To48.Caption               := IntToStr(HeatsServicesIntervals.Interval36To48);
         lHeatServiceIntervalOther.Caption                := IntToStr(HeatsServicesIntervals.IntervalOther);

         lService12MthFirstServices.Caption               := IntToStr(ServicesRecord.NoFirstServices);;
         lService12MthFirstServiceSuccessRate.Caption     := FormatFloat('#.##', ServicesRecord.NoFirstServicesSuccessRatePerc);

         lService12MthSecondServices.Caption              := IntToStr(ServicesRecord.NoSecondServices);;
         lService12MthSecondServiceSuccessRate.Caption    := FormatFloat('#.##', ServicesRecord.NoSecondServicesSuccessRatePerc);

         lService12MthThirdPlusServices.Caption           := IntToStr(ServicesRecord.NoThirdPlusServices);
         lService12MthThirdPlusServiceSuccessRate.Caption := FormatFloat('#.##', ServicesRecord.NoThirdPlusServicesSuccessRatePerc);

         lService12MthTotalServices.Caption               := IntToStr(ServicesRecord.NoTotalServices);;
         lService12MthTotalServicesSuccessRate.Caption    := FormatFloat('#.##', ServicesRecord.NoTotalServicesServicesSuccessRatePerc);

         lPercOfFirstServiceFewerThanVWP.Caption          := FormatFloat('#.##', PercOfFirstServiceFewerThanVWP);
         lPercOfFirstServiceVWPto100.Caption              := FormatFloat('#.##', PercOfFirstServiceVWPto100);
         lPercOfFirstServiceOver100.Caption               := FormatFloat('#.##', PercOfFirstServiceOver100);

         lCurrentActualCalvingInterval.Caption            := IntToStr(CurrentActualCalvingInterval);

         ReproductiveSummaryReport.Preview;
         end;
   finally
      Update;
   end;
end;

procedure TfmReproductiveSummaryInterface.FormDestroy(Sender: TObject);
begin
   if ReproductiveSummary <> nil then
      FreeAndNil(ReproductiveSummary);
end;

end.
