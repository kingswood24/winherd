unit uQuotaSummary;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, QRExport, Db, DBTables;

type
  TfQuotaSummary = class(TForm)
    RepQuotaSummary: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    RepDetails: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    qrMSummary: TQRMemo;
    qrMMonthBreakdown: TQRMemo;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    HerdLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    rCullList: TQuickRep;
    QRBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    qrMAssumedCulls: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    CowNo: TQRDBText;
    DryDate: TQRDBText;
    LactNo: TQRDBText;
    PageFooterBand2: TQRBand;
    QRLabel14: TQRLabel;
    HerdLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    M1: TQRLabel;
    M2: TQRLabel;
    M3: TQRLabel;
    M4: TQRLabel;
    M5: TQRLabel;
    M6: TQRLabel;
    M7: TQRLabel;
    M8: TQRLabel;
    M9: TQRLabel;
    M10: TQRLabel;
    M11: TQRLabel;
    M1D: TQRLabel;
    M2D: TQRLabel;
    M3D: TQRLabel;
    M4D: TQRLabel;
    M5D: TQRLabel;
    M6D: TQRLabel;
    M7D: TQRLabel;
    M8D: TQRLabel;
    M9D: TQRLabel;
    M10D: TQRLabel;
    M11D: TQRLabel;
    M12D: TQRLabel;
    M13D: TQRLabel;
    M1C: TQRLabel;
    M2C: TQRLabel;
    M3C: TQRLabel;
    M4C: TQRLabel;
    M5C: TQRLabel;
    M6C: TQRLabel;
    M7C: TQRLabel;
    M8C: TQRLabel;
    M9C: TQRLabel;
    M10C: TQRLabel;
    M11C: TQRLabel;
    M12C: TQRLabel;
    M13C: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    M12: TQRLabel;
    SummaryBand2: TQRBand;
    t1: TQRLabel;
    d7: TQRLabel;
    t2: TQRLabel;
    d1: TQRLabel;
    t3: TQRLabel;
    d5: TQRLabel;
    t4: TQRLabel;
    d8: TQRLabel;
    t5: TQRLabel;
    d12: TQRLabel;
    t6: TQRLabel;
    t7: TQRLabel;
    t8: TQRLabel;
    t10: TQRLabel;
    d2: TQRLabel;
    d3: TQRLabel;
    d4: TQRLabel;
    d6: TQRLabel;
    t11: TQRLabel;
    d10: TQRLabel;
    rlQuotaResult: TQRLabel;
    d11: TQRLabel;
    d9: TQRLabel;
    t13: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape6: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure DryDatePrint(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TfQuotaSummary.DryDatePrint(sender: TObject; var Value: String);
begin
   If ( Value = '30/12/1899' ) then
      Value := '';
end;

procedure TfQuotaSummary.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{   if ( QRSubDetail1.DataSet.FieldByName('PriorProduction').AsFloat + QRSubDetail1.DataSet.FieldByName('Production').AsFloat ) > 0 then
      QRExpr1.Mask := '#.##' // := FormatFloat('#.##', QRSubDetail1.DataSet.FieldByName('PriorProduction').AsFloat + QRSubDetail1.DataSet.FieldByName('Production').AsFloat ))
   else
      QRExpr1.Mask := '';
}
{   if ( QRSubDetail1.DataSet.RecordCount mod 5 ) = 0 then
      QRSubDetail1.Color := $00EFEFEF
   else
      QRSubDetail1.Color := clWhite
 }

end;

end.
