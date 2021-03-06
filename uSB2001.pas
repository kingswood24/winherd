unit uSB2001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, EanQr, EanDBQr;

type
  TfSB2001 = class(TForm)
    QRApplications: TQuickRep;
    qrRepIreBand: TQRBand;
    QRShape39: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel1: TQRLabel;
    Label2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape10: TQRShape;
    Address3: TQRLabel;
    Address4: TQRLabel;
    Address2: TQRLabel;
    QRLabel13: TQRLabel;
    Address1: TQRLabel;
    HerdOwner: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    PlaceForInSpect1: TQRLabel;
    PlaceForInspect2: TQRLabel;
    QRShape12: TQRShape;
    QRLabel21: TQRLabel;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape13: TQRShape;
    QRLabel28: TQRLabel;
    QRShape14: TQRShape;
    QRLabel7: TQRLabel;
    HerdLetter: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    NoCast2: TQRLabel;
    NoCast1: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape27: TQRShape;
    QRLabel51: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel63: TQRLabel;
    QRShape34: TQRShape;
    QRLabel64: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    Day1: TQRLabel;
    Day2: TQRLabel;
    Month1: TQRLabel;
    Month2: TQRLabel;
    Year: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape57: TQRShape;
    A1: TQRLabel;
    A8: TQRLabel;
    A9: TQRLabel;
    A11: TQRLabel;
    A2: TQRLabel;
    A3: TQRLabel;
    A4: TQRLabel;
    A5: TQRLabel;
    A6: TQRLabel;
    A7: TQRLabel;
    A10: TQRLabel;
    A12: TQRLabel;
    A13: TQRLabel;
    A14: TQRLabel;
    A15: TQRLabel;
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
    HerdNos: TQRLabel;
    Label6: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel27: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape61: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape64: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape56: TQRShape;
    QRLabel69: TQRLabel;
    QRShape55: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape15: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel33: TQRLabel;
    QRShape18: TQRShape;
    NoCast0: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape21: TQRShape;
    NoBulls0: TQRLabel;
    QRShape19: TQRShape;
    NoBulls1: TQRLabel;
    QRShape20: TQRShape;
    NoBulls2: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape22: TQRShape;
    NoCattle0: TQRLabel;
    QRShape23: TQRShape;
    NoCattle1: TQRLabel;
    QRShape24: TQRShape;
    NoCattle2: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape25: TQRShape;
    Enclosed0: TQRLabel;
    QRShape26: TQRShape;
    Enclosed1: TQRLabel;
    QRShape28: TQRShape;
    Enclosed2: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    EMail: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel145: TQRLabel;
    QRShape60: TQRShape;
    QRShape62: TQRShape;
    QRLabel146: TQRLabel;
    QRLabel150: TQRLabel;
    QRShape63: TQRShape;
    QRLabel151: TQRLabel;
    QRShape65: TQRShape;
    QRLabel152: TQRLabel;
    lYesRestricted: TQRLabel;
    lNoRestricted: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel357: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape41: TQRShape;
    QRLabel57: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRLabel59: TQRLabel;
    QRShape89: TQRShape;
    Label3: TQRLabel;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRImage1: TQRImage;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    MobileNum: TQRLabel;
    PPSNum: TQRLabel;
    qrDBEanHerd: TQrDBEan;
    TelNo: TQRLabel;
    RestrictedHerd: TQuickRep;
    qrRepIreRestBand: TQRBand;
    QRShape79: TQRShape;
    QRLabel72: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRShape77: TQRShape;
    QRLabel77: TQRLabel;
    RHerdLetter: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    RHerdNos: TQRLabel;
    QRMemo3: TQRMemo;
    QRShape78: TQRShape;
    QRMemo4: TQRMemo;
    R1: TQRLabel;
    R2: TQRLabel;
    R3: TQRLabel;
    R4: TQRLabel;
    R5: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    R6: TQRLabel;
    R7: TQRLabel;
    R8: TQRLabel;
    R9: TQRLabel;
    R10: TQRLabel;
    QRLabel99: TQRLabel;
    R11: TQRLabel;
    QRLabel98: TQRLabel;
    R12: TQRLabel;
    R13: TQRLabel;
    R14: TQRLabel;
    R15: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel100: TQRLabel;
    R16: TQRLabel;
    R17: TQRLabel;
    R18: TQRLabel;
    R19: TQRLabel;
    R20: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    R21: TQRLabel;
    R22: TQRLabel;
    R23: TQRLabel;
    R24: TQRLabel;
    R25: TQRLabel;
    QRLabel140: TQRLabel;
    R26: TQRLabel;
    QRLabel142: TQRLabel;
    R27: TQRLabel;
    R28: TQRLabel;
    R29: TQRLabel;
    R30: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    R31: TQRLabel;
    R32: TQRLabel;
    R33: TQRLabel;
    R34: TQRLabel;
    R35: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    R36: TQRLabel;
    R37: TQRLabel;
    R38: TQRLabel;
    R39: TQRLabel;
    R40: TQRLabel;
    QRLabel170: TQRLabel;
    R41: TQRLabel;
    QRLabel172: TQRLabel;
    R42: TQRLabel;
    R43: TQRLabel;
    R44: TQRLabel;
    R45: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRShape80: TQRShape;
    B1: TQRLabel;
    B2: TQRLabel;
    B3: TQRLabel;
    B4: TQRLabel;
    B5: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    B6: TQRLabel;
    B7: TQRLabel;
    B8: TQRLabel;
    B9: TQRLabel;
    B10: TQRLabel;
    B11: TQRLabel;
    B12: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    B13: TQRLabel;
    B14: TQRLabel;
    B15: TQRLabel;
    B16: TQRLabel;
    B17: TQRLabel;
    B18: TQRLabel;
    B19: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    B20: TQRLabel;
    B21: TQRLabel;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel176: TQRLabel;
    QRShape83: TQRShape;
    QRLabel180: TQRLabel;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    RD1: TQRLabel;
    RD2: TQRLabel;
    RM1: TQRLabel;
    RM2: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape100: TQRShape;
    QRLabel74: TQRLabel;
    QRShape101: TQRShape;
    QRLabel83: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel116: TQRLabel;
    qrDBEanHerdA: TQrDBEan;
    TelNo2: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSB2001: TfSB2001;

implementation

{$R *.DFM}

end.
