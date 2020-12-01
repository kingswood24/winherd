{
   29/11/10 [V4.0 R6.0] /MK Change - Changed lKgs to lMilkValue

   18/01/11 [V4.0 R7.7] /MK Change - Changed Left of Total Solids, Feed Cost and Margin to allow 305TotalSolids to fit.

   06/03/13 [V5.1 R5.0] /MK Change - No need for OnPrintEvents for Feed Costs Or Margin as SQL now fixes null Feed Costs.

   28/01/14 [V5.2 R7.8] /MK Change - Change all instances of Calving Index to Calving Interval - GL Request.
}

unit BestCowsInHerd;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TBestCowsInHerdScr = class(TQuickRep)
    Detail: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    RptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lCalvingInterval: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    TotalSolids: TQRLabel;
    QRLabel15: TQRLabel;
    AnimalNo: TQRDBText;
    LactNo: TQRDBText;
    CalveDate: TQRDBText;
    DaysInMilk: TQRDBText;
    kGS305: TQRDBText;
    kgsyIELD: TQRDBText;
    AvgBFat: TQRDBText;
    CalvingInterval: TQRDBText;
    QRLabel16: TQRLabel;
    Summary: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    lMilkValue: TQRLabel;
    AvgProt: TQRDBText;
    qBestCowsInHerd: TQuery;
    Srtlbl: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    lTotal: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    qrsSolids: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    SortedByLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel13: TQRLabel;
    BFat305Kgs: TQRDBText;
    BFatTotalKgs: TQRDBText;
    ProtTotalKgs: TQRDBText;
    Prot305Kgs: TQRDBText;
    FeedCosts: TQRDBText;
    MilkValue: TQRDBText;
    VerLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    lMargin: TQRLabel;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    Margin: TQRDBText;
    QRLabel6: TQRLabel;
    EBI: TQRDBText;
    QRLabel17: TQRLabel;
    QRExpr24: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure CalveDatePrint(sender: TObject; var Value: String);
  private
    CurrMilkValue : String;
  public

  end;

var
   BestCowsInHerdScr: TBestCowsInHerdScr;

implementation
uses
   Dialogs,
   GenTypesConst;

{$R *.DFM}

procedure TBestCowsInHerdScr.QRDBText1Print(sender: TObject; var Value: String);
begin
   try
      if (StrToInt(Value) = cDryOffEvent) then // Dried Off
         Value := '*'
      else
         Value := ' ';
   except
      Value := ' ';
   end;
end;

procedure TBestCowsInHerdScr.CalveDatePrint(sender: TObject;
  var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
      Value := '';
end;

end.
