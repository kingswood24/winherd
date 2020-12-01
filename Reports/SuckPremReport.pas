{
 ==============================================================================
 13/09/02 SP -

 Changed the postioning of the Date Of Birth, Breed Code, Last Calving,
 Retention Date Columns.

 Slight changes to the Page Header, repositioning of QRlabels, QRShapes.


 13/09/02 SP -

 ==============================================================================

}



unit SuckPremReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls, Db, DBTables, QRExport;

type
  TfSuckPremReport = class(TForm)
    CowPremiumScr: TQuickRep;
    ColumnHeaderBand2: TQRBand;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    PremRptTitle: TQRLabel;
    PremOrderLabel: TQRLabel;
    QRLabel25: TQRLabel;
    PremSortLabel: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    PremDetail: TQRBand;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    PageFooterBand2: TQRBand;
    QRLabel34: TQRLabel;
    PremVerLabel: TQRLabel;
    SummaryBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel23: TQRLabel;
    qrApplicDate: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    EligibleReplace: TQuickRep;
    QRBand2: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel22: TQRLabel;
    QRBand4: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    PremOrderLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    PremSortLabel2: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel14: TQRLabel;
    RepAnimals: TQuery;
    qReplacements: TQuery;
    qrNatID: TQRLabel;
    qrRepDate: TQRLabel;
    QRShape6: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure qrApplicDatePrint(sender: TObject; var Value: String);
    procedure PremDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSuckPremReport: TfSuckPremReport;

implementation
uses
   StockInHerdFilt;

{$R *.DFM}

procedure TfSuckPremReport.qrApplicDatePrint(sender: TObject;
  var Value: String);
begin
   if Value = '30/12/99' then
      Value := ''
end;

procedure TfSuckPremReport.PremDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   d, m, y : Word;
begin
   qrRepDate.Caption := '';
   qrNatID.Caption   := '';
   PremDetail.Font.Color := clNavy;
   if qReplacements.Locate('NewAID', StockInHerdFilter.GenQuery.FieldByName('AnimalID').AsInteger, []) then
      begin
         DecodeDate(qReplacements.FieldByName('SuckApplicDate').AsDateTime, y, m, d );
         if Y = StockInHerdFilter.GenQuery.FieldByName('YearOfApplic').AsInteger then
            begin
               if RepAnimals.Locate('ID', qReplacements.FieldByName('LastAID').AsInteger, []) then
                  begin
                     qrNatID.Caption   := RepAnimals.FieldByName('NatIDNum').AsString;
                     qrRepDate.Caption := FormatDateTime('dd/mm/yyyy', qReplacements.FieldByName('ReplaceDate').AsDateTime);
                  end;
               PremDetail.Font.Color := clGreen
            end;
      end
   else if NOT(StockInHerdFilter.GenQuery.FieldByName('InHerd').AsBoolean) then
      PremDetail.Font.Color := clRed
   else if ((StockInHerdFilter.GenQuery.FieldByName('ApplicLact').AsInteger = 0) AND (StockInHerdFilter.GenQuery.FieldByName('CurrLact').AsInteger > 0)) then
      PremDetail.Font.Color := clFuchsia
end;

procedure TfSuckPremReport.FormCreate(Sender: TObject);
begin
   RepAnimals.Active := True;
   qReplacements.Active := True;
end;

procedure TfSuckPremReport.FormDestroy(Sender: TObject);
begin
   RepAnimals.Active := False;
   qReplacements.Active := False;
end;

end.
