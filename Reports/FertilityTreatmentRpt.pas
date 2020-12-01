unit FertilityTreatmentRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TfmFertilityTreatmentsRpt = class(TQuickRep)
    Detail: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    RptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    dbDate: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    VerLabel: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText10: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  fmFertilityTreatmentsRpt: TfmFertilityTreatmentsRpt;

implementation
uses
    DairyData;

{$R *.DFM}

procedure TfmFertilityTreatmentsRpt.QRDBText9Print(sender: TObject;
  var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
      Value := '';
end;

end.
