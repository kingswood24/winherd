unit uSWSReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, db, dbtables, SampleAccounts, QRExport,
  StdCtrls, LivestockInventory;

const
   ErrorMsg = 0;
   InfoMsg = 1;
   ErrorMsgStr = 'Error calculating %s value';

type
  TfmSWSReport = class(TForm)
    SWSCostings: TQuickRep;
    qrTitle: TQRBand;
    NLaccs: TTable;
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
    lHistYear: TQRLabel;
    lActYear: TQRLabel;
    QRLabel351: TQRLabel;
    QRLabel352: TQRLabel;
    QRLabel353: TQRLabel;
    QRLabel368: TQRLabel;
    QRLabel1: TQRLabel;
    lActYear2: TQRLabel;
    lHistYear2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    lStockPurch: TQRLabel;
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
    lLandLease: TQRLabel;
    lQuotaLease: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    lLastStockPurch: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel207: TQRLabel;
    QRLabel208: TQRLabel;
    QRLabel212: TQRLabel;
    QRLabel213: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    MyQuery: TQuery;
    qLand: TQuery;
    QRLabel216: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel158: TQRLabel;
    lYear1: TQRLabel;
    NoOfCows: TQRLabel;
    TotAnimalLU: TQRLabel;
    lLandOwn: TQRLabel;
    llandL: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel153: TQRLabel;
    AcresLU: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel165: TQRLabel;
    BFCow: TQRLabel;
    BFCalf: TQRLabel;
    BFHeifer: TQRLabel;
    BFBeef: TQRLabel;
    BFOther: TQRLabel;
    BFBulls: TQRLabel;
    TotAnimalBF: TQRLabel;
    TotAnimalCF: TQRLabel;
    CFBulls: TQRLabel;
    CFOther: TQRLabel;
    CFBeef: TQRLabel;
    CFHeifer: TQRLabel;
    CFCalf: TQRLabel;
    CFCow: TQRLabel;
    LUNoCow: TQRLabel;
    LUCalves: TQRLabel;
    LUHeifer: TQRLabel;
    LUBeef: TQRLabel;
    LUOther: TQRLabel;
    LUBulls: TQRLabel;
    TotLU: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel210: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel225: TQRLabel;
    QRLabel226: TQRLabel;
    QRLabel227: TQRLabel;
    QRLabel228: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel218: TQRLabel;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRLabel221: TQRLabel;
    QRLabel229: TQRLabel;
    QRLabel222: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel233: TQRLabel;
    QRLabel234: TQRLabel;
    QRLabel235: TQRLabel;
    QRLabel236: TQRLabel;
    QRLabel237: TQRLabel;
    lYear3: TQRLabel;
    lYear10: TQRLabel;
    lYear4: TQRLabel;
    lYear11: TQRLabel;
    lYear5: TQRLabel;
    lYear7: TQRLabel;
    lYear9: TQRLabel;
    lYear6: TQRLabel;
    lYear8: TQRLabel;
    lTotMilkSales: TQRLabel;
    lTotFarmInc: TQRLabel;
    lTotPremHead: TQRLabel;
    lTotBeefSheep: TQRLabel;
    lTotODairySales: TQRLabel;
    lTotStock: TQRLabel;
    lTotCullCow: TQRLabel;
    lTotCalfSales: TQRLabel;
    lTotTillageSale: TQRLabel;
    lTotSalesAns: TQRLabel;
    lGalMilkSales: TQRLabel;
    lGalFarmInc: TQRLabel;
    lGalPremHead: TQRLabel;
    lGalBeefSheep: TQRLabel;
    lGalStock: TQRLabel;
    lGalTotSales: TQRLabel;
    lGallCullCow: TQRLabel;
    lGalCalfSales: TQRLabel;
    lGalTillageSale: TQRLabel;
    lGalODairySales: TQRLabel;
    lAcreMilkSales: TQRLabel;
    lAcrePremHead: TQRLabel;
    lAcreBeefSheep: TQRLabel;
    lAcreStock: TQRLabel;
    lAcreTotSales: TQRLabel;
    lAcreCullCow: TQRLabel;
    lAcreCalfSales: TQRLabel;
    lAcreTillageSale: TQRLabel;
    lAcreFarmInc: TQRLabel;
    lAcreODairySales: TQRLabel;
    LUMilkSales: TQRLabel;
    lLUFarmInc: TQRLabel;
    lLUPremHead: TQRLabel;
    LUBeefSheep: TQRLabel;
    lLUStock: TQRLabel;
    lLUTotSales: TQRLabel;
    LUCullCow: TQRLabel;
    lLUCalfSales: TQRLabel;
    lLUTillageSale: TQRLabel;
    lLUODairySales: TQRLabel;
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
    QRLabel196: TQRLabel;
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
    QRLabel241: TQRLabel;
    QRLabel242: TQRLabel;
    QRLabel243: TQRLabel;
    QRLabel244: TQRLabel;
    QRLabel245: TQRLabel;
    lYear12: TQRLabel;
    QRLabel358: TQRLabel;
    CostMilkSales: TQRLabel;
    lCostFarmInc: TQRLabel;
    lCostPremHead: TQRLabel;
    CostBeefSheep: TQRLabel;
    lCostStock: TQRLabel;
    lCostTotSales: TQRLabel;
    CostCullCow: TQRLabel;
    lCostCalfSales: TQRLabel;
    lCostTillageSale: TQRLabel;
    lCostODairySales: TQRLabel;
    lActBud: TQRLabel;
    lActBud2: TQRLabel;
    lBudStockPurch: TQRLabel;
    QRLabel211: TQRLabel;
    QRLabel250: TQRLabel;
    QRLabel253: TQRLabel;
    QRLabel254: TQRLabel;
    QRLabel255: TQRLabel;
    QRLabel256: TQRLabel;
    QRLabel257: TQRLabel;
    QRLabel258: TQRLabel;
    QRLabel259: TQRLabel;
    QRLabel260: TQRLabel;
    QRLabel261: TQRLabel;
    QRLabel262: TQRLabel;
    QRLabel263: TQRLabel;
    QRLabel264: TQRLabel;
    QRLabel265: TQRLabel;
    QRLabel266: TQRLabel;
    QRLabel267: TQRLabel;
    QRLabel268: TQRLabel;
    QRLabel269: TQRLabel;
    QRLabel270: TQRLabel;
    QRLabel271: TQRLabel;
    QRLabel272: TQRLabel;
    QRLabel273: TQRLabel;
    QRLabel274: TQRLabel;
    QRLabel275: TQRLabel;
    QRLabel280: TQRLabel;
    QRLabel281: TQRLabel;
    QRLabel282: TQRLabel;
    QRLabel283: TQRLabel;
    QRLabel284: TQRLabel;
    QRLabel285: TQRLabel;
    QRLabel286: TQRLabel;
    QRLabel287: TQRLabel;
    QRLabel288: TQRLabel;
    QRLabel289: TQRLabel;
    QRLabel217: TQRLabel;
    QRLabel248: TQRLabel;
    QRLabel249: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel247: TQRLabel;
    QRLabel252: TQRLabel;
    QRLabel231: TQRLabel;
    QRLabel232: TQRLabel;
    QRLabel224: TQRLabel;
    QRLabel251: TQRLabel;
    QRLabel230: TQRLabel;
    QRLabel223: TQRLabel;
    QRLabel238: TQRLabel;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRLabel246: TQRLabel;
    QRLabel277: TQRLabel;
    QRLabel278: TQRLabel;
    QRLabel279: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel290: TQRLabel;
    QRLabel291: TQRLabel;
    qQuota: TQuery;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel292: TQRLabel;
    QRLabel293: TQRLabel;
    QRLabel209: TQRLabel;
    QRLabel276: TQRLabel;
    QRShape2: TQRShape;
    QRLabel63: TQRLabel;
    procedure lTotMilkSalesPrint(sender: TObject; var Value: String);
    procedure SWSCostingsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure lTotBeefSheepPrint(sender: TObject; var Value: String);
    procedure lTotCullCowPrint(sender: TObject; var Value: String);
    procedure lTotODairySalesPrint(sender: TObject; var Value: String);
    procedure lTotCalfSalesPrint(sender: TObject; var Value: String);
    procedure lTotTillageSalePrint(sender: TObject; var Value: String);
    procedure AssignCaptionValues;
    procedure ResetYearCaption;
    procedure FormDestroy(Sender: TObject);
    procedure lTotPremHeadPrint(sender: TObject; var Value: String);
    procedure QRLabel39Print(sender: TObject; var Value: String);
    procedure QRLabel40Print(sender: TObject; var Value: String);
    procedure QRLabel41Print(sender: TObject; var Value: String);
    procedure QRLabel43Print(sender: TObject; var Value: String);
    procedure QRLabel44Print(sender: TObject; var Value: String);
    procedure QRLabel45Print(sender: TObject; var Value: String);
    procedure QRLabel46Print(sender: TObject; var Value: String);
    procedure QRLabel47Print(sender: TObject; var Value: String);
    procedure QRLabel49Print(sender: TObject; var Value: String);
    procedure QRLabel50Print(sender: TObject; var Value: String);
    procedure QRLabel51Print(sender: TObject; var Value: String);
    procedure lLandLeasePrint(sender: TObject; var Value: String);
    procedure lQuotaLeasePrint(sender: TObject; var Value: String);
    procedure QRLabel54Print(sender: TObject; var Value: String);
    procedure QRLabel56Print(sender: TObject; var Value: String);
    procedure QRLabel59Print(sender: TObject; var Value: String);
    procedure QRLabel60Print(sender: TObject; var Value: String);
    procedure QRLabel61Print(sender: TObject; var Value: String);
    procedure QRLabel63Print(sender: TObject; var Value: String);
    procedure QRLabel65Print(sender: TObject; var Value: String);
    procedure QRLabel64Print(sender: TObject; var Value: String);
    procedure QRLabel207Print(sender: TObject; var Value: String);
    procedure QRLabel208Print(sender: TObject; var Value: String);
    procedure lTotSalesAnsPrint(sender: TObject; var Value: String);
    procedure QRLabel209Print(sender: TObject; var Value: String);
    procedure QRLabel38Print(sender: TObject; var Value: String);
    procedure QRLabel52Print(sender: TObject; var Value: String);
    procedure QRLabel53Print(sender: TObject; var Value: String);
    procedure lLandOwnPrint(sender: TObject; var Value: String);
    procedure llandLPrint(sender: TObject; var Value: String);
    procedure QRLabel140Print(sender: TObject; var Value: String);
    procedure QRLabel144Print(sender: TObject; var Value: String);
    procedure QRLabel143Print(sender: TObject; var Value: String);
    procedure QRLabel127Print(sender: TObject; var Value: String);
    procedure QRLabel153Print(sender: TObject; var Value: String);
    procedure AcresLUPrint(sender: TObject; var Value: String);
    procedure QRLabel157Print(sender: TObject; var Value: String);
    procedure QRLabel159Print(sender: TObject; var Value: String);
    procedure lGalMilkSalesPrint(sender: TObject; var Value: String);
    procedure lGalBeefSheepPrint(sender: TObject; var Value: String);
    procedure lGallCullCowPrint(sender: TObject; var Value: String);
    procedure lGalODairySalesPrint(sender: TObject; var Value: String);
    procedure lGalCalfSalesPrint(sender: TObject; var Value: String);
    procedure lGalTillageSalePrint(sender: TObject; var Value: String);
    procedure lGalPremHeadPrint(sender: TObject; var Value: String);
    procedure lGalStockPrint(sender: TObject; var Value: String);
    procedure lGalTotSalesPrint(sender: TObject; var Value: String);
    procedure lGalFarmIncPrint(sender: TObject; var Value: String);
    procedure lAcreMilkSalesPrint(sender: TObject; var Value: String);
    procedure lAcreBeefSheepPrint(sender: TObject; var Value: String);
    procedure lAcreCullCowPrint(sender: TObject; var Value: String);
    procedure lAcreODairySalesPrint(sender: TObject; var Value: String);
    procedure lAcreCalfSalesPrint(sender: TObject; var Value: String);
    procedure lAcreFarmIncPrint(sender: TObject; var Value: String);
    procedure lAcreTillageSalePrint(sender: TObject; var Value: String);
    procedure lAcrePremHeadPrint(sender: TObject; var Value: String);
    procedure lAcreStockPrint(sender: TObject; var Value: String);
    procedure lAcreTotSalesPrint(sender: TObject; var Value: String);
    procedure LUMilkSalesPrint(sender: TObject; var Value: String);
    procedure LUBeefSheepPrint(sender: TObject; var Value: String);
    procedure LUCullCowPrint(sender: TObject; var Value: String);
    procedure lLUODairySalesPrint(sender: TObject; var Value: String);
    procedure lLUCalfSalesPrint(sender: TObject; var Value: String);
    procedure lLUFarmIncPrint(sender: TObject; var Value: String);
    procedure lLUTillageSalePrint(sender: TObject; var Value: String);
    procedure lLUPremHeadPrint(sender: TObject; var Value: String);
    procedure lLUStockPrint(sender: TObject; var Value: String);
    procedure lLUTotSalesPrint(sender: TObject; var Value: String);
    procedure CostMilkSalesPrint(sender: TObject; var Value: String);
    procedure CostBeefSheepPrint(sender: TObject; var Value: String);
    procedure CostCullCowPrint(sender: TObject; var Value: String);
    procedure lCostODairySalesPrint(sender: TObject; var Value: String);
    procedure lCostCalfSalesPrint(sender: TObject; var Value: String);
    procedure lCostFarmIncPrint(sender: TObject; var Value: String);
    procedure lCostTillageSalePrint(sender: TObject; var Value: String);
    procedure lCostPremHeadPrint(sender: TObject; var Value: String);
    procedure lCostStockPrint(sender: TObject; var Value: String);
    procedure lCostTotSalesPrint(sender: TObject; var Value: String);
    procedure QRLabel88Print(sender: TObject; var Value: String);
    procedure QRLabel89Print(sender: TObject; var Value: String);
    procedure QRLabel111Print(sender: TObject; var Value: String);
    procedure QRLabel147Print(sender: TObject; var Value: String);
    procedure QRLabel185Print(sender: TObject; var Value: String);
    procedure QRLabel112Print(sender: TObject; var Value: String);
    procedure QRLabel149Print(sender: TObject; var Value: String);
    procedure QRLabel186Print(sender: TObject; var Value: String);
    procedure QRLabel90Print(sender: TObject; var Value: String);
    procedure QRLabel113Print(sender: TObject; var Value: String);
    procedure QRLabel150Print(sender: TObject; var Value: String);
    procedure QRLabel187Print(sender: TObject; var Value: String);
    procedure QRLabel91Print(sender: TObject; var Value: String);
    procedure QRLabel116Print(sender: TObject; var Value: String);
    procedure QRLabel164Print(sender: TObject; var Value: String);
    procedure QRLabel188Print(sender: TObject; var Value: String);
    procedure QRLabel92Print(sender: TObject; var Value: String);
    procedure QRLabel117Print(sender: TObject; var Value: String);
    procedure QRLabel166Print(sender: TObject; var Value: String);
    procedure QRLabel189Print(sender: TObject; var Value: String);
    procedure QRLabel93Print(sender: TObject; var Value: String);
    procedure QRLabel120Print(sender: TObject; var Value: String);
    procedure QRLabel167Print(sender: TObject; var Value: String);
    procedure QRLabel190Print(sender: TObject; var Value: String);
    procedure QRLabel94Print(sender: TObject; var Value: String);
    procedure QRLabel122Print(sender: TObject; var Value: String);
    procedure QRLabel168Print(sender: TObject; var Value: String);
    procedure QRLabel191Print(sender: TObject; var Value: String);
    procedure QRLabel95Print(sender: TObject; var Value: String);
    procedure QRLabel123Print(sender: TObject; var Value: String);
    procedure QRLabel169Print(sender: TObject; var Value: String);
    procedure QRLabel192Print(sender: TObject; var Value: String);
    procedure QRLabel96Print(sender: TObject; var Value: String);
    procedure QRLabel125Print(sender: TObject; var Value: String);
    procedure QRLabel170Print(sender: TObject; var Value: String);
    procedure QRLabel193Print(sender: TObject; var Value: String);
    procedure QRLabel97Print(sender: TObject; var Value: String);
    procedure QRLabel126Print(sender: TObject; var Value: String);
    procedure QRLabel172Print(sender: TObject; var Value: String);
    procedure QRLabel194Print(sender: TObject; var Value: String);
    procedure QRLabel98Print(sender: TObject; var Value: String);
    procedure QRLabel128Print(sender: TObject; var Value: String);
    procedure QRLabel173Print(sender: TObject; var Value: String);
    procedure QRLabel195Print(sender: TObject; var Value: String);
    procedure QRLabel99Print(sender: TObject; var Value: String);
    procedure QRLabel129Print(sender: TObject; var Value: String);
    procedure QRLabel174Print(sender: TObject; var Value: String);
    procedure QRLabel196Print(sender: TObject; var Value: String);
    procedure QRLabel100Print(sender: TObject; var Value: String);
    procedure QRLabel130Print(sender: TObject; var Value: String);
    procedure QRLabel175Print(sender: TObject; var Value: String);
    procedure QRLabel197Print(sender: TObject; var Value: String);
    procedure QRLabel101Print(sender: TObject; var Value: String);
    procedure QRLabel132Print(sender: TObject; var Value: String);
    procedure QRLabel176Print(sender: TObject; var Value: String);
    procedure QRLabel198Print(sender: TObject; var Value: String);
    procedure QRLabel102Print(sender: TObject; var Value: String);
    procedure QRLabel133Print(sender: TObject; var Value: String);
    procedure QRLabel178Print(sender: TObject; var Value: String);
    procedure QRLabel199Print(sender: TObject; var Value: String);
    procedure QRLabel103Print(sender: TObject; var Value: String);
    procedure QRLabel134Print(sender: TObject; var Value: String);
    procedure QRLabel179Print(sender: TObject; var Value: String);
    procedure QRLabel200Print(sender: TObject; var Value: String);
    procedure QRLabel104Print(sender: TObject; var Value: String);
    procedure QRLabel135Print(sender: TObject; var Value: String);
    procedure QRLabel180Print(sender: TObject; var Value: String);
    procedure QRLabel201Print(sender: TObject; var Value: String);
    procedure QRLabel105Print(sender: TObject; var Value: String);
    procedure QRLabel136Print(sender: TObject; var Value: String);
    procedure QRLabel181Print(sender: TObject; var Value: String);
    procedure QRLabel202Print(sender: TObject; var Value: String);
    procedure QRLabel106Print(sender: TObject; var Value: String);
    procedure QRLabel137Print(sender: TObject; var Value: String);
    procedure QRLabel182Print(sender: TObject; var Value: String);
    procedure QRLabel203Print(sender: TObject; var Value: String);
    procedure QRLabel107Print(sender: TObject; var Value: String);
    procedure QRLabel138Print(sender: TObject; var Value: String);
    procedure QRLabel183Print(sender: TObject; var Value: String);
    procedure QRLabel204Print(sender: TObject; var Value: String);
    procedure QRLabel108Print(sender: TObject; var Value: String);
    procedure QRLabel141Print(sender: TObject; var Value: String);
    procedure QRLabel184Print(sender: TObject; var Value: String);
    procedure QRLabel205Print(sender: TObject; var Value: String);
    procedure QRLabel109Print(sender: TObject; var Value: String);
    procedure QRLabel142Print(sender: TObject; var Value: String);
    procedure QRLabel110Print(sender: TObject; var Value: String);
    procedure QRLabel206Print(sender: TObject; var Value: String);
    procedure QRLabel218Print(sender: TObject; var Value: String);
    procedure QRLabel225Print(sender: TObject; var Value: String);
    procedure QRLabel233Print(sender: TObject; var Value: String);
    procedure QRLabel241Print(sender: TObject; var Value: String);
    procedure QRLabel219Print(sender: TObject; var Value: String);
    procedure QRLabel226Print(sender: TObject; var Value: String);
    procedure QRLabel234Print(sender: TObject; var Value: String);
    procedure QRLabel242Print(sender: TObject; var Value: String);
    procedure QRLabel220Print(sender: TObject; var Value: String);
    procedure QRLabel227Print(sender: TObject; var Value: String);
    procedure QRLabel235Print(sender: TObject; var Value: String);
    procedure QRLabel243Print(sender: TObject; var Value: String);
    procedure QRLabel221Print(sender: TObject; var Value: String);
    procedure QRLabel228Print(sender: TObject; var Value: String);
    procedure QRLabel236Print(sender: TObject; var Value: String);
    procedure QRLabel244Print(sender: TObject; var Value: String);
    procedure QRLabel222Print(sender: TObject; var Value: String);
    procedure QRLabel229Print(sender: TObject; var Value: String);
    procedure QRLabel237Print(sender: TObject; var Value: String);
    procedure QRLabel245Print(sender: TObject; var Value: String);
    procedure QRLabel224Print(sender: TObject; var Value: String);
    procedure QRLabel231Print(sender: TObject; var Value: String);
    procedure QRLabel239Print(sender: TObject; var Value: String);
    procedure QRLabel251Print(sender: TObject; var Value: String);
    procedure QRLabel232Print(sender: TObject; var Value: String);
    procedure QRLabel240Print(sender: TObject; var Value: String);
    procedure lYear3Print(sender: TObject; var Value: String);
    procedure lYear4Print(sender: TObject; var Value: String);
    procedure lYear5Print(sender: TObject; var Value: String);
    procedure lYear6Print(sender: TObject; var Value: String);
    procedure lYear7Print(sender: TObject; var Value: String);
    procedure lYear9Print(sender: TObject; var Value: String);
    procedure lYear10Print(sender: TObject; var Value: String);
    procedure lYear12Print(sender: TObject; var Value: String);
    procedure QRLabel67Print(sender: TObject; var Value: String);
    procedure QRLabel68Print(sender: TObject; var Value: String);
    procedure QRLabel69Print(sender: TObject; var Value: String);
    procedure QRLabel71Print(sender: TObject; var Value: String);
    procedure QRLabel72Print(sender: TObject; var Value: String);
    procedure QRLabel73Print(sender: TObject; var Value: String);
    procedure QRLabel75Print(sender: TObject; var Value: String);
    procedure QRLabel74Print(sender: TObject; var Value: String);
    procedure QRLabel77Print(sender: TObject; var Value: String);
    procedure QRLabel78Print(sender: TObject; var Value: String);
    procedure QRLabel79Print(sender: TObject; var Value: String);
    procedure QRLabel80Print(sender: TObject; var Value: String);
    procedure QRLabel81Print(sender: TObject; var Value: String);
    procedure QRLabel82Print(sender: TObject; var Value: String);
    procedure QRLabel83Print(sender: TObject; var Value: String);
    procedure QRLabel84Print(sender: TObject; var Value: String);
    procedure QRLabel85Print(sender: TObject; var Value: String);
    procedure QRLabel86Print(sender: TObject; var Value: String);
    procedure QRLabel87Print(sender: TObject; var Value: String);
    procedure QRLabel212Print(sender: TObject; var Value: String);
    procedure QRLabel213Print(sender: TObject; var Value: String);
    procedure QRLabel214Print(sender: TObject; var Value: String);
    procedure QRLabel215Print(sender: TObject; var Value: String);
    procedure QRLabel216Print(sender: TObject; var Value: String);
    procedure QRLabel217Print(sender: TObject; var Value: String);
    procedure QRLabel248Print(sender: TObject; var Value: String);
    procedure QRLabel249Print(sender: TObject; var Value: String);
    procedure QRLabel280Print(sender: TObject; var Value: String);
    procedure QRLabel283Print(sender: TObject; var Value: String);
    procedure QRLabel286Print(sender: TObject; var Value: String);
    procedure QRLabel284Print(sender: TObject; var Value: String);
    procedure QRLabel287Print(sender: TObject; var Value: String);
    procedure QRLabel288Print(sender: TObject; var Value: String);
    procedure QRLabel282Print(sender: TObject; var Value: String);
    procedure QRLabel289Print(sender: TObject; var Value: String);
    procedure QRLabel211Print(sender: TObject; var Value: String);
    procedure QRLabel250Print(sender: TObject; var Value: String);
    procedure QRLabel253Print(sender: TObject; var Value: String);
    procedure QRLabel255Print(sender: TObject; var Value: String);
    procedure QRLabel256Print(sender: TObject; var Value: String);
    procedure QRLabel257Print(sender: TObject; var Value: String);
    procedure QRLabel258Print(sender: TObject; var Value: String);
    procedure QRLabel259Print(sender: TObject; var Value: String);
    procedure QRLabel261Print(sender: TObject; var Value: String);
    procedure QRLabel262Print(sender: TObject; var Value: String);
    procedure QRLabel263Print(sender: TObject; var Value: String);
    procedure QRLabel264Print(sender: TObject; var Value: String);
    procedure QRLabel265Print(sender: TObject; var Value: String);
    procedure QRLabel266Print(sender: TObject; var Value: String);
    procedure QRLabel267Print(sender: TObject; var Value: String);
    procedure QRLabel268Print(sender: TObject; var Value: String);
    procedure QRLabel269Print(sender: TObject; var Value: String);
    procedure QRLabel270Print(sender: TObject; var Value: String);
    procedure QRLabel271Print(sender: TObject; var Value: String);
    procedure QRLabel273Print(sender: TObject; var Value: String);
    procedure QRLabel272Print(sender: TObject; var Value: String);
    procedure QRLabel274Print(sender: TObject; var Value: String);
    procedure QRLabel276Print(sender: TObject; var Value: String);
    procedure QRLabel277Print(sender: TObject; var Value: String);
    procedure QRLabel278Print(sender: TObject; var Value: String);
    procedure QRLabel279Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CFCowValue, BFCowValue, CFCalfValue, BFCalfValue, BFHeiferValue, CFHeiferValue,
    BFBeefValue, CFBeefValue, BFOtherValue, CFOtherValue, BFBullsValue, CFBullsValue,
    TotalAnimalCF, TotalAnimalBF : Integer;

    TotalLUBF, TotalLUCF, TotalLU : Double;

    TotMilkSales, TotBeefSheep, TotCullCow, TotDairyStock, TotCalfSale, TotFarmIn,
    TotTillageSale, TotPremiumHead, TotStockChange : Currency;

    LastMilkSales, LastBeefSheep, LastCullCow, LastDairyStock, LastCalfSale, LastFarmIn,
    LastTillageSale, LastPremiumHead, LastStockChange : Currency;

    BudgetMilkSales, BudgetBeefSheep, BudgetCullCow, BudgetDairyStock, BudgetCalfSale, BudgetFarmIn,
    BudgetTillageSale, BudgetPremiumHead, BudgetStockChange : Currency;

    StockPurchase, Health, Breeding, MilkRec, ParlourCost, DairyCon, Concentrate,
    SilageHay, OtherCost, SilageContract, OtherContract, FertLime, SeedSpray,
    Machinery, landLease, QuotaLease, Wages, Car, Maintenance, ESBPhone, Account,
    Insurance, StockHaulage, Interest, TotalSundry, Dep, ComparableSurplus : Double;

    LastStockPurchase, LastHealth, LastBreeding, LastMilkRec, LastParlourCost, LastDairyCon, LastConcentrate,
    LastSilageHay, LastOtherCost, LastSilageContract, LastOtherContract, LastFertLime, LastSeedSpray,
    LastMachinery, LastlandLease, LastQuotaLease, LastWages, LastCar, LastMaintenance, LastESBPhone, LastAccount,
    LastInsurance, LastStockHaulage, LastInterest, LastTotalSundry, LastDep, LastComparableSurplus : Double;

    BudgetStockPurchase, BudgetHealth, BudgetBreeding, BudgetMilkRec, BudgetParlourCost, BudgetDairyCon, BudgetConcentrate,
    BudgetSilageHay, BudgetOtherCost, BudgetSilageContract, BudgetOtherContract, BudgetFertLime, BudgetSeedSpray,
    BudgetMachinery, BudgetlandLease, BudgetQuotaLease, BudgetWages, BudgetCar, BudgetMaintenance, BudgetESBPhone, BudgetAccount,
    BudgetInsurance, BudgetStockHaulage, BudgetInterest, BudgetTotalSundry, BudgetDep, BudgetComparableSurplus : Double;


    GalStockPurchase, GalHealth, GalBreeding, GalMilkRec, GalParlourCost, GalDairyCon, GalConcentrate,
    GalSilageHay, GalOtherCost, GalSilageContract, GalOtherContract, GalFertLime, GalSeedSpray,
    GalMachinery, GallandLease, GalQuotaLease, GalWages, GalCar, GalMaintenance, GalESBPhone, GalAccount,
    GalInsurance, GalStockHaulage, GalInterest, GalTotalSundry, GalDep : Double;

    AcreStockPurchase, AcreHealth, AcreBreeding, AcreMilkRec, AcreParlourCost, AcreDairyCon, AcreConcentrate,
    AcreSilageHay, AcreOtherCost, AcreSilageContract, AcreOtherContract, AcreFertLime, AcreSeedSpray,
    AcreMachinery, AcrelandLease, AcreQuotaLease, AcreWages, AcreCar, AcreMaintenance, AcreESBPhone, AcreAccount,
    AcreInsurance, AcreStockHaulage, AcreInterest, AcreTotalSundry, AcreDep : Double;

    LUStockPurchase, LUHealth, LUBreeding, LUMilkRec, LUParlourCost, LUDairyCon, LUConcentrate,
    LUSilageHay, LUOtherCost, LUSilageContract, LUOtherContract, LUFertLime, LUSeedSpray,
    LUMachinery, LUlandLease, LUQuotaLease, LUWages, LUCar, LUMaintenance, LUESBPhone, LUAccount,
    LUInsurance, LUStockHaulage, LUInterest, LUTotalSundry, LUDep : Double;

    PercStockPurchase, PercHealth, PercBreeding, PercMilkRec, PercParlourCost, PercDairyCon, PercConcentrate,
    PercSilageHay, PercOtherCost, PercSilageContract, PercOtherContract, PercFertLime, PercSeedSpray,
    PercMachinery, PerclandLease, PercQuotaLease, PercWages, PercCar, PercMaintenance, PercESBPhone, PercAccount,
    PercInsurance, PercStockHaulage, PercInterest, PercTotalSundry, PercDep : Double;


    TotalSales, LastTotalSales, BudgetTotalSales, TotFarmSurplus, TotalCost, LastTotalCost,
    BudgetTotalCost, LastTotFarmSurplus, BudgetTotFarmSurplus: double;

    GalTotalSales, GalTotalCost : double;

    AcreTotalSales, AcreTotalCost : double;
    LUTotalSales, LUTotalCost : double;
    PercTotalSales, PercTotalCost : double;

    LandOwned, TotalLand, QuotaOwned, TotalQuota : double;

    GenQuery : TQuery;
    NonProfitIncome, LUCalfValue : double;
    NonProfitExpend : double;
    Depreciation : double;
    HerdId       : Integer;
    UnallocatedBalances    : Boolean;
    getAccData : TSampleAccounts;
    DatabasePath : String;
    procedure GetFarmExpenses;
    procedure GetLastFarmExpenses;
    procedure GetBudgetFarmExpenses;
    procedure DisplayMsgDlg(MsgText : String; MsgType : Integer = 0);
    procedure SetDatabasePath;
    procedure SetLUCaptions;
    function GetLandOwned : Double;
  public
    CaptionNum : Integer;
    CaptionValue : String;
    procedure SetUnallocated;
    { Public declarations }
  end;


  procedure Preview(HerdIdentity: Integer; SetUnalloc : Boolean);


const
   DbPath = 'C:\Kingsacc\';

var
  fmSWSReport: TfmSWSReport;

 iPurchaseConcent : Array [0..2] of integer = (203, 223, 243);
 iPurchaseForage  : Array [0..2] of integer = (204, 224, 244);
 iFertiliser      : Array [0..2] of integer = (205, 225, 245);
 iLime            : Array [0..2] of integer = (206, 226, 246);
 iVet             : Array [0..2] of integer = (207, 227, 247);
 iContractor      : Array [0..2] of integer = (209, 229, 249);
 iSeedSprays      : Array [0..2] of integer = (212, 231, 251);
 iSilageAddPoly   : Array [0..2] of integer = (210, 230, 250);
 iLeviesTrans     : Array [0..2] of integer = (213, 232, 252);
 iSundryVarCosts  : Array [0..2] of integer = (214, 233, 253);
 iStraw           : Array [0..2] of integer = (215, 234, 254);
 iUnallocated     : Array [0..10] of integer = (301, 302, 303, 304, 305,
                                             306, 307, 308, 309, 310, 311);

implementation

uses
   uAccsReps, DairyData, KRoutines;

  procedure Preview(HerdIdentity: Integer; SetUnalloc : Boolean);
  begin
     with fmSWSReport do
        try
           HerdId := HerdIdentity;
           SetDatabasePath;

           GenQuery := TQuery.Create(nil);
           GenQuery.DatabaseName := DatabasePath;
           MyQuery.DatabaseName := DatabasePath;

           NLAccs.DataBaseName := DatabasePath;
           NLAccs.Open;

           getAccData := TSampleAccounts.Create(HerdIdentity);

           if SetUnalloc then
              SetUnallocated;

           try
              SWSCostings.Preview;
           except
              on E : Exception do
                 ShowMessage(e.message);
           end;
           
        finally
           NLAccs.Close;
           GenQuery.Close;
           GenQuery.Free;
        end;
  end;

{$R *.DFM}

{ TfmSWSReport }

procedure TfmSWSReport.SetUnallocated;
var
   DairyPerc,
   CattlePerc,
   ReplacePerc,
   DairyAmt,
   CattleAmt,
   ReplaceAmt : Double;
   i : Integer;
   Balance : Double;
   TempNlaccs : TTable;

   procedure AllocToNominals(UnallocID : Integer; Balance : Double; iUnalloc : Array of Integer);

      procedure AllocBalance(RecID : Integer; Amount : Double);
      begin
         if Nlaccs.Locate('ID', RecID, []) then // try locate the Nominal Accts
            begin
               Nlaccs.Edit;
               Nlaccs.FieldByName('Balance').AsFloat := Nlaccs.FieldByName('Balance').AsFloat + Amount;
               Nlaccs.Post;                           // Add dairyamt to the existing balance
            end;

      end;

   var
      x : Integer;
   begin
      for x := Low(iUnalloc) to High(iUnalloc) do   // loop through array of Nominal Accounts
         begin
            case x of
               0 : AllocBalance(iUnalloc[x], (( DairyPerc/100) * Balance)); // Allocbalance = the percentage of the Unallocated Record Balance
               1 : AllocBalance(iUnalloc[x], ((ReplacePerc/100) * Balance));
               2 : AllocBalance(iUnalloc[x], ((CattlePerc/100) * Balance));
            end;
         end;

   end;

begin
      try
         WinData.LiveStockValues.Active := True;
         if WinData.LiveStockValues.Locate('HerdID', HerdId, []) then
            begin
               DairyPerc   := WinData.LiveStockValues.FieldByname ('AvgDairyPerc').AsFloat;    //Creating fields in the Database
               CattlePerc  := WinData.LiveStockValues.FieldByname ('AvgCattlePerc').AsFloat;
               ReplacePerc := WinData.LiveStockValues.FieldByname ('AvgReplacePerc').AsFloat;
            end;
         WinData.LiveStockValues.Active := False;

         for i := Low(iUnallocated) to High(iUnallocated) do      // i represents Unallocated Record ID,
            begin
               if Nlaccs.Locate('ID', iUnallocated[i],[]) then       // try locate the Unallocated Record ID,
                  begin
                     Balance := Nlaccs.FieldByName('Balance').AsFloat; // assisgn balance of Unallocated Record ID,
                     if Balance > 0 then                               // if balance >0 then work with the Balance else ignore Record

                        begin
                           Nlaccs.Edit;
                           Nlaccs.FieldByName('Balance').AsFloat := 0;    // assign the Unallocated balances to zero
                           Nlaccs.Post;

                           case i of
                              0 : AllocToNominals(iUnallocated[i], Balance, iPurchaseConcent);
                              1 : AllocToNominals(iUnallocated[i], Balance, iPurchaseForage);
                              2 : AllocToNominals(iUnallocated[i], Balance, iFertiliser);
                              3 : AllocToNominals(iUnallocated[i], Balance, iLime);
                              4 : AllocToNominals(iUnallocated[i], Balance, iVet);
                              5 : AllocToNominals(iUnallocated[i], Balance, iContractor);
                              6 : AllocToNominals(iUnallocated[i], Balance, iSeedSprays);
                              7 : AllocToNominals(iUnallocated[i], Balance, iSilageAddPoly);
                              8 : AllocToNominals(iUnallocated[i], Balance, iLeviesTrans);
                              9 : AllocToNominals(iUnallocated[i], Balance, iSundryVarCosts);
                             10 : AllocToNominals(iUnallocated[i], Balance, iStraw);
                           end;
                        end;
                  end;
            end;
      except
         MessageDlg('Unable to calculate Livestock Percentage Units - contact Kingswood',mtError,[mbOk],0);
      end;
end;

procedure TfmSWSReport.lTotMilkSalesPrint(sender: TObject;
  var Value: String);
begin
   TotMilkSales := (getAccData.TotalMilkSales);
   if TotMilkSales > 0 then
      Value := CurrToStrF((TotMilkSales), ffCurrency, 2);
end;

procedure TfmSWSReport.AssignCaptionValues;
begin
   if CaptionNum = 1 then
      begin
         BFCow.Caption := CaptionValue;
         BFCowValue := StrToInt(CaptionValue);
         TotalAnimalBF := BFCowValue;
      end;
   if CaptionNum = 2 then
      begin
         NoOfCows.Caption := CaptionValue;
         CFCow.Caption := CaptionValue;
         CFCowValue := StrToInt(CaptionValue);
//         TotAnimalLU.Caption := FloatToStr(TotalLU);
      end;
   if CaptionNum = 3 then
      begin
         BFCalf.Caption := CaptionValue;
         BFCalfValue := StrToInt(CaptionValue);
         TotalAnimalBF := TotalAnimalBF +  BFCalfValue;
      end;
   if CaptionNum = 4 then
      begin
         CFCalf.Caption := CaptionValue;
         CFCalfValue := StrToInt(CaptionValue);
         TotalAnimalCF := TotalAnimalCF + CFCalfValue;
      end;
   if CaptionNum = 5 then
      begin
         BFHeifer.Caption := CaptionValue;
         BFHeiferValue := StrToInt(CaptionValue);
         TotalAnimalBF := TotalAnimalBF + BFHeiferValue;
//         LUHeifer.Caption := FloatToStr(BFHeiferValue);
      end;
   if CaptionNum = 6 then
      begin
         CFHeifer.Caption := CaptionValue;
         CFHeiferValue := StrToInt(CaptionValue);
         TotalAnimalCF := TotalAnimalCF + CFHeiferValue;
      end;
   if CaptionNum = 7 then
      begin
         BFBeef.Caption := CaptionValue;
         BFBeefValue := StrToInt(CaptionValue);
         TotalAnimalBF := TotalAnimalBF + BFBeefValue;
      end;
   if CaptionNum = 8 then
      begin
         CFBeef.Caption := CaptionValue;
         CFBeefValue := StrToInt(CaptionValue);
         TotalAnimalCF := TotalAnimalCF + CFBeefValue;
      end;
   if CaptionNum = 9 then
      begin
         BFOther.Caption := CaptionValue;
         BFOtherValue := StrToInt(CaptionValue);
         TotalAnimalBF := TotalAnimalBF + BFOtherValue;
      end;
   if CaptionNum = 10 then
      begin
         CFOther.Caption := CaptionValue;
         CFOtherValue := StrToInt(CaptionValue);
         TotalAnimalCF := TotalAnimalCF + CFOtherValue;
      end;
   if CaptionNum = 11 then
      begin
         BFBulls.Caption := CaptionValue;
         BFBullsValue := StrToInt(CaptionValue);
         TotalAnimalBF := TotalAnimalBF + BFBullsValue;
      end;
   if CaptionNum = 12 then
      begin
         CFBulls.Caption := CaptionValue;
         CFBullsValue := StrToInt(CaptionValue);
         TotalAnimalCF := TotalAnimalCF + CFBullsValue;
      end;
end;

procedure TfmSWSReport.SWSCostingsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   LSInventory : TLivestockInventory;
   TempFloat : Double;
begin
   TotalAnimalBF := 0;
   TotalAnimalCF := 0;

   TotalLUBF := 0;

   LSInventory := TLivestockInventory.Create(DataDir);
   try

      { Livestock No's Brought Forward }
      BFCowValue := LSInventory.CowsBF;
      BFCow.Caption := IntToStr(BFCowValue);

      BFBullsValue := LSInventory.BullsBF;
      BFBulls.Caption := IntToStr(BFBullsValue);

      BFCalfValue := LSInventory.CalvesBF;
      BFCalf.Caption := IntToStr(BFCalfValue);

      BFHeiferValue := LSInventory.HeifersBF;
      BFHeifer.Caption := IntToStr(BFHeiferValue);

      BFBeefValue := LSInventory.SteersBF;
      BFBeef.Caption := IntToStr(BFBeefValue);

      BFOtherValue := LSInventory.OtherBF;
      BFOther.Caption := IntToStr(BFOtherValue);

      { Livestock No's Brought Forward }
      CFCowValue := LSInventory.CowsCF;
      CFCow.Caption := IntToStr(CFCowValue);
      NoOfCows.Caption := CFCow.Caption; // Farm Details..

      CFBullsValue := LSInventory.BullsCF;
      CFBulls.Caption := FloatToStr(CFBullsValue);

      CFCalfValue := LSInventory.CalvesCF;
      CFCalf.Caption := FloatToStr(CFCalfValue);

      CFHeiferValue := LSInventory.HeifersCF;
      CFHeifer.Caption := FloatToStr(CFHeiferValue);

      CFBeefValue := LSInventory.SteersCF;
      CFBeef.Caption := FloatToStr(CFBeefValue);

      CFOtherValue := LSInventory.OtherCF;
      CFOther.Caption := FloatToStr(CFOtherValue);

      TotalAnimalBF := LSInventory.TotalBF;
      TotalAnimalCF := LSInventory.TotalCF;

      TotAnimalBF.Caption := IntToStr(TotalAnimalBF);
      TotAnimalCF.Caption := IntToStr(TotalAnimalCF);

(*    BFCowValue := LSInventory.CowsBF;
      TempFloat := ( BFCowValue * 1 );
      BFCow.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUBF, TempFloat );

      BFBullsValue := LSInventory.BullsBF;
      TempFloat := ( BFBullsValue * 1 );
      BFBulls.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUBF, TempFloat );

      BFCalfValue := LSInventory.CalvesBF;
      TempFloat := ( BFCalfValue * 0.3 );
      BFCalf.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUBF, TempFloat );

      BFHeiferValue := LSInventory.HeifersBF;
      TempFloat := ( BFHeiferValue * 0.6 );
      BFHeifer.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUBF, TempFloat );

      BFBeefValue := LSInventory.SteersBF;
      TempFloat := ( BFBeefValue * 0.6 );
      BFBeef.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUBF, TempFloat );

      BFOtherValue := LSInventory.OtherBF;
      TempFloat := ( BFOtherValue * 1 );
      BFOther.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUBF, TempFloat );

      { Carried Forward Livestock Units }

      CFCowValue := LSInventory.CowsCF;
      TempFloat := ( CFCowValue * 1 );
      CFCow.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUCF, TempFloat );

      CFBullsValue := LSInventory.BullsCF;
      TempFloat := ( CFBullsValue * 1 );
      CFBulls.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUCF, TempFloat );

      // Farm Details..
      NoOfCows.Caption := IntToStr(CFCowValue);

      CFCalfValue := LSInventory.CalvesCF;
      TempFloat := ( CFCalfValue * 0.3 );
      CFCalf.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUCF, TempFloat );

      CFHeiferValue := LSInventory.HeifersCF;
      TempFloat := ( CFHeiferValue * 0.6 );
      CFHeifer.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUCF, TempFloat );

      CFBeefValue := LSInventory.SteersCF;
      TempFloat := ( CFBeefValue * 0.6 );
      CFBeef.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUCF, TempFloat );

      CFOtherValue := LSInventory.OtherCF;
      TempFloat := ( CFOtherValue * 1 );
      CFOther.Caption := FloatToStr(TempFloat);
      IncFloat( TotalLUCF, TempFloat );

      TotalAnimalBF := LSInventory.TotalBF;
      TotalAnimalCF := LSInventory.TotalCF;

      TotAnimalBF.Caption := IntToStr(TotalLUBF);
      TotAnimalCF.Caption := IntToStr(TotalLUCF);

                  }*)
   finally
      FreeAndNil(LSInventory);
   end;

   if FileExists('C:\Kingswood Herd Management\Inventory For Accs.txt') then
      DeleteFile('C:\Kingswood Herd Management\Inventory For Accs.txt');
   {if FileExists('C:\Kingswood Herd Management\Inventory For Accs.txt') then
      begin
         AssignFile(InventoryForAccs, 'C:\Kingswood Herd Management\Inventory For Accs.txt');
         Reset(InventoryForAccs);
         CaptionNum := 1;
         while not EOF(InventoryForAccs) do
            begin
               ReadLn(InventoryForAccs, buffer);
               CaptionValue :=  Buffer;
               AssignCaptionValues;
               CaptionNum := CaptionNum + 1;
            end;
         CloseFile(InventoryForAccs);

   }
         SetLUCaptions;
         ResetYearCaption;
         GetFarmExpenses;
         GetLastFarmExpenses;
         GetBudgetFarmExpenses;
{      end
   else
      begin
         Messagedlg ('You must update figures before you can continue',mtInformation,[mbok],0);
         Abort;
      end;
}
   WinData.LiveStockValues.Open;
   if ((WinData.UserDefaultHerdID <> WinData.NONEHerdID) and (WinData.LiveStockValues.Locate('HerdID', WinData.UserDefaultHerdID, []))) then
   begin
      lTotStock.Caption  := CurrToStrF(WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat-
                                      WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat,
                                      ffCurrency, 2);
      TotStockChange := (WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat-
                                      WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat);
   end;
end;

procedure TfmSWSReport.lTotBeefSheepPrint(sender: TObject;
  var Value: String);
var
   TempF : Double;
   TempF1 : Double;
begin
   TempF := 0;
   TempF1 := 0;
   with NLAccs do
       try
          First;
          if Locate('ID', 22, []) then
             begin
                TempF := FieldByName('Balance').AsFloat;
                Next;
                TempF := TempF + FieldByName('Balance').AsFloat;
             end;
          First;
          if Locate('ID', 34, []) then
             begin
                TempF1 := FieldByName('Balance').AsFloat;
                Next;
                TempF1 := TempF1 + FieldByName('Balance').AsFloat;
             end;
          Value := CurrToStrF(TempF + TempF1, ffCurrency, 2);
          TotBeefSheep := (TempF + TempF1);
       except
          DisplayMsgDlg(Format(ErrorMsgStr, ['total sheep']));
       end;
end;

procedure TfmSWSReport.lTotCullCowPrint(sender: TObject;
  var Value: String);
begin
   TotCullCow := (getAccData.TotalCullCattle);
   if TotCullCow > 0 then
      Value := CurrToStrF((TotCullCow), ffCurrency, 2)
end;

procedure TfmSWSReport.lTotODairySalesPrint(sender: TObject;
  var Value: String);
var
   TempF : Double;
   TempF1 : Double;
begin
   TempF := 0;
   TempF1 := 0;
   with NLAccs do
      try
         First;
         if Locate('ID', 7, []) then
            TempF := (FieldByName('Balance').AsFloat);
         First;
         if Locate('ID', 11, []) then
            TempF1 := (FieldByName('Balance').AsFloat);
         Value := CurrToStrF(TempF + TempF1, ffCurrency, 2);
         TotDairyStock := (TempF + TempF1);
      except
         DisplayMsgDlg(Format(ErrorMsgStr, ['total dairy sales']));
      end;
end;

procedure TfmSWSReport.lTotCalfSalesPrint(sender: TObject;
  var Value: String);
begin
   TotCalfSale := (getAccData.TotalCalfSales);
   if TotCalfSale > 0 then
      Value := CurrToStrF((TotCalfSale), ffCurrency, 2);
end;

procedure TfmSWSReport.lTotTillageSalePrint(sender: TObject;
  var Value: String);
begin
   with GenQuery do
      try
         SQL.Clear;
         SQL.Add('Select SUM(Balance) Result From NLaccs Where ID IN (41, 42, 43, 44, 45, 46)');
         Open;
         try
            Value := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2);
            TotTillageSale := (FieldByName('Result').AsFloat);
         finally
            Close;
         end;
      except
         DisplayMsgDlg(Format(ErrorMsgStr, ['total tillage sales']));
      end;
end;

procedure TfmSWSReport.FormDestroy(Sender: TObject);
begin
   if getAccData <> nil then
      FreeAndNil(getAccData);
end;

procedure TfmSWSReport.ResetYearCaption;
var i: integer;
begin
   for i := 0 to qrTitle.ControlCount -1 do
      begin
         if qrTitle.Controls[i] is TQRLabel then
            if (qrTitle.Controls[i] as TQRLabel).Tag = 1 then
               (qrTitle.Controls[i] as TQRLabel).Caption := '2004';
      end;

end;

procedure TfmSWSReport.GetFarmExpenses;
begin
   try
      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('Select Sum (Balance) as StockPurch');
            SQL.Add('From NLAccs where Category = "EE"');
            { 14/02/05 SP Include EE ID's ' 201, 202, 221, 222, 241, 242, 261, 262, 263 ' }
            SQL.Add('and ( ID in ( 201, 202, 221, 222, 241, 242, 261, 262, 263 ) ) ');
            Open;
            try
               lStockPurch.Caption := CurrToStrF(FieldByName('StockPurch').AsCurrency, ffCurrency, 2);
               StockPurchase := (FieldByName('StockPurch').AsCurrency);
            finally
               Close;
            end;
         end;
   except
      DisplayMsgDlg(Format(ErrorMsgStr, ['farm expenses']));
   end;
end;

procedure TfmSWSReport.lTotPremHeadPrint(sender: TObject;
  var Value: String);
begin
   TotPremiumHead := (getAccData.TotalPremiumHeadage);
   if TotPremiumHead > 0 then
      Value := CurrToStrF((TotPremiumHead), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel39Print(sender: TObject; var Value: String);
begin
   Health := (getAccData.TotalVet);
   if Health > 0 then
      Value := CurrToStrF((Health), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel40Print(sender: TObject; var Value: String);
begin
   Breeding := (getAccData.TotalBreeding);
   if Breeding > 0 then
      Value := CurrToStrF((Breeding), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel41Print(sender: TObject; var Value: String);
begin
   MilkRec := (getAccData.TotalMilkRec);
   if MilkRec > 0 then
      Value := CurrToStrF((MilkRec), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel43Print(sender: TObject; var Value: String);
begin
   DairyCon := (getAccData.TotalDairyConcent);
   if DairyCon > 0 then
      Value := CurrToStrF((DairyCon), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel44Print(sender: TObject; var Value: String);
begin
   Concentrate := ((getAccData.TotalConcent) - (getAccData.TotalDairyConcent));
   if Concentrate > 0 then
      Value := CurrToStrF((Concentrate), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel45Print(sender: TObject; var Value: String);
begin
   SilageHay := ((getAccData.TotalPurchForage)+(getAccData.TotalStraw));
   if SilageHay > 0 then
      Value := CurrToStrF((SilageHay), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel46Print(sender: TObject; var Value: String);
begin
   OtherCost :=(getAccData.TotalSillageAdd);
   if OtherCost > 0 then
      Value := CurrToStrF((OtherCost), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel47Print(sender: TObject; var Value: String);
begin
   SilageContract := (getAccData.TotalContractor);
   if SilageContract > 0 then
      Value := CurrToStrF((SilageContract), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel49Print(sender: TObject; var Value: String);
begin
   FertLime := ((getAccData.TotalFert)+(getAccData.TotalLime));
   if FertLime > 0 then
      Value := CurrToStrF((FertLime), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel50Print(sender: TObject; var Value: String);
begin
   SeedSpray := (getAccData.TotalSeedSpray);
   if SeedSpray > 0 then
      Value := CurrToStrF((SeedSpray), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel51Print(sender: TObject; var Value: String);
begin
   Machinery := (getAccData.TotalMachRun);
   if Machinery > 0 then
      Value := CurrToStrF((Machinery), ffCurrency, 2);
end;

procedure TfmSWSReport.lLandLeasePrint(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Balance');
         SQL.Add('From NLAccs where RepGroup = 415');
         SQL.Add('and id = 415');
         Open;
         landLease := (FieldByName('Balance').AsCurrency);
         if LandLease > 0 then
            Value := FloatToStrF((landLease), ffCurrency, 8, 2);
      finally
         Close;
      end;
end;

procedure TfmSWSReport.lQuotaLeasePrint(sender: TObject;
  var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Balance');
         SQL.Add('From NLAccs where RepGroup = 415');
         SQL.Add('and id = 416');
         Open;
         QuotaLease := (FieldByName('Balance').AsCurrency);
         if QuotaLease > 0 then
            Value := FloatToStrF((QuotaLease), ffCurrency, 8, 2);
      finally
         Close;
      end;
end;

procedure TfmSWSReport.QRLabel54Print(sender: TObject; var Value: String);
begin
   Wages :=  (getAccData.TotalWages);
   if Wages > 0 then
      Value := CurrToStrF((Wages), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel56Print(sender: TObject; var Value: String);
begin
   Car := (getAccData.TotalCar);
   if Car > 0 then
      Value := CurrToStrF((Car), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel59Print(sender: TObject; var Value: String);
begin
   Maintenance := (getAccData.TotalRepairs);
   if Maintenance > 0 then
      Value := CurrToStrF((Maintenance), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel60Print(sender: TObject; var Value: String);
begin
   ESBPhone := ((getAccData.TotalESB)+(getAccData.TotalPhone));
   if ESBPhone > 0 then
      Value := CurrToStrF((ESBPhone), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel61Print(sender: TObject; var Value: String);
begin
   Account := (getAccData.TotalProfFees);
   if Account > 0 then
      Value := CurrToStrF((Account), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel63Print(sender: TObject; var Value: String);
begin
   Insurance := (getAccData.TotalInsurance);
   if Insurance > 0 then
      Value := CurrToStrF((Insurance), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel65Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Sum(Balance) as Transport');
         SQL.Add('From NLAccs where RepGroup = 208');
         SQL.Add('and id in (213, 232, 252, 272, 285, 309)');
         Open;
         StockHaulage := FieldByName('Transport').AsCurrency;
         if StockHaulage > 0 then
            Value := FloatToStrF(StockHaulage, ffCurrency, 8, 2);
      finally
         Close;
      end;
end;

procedure TfmSWSReport.QRLabel64Print(sender: TObject; var Value: String);
begin
   Interest := (getAccData.TotalOverDraft);
   if Interest > 0 then
      Value := CurrToStrF(Interest, ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel207Print(sender: TObject; var Value: String);
begin
   TotalSundry := ((getAccData.TotalSundryVar)+(getAccData.TotalSundryFix));
   if TotalSundry > 0 then
      Value := CurrToStrF((TotalSundry), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel208Print(sender: TObject; var Value: String);
begin
   Dep := ((getAccData.TotalDepMach)+ (getAccData.TotalDepBuild));
   if Dep > 0 then
      Value := CurrToStrF((Dep), ffCurrency, 2);
end;

procedure TfmSWSReport.lTotSalesAnsPrint(sender: TObject; var Value: String);
begin
   TotalSales := (TotMilkSales + TotBeefSheep + TotCullCow + TotDairyStock +
                        TotCalfSale  + TotFarmIn + TotTillageSale + TotPremiumHead +
                        TotStockChange);
   if TotalSales > 0 then
      Value := CurrToStrF(TotalSales, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel209Print(sender: TObject; var Value: String);
begin
   TotalCost := (StockPurchase+ Health+ Breeding+ MilkRec+ ParlourCost+ DairyCon+ Concentrate+
                    SilageHay+ OtherCost+ SilageContract+ OtherContract+ FertLime+ SeedSpray+
                    Machinery+ landLease+ QuotaLease+ Wages+ Car+ Maintenance+ ESBPhone+ Account+
                    Insurance+ StockHaulage+ Interest+ TotalSundry+ Dep);
   if TotalCost > 0 then
      Value := CurrToStrF(TotalCost, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel38Print(sender: TObject; var Value: String);
begin
   if ( TotalSales > 0 ) then
      Value := FloatToStrF((( TotalCost / TotalSales ) * 100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel52Print(sender: TObject; var Value: String);
begin
   TotFarmSurplus := (TotalSales - TotalCost);
   Value := CurrToStrF(TotFarmSurplus, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel53Print(sender: TObject; var Value: String);
begin
   ComparableSurplus := (TotalCost + landLease + QuotaLease);
   Value := CurrToStrF(ComparableSurplus, ffCurrency, 2 );
end;

procedure TfmSWSReport.lLandOwnPrint(sender: TObject; var Value: String);
begin
   Value := FloatToStrF(GetLandOwned, ffFixed, 8, 2);
//   LandOwned := (getAccData.LandOwned);
//   Value := CurrToStrF((LandOwned), ffCurrency, 2);
end;

procedure TfmSWSReport.llandLPrint(sender: TObject; var Value: String);
begin
//  Value := CurrToStrF((landLease), ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel140Print(sender: TObject; var Value: String);
begin
//  TotalLand := (landLease + LandOwned);
  TotalLand := GetLandOwned;
  if TotalLand > 0 then
     Value := FloatToStrF(TotalLand, ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel144Print(sender: TObject; var Value: String);
begin
   QuotaOwned := 0;
   with qQuota do
      try
         SQL.Clear;
         SQL.Add('Select MilkQuota');
         SQL.Add('From Owners ');
         SQL.Add('Where ( ID =:HID )');
         SQL.Add('And ( MilkQuota > 0 )');
         ParamByName('HID').Value := HerdId;
         Open;
         if FieldByName('MilkQuota').AsFloat > 0 then
            begin
               Value := FloatToStrF(FieldByName('MilkQuota').AsFloat, ffFixed, 8, 2);
               QuotaOwned := (FieldByName('MilkQuota').AsFloat);
            end;
         Close;
      except
         On e:EDatabaseerror do
            ShowMessage(e.Message);
      end;
{   QuotaOwned := (getAccData.QuotaOwned);
   if QuotaOwned > 0 then
      Value := CurrToStrF(QuotaOwned, ffCurrency, 2 );     }
end;

procedure TfmSWSReport.QRLabel143Print(sender: TObject; var Value: String);
begin
   if QuotaLease > 0 then
      Value := CurrToStrF(QuotaLease, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel127Print(sender: TObject; var Value: String);
begin
   TotalQuota := QuotaOwned;
   if TotalQuota > 0 then
      Value := CurrToStrF(TotalQuota, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel153Print(sender: TObject; var Value: String);
begin
   if (CFCowValue > 0) then
      Value := FloatToStrF((TotalLand / CFCowValue), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.AcresLUPrint(sender: TObject; var Value: String);
begin
//   if CFCowValue > 0 then
  //    Value := FloatToStrF((TotalLand / CFCowValue), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel157Print(sender: TObject; var Value: String);
begin
   if CFCowValue > 0 then
      Value := FloatToStrF((TotalQuota / CFCowValue), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel159Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((QuotaOwned / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalMilkSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value :=  FloatToStrF((LastMilkSales / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalBeefSheepPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastBeefSheep / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGallCullCowPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastCullCow / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalODairySalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((lastDairyStock / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalCalfSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastCalfSale / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalTillageSalePrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastTillageSale / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalPremHeadPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastPremiumHead / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalStockPrint(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastStockChange / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalTotSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastTotalSales / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lGalFarmIncPrint(sender: TObject;
  var Value: String);
begin
   if TotalQuota > 0 then
      Value := FloatToStrF((LastFarmIn / TotalQuota), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreMilkSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastMilkSales / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreBeefSheepPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastBeefSheep / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreCullCowPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastCullCow / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreODairySalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastDairyStock / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreCalfSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastCalfSale / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreFarmIncPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastFarmIn / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreTillageSalePrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastTillageSale / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcrePremHeadPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastPremiumHead / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreStockPrint(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastStockChange / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lAcreTotSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastTotalSales / TotalLand), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.LUMilkSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastMilkSales / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.LUBeefSheepPrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastBeefSheep / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.LUCullCowPrint(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastCullCow / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUODairySalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastDairyStock / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUCalfSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastCalfSale / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUFarmIncPrint(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastFarmIn / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUTillageSalePrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastTillageSale / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUPremHeadPrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastPremiumHead / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUStockPrint(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastStockChange / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lLUTotSalesPrint(sender: TObject;
  var Value: String);
begin
   if TotalLUBF  > 0 then
      Value := FloatToStrF((LastTotalSales / TotalLUBF), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.CostMilkSalesPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastMilkSales / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.CostBeefSheepPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastBeefSheep / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.CostCullCowPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastCullCow / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostODairySalesPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastDairyStock / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostCalfSalesPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastCalfSale / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostFarmIncPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastFarmIn / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostTillageSalePrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastTillageSale / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostPremHeadPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastPremiumHead / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostStockPrint(sender: TObject; var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastStockChange / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.lCostTotSalesPrint(sender: TObject;
  var Value: String);
begin
   if LastTotalSales  > 0 then
      Value := FloatToStrF(((LastTotalSales / LastTotalSales)*100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel88Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalStockPurchase := (LastStockPurchase / TotalQuota);
         Value := FloatToStrF(GalStockPurchase, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel111Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreStockPurchase := (LastStockPurchase / TotalLand);
         Value := FloatToStrF(AcreStockPurchase, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel147Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUStockPurchase := (LastStockPurchase / TotalLUBF);
         Value := FloatToStrF(LUStockPurchase, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel185Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastStockPurchase > 0)) then
      begin
         PercStockPurchase := (LastStockPurchase / LastTotalCost);
         Value := FloatToStrF((PercStockPurchase * 100), ffFixed, 8, 2 );
      end;
end;
procedure TfmSWSReport.QRLabel89Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalHealth := (LastHealth / TotalQuota);
         Value := FloatToStrF(GalHealth, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel112Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
      AcreHealth := (LastHealth / TotalLand);
      Value := FloatToStrF(AcreHealth, ffFixed, 8, 2 );
      end;

end;

procedure TfmSWSReport.QRLabel149Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUHealth := (LastHealth / TotalLUBF);
         Value := FloatToStrF(LUHealth, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel186Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastHealth >0 )) then
      begin
         PercHealth := ((LastHealth / LastTotalCost)*100);
         Value := FloatToStrF(PercHealth, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel90Print(sender: TObject; var Value: String);
begin
   if ((TotalQuota > 0) and (Breeding > 0)) then
      begin
         GalBreeding := (LastBreeding / TotalQuota);
         Value := FloatToStrF(GalBreeding, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel113Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreBreeding := (LastBreeding / TotalLand);
         Value := FloatToStrF(AcreBreeding, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel150Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUBreeding := (LastBreeding / TotalLUBF);
         Value := FloatToStrF(LUBreeding, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel187Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (Breeding > 0)) then
      begin
         PercBreeding := ((LastBreeding / LastTotalCost)*100);
         Value := FloatToStrF(PercBreeding, ffFixed, 8, 2 );
      end;

end;

procedure TfmSWSReport.QRLabel91Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalMilkRec := (LastMilkRec / TotalQuota);
         Value := FloatToStrF(GalMilkRec, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel116Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreMilkRec := (LastMilkRec / TotalLand);
         Value := FloatToStrF(AcreMilkRec, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel164Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUMilkRec := (LastMilkRec / TotalLUBF);
         Value := FloatToStrF(LUMilkRec, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel188Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastMilkRec >0 )) then
      begin
         PercMilkRec := ((LastMilkRec / LastTotalCost)*100);
         Value := FloatToStrF(PercMilkRec, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel92Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalParlourCost := (LastParlourCost / TotalQuota);
         Value := FloatToStrF(GalParlourCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel117Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreParlourCost := (LastParlourCost / TotalLand);
         Value := FloatToStrF(AcreParlourCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel166Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUParlourCost := (LastParlourCost / TotalLUBF);
         Value := FloatToStrF(LUParlourCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel189Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastParlourCost > 0 ))then
      begin
         PercParlourCost := ((LastParlourCost / LastTotalCost)*100);
         Value := FloatToStrF(PercParlourCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel93Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalDairyCon := (LastDairyCon / TotalQuota);
         Value := FloatToStrF(GalDairyCon, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel120Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreDairyCon := (LastDairyCon / TotalLand);
         Value := FloatToStrF(AcreDairyCon, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel167Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUDairyCon := (LastDairyCon / TotalLUBF);
         Value := FloatToStrF(LUDairyCon, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel190Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastDairyCon >0)) then
      begin
         PercDairyCon := ((LastDairyCon / LastTotalCost)*100);
         Value := FloatToStrF(PercDairyCon, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel94Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalConcentrate := (LastConcentrate / TotalQuota);
         Value := FloatToStrF(GalConcentrate, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel122Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreConcentrate := (LastConcentrate / TotalLand);
         Value := FloatToStrF(AcreConcentrate, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel168Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUConcentrate := (LastConcentrate / TotalLUBF);
         Value := FloatToStrF(LUConcentrate, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel191Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastConcentrate > 0 ))then
      begin
         PercConcentrate := ((LastConcentrate / LastTotalCost)*100);
         Value := FloatToStrF(PercConcentrate, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel95Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalSilageHay := (LastSilageHay / TotalQuota);
         Value := FloatToStrF(GalSilageHay, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel123Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreSilageHay := (LastSilageHay / TotalLand);
         Value := FloatToStrF(AcreSilageHay, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel169Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUSilageHay := (LastSilageHay / TotalLUBF);
         Value := FloatToStrF(LUSilageHay, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel192Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastSilageHay > 0)) then
      begin
         PercSilageHay := ((LastSilageHay / LastTotalCost)*100);
         Value := FloatToStrF(PercSilageHay, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel96Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalOtherCost := (LastOtherCost / TotalQuota);
         Value := FloatToStrF(GalOtherCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel125Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreOtherCost := (LastOtherCost / TotalLand);
         Value := FloatToStrF(AcreOtherCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel170Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUOtherCost := (LastOtherCost / TotalLUBF);
         Value := FloatToStrF(LUOtherCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel193Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastOtherCost>0)) then
      begin
         PercOtherCost := ((LastOtherCost / LastTotalCost)*100);
         Value := FloatToStrF(PercOtherCost, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel97Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalSilageContract := (LastSilageContract / TotalQuota);
         Value := FloatToStrF(GalSilageContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel126Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreSilageContract := (LastSilageContract / TotalLand);
         Value := FloatToStrF(AcreSilageContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel172Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUSilageContract := (LastSilageContract / TotalLUBF);
         Value := FloatToStrF(LUSilageContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel194Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastSilageContract >0)) then
      begin
         PercSilageContract := ((LastSilageContract / LastTotalCost)*100);
         Value := FloatToStrF(PercSilageContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel98Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalOtherContract := (LastOtherContract / TotalQuota);
         Value := FloatToStrF(GalOtherContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel128Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreOtherContract := (LastOtherContract / TotalLand);
         Value := FloatToStrF(AcreOtherContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel173Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUOtherContract := (LastOtherContract / TotalLUBF);
         Value := FloatToStrF(LUOtherContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel195Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastOtherContract > 0 )) then
      begin
         PercOtherContract := ((LastOtherContract / LastTotalCost)*100);
         Value := FloatToStrF(PercOtherContract, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel99Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalFertLime := (LastFertLime / TotalQuota);
         Value := FloatToStrF(GalFertLime, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel129Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreFertLime := (LastFertLime / TotalLand);
         Value := FloatToStrF(AcreFertLime, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel174Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUFertLime := (LastFertLime / TotalLUBF);
         Value := FloatToStrF(LUFertLime, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel196Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastFertLime > 0)) then
      begin
         PercFertLime := ((LastFertLime / LastTotalCost)*100);
         Value := FloatToStrF(PercFertLime, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel100Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalSeedSpray := (LastSeedSpray / TotalQuota);
         Value := FloatToStrF(GalSeedSpray, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel130Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreSeedSpray := (LastSeedSpray / TotalLand);
         Value := FloatToStrF(AcreSeedSpray, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel175Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUSeedSpray := (LastSeedSpray / TotalLUBF);
         Value := FloatToStrF(LUSeedSpray, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel197Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastSeedSpray > 0)) then
      begin
         PercSeedSpray := ((LastSeedSpray / LastTotalCost)*100);
         Value := FloatToStrF(PercSeedSpray, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel101Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalMachinery := (LastMachinery / TotalQuota);
         Value := FloatToStrF(GalMachinery, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel132Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreMachinery := (LastMachinery / TotalLand);
         Value := FloatToStrF(AcreMachinery, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel176Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUMachinery := (LastMachinery / TotalLUBF);
      Value := FloatToStrF(LUMachinery, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel198Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastMachinery > 0)) then
      begin
         PercMachinery := ((LastMachinery / LastTotalCost)*100);
         Value := FloatToStrF(PercMachinery, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel102Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GallandLease := (LastlandLease / TotalQuota);
         Value := FloatToStrF(GallandLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel133Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcrelandLease := (LastlandLease / TotalLand);
         Value := FloatToStrF(AcrelandLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel178Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUlandLease := (LastlandLease / TotalLUBF);
         Value := FloatToStrF(LUlandLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel199Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastlandLease > 0)) then
      begin
         PerclandLease := ((LastlandLease / LastTotalCost)*100);
         Value := FloatToStrF(PerclandLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel103Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalQuotaLease := (LastQuotaLease / TotalQuota);
         Value := FloatToStrF(GalQuotaLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel134Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreQuotaLease := (LastQuotaLease / TotalLand);
         Value := FloatToStrF(AcreQuotaLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel179Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUQuotaLease := (LastQuotaLease / TotalLUBF);
         Value := FloatToStrF(LUQuotaLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel200Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastQuotaLease > 0)) then
      begin
         PercQuotaLease := ((LastQuotaLease / LastTotalCost)*100);
         Value := FloatToStrF(PercQuotaLease, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel104Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalWages := (LastWages / TotalQuota);
         Value := FloatToStrF(GalWages, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel135Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreWages :=  (LastWages / TotalLand);
         Value := FloatToStrF(AcreWages, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel180Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUWages := (LastWages / TotalLUBF);
         Value := FloatToStrF(LUWages, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel201Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastWages >0 ))then
      begin
         PercWages := ((LastWages / LastTotalCost)*100);
         Value := FloatToStrF(PercWages, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel105Print(sender: TObject; var Value: String);
begin
   if ((TotalQuota > 0) and (LastCar > 0)) then
      begin
         GalCar := (LastCar / TotalQuota);
         Value := FloatToStrF(GalCar, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel136Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreCar := (LastCar / TotalLand);
         Value := FloatToStrF(AcreCar, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel181Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUCar := (LastCar / TotalLUBF);
         Value := FloatToStrF(LUCar, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel202Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastCar >0 )) then
      begin
         PercCar := ((LastCar / LastTotalCost)*100);
         Value := FloatToStrF(PercCar, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel106Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalMaintenance := (LastMaintenance / TotalQuota);
         Value := FloatToStrF(GalMaintenance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel137Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreMaintenance :=  (LastMaintenance / TotalLand);
         Value := FloatToStrF(AcreMaintenance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel182Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUMaintenance := (LastMaintenance / TotalLUBF);
         Value := FloatToStrF(LUMaintenance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel203Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastMaintenance > 0 )) then
      begin
         PercMaintenance := ((LastMaintenance / LastTotalCost)*100);
         Value := FloatToStrF(PercMaintenance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel107Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalESBPhone := (LastESBPhone / TotalQuota);
         Value := FloatToStrF(GalESBPhone, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel138Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreESBPhone := (LastESBPhone / TotalLand);
         Value := FloatToStrF(AcreESBPhone, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel183Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUESBPhone := (LastESBPhone / TotalLUBF);
         Value := FloatToStrF(LUESBPhone, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel204Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastESBPhone > 0)) then
      begin
         PercESBPhone := ((LastESBPhone / LastTotalCost)*100);
         Value := FloatToStrF(PercESBPhone, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel108Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalAccount := (LastAccount / TotalQuota);
         Value := FloatToStrF(GalAccount, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel141Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreAccount := (LastAccount / TotalLand);
         Value := FloatToStrF(AcreAccount, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel184Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUAccount := (LastAccount / TotalLUBF);
         Value := FloatToStrF(LUAccount, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel205Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastAccount >0)) then
      begin
         PercAccount := ((LastAccount / LastTotalCost)*100);
         Value := FloatToStrF(PercAccount, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel109Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalInsurance := (LastInsurance / TotalQuota);
         Value := FloatToStrF(GalInsurance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel142Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreInsurance := (LastInsurance / TotalLand);
         Value := FloatToStrF(AcreInsurance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel110Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUInsurance := (LastInsurance / TotalLUBF);
         Value := FloatToStrF(LUInsurance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel206Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastInsurance >0 )) then
      begin
         PercInsurance := ((LastInsurance / LastTotalCost)*100);
         Value := FloatToStrF(PercInsurance, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel218Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalStockHaulage := (LastStockHaulage / TotalQuota);
         Value := FloatToStrF(GalStockHaulage, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel225Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreStockHaulage := (LastStockHaulage / TotalLand);
         Value := FloatToStrF(AcreStockHaulage, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel233Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUStockHaulage := (LastStockHaulage / TotalLUBF);
         Value := FloatToStrF(LUStockHaulage, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel241Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastStockHaulage > 0 ))then
      begin
         PercStockHaulage := ((LastStockHaulage / LastTotalCost)*100);
         Value := FloatToStrF(PercStockHaulage, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel219Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalInterest := (LastInterest / TotalQuota);
         Value := FloatToStrF(GalInterest, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel226Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreInterest := (LastInterest / TotalLand);
         Value := FloatToStrF(AcreInterest, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel234Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
        LUInterest := (LastInterest / TotalLUBF);
        Value := FloatToStrF(LUInterest, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel242Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastInterest >0 )) then
      begin
         PercInterest := ((LastInterest / LastTotalCost)*100);
         Value := FloatToStrF(PercInterest, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel220Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalTotalSundry := (LastTotalSundry / TotalQuota);
         Value := FloatToStrF(GalTotalSundry, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel227Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreTotalSundry := (LastTotalSundry / TotalLand);
         Value := FloatToStrF(AcreTotalSundry, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel235Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUTotalSundry := (LastTotalSundry / TotalLUBF);
         Value := FloatToStrF(LUTotalSundry, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel243Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastTotalSundry >0 )) then
      begin
         PercTotalSundry := ((LastTotalSundry / LastTotalCost)*100);
         Value := FloatToStrF(PercTotalSundry, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel221Print(sender: TObject; var Value: String);
begin
   if TotalQuota > 0 then
      begin
         GalDep := (LastDep / TotalQuota);
         Value := FloatToStrF(GalDep, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel228Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      begin
         AcreDep := (LastDep / TotalLand);
         Value := FloatToStrF(AcreDep, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel236Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      begin
         LUDep := (LastDep / TotalLUBF);
         Value := FloatToStrF(LUDep, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel244Print(sender: TObject; var Value: String);
begin
   if ((LastTotalCost > 0) and (LastDep >0 )) then
      begin
         PercDep := ((LastDep / LastTotalCost)*100);
         Value := FloatToStrF(PercDep, ffFixed, 8, 2 );
      end;
end;

procedure TfmSWSReport.QRLabel222Print(sender: TObject; var Value: String);
begin
    GalTotalCost := (GalStockPurchase+ GalHealth+ GalBreeding+ GalMilkRec+ GalParlourCost+ GalDairyCon+ GalConcentrate+
    GalSilageHay+ GalOtherCost+ GalSilageContract+ GalOtherContract+ GalFertLime+ GalSeedSpray+
    GalMachinery+ GallandLease+ GalQuotaLease+ GalWages+ GalCar+ GalMaintenance+ GalESBPhone+ GalAccount+
    GalInsurance+ GalStockHaulage+ GalInterest+ GalTotalSundry+ GalDep);
    Value := FloatToStrF(GalTotalCost, ffFixed, 8, 2 );


end;

procedure TfmSWSReport.QRLabel229Print(sender: TObject; var Value: String);
begin
    AcreTotalCost := (AcreStockPurchase+ AcreHealth+ AcreBreeding+ AcreMilkRec+ AcreParlourCost+ AcreDairyCon+ AcreConcentrate+
    AcreSilageHay+ AcreOtherCost+ AcreSilageContract+ AcreOtherContract+ AcreFertLime+ AcreSeedSpray+
    AcreMachinery+ AcrelandLease+ AcreQuotaLease+ AcreWages+ AcreCar+ AcreMaintenance+ AcreESBPhone+ AcreAccount+
    AcreInsurance+ AcreStockHaulage+ AcreInterest+ AcreTotalSundry+ AcreDep);
    Value := FloatToStrF(AcreTotalCost, ffFixed, 8, 2 );

end;

procedure TfmSWSReport.QRLabel237Print(sender: TObject; var Value: String);
begin
    LUTotalCost := (LUStockPurchase+ LUHealth+ LUBreeding+ LUMilkRec+ LUParlourCost+ LUDairyCon+ LUConcentrate+
    LUSilageHay+ LUOtherCost+ LUSilageContract+ LUOtherContract+ LUFertLime+ LUSeedSpray+
    LUMachinery+ LUlandLease+ LUQuotaLease+ LUWages+ LUCar+ LUMaintenance+ LUESBPhone+ LUAccount+
    LUInsurance+ LUStockHaulage+ LUInterest+ LUTotalSundry+ LUDep);
    Value := FloatToStrF(LUTotalCost, ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel245Print(sender: TObject; var Value: String);
begin
    PercTotalCost := (PercStockPurchase+ PercHealth+ PercBreeding+ PercMilkRec+ PercParlourCost+ PercDairyCon+ PercConcentrate+
    PercSilageHay+ PercOtherCost+ PercSilageContract+ PercOtherContract+ PercFertLime+ PercSeedSpray+
    PercMachinery+ PerclandLease+ PercQuotaLease+ PercWages+ PercCar+ PercMaintenance+ PercESBPhone+ PercAccount+
    PercInsurance+ PercStockHaulage+ PercInterest+ PercTotalSundry+ PercDep);
    Value := FloatToStrF(PercTotalCost, ffFixed, 8, 2 );

end;

procedure TfmSWSReport.QRLabel224Print(sender: TObject; var Value: String);
begin
   if QuotaOwned > 0 then
      Value := FloatToStrF((LastTotFarmSurplus/QuotaOwned), ffFixed, 8, 2);
end;

procedure TfmSWSReport.QRLabel231Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastTotFarmSurplus/TotalLand), ffFixed, 8, 2);
end;

procedure TfmSWSReport.QRLabel239Print(sender: TObject; var Value: String);
begin
   if TotalLUBF > 0 then
      Value := FloatToStrF((LastTotFarmSurplus/TotalLUBF), ffFixed, 8, 2);
end;

procedure TfmSWSReport.QRLabel251Print(sender: TObject; var Value: String);
begin
   if QuotaOwned > 0 then
      Value := FloatToStrF((LastComparableSurplus/QuotaOwned), ffFixed, 8, 2);
end;

procedure TfmSWSReport.QRLabel232Print(sender: TObject; var Value: String);
begin
   if TotalLand > 0 then
      Value := FloatToStrF((LastComparableSurplus/TotalLand), ffFixed, 8, 2);
end;

procedure TfmSWSReport.QRLabel240Print(sender: TObject; var Value: String);
begin
   if QuotaOwned > 0 then
      Value := FloatToStrF((LastComparableSurplus/QuotaOwned), ffFixed, 8, 2);
end;

procedure TfmSWSReport.lYear3Print(sender: TObject; var Value: String);
begin
   LastMilkSales := (getAccData.LastMilkSales);
   if LastMilkSales < 0 then
      LastMilkSales := (LastMilkSales * -1);
   Value := CurrToStrF((LastMilkSales), ffCurrency, 2);
end;

procedure TfmSWSReport.lYear4Print(sender: TObject; var Value: String);
var
   TempF : Double;
   TempF1 : Double;
begin
   TempF := 0;
   TempF1 := 0;
    with NLAccs do
       begin
          First;
          if Locate('ID', 22, []) then
             begin
                TempF := FieldByName('YearTot1').AsFloat;
                Next;
                TempF := TempF + FieldByName('YearTot1').AsFloat;
             end;
          First;
          if Locate('ID', 34, []) then
             begin
                TempF1 := FieldByName('YearTot1').AsFloat;
                Next;
                TempF1 := TempF1 + FieldByName('YearTot1').AsFloat;
             end;
          LastBeefSheep := (TempF + TempF1);
          if LastBeefSheep < 0 then
             LastBeefSheep := (LastBeefSheep * -1);
          Value := CurrToStrF(LastBeefSheep, ffCurrency, 2);
       end;

end;

procedure TfmSWSReport.lYear5Print(sender: TObject; var Value: String);
begin
   LastCullCow := (getAccData.LastCullCattle);
   if LastCullCow < 0 then
      LastCullCow := (LastCullCow * -1);
   Value := CurrToStrF(LastCullCow, ffCurrency, 2);
end;

procedure TfmSWSReport.lYear6Print(sender: TObject; var Value: String);
var
   TempF : Double;
   TempF1 : Double;
begin
   TempF := 0;
   TempF1 := 0;
   with NLAccs do
      begin
         First;
         if Locate('ID', 7, []) then
            TempF := (FieldByName('YearTot1').AsFloat);
         First;
         if Locate('ID', 11, []) then
            TempF1 := (FieldByName('YearTot1').AsFloat);
         LastDairyStock := (TempF + TempF1);
         if LastDairyStock < 0 then
            LastDairyStock := (LastDairyStock * -1);
         Value := CurrToStrF(LastDairyStock, ffCurrency, 2);
      end;
end;

procedure TfmSWSReport.lYear7Print(sender: TObject; var Value: String);
begin
   LastCalfSale := (getAccData.LastCalfSales);
   if LastCalfSale < 0 then
      LastCalfSale := (LastCalfSale * -1);
   Value := CurrToStrF(LastCalfSale, ffCurrency, 2);

end;

procedure TfmSWSReport.lYear9Print(sender: TObject; var Value: String);
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select SUM(YearTot1) Result From NLaccs Where ID IN (41, 42, 43, 44, 45, 46)');
         Open;

         LastTillageSale := (FieldByName('Result').AsFloat);
         if LastTillageSale < 0 then
            LastTillageSale := (LastTillageSale * -1);
         Value := CurrToStrF(LastTillageSale, ffCurrency, 2);
         Close;
      end;

end;

procedure TfmSWSReport.lYear10Print(sender: TObject; var Value: String);
begin
   LastPremiumHead := (getAccData.LastPremiumHeadage);
   if LastPremiumHead < 0 then
      LastPremiumHead := (LastPremiumHead * -1);
   Value := CurrToStrF(LastPremiumHead, ffCurrency, 2);
end;

procedure TfmSWSReport.lYear12Print(sender: TObject; var Value: String);
begin
   LastTotalSales := (LastMilkSales + LastBeefSheep + LastCullCow + LastDairyStock +
                        LastCalfSale  + LastFarmIn + LastTillageSale + LastPremiumHead +
                        LastStockChange);
   Value := CurrToStrF(LastTotalSales, ffCurrency, 2 );

end;

procedure TfmSWSReport.GetLastFarmExpenses;
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Sum (YearTot1) as LastStockPurch');
         SQL.Add('From NLAccs where Category = "EE"');
         Open;
         lLastStockPurch.Caption := CurrToStrF(FieldByName('LastStockPurch').AsCurrency, ffCurrency, 2);
         LastStockPurchase := (FieldByName('LastStockPurch').AsCurrency);
      finally
         Close;
      end;
end;

procedure TfmSWSReport.QRLabel67Print(sender: TObject; var Value: String);
begin
   LastHealth := (getAccData.TotalLastVet);
   Value := CurrToStrF((LastHealth), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel68Print(sender: TObject; var Value: String);
begin
   LastBreeding := (getAccData.LastBreeding);
   Value := CurrToStrF((LastBreeding), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel69Print(sender: TObject; var Value: String);
begin
   LastMilkRec := (getAccData.LastMilkRec);
   Value := CurrToStrF((LastMilkRec), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel71Print(sender: TObject; var Value: String);
begin
   LastDairyCon := (getAccData.LastDairyConcent);
   Value := CurrToStrF((LastDairyCon), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel72Print(sender: TObject; var Value: String);
begin
   LastConcentrate := ((getAccData.LastConcent) - (getAccData.LastDairyConcent));
   Value := CurrToStrF((LastConcentrate), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel73Print(sender: TObject; var Value: String);
begin
   LastSilageHay := ((getAccData.LastPurchForage)+(getAccData.LastStraw));
   Value := CurrToStrF((LastSilageHay), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel75Print(sender: TObject; var Value: String);
begin
   LastOtherCost :=(getAccData.LastSillageAdd);
   Value := CurrToStrF((LastOtherCost), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel74Print(sender: TObject; var Value: String);
begin
   LastSilageContract := (getAccData.LastContractor);
   Value := CurrToStrF((LastSilageContract), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel77Print(sender: TObject; var Value: String);
begin
   LastFertLime := ((getAccData.LastFert)+(getAccData.LastLime));
   Value := CurrToStrF((LastFertLime), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel78Print(sender: TObject; var Value: String);
begin
   LastSeedSpray := (getAccData.LastSeedSpray);
   Value := CurrToStrF((LastSeedSpray), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel79Print(sender: TObject; var Value: String);
begin
   LastMachinery := (getAccData.LastMachRun);
   Value := CurrToStrF((LastMachinery), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel80Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select YearTot1');
         SQL.Add('From NLAccs where RepGroup = 415');
         SQL.Add('and id = 415');
         Open;
         LastlandLease := (FieldByName('YearTot1').AsCurrency);
         Value := FloatToStrF((LastlandLease), ffCurrency, 8, 2);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel81Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select YearTot1');
         SQL.Add('From NLAccs where RepGroup = 415');
         SQL.Add('and id = 416');
         Open;
         LastQuotaLease := (FieldByName('YearTot1').AsCurrency);
         Value := FloatToStrF((LastQuotaLease), ffCurrency, 8, 2);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel82Print(sender: TObject; var Value: String);
begin
   LastWages :=  (getAccData.LastWages);
   if LastWages > 0 then
      Value := CurrToStrF((LastWages), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel83Print(sender: TObject; var Value: String);
begin
   LastCar := (getAccData.LastCar);
   if LastCar > 0 then
      Value := CurrToStrF((LastCar), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel84Print(sender: TObject; var Value: String);
begin
   LastMaintenance := (getAccData.LastRepairs);
   if LastMaintenance > 0 then
      Value := CurrToStrF((LastMaintenance), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel85Print(sender: TObject; var Value: String);
begin
   LastESBPhone := ((getAccData.LastESB)+(getAccData.LastPhone));
   if LastESBPhone > 0 then
      Value := CurrToStrF((LastESBPhone), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel86Print(sender: TObject; var Value: String);
begin
   LastAccount := (getAccData.LastProfFees);
   if LastAccount > 0 then
      Value := CurrToStrF((LastAccount), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel87Print(sender: TObject; var Value: String);
begin
   LastInsurance := (getAccData.LastInsurance);
   if LastInsurance > 0 then
      Value := CurrToStrF((LastInsurance), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel212Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Sum(YearTot1) as Transport');
         SQL.Add('From NLAccs where RepGroup = 208');
         SQL.Add('and id in (213, 232, 252, 272, 285, 309)');
         Open;
         LastStockHaulage := FieldByName('Transport').AsCurrency;
         Value := FloatToStrF(LastStockHaulage, ffCurrency, 8, 2);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel213Print(sender: TObject; var Value: String);
begin
   LastInterest := (getAccData.LastOverDraft);
   if LastInterest > 0 then
      Value := CurrToStrF(LastInterest, ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel214Print(sender: TObject; var Value: String);
begin
   LastTotalSundry := ((getAccData.LastSundryVar)+(getAccData.LastSundryFix));
   if LastTotalSundry > 0 then
      Value := CurrToStrF((LastTotalSundry), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel215Print(sender: TObject; var Value: String);
begin
   LastDep := ((getAccData.LastDepBuild)+ (getAccData.LastDepMach));
   if LastDep > 0 then
      Value := CurrToStrF((LastDep), ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel216Print(sender: TObject; var Value: String);
begin
   LastTotalCost := (LastStockPurchase+ LastHealth+ LastBreeding+ LastMilkRec+ LastParlourCost+ LastDairyCon+ LastConcentrate+
                    LastSilageHay+ LastOtherCost+ LastSilageContract+ LastOtherContract+ LastFertLime+ LastSeedSpray+
                    LastMachinery+ LastlandLease+ LastQuotaLease+ LastWages+ LastCar+ LastMaintenance+ LastESBPhone+ LastAccount+
                    LastInsurance+ LastStockHaulage+ LastInterest+ LastTotalSundry+ LastDep);
   if LastTotalCost > 0 then
      Value := CurrToStrF(LastTotalCost, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel217Print(sender: TObject; var Value: String);
begin
   if LastTotalSales > 0 then
      Value := FloatToStrF(((LastTotalCost / LastTotalSales) * 100), ffFixed, 8, 2 );
end;

procedure TfmSWSReport.QRLabel248Print(sender: TObject; var Value: String);
begin
   LastTotFarmSurplus := (LastTotalSales - LastTotalCost);
   Value := CurrToStrF(LastTotFarmSurplus, ffCurrency, 2 );
end;

procedure TfmSWSReport.QRLabel249Print(sender: TObject; var Value: String);
begin
   LastComparableSurplus := (LastTotalCost + LastlandLease + LastQuotaLease);
   if LastComparableSurplus > 0 then
      Value := CurrToStrF(LastComparableSurplus, ffCurrency, 2 );
end;

procedure TfmSWSReport.DisplayMsgDlg(MsgText : String; MsgType : Integer = 0);
var
   MsgDlgType : TMsgDlgType;
begin
   if MsgType = 0 then
      MsgDlgType := mtInformation
   else
      MsgDlgType := mtError;
   MessageDlg(MsgText,MsgDlgType,[mbOK],0);
end;

procedure TfmSWSReport.QRLabel280Print(sender: TObject; var Value: String);
begin
   BudgetMilkSales := getAccData.BudgetMilkSales;
   if BudgetMilkSales < 0 then
      BudgetMilkSales := (BudgetMilkSales * -1);
   if BudgetMilkSales > 0 then
      Value := CurrToStrF(BudgetMilkSales, ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel283Print(sender: TObject; var Value: String);
var
   TempF : Double;
   TempF1 : Double;
begin
   TempF := 0;
   TempF1 := 0;
   with NLAccs do
       try
          First;
          if Locate('ID', 22, []) then
             begin
                TempF := FieldByName('BudgYear').AsFloat;
                Next;
                TempF := TempF + FieldByName('BudgYear').AsFloat;
             end;
          First;
          if Locate('ID', 34, []) then
             begin
                TempF1 := FieldByName('BudgYear').AsFloat;
                Next;
                TempF1 := TempF1 + FieldByName('BudgYear').AsFloat;
             end;
          BudgetBeefSheep := (TempF + TempF1);
          if BudgetBeefSheep < 0 then
             BudgetBeefSheep := (BudgetBeefSheep * -1);
          if BudgetBeefSheep > 0 then
             Value := CurrToStrF(BudgetBeefSheep, ffCurrency, 2);
       except
          DisplayMsgDlg(Format(ErrorMsgStr, ['total sheep']));
       end;
end;

procedure TfmSWSReport.QRLabel286Print(sender: TObject; var Value: String);
begin
   BudgetCullCow := (getAccData.BudgetCullCattle);
   if BudgetCullCow < 0 then
      BudgetCullCow := (BudgetCullCow * -1);
   if BudgetCullCow > 0 then
      Value := CurrToStrF((BudgetCullCow), ffCurrency, 2)
end;

procedure TfmSWSReport.QRLabel284Print(sender: TObject; var Value: String);
var
   TempF : Double;
   TempF1 : Double;
begin
   TempF := 0;
   TempF1 := 0;
   with NLAccs do
      try
         First;
         if Locate('ID', 7, []) then
            TempF := (FieldByName('BudgYear').AsFloat);
         First;
         if Locate('ID', 11, []) then
            TempF1 := (FieldByName('BudgYear').AsFloat);
          BudgetDairyStock := (TempF + TempF1);
          if BudgetDairyStock < 0 then
             BudgetDairyStock := (BudgetDairyStock * -1);
          if BudgetDairyStock > 0 then
             Value := CurrToStrF(BudgetDairyStock, ffCurrency, 2);
      except
         DisplayMsgDlg(Format(ErrorMsgStr, ['total dairy sales']));
      end;
end;

procedure TfmSWSReport.QRLabel287Print(sender: TObject; var Value: String);
begin
   BudgetCalfSale := (getAccData.BudgetCalfSales);
   if BudgetCalfSale < 0 then
      BudgetCalfSale := (BudgetCalfSale * -1);
   if BudgetCalfSale > 0 then
      Value := CurrToStrF((BudgetCalfSale), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel288Print(sender: TObject; var Value: String);
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select SUM(BudgYear) Result From NLaccs Where ID IN (41, 42, 43, 44, 45, 46)');
         Open;

         BudgetTillageSale := (FieldByName('Result').AsFloat);
         if BudgetTillageSale < 0 then
            BudgetTillageSale := (BudgetTillageSale * -1);
         if BudgetTillageSale > 0 then
            Value := CurrToStrF(BudgetTillageSale, ffCurrency, 2);
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel282Print(sender: TObject; var Value: String);
begin
   BudgetPremiumHead := (getAccData.BudgetPremiumHeadage);
   if BudgetPremiumHead < 0 then
      BudgetPremiumHead := (BudgetPremiumHead * -1);
   Value := CurrToStrF(BudgetPremiumHead, ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel289Print(sender: TObject; var Value: String);
begin
   BudgetTotalSales := (BudgetMilkSales + BudgetBeefSheep + BudgetCullCow + BudgetDairyStock +
                        BudgetCalfSale  + BudgetFarmIn + BudgetTillageSale + BudgetPremiumHead +
                        BudgetStockChange);
   Value := CurrToStrF(BudgetTotalSales, ffCurrency, 2 );

end;

procedure TfmSWSReport.GetBudgetFarmExpenses;
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Sum (BudgYear) as BudStockPurch');
         SQL.Add('From NLAccs where Category = "EE"');
         Open;
         lBudStockPurch.Caption := CurrToStrF(FieldByName('BudStockPurch').AsCurrency, ffCurrency, 2);
         BudgetStockPurchase := (FieldByName('BudStockPurch').AsCurrency);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel211Print(sender: TObject; var Value: String);
begin
   BudgetHealth := (getAccData.TotalBudgetVet);
   Value := CurrToStrF((BudgetHealth), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel250Print(sender: TObject; var Value: String);
begin
   BudgetBreeding := (getAccData.BudgetBreeding);
   Value := CurrToStrF((BudgetBreeding), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel253Print(sender: TObject; var Value: String);
begin
   BudgetMilkRec := (getAccData.BudgetMilkRec);
   Value := CurrToStrF((BudgetMilkRec), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel255Print(sender: TObject; var Value: String);
begin
   BudgetDairyCon := (getAccData.BudgetDairyConcent);
   Value := CurrToStrF((BudgetDairyCon), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel256Print(sender: TObject; var Value: String);
begin
   BudgetConcentrate := ((getAccData.BudgetConcent) - (getAccData.BudgetDairyConcent));
   Value := CurrToStrF((BudgetConcentrate), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel257Print(sender: TObject; var Value: String);
begin
   BudgetSilageHay := ((getAccData.BudgetPurchForage)+(getAccData.BudgetStraw));
   Value := CurrToStrF((BudgetSilageHay), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel258Print(sender: TObject; var Value: String);
begin
   BudgetOtherCost :=(getAccData.BudgetSillageAdd);
   Value := CurrToStrF((BudgetOtherCost), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel259Print(sender: TObject; var Value: String);
begin
   BudgetSilageContract := (getAccData.BudgetContractor);
   Value := CurrToStrF((BudgetSilageContract), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel261Print(sender: TObject; var Value: String);
begin
   BudgetFertLime := ((getAccData.BudgetFert)+(getAccData.BudgetLime));
   Value := CurrToStrF((BudgetFertLime), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel262Print(sender: TObject; var Value: String);
begin
   BudgetSeedSpray := (getAccData.BudgetSeedSpray);
   Value := CurrToStrF((BudgetSeedSpray), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel263Print(sender: TObject; var Value: String);
begin
   BudgetMachinery := (getAccData.BudgetMachRun);
   Value := CurrToStrF((BudgetMachinery), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel264Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select BudgYear');
         SQL.Add('From NLAccs where RepGroup = 415');
         SQL.Add('and id = 415');
         Open;
         BudgetlandLease := (FieldByName('BudgYear').AsCurrency);
         Value := FloatToStrF((BudgetlandLease), ffCurrency, 8, 2);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel265Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select BudgYear');
         SQL.Add('From NLAccs where RepGroup = 415');
         SQL.Add('and id = 416');
         Open;
         BudgetQuotaLease := (FieldByName('BudgYear').AsCurrency);
         Value := FloatToStrF((BudgetQuotaLease), ffCurrency, 8, 2);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel266Print(sender: TObject; var Value: String);
begin
   BudgetWages :=  (getAccData.BudgetWages);
   if LastWages > 0 then
      Value := CurrToStrF((BudgetWages), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel267Print(sender: TObject; var Value: String);
begin
   BudgetCar := (getAccData.BudgetCar);
   if BudgetCar > 0 then
      Value := CurrToStrF((BudgetCar), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel268Print(sender: TObject; var Value: String);
begin
   BudgetMaintenance := (getAccData.BudgetRepairs);
   if BudgetMaintenance > 0 then
      Value := CurrToStrF((BudgetMaintenance), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel269Print(sender: TObject; var Value: String);
begin
   BudgetESBPhone := ((getAccData.BudgetESB)+(getAccData.BudgetPhone));
   if BudgetESBPhone > 0 then
      Value := CurrToStrF((BudgetESBPhone), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel270Print(sender: TObject; var Value: String);
begin
   BudgetAccount := (getAccData.BudgetProfFees);
   if BudgetAccount > 0 then
      Value := CurrToStrF((BudgetAccount), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel271Print(sender: TObject; var Value: String);
begin
   BudgetInsurance := (getAccData.BudgetInsurance);
   if BudgetInsurance > 0 then
      Value := CurrToStrF((BudgetInsurance), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel273Print(sender: TObject; var Value: String);
begin
   with MyQuery do
      try
         SQL.Clear;
         SQL.Add('Select Sum(BudgYear) as Transport');
         SQL.Add('From NLAccs where RepGroup = 208');
         SQL.Add('and id in (213, 232, 252, 272, 285, 309)');
         Open;
         LastStockHaulage := FieldByName('Transport').AsCurrency;
         Value := FloatToStrF(LastStockHaulage, ffCurrency, 8, 2);
      finally
         Close;
      end;

end;

procedure TfmSWSReport.QRLabel272Print(sender: TObject; var Value: String);
begin
   BudgetInterest := (getAccData.BudgetOverDraft);
   if BudgetInterest > 0 then
      Value := CurrToStrF(BudgetInterest, ffCurrency, 2);
end;

procedure TfmSWSReport.QRLabel274Print(sender: TObject; var Value: String);
begin
   BudgetTotalSundry := ((getAccData.BudgetSundryVar)+(getAccData.BudgetSundryFix));
   if BudgetTotalSundry > 0 then
      Value := CurrToStrF((BudgetTotalSundry), ffCurrency, 2);

end;

procedure TfmSWSReport.QRLabel276Print(sender: TObject; var Value: String);
begin
   BudgetTotalCost := (BudgetStockPurchase+ BudgetHealth+ BudgetBreeding+ BudgetMilkRec+ BudgetParlourCost+ BudgetDairyCon+ BudgetConcentrate+
                    BudgetSilageHay+ BudgetOtherCost+ BudgetSilageContract+ BudgetOtherContract+ BudgetFertLime+ BudgetSeedSpray+
                    BudgetMachinery+ BudgetlandLease+ BudgetQuotaLease+ BudgetWages+ BudgetCar+ BudgetMaintenance+ BudgetESBPhone+ BudgetAccount+
                    BudgetInsurance+ BudgetStockHaulage+ BudgetInterest+ BudgetTotalSundry+ BudgetDep);
   if BudgetTotalCost > 0 then
      Value := CurrToStrF(BudgetTotalCost, ffCurrency, 2 );

end;

procedure TfmSWSReport.QRLabel277Print(sender: TObject; var Value: String);
begin
   if BudgetTotalSales > 0 then
      Value := FloatToStrF(((BudgetTotalCost / BudgetTotalSales) * 100), ffFixed, 8, 2 );

end;

procedure TfmSWSReport.QRLabel278Print(sender: TObject; var Value: String);
begin
   BudgetTotFarmSurplus := (BudgetTotalSales - BudgetTotalCost);
   Value := CurrToStrF(BudgetTotFarmSurplus, ffCurrency, 2 );

end;

procedure TfmSWSReport.QRLabel279Print(sender: TObject; var Value: String);
begin
   BudgetComparableSurplus := (BudgetTotalCost + BudgetlandLease + BudgetQuotaLease);
   if BudgetComparableSurplus > 0 then
      Value := CurrToStrF(BudgetComparableSurplus, ffCurrency, 2 );
end;

procedure TfmSWSReport.SetDatabasePath;
begin
   DatabasePath := DbPath + WinData.GetAccsCompany(HerdId);
end;

procedure TfmSWSReport.SetLUCaptions;
var
   FinancialYearData : TFINANCIALYEAR;
   TempFloat : Double;
begin

   TotalLu := 0;
   TempFloat := 0;

   { TotalLUBF = Total LUs Carried Forward }

   try
      TempFloat := ( BFCowValue + CFCowValue ) / 2;
      { Total }
      TotalLUBF := ( BFCowValue * 1 );
      LUNoCow.Caption := FloatToStr(TempFloat);
   except
      LUNoCow.Caption := '';
   end;
   IncFloat( TotalLU, TempFloat);

   try
      TempFloat := ((( CFCalfValue + BFCalfValue ) / 2 ) * 0.3 ) ;
      TotalLUBF := TotalLUBF + ( CFCalfValue * 0.3 );
      LUCalves.Caption := FloatToStr(TempFloat);
   except
      LUCalves.Caption := '';
   end;
   IncFloat( TotalLU, TempFloat);

   try
      TempFloat := ((( BFHeiferValue + CFHeiferValue) / 2 ) * 0.6 );
      TotalLUBF := TotalLUBF + ( BFHeiferValue * 0.6  );
      LUHeifer.Caption := FloatToStr(TempFloat);
   except
      LUHeifer.Caption := '';
   end;
   IncFloat( TotalLU, TempFloat);

   try
      TempFloat := ((( BFBeefValue + CFBeefValue )/ 2 ) * 0.6 );
      TotalLUBF := TotalLUBF + ( BFBeefValue * 0.6  );
      LUBeef.Caption := FloatToStr(TempFloat);
   except
      LUBeef.Caption := '';
   end;
   IncFloat( TotalLU, TempFloat);

   try
      TempFloat := ((( BFOtherValue + CFOtherValue ) / 2 ));
      TotalLUBF := TotalLUBF + ( BFOtherValue );
      LUOther.Caption := FloatToStr(TempFloat);
   except
      LUOther.Caption := '';
   end;
   IncFloat( TotalLU, TempFloat);

   try
      TempFloat := (( BFBullsValue + CFBullsValue) / 2 );
      TotalLUBF := TotalLUBF + ( BFBullsValue );
      LUBulls.Caption := FloatToStr(TempFloat);
   except
      LUBulls.Caption := '';
   end;
   IncFloat( TotalLU, TempFloat);

   TotAnimalLU.Caption := FloatToStr(TotalLUBF);
   TotalLand := GetLandOwned;
   AcresLU.Caption  := FloatToStrF((TotalLand / TotalLU), ffFixed, 8, 2 );
   TotLU.Caption := FloatToStr(TotalLU);

   FinancialYearData := GetFinancialYearData(WinData.UserDefaultHerdID);
   lHistYear.Caption := IntToStr(FinancialYearData.Year -1) ;
   lHistYear2.Caption := lHistYear.Caption;

   lActYear.Caption:=  IntToStr(FinancialYearData.Year);
   lActBud.Caption := lActYear.Caption;
   lActYear2.Caption := lActYear.Caption;
   lActBud2.Caption := lActYear.Caption;
end;

function TfmSWSReport.GetLandOwned: Double;
var
   Area : Double;
begin
   Result := LandOwned;
   if Result <= 0 then
      begin
      with qLand do
      try
         SQL.Clear;
         SQL.Add('Select * ');
         SQL.Add('From P1  ');
         Open;
         First;
         if (FieldByName('Area').AsFloat > 0) then
            begin
               Area := FieldByName('Area').AsFloat;
               if (UpperCase(FieldByName('DefaultUnit').AsString) <> 'METRIC') then // if area size if stored in imperial convert to metric value
                  Area := Area * 2.471;
               LandOwned := Area;

            end
         else
            LandOwned := 0;
      finally
         Close;
      end;
      Result := LandOwned;
      end;

end;

procedure TfmSWSReport.FormCreate(Sender: TObject);
begin
   LandOwned := 0;
end;

end.
