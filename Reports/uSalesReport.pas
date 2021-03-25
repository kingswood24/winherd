unit uSalesReport;

{
   SP 30/10/2002:-

   Animal No Caption on report was widened.

   SP 30/10/2002.

 ------------------------------------------------------------------------------

 SP 13/01/2003:-

 Changed : Heifer Premium to read Heifer Top up
 Changed : Premium Price Per Head Figures, using properties from WinData

 SP 13/01/2003.

 ------------------------------------------------------------------------------

 10/02/2009 [Dev V3.9 R6.0] /SP New Feature - Enable filtering of Sale Grades (IAD - Kevin Grogan request)

 23/11/10 [V4.0 R5.7] /MK Additional Feature - Changed Average of Net Margin Per Day On Farm To (Average Net Margin Divided By Average Days On Farm.

 15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

 28/03/13 [V5.1 R5.4] /MK Change - Changed combo's LookupSource to new DairyData DataSource's for customers, suppliers and buyers.

 16/12/13 [V5.2 R7.1] /MK Change - Check new radio group to see whether to show Buyer or Supplier - McDonnell Bros.

 24/10/14 [V5.3 R8.7] /MK Bug Fix - SQL to get data from events table updated to now look at two temp tables for Sales and Purchases from the Events table.

 09/02/16 [V5.5 R2.7] /MK Additional Feature - Added breed column on request of GL/IAD.

 10/02/16 [V5.5 R2.7] /MK Bug Fix - Had to create a new quick report, qrCattleMargins, as the old quick report had a line before the new breed code column that
                                    was in the detail band but was nowhere to be found in the quick report itself.

 15/02/16 [V5.5 R3.8] /MK Bug Fix - ViewBtnClick - Don't preview/print report if no data to print.
                                                 - Don't set caption of sales/purchase labels if cbSales or cbPurch is not checked.

 04/04/16 [V5.5 R5.7] /MK Bug Fix - After new quick report was created the changing of the buyer/supplier label and data was not working - McDonnell Bros.

 11/10/16 [V5.6 R0.9] /MK Change - Added FarmName to the top of the report - IAD.

 12/10/16 [V5.6 R1.0] /MK Additional Feature - Created a new report without the Farm Costs - John McDonnell (S/N: 1308).
                                             - Added check box for Show Farm Costs which is defaulted on.
                                               If this check box is unticked then the new report shows.

 16/12/16 [V5.6 R3.8] /MK Additional Feature - ViewBtnClick - Added extra filter for either bull or steer instead of just a male filter - requested by Anne Ryan

 03/10/17 [V5.7 R3.5] /MK Additional Feature - Added new check box for Include Dead Animals that shows when Sold Animals Only is unticked - Sean Tynan/GL request.
                          Change - ViewBtnClick - If Sold Animals Only is ticked or new Include Dead Animals is not ticked then only show animals that are sold.
                          Bug Fix - lGrades and lWeights were showing on qrCattleMargins.
                                  - lGrades were not showing if Show Farm Costs was not ticked.
                                  - Changed alignment and position of NatID column on qrCattleMargins and qrNoFarmCost to suit 372 tags.
                                  - ViewBtnClick - Removed TempTables for Purchase and Sales because if user runs Purchase/Sales Analysis report first these tables
                                                   are already created by TMovementDataHelper. Using TMovementDataHelper instead of these TempTables.

 02/11/17 [V5.7 R4.2] /MK Bug Fix - ViewBtnClick - If Sold Animals is not ticked AND Dead Animals is ticked only then include Dead Animals.
                                                 - If Sold Animals is ticked AND then only incldue animals that are sold.

 06/07/18 [V5.8 R0.8] /MK Change - Fixed Tab Order.
                          Additional Feature - Added button to the menu bar for Include Options.
                                             - Include options pops up a PopupMenu for Farm Costs, Dead Animals and Crush Weight.
                                             - Crush Weight item only appears if user has the Crush Module.
                                             - If Crush Weight is ticked then remove Feed Costs column and add the Crush Weight column to the Purchase Detail section.
                                             - Crush Weight is the first weighing event on or after the purchase date.
                                             - Use Crush Weight to calculate the Avg Gain Per Day.

 09/10/18 [V5.8 R3.0] /MK Change - Default Include Crush Weight ON if new preference, Update Mart Weight With Crush Weight, is OFF - Bellingham.

 21/11/18 [V5.8 R4.7] /MK Bug Fix - ViewBtnClick - Since new quickreports were added for Show Crush weigh and Hide Feed Costs, the supplier/buyer switch hasn't worked - Richard Bourns.

 15/03/19 [V5.8 R8.0] /MK Change - LoadOtherData - Aoife (Bellingham) asked if this restriction of crush weights within 5 days could be changed to 14
                                                   to allow for a situation where if a supplier tells the buyer that the animal is purchased on a date
                                                   but the animal is not tranported to Bellingham for more than a week because the supplier is waiting
                                                   until they have a truck load of animals to move to Bellingham, Aoife said 14 days would cover this.

 21/08/20 [V5.9 R5.5] /MK Additional Feature - Added new Cattle Costings report - John McCann/GL.
                                             - Added new menu item to Format Options for the new Cattle Costings report.
                                             - When new preference "Use purchase weight as live weight for Kill out" is ticked default this new Cattle Costings report on.
                                             - The new report needs a "Total Cost per kg Live Weight"

 04/03/21 [V5.9 R9.3] /MK Additional Feature - Cattle Costs - Change Sale Date to Date Of Birth "easy 5 minute change" - GL/C&J Meats.                                             

 25/03/21 [V5.9 R9.6] /MK Change - LoadOtherData - Aoife (Bellingham) asked if the restriction of crush weights this could be increased to 28 days as the lads in the yard are behind with tagging.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RXLookup, Mask, ToolEdit, ExtCtrls, quickrpt, Db,
  DBTables, Qrctrls, RXCtrls, ComCtrls, ToolWin, CurrEdit, QRExport, ReportDefaults,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, cxGroupBox, cxCheckBox, cxRadioGroup, KDBRoutines,
  Menus, Def, DateUtil;

type
  TfSalesRep = class(TForm)
    qSalesRep: TQuery;
    pSalesRep: TPanel;
    gOrder: TRadioGroup;
    gSortBy: TRadioGroup;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    qPremiums: TQuery;
    tSlghtAppliedFor: TTable;
    qHealth: TQuery;
    pSupplierCustomer: TPanel;
    lSupplier: TLabel;
    Label9: TLabel;
    cbSupplier: TRxDBLookupCombo;
    cbCustomer: TRxDBLookupCombo;
    pPurchaseDates: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    ToPurchDate: TDateEdit;
    FromPurchDate: TDateEdit;
    Label12: TLabel;
    cbBuyer: TRxDBLookupCombo;
    qFeed: TQuery;
    pbWait: TProgressBar;
    lWait: TLabel;
    pSaleDates: TPanel;
    SwitchLabel: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    Label2: TLabel;
    cbSales: TCheckBox;
    cbPurch: TCheckBox;
    rgSex: TRadioGroup;
    cbSex: TCheckBox;
    Label6: TLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    gbGradeFilter: TcxGroupBox;
    ccbSaleGrades: TcxCheckComboBox;
    ccbSaleWeights: TcxCheckComboBox;
    Label15: TLabel;
    Label16: TLabel;
    cbFilterBySaleGrade: TCheckBox;
    cbFavourite: TcxCheckBox;
    rgShowSuppOrBuyer: TcxRadioGroup;
    qrCattleMargins: TQuickRep;
    QRBand2: TQRBand;
    TitleLabel: TQRLabel;
    QRShape27: TQRShape;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    SortOptionsLabel: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel20: TQRLabel;
    SupplierLabel: TQRLabel;
    BuyerLabel: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    CustomerLabel: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    lSaleFrom: TQRLabel;
    lPurchFrom: TQRLabel;
    lSaleTo: TQRLabel;
    lPurchTo: TQRLabel;
    QRLabel35: TQRLabel;
    lSexType: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    qrlBuyerSupplier: TQRLabel;
    QRShape36: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    lGradesTitle: TQRLabel;
    lWeightsTitle: TQRLabel;
    lGrades: TQRLabel;
    lWeights: TQRLabel;
    QRLabel76: TQRLabel;
    QRBand4: TQRBand;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRExpr43: TQRExpr;
    QRExpr44: TQRExpr;
    QRExpr45: TQRExpr;
    QRExpr46: TQRExpr;
    QRExpr47: TQRExpr;
    QRExpr48: TQRExpr;
    QRExpr49: TQRExpr;
    QRExpr50: TQRExpr;
    QRExpr51: TQRExpr;
    QRExpr52: TQRExpr;
    QRExpr53: TQRExpr;
    QRExpr54: TQRExpr;
    QRExpr55: TQRExpr;
    QRExpr56: TQRExpr;
    QRExpr57: TQRExpr;
    QRExpr58: TQRExpr;
    QRExpr59: TQRExpr;
    QRExpr60: TQRExpr;
    QRExpr61: TQRExpr;
    QRExpr62: TQRExpr;
    QRExpr63: TQRExpr;
    QRExpr64: TQRExpr;
    QRExpr65: TQRExpr;
    QRExpr66: TQRExpr;
    QRExpr67: TQRExpr;
    QRExpr68: TQRExpr;
    QRExpr69: TQRExpr;
    QRExpr70: TQRExpr;
    QRExpr71: TQRExpr;
    QRExpr72: TQRExpr;
    QRExpr73: TQRExpr;
    QRExpr74: TQRExpr;
    QRExpr75: TQRExpr;
    QRExpr76: TQRExpr;
    QRExpr77: TQRExpr;
    QRExpr78: TQRExpr;
    QRShape51: TQRShape;
    QRBand5: TQRBand;
    QRLabel79: TQRLabel;
    PremVerLabel: TQRLabel;
    QRShape52: TQRShape;
    SalesRep: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    OldTitleLabel: TQRLabel;
    QRShape2: TQRShape;
    SortLabel1: TQRLabel;
    OrderLabel1: TQRLabel;
    SortOptionsLabel1: TQRLabel;
    QRSysData31: TQRSysData;
    QRSysData4: TQRSysData;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    SupplierLabel1: TQRLabel;
    BuyerLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    CustomerLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    lSalefrom1: TQRLabel;
    lPurchfrom1: TQRLabel;
    lSaleto1: TQRLabel;
    lPurchto1: TQRLabel;
    QRLabel8: TQRLabel;
    lSexType1: TQRLabel;
    QRShape25: TQRShape;
    QRShape17: TQRShape;
    QRShape16: TQRShape;
    QRShape10: TQRShape;
    QRShape6: TQRShape;
    QRShape4: TQRShape;
    lNatID: TQRLabel;
    lPurchPrice: TQRLabel;
    lPurchCosts: TQRLabel;
    lOtherCosts: TQRLabel;
    lAnimalNum: TQRLabel;
    lFeedCosts: TQRLabel;
    lDaysOnFarm: TQRLabel;
    lAvDailyWtGain: TQRLabel;
    lFarmCostsPerDay: TQRLabel;
    lSaleDate: TQRLabel;
    lCustomer: TQRLabel;
    lLiveWt: TQRLabel;
    lGrade: TQRLabel;
    lKillOut: TQRLabel;
    lDeadWt: TQRLabel;
    lPricePerKg: TQRLabel;
    lSalePrice: TQRLabel;
    lSaleCosts: TQRLabel;
    lNetSalePrice: TQRLabel;
    lTotalIncome: TQRLabel;
    lTotalCosts: TQRLabel;
    lNetMargin: TQRLabel;
    lNetMarginPerDay: TQRLabel;
    lAnimalIdentifiers: TQRLabel;
    lAcquisitionCosts: TQRLabel;
    lFarmCosts: TQRLabel;
    lDisposalDetails: TQRLabel;
    lSalesIncomeCosts: TQRLabel;
    lFinalIncomeExpend: TQRLabel;
    lStatistics: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape8: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    lGradesTitle1: TQRLabel;
    lWeightsTitle1: TQRLabel;
    lGrades1: TQRLabel;
    lWeights1: TQRLabel;
    qrlBreed: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QRExpr34: TQRExpr;
    QRExpr35: TQRExpr;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRShape9: TQRShape;
    QRBand1: TQRBand;
    QRLabel34: TQRLabel;
    OldPremVerLabel: TQRLabel;
    QRShape18: TQRShape;
    OldDetailBand: TQRBand;
    NatID: TQRDBText;
    AnimalNo: TQRDBText;
    SaleDate1: TQRDBText;
    PurchPrice1: TQRDBText;
    PurchCosts1: TQRDBText;
    OtherCosts1: TQRDBText;
    FeedCosts1: TQRDBText;
    DaysOnFarm1: TQRDBText;
    AvDailyWtGain1: TQRDBText;
    FarmCostsPerDay1: TQRDBText;
    Customer1: TQRDBText;
    LiveWt1: TQRDBText;
    DeadWt1: TQRDBText;
    KillOut1: TQRDBText;
    SalesGrade1: TQRDBText;
    PricePerKg1: TQRDBText;
    SalePrice1: TQRDBText;
    SaleCosts1: TQRDBText;
    NetSalePrice1: TQRDBText;
    TotalIncome1: TQRDBText;
    NetMargin1: TQRDBText;
    NetMarginPerDay1: TQRDBText;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    TotalCosts1: TQRDBText;
    QRDBText1: TQRDBText;
    PurchWeight1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape14: TQRShape;
    QRShape26: TQRShape;
    QRDBText3: TQRDBText;
    qrdbBreed1: TQRDBText;
    pInfo: TPanel;
    Label8: TLabel;
    cbUseFilter: TCheckBox;
    DetailBand: TQRBand;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrdbBreed: TQRDBText;
    QRDBText7: TQRDBText;
    Buyer_Supplier: TQRDBText;
    PurchCosts: TQRDBText;
    PurchasePrice: TQRDBText;
    PurchaseCosts: TQRDBText;
    FeedCosts: TQRDBText;
    VetCosts: TQRDBText;
    OtherCosts: TQRDBText;
    DaysOnFarm: TQRDBText;
    AvDailyWtGain: TQRDBText;
    FarmCostsPerDay: TQRDBText;
    SaleDate: TQRDBText;
    Customer: TQRDBText;
    LiveWt: TQRDBText;
    DeadWt: TQRDBText;
    KillOut: TQRDBText;
    SalesGrade: TQRDBText;
    PricePerKg: TQRDBText;
    SalePrice: TQRDBText;
    SaleCosts: TQRDBText;
    NetSalePrice: TQRDBText;
    TotalIncome: TQRDBText;
    TotalCosts: TQRDBText;
    NetMargin: TQRDBText;
    NetMarginPerDay: TQRDBText;
    QRLabel17: TQRLabel;
    qrlHerdName: TQRLabel;
    qrNoFarmCost: TQuickRep;
    QRBand6: TQRBand;
    NoFarmCostsTitleLabel: TQRLabel;
    QRShape44: TQRShape;
    NoFarmCostsSortLabel: TQRLabel;
    NoFarmCostsOrderLabel: TQRLabel;
    NoFarmCostsSortOptionsLabel: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData5: TQRSysData;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRLabel25: TQRLabel;
    NoFarmCostsSupplierLabel: TQRLabel;
    NoFarmCostsBuyerLabel: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    NoFarmCostsCustomerLabel: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    lNoFarmCostsSaleFrom: TQRLabel;
    lNoFarmCostsPurchFrom: TQRLabel;
    lNoFarmCostsSaleTo: TQRLabel;
    lNoFarmCostsPurchTo: TQRLabel;
    QRLabel84: TQRLabel;
    lNoFarmCostsSexType: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel117: TQRLabel;
    qrlNoFarmCostsBuyerSupplier: TQRLabel;
    QRShape61: TQRShape;
    QRLabel120: TQRLabel;
    lNoFarmCostsGradesTitle: TQRLabel;
    lNoFarmCostsWeightsTitle: TQRLabel;
    lNoFarmCostsGrades: TQRLabel;
    lNoFarmCostsWeights: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    qrlNoFarmCostsHerdName: TQRLabel;
    QRBand7: TQRBand;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRExpr79: TQRExpr;
    QRExpr81: TQRExpr;
    QRExpr82: TQRExpr;
    QRExpr84: TQRExpr;
    QRExpr85: TQRExpr;
    QRExpr86: TQRExpr;
    QRExpr87: TQRExpr;
    QRExpr88: TQRExpr;
    QRExpr89: TQRExpr;
    QRExpr90: TQRExpr;
    QRExpr91: TQRExpr;
    QRExpr92: TQRExpr;
    QRExpr93: TQRExpr;
    QRExpr94: TQRExpr;
    QRExpr95: TQRExpr;
    QRExpr96: TQRExpr;
    QRExpr99: TQRExpr;
    QRExpr100: TQRExpr;
    QRExpr101: TQRExpr;
    QRExpr102: TQRExpr;
    QRExpr103: TQRExpr;
    QRExpr104: TQRExpr;
    QRExpr105: TQRExpr;
    QRExpr106: TQRExpr;
    QRExpr107: TQRExpr;
    QRExpr108: TQRExpr;
    QRExpr109: TQRExpr;
    QRExpr110: TQRExpr;
    QRExpr111: TQRExpr;
    QRExpr112: TQRExpr;
    QRExpr113: TQRExpr;
    QRExpr116: TQRExpr;
    QRExpr117: TQRExpr;
    QRShape68: TQRShape;
    QRBand8: TQRBand;
    QRLabel130: TQRLabel;
    NoFarmCostsPremVerLabel: TQRLabel;
    QRShape69: TQRShape;
    NoFarmCostsDetailBand: TQRBand;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    NoFarmCostsBuyer_Supplier: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    qrNoFeedCosts: TQuickRep;
    QRBand3: TQRBand;
    NoFeedCostsTitleLabel: TQRLabel;
    QRShape58: TQRShape;
    NoFeedCostsSortLabel: TQRLabel;
    NoFeedCostsOrderLabel: TQRLabel;
    NoFeedCostsSortOptionsLabel: TQRLabel;
    QRSysData6: TQRSysData;
    QRSysData7: TQRSysData;
    QRShape64: TQRShape;
    QRShape73: TQRShape;
    QRLabel22: TQRLabel;
    NoFeedCostsSupplierLabel: TQRLabel;
    NoFeedCostsBuyerLabel: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel75: TQRLabel;
    NoFeedCostsCustomerLabel: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel85: TQRLabel;
    lNoFeedCostsSaleFrom: TQRLabel;
    lNoFeedCostsPurchFrom: TQRLabel;
    lNoFeedCostsSaleTo: TQRLabel;
    lNoFeedCostsPurchTo: TQRLabel;
    QRLabel119: TQRLabel;
    lNoFeedCostsSexType: TQRLabel;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    qrlBuyerSupplierNoFeed: TQRLabel;
    QRShape83: TQRShape;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    lNoFeedCostsGradesTitle: TQRLabel;
    lNoFeedCostsWeightsTitle: TQRLabel;
    lNoFeedCostsGrades: TQRLabel;
    lNoFeedCostsWeights: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    qrlNoFeedCostsHerdName: TQRLabel;
    QRBand9: TQRBand;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRExpr80: TQRExpr;
    QRExpr97: TQRExpr;
    QRExpr98: TQRExpr;
    QRExpr114: TQRExpr;
    QRExpr115: TQRExpr;
    QRExpr118: TQRExpr;
    QRExpr119: TQRExpr;
    QRExpr120: TQRExpr;
    QRExpr121: TQRExpr;
    QRExpr122: TQRExpr;
    QRExpr123: TQRExpr;
    QRExpr124: TQRExpr;
    QRExpr125: TQRExpr;
    QRExpr126: TQRExpr;
    QRExpr127: TQRExpr;
    QRExpr128: TQRExpr;
    QRExpr129: TQRExpr;
    QRExpr131: TQRExpr;
    QRExpr132: TQRExpr;
    QRExpr133: TQRExpr;
    QRExpr134: TQRExpr;
    QRExpr135: TQRExpr;
    QRExpr136: TQRExpr;
    QRExpr137: TQRExpr;
    QRExpr138: TQRExpr;
    QRExpr139: TQRExpr;
    QRExpr140: TQRExpr;
    QRExpr141: TQRExpr;
    QRExpr142: TQRExpr;
    QRExpr143: TQRExpr;
    QRExpr144: TQRExpr;
    QRExpr145: TQRExpr;
    QRExpr146: TQRExpr;
    QRExpr147: TQRExpr;
    QRExpr148: TQRExpr;
    QRExpr149: TQRExpr;
    QRExpr150: TQRExpr;
    QRShape90: TQRShape;
    QRBand10: TQRBand;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRShape91: TQRShape;
    QRBand11: TQRBand;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    Buyer_SupplierNoFeed: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRLabel132: TQRLabel;
    QRDBText43: TQRDBText;
    QRExpr83: TQRExpr;
    QRExpr130: TQRExpr;
    btnOptions: TRxSpeedButton;
    ToolButton4: TToolButton;
    pmIncludeOptions: TPopupMenu;
    pmiExtendedSuppBuyFields: TMenuItem;
    pmiIncludeCrushWeight: TMenuItem;
    cbIncludeDeadAnimals: TCheckBox;
    qrCattleCostings: TQuickRep;
    QRBand12: TQRBand;
    CattleCostingsTitleLabel: TQRLabel;
    QRShape99: TQRShape;
    CattleCostsSortLabel: TQRLabel;
    CattleCostsOrderLabel: TQRLabel;
    CattleCostsSortOptionsLabel: TQRLabel;
    QRSysData8: TQRSysData;
    QRSysData9: TQRSysData;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRLabel30: TQRLabel;
    CattleCostingsSupplierLabel: TQRLabel;
    CattleCostingsBuyerLabel: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    CattleCostingsCustomerLabel: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel162: TQRLabel;
    lCattleCostingsSaleFrom: TQRLabel;
    lCattleCostingsPurchFrom: TQRLabel;
    lCattleCostingsSaleTo: TQRLabel;
    lCattleCostingsPurchTo: TQRLabel;
    QRLabel173: TQRLabel;
    lCattleCostingsSexType: TQRLabel;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    QRLabel189: TQRLabel;
    QRLabel190: TQRLabel;
    QRLabel191: TQRLabel;
    QRLabel192: TQRLabel;
    QRLabel193: TQRLabel;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRLabel203: TQRLabel;
    QRLabel204: TQRLabel;
    QRLabel205: TQRLabel;
    QRLabel206: TQRLabel;
    qrlBuyerSupplierCattleCostings: TQRLabel;
    QRShape108: TQRShape;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    lCattleCostingsGradesTitle: TQRLabel;
    lCattleCostingsWeightsTitle: TQRLabel;
    lCattleCostingsGrades: TQRLabel;
    lCattleCostsWeights: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    qrlCattleCostsHerdName: TQRLabel;
    QRBand13: TQRBand;
    QRLabel217: TQRLabel;
    QRLabel218: TQRLabel;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRExpr151: TQRExpr;
    QRExpr152: TQRExpr;
    QRExpr153: TQRExpr;
    QRExpr154: TQRExpr;
    QRExpr155: TQRExpr;
    QRExpr156: TQRExpr;
    QRExpr157: TQRExpr;
    QRExpr158: TQRExpr;
    QRExpr159: TQRExpr;
    QRExpr160: TQRExpr;
    QRExpr161: TQRExpr;
    QRExpr162: TQRExpr;
    QRExpr163: TQRExpr;
    QRExpr165: TQRExpr;
    QRExpr166: TQRExpr;
    QRExpr167: TQRExpr;
    QRExpr168: TQRExpr;
    QRExpr169: TQRExpr;
    QRExpr170: TQRExpr;
    QRExpr171: TQRExpr;
    QRExpr172: TQRExpr;
    QRExpr173: TQRExpr;
    QRExpr174: TQRExpr;
    QRExpr175: TQRExpr;
    QRExpr176: TQRExpr;
    QRExpr177: TQRExpr;
    QRExpr178: TQRExpr;
    QRExpr179: TQRExpr;
    QRExpr180: TQRExpr;
    QRExpr181: TQRExpr;
    QRExpr183: TQRExpr;
    QRExpr184: TQRExpr;
    QRExpr185: TQRExpr;
    QRExpr186: TQRExpr;
    QRExpr187: TQRExpr;
    QRExpr188: TQRExpr;
    QRExpr189: TQRExpr;
    QRShape115: TQRShape;
    QRBand14: TQRBand;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRShape116: TQRShape;
    QRBand15: TQRBand;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    qrdbBuyer_SupplierCattleCostings: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    pmiCattleCostings: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSalesClick(Sender: TObject);
    procedure cbPurchClick(Sender: TObject);
    procedure cbSexClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure SaleDate1Print(sender: TObject; var Value: String);
    procedure FormDestroy(Sender: TObject);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure cbFilterBySaleGradeClick(Sender: TObject);
    procedure Customer1Print(sender: TObject; var Value: String);
    procedure PurchPrice1Print(sender: TObject; var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure QRExpr116Print(sender: TObject; var Value: String);
    procedure btnOptionsClick(Sender: TObject);
    procedure pmiExtendedSuppBuyFieldsClick(Sender: TObject);
    procedure pmiIncludeCrushWeightClick(Sender: TObject);
    procedure pmIncludeOptionsPopup(Sender: TObject);
    procedure pmiCattleCostingsClick(Sender: TObject);

  private
    { Private declarations }
    MyTable : TTable;
    Count : Integer;
    CattleMarginsDefaults : TCattleMarginsDefaults;
    procedure CreateSalesRepTable;
    procedure LoadOtherData;
    function HeiferCalc: Boolean;
    procedure SortNatIDByCheckDigit;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
    procedure SetupSaleGrades;
    function GetSaleGrades : string;
    function GetSaleWeights : string;
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation

uses
    GenTypesConst,
    DairyData, kRoutines, SQLHelper;

var
  fSalesRep: TfSalesRep;

const
  cCattleMargins = 'Cattle Margins';

{$R *.DFM}

procedure ShowTheForm;
begin
   try
      try
         Application.CreateForm(TfSalesRep, fSalesRep);

         if not WinData.ExportToPDA then
            fSalesRep.ShowModal
         else
            fSalesRep.sbView.Click;
       except
          ShowMessage('Cannot create form - close program and re-boot');
       end;
   finally
      if fSalesRep <> nil then
         fSalesRep.Free;
   end;

end;

procedure TfSalesRep.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   try
      qrCattleMargins.Hide;
      qrNoFarmCost.Hide;
      qrNoFeedCosts.Hide;
      qrCattleCostings.Hide;
      SalesRep.Hide;
      cbUseFilter.Checked := WinData.ActiveFilter;
      WinData.QueryCustomers.Close;
      WinData.QueryCustomers.Open;
      WinData.QuerySuppliers.Close;
      WinData.QuerySuppliers.Open;
      WinData.QueryBuyers.Close;
      WinData.QueryBuyers.Open;
      ReFresh;
      MyTable := TTable.Create(nil);
      CreateSalesRepTable;
      SetupSaleGrades;
      Caption := cCattleMargins;
   finally
      MyTable.Close;
      MyTable.DeleteTable;
      MyTable.Free;
   end;
end;

procedure TfSalesRep.CreateSalesRepTable;
begin
   with MyTable do
      begin
         DatabaseName := WinData.KingData.DatabaseName;
         TableName := 'tSalesRep';
         FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
         FieldDefs.Add('AnimalNo',ftString,20,FALSE);
         FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
         FieldDefs.Add('NatID',ftString,20,FALSE);
         FieldDefs.Add('SortNatID',ftString,20,FALSE);
         FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
         FieldDefs.Add('BirthWt',ftFloat,0,FALSE);
         FieldDefs.Add('HerdID',ftInteger,0,False);
         FieldDefs.Add('Sex',ftString,10,False);
         FieldDefs.Add('LactNo',ftInteger,0,False);
         FieldDefs.Add('PurchEventID',ftInteger,0,FALSE);
         FieldDefs.Add('PurchDate',ftDate,0,FALSE);
         FieldDefs.Add('PurchPrice',ftFloat,0,FALSE);
         FieldDefs.Add('PurchWt',ftFloat,0,FALSE);
         FieldDefs.Add('BuyerID',ftInteger,0,FALSE);
         FieldDefs.Add('Buyer',ftString,30,FALSE);
         FieldDefs.Add('SupplierID',ftInteger,0,FALSE);
         FieldDefs.Add('Supplier',ftString,50,FALSE);
         FieldDefs.Add('SupplierCosts',ftFloat,0,FALSE);
         FieldDefs.Add('BuyerCosts',ftFloat,0,FALSE);
         FieldDefs.Add('PurchCosts',ftFloat,0,FALSE);
         FieldDefs.Add('FeedCosts',ftFloat,0,FALSE);
         FieldDefs.Add('VetCosts',ftFloat,0,FALSE);
         FieldDefs.Add('OtherCosts',ftFloat,0,FALSE);
         FieldDefs.Add('Premiums',ftFloat,0,FALSE);
         FieldDefs.Add('SlghtElig',ftBoolean,0,FALSE);
         FieldDefs.Add('SlghtPrem',ftFloat,0,FALSE);
         FieldDefs.Add('DaysOnFarm',ftInteger,0,FALSE);
         FieldDefs.Add('AvDailyWtGain',ftFloat,0,FALSE);
         FieldDefs.Add('FarmCostsPerDay',ftFloat,0,FALSE);
         FieldDefs.Add('SalesEventID',ftInteger,0,FALSE);
         FieldDefs.Add('SaleDate',ftDate,0,FALSE);
         FieldDefs.Add('CustomerID',ftInteger,0,FALSE);
         FieldDefs.Add('Customer',ftString,50,FALSE);
         FieldDefs.Add('LiveWt',ftFloat,0,FALSE);
         FieldDefs.Add('DeadWt',ftFloat,0,FALSE);
         FieldDefs.Add('KillOut',ftFloat,0,FALSE);
         FieldDefs.Add('SalesGrade',ftString,15,FALSE);
         FieldDefs.Add('PricePerKg',ftFloat,0,FALSE);
         FieldDefs.Add('SalePrice',ftFloat,0,FALSE);
         FieldDefs.Add('SaleCosts',ftFloat,0,FALSE);
         FieldDefs.Add('NetSalePrice',ftFloat,0,FALSE);
         FieldDefs.Add('TotalIncome',ftFloat,0,FALSE);
         FieldDefs.Add('TotalCosts',ftFloat,0,FALSE);
         FieldDefs.Add('NetMargin',ftFloat,0,FALSE);
         FieldDefs.Add('NetMarginPerDay',ftFloat,0,FALSE);
         FieldDefs.Add('Haulage',ftFloat,0,FALSE);
         FieldDefs.Add('Commission',ftFloat,0,FALSE);
         FieldDefs.Add('TotalDeductions',ftFloat,0,FALSE);
         FieldDefs.Add('CustomerCosts',ftFloat,0,FALSE);
         FieldDefs.Add('Price',ftFloat,0,FALSE);
         FieldDefs.Add('NetSales',ftFloat,0,FALSE);
         FieldDefs.Add('PGrade',ftString,15);
         FieldDefs.Add('PGradeId',ftString,15);
         FieldDefs.Add('PGradeWgt',ftString,15);
         FieldDefs.Add('SGrade',ftString,15);
         FieldDefs.Add('SGradeId',ftString,15);
         FieldDefs.Add('SGradeWgt',ftString,15);
         FieldDefs.Add('Breed',ftString,6);
         FieldDefs.Add('CrushWeight',ftFloat);
         FieldDefs.Add('CostPerKgDeadWeight',ftFloat);
         CreateTable;
         Open;
      end;
end;

procedure TfSalesRep.ExitBtnClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

procedure TfSalesRep.ViewBtnClick(Sender: TObject);
var
   grades,weights : string;
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   lWait.Visible  := True;
   pSalesRep.Refresh;
   pbWait.Visible := True;
   pbWait.Position := 0;
   tSlghtAppliedFor.Open;
   sbView.Enabled := False; // SP to stop buttons being pressed twice.
   sbPrint.Enabled := False;
   if pSalesRep.Visible then
      begin
         try
            WinData.MovementDataHelper.CreateTempMovementEventTables;
            if ( not(WinData.MovementDataHelper.TempPurchEvents.Active) ) then
               WinData.MovementDataHelper.TempPurchEvents.Active := True;
            if ( not(WinData.MovementDataHelper.TempSaleEvents.Active) ) then
               WinData.MovementDataHelper.TempSaleEvents.Active := True;

            MyTable := TTable.Create(nil);
            CreateSalesRepTable;
            PremVerLabel.Caption := 'Herd Management ' + HerdVerNo;
            NoFarmCostsPremVerLabel.Caption := PremVerLabel.Caption;
            qSalesRep.SQL.Clear;
            qSalesRep.SQL.Add('DELETE FROM tSalesRep');
            qSalesRep.ExecSQL;

            // rewritten 19/7/00 - kr & sp
            qSalesRep.SQL.Clear;
            qSalesRep.SQL.Add('INSERT INTO tSalesRep (AnimalID, AnimalNo, SortAnimalNo, NatID,');
            qSalesRep.SQL.Add('  		      SortNatId, DateOfBirth, BirthWt, HerdID, Sex, LactNo,');
            qSalesRep.SQL.Add('                       PurchEventID, PurchDate, PurchPrice, PurchWt,');
            qSalesRep.SQL.Add('                       BuyerID, Buyer, SupplierID, Supplier,');
            qSalesRep.SQL.Add('                       SupplierCosts, BuyerCosts, SlghtElig,');
            qSalesRep.SQL.Add('   		      SalesEventID, SaleDate, CustomerID, Customer,');
            qSalesRep.SQL.Add('   		      LiveWt, DeadWt, KillOut, SalesGrade, PricePerKg,');
            qSalesRep.SQL.Add('   		      SalePrice, CustomerCosts, TotalDeductions, Price, PGrade, SGrade, Breed)');
            qSalesRep.SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum,');
            qSalesRep.SQL.Add('		       A.SortNatID, A.DateOfBirth, A.BirthWeight, A.HerdID, A.Sex, A.LactNo,');
            qSalesRep.SQL.Add('		       PE.EventID, PE.EventDate, P.Price, P.Weight, B.ID, B.Name,');
            qSalesRep.SQL.Add('		       SB.ID, SB.Name, P.SupplierCosts, P.BuyerCosts, S.Slaughter,');
            qSalesRep.SQL.Add('                SE.EventID, SE.EventDate, S.Customer, C.Name, S.Weight,');
            qSalesRep.SQL.Add('   	       S.ColdDeadWt, S.KillOut, S.Grade, S.PricePerKg, S.Price,');
            qSalesRep.SQL.Add('   	       S.CustomerCosts, S.TotalDeductions, S.Price, P.Grade, S.Grade, BD.Code');
            qSalesRep.SQL.Add('FROM Animals A');
            qSalesRep.SQL.Add('LEFT JOIN '+WinData.MovementDataHelper.TempSaleEvents.TableName+' SE ON (SE.AnimalID = A.ID)');
            qSalesRep.SQL.Add('LEFT JOIN '+WinData.MovementDataHelper.TempPurchEvents.TableName+' PE ON (PE.AnimalID = A.ID)');
            qSalesRep.SQL.Add('LEFT JOIN SalesDeaths S         ON (S.EventID=SE.EventID)');
            qSalesRep.SQL.Add('LEFT JOIN Purchases P           ON (P.EventID=PE.EventID)');
            qSalesRep.SQL.Add('LEFT JOIN Customers C           ON (C.ID=S.Customer)');
            qSalesRep.SQL.Add('LEFT JOIN Buyers B              ON (B.ID=P.Buyer)');
            qSalesRep.SQL.Add('LEFT JOIN SuppliersBreeders SB  ON (SB.ID=P.Supplier)');
            qSalesRep.SQL.Add('LEFT JOIN Breeds BD             ON (BD.ID=A.PrimaryBreed)');
            if ( Length(HerdCombo.Value) > 0 ) then
               qSalesRep.SQL.ADD('WHERE (A.HerdID = "' + HerdCombo.Value + '" )')
            else
               qSalesRep.SQL.ADD('WHERE (NOT( A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
            qSalesRep.SQL.Add('AND A.AnimalDeleted="False"');

            if cbUseFilter.Checked then
               qSalesRep.SQL.Add('AND (A.ID IN (SELECT F.AID FROM AFilters F))');

            //   16/12/16 [V5.6 R3.8] /MK Additional Feature - Added extra filter for either bull or steer instead of just a male filter - requested by Anne Ryan
            if ( cbSex.Checked ) then
               begin
                  if ( rgSex.ItemIndex = 0 ) then
                     qSalesRep.SQL.Add('AND (Upper(A.Sex) = "BULL")')
                  else if ( rgSex.ItemIndex = 1 ) then
                     qSalesRep.SQL.Add('AND (Upper(A.Sex) = "STEER")')
                  else if ( rgSex.ItemIndex = 2 ) then
                     qSalesRep.SQL.Add('AND (Upper(A.Sex) = "FEMALE")');
               end;

            if cbSales.Checked then
               begin
                  if ( FromDate.Date <= 0 ) and (ToDate.Date <= 0 ) then
                     qSalesRep.SQL.Add('AND ( SE.EventDate IS NOT NULL ) ') // include all sold with valid sales date
                  else
                     begin
                        if ( FromDate.Date > 0 ) then
                           qSalesRep.SQL.Add('AND (SE.EventDate >= "' + FormatDateTime(cUSDateStyle,(FromDate.Date)) + '" ) ');
                        if (ToDate.Date > 0 ) then
                           qSalesRep.SQL.Add('AND (SE.EventDate <= "' + FormatDateTime(cUSDateStyle,(ToDate.Date)) + '" ) ');
                     end;
               end;

            if cbPurch.Checked then
               begin
                  if ( FromPurchDate.Date <= 0 ) and (ToPurchDate.Date <= 0 ) then
                     qSalesRep.SQL.Add('AND (PE.EventDate IS NOT NULL ) ') // include all purchased with valid purchase date
                  else
                     begin
                        if (FromPurchDate.Date > 0 ) then
                           qSalesRep.SQL.Add('AND (PE.EventDate >= "' + FormatDateTime(cUSDateStyle,(FromPurchDate.Date)) + '" ) ');
                        if (ToPurchDate.Date > 0 ) then
                           qSalesRep.SQL.Add('AND (PE.EventDate <= "' + FormatDateTime(cUSDateStyle,(ToPurchDate.Date)) + '" ) ');
                     end;
               end;

            if (cbCustomer.Value <> '0') then
               qSalesRep.SQL.ADD('AND (S.Customer=' + cbCustomer.Value + ')');
            if (cbSupplier.Value <> '0') then
               qSalesRep.SQL.ADD('AND (P.Supplier=' + cbSupplier.Value + ')');
            if (cbBuyer.Value <> '0') then
               qSalesRep.SQL.ADD('AND (P.Buyer=' + cbBuyer.Value + ')');

            //   03/10/17 [V5.7 R3.5] /MK Change - If Sold Animals Only is ticked or new Include Dead Animals is not ticked then only show animals that are sold.
            //   02/11/17 [V5.7 R4.2] /MK Bug Fix - If Sold Animals is not ticked AND Dead Animals is ticked only then include Dead Animals.
            if ( cbIncludeDeadAnimals.Checked ) and ( not(cbSales.Checked) ) then
               qSalesRep.SQL.ADD('AND (S.Sold = FALSE)');
            //   02/11/17 [V5.7 R4.2] /MK Bug Fix - If Sold Animals is ticked AND then only incldue animals that are sold.
            if ( cbSales.Checked ) then
               qSalesRep.SQL.ADD('AND (S.Sold = TRUE)');

            qSalesRep.ExecSQL;
            LoadOtherData;

            // Euro/Pound Calcs
            if ((WinData.UseEuro) AND NOT(WinData.ReportInEuro)) then
                  with qSalesRep do
                     begin
                        SQL.Clear;
                        SQL.Add('UPDATE tSalesRep SET PurchPrice      = (PurchPrice*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                     SupplierCosts   = (SupplierCosts*'+FloatToStr(cEuro)+'),  ');
                        SQL.Add('                     BuyerCosts      = (BuyerCosts*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                     PurchCosts      = (PurchCosts*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                     FeedCosts       = (FeedCosts*'+FloatToStr(cEuro)+'),      ');
                        SQL.Add('                     VetCosts        = (VetCosts*'+FloatToStr(cEuro)+'),       ');
                        SQL.Add('                     OtherCosts      = (OtherCosts*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                     Premiums        = (Premiums*'+FloatToStr(cEuro)+'),       ');
                        SQL.Add('                     SlghtPrem       = (SlghtPrem*'+FloatToStr(cEuro)+'),      ');
                        SQL.Add('                     PricePerKg      = (PricePerKg*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                     SalePrice       = (SalePrice*'+FloatToStr(cEuro)+'),      ');
                        SQL.Add('                     SaleCosts       = (SaleCosts*'+FloatToStr(cEuro)+'),      ');
                        SQL.Add('                     NetSalePrice    = (NetSalePrice*'+FloatToStr(cEuro)+'),   ');
                        SQL.Add('                     TotalIncome     = (TotalIncome*'+FloatToStr(cEuro)+'),    ');
                        SQL.Add('                     TotalCosts      = (TotalCosts*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                     NetMargin       = (NetMargin*'+FloatToStr(cEuro)+'),      ');
                        SQL.Add('                     NetMarginPerDay = (NetMarginPerDay*'+FloatToStr(cEuro)+') ');
                        ExecSQL;
                     end;
            qSalesRep.SQL.Clear;
            qSalesRep.SQL.Add( InsertSELECT(['*']));
            qSalesRep.SQL.Add( InsertFROM(['tSalesRep']));

            lGrades1.Caption := '';
            lGradesTitle.Caption := '';
            lGradesTitle1.Caption := '';
            lGrades.Caption := '';
            lNoFarmCostsGradesTitle.Caption := '';
            lNoFarmCostsGrades.Caption := '';
            lNoFeedCostsGradesTitle.Caption := '';
            lNoFeedCostsGradesTitle.Caption := '';
            lCattleCostingsGrades.Caption := '';
            lCattleCostingsGradesTitle.Caption := '';
            lWeightsTitle1.Caption := '';
            lWeightsTitle.Caption := '';
            lWeights.Caption := '';
            lNoFarmCostsWeightsTitle.Caption := '';
            lNoFarmCostsWeights.Caption := '';
            lNoFeedCostsWeightsTitle.Caption := '';
            lNoFeedCostsWeights.Caption := '';
            lCattleCostingsWeightsTitle.Caption := '';
            lCattleCostsWeights.Caption := '';

            if cbFilterBySaleGrade.Checked then
               begin
                  grades := GetSaleGrades;
                  weights := GetSaleWeights;
                  if (grades <> '') and (weights <> '') then
                     begin
                        qSalesRep.SQL.Add( InsertWHERE(['SGradeId'], [grades], opIN));
                        qSalesRep.SQL.Add( InsertAND(['SGradeWgt'], [weights], opIN));
                        lGradesTitle.Caption := 'Grades:';
                        lGrades.Caption := grades;
                        lWeightsTitle.Caption := 'Weights:';
                        lWeights.Caption := weights;
                     end
                  else if (grades <> '') and (weights = '') then
                     begin
                        qSalesRep.SQL.Add( InsertWHERE(['SGradeId'], [grades], opIN));
                        lGradesTitle.Caption := 'Grades:';
                        lGrades.Caption := grades;
                     end
                  else if (grades = '') and (weights <> '') then
                     begin
                        qSalesRep.SQL.Add( InsertWHERE(['SGradeWgt'], [weights], opIN));
                        lWeightsTitle.Caption := 'Weights:';
                        lWeights.Caption := weights;
                     end;

                  lNoFarmCostsGradesTitle.Caption := lGradesTitle.Caption;
                  lNoFarmCostsGrades.Caption := lGrades.Caption;
                  lNoFarmCostsWeightsTitle.Caption := lWeightsTitle.Caption;
                  lNoFarmCostsWeights.Caption := lWeights.Caption;

                  lNoFeedCostsGradesTitle.Caption := lGradesTitle.Caption;
                  lNoFeedCostsGrades.Caption := lGrades.Caption;
                  lNoFeedCostsWeightsTitle.Caption := lWeightsTitle.Caption;
                  lNoFeedCostsWeights.Caption := lWeights.Caption;

                  lCattleCostingsGradesTitle.Caption := lGradesTitle.Caption;
                  lCattleCostingsGrades.Caption := lGrades.Caption;
                  lCattleCostingsWeightsTitle.Caption := lWeightsTitle.Caption;
                  lCattleCostsWeights.Caption := lWeights.Caption;
               end;

            // include sort and order
            case gSortBy.ItemIndex of
               0 : begin
                      qSalesRep.SQL.ADD('ORDER BY SortAnimalNo');
                      SortLabel.Caption := 'Animal Number';
                   end;
               1,2 : begin
                        if gSortBy.ItemIndex= 2 then
                           SortNatIDByCheckDigit;
                        qSalesRep.SQL.ADD('ORDER BY SortNatID');
                        SortLabel.Caption := 'National ID Number';
                     end;
               3 : begin
                      qSalesRep.SQL.ADD('ORDER BY SaleDate');
                      SortLabel.Caption := 'Date Of Sale';
                   end;
               4 : begin
                      qSalesRep.SQL.ADD('ORDER BY DaysOnFarm');
                      SortLabel.Caption := 'Number Of Days On Farm';
                   end;
               5 : begin
                      qSalesRep.SQL.ADD('ORDER BY LiveWt');
                      SortLabel.Caption := 'Live Weight';
                   end;
            end;
            NoFarmCostsSortLabel.Caption := SortLabel.Caption;
            NoFeedCostsSortLabel.Caption := SortLabel.Caption;
            CattleCostsSortLabel.Caption := SortLabel.Caption;
            case gOrder.ItemIndex of
               0  : begin
                       qSalesRep.SQL.Add('Asc');
                       OrderLabel.Caption := 'In Ascending Order';
                    end;
               1  : begin
                       qSalesRep.SQL.Add('Desc');
                       OrderLabel.Caption := 'In Descending Order';
                    end;
            end;
            NoFarmCostsOrderLabel.Caption := OrderLabel.Caption;
            NoFeedCostsOrderLabel.Caption := OrderLabel.Caption;
            CattleCostsOrderLabel.Caption := OrderLabel.Caption;
            qSalesRep.Open;
            //   15/02/16 [V5.5 R3.8] /MK Bug Fix - Don't preview/print report if no data to print.
            if ( qSalesRep.RecordCount = 0 ) then
               begin
                  MessageDlg('No data available to print.',mtInformation,[mbOK],0);
                  Exit;
               end;

            // set up labels
            //   15/02/16 [V5.5 R3.8] /MK Bug Fix - Don't set caption of sales/purchase labels if cbSales or cbPurch is not checked.
            if ( cbSales.Checked ) then
               begin
                  if ( FromDate.Text <> '  /  /    ' ) and ( FromDate.Date > 0 ) then
                     begin
                        lSaleFrom.Caption := FormatDateTime(cIrishDateStyle,StrToDate(FromDate.Text));
                        lNoFarmCostsSaleFrom.Caption := lSaleFrom.Caption;
                        lNoFeedCostsSaleFrom.Caption := lSaleFrom.Caption;
                        lCattleCostingsSaleFrom.Caption := lSaleFrom.Caption;
                     end;
                  if (ToDate.Text <> '  /  /    ') and ( ToDate.Date > 0 ) then
                     begin
                        lSaleTo.Caption := FormatDateTime(cIrishDateStyle,StrToDate(ToDate.Text));
                        lNoFarmCostsSaleTo.Caption := lSaleTo.Caption;
                        lNoFeedCostsSaleTo.Caption := lSaleTo.Caption;
                        lCattleCostingsSaleTo.Caption := lSaleTo.Caption;
                     end;
               end;
            if ( cbPurch.Checked ) then
               begin
                  if (FromPurchDate.Text <> '  /  /    ') and ( FromPurchDate.Date > 0 ) then
                     begin
                        lPurchFrom.Caption := FormatDateTime(cIrishDateStyle,StrToDate(FromPurchDate.Text));
                        lNoFarmCostsPurchFrom.Caption := lPurchFrom.Caption;
                        lNoFeedCostsPurchFrom.Caption := lPurchFrom.Caption;
                        lCattleCostingsPurchFrom.Caption := lPurchFrom.Caption;
                     end;
                  if (ToPurchDate.Text <> '  /  /    ') and ( ToPurchDate.Date > 0 ) then
                     begin
                        lPurchTo.Caption := FormatDateTime(cIrishDateStyle,StrToDate(ToPurchDate.Text));
                        lNoFarmCostsPurchTo.Caption := lPurchTo.Caption;
                        lNoFeedCostsPurchTo.Caption := lPurchTo.Caption;
                        lCattleCostingsPurchTo.Caption := lPurchTo.Caption;
                     end;
               end;

            CustomerLabel.Caption := 'All Customers';
            if ( cbCustomer.Value <> '0' ) then
               CustomerLabel.Caption := cbCustomer.Text;
            NoFarmCostsCustomerLabel.Caption := CustomerLabel.Caption;
            NoFeedCostsCustomerLabel.Caption := CustomerLabel.Caption;
            CattleCostingsCustomerLabel.Caption := CustomerLabel.Caption;

            SupplierLabel.Caption := 'All Suppliers';
            if ( cbSupplier.Value <> '0' ) then
               SupplierLabel.Caption := cbSupplier.Text;
            NoFarmCostsSupplierLabel.Caption := SupplierLabel.Caption;
            NoFeedCostsSupplierLabel.Caption := SupplierLabel.Caption;
            CattleCostingsSupplierLabel.Caption := SupplierLabel.Caption;

            BuyerLabel.Caption := 'All Buyers';
            if ( cbBuyer.Value <> '0' ) then
               BuyerLabel.Caption := cbBuyer.Text;
            NoFarmCostsBuyerLabel.Caption := BuyerLabel.Caption;
            NoFeedCostsBuyerLabel.Caption := BuyerLabel.Caption;
            CattleCostingsBuyerLabel.Caption := BuyerLabel.Caption;

            lSexType.Caption := 'All';
            if ( cbSex.Checked ) then
               begin
                  if rgSex.ItemIndex = 1 then
                     lSexType.Caption := 'Female';
                  if rgSex.ItemIndex = 0 then
                     lSexType.Caption := 'Male';
               end;
            lNoFarmCostsSexType.Caption := lSexType.Caption;
            lNoFeedCostsSexType.Caption := lSexType.Caption;
            lCattleCostingsSexType.Caption := lSexType.Caption;

            //   16/12/13 [V5.2 R7.1] /MK Change - Check radio group to see whether to show Buyer or Supplier.
            //   21/11/18 [V5.8 R4.7] /MK Bug Fix - Since new quickreports were added for Show Crush weigh and Hide Feed Costs, the supplier/buyer switch hasn't worked. 
            if ( rgShowSuppOrBuyer.ItemIndex = 0 ) then
               begin
                  qrlBuyerSupplier.Caption := 'Buyer';
                  Buyer_Supplier.DataField := 'Buyer';
               end
            else if ( rgShowSuppOrBuyer.ItemIndex = 1 ) then
               begin
                  qrlBuyerSupplier.Caption := 'Supplier';
                  Buyer_Supplier.DataField := 'Supplier';
               end;

            qrlBuyerSupplierNoFeed.Caption := qrlBuyerSupplier.Caption;
            Buyer_SupplierNoFeed.DataField := Buyer_Supplier.DataField;
            qrlBuyerSupplier.Caption := qrlBuyerSupplier.Caption;
            qrdbBuyer_SupplierCattleCostings.DataField := Buyer_Supplier.DataField;
            qrlBuyerSupplierCattleCostings.Caption := qrlBuyerSupplier.Caption;

            qrlNoFarmCostsBuyerSupplier.Caption := qrlBuyerSupplier.Caption;
            NoFarmCostsBuyer_Supplier.DataField := Buyer_Supplier.DataField;

            qrlHerdName.Caption := '';
            qrlHerdName.Caption := WinData.UserDefaultHerdName;
            qrlNoFarmCostsHerdName.Caption := qrlHerdName.Caption;
            qrlNoFeedCostsHerdName.Caption := qrlHerdName.Caption;
            qrlCattleCostsHerdName.Caption := qrlHerdName.Caption;

            if WinData.ExportToPDA then
               WinData.PDALinkExport.ExportReport( qrCattleMargins)
            else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
               begin
                  if ( pmiExtendedSuppBuyFields.Checked ) then
                     begin
                        NoFarmCostsTitleLabel.Font.Color := ClRed;
                        NoFarmCostsDetailBand.Font.Color := ClNavy;
                        qrNoFarmCost.Preview;
                     end
                  else if ( pmiIncludeCrushWeight.Checked ) then
                     begin
                        NoFeedCostsTitleLabel.Font.Color := ClRed;
                        NoFeedCostsTitleLabel.Font.Color := ClNavy;
                        qrNoFeedCosts.Preview;
                     end
                  else if ( pmiCattleCostings.Checked ) then
                     begin
                        CattleCostingsTitleLabel.Font.Color := ClRed;
                        CattleCostingsTitleLabel.Font.Color := ClNavy;
                        qrCattleCostings.Preview;
                     end
                  else
                     begin
                        TitleLabel.Font.Color := ClRed;
                        DetailBand.Font.Color := ClNavy;
                        qrCattleMargins.Preview;
                     end
               end
            else
               begin
                  if ( pmiExtendedSuppBuyFields.Checked ) then
                     begin
                        NoFarmCostsTitleLabel.Font.Color := ClBlack;
                        NoFarmCostsDetailBand.Font.Color := ClBlack;
                        WinData.CallPrintDialog(qrNoFarmCost);
                     end
                  else if ( pmiIncludeCrushWeight.Checked ) then
                     begin
                        NoFeedCostsTitleLabel.Font.Color := ClRed;
                        NoFeedCostsTitleLabel.Font.Color := ClNavy;
                        WinData.CallPrintDialog(qrNoFeedCosts);
                     end
                  else if ( pmiCattleCostings.Checked ) then
                     begin
                        CattleCostingsTitleLabel.Font.Color := ClRed;
                        CattleCostingsTitleLabel.Font.Color := ClNavy;
                        WinData.CallPrintDialog(qrCattleCostings);
                     end
                  else
                     begin
                        TitleLabel.Font.Color := ClBlack;
                        DetailBand.Font.Color := ClBlack;
                        WinData.CallPrintDialog(qrCattleMargins);
                     end;
               end;
         finally
            tSlghtAppliedFor.Close;
            MyTable.Close;
            MyTable.DeleteTable;
            MyTable.Free;
            qPremiums.Close;
            qHealth.Close;
            sbView.Enabled := True;  //SP enable buttons after View/Print
            sbPrint.Enabled := True;
         end;
      end;
   lWait.Hide;
   pbWait.Hide;
end;

procedure TfSalesRep.LoadOtherData;
var
   Curr,
   CalcDay,
   CalcMonth,
   CalcYear,
   Reten : String;
   OnFarm,
   OffFarm : TDateTime;
   tGrade : string;
   DrugCosts : Double;
   qCrushWeight : TQuery;
begin
   DrugCosts := 0;
   try
      qCrushWeight := TQuery.Create(nil);
      qCrushWeight.DatabaseName := AliasName;

      with MyTable do
         begin
            pbWait.Min := 1;
            if MyTable.RecordCount <> 0 then
               pbWait.Max := MyTable.RecordCount
            else
               pbWait.Max := 1;

            First;
            while NOT ( MyTable.EOF ) do
               try
                  //Application.Processmessages; //SP
                  Edit;
                  Count := Count + 1;

                  // Feed Costs
                  qFeed.Close;
                  qFeed.SQL.Clear;
                  qFeed.SQL.Add('SELECT *');
                  qFeed.SQL.Add('FROM FeedEvents FE');
                  qfeed.SQL.Add('WHERE (FE.AnimalID = '+MyTable.FieldByName('AnimalID').AsString+')');
                  qFeed.Open;
                  qFeed.First;
                  // changed 13/9/00 - kr
                  while ( not(qFeed.Eof) ) do
                     begin
                        if ( qFeed.fieldByName('EndDate').AsDateTime = 0 ) then
                           MyTable.FieldByName('FeedCosts').AsFloat := MyTable.FieldByName('FeedCosts').AsFloat +
                                                                       (qFeed.FieldByName('CostDay').AsFloat *
                                                                        (Date()- qFeed.FieldByName('AllocDate').AsDateTime))
                        else
                           MyTable.FieldByName('FeedCosts').AsFloat := MyTable.FieldByName('FeedCosts').AsFloat +
                                                                       (qFeed.FieldByName('CostDay').AsFloat *
                                                                        (qFeed.FieldByName('EndDate').AsDateTime -
                                                                         qFeed.FieldByName('AllocDate').AsDateTime));
                        qFeed.Next;
                     end;

                  // Other Costs

                  // include Veterinary Costs
                  qHealth.Close;
                  qHealth.SQL.Clear;
                  qHealth.SQL.Add('SELECT H.DrugUsed, H.RateApplic, H.NoDays, H.NoTimes');
                  qHealth.SQL.Add('FROM Health H');
                  qHealth.SQL.Add('LEFT JOIN Events E ON (H.EventID = E.ID)');
                  qHealth.SQL.Add('WHERE (E.AnimalID = '+IntToStr(MyTable.FieldByName('AnimalID').AsInteger)+')');
                  qHealth.Open;
                  qHealth.First;
                  while ( not(qHealth.Eof) ) do
                      begin
                         DrugCosts := 0;
                         DrugCosts := WinData.CalcDrugCost(qHealth.FieldByName('DrugUsed').AsInteger,qHealth.FieldByName('RateApplic').AsFloat,
                                                           qHealth.FieldByName('NoDays').AsInteger*qHealth.FieldByName('NoTimes').AsInteger);
                         MyTable.FieldByName('VetCosts').AsFloat := ( MyTable.FieldByName('VetCosts').AsFloat + DrugCosts );

                         qHealth.Next;
                      end;

                  // Crush Weight
                  qCrushWeight.Close;
                  qCrushWeight.SQL.Clear;
                  qCrushWeight.SQL.Add('SELECT E.EventDate, W.Weight');
                  qCrushWeight.SQL.Add('FROM Events E');
                  qCrushWeight.SQL.Add('LEFT JOIN Animals A ON (A.ID = E.AnimalID)');
                  qCrushWeight.SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
                  qCrushWeight.SQL.Add('WHERE E.EventType = :Weighing');
                  qCrushWeight.SQL.Add('AND   E.AnimalID = :AnimalID');
                  qCrushWeight.SQL.Add('AND   E.EventDate BETWEEN :PurchDate1 AND :PurchDate2');
                  qCrushWeight.SQL.Add('ORDER BY E.EventDate');
                  qCrushWeight.Params[0].AsInteger := CWeightEvent;
                  qCrushWeight.Params[1].AsInteger := MyTable.FieldByName('AnimalID').AsInteger;
                  qCrushWeight.Params[2].AsDateTime := MyTable.FieldByName('PurchDate').AsDateTime;

                  //   15/03/19 [V5.8 R8.0] /MK Change - Aoife (Bellingham) asked if this restriction of crush weights within 5 days could be changed to 14
                  //                                     to allow for a situation where if a supplier tells the buyer that the animal is purchased on a date
                  //                                     but the animal is not tranported to Bellingham for more than a week because the supplier is waiting
                  //                                     until they have a truck load of animals to move to Bellingham, Aoife said 14 days would cover this.

                  //   25/03/21 [V5.9 R9.6] /MK Change - Aoife (Bellingham) asked if the restriction of crush weights this could be increased
                  //                                     to 28 days as the lads in the yard are behind with tagging.
                  qCrushWeight.Params[3].AsDateTime := IncDay(MyTable.FieldByName('PurchDate').AsDateTime,28);

                  qCrushWeight.Open;
                  if ( qCrushWeight.RecordCount > 0 ) then
                     begin
                        qCrushWeight.First;
                        if ( qCrushWeight.FieldByName('Weight').AsFloat > 0 ) then
                           FieldByName('CrushWeight').AsFloat := qCrushWeight.FieldByName('Weight').AsFloat;
                     end;

                  if (MyTable.FieldByName('PurchDate').AsDateTime > 0) then
                     OnFarm := MyTable.FieldByName('PurchDate').AsDateTime
                  else if (MyTable.FieldByName('DateOfBirth').AsDateTime > 0) then
                     OnFarm := MyTable.FieldByName('DateOfBirth').AsDateTime;
                  if (MyTable.FieldByName('SaleDate').AsDateTime > 0) then
                     OffFarm := MyTable.FieldByName('SaleDate').AsDateTime
                  else
                     OffFarm := Now();

                  // sales calculations
                  if MyTable.FieldByName('SalePrice').AsFloat = 0 then
                     MyTable.FieldByName('PricePerKg').AsFloat := 0.00
                  else
                     begin
                        if MyTable.FieldByName('DeadWt').AsFloat = 0 then
                           MyTable.FieldByName('PricePerKg').AsFloat := 0.00
                        else
                           MyTable.FieldByName('PricePerKg').AsFloat := ( (MyTable.FieldByName('SalePrice').AsFloat)/
                                                                          (MyTable.FieldByName('DeadWt').AsFloat) );
                     end;

                  // calculate the remaining values
                  if ((MyTable.FieldByName('PurchDate').AsDateTime > 0) and (MyTable.FieldByName('SaleDate').AsDateTime = 0)) then
                     MyTable.FieldByName('DaysOnFarm').AsInteger := Trunc(Now() - MyTable.FieldByName('PurchDate').AsDateTime)
                  else if ((MyTable.FieldByName('PurchDate').AsDateTime > 0) and (MyTable.FieldByName('SaleDate').AsDateTime > 0)) then
                     MyTable.FieldByName('DaysOnFarm').AsInteger := Trunc(MyTable.FieldByName('SaleDate').AsDateTime - MyTable.FieldByName('PurchDate').AsDateTime)
                  else if ((MyTable.FieldByName('DateOfBirth').AsDateTime > 0) and (MyTable.FieldByName('SaleDate').AsDateTime > 0)) then
                     MyTable.FieldByName('DaysOnFarm').AsInteger := Trunc(MyTable.FieldByName('SaleDate').AsDateTime - MyTable.FieldByName('DateOfBirth').AsDateTime)
                  else if (MyTable.FieldByName('DateOfBirth').AsDateTime > 0) then
                     MyTable.FieldByName('DaysOnFarm').AsInteger := Trunc(Now() - MyTable.FieldByName('DateOfBirth').AsDateTime);

                  if MyTable.FieldByName('DaysOnFarm').AsInteger <> 0 then
                     begin
                        MyTable.FieldByName('AvDailyWtGain').AsFloat := 0;
                        if ( MyTable.FieldByName('LiveWt').AsFloat > 0 ) then
                           if MyTable.FieldByName('PurchEventID').AsInteger > 0 then
                              begin
                                 if ( pmiIncludeCrushWeight.Checked ) and ( MyTable.FieldByName('CrushWeight').AsFloat > 0 ) then
                                    MyTable.FieldByName('AvDailyWtGain').AsFloat := ((MyTable.FieldByName('LiveWt').AsFloat) - (MyTable.FieldByName('CrushWeight').AsFloat))/
                                                                                     (MyTable.FieldByName('DaysOnFarm').AsFloat)
                                 else
                                    MyTable.FieldByName('AvDailyWtGain').AsFloat := ((MyTable.FieldByName('LiveWt').AsFloat) - (MyTable.FieldByName('PurchWt').AsFloat))/
                                                                                     (MyTable.FieldByName('DaysOnFarm').AsFloat);
                              end
                           else
                              MyTable.FieldByName('AvDailyWtGain').AsFloat := ((MyTable.FieldByName('LiveWt').AsFloat) - (MyTable.FieldByName('BirthWt').AsFloat))/
                                                                               (MyTable.FieldByName('DaysOnFarm').AsFloat);
                     end;

                  // Fixed Costs Per Head Per Day  multiplied by num Days On Farm
                  if (( MyTable.FieldByName('HerdID').AsInteger > 0 ) and ( WinData.OwnerFile.Locate('ID', MyTable.FieldByName('HerdID').AsVariant, []) )) then
                     MyTable.FieldByName('OtherCosts').AsFloat := (WinData.OwnerFileFixedCosts.AsFloat * MyTable.FieldByName('DaysOnFarm').AsFloat);

                  if ( MyTable.FieldByName('DaysOnFarm').AsInteger <> 0 ) then
                     MyTable.FieldByName('FarmCostsPerDay').AsFloat := ((MyTable.FieldByName('FeedCosts').AsFloat) + (MyTable.FieldByName('VetCosts').AsFloat)+ (MyTable.FieldByName('OtherCosts').AsFloat))/
                                                                        (MyTable.FieldByName('DaysOnFarm').AsFloat);

                  MyTable.FieldByName('SaleCosts').AsFloat := (MyTable.FieldByName('CustomerCosts').AsFloat) + (MyTable.FieldByName('TotalDeductions').AsFloat);   //KVB
                  MyTable.FieldByName('NetSalePrice').AsFloat := (MyTable.FieldByName('SalePrice').AsFloat) - (MyTable.FieldByName('SaleCosts').AsFloat);   //KVB
                  MyTable.FieldByName('TotalIncome').AsFloat := (MyTable.FieldByName('SalePrice').AsFloat) + (MyTable.FieldByName('Premiums').AsFloat) + (MyTable.FieldByName('SlghtPrem').AsFloat);

                  MyTable.FieldByName('PurchCosts').AsFloat := MyTable.FieldByName('SupplierCosts').AsFloat + MyTable.FieldByName('BuyerCosts').AsFloat;
                  MyTable.FieldByName('TotalCosts').AsFloat := (MyTable.FieldByName('PurchPrice').AsFloat) + (MyTable.FieldByName('PurchCosts').AsFloat) +
                                                               (MyTable.FieldByName('FeedCosts').AsFloat) + (MyTable.FieldByName('VetCosts').AsFloat) + (MyTable.FieldByName('OtherCosts').AsFloat) +
                                                               (MyTable.FieldByName('SaleCosts').AsFloat);
                  if ( pmiCattleCostings.Checked ) then
                     begin
                        if ( MyTable.FieldByName('DeadWt').AsInteger <> 0 ) and ( MyTable.FieldByName('TotalCosts').AsFloat <> 0 ) then
                           MyTable.FieldByName('CostPerKgDeadWeight').AsFloat := (MyTable.FieldByName('TotalCosts').AsFloat)/(MyTable.FieldByName('DeadWt').AsFloat);
                     end
                  else
                     begin
                        MyTable.FieldByName('NetMargin').AsFloat := (MyTable.FieldByName('TotalIncome').AsFloat) - (MyTable.FieldByName('TotalCosts').AsFloat);
                        if MyTable.FieldByName('DaysOnFarm').AsInteger <> 0 then
                           MyTable.FieldByName('NetMarginPerDay').AsFloat := (MyTable.FieldByName('NetMargin').AsFloat)/(MyTable.FieldByName('DaysOnFarm').AsFloat);
                     end;

                  // Seperate the grade value into Grade / Weight
                  tGrade := StripAllSpaces(FieldByName('PGrade').AsString);
                  if tGrade <> '' then
                     begin
                        FieldByName('PGradeId').AsString := Copy(tGrade,1,1);
                        FieldByName('PGradeWgt').AsString := Copy(tGrade,2,14);
                     end;

                  tGrade := StripAllSpaces(FieldByName('SGrade').AsString);
                  if tGrade <> '' then
                     begin
                        FieldByName('SGradeId').AsString := Copy(tGrade,1,1);
                        FieldByName('SGradeWgt').AsString := Copy(tGrade,2,14);
                     end;

                  Post;

                  Next;

                  pbWait.StepIt;
                  Application.ProcessMessages;
                  Update;
               except
               end;
            pbWait.Position := pbWait.Max;
         end;
   finally
      if ( qCrushWeight <> nil ) then
         begin
            qCrushWeight.Close;
            qCrushWeight.Free;
         end;
   end;
end;

function TfSalesRep.HeiferCalc: Boolean;
var
   CalcYear,
   CalcMonth,
   CalcDay,
   ThirtyMonth : string;
begin
   RESULT := False;
   // check breed
   if WinData.Breeds.Locate('ID',WinData.AnimalFileByIDPrimaryBreed.AsInteger,[]) then
      if NOT WinData.Breeds.FieldByName('EligibleForPremium').AsBoolean then
         exit;
   // calculate age
   CalcDay   := Copy(FormatDateTime(cIrishDateStyle,MyTable.FieldByName('DateOfBirth').AsDateTime),1,2);
   CalcMonth := Copy(FormatDateTime(cIrishDateStyle,MyTable.FieldByName('DateOfBirth').AsDateTime),4,2);
   CalcYear  := Copy(FormatDateTime(cIrishDateStyle,MyTable.FieldByName('DateOfBirth').AsDateTime),7,4);
   if (CalcMonth = '01') or (CalcMonth = '02') then
      ThirtyMonth := (CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
   else if (CalcMonth = '04') or (CalcMonth = '06') then
      ThirtyMonth := (CalcDay+'/'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
   else if (CalcMonth = '03') then
      begin
         if (StrToInt(CalcDay)>30) then
            ThirtyMonth := ('30/0'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
         else
            ThirtyMonth := (CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2));
      end
   else if (CalcMonth = '05') then
      begin
         if (StrToInt(CalcDay)>30) then
            ThirtyMonth := ('30/'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2))
         else
            ThirtyMonth := (CalcDay+'/'+IntToStr(StrToInt(CalcMonth)+6)+'/'+IntToStr(StrToInt(CalcYear)+2));
      end
   else if (CalcMonth = '07') or (CalcMonth = '09') or (CalcMonth = '11') then
      ThirtyMonth := (CalcDay+'/'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3))
   else if (CalcMonth = '08') and (StrToInt(CalcDay)>28) then
      begin
         if (((StrToInt(CalcYear)-1) MOD 4)=0) then
            ThirtyMonth := ('29/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3))
         else
            ThirtyMonth := ('28/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3));
      end
   else
      begin
         if (StrToInt(CalcDay)>30) then
            ThirtyMonth := ('30/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3))
         else
            ThirtyMonth := (CalcDay+'/0'+IntToStr(StrToInt(CalcMonth)-6)+'/'+IntToStr(StrToInt(CalcYear)+3));
      end;
   // check if eligible
   if (MyTable.FieldByName('SaleDate').AsDateTime > 0) then
      if (StrToDate(ThirtyMonth) >= MyTable.FieldByName('SaleDate').AsDateTime) then
         RESULT := True;
end;

procedure TfSalesRep.FormShow(Sender: TObject);
begin
   HerdCombo.Value   := IntToStr(WinData.UserDefaultHerdID);
   LoadScreenDefaults;

   //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cCattleMargRep);
   WinData.UpdateRecentReportUsage(cCattleMargRep);
end;

procedure TfSalesRep.cbSalesClick(Sender: TObject);
begin
   if cbSales.Checked then
      begin
         FromDate.Text := '  /  /    ';
         ToDate.Text := '  /  /    ';
         pSaleDates.Show;
      end
   else
      pSaleDates.Hide;
   cbIncludeDeadAnimals.Visible := ( not(cbSales.Checked) );
end;

procedure TfSalesRep.cbPurchClick(Sender: TObject);
begin
   if cbPurch.Checked then
      begin
         FromPurchDate.Text := '  /  /    ';
         ToPurchDate.Text := '  /  /    ';
         pPurchaseDates.Show;
      end
   else
      pPurchaseDates.Hide;
end;

procedure TfSalesRep.cbSexClick(Sender: TObject);
begin
   if cbSex.Checked then
      rgSex.Show
   else
      begin
         rgSex.Hide;
         rgSex.ItemIndex := -1;
      end;
end;

procedure TfSalesRep.sbHelpClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.HTMLHelp('CattleMargins.htm');
end;

procedure TfSalesRep.cbUseFilterClick(Sender: TObject);
begin
   if ( cbUseFilter.Checked ) then
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

procedure TfSalesRep.SaleDate1Print(sender: TObject; var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
      Value := '';
end;

procedure TfSalesRep.SortNatIDByCheckDigit;
begin
   with MyTable do
      begin
         First;
         while not eof do
            begin
               Application.ProcessMessages;
               Edit;
               FieldByName('SortNatID').AsString := WinData.SortByCheckDigit(MyTable.FieldByName('NatID').AsString);
               Post;
               Next;
            end;
      end;
end;

procedure TfSalesRep.LoadScreenDefaults;
begin
   CattleMarginsDefaults := TCattleMarginsDefaults.Create(cRD_CattleMargins);
   try
      try
         cbSupplier.Value := IntToStr( CattleMarginsDefaults.Supplier );
      except
      end;
      try
         cbBuyer.Value := IntToStr( CattleMarginsDefaults.Buyer );
      except
      end;
      try
         cbCustomer.Value := IntToStr( CattleMarginsDefaults.Customer );
      except
      end;
      cbSex.Checked := CattleMarginsDefaults.ListBySex;
      cbSales.Checked := CattleMarginsDefaults.SoldAnimalsOnly;
      cbPurch.Checked := CattleMarginsDefaults.PurchAnimalsOnly;
      gSortBy.ItemIndex := CattleMarginsDefaults.SortField;
      gOrder.ItemIndex := CattleMarginsDefaults.SortOrder;
      rgSex.ItemIndex := CattleMarginsDefaults.Sex;
      ToDate.Date := Date;
      if ( CattleMarginsDefaults.SaleInterval > 0 ) then
         FromDate.Date := Trunc(Date - CattleMarginsDefaults.SaleInterval);
      ToPurchDate.Date := Date;
      if ( CattleMarginsDefaults.PurchaseInterval > 0 ) then
         FromPurchDate.Date := Trunc(ToPurchDate.Date - CattleMarginsDefaults.PurchaseInterval);
   finally
      FreeAndNil(CattleMarginsDefaults);
   end;
end;

procedure TfSalesRep.SaveScreenDefaults;
begin
   CattleMarginsDefaults := TCattleMarginsDefaults.Create(cRD_CattleMargins);
   try
      try
         CattleMarginsDefaults.Supplier := StrToInt(cbSupplier.Value);
      except
      end;
      try
         CattleMarginsDefaults.Buyer := StrToInt(cbBuyer.Value);
      except
      end;
      try
         CattleMarginsDefaults.Customer := StrToInt(cbCustomer.Value);
      except
      end;
      CattleMarginsDefaults.ListBySex := cbSex.Checked;
      CattleMarginsDefaults.SoldAnimalsOnly := cbSales.Checked;
      CattleMarginsDefaults.PurchAnimalsOnly := cbPurch.Checked;
      CattleMarginsDefaults.SortField := gSortBy.ItemIndex;
      CattleMarginsDefaults.SortOrder := gOrder.ItemIndex;
      CattleMarginsDefaults.Sex := rgSex.ItemIndex;
      if ( ToDate.Date > 0 ) and (FromDate.Date > 0 ) then
         CattleMarginsDefaults.SaleInterval := Trunc(ToDate.Date - FromDate.Date);
      if ( ToPurchDate.Date > 0 ) and (FromPurchDate.Date > 0 ) then
         CattleMarginsDefaults.PurchaseInterval := Trunc(ToPurchDate.Date - FromPurchDate.Date);
   finally
      FreeAndNil(CattleMarginsDefaults);
   end;
end;

procedure TfSalesRep.FormDestroy(Sender: TObject);
begin
   SaveScreenDefaults;
   WinData.cxHint.HideHint;
end;

procedure TfSalesRep.QRDBText3Print(sender: TObject; var Value: String);
begin
   if Value = cSex_Female then
      Value := 'F'
   else if Value = cSex_Bull then
      Value := 'B'
   else if Value = cSex_Steer then
      Value := 'S'
end;

procedure TfSalesRep.SetupSaleGrades;
var
   tGrade : string;
   i : Integer;
   GradesIds, GradeWgts : TStringList;
begin
   ccbSaleGrades.Properties.Items.Clear;
   ccbSaleWeights.Properties.Items.Clear;
   GradesIds := TStringList.Create;
   GradeWgts := TStringList.Create;
   try
   with TQuery.Create(nil) do
      try
         DatabaseName := Aliasname;
         SQL.Text := 'Select Distinct( UPPER(Grade)) Grade From SalesDeaths';
         Open;

         First;
         while not eof do
            begin
               tGrade := StripAllSpaces(FieldByName('Grade').AsString);
               if tGrade <> '' then
                  begin
                     if GradesIds.IndexOf( Copy(tGrade,1,1) ) = -1 then
                        GradesIds.Add( Copy(tGrade,1,1) );

                     if GradeWgts.IndexOf( Copy(tGrade,2,14) ) = -1 then
                        GradeWgts.Add( Copy(tGrade,2,14) );
                  end;
               Next;
            end;

         for i := 0 to GradesIds.Count-1 do
            begin
              ccbSaleGrades.Properties.Items.AddCheckItem(GradesIds.Strings[i]);
              ccbSaleGrades.States[ccbSaleGrades.Properties.Items.Count-1] := cbsUnchecked;
            end;

         for i := 0 to GradeWgts.Count-1 do
            begin
               ccbSaleWeights.Properties.Items.AddCheckItem(GradeWgts.Strings[i]);
               ccbSaleWeights.States[ccbSaleWeights.Properties.Items.Count-1] := cbsUnchecked;
            end;
      finally
         Free;
      end;
   finally
      FreeAndNil(GradesIds);
      FreeAndNil(GradeWgts);
   end;
end;

function TfSalesRep.GetSaleGrades: string;
var
   i : Integer;
begin
   Result := '';
   for i := 0 to ccbSaleGrades.Properties.Items.Count-1 do
      if ccbSaleGrades.states[i] = cbsChecked then
         begin
            if Result <> '' then
               Result := Result + ',"'+ccbSaleGrades.Properties.Items.Items[i].Description+'"'
            else
               Result := '"'+ccbSaleGrades.Properties.Items.Items[i].Description+'"'
         end;


   if Result <> '' then
      Result := '('+Result+')';
end;

function TfSalesRep.GetSaleWeights: string;
var
   i : Integer;
begin
   Result := '';
   for i := 0 to ccbSaleWeights.Properties.Items.Count-1 do
      if ccbSaleWeights.states[i] = cbsChecked then
         begin
            if Result <> '' then
               Result := Result + ',"'+ccbSaleWeights.Properties.Items.Items[i].Description+'"'
            else
               Result := '"'+ccbSaleWeights.Properties.Items.Items[i].Description+'"'
         end;

   if Result <> '' then
      Result := '('+Result+')';

end;

procedure TfSalesRep.cbFilterBySaleGradeClick(Sender: TObject);
begin
   ccbSaleGrades.Enabled := cbFilterBySaleGrade.Checked;
   ccbSaleWeights.Enabled := cbFilterBySaleGrade.Checked;
end;

procedure TfSalesRep.Customer1Print(sender: TObject; var Value: String);
begin
   Value := Copy(Value,1,8);
end;

procedure TfSalesRep.PurchPrice1Print(sender: TObject; var Value: String);
begin
   {
   if ( pmiExtendedSuppBuyFields.Checked ) then
      Value := Copy(Value,1,8);
   }
end;

procedure TfSalesRep.FormActivate(Sender: TObject);
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
   pmiIncludeCrushWeight.Checked := ( Def.Definition.dUseCrush ) and ( not(WinData.GlobalSettings.UpdateMartWeightWithCrushWeight) );
   pmiCattleCostings.Checked := WinData.GlobalSettings.UsePurchaseWeightAsLiveWeightForKillOut;
   OnActivate := nil;
end;

procedure TfSalesRep.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfSalesRep.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cCattleMargRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cCattleMargRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfSalesRep.QRExpr116Print(sender: TObject; var Value: String);
var
   fTempFloat : Double;
begin
   if ( Length(Value) > 0 ) then
      begin
         fTempFloat := StrToFloat(Value);
         Value := FormatFloat('0.00',fTempFloat);
      end;
end;

procedure TfSalesRep.btnOptionsClick(Sender: TObject);
var
   pt : tPoint;
begin
   WinData.cxHint.HideHint;
   GetCursorPos(pt);
   pmIncludeOptions.Popup(pt.x,pt.y);
end;

procedure TfSalesRep.pmiExtendedSuppBuyFieldsClick(Sender: TObject);
begin
   pmiExtendedSuppBuyFields.Checked := ( not(pmiExtendedSuppBuyFields.Checked) );
   pmiIncludeCrushWeight.Checked := False;
   pmiCattleCostings.Checked := False;
   Caption := cCattleMargins;
   if ( pmiExtendedSuppBuyFields.Checked ) then
      Caption := Caption + ' with Extended '+
                 rgShowSuppOrBuyer.Properties.Items[rgShowSuppOrBuyer.ItemIndex].Caption+
                 ' columns';
end;

procedure TfSalesRep.pmiIncludeCrushWeightClick(Sender: TObject);
begin
   pmiIncludeCrushWeight.Checked := ( not(pmiIncludeCrushWeight.Checked) );
   pmiExtendedSuppBuyFields.Checked := False;
   pmiCattleCostings.Checked := False;
   Caption := cCattleMargins;
   if ( pmiIncludeCrushWeight.Checked ) then
      Caption := Caption+' with Crush Weight';
end;

procedure TfSalesRep.pmIncludeOptionsPopup(Sender: TObject);
begin
   pmiExtendedSuppBuyFields.Caption := 'Show Extended '+
                                       rgShowSuppOrBuyer.Properties.Items[rgShowSuppOrBuyer.ItemIndex].Caption+
                                       ' columns (Hide Farm Costs)';
end;

procedure TfSalesRep.pmiCattleCostingsClick(Sender: TObject);
begin
   pmiCattleCostings.Checked := ( not(pmiCattleCostings.Checked) );
   pmiExtendedSuppBuyFields.Checked := False;
   pmiIncludeCrushWeight.Checked := False;
   Caption := 'Cattle Costings';
end;

end.
