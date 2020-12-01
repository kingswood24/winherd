{
  NN 26/09/02
  Livestock Inventory date coming through on to the Profit and Loss Report
  Included was change of report title
  Calculated the Depreciation into two nominals Bulidings and Machinery and outputted into the report
}

unit uDairyProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, db, dbtables, SampleAccounts, QRExport,
  LivestockInventory, KRoutines;

type
  TfmProfitMonitor = class(TForm)
    Nlaccs: TTable;
    DairyProfitMonitor: TQuickRep;
    QRBand1: TQRBand;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;          
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape4: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel47: TQRLabel;
    QRShape2: TQRShape;
    QRLabel116: TQRLabel;
    Rep402: TQRLabel;
    Rep403: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel123: TQRLabel;
    Rep405406: TQRLabel;
    QRLabel147: TQRLabel;
    Rep407: TQRLabel;
    QRLabel150: TQRLabel;
    Rep408: TQRLabel;
    QRLabel4: TQRLabel;
    Rep409: TQRLabel;
    QRLabel130: TQRLabel;
    Rep410: TQRLabel;
    QRLabel134: TQRLabel;
    Rep411: TQRLabel;
    QRLabel110: TQRLabel;
    Rep412: TQRLabel;
    QRLabel122: TQRLabel;
    Rep413: TQRLabel;
    QRLabel128: TQRLabel;
    Rep414: TQRLabel;
    QRShape6: TQRShape;
    QRLabel39: TQRLabel;
    L204: TQRLabel;
    L265: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel32: TQRLabel;
    L203: TQRLabel;
    L223: TQRLabel;
    L243: TQRLabel;
    l264: TQRLabel;
    QRLabel46: TQRLabel;
    l266: TQRLabel;
    l205: TQRLabel;
    l225: TQRLabel;
    l281: TQRLabel;
    QRLabel53: TQRLabel;
    L206: TQRLabel;
    L226: TQRLabel;
    L267: TQRLabel;
    L282: TQRLabel;
    QRLabel60: TQRLabel;
    L207: TQRLabel;
    L227: TQRLabel;
    L268: TQRLabel;
    QRLabel67: TQRLabel;
    l208: TQRLabel;
    l228: TQRLabel;
    QRLabel74: TQRLabel;
    l283: TQRLabel;
    l269: TQRLabel;
    l209: TQRLabel;
    l229: TQRLabel;
    l284: TQRLabel;
    l271: TQRLabel;
    l212: TQRLabel;
    l231: TQRLabel;
    QRLabel81: TQRLabel;
    l211: TQRLabel;
    QRLabel106: TQRLabel;
    l270: TQRLabel;
    l210: TQRLabel;
    l230: TQRLabel;
    QRLabel107: TQRLabel;
    l285: TQRLabel;
    l272: TQRLabel;
    l213: TQRLabel;
    l232: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    l215: TQRLabel;
    l234: TQRLabel;
    l286: TQRLabel;
    l273: TQRLabel;
    QRLabel54: TQRLabel;
    l214: TQRLabel;
    l275: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    lCClosing: TQRLabel;
    lCOpening: TQRLabel;
    lCAdjust: TQRLabel;
    l233: TQRLabel;
    L244: TQRLabel;
    l245: TQRLabel;
    L246: TQRLabel;
    L247: TQRLabel;
    l248: TQRLabel;
    l249: TQRLabel;
    l251: TQRLabel;
    l250: TQRLabel;
    l252: TQRLabel;
    l254: TQRLabel;
    l253: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    lLitresSold: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    L4: TQRLabel;
    L12: TQRLabel;
    L22: TQRLabel;
    L47: TQRLabel;
    L6: TQRLabel;
    L34: TQRLabel;
    QRShape1: TQRShape;
    l224: TQRLabel;
    QRLabel26: TQRLabel;
    Rep606: TQRLabel;
    QRLabel25: TQRLabel;
    lFromdate: TQRLabel;
    QRLabel36: TQRLabel;
    lTodate: TQRLabel;
    Rep607: TQRLabel;
    QRLabel37: TQRLabel;
    l218: TQRLabel;
    QRLabel41: TQRLabel;
    l202: TQRLabel;
    QRLabel48: TQRLabel;
    l217: TQRLabel;
    l204vet: TQRLabel;
    l219: TQRLabel;
    l205Contractor: TQRLabel;
    l207SeedSpray: TQRLabel;
    QRLabel56: TQRLabel;
    l205Silage: TQRLabel;
    l208Trans: TQRLabel;
    l210Straw: TQRLabel;
    l209VarCost: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel49: TQRLabel;
    lNPIncome: TQRLabel;
    lNPExpend: TQRLabel;
    lNPBalance: TQRLabel;
    QRLabel52: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    l62: TQRLabel;
    l61: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape8: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    lSuckSales: TQRLabel;
    QRShape3: TQRShape;
    procedure lLitresSoldPrint(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure l202Print(sender: TObject; var Value: String);
    procedure l203FertPrint(sender: TObject; var Value: String);
    procedure l204Print(sender: TObject; var Value: String);
    procedure l204vetPrint(sender: TObject; var Value: String);
    procedure l205Print(sender: TObject; var Value: String);
    procedure l205SilagePrint(sender: TObject; var Value: String);
    procedure l205ContractorPrint(sender: TObject; var Value: String);
    procedure l206Print(sender: TObject; var Value: String);
    procedure l207SeedSprayPrint(sender: TObject; var Value: String);
    procedure l223Print(sender: TObject; var Value: String);

    procedure l207Print(sender: TObject; var Value: String);
    procedure l208Print(sender: TObject; var Value: String);
    procedure l208TransPrint(sender: TObject; var Value: String);
    procedure l209Print(sender: TObject; var Value: String);
    procedure l209VarCostPrint(sender: TObject; var Value: String);
    procedure l210StrawPrint(sender: TObject; var Value: String);
    procedure l212Print(sender: TObject; var Value: String);
    procedure l211Print(sender: TObject; var Value: String);
    procedure l210Print(sender: TObject; var Value: String);
    procedure l213Print(sender: TObject; var Value: String);
    procedure l215Print(sender: TObject; var Value: String);
    procedure l217Print(sender: TObject; var Value: String);
    procedure l218Print(sender: TObject; var Value: String);
    procedure l219Print(sender: TObject; var Value: String);
    procedure l214Print(sender: TObject; var Value: String);
    procedure QRLabel87Print(sender: TObject; var Value: String);
    procedure l286Print(sender: TObject; var Value: String);
    procedure l285Print(sender: TObject; var Value: String);
    procedure l284Print(sender: TObject; var Value: String);
    procedure l283Print(sender: TObject; var Value: String);
    procedure L282Print(sender: TObject; var Value: String);
    procedure l281Print(sender: TObject; var Value: String);
    procedure L267Print(sender: TObject; var Value: String);
    procedure l266Print(sender: TObject; var Value: String);
    procedure L265Print(sender: TObject; var Value: String);
    procedure L226Print(sender: TObject; var Value: String);
    procedure l225Print(sender: TObject; var Value: String);
    procedure l264Print(sender: TObject; var Value: String);
    procedure L243Print(sender: TObject; var Value: String);
    procedure L227Print(sender: TObject; var Value: String);
    procedure l228Print(sender: TObject; var Value: String);
    procedure l229Print(sender: TObject; var Value: String);
    procedure l231Print(sender: TObject; var Value: String);
    procedure l230Print(sender: TObject; var Value: String);
    procedure l232Print(sender: TObject; var Value: String);
    procedure QRLabel135Print(sender: TObject; var Value: String);
    procedure QRLabel160Print(sender: TObject; var Value: String);
    procedure QRLabel176Print(sender: TObject; var Value: String);
    procedure QRLabel76Print(sender: TObject; var Value: String);
    procedure QRLabel164Print(sender: TObject; var Value: String);
    procedure QRLabel168Print(sender: TObject; var Value: String);
    procedure QRLabel80Print(sender: TObject; var Value: String);
    procedure QRLabel82Print(sender: TObject; var Value: String);
    procedure QRLabel86Print(sender: TObject; var Value: String);
    procedure QRLabel93Print(sender: TObject; var Value: String);
    procedure QRLabel140Print(sender: TObject; var Value: String);
    procedure l253Print(sender: TObject; var Value: String);
    procedure QRLabel97Print(sender: TObject; var Value: String);
    procedure QRLabel88Print(sender: TObject; var Value: String);
    procedure QRLabel146Print(sender: TObject; var Value: String);
    procedure l273Print(sender: TObject; var Value: String);
    procedure l275Print(sender: TObject; var Value: String);
    procedure Rep402Print(sender: TObject; var Value: String);
    procedure Rep403Print(sender: TObject; var Value: String);
    procedure Rep404Print(sender: TObject; var Value: String);
    procedure Rep405406Print(sender: TObject; var Value: String);
    procedure Rep407Print(sender: TObject; var Value: String);
    procedure Rep408Print(sender: TObject; var Value: String);
    procedure Rep409Print(sender: TObject; var Value: String);
    procedure Rep411Print(sender: TObject; var Value: String);
    procedure Rep412Print(sender: TObject; var Value: String);
    procedure Rep413Print(sender: TObject; var Value: String);
    procedure Rep414Print(sender: TObject; var Value: String);
    procedure l234Print(sender: TObject; var Value: String);
    procedure l233Print(sender: TObject; var Value: String);
    procedure L244Print(sender: TObject; var Value: String);
    procedure l245Print(sender: TObject; var Value: String);
    procedure L246Print(sender: TObject; var Value: String);
    procedure L247Print(sender: TObject; var Value: String);
    procedure l248Print(sender: TObject; var Value: String);
    procedure l249Print(sender: TObject; var Value: String);
    procedure l251Print(sender: TObject; var Value: String);
    procedure l250Print(sender: TObject; var Value: String);
    procedure l252Print(sender: TObject; var Value: String);
    procedure l254Print(sender: TObject; var Value: String);
    procedure L268Print(sender: TObject; var Value: String);
    procedure l269Print(sender: TObject; var Value: String);
    procedure l271Print(sender: TObject; var Value: String);
    procedure l270Print(sender: TObject; var Value: String);
    procedure l272Print(sender: TObject; var Value: String);
    procedure lDepreciationPrint(sender: TObject; var Value: String);
    procedure NlaccsDepCalcGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel24Print(sender: TObject; var Value: String);
    procedure QRLabel34Print(sender: TObject; var Value: String);
    procedure QRLabel21Print(sender: TObject; var Value: String);
    procedure QRLabel22Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QRLabel47Print(sender: TObject; var Value: String);
    procedure QRLabel27Print(sender: TObject; var Value: String);
    procedure QRLabel29Print(sender: TObject; var Value: String);
    procedure QRLabel28Print(sender: TObject; var Value: String);
    procedure QRLabel30Print(sender: TObject; var Value: String);
    procedure L4Print(sender: TObject; var Value: String);
    procedure L12Print(sender: TObject; var Value: String);
    procedure L22Print(sender: TObject; var Value: String);
    procedure L34Print(sender: TObject; var Value: String);
    procedure L47Print(sender: TObject; var Value: String);
    procedure L6Print(sender: TObject; var Value: String);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure L224Print(sender: TObject; var Value: String);
    procedure Rep606Print(sender: TObject; var Value: String);
    procedure Rep607Print(sender: TObject; var Value: String);
    procedure L203Print(sender: TObject; var Value: String);
    procedure Rep410Print(sender: TObject; var Value: String);
    procedure l62Print(sender: TObject; var Value: String);
    procedure l61Print(sender: TObject; var Value: String);
    procedure QRLabel62Print(sender: TObject; var Value: String);
    procedure QRLabel79Print(sender: TObject; var Value: String);
    procedure lSuckSalesPrint(sender: TObject; var Value: String);

    private
    { Private declarations }
    GenQuery : TQuery;
    NonProfitIncome : double;
    NonProfitExpend : double;
    Depreciation : double;
    HerdId       : Integer;
    UnallocatedBalances    : Boolean;
    getAccData : TSampleAccounts;
    function GetDepreciation: Double;
    procedure SetNonProfitBalance;
  public
    { Public declarations }
    procedure SetUnallocated(HerdId : Integer; dbPath : string);
  end;

  procedure Preview(HerdIdentity: Integer);


const
   DbPath = 'C:\Kingsacc\';

var
 fmProfitMonitor: TfmProfitMonitor;

 iPurchaseConcent : Array [0..2] of integer = (203, 223, 243);
 iPurchaseForage  : Array [0..2] of integer = (204, 224, 244);
 iFertiliser      : Array [0..2] of integer = (205, 225, 245);
 iLime            : Array [0..2] of integer = (206, 226, 246);
 iVet             : Array [0..2] of integer = (207, 227, 247);
 iContractor      : Array [0..2] of integer = (209, 229, 249);
 iSeedSprays      : Array [0..2] of integer = (212, 231, 251);
 iSilageAddPoly   : Array [0..2] of integer = (210, 230, 250);
 iLeviesTrans     : Array [0..2] of integer = (213, 232, 252);
 iSundryVarCosts   : Array [0..2] of integer = (214, 233, 253);
 iStraw           : Array [0..2] of integer = (215, 234, 254);
 iUnallocated     : Array [0..10] of integer = (301, 302, 303, 304, 305,
                                             306, 307, 308, 309, 310, 311);

implementation

uses
   uAccsReps, DairyData;

  procedure Preview(HerdIdentity: Integer);
  var
   TempName : String;
  begin
//     try
        with fmProfitMonitor do
           try
              HerdId := HerdIdentity;
              TempName := DbPath + WinData.GetAccsCompany(HerdIdentity);
              GenQuery := TQuery.Create(nil);
              GenQuery.DatabaseName := TempName;
              NLAccs.DataBaseName := TempName;
              NLAccs.Open;
              { Alot of OnPrint Method code need to be moved to TSampleAccounts Class }
              getAccData := TSampleAccounts.Create(HerdIdentity );
              DairyProfitMonitor.Preview;
           finally

              if getAccData <> nil then
                 FreeAndNil(getAccData); //.Free;
              NLAccs.Close;
              if GenQuery <> nil then
                 begin
                    GenQuery.Close;
                    FreeAndNil(GenQuery); //.Free;
                 end
           end;
  //   except
    //    raise Exception.Create('Unable to create report, close program and reboot.'+#13+
      //                         'If problem persists contact Kingswood');
//     end;
  end;

{$R *.DFM}

procedure TfmProfitMonitor.lLitresSoldPrint(sender: TObject;
  var Value: String);
  var Value1: double;
  var Value2: double;
begin
{   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select SUM(N.Balance) Result From NLaccs N Where N.RepGroup = "1"');
         Open;

//         Value := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2);
         Value1 := (FieldByName('Result').AsFloat);
         Close;
      end;

    with NLAccs do
       begin
          First;
          if Locate('ID', 213, []) then
             Value2 := (FieldByName('Balance').AsFloat);
       end;

    if Value2 > 0 then
       Value := FloatToStr(Value1 - Value2)
    else
       Value :=  FloatToStr(Value1);

 }
   Value := CurrToStrF((getAccData.TotalMilkSales), ffCurrency, 2);
end;

procedure TfmProfitMonitor.QRLabel10Print(sender: TObject;
  var Value: String);
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select SUM(Balance) Result From NLaccs Where ID IN (41, 42, 43, 44, 45, 46)');
         Open;

         Value := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2);
         Close;
      end;

end;

procedure TfmProfitMonitor.l204Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 204, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l205Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 205, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l206Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 206, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l223Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 223, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l207Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 207, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end
end;

procedure TfmProfitMonitor.l208Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 208, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l209Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 209, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l212Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 212, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l211Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalMilkRec), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l210Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 210, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l213Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 213, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l215Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 215, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l214Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 214, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel87Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 187, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l286Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 286, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l285Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 285, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l284Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 284, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l283Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 283, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L282Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 282, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l281Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 281, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L267Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 267, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l266Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 266, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L265Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 265, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L226Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 226, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l225Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 225, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l264Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 264, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L243Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 243, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L227Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 227, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l228Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 228, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l229Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 229, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l231Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 231, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l230Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 230, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l232Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 232, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel135Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 135, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel160Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 160, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel176Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 176, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel76Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 76, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel164Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 164, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel168Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 168, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel80Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 180, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel82Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 182, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel86Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 186, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel93Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 193, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel140Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 140, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l253Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 253, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel97Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 197, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel88Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 188, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel146Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 146, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l273Print(sender: TObject; var Value: String);
var
   tempf : double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 273, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next;  // 274
               Value := CurrToStrF(TempF + FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
      end;
end;

procedure TfmProfitMonitor.l275Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
           if Locate('ID', 275, []) then
           Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.Rep402Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalWages), ffCurrency, 2);
end;

procedure TfmProfitMonitor.Rep403Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalMachRun), ffCurrency, 2);
end;

procedure TfmProfitMonitor.Rep404Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 404, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.Rep405406Print(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalOverDraft), ffCurrency, 2);
end;

procedure TfmProfitMonitor.Rep407Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 407, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.Rep408Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalCar), ffCurrency, 2);

end;

procedure TfmProfitMonitor.Rep409Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalESB), ffCurrency, 2);

end;

procedure TfmProfitMonitor.Rep411Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalRepairs), ffCurrency, 2);

end;

procedure TfmProfitMonitor.Rep412Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalInsurance), ffCurrency, 2);

end;

procedure TfmProfitMonitor.Rep413Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalProfFees), ffCurrency, 2);
end;

procedure TfmProfitMonitor.Rep414Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalSundryFix), ffCurrency, 2);

end;

procedure TfmProfitMonitor.l234Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 234, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l233Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 233, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
       end;

end;
procedure TfmProfitMonitor.L244Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 244, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.l245Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 245, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.L246Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 246, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.L247Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 247, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l248Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 248, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l249Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 249, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l251Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 251, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l250Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 250, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l252Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 252, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l254Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 254, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.L268Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 268, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l269Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 269, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l271Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 271, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l270Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 270, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.l272Print(sender: TObject; var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 272, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.lDepreciationPrint(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 607, []) then
            begin
               if (NLAccs.FieldByName('DepRate').AsFloat > 0) then
                  Value := CurrToStrF( ((NLAccs.FieldByName('DepRate').AsFloat / 100) * NLAccs.FieldByName('Balance').AsFloat), ffCurrency, 2)
               else if NLAccs.FieldByName('DepAmount').AsFloat > 0 then
                  Value := CurrToStrF ((NLAccs.FieldByName('DepAmount').AsFloat), ffCurrency, 2);

            end;
      end;
end;

function TfmProfitMonitor.GetDepreciation: Double;
begin
{   with NLAccs do
      try
         First;
         Depreciation := 0;

         while not NLAccs.eof do
            begin
               if NLAccs.FieldByName('Category').AsString = 'FA' then
                  if NLAccs.FieldByName('DepRate').AsFloat > 0 then
                     Depreciation := Depreciation+((NLAccs.FieldByName('DepRate').AsFloat / 100)
                                                      * NLAccs.FieldByName('Balance').AsFloat)
                  else if NLAccs.FieldByName('DepAmount').AsFloat > 0 then
                     Depreciation := Depreciation + NLAccs.FieldByName('DepAmount').AsFloat;

               NLAccs.Next;
            end;

         Result := Depreciation;
      finally
      end;
      }
end;

procedure TfmProfitMonitor.NlaccsDepCalcGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 //  Text :=
end;

procedure TfmProfitMonitor.QRLabel13Print(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalCalfSales), ffCurrency, 2);
end;

procedure TfmProfitMonitor.QRLabel24Print(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 31, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 32
               TempF := TempF + FieldByName('Balance').AsFloat;
               Next; // 33
               Value := CurrToStrF(TempF + FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
      end;
end;

procedure TfmProfitMonitor.QRLabel34Print(sender: TObject;
  var Value: String);
begin
{   with NLAccs do
      begin
         First;
         if Locate('ID', 2, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;}
   Value := CurrToStrF((getAccData.TotalCullCattle), ffCurrency, 2);
       
end;

procedure TfmProfitMonitor.QRLabel21Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 7, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.QRLabel22Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 11, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.QRLabel23Print(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 21, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               if Locate('ID', 25, []) then
                  Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
      end;
end;

procedure TfmProfitMonitor.QRLabel47Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 201, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.QRLabel27Print(sender: TObject;
  var Value: String);
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 202, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;

end;

procedure TfmProfitMonitor.QRLabel29Print(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 221, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 222
               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
      end;
end;

procedure TfmProfitMonitor.QRLabel28Print(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 241, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 242
               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
      end;

end;

procedure TfmProfitMonitor.QRLabel30Print(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 261, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 262
               TempF := TempF+FieldByName('Balance').AsFloat;
               Next; // 263
               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
      end;

end;

procedure TfmProfitMonitor.L4Print(sender: TObject; var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
         First;
         if Locate('ID', 4, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 5
               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
    end;

end;

procedure TfmProfitMonitor.L12Print(sender: TObject; var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
         First;
         if Locate('ID', 12, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 13
               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
     end;
end;

procedure TfmProfitMonitor.L22Print(sender: TObject; var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
         First;
         if Locate('ID', 22, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 23
               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
    end;
end;

procedure TfmProfitMonitor.L34Print(sender: TObject; var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
         First;
         if Locate('ID', 34, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               Next; // 35

               Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
            end;
     end;
end;

procedure TfmProfitMonitor.L47Print(sender: TObject; var Value: String);
begin
    with NLAccs do
    begin
         First;
         if Locate('ID', 47, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.L6Print(sender: TObject; var Value: String);
var

   TempF : Double;
begin
   with NLAccs do
      begin
         First;
         if Locate('ID', 6, []) then
            begin
               TempF := FieldByName('Balance').AsFloat;
               if Locate('ID', 14, []) then
                   TempF := TempF + FieldByName('Balance').AsFloat;

               if Locate('ID', 24, []) then
                     TempF := TempF + FieldByName('Balance').AsFloat;
               if Locate('ID', 36, []) then
                     TempF := TempF + FieldByName('Balance').AsFloat;
               if Locate('ID', 48, []) then
                  Value := CurrToStrF(TempF+FieldByName('Balance').AsFloat, ffCurrency, 2);
               end;
     end;
end;


procedure TfmProfitMonitor.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   WinData.LiveStockValues.Open;
   if ((WinData.UserDefaultHerdID <> WinData.NONEHerdID) and (WinData.LiveStockValues.Locate('HerdID', WinData.UserDefaultHerdID, []))) then
      begin
         lCOpening.Caption := CurrToStrF(WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat, ffCurrency, 2);
         lCClosing.Caption := CurrToStrF(WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat, ffCurrency, 2);
         lCAdjust.Caption  := CurrToStrF(WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat-
                                         WinData.LiveStockValues.FieldByName('OpeningValue').AsFloat,
                                         ffCurrency, 2);
         if WinData.LiveStockValues.FieldByName('FromDate').AsDateTime > 0 then
            lFromDate.Caption := DateToStr(WinData.LiveStockValues.FieldByName('FromDate').AsDateTime)
         else
            lFromDate.Caption := '';

         if WinData.LiveStockValues.FieldByName('ToDate').AsDateTime > 0 then
            lToDate.Caption   := DateToStr(WinData.LiveStockValues.FieldByName('ToDate').AsDateTime)
         else
            lToDate.Caption   := '';
      end
   else
      begin
         lCOpening.Caption := '0.00';
         lCClosing.Caption := '0.00';
         lCAdjust.Caption  := '0.00';

         lFromDate.Caption := '';
         lToDate.Caption   := '';
      end;
   WinData.LiveStockValues.Close;
   SetNonProfitBalance;
end;

procedure TfmProfitMonitor.L224Print(sender: TObject; var Value: String);
begin
    with NLAccs do
    begin
         First;
         if Locate('ID', 224, []) then
            Value := CurrToStrF(FieldByName('Balance').AsFloat, ffCurrency, 2);
      end;
end;

procedure TfmProfitMonitor.Rep606Print(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalDepBuild), ffCurrency, 2);
end;

procedure TfmProfitMonitor.Rep607Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalDepMach), ffCurrency, 2);
end;
{
function TfmProfitMonitor.GetDepreciation: Double;
begin
{   with NLAccs do
      try
         First;
         Depreciation := 0;

         while not NLAccs.eof do
            begin
               if NLAccs.FieldByName('Category').AsString = 'FA' then
                  if NLAccs.FieldByName('DepRate').AsFloat > 0 then
                     Depreciation := Depreciation+((NLAccs.FieldByName('DepRate').AsFloat / 100)
                                                      * NLAccs.FieldByName('Balance').AsFloat)
                  else if NLAccs.FieldByName('DepAmount').AsFloat > 0 then
                     Depreciation := Depreciation + NLAccs.FieldByName('DepAmount').AsFloat;

               NLAccs.Next;
            end;

         Result := Depreciation;
      finally
      end;
      }

procedure TfmProfitMonitor.SetUnallocated(HerdId : Integer; dbPath : string);
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
               0 : AllocBalance(iUnalloc[x], ((DairyPerc/100) * Balance)); // Allocbalance = the percentage of the Unallocated Record Balance
               1 : AllocBalance(iUnalloc[x], ((ReplacePerc/100) * Balance));
               2 : AllocBalance(iUnalloc[x], ((CattlePerc/100) * Balance));
            end;
         end;

   end;


begin
   try
      Nlaccs.DatabaseName := dbPath;
      Nlaccs.Active := True;
      try
         WinData.LiveStockValues.Active := True;
         if WinData.LiveStockValues.Locate('HerdID', HerdId, []) then
            begin
               DairyPerc   := WinData.LiveStockValues.FieldByname ('AvgDairyPerc').AsFloat;    //Creating fields in the Database
               CattlePerc  := WinData.LiveStockValues.FieldByname ('AvgCattlePerc').AsFloat;
               ReplacePerc := WinData.LiveStockValues.FieldByname ('AvgReplacePerc').AsFloat;
            end;
         WinData.LiveStockValues.Active := False;
      except
         MessageDlg('Unable to locate Livestock Percentage Units. Run the Livestock Invento contact Kingswood',mtError,[mbOk],0);
      end;

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
                           6 : AllocToNominals(iUnallocated[i], Balance, iSilageAddPoly);
                           7 : AllocToNominals(iUnallocated[i], Balance, iSeedSprays);
                           8 : AllocToNominals(iUnallocated[i], Balance, iLeviesTrans);
                           9 : AllocToNominals(iUnallocated[i], Balance, iSundryVarCosts);
                          10 : AllocToNominals(iUnallocated[i], Balance, iStraw);
                        end;
                     end;
               end;
         end;
   finally
      Nlaccs.Active := False
   end;
end;

procedure TfmProfitMonitor.l202Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalConcent), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l218Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalPurchForage), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l203FertPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalFert), ffCurrency, 2);
end;
procedure TfmProfitMonitor.l217Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalLime), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l204vetPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalVet), ffCurrency, 2);
end;
procedure TfmProfitMonitor.l219Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalBreeding), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l205ContractorPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalContractor), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l207SeedSprayPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalSeedSpray), ffCurrency, 2);
end;

procedure TfmProfitMonitor.l205SilagePrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalSillageAdd), ffCurrency, 2);
end;
procedure TfmProfitMonitor.l208TransPrint(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
   with NLAccs do
      begin
         TempF := 0.00;
         if Locate('ID', 213, []) then
            TempF := TempF + FieldByName('Balance').AsFloat;
         if Locate('ID', 232, []) then
            TempF := TempF + FieldByName('Balance').AsFloat;
         if Locate('ID', 252, []) then
            TempF := TempF + FieldByName('Balance').AsFloat;
         if Locate('ID', 272, []) then
            TempF := TempF + FieldByName('Balance').AsFloat;
         if Locate('ID', 285, []) then
            TempF := TempF + FieldByName('Balance').AsFloat;
         Value := CurrToStrF(TempF, ffCurrency, 2);
     end;
end;

procedure TfmProfitMonitor.l210StrawPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalStraw), ffCurrency, 2);
end;
procedure TfmProfitMonitor.l209VarCostPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalSundryVar), ffCurrency, 2);
end;

procedure TfmProfitMonitor.SetNonProfitBalance;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select SUM(N.Balance) Result');
         SQL.Add('From NLaccs N ');
         SQL.Add('Where NominalType = "N"');
         SQL.Add('And (Category = "EI" OR Category = "NEI") ');
         Open;

         NonProfitIncome :=   (FieldByName('Result').AsFloat);
         lNPIncome.Caption := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2);
         Close;

      end;

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select SUM(N.Balance) Result');
         SQL.Add('From NLaccs N ');
         SQL.Add('Where NominalType = "N"');
         SQL.Add('And (Category = "EE" OR Category = "OH") ');
         Open;

         NonProfitExpend :=   (FieldByName('Result').AsFloat);
         lNPExpend.Caption := CurrToStrF(FieldByName('Result').AsFloat, ffCurrency, 2);
         Close;
      end;

   if ((NonProfitIncome > 0) and (NonProfitExpend >0)) then
      lNPBalance.Caption := CurrToStrF((NonProfitIncome - NonProfitExpend), ffCurrency, 2)
   else if ((NonProfitIncome > 0) and (NonProfitExpend = 0)) then
       lNPBalance.Caption := CurrToStrF(NonProfitIncome, ffCurrency, 2)
   else if ((NonProfitIncome = 0) and (NonProfitExpend > 0)) then
       lNPBalance.Caption := CurrToStrF(NonProfitExpend, ffCurrency, 2)
   else if ((NonProfitIncome = 0) and (NonProfitExpend = 0)) then
      begin
         lNPBalance.Caption := '';
         QRLabel51.Visible := False;
         QRLabel38.Visible := False;
         QRLabel42.Visible := False;
         QRLabel50.Visible := False;
         QRLabel49.Visible := False;
         lNPIncome.Visible := False;
         lNPExpend.Visible := False;
         lNPBalance.Visible := False;

         QRLabel51.Enabled := False;
         QRLabel38.Enabled := False;
         QRLabel42.Enabled := False;
         QRLabel50.Enabled := False;
         QRLabel49.Enabled := False;
         lNPIncome.Enabled := False;
         lNPExpend.Enabled := False;
         lNPBalance.Enabled := False;
      end;
end;

procedure TfmProfitMonitor.L203Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalDairyConcent), ffCurrency, 2);
end;

procedure TfmProfitMonitor.Rep410Print(sender: TObject; var Value: String);
begin
   Value := CurrToStrF((getAccData.TotalPhone), ffCurrency, 2);

end;

procedure TfmProfitMonitor.l62Print(sender: TObject; var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
       First;
       if Locate('ID', 62, []) then
          begin
             TempF := FieldByName('Balance').AsFloat;
             Value := CurrToStrF(TempF, ffCurrency, 2);
          end;
     end;
end;

procedure TfmProfitMonitor.l61Print(sender: TObject; var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
       First;
       if Locate('ID', 61, []) then
          begin
             TempF := FieldByName('Balance').AsFloat;
             Value := CurrToStrF(TempF, ffCurrency, 2);
          end;
     end;

end;

procedure TfmProfitMonitor.QRLabel62Print(sender: TObject;
  var Value: String);
begin
   Value := '-';
end;

procedure TfmProfitMonitor.QRLabel79Print(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
       First;
       if Locate('ID', 26, []) then
          begin
             TempF := FieldByName('Balance').AsFloat;
             Value := CurrToStrF(TempF, ffCurrency, 2);
          end;
     end;
end;

procedure TfmProfitMonitor.lSuckSalesPrint(sender: TObject;
  var Value: String);
var
   TempF : Double;
begin
    with NLAccs do
    begin
       First;
       if Locate('ID', 255, []) then
          begin
             TempF := FieldByName('Balance').AsFloat;
             Value := CurrToStrF(TempF, ffCurrency, 2);
          end;
     end;
end;

end.
