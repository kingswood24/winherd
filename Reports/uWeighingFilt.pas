// ** NB - This form is taking a long time to create because of the 5 quick report on it.
//         Need to consider separating the quick reports from the form itself to speed it up - MK 06/11/20

{
   19/10/10 [V4.0 R5.1] /MK Bug Fix - Changed WeighingRep TitleBand to a PageHeaderBand.

   22/10/10 [V4.0 R5.1] /MK Additional Feature - Added Report Type to select either WeightGain Or Latest Weighing Report
                                               - Added RecentWeighingDate, RecentWeight, LastWeighingDate and LastWeight Fields to tWeighing.
                                               - Added AgeDays and WeightGain Fields to tWeighing for easiness in calculations.

   26/10/10 [V4.0 R5.1] /MK Additional Feature - If LastWeighingDate/Weight Is 0 Then RecentWeighingRep/LastWeighingDate/Weight Is Blank.
                                               - If LastWeighingDate/Weight = 0 Then LastWeighingDate/Weight = PurchWeighingDate/Weight.
                                               - If LastWeighingDate/Weight > PurchWeighing Then LastWeighingDate/Weight = LastWeighingDate/Weight.
                                               - Changed Layout of WeighinRep As It Was Cluttered.

   22/12/10 [V4.0 R7.3] /MK Additional Feature - Add BirthWeight and Sire To Latest Weighings Report.
                                               - Add Averages For Birth Weight, Latest Weight and Last Weight.

   08/06/11 [V4.1 R1.8] /MK Additional Feature - Added Progress Bar.
                                               - Added cxTextEdit Field To Allow User To Enter In Custom Report Title.

   24/08/11 [V5.0 R0.2] /MK Additional Feature - Average Figures For Birth Weight and Age (Days) In Latest Weighing.
                                               - Add Supplier Drop Down List And Set Custom Report Title To This Supplier If No Filter Applied.
                                               - On LoadDefaults Not Checking For Report Type - SortBy Item 4 Was Not Being Set Properly.
                                               - Calculation Of Average Gain Per Day Per Interval Should Be TotalWeightGain / TotalNumDays.
                                               - Latest Weighing Report - Show Purchase Weight Instead Of Birth Weight If Herd Type Is Beef.
                                               - If >2 Weighings Selected Show Tick Box For Summary Report Only - Tick If Default - On View
                                                 or Print Click Only Show The Summary Report.
                                               - Print Button Was Viewing The Report.

   09/09/11 [V5.0 R0.6] /MK Additional Feature - Now Recording The WeightGain And WeightGainPerDay In tWeighings As A New Field.
                                               - Calculating A Weighted Averaged WeightGainPerDay On Weight Gain Report.

   07/10/11 [V5.0 R1.3] /MK Additional Feature - Added Sex & SireNo To The AnimalDetailBand.
                                               - Now Showing Full Height Of WeighingRep.AnimalDetailBand.

   10/10/11 [V5.0 R1.3] /MK Change - Changed Order Of WeighingDetailBand Like Setup Animals Order.
                         Additional Feature - Show Full Detail If BirthWeight Or Purchase Details Exist.

   26/10/11 [V5.0 R1.7] /MK Change - Changed Caption Of QRLabel5 From Interval No. To No. Animals Weighed.

   20/01/12 [V5.0 R3.6] /MK Bug Fix - Fixes To WeightGain And >2 Weighings Report Where If WeightGain = 0 And DaysBetween Is Zero Then Report Showed Error.

   22/03/12 [V5.0 R4.5] /MK Change - Changes Made To Calc Weight Gain From BirthWeight and Purchase Weight If Birth Weight Exists.
                         Bug Fix - First SQL Was Not Removing Animals That Were Deleted.

   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   08/08/12 [V5.0 R8.5] /MK Changed - Changed caption of QRLabel15 From No. Animals Weighing to Weighing Interval.
                                    - Moved headings of IntervalAnalysisRpt above data as per Gerry's request.
                        /MK Bug Fix - BuildWeighings - Report was never filtering by Weighing Date in Latest or Weight Gain Reports.

   09/08/12 [V5.0 R8.5] /MK Bug Fix - If Weight Gain report then sort by Weight Gain Per Day field.

   18/09/12 [V5.0 R9.9] /MK Change - New procedure created to create SortByItems dependent on Number Select.
                        /MK Bug Fix - New procedure will fix report always sorting by Animal Number if Number Select is Animal Number.

   04/12/12 [V5.1 R3.3] /MK Additional Feature - Added new Target Weights Report for Latest Weighings.

   20/06/13 [V5.1 R7.5] /MK Additional Feature - Added Mean Weighing Date to Interval Report.

   20/10/14 [V5.3 R8.5] /MK Additional Feature - Added Age In Days instead of Date of Birth depending on cbShowAgeInDays.Checked
                                                 in Weight Gain report - William Hutchinson.

   16/04/15 [V5.4 R4.8] /MK Additional Feature - WeightGainDetailBandBeforePrint - Apply main grid colour settings to weight gain report - William Hutchinson request.

   16/12/16 [V5.6 R3.8] /MK Bug Fix - If user uses Purchase From Date filter than animals prior to purchase date were appearing on reports.
                                    - TWeighingRecord values were not all set to zero when it was initialized causing invalid data to appear on the report.
                                    ** There is an invalid floating point operation appearing on some machines (Sean's laptop, Demo laptop) for some set's of
                                       data, not all. I traced this problem back to V5.0 R5.2 version from 2011. This error was not in the V5.0 R4.7 version.
                                       I compared the source of both versions and removed the changes  that were made in V5.0 R5.2 from the .pas file in my current version.
                                       There were only top changes in the dfm between these two versions. I then tested the new version on the Demo laptop but got the same error.
                                       This problem has been going on since this version but only on some machine's. **

   28/03/17 [V5.6 R6.8] /MK Bug Fix - Added try except around assigning weight gain and NumDays in CreateIntervals as there was an unexplainable error assigning NumDays - Eddie Jordan.

   16/05/17 [V5.6 R8.1] /MK Bug Fix - BuildWeighing - When there is no LastWeighingDate but there is a PurchaseDate then set the LastWeighingDate/Weight to be purchase date and weight - Matt Ward.

   07/07/17 [V5.6 R9.1] /MK Change - Moved CreateIntervals from DetailBand1BeforePrint to OutputIntervalSummary so it is rang only run once.
                                   - CreateIntervals - Run query to show all dates i.e. intervals, and number of animals in the WeighingsTable.
                                                     - For each then get the total weight.
                                                     - Then get the average weight i.e. total weight divided by the number of animals.
                                   - QRLoopBand1BeforePrint - For each interval get the gain between this interval's average weight and the last interval's average weight.
                                                            - Then get the weight gain i.e. average weight gain of interval divided by the number of days between this interval and the last interval.

   01/09/17 [V5.7 R2.2] /MK Bug Fix - BuildWeighing - Weight Gain Report - Calc last weighing date from if purchase date or date of birth not purchase date AND date of birth - Martin Donovan.
                            Additional Feature - Added in the calculation of the first interval i.e. date of birth or purchase interval with new location of CreateInterval procedure.
                                                 After the date of birth or purchase weight then get the animals individual weighing records prior to the block weighing date selected.

   11/10/17 [V5.7 R3.8] /MK Change - Weight Gain Report - Moved the Date of Birth column over more so it wasn't as close to the 372 tag number - Mary Deane (3967).

   17/10/17 [V5.7 R3.9] /MK Additional Feature - Added Overall Weight Gain Per Day to animal band on >2 Weighings report - requested by Kepak.

   20/10/17 [V5.7 R4.0] /MK Change - More changes in the reports to allow for 372 tag number i.e. Target Weight Report - Mary Deane (3967).

   08/11/17 [V5.7 R4.4] /MK Bug Fix - CreateWeighingRecords - Locate on qReport was not on qAnimals.

   24/11/17 [V5.7 R5.7] /MK Change - Default "Summary Report Only" unticked - GL request.
                                   - Only insist on "Block Weighing Start Date" if "Summary Report Only" is ticked - GL request.
                                   - Show heading at the top of Summary Report to show "Block Weighing Start Date".

   12/01/18 [V5.7 R7.4] /MK Additional Feature - OverallGainPerDayPrint - Add overall weight to new field in animals table.

   12/01/18 [V5.7 R7.4] /MK Bug Fix - GetFirstIntervalWeighingRecord - Add total weight from first weight regardless whether first weigh date < dFirstWeighDate.
                                                                     - Only show weigh records if weighing event is after the first weigh date.

   16/01/18 [V5.7 R7.4] /MK Change - BuildWeighing - Moved calculation of Overall Gain Per Day to before query for report is ran because
                                                     with on print of quick report label, if the user closes the report before it views
                                                     not all data will appear on the report on the value won't save to the animals table.

   12/03/18 [V5.7 R8.3] /MK Additional Feature - Added Type for TWeighReportType which allows the rgReporType.ItemIndex to be changed on ShowTheForm - GL/SP/Mary Deane.
                            Change - LoadScreenDefaults/SaveScreenDefaults - Removed storing and loading of date filters - GL/SP request.

   13/03/18 [V5.7 R8.3] /MK Change - Weight Gain Report - Changed mask on dates to show a two digit year.
                                                        - Changed mask on for previous and last weights to not show decimal values.
                                                        - Right align the weights so that two digit weights and three digit weights appear correctly.
                                                        - Changed the header on the reports to a two line header.
                                                        - Added two new fields for Sire Code and Lifetime Weight Gain.
                                                        - All requests by GL based on SP call with Derek Deane.

   15/03/18 [V5.7 R8.3] /MK Change - BuildWeighing - Exclude crazy figures, weights more than ten thousand - Mary Deane scanned 372 tags into the weight field on the app - GL/SP request.

   13/06/18 [V5.8 R0.6] /SP Bug Fix - uWeighingFlt.pas, dfm - Revamp to speed it up. It was crashing for ABP, and extremely slow for others.

   09/07/18 [V5.8 R0.8] /MK Change - BuildWeighing - Include PreSale Weighing events as a weighing event in tWeighingRecords - ABP.
                            Additional Feature - Added breed filter.
                                               - Only show breeds that that are currently in use i.e. WinData.UserDefaultHerdID.

   10/07/18 [V5.8 R0.8] /MK Change - BuildWeighing - If there is no LastWeighingDate and there is either a purchase or birth weight
                                                     and date of purchase or birth is less than then LastWeighingDate then
                                                     set the LastWeight to either purchase or birth depending.
                                   - WeightGainRep - Change caption of header label and date field of sire to breed code if herd type is beef.
                                                   - Change caption of header of Weight Gain Per Day - Recent to Farm Wt and Lifetime to Mart Wt - if herd type is beef.

   13/08/18 [V5.8 R2.3] /MK Additional Feature - Added new QuickReport for minified version of >2 weighings report - Richard Charmley/GL.
                                               - Show this new QuickReport for Dairy herds only.
                                               - Replaced Weighing Target button with Options button that has different types for the 3 different weighing reports.

   27/08/18 [V5.8 R2.5] /MK Change - Changed order of title bar so that Options is before Help.

   02/11/20 [V5.9 R7.1] /MK Change - If the user ticks the "Add Report as Favourite" use the new FWeighRepType object that stores the report type selected.

   05/11/20 [V5.9 R7.2] /MK Bug Fix - sbViewClick - Changed PurchWeight to BirthWeight in the Target Weighing Report.


}

unit uWeighingFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, ExtCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin, Mask,
  ToolEdit, Qrctrls, quickrpt, Db, DBTables, QRExport, ReportDefaults,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxLabel,
  cxTextEdit, cxProgressBar, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxCheckBox, DateUtil, KRoutines, KDBRoutines, uHerdLookup,
  dxStatusBar, cxCalendar, uApplicationLog, ActnList, uReportOptions,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GenTypesConst,
  cxButtons, uWeightTargets;

type
  TWeighReportType = (wrtLatest, wrtWeightGain, wrtMultipleWeighings);

  TWeighingRecord = record
     LatestWeighingDate : TDateTime;
     LatestWeight : Double;
     LastWeighingDate : TDateTime;
     LastWeight : Double;
  end;

  TWeighingIntervalRec = record
     TotAnimals : Integer;
     MeanWeighDate : TDateTime;
     TotalWeight, AvgWeight, TotalWeighGain, TotalGainPerDay : Double;
     TotalNumDays : Integer;
  end;

  TAgeCategory = (ac0To41Days, // Birth to 6 Weeks
                  ac42To89Days, // 6 Weeks to 3 Months
                  ac90To179Days, // 3 Months to 6 Months
                  ac180To359Days, // 6 Months to 12 Months
                  ac360To449Days, // 12 Months to 15 Months
                  ac450To629Days, // 15 Months to 21 Months
                  ac630To719Days, // 21 Months to 24 Months
                  ac720DaysPlus); // greater than or equal to 24 Months

  TfWeighingFilt = class(TForm)
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
    MainPanel: TPanel;
    rgReportOn: TRadioGroup;
    rgSortOrder: TRadioGroup;
    qWeighing: TQuery;
    rgNumSelect: TRadioGroup;
    Label6: TLabel;
    GenQuery: TQuery;
    qReport: TQuery;
    MyTable: TTable;
    cbUseFilters: TCheckBox;
    cbLeftHerd: TCheckBox;
    Bevel2: TBevel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    WeighingRep: TQuickRep;
    PageHeaderBand2: TQRBand;
    SummaryBand2: TQRBand;
    PageFooterBand1: TQRBand;
    WeighingDetail: TQRBand;
    qrUsingFilters: TLabel;
    RptTitle: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData2: TQRSysData;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    lNumber: TQRLabel;
    lWeight: TQRLabel;
    lDOB: TQRLabel;
    dbNumber: TQRDBText;
    DOBDisplayDate: TQRDBText;
    DOBDisplayWeight: TQRDBText;
    WeighingsTable: TTable;
    dsMaster: TDataSource;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    qrsdWeighingRecords: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    lAverages: TQRLabel;
    VerLabel: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    IntervalAnalysisRpt: TQuickRep;
    PageFooterBand2: TQRBand;
    QRLoopBand1: TQRLoopBand;
    qrIntervalIndex: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrTotalAnimalsInInterval: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    qrAvgWeightGain: TQRLabel;
    qrAvgGainPerDay: TQRLabel;
    qrDaysToWeighing: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel16: TQRLabel;
    qrAverageWeight: TQRLabel;
    PurchDate: TQRDBText;
    PurchWeight: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    qrTotalIntervals: TQRLabel;
    QRLabel17: TQRLabel;
    VerLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText2: TQRDBText;
    LatestWeighingsRep: TQuickRep;
    PageHeaderBand3: TQRBand;
    LatestWeighingDetail: TQRBand;
    SummaryBand3: TQRBand;
    LatestWeighingRptTitle: TQRLabel;
    Label8: TLabel;
    QRLabel23: TQRLabel;
    lLatestWeighingSortLabel: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRShape2: TQRShape;
    PageFooterBand3: TQRBand;
    qrlLatestLastWeighDateAge: TQRLabel;
    dbLatestWeighingNumber: TQRDBText;
    QRLabel37: TQRLabel;
    LatestWeighingsCount: TQRExpr;
    qrdbLatestWeight: TQRDBText;
    qrlLabel1: TQRLabel;
    lLatestWeighingVerNo: TQRLabel;
    lLatestWeighingNum: TQRLabel;
    lLatestWeighingOrderLabel: TQRLabel;
    qrlLatestWeightDateOfBirth: TQRLabel;
    qrdbLatestDOB: TQRDBText;
    qrdbLatestDOBWeighDate: TQRDBText;
    rgSortBy: TcxRadioGroup;
    QRLabel22: TQRLabel;
    WeightGainRep: TQuickRep;
    QRBand1: TQRBand;
    QRLabel24: TQRLabel;
    lWeightGainVerNo: TQRLabel;
    QRBand2: TQRBand;
    Label9: TLabel;
    WeightGainRepTitle: TQRLabel;
    QRLabel28: TQRLabel;
    lWeightGainSortLabel: TQRLabel;
    QRSysData6: TQRSysData;
    QRSysData7: TQRSysData;
    QRShape3: TQRShape;
    lWeightGainNum: TQRLabel;
    lWeightGainOrderLabel: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    qrdbWeightGainLastWeighDate: TQRDBText;
    qrdbWeightGainNum: TQRDBText;
    qrdbWeightGainLastWeight: TQRDBText;
    qrdbWeightGainLatestWeighDate: TQRDBText;
    qrdbWeightGainLatestWeight: TQRDBText;
    QRBand4: TQRBand;
    QRLabel40: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel41: TQRLabel;
    WeightGainDetailBand: TQRBand;
    qrdbWeightGainPurchDate: TQRDBText;
    qrdbLatestWeighingDays: TQRDBText;
    qrlPurchWeight: TQRLabel;
    qrdbPurchWeight: TQRDBText;
    qrlSire: TQRLabel;
    qrdbSire: TQRDBText;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRShape5: TQRShape;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRShape4: TQRShape;
    fProgressBar: TcxProgressBar;
    QRDBText7: TQRDBText;
    QRExpr12: TQRExpr;
    qlWeighGainAverage: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText13: TQRDBText;
    qrlSex: TQRLabel;
    cbFavourite: TcxCheckBox;
    btnOptions: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton4: TToolButton;
    TargetWeightsRep: TQuickRep;
    QRBand3: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRBand5: TQRBand;
    Label10: TLabel;
    qrlTargetWeighTitle: TQRLabel;
    QRLabel34: TQRLabel;
    qrlTargetWeighSortLabel: TQRLabel;
    QRSysData8: TQRSysData;
    QRSysData9: TQRSysData;
    QRLabel39: TQRLabel;
    qrlTargetWeighNum: TQRLabel;
    qrlTargetWeighOrderLabel: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    qrTargetWeighPurchWeight: TQRLabel;
    QRBand6: TQRBand;
    QRDBText14: TQRDBText;
    qrdbTargetWeighNum: TQRDBText;
    qrdbLWLatestWeight: TQRDBText;
    QRDBText17: TQRDBText;
    qrdbTargetWeighPurchWeight: TQRDBText;
    QRBand7: TQRBand;
    QRLabel49: TQRLabel;
    QRExpr11: TQRExpr;
    qreTargetWeightPurchWeight: TQRExpr;
    QRExpr14: TQRExpr;
    QRShape7: TQRShape;
    QRExpr15: TQRExpr;
    QRShape8: TQRShape;
    QRLabel51: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    lTargetDailyKgs: TQRLabel;
    QRDBText29: TQRDBText;
    qrdbBirthTarget: TQRDBText;
    qrdbSixWkTarget: TQRDBText;
    qrdbThreeMthTarget: TQRDBText;
    qrdbSixMthTarget: TQRDBText;
    qrdbTlveMthTarget: TQRDBText;
    qrdbFfteenTarget: TQRDBText;
    qrdbTwtyOneMthTarget: TQRDBText;
    qrdbTwtyFourMthTarget: TQRDBText;
    lInfo: TQRLabel;
    QRLabel58: TQRLabel;
    qrlWeighDate: TQRLabel;
    qrlMeanWeighDate: TQRLabel;
    WeighReportStatus: TdxStatusBar;
    QRDBText4: TQRDBText;
    qrlIntWeighRptAvgWeightGain: TQRLabel;
    qrlAvgWeightGain: TQRLabel;
    qrlBlockWeighingStartDate: TQRLabel;
    qrlBlockWeighingStartDateDate: TQRLabel;
    QRDBText16: TQRDBText;
    qrlSireOrBreed: TQRLabel;
    qrdbSireOrBreed: TQRDBText;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape6: TQRShape;
    qrlRecentGainPerDay: TQRLabel;
    qrlLifetimeGainPerDay: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRExpr4: TQRExpr;
    QRShape9: TQRShape;
    rgReportType: TcxRadioGroup;
    ActionList: TActionList;
    actReportOptions: TAction;
    gbDateFilters: TcxGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    SwitchLabel: TLabel;
    FromDOB: TDateEdit;
    FromPurchDate: TDateEdit;
    FromWtDate: TDateEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    ToDOB: TDateEdit;
    ToPurchDate: TDateEdit;
    ToWtDate: TDateEdit;
    GenQuery2: TQuery;
    lBreed: TLabel;
    cmboBreeds: TcxLookupComboBox;
    qrSimpleMultiWeighRep: TQuickRep;
    QRBand8: TQRBand;
    qrlSimpleMultiWeighUsingFilters: TLabel;
    SimpleMultiWeighRptTitle: TQRLabel;
    QRShape10: TQRShape;
    QRSysData10: TQRSysData;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRSysData11: TQRSysData;
    qrlSimpleMultiWeighSortLabel: TQRLabel;
    qrlSimpleMultiWeighOrderLabel: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRBand9: TQRBand;
    QRLabel69: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel70: TQRLabel;
    QRBand10: TQRBand;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    MultiWeighDetail: TQRBand;
    QRLabel73: TQRLabel;
    dbNatIDNo: TQRDBText;
    MultiWeighSubDetail: TQRSubDetail;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel59: TQRLabel;
    gbTargetWeights: TcxGroupBox;
    cbTargetWeightReporting: TcxCheckBox;
    btnTargetWeighing: TcxButton;
    actTargetWeights: TAction;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    lKgsIndicator: TQRLabel;
    lDaysIndicator: TQRLabel;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WeighingDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ToDOBEnter(Sender: TObject);
    procedure ToWtDateEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WeighingRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLoopBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure IntervalAnalysisRptAfterPreview(Sender: TObject);
    procedure PageFooterBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdWeighingRecordsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbUseFiltersClick(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure qrdbLatestDOBWeighDatePrint(sender: TObject;
      var Value: String);
    procedure qrdbWeightGainPurchDatePrint(sender: TObject;
      var Value: String);
    procedure qrdbWeightGainLastWeighDatePrint(sender: TObject;
      var Value: String);
    procedure qrdbWeightGainLastWeightPrint(sender: TObject;
      var Value: String);
    procedure DatePrint(sender: TObject; var Value: String);
    procedure qrdbLatestWeightPrint(sender: TObject; var Value: String);
    procedure QRExpr7Print(sender: TObject; var Value: String);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure qrdbWeightGainLatestWeightPrint(sender: TObject;
      var Value: String);
    procedure qrdbWeightGainLatestWeighDatePrint(sender: TObject;
      var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure rgNumSelectClick(Sender: TObject);
    procedure rgReportTypeClick(Sender: TObject);
    procedure lTargetDailyKgsPrint(sender: TObject; var Value: String);
    procedure qrdbBirthTargetPrint(sender: TObject; var Value: String);
    procedure WeightGainDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ToPurchDateEnter(Sender: TObject);
    procedure qlWeighGainAveragePrint(sender: TObject; var Value: String);
    procedure qrlIntWeighRptAvgWeightGainPrint(sender: TObject;
      var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure actReportOptionsExecute(Sender: TObject);
    procedure MultiWeighDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure actTargetWeightsExecute(Sender: TObject);
  private
    { Private declarations }
    WeighingDefaults : TWeighingDefaults;
    WeighingIntArray : array of TWeighingIntervalRec;
    HerdType : THerdType;
    FWeighRepOptions : TWeighRepOptions;
    FQBreedsInUse : TQuery;
    FDSBreedsInUse : TDataSource;
    FWeighRepType : TWeighReportType;

    procedure BuildWeighing;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
    procedure OutputIntervalSummary ( APreview : Boolean);
    procedure CreateIntervals;

    function GetWeighingRecords(AAnimalID : Integer) : TWeighingRecord;
    procedure CreateNatIDSort;

    procedure StepProgress;
    procedure CreateNumSelectItems;
    procedure UpdateWeightItemIndexCaption;

    procedure CreateDailyKgTargets(AAnimalID: Integer; AAgeDays : Short; AWeight: Double);

    function GetAgeCategory(ADays : Integer ) : TAgeCategory;

    procedure AssignQRptDataFields;
    function AddActualDailyKg(ATargetWeight, AActualWeight: Double;
       ADays, AAgeDays: Integer): Double;
    procedure UpdateFontStyleByGridColourSelect ( AQRBand : TQRCustomBand );
    function GetAvgWeightGainQRLabelCaption(ATableName: String): String;

    procedure CreateWeighingRecords;
    function GetFirstIntervalWeighingRecord: TWeighingIntervalRec;

  public
    { Public declarations }
  end;

procedure ShowTheForm ( AReportType : TWeighReportType );

implementation
uses
    DairyData,
    MenuUnit;
var
  fWeighingFilt: TfWeighingFilt;

const EmptyDateStr = '  /  /    ';

{$R *.DFM}

procedure ShowTheForm ( AReportType : TWeighReportType );
begin
   Application.CreateForm(TfWeighingFilt, fWeighingFilt);
   try
      fWeighingFilt.FWeighRepType := AReportType;
      if not WinData.ExportToPDA then
         begin
            if ( AReportType = wrtLatest ) then
               begin
                  fWeighingFilt.rgReportType.ItemIndex := 0;
                  fWeighingFilt.Caption := 'Latest Weighing';
               end
            else if ( AReportType = wrtWeightGain ) then
               begin
                  fWeighingFilt.rgReportType.ItemIndex := 1;
                  fWeighingFilt.Caption := 'Weight Gain Analysis';
               end
            else if ( AReportType = wrtMultipleWeighings ) then
               begin
                  fWeighingFilt.rgReportType.ItemIndex := 2;
                  fWeighingFilt.Caption := 'Multiple Weighing Per Animal';
               end;

            fWeighingFilt.btnOptions.Glyph := nil;
            fWeighingFilt.btnOptions.Caption := '';
            fWeighingFilt.btnOptions.Font.Size := 10;
            fWeighingFilt.btnOptions.Action := fWeighingFilt.actReportOptions;
            fWeighingFilt.btnOptions.Font.Size := 9;

            fWeighingFilt.ShowModal;
          end
      else
         fWeighingFilt.sbView.Click;
    finally
       FreeAndNil(fWeighingFilt);
    end;
end;

procedure TfWeighingFilt.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

procedure TfWeighingFilt.BuildWeighing;
var
   WeighingRecord : TWeighingRecord;
   AgeDays : Double;

   FirstDate: TDateTime;
   FirstWeight: Double;
   LastDate: TDateTime;
   LastWeight: Double;
   NoDays : Integer;
   WeighGain: Double;

   UpdateTable: TTable;
const
   cNatIDSort = 'Ordered By National ID Number';
   cCheckDigitSort = 'Ordered By Nat. Id. Check Digit';
   cDateOfBirthSort = 'Ordered By Date Of Birth';
   cAnimalNoSort = 'Ordered By Animal Number';
   cAscendingOrder = 'In Ascending Order';
   cDescendingOrder = 'In Descending Order';
begin
   GenQuery.Filter := '';
   GenQuery.Filtered := False;
   GenQuery2.Filter := '';
   GenQuery2.Filtered := False;

   try
      VerLabel.Caption := 'Herd Management ' + HerdVerNo;
      lLatestWeighingVerNo.Caption := 'Herd Management ' + HerdVerNo;
      lWeightGainVerNo.Caption := 'Herd Management ' + HerdVerNo;

      SQLEmptyTable(MyTable.TableName);
      SQLEmptyTable(WeighingsTable.TableName);

      WeighReportStatus.Panels[0].Text := 'Initializing...';
      Application.ProcessMessages;
      Update;

      //Fill Table
      qWeighing.SQL.Clear;
      qWeighing.SQL.Add('INSERT INTO tWeighing ( AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatIDNum,');
      qWeighing.SQL.Add('                        DateOfBirth, Sex, BreedID, BirthWeight, UsedForBreeding,');
      qWeighing.SQL.Add('                        InHerd, HerdIdentity, BCode, DamNumber, SireNumber )');
      qWeighing.SQL.Add('SELECT DISTINCT  A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatId,');
      qWeighing.SQL.Add('                 A.DateOfBirth, A.Sex, A.PrimaryBreed, A.BirthWeight, A.Breeding, ');
      qWeighing.SQL.Add('                 A.InHerd, O.HerdIdentity, B.Code');

      if Windata.SearchField = 'AnimalNo' then
         qWeighing.SQL.Add('                  , AD.AnimalNo ')
      else
         qWeighing.SQL.Add('                  , AD.NatIDNum ');

      qWeighing.SQL.Add('                     , ASi.AnimalNo SireNumber');

      qWeighing.SQL.Add('FROM Animals A ');
      qWeighing.SQL.Add('LEFT JOIN Animals AD ON (AD.ID=A.DamID)');
      qWeighing.SQL.Add('LEFT JOIN Animals Asi ON (ASi.ID=A.SireID)');
      qWeighing.SQL.Add('LEFT JOIN Breeds B  ON (B.ID=A.PrimaryBreed)');
      qWeighing.SQL.Add('LEFT JOIN Owners O ON (O.ID=A.HerdID)');
      if cbUseFilters.Checked then
         qWeighing.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
      qWeighing.SQL.Add('WHERE (O.ID = A.HerdID) ');

      //   22/03/12 [V5.0 R4.5] /MK Change - Only If Report Type Is >2 Weighings - So Calc Weight Gain From BirthWeight and Purchase Weight If Birth Weight Exists.
      //   if rgReportType.ItemIndex in [1,2] then
      if rgReportType.ItemIndex = 2 then
         qWeighing.SQL.Add('AND (A.ID IN ( SELECT AnimalID FROM Events WHERE (EventType = ' + IntToStr(CWeightEvent) + ')))')  //Weighing Event
      else if (( FromWtDate.Text <> EmptyDateStr ) OR  ( ToWtDate.Text <> EmptyDateStr )) then
         begin
            qWeighing.SQL.Add('AND (A.ID IN ( SELECT AnimalID FROM Events E WHERE (EventType = ' + IntToStr(CWeightEvent) + ') ');  //Weighing Event
            if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date > 0 ) then
               qWeighing.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToWtDate.Date) + '''' + ')')
            else if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date <= 0 ) then
               qWeighing.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ')')
            else if ( FromWtDate.Date <= 0 ) and  ( ToWtDate.Date > 0 ) then
               qWeighing.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToWtDate.Date) + '''' + ')');
            qWeighing.SQL.ADD(' ))');
         end;

      if (( FromPurchDate.Text <> EmptyDateStr ) OR  ( ToPurchDate.Text <> EmptyDateStr )) then
         begin
            qWeighing.SQL.Add('AND (A.ID IN ( SELECT AnimalID FROM Events E WHERE (EventType = ' + IntToStr(CPurchaseEvent) + ') ');
            if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date > 0 ) then
               qWeighing.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')')
            else if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date <= 0 ) then
               qWeighing.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ')')
            else if ( FromPurchDate.Date <= 0 ) and  ( ToPurchDate.Date > 0 ) then
               qWeighing.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')');
            qWeighing.SQL.ADD(' ))');
         end;

      if (ComboHerd.Value <> '0' ) then
         qWeighing.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ')
      else
         qWeighing.SQL.ADD(' AND (NOT(A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
      if not cbLeftHerd.Checked then
         qWeighing.SQL.ADD('AND (A.InHerd = TRUE) ');
      case rgReportOn.ItemIndex of
         0 : qWeighing.SQL.ADD(' AND NOT(A.SEX = "Female")');
         1 : qWeighing.SQL.ADD(' AND (A.SEX = "Bull")');
         2 : qWeighing.SQL.ADD(' AND (A.SEX = "Steer")');
         3 : qWeighing.SQL.ADD(' AND (A.SEX = "Female")');
      end;

      if (( FromDOB.Text <> EmptyDateStr ) OR  ( ToDOB.Text <> EmptyDateStr )) then
         begin
            if ( FromDOB.Date > 0 ) and  ( ToDOB.Date > 0 ) then
               qWeighing.SQL.Add('AND ( A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromDOB.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDOB.Date) + '''' + ')')
            else if ( FromDOB.Date > 0 ) and  ( ToDOB.Date <= 0 ) then
               qWeighing.SQL.ADD(' AND (A.DateOfBirth >= ' + '''' + FormatDateTime(cUSDateStyle, FromDOB.Date) + '''' + ')')
            else if ( FromDOB.Date <= 0 ) and  ( ToDOB.Date > 0 ) then
               qWeighing.SQL.ADD(' AND (A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle, ToDOB.Date) + '''' + ')');
         end;

      //   22/03/12 [V5.0 R4.5] /MK Change - SQL Was Including Animals That Were Deleted.
      qWeighing.SQL.Add('AND (A.AnimalDeleted = False)');
      qWeighing.ExecSQL;

      WeighReportStatus.Panels[0].Text := 'Gathering Weighing Records...';
      Application.ProcessMessages;
      Update;

      //Look for Weighing Events
      GenQuery.SQL.Clear;
      GenQuery.SQL.Add('INSERT INTO tWeighingRecords (AnimalID, WeighingDate, Weight, WeighDesc)');
      GenQuery.SQL.Add('Select E.AnimalID, E.EventDate, W.Weight, E.EventDesc ');
      GenQuery.SQL.Add('From Events E, Weights W');
      GenQuery.SQL.Add('Where (W.EventID = E.ID)');
      GenQuery.SQL.Add('And (E.AnimalID IN (SELECT DISTINCT(AnimalID) FROM tWeighing )) ');
      if (( FromWtDate.Text <> EmptyDateStr ) OR  ( ToWtDate.Text <> EmptyDateStr )) then
         begin
            if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date > 0 ) then
               GenQuery.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToWtDate.Date) + '''' + ')')
            else if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date <= 0 ) then
               GenQuery.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ')')
            else if ( FromWtDate.Date <= 0 ) and  ( ToWtDate.Date > 0 ) then
               GenQuery.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToWtDate.Date) + '''' + ')');
         end;

      //   15/03/18 [V5.7 R8.3] /MK Change - Exclude crazy figures, weights more than ten thousand - Mary Deane scanned 372 tags into the weight field on the app - GL/SP request.
      GenQuery.SQL.Add('AND W.Weight < 10000');
      GenQuery.ExecSQL;

      //   09/07/18 [V5.8 R0.8] /MK Change - Include PreSale Weighing events as a weighing event in tWeighingRecords - ABP.
      GenQuery.Close;
      GenQuery.SQL.Clear;
      GenQuery.SQL.Add('INSERT INTO tWeighingRecords (AnimalID, WeighingDate, Weight)');
      GenQuery.SQL.Add('SELECT E.AnimalID, E.EventDate, S.Weight');
      GenQuery.SQL.Add('FROM Events E');
      GenQuery.SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
      GenQuery.SQL.Add('WHERE E.EventType = :SaleDeaths');
      GenQuery.SQL.Add('AND   S.PreSale = True');
      GenQuery.SQL.Add('AND   S.Sold = False');
      GenQuery.SQL.Add('AND   E.AnimalID IN (SELECT DISTINCT(AnimalID) FROM tWeighing)');
      if (( FromWtDate.Text <> EmptyDateStr ) OR  ( ToWtDate.Text <> EmptyDateStr )) then
         begin
            if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date > 0 ) then
               GenQuery.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToWtDate.Date) + '''' + ')')
            else if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date <= 0 ) then
               GenQuery.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ')')
            else if ( FromWtDate.Date <= 0 ) and  ( ToWtDate.Date > 0 ) then
               GenQuery.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToWtDate.Date) + '''' + ')');
         end;
      GenQuery.Params[0].AsInteger := CSaleDeathEvent;
      GenQuery.ExecSQL;

      //   22/03/12 [V5.0 R4.5] /MK Change - Only Delete If Report Type Is >2 Weighings - So Calc Weight Gain From BirthWeight and Purchase Weight If Birth Weight Exists.
      if rgReportType.ItemIndex = 2 then
         begin
            WeighReportStatus.Panels[0].Text := 'Removing Animals Without Weighing Events';
            Application.ProcessMessages;
            Update;
            GenQuery.SQL.Clear;
            GenQuery.SQL.Add('DELETE FROM tWeighing WHERE NOT    ');
            GenQuery.SQL.Add('AnimalID IN ( SELECT DISTINCT(AnimalID) FROM tWeighingRecords )');
            GenQuery.ExecSQL;
         end;

      WeighingsTable.Close; // Refresh table contents.
      WeighingsTable.Open;

      WeighReportStatus.Panels[0].Text := 'Gathering Purchase Weight Details...';
      Application.ProcessMessages;
      Update;

      //Now to add in all Events
      fProgressBar.Properties.Min := 1;
      fProgressBar.Properties.Max := MyTable.RecordCount;
      fProgressBar.Position := 1;
      Application.ProcessMessages;
      Update;

      GenQuery.SQL.Clear;
      GenQuery.SQL.Add('SELECT E.AnimalId, E.EventDate AS PurchDate, P.MeasuredWtDate AS PurchMeasuredWtDt, P.Weight AS PurchWeight,');
      GenQuery.SQL.Add('       P.MeasuredWeight AS PurchMeasuredWt, P.Price, E.EventDesc AS PurchDesc,');
      GenQuery.SQL.Add('       B.Name BuyerName, S.Name SupplierName, S.ID SupplierID ');
      GenQuery.SQL.Add('FROM Events E, Purchases P');
      GenQuery.SQL.Add('INNER JOIN tWeighing t ON (t.AnimalId=E.AnimalId)');
      GenQuery.SQL.Add('LEFT JOIN SuppliersBreeders S ON (P.Supplier=S.ID)');
      GenQuery.SQL.Add('LEFT JOIN Buyers B ON (P.Buyer=B.ID)');
      GenQuery.SQL.Add('WHERE (P.EventID = E.ID)');
      GenQuery.SQL.Add('AND (E.EventType = ' + IntToStr(CPurchaseEvent) + ')');  //Event Type = Purchase

      if (( FromPurchDate.Text <> EmptyDateStr ) OR  ( ToPurchDate.Text <> EmptyDateStr )) then
         begin
            if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date > 0 ) then
               GenQuery.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')')
            else if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date <= 0 ) then
               GenQuery.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ')')
            else if ( FromPurchDate.Date <= 0 ) and  ( ToPurchDate.Date > 0 ) then
               GenQuery.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')');
         end;
      GenQuery.Open;

      With MyTable do
         begin
         MyTable.First;
         MyTable.Edit;
         While NOT MyTable.EOF do
            Begin
               Application.ProcessMessages;

               MyTable.Edit;

               if (FieldByName('DateOfBirth').AsDateTime>0) then
                  FieldByName('AgeInDays').AsInteger := Trunc(Date - FieldByName('DateOfBirth').AsDateTime);

               if (GenQuery.Locate('AnimalId', MyTable.FieldByName('AnimalId').AsInteger, [])) then
                  begin
                     //Look for ANY Purchase Events

                     MyTable.FieldByName('PurchDate').AsDateTime := GenQuery.FieldByName('PurchDate').AsDateTime;
                     MyTable.FieldByName('PurchMeasuredWtDt').AsDateTime := GenQuery.FieldByName('PurchMeasuredWtDt').AsDateTime;
                     MyTable.FieldByName('PurchWeight').AsFloat := GenQuery.FieldByName('PurchWeight').AsFloat;
                     MyTable.FieldByName('PurchMeasuredWt').AsFloat := GenQuery.FieldByName('PurchMeasuredWt').AsFloat;
                     MyTable.FieldByName('PurchDesc').AsString := GenQuery.FieldByName('PurchDesc').AsString;
                     MyTable.FieldByName('Price').AsFloat := GenQuery.FieldByName('Price').AsFloat;
                     MyTable.FieldByName('BuyerName').AsString := GenQuery.FieldByName('BuyerName').AsString;
                     MyTable.FieldByName('SupplierID').AsInteger := GenQuery.FieldByName('SupplierID').AsInteger;
                     MyTable.FieldByName('SupplierName').AsString := GenQuery.FieldByName('SupplierName').AsString;
               end;

               MyTable.Post;
               MyTable.Next;
               StepProgress;
            end;
         end;
      //EndWhile NOT MyTable.EOF do

      WeighingsTable.MasterSource := dsMaster;
      WeighingsTable.MasterFields := 'AnimalID';
      WeighingsTable.IndexName := 'iAnimalIDWeighingDate';

      fProgressBar.Properties.Min := 1;
      fProgressBar.Properties.Max := MyTable.RecordCount;
      fProgressBar.Position := 1;
      Update;
      if (rgReportType.ItemIndex in [0,1]) then
         begin
            WeighReportStatus.Panels[0].Text := 'Gathering Weighing Records...';
            Application.ProcessMessages;
            Update;
            with MyTable do
               begin
                  Application.ProcessMessages;

                  Open;
                  First;
                  while ( not(Eof) ) do
                      begin
                         WeighingRecord := GetWeighingRecords(FieldByName('AnimalID').AsInteger);
                         Edit;
                         MyTable.FieldByName('LatestWeighingDate').AsDateTime := WeighingRecord.LatestWeighingDate;
                         MyTable.FieldByName('LatestWeight').AsFloat := WeighingRecord.LatestWeight;
                         MyTable.FieldByName('LastWeighingDate').AsDateTime := WeighingRecord.LastWeighingDate;
                         MyTable.FieldByName('LastWeight').AsFloat := WeighingRecord.LastWeight;

                         //   22/03/12 [V5.0 R4.5] /MK Change - Calc Weight Gain From BirthWeight and Purchase Weight If Birth Weight Exists.
                         if ( MyTable.FieldByName('LastWeighingDate').AsDateTime <= 0 ) then
                            //   01/09/17 [V5.7 R2.2] /MK Bug Fix - Calc last weighing date from if purchase date or date of birth not purchase date AND date of birth.
                            //   10/07/18 [V5.8 R0.8] /MK Change - If there is no LastWeighingDate and there is either a purchase or birth weight
                            //                                     and date of purchase or birth is less than then LastWeighingDate then
                            //                                     set the LastWeight to either purchase or birth depending.
                            if ( MyTable.FieldByName('PurchDate').AsDateTime > 0 ) or ( MyTable.FieldByName('DateOfBirth').AsDateTime > 0 ) then
                               begin
                                  if ( MyTable.FieldByName('PurchWeight').AsFloat > 0 ) then
                                     begin
                                        if ( MyTable.FieldByName('PurchDate').AsDateTime < MyTable.FieldByName('LatestWeighingDate').AsDateTime ) then
                                           begin
                                              MyTable.FieldByName('LastWeighingDate').AsDateTime := MyTable.FieldByName('PurchDate').AsDateTime;
                                              MyTable.FieldByName('LastWeight').AsFloat := MyTable.FieldByName('PurchWeight').AsFloat;
                                           end;
                                     end
                                  else if ( MyTable.FieldByName('BirthWeight').AsFloat > 0 ) then
                                     begin
                                        if ( MyTable.FieldByName('DateOfBirth').AsDateTime < MyTable.FieldByName('LatestWeighingDate').AsDateTime ) then
                                           begin
                                              MyTable.FieldByName('LastWeighingDate').AsDateTime := MyTable.FieldByName('DateOfBirth').AsDateTime;
                                              MyTable.FieldByName('LastWeight').AsFloat := MyTable.FieldByName('BirthWeight').AsFloat;
                                           end;
                                     end
                               end;

                         if ( MyTable.FieldByName('LatestWeight').AsFloat > 0 ) and ( MyTable.FieldByName('LastWeight').AsFloat > 0 ) then
                            begin
                               AgeDays := ( ( MyTable.FieldByName('LatestWeighingDate').AsDateTime) - (MyTable.FieldByName('LastWeighingDate').AsDateTime) );
                               MyTable.FieldByName('NumDays').AsInteger := Trunc(AgeDays);
                               MyTable.FieldByName('AgeDays').AsInteger := Trunc(AgeDays);
                               if AgeDays > 0 then
                                  begin
                                     MyTable.FieldByName('WeightGain').AsFloat :=
                                        ( (MyTable.FieldByName('LatestWeight').AsFloat) - (MyTable.FieldByName('LastWeight').AsFloat) );
                                     MyTable.FieldByName('WeightGainPerDay').AsFLoat :=
                                        ( ( ( MyTable.FieldByName('LatestWeight').AsFloat) - (MyTable.FieldByName('LastWeight').AsFloat) ) / (AgeDays) );
                                  end;
                            end;

                         if ( MyTable.FieldByName('LatestWeighingDate').AsDateTime > 0 ) and ( MyTable.FieldByName('DateOfBirth').AsDateTime > 0 ) then
                            begin
                               AgeDays := ( (MyTable.FieldByName('LatestWeighingDate').AsDateTime) - (MyTable.FieldByName('DateOfBirth').AsDateTime) );
                               MyTable.FieldByName('AgeDays').AsInteger := Trunc(AgeDays);
                            end;

                         Post;

                         if ( rgReportType.ItemIndex = 0 ) and ( FWeighRepOptions.IncludeTargetWeighing ) then
                            CreateDailyKgTargets(MyTable.FieldByName('AnimalID').AsInteger,
                                                 MyTable.FieldByName('AgeDays').AsInteger,
                                                 MyTable.FieldByName('LatestWeight').AsFloat);

                         StepProgress;

                         Next;
                      end;
               end;
         end;

      //   16/01/18 [V5.7 R7.4] /MK Change - Moved calculation of Overall Gain Per Day to before query for report is ran because
      //                                     with on print of quick report label, if the user closes the report before it views
      //                                     not all data will appear on the report on the value won't save to the animals table.
      if ( rgReportType.ItemIndex in [1, 2] ) then
         begin
            GenQuery.SQL.Clear;
            GenQuery.SQL.Add('SELECT E.AnimalID, E.EventDate, W.Weight');
            GenQuery.SQL.Add('FROM Events E ');
            GenQuery.SQL.Add('INNER JOIN Weights W ON (E.ID=W.EventID)');
            GenQuery.SQL.Add('INNER JOIN tWeighing t ON (t.AnimalId=E.AnimalId)');
            GenQuery.SQL.Add('AND W.Weight BETWEEN 1 AND 10000');
            GenQuery.SQL.Add('ORDER BY E.AnimalId, E.EventDate');
            GenQuery.Open;
            Application.ProcessMessages;

            if (cbLeftHerd.Checked) then
               begin
                  GenQuery2.SQL.Clear;
                  GenQuery2.SQL.Add('SELECT E.AnimalID, E.EventDate, S.Weight, S.Sold');
                  GenQuery2.SQL.Add('FROM Events E');
                  GenQuery2.SQL.Add('INNER JOIN tWeighing t ON (t.AnimalId=E.AnimalId)');
                  GenQuery2.SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
                  GenQuery2.SQL.Add('WHERE E.EventType = 11');
                  GenQuery2.SQL.Add('AND S.Sold = True');
                  GenQuery2.Open;
               end;
            Application.ProcessMessages;

            WeighReportStatus.Panels[0].Text := 'Calculating...';
            Application.ProcessMessages;
            Update;
            fProgressBar.Properties.Min := 1;
            fProgressBar.Properties.Max := MyTable.RecordCount;
            fProgressBar.Position := 1;
            Update;
            with MyTable do
               try
                  // Go through each record in the MyTable and calculate the overall gain per day.
                  First;
                  while ( not(Eof) ) do
                     begin
                        Application.ProcessMessages;

                        FirstWeight := 0;
                        FirstDate := 0;
                        LastWeight := 0;
                        LastDate := 0;

                        try
                           Edit;

                           if (MyTable.FieldByName('PurchWeight').AsFloat>0) then
                              begin
                                 FirstWeight := MyTable.FieldByName('PurchWeight').AsFloat;
                                 FirstDate := MyTable.FieldByName('PurchDate').AsDateTime;
                              end
                           else if (MyTable.FieldByName('BirthWeight').AsFloat>0) then
                              begin
                                 FirstWeight := MyTable.FieldByName('BirthWeight').AsFloat;
                                 FirstDate := MyTable.FieldByName('DateOfBirth').AsDateTime;
                              end
                           else
                              begin
                                 GenQuery.Filter := '(AnimalID = ' + IntToStr(MyTable.FieldByName('AnimalId').AsInteger) + ')';
                                 GenQuery.Filtered := True;
                                 try
                                 if (GenQuery.FindFirst) then
                                    begin
                                       FirstWeight := GenQuery.FieldByName('Weight').AsFloat;
                                       FirstDate := GenQuery.FieldByName('EventDate').AsDateTime;
                                    end;
                                 finally
                                   GenQuery2.Filter := '';
                                   GenQuery2.Filtered := False;
                                   end;
                              end;

                           if (FirstDate>0) then
                              begin
                                 GenQuery.Filter := '(AnimalID = ' + IntToStr(MyTable.FieldByName('AnimalId').AsInteger) + ')';
                                 GenQuery.Filtered := True;
                                 try
                                    if (GenQuery.FindLast) and (GenQuery.FieldByName('EventDate').AsDateTime <> FirstDate) then
                                       begin
                                          LastWeight := GenQuery.FieldByName('Weight').AsFloat;
                                          LastDate := GenQuery.FieldByName('EventDate').AsDateTime;
                                       end;
                                 finally
                                    GenQuery.Filter := '';
                                    GenQuery.Filtered := False;
                                 end;

                                 if (GenQuery2.Active) and (not MyTable.FieldByName('InHerd').AsBoolean) then
                                    try
                                       GenQuery2.Filter := '(AnimalID = ' + IntToStr(MyTable.FieldByName('AnimalId').AsInteger) + ')';
                                       GenQuery2.Filtered := True;
                                       if (GenQuery2.FindFirst) and (GenQuery2.FieldByName('Weight').AsFloat>0) then
                                          begin
                                             LastWeight := GenQuery2.FieldByName('Weight').AsFloat;
                                             LastDate := GenQuery2.FieldByName('EventDate').AsDateTime;
                                          end;
                                    finally
                                       GenQuery2.Filter := '';
                                       GenQuery2.Filtered := False;
                                    end;
                              end;

                           if (FirstDate> 0) and (LastDate>0) and (LastDate>FirstDate) then
                              begin
                                 WeighGain := ( LastWeight - FirstWeight );
                                 NoDays := Trunc(LastDate - FirstDate);
                                 if (NoDays>0) then
                                    FieldByName('OverallGainPerDay').AsFloat := ( WeighGain / NoDays );
                              end;
                           //FieldByName('OverallGainPerDay').AsFloat := WinData.FEventDataHelper.GetAnimalOverallGainPerDay(MyTable.FieldByName('AnimalID').AsInteger);
                           Post;
                        except
                           ApplicationLog.LogError('Unable to create Overall Gain Per Day for '+IntToStr(MyTable.FieldByName('AnimalID').AsInteger));
                        end;
                        StepProgress;
                        Next;
                     end;
                finally
                   GenQuery.Filter := '';
                   GenQuery.Filtered := False;
                   GenQuery2.Filter := '';
                   GenQuery2.Filtered := False;
                end;

            if WinData.CreateTTable( UpdateTable, nil, '', 'animals') then
               with UpdateTable do
                  try
                     Open;
                     MyTable.First;
                     while not MyTable.Eof do
                        begin
                           Application.ProcessMessages;
                           if Locate('Id', MyTable.FieldByName('animalId').AsInteger,[]) then
                             begin
                                Edit;
                                FieldByName('OverallWeightGain').AsFloat := MyTable.FieldByName('OverallGainPerDay').AsFloat;
                                Post;
                             end;
                           MyTable.Next;
                        end;
                     DBIForceWrite(UpdateTable);
                  finally
                     Free;
                  end;
         end;

      WeighReportStatus.Panels[0].Text := 'Opening Report';
      Application.ProcessMessages;
      Update;
      //Now to extract those records from MyTable that we need.
      qReport.SQL.Clear;
      qReport.SQL.Add('SELECT DISTINCT AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatIDNum,');
      qReport.SQL.Add('                DateOfBirth, Sex, UsedForBreeding, BirthWeight, HerdIdentity, PurchDate,');
      qReport.SQL.Add('                PurchMeasuredWtDt, PurchWeight, PurchMeasuredWt, PurchDesc,');
      qReport.SQL.Add('                SupplierName, SupplierID, BuyerName, BCode, DamNumber,');
      qReport.SQL.Add('                LatestWeighingDate, LatestWeight, LastWeighingDate, LastWeight,');
      qReport.SQL.Add('                WeightGain, AgeDays, SireNumber, NumDays, WeightGainPerDay,');
      qReport.SQL.Add('                BirthDailyKgActual, SixWeekDailyKgActual, ThreeMthDailyKgActual,');
      qReport.SQL.Add('                SixMthDailyKgActual, TlveMthDailyKgActual, FteenMthDailyKgActual,');
      qReport.SQL.Add('                TwtyOneMthDailyKgActual, TwtyFourMthDailyKgActual, AgeInDays,');
      qReport.SQL.Add('                OverallGainPerDay');
      qReport.SQL.Add('FROM tWeighing');
      qReport.SQL.Add('WHERE AnimalId>0');

      // 08/08/12 [V5.0 R8.5] /MK Bug Fix - Report was never filtering by Weighing Date in Latest or Weight Gain Reports.
      // Filter by LatestWeighingDate only for Latest Weighing and Weight Gain reports.
      // If the animal has a LatestWeighingDate within the Weighing Date period the animal will appear on the report.
      if ( rgReportType.ItemIndex <> 2 ) then
         begin
            if (( FromWtDate.Text <> EmptyDateStr ) OR  ( ToWtDate.Text <> EmptyDateStr )) then
               begin
                  if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date > 0 ) then
                     qReport.SQL.Add('AND (LatestWeighingDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToWtDate.Date) + '''' + ')')
                  else if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date <= 0 ) then
                     qReport.SQL.ADD('AND (LatestWeighingDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ')')
                  else
                     qReport.SQL.ADD('AND (LatestWeighingDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToWtDate.Date) + '''' + ')');
               end;
         end
      else if (( FromPurchDate.Text <> EmptyDateStr ) OR ( ToPurchDate.Text <> EmptyDateStr )) then
         begin
            if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date > 0 ) then
               qReport.SQL.Add('AND (PurchDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ' AND ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')')
            else if ( FromPurchDate.Date > 0 ) then
               qReport.SQL.ADD('AND (PurchDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ')')
            else
               qReport.SQL.ADD('AND (PurchDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')');
         end;

      if ( FWeighRepOptions.SupplierID > 0 ) then
          qReport.SQL.Add('AND SupplierID = '+IntToStr(FWeighRepOptions.SupplierID)+' ');

      if ( rgReportType.ItemIndex = 1 ) then
         qReport.SQL.Add('AND ( (LastWeight > 0) AND (LatestWeight > 0) )');

      if ( cmboBreeds.EditValue <> Null ) and ( cmboBreeds.EditValue <> '0' ) then
         qReport.SQL.Add('AND BreedID = '+VarToStr(cmboBreeds.EditValue));

      if ( rgNumSelect.ItemIndex = 0 ) then
         begin
            if rgSortBy.ItemIndex = 0 then
               begin
                  // Order By SortNatIDNum
                  qReport.SQL.Add('ORDER BY SortNatIDNum ');
                  case FWeighRepType of
                      wrtLatest : begin
                                     if ( FWeighRepOptions.IncludeTargetWeighing ) then
                                        qrlTargetWeighSortLabel.Caption := cNatIDSort
                                     else
                                        lLatestWeighingSortLabel.Caption := cNatIDSort;
                                  end;
                      wrtWeightGain : begin
                                         lWeightGainSortLabel.Caption := cNatIDSort
                                      end;
                      wrtMultipleWeighings : begin
                                                SortLabel.Caption := cNatIDSort;
                                                qrlSimpleMultiWeighSortLabel.Caption := SortLabel.Caption;
                                             end;
                  end;
               end
            else if (rgSortBy.ItemIndex = 1) then
               begin
                  qReport.SQL.Add('ORDER BY SortNatIDNum ');
                  case FWeighRepType of
                      wrtLatest : begin
                                     if FWeighRepOptions.IncludeTargetWeighing then
                                        qrlTargetWeighSortLabel.Caption := cCheckDigitSort
                                     else
                                        lLatestWeighingSortLabel.Caption := cCheckDigitSort
                                  end;
                      wrtWeightGain : begin
                                         lWeightGainSortLabel.Caption := cCheckDigitSort;
                                      end;
                      wrtMultipleWeighings : begin
                                                SortLabel.Caption := cNatIDSort;
                                                qrlSimpleMultiWeighSortLabel.Caption := SortLabel.Caption;
                                             end;
                  end;
                  CreateNatIDSort;
               end
            else if (rgSortBy.ItemIndex = 2) then
               begin
                  // Order By DateOfBirth
                  qReport.SQL.Add('ORDER BY DateOfBirth ');
                  case FWeighRepType of
                      wrtLatest : begin
                                     if FWeighRepOptions.IncludeTargetWeighing then
                                        qrlTargetWeighSortLabel.Caption := cDateOfBirthSort
                                     else
                                        lLatestWeighingSortLabel.Caption := cDateOfBirthSort;
                                  end;
                      wrtWeightGain : begin
                                         lWeightGainSortLabel.Caption := cDateOfBirthSort
                                      end;
                      wrtMultipleWeighings : begin
                                                SortLabel.Caption := cDateOfBirthSort;
                                                qrlSimpleMultiWeighSortLabel.Caption := SortLabel.Caption;
                                             end;
                  end;
               end
            else if ( (rgSortBy.ItemIndex = 3) and (FWeighRepType = wrtLatest) ) then
               begin
                  // Order By Weight (Single Weighings Only)
                  qReport.SQL.Add('ORDER BY LatestWeight ');
                  if FWeighRepOptions.IncludeTargetWeighing then
                     qrlTargetWeighSortLabel.Caption := 'Ordered By Weight'
                  else
                     lLatestWeighingSortLabel.Caption := 'Ordered By Weight';
               end
            //   09/08/12 [V5.0 R8.5] /MK Bug Fix - If Weight Gain report then sort by Weight Gain Per Day field.
            else if ( (rgSortBy.ItemIndex = 3) and (FWeighRepType = wrtWeightGain) ) then
               begin
                  // Order By Weight (Single Weighings Only)
                  qReport.SQL.Add('ORDER BY WeightGainPerDay ');
                  lWeightGainSortLabel.Caption := 'Ordered By Weight Gain Per Day';
               end
            else if ( (rgSortBy.ItemIndex = 3) and (FWeighRepType = wrtMultipleWeighings) ) then
               begin
                  // Order By Birth Weight (>2 Weighings)
                  qReport.SQL.Add('ORDER BY BirthWeight ');
                  lWeightGainSortLabel.Caption := 'Ordered By Birth Weight';
               end;
         end
      else
         begin
            if rgSortBy.ItemIndex = 0 then
               begin
                  // Order By SortAnimal
                  qReport.SQL.Add('ORDER BY SortAnimalNo ');
                  case FWeighRepType of
                      wrtLatest : begin
                                     if ( FWeighRepOptions.IncludeTargetWeighing ) then
                                        qrlTargetWeighSortLabel.Caption := cAnimalNoSort
                                     else
                                        lLatestWeighingSortLabel.Caption := cAnimalNoSort;
                                  end;
                      wrtWeightGain : begin
                                         lWeightGainSortLabel.Caption := cAnimalNoSort
                                      end;
                      wrtMultipleWeighings : begin
                                                SortLabel.Caption := cAnimalNoSort;
                                                qrlSimpleMultiWeighSortLabel.Caption := SortLabel.Caption;
                                             end;
                  end;
               end
            else if (rgSortBy.ItemIndex = 1) then
               begin
                  // Order By DateOfBirth
                  qReport.SQL.Add('ORDER BY DateOfBirth ');
                  case FWeighRepType of
                      wrtLatest : begin
                                     if ( FWeighRepOptions.IncludeTargetWeighing ) then
                                        qrlTargetWeighSortLabel.Caption := cDateOfBirthSort
                                     else
                                        lLatestWeighingSortLabel.Caption := cDateOfBirthSort
                                  end;
                      wrtWeightGain : begin
                                         lWeightGainSortLabel.Caption := cDateOfBirthSort
                                      end;
                      wrtMultipleWeighings : begin
                                                SortLabel.Caption := cDateOfBirthSort;
                                                qrlSimpleMultiWeighSortLabel.Caption := SortLabel.Caption;
                                             end;
                  end;
               end
            else if ( (rgSortBy.ItemIndex = 2) and (FWeighRepType = wrtLatest) ) then
               begin
                  // Order By Weight (Single Weighings Only)
                  qReport.SQL.Add('ORDER BY LatestWeight ');
                  if ( FWeighRepOptions.IncludeTargetWeighing ) then
                     qrlTargetWeighSortLabel.Caption := 'Ordered By Weight'
                  else
                     lLatestWeighingSortLabel.Caption := 'Ordered By Weight';
               end
            //   09/08/12 [V5.0 R8.5] /MK Bug Fix - If Weight Gain report then sort by Weight Gain Per Day field.
            else if ( (rgSortBy.ItemIndex = 2) and (FWeighRepType = wrtWeightGain) ) then
               begin
                  // Order By Weight (Single Weighings Only)
                  qReport.SQL.Add('ORDER BY WeightGainPerDay ');
                  lWeightGainSortLabel.Caption := 'Ordered By Weight Gain Per Day';
               end
            else if ( (rgSortBy.ItemIndex = 2) and (FWeighRepType = wrtMultipleWeighings) ) then
               begin
                  // Order By Birth Weight (>2 Weighings)
                  qReport.SQL.Add('ORDER BY BirthWeight ');
                  lWeightGainSortLabel.Caption := 'Ordered By Birth Weight';
               end;
         end;

      if rgSortOrder.ItemIndex = 0 Then
         begin
            // Sort By ASC
            qReport.SQL.Add('Asc');
            case FWeighRepType of
                wrtLatest : begin
                               if ( FWeighRepOptions.IncludeTargetWeighing ) then
                                  qrlTargetWeighOrderLabel.Caption := cAscendingOrder
                               else
                                  lLatestWeighingOrderLabel.Caption := cAscendingOrder;
                            end;
                wrtWeightGain : begin
                                   lWeightGainOrderLabel.Caption := cAscendingOrder
                                end;
                wrtMultipleWeighings : begin
                                          OrderLabel.Caption := cAscendingOrder;
                                          qrlSimpleMultiWeighOrderLabel.Caption := OrderLabel.Caption;
                                       end;
            end;
         end
      else
         begin
            // Sort By DESC
            qReport.SQL.Add('Desc');
            case FWeighRepType of
                wrtLatest : begin
                               if ( FWeighRepOptions.IncludeTargetWeighing ) then
                                  qrlTargetWeighOrderLabel.Caption := cDescendingOrder
                               else
                                  lLatestWeighingOrderLabel.Caption := cDescendingOrder;
                            end;
                wrtWeightGain : begin
                                   lWeightGainOrderLabel.Caption := cDescendingOrder
                                end;
                wrtMultipleWeighings : begin
                                          OrderLabel.Caption := cDescendingOrder;
                                          qrlSimpleMultiWeighOrderLabel.Caption := OrderLabel.Caption;
                                       end;
            end;
         end;

      fProgressBar.Properties.Max := MyTable.RecordCount;

      if ( fProgressBar.Position < fProgressBar.Properties.Max ) then
         fProgressBar.Position := fProgressBar.Properties.Max;

      WeighReportStatus.Panels[0].Text := '';
      Application.ProcessMessages;
      Update;

      qReport.Open;
   finally

   end;
end;

procedure TfWeighingFilt.sbViewClick(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;
   sbView.Enabled := False;
   sbPrint.Enabled := False;

   fProgressBar.Visible := True;

   if ( FWeighRepType = wrtLatest ) then
      Height := 632
   else
      Height := 582;

   if ( fProgressBar <> nil ) then
      fProgressBar.Position := 0;

   FWeighRepOptions.IncludeTargetWeighing := cbTargetWeightReporting.Checked;

   try
      if ( rgReportType.ItemIndex = 0 ) then
         begin
            if ( FWeighRepOptions.IncludeTargetWeighing ) then
               with TargetWeightsRep do
                  begin
                     if ( rgNumSelect.ItemIndex = 0 ) then
                        begin
                           qrlTargetWeighNum.Caption := 'Nat. Id. No.';
                           qrdbTargetWeighNum.DataSet := qReport;
                           qrdbTargetWeighNum.DataField := 'NatIDNum';
                        end
                     else if ( rgNumSelect.ItemIndex = 1 ) then
                        begin
                           qrlTargetWeighNum.Caption := 'Animal No.';
                           qrdbTargetWeighNum.DataSet := qReport;
                           qrdbTargetWeighNum.DataField := 'AnimalNo';
                        end;
                     if ( Length(FWeighRepOptions.ReportTitle) > 0 ) then
                        qrlTargetWeighTitle.Caption := FWeighRepOptions.ReportTitle
                     else
                        qrlTargetWeighTitle.Caption := 'Latest Weighing Report';
                  end
            else
               with LatestWeighingsRep do
                  begin
                      if ( rgNumSelect.ItemIndex = 0 ) then
                         begin
                            lLatestWeighingNum.Caption := 'Nat. Id. No.';
                            dbLatestWeighingNumber.DataSet := qReport;
                            dbLatestWeighingNumber.DataField := 'NatIDNum';
                         end
                      else if ( rgNumSelect.ItemIndex = 1 ) then
                         begin
                            lLatestWeighingNum.Caption := 'Animal No.';
                            dbLatestWeighingNumber.DataSet := qReport;
                            dbLatestWeighingNumber.DataField := 'AnimalNo';
                         end;
                      if ( Length(FWeighRepOptions.ReportTitle) > 0 ) then
                         LatestWeighingRptTitle.Caption := FWeighRepOptions.ReportTitle
                      else
                         LatestWeighingRptTitle.Caption := 'Latest Weighing Report';
                  end;
         end
      else if ( rgReportType.ItemIndex = 1 ) then
         with WeightGainRep do
            begin
                if ( rgNumSelect.ItemIndex = 0 ) then
                   begin
                      lWeightGainNum.Caption := 'Nat. Id. No.';
                      qrdbWeightGainNum.DataSet := qReport;
                      qrdbWeightGainNum.DataField := 'NatIDNum';
                   end
                else if ( rgNumSelect.ItemIndex = 1 ) then
                   begin
                      lWeightGainNum.Caption := 'Animal No.';
                      qrdbWeightGainNum.DataSet := qReport;
                      qrdbWeightGainNum.DataField := 'AnimalNo';
                   end;
                if ( Length(FWeighRepOptions.ReportTitle) > 0 ) then
                   WeightGainRepTitle.Caption := FWeighRepOptions.ReportTitle
                else
                   WeightGainRepTitle.Caption := 'Weight Gain Report';
            end
      else if ( rgReportType.ItemIndex = 2 ) then
         with WeighingRep do
            begin
                if ( rgNumSelect.ItemIndex = 0 ) then
                   begin
                      lNumber.Caption := 'Nat. Id. No.';
                      dbNumber.DataSet := qReport;
                      dbNumber.DataField := 'NatIDNum';
                   end
                else if ( rgNumSelect.ItemIndex = 1 ) then
                   begin
                      lNumber.Caption := 'Animal No.';
                      dbNumber.DataSet := qReport;
                      dbNumber.DataField := 'AnimalNo';
                   end;
                if ( Length(FWeighRepOptions.ReportTitle) > 0 ) then
                   RptTitle.Caption := FWeighRepOptions.ReportTitle
                else
                   RptTitle.Caption := 'Multiple Weighing Per Animal';
                SimpleMultiWeighRptTitle.Caption := RptTitle.Caption;
            end;

      if ( rgReportType.ItemIndex = 2 ) then
         if ( FWeighRepOptions.BlockWeightStartDate = 0 ) and ( FWeighRepOptions.SummaryReportOnly ) then
            begin
               MessageDlg('This report requires you to enter a block weighing start date.'+cCRLF+
                          'The block weighing start date is the first date that animals'+cCRLF+
                          'were weighed as a group.',mtError,[mbOK],0);
               TfmReportOptions.ShowWeighRepOptions(FWeighRepOptions,otWeightMulti);
            end;

      // Calls Procedure to build the report.
      BuildWeighing;
      WinData.cxHint.HideHint;
      if ( qReport.RecordCount > 0 ) then
         begin
            // View Report
            if ( (Sender as TRxSpeedButton).Name = 'sbView' ) then
               begin
                  if ( rgReportType.ItemIndex = 0 ) then
                     begin
                        if ( FWeighRepOptions.IncludeTargetWeighing ) then
                           begin
                              //   05/11/20 [V5.9 R7.2] /MK Bug Fix - Changed PurchWeight to BirthWeight in the Target Weighing Report.
                              if ( HerdType = htBeef ) then
                                 begin
                                    qrTargetWeighPurchWeight.Caption := 'Purch. Weight';
                                    qrdbTargetWeighPurchWeight.DataField := 'PurchWeight';
                                    qreTargetWeightPurchWeight.Expression := 'Average(qReport.PurchWeight)';
                                 end
                              else
                                 begin
                                    qrTargetWeighPurchWeight.Caption := 'Birth Weight';
                                    qrdbTargetWeighPurchWeight.DataField := 'BirthWeight';
                                    qreTargetWeightPurchWeight.Expression := 'Average(qReport.BirthWeight)';
                                 end;
                              TargetWeightsRep.Preview;
                           end
                        else
                           with LatestWeighingsRep do
                              begin
                                 if ( HerdType = htBeef ) then
                                    begin
                                       qrlPurchWeight.Caption := 'Purch. Weight';
                                       qrdbPurchWeight.DataField := 'PurchWeight';
                                       QRExpr8.Expression := 'Average(qReport.PurchWeight)'
                                    end
                                 else
                                    begin
                                       qrlPurchWeight.Caption := 'Birth Weight';
                                       qrdbPurchWeight.DataField := 'BirthWeight';
                                       QRExpr8.Expression := 'Average(qReport.BirthWeight)'
                                    end;
                                 LatestWeighingDetail.Font.Color := clNavy;
                                 LatestWeighingRptTitle.Font.Color := clRed;
                                 LatestWeighingsRep.Preview;
                              end;
                     end
                  else if ( rgReportType.ItemIndex = 1 ) then
                     begin
                        with WeightGainRep do
                           begin
                              QRLabel25.Width := 56;

                              if ( FWeighRepOptions.WeighGainShowAge ) then
                                 begin
                                    QRDBText7.DataField := 'AgeInDays';
                                    QRLabel25.Caption := 'Age (Days)';
                                 end
                              else if ( FWeighRepOptions.WeighGainShowDOB ) then
                                 begin
                                    QRDBText7.DataField := 'DateOfBirth';
                                    QRLabel25.Caption := '       D.O.B';
                                 end;

                              if ( HerdType = htBeef ) then
                                 begin
                                    qrlRecentGainPerDay.Caption := 'Farm Wt';
                                    qrlLifetimeGainPerDay.Caption := 'Mart Wt';
                                    qrlSireOrBreed.Caption := 'Breed';
                                    qrdbSireOrBreed.DataField := 'BCode';
                                 end
                              else
                                 begin
                                    qrlRecentGainPerDay.Caption := 'Recent';
                                    qrlLifetimeGainPerDay.Caption := 'Lifetime';
                                    qrlSireOrBreed.Caption := 'Sire';
                                    qrdbSireOrBreed.DataField := 'SireNumber';
                                 end;

                              WeightGainDetailBand.Font.Color := clNavy;
                              WeightGainRepTitle.Font.Color := clRed;

                              WeightGainRep.Preview;
                           end
                     end
                  else if ( rgReportType.ItemIndex = 2 ) then
                     begin
                        CreateWeighingRecords;

                        if ( FWeighRepOptions.BlockWeightStartDate <= 0 ) then
                           qrlBlockWeighingStartDateDate.Caption := ''
                        else
                           qrlBlockWeighingStartDateDate.Caption := DateToStr(FWeighRepOptions.BlockWeightStartDate);

                        if ( HerdType = htDairy ) then
                           begin
                              SimpleMultiWeighRptTitle.Font.Color := clRed;
                              MultiWeighDetail.Font.Color := clNavy;
                              MultiWeighSubDetail.Font.Color := clNavy;
                              qrSimpleMultiWeighRep.Preview;
                           end
                        else
                           begin
                              if ( FWeighRepOptions.SummaryReportOnly ) then
                                 begin
                                    CreateWeighingRecords;
                                    WeighingRep.Prepare;
                                    OutputIntervalSummary(True);
                                 end
                              else
                                 with WeighingRep do
                                    begin
                                       WeighingDetail.Font.Color := clNavy;
                                       RptTitle.Font.Color := clRed;
                                       WeighingRep.Preview;
                                       OutputIntervalSummary(True);
                                    end
                           end;
                     end;
               end
            else
               // Print Report
               begin
                  if ( rgReportType.ItemIndex = 0 ) then
                     begin
                        if ( FWeighRepOptions.IncludeTargetWeighing ) then
                           TargetWeightsRep.Print
                        else
                           with LatestWeighingsRep do
                              begin
                                 if ( HerdType = htBeef ) then
                                    begin
                                       qrlPurchWeight.Caption := 'Purch. Weight';
                                       qrdbPurchWeight.DataField := 'PurchWeight';
                                       QRExpr8.Expression := 'Average(qReport.PurchWeight)'
                                    end
                                 else
                                    begin
                                       qrlPurchWeight.Caption := 'Birth Weight';
                                       qrdbPurchWeight.DataField := 'BirthWeight';
                                       QRExpr8.Expression := 'Average(qReport.BirthWeight)'
                                    end;
                                 LatestWeighingDetail.Font.Color := clNavy;
                                 LatestWeighingRptTitle.Font.Color := clRed;
                                 LatestWeighingsRep.Print;
                              end
                     end
                  else if ( rgReportType.ItemIndex = 1 ) then
                     with WeightGainRep do
                        begin
                           QRLabel25.Width := 56;

                           if ( FWeighRepOptions.WeighGainShowAge ) then
                              begin
                                 QRDBText7.DataField := 'AgeInDays';
                                 QRLabel25.Caption := 'Age (Days)';
                              end
                           else if ( FWeighRepOptions.WeighGainShowDOB ) then
                              begin
                                 QRDBText7.DataField := 'DateOfBirth';
                                 QRLabel25.Caption := '       D.O.B';
                              end;

                           if ( HerdType = htBeef ) then
                              begin
                                 qrlRecentGainPerDay.Caption := 'Farm Wt';
                                 qrlLifetimeGainPerDay.Caption := 'Mart Wt';
                                 qrlSireOrBreed.Caption := 'Breed';
                                 qrdbSireOrBreed.DataField := 'BCode';
                              end
                           else
                              begin
                                 qrlRecentGainPerDay.Caption := 'Recent';
                                 qrlLifetimeGainPerDay.Caption := 'Lifetime';
                                 qrlSireOrBreed.Caption := 'Sire';
                                 qrdbSireOrBreed.DataField := 'SireNumber';
                              end;

                           WeightGainDetailBand.Font.Color := clNavy;
                           WeightGainRepTitle.Font.Color := clRed;

                           WeightGainRep.Print;
                        end
                  else if ( rgReportType.ItemIndex = 2 ) then
                     begin
                        CreateWeighingRecords;
                        if ( HerdType = htDairy ) then
                           begin
                              SimpleMultiWeighRptTitle.Font.Color := clRed;
                              MultiWeighDetail.Font.Color := clNavy;
                              MultiWeighSubDetail.Font.Color := clNavy;
                              qrSimpleMultiWeighRep.Print;
                           end
                        else
                           begin
                              if ( FWeighRepOptions.SummaryReportOnly ) then
                                 begin
                                    WeighingRep.Prepare;
                                    OutputIntervalSummary(False);
                                 end
                              else
                                 with WeighingRep do
                                    begin
                                       WeighingDetail.Font.Color := clNavy;
                                       RptTitle.Font.Color := clRed;
                                       WeighingRep.Print;
                                       OutputIntervalSummary(False);
                                    end;
                           end;
                     end;
               end
         end
      else
         begin
            if ( rgReportType.ItemIndex = 1 ) then
               MessageDlg('No weight gain records have been found.'+cCRLF+
                          'Please try another filter selection.',mtInformation,[mbOK],0)
            else
               MessageDlg('No records have been selected for printing.'+cCRLF+
                          'Please try another filter selection.',mtInformation,[mbOK],0);
         end;
   finally
      WeighReportStatus.Panels[0].Text := '';

      fProgressBar.Position := 0;
      fProgressBar.Hide;

      if ( FWeighRepType = wrtLatest ) then
         Height := 604
      else
         Height := 554;

      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TfWeighingFilt.FormCreate(Sender: TObject);
begin
   fProgressBar.Visible := False;
   rgReportType.Visible := False;

   if ( FWeighRepType = wrtLatest ) then
      Height := 604
   else
      Height := 554;

   FWeighRepOptions.SupplierID := 0;
   FWeighRepOptions.ReportTitle := '';
   FWeighRepOptions.WeighGainShowDOB := True;
   FWeighRepOptions.WeighGainShowAge := False;
   FWeighRepOptions.BlockWeightStartDate := 0;
   FWeighRepOptions.SummaryReportOnly := False;
   FWeighRepOptions.IncludeTargetWeighing := False;

   WinData.CanShowStandardReportHint := True;
   try
      with MyTable do
         begin
            FieldDefs.Clear;
            //Animals.db
            FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
            FieldDefs.Add('AnimalNo',ftString,10,FALSE);
            FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
            FieldDefs.Add('NatIDNum',ftString,20,FALSE);
            FieldDefs.Add('SortNatIDNum',ftString,20,FALSE);
            FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
            FieldDefs.Add('Sex',ftString,10,FALSE);
            FieldDefs.Add('BreedID',ftInteger);
            FieldDefs.Add('BirthWeight',ftFloat,0,FALSE);
            FieldDefs.Add('HerdIdentity',ftString,15,FALSE);    //Not yet used
            FieldDefs.Add('SireName',ftString,40,FALSE);     //Not yet used
            FieldDefs.Add('DamName',ftString,40,FALSE);     //Not yet used
            FieldDefs.Add('GeneticDamName',ftString,40,FALSE);     //Not yet used
            FieldDefs.Add('DamNumber',ftString,25,FALSE); { NatId or Animal No}
            FieldDefs.Add('SireNumber',ftString,10,FALSE);
            FieldDefs.Add('BCode',ftString,6,FALSE);

            //Events.db + Purchases.db
            FieldDefs.Add('PurchDate',ftDate,0,FALSE);
            FieldDefs.Add('PurchMeasuredWtDt',ftDate,0,FALSE);
            FieldDefs.Add('PurchWeight',ftFloat,0,FALSE);
            FieldDefs.Add('PurchMeasuredWt',ftFloat,0,FALSE);
            FieldDefs.Add('PurchDesc',ftString,30,FALSE);
            FieldDefs.Add('SupplierID',ftInteger,0,FALSE);  //Not yet used
            FieldDefs.Add('SupplierName',ftString,30,FALSE);  //Not yet used
            FieldDefs.Add('BuyerName',ftString,30,FALSE);     //Not yet used
            FieldDefs.Add('Price',ftFloat);     //Not yet used

            FieldDefs.Add('LatestWeighingDate',ftDate,0,FALSE);
            FieldDefs.Add('LatestWeight',ftFloat);     //Not yet used

            FieldDefs.Add('LastWeighingDate',ftDate,0,FALSE);
            FieldDefs.Add('LastWeight',ftFloat);     //Not yet used

            FieldDefs.Add('WeightGain',ftFloat);
            FieldDefs.Add('WeightGainPerDay',ftFloat);
            FieldDefs.Add('AgeDays',ftInteger);     //Not yet used
            FieldDefs.Add('NumDays',ftInteger);

            FieldDefs.Add('BirthDailyKgActual',ftFloat);
            FieldDefs.Add('SixWeekDailyKgActual',ftFloat);
            FieldDefs.Add('ThreeMthDailyKgActual',ftFloat);
            FieldDefs.Add('SixMthDailyKgActual',ftFloat);
            FieldDefs.Add('TlveMthDailyKgActual',ftFloat);
            FieldDefs.Add('FteenMthDailyKgActual',ftFloat);
            FieldDefs.Add('TwtyOneMthDailyKgActual',ftFloat);
            FieldDefs.Add('TwtyFourMthDailyKgActual',ftFloat);
            FieldDefs.Add('GreaterThanTwtyFourMths',ftFloat);

            FieldDefs.Add('AgeInDays',ftInteger);

            FieldDefs.Add('UsedForBreeding',ftBoolean);

            FieldDefs.Add('OverallGainPerDay',ftFloat);

            FieldDefs.Add('FirstWeightOnFarm',ftFloat);
            FieldDefs.Add('LastWeightOnFarm',ftFloat);
            FieldDefs.Add('InHerd',ftBoolean);

            CreateTable;
            Open;
         end;

      with WeighingsTable do
         begin
            FieldDefs.Clear;
            FieldDefs.Add('ID',ftAutoInc);
            FieldDefs.Add('AnimalID',ftInteger);
            FieldDefs.Add('WeighingDate',ftDateTime);
            FieldDefs.Add('Weight',ftFloat);
            FieldDefs.Add('WeightGain',ftFloat);
            FieldDefs.Add('NumDays',ftInteger);
            FieldDefs.Add('GainPerDay',ftFloat);
            FieldDefs.Add('WeighDesc',ftString,30);
            CreateTable;
            Open;
         end;

      {
      if ( not(WinData.dsQuerySuppliers.DataSet.Active) ) then
         WinData.dsQuerySuppliers.DataSet.Open;
      cbSupplier.LookupSource := WinData.dsQuerySuppliers;
      cbSupplier.LookupField := 'ID';
      cbSupplier.LookupDisplay := 'Name';
      }
      HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);

    except
       Raise Exception.Create('Cannot create table, close program and reboot');
    end;

//   if WinData.ActiveFilter ten
   cbUseFilters.Checked := WinData.ActiveFilter;

   //Hides report from screen
   WeighingRep.Hide;
   LatestWeighingsRep.Hide;
   WeightGainRep.Hide;
   TargetWeightsRep.Hide;
   IntervalAnalysisRpt.Hide;

   if ( not(WinData.TargetWeights.Active) ) then
      WinData.TargetWeights.Active := True;

   CreateNumSelectItems;

   AssignQRptDataFields;

   FQBreedsInUse := TQuery.Create(nil);
   FQBreedsInUse.DatabaseName := AliasName;
   FQBreedsInUse.SQL.Clear;
   FQBreedsInUse.SQL.Add('SELECT *');
   FQBreedsInUse.SQL.Add('FROM Breeds');
   FQBreedsInUse.SQL.Add('WHERE ID IN (SELECT DISTINCT(PrimaryBreed)');
   FQBreedsInUse.SQL.Add('             FROM Animals');
   FQBreedsInUse.SQL.Add('             WHERE HerdID = :DefaultHerdID)');
   FQBreedsInUse.SQL.Add('ORDER BY Code');
   FQBreedsInUse.Params[0].AsInteger := WinData.UserDefaultHerdID;
   FQBreedsInUse.Open;

   FDSBreedsInUse := TDataSource.Create(nil);
   FDSBreedsInUse.DataSet := FQBreedsInUse;

   cmboBreeds.Properties.ListSource := FDSBreedsInUse;
   cmboBreeds.Properties.ListFieldNames := 'Code;Name';
   cmboBreeds.Properties.KeyFieldNames := 'ID';
   cmboBreeds.Properties.ListColumns := HerdLookup.erBreedLookup.Properties.ListColumns;
   cmboBreeds.Properties.ListColumns[0].Width := 60;
   cmboBreeds.Properties.DropDownSizeable := True;
end;

procedure TfWeighingFilt.WeighingDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   // Check whether there is sufficient room to print Group Band plus one Detail Band
   if ((WeighingDetail.Height) > (WeighingRep.Height - (WeighingRep.Page.TopMargin + WeighingRep.Page.BottomMargin + PageFooterBand1.Height + WeighingRep.CurrentX))) then
      WeighingDetail.ForceNewPage := True
   else
      WeighingDetail.ForceNewPage := False;
end;

procedure TfWeighingFilt.ToDOBEnter(Sender: TObject);
begin
   if ToDOB.Date < FromDOB.Date then
      if FromDOB.Date > 0 then
         ToDOB.Date := FromDOB.Date;
end;

procedure TfWeighingFilt.ToWtDateEnter(Sender: TObject);
begin
   if ToWtDate.Date < FromWtDate.Date then
      if FromWtDate.Date > 0 then
         ToWtDate.Date := FromWtDate.Date;
end;

procedure TfWeighingFilt.ToPurchDateEnter(Sender: TObject);
begin
   if ToPurchDate.Date < FromPurchDate.Date then
      if FromPurchDate.Date > 0 then
         ToPurchDate.Date := FromPurchDate.Date;
end;

procedure TfWeighingFilt.FormActivate(Sender: TObject);
var
  pt : TPoint;
begin
   // set the Default Herd Into the Combo Box
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);

   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;

   OnActivate := nil;
end;

procedure TfWeighingFilt.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('InterWeighing.htm');
end;

procedure TfWeighingFilt.FormDestroy(Sender: TObject);
begin
   if MyTable <> nil then
      with MyTable do
         begin
            if Active then
               Active := False;
            DeleteTable;
            Free;
        end;

   if WeighingsTable <> nil then
      with WeighingsTable do
         begin
            if Active then
               Active := False;
            DeleteTable;
        end;

   if ( WinData.TargetWeights.Active ) then
      WinData.TargetWeights.Active := False;

   if ( FQBreedsInUse <> nil ) then
      begin
         FQBreedsInUse.CLose;
         FQBreedsInUse.Free;
      end;

   if ( FDSBreedsInUse <> nil ) then
      FreeAndNil(FDSBreedsInUse);
      
   SaveScreenDefaults;
end;

procedure TfWeighingFilt.LoadScreenDefaults;
var
   i : Integer;
begin
   WeighingDefaults := TWeighingDefaults.Create(cRD_WeighingReport);
   try
      cbLeftHerd.Checked := WeighingDefaults.IncludeLeftHerd;
      rgReportOn.ItemIndex := WeighingDefaults.ReportOn;
      rgNumSelect.ItemIndex := WeighingDefaults.IdentityField;
      cbTargetWeightReporting.Checked := WeighingDefaults.IncludeTargetWeights;
      ToDOB.Clear;
      ToPurchDate.Clear;
      ToWtDate.Clear;
      {ToDOB.Date := Date;
      ToPurchDate.Date := Date;
      ToWtDate.Date := Date;}
      {
      if WeighingDefaults.DOBInterval > 0 then
         FromDOB.Date := Trunc(Date - WeighingDefaults.DOBInterval);
      if WeighingDefaults.PurchaseInterval > 0 then
         FromPurchDate.Date := Trunc(Date - WeighingDefaults.PurchaseInterval);
      if WeighingDefaults.WeighingInterval > 0 then
         FromWtDate.Date := Trunc(Date - WeighingDefaults.WeighingInterval);
      }
      rgSortBy.ItemIndex := WeighingDefaults.SortField;

      UpdateWeightItemIndexCaption;

      rgSortOrder.ItemIndex := WeighingDefaults.SortOrder;
   finally
      FreeAndNil(WeighingDefaults);
   end;

end;

procedure TfWeighingFilt.SaveScreenDefaults;
begin
   WeighingDefaults := TWeighingDefaults.Create(cRD_WeighingReport);
   try
      WeighingDefaults.IncludeLeftHerd := cbLeftHerd.Checked;
      WeighingDefaults.ReportOn := rgReportOn.ItemIndex;
      WeighingDefaults.IdentityField := rgNumSelect.ItemIndex;
      WeighingDefaults.IncludeTargetWeights := cbTargetWeightReporting.Checked;
      {
      if ( ToDOB.Date > 0 ) and ( FromDOB.Date > 0 ) then
         WeighingDefaults.DOBInterval := Trunc(ToDOB.Date - FromDOB.Date);
      if ( ToPurchDate.Date > 0 ) and ( FromPurchDate.Date > 0 ) then
         WeighingDefaults.PurchaseInterval := Trunc(ToPurchDate.Date - FromPurchDate.Date);
      if ( ToWtDate.Date > 0 ) and ( FromWtDate.Date > 0 ) then
         WeighingDefaults.WeighingInterval := Trunc(ToWtDate.Date - FromWtDate.Date);
      }

      WeighingDefaults.SortField := rgSortBy.ItemIndex;
      WeighingDefaults.SortOrder := rgSortOrder.ItemIndex;
   finally
      FreeAndNil(WeighingDefaults);
   end;
end;

procedure TfWeighingFilt.FormShow(Sender: TObject);
begin
   LoadScreenDefaults;
   //   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   case FWeighRepType of
     wrtLatest : cbFavourite.Checked := WinData.IsReportFavourite(cLatestWeighingRep);
     wrtWeightGain : cbFavourite.Checked := WinData.IsReportFavourite(cWeightGainRep);
     wrtMultipleWeighings : cbFavourite.Checked := WinData.IsReportFavourite(cMultipleWeighingRep);
   end;

   gbTargetWeights.Visible := ( FWeighRepType = wrtLatest );
   if ( FWeighRepType = wrtLatest ) then
      begin
         Height := 604;
         MainPanel.Height := 344;
         rgSortBy.Top := 426;
         rgSortOrder.Top := 426;
         fProgressBar.Top := 554;
      end
   else
      begin
         Height := 554;
         MainPanel.Height := 293;
         rgSortBy.Top := 380;
         rgSortOrder.Top := 380;
         fProgressBar.Top := 504;
      end;

   case FWeighRepType of
      wrtLatest : WinData.UpdateRecentReportUsage(cLatestWeighingRep);
      wrtWeightGain : WinData.UpdateRecentReportUsage(cWeightGainRep);
      wrtMultipleWeighings : WinData.UpdateRecentReportUsage(cMultipleWeighingRep);
   end
end;

procedure TfWeighingFilt.WeighingRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   qrUsingFilters.Caption := '';
   if cbUseFilters.Checked then
      begin
         qrUsingFilters.Caption := '(Using Animal Grid Filter)';
         qrlSimpleMultiWeighUsingFilters.Caption := qrUsingFilters.Caption;
      end;
   SetLength(WeighingIntArray, 0);
end;

procedure TfWeighingFilt.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( qReport.FieldByName('PurchDate').AsDateTime > 0 ) then
      begin
         lDOB.Caption := 'Purch Date:';
         lWeight.Caption := 'Purch Weight:';
         PurchDate.Enabled := True;
         PurchWeight.Enabled := True;
         DOBDisplayDate.Enabled := False;
         DOBDisplayWeight.Enabled := False;
      end
   else
      begin
         lDOB.Caption := 'D.O.B:';
         lWeight.Caption := 'Birth Weight:';
         PurchDate.Enabled := False;
         PurchWeight.Enabled := False;
         DOBDisplayDate.Enabled := True;
         DOBDisplayWeight.Enabled := True;
      end;

   //   10/10/11 [V5.0 R1.3] /MK Additional Feature - Show Full Detail If BirthWeight Or Purchase Details Exist.
   if ( qReport.FieldByName('BirthWeight').AsFloat > 0 ) or
      ( qReport.FieldByName('PurchDate').AsDateTime > 0 ) then
      begin
         WeighingDetail.Height := 43
      end
   else
      WeighingDetail.Height := 25;

   //   07/10/11 [V5.0 R1.3] /MK Additional Feature - Added Sex & SireNo To The AnimalDetailBand.
   qrlSex.Caption := '';
   if ( UpperCase(qReport.FieldByName('Sex').AsString) = 'FEMALE') then
      qrlSex.Caption := 'F'
   else if ( UpperCase(qReport.FieldByName('Sex').AsString) = 'BULL') then
      qrlSex.Caption := 'B'
   else if ( UpperCase(qReport.FieldByName('Sex').AsString) = 'STEER') then
      qrlSex.Caption := 'M';
end;

procedure TfWeighingFilt.OutputIntervalSummary ( APreview : Boolean);
begin
   CreateIntervals;
   if APreview then
      IntervalAnalysisRpt.Preview
   else
      IntervalAnalysisRpt.Print;
end;

procedure TfWeighingFilt.QRLoopBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   DaysBetween : Integer;
   AvgWeight,
   AvgWeightGain,
   AvgWeightGainPerDay,
   LastAvgWeight : Double;
begin
   try
      DaysBetween := 0;
      AvgWeight := 0;
      AvgWeightGain := 0;
      AvgWeightGainPerDay := 0;
      LastAvgWeight := 0;
      qrIntervalIndex.Caption := IntToStr(QRLoopBand1.Count+1);
      qrlMeanWeighDate.Caption := DateToStr(WeighingIntArray[QRLoopBand1.Count].MeanWeighDate);
      qrTotalAnimalsInInterval.Caption := IntToStr(WeighingIntArray[QRLoopBand1.Count].TotAnimals);
      AvgWeight := StrToFloat(FormatFloat('0.00', WeighingIntArray[QRLoopBand1.Count].AvgWeight));
      qrAverageWeight.Caption := FloatToStrF(AvgWeight, ffFixed, 8, 2);
      DaysBetween := WeighingIntArray[QRLoopBand1.Count].TotalNumDays;

      // 07/07/17 [V5.6 R9.1] /MK Change - For each interval get the gain between this interval's average weight and the last interval's average weight.
      //                                 - Then get the weight gain i.e. average weight gain of interval divided by the number of days between this interval and the last interval.
      if ( QRLoopBand1.Count = 0 ) then
         qrDaysToWeighing.Caption := '0'
      else
         qrDaysToWeighing.Caption := IntToStr(DaysBetween);

      if ( QRLoopBand1.Count = 0 ) then
         begin
            qrAvgWeightGain.Caption := '0.00';
            qrAvgGainPerDay.Caption := '0.00';
         end
      else
         begin
            LastAvgWeight := WeighingIntArray[QRLoopBand1.Count-1].AvgWeight;
            AvgWeightGain := AvgWeight - LastAvgWeight;
            qrAvgWeightGain.Caption := FloatToStrF(AvgWeightGain, ffFixed, 8, 2);
            qrAvgGainPerDay.Caption := '0.00';
            if ( DaysBetween > 0 ) then
               begin
                  AvgWeightGainPerDay := ( AvgWeightGain / DaysBetween );
                  qrAvgGainPerDay.Caption := FloatToStrF(AvgWeightGainPerDay, ffFixed, 8, 2);
               end;
         end;
   except

   end;
end;

procedure TfWeighingFilt.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTotalIntervals.Caption := IntToStr(Length(WeighingIntArray));
end;

procedure TfWeighingFilt.IntervalAnalysisRptAfterPreview(Sender: TObject);
begin
   SetLength(WeighingIntArray, 0);
end;

procedure TfWeighingFilt.PageFooterBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   VerLabel2.Caption := 'Herd Management ' + HerdVerNo;

end;

procedure TfWeighingFilt.qrsdWeighingRecordsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := WeighingsTable.FieldByName('WeighingDate').AsDateTime > 0;
end;

procedure TfWeighingFilt.cbUseFiltersClick(Sender: TObject);
begin
   if cbUseFilters.Checked then
      begin
         if not WinData.ActiveFilter then
            cbUseFilters.State := cbUnchecked
         else
            cbUseFilters.Font.Color := clRed
      end
   else
      cbUseFilters.Font.Color := clBlack;
end;

procedure TfWeighingFilt.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfWeighingFilt.qrdbLatestDOBWeighDatePrint(sender: TObject;
  var Value: String);
begin
   if qReport.FieldByName('LatestWeighingDate').AsFloat = 0 then
      Value := '';
end;

function TfWeighingFilt.GetWeighingRecords(AAnimalID: Integer): TWeighingRecord;
var
   qWeighings : TQuery;
   i : Integer;
begin
   Result.LatestWeighingDate := 0;
   Result.LatestWeight := 0;
   Result.LastWeighingDate := 0;
   Result.LastWeight := 0;
   if ( AAnimalID = 0 ) then Exit;
   qWeighings := TQuery.Create(nil);
   with qWeighings do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM tWeighingRecords');
         SQL.Add('WHERE AnimalID = :AnimalID');
         SQL.Add('ORDER BY WeighingDate DESC');
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            for i := 1 to RecordCount do
               begin
                  RecNo := i;
                  if ( RecNo = 1 ) then
                     begin
                        Result.LatestWeighingDate := FieldByName('WeighingDate').AsDateTime;
                        Result.LatestWeight := FieldByName('Weight').AsFloat;
                     end
                  else if ( Result.LatestWeighingDate > 0 ) then
                     begin
                        if ( FieldByName('WeighingDate').AsDateTime < Result.LatestWeighingDate ) then
                           begin
                              Result.LastWeighingDate := FieldByName('WeighingDate').AsDateTime;
                              Result.LastWeight := FieldByName('Weight').AsFloat;
                           end;
                        if ( Result.LastWeighingDate > 0 ) then
                           Break;
                     end;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfWeighingFilt.qrdbWeightGainPurchDatePrint(sender: TObject;
  var Value: String);
begin
  if qReport.FieldByName('PurchDate').AsDateTime = 0 then
     Value := '';
end;

procedure TfWeighingFilt.CreateNatIDSort;
var
   SortStr : String;
begin
   with MyTable do
      begin
         First;
         while not eof do
            begin
               Application.ProcessMessages;
               Edit;
               try
                  SortStr := WinData.SortByCheckDigit(FieldByName('NatIDNum').AsString);
                  if SortStr <> '' then
                     MyTable.FieldByName('SortNatIDNum').AsString := SortStr; // Saved returned SortStr, if SortStr is empty use existing SortNatID Value

                  Post;
               except
                  Cancel;
               end;

               Next;
            end;
      end;
end;

procedure TfWeighingFilt.qrdbWeightGainLastWeighDatePrint(sender: TObject;
  var Value: String);
begin
  if qReport.FieldByName('LastWeighingDate').AsDateTime = 0 then
     Value := '';
end;

procedure TfWeighingFilt.qrdbWeightGainLastWeightPrint(sender: TObject;
  var Value: String);
begin
  if qReport.FieldByName('LastWeight').AsFloat = 0 then
     Value := '';
end;

procedure TfWeighingFilt.qrdbLatestWeightPrint(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;

procedure TfWeighingFilt.StepProgress;
begin
   fProgressBar.Position := fProgressBar.Position +1;
   Update;
end;

procedure TfWeighingFilt.CreateIntervals;
var
   i,
   iAnimalID,
   NumDays,
   Intervals,
   TotBirthPurchDaysBetween : Integer;
   LastWeight,
   WeighGain,
   TotBirthPurchWeight : Double;
   LastDate : TDateTime;
   qTotalWeight,
   qWeighDateAnimals,
   qAnimalBirthPurchDetails : TQuery;
   wrFirstInterval : TWeighingIntervalRec;
const
   cNoIntervalsError = 'No intervals found for period or block weighing start date selected.';
begin
   LastWeight := 0;
   LastDate   := 0;
   Intervals := 0;

   //   07/07/17 [V5.6 R9.1] /MK Change - Run query to show all dates i.e. intervals, and number of animals in the WeighingsTable.
   //                                   - For each then get the total weight.
   //                                   - Then get the average weight i.e. total weight divided by the number of animals.
   GenQuery.Close;
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT DISTINCT(WeighingDate), Count(AnimalID) AnimalCount');
   GenQuery.SQL.Add('FROM '+WeighingsTable.TableName+'');
   if ( FWeighRepOptions.BlockWeightStartDate > 0 ) then
      GenQuery.SQL.Add('WHERE WeighingDate >= "'+FormatDateTime(cUSDateStyle,FWeighRepOptions.BlockWeightStartDate)+'"');
   GenQuery.SQL.Add('GROUP BY WeighingDate');
   GenQuery.Open;
   SetLength(WeighingIntArray,0);
   if ( GenQuery.RecordCount = 0 ) then
      begin
         MessageDlg(cNoIntervalsError,mtError,[mbOK],0);
         SysUtils.Abort;
      end;

   qTotalWeight := TQuery.Create(nil);
   try
      qTotalWeight.DatabaseName := AliasName;
      SetLength(WeighingIntArray,GenQuery.RecordCount+1);
      LastDate := 0;
      GenQuery.First;
      if ( GenQuery.FieldByName('WeighingDate').AsDateTime = 0 ) then
         begin
            MessageDlg(cNoIntervalsError,mtError,[mbOK],0);
            SysUtils.Abort;
         end;
      LastDate := 0;

      wrFirstInterval := GetFirstIntervalWeighingRecord;
      WeighingIntArray[0].MeanWeighDate := wrFirstInterval.MeanWeighDate;
      WeighingIntArray[0].TotAnimals := wrFirstInterval.TotAnimals;
      WeighingIntArray[0].TotalNumDays := wrFirstInterval.TotalNumDays;
      WeighingIntArray[0].TotalWeight := wrFirstInterval.TotalWeight;
      WeighingIntArray[0].AvgWeight := wrFirstInterval.AvgWeight;
      LastDate := wrFirstInterval.MeanWeighDate;
      while ( not(GenQuery.Eof) ) do
         begin
            Intervals := GenQuery.RecNo;
            WeighingIntArray[Intervals].MeanWeighDate := GenQuery.FieldByName('WeighingDate').AsDateTime;
            WeighingIntArray[Intervals].TotAnimals := GenQuery.FieldByName('AnimalCount').AsInteger;
            qTotalWeight.Close;
            qTotalWeight.SQL.Clear;
            qTotalWeight.SQL.Add('SELECT SUM(Weight)');
            qTotalWeight.SQL.Add('FROM '+WeighingsTable.TableName+'');
            qTotalWeight.SQL.Add('WHERE WeighingDate = "'+FormatDateTime(cUSDateStyle,GenQuery.FieldByName('WeighingDate').AsDateTime)+'"');
            qTotalWeight.Open;
            WeighingIntArray[Intervals].TotalNumDays := Trunc(WeighingIntArray[Intervals].MeanWeighDate - LastDate);
            WeighingIntArray[Intervals].TotalWeight := qTotalWeight.Fields[0].AsFloat;
            WeighingIntArray[Intervals].AvgWeight := ( WeighingIntArray[Intervals].TotalWeight / WeighingIntArray[Intervals].TotAnimals );
            LastDate := GenQuery.FieldByName('WeighingDate').AsDateTime;
            GenQuery.Next;
         end;
      QRLoopBand1.PrintCount := Length(WeighingIntArray);

      WinData.RefreshOverGainPerDay := True;
   finally
      qTotalWeight.Close;
      FreeAndNil(qTotalWeight);
   end;
end;

procedure TfWeighingFilt.QRExpr7Print(sender: TObject; var Value: String);
begin
   if ( Value = '0.00') then
      Value := '';
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfWeighingFilt.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         case FWeighRepType of
           wrtLatest : WinData.SetReportAsFavourite(cLatestWeighingRep,True);
           wrtWeightGain : WinData.SetReportAsFavourite(cWeightGainRep,True);
           wrtMultipleWeighings : WinData.SetReportAsFavourite(cMultipleWeighingRep,True);
         end;
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         case FWeighRepType of
           wrtLatest : WinData.SetReportAsFavourite(cLatestWeighingRep,False);
           wrtWeightGain : WinData.SetReportAsFavourite(cWeightGainRep,False);
           wrtMultipleWeighings : WinData.SetReportAsFavourite(cMultipleWeighingRep,False);
         end;
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfWeighingFilt.qrdbWeightGainLatestWeightPrint(sender: TObject;
  var Value: String);
begin
  if qReport.FieldByName('LatestWeight').AsFloat = 0 then
     Value := '';
end;

procedure TfWeighingFilt.qrdbWeightGainLatestWeighDatePrint(
  sender: TObject; var Value: String);
begin
  if qReport.FieldByName('LatestWeighingDate').AsFloat = 0 then
     Value := '';
end;

procedure TfWeighingFilt.QRDBText3Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;

procedure TfWeighingFilt.CreateNumSelectItems;
var
   i : Integer;
   RadioGroupItem : TcxRadioGroupItem;
begin
   if rgNumSelect.ItemIndex = 0 then
      begin
         rgSortBy.Properties.Items.Clear;
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'National ID';
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'National ID ( Check Digit )';
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'Date of Birth';
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'Weight';
      end
   else
      begin
         rgSortBy.Properties.Items.Clear;
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'Animal Number';
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'Date of Birth';
         RadioGroupItem := rgSortBy.Properties.Items.Add;
         RadioGroupItem.Caption := 'Weight';
      end;
   UpdateWeightItemIndexCaption;

   if WeighingDefaults <> nil then
      begin
         if ( WeighingDefaults.SortField > -1 ) and ( WeighingDefaults.SortField < rgSortBy.Properties.Items.Count ) then
            rgSortBy.ItemIndex := WeighingDefaults.SortField
         else
            rgSortBy.ItemIndex := 0;
      end
   else
      rgSortBy.ItemIndex := 0;
end;

procedure TfWeighingFilt.rgNumSelectClick(Sender: TObject);
begin
   CreateNumSelectItems;
end;

procedure TfWeighingFilt.UpdateWeightItemIndexCaption;
var
   iItemIndex : Integer;
begin
   if rgNumSelect.ItemIndex = 0 then
      iItemIndex := 3
   else
      iItemIndex := 2;

   if ( rgReportType.ItemIndex = 0 ) then
      rgSortBy.Properties.Items[iItemIndex].Caption := 'Weight'
   else if ( rgReportType.ItemIndex = 1 ) then
      rgSortBy.Properties.Items[iItemIndex].Caption := 'Weight Gain Per Day'
   else if ( rgReportType.ItemIndex = 2 ) then
      rgSortBy.Properties.Items[iItemIndex].Caption := 'Birth Weight';
end;

procedure TfWeighingFilt.rgReportTypeClick(Sender: TObject);
begin
   UpdateWeightItemIndexCaption;
end;

procedure TfWeighingFilt.lTargetDailyKgsPrint(sender: TObject;
   var Value: String);
var
   DailyKgTarget : Double;
begin
   DailyKgTarget := WinData.TargetWeightsDailyKgWarning.AsFloat;
   if ( DailyKgTarget > 0 ) then
      begin
         Value := 'Calves shown in red, if Daily Kg Gain needed is greater than: '+FloatToStr(DailyKgTarget);
         lTargetDailyKgs.Font.Color := clRed;
         lTargetDailyKgs.Font.Style := [fsBold];
      end
   else
      Value := '';
end;

function TfWeighingFilt.AddActualDailyKg(ATargetWeight, AActualWeight : Double;
   ADays, AAgeDays : Integer) : Double;
begin
   if ( ATargetWeight = 0 ) or ( AActualWeight = 0 ) or ( ADays = 0 ) or ( AAgeDays = 0 ) then
      Result := 0;

   if ATargetWeight < AActualWeight then
      Result := ( (AActualWeight - ATargetWeight) / (ADays - AAgeDays) )
   else if ATargetWeight > AActualWeight then
      Result := ( (ATargetWeight - AActualWeight) / (ADays - AAgeDays) );
end;

procedure TfWeighingFilt.CreateDailyKgTargets(AAnimalID: Integer; AAgeDays : Short;
  AWeight: Double);
begin
   if ( AAnimalID = 0 ) or ( AAgeDays = 0 ) or ( AWeight = 0 ) or ( AAgeDays > 720 ) then Exit;

   with MyTable do
      begin
         if Locate('AnimalID',AAnimalID,[]) then
            begin
               if AAgeDays > 0 then
                  begin
                     Edit;
                     if ( GetAgeCategory(AAgeDays) = ac0To41Days ) then
                        begin
                           FieldByName('SixWeekDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField6WeekTarget.AsFloat,
                                                                                           AWeight,42,AAgeDays);
                           FieldByName('ThreeMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField3MonthTarget.AsFloat,
                                                                                            AWeight,90,AAgeDays);
                           FieldByName('SixMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField6MonthTarget.AsFloat,
                                                                                          AWeight,180,AAgeDays);
                           FieldByName('TlveMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField12MonthTarget.AsFloat,
                                                                                          AWeight,360,AAgeDays);
                           FieldByName('FteenMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField15MonthTarget.AsFloat,
                                                                                            AWeight,450,AAgeDays);
                           FieldByName('TwtyOneMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField21MonthTarget.AsFloat,
                                                                                              AWeight,630,AAgeDays);
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac42To89Days ) then
                        begin
                           FieldByName('ThreeMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField3MonthTarget.AsFloat,
                                                                                            AWeight,90,AAgeDays);
                           FieldByName('SixMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField6MonthTarget.AsFloat,
                                                                                          AWeight,180,AAgeDays);
                           FieldByName('TlveMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField12MonthTarget.AsFloat,
                                                                                          AWeight,360,AAgeDays);
                           FieldByName('FteenMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField15MonthTarget.AsFloat,
                                                                                            AWeight,450,AAgeDays);
                           FieldByName('TwtyOneMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField21MonthTarget.AsFloat,
                                                                                              AWeight,630,AAgeDays);
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac90To179Days ) then
                        begin
                           FieldByName('SixMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField6MonthTarget.AsFloat,
                                                                                          AWeight,180,AAgeDays);
                           FieldByName('TlveMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField12MonthTarget.AsFloat,
                                                                                          AWeight,360,AAgeDays);
                           FieldByName('FteenMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField15MonthTarget.AsFloat,
                                                                                            AWeight,450,AAgeDays);
                           FieldByName('TwtyOneMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField21MonthTarget.AsFloat,
                                                                                              AWeight,630,AAgeDays);
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac180To359Days ) then
                        begin
                           FieldByName('TlveMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField12MonthTarget.AsFloat,
                                                                                          AWeight,360,AAgeDays);
                           FieldByName('FteenMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField15MonthTarget.AsFloat,
                                                                                            AWeight,450,AAgeDays);
                           FieldByName('TwtyOneMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField21MonthTarget.AsFloat,
                                                                                              AWeight,630,AAgeDays);
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac360To449Days ) then
                        begin
                           FieldByName('FteenMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField15MonthTarget.AsFloat,
                                                                                            AWeight,450,AAgeDays);
                           FieldByName('TwtyOneMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField21MonthTarget.AsFloat,
                                                                                              AWeight,630,AAgeDays);
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac450To629Days ) then
                        begin
                           FieldByName('TwtyOneMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField21MonthTarget.AsFloat,
                                                                                              AWeight,630,AAgeDays);
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac630To719Days ) then
                        begin
                           FieldByName('TwtyFourMthDailyKgActual').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end
                     else if ( GetAgeCategory(AAgeDays) = ac720DaysPlus ) then
                        begin
                           FieldByName('GreaterThanTwtyFourMths').AsFloat := AddActualDailyKg(WinData.TargetWeightsField24MonthTarget.AsFloat,
                                                                                               AWeight,720,AAgeDays);
                        end;
                     Post;
                  end;
            end;
      end;
end;

function TfWeighingFilt.GetAgeCategory(ADays: Integer): TAgeCategory;
begin
   case ADays of
      0..41 : Result := ac0To41Days;
      42..89 : Result := ac42To89Days;
      90..179 : Result := ac90To179Days;
      180..359 : Result := ac180To359Days;
      360..449 : Result := ac360To449Days;
      450..629 : Result := ac450To629Days;
      630..719 : Result := ac630To719Days;
      720..1000 : Result := ac720DaysPlus;
   end;
end;

procedure TfWeighingFilt.qrdbBirthTargetPrint(sender: TObject;
  var Value: String);
var
   LatestWeight,
   TargetWeight : Double;
begin
   if ( Sender is TQRDBText ) then
      begin
         ( Sender as TQRDBText ).Font.Color := clBlack;
         ( Sender as TQRDBText ).Font.Style := [];
      end;

   if ( Value = '0.00' ) or ( Value = '0' ) then
      Value := '';

   if ( Value <> '' ) then
      begin
         if StrToFloat(Value) > WinData.TargetWeightsDailyKgWarning.AsFloat then
            begin
              if ( Sender is TQRDBText ) then
                 begin
                    ( Sender as TQRDBText ).Font.Color := clRed;
                    ( Sender as TQRDBText ).Font.Style := [fsBold];
                 end;
            end;

         if ( Sender is TQRDBText ) then
            begin
               LatestWeight := qrdbLWLatestWeight.DataSet.FieldByName(qrdbLWLatestWeight.DataField).AsFloat;
               if (Sender as TQRDBText).Name = 'qrdbSixWkTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField6WeekTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbThreeMthTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField3MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbSixMthTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField6MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbSixMthTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField6MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbTlveMthTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField12MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbFfteenTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField15MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbTwtyOneMthTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField21MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end
               else if (Sender as TQRDBText).Name = 'qrdbTwtyFourMthTarget' then
                  begin
                     if LatestWeight > WinData.TargetWeightsField24MonthTarget.AsFloat then
                        begin
                           Value := 'Over';
                           ( Sender as TQRDBText ).Font.Color := clGreen;
                           ( Sender as TQRDBText ).Font.Style := [fsBold];
                        end;
                  end;
            end;
      end;
end;

procedure TfWeighingFilt.AssignQRptDataFields;
begin
   qrdbBirthTarget.DataField := 'BirthDailyKgActual';
   qrdbBirthTarget.Mask := '0.00';
   qrdbSixWkTarget.DataField := 'SixWeekDailyKgActual';
   qrdbSixWkTarget.Mask := '0.00';
   qrdbThreeMthTarget.DataField := 'ThreeMthDailyKgActual';
   qrdbThreeMthTarget.Mask := '0.00';
   qrdbSixMthTarget.DataField := 'SixMthDailyKgActual';
   qrdbSixMthTarget.Mask := '0.00';
   qrdbTlveMthTarget.DataField := 'TlveMthDailyKgActual';
   qrdbTlveMthTarget.Mask := '0.00';
   qrdbFfteenTarget.DataField := 'FteenMthDailyKgActual';
   qrdbFfteenTarget.Mask := '0.00';
   qrdbTwtyOneMthTarget.DataField := 'TwtyOneMthDailyKgActual';
   qrdbTwtyOneMthTarget.Mask := '0.00';
   qrdbTwtyFourMthTarget.DataField := 'TwtyFourMthDailyKgActual';
   qrdbTwtyFourMthTarget.Mask := '0.00';
end;

//   16/04/15 [V5.4 R4.8] /MK Additional Feature - Apply main grid colour settings to weight gain report - William Hutchinson request.
procedure TfWeighingFilt.UpdateFontStyleByGridColourSelect ( AQRBand : TQRCustomBand );
var
   AnimalSex : String;
   UsedForBreeding : Boolean;
   NoMonths : Integer;
   DateOfBirth, AFromDate, AToDate, ADateOver : TDateTime;

   procedure UpdateFontColour ( AFontColour : TColor; ABold : Boolean; AQRBand : TQRCustomBand );
   var
      i : Integer;
   begin
      with AQRBand do
         begin
            for i := 0 to ControlCount-1 do
               begin
                  if ( Controls[i] is TQRDBText ) then
                     begin
                        (Controls[i] as TQRDBText).Font.Color := AFontColour;
                        (Controls[i] as TQRDBText).Font.Style := [fsBold];
                     end;
               end;
         end;
   end;

begin
   AnimalSex := qReport.FieldByName('Sex').AsString;
   UsedForBreeding := qReport.FieldByName('UsedForBreeding').AsBoolean;
   DateOfBirth := qReport.FieldByName('DateOfBirth').AsDateTime;

   if ( not VarIsNull(AnimalSex)) and ( not VarIsNull(UsedForBreeding)) then
      begin
         if (not UsedForBreeding) then
            begin
               if ( AnimalSex = cSex_Steer ) then
                  begin
                     if ( (WinData.GlobalSettings.SteerAttrNoMonthsFrom >= 0) and
                          (WinData.GlobalSettings.SteerAttrNoMonthsTo > 0) and
                          (WinData.GlobalSettings.SteerAttrNoMonthsOver > 0) ) then
                           begin
                              NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsFrom;
                              AFromDate := IncMonth(Date, -NoMonths);

                              NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsTo;
                              AToDate := IncMonth(Date, -NoMonths);

                              NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsOver;
                              ADateOver := IncMonth(Date, -NoMonths);

                              if ( DateInRange(DateOfBirth, AFromDate, AToDate) ) then
                                 UpdateFontColour(TColor(WinData.GlobalSettings.SteerAttrColourBetween),
                                                  WinData.GlobalSettings.SteerAttrBoldBetween,
                                                  AQRBand)
                              else if ( DateOfBirth < ADateOver ) then
                                 UpdateFontColour(TColor(WinData.GlobalSettings.SteerAttrColourOver),
                                                  WinData.GlobalSettings.SteerAttrBoldOver,
                                                  AQRBand);
                           end;
                  end
               else if ( AnimalSex = cSex_Female ) and ( not(UsedForBreeding) ) then
                  begin
                     if ( (WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom >= 0) and
                          (WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo > 0) and
                          (WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver > 0) ) then
                        begin
                           NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom;
                           AFromDate := IncMonth(Date, -NoMonths);

                           NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo;
                           AToDate := IncMonth(Date, -NoMonths);

                           NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver;
                           ADateOver := IncMonth(Date, -NoMonths);

                           if ( DateInRange(DateOfBirth, AFromDate, AToDate) ) then
                              UpdateFontColour(TColor(WinData.GlobalSettings.BeefFemaleAttrColourBetween),
                                               WinData.GlobalSettings.BeefFemaleAttrBoldBetween,
                                               AQRBand)
                           else if ( DateOfBirth < ADateOver ) then
                              UpdateFontColour(TColor(WinData.GlobalSettings.BeefFemaleAttrColourOver),
                                               WinData.GlobalSettings.BeefFemaleAttrBoldOver,
                                               AQRBand);
                        end;
                  end
               else if ( AnimalSex = cSex_Bull ) and ( not(UsedForBreeding) ) then
                  begin
                     if ( (WinData.GlobalSettings.BeefBullAttrNoMonthsFrom >= 0) and
                          (WinData.GlobalSettings.BeefBullAttrNoMonthsTo > 0) and
                          (WinData.GlobalSettings.BeefBullAttrNoMonthsOver > 0) ) then
                        begin
                           NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsFrom;
                           AFromDate := IncMonth(Date, -NoMonths);

                           NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsTo;
                           AToDate := IncMonth(Date, -NoMonths);

                           NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsOver;
                           ADateOver := IncMonth(Date, -NoMonths);

                           if ( DateInRange(DateOfBirth, AFromDate, AToDate) ) then
                              UpdateFontColour(TColor(WinData.GlobalSettings.BeefBullAttrColourBetween),
                                               WinData.GlobalSettings.BeefBullAttrBoldBetween,
                                               AQRBand)
                           else if ( DateOfBirth < ADateOver ) then
                              UpdateFontColour(TColor(WinData.GlobalSettings.BeefBullAttrColourOver),
                                               WinData.GlobalSettings.BeefBullAttrBoldOver,
                                               AQRBand);
                        end;
                  end;
            end
      end;
end;

procedure TfWeighingFilt.WeightGainDetailBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   UpdateFontStyleByGridColourSelect(Sender);
end;

function TfWeighingFilt.GetAvgWeightGainQRLabelCaption (ATableName : String ) : String;
var
   TotalNumDays : Integer;
   TotalWeightGain,
   AvgGainPerDay : Double;
   SampleLabel : TQRLabel;
begin
   Result := '0.00';
   TotalWeightGain := 0;
   TotalNumDays := 0;
   AvgGainPerDay := 0;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT SUM(WeightGain)');
         SQL.Add('FROM '+ATableName+'');
         Open;
         try
            TotalWeightGain := Fields[0].AsInteger;
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT SUM(NumDays)');
         SQL.Add('FROM '+ATableName+'');
         Open;
         try
            TotalNumDays := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;

   if ( TotalWeightGain <> 0 ) and ( TotalNumDays <> 0 ) then
      begin
         AvgGainPerDay := TotalWeightGain / TotalNumDays;
         Result := FormatFloat('0.00', AvgGainPerDay);
      end;
end;

procedure TfWeighingFilt.qlWeighGainAveragePrint(sender: TObject; var Value: String);
begin
   Value := GetAvgWeightGainQRLabelCaption(MyTable.TableName);
end;

procedure TfWeighingFilt.qrlIntWeighRptAvgWeightGainPrint(sender: TObject; var Value: String);
begin
   Value := GetAvgWeightGainQRLabelCaption(WeighingsTable.TableName);
end;

procedure TfWeighingFilt.CreateWeighingRecords;
var
   LastWeight,
   GainPerDay,
   WeighGain : Double;
   LastDate : TDateTime;
   i,
   NumDays,
   Intervals : Integer;
   qAnimals,
   qWeighRecord,
   qUpdateWeighRecord : TQuery;
begin
   LastWeight := 0;
   GainPerDay := 0;
   WeighGain := 0;
   LastDate := 0;
   NumDays := 0;
   Intervals := 0;

   if ( WeighingsTable.RecordCount = 0 ) then
      begin
         MessageDlg('No data in '+WeighingsTable.TableName+'.',mtError,[mbOK],0);
         Exit;
      end;

   qAnimals := TQuery.Create(nil);
   qWeighRecord := TQuery.Create(nil);
   qUpdateWeighRecord := TQuery.Create(nil);
   try
      qAnimals.DatabaseName := AliasName;
      qWeighRecord.DatabaseName := AliasName;
      qUpdateWeighRecord.DatabaseName := AliasName;

      qAnimals.SQL.Clear;
      qAnimals.SQL.Add('SELECT DISTINCT(AnimalID)');
      qAnimals.SQL.Add('FROM '+WeighingsTable.TableName+'');
      qAnimals.Open;
      qAnimals.First;
      if ( qAnimals.RecordCount = 0 ) then
         begin
            MessageDlg('No animals found in '+WeighingsTable.TableName+'.',mtError,[mbOK],0);
            Exit;
         end;

      fProgressBar.Properties.Min := 1;
      fProgressBar.Properties.Max := qAnimals.RecordCount;
      fProgressBar.Position := 1;
      Application.ProcessMessages;
      Update;
      WeighReportStatus.Panels[0].Text := 'Creating >2 Weighings Report';
      while ( not(qAnimals.Eof) ) do
         begin
            qWeighRecord.Close;
            qWeighRecord.SQL.Clear;
            qWeighRecord.SQL.Add('SELECT *');
            qWeighRecord.SQL.Add('FROM '+WeighingsTable.TableName+'');
            qWeighRecord.SQL.Add('WHERE AnimalID = '+IntToStr(qAnimals.Fields[0].AsInteger)+'');
            qWeighRecord.SQL.Add('ORDER BY WeighingDate ASC');
            qWeighRecord.Open;
            Intervals := 0;
            for i := 1 to qWeighRecord.RecordCount do
               try
                  qWeighRecord.RecNo := i;

                  Inc(Intervals);

                  if ( Intervals = 1 ) then
                     //   08/11/17 [V5.7 R4.4] /MK Bug Fix - Locate on qReport was not on qAnimals.
                     if ( qReport.Locate('AnimalID',qAnimals.FieldByName('AnimalID').AsInteger,[]) ) then
                        if ( qReport.FieldByName('PurchDate').AsDateTime > 0 ) then
                           begin
                              LastDate := qReport.FieldByName('PurchDate').AsDateTime;
                              LastWeight := qReport.FieldByName('PurchWeight').AsFloat;
                           end
                        else
                           begin
                              LastDate := qReport.FieldByName('DateOfBirth').AsDateTime;
                              LastWeight := qReport.FieldByName('BirthWeight').AsFloat;
                           end;

                  //   28/03/17 [V5.6 R6.8] /MK Bug Fix - Added try except around assigning weight gain and NumDays in CreateIntervals as there was an unexplainable error assigning NumDays - Eddie Jordan.
                  try
                     WeighGain := qWeighRecord.FieldByName('Weight').AsFloat - LastWeight;
                     NumDays := Trunc( qWeighRecord.FieldByName('WeighingDate').AsDateTime - LastDate );
                     if ( WeighGain > 0 ) and ( NumDays > 0 ) then
                        GainPerDay := WeighGain / NumDays
                  except
                  end;

                  // Set the Interval number of Days since
                  qUpdateWeighRecord.Close;
                  qUpdateWeighRecord.SQL.Clear;
                  qUpdateWeighRecord.SQL.Add('UPDATE '+WeighingsTable.TableName+'');
                  qUpdateWeighRecord.SQL.Add('SET WeightGain = :WeighGain,');
                  qUpdateWeighRecord.SQL.Add('    GainPerDay = :GainPerDay,');
                  qUpdateWeighRecord.SQL.Add('    NumDays = :NumDays');
                  qUpdateWeighRecord.SQL.Add('WHERE ID = :WeighRecordID');
                  qUpdateWeighRecord.Params[0].AsFloat := WeighGain;
                  qUpdateWeighRecord.Params[1].AsFloat := GainPerDay;
                  qUpdateWeighRecord.Params[2].AsInteger := NumDays;
                  qUpdateWeighRecord.Params[3].AsInteger := qWeighRecord.FieldByName('ID').AsInteger;
                  qUpdateWeighRecord.ExecSQL;

                  LastDate := qWeighRecord.FieldByName('WeighingDate').AsDateTime;
                  LastWeight := qWeighRecord.FieldByName('Weight').AsFloat;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            fProgressBar.Position := fProgressBar.Position+1;
            Application.ProcessMessages;
            Update;
            qAnimals.Next;
         end;
   finally
      WeighingsTable.Filter := '';
      WeighingsTable.Filtered := False;
      WeighingsTable.Close;
      WeighingsTable.Open;
      qAnimals.Close;
      FreeAndNil(qAnimals);
   end;
end;

function TfWeighingFilt.GetFirstIntervalWeighingRecord : TWeighingIntervalRec;
var
   qIntAnimals,
   qWeighRecords : TQuery;
   dMeanWeighDate,
   dFirstWeighDate : TDateTime;
   fTotalWeight : Double;
begin
   Result.MeanWeighDate := 0;
   Result.TotAnimals := 0;
   Result.TotalNumDays := 0;
   Result.TotalWeight := 0;
   Result.AvgWeight := 0;
   Result.TotalWeighGain := 0;
   Result.TotalGainPerDay := 0;
   Result.TotalNumDays := 0;

   qWeighRecords := TQuery.Create(nil);
   qIntAnimals := TQuery.Create(nil);
   try
      qIntAnimals.DatabaseName := AliasName;
      qWeighRecords.DatabaseName := AliasName;

      qIntAnimals.SQL.Clear;
      qIntAnimals.SQL.Add('SELECT DISTINCT(AnimalID)');
      qIntAnimals.SQL.Add('FROM '+WeighingsTable.TableName+'');
      qIntAnimals.Open;
      qIntAnimals.First;
      dMeanWeighDate := 0;
      fTotalWeight := 0;
      while ( not(qIntAnimals.Eof) ) do
         try
            if ( qReport.Locate('AnimalID',qIntAnimals.FieldByName('AnimalID').AsInteger,[]) ) then
               begin
                  // First get the animals birth or purchase weight.
                  if ( dMeanWeighDate < qReport.FieldByName('PurchDate').AsDateTime ) then
                     dMeanWeighDate := qReport.FieldByName('PurchDate').AsDateTime
                  else if ( dMeanWeighDate < qReport.FieldByName('DateOfBirth').AsDateTime ) then
                     dMeanWeighDate := qReport.FieldByName('DateOfBirth').AsDateTime;

                  //   12/01/18 [V5.7 R7.4] /MK Bug Fix - Add total weight from first weight regardless whether first weigh date < dFirstWeighDate.
                  if ( qReport.FieldByName('PurchWeight').AsFloat > 0 ) then
                     begin
                        dFirstWeighDate := qReport.FieldByName('PurchDate').AsDateTime;
                        fTotalWeight := fTotalWeight + qReport.FieldByName('PurchWeight').AsFloat
                     end
                  else if ( qReport.FieldByName('BirthWeight').AsFloat > 0 ) then
                     begin
                        dFirstWeighDate := qReport.FieldByName('DateOfBirth').AsDateTime;
                        fTotalWeight := fTotalWeight + qReport.FieldByName('BirthWeight').AsFloat;
                     end;

                  // Now get the individual weighing records prior to the block weighing date selected.
                  qWeighRecords.Close;
                  qWeighRecords.SQL.Clear;
                  qWeighRecords.SQL.Add('SELECT E.EventDate WeighingDate, W.Weight');
                  qWeighRecords.SQL.Add('FROM Events E');
                  qWeighRecords.SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
                  qWeighRecords.SQL.Add('WHERE E.AnimalID = '+IntToStr(qIntAnimals.FieldByName('AnimalID').AsInteger)+'');

                  //   12/01/18 [V5.7 R7.4] /MK Bug Fix - Only show weigh records if weighing event is after the first weigh date.
                  qWeighRecords.SQL.Add('AND   E.EventDate > "'+FormatDateTime(cUSDateStyle,dFirstWeighDate)+'"');

                  qWeighRecords.SQL.Add('AND   E.EventDate < "'+FormatDateTime(cUSDateStyle,FWeighRepOptions.BlockWeightStartDate)+'"');
                  qWeighRecords.SQL.Add('AND   E.EventType = '+IntToStr(CWeightEvent)+'');
                  qWeighRecords.SQL.Add('ORDER BY E.EventDate ASC');
                  qWeighRecords.Open;
                  qWeighRecords.First;
                  while ( not(qWeighRecords.Eof) ) do
                     begin
                        if ( qWeighRecords.FieldByName('WeighingDate').AsDateTime > dMeanWeighDate ) then
                           dMeanWeighDate := qWeighRecords.FieldByName('WeighingDate').AsDateTime;
                        if ( qWeighRecords.FieldByName('Weight').AsFloat > 0 ) then
                           fTotalWeight := fTotalWeight + qWeighRecords.FieldByName('Weight').AsFloat;
                        qWeighRecords.Next;
                     end;
               end;
            qIntAnimals.Next;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      Result.MeanWeighDate := dMeanWeighDate;
      Result.TotAnimals := qIntAnimals.RecordCount;
      Result.TotalNumDays := Trunc(FWeighRepOptions.BlockWeightStartDate - dMeanWeighDate);
      Result.TotalWeight := fTotalWeight;
      Result.AvgWeight := ( Result.TotalWeight / Result.TotAnimals );
   finally
      qIntAnimals.Close;
      FreeAndNil(qIntAnimals);
   end;
end;

procedure TfWeighingFilt.DatePrint(sender: TObject; var Value: String);
begin
   if ( Sender is TQRDBText ) then
      begin
         if ( (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0 ) then
            Value := ''
         else
            Value := FormatDateTime('dd/MM/yy',StrToDate(Value));
      end;
end;

procedure TfWeighingFilt.QRDBText7Print(sender: TObject; var Value: String);
begin
   if ( Sender is TQRDBText ) then
      begin
         if ( (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).Value = Null ) then
            Value := '';
         if ( (Sender as TQRDBText).DataField = 'DateOfBirth' ) then
            Value := FormatDateTime('dd/MM/yy',StrToDate(Value));
      end;
end;

procedure TfWeighingFilt.actReportOptionsExecute(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   if ( rgReportType.ItemIndex = 0 ) then
      TfmReportOptions.ShowWeighRepOptions(FWeighRepOptions,otWeightTargets)
   else if ( rgReportType.ItemIndex = 1 ) then
      TfmReportOptions.ShowWeighRepOptions(FWeighRepOptions,otWeightGain)
   else if ( rgReportType.ItemIndex = 2 ) then
      TfmReportOptions.ShowWeighRepOptions(FWeighRepOptions,otWeightMulti);
end;

procedure TfWeighingFilt.MultiWeighDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   DetailBand1BeforePrint(Sender,PrintBand);
   MultiWeighDetail.Frame.Width := 1;
end;

procedure TfWeighingFilt.actTargetWeightsExecute(Sender: TObject);
begin
   TfmWeightTargets.ShowTheForm;
   WinData.TargetWeights.Close;
   WinData.TargetWeights.Open;
end;

end.
