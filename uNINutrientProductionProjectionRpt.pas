unit uNINutrientProductionProjectionRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, QRExport;

type
  TfmNINutrientProductionProjectionRpt = class(TForm)
    NutProdProjRpt: TQuickRep;
    QRBand7: TQRBand;
    QRLabel41: TQRLabel;
    lProgramVer: TQRLabel;
    QRLabel1: TQRLabel;
    QRBand8: TQRBand;
    ReportTitle: TQRLabel;
    QRShape3: TQRShape;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    QRLabel48: TQRLabel;
    lFebDate: TQRLabel;
    lAprDate: TQRLabel;
    QRLabel47: TQRLabel;
    lHerdID: TQRLabel;
    QRLabel42: TQRLabel;
    qrlHectares: TQRLabel;
    lJunDate: TQRLabel;
    lForecast: TQRLabel;
    lFebForecastWaste: TQRLabel;
    lAprForecastWaste: TQRLabel;
    lAugDate: TQRLabel;
    lOctDate: TQRLabel;
    lDecDate: TQRLabel;
    lAugForecastWaste: TQRLabel;
    lOctForecastWaste: TQRLabel;
    qrBullBeef013Mths: TQRLabel;
    lFebOlderCattleOver24mths: TQRLabel;
    lAprOlderCattleOver24mths: TQRLabel;
    qrCattle012Mths: TQRLabel;
    lFebCattle1224mths: TQRLabel;
    lAprCattle1224mths: TQRLabel;
    QRLabel97: TQRLabel;
    lFebCattle012mths: TQRLabel;
    lAprCattle012mths: TQRLabel;
    sepline2: TQRShape;
    sepline4: TQRShape;
    sepline6: TQRShape;
    lJunCattle012mths: TQRLabel;
    lJunCattle1224mths: TQRLabel;
    lJunOlderCattleOver24mths: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lFebDairyCows: TQRLabel;
    lAprDairyCows: TQRLabel;
    lJunDairyCows: TQRLabel;
    sepline8: TQRShape;
    lAugCattle012mths: TQRLabel;
    lAugCattle1224mths: TQRLabel;
    lAugOlderCattleOver24mths: TQRLabel;
    lAugDairyCows: TQRLabel;
    sepline10: TQRShape;
    lOctCattle012mths: TQRLabel;
    lOctCattle1224mths: TQRLabel;
    lOctOlderCattleOver24mths: TQRLabel;
    lOctDairyCows: TQRLabel;
    lDecCattle012mths: TQRLabel;
    lDecCattle1224mths: TQRLabel;
    lDecOlderCattleOver24mths: TQRLabel;
    lDecDairyCows: TQRLabel;
    sepline12: TQRShape;
    lTotalWaste: TQRLabel;
    QRLabel39: TQRLabel;
    lFebTotNum: TQRLabel;
    lAprTotNum: TQRLabel;
    lFebTotalWasteProd: TQRLabel;
    lAprTotalWasteProd: TQRLabel;
    lWastePerHa: TQRLabel;
    lFebWastePerHa: TQRLabel;
    lAprWastePerHa: TQRLabel;
    lJunTotalWasteProd: TQRLabel;
    lJunWastePerHa: TQRLabel;
    lJunTotNum: TQRLabel;
    lWasteGenOnFarm: TQRLabel;
    lFebWasteProd: TQRLabel;
    lAprWasteProd: TQRLabel;
    lJunWasteProd: TQRLabel;
    QRLabel58: TQRLabel;
    lWasteNonBovine: TQRLabel;
    lFebWasteProdNonBovine: TQRLabel;
    lAprWasteProdNonBovine: TQRLabel;
    lJunWasteProdNonBovine: TQRLabel;
    lWasteForecast: TQRLabel;
    lForecastWasteProd1: TQRLabel;
    lForecastWasteProd2: TQRLabel;
    lForecastWasteProd3: TQRLabel;
    lForecastWasteProd4: TQRLabel;
    lForecastWasteProd5: TQRLabel;
    lForecastWasteProd6: TQRLabel;
    QRLabel7: TQRLabel;
    lTotalProductionInYr: TQRLabel;
    lTotalWasteProdCalYr: TQRLabel;
    lAvgProductionInYr: TQRLabel;
    lAvgWastePerHaCalYr: TQRLabel;
    lForecastWasteProd7: TQRLabel;
    lAugTotalWasteProd: TQRLabel;
    lAugWastePerHa: TQRLabel;
    lAugTotNum: TQRLabel;
    lAugWasteProd: TQRLabel;
    lAugWasteProdNonBovine: TQRLabel;
    lForecastWasteProd8: TQRLabel;
    lForecastWasteProd9: TQRLabel;
    lOctTotalWasteProd: TQRLabel;
    lOctWastePerHa: TQRLabel;
    lOctTotNum: TQRLabel;
    lOctWasteProd: TQRLabel;
    lOctWasteProdNonBovine: TQRLabel;
    lForecastWasteProd10: TQRLabel;
    lForecastWasteProd11: TQRLabel;
    lDecTotalWasteProd: TQRLabel;
    lDecWastePerHa: TQRLabel;
    lDecTotNum: TQRLabel;
    lDecWasteProd: TQRLabel;
    lDecWasteProdNonBovine: TQRLabel;
    lForecastWasteProd12: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    lJunForecastWaste: TQRLabel;
    lDecForecastWaste: TQRLabel;
    QRLabel2: TQRLabel;
    lYear: TQRLabel;
    QRShape1: TQRShape;
    QRRTFFilter1: TQRRTFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRTextFilter1: TQRTextFilter;
    lFebBullBeef013Mths: TQRLabel;
    lAprBullBeef013Mths: TQRLabel;
    lJunBullBeef013Mths: TQRLabel;
    lAugBullBeef013Mths: TQRLabel;
    lOctBullBeef013Mths: TQRLabel;
    lDecBullBeef013Mths: TQRLabel;
    qrCalves06mths: TQRLabel;
    lFebCalves06mths: TQRLabel;
    lAprCalves06mths: TQRLabel;
    lJunCalves06mths: TQRLabel;
    lAugCalves06mths: TQRLabel;
    lOctCalves06mths: TQRLabel;
    lDecCalves06mths: TQRLabel;
    qrCalves612Mths: TQRLabel;
    lFebCalves612Mths: TQRLabel;
    lAprCalves612Mths: TQRLabel;
    lJunCalves612Mths: TQRLabel;
    lAugCalves612Mths: TQRLabel;
    lOctCalves612Mths: TQRLabel;
    lDecCalves612Mths: TQRLabel;
    qrBullBeef613mths: TQRLabel;
    lFebBullBeef613Mths: TQRLabel;
    lAprBullBeef613Mths: TQRLabel;
    lJunBullBeef613Mths: TQRLabel;
    lAugBullBeef613Mths: TQRLabel;
    lOctBullBeef613Mths: TQRLabel;
    lDecBullBeef613Mths: TQRLabel;
    procedure NutProdProjRptBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrCalves06mthsPrint(sender: TObject; var Value: String);
    procedure qrBullBeef013MthsPrint(sender: TObject; var Value: String);
    procedure NutProdProjRptAfterPreview(Sender: TObject);
  private
    { Private declarations }
    FDate1,
    FDate2,
    FDate3,
    FDate4,
    FDate5,
    FDate6 : TDateTime;
  public
    CurrentYear : Integer;
    PartYear : Boolean;
    procedure ResetCaptions(ProductionType : string);
    procedure ShiftLeft(QrLabel : TQrLabel; Offset : Integer);
    procedure HideCaptions(StartDate : Integer);
    procedure HideHectareProduction;
  end;

var
  fmNINutrientProductionProjectionRpt: TfmNINutrientProductionProjectionRpt;

implementation

{$R *.DFM}

procedure TfmNINutrientProductionProjectionRpt.HideCaptions(
  StartDate: Integer);
begin

{   sepline11.Visible := StartDate
   if StartDate = 11 then
      begin
   else if StartDate = 10 then
      sepline11.Visible := False
   else if StartDate = 9 then
      sepline10.Visible := False
}
end;

procedure TfmNINutrientProductionProjectionRpt.HideHectareProduction;
begin
//   lTotalProductionInYr.Caption := '';
   lAvgProductionInYr.Caption := '';
//   lTotalWasteProdCalYr.Caption := '';
   lAvgWastePerHaCalYr.Caption := '';
   lFebWastePerHa.Caption := '';
   lAprWastePerHa.Caption := '';
   lJunWastePerHa.Caption := '';
   lAugWastePerHa.Caption := '';
   lOctWastePerHa.Caption := '';
   lDecWastePerHa.Caption := '';
end;

procedure TfmNINutrientProductionProjectionRpt.NutProdProjRptBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//
end;

procedure TfmNINutrientProductionProjectionRpt.ResetCaptions(ProductionType : string);
var
  i : Integer;
begin
   ReportTitle.Caption := Format('Livestock Nutrient Production Projection - %s',[ProductionType]);
   lWasteGenOnFarm.Caption := Format('%s Generated On Farm',[ProductionType]);
   lWasteForecast.Caption := Format('(+/-) %s based on livestock Purchase/Sales',[ProductionType]);
   lWasteNonBovine.Caption := Format('%s Generated by Non-Bovine Animals',[ProductionType]);
   lForecast.Caption := Format('(+/-) %s based on livestock Purchase/Sales',[ProductionType]);
   lTotalWaste.Caption := Format('Total %s',[ProductionType]);
   lWastePerHa.Caption := Format('%s/Hectare',[ProductionType]);
   lTotalProductionInYr.Caption := Format('Total %s Generated in Calender Year %d',[ProductionType,CurrentYear]);
   lAvgProductionInYr.Caption := Format('Average %s/Hectare over calender year %d',[ProductionType,CurrentYear]);
   lYear.Caption := IntToStr(CurrentYear);

   for i := 0 to ComponentCount-1 do
      if (Components[i] is TQrLabel) then
         if ( Components[i] As TQrLabel ).Tag = 1 then
            ( Components[i] As TQrLabel ).Caption := ''
         else if ( Components[i] As TQrLabel ).Tag = 2 then
//            ( Components[i] As TQrLabel ).Caption := '0';
            ( Components[i] As TQrLabel ).Caption := '';
end;


procedure TfmNINutrientProductionProjectionRpt.ShiftLeft(QrLabel: TQrLabel;
  Offset: Integer);
begin

end;

procedure TfmNINutrientProductionProjectionRpt.qrCalves06mthsPrint(
  sender: TObject; var Value: String);
begin
   if not PartYear then
      value := ''
   else
      (Sender as TQrLabel).top := (Sender as TQrLabel).top-40;
end;

procedure TfmNINutrientProductionProjectionRpt.qrBullBeef013MthsPrint(
  sender: TObject; var Value: String);
begin
   if PartYear then
      value := '' ;

end;

procedure TfmNINutrientProductionProjectionRpt.NutProdProjRptAfterPreview(
  Sender: TObject);
begin
  qrBullBeef613mths.Top := 235;
  lFebBullBeef613Mths.Top := 235;
  lAprBullBeef613Mths.Top := 235;
  lJunBullBeef613Mths.Top := 235;
  lAugBullBeef613Mths.Top := 235;
  lOctBullBeef613Mths.Top := 235;
  lDecBullBeef613Mths.Top := 235;            

  qrCalves612Mths.Top := 255;
  lFebCalves612Mths.Top := 255;
  lAprCalves612Mths.Top := 255;
  lJunCalves612Mths.Top := 255;
  lAugCalves612Mths.Top := 255;
  lOctCalves612Mths.Top := 255;
  lDecCalves612Mths.Top := 255;

  qrCalves06mths.Top := 275;
  lFebCalves06mths.Top := 275;
  lAprCalves06mths.Top := 275;
  lJunCalves06mths.Top := 275;
  lAugCalves06mths.Top := 275;
  lOctCalves06mths.Top := 275;
  lDecCalves06mths.Top := 275;

end;

end.
