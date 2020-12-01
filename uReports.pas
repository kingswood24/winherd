{
 03/02/2009 [Dev V3.8 R 5.9 ] /SP : Program Change - Create new preference "Use New Report Layout Style", allows user to toggle between old Report Screen and New Report Screen.

 23/02/2009 [Dev V3.8 R 6.3 ] /SP : Bug Fix - actVeterinaryRegisterExecute3 call to HeatlthFilter.ShowModal was not being made.

 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Removed the option for Historical Livestock Nutrient Report ( for all countries "GL")

 17/02/11 [V4.0 R8.2] /MK Change - GL Wanted The Veterinary/Quality Assurance Section Laid Out So Veterinary Register and Purchases Are First

 ************ Not On Release/Dev ************
 04/08/11 [V4.1 R4.4] /MK/SP Additional Feature - On Mouse Enter For Each NavBar The Program Will Show Reports That Normal Appear On Down Arrow Click.
                                                - For NavBar's That Have Up/Down Arrows, NavBar Caption Also Displays Report Index Selected + NavBar Item Count.

 28/09/11 [V5.0 R0.9] /MK Change - Changed Placement Of Bull List And Recent Activiteis In nbgCowRecordingControl.

 06/12/11 [V5.0 R2.5] /MK Change - Changes To Screen For Font Color, Removed Timer Drop Down Arrows And Added Drop-Down-Arrow On Heading Bar.

 21/03/12 [V5.0 R4.5] /MK Change - uHerdRec - CreateAndShow - New Boolean Check For Reconcile By Cards Checked Here.

 02/04/12 [V5.0 R4.8] /MK Additional Feature - New ComboBox For uReportFilters.

 16/05/12 [V5.0 R5.7] /MK Additional Feature - Add ReportGen Item To cmboReportFilter.
                                             - Set ReportGen ReportType.

 16/05/12 [V5.0 R5.7] /MK Additional Feature - Changes To Show Report Filter Type Selected.

 06/06/12 [V5.0 R7.0] /MK Additional Feature - cmboReportFilter - Added OnChange Procedure To OnClose 

 18/06/12 [V5.0 R7.2] /MK Change - Check If Favourite or Most Used Reports Exist And Show Warning If They Don't.

 28/09/12 [V5.0 R8.9] /MK Change - Added Herd Report Generator to Cattle Margins menu.

 07/12/12 [V5.1 R3.5] /MK Change - New Name for Reps Report - Monthy Livestock Numbers - for all countrys.
                                 - New Name for Profit Monitor Summary if <> DairyHerd and Country is Ireland

 18/01/13 [V5.1 R3.8] /MK Bug Fix - Changed the cmboReportFilter.OnClick to Properties.OnCloseUp.
                                  - If user clicks cmboReportFilter.ItemIndex 0 set Defaults table ReportFilters to None.

 13/03/14 [V5.2 R9.0] /MK Change - Changed caption of Calf Performance Generator to Dam & Calf Report Generator.

 26/11/14 [V5.4 R0.1] /MK Bug Fix - CattleMarginsReportMenu was not finished i.e. the down-arrow-button was never added.
                                  - nbCattleMargins.Hint was not set to Beef Management so clicking on down-arrow was not setting Caption.
                                  - Discrepancy between items in CowRecordingReportMenu and nbgCowRecordingControl items.
                                  - actFertilityTreatmentChart.Tag was not set to nbgBreedFertqBreedFertControl.Tag.
                          Change - moved Herd Report Generator to Herd Reports from Cow Recording - GL Request.

 07/01/15 [V5.4 R0.5] /MK Bug Fix - Drop-Down-Button click for CowRec and Beef Man was setting tag of Herd Report Generator when it didn't
                                    need to as component properties were already set to the right tag. Left over from bug fix testing.
                                    Caused Herd Report Generator to appear in CowRec menu as well as DamCalfRepGen - GL reported.

 06/08/15 [V5.4 R7.2] /MK Additional Feature - Added BarPopupMenu to unit for MedicineStockReport to show All, InUse or NotInUse - Mary Whyte request.

 25/10/17 [V5.7 R4.1] /MK Change - FormCreate - Moved weighing report above Bull Report so users can see it without scrolling - TOK/GL request.
                                 - Hide Weighings Report in Cattle Margins if both Cow Recording and Cattle Margins are showing/not showing.
                                 - Hide Weighings Report in Cow Recording if Cow Recording is not showing.
                                 - Hide Weighings Report in Cattle Margins if Cattle Margins is not showing.

 12/03/18 [V5.7 R8.3] /MK Additional Feature - Added BarPopMenu for Weighing Report that allows the user to pass in the report type of the weighing report - GL/SP/Mary Deane.

 03/04/18 [V5.7 R8.6] /MK Additional Feature - Added the Sire Analysis report to the Cow Recording section before the Bull Report - GL request.

 31/05/18 [V5.8 R0.2] /MK Change - Created an TActionList dynamically that contans the actions of the CowRecording section to allow ordering of
                                   the CowRecording menu based on whether the herd type is Suckler or not - GL request.

 09/07/18 [V5.8 R0.8] /MK Change - FormCreate - If Herd Type is Beef then don't show "with Sires" after Weight Gain Analysis.

 07/08/18 [V5.8 R2.2] /MK Change - Changed caption of actLivestockInventory from Annual Livestock Valuation to Annual Livestock Inventory - GL.

 27/08/18 [V5.8 R2.5] /MK Change - SetupForm - Made changes to the visble = False where Visible is set by the Country.
                                             - Check to see if AIM exists and change actCMMSReconciliation to AIM Reconciliation.

 08/10/18 [V5.8 R3.0] /MK Change - If Dealer user then change vet/feed purchase report to vet purchase report.

 05/12/18 [V5.8 R5.7] /MK Change - ReportsCheckMods - Only show Herd Report Generator once.

 23/08/19 [V5.9 R0.1] /MK Change - Hide Milk Quota Planner, not relevant anymore - GL request.
                                 - Change Caption of Dairy Benchmarks Report to "Milk / Feed Performance" - GL request.

 13/09/19 [V5.9 R0.3] /MK Change - Remove Browse Sire Register from Breeding Fertility section.
                                 - Change order of Breeding Fertility section so that Herd Fertility reports are first - GL request.
                                 - Seperate Herd Fertility reports from drop-down-list, show them individually - GL request.
}

unit uReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxStyles, dxNavBarCollns, cxClasses, dxNavBarBase, ExtCtrls, dxNavBar,
  dxNavBarStyles, RXCtrls, Adgrad, ActnList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxSpinButton, RxLookup,
  StdCtrls, GenTypesConst, uHerdLookup, dxBar, cxButtons, kDBRoutines,
  dxBarExtDBItems, dxBarExtItems, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxLookAndFeels, Menus,
  uReportFilters, db, dbTables, uSireAnalysis,
  uSireAnalysisFilter, uAIMClient,
  dxNavBarOfficeViews, dxNavBarOffice11Views, dxNavBarViewsFact;

type

  TReportMenu = class(TCustomPanel)
  private
    Labels : array [0..3] of TcxLabel;
    UpButton : Tcxbutton;
    DownButton : Tcxbutton;
    FReportMenuItems : TStringList;
    FTopIndex: Integer;
    FPaintMenuItems : Boolean;
    FNavBarPopupMenu : TdxBarPopupMenu;
    FPoint : TPoint;
    FTimer : TTimer;
    FViewStatus: string;
    FNavBar: TdxNavBar;
    procedure SetTopIndex(const Value: Integer);
    function GetLabel(Index: Integer): TcxLabel;
    procedure PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PanelMouseEnter(Sender: TObject);
    procedure PanelMouseLeave(Sender: TObject);
    procedure LabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpButtonClick(Sender : TObject);
    procedure DownButtonClick(Sender : TObject);
    procedure LabelClick(Sender : TObject);
    procedure OnTimer(Sender: TObject);
    procedure PopupReportsMenu();
    procedure HideNavBarPopupMenu;
    function GetActionByName(AActionName : string) : TContainedAction;
  protected
    ActionList : TActionList;
    procedure UpdateMenuItems;
    procedure DrawMenu;
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
    procedure AddItem(AAction : TAction);
    property TopIndex : Integer read FTopIndex write SetTopIndex;
    property AccessLabels[Index : Integer] : TcxLabel read GetLabel;
    property NavBarPopupMenu : TdxBarPopupMenu read FNavBarPopupMenu write FNavBarPopupMenu;
    property ViewStatus : string read FViewStatus;
    property Navbar : TdxNavBar read FNavBar write FNavBar;
  end;

  TdxMyNavBarOffice11NavPaneViewInfo = class(TdxNavBarOffice11NavPaneViewInfo)
  public
    function GetSplitterHeight: Integer; override;
    function GetOverflowPanelHeight: Integer; override;
  end;

  TdxMyNavBarOffice11NavPanePainter = class(TdxNavBarOffice11NavPanePainter)
  protected
    function CreateViewInfo: TdxNavBarViewInfo; override;
  public
    procedure DrawOverflowPanel; override;
    procedure DrawSplitter; override;
  end;

  TfmReports = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyleHerdReports: TcxStyle;
    pNewReports: TPanel;
    ReportsActionList: TActionList;
    actBovineHerdRegister: TAction;
    actStockOnHand: TAction;
    actCMMSReconcilitation: TAction;
    actPurchaseSalesAnalysis: TAction;
    actTagReplacementForm: TAction;
    actREPSReport: TAction;
    actProfitMonitorSummary: TAction;
    actLivestockInventory: TAction;
    actNutrientProduction: TAction;
    actSalesPlanner: TAction;
    actRestrictedAnimalsReport: TAction;
    actDiseaseTestStatus: TAction;
    actFQASReport: TAction;
    actNonFQASReport: TAction;
    act30Mth10Day: TAction;
    act30Mth30Day: TAction;
    actHistoricalNutrientProduction: TAction;
    AdrockGradientFill1: TAdrockGradientFill;
    nbHerdReports: TdxNavBar;
    nbgHerdReports: TdxNavBarGroup;
    nbHerdReportsnbiBovineRegister: TdxNavBarItem;
    nbHerdReportsnbiStockOnHand: TdxNavBarItem;
    nbHerdReportsnbiCMMSReconciliation: TdxNavBarItem;
    nbHerdReportsnbiPurchaseSalesAnalysis: TdxNavBarItem;
    nbHerdReportsnbiTagReplacementForm: TdxNavBarItem;
    HeaderStyle: TdxNavBarStyleItem;
    nbiItemStyle: TdxNavBarStyleItem;
    nbiItemStyleHotTracked: TdxNavBarStyleItem;
    nbiItemStylePressed: TdxNavBarStyleItem;
    nbInventoryReports: TdxNavBar;
    nbgInventoryReports: TdxNavBarGroup;
    nbiLivestockInventory: TdxNavBarItem;
    nbiREPSReport: TdxNavBarItem;
    nbiProfitMonitorSummary: TdxNavBarItem;
    nbiNutrientProduction: TdxNavBarItem;
    nbiHistoricalNutrientProduction: TdxNavBarItem;
    nbgInventoryReportsControl: TdxNavBarGroupControl;
    nbVeterinaryMisc: TdxNavBar;
    nbgVeterinaryMisc: TdxNavBarGroup;
    nbiSalesPlanner: TdxNavBarItem;
    nbiRestrictedAnimalsReport: TdxNavBarItem;
    nbiDiseaseTestStatus: TdxNavBarItem;
    nbgVeterinaryMiscControl: TdxNavBarGroupControl;
    actVeterinaryRegister: TAction;
    actVeterinaryDueToList: TAction;
    actMedicineStockReport: TAction;
    actSCCCurrentLactationAnalysis: TAction;
    actVeterinaryFeedPurchases: TAction;
    actVeterinaryRptGen: TAction;
    nbiVeterinaryRegister: TdxNavBarItem;
    nbiVeterinaryDueToList: TdxNavBarItem;
    nbiMedicineStockReport: TdxNavBarItem;
    nbiSCCCurrentLactationAnalysis: TdxNavBarItem;
    nbiVeterinaryFeedPurchases: TdxNavBarItem;
    nbiVeterinaryRptGen: TdxNavBarItem;
    dxBarManager1: TdxBarManager;
    nbCattleMargins: TdxNavBar;
    nbgCattleMargins: TdxNavBarGroup;
    nbiCattleMargins: TdxNavBarItem;
    nbiWeighingsCatMarg: TdxNavBarItem;
    nbiLivestockValutation: TdxNavBarItem;
    nbgCattleMarginsControl: TdxNavBarGroupControl;
    actCattleMargins: TAction;
    actWeighings: TAction;
    actLivestockValuation: TAction;
    nbiBeefPurchaseGrps: TdxNavBarItem;
    actBeefPurchaseGrps: TAction;
    nbPedigreeReports: TdxNavBar;
    nbgPedigreeReports: TdxNavBarGroup;
    nbiIHFAHUKIRegistrations: TdxNavBarItem;
    nbiHerdBrochure: TdxNavBarItem;
    nbiSalesCatalogue: TdxNavBarItem;
    nbiPedigreeRptGen: TdxNavBarItem;
    nbgPedigreeReportsControl: TdxNavBarGroupControl;
    actHUKIRegistrations: TAction;
    actHerdBrochure: TAction;
    actSalesCatalogue: TAction;
    actPedigreeRptGen: TAction;
    nbCowRecord: TdxNavBar;
    nbgCowRecording: TdxNavBarGroup;
    nbiBreedingChart: TdxNavBarItem;
    nbiBreedingDueTo: TdxNavBarItem;
    nbiActionWarnRem: TdxNavBarItem;
    nbiRecentActList: TdxNavBarItem;
    nbgCowRecordingControl: TdxNavBarGroupControl;
    actBreedingChart: TAction;
    actBreedingDueTo: TAction;
    actDueCalving: TAction;
    actDueDryingOff: TAction;
    actDueService: TAction;
    actDuePregnancy: TAction;
    actDueToBeCulled: TAction;
    actActionWarnRem: TAction;
    actRecentActList: TAction;
    actDairyHerdHealthCert: TAction;
    nbiDairyHerdHealthCert: TdxNavBarItem;
    nbiWeighingsCowRec: TdxNavBarItem;
    actBullReport: TAction;
    nbiBullReport: TdxNavBarItem;
    actHerdRptGen: TAction;
    nbiHerdRptGen: TdxNavBarItem;
    actCalfPerfGen: TAction;
    nbiCalfPerfGen: TdxNavBarItem;
    nbMilkAnalysis: TdxNavBar;
    nbgMilkAnalysis: TdxNavBarGroup;
    nbiBestCowInHerd: TdxNavBarItem;
    nbiMnthRcrdReview: TdxNavBarItem;
    nbiMnthSumAnalysis: TdxNavBarItem;
    nbiMilkProdGraphs: TdxNavBarItem;
    nbgMilkAnalysisControl: TdxNavBarGroupControl;
    actBestCowInHerd: TAction;
    actMnthRcrdReview: TAction;
    actMnthSumAnalysis: TAction;
    actMilkProdGraphs: TAction;
    nbiDairyBenchmarks: TdxNavBarItem;
    actMilkFeedPerformance: TAction;
    actMlkPerfGen: TAction;
    nbiMlkPerfGen: TdxNavBarItem;
    nbBreedFert: TdxNavBar;
    nbgBreedFertqBreedFert: TdxNavBarGroup;
    nbiBreedFertiBrowseSireRegister: TdxNavBarItem;
    nbiBreedFertiSireSelection: TdxNavBarItem;
    nbiBreedFertiMlkQuotaPlan: TdxNavBarItem;
    nbiBreedFertiHerdFertility: TdxNavBarItem;
    nbiBreedFertiIndvCowFert: TdxNavBarItem;
    nbiBreedFertiFertRepGenerator: TdxNavBarItem;
    nbgBreedFertqBreedFertControl: TdxNavBarGroupControl;
    actBrowseSireReg: TAction;
    actSireSelect: TAction;
    actMilkQuotaPlan: TAction;
    actHerdFertility: TAction;
    actSeasCalvHerds: TAction;
    actSpreadCalvHerds: TAction;
    actDARDDairyFertBench: TAction;
    actIndvCowFert: TAction;
    actFertRepGenerator: TAction;
    pmBreedingDueTo: TdxBarPopupMenu;
    bbDueCalving: TdxBarButton;
    bbDueService: TdxBarButton;
    bbDueDryingOff: TdxBarButton;
    bbDuePregnancy: TdxBarButton;
    bbDueToBeCulled: TdxBarButton;
    pmSalesPlanner: TdxBarPopupMenu;
    bbSalesPlanner: TdxBarButton;
    bbFQASReport: TdxBarButton;
    actClose: TAction;
    bbNonFQASReport: TdxBarButton;
    bb30Mth10Day: TdxBarButton;
    bb30Mth30Day: TdxBarButton;
    bbTagReplacement: TdxBarButton;
    bbCMMSReconciliation: TdxBarButton;
    nbiFertilityTreatmentChart: TdxNavBarItem;
    actFertilityTreatmentChart: TAction;
    pmHerdFertility: TdxBarPopupMenu;
    bbSeasonalCalvHrds: TdxBarButton;
    bbSpreadCalvHrds: TdxBarButton;
    bbDARDDairyFertBench: TdxBarButton;
    nbProfitMonitorRprts: TdxNavBar;
    nbgProfitMonitorReports: TdxNavBarGroup;
    nbiProfitMonitorRprts: TdxNavBarItem;
    dxNavBarStyleItem1: TdxNavBarStyleItem;
    dxNavBarStyleItem2: TdxNavBarStyleItem;
    dxNavBarStyleItem3: TdxNavBarStyleItem;
    dxNavBarStyleItem4: TdxNavBarStyleItem;
    nbgProfitMonitorReportsControl: TdxNavBarGroupControl;
    actProfitMonitorRprts: TAction;
    HeaderStyleDisabled: TdxNavBarStyleItem;
    ItemStyleDisabled: TdxNavBarStyleItem;
    actWeighingsCowRec: TAction;
    actIHFAUpgradeReport: TAction;
    blbClose: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    nbgHerdReportsControl: TdxNavBarGroupControl;
    nbHerdReportsnbiConformationGradeAnalysis: TdxNavBarItem;
    actConformationGradeAnalysis: TAction;
    actFertilityCheck: TAction;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    lbInfo: TLabel;
    btnHerdReportsDrop: TcxButton;
    btnVetReportsDrop: TcxButton;
    btnCowRecDrop: TcxButton;
    btnBreedingFertDrop: TcxButton;
    btnMilkAnalysisDrop: TcxButton;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    dxBarContainerItem1: TdxBarContainerItem;
    pToolbarReportsFilter: TPanel;
    cmboReportFilter: TcxComboBox;
    lReportsFilter: TcxLabel;
    pToolbarHerdID: TPanel;
    lcmboHerdID: TcxLookupComboBox;
    lHerdID: TcxLabel;
    actHerdRptGenBeefMan: TAction;
    btnBeefManDrop: TcxButton;
    pmMedicineStockReport: TdxBarPopupMenu;
    dxBarSubItem1: TdxBarSubItem;
    bbPrintAllMedicines: TdxBarButton;
    bbPrintInUseMedicinesOnly: TdxBarButton;
    bbPrintNotInUseMedicinesOnly: TdxBarButton;
    pmWeighingReport: TdxBarPopupMenu;
    dxBarSubItem2: TdxBarSubItem;
    bbWeightGain: TdxBarButton;
    bbMultipleWeighings: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    bbLatestWeighing: TdxBarButton;
    actSireAnalysis: TAction;
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure actBovineHerdRegisterExecute(Sender: TObject);
    procedure actStockOnHandExecute(Sender: TObject);
    procedure actCMMSReconcilitationExecute(Sender: TObject);
    procedure actPurchaseSalesAnalysisExecute(Sender: TObject);
    procedure actTagReplacementFormExecute(Sender: TObject);
    procedure actProfitMonitorSummaryExecute(Sender: TObject);
    procedure actREPSReportExecute(Sender: TObject);
    procedure act30Mth30DayExecute(Sender: TObject);
    procedure act30Mth10DayExecute(Sender: TObject);
    procedure actNonFQASReportExecute(Sender: TObject);
    procedure actFQASReportExecute(Sender: TObject);
    procedure actDiseaseTestStatusExecute(Sender: TObject);
    procedure actRestrictedAnimalsReportExecute(Sender: TObject);
    procedure actSalesPlannerExecute(Sender: TObject);
    procedure actNutrientProductionExecute(Sender: TObject);
    procedure actLivestockInventoryExecute(Sender: TObject);
    procedure actVeterinaryRegisterExecute(Sender: TObject);
    procedure actVeterinaryFeedPurchasesExecute(Sender: TObject);
    procedure actVeterinaryRptGenExecute(Sender: TObject);
    procedure actSCCCurrentLactationAnalysisExecute(Sender: TObject);
    procedure actMedicineStockReportExecute(Sender: TObject);
    procedure actVeterinaryDueToListExecute(Sender: TObject);
    procedure actHistoricalNutrientProductionExecute(Sender: TObject);
    procedure actBreedingDueToExecute(Sender: TObject);
    procedure actDueCalvingExecute(Sender: TObject);
    procedure actDueServiceExecute(Sender: TObject);
    procedure actBreedingChartExecute(Sender: TObject);
    procedure actDueDryingOffExecute(Sender: TObject);
    procedure actDuePregnancyExecute(Sender: TObject);
    procedure actDueToBeCulledExecute(Sender: TObject);
    procedure actActionWarnRemExecute(Sender: TObject);
    procedure actRecentActListExecute(Sender: TObject);
    procedure actDairyHerdHealthCertExecute(Sender: TObject);
    procedure actWeighingsExecute(Sender: TObject);
    procedure actHerdRptGenExecute(Sender: TObject);
    procedure actMnthRcrdReviewExecute(Sender: TObject);
    procedure actBestCowInHerdExecute(Sender: TObject);
    procedure actBullReportExecute(Sender: TObject);
    procedure actMnthSumAnalysisExecute(Sender: TObject);
    procedure actMilkProdGraphsExecute(Sender: TObject);
    procedure actMilkFeedPerformanceExecute(Sender: TObject);
    procedure actCalfPerfGenExecute(Sender: TObject);
    procedure actCattleMarginsExecute(Sender: TObject);
    procedure actLivestockValuationExecute(Sender: TObject);
    procedure bbSalesPlannerClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actBeefPurchaseGrpsExecute(Sender: TObject);
    procedure actMlkPerfGenExecute(Sender: TObject);
    procedure actBrowseSireRegExecute(Sender: TObject);
    procedure actSireSelectExecute(Sender: TObject);
    procedure actMilkQuotaPlanExecute(Sender: TObject);
    procedure actFertRepGeneratorExecute(Sender: TObject);
    procedure actHUKIRegistrationsExecute(Sender: TObject);
    procedure actHerdBrochureExecute(Sender: TObject);
    procedure actSalesCatalogueExecute(Sender: TObject);
    procedure actPedigreeRptGenExecute(Sender: TObject);
    procedure CheckSelectedHerd;
    procedure actFertilityTreatmentChartExecute(Sender: TObject);
    procedure actHerdFertilityExecute(Sender: TObject);
    procedure actSeasCalvHerdsExecute(Sender: TObject);
    procedure actSpreadCalvHerdsExecute(Sender: TObject);
    procedure actDARDDairyFertBenchExecute(Sender: TObject);
    procedure actIndvCowFertExecute(Sender: TObject);
    procedure actFertTreatChartExecute(Sender: TObject);
    procedure actProfitMonitorRprtsExecute(Sender: TObject);
    procedure actWeighingsCowRecExecute(Sender: TObject);
    procedure cbDefaultHerdChange(Sender: TObject);
    procedure actIHFAUpgradeReportExecute(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure lcmboHerdIDPropertiesChange(Sender: TObject);
    procedure pNewReportsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure nbHerdReportsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure nbInventoryReportsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure nbVeterinaryMiscMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure nbProfitMonitorRprtsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure nbCowRecordMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure nbCattleMarginsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure nbBreedFertMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure nbMilkAnalysisMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure nbPedigreeReportsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure nbProfitMonitorRprtsMouseLeave(Sender: TObject);
    procedure nbHerdReportsMouseLeave(Sender: TObject);
    procedure nbVeterinaryMiscMouseLeave(Sender: TObject);
    procedure nbCowRecordMouseLeave(Sender: TObject);
    procedure nbCattleMarginsMouseLeave(Sender: TObject);
    procedure nbBreedFertMouseLeave(Sender: TObject);
    procedure nbMilkAnalysisMouseLeave(Sender: TObject);
    procedure nbPedigreeReportsMouseLeave(Sender: TObject);
    procedure nbHerdReportsMouseEnter(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actConformationGradeAnalysisExecute(Sender: TObject);
    procedure actFertilityCheckExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure nbVeterinaryMiscMouseEnter(Sender: TObject);
    procedure nbProfitMonitorRprtsMouseEnter(Sender: TObject);
    procedure nbMilkAnalysisMouseEnter(Sender: TObject);
    procedure nbPedigreeReportsMouseEnter(Sender: TObject);
    procedure nbCattleMarginsMouseEnter(Sender: TObject);
    procedure nbCowRecordMouseEnter(Sender: TObject);
    procedure nbInventoryReportsMouseEnter(Sender: TObject);
    procedure nbInventoryReportsMouseLeave(Sender: TObject);
    procedure btnHerdReportsDropClick(Sender: TObject);
    procedure btnVetReportsDropClick(Sender: TObject);
    procedure btnCowRecDropClick(Sender: TObject);
    procedure btnBreedingFertDropClick(Sender: TObject);
    procedure btnMilkAnalysisDropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actHerdRptGenBeefManExecute(Sender: TObject);
    procedure cmboReportFilterPropertiesCloseUp(Sender: TObject);
    procedure btnBeefManDropClick(Sender: TObject);
    procedure bbPrintAllMedicinesClick(Sender: TObject);
    procedure bbPrintInUseMedicinesOnlyClick(Sender: TObject);
    procedure bbPrintNotInUseMedicinesOnlyClick(Sender: TObject);
    procedure bbLatestWeighingClick(Sender: TObject);
    procedure bbMultipleWeighingsClick(Sender: TObject);
    procedure bbWeightGainClick(Sender: TObject);
    procedure actSireAnalysisExecute(Sender: TObject);

  private
    { Private declarations }
    FCountry : TCountry;
    FPoint : TPoint;
    FHerdType : String;
    HerdReportsMenu : TReportMenu;
    InventoryReportMenu : TReportMenu;
    VQAssuranceReportMenu : TReportMenu;
    ProfitMonitorReportMenu : TReportMenu;
    CowRecordingReportMenu : TReportMenu;
    CattleMarginsReportMenu : TReportMenu;
    BreedingFertilityReportMenu : TReportMenu;
    MilkAnalysisReportMenu : TReportMenu;
    PedigreeReportMenu : TReportMenu;
    LastReportMenu : TReportMenu;
    FNavBarPopupMenu : TdxBarPopupMenu;
    FPopUpMenu : TPopUpMenu;
    FCowRecActionList : TActionList;

    procedure SetupForm;
    procedure ReportsCheckMods;
    procedure ClearReportSelection;
    procedure ShowReportsPopupMenu;
    procedure SetupReportFilters;
    procedure ShowReportFilter;
  public
    { Public declarations }
    class procedure ShowReports(AHerdID : Integer);
  end;

var
  fmReports: TfmReports;

const
  dxMyNavBarOffice11NavigatorPaneView = 14;

implementation
uses
  dxNavBarConsts, CowRepFilt, StockInHerdFilt, uHerdRec, DairyData,
  uTagReplacementForm, uLivestockSum, uFertIndicesRpt,
  uFertilityBenchmarking, uReproductiveSummaryInterface, SaleEligibility,
  uRestrictAnimals, uTBTestDtRep, LiveStkClass,
  uNutrientProductionProjectionRptScr,
  uNINutrientProductionProjectionRptScr, HealthFilterU, SCCAnalysis, Def,
  AnimalWaste, uMedicineSetUp, uFertilityTreatmentsReport,
  ActionReminderFilt, uDueToBeCulled, uCAFREFertListData, uActiv,
  uDairyHerdHealthCert, BullReportsFilt, uWeighingFilt, MenuUnit,
  BreedingAnalysisFilt, uMilkDiskReview, uMilkRecSysScr, uDailyYieldGraph,
  uRationPerformMonitor, uHeatServiceFilt, uSalesReport, uStockValuations,
  uPurchGrpRep, uQuotaMan, uHerdBrochureFlt, uSalesCatalogueFlt,
  uFertTreatmentsReview, FertAnalysisRpt, uAccsReps, uPedUpgradeReport,
  uHFSCalfReg, BrowseRegisterU, uUKSireRegister, uBeefProfitMonitor,
  uBeefAISireRegister, uConformationGradeAnalysis, uBeefSalesCatalogue,
  uFertilityCheckReport;

{$R *.DFM}

procedure TfmReports.FormCreate(Sender: TObject);
begin
   dxNavBarViewsFactory().RegisterView(dxMyNavBarOffice11NavigatorPaneView, 'kwOffice11NavigatorPaneView', TdxMyNavBarOffice11NavPanePainter);

   //cbDefaultHerd.LookupSource := WinData.dsHerdDefaults;
   //cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   FHerdType := HerdLookup.GetHerdTypeAsString(FHerdID);
   FCountry  := WinData.DefCountry(FHerdID);

//   FActiveNavBar := nil;
   FNavBarPopupMenu := TdxBarPopupMenu.Create(nil);
   FNavBarPopupMenu.BackgroundBitmap := pmSalesPlanner.BackgroundBitmap;

   dxBarControlContainerItem2.Control := lbInfo;

   HerdReportsMenu := TReportMenu.Create(nil);
   HerdReportsMenu.NavBarPopupMenu := FNavBarPopupMenu;
   HerdReportsMenu.ActionList := ReportsActionList;
   HerdReportsMenu.NavBar := nbHerdReports;

   PedigreeReportMenu := TReportMenu.Create(nil);
   PedigreeReportMenu.ActionList := ReportsActionList;

   InventoryReportMenu := TReportMenu.Create(nil);
   InventoryReportMenu.ActionList := ReportsActionList;

   VQAssuranceReportMenu := TReportMenu.Create(nil);
   VQAssuranceReportMenu.NavBarPopupMenu := FNavBarPopupMenu;
   VQAssuranceReportMenu.ActionList := ReportsActionList;
   VQAssuranceReportMenu.NavBar := nbVeterinaryMisc;

   ProfitMonitorReportMenu := TReportMenu.Create(nil);
   ProfitMonitorReportMenu.ActionList := ReportsActionList;

   CowRecordingReportMenu := TReportMenu.Create(nil);
   CowRecordingReportMenu.NavBarPopupMenu := FNavBarPopupMenu;
   CowRecordingReportMenu.ActionList := ReportsActionList;
   CowRecordingReportMenu.NavBar := nbCowRecord;

   CattleMarginsReportMenu := TReportMenu.Create(nil);
   CattleMarginsReportMenu.NavBarPopupMenu := FNavBarPopupMenu;
   CattleMarginsReportMenu.ActionList := ReportsActionList;
   CattleMarginsReportMenu.NavBar := nbCattleMargins;

   BreedingFertilityReportMenu := TReportMenu.Create(nil);
   BreedingFertilityReportMenu.NavBarPopupMenu := FNavBarPopupMenu;
   BreedingFertilityReportMenu.ActionList := ReportsActionList;
   BreedingFertilityReportMenu.NavBar := nbBreedFert;

   MilkAnalysisReportMenu := TReportMenu.Create(nil);
   MilkAnalysisReportMenu.NavBarPopupMenu := FNavBarPopupMenu;
   MilkAnalysisReportMenu.ActionList := ReportsActionList;
   MilkAnalysisReportMenu.NavBar := nbMilkAnalysis;

   SetupForm;
   ReportsCheckMods;

   dxBarControlContainerItem1.Control := pToolbarHerdID;

   lcmboHerdID.RepositoryItem := HerdLookup.erHerdIDLookup;
   lcmboHerdID.EditValue := WinData.UserDefaultHerdID;

   // Herd Reports
   nbHerdReports.View := dxMyNavBarOffice11NavigatorPaneView;
   // Inventory Reports
   nbInventoryReports.View := dxMyNavBarOffice11NavigatorPaneView;
   // Veterinary Reports
   nbVeterinaryMisc.View := dxMyNavBarOffice11NavigatorPaneView;
   // Cow Record
   nbCowRecord.View := dxMyNavBarOffice11NavigatorPaneView;
   // Milk Analysis
   nbMilkAnalysis.View := dxMyNavBarOffice11NavigatorPaneView;
   // Cattle Margins
   nbCattleMargins.View := dxMyNavBarOffice11NavigatorPaneView;
   // Breeding Fertility
   nbBreedFert.View := dxMyNavBarOffice11NavigatorPaneView;
   // Pedigree Reports
   nbPedigreeReports.View := dxMyNavBarOffice11NavigatorPaneView;
   // Profit Monitor Reports
   nbProfitMonitorRprts.View := dxMyNavBarOffice11NavigatorPaneView;

   HerdReportsMenu.ActionList  := ReportsActionList;
   HerdReportsMenu.AddItem(actBovineHerdRegister);
   HerdReportsMenu.AddItem(actStockOnHand);
   HerdReportsMenu.AddItem(actCMMSReconcilitation);
   HerdReportsMenu.AddItem(actPurchaseSalesAnalysis);
   HerdReportsMenu.AddItem(actTagReplacementForm);
   HerdReportsMenu.AddItem(actConformationGradeAnalysis);
   if ( not(CattleMarginsReportMenu.Enabled) ) then
      HerdReportsMenu.AddItem(actHerdRptGen);
   HerdReportsMenu.Parent := nbgHerdReportsControl;
   HerdReportsMenu.DrawMenu;

   InventoryReportMenu.ActionList := ReportsActionList;
   InventoryReportMenu.AddItem(actLivestockInventory);
   InventoryReportMenu.AddItem(actREPSReport);
   InventoryReportMenu.AddItem(actProfitMonitorSummary);
   InventoryReportMenu.AddItem(actNutrientProduction);
//   InventoryReportMenu.AddItem(actHistoricalNutrientProduction);
   InventoryReportMenu.Parent := nbgInventoryReportsControl;
   InventoryReportMenu.DrawMenu;

   VQAssuranceReportMenu.ActionList := ReportsActionList;
   VQAssuranceReportMenu.AddItem(actVeterinaryRegister);
   VQAssuranceReportMenu.AddItem(actVeterinaryFeedPurchases);
   VQAssuranceReportMenu.AddItem(actSCCCurrentLactationAnalysis);
   VQAssuranceReportMenu.AddItem(actSalesPlanner);
   VQAssuranceReportMenu.AddItem(actRestrictedAnimalsReport);
   VQAssuranceReportMenu.AddItem(actDiseaseTestStatus);
   VQAssuranceReportMenu.AddItem(actVeterinaryDueToList);
   VQAssuranceReportMenu.AddItem(actMedicineStockReport);
   VQAssuranceReportMenu.AddItem(actVeterinaryRptGen);
   VQAssuranceReportMenu.Parent := nbgVeterinaryMiscControl;
   VQAssuranceReportMenu.DrawMenu;

   ProfitMonitorReportMenu.ActionList := ReportsActionList;
   ProfitMonitorReportMenu.AddItem(actProfitMonitorRprts);
   ProfitMonitorReportMenu.Parent := nbgProfitMonitorReportsControl;
   ProfitMonitorReportMenu.DrawMenu;

   FCowRecActionList := TActionList.Create(Self);

   if ( FHerdType = cSucklerHerd ) then
      begin
         CowRecordingReportMenu.ActionList := FCowRecActionList;
         if ( (CowRecordingReportMenu.Enabled) and (not(CattleMarginsReportMenu.Enabled)) ) or
            ( (not(CowRecordingReportMenu.Enabled)) and (not(CattleMarginsReportMenu.Enabled)) ) then
            begin
               CowRecordingReportMenu.AddItem(actWeighingsCowRec);
               actWeighingsCowRec.ActionList := FCowRecActionList;
            end;

         CowRecordingReportMenu.AddItem(actSireAnalysis);
         actSireAnalysis.ActionList := FCowRecActionList;
         CowRecordingReportMenu.AddItem(actBullReport);
         actBullReport.ActionList := FCowRecActionList;
         CowRecordingReportMenu.AddItem(actBreedingChart);
         actBreedingChart.ActionList := FCowRecActionList;
         CowRecordingReportMenu.AddItem(actBreedingDueTo);
         actBreedingDueTo.ActionList := FCowRecActionList;
         CowRecordingReportMenu.AddItem(actActionWarnRem);
         actActionWarnRem.ActionList := FCowRecActionList;
         CowRecordingReportMenu.AddItem(actRecentActList);
         actRecentActList.ActionList := FCowRecActionList;
         CowRecordingReportMenu.AddItem(actCalfPerfGen);
         actCalfPerfGen.ActionList := FCowRecActionList;
      end
   else
      begin
         CowRecordingReportMenu.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actBreedingChart);
         actBreedingChart.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actBreedingDueTo);
         actBreedingDueTo.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actActionWarnRem);
         actActionWarnRem.ActionList := ReportsActionList;

         //   25/10/17 [V5.7 R4.1] /MK Change - Moved weighing report above Bull Report so users can see it without scrolling - TOK/GL request.
         if ( (CowRecordingReportMenu.Enabled) and (not(CattleMarginsReportMenu.Enabled)) ) or
            ( (not(CowRecordingReportMenu.Enabled)) and (not(CattleMarginsReportMenu.Enabled)) ) then
            begin
               CowRecordingReportMenu.AddItem(actWeighingsCowRec);
               actWeighingsCowRec.ActionList := ReportsActionList;
            end;

         CowRecordingReportMenu.AddItem(actSireAnalysis);
         actSireAnalysis.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actBullReport);
         actBullReport.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actDairyHerdHealthCert);
         actDairyHerdHealthCert.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actRecentActList);
         actRecentActList.ActionList := ReportsActionList;
         CowRecordingReportMenu.AddItem(actCalfPerfGen);
         actCalfPerfGen.ActionList := ReportsActionList;
      end;
   CowRecordingReportMenu.Parent := nbgCowRecordingControl;
   CowRecordingReportMenu.DrawMenu;

   CattleMarginsReportMenu.ActionList := ReportsActionList;
   CattleMarginsReportMenu.AddItem(actCattleMargins);

   if ( CattleMarginsReportMenu.Enabled ) then
      CattleMarginsReportMenu.AddItem(actWeighings);

   CattleMarginsReportMenu.AddItem(actLivestockValuation);
   CattleMarginsReportMenu.AddItem(actBeefPurchaseGrps);
   //  28/09/12 [V5.0 R8.9] /MK Change - Added Herd Report Generator to Cattle Margins menu.
   if ( CattleMarginsReportMenu.Enabled ) then
      CattleMarginsReportMenu.AddItem(actHerdRptGenBeefMan);
   CattleMarginsReportMenu.Parent := nbgCattleMarginsControl;
   CattleMarginsReportMenu.DrawMenu;

   BreedingFertilityReportMenu.ActionList := ReportsActionList;
   BreedingFertilityReportMenu.AddItem(actSeasCalvHerds);
   BreedingFertilityReportMenu.AddItem(actSpreadCalvHerds);
   BreedingFertilityReportMenu.AddItem(actIndvCowFert);
   BreedingFertilityReportMenu.AddItem(actFertilityCheck);
   BreedingFertilityReportMenu.AddItem(actFertilityTreatmentChart);
   //BreedingFertilityReportMenu.AddItem(actBrowseSireReg);
   BreedingFertilityReportMenu.AddItem(actSireSelect);
   //BreedingFertilityReportMenu.AddItem(actMilkQuotaPlan);
   if ( FCountry = NIreland ) then
      BreedingFertilityReportMenu.AddItem(actDARDDairyFertBench);
   BreedingFertilityReportMenu.AddItem(actFertRepGenerator);
   BreedingFertilityReportMenu.Parent := nbgBreedFertqBreedFertControl;
   BreedingFertilityReportMenu.DrawMenu;

   MilkAnalysisReportMenu.ActionList := ReportsActionList;
   MilkAnalysisReportMenu.AddItem(actBestCowInHerd);
   MilkAnalysisReportMenu.AddItem(actMnthRcrdReview);
   MilkAnalysisReportMenu.AddItem(actMnthSumAnalysis);
   MilkAnalysisReportMenu.AddItem(actMilkProdGraphs);
   MilkAnalysisReportMenu.AddItem(actMilkFeedPerformance);
   MilkAnalysisReportMenu.AddItem(actMlkPerfGen);
   MilkAnalysisReportMenu.Parent := nbgMilkAnalysisControl;
   MilkAnalysisReportMenu.DrawMenu;

   PedigreeReportMenu.ActionList := ReportsActionList;
   if FCountry = NIreland then
      begin
         PedigreeReportMenu.AddItem(actHUKIRegistrations);
      end
   else
      begin
         PedigreeReportMenu.AddItem(actIHFAUpgradeReport);
      end;
   PedigreeReportMenu.AddItem(actHerdBrochure);
   PedigreeReportMenu.AddItem(actSalesCatalogue);
   PedigreeReportMenu.AddItem(actPedigreeRptGen);
   PedigreeReportMenu.Parent := nbgPedigreeReportsControl;
   PedigreeReportMenu.DrawMenu;

   FPopUpMenu := TPopUpMenu.Create(nil);
   FPopUpMenu.Items.Clear;

   if ( not(WinData.Reports.Active ) ) then
      WinData.Reports.Active := True;

   //   09/07/18 [V5.8 R0.8] /MK Change - If Herd Type is Beef then don't show "with Sires" after Weight Gain Analysis.
   bbWeightGain.Caption := 'Weight Gain Analysis';
   if ( FHerdType <> cBeefHerd ) then
      bbWeightGain.Caption := bbWeightGain.Caption + ' (with Sires)';

   SetupReportFilters;

end;

procedure TfmReports.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmReports.actBovineHerdRegisterExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cBovineHerdRegRep);
   WinData.CreateAndShowForm(TCowRepfilter);
end;

procedure TfmReports.actStockOnHandExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cStockOnHandRep);
   StockInHerdFilt.ShowForm( StockOnHand );
end;

procedure TfmReports.actCMMSReconcilitationExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cCMMSRecRep);
   CheckSelectedHerd;
   //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   uHerdRec.CreateAndShow(FHerdID, False, False);
end;

procedure TfmReports.actPurchaseSalesAnalysisExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cPurchSalesAnalysisRep);
   StockInHerdFilt.ShowForm( PurchSales );
end;

procedure TfmReports.actTagReplacementFormExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cTagReplaceRep);
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   TfmTagReplacementForm.Execute(False);
end;

procedure TfmReports.actProfitMonitorSummaryExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cProfitMonSumRep);
   CheckSelectedHerd;
   if FHerdType = cDairyHerd then
      LiveStkClass.RunReport(FHerdID)
   else
      TfmBeefProfitMonitor.Execute(FHerdID);
end;

procedure TfmReports.actREPSReportExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(cRepsRep);
   uLivestockSum.ShowTheForm(rtREPS, nil, actREPSReport.Caption );
end;

procedure TfmReports.act30Mth30DayExecute(Sender: TObject);
begin
   //WinData.UpdateRecentReportUsage(c30Month30DayRep);
   SaleEligibility.CreateAndShow(rt30mth30Day);
end;

procedure TfmReports.act30Mth10DayExecute(Sender: TObject);
begin
   //WinData.AddReport(c30Month10DayRep,False,False);
   SaleEligibility.CreateAndShow(rt30mth10Day);
end;

procedure TfmReports.actNonFQASReportExecute(Sender: TObject);
begin
   //WinData.AddReport(cNonFQASRep,False,False);
   SaleEligibility.CreateAndShow(rtNonFQAS);
end;

procedure TfmReports.actFQASReportExecute(Sender: TObject);
begin
   //WinData.AddReport(cFQASRep,False,False);
   SaleEligibility.CreateAndShow(rtFQAS);
end;

procedure TfmReports.actDiseaseTestStatusExecute(Sender: TObject);
begin
   //WinData.AddReport(cDiseaseTestRep,False,False);
   uTBTestDtRep.ShowTheForm;
end;

procedure TfmReports.actRestrictedAnimalsReportExecute(Sender: TObject);
begin
   //WinData.AddReport(cRestrictAnimalRep,False,False);
   WinData.CreateAndShowForm(TfRestrictAnimals);
end;

procedure TfmReports.actSalesPlannerExecute(Sender: TObject);
begin
   if ( FCountry = NIreland ) then
      begin
         GetCursorPos(FPoint);
         pmSalesPlanner.Popup(FPoint.x, FPoint.y);
      end
   else
      begin
         //WinData.AddReport(cSalesPlannerRep,False,False);
         SaleEligibility.CreateAndShow(rtSalesPlanner);
      end;
end;

procedure TfmReports.actNutrientProductionExecute(Sender: TObject);
begin
   //WinData.AddReport(cNutrientProdRep,True,False);
   if FCountry = Ireland then
      TfmNutrientProductionProjectionRptScr.ShowForm
   else
      TfmNINutrientProductionProjectionRptScr.ShowForm;
end;

procedure TfmReports.actLivestockInventoryExecute(Sender: TObject);
begin
   //WinData.AddReport(cLivestockInvRep,True,False);
   uLivestockSum.ShowTheForm(rtLSInventory, nil, actLivestockInventory.Caption );
end;

class procedure TfmReports.ShowReports(AHerdID: Integer);
begin
   with TfmReports.Create(nil) do
      try
         FHerdID := AHerdID;
         ShowModal;
      finally
         Free;
      end;
     //   $00FEEAD8
end;

procedure TfmReports.SetupForm;
begin
   actProfitMonitorSummary.Caption := 'Profit Monitor Summary';

   actCMMSReconcilitation.Visible := ( FCountry = Ireland );
   actFQASReport.Visible := ( FCountry = NIreland );
   actNonFQASReport.Visible := ( FCountry = NIreland );
   act30Mth30Day.Visible := ( FCountry = NIreland );
   act30Mth10Day.Visible := ( FCountry = NIreland );
   actDARDDairyFertBench.Visible := ( FCountry = NIreland );
   if ( not(actDARDDairyFertBench.Visible) ) then
      actDARDDairyFertBench.Tag := -1
   else
      actDARDDairyFertBench.Tag := 7;

   if ( FCountry = Ireland ) and ( FHerdType <> cDairyHerd ) then
      actProfitMonitorSummary.Caption := 'Profit Monitor/BTAP';

   if (AIMClient.ClientExists) then
      actCMMSReconcilitation.Caption := 'AIM Herd Reconcile'
   else
      actCMMSReconcilitation.Caption := 'CMMS Reconcile';

   actSCCCurrentLactationAnalysis.Visible := Def.Definition.dUseMilkRec;
   actVeterinaryDueToList.Visible := Def.Definition.dUseQuotaMan;

   actVeterinaryFeedPurchases.Caption := 'Veterinary/Feed Purchases';
   if WinData.ShowDealerControls then
      actVeterinaryFeedPurchases.Caption := 'Veterinary Purchases';
end;

procedure TfmReports.actVeterinaryRegisterExecute(Sender: TObject);
begin
   THeatlthFilter.ShowTheForm(rtMediTreat,ptVeterinary);
end;

procedure TfmReports.actVeterinaryFeedPurchasesExecute(Sender: TObject);
begin
   THeatlthFilter.ShowTheForm(rtMediFeedPurch,ptVeterinary);
end;

procedure TfmReports.actVeterinaryRptGenExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cVetRepGenRep);
   WinData.CallProg.ReportGenerator(rgmHealth)
end;

procedure TfmReports.actSCCCurrentLactationAnalysisExecute(
  Sender: TObject);
begin
   //WinData.AddReport(cSCCCurLactAnalysisRep,False,False);
   SCCAnalysis.ShowForm;
end;

procedure TfmReports.actMedicineStockReportExecute(Sender: TObject);
begin
   //WinData.AddReport(cMedStockRep,False,False);
   //uMedicineSetUp.ShowTheForm(0, True);
   GetCursorPos(FPoint);
   pmMedicineStockReport.Popup(FPoint.x, FPoint.y);
end;

procedure TfmReports.actVeterinaryDueToListExecute(Sender: TObject);
begin
   //WinData.AddReport(cVetDueToListRep,False,False);
   TfmFertilityTreatmentsReport.ShowReportScreen(retHealth);
end;

procedure TfmReports.actHistoricalNutrientProductionExecute(
  Sender: TObject);
begin
   AnimalWaste.CreateAndShow;
end;

procedure TfmReports.actBreedingDueToExecute(Sender: TObject);
begin
   GetCursorPos(FPoint);
   pmBreedingDueTo.Popup(FPoint.x, FPoint.y);
end;

procedure TfmReports.actDueCalvingExecute(Sender: TObject);
begin
   //WinData.AddReport(cDueToCalveRep,False,False);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueToCalve.Show;
      ActionReminderFilter.Caption := 'Due To Calve';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
   end;
end;

procedure TfmReports.actDueServiceExecute(Sender: TObject);
begin
   //WinData.AddReport(cDueToServeRep,False,False);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueFirstService.Show;
      ActionReminderFilter.Caption := 'Due Service';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
   end;
end;

procedure TfmReports.actBreedingChartExecute(Sender: TObject);
begin
   //WinData.AddReport(cBreedingChartRep,True,False);
   uHeatServiceFilt.ShowTheForm;
end;

procedure TfmReports.actDueDryingOffExecute(Sender: TObject);
begin
   //WinData.AddReport(cDueToDryRep,False,False);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueForDryingOff.Show;
      ActionReminderFilter.Caption := 'Due For Drying Off';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
   end;
end;

procedure TfmReports.actDuePregnancyExecute(Sender: TObject);
begin
   //WinData.AddReport(cDueToPDRep,False,False);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToPD.Show;
      ActionReminderFilter.Caption := 'Due Pregnancy Diagnosis';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
   end;
end;

procedure TfmReports.actDueToBeCulledExecute(Sender: TObject);
begin
   //WinData.AddReport(cDueToBeCullRep,False,False);
   uDueToBeCulled.ShowForm;
end;

procedure TfmReports.actActionWarnRemExecute(Sender: TObject);
begin
   //WinData.AddReport(cActWarnRemRep,False,False);
   WinData.CreateAndShowForm( TfmCAFREFertListData );
end;

procedure TfmReports.actRecentActListExecute(Sender: TObject);
begin
   //WinData.AddReport(cRecentActListRep,False,False);
   uActiv.ShowForm;
end;

procedure TfmReports.actDairyHerdHealthCertExecute(Sender: TObject);
begin
   //WinData.AddReport(cDairyHerdHealthCertRep,False,False);
   WinData.CreateAndShowForm(TDairyHerdHealthCert);
end;

procedure TfmReports.actWeighingsExecute(Sender: TObject);
begin
   GetCursorPos(FPoint);
   pmWeighingReport.Popup(FPoint.x, FPoint.y);
end;

procedure TfmReports.actHerdRptGenExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cHerdRepGenRep);
   WinData.CallProg.ReportGenerator(rgmHerd)
end;

procedure TfmReports.actBestCowInHerdExecute(Sender: TObject);
begin
   //WinData.AddReport(cBestCowsInHerdRep,True,False);
   BreedingAnalysisFilt.ShowForm;
end;

procedure TfmReports.actMnthRcrdReviewExecute(Sender: TObject);
begin
   //WinData.AddReport(cMonthRecReviewRep,False,False);
   uMilkDiskReview.CreateAndShow;
end;

procedure TfmReports.actBullReportExecute(Sender: TObject);
begin
   //WinData.AddReport(cBullRep,False,False);
   BullReportsFilt.ShowForm(2);
end;

procedure TfmReports.actMnthSumAnalysisExecute(Sender: TObject);
begin
   //WinData.AddReport(cMonthSumAnalysisRep,False,False);
   WinData.CreateAndShowForm(TfMilkRecSysScr);
end;

procedure TfmReports.actMilkProdGraphsExecute(Sender: TObject);
begin
   //WinData.AddReport(cMilkProdGraphRep,False,False);
   uDailyYieldGraph.ShowForm;
end;

procedure TfmReports.actMilkFeedPerformanceExecute(Sender: TObject);
begin
   //WinData.AddReport(cDairyBenchRep,False,False);
   with TRationPerformMonitor.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmReports.actCalfPerfGenExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cCalfPerfGenRep);
   WinData.CallProg.ReportGenerator(rgmCalfPerformance)
end;

procedure TfmReports.actCattleMarginsExecute(Sender: TObject);
begin
   //WinData.AddReport(cCattleMargRep,True,False);
   uSalesReport.ShowTheForm;
end;

procedure TfmReports.actLivestockValuationExecute(Sender: TObject);
begin
   //WinData.AddReport(cLivestockValRep,False,False);
   TfmStockValuationReport.ShowStockValuationReport;
end;

procedure TfmReports.bbSalesPlannerClick(Sender: TObject);
begin
   //WinData.AddReport(cSalesPlannerRep,False,False);
   SaleEligibility.CreateAndShow(rtSalesPlanner);
end;

procedure TfmReports.actCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmReports.actBeefPurchaseGrpsExecute(Sender: TObject);
begin
   //WinData.AddReport(cBeefPurchGrpRep,False,False);
   TfPurchGrpRep.ShowTheForm;
end;

procedure TfmReports.actMlkPerfGenExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cMilkPerfGenRep);
   WinData.CallProg.ReportGenerator(rgmMilkPerformance)
end;

procedure TfmReports.actBrowseSireRegExecute(Sender: TObject);
var
   id : Integer;
   CallSetupQuery : Boolean;
begin
   WinData.UpdateRecentReportUsage(cBrowseSireRegRep);

   if Menuform <> nil then
   try
      CallSetupQuery := False;
      id := WinData.AnimalFileByIDID.AsInteger;
      try
         Menuform.cxAnimalGridView.DataController.BeginFullUpdate;
         Menuform.cxAnimalGridView.DataController.LockDataChangedNotify;
         try
            if WinData.SystemRegisteredCountry = Ireland then
               begin
                  if HerdLookup.GetHerdTypeAsString(FHerdID) = cDairyHerd then
                     begin
                        CallSetupQuery := True; // assume sire has been added.
                        WinData.CreateAndShowForm(TBrowseSireRegister)
                     end
                  else
                     TfmBeefAISireRegister.execute(TfmBeefAISireRegister,CallSetupQuery);
               end
            else
               TfmUKSireRegister.execute(TfmUKSireRegister,CallSetupQuery);

            Screen.Cursor := crHourGlass;
            try
               if CallSetupQuery then
                  begin
                     WinData.AnimalFileByID.Close;
                     WinData.AnimalFileByID.Open;
                  end;
               Menuform.cxAnimalGridView.Datacontroller.BeginLocate;
               try
                  WinData.AnimalFileByID.Locate('ID', id, []);
                  Update;
               finally
                  Menuform.cxAnimalGridView.Datacontroller.EndLocate;
               end;
            finally
               Screen.Cursor := crDefault;
            end;
         except
         end;
      finally
         Menuform.cxAnimalGridView.DataController.UnLockDataChangedNotify;
         Menuform.cxAnimalGridView.DataController.EndFullUpdate;
      end;
   finally
   end;
end;

procedure TfmReports.actSireSelectExecute(Sender: TObject);
begin
   //WinData.AddReport(cSireSelectRep,False,False);
   BullReportsFilt.ShowForm(1);
end;

procedure TfmReports.actMilkQuotaPlanExecute(Sender: TObject);
begin
   //WinData.AddReport(cMilkQuotaPlanRep,False,False);
   uQuotaMan.ShowForm;
end;

procedure TfmReports.actFertRepGeneratorExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cFertRepGenRep);
   WinData.CallProg.ReportGenerator(rgmCowFertility)
end;

procedure TfmReports.actHUKIRegistrationsExecute(Sender: TObject);
begin
   //WinData.AddReport(cHUKIRegRep,False,False);
   if MenuForm <> nil then
      begin
         MenuForm.cxAnimalGridView.DataController.BeginFullUpdate;
         try
            uHFSCalfReg.ShowForm;
         finally
            MenuForm.cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end;
end;

procedure TfmReports.actHerdBrochureExecute(Sender: TObject);
begin
   //WinData.AddReport(cHerdBrochRep,False,False);
   uHerdBrochureFlt.ShowForm;
end;

procedure TfmReports.actSalesCatalogueExecute(Sender: TObject);
var
   HerdType : THerdType;
begin
   //WinData.AddReport(cSalesCatRep,False,False);
   CheckSelectedHerd;
   HerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
   if HerdType = htDairy then
      uSalesCatalogueFlt.ShowForm
   else
      TfmBeefSalesCatalogue.execute(TfmBeefSalesCatalogue);
end;

procedure TfmReports.actPedigreeRptGenExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cPedRepGenRep);
   WinData.CallProg.ReportGenerator(rgmPedigree)
end;

procedure TfmReports.CheckSelectedHerd;
begin
//   if cbDefaultHerd.Text = 'All Herds' then
   if not(lcmboHerdID.EditValue > 0) then
      begin
         MessageDlg(cAllHerdsSelected, mtInformation,[mbok],0);
         lcmboHerdID.DroppedDown := True;
         Abort;
      end
end;

procedure TfmReports.actFertilityTreatmentChartExecute(Sender: TObject);
begin
   //WinData.AddReport(cFertTreatChartRep,False,False);
   TfmFertTreatmentsReview.Execute;
end;

procedure TfmReports.actHerdFertilityExecute(Sender: TObject);
begin
   GetCursorPos(FPoint);
   pmHerdFertility.Popup(FPoint.x, FPoint.y);
end;

procedure TfmReports.actSeasCalvHerdsExecute(Sender: TObject);
begin
   //WinData.AddReport(cSeasonCalvHerdRep,True,False);
   TfFertIndicesRpt.ShowTheForm;
end;

procedure TfmReports.actSpreadCalvHerdsExecute(Sender: TObject);
begin
   //WinData.AddReport(cSpreadCalvHerdRep,True,False);
   PreviewReproductiveSummary;
end;

procedure TfmReports.actDARDDairyFertBenchExecute(Sender: TObject);
begin
   //WinData.AddReport(cDARDDairyFertBenchRep,False,False);
   CheckSelectedHerd;
   TfmFertilityBenchmarking.Show;
end;

procedure TfmReports.actIndvCowFertExecute(Sender: TObject);
begin
   //WinData.AddReport(cIndCowFertRep,False,False);
   FertAnalysisRpt.ShowTheForm;
end;

procedure TfmReports.actFertTreatChartExecute(Sender: TObject);
begin
   //WinData.AddReport(cFertTreatChartRep,False,False);
   TfmFertTreatmentsReview.Execute;
end;

procedure TfmReports.actProfitMonitorRprtsExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cProfMonRepsRep);
   WinData.CreateAndShowForm(TfmAccsReps)
end;

procedure TfmReports.ReportsCheckMods;
begin
   // First Hide All Non Required Items - MK - 19/12/08

   nbCowRecord.Enabled := Def.Definition.dUseManCal;
   CowRecordingReportMenu.Enabled := nbCowRecord.Enabled;

   nbBreedFert.Enabled := Def.Definition.dUseQuotaMan;
   BreedingFertilityReportMenu.Enabled := nbBreedFert.Enabled;

   nbMilkAnalysis.Enabled := Def.Definition.dUseMilkRec;
   MilkAnalysisReportMenu.Enabled := nbMilkAnalysis.Enabled;

   nbCattleMargins.Enabled := Def.Definition.dUseBeefMan;
   CattleMarginsReportMenu.Enabled := nbCattleMargins.Enabled;

   nbPedigreeReports.Enabled := Def.Definition.dUsePedigree;
   PedigreeReportMenu.Enabled := nbPedigreeReports.Enabled;

   // Firstly Breeding/Fertility
   actBrowseSireReg.Enabled := False;
   actSireSelect.Enabled := False;
   actMilkQuotaPlan.Enabled := False;
   actSeasCalvHerds.Enabled := False;
   actSpreadCalvHerds.Enabled := False;
   actDARDDairyFertBench.Enabled := False;
   actIndvCowFert.Enabled := False;
   actFertRepGenerator.Enabled := False;
   actFertilityTreatmentChart.Enabled := False;
   actFertilityCheck.Enabled := False;

   // Then Cow Recording
   actBreedingChart.Enabled := False;
   actBreedingDueTo.Enabled := False;
   actActionWarnRem.Enabled := False;
   actRecentActList.Enabled := False;
   actDairyHerdHealthCert.Enabled := False;
   actWeighingsCowRec.Enabled := False;
   actSireAnalysis.Enabled := False;
   actBullReport.Enabled := False;
   actCalfPerfGen.Enabled := False;

   // Lastly Cattle Margins
   actCattleMargins.Enabled := False;
   actWeighings.Enabled := False;
   actLivestockValuation.Enabled := False;
   actBeefPurchaseGrps.Enabled := False;

   // Check if (2) Suckler Cow Events
   if (nbCowRecord.Enabled) then
      begin
         // Set Enabled.
         nbCowRecord.StyleNavigationPaneHeader :=  HeaderStyle;
         actBreedingChart.Enabled := True;
         actBreedingDueTo.Enabled := True;
         actActionWarnRem.Enabled := True;
         actRecentActList.Enabled := True;
         actDairyHerdHealthCert.Enabled := True;
         actWeighingsCowRec.Enabled := True;
         actSireAnalysis.Enabled := True;
         actBullReport.Enabled := True;
         actCalfPerfGen.Enabled := True;
      end
   else
      begin
         // Set Disabled.
         nbCowRecord.StyleNavigationPaneHeader :=  HeaderStyleDisabled;
         actBreedingChart.Enabled := False;
         actBreedingDueTo.Enabled := False;
         actActionWarnRem.Enabled := False;
         actRecentActList.Enabled := False;
         actDairyHerdHealthCert.Enabled := False;
         actWeighingsCowRec.Enabled := False;
         actSireAnalysis.Enabled := False;
         actBullReport.Enabled := False;
         actCalfPerfGen.Enabled := False;
      end;

   // Check if (3) Quota Man
   if (nbBreedFert.Enabled) then
      begin
         // Set Enabled.
        nbBreedFert.StyleNavigationPaneHeader :=  HeaderStyle;
        actBrowseSireReg.Enabled := True;
        actSireSelect.Enabled := True;
        actSeasCalvHerds.Enabled := True;
        actSpreadCalvHerds.Enabled := True;
        actDARDDairyFertBench.Enabled := True;
        actIndvCowFert.Enabled := True;
        actFertRepGenerator.Enabled := True;
        actFertilityTreatmentChart.Enabled := True;
        actFertilityCheck.Enabled := True;
      end
   else
      begin
         // Set Disabled.
        nbBreedFert.StyleNavigationPaneHeader :=  HeaderStyleDisabled;
        actBrowseSireReg.Enabled := False;
        actSireSelect.Enabled := False;
        actSeasCalvHerds.Enabled := False;
        actSpreadCalvHerds.Enabled := False;
        actDARDDairyFertBench.Enabled := False;
        actIndvCowFert.Enabled := False;
        actFertRepGenerator.Enabled := False;
        actFertilityTreatmentChart.Enabled := False;
        actFertilityCheck.Enabled := False;
      end;

   // Check if (4) Milk Recording
   if nbMilkAnalysis.Enabled = True then
      begin
         // Set Enabled.
         nbMilkAnalysis.StyleNavigationPaneHeader :=  HeaderStyle;
         actBestCowInHerd.Enabled := True;
         actMnthRcrdReview.Enabled := True;
         actMnthSumAnalysis.Enabled := True;
         actMilkProdGraphs.Enabled := True;
         actMilkFeedPerformance.Enabled := True;
         actMlkPerfGen.Enabled := True;
      end
   else
      begin
         // Set Disabled.
         nbMilkAnalysis.StyleNavigationPaneHeader :=  HeaderStyleDisabled;
         actBestCowInHerd.Enabled := False;
         actMnthRcrdReview.Enabled := False;
         actMnthSumAnalysis.Enabled := False;
         actMilkProdGraphs.Enabled := False;
         actMilkFeedPerformance.Enabled := False;
         actMlkPerfGen.Enabled := False;
      end;

   // Check if (5) Pedigree
   if nbPedigreeReports.Enabled = True then
      begin
         // Set Enabled.
         nbPedigreeReports.StyleNavigationPaneHeader :=  HeaderStyle;
         actHUKIRegistrations.Enabled := True;
         actIHFAUpgradeReport.Enabled := True;
         actHerdBrochure.Enabled := True;
         actSalesCatalogue.Enabled := True;
         actPedigreeRptGen.Enabled := True;
      end
   else
      begin
         // Set Disabled.
         nbPedigreeReports.StyleNavigationPaneHeader :=  HeaderStyleDisabled;
         actHUKIRegistrations.Enabled := False;
         actIHFAUpgradeReport.Enabled := False;
         actHerdBrochure.Enabled := False;
         actSalesCatalogue.Enabled := False;
         actPedigreeRptGen.Enabled := False;
      end;

   // Check if (6) Beef Management
   if (nbCattleMargins.Enabled) then
      begin
         // Set Enabled.
         nbCattleMargins.StyleNavigationPaneHeader :=  HeaderStyle;
         actCattleMargins.Enabled := True;
         actWeighings.Enabled := True;
         actLivestockValuation.Enabled := True;
         actBeefPurchaseGrps.Enabled := True;
         actHerdRptGenBeefMan.Enabled := True;
      end
   else
      begin
         // Set Disabled.
         nbCattleMargins.StyleNavigationPaneHeader :=  HeaderStyleDisabled;
         actCattleMargins.Enabled := False;
         actWeighings.Enabled := False;
         actLivestockValuation.Enabled := False;
         actBeefPurchaseGrps.Enabled := False;
         actHerdRptGenBeefMan.Enabled := False;
      end;

   if (Def.Definition.dUseManCal) and (Def.Definition.dUseBeefMan) then
      begin
         nbiWeighingsCowRec.Visible := False;
      end;

   { 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Removed the option for Historical Livestock Nutrient Report ( for all countries "GL") }
   nbiHistoricalNutrientProduction.Visible := False;
   if FCountry = NIreland then
      begin
         nbHerdReportsnbiCMMSReconciliation.Visible := False;
         //nbiHistoricalNutrientProduction.Visible := False;

         nbiIHFAHUKIRegistrations.Action := actHUKIRegistrations;
      end
   else
      begin
         nbHerdReportsnbiCMMSReconciliation.Visible := True;
         //nbiHistoricalNutrientProduction.Visible := True;

         nbiIHFAHUKIRegistrations.Action := actIHFAUpgradeReport;
      end;

   actWeighingsCowRec.Tag := 5;
   if ( (CowRecordingReportMenu.Enabled) and (nbCattleMargins.Enabled) ) or
      ( (not(CowRecordingReportMenu.Enabled)) and (nbCattleMargins.Enabled) ) then
      actWeighingsCowRec.Tag := -1;

   actWeighings.Tag := 6;
   if ( (CowRecordingReportMenu.Enabled) and (not(nbCattleMargins.Enabled)) ) or
      ( (not(CowRecordingReportMenu.Enabled)) and (not(nbCattleMargins.Enabled)) )then
      actWeighings.Tag := -1;

   //   05/12/18 [V5.8 R5.7] /MK Change - Only show Herd Report Generator once.
   actHerdRptGen.Tag := 1;
   if ( nbCattleMargins.Enabled ) then
      actHerdRptGen.Tag := -1;
   actHerdRptGenBeefMan.Tag := 6;
   if ( not(nbCattleMargins.Enabled) ) then
      actHerdRptGenBeefMan.Tag := -1;
end;

procedure TfmReports.actWeighingsCowRecExecute(Sender: TObject);
begin
   GetCursorPos(FPoint);
   pmWeighingReport.Popup(FPoint.x, FPoint.y);
end;

procedure TfmReports.cbDefaultHerdChange(Sender: TObject);
begin
//
end;

procedure TfmReports.actIHFAUpgradeReportExecute(Sender: TObject);
begin
   //WinData.AddReport(cIHFAUpgRep,False,False);
   Application.CreateForm(TfmPedUpgradeReport, fmPedUpgradeReport);
   try
      fmPedUpgradeReport.ShowModal;
   finally
      if fmPedUpgradeReport <> nil then
         FreeAndNil(fmPedUpgradeReport);
   end;
end;

procedure TfmReports.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false;
end;

procedure TfmReports.lcmboHerdIDPropertiesChange(Sender: TObject);
begin
   if (lcmboHerdID.EditValue > 0) then
      begin
         FHerdID   := lcmboHerdID.EditValue;
         WinData.UserDefaultHerdID := FHerdID;
      end
   else
      begin
         FHerdID   := WinData.NONEHerdID;
         lcmboHerdID.Text := 'All Herds';
      end;
   FHerdType := HerdLookup.GetHerdTypeAsString(FHerdID);
   FCountry  := WinData.DefCountry(FHerdID);

   SetupForm;
   ReportsCheckMods;
end;

{ TReportMenu }

procedure TReportMenu.AddItem(AAction : TAction);
var
   ShowNavButtons : Boolean;
begin
   FReportMenuItems.AddObject(AAction.Caption, AAction);
   ShowNavButtons := (FReportMenuItems.Count > High(labels)+1);
   UpButton.Visible := ( ShowNavButtons ) and (UpButton.parent.Enabled);
   DownButton.Visible := ( ShowNavButtons ) and (UpButton.parent.Enabled);
end;

constructor TReportMenu.Create(AOwner: TComponent);
var
   i : Integer;
   LabelTopPosition : Integer;
begin
   inherited Create(AOwner);
   NavBarPopupMenu := nil;
   FTopIndex := 0;
   Color := clWhite;
   Align := alClient;
   BevelInner := bvNone;
   BevelOuter := bvNone;
   LabelTopPosition := 8;
   OnMouseMove := PanelMouseMove;
   OnEnter := PanelMouseEnter;
   FPaintMenuItems := True;
   for i := low(Labels) to High(Labels) do
      begin
         Labels[i] := TcxLabel.Create(AOwner);
         Labels[i].Parent := Self;
         Labels[i].AutoSize := False;
         Labels[i].Properties.Alignment.Horz := taCenter;
         Labels[i].Properties.Alignment.Vert := taVCenter;
         Labels[i].Style.Color := Color;
         //Labels[i].Style.TextColor := $00B0856A;
         Labels[i].Style.TextColor := $0074523D;
         Labels[i].Width := 202;
         Labels[i].Top := LabelTopPosition;
         Labels[i].Left := 4;
         Labels[i].Height := 25;
         Labels[i].Style.Font.Name := 'Segoe UI';
         Labels[i].Style.Font.Size := 10;
         Labels[i].Style.Font.Style := [fsBold];
         Inc(LabelTopPosition, 30);
         Labels[i].Style.BorderStyle := ebsNone;
         Labels[i].Style.LookAndFeel.NativeStyle := False;
         Labels[i].Style.LookAndFeel.Kind := lfUltraFlat;

         Labels[i].StyleHot.Color := $00FBC695;
         //Labels[i].StyleHot.TextColor := $006C4D39;
         Labels[i].StyleHot.TextColor := clBlack;
         Labels[i].StyleHot.BorderStyle := ebsNone;

         Labels[i].StyleFocused.Color := Color;
         //Labels[i].StyleFocused.TextColor := $00B0856A;
         Labels[i].StyleFocused.TextColor := $0074523D;
         Labels[i].StyleFocused.BorderStyle := ebsNone;
         Labels[i].OnMouseDown := LabelMouseDown;
         Labels[i].OnMouseMove := LabelMouseMove;
         Labels[i].OnMouseEnter := LabelMouseEnter;
         Labels[i].OnMouseLeave := LabelMouseLeave;

         Labels[i].OnMouseUp := LabelMouseUp;

         Labels[i].OnClick := LabelClick;
         Labels[i].Cursor := crHandPoint;
      end;

   UpButton := Tcxbutton.Create(AOwner);
   UpButton.Parent := Self;
   UpButton.LookAndFeel.NativeStyle := False;
   UpButton.LookAndFeel.Kind := lfUltraFlat;
   UpButton.Font.Name := 'Segoe UI';
   UpButton.Font.Size := 8;
   UpButton.Width := 20;
   UpButton.Left := 215;
   UpButton.Height := 20;
   UpButton.Top := Labels[0].Top + 2;
   UpButton.Colors.Normal := clWhite;
   UpButton.Colors.Hot := $00F2F2F2;
   UpButton.Colors.Pressed := $00DBDBDB;
   UpButton.Colors.Disabled := clGray;
   UpButton.OnClick := UpButtonClick;
   HerdLookup.ImageList16x16.GetBitmap(11, UpButton.Glyph);
   UpButton.Visible := False;


   DownButton := Tcxbutton.Create(AOwner);
   DownButton.Parent := Self;
   DownButton.LookAndFeel.NativeStyle := False;
   DownButton.LookAndFeel.Kind := lfUltraFlat;
   DownButton.Font.Name := 'Segoe UI';
   DownButton.Font.Size := 8;
   DownButton.Width := 20;
   DownButton.Left := 215;
   DownButton.Height := 20;
   DownButton.Top := Labels[3].Top + 2;
   DownButton.Colors.Normal := clWhite;
   DownButton.Colors.Hot := $00F2F2F2;
   DownButton.Colors.Pressed := $00DBDBDB;
   DownButton.Colors.Disabled := clGray;
   DownButton.OnClick := DownButtonClick;
   HerdLookup.ImageList16x16.GetBitmap(12, DownButton.Glyph);
   DownButton.Visible := False;

   FReportMenuItems := TStringList.Create;

   FTimer := TTimer.Create(nil);
   FTimer.Enabled := False;
   FTimer.OnTimer := OnTimer;
   FTimer.Interval := 750;
end;

destructor TReportMenu.destroy;
var
   i : Integer;
begin
  FreeAndNil(FReportMenuItems);
   for i := low(Labels) to High(Labels) do
      FreeAndNil(Labels[i]);
  FreeAndNil(UpButton);
  FreeAndNil(DownButton);
  inherited;
end;

procedure TReportMenu.DrawMenu;
var
   i, j, cc : Integer;
   LabelIndex, BottomIndex, LabelLeft, LabelWidth : Integer;
   Index : Integer;
   Action : TAction;
begin
   LabelIndex := 0;

   if ( FReportMenuItems.Count > 4 ) then
      begin
         LabelWidth := 206;
      end
   else
      begin
         LabelWidth := 230;

         if ( FReportMenuItems.Count < 4 ) then
            begin
               if ( FReportMenuItems.Count = 3 ) then
                  Labels[3].Visible := false
               else if ( FReportMenuItems.Count = 2 ) then
                  begin
                     Labels[3].Visible := false;
                     Labels[2].Visible := false;

                  end
               else if ( FReportMenuItems.Count = 1 ) then
                  begin
                     Labels[3].Visible := false;
                     Labels[2].Visible := false;
                     Labels[1].Visible := false;

                  end
               else
                  begin
                     Labels[3].Visible := false;
                     Labels[2].Visible := false;
                     Labels[1].Visible := false;
                     Labels[0].Visible := false;

                  end;
            end;
      end;

   BottomIndex := FReportMenuItems.Count-1;
   if ( BottomIndex > 3 ) then
      begin
         BottomIndex := FTopIndex+Length(Labels)-1;
      end;

   for i := FTopIndex to BottomIndex do
      begin
         Labels[LabelIndex].Caption := '';
         Labels[LabelIndex].Width := LabelWidth;
         if ( FTopIndex <= FReportMenuItems.Count-1 ) then
            begin
               Labels[LabelIndex].Caption := FReportMenuItems.Strings[i];
               Index := FReportMenuItems.IndexOf(Labels[LabelIndex].Caption);
               if ( Index > -1 ) then
                  begin
                     Action := TAction(FReportMenuItems.Objects[Index]);
                     if ( Action <> nil )then
                        begin
                           Labels[LabelIndex].Visible := True;
                           Labels[LabelIndex].Enabled := Action.Enabled;
                        end
                     else
                        Labels[LabelIndex].Visible := False;
                  end;
               Inc(LabelIndex);
            end
      end;
   FViewStatus := Format('%d - %d of %d', [FTopIndex+1, FTopIndex + 4, FReportMenuItems.Count]);
   if (Navbar <> nil) and ( Navbar.ViewInfo.GroupCount>0) then
       Navbar.ViewInfo.Groups[0].Group.Caption := Navbar.ViewInfo.Groups[0].Group.Hint + ' ' + FViewStatus;
end;

procedure TReportMenu.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  r : TRect;
begin
   if ( not FPaintMenuItems ) or (( Sender as TcxLabel).Caption='') then  Exit;
   if ( button = mbLeft ) and ( ssLeft in Shift ) then
      begin
         ( Sender as TcxLabel).Style.Color := $00FBC695;
         ( Sender as TcxLabel).Style.TextColor := $003C2B20;
         ( Sender as TcxLabel).Style.BorderStyle := ebsSingle;
         ( Sender as TcxLabel).invalidate;
         ( Sender as TcxLabel).Repaint;
         ( Sender as TcxLabel).Update;
      end;
end;

procedure TReportMenu.LabelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   if ( not FPaintMenuItems ) or (( Sender as TcxLabel).Caption='') then  Exit;

   ( Sender as TcxLabel).Style.TextColor := $006C4D39;
   ( Sender as TcxLabel).Style.Color := $00FEEAD8;
   ( Sender as TcxLabel).Style.BorderStyle := ebsSingle;
         ( Sender as TcxLabel).invalidate;
         ( Sender as TcxLabel).Repaint;
   ( Sender as TcxLabel).Update;

end;

procedure TReportMenu.LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if ( not FPaintMenuItems ) or (( Sender as TcxLabel).Caption='') then  Exit;
         ( Sender as TcxLabel).Style.Color := clWindow;
         ( Sender as TcxLabel).Style.TextColor := $006C4D39;
         ( Sender as TcxLabel).Style.BorderStyle := ebsNone;
         ( Sender as TcxLabel).invalidate;
         ( Sender as TcxLabel).Repaint;
         ( Sender as TcxLabel).Update;
end;

procedure TReportMenu.PanelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   UpdateMenuItems;
end;

procedure TReportMenu.SetTopIndex(const Value: Integer);
begin
   FTopIndex := Value;
   DrawMenu;
end;

procedure TReportMenu.UpButtonClick(Sender: TObject);
begin
   if ( FTopIndex > 0 ) then
      begin
         Dec(FTopIndex);
         DrawMenu;
      end
end;

procedure TReportMenu.DownButtonClick(Sender: TObject);
begin
   if ( (FReportMenuItems.Count-1) - (FTopIndex+3)) > 0 then
      begin
         Inc(FTopIndex);
         DrawMenu;
      end;
end;

procedure TReportMenu.UpdateMenuItems;
var
   i, cc : Integer;
begin
   if not FPaintMenuItems then  Exit;

{   if (NavBarPopupMenu <> nil )and
      (NavBarPopupMenu.SubMenuControl <> nil ) then
   NavBarPopupMenu.SubMenuControl.Hide;
 }
   cc := ControlCount-1;
   for i := 0 to cc do
      begin
         if ( Controls[i] is TcxLabel) then
            begin
               //( Controls[i] as TcxLabel).Style.TextColor := $00B0856A;
               ( Controls[i] as TcxLabel).Style.TextColor := $0074523D;
               ( Controls[i] as TcxLabel).Style.Color := clWhite;
               ( Controls[i] as TcxLabel).Style.BorderStyle := ebsNone;
               ( Controls[i] as TcxLabel).invalidate;
               ( Controls[i] as TcxLabel).Repaint;
               ( Controls[i] as TcxLabel).Update;
            end;
      end;
end;

function TReportMenu.GetLabel(Index: Integer): TcxLabel;
begin
   Result := Labels[Index];
end;

procedure TReportMenu.LabelClick(Sender: TObject);
var
   Index : Integer;
   Action : TAction;
begin
   try
   FPaintMenuItems := False;
   if (Sender is TcxLabel) then
      begin
         Index := FReportMenuItems.IndexOf((Sender as TcxLabel).Caption);
         if ( Index > -1 ) then
            begin
               Action := TAction(FReportMenuItems.Objects[Index]);
               if Action <> nil then
                  begin
                     UpdateMenuItems;
                     Action.Execute;
                  end;
            end;
      end;
   finally
      FPaintMenuItems := True;
   end;

end;

procedure TfmReports.pNewReportsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbHerdReportsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbInventoryReportsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbVeterinaryMiscMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbProfitMonitorRprtsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbCowRecordMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbCattleMarginsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbBreedFertMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbMilkAnalysisMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.nbPedigreeReportsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.ClearReportSelection;
begin
   HerdReportsMenu.UpdateMenuItems;
   PedigreeReportMenu.UpdateMenuItems;
   InventoryReportMenu.UpdateMenuItems;
   VQAssuranceReportMenu.UpdateMenuItems;
   ProfitMonitorReportMenu.UpdateMenuItems;
   CowRecordingReportMenu.UpdateMenuItems;
   CattleMarginsReportMenu.UpdateMenuItems;
   BreedingFertilityReportMenu.UpdateMenuItems;
   MilkAnalysisReportMenu.UpdateMenuItems;
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbProfitMonitorRprtsMouseLeave(Sender: TObject);
begin
   ProfitMonitorReportMenu.UpdateMenuItems;
   LastReportMenu := ProfitMonitorReportMenu;
end;

procedure TfmReports.nbHerdReportsMouseLeave(Sender: TObject);
begin
   HerdReportsMenu.UpdateMenuItems;
   LastReportMenu := HerdReportsMenu;
end;

procedure TfmReports.nbVeterinaryMiscMouseLeave(Sender: TObject);
begin
   VQAssuranceReportMenu.UpdateMenuItems;
   LastReportMenu := VQAssuranceReportMenu;
end;

procedure TfmReports.nbCowRecordMouseLeave(Sender: TObject);
begin
   CowRecordingReportMenu.UpdateMenuItems;
   LastReportMenu := CowRecordingReportMenu;
end;

procedure TfmReports.nbCattleMarginsMouseLeave(Sender: TObject);
begin
   CattleMarginsReportMenu.UpdateMenuItems;
   LastReportMenu := CattleMarginsReportMenu;
end;

procedure TfmReports.nbBreedFertMouseLeave(Sender: TObject);
begin
   BreedingFertilityReportMenu.UpdateMenuItems;
   LastReportMenu := BreedingFertilityReportMenu;
end;

procedure TfmReports.nbMilkAnalysisMouseLeave(Sender: TObject);
begin
   MilkAnalysisReportMenu.UpdateMenuItems;
   LastReportMenu := MilkAnalysisReportMenu;
end;

procedure TfmReports.nbPedigreeReportsMouseLeave(Sender: TObject);
begin
   PedigreeReportMenu.UpdateMenuItems;
   LastReportMenu := PedigreeReportMenu;
end;

procedure TfmReports.nbHerdReportsMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   ClearReportSelection;
end;

procedure TfmReports.actConformationGradeAnalysisExecute(Sender: TObject);
begin
   //WinData.AddReport(cConfGradAnalysisRep,False,False);
   TfmConformationGradeAnalysis.Show;
end;

procedure TfmReports.actFertilityCheckExecute(Sender: TObject);
begin
   //WinData.AddReport(cFertCheckRep,False,False);
   TfmFertilityCheckReport.ShowReport;
end;

procedure TfmReports.ShowReportsPopupMenu;
begin
{
   if FNavBarPopupMenu <> nil then
      FNavBarPopupMenu.ItemLinks.Clear;

//   if ( FActiveNavBar = nil ) then Exit;

   if FActiveNavBar = nbHerdReports then
      begin
         //   nbHerdReports
         FBarItemLink := FNavBarPopupMenu.ItemLinks.Add;
         FBarItemLink.Item := bbTagReplacementForm;
         FBarItemLink := FNavBarPopupMenu.ItemLinks.Add;
         FBarItemLink.Item := bbConformGradeAnalysis;
      end
   else if FActiveNavBar = nbVeterinaryMisc then
      begin
         //   nbVeterinaryMisc
         FBarButton := TdxBarButton.Create(FNavBarPopupMenu);
         FBarButton.Action := actRestrictedAnimalsReport;
         FBarItemLink := FNavBarPopupMenu.ItemLinks.Add;
         FBarItemLink.Item := FBarButton;

         FBarButton := TdxBarButton.Create(FNavBarPopupMenu);
         FBarButton.Action := actDiseaseTestStatus;
         FBarItemLink := FNavBarPopupMenu.ItemLinks.Add;
         FBarItemLink.Item := FBarButton;

         FBarButton := TdxBarButton.Create(FNavBarPopupMenu);
         FBarButton.Action := actDiseaseTestStatus;
         FBarItemLink := FNavBarPopupMenu.ItemLinks.Add;
         FBarItemLink.Item := FBarButton;
      end;

   GetCursorPos(FPoint);
   FNavBarPopupMenu.Popup(FPoint.x, FPoint.Y);
 }
end;

procedure TfmReports.FormDestroy(Sender: TObject);
begin
   dxNavBarViewsFactory.UnRegisterView(dxMyNavBarOffice11NavigatorPaneView);

   if ( WinData.Reports.Active ) then
      WinData.Reports.Active := False;
   if ( FCowRecActionList <> nil ) then
      FreeAndNil(FCowRecActionList);
end;

procedure TfmReports.nbVeterinaryMiscMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;end;

procedure TReportMenu.PanelMouseEnter(Sender: TObject);
begin
   //
end;

procedure TReportMenu.OnTimer(Sender: TObject);
begin
   FTimer.Enabled := False;
   //PopupReportsMenu;
end;

procedure TReportMenu.PanelMouseLeave(Sender: TObject);
begin
//
end;

procedure TReportMenu.PopupReportsMenu;
var
   NavBarName : string;
   BarItemLink : TdxBarItemLink;
   BarButton : TdxBarButton;
   i : Integer;
   ParentTag : Integer;
begin
   if FNavBarPopupMenu <> nil then
      FNavBarPopupMenu.ItemLinks.Clear;

   if (Self.Parent = nil) or (FNavBarPopupMenu = nil) then Exit;

   NavBarName := '';

   if (Self.Parent is TdxNavBarGroupControl) then
      begin
         ParentTag := Self.Parent.Tag;
         if ((Self.Parent as TdxNavBarGroupControl).Parent is TdxNavBar ) then
            begin
               NavBarName := ((Self.Parent as TdxNavBarGroupControl).Parent as TdxNavBar ).Name;
            end;
      end;

   for i := 0 to ActionList.ActionCount-1 do
      begin
         if (ActionList.Actions[i].Tag = ParentTag ) then
            begin
               BarButton := TdxBarButton.Create(FNavBarPopupMenu);
               BarButton.Action := ActionList.Actions[i];
               BarItemLink := FNavBarPopupMenu.ItemLinks.Add;
               BarItemLink.Item := BarButton;
            end
      end;

   GetCursorPos(FPoint);
   FNavBarPopupMenu.Popup(FPoint.x, FPoint.Y);
end;

function TReportMenu.GetActionByName(AActionName: string): TContainedAction;
var
  i : Integer;
begin
   Result := nil;
   for i := 0 to ActionList.ActionCount-1 do
      if ActionList.Actions[i].Name = AActionName then
         Result := ActionList.Actions[i];
end;

procedure TReportMenu.LabelMouseEnter(Sender: TObject);
begin
   if FNavBarPopupMenu <> nil then
      FTimer.Enabled := True
   else
      HideNavBarPopupMenu;
end;

procedure TReportMenu.LabelMouseLeave(Sender: TObject);
begin
   FTimer.Enabled := False;
   HideNavBarPopupMenu;
end;

procedure TReportMenu.HideNavBarPopupMenu;
var
   pt : TPoint;
begin
   GetCursorPos(pt);
   if (FNavBarPopupMenu <> nil ) and (FNavBarPopupMenu.SubMenuControl <> nil) then
      begin
         pt := FNavBarPopupMenu.SubMenuControl.ScreenToClient(pt);
         if (FNavBarPopupMenu.SubMenuControl.ItemAtPos(pt) = nil) then
            FNavBarPopupMenu.SubMenuControl.Hide;
      end;
end;

procedure TfmReports.nbProfitMonitorRprtsMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbMilkAnalysisMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbPedigreeReportsMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbCattleMarginsMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbCowRecordMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbInventoryReportsMouseEnter(Sender: TObject);
begin
   if LastReportMenu <> nil then
      LastReportMenu.UpdateMenuItems;
end;

procedure TfmReports.nbInventoryReportsMouseLeave(Sender: TObject);
begin
   InventoryReportMenu.UpdateMenuItems;
   LastReportMenu := InventoryReportMenu;
end;

procedure TfmReports.btnHerdReportsDropClick(Sender: TObject);
begin
   HerdReportsMenu.PopupReportsMenu;
end;

procedure TfmReports.btnVetReportsDropClick(Sender: TObject);
begin
   VQAssuranceReportMenu.PopupReportsMenu;
end;

procedure TfmReports.btnCowRecDropClick(Sender: TObject);
begin
   CowRecordingReportMenu.PopupReportsMenu;
end;

procedure TfmReports.btnBreedingFertDropClick(Sender: TObject);
begin
   BreedingFertilityReportMenu.PopupReportsMenu;
end;

procedure TfmReports.btnMilkAnalysisDropClick(Sender: TObject);
begin
   MilkAnalysisReportMenu.PopupReportsMenu;
end;

//   16/05/12 [V5.0 R5.7] /MK Additional Feature - New Procedure To Show Report Filters On Reports Show.
procedure TfmReports.SetupReportFilters;
var
   sReportFilterType : String;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DefaultReportFilter FROM Defaults');
         Open;
         try
            First;
            sReportFilterType := Fields[0].AsString;

            cmboReportFilter.Properties.OnCloseUp := nil;

            if ( sReportFilterType = cKeyReports ) then
               cmboReportFilter.ItemIndex := 1
            else if ( sReportFilterType = cFavourites ) then
               cmboReportFilter.ItemIndex := 2
            else if ( sReportFilterType = cMostUsed ) then
               cmboReportFilter.ItemIndex := 3
            else if ( sReportFilterType = cReportGenerators ) then
               cmboReportFilter.ItemIndex := 4
            else
               cmboReportFilter.ItemIndex := 0;

            cmboReportFilter.Properties.OnCloseUp := cmboReportFilterPropertiesCloseUp;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmReports.FormShow(Sender: TObject);
begin

end;

//   16/05/12 [V5.0 R5.7] /MK Additional Feature - Check For Report Filters On Reports Show.
procedure TfmReports.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   try
       // Because showReportFilters opens another form, we need to turn off
       // the form activation event.
       ShowReportFilter;
   finally
     //OnActivate := FormActivate;
   end;
end;

procedure TfmReports.ShowReportFilter;
var
   ReportFilters : TfmReportFilters;
begin
   cmboReportFilter.Properties.OnCloseUp := nil;
   try
      if ( cmboReportFilter.ItemIndex = 0 ) then
         begin
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE Defaults');
                  SQL.Add('SET DefaultReportFilter = "<None>"');
                  Prepare;
                  ExecSQL;
               finally
                  Free;
               end;
         end
      else if ( cmboReportFilter.ItemIndex = 1 ) then
         TfmReportFilters.ShowTheForm(ftKeyReports)
      else if ( cmboReportFilter.ItemIndex = 2 ) then
         begin
            TfmReportFilters.ShowTheForm(ftFavourites)
         end
      else if ( cmboReportFilter.ItemIndex = 3 ) then
         begin
            if WinData.RepFavouritesOrMostUsedExist(cMostUsed) then
               TfmReportFilters.ShowTheForm(ftMostUsed)
         end
      else if ( cmboReportFilter.ItemIndex = 4 ) then
         TfmReportFilters.ShowTheForm(ftReportGenerators);

   finally
      cmboReportFilter.Properties.OnCloseUp := cmboReportFilterPropertiesCloseUp;
   end;

end;

procedure TfmReports.actHerdRptGenBeefManExecute(Sender: TObject);
begin
   WinData.UpdateRecentReportUsage(cHerdRepGenRep);
   WinData.CallProg.ReportGenerator(rgmHerd)
end;

procedure TfmReports.cmboReportFilterPropertiesCloseUp(Sender: TObject);
begin
   ShowReportFilter();
end;

procedure TfmReports.btnBeefManDropClick(Sender: TObject);
begin
   CattleMarginsReportMenu.PopupReportsMenu;
end;

procedure TfmReports.bbPrintAllMedicinesClick(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(0, True);
end;

procedure TfmReports.bbPrintInUseMedicinesOnlyClick(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(0, True, False, ftInUse);
end;

procedure TfmReports.bbPrintNotInUseMedicinesOnlyClick(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(0, True, False, ftNotInUse);
end;

procedure TfmReports.bbLatestWeighingClick(Sender: TObject);
begin
   uWeighingFilt.ShowTheForm(wrtLatest);
end;

procedure TfmReports.bbMultipleWeighingsClick(Sender: TObject);
begin
   uWeighingFilt.ShowTheForm(wrtMultipleWeighings);
end;

procedure TfmReports.bbWeightGainClick(Sender: TObject);
begin
   uWeighingFilt.ShowTheForm(wrtWeightGain);
end;

procedure TfmReports.actSireAnalysisExecute(Sender: TObject);
var
   iYear : Integer;
begin
   iYear := TfmSireAnalysisFilter.GetWeightGainCalcYear;
   if ( iYear > 0 ) then
      TfmSireAnalysis.ShowTheForm(iYear);
end;

{ TdxMyNavBarOffice11NavPaneViewInfo }

function TdxMyNavBarOffice11NavPaneViewInfo.GetOverflowPanelHeight: Integer;
begin
  Result := 0
end;

function TdxMyNavBarOffice11NavPaneViewInfo.GetSplitterHeight: Integer;
begin
  Result := 0;
end;

{ TdxMyNavBarOffice11NavPanePainter }

function TdxMyNavBarOffice11NavPanePainter.CreateViewInfo: TdxNavBarViewInfo;
begin
  Result := TdxMyNavBarOffice11NavPaneViewInfo.Create(self);
end;

procedure TdxMyNavBarOffice11NavPanePainter.DrawOverflowPanel;
begin

end;

procedure TdxMyNavBarOffice11NavPanePainter.DrawSplitter;
begin

end;


end.