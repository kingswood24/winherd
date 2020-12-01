{
   26/05/11 [V4.1 R1.7] /MK Additional Feature - If Country Is England or Scotland Then qrLabel1.Caption Should Be 'Movement Book Of Bovine Animals'.
}
unit BovineHerdReg;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DBTables,
     Dialogs, Db, QRExport;

type
  TBovineReport = class(TQuickRep)
    PageFB: TQRBand;
    QRLabel3: TQRLabel;
    z: TQRSubDetail;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    DBAnimalNo: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qBovine: TQuery;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    TotalAnimals: TQRLabel;
    VerLabel: TQRLabel;
    NIHerdReg: TQuickRep;
    QRLabel41: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRBand2: TQRBand;
    qrsdNIREg: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel13: TQRLabel;
    KingwoodBand: TQRBand;
    QRLabel14: TQRLabel;
    NIVerlabel: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRExpr4: TQRExpr;
    TitleBand1: TQRBand;
    HerdID: TQRLabel;
    YearN2: TQRLabel;
    OwnerName: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    LAddress1: TQRLabel;
    LAddress2: TQRLabel;
    QRLabel4: TQRLabel;
    LHerdIdentifier: TQRLabel;
    LAddress3: TQRLabel;
    LAddress4: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
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
    QRLabel20: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel34: TQRLabel;
    CowNoLabel: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qRemarks: TQuery;
    dsBovine: TDataSource;
    TempChanges: TTable;
    qrRemarks: TQRSubDetail;
    QRDBText10: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    qMovements: TQuery;
    qrMovements: TQRSubDetail;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    qrAudits: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    QRShape6: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    MasterLine: TQRSubDetail;
    QRDBText53: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRDBText51: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText52: TQRDBText;
    QRShape7: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    lSortBy: TQRLabel;
    lDateFrom: TQRLabel;
    QRLabel64: TQRLabel;
    lDateTo: TQRLabel;
    lChosenSex: TQRLabel;
    lSortDirection: TQRLabel;
    qrSaleDel: TQRSubDetail;
    qSaleDel: TQuery;
    qPurchDel: TQuery;
    QRDBText50: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    qrPurchDel: TQRSubDetail;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRLabel66: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel67: TQRLabel;
    QRSubDetail5: TQRSubDetail;
    QRLabel68: TQRLabel;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRLabel69: TQRLabel;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel25: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    SummaryBand2: TQRBand;
    qInter: TQuery;
    qrInter: TQRSubDetail;
    QRLabel72: TQRLabel;
    qrPDate: TQRDBText;
    qrPName: TQRDBText;
    qrPAddress: TQRDBText;
    qrSDate: TQRDBText;
    qrSName: TQRDBText;
    qrSAddress: TQRDBText;
    QRDBText74: TQRDBText;
    qrlShowingChanges: TQRLabel;
    qIHM: TQuery;
    IHMDetail: TQRSubDetail;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRSysData7: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRSubDetail3: TQRSubDetail;
    QRSubDetail4: TQRSubDetail;
    QRSubDetail6: TQRSubDetail;
    QRSubDetail7: TQRSubDetail;
    QRSubDetail8: TQRSubDetail;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRLabel89: TQRLabel;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRLabel90: TQRLabel;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRSubDetail9: TQRSubDetail;
    QRDBText109: TQRDBText;
    QRDBText110: TQRDBText;
    QRDBText111: TQRDBText;
    QRDBText112: TQRDBText;
    QRDBText113: TQRDBText;
    QRDBText114: TQRDBText;
    QRDBText115: TQRDBText;
    QRLabel93: TQRLabel;
    QRDBText116: TQRDBText;
    QRLabel77: TQRLabel;
    lSortBy2: TQRLabel;
    lSortDirection2: TQRLabel;
    QRLabel95: TQRLabel;
    lChosenSex2: TQRLabel;
    QRLabel96: TQRLabel;
    Name: TQRLabel;
    QRLabel98: TQRLabel;
    L2Address1: TQRLabel;
    L2Address2: TQRLabel;
    L2Address3: TQRLabel;
    L2Address4: TQRLabel;
    HerdID2: TQRLabel;
    QRLabel99: TQRLabel;
    NotesForGuidance: TQuickRep;
    Page1: TQRBand;
    QRLabel97: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRExprMemo1: TQRExprMemo;
    QRLabel102: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    Button1: TButton;
    QRShape14: TQRShape;
    QRMemo1: TQRMemo;
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
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRMemo2: TQRMemo;
    Page2: TQRBand;
    QRLabel123: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel124: TQRLabel;
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
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
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
    QRLabel207: TQRLabel;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    QRLabel210: TQRLabel;
    QRLabel211: TQRLabel;
    QRLabel212: TQRLabel;
    QRLabel213: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel217: TQRLabel;
    QRLabel218: TQRLabel;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRLabel221: TQRLabel;
    QRLabel222: TQRLabel;
    QRLabel223: TQRLabel;
    QRLabel224: TQRLabel;
    QRLabel225: TQRLabel;
    QRLabel226: TQRLabel;
    QRLabel227: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel228: TQRLabel;
    QRLabel229: TQRLabel;
    QRLabel230: TQRLabel;
    QRLabel231: TQRLabel;
    QRLabel232: TQRLabel;
    QRLabel233: TQRLabel;
    QRLabel234: TQRLabel;
    QRLabel235: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel236: TQRLabel;
    QRMemo5: TQRMemo;
    QRLabel237: TQRLabel;
    QRLabel238: TQRLabel;
    QRLabel239: TQRLabel;
    QRLabel240: TQRLabel;
    QRLabel241: TQRLabel;
    QRLabel242: TQRLabel;
    QRLabel243: TQRLabel;
    QRLabel244: TQRLabel;
    QRLabel245: TQRLabel;
    QRLabel246: TQRLabel;
    QRLabel247: TQRLabel;
    QRLabel248: TQRLabel;
    QRLabel249: TQRLabel;
    QRLabel250: TQRLabel;
    QRLabel251: TQRLabel;
    QRLabel252: TQRLabel;
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
    QRMemo6: TQRMemo;
    QRLabel15: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText75: TQRDBText;
    QRDBText117: TQRDBText;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRDBText34Print(sender: TObject; var Value: String);
    procedure QRDBText35Print(sender: TObject; var Value: String);
    procedure QRDBText36Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: String);
    procedure QRDBText38Print(sender: TObject; var Value: String);
    procedure QRDBText39Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRDBText51Print(sender: TObject; var Value: String);
    procedure MasterLineBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure zBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure qrSaleDelBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPurchDelBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrMovementsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrInterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPNamePrint(sender: TObject; var Value: String);
    procedure qrSDatePrint(sender: TObject; var Value: String);
    procedure QRDBText71Print(sender: TObject; var Value: String);
    procedure QRDBText68Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure qrsdNIREgBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText89Print(sender: TObject; var Value: String);
    procedure QRDBText90Print(sender: TObject; var Value: String);
    procedure QRDBText88Print(sender: TObject; var Value: String);
    procedure QRDBText91Print(sender: TObject; var Value: String);
    procedure QRDBText86Print(sender: TObject; var Value: String);
    procedure QRDBText92Print(sender: TObject; var Value: String);
    procedure QRDBText93Print(sender: TObject; var Value: String);
    procedure QRDBText94Print(sender: TObject; var Value: String);
    procedure QRDBText95Print(sender: TObject; var Value: String);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Page1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
  private

  public
  end;

var
  BovineReport: TBovineReport;
  STag : String;

implementation

uses
    Def,
    CowRepfilt,
    uRemarks,
    DairyData,
    GenTypesConst;

{$R *.DFM}

procedure TBovineReport.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CDOBRemark then
      Value := '';
end;

procedure TBovineReport.QRDBText31Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CBreedRemark then
      Value := '';
end;

procedure TBovineReport.QRDBText33Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CColourRemark then
      Value := '';
end;

procedure TBovineReport.QRDBText34Print(sender: TObject;
  var Value: String);
begin
   if NOT (( qRemarks.FieldByName('ItemChanged').AsInteger = CNatIdRemark ) or
           ( qRemarks.FieldByName('ItemChanged').AsInteger = CTempTagRemark ) or
           ( qRemarks.FieldByName('ItemChanged').AsInteger = CNewTagRemark )) then
      Value := '';
   if ( qRemarks.FieldByName('ItemChanged').AsInteger = CDeletionRemark ) then
      Value := 'Animal Deleted'
   else if ( qRemarks.FieldByName('ItemChanged').AsInteger = CUnDeleteRemark ) then
      Value := 'Animal UnDeleted';
end;

procedure TBovineReport.QRDBText35Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CSexRemark then
       Value := ''
   else if qRemarks.FieldByName('OldItem').AsString <> 'Female' then
       Value := 'M'
   else
       Value := 'F';
end;

procedure TBovineReport.QRDBText36Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CPurchDateRemark then
      Value := '';
end;

procedure TBovineReport.QRDBText37Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CPurchPlaceRemark then
      Value := '';
end;

procedure TBovineReport.QRDBText38Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CSaleDateRemark then
      Value := '';
end;

procedure TBovineReport.QRDBText39Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CSalePlaceRemark then
      Value := '';
end;

procedure TBovineReport.QRLabel8Print(sender: TObject; var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CNewTagRemark then
       Value := '(RT)'
   else
       Value := '';
end;

procedure TBovineReport.QRDBText51Print(sender: TObject;
  var Value: String);
begin
     if Value = IntToStr(cNatIDRemark) then
        Value := 'National ID Changed'
     else if Value = IntToStr(cDOBRemark) then
        Value := 'Date of Birth Changed'
     else if Value = IntToStr(cColourRemark) then
        Value := 'Animal Colour Changed'
     else if Value = IntToStr(cBreedRemark) then
        Value := 'Animal Breed Changed'
     else if Value = IntToStr(cSexRemark) then
        Value := 'Animal Sex Changed'
     else if Value = IntToStr(cSalePlaceRemark) then
        Value := 'Sale Place Changed'
     else if Value = IntToStr(cSaleDateRemark) then
        Value := 'Sale Date Changed'
     else if Value = IntToStr(cPurchPlaceRemark) then
        Value := 'Purchase Place Changed'
     else if Value = IntToStr(cPurchDateRemark) then
        Value := 'Purchase Date Changed'
     else if Value = IntToStr(cTempTagRemark) then
        Value := 'Temporary Tag'
     else if Value = IntToStr(cNewTagRemark) then
        Value := 'New Tag'
     else if Value = IntToStr(cDeletionRemark) then
        Value := 'Animal Deleted'
     else if Value = IntToStr(cUnDeleteRemark) then
        Value := 'Animal UnDeleted'
     else if Value = IntToStr(cGeneralRemark) then
        Value := 'General Remark'
     else if Value = IntToStr(cPurchDeleteRemark) then
        Value := 'Purchase Info. Deleted'
     else if Value = IntToStr(cSaleDeleteRemark) then
        Value := 'Sales Info. Deleted'
     else if Value = IntToStr(cHerdIDRemark) then
        Value := 'Herd Identity Changed'
     else
        Value := 'No changes Recorded';
end;

procedure TBovineReport.MasterLineBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // check for sales and purchase events - kr 8/00
   if (NOT WinData.NoSales) and (NOT WinData.NoPurch) then
      PrintBand := (qRemarks.RecordCount>0)or(qSaleDel.RecordCount>0)or(qPurchDel.RecordCount>0)
   else
   if (NOT WinData.NoSales) and (WinData.NoPurch) then
      PrintBand := (qRemarks.RecordCount>0)or(qSaleDel.RecordCount>0)
   else
   if (WinData.NoSales) and (NOT WinData.NoPurch) then
      PrintBand := (qRemarks.RecordCount>0)or(qPurchDel.RecordCount>0)
   else
      PrintBand := (qRemarks.RecordCount>0)
end;

procedure TBovineReport.zBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( qBovine.FieldByName('SalePlace1').IsNull ) And
      ( qBovine.FieldByName('PurchPlace1').IsNull ) then
      z.Height := 17
   else
      z.Height := 33;
end;

procedure TBovineReport.qrSaleDelBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if (NOT WinData.NoSales) then
      begin
         if ( qSaleDel.FieldByName('Address').IsNull ) then
            Sender.Height := 17
         else
            Sender.Height := 33;
      end;
end;

procedure TBovineReport.qrPurchDelBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if (NOT WinData.NoPurch) then
      begin
         if ( qPurchDel.FieldByName('Address').IsNull ) then
            Sender.Height := 17
         else
            Sender.Height := 33;
      end;
end;

procedure TBovineReport.qrMovementsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    if ( qMovements.FieldByName('Townland').IsNull ) then
        Sender.Height := 17
    else
        Sender.Height := 33;
end;

procedure TBovineReport.qrInterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{    if ( qInter.FieldByName('SAddress').IsNull ) And
       ( qInter.FieldByName('PAddress').IsNull ) then
        Sender.Height := 17
    else
        Sender.Height := 33; }
end;

procedure TBovineReport.qrPNamePrint(sender: TObject; var Value: String);
begin
    if qInter.FieldByName('PHerdID').AsInteger = qBovine.FieldByName('HerdId').AsInteger then
        Value := '';
end;

procedure TBovineReport.qrSDatePrint(sender: TObject; var Value: String);
begin
    if qInter.FieldByName('SHerdID').AsInteger = qBovine.FieldByName('HerdId').AsInteger then
        Value := '';
end;

procedure TBovineReport.QRDBText71Print(sender: TObject;
  var Value: String);
begin
   if Value = '30/12/99' then
      Value := '';
end;

procedure TBovineReport.QRDBText68Print(sender: TObject;
  var Value: String);
begin
   if Value = '30/12/99' then
      Value := '';

end;

procedure TBovineReport.QRDBText22Print(sender: TObject;
  var Value: String);
begin
   if Value = 'Steer' then
      Value := 'Male';
end;

procedure TBovineReport.QRDBText25Print(sender: TObject;
  var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
      Value := '';
end;

procedure TBovineReport.qrsdNIREgBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( qBovine.FieldByName('SalePlace1').IsNull ) And
      ( qBovine.FieldByName('PurchPlace1').IsNull ) And
      ( qBovine.FieldByName('OldTagTS').IsNull ) then
       qrsdNIREg.Height := 17
   else
       qrsdNIREg.Height := 33;
end;

procedure TBovineReport.QRDBText89Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CColourRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      qBovine.FieldByName('ColourAsStr').AsString + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else
   Value := '';
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText90Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CNewTagRemark then
      Value := 'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
               'New Value: '+      qBovine.FieldByName('OldTag').AsString + '    ' +
                                   qRemarks.FieldByName('Remark').AsString  + '    ' +
                                   FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else if qRemarks.FieldByName('ItemChanged').AsInteger = CNatIDRemark then
      Value := 'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
               'New Value: '+      qBovine.FieldByName('NatIDNum').AsString + '    ' +
                                   qRemarks.FieldByName('Remark').AsString  + '    ' +
                                   FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else if ( qRemarks.FieldByName('ItemChanged').AsInteger = CTempTagRemark ) then
      Value := 'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
               'New Value: '+      qBovine.FieldByName('NatIDNum').AsString + '    ' +
                                   qRemarks.FieldByName('Remark').AsString  + '    ' +
                                   FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else if ( qRemarks.FieldByName('ItemChanged').AsInteger = CDeletionRemark ) then
      Value := 'Animal Deleted'  + '    ' +
               qRemarks.FieldByName('Remark').AsString  + '    ' +
               FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'

   else if ( qRemarks.FieldByName('ItemChanged').AsInteger = CUnDeleteRemark ) then
      Value := 'Animal UnDeleted'   + '    ' +
               qRemarks.FieldByName('Remark').AsString  + '    ' +
               FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else
      Value := '';

end;

procedure TBovineReport.QRDBText88Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CBreedRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      qBovine.FieldByName('Breed').AsString + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else Value := '';

   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText91Print(sender: TObject;
  var Value: String);
var
   OrigSex,
   NewSex : String;
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger <> CSexRemark then
      begin
         Value := '';
         Exit;
      end;

   if (UPPERCASE(qRemarks.FieldByName('OldItem').AsString) = 'FEMALE') then
      begin
         OrigSex := 'F';
         if UpperCase(qBovine.FieldByName('Sex').AsString) = 'BULL' then
            NewSex := 'B'
         else if UpperCase(qBovine.FieldByName('Sex').AsString) = 'STEER' then
            NewSex := 'M';
      end
   else if (UPPERCASE(qRemarks.FieldByName('OldItem').AsString) = 'BULL') then
      begin
         OrigSex := 'B';
         if UpperCase(qBovine.FieldByName('Sex').AsString) = 'STEER' then
            NewSex := 'M'
         else if UpperCase(qBovine.FieldByName('Sex').AsString) = 'FEMALE' then
            NewSex := 'F';
      end
   else if (UPPERCASE(qRemarks.FieldByName('OldItem').AsString) = 'STEER') then
      begin
         OrigSex := 'M';
         if UpperCase(qBovine.FieldByName('Sex').AsString) = 'BULL' then
            NewSex := 'B'
         else if UpperCase(qBovine.FieldByName('Sex').AsString) = 'FEMALE' then
            NewSex := 'F';
      end;

   Value := Format('Original Value: %s    '+ 'New Value: %s    %s    %s', [OrigSex, NewSex, qRemarks.FieldByName('Remark').AsString,
                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')']);
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText86Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CDOBRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      FormatDateTime(cIrishDateStyle,qBovine.FieldByName('DateOfBirth').AsDateTime) + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else Value := '';
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText92Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CPurchDateRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      FormatDateTime(cIrishDateStyle,qBovine.FieldByName('PurchDate').AsDateTime) + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else Value := '';
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText93Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CPurchPlaceRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      qBovine.FieldByName('PurchPlace').AsString + ' ' + qBovine.FieldByName('PurchPlace1').AsString  + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else Value := '';
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText94Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CSaleDateRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      FormatDateTime(cIrishDateStyle,qBovine.FieldByName('SaleDate').AsDateTime) + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else Value := '';
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRDBText95Print(sender: TObject;
  var Value: String);
begin
   if qRemarks.FieldByName('ItemChanged').AsInteger = CSalePlaceRemark then
      Value :=  'Original Value: '+ qRemarks.FieldByName('OldItem').AsString + '    ' +
                'New Value: '+      qBovine.FieldByName('SalePlace').AsString + ' ' + qBovine.FieldByName('SalePlace1').AsString  + '    ' +
                                    qRemarks.FieldByName('Remark').AsString  + '    ' +
                                    FormatDateTime('dd/mm/yy',qRemarks.FieldByName('DateChanged').AsDateTime) + '  ('+FormatDateTime('dd/mm/yy',qRemarks.FieldByName('UserDate').AsDateTime)+')'
   else Value := '';
   TQRDBText(Sender).Left := 55;
end;

procedure TBovineReport.QRSubDetail3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if (NOT WinData.NoPurch) then
      begin
         if ( qPurchDel.FieldByName('Address').IsNull ) then
            Sender.Height := 17
         else
            Sender.Height := 33;
      end;
end;

procedure TBovineReport.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if (NOT WinData.NoSales) then
      begin
         if ( qSaleDel.FieldByName('Address').IsNull ) then
            Sender.Height := 17
         else
            Sender.Height := 33;
      end;
end;

procedure TBovineReport.QRSubDetail7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ( qMovements.FieldByName('Townland').IsNull ) then
      Sender.Height := 17
   else
      Sender.Height := 33;
end;

procedure TBovineReport.Page1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 //  Page1.Height := 960;
//   Page2.Height := 960;
end;

procedure TBovineReport.QRLabel1Print(sender: TObject; var Value: String);
var
   RegCountry : TCountry;
begin
   RegCountry := WinData.DefCountry(WinData.OwnerFileID.AsInteger);
   if RegCountry in [Scotland, England] then
      Value := 'Movement Book of Bovine Animals';
end;

end.
