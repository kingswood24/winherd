{
   SP 21/11/2002:- 3611

   Fertility History SubDetail band, the Dataset was missing from the band,
   leaving one record to be printed out. Now set correctly.

   Calf Performance same as above.

   Captions realigned on both Health SubDetail bands.

   SP 21/11/2002. 3611

   15/01/11 [V4.0 R7.6] /MK Additional Feature - Added ElectronicID, Pedigree to Bull and Female QReports.
                                               - Added HeaderBand to qrFemale and added labels from TitleBand to this HeaderBand.
                                               - Added Cummulative and 305 Solids to qrFemale2.

   26/04/11 [V4.0 R9.8] /MK Additional Feature - Program Now Allows The User To Select Which Sections To Print on Each QReport
                                                 Depending On The Animal Sex.

   12/09/13 [V5.2 R1.2] /MK Additional Feature - AnimalPrint - qrSteer - Added Feed Events section and Feed Events select button.
                                                                         Only visible if Beef Herd and Beef Management module.

   08/11/17 [V5.7 R4.4] /MK Additional Feature - Added Milk and Meat Withdrawal to the health section in all reports - TGM/Red Tractor.
                            Bug Fix - Made some bug fixes to stop sections of the reports showing where the tick check box wasn't ticked.                                                
}

unit AnimalPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport, cxCheckBox, ActnList, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxBarExtItems, dxBar;

type
  TfmAnimalPrint = class(TForm)
    qrFemale: TQuickRep;
    qrPedigreeFemale: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    qrAnimalFemale: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lHerdID: TQRLabel;
    lAnimalNo: TQRLabel;
    lNatIDNum: TQRLabel;
    lDOB: TQRLabel;
    lBreed: TQRLabel;
    lSex: TQRLabel;
    lColour: TQRLabel;
    lTBTestDate: TQRLabel;
    lBTestDate: TQRLabel;
    lBirthWeight: TQRLabel;
    lAName: TQRLabel;
    LCurrentLact: TQRLabel;
    lHBNumber: TQRLabel;
    lSire: TQRLabel;
    lDamRecip: TQRLabel;
    lGenDonor: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    lBreeding: TQRLabel;
    lPedigree: TQRLabel;
    QRShape3: TQRShape;
    qrCurrFertLactSumFemale: TQRBand;
    lPDateWeaned: TQRLabel;
    lCDateWeaned: TQRLabel;
    Weaned: TQRLabel;
    lDaysSuckling: TQRLabel;
    lPDaysSuck: TQRLabel;
    lCDaysSuck: TQRLabel;
    lPTotalY: TQRLabel;
    lP305DayY: TQRLabel;
    lPProt: TQRLabel;
    lPBFat: TQRLabel;
    lPLastTestRec: TQRLabel;
    lPDaysInMilk: TQRLabel;
    lCTotalY: TQRLabel;
    lC305DayY: TQRLabel;
    lCProt: TQRLabel;
    lCBFat: TQRLabel;
    lCLastTestRec: TQRLabel;
    lCDaysInMilk: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    lPCalvIndex: TQRLabel;
    lPDateDry: TQRLabel;
    lPNoServes: TQRLabel;
    lPBType: TQRLabel;
    lPCType: TQRLabel;
    lPCalvDate: TQRLabel;
    lCDateDry: TQRLabel;
    lCCalvIndex: TQRLabel;
    lCNoServes: TQRLabel;
    lCBType: TQRLabel;
    lCCType: TQRLabel;
    lCCDate: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel27: TQRLabel;
    lDateDry: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape5: TQRShape;
    lProjCavDate: TQRLabel;
    LCavDate: TQRLabel;
    lPregnant: TQRLabel;
    lDaysFromLastService: TQRLabel;
    lTotServices: TQRLabel;
    lPlannedBull: TQRLabel;
    lTotBullings: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    lServices: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape31: TQRShape;
    lSServeType5: TQRLabel;
    lSServeType4: TQRLabel;
    lSServeType3: TQRLabel;
    lSServeType2: TQRLabel;
    lSServeType1: TQRLabel;
    lSBullUsed5: TQRLabel;
    lSBullUsed4: TQRLabel;
    lSBullUsed3: TQRLabel;
    lSBullUsed2: TQRLabel;
    lSBullUsed1: TQRLabel;
    lSint5: TQRLabel;
    lSint4: TQRLabel;
    lSint3: TQRLabel;
    lSNo4: TQRLabel;
    lSNo5: TQRLabel;
    lSerDate1: TQRLabel;
    lSerDate4: TQRLabel;
    lSerDate3: TQRLabel;
    lSint1: TQRLabel;
    lSerDate5: TQRLabel;
    lSNo3: TQRLabel;
    lSint2: TQRLabel;
    lSerDate2: TQRLabel;
    lSNo2: TQRLabel;
    lSNo1: TQRLabel;
    lInt5: TQRLabel;
    lInt4: TQRLabel;
    lInt3: TQRLabel;
    lInt2: TQRLabel;
    lInt1: TQRLabel;
    lBullDate5: TQRLabel;
    lBullDate4: TQRLabel;
    lBullDate3: TQRLabel;
    lBullDate2: TQRLabel;
    lBullDate1: TQRLabel;
    lNo5: TQRLabel;
    lNo4: TQRLabel;
    lNo3: TQRLabel;
    lNo2: TQRLabel;
    lNo1: TQRLabel;
    QRBand1: TQRBand;
    QRLabel57: TQRLabel;
    VerNoLabel2: TQRLabel;
    qrSteer: TQuickRep;
    qrHealthDetailsSteer: TQRSubDetail;
    qrHealthDetailsFemale: TQRSubDetail;
    qrFertHistDetail: TQRSubDetail;
    qrAnimalSteer: TQRBand;
    QRLabel227: TQRLabel;
    QRLabel228: TQRLabel;
    QRLabel229: TQRLabel;
    QRLabel230: TQRLabel;
    QRLabel231: TQRLabel;
    QRLabel232: TQRLabel;
    QRLabel233: TQRLabel;
    QRLabel234: TQRLabel;
    QRLabel235: TQRLabel;
    QRLabel236: TQRLabel;
    QRLabel238: TQRLabel;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRLabel241: TQRLabel;
    QRLabel242: TQRLabel;
    lHerdID3: TQRLabel;
    lAnimalNo3: TQRLabel;
    lNatIDNum3: TQRLabel;
    lDOB3: TQRLabel;
    lBreed3: TQRLabel;
    lSex3: TQRLabel;
    lColour3: TQRLabel;
    lTBTestDate3: TQRLabel;
    lBTestDate3: TQRLabel;
    lBirthWeight3: TQRLabel;
    lAName3: TQRLabel;
    lHBNumber3: TQRLabel;
    lSire3: TQRLabel;
    lDamRecip3: TQRLabel;
    lGenDonor3: TQRLabel;
    QRLabel260: TQRLabel;
    lInHerd3: TQRLabel;
    QRShape26: TQRShape;
    QRBand5: TQRBand;
    QRLabel163: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape27: TQRShape;
    GroupHeaderBand1: TQRBand;
    QRLabel219: TQRLabel;
    QRShape25: TQRShape;
    QRBand2: TQRBand;
    QRLabel58: TQRLabel;
    VerNoLabel3: TQRLabel;
    qrFemale2: TQuickRep;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    lDailyWtGainC1: TQRLabel;
    lDailyWtGainC2: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    qrFertHist: TQRBand;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRShape8: TQRShape;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRShape9: TQRShape;
    QRLabel144: TQRLabel;
    QRShape10: TQRShape;
    qrCalPerForm: TQRBand;
    qrCalPerFormDetail: TQRSubDetail;
    qrMilkHistDetails: TQRSubDetail;
    QRLabel56: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRShape2: TQRShape;
    qrHealthFemale: TQRBand;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRShape7: TQRShape;
    qrMilkHist: TQRBand;
    QRLabel69: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRShape6: TQRShape;
    QRBand11: TQRBand;
    QRLabel162: TQRLabel;
    QRSysData4: TQRSysData;
    QRShape4: TQRShape;
    QRLabel70: TQRLabel;
    lGrade: TQRLabel;
    lScore: TQRLabel;
    lEBI: TQRLabel;
    LPIN: TQRLabel;
    lPLI: TQRLabel;
    lPedFamilyName: TQRLabel;
    lPedComments: TQRLabel;
    QRShape33: TQRShape;
    lPGrade: TQRLabel;
    lPScore: TQRLabel;
    lPEBI: TQRLabel;
    lPPIN: TQRLabel;
    lPPLI: TQRLabel;
    lFamilyName: TQRLabel;
    qrRichText: TQRRichText;
    GroupFooterBand3: TQRBand;
    GroupFooterBand4: TQRBand;
    GroupFooterBand5: TQRBand;
    GroupFooterBand6: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel55: TQRLabel;
    VerNoLabel4: TQRLabel;
    lAgeDaysC2: TQRLabel;
    lAgeDaysC1: TQRLabel;
    BullCard: TQuickRep;
    PageHeaderBand2: TQRBand;
    PageFooterBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel60: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    GroupHeaderBand2: TQRBand;
    QRLabel166: TQRLabel;
    QRShape28: TQRShape;
    BeefPed: TQRBand;
    QRLabel75: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    lStrawsWasted: TQRLabel;
    lPricePerStraw: TQRLabel;
    lSemenStock: TQRLabel;
    lStrawsAdded: TQRLabel;
    lInUse: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    lSProtPerc: TQRLabel;
    lSProtkgs: TQRLabel;
    lFatPerc: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    relia: TQRLabel;
    QRLabel94: TQRLabel;
    lFatkgs: TQRLabel;
    lCavDiff: TQRLabel;
    lReliability: TQRLabel;
    lMilkPeddDiff: TQRLabel;
    QRLabel83: TQRLabel;
    lSEBI: TQRLabel;
    endtraits: TQRShape;
    QRLabel165: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel217: TQRLabel;
    QRLabel218: TQRLabel;
    QRLabel243: TQRLabel;
    QRLabel244: TQRLabel;
    lPGrade2: TQRLabel;
    lPScore2: TQRLabel;
    lPEBI2: TQRLabel;
    lPPIN2: TQRLabel;
    lPPLI2: TQRLabel;
    qrPMemo2: TQRMemo;
    lFamilyName2: TQRLabel;
    QRLabel59: TQRLabel;
    VerNoLabel: TQRLabel;
    QRShape13: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    lMUS: TQRLabel;
    lSKE: TQRLabel;
    LFUN: TQRLabel;
    LDOC: TQRLabel;
    LREL: TQRLabel;
    lBRE: TQRLabel;
    LWWT: TQRLabel;
    LYWT: TQRLabel;
    LRELPERC: TQRLabel;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    qrGroupName: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    EndPed: TQRShape;
    QRLabel42: TQRLabel;
    lInHerd: TQRLabel;
    QRLabel62: TQRLabel;
    lElectronicID: TQRLabel;
    qrAnimalBullBand: TQRBand;
    QRLabel302: TQRLabel;
    QRLabel303: TQRLabel;
    QRLabel304: TQRLabel;
    QRLabel305: TQRLabel;
    QRLabel306: TQRLabel;
    QRLabel307: TQRLabel;
    QRLabel308: TQRLabel;
    QRLabel309: TQRLabel;
    QRLabel310: TQRLabel;
    QRLabel311: TQRLabel;
    QRLabel312: TQRLabel;
    QRLabel313: TQRLabel;
    QRLabel314: TQRLabel;
    QRLabel315: TQRLabel;
    QRLabel316: TQRLabel;
    QRLabel317: TQRLabel;
    lHerdID2: TQRLabel;
    lAnimalNo2: TQRLabel;
    lNatIDNum2: TQRLabel;
    lDOB2: TQRLabel;
    lBreed2: TQRLabel;
    lSex2: TQRLabel;
    lColour2: TQRLabel;
    lTBTestDate2: TQRLabel;
    lBTestDate2: TQRLabel;
    lBirthWeight2: TQRLabel;
    lAName2: TQRLabel;
    LCurrentLact2: TQRLabel;
    lHBNumber2: TQRLabel;
    lSire2: TQRLabel;
    lDamRecip2: TQRLabel;
    lGenDonor2: TQRLabel;
    QRLabel334: TQRLabel;
    QRLabel335: TQRLabel;
    lBreeding2: TQRLabel;
    lPedigree2: TQRLabel;
    QRLabel26: TQRLabel;
    lInHerd2: TQRLabel;
    QRLabel95: TQRLabel;
    lElectronicID2: TQRLabel;
    QRLabel61: TQRLabel;
    qrdb305Solids: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel64: TQRLabel;
    lElectronicID3: TQRLabel;
    QRLabel66: TQRLabel;
    lPedigree3: TQRLabel;
    dxBarManager1: TdxBarManager;
    dxblbExit: TdxBarLargeButton;
    dxblbPreview: TdxBarLargeButton;
    dxblbPrint: TdxBarLargeButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    pHerdId: TPanel;
    HerdCombo: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    ActionList1: TActionList;
    actExit: TAction;
    actPreview: TAction;
    actPrint: TAction;
    pPrintOptions: TPanel;
    cbHealth: TcxCheckBox;
    cbSemenStocks: TcxCheckBox;
    cbCurrLactSummary: TcxCheckBox;
    cbFertilityHistory: TcxCheckBox;
    cbPedigree: TcxCheckBox;
    cbDairy: TcxCheckBox;
    cbCurrentFertility: TcxCheckBox;
    cbCalfPerformance: TcxCheckBox;
    cbMilkHistory: TcxCheckBox;
    lPrintOptions: TcxLabel;
    lQualityAssuredTxt: TQRLabel;
    lQualityAssured: TQRLabel;
    lQualityAssured1: TQRLabel;
    lQualityAssuredTxt1: TQRLabel;
    lQualityAssured2: TQRLabel;
    lQualityAssuredTxt2: TQRLabel;
    cbFeedEvents: TcxCheckBox;
    FeedEventsDetail: TQRSubDetail;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    GroupFooterBand1: TQRBand;
    FeedEventsHeader: TQRBand;
    QRLabel72: TQRLabel;
    QRShape15: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRShape14: TQRShape;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel145: TQRLabel;
    QRShape16: TQRShape;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    procedure lAgeDaysC1Print(sender: TObject; var Value: String);
    procedure BeefPedBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrCalPerFormDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lDateDryPrint(sender: TObject; var Value: String);
    procedure qrCurrFertLactSumFemaleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lPTotalYPrint(sender: TObject; var Value: String);
    procedure qrPedigreeFemaleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure actExitExecute(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HerdComboPropertiesChange(Sender: TObject);
    procedure PrintQualityAssuredLabels(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure OnDatePrint(Sender: TObject; var Value: String);
  private
    procedure HideCurrLactSummary (AVisible : Boolean);
    procedure HideCurrentFertility (AVisible : Boolean);
    procedure MoveCurrLactSummaryUp;
    procedure MoveCurrLactSummaryDown;
    procedure DisableSemenStock (AVisible : Boolean);
    procedure DisableDairySection (AVisible : Boolean);
    procedure DisablePedigreeSection (AVisible : Boolean);
    procedure MoveDairySectionRight;
    procedure MoveDairySectionLeft;
    procedure MovePedigreeSectionUp;
    procedure MovePedigreeSectionDown;
    procedure PreviewOrPrint(APreview: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAnimalPrint: TfmAnimalPrint;

implementation
uses
   SetUpAnimals, DairyData, Def, GenTypesConst, MenuUnit;
{$R *.DFM}

procedure TfmAnimalPrint.lAgeDaysC1Print(sender: TObject;
  var Value: String);
begin
   if value = (sender as Tqrlabel).Name then
      value := '';
end;

procedure TfmAnimalPrint.BeefPedBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Sender.Height := 0;
   if ( (UpperCase(fSetUpAnimals.ThisHerdType) = 'DAIRY') and (DEF.Definition.dUsePedigree)
        and ( cbPedigree.Checked ) ) then
      begin
         QRLabel165.Enabled := True;
         QRLabel243.Enabled := True;
         QRLabel214.Enabled := True;
         QRLabel215.Enabled := True;
         QRLabel216.Enabled := True;
         QRLabel217.Enabled := True;
         QRLabel218.Enabled := True;
         QRLabel244.Enabled := True;
         lPGrade2.Enabled := True;
         lPScore2.Enabled := True;
         lPEBI2.Enabled := True;
         lPPIN2.Enabled := True;
         lPPLI2.Enabled := True;
         qrPMemo2.Enabled := True;
         lFamilyName2.Enabled := True;
         EndPed.Enabled := True;
         Sender.Height := 323;
      end
   else
      begin
         QRLabel165.Enabled := False;
         QRLabel243.Enabled := False;
         QRLabel214.Enabled := False;
         QRLabel215.Enabled := False;
         QRLabel216.Enabled := False;
         QRLabel217.Enabled := False;
         QRLabel218.Enabled := False;
         QRLabel244.Enabled := False;
         lPGrade2.Enabled := False;
         lPScore2.Enabled := False;
         lPEBI2.Enabled := False;
         lPPIN2.Enabled := False;
         lPPLI2.Enabled := False;
         qrPMemo2.Enabled := False;
         lFamilyName2.Enabled := False;
         EndPed.Enabled := False;
         Sender.Height := 140;
      end;
end;

procedure TfmAnimalPrint.qrCalPerFormDetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if ( fSetUpAnimals.ThisHerdType = cSucklerHerd ) then
      begin
         if Trim((Sender as TQRSubDetail).Dataset.FieldByName('A2Sex').AsString) = '' then
            Sender.Height := 20
         else
            Sender.Height := 40
      end;
end;

procedure TfmAnimalPrint.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := False;
   if ( fSetUpAnimals <> nil ) then
      PrintBand := ((Def.Definition.dUsePedigree) and ( fSetUpAnimals.ThisHerdType = cSucklerHerd ) and (WinData.AnimalFileByIDBreeding.AsBoolean));
end;

procedure TfmAnimalPrint.lDateDryPrint(sender: TObject;
  var Value: String);
begin
   if ( ( fSetUpAnimals.ThisHerdType = cSucklerHerd ) and ( lDateDry.Enabled ) ) then
      Value := ''
end;

procedure TfmAnimalPrint.qrCurrFertLactSumFemaleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if ( fSetUpAnimals.ThisHerdType = cSucklerHerd ) then
      begin
         Weaned.Top := 208;
         lCDateWeaned.Top := 208;
         lPDateWeaned.Top := 208;
         Weaned.Enabled := True;
         lCDateWeaned.Enabled := True;
         lPDateWeaned.Enabled := True;
         Weaned.Visible := True;
         lCDateWeaned.Visible := True;
         lPDateWeaned.Visible := True;
         lDateDry.Enabled := False;
         lCDateDry.Enabled := False;
         lPDateDry.Enabled := False;
         lDateDry.Visible := False;
         lCDateDry.Visible := False;
         lPDateDry.Visible := False;

         if cbCurrLactSummary.Checked then
            begin
               lDaysSuckling.Top := 83;
               lCDaysSuck.Top := 83;
               lPDaysSuck.Top := 83;
               lDaysSuckling.Enabled := True;
               lCDaysSuck.Enabled := True;
               lPDaysSuck.Enabled := True;
               lDaysSuckling.Visible := True;
               lCDaysSuck.Visible := True;
               lPDaysSuck.Visible := True;
            end;
      end
   else
      begin
         lDateDry.Top := 208;
         lCDateDry.Top := 208;
         lPDateDry.Top := 208;

         Weaned.Enabled := False;
         lCDateWeaned.Enabled := False;
         lPDateWeaned.Enabled := False;
         Weaned.Visible := False;
         lCDateWeaned.Visible := False;
         lPDateWeaned.Visible := False;

         if cbCurrLactSummary.Checked then
            begin
               lDateDry.Enabled := True;
               lCDateDry.Enabled := True;
               lPDateDry.Enabled := True;
               lDateDry.Visible := True;
               lCDateDry.Visible := True;
               lPDateDry.Visible := True;
            end;

         lDaysSuckling.Enabled := False;
         lCDaysSuck.Enabled := False;
         lPDaysSuck.Enabled := False;
         lDaysSuckling.Visible := False;
         lCDaysSuck.Visible := False;
         lPDaysSuck.Visible := False;
      end;
end;

procedure TfmAnimalPrint.lPTotalYPrint(sender: TObject; var Value: String);
begin
   if ( ( fSetUpAnimals.ThisHerdType = cSucklerHerd ) and ( cbCurrLactSummary.Checked ) ) or
      ( not(cbCurrLactSummary.Checked) ) then
      Value := '';
end;

procedure TfmAnimalPrint.qrPedigreeFemaleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( fSetUpAnimals.ThisHerdType = cSucklerHerd ) then
      begin
         lGrade.Enabled := False;
         lScore.Enabled := False;
         lPGrade.Enabled := False;
         lPScore.Enabled := False;
         lEBI.Enabled := False;
         lPEBI.Enabled := False;
         LPIN.Enabled := False;
         lPPIN.Enabled := False;
         lPLI.Enabled := False;
         lPPLI.Enabled := False;
         lFamilyName.Enabled := False;
         qrRichText.Enabled := False;

         lGrade.Visible := False;
         lScore.Visible := False;
         lPGrade.Visible := False;
         lPScore.Visible := False;
         lEBI.Visible := False;
         lPEBI.Visible := False;
         LPIN.Visible := False;
         lPPIN.Visible := False;
         lPLI.Visible := False;
         lPPLI.Visible := False;
         lFamilyName.Visible := False;
         qrRichText.Visible := False;


         lMUS.Enabled := True;
         lSKE.Enabled := True;
         lBRE.Enabled := True;
         QRDBText47.Enabled := True;
         QRDBText48.Enabled := True;
         QRDBText49.Enabled := True;
         LFUN.Enabled := True;
         LDOC.Enabled := True;
         LREL.Enabled := True;
         QRDBText50.Enabled := True;
         QRDBText51.Enabled := True;
         QRDBText52.Enabled := True;
         LWWT.Enabled := True;
         LYWT.Enabled := True;
         LRELPERC.Enabled := True;
         QRDBText53.Enabled := True;
         QRDBText54.Enabled := True;
         QRDBText55.Enabled := True;
         qrGroupName.Enabled := True;
         QRDBRichText1.Enabled := True;

         lMUS.Visible := True;
         lSKE.Visible := True;
         lBRE.Visible := True;
         QRDBText47.Visible := True;
         QRDBText48.Visible := True;
         QRDBText49.Visible := True;
         LFUN.Visible := True;
         LDOC.Visible := True;
         LREL.Visible := True;
         QRDBText50.Visible := True;
         QRDBText51.Visible := True;
         QRDBText52.Visible := True;
         LWWT.Visible := True;
         LYWT.Visible := True;
         LRELPERC.Visible := True;
         QRDBText53.Visible := True;
         QRDBText54.Visible := True;
         QRDBText55.Visible := True;
         QRDBRichText1.Visible := True;
      end
   else
      begin
         lGrade.Enabled := True;
         lScore.Enabled := True;
         lPGrade.Enabled := True;
         lPScore.Enabled := True;
         lEBI.Enabled := True;
         lPEBI.Enabled := True;
         LPIN.Enabled := True;
         lPPIN.Enabled := True;
         lPLI.Enabled := True;
         lPPLI.Enabled := True;
         lFamilyName.Enabled := True;
         qrRichText.Enabled := True;

         lGrade.Visible := True;
         lScore.Visible := True;
         lPGrade.Visible := True;
         lPScore.Visible := True;
         lEBI.Visible := True;
         lPEBI.Visible := True;
         LPIN.Visible := True;
         lPPIN.Visible := True;
         lPLI.Visible := True;
         lPPLI.Visible := True;
         lFamilyName.Visible := True;
         qrRichText.Visible := True;


         lMUS.Enabled := False;
         lSKE.Enabled := False;
         lBRE.Enabled := False;
         QRDBText47.Enabled := False;
         QRDBText48.Enabled := False;
         QRDBText49.Enabled := False;
         LFUN.Enabled := False;
         LDOC.Enabled := False;
         LREL.Enabled := False;
         QRDBText50.Enabled := False;
         QRDBText51.Enabled := False;
         QRDBText52.Enabled := False;
         LWWT.Enabled := False;
         LYWT.Enabled := False;
         LRELPERC.Enabled := False;
         QRDBText53.Enabled := False;
         QRDBText54.Enabled := False;
         QRDBText55.Enabled := False;
         qrGroupName.Enabled := False;
         QRDBRichText1.Enabled := False;

         lMUS.Visible := False;
         lSKE.Visible := False;
         lBRE.Visible := False;
         QRDBText47.Visible := False;
         QRDBText48.Visible := False;
         QRDBText49.Visible := False;
         LFUN.Visible := False;
         LDOC.Visible := False;
         LREL.Visible := False;
         QRDBText50.Visible := False;
         QRDBText51.Visible := False;
         QRDBText52.Visible := False;
         LWWT.Visible := False;
         LYWT.Visible := False;
         LRELPERC.Visible := False;
         QRDBText53.Visible := False;
         QRDBText54.Visible := False;
         QRDBText55.Visible := False;
         QRDBRichText1.Visible := False;
      end;

end;

procedure TfmAnimalPrint.FormCreate(Sender: TObject);
var
   i : Integer;
begin
   HerdCombo.RepositoryItem := MenuForm.riHerdCombo;
   HerdCombo.EditValue := WinData.UserDefaultHerdID;

   if ( UpperCase(WinData.AnimalFileByIDSex.AsString)= 'FEMALE' ) then
      begin
         cbCurrLactSummary.Top := 27;
         cbCurrentFertility.Top := 27;
         cbFertilityHistory.Top := 77;
         cbMilkHistory.Top := 77;
         cbMilkHistory.Left := 191;
         cbHealth.Top := 125;
         cbPedigree.Top := 125;
         if fSetUpAnimals.ThisHerdType = cSucklerHerd then
            begin
               cbCalfPerformance.Top := 125;
               cbCalfPerformance.Left := 12;
            end
         else
            cbCalfPerformance.Visible := False;
         cbSemenStocks.Visible := False;
         cbDairy.Visible := False;
      end
   else if ( UpperCase(WinData.AnimalFileByIDSex.AsString)= 'BULL' ) then
      begin
         cbHealth.Top := 27;
         cbSemenStocks.Top := 27;
         cbSemenStocks.Left := 191;
         cbDairy.Top := 77;
         cbDairy.Left := 12;
         cbPedigree.Top := 77;
         cbPedigree.Left := 191;
         cbCurrLactSummary.Visible := False;
         cbCurrentFertility.Visible := False;
         cbFertilityHistory.Visible := False;
         cbCalfPerformance.Visible := False;
         cbMilkHistory.Visible := False;
      end
   else if ( UpperCase(WinData.AnimalFileByIDSex.AsString)= 'STEER' ) then
      begin
         cbSemenStocks.Visible := False;
         cbCurrLactSummary.Visible := False;
         cbCurrentFertility.Visible := False;
         cbFertilityHistory.Visible := False;
         cbCalfPerformance.Visible := False;
         cbMilkHistory.Visible := False;
         cbPedigree.Visible := False;
         cbDairy.Visible := False;
      end;

   //   11/09/13 [V5.2 R1.2] /MK Change - Only show Health and Feed Events.
   cbFeedEvents.Visible := ( (UpperCase(fSetUpAnimals.ThisHerdType) = cBeefHerd ) and (DEF.Definition.dUseBeefMan) );
   cbFeedEvents.Checked := cbFeedEvents.Visible;
   if cbFeedEvents.Visible then
      begin
         for i := 0 to pPrintOptions.ControlCount-1 do
            if ( pPrintOptions.Controls[i] is TcxCheckBox ) then
               pPrintOptions.Controls[i].Visible := ( pPrintOptions.Controls[i].Tag = 1 ) or ( pPrintOptions.Controls[i].Tag = 10 );
         cbHealth.Top := 27;
         cbFeedEvents.Top := cbHealth.Top;
      end;
end;

procedure TfmAnimalPrint.HideCurrLactSummary (AVisible : Boolean);
begin
   QRLabel20.Enabled := AVisible;
   QRLabel21.Enabled := AVisible;
   QRLabel22.Enabled := AVisible;
   QRLabel23.Enabled := AVisible;
   QRLabel24.Enabled := AVisible;
   QRLabel25.Enabled := AVisible;
   lDateDry.Enabled := AVisible;
   Weaned.Enabled := AVisible;
   QRLabel27.Enabled := AVisible;
   lCCDate.Enabled := AVisible;
   lCCType.Enabled := AVisible;
   lCBType.Enabled := AVisible;
   lCNoServes.Enabled := AVisible;
   lCCalvIndex.Enabled := AVisible;
   lCDateDry.Enabled := AVisible;
   lCDateWeaned.Enabled := AVisible;
   QRLabel44.Enabled := AVisible;
   lPCalvDate.Enabled := AVisible;
   lPCType.Enabled := AVisible;
   lPBType.Enabled := AVisible;
   lPNoServes.Enabled := AVisible;
   lPCalvIndex.Enabled := AVisible;
   lPDateDry.Enabled := AVisible;
   lPDateWeaned.Enabled := AVisible;
   QRLabel30.Enabled := AVisible;
   QRLabel31.Enabled := AVisible;
   QRLabel32.Enabled := AVisible;
   QRLabel33.Enabled := AVisible;
   QRLabel34.Enabled := AVisible;
   QRLabel40.Enabled := AVisible;
   lDaysSuckling.Enabled := AVisible;
   QRLabel28.Enabled := AVisible;
   lCDaysInMilk.Enabled := AVisible;
   lCLastTestRec.Enabled := AVisible;
   lCBFat.Enabled := AVisible;
   lCProt.Enabled := AVisible;
   lCTotalY.Enabled := AVisible;
   lCDaysSuck.Enabled := AVisible;
   QRLabel29.Enabled := AVisible;
   lPDaysInMilk.Enabled := AVisible;
   lPLastTestRec.Enabled := AVisible;
   lPBFat.Enabled := AVisible;
   lPProt.Enabled := AVisible;
   lPTotalY.Enabled := AVisible;
   lPDaysSuck.Enabled := AVisible;
   lP305DayY.Enabled := AVisible;
   QRShape5.Enabled := AVisible;
end;

procedure TfmAnimalPrint.HideCurrentFertility (AVisible : Boolean);
begin
   QRLabel43.Enabled := AVisible;
   QRLabel45.Enabled := AVisible;
   QRLabel35.Enabled := AVisible;
   lNo1.Enabled := AVisible;
   lNo2.Enabled := AVisible;
   lNo3.Enabled := AVisible;
   lNo4.Enabled := AVisible;
   lNo5.Enabled := AVisible;
   QRLabel36.Enabled := AVisible;
   lBullDate1.Enabled := AVisible;
   lBullDate2.Enabled := AVisible;
   lBullDate3.Enabled := AVisible;
   lBullDate4.Enabled := AVisible;
   lBullDate5.Enabled := AVisible;
   QRLabel37.Enabled := AVisible;
   lInt1.Enabled := AVisible;
   lInt2.Enabled := AVisible;
   lInt3.Enabled := AVisible;
   lInt4.Enabled := AVisible;
   lInt5.Enabled := AVisible;
   lServices.Enabled := AVisible;
   QRLabel39.Enabled := AVisible;
   lSNo1.Enabled := AVisible;
   lSNo2.Enabled := AVisible;
   lSNo3.Enabled := AVisible;
   lSNo4.Enabled := AVisible;
   lSNo5.Enabled := AVisible;
   QRLabel41.Enabled := AVisible;
   lSerDate1.Enabled := AVisible;
   lSerDate2.Enabled := AVisible;
   lSerDate3.Enabled := AVisible;
   lSerDate4.Enabled := AVisible;
   lSerDate5.Enabled := AVisible;
   QRLabel48.Enabled := AVisible;
   lSint1.Enabled := AVisible;
   lSint2.Enabled := AVisible;
   lSint3.Enabled := AVisible;
   lSint4.Enabled := AVisible;
   lSint5.Enabled := AVisible;
   QRLabel50.Enabled := AVisible;
   lSBullUsed1.Enabled := AVisible;
   lSBullUsed2.Enabled := AVisible;
   lSBullUsed3.Enabled := AVisible;
   lSBullUsed4.Enabled := AVisible;
   lSBullUsed5.Enabled := AVisible;
   QRLabel46.Enabled := AVisible;
   lSServeType1.Enabled := AVisible;
   lSServeType2.Enabled := AVisible;
   lSServeType3.Enabled := AVisible;
   lSServeType4.Enabled := AVisible;
   lSServeType5.Enabled := AVisible;
   QRLabel53.Enabled := AVisible;
   LCavDate.Enabled := AVisible;
   QRLabel54.Enabled := AVisible;
   lProjCavDate.Enabled := AVisible;
   QRLabel38.Enabled := AVisible;
   lTotBullings.Enabled := AVisible;
   QRLabel49.Enabled := AVisible;
   lTotServices.Enabled := AVisible;
   QRLabel52.Enabled := AVisible;
   lPregnant.Enabled := AVisible;
   QRLabel47.Enabled := AVisible;
   lPlannedBull.Enabled := AVisible;
   QRLabel51.Enabled := AVisible;
   lDaysFromLastService.Enabled := AVisible;
   QRShape31.Enabled := AVisible;
end;

procedure TfmAnimalPrint.DisableSemenStock (AVisible : Boolean);
begin
   QRLabel75.Enabled := AVisible;
   QRLabel77.Enabled := AVisible;
   lStrawsAdded.Enabled := AVisible;
   QRLabel78.Enabled := AVisible;
   lSemenStock.Enabled := AVisible;
   QRLabel79.Enabled := AVisible;
   lPricePerStraw.Enabled := AVisible;
   QRLabel80.Enabled := AVisible;
   lStrawsWasted.Enabled := AVisible;
   QRLabel81.Enabled := AVisible;
   lInUse.Enabled := AVisible;
end;

procedure TfmAnimalPrint.MoveDairySectionLeft;
begin
   QRLabel82.Left := 8;
   QRLabel83.Left := 8;
   lSEBI.Left := 73;
   QRLabel84.Left := 8;
   lSProtPerc.Left := 73;
   QRLabel85.Left := 8;
   lSProtkgs.Left := 73;
   QRLabel86.Left := 8;
   lFatPerc.Left := 73;
   QRLabel91.Left := 160;
   lFatkgs.Left := 266;
   QRLabel92.Left := 160;
   lCavDiff.Left := 266;
   relia.Left := 160;
   lReliability.Left := 266;
   QRLabel94.Left := 160;
   lMilkPeddDiff.Left := 266;
end;

procedure TfmAnimalPrint.MoveDairySectionRight;
begin
   QRLabel82.Left := 388;
   QRLabel83.Left := 388;
   lSEBI.Left := 453;
   QRLabel84.Left := 388;
   lSProtPerc.Left := 453;
   QRLabel85.Left := 388;
   lSProtkgs.Left := 453;
   QRLabel86.Left := 388;
   lFatPerc.Left := 453;
   QRLabel91.Left := 540;
   lFatkgs.Left := 646;
   QRLabel92.Left := 540;
   lCavDiff.Left := 646;
   relia.Left := 540;
   lReliability.Left := 646;
   QRLabel94.Left := 540;
   lMilkPeddDiff.Left := 646;
end;

procedure TfmAnimalPrint.MovePedigreeSectionUp;
begin
   QRLabel165.Top := 12;
   QRLabel243.Top := 29;
   lFamilyName2.Top := 29;
   QRLabel214.Top := 57;
   lPGrade2.Top := 57;
   QRLabel244.Top := 53;
   qrPMemo2.Top := 72;
   QRLabel215.Top := 76;
   lPScore2.Top := 76;
   QRLabel216.Top := 95;
   lPEBI2.Top := 95;
   QRLabel217.Top := 114;
   lPPIN2.Top := 114;
   QRLabel218.Top := 134;
   lPPLI2.Top := 134;
   EndPed.Top := 182;
end;

procedure TfmAnimalPrint.MovePedigreeSectionDown;
begin
   QRLabel165.Top := 146;
   QRLabel243.Top := 163;
   lFamilyName2.Top := 163;
   QRLabel214.Top := 191;
   lPGrade2.Top := 191;
   QRLabel244.Top := 187;
   qrPMemo2.Top := 206;
   QRLabel215.Top := 210;
   lPScore2.Top := 210;
   QRLabel216.Top := 229;
   lPEBI2.Top := 229;
   QRLabel217.Top := 248;
   lPPIN2.Top := 248;
   QRLabel218.Top := 268;
   lPPLI2.Top := 268;
   EndPed.Top := 316;
end;

procedure TfmAnimalPrint.MoveCurrLactSummaryUp;
begin
   QRLabel43.Top := 17;
   QRLabel45.Top := 56;
   QRLabel35.Top := 83;
   lNo1.Top := 108;
   lNo2.Top := 128;
   lNo3.Top := 148;
   lNo4.Top := 168;
   lNo5.Top := 188;
   QRLabel36.Top := 83;
   lBullDate1.Top := 108;
   lBullDate2.Top := 128;
   lBullDate3.Top := 148;
   lBullDate4.Top := 168;
   lBullDate5.Top := 188;
   QRLabel37.Top := 83;
   lInt1.Top := 108;
   lInt2.Top := 128;
   lInt3.Top := 148;
   lInt4.Top := 168;
   lInt5.Top := 188;
   lServices.Top := 56;
   QRLabel39.Top := 83;
   lSNo1.Top := 108;
   lSNo2.Top := 128;
   lSNo3.Top := 148;
   lSNo4.Top := 168;
   lSNo5.Top := 188;
   QRLabel41.Top := 83;
   lSerDate1.Top := 108;
   lSerDate2.Top := 128;
   lSerDate3.Top := 148;
   lSerDate4.Top := 168;
   lSerDate5.Top := 188;
   QRLabel48.Top := 83;
   lSint1.Top := 108;
   lSint2.Top := 128;
   lSint3.Top := 148;
   lSint4.Top := 168;
   lSint5.Top := 188;
   QRLabel50.Top := 83;
   lSBullUsed1.Top := 108;
   lSBullUsed2.Top := 128;
   lSBullUsed3.Top := 148;
   lSBullUsed4.Top := 168;
   lSBullUsed5.Top := 188;
   QRLabel46.Top := 83;
   lSServeType1.Top := 108;
   lSServeType2.Top := 128;
   lSServeType3.Top := 148;
   lSServeType4.Top := 168;
   lSServeType5.Top := 188;
   QRLabel53.Top := 103;
   LCavDate.Top := 121;
   QRLabel54.Top := 159;
   lProjCavDate.Top := 177;
   QRLabel38.Top := 226;
   lTotBullings.Top := 226;
   QRLabel49.Top := 226;
   lTotServices.Top := 226;
   QRLabel52.Top := 226;
   lPregnant.Top := 226;
   QRLabel47.Top := 254;
   lPlannedBull.Top := 254;
   QRLabel51.Top := 254;
   lDaysFromLastService.Top := 254;
   QRShape31.Top := 285;
end;

procedure TfmAnimalPrint.MoveCurrLactSummaryDown;
begin
   QRLabel43.Top := 303;
   QRLabel45.Top := 342;
   QRLabel35.Top := 369;
   lNo1.Top := 394;
   lNo2.Top := 414;
   lNo3.Top := 434;
   lNo4.Top := 454;
   lNo5.Top := 474;
   QRLabel36.Top := 369;
   lBullDate1.Top := 394;
   lBullDate2.Top := 414;
   lBullDate3.Top := 434;
   lBullDate4.Top := 454;
   lBullDate5.Top := 474;
   QRLabel37.Top := 369;
   lInt1.Top := 394;
   lInt2.Top := 414;
   lInt3.Top := 434;
   lInt4.Top := 454;
   lInt5.Top := 474;
   lServices.Top := 342;
   QRLabel39.Top := 369;
   lSNo1.Top := 394;
   lSNo2.Top := 414;
   lSNo3.Top := 434;
   lSNo4.Top := 454;
   lSNo5.Top := 474;
   QRLabel41.Top := 369;
   lSerDate1.Top := 394;
   lSerDate2.Top := 414;
   lSerDate3.Top := 434;
   lSerDate4.Top := 454;
   lSerDate5.Top := 474;
   QRLabel48.Top := 369;
   lSint1.Top := 394;
   lSint2.Top := 414;
   lSint3.Top := 434;
   lSint4.Top := 454;
   lSint5.Top := 474;
   QRLabel50.Top := 369;
   lSBullUsed1.Top := 394;
   lSBullUsed2.Top := 414;
   lSBullUsed3.Top := 434;
   lSBullUsed4.Top := 454;
   lSBullUsed5.Top := 474;
   QRLabel46.Top := 369;
   lSServeType1.Top := 394;
   lSServeType2.Top := 414;
   lSServeType3.Top := 434;
   lSServeType4.Top := 454;
   lSServeType5.Top := 474;
   QRLabel53.Top := 389;
   LCavDate.Top := 407;
   QRLabel54.Top := 445;
   lProjCavDate.Top := 463;
   QRLabel38.Top := 512;
   lTotBullings.Top := 512;
   QRLabel49.Top := 512;
   lTotServices.Top := 512;
   QRLabel52.Top := 512;
   lPregnant.Top := 512;
   QRLabel47.Top := 540;
   lPlannedBull.Top := 540;
   QRLabel51.Top := 540;
   lDaysFromLastService.Top := 540;
   QRShape31.Top := 573;
end;

procedure TfmAnimalPrint.HerdComboPropertiesChange(Sender: TObject);
begin
   WinData.UserDefaultHerdID := HerdCombo.EditValue;
end;

procedure TfmAnimalPrint.DisableDairySection(AVisible: Boolean);
begin
   QRLabel82.Enabled := AVisible;
   QRLabel83.Enabled := AVisible;
   lSEBI.Enabled := AVisible;
   QRLabel84.Enabled := AVisible;
   lSProtPerc.Enabled := AVisible;
   QRLabel85.Enabled := AVisible;
   lSProtkgs.Enabled := AVisible;
   QRLabel86.Enabled := AVisible;
   lFatPerc.Enabled := AVisible;
   QRLabel91.Enabled := AVisible;
   lFatkgs.Enabled := AVisible;
   QRLabel92.Enabled := AVisible;
   lCavDiff.Enabled := AVisible;
   relia.Enabled := AVisible;
   lReliability.Enabled := AVisible;
   QRLabel94.Enabled := AVisible;
   lMilkPeddDiff.Enabled := AVisible;
end;

procedure TfmAnimalPrint.DisablePedigreeSection(AVisible: Boolean);
begin
   QRLabel165.Enabled := AVisible;
   QRLabel243.Enabled := AVisible;
   lFamilyName2.Enabled := AVisible;
   QRLabel214.Enabled := AVisible;
   lPGrade2.Enabled := AVisible;
   QRLabel244.Enabled := AVisible;
   qrPMemo2.Enabled := AVisible;
   QRLabel215.Enabled := AVisible;
   lPScore2.Enabled := AVisible;
   QRLabel216.Enabled := AVisible;
   lPEBI2.Enabled := AVisible;
   QRLabel217.Enabled := AVisible;
   lPPIN2.Enabled := AVisible;
   QRLabel218.Enabled := AVisible;
   lPPLI2.Enabled := AVisible;
   EndPed.Enabled := AVisible;
end;

procedure TfmAnimalPrint.PrintQualityAssuredLabels(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   ShowQualityAssured : Boolean;
begin
   ShowQualityAssured := ( (Def.Definition.dUseBeefMan) and (UpperCase(fSetUpAnimals.ThisHerdType) = 'BEEF') );
   if ( Sender.Name = 'qrAnimalFemale' ) then
      begin
         lQualityAssured.Enabled := ShowQualityAssured;
         lQualityAssuredTxt.Enabled := ShowQualityAssured;
         if ( ShowQualityAssured ) then
            QRShape3.Top := 338
         else
            QRShape3.Top := 308;
      end
   else if ( Sender.Name = 'qrAnimalBullBand' ) then
      begin
         lQualityAssured1.Enabled := ShowQualityAssured;
         lQualityAssuredTxt1.Enabled := ShowQualityAssured;
      end
   else if ( Sender.Name = 'qrAnimalSteer' ) then
      begin
         lQualityAssured2.Enabled := ShowQualityAssured;
         lQualityAssuredTxt2.Enabled := ShowQualityAssured;
         if ( ShowQualityAssured ) then
            QRShape26.Top := 338
         else
            QRShape26.Top := 308;
      end;

   if ShowQualityAssured then
      Sender.Height := 350
   else
      Sender.Height := 320;
end;

procedure TfmAnimalPrint.OnDatePrint(Sender: TObject; var Value: String);
begin
   if ( Sender is TQRDBText ) then
      if ( (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0 ) then
         Value := ''; 
end;

procedure TfmAnimalPrint.actPreviewExecute(Sender: TObject);
begin
   PreviewOrPrint(True);
end;

procedure TfmAnimalPrint.actPrintExecute(Sender: TObject);
begin
   PreviewOrPrint(False);
end;

procedure TfmAnimalPrint.PreviewOrPrint(APreview : Boolean);
begin
   if ( not(cbHealth.Visible) ) then
      cbHealth.Checked := False;
   if ( not(cbPedigree.Visible) )then
      cbPedigree.Checked := False;
   if ( not(cbSemenStocks.Visible) ) then
      cbSemenStocks.Checked := False;
   if ( not(cbDairy.Visible) ) then
      cbDairy.Checked := False;
   if ( not(cbCurrLactSummary.Visible) ) then
      cbCurrLactSummary.Checked := False;
   if ( not(cbCurrentFertility.Visible) ) then
      cbCurrentFertility.Checked := False;
   if ( not(cbFertilityHistory.Visible) ) then
      cbFertilityHistory.Checked := False;
   if ( not(cbCalfPerformance.Visible) ) then
      cbCalfPerformance.Checked := False;
   if ( not(cbMilkHistory.Visible) ) then
      cbMilkHistory.Checked := False;
   if ( not(cbFeedEvents.Visible) ) then
      cbFeedEvents.Checked := False;

   if ( (UpperCase(fSetUpAnimals.ThisHerdType) = cBeefHerd ) and (DEF.Definition.dUseBeefMan) ) then
      begin
         GroupHeaderBand1.Enabled := cbHealth.Checked;
         qrHealthDetailsSteer.Enabled := GroupHeaderBand1.Enabled;

         FeedEventsDetail.Enabled := cbFeedEvents.Checked;
         FeedEventsHeader.Enabled := FeedEventsDetail.Enabled;

         if ( APreview ) then
           qrSteer.Preview
         else
           qrSteer.Print;
      end
   else
      begin
         if UpperCase(WinData.AnimalFileByIDSex.AsString)= 'FEMALE' then
            begin
               HideCurrentFertility(True);
               HideCurrLactSummary(True);
               MoveCurrLactSummaryDown;

               qrHealthFemale.Enabled := cbHealth.Checked;
               qrHealthDetailsFemale.Enabled := qrHealthFemale.Enabled;
               GroupFooterBand5.Enabled := qrHealthFemale.Enabled;

               qrPedigreeFemale.Enabled := cbPedigree.Checked;

               qrFertHist.Enabled := cbFertilityHistory.Checked;
               qrFertHistDetail.Enabled := qrFertHist.Enabled;
               GroupFooterBand3.Enabled := qrFertHist.Enabled;

               qrCalPerForm.Enabled := cbCalfPerformance.Checked;
               qrCalPerFormDetail.Enabled := qrCalPerForm.Enabled;
               GroupFooterBand4.Enabled := qrCalPerForm.Enabled;

               qrMilkHist.Enabled := cbMilkHistory.Checked;
               qrMilkHistDetails.Enabled := qrMilkHist.Enabled;
               GroupFooterBand6.Enabled := qrMilkHist.Enabled;

               if ( not(cbCurrLactSummary.Checked) ) then
                  begin
                     HideCurrLactSummary(False);
                     MoveCurrLactSummaryUp;
                  end;

               if ( not(cbCurrentFertility.Checked) ) then
                  HideCurrentFertility(False);

               if ( APreview ) then
                  qrFemale.Preview
               else
                  qrFemale.Print;

               if ( cbMilkHistory.Checked ) or ( cbMilkHistory.Checked ) or ( cbCalfPerformance.Checked ) or
                  ( cbHealth.Checked ) or ( cbPedigree.Checked ) then
                  begin
                     if ( APreview ) then
                        qrFemale2.Preview
                     else
                        qrFemale2.Print;
                  end;
            end
         else if UpperCase(WinData.AnimalFileByIDSex.AsString)= 'BULL' then
            begin
               MovePedigreeSectionDown;
               MoveDairySectionRight;
               DisableSemenStock(True);
               DisablePedigreeSection(True);
               DisableDairySection(True);
               endtraits.Enabled := ( cbSemenStocks.Checked ) or ( cbDairy.Checked );
               EndPed.Enabled := cbPedigree.Checked;

               GroupHeaderBand2.Enabled := cbHealth.Checked;
               QRSubDetail1.Enabled := GroupHeaderBand2.Enabled;

               BeefPed.Enabled := ( cbSemenStocks.Checked ) or ( cbDairy.Checked ) or ( cbPedigree.Checked );

               if ( not(cbSemenStocks.Checked) ) then
                  begin
                     DisableSemenStock(False);
                     MoveDairySectionLeft;
                  end;

               if ( not(cbDairy.Checked) ) then
                  DisableDairySection(False);

               if ( not(cbSemenStocks.Checked) ) and ( not(cbDairy.Checked) ) and
                  ( cbPedigree.Checked ) then
                  MovePedigreeSectionUp;

               if ( not(cbPedigree.Checked) ) then
                  DisablePedigreeSection(False);

               if ( APreview ) then
                  BullCard.Preview
               else
                  BullCard.Print;
            end
         else if UpperCase(WinData.AnimalFileByIDSex.AsString)= 'STEER' then
            begin
               GroupHeaderBand1.Enabled := cbHealth.Checked;
               qrHealthDetailsSteer.Enabled := GroupHeaderBand1.Enabled;

               FeedEventsHeader.Enabled := cbFeedEvents.Checked;

               if ( APreview ) then
                  qrSteer.Preview
               else
                  qrSteer.Print;
            end;
      end;
end;

procedure TfmAnimalPrint.actExitExecute(Sender: TObject);
begin
   Close;
end;

end.
