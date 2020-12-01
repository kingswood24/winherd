unit uMilkRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uMilkRecSysScr,
  QuickRpt, Qrctrls, ExtCtrls, QRExport;

type
  TfMilkRep = class(TForm)
    qrMilkRep2: TQuickRep;
    QRBand2: TQRBand;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel80: TQRLabel;
    lHerdID: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    l5: TQRLabel;
    l9: TQRLabel;
    QRLabel113: TQRLabel;
    l8: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    l7: TQRLabel;
    l6: TQRLabel;
    qrDetail: TQRSubDetail;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel115: TQRLabel;
    VerLabel2: TQRLabel;
    qrMilkRep3: TQuickRep;
    QRBand4: TQRBand;
    QRShape4: TQRShape;
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
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    lCowsTM1: TQRLabel;
    lCowsTM2: TQRLabel;
    lCowsTM3: TQRLabel;
    lCowsTM4: TQRLabel;
    lCowsTM5: TQRLabel;
    lCowsTM6: TQRLabel;
    lCowsTM7: TQRLabel;
    lCowsTM8: TQRLabel;
    lCowsTM9: TQRLabel;
    lCowsTM10: TQRLabel;
    lCowsTM11: TQRLabel;
    lCowsTM12: TQRLabel;
    lHfsTM1: TQRLabel;
    lHfsTM2: TQRLabel;
    lHfsTM3: TQRLabel;
    lHfsTM4: TQRLabel;
    lHfsTM5: TQRLabel;
    lHfsTM6: TQRLabel;
    lHfsTM7: TQRLabel;
    lHfsTM8: TQRLabel;
    lHfsTM9: TQRLabel;
    lHfsTM10: TQRLabel;
    lHfsTM11: TQRLabel;
    lHfsTM12: TQRLabel;
    lPercHerdTM1: TQRLabel;
    lPercHerdTM2: TQRLabel;
    lPercHerdTM3: TQRLabel;
    lPercHerdTM4: TQRLabel;
    lPercHerdTM5: TQRLabel;
    lPercHerdTM6: TQRLabel;
    lPercHerdTM7: TQRLabel;
    lPercHerdTM8: TQRLabel;
    lPercHerdTM9: TQRLabel;
    lPercHerdTM10: TQRLabel;
    lPercHerdTM11: TQRLabel;
    lPercHerdTM12: TQRLabel;
    lDYieldTM1: TQRLabel;
    lDYieldTM2: TQRLabel;
    lDYieldTM3: TQRLabel;
    lDYieldTM4: TQRLabel;
    lDYieldTM5: TQRLabel;
    lDYieldTM6: TQRLabel;
    lDYieldTM7: TQRLabel;
    lDYieldTM8: TQRLabel;
    lDYieldTM9: TQRLabel;
    lDYieldTM10: TQRLabel;
    lDYieldTM11: TQRLabel;
    lDYieldTM12: TQRLabel;
    lCowsLM1: TQRLabel;
    lCowsLM2: TQRLabel;
    lCowsLM3: TQRLabel;
    lCowsLM4: TQRLabel;
    lCowsLM5: TQRLabel;
    lCowsLM6: TQRLabel;
    lCowsLM7: TQRLabel;
    lCowsLM8: TQRLabel;
    lCowsLM9: TQRLabel;
    lCowsLM10: TQRLabel;
    lCowsLM11: TQRLabel;
    lCowsLM12: TQRLabel;
    lHfsLM1: TQRLabel;
    lHfsLM2: TQRLabel;
    lHfsLM3: TQRLabel;
    lHfsLM4: TQRLabel;
    lHfsLM5: TQRLabel;
    lHfsLM6: TQRLabel;
    lHfsLM7: TQRLabel;
    lHfsLM8: TQRLabel;
    lHfsLM9: TQRLabel;
    lHfsLM10: TQRLabel;
    lHfsLM11: TQRLabel;
    lHfsLM12: TQRLabel;
    lPercHerdLM1: TQRLabel;
    lPercHerdLM2: TQRLabel;
    lPercHerdLM3: TQRLabel;
    lPercHerdLM4: TQRLabel;
    lPercHerdLM5: TQRLabel;
    lPercHerdLM6: TQRLabel;
    lPercHerdLM7: TQRLabel;
    lPercHerdLM8: TQRLabel;
    lPercHerdLM9: TQRLabel;
    lPercHerdLM10: TQRLabel;
    lPercHerdLM11: TQRLabel;
    lPercHerdLM12: TQRLabel;
    lDYieldLM2: TQRLabel;
    lDYieldLM3: TQRLabel;
    lDYieldLM4: TQRLabel;
    lDYieldLM5: TQRLabel;
    lDYieldLM6: TQRLabel;
    lDYieldLM7: TQRLabel;
    lDYieldLM8: TQRLabel;
    lDYieldLM9: TQRLabel;
    lDYieldLM10: TQRLabel;
    lDYieldLM11: TQRLabel;
    lDYieldLM12: TQRLabel;
    lChange1: TQRLabel;
    lChange2: TQRLabel;
    lChange3: TQRLabel;
    lChange4: TQRLabel;
    lChange5: TQRLabel;
    lChange6: TQRLabel;
    lChange7: TQRLabel;
    lChange8: TQRLabel;
    lChange9: TQRLabel;
    lChange10: TQRLabel;
    lChange11: TQRLabel;
    lChange12: TQRLabel;
    QRShape6: TQRShape;
    QRBand5: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel26: TQRLabel;
    lName12: TQRLabel;
    lName22: TQRLabel;
    lAdd12: TQRLabel;
    lAdd22: TQRLabel;
    lAdd32: TQRLabel;
    lAdd42: TQRLabel;
    lMonth2: TQRLabel;
    lYear2: TQRLabel;
    lName13: TQRLabel;
    lName23: TQRLabel;
    lAdd13: TQRLabel;
    lAdd23: TQRLabel;
    lAdd33: TQRLabel;
    lAdd43: TQRLabel;
    qrMilkRep4: TQuickRep;
    TitleBand1: TQRBand;
    QRBand1: TQRBand;
    QRBand6: TQRBand;
    QRBand8: TQRBand;
    QRLabel6: TQRLabel;
    VerLabel3: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    lMeas1: TQRLabel;
    lMeas2: TQRLabel;
    lMeas3: TQRLabel;
    lMeas4: TQRLabel;
    lMeas5: TQRLabel;
    lMeas6: TQRLabel;
    lMeas7: TQRLabel;
    lMeas8: TQRLabel;
    lMeas9: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel47: TQRLabel;
    lNoCows10: TQRLabel;
    lNoCows9: TQRLabel;
    lNoCows8: TQRLabel;
    lNoCows7: TQRLabel;
    lNoCows6: TQRLabel;
    lNoCows5: TQRLabel;
    lNoCows4: TQRLabel;
    lNoCows3: TQRLabel;
    lNoCows2: TQRLabel;
    QRLabel67: TQRLabel;
    lNoHfs2: TQRLabel;
    lNoHfs3: TQRLabel;
    lNoHfs4: TQRLabel;
    lNoHfs5: TQRLabel;
    lNoHfs6: TQRLabel;
    lNoHfs7: TQRLabel;
    lNoHfs8: TQRLabel;
    lNoHfs9: TQRLabel;
    lNoHfs10: TQRLabel;
    lCowDry: TQRLabel;
    lTotalCows: TQRLabel;
    lHfrDry: TQRLabel;
    lTotalHfrs: TQRLabel;
    lPercHerdDry: TQRLabel;
    lTotalherdPerc: TQRLabel;
    lMeas10: TQRLabel;
    lNoCows1: TQRLabel;
    lNoHfs1: TQRLabel;
    lPerc1: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lName14: TQRLabel;
    lName24: TQRLabel;
    lAdd14: TQRLabel;
    lAdd24: TQRLabel;
    lAdd34: TQRLabel;
    lAdd44: TQRLabel;
    lMonth4: TQRLabel;
    lYear4: TQRLabel;
    QRSysData5: TQRSysData;
    VerLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    lPerc2: TQRLabel;
    lPerc3: TQRLabel;
    lPerc4: TQRLabel;
    lPerc5: TQRLabel;
    lPerc6: TQRLabel;
    lPerc7: TQRLabel;
    lPerc8: TQRLabel;
    lPerc9: TQRLabel;
    lPerc10: TQRLabel;
    lMCD: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    lADM: TQRLabel;
    QRLabel73: TQRLabel;
    lTMP: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    lDYieldLM1: TQRLabel;
    l10: TQRLabel;
    l11: TQRLabel;
    QRBand7: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    LDateRec: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel2: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel10: TQRLabel;
    lRecordIn: TQRLabel;
    QRLabel11: TQRLabel;
    lRecordingIn: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel12: TQRLabel;
    lNoCowsMilk: TQRLabel;
    lHrfsMilked: TQRLabel;
    NoMilkPercOfHerd: TQRLabel;
    lTMCowsNotCalved: TQRLabel;
    lTMHrfsNotCalved: TQRLabel;
    lLMCowsNotCalved: TQRLabel;
    lLMHrfsNotCalved: TQRLabel;
    NotCalved: TQRLabel;
    TotalCowsTM: TQRLabel;
    TotalHrfrsTM: TQRLabel;
    QRLabel15: TQRLabel;
    TotalCowsLM: TQRLabel;
    TotalHrfrsLM: TQRLabel;
    QRShape27: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMilkRep: TfMilkRep;

implementation
{$R *.DFM}

end.