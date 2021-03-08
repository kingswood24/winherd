{
   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   19/02/15 [V5.4 R2.6] /MK Change - CalcProjection - Exclude animals that have had a temporary move off holding on/after ADate or move back on holding after ADate.

   26/05/15 [V5.4 R7.0] /MK Bug Fix - FormActive - ComboHerd.Value was being assigned before ComboHerd.LookupSource was assigned
                                                   resulting in no default value appearing in the ComboHerd.

   24/09/18 [V5.8 R2.9] /MK Additional Feature - Added the filter button to the report - Paul Sandall.
                                               - GetAnimals - If filter is on then only take animals that are in the filter into the report.

   20/11/20 [V5.9 R7.5] /MK Change - If there are no Waste Productions Rates give error with info on how to enter the rates.
                                   - HasWasteProdRates - No function to check whether the user has HasWasteProdRates to view the report.

   22/12/20 [V5.9 R7.9] /MK Change - Changed Forage Area from Spin Edit to Current Edit so as not to show the spin buttons - GL request.
                                   - Added a label under the Forecast Purchases & Sales to explain that movements are assumed to ocurr on the first date of the month - GL request.

   26/02/21 [V5.9 R8.6] /MK Additional Feature - Enabled help button with new nutprodrep.htm page.                                      
}

unit uNutrientProductionProjectionRptScr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ToolEdit, CurrEdit, RxLookup, ExtCtrls,
  RXCtrls, ToolWin, DateUtil, db, dbTables, {pGenTypesConst,} GenTypesConst,
  RXSpin, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxDropDownEdit, cxLabel, cxCurrencyEdit, cxMemo, cxCheckBox;

type
  TCalfRecord = class
    DamNo : String[10];
    DamID : Integer;
    DOB  : TDateTime;
    constructor Create(ADamID : Integer; ADOB : TDateTime);
  end;

  TAnimalWasteCategory = (wcDairyCows, wcSucklerCows, wcCattle0To1Yr, wcCattle1To2Yr, wcCattle2PlusYr);
  TAnimalWasteType = (wtNitrogen, wtPhosphorus);

  TProjectedTotals = record
     DairyCows,
     SucklerCows,
     Cattle0To12,
     Cattle12To24,
     Cattle2Plus : Double;
  end;

  TWasteProductionRecord = record
    TotalAnimals : double;
    TotalProduction,
    TotalProductionIncForecast,
    TotalProductionIncNonBovine,
    ProductionPerHa : Double;
  end;

  TfmNutrientProductionProjectionRptScr = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    p: TPanel;
    lProgBar: TLabel;
    lPleaseWait: TLabel;
    lAmountNonBovine: TLabel;
    Label13: TLabel;
    pb: TProgressBar;
    GenQuery: TQuery;
    seAvgNonBovineProduction: TcxSpinEdit;
    sbWasteProdRates: TRxSpeedButton;
    ToolButton3: TToolButton;
    GroupBox1: TGroupBox;
    cbNitrogen: TRadioButton;
    cbPhosphorus: TRadioButton;
    cmboYear: TcxComboBox;
    cmboMonth: TcxComboBox;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cbUseForecastFigures: TcxCheckBox;
    Memo: TcxMemo;
    pForecast: TPanel;
    Bevel5: TBevel;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    L4: TLabel;
    L5: TLabel;
    L6: TLabel;
    L7: TLabel;
    L8: TLabel;
    L9: TLabel;
    L10: TLabel;
    L11: TLabel;
    L12: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    cmbDate1: TcxComboBox;
    cmbDate2: TcxComboBox;
    cmbDate3: TcxComboBox;
    cmbDate4: TcxComboBox;
    cmbDate5: TcxComboBox;
    cmbDate6: TcxComboBox;
    cmbDate7: TcxComboBox;
    cmbDate8: TcxComboBox;
    cmbDate9: TcxComboBox;
    cmbDate10: TcxComboBox;
    cmbDate11: TcxComboBox;
    cmbDate12: TcxComboBox;
    ceJanDCows: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    ceJanSCows: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    ceJanCattle012Mths: TcxCurrencyEdit;
    ceJanCattle12Yr: TcxCurrencyEdit;
    ceJanCattle2YrPlus: TcxCurrencyEdit;
    ceFebDCows: TcxCurrencyEdit;
    ceFebSCows: TcxCurrencyEdit;
    ceFebCattle012Mths: TcxCurrencyEdit;
    ceFebCattle12Yr: TcxCurrencyEdit;
    ceFebCattle2YrPlus: TcxCurrencyEdit;
    ceMarDCows: TcxCurrencyEdit;
    ceMarSCows: TcxCurrencyEdit;
    ceMarCattle012Mths: TcxCurrencyEdit;
    ceMarCattle12Yr: TcxCurrencyEdit;
    ceMarCattle2YrPlus: TcxCurrencyEdit;
    ceAprDCows: TcxCurrencyEdit;
    ceAprSCows: TcxCurrencyEdit;
    ceAprCattle012Mths: TcxCurrencyEdit;
    ceAprCattle12Yr: TcxCurrencyEdit;
    ceAprCattle2YrPlus: TcxCurrencyEdit;
    ceMayDCows: TcxCurrencyEdit;
    ceMaySCows: TcxCurrencyEdit;
    ceMayCattle012Mths: TcxCurrencyEdit;
    ceMayCattle12Yr: TcxCurrencyEdit;
    ceMayCattle2YrPlus: TcxCurrencyEdit;
    ceJuneDCows: TcxCurrencyEdit;
    ceJuneSCows: TcxCurrencyEdit;
    ceJuneCattle012Mths: TcxCurrencyEdit;
    ceJuneCattle12Yr: TcxCurrencyEdit;
    ceJuneCattle2YrPlus: TcxCurrencyEdit;
    ceJulyDCows: TcxCurrencyEdit;
    ceJulySCows: TcxCurrencyEdit;
    ceJulyCattle012Mths: TcxCurrencyEdit;
    ceJulyCattle12Yr: TcxCurrencyEdit;
    ceJulyCattle2YrPlus: TcxCurrencyEdit;
    ceAugDCows: TcxCurrencyEdit;
    ceAugSCows: TcxCurrencyEdit;
    ceAugCattle012Mths: TcxCurrencyEdit;
    ceAugCattle12Yr: TcxCurrencyEdit;
    ceAugCattle2YrPlus: TcxCurrencyEdit;
    ceSeptDCows: TcxCurrencyEdit;
    ceSeptSCows: TcxCurrencyEdit;
    ceSeptCattle012Mths: TcxCurrencyEdit;
    ceSeptCattle12Yr: TcxCurrencyEdit;
    ceSeptCattle2YrPlus: TcxCurrencyEdit;
    ceOctDCows: TcxCurrencyEdit;
    ceOctSCows: TcxCurrencyEdit;
    ceOctCattle012Mths: TcxCurrencyEdit;
    ceOctCattle12Yr: TcxCurrencyEdit;
    ceOctCattle2YrPlus: TcxCurrencyEdit;
    ceNovDCows: TcxCurrencyEdit;
    ceNovSCows: TcxCurrencyEdit;
    ceNovCattle012Mths: TcxCurrencyEdit;
    ceNovCattle12Yr: TcxCurrencyEdit;
    ceNovCattle2YrPlus: TcxCurrencyEdit;
    ceDecDCows: TcxCurrencyEdit;
    ceDecSCows: TcxCurrencyEdit;
    ceDecCattle012Mths: TcxCurrencyEdit;
    ceDecCattle12Yr: TcxCurrencyEdit;
    ceDecCattle2YrPlus: TcxCurrencyEdit;
    ceJanTotalForecast: TcxCurrencyEdit;
    lForecastType: TcxLabel;
    ceFebTotalForecast: TcxCurrencyEdit;
    ceMarTotalForecast: TcxCurrencyEdit;
    ceAprTotalForecast: TcxCurrencyEdit;
    ceMayTotalForecast: TcxCurrencyEdit;
    ceJuneTotalForecast: TcxCurrencyEdit;
    ceJulyTotalForecast: TcxCurrencyEdit;
    ceAugTotalForecast: TcxCurrencyEdit;
    ceSeptTotalForecast: TcxCurrencyEdit;
    ceOctTotalForecast: TcxCurrencyEdit;
    ceNovTotalForecast: TcxCurrencyEdit;
    ceDecTotalForecast: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    cbFavourite: TcxCheckBox;
    cbFilter: TcxCheckBox;
    lForecastInfo: TcxLabel;
    ceForageArea: TcxCurrencyEdit;
    procedure cbNitrogenClick(Sender: TObject);
    procedure cbPhosphorusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure ceJanDCowsExit(Sender: TObject);
    procedure ceFebDCowsExit(Sender: TObject);
    procedure ceMarDCowsExit(Sender: TObject);
    procedure ceAprDCowsExit(Sender: TObject);
    procedure ceMayDCowsExit(Sender: TObject);
    procedure ceJuneDCowsExit(Sender: TObject);
    procedure ceJulyDCowsExit(Sender: TObject);
    procedure ceAugDCowsExit(Sender: TObject);
    procedure ceSeptDCowsExit(Sender: TObject);
    procedure ceOctDCowsExit(Sender: TObject);
    procedure ceNovDCowsExit(Sender: TObject);
    procedure ceDecDCowsExit(Sender: TObject);
    procedure sbWasteProdRatesClick(Sender: TObject);
    procedure ComboHerdChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbUseForecastFiguresPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmboMonthPropertiesChange(Sender: TObject);
    procedure cmboYearPropertiesChange(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
  private
    { Private declarations }
    ConfigFile : TStringList;
    ProductionType : string;
    PDairyCow,
    PSucklerCow,
    PCattle0To1Yr,
    PCattle1To2Yr,
    PCattle2PlusYr:Double;
    AnimalWasteType : TAnimalWasteType;
    NutrientProjection : TTable;
    ThisYear : Integer;
    StartDateIndex : Integer;
    fNPDefs : String;
    WasteValuesLoaded : Boolean;
    AnimalList : TStringList;
    DebugMode : Boolean;
    CalfList : TStringList;
    CalvingInfo : TCalvingInfo;
    ProjectedTotals : TProjectedTotals;
    FFormShowing : Boolean;
    FUseForecastFigures : Boolean;
    FPreviewReport : Boolean;
    FTempMovementAnimalIDArray : Array Of Integer;
    procedure SetupControls;
    procedure SetupCustomControls;
    function DateCount : Integer;
    procedure GetAnimals;
    procedure BuildProjection;
    procedure ResetReportCaptions;
    procedure CalcProjection(ADate : TDateTime; var AProjectedTotals : TProjectedTotals);
    procedure CalcProjection365(AIndex : Byte);

    function EndOfMonthDate(AIndex : Integer) : TDateTime;
    function GetComboControl(ComboIndex : Integer ) : TcxComboBox;
    function GetWasteRateValue(AAnimalWasteCategory : TAnimalWasteCategory;
       AAnimalWasteType : TAnimalWasteType) : Double;
    function CalcProjectedWaste(DCow, SCow, Cattle012Mth, Cattle12Yr, Cattle2YrPlus : Double) : Double;
    procedure LoadWasteValues;
    procedure SaveWasteValues(AAnimalWasteType : TAnimalWasteType);
    procedure CheckProjectedCalving(const AnimalID : Integer; const CheckDate : TDateTime;
        var NoOfCalves : Integer; var DOB : TDateTime);
    function Round(AValue : Double) : Integer;
    function ReportPeriodAsString : string;
    procedure UpdateDateControls;
    procedure EnableForecastControls(const AEnable : Boolean);
    function IsFutureDate(AControlIndex : Integer) : Boolean;
    procedure OutputReport;
    function HasWasteProdRates : Boolean;
  public
    { Public declarations }
    class procedure ShowForm;
  end;

var
  fmNutrientProductionProjectionRptScr: TfmNutrientProductionProjectionRptScr;

implementation
uses
   uNutrientProductionProjectionRpt, DairyData, {dmHerdProps, } KRoutines,
   uSetupWasteProdRates, KDBRoutines;

{$R *.DFM}

{ TfmNutrientProductionProjectionRptScr }

procedure TfmNutrientProductionProjectionRptScr.SetupControls;
var

   i, nYear : Integer;
begin

   nYear := ExtractYear(Date);
   i := nYear;
   while (nYear >= i-5) do
      begin
         cmboYear.Properties.Items.Add(IntToStr(nYear));
         Dec(nYear);
      end;
   cmboYear.ItemIndex := 0;

   cmboMonth.Clear;
   cmboMonth.Properties.Items.Add('JAN');
   cmboMonth.Properties.Items.Add('FEB');
   cmboMonth.Properties.Items.Add('MAR');
   cmboMonth.Properties.Items.Add('APR');
   cmboMonth.Properties.Items.Add('MAY');
   cmboMonth.Properties.Items.Add('JUN');
   cmboMonth.Properties.Items.Add('JUL');
   cmboMonth.Properties.Items.Add('AUG');
   cmboMonth.Properties.Items.Add('SEP');
   cmboMonth.Properties.Items.Add('OCT');
   cmboMonth.Properties.Items.Add('NOV');
   cmboMonth.Properties.Items.Add('DEC');
   cmboMonth.ItemIndex := 0;

   cmbDate1.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate1.ItemIndex := 0;

   cmbDate2.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate2.ItemIndex := 1;

   cmbDate3.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate3.ItemIndex := 2;

   cmbDate4.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate4.ItemIndex := 3;

   cmbDate5.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate5.ItemIndex := 4;

   cmbDate6.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate6.ItemIndex := 5;

   cmbDate7.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate7.ItemIndex := 6;

   cmbDate8.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate8.ItemIndex := 7;

   cmbDate9.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate9.ItemIndex := 8;

   cmbDate10.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate10.ItemIndex := 9;

   cmbDate11.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate11.ItemIndex := 10;

   cmbDate12.Properties.Items.Assign(cmboMonth.Properties.Items);
   cmbDate12.ItemIndex := 11;

   LoadWasteValues;

   if FileExists(fNPDefs) then
      begin
         ConfigFile.LoadFromFile(fNPDefs);
         if ConfigFile.Values['ReportType'] = 'P' then
            begin
               cbNitrogen.Checked := False;
               cbPhosphorus.Checked := True;
            end
         else
            begin
               cbNitrogen.Checked := True;
               cbPhosphorus.Checked := False;
            end;
      end
   else
      begin
         cbNitrogen.Checked := True;
         cbPhosphorus.Checked := False;
      end;
end;

procedure TfmNutrientProductionProjectionRptScr.SetupCustomControls;
const
   cAmountNonBovineCap = 'Amount of %s produced by non-bovine animals per year:';
begin
   if cbNitrogen.Checked then
      begin
         ProductionType := 'Nitrogen';
         cbNitrogen.Font.Color := clRed;
         cbPhosphorus.Font.Color := clBlack;
         AnimalWasteType := wtNitrogen;
         lAmountNonBovine.Caption := Format(cAmountNonBovineCap, ['Nitrogen']);
      end
   else if cbPhosphorus.Checked then
      begin
         ProductionType := 'Phosphorus';
         cbPhosphorus.Font.Color := clRed;
         cbNitrogen.Font.Color := clBlack;
         AnimalWasteType := wtPhosphorus;
      end;
  PDairyCow := GetWasteRateValue(wcDairyCows, AnimalWasteType) / 12;
  PSucklerCow  := GetWasteRateValue(wcSucklerCows, AnimalWasteType) / 12;
  PCattle0To1Yr  := GetWasteRateValue(wcCattle0To1Yr, AnimalWasteType) / 12;
  PCattle1To2Yr  := GetWasteRateValue(wcCattle1To2Yr, AnimalWasteType) / 12;
  PCattle2PlusYr  := GetWasteRateValue(wcCattle2PlusYr, AnimalWasteType) / 12;
  lAmountNonBovine.Caption := Format(cAmountNonBovineCap, [ProductionType]);
  if AnimalWasteType = wtPhosphorus then
     lForecastType.Caption := Format('(+/-) %s',[Copy(ProductionType,1,4)+'.'])
  else
     lForecastType.Caption := Format('(+/-) %s',[ProductionType]);

  Update;
end;

procedure TfmNutrientProductionProjectionRptScr.cbNitrogenClick(Sender: TObject);
begin
   if WasteValuesLoaded then
      SaveWasteValues(wtPhosphorus);
   cbPhosphorus.Checked := not cbNitrogen.Checked;
   SetupCustomControls;
   LoadWasteValues;
end;

procedure TfmNutrientProductionProjectionRptScr.cbPhosphorusClick(Sender: TObject);
begin
   if WasteValuesLoaded then
      SaveWasteValues(wtNitrogen);
   cbNitrogen.Checked := not cbPhosphorus.Checked;
   SetupCustomControls;
   LoadWasteValues;
end;

class procedure TfmNutrientProductionProjectionRptScr.ShowForm;
begin
   with TfmNutrientProductionProjectionRptScr.Create(nil) do
      try
//         HerdProps.OpenHerdData;
         ThisYear := CurrentYear;
         SetupControls;
         SetupCustomControls;
         ShowModal;
      finally
//         HerdProps.CloseHerdData;
         Free;
      end;
end;

procedure TfmNutrientProductionProjectionRptScr.BuildProjection;
const
   cDisplayProgressLabel = 'Date %d Compiling';
var
//   nTotalWasteGenerated : Double; // Total Production
   nForecastWaste1,nForecastWaste2,
   nForecastWaste3,nForecastWaste4,
   nForecastWaste5,nForecastWaste6,
   nForecastWaste7,nForecastWaste8,
   nForecastWaste9,nForecastWaste10,
   nForecastWaste11,nForecastWaste12,
   MonthTotal, HectareAverage,
   AvgNonBovine, ForageAreaHa : Double;

   WasteProductionRecord : TWasteProductionRecord;

   function DoCalcs( AProjectedTotals : TProjectedTotals;
       nForecastWaste, AvgNonBovine, ForageArea : Double ) : TWasteProductionRecord;
   begin
      with AProjectedTotals do
         begin
            Result.TotalAnimals :=  ( DairyCows+SucklerCows+Cattle0To12+Cattle12To24+Cattle2Plus);
            Result.TotalProduction := (( DairyCows * PDairyCow ) + ( SucklerCows * PSucklerCow ) + ( Cattle0To12 * PCattle0To1Yr) +
                                       ( Cattle12To24 * PCattle1To2Yr) + ( Cattle2Plus * PCattle2PlusYr ));
         end;
      Result.TotalProductionIncForecast := Result.TotalProduction + nForecastWaste;
      Result.TotalProductionIncNonBovine := Result.TotalProductionIncForecast + AvgNonBovine;
      if ( ForageArea > 0 ) then
         Result.ProductionPerHa := Result.TotalProductionIncNonBovine / ForageArea;
   end;

   function GetForecastValue(
     AMonthIndex: Integer): Double;
   begin
      Result := 0;
      if not FUseForecastFigures then Exit;

      case AMonthIndex of
         1: Result := nForecastWaste1;
         2: Result := nForecastWaste2;
         3: Result := nForecastWaste3;
         4: Result := nForecastWaste4;
         5: Result := nForecastWaste5;
         6: Result := nForecastWaste6;
         7: Result := nForecastWaste7;
         8: Result := nForecastWaste8;
         9: Result := nForecastWaste9;
         10: Result := nForecastWaste10;
         11: Result := nForecastWaste11;
         12: Result := nForecastWaste12;
      end;
   end;

   procedure CalcDate1;
   begin
      // set progress bar caption

      if GetComboControl(1).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [1]);
      Update;

      CalcProjection365(1);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate1.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 1 ));
            lForecastWaste1.Caption := FloatToStrF(GetForecastValue(1), ffFixed, 8, 2);
            WasteProdNonBovine1.Caption := FloatToStrF(AvgNonBovine, ffFixed, 8, 2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(1), AvgNonBovine, ForageAreaHa );

            lDairyCows1.Caption := IntToStr(Round(DairyCows));
            lSucklerCows1.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr1.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr1.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs1.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum1.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd1.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd1.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd1.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa1.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;

        end;
   end;

   procedure CalcDate2;
   begin

      if GetComboControl(2).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [2]);
      lProgBar.Refresh;

      CalcProjection365(2);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate2.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 2 ));
            lForecastWaste2.Caption := FloatToStrF(GetForecastValue(2), ffFixed, 8, 2);
            WasteProdNonBovine2.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(2), AvgNonBovine, ForageAreaHa );

            lDairyCows2.Caption := IntToStr(Round(DairyCows));
            lSucklerCows2.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr2.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr2.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs2.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum2.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd2.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd2.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd2.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa2.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate3;
   begin

      if GetComboControl(3).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [3]);
      lProgBar.Refresh;

      CalcProjection365(3);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate3.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 3 ));
            lForecastWaste3.Caption := FloatToStrF(GetForecastValue(3), ffFixed, 8, 2);
            WasteProdNonBovine3.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(3), AvgNonBovine, ForageAreaHa );

            lDairyCows3.Caption := IntToStr(Round(DairyCows));
            lSucklerCows3.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr3.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr3.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs3.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum3.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd3.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd3.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd3.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa3.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;


   procedure CalcDate4;
   begin
      if GetComboControl(4).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [4]);
      lProgBar.Refresh;

      CalcProjection365(4);
      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate4.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 4 ));
            lForecastWaste4.Caption := FloatToStrF(GetForecastValue(4), ffFixed, 8, 2);
            WasteProdNonBovine4.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(4), AvgNonBovine, ForageAreaHa );

            lDairyCows4.Caption := IntToStr(Round(DairyCows));
            lSucklerCows4.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr4.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr4.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs4.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum4.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd4.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd4.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd4.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa4.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate5;
   begin

      if GetComboControl(5).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [5]);
      lProgBar.Refresh;

      CalcProjection365(5);
      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate5.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 5 ));
            lForecastWaste5.Caption := FloatToStrF(GetForecastValue(5), ffFixed, 8, 2);
            WasteProdNonBovine5.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(5), AvgNonBovine, ForageAreaHa );

            lDairyCows5.Caption := IntToStr(Round(DairyCows));
            lSucklerCows5.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr5.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr5.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs5.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum5.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd5.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd5.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd5.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa5.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;


   procedure CalcDate6;
   begin
      if GetComboControl(6).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [6]);
      lProgBar.Refresh;

      CalcProjection365(6);
      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate6.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 6 ));
            lForecastWaste6.Caption := FloatToStrF(GetForecastValue(6), ffFixed, 8, 2);
            WasteProdNonBovine6.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(6), AvgNonBovine, ForageAreaHa );

            lDairyCows6.Caption := IntToStr(Round(DairyCows));
            lSucklerCows6.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr6.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr6.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs6.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum6.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd6.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd6.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd6.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa6.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate7;
   begin
      if GetComboControl(7).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [7]);
      lProgBar.Refresh;

      CalcProjection365(7);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate7.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 7 ));
            lForecastWaste7.Caption := FloatToStrF(GetForecastValue(7), ffFixed, 8, 2);
            WasteProdNonBovine7.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(7), AvgNonBovine, ForageAreaHa );

            lDairyCows7.Caption := IntToStr(Round(DairyCows));
            lSucklerCows7.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr7.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr7.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs7.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum7.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd7.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd7.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd7.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa7.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate8;
   begin
      if GetComboControl(8).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [8]);
      lProgBar.Refresh;

      CalcProjection365(8);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate8.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 8));
            lForecastWaste8.Caption := FloatToStrF(GetForecastValue(8), ffFixed, 8, 2);
            WasteProdNonBovine8.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(8), AvgNonBovine, ForageAreaHa );

            lDairyCows8.Caption := IntToStr(Round(DairyCows));
            lSucklerCows8.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr8.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr8.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs8.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum8.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd8.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd8.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd8.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa8.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate9;
   begin
      if GetComboControl(9).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [9]);
      lProgBar.Refresh;

      CalcProjection365(9);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate9.Caption := FormatDateTime('mm/yy', EndOfMonthDate(9 ));
            lForecastWaste9.Caption := FloatToStrF(GetForecastValue(9), ffFixed, 8, 2);
            WasteProdNonBovine9.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(9), AvgNonBovine, ForageAreaHa );

            lDairyCows9.Caption := IntToStr(Round(DairyCows));
            lSucklerCows9.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr9.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr9.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs9.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum9.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd9.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd9.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd9.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa9.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate10;
   begin
      if GetComboControl(10).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [10]);
      lProgBar.Refresh;

      CalcProjection365(10);

      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate10.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 10 ));
            lForecastWaste10.Caption := FloatToStrF(GetForecastValue(10), ffFixed, 8, 2);
            WasteProdNonBovine10.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(10), AvgNonBovine, ForageAreaHa );

            lDairyCows10.Caption := IntToStr(Round(DairyCows));
            lSucklerCows10.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr10.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr10.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs10.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum10.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd10.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd10.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd10.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa10.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate11;
   begin
      if GetComboControl(11).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [11]);
      lProgBar.Refresh;

      CalcProjection365(11);
      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate11.Caption := FormatDateTime('mm/yy', EndOfMonthDate( 11));
            lForecastWaste11.Caption := FloatToStrF(GetForecastValue(11), ffFixed, 8, 2);
            WasteProdNonBovine11.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(11), AvgNonBovine, ForageAreaHa );

            lDairyCows11.Caption := IntToStr(Round(DairyCows));
            lSucklerCows11.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr11.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr11.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs11.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum11.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd11.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd11.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd11.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa11.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

   procedure CalcDate12;
   begin
      if GetComboControl(12).ItemIndex = -1 then Exit;

      lProgBar.Caption := Format(cDisplayProgressLabel, [12]);
      lProgBar.Refresh;

      CalcProjection365(12);
      with fmNutrientProductionProjectionRpt, ProjectedTotals do
         begin
            lDate12.Caption := FormatDateTime('mm/yy', EndOfMonthDate(12));
            lForecastWaste12.Caption := FloatToStrF(GetForecastValue(12), ffFixed, 8, 2);
            WasteProdNonBovine12.Caption := FloatToStrF(AvgNonBovine,ffFixed, 8,2);

            WasteProductionRecord := DoCalcs(ProjectedTotals, GetForecastValue(12), AvgNonBovine, ForageAreaHa );

            lDairyCows12.Caption := IntToStr(Round(DairyCows));
            lSucklerCows12.Caption := IntToStr(Round(SucklerCows));
            l0To1Yr12.Caption := IntToStr(Round(Cattle0To12));
            l1to2yr12.Caption := IntToStr(Round(Cattle12To24));
            l2PlusYrs12.Caption := IntToStr(Round(Cattle2Plus));

            // Total Animals
            lTotNum12.Caption := IntToStr(Round(WasteProductionRecord.TotalAnimals));

            // Total Waste Produced By Animals
            lWasteProd12.Caption := FloatToStrF(WasteProductionRecord.TotalProduction,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast
            //lForecastWasteProd12.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncForecast,ffFixed,8,1);

            // Total Waste Produced By Animals * Incuding Forecast ** Including Non-Bovine
            lTotalWasteProd12.Caption := FloatToStrF(WasteProductionRecord.TotalProductionIncNonBovine, ffFixed,8,1);

            // Total Waste Per Hectare
            if ( ForageAreaHa > 0 ) then
               lWastePerHa12.Caption := FloatToStrF(WasteProductionRecord.ProductionPerHa,ffFixed,8,2);

            // Add to MonthTotal
            MonthTotal := MonthTotal + WasteProductionRecord.TotalProductionIncNonBovine;
        end;
   end;

var
   NumDates : Integer;
begin
   lPleaseWait.Visible := True;
   // find no of dates & get max and min dates
   lProgBar.Visible := True;
   lProgBar.Caption := 'Gathering Data...';

   pb.Visible := True;
   pb.Position := 0;

   Update;

   GetAnimals;

   fmNutrientProductionProjectionRpt.qrlFilterWarning.Enabled := cbFilter.Checked;

   // fill in HerdID and Version labels
   fmNutrientProductionProjectionRpt.lProgramVer.Caption := 'Kingswood Herd Management ' + HerdVerNo;
   fmNutrientProductionProjectionRpt.lHerdID.Caption := ComboHerd.Text;
   if ceForageArea.Text <> '' then
      fmNutrientProductionProjectionRpt.qrlHectares.Caption := ceForageArea.Text
   else
      fmNutrientProductionProjectionRpt.qrlHectares.Caption := '';
   fmNutrientProductionProjectionRpt.CurrentYear := ThisYear;

   fmNutrientProductionProjectionRpt.HideCaptions(StartDateIndex);
   ResetReportCaptions;

   nForecastWaste1  := 0;
   nForecastWaste2  := 0;
   nForecastWaste3  := 0;
   nForecastWaste4  := 0;
   nForecastWaste5  := 0;
   nForecastWaste6  := 0;
   nForecastWaste7  := 0;
   nForecastWaste8  := 0;
   nForecastWaste9  := 0;
   nForecastWaste10 := 0;
   nForecastWaste11 := 0;
   nForecastWaste12 := 0;
   try
      if IsFutureDate(1) then
         nForecastWaste1  := ceJanTotalForecast.Value;
      if IsFutureDate(2) then
         nForecastWaste2  := ceFebTotalForecast.Value;
      if IsFutureDate(3) then
         nForecastWaste3  := ceMarTotalForecast.Value;
      if IsFutureDate(4) then
         nForecastWaste4  := ceAprTotalForecast.Value;
      if IsFutureDate(5) then
         nForecastWaste5  := ceMayTotalForecast.Value;
      if IsFutureDate(6) then
         nForecastWaste6  := ceJuneTotalForecast.Value;
      if IsFutureDate(7) then
         nForecastWaste7  := ceJulyTotalForecast.Value;
      if IsFutureDate(8) then
         nForecastWaste8  := ceAugTotalForecast.Value;
      if IsFutureDate(9) then
         nForecastWaste9  := ceSeptTotalForecast.Value;
      if IsFutureDate(10) then
         nForecastWaste10 := ceOctTotalForecast.Value;
      if IsFutureDate(11) then
         nForecastWaste11 := ceNovTotalForecast.Value;
      if IsFutureDate(12) then
         nForecastWaste12 := ceDecTotalForecast.Value;
      if ( seAvgNonBovineProduction.Value > 0 ) then
         AvgNonBovine     := seAvgNonBovineProduction.Value / 12;
      ForageAreaHa     := ceForageArea.Value;
   except
   end;

   SetLength(FTempMovementAnimalIDArray,0);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(AID)');
         SQL.Add('FROM Movements');
         try
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  SetLength(FTempMovementAnimalIDArray,Length(FTempMovementAnimalIDArray)+1);
                  FTempMovementAnimalIDArray[Length(FTempMovementAnimalIDArray)-1] := Fields[0].AsInteger;
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;

   NumDates := DateCount;

   case NumDates of
      1:  begin MonthTotal :=0; CalcDate1; end;
      2:  begin MonthTotal :=0; CalcDate1; CalcDate2; end;
      3:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; end;
      4:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; end;
      5:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; end;
      6:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; end;
      7:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; CalcDate7;end;
      8:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; CalcDate7;CalcDate8;end;
      9:  begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; CalcDate7;CalcDate8;CalcDate9;end;
      10: begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; CalcDate7;CalcDate8;CalcDate9;CalcDate10;end;
      11: begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; CalcDate7;CalcDate8;CalcDate9;CalcDate10;CalcDate11;end;
      12: begin MonthTotal :=0; CalcDate1; CalcDate2; CalcDate3; CalcDate4; CalcDate5; CalcDate6; CalcDate7;CalcDate8;CalcDate9;CalcDate10;CalcDate11;CalcDate12;end;
   end;
   lPleaseWait.Visible := False;
   // find no of dates & get max and min dates
   lProgBar.Visible := False;
   lProgBar.Caption := '';

   pb.Visible := False;
   pb.Position := 0;

   Update;

   fmNutrientProductionProjectionRpt.lTotalWasteProdCalYr.Caption := FloatToStrF( MonthTotal, ffFixed, 8, 2);
   if ( ForageAreaHa > 0 ) then
      begin
         HectareAverage := ( MonthTotal / ForageAreaHa );
         fmNutrientProductionProjectionRpt.lAvgWastePerHaCalYr.Caption := FloatToStrF( HectareAverage, ffFixed, 8, 2);
      end
   else
      fmNutrientProductionProjectionRpt.HideHectareProduction;

   if FPreviewReport then
      fmNutrientProductionProjectionRpt.NutProdProjRpt.Preview
   else
      fmNutrientProductionProjectionRpt.NutProdProjRpt.Print;
end;

procedure TfmNutrientProductionProjectionRptScr.CalcProjection(
  ADate: TDateTime; var AProjectedTotals: TProjectedTotals);
var
   CalcDay,
   CalcMonth,
   CalcYear : String;
   TwoYear,
   OneYear,
   SixMonth : TDateTime;

   //   19/02/15 [V5.4 R2.6] /MK Change - Exclude animals that have had a temporary move off holding on/after ADate or move back on holding after ADate.
   function ExcludeTempMovement(AAnimalID : Integer; ADate : TDateTime) : Boolean;
   var
      qTempMovement : TQuery;
   begin
      Result := False;
      qTempMovement := TQuery.Create(nil);
      with qTempMovement do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT E.EventDate, M.DateMovedBack');
            SQL.Add('FROM Movements M');
            SQL.Add('LEFT JOIN Events E On (E.ID = M.EventID)');
            SQL.Add('WHERE (E.AnimalID = '+IntToStr(AAnimalID)+')');
            SQL.Add('AND   (E.EventType = '+IntToStr(CMovementEvent)+')');
            SQL.Add('AND   ( (M.DateMovedBack IS NOT NULL) AND ("'+FormatDateTime(cUSDateStyle,ADate)+'" >= E.EventDate) AND ("'+FormatDateTime(cUSDateStyle,ADate)+'" < M.DateMovedBack) )');
            SQL.Add('OR    ( (M.DateMovedBack IS NULL) AND ("'+FormatDateTime(cUSDateStyle,ADate)+'" >= E.EventDate) )');
            try
               Open;
               Result := ( RecordCount > 0 );
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   function AnimalInTempMoveAnimalArray : Boolean;
   var
      i : Integer;
   begin
      Result := False;
      if ( Length(FTempMovementAnimalIDArray) > 0 ) then
         begin
            for i := 0 to Length(FTempMovementAnimalIDArray)-1 do
               Result := ( FTempMovementAnimalIDArray[i] = NutrientProjection.FieldByName('AnimalID').AsInteger );
         end
   end;

begin
   Application.ProcessMessages;

   //lProgBar.Caption := 'Counting Units....';
   //lProgBar.Refresh;

   // get record count for progress bar
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT COUNT(AnimalID) CowCount FROM '+NutrientProjection.TableName);
   GenQuery.Open;

   // set progress bar parameters
   pb.Min := 0;
   pb.Max := GenQuery.FieldByName('CowCount').AsInteger;
   pb.Step := 1;
   pb.Position := 0;


   // convert calcdate - 17/04/00 - kr
   CalcDay   := Copy((FormatDateTime(cIrishDateStyle,(ADate))),0,2);
   CalcMonth := Copy((FormatDateTime(cIrishDateStyle,(ADate))),4,2);
   CalcYear  := Copy((FormatDateTime(cIrishDateStyle,(ADate))),7,4);

   // check for leap year (not year 2100 compliant!!!)
   //   Nothing := IntToStr((StrToInt(CalcYear) mod 4));
   if (((StrToInt(CalcYear) mod 4) = 0) and
       (CalcMonth = '02') and
       (CalcDay = '29')) then
       begin
          TwoYear := StrToDate('28/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 2));
          OneYear := StrToDate('28/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 1));
       end
   else
      begin
         TwoYear := StrToDate(CalcDay + '/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 2));
         OneYear := StrToDate(CalcDay + '/' + CalcMonth + '/' + IntToStr(StrToInt(CalcYear) - 1));
      end;

   // loop to count animals to include
   With NutrientProjection do
      begin
         First;
         While Not (NutrientProjection.EOF) do
            Begin
               If ((NutrientProjection.FieldByName('Include').AsBoolean = TRUE) AND    // Must be included in report
                   (NutrientProjection.FieldByName('DOB').AsDateTime <= ADate) AND   // Must be born <= Calc Date
                   (NutrientProjection.FieldByName('PurchDate').AsDateTime < ADate)) then      // PurchDate must be <= CalcDate (if PurchDate does not exist, then PurchDate = 0)
                  Begin
                     if ( NutrientProjection.FieldByName('SaleDeathDate').AsDateTime > 0 ) and (NutrientProjection.FieldByName('SaleDeathDate').AsDateTime <= ADate) then
                        Next
                     else if ( NutrientProjection.FieldByName('DateMovedOn').AsDateTime > 0 ) and ( NutrientProjection.FieldByName('DateMovedOn').AsDateTime > ADate ) then
                        Next
                     else if ( NutrientProjection.FieldByName('DateMovedOff').AsDateTime > 0 ) and ( NutrientProjection.FieldByName('DateMovedOff').AsDateTime <= ADate ) then
                        Next            //Animal Sold/Died on or before CalcDate
                     //   19/02/15 [V5.4 R2.6] /MK Change - Exclude animals that have had a temporary move off holding on/after ADate or move back on holding after ADate.
                     else if ( Length(FTempMovementAnimalIDArray) > 0 ) and ( AnimalInTempMoveAnimalArray ) and
                             ( ExcludeTempMovement(NutrientProjection.FieldByName('AnimalID').AsInteger,ADate) ) then
                        Next
                     else
                        Begin
                           // check whether animal is a Cow (regardless of age)
                           if ((( NutrientProjection.FieldByName('LactNum').asInteger > 0 ) and ( NutrientProjection.FieldByName('FirstCalvingDate').AsDateTime <= ADate )) ) or // Actual calvings
                              ((( NutrientProjection.FieldByName('LactNum').asInteger = 0 ) and ((NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime>0) and ( NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime <= ADate ) and (NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime > Date) ) ) )  then // Projected calvings
                              begin    //Animal Calved - now a Cow. Must determine whether a Dairy Or Suckler Cow
                                 //Need to include checks for Suckler Cows and Dairy Cows here
                                 if ( NutrientProjection.FieldByName('EligibleForPremium').AsBoolean = True ) then
                                    begin
                                       AProjectedTotals.SucklerCows := AProjectedTotals.SucklerCows+1;
                                       if DebugMode then
                                          begin
                                             AnimalList.Add('C2 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                    end
                                 else
                                    begin
                                       AProjectedTotals.DairyCows := AProjectedTotals.DairyCows +1;
                                       if DebugMode then
                                          begin
                                             AnimalList.Add('C1 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                          end
                                    end
                              end   //EndIf
                           else if ( NutrientProjection.FieldByName('DOB').AsDateTime <= (TwoYear)) then
                              begin
                                 AProjectedTotals.Cattle2Plus := AProjectedTotals.Cattle2Plus+1; // more than two years old
                                 if DebugMode then
                                    begin
                                       AnimalList.Add('C5 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                    end
                              end
                           else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (TwoYear)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (OneYear))) then
                              begin
                                 AProjectedTotals.Cattle12To24 := AProjectedTotals.Cattle12To24+1;  // 1 to 2 years old
                                 if DebugMode then
                                    begin
                                       AnimalList.Add('C4 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                    end
                              end
                           else if ((NutrientProjection.FieldByName('DOB').AsDateTime > (OneYear)) and (NutrientProjection.FieldByName('DOB').AsDateTime <= (ADate))) then
                              begin
                                AProjectedTotals.Cattle0To12 := AProjectedTotals.Cattle0To12+1; // 0 to 12 months old
                                if DebugMode then
                                   begin
                                      AnimalList.Add('C3 '+NutrientProjection.FieldByName('NatIDNum').AsString);
                                   end
                              end;
                           Next;
                        End;
                  End
               Else
                  Next;
               // step progress bar
               pb.StepIt;
            End;
      End;
   if DebugMode then
      begin
         AnimalList.Sort;
         AnimalList.SaveToFile('C:\NutProd'+ ComboHerd.Text + ' ' + StringReplaceNonAlphaChars(DateToStr(ADate), ' ') + '.dat');
         AnimalList.Clear;
      end;
   pb.Position := pb.Max;
   Application.ProcessMessages;
end;

procedure TfmNutrientProductionProjectionRptScr.ResetReportCaptions;
begin
   with fmNutrientProductionProjectionRpt do
      begin
         ResetCaptions(ProductionType, ReportPeriodAsString );
         lHerdID.Caption := ComboHerd.Text;
         qrlHectares.Caption := ceForageArea.Text;
      end;
end;

function TfmNutrientProductionProjectionRptScr.EndOfMonthDate(
  AIndex : Integer) : TDateTime;
begin
   Result := GetEndOfMthDate( GetComboControl(AIndex).ItemIndex+1 , GetComboControl(AIndex).Tag);
end;

function TfmNutrientProductionProjectionRptScr.GetWasteRateValue(
  AAnimalWasteCategory : TAnimalWasteCategory; AAnimalWasteType : TAnimalWasteType) : Double;
begin
   Result := 0;
   WinData.pDefs.Refresh;
   WinData.pDefs.First;
   if AAnimalWasteType = wtNitrogen then
      begin
         if AAnimalWasteCategory = wcDairyCows then
            Result := WinData.pDefs.FieldByName('NPDairyCow').AsFloat
         else if AAnimalWasteCategory = wcSucklerCows then
            Result := WinData.pDefs.FieldByName('NPSucklerCow').AsFloat
         else if AAnimalWasteCategory = wcCattle0To1Yr then
            Result := WinData.pDefs.FieldByName('NPCattle0to12Mths').AsFloat
         else if AAnimalWasteCategory = wcCattle1To2Yr then
            Result := WinData.pDefs.FieldByName('NPCattle1to2Yrs').AsFloat
         else if AAnimalWasteCategory = wcCattle2PlusYr then
            Result := WinData.pDefs.FieldByName('NPCattle2YrsPlus').AsFloat;
      end
   else
      begin
         if AAnimalWasteCategory = wcDairyCows then
            Result := WinData.pDefs.FieldByName('PPDairyCow').AsFloat
         else if AAnimalWasteCategory = wcSucklerCows then
            Result := WinData.pDefs.FieldByName('PPSucklerCow').AsFloat
         else if AAnimalWasteCategory = wcCattle0To1Yr then
            Result := WinData.pDefs.FieldByName('PPCattle0to12Mths').AsFloat
         else if AAnimalWasteCategory = wcCattle1To2Yr then
            Result := WinData.pDefs.FieldByName('PPCattle1to2Yrs').AsFloat
         else if AAnimalWasteCategory = wcCattle2PlusYr then
            Result := WinData.pDefs.FieldByName('PPCattle2YrsPlus').AsFloat;
      end;
end;

function TfmNutrientProductionProjectionRptScr.DateCount: Integer;
begin
   Result := 12;
{   if ( cmbDate12.ItemIndex > 0 ) then
      Result := 12
   else if ( cmbDate11.ItemIndex > 0 ) then
      Result := 11
   else if ( cmbDate10.ItemIndex > 0 ) then
      Result := 10
   else if ( cmbDate9.ItemIndex > 0 ) then
      Result := 9
   else if ( cmbDate8.ItemIndex > 0 ) then
      Result := 8
   else if ( cmbDate7.ItemIndex > 0 ) then
      Result := 7
   else if ( cmbDate6.ItemIndex > 0 ) then
      Result := 6
   else if ( cmbDate5.ItemIndex > 0 ) then
      Result := 5
   else if ( cmbDate4.ItemIndex > 0 ) then
      Result := 4
   else if ( cmbDate3.ItemIndex > 0 ) then
      Result := 3
   else if ( cmbDate2.ItemIndex > 0 ) then
      Result := 2
   else if ( cmbDate1.ItemIndex > 0 ) then
      Result := 1
   else
      Result := 0;  }
end;

function TfmNutrientProductionProjectionRptScr.GetComboControl(
  ComboIndex: Integer): TcxComboBox;
begin
   if not (ComboIndex in [1..12]) then
      raise Exception.Create('Invalid range input.');
   if ( ComboIndex = 1) then
      Result := cmbDate1
   else if ( ComboIndex = 2 ) then
      Result := cmbDate2
   else if ( ComboIndex = 3 ) then
      Result := cmbDate3
   else if ( ComboIndex = 4 ) then
      Result := cmbDate4
   else if ( ComboIndex = 5 ) then
      Result := cmbDate5
   else if ( ComboIndex = 6 ) then
      Result := cmbDate6
   else if ( ComboIndex = 7 ) then
      Result := cmbDate7
   else if ( ComboIndex = 8 ) then
      Result := cmbDate8
   else if ( ComboIndex = 9 ) then
      Result := cmbDate9
   else if ( ComboIndex = 10 ) then
      Result := cmbDate10
   else if ( ComboIndex = 11 ) then
      Result := cmbDate11
   else if ( ComboIndex = 12 ) then
      Result := cmbDate12
end;

procedure TfmNutrientProductionProjectionRptScr.GetAnimals;
var
   i,
   Num : Integer;
   tDate : TDateTime;
begin

   if NutrientProjection = nil then
      begin
         NutrientProjection := TTable.Create(nil);
         with NutrientProjection do
            begin
               DatabaseName := WinData.KingData.DatabaseName;
               TableName := 'NutrientProjection';
               FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
               FieldDefs.Add('DOB',ftDate,0,FALSE);
               FieldDefs.Add('Sex',ftString,10,FALSE);
               FieldDefs.Add('LactNum',ftSmallint,0,FALSE);
               FieldDefs.Add('PrimaryBreed',ftInteger,0,FALSE);
               FieldDefs.Add('EligibleForPremium',ftBoolean,0,FALSE);
               FieldDefs.Add('PurchDate',ftDate,0,FALSE);
               FieldDefs.Add('SaleDeathDate',ftDate,0,FALSE);
               FieldDefs.Add('FirstCalvingDate',ftDate,0,FALSE);
               FieldDefs.Add('Include',ftBoolean,0,FALSE);
               FieldDefs.Add('DateMovedOn',ftDate,0,FALSE);
               FieldDefs.Add('DateMovedOff',ftDate,0,FALSE);
               FieldDefs.Add('NatIDNum',ftString,20,FALSE);
               FieldDefs.Add('HeiferCalvingDate',ftDateTime);
               CreateTable;
               //Open;
            end;
      end
   else
      NutrientProjection.Close;

   // clear table
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM '+NutrientProjection.TableName);
         ExecSQL;
      end;

   // create a table of all possible animals
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO ' + NutrientProjection.TableName + ' (AnimalID, LactNum, Sex, DOB, PrimaryBreed, NatIDNum)');
         SQL.Add('SELECT DISTINCT D.ID, D.LactNo, D.Sex, D.DateOfBirth, D.PrimaryBreed, D.NatIDNum');
         SQL.Add('FROM "Animals.db" D');
         SQL.Add('WHERE ( D.AnimalDeleted = False )');
         SQL.Add('AND   ( D.HerdID = "'+ComboHerd.Value+'" ) ');
         if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
             SQL.Add('AND ( D.ID IN (SELECT AF.AID FROM AFILTERS AF) )');
         ExecSQL;
      end;

   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('UPDATE ' + NutrientProjection.TableName + ' SET Include=True');
   GenQuery.ExecSQL;
   // get record count for progress bar
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT COUNT(AnimalID) CowCount FROM ' + NutrientProjection.TableName );
   GenQuery.Open;

   // set progress bar parameters
   pb.Min := 0;
   pb.Max := (GenQuery.FieldByName('CowCount').AsInteger * 2);
   pb.Step := 1;

   //add Date of Purchase and Date of Sale/Death and compare these dates
   //with the earliest (MinDate) and latest dates (MaxDate).
   //Set Include = False for all animals outside date ranges

   { Ensure CheckEvents is not filtered }
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   WinData.tIntHerd.Open;
   try
      NutrientProjection.Open;
      With NutrientProjection do
         begin
            First;
            while Not (NutrientProjection.EOF) do
               begin
                  Edit;
                  //First get the Purchase event (if any) and exclude those animals
                  //if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([NutrientProjection.FieldByName('AnimalID').AsVariant,CPurchaseEvent]),[] ) then
                  //   NutrientProjection.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

                  tDate := WinData.EventDataHelper.GetLastEventDate(NutrientProjection.FieldByName('AnimalID').AsVariant,CPurchaseEvent);
                  if tDate > 0 then
                     NutrientProjection.FieldByName('PurchDate').AsDateTime := tDate;
                  tDate := WinData.EventDataHelper.GetLastEventDate(NutrientProjection.FieldByName('AnimalID').AsVariant,CSaleDeathEvent);
                  if tDate > 0 then
                     NutrientProjection.FieldByName('SaleDeathDate').AsDateTime := tDate;


                  //Second - if still included, get the Sale/Death event (if any)
//                  if (WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([NutrientProjection.FieldByName('AnimalID').AsVariant,CSaleDeathEvent]),[] )) then
//                     NutrientProjection.FieldByName('SaleDeathDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

                  //Now need to get first calving date (if it exists)
{                  If ((NutrientProjection.FieldByName('Include').AsBoolean = TRUE) AND (NutrientProjection.FieldByName('LactNum').AsInteger > 0)) then
                     begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                        If ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([NutrientProjection.FieldByName('AnimalID').AsVariant,CCalvingEvent]),[] )) then
                           NutrientProjection.FieldByName('FirstCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     end;
}

                  If (NutrientProjection.FieldByName('LactNum').AsInteger > 0) then
                     begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                        tDate := WinData.EventDataHelper.GetFirstEventDate(NutrientProjection.FieldByName('AnimalID').AsVariant,CCalvingEvent);
                        if tDate > 0 then
                           NutrientProjection.FieldByName('FirstCalvingDate').AsDateTime := tDate;
                     end;

                  if WinData.tIntHerd.Locate('AnimalID',NutrientProjection.FieldByName('AnimalID').AsVariant,[] )  then
                     begin
                        if WinData.tIntHerd.FieldByName('LastHerdID').AsInteger = StrToInt(ComboHerd.Value) then
                           NutrientProjection.FieldByName('DateMovedOff').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime
                        else if WinData.tIntHerd.FieldByName('NewHerdID').AsInteger = StrToInt(ComboHerd.Value) then
                           NutrientProjection.FieldByName('DateMovedOn').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                     end;

                  // Now to check the breeds table and determine whether eligible for Premium
                  if NutrientProjection.FieldByName('PrimaryBreed').AsInteger > 0 then
                     if WinData.Breeds.Locate('ID', NutrientProjection.FieldByName('PrimaryBreed').AsInteger,[] ) then
                        NutrientProjection.FieldByName('EligibleForPremium').AsBoolean := WinData.Breeds.FieldByName('EligibleForPremium').AsBoolean;

                  Post;
                  Next;
                  pb.Stepit;
               End;
         end;
   finally
      WinData.tIntHerd.Close;
   end;

   // get female and create new records for any expected calves.
   with NutrientProjection do
      try
         CalfList := TStringList.Create;
         WinData.CheckEvents.Filter := '';
         WinData.CheckEvents.Filtered := False;
         WinData.CheckEvents.Close;
         WinData.CheckEvents.Open;

         First;
         while NOT (NutrientProjection.EOF) do
            begin
               Application.ProcessMessages;
               if ( NutrientProjection.FieldByName('Sex').AsString = 'Female') and (NutrientProjection.FieldByName('SaleDeathDate').AsDateTime<=0) then
                  begin
                     CalvingInfo := WinData.GetProjCalvingInfo(NutrientProjection.FieldByName('AnimalID').AsInteger, NutrientProjection.FieldByName('LactNum').AsInteger);

                     case CalvingInfo.PregStatus of
                        { Use Projected calvings where Service/PD or both havew taken place }
                        psPregnant, psUndefined :
                        begin
                           if (( CalvingInfo.ProjCalvingDate > 0 ) and ( CalvingInfo.NoCalves > 0 )) then
                              begin
                                 // Only use predicted calves if the predicted date is > Today & ExtDate
                                 if ( CalvingInfo.ProjCalvingDate > Now ) then
//                                     ( StartDate > Now ) and (CalvingInfo.ProjCalvingDate <= StartDate)) then
                                    begin   //Add a maximum of four animals only, any more and can not input
                                       if ( CalvingInfo.NoCalves > 4 ) then
                                          Num := 4
                                       else
                                          Num := CalvingInfo.NoCalves;
                                       for i := 1 to Num do
                                          CalfList.AddObject('', TCalfRecord.Create(NutrientProjection.FieldByName('AnimalID').AsInteger,
                                                                 CalvingInfo.ProjCalvingDate));
                                       // After projecting calves, update Dam Status.
                                       if ( NutrientProjection.FieldByName('LactNum').AsInteger = 0 ) then
                                          begin
                                             NutrientProjection.Edit;
                                             NutrientProjection.FieldByName('HeiferCalvingDate').AsDateTime := CalvingInfo.ProjCalvingDate;
                                             NutrientProjection.Post;
                                          end;
                                    end;
                              end;
                        end;
                     end;
                  end;
               Next;
               pb.Stepit;
            end;

      finally
         for i := 0 to CalfList.Count-1 do
            begin
               if CalfList.Objects[i] <> nil then
                  begin
                     NutrientProjection.Insert;   // Inserts a new blank record for a calf
                     NutrientProjection.FieldByName('NatIDNum').AsString := 'New Calf ('+ IntToStr(TCalfRecord(CalfList.Objects[i]).DamID)+')';
                     NutrientProjection.FieldByName('AnimalID').AsInteger := 0;
                     NutrientProjection.FieldByName('DOB').AsDateTime := TCalfRecord(CalfList.Objects[i]).DOB;
                     if i < 999999 then
                        NutrientProjection.FieldByName('Sex').AsString := 'Calf' + IntToStr(i+1)
                     else
                        NutrientProjection.FieldByName('Sex').AsString := 'Calf';
                     NutrientProjection.FieldByName('Include').AsBoolean := True;
                     NutrientProjection.Post;    //Posts new calf record
                     // Debug CalfList.Strings[i] := 'Dam: '+ TCalfRecord(CalfList.Objects[i]).DamNo +', Proj: '+ DateToStr(TCalfRecord(CalfList.Objects[i]).DOB);
                     TCalfRecord(CalfList.Objects[i]).Free;
                  end;
            end;
         // Debug CalfList.SaveToFile('C:\Date ' +FormatDateTime('dd-mm-yyyy', ExtDate) +' ProjCalvings.txt');
         FreeAndNil(CalfList);
      end;
   Application.ProcessMessages;
end;

procedure TfmNutrientProductionProjectionRptScr.FormCreate(
  Sender: TObject);
begin
   cbFilter.Visible := WinData.ActiveFilter;
   cbFilter.Checked := WinData.ActiveFilter;
   if cbFilter.Visible then
      cbFilter.Style.Font.Color := clBlue
   else
      cbFilter.Style.Font.Color := clBlack;

   WinData.CanShowStandardReportHint := True;
   DebugMode := False;
   WasteValuesLoaded := False;
   ConfigFile := TStringList.Create;
   fNPDefs := IncludeTrailingBackSlash(DataPath) + 'NPDefs';
   EnableForecastControls (False);
   FPreviewReport := False;
end;

function TfmNutrientProductionProjectionRptScr.CalcProjectedWaste(DCow,
  SCow, Cattle012Mth, Cattle12Yr, Cattle2YrPlus: Double): Double;
begin
   Result := (( DCow * PDairyCow ) + ( SCow * PSucklerCow ) + ( Cattle012Mth * PCattle0To1Yr) +
              ( Cattle12Yr * PCattle1To2Yr) + ( Cattle2YrPlus * PCattle2PlusYr ));
end;

procedure TfmNutrientProductionProjectionRptScr.LoadWasteValues;
var
   nItemIndex : Integer;
begin
   try

   if FileExists(fNPDefs) then
      begin
         ConfigFile.LoadFromFile(fNPDefs);
         if ConfigFile.Values['StartYear'] <> '' then
            begin
               nItemIndex := cmboYear.Properties.Items.IndexOf( ConfigFile.Values['StartYear'] );
               if ( nItemIndex > -1 ) then
                  cmboYear.ItemIndex := nItemIndex
               else
                  begin
                     WasteValuesLoaded := True;
                     Exit; // do not load figures
                  end;
            end;

         if ConfigFile.Values['StartMonth'] <> '' then
            begin
               nItemIndex := cmboMonth.Properties.Items.IndexOf( ConfigFile.Values['StartMonth'] );
               if ( nItemIndex > -1 ) then
                  cmboMonth.ItemIndex := nItemIndex
               else
                  begin
                     WasteValuesLoaded := True;
                     Exit; // do not load figures
                  end;
            end;

{         if ConfigFile.Values['Date1'] <> '' then
            cmbDate1.ItemIndex := StrToInt(ConfigFile.Values['Date1']);
         if ConfigFile.Values['Date2'] <> '' then
            cmbDate2.ItemIndex := StrToInt(ConfigFile.Values['Date2']);
         if ConfigFile.Values['Date3'] <> '' then
            cmbDate3.ItemIndex := StrToInt(ConfigFile.Values['Date3']);
         if ConfigFile.Values['Date4'] <> '' then
            cmbDate4.ItemIndex := StrToInt(ConfigFile.Values['Date4']);
         if ConfigFile.Values['Date5'] <> '' then
            cmbDate5.ItemIndex := StrToInt(ConfigFile.Values['Date5']);
         if ConfigFile.Values['Date6'] <> '' then
            cmbDate6.ItemIndex := StrToInt(ConfigFile.Values['Date6']);
         if ConfigFile.Values['Date7'] <> '' then
            cmbDate7.ItemIndex := StrToInt(ConfigFile.Values['Date7']);
         if ConfigFile.Values['Date8'] <> '' then
            cmbDate8.ItemIndex := StrToInt(ConfigFile.Values['Date8']);
         if ConfigFile.Values['Date9'] <> '' then
            cmbDate9.ItemIndex := StrToInt(ConfigFile.Values['Date9']);
         if ConfigFile.Values['Date10'] <> '' then
            cmbDate10.ItemIndex := StrToInt(ConfigFile.Values['Date10']);
         if ConfigFile.Values['Date11'] <> '' then
            cmbDate11.ItemIndex := StrToInt(ConfigFile.Values['Date11']);
         if ConfigFile.Values['Date12'] <> '' then
            cmbDate12.ItemIndex := StrToInt(ConfigFile.Values['Date12']);

         if ConfigFile.Values['JanDCows'] <> '' then
            ceJanDCows.Value := StrToFloat(ConfigFile.Values['JanDCows']);
         if ConfigFile.Values['FebDCows'] <> '' then
            ceFebDCows.Value := StrToFloat(ConfigFile.Values['FebDCows']);
         if ConfigFile.Values['MarDCows'] <> '' then
            ceMarDCows.Value := StrToFloat(ConfigFile.Values['MarDCows']);
         if ConfigFile.Values['AprDCows'] <> '' then
            ceAprDCows.Value := StrToFloat(ConfigFile.Values['AprDCows']);
         if ConfigFile.Values['MayDCows'] <> '' then
            ceMayDCows.Value := StrToFloat(ConfigFile.Values['MayDCows']);
         if ConfigFile.Values['JuneDCows'] <> '' then
            ceJuneDCows.Value := StrToFloat(ConfigFile.Values['JuneDCows']);
         if ConfigFile.Values['JulyDCows'] <> '' then
            ceJulyDCows.Value := StrToFloat(ConfigFile.Values['JulyDCows']) ;
         if ConfigFile.Values['AugDCows'] <> '' then
            ceAugDCows.Value := StrToFloat(ConfigFile.Values['AugDCows']);
         if ConfigFile.Values['SeptDCows'] <> '' then
            ceSeptDCows.Value := StrToFloat(ConfigFile.Values['SeptDCows']);
         if ConfigFile.Values['OctDCows'] <> '' then
            ceOctDCows.Value := StrToFloat(ConfigFile.Values['OctDCows']);
         if ConfigFile.Values['NovDCows'] <> '' then
            ceNovDCows.Value := StrToFloat(ConfigFile.Values['NovDCows']);
         if ConfigFile.Values['DecDCows'] <> '' then
            ceDecDCows.Value := StrToFloat(ConfigFile.Values['DecDCows']);

         if ConfigFile.Values['JanSCows'] <> '' then
            ceJanSCows.Value := StrToFloat(ConfigFile.Values['JanSCows']);
         if ConfigFile.Values['FebSCows'] <> '' then
            ceFebSCows.Value := StrToFloat(ConfigFile.Values['FebSCows']);
         if ConfigFile.Values['MarSCows'] <> '' then
            ceMarSCows.Value := StrToFloat(ConfigFile.Values['MarSCows']);
         if ConfigFile.Values['AprSCows'] <> '' then
            ceAprSCows.Value := StrToFloat(ConfigFile.Values['AprSCows']);
         if ConfigFile.Values['MaySCows'] <> '' then
            ceMaySCows.Value := StrToFloat(ConfigFile.Values['MaySCows']);
         if ConfigFile.Values['JuneSCows'] <> '' then
            ceJuneSCows.Value := StrToFloat(ConfigFile.Values['JuneSCows']);
         if ConfigFile.Values['JulySCows'] <> '' then
            ceJulySCows.Value := StrToFloat(ConfigFile.Values['JulySCows']);
         if ConfigFile.Values['AugSCows'] <> '' then
            ceAugSCows.Value := StrToFloat(ConfigFile.Values['AugSCows']);
         if ConfigFile.Values['SeptSCows'] <> '' then
            ceSeptSCows.Value := StrToFloat(ConfigFile.Values['SeptSCows']);
         if ConfigFile.Values['OctSCows'] <> '' then
            ceOctSCows.Value := StrToFloat(ConfigFile.Values['OctSCows']);
         if ConfigFile.Values['NovSCows'] <> '' then
            ceNovSCows.Value := StrToFloat(ConfigFile.Values['NovSCows']);
         if ConfigFile.Values['DecSCows'] <> '' then
            ceDecSCows.Value := StrToFloat(ConfigFile.Values['DecSCows']);

         if ConfigFile.Values['JanCattle012Mths'] <> '' then
            ceJanCattle012Mths.Value := StrToFloat(ConfigFile.Values['JanCattle012Mths']);
         if ConfigFile.Values['FebCattle012Mths'] <> '' then
            ceFebCattle012Mths.Value := StrToFloat(ConfigFile.Values['FebCattle012Mths']);
         if ConfigFile.Values['MarCattle012Mths'] <> '' then
            ceMarCattle012Mths.Value := StrToFloat(ConfigFile.Values['MarCattle012Mths']);
         if ConfigFile.Values['AprCattle012Mths'] <> '' then
            ceAprCattle012Mths.Value := StrToFloat(ConfigFile.Values['AprCattle012Mths']);
         if ConfigFile.Values['MayCattle012Mths'] <> '' then
            ceMayCattle012Mths.Value := StrToFloat(ConfigFile.Values['MayCattle012Mths']);
         if ConfigFile.Values['JuneCattle012Mths'] <> '' then
            ceJuneCattle012Mths.Value := StrToFloat(ConfigFile.Values['JuneCattle012Mths']);
         if ConfigFile.Values['JulyCattle012Mths'] <> '' then
            ceJulyCattle012Mths.Value := StrToFloat(ConfigFile.Values['JulyCattle012Mths']);
         if ConfigFile.Values['AugCattle012Mths'] <> '' then
            ceAugCattle012Mths.Value := StrToFloat(ConfigFile.Values['AugCattle012Mths']);
         if ConfigFile.Values['SeptCattle012Mths'] <> '' then
            ceSeptCattle012Mths.Value := StrToFloat(ConfigFile.Values['SeptCattle012Mths']);
         if ConfigFile.Values['OctCattle012Mths'] <> '' then
            ceOctCattle012Mths.Value := StrToFloat(ConfigFile.Values['OctCattle012Mths']);
         if ConfigFile.Values['NovCattle012Mths'] <> '' then
            ceNovCattle012Mths.Value := StrToFloat(ConfigFile.Values['NovCattle012Mths']);
         if ConfigFile.Values['DecCattle012Mths'] <> '' then
            ceDecCattle012Mths.Value := StrToFloat(ConfigFile.Values['DecCattle012Mths']);


         if ConfigFile.Values['JanCattle12Yrs'] <> '' then
            ceJanCattle12Yr.Value := StrToFloat(ConfigFile.Values['JanCattle12Yrs']);
         if ConfigFile.Values['FebCattle12Yrs'] <> '' then
            ceFebCattle12Yr.Value := StrToFloat(ConfigFile.Values['FebCattle12Yrs']);
         if ConfigFile.Values['MarCattle12Yrs'] <> '' then
            ceMarCattle12Yr.Value := StrToFloat(ConfigFile.Values['MarCattle12Yrs']);
         if ConfigFile.Values['AprCattle12Yrs'] <> '' then
            ceAprCattle12Yr.Value := StrToFloat(ConfigFile.Values['AprCattle12Yrs']);
         if ConfigFile.Values['MayCattle12Yrs'] <> '' then
            ceMayCattle12Yr.Value := StrToFloat(ConfigFile.Values['MayCattle12Yrs']);
         if ConfigFile.Values['JuneCattle12Yrs'] <> '' then
            ceJuneCattle12Yr.Value := StrToFloat(ConfigFile.Values['JuneCattle12Yrs']);
         if ConfigFile.Values['JulyCattle12Yrs'] <> '' then
            ceJulyCattle12Yr.Value := StrToFloat(ConfigFile.Values['JulyCattle12Yrs']);
         if ConfigFile.Values['AugCattle12Yrs'] <> '' then
            ceAugCattle12Yr.Value := StrToFloat(ConfigFile.Values['AugCattle12Yrs']);
         if ConfigFile.Values['SeptCattle12Yrs'] <> '' then
            ceSeptCattle12Yr.Value := StrToFloat(ConfigFile.Values['SeptCattle12Yrs']);
         if ConfigFile.Values['OctCattle12Yrs'] <> '' then
            ceOctCattle12Yr.Value := StrToFloat(ConfigFile.Values['OctCattle12Yrs']);
         if ConfigFile.Values['NovCattle12Yrs'] <> '' then
            ceNovCattle12Yr.Value := StrToFloat(ConfigFile.Values['NovCattle12Yrs']);
         if ConfigFile.Values['DecCattle12Yrs'] <> '' then
            ceDecCattle12Yr.Value := StrToFloat(ConfigFile.Values['DecCattle12Yrs']);


         if ConfigFile.Values['JanCattle2YrsPlus'] <> '' then
            ceJanCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['JanCattle2YrsPlus']);
         if ConfigFile.Values['FebCattle2YrsPlus'] <> '' then
            ceFebCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['FebCattle2YrsPlus']);
         if ConfigFile.Values['MarCattle2YrsPlus'] <> '' then
            ceMarCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['MarCattle2YrsPlus']);
         if ConfigFile.Values['AprCattle2YrsPlus'] <> '' then
            ceAprCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['AprCattle2YrsPlus']);
         if ConfigFile.Values['MayCattle2YrsPlus'] <> '' then
            ceMayCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['MayCattle2YrsPlus']);
         if ConfigFile.Values['JuneCattle2YrsPlus'] <> '' then
            ceJuneCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['JuneCattle2YrsPlus']);
         if ConfigFile.Values['JulyCattle2YrsPlus'] <> '' then
            ceJulyCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['JulyCattle2YrsPlus']);
         if ConfigFile.Values['AugCattle2YrsPlus'] <> '' then
            ceAugCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['AugCattle2YrsPlus']);
         if ConfigFile.Values['SeptCattle2YrsPlus'] <> '' then
            ceSeptCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['SeptCattle2YrsPlus']);
         if ConfigFile.Values['OctCattle2YrsPlus'] <> '' then
            ceOctCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['OctCattle2YrsPlus']);
         if ConfigFile.Values['NovCattle2YrsPlus'] <> '' then
            ceNovCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['NovCattle2YrsPlus']);
         if ConfigFile.Values['DecCattle2YrsPlus'] <> '' then
            ceDecCattle2YrPlus.Value := StrToFloat(ConfigFile.Values['DecCattle2YrsPlus']);
}
{         if ConfigFile.Values['ReportType'] = 'P' then
            begin
               cbNitrogen.Checked := False;
               cbPhosphorus.Checked := True;
            end
         else
            begin
               cbNitrogen.Checked := True;
               cbPhosphorus.Checked := False;
            end;
}
{         if cbNitrogen.Checked then
            begin
               if ConfigFile.Values['NForecast1'] <> '' then
                  ceJanTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast1']);
               if ConfigFile.Values['NForecast2'] <> '' then
                  ceFebTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast2']);
               if ConfigFile.Values['NForecast3'] <> '' then
                  ceMarTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast3']);
               if ConfigFile.Values['NForecast4'] <> '' then
                  ceAprTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast4']);
               if ConfigFile.Values['NForecast5'] <> '' then
                  ceMayTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast5']);
               if ConfigFile.Values['NForecast6'] <> '' then
                  ceJuneTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast6']);
               if ConfigFile.Values['NForecast7'] <> '' then
                  ceJulyTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast7']);
               if ConfigFile.Values['NForecast8'] <> '' then
                  ceAugTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast8']);
               if ConfigFile.Values['NForecast9'] <> '' then
                  ceSeptTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast9']);
               if ConfigFile.Values['NForecast10'] <> '' then
                  ceOctTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast10']);
               if ConfigFile.Values['NForecast11'] <> '' then
                  ceNovTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast11']);
               if ConfigFile.Values['NForecast12'] <> '' then
                  ceDecTotalForecast.Value := StrToFloat(ConfigFile.Values['NForecast12']);
            end
         else
            begin
               if ConfigFile.Values['PForecast1'] <> '' then
                  ceJanTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast1']);
               if ConfigFile.Values['PForecast2'] <> '' then
                  ceFebTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast2']);
               if ConfigFile.Values['PForecast3'] <> '' then
                  ceMarTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast3']);
               if ConfigFile.Values['PForecast4'] <> '' then
                  ceAprTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast4']);
               if ConfigFile.Values['PForecast5'] <> '' then
                  ceMayTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast5']);
               if ConfigFile.Values['PForecast6'] <> '' then
                  ceJuneTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast6']);
               if ConfigFile.Values['PForecast7'] <> '' then
                  ceJulyTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast7']);
               if ConfigFile.Values['PForecast8'] <> '' then
                  ceAugTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast8']);
               if ConfigFile.Values['PForecast9'] <> '' then
                  ceSeptTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast9']);
               if ConfigFile.Values['PForecast10'] <> '' then
                  ceOctTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast10']);
               if ConfigFile.Values['PForecast11'] <> '' then
                  ceNovTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast11']);
               if ConfigFile.Values['PForecast12'] <> '' then
                  ceDecTotalForecast.Value := StrToFloat(ConfigFile.Values['PForecast12']);
            end;
}
         if ConfigFile.Values['NonBovineProduction'] <> '' then
            seAvgNonBovineProduction.Value := StrToFloat(ConfigFile.Values['NonBovineProduction']);
         if ConfigFile.Values['ForageArea'] <> '' then
            begin
               ceForageArea.Value := StrToFloat(ConfigFile.Values['ForageArea']);
               if WinData.OwnerFile.Locate('ID', WinData.UserDefaultHerdID, [loCaseInsensitive]) then
                  begin
                     if WinData.OwnerFile.FieldByName('ForageAreaHa').AsFloat > 0 then
                        ceForageArea.Value := WinData.OwnerFile.FieldByName('ForageAreaHa').AsFloat;
                  end;
            end;
         WasteValuesLoaded := True;
      end;
   finally
      ceJanDCowsExit(nil);
   end;
end;

procedure TfmNutrientProductionProjectionRptScr.SaveWasteValues(AAnimalWasteType : TAnimalWasteType);
begin
   ConfigFile.Values['Date1'] := IntToStr(cmbDate1.ItemIndex);
   ConfigFile.Values['Date2'] := IntToStr(cmbDate2.ItemIndex);
   ConfigFile.Values['Date3'] := IntToStr(cmbDate3.ItemIndex);
   ConfigFile.Values['Date4'] := IntToStr(cmbDate4.ItemIndex);
   ConfigFile.Values['Date5'] := IntToStr(cmbDate5.ItemIndex);
   ConfigFile.Values['Date6'] := IntToStr(cmbDate6.ItemIndex);
   ConfigFile.Values['Date7'] := IntToStr(cmbDate7.ItemIndex);
   ConfigFile.Values['Date8'] := IntToStr(cmbDate8.ItemIndex);
   ConfigFile.Values['Date9'] := IntToStr(cmbDate9.ItemIndex);
   ConfigFile.Values['Date10'] := IntToStr(cmbDate10.ItemIndex);
   ConfigFile.Values['Date11'] := IntToStr(cmbDate11.ItemIndex);
   ConfigFile.Values['Date12'] := IntToStr(cmbDate12.ItemIndex);

   ConfigFile.Values['JanDCows'] := FloatToStr(ceJanDCows.Value);
   ConfigFile.Values['FebDCows'] := FloatToStr(ceFebDCows.Value);
   ConfigFile.Values['MarDCows'] := FloatToStr(ceMarDCows.Value);
   ConfigFile.Values['AprDCows'] := FloatToStr(ceAprDCows.Value);
   ConfigFile.Values['MayDCows'] := FloatToStr(ceMayDCows.Value);
   ConfigFile.Values['JuneDCows'] := FloatToStr(ceJuneDCows.Value);
   ConfigFile.Values['JulyDCows'] := FloatToStr(ceJulyDCows.Value);
   ConfigFile.Values['AugDCows'] := FloatToStr(ceAugDCows.Value);
   ConfigFile.Values['SeptDCows'] := FloatToStr(ceSeptDCows.Value);
   ConfigFile.Values['OctDCows'] := FloatToStr(ceOctDCows.Value);
   ConfigFile.Values['NovDCows'] := FloatToStr(ceNovDCows.Value);
   ConfigFile.Values['DecDCows'] := FloatToStr(ceDecDCows.Value);

   ConfigFile.Values['JanSCows'] := FloatToStr(ceJanSCows.Value);
   ConfigFile.Values['FebSCows'] := FloatToStr(ceFebSCows.Value);
   ConfigFile.Values['MarSCows'] := FloatToStr(ceMarSCows.Value);
   ConfigFile.Values['AprSCows'] := FloatToStr(ceAprSCows.Value);
   ConfigFile.Values['MaySCows'] := FloatToStr(ceMaySCows.Value);
   ConfigFile.Values['JuneSCows'] := FloatToStr(ceJuneSCows.Value);
   ConfigFile.Values['JulySCows'] := FloatToStr(ceJulySCows.Value);
   ConfigFile.Values['AugSCows'] := FloatToStr(ceAugSCows.Value);
   ConfigFile.Values['SeptSCows'] := FloatToStr(ceSeptSCows.Value);
   ConfigFile.Values['OctSCows'] := FloatToStr(ceOctSCows.Value);
   ConfigFile.Values['NovSCows'] := FloatToStr(ceNovSCows.Value);
   ConfigFile.Values['DecSCows'] := FloatToStr(ceDecSCows.Value);

   ConfigFile.Values['JanCattle012Mths'] := FloatToStr(ceJanCattle012Mths.Value);
   ConfigFile.Values['FebCattle012Mths'] := FloatToStr(ceFebCattle012Mths.Value);
   ConfigFile.Values['MarCattle012Mths'] := FloatToStr(ceMarCattle012Mths.Value);
   ConfigFile.Values['AprCattle012Mths'] := FloatToStr(ceAprCattle012Mths.Value);
   ConfigFile.Values['MayCattle012Mths'] := FloatToStr(ceMayCattle012Mths.Value);
   ConfigFile.Values['JuneCattle012Mths'] := FloatToStr(ceJuneCattle012Mths.Value);
   ConfigFile.Values['JulyCattle012Mths'] := FloatToStr(ceJulyCattle012Mths.Value);
   ConfigFile.Values['AugCattle012Mths'] := FloatToStr(ceAugCattle012Mths.Value);
   ConfigFile.Values['SeptCattle012Mths'] := FloatToStr(ceSeptCattle012Mths.Value);
   ConfigFile.Values['OctCattle012Mths'] := FloatToStr(ceOctCattle012Mths.Value);
   ConfigFile.Values['NovCattle012Mths'] := FloatToStr(ceNovCattle012Mths.Value);
   ConfigFile.Values['DecCattle012Mths'] := FloatToStr(ceDecCattle012Mths.Value);

   ConfigFile.Values['JanCattle12Yrs'] := FloatToStr(ceJanCattle12Yr.Value);
   ConfigFile.Values['FebCattle12Yrs'] := FloatToStr(ceFebCattle12Yr.Value);
   ConfigFile.Values['MarCattle12Yrs'] := FloatToStr(ceMarCattle12Yr.Value);
   ConfigFile.Values['AprCattle12Yrs'] := FloatToStr(ceAprCattle12Yr.Value);
   ConfigFile.Values['MayCattle12Yrs'] := FloatToStr(ceMayCattle12Yr.Value);
   ConfigFile.Values['JuneCattle12Yrs'] := FloatToStr(ceJuneCattle12Yr.Value);
   ConfigFile.Values['JulyCattle12Yrs'] := FloatToStr(ceJulyCattle12Yr.Value);
   ConfigFile.Values['AugCattle12Yrs'] := FloatToStr(ceAugCattle12Yr.Value);
   ConfigFile.Values['SeptCattle12Yrs'] := FloatToStr(ceSeptCattle12Yr.Value);
   ConfigFile.Values['OctCattle12Yrs'] := FloatToStr(ceOctCattle12Yr.Value);
   ConfigFile.Values['NovCattle12Yrs'] := FloatToStr(ceNovCattle12Yr.Value);
   ConfigFile.Values['DecCattle12Yrs'] := FloatToStr(ceDecCattle12Yr.Value);

   ConfigFile.Values['JanCattle2YrsPlus'] := FloatToStr(ceJanCattle2YrPlus.Value);
   ConfigFile.Values['FebCattle2YrsPlus'] := FloatToStr(ceFebCattle2YrPlus.Value);
   ConfigFile.Values['MarCattle2YrsPlus'] := FloatToStr(ceMarCattle2YrPlus.Value);
   ConfigFile.Values['AprCattle2YrsPlus'] := FloatToStr(ceAprCattle2YrPlus.Value);
   ConfigFile.Values['MayCattle2YrsPlus'] := FloatToStr(ceMayCattle2YrPlus.Value);
   ConfigFile.Values['JuneCattle2YrsPlus'] := FloatToStr(ceJuneCattle2YrPlus.Value);
   ConfigFile.Values['JulyCattle2YrsPlus'] := FloatToStr(ceJulyCattle2YrPlus.Value);
   ConfigFile.Values['AugCattle2YrsPlus'] := FloatToStr(ceAugCattle2YrPlus.Value);
   ConfigFile.Values['SeptCattle2YrsPlus'] := FloatToStr(ceSeptCattle2YrPlus.Value);
   ConfigFile.Values['OctCattle2YrsPlus'] := FloatToStr(ceOctCattle2YrPlus.Value);
   ConfigFile.Values['NovCattle2YrsPlus'] := FloatToStr(ceNovCattle2YrPlus.Value);
   ConfigFile.Values['DecCattle2YrsPlus'] := FloatToStr(ceDecCattle2YrPlus.Value);

   if AAnimalWasteType = wtNitrogen then
      ConfigFile.Values['ReportType'] := 'N'
   else
      ConfigFile.Values['ReportType'] := 'P';

   if AAnimalWasteType = wtNitrogen then
      begin
         ConfigFile.Values['NForecast1'] := FloatToStr(ceJanTotalForecast.Value);
         ConfigFile.Values['NForecast2'] := FloatToStr(ceFebTotalForecast.Value);
         ConfigFile.Values['NForecast3'] := FloatToStr(ceMarTotalForecast.Value);
         ConfigFile.Values['NForecast4'] := FloatToStr(ceAprTotalForecast.Value);
         ConfigFile.Values['NForecast5'] := FloatToStr(ceMayTotalForecast.Value);
         ConfigFile.Values['NForecast6'] := FloatToStr(ceJuneTotalForecast.Value);
         ConfigFile.Values['NForecast7'] := FloatToStr(ceJulyTotalForecast.Value);
         ConfigFile.Values['NForecast8'] := FloatToStr(ceAugTotalForecast.Value);
         ConfigFile.Values['NForecast9'] := FloatToStr(ceSeptTotalForecast.Value);
         ConfigFile.Values['NForecast10'] := FloatToStr(ceOctTotalForecast.Value);
         ConfigFile.Values['NForecast11'] := FloatToStr(ceNovTotalForecast.Value);
         ConfigFile.Values['NForecast12'] := FloatToStr(ceDecTotalForecast.Value);
      end
   else
      begin
         ConfigFile.Values['PForecast1'] := FloatToStr(ceJanTotalForecast.Value);
         ConfigFile.Values['PForecast2'] := FloatToStr(ceFebTotalForecast.Value);
         ConfigFile.Values['PForecast3'] := FloatToStr(ceMarTotalForecast.Value);
         ConfigFile.Values['PForecast4'] := FloatToStr(ceAprTotalForecast.Value);
         ConfigFile.Values['PForecast5'] := FloatToStr(ceMayTotalForecast.Value);
         ConfigFile.Values['PForecast6'] := FloatToStr(ceJuneTotalForecast.Value);
         ConfigFile.Values['PForecast7'] := FloatToStr(ceJulyTotalForecast.Value);
         ConfigFile.Values['PForecast8'] := FloatToStr(ceAugTotalForecast.Value);
         ConfigFile.Values['PForecast9'] := FloatToStr(ceSeptTotalForecast.Value);
         ConfigFile.Values['PForecast10'] := FloatToStr(ceOctTotalForecast.Value);
         ConfigFile.Values['PForecast11'] := FloatToStr(ceNovTotalForecast.Value);
         ConfigFile.Values['PForecast12'] := FloatToStr(ceDecTotalForecast.Value);
      end;

   ConfigFile.Values['NonBovineProduction'] := FloatToStr(seAvgNonBovineProduction.Value);
   ConfigFile.Values['ForageArea'] := FloatToStr(ceForageArea.Value);
   ConfigFile.Values['StartYear'] := cmboYear.Text;
   ConfigFile.Values['StartMonth'] := cmboMonth.Text;

   ConfigFile.SaveToFile(fNPDefs);
end;

procedure TfmNutrientProductionProjectionRptScr.CheckProjectedCalving(
  const AnimalID : Integer; const CheckDate : TDateTime;
  var NoOfCalves : Integer; var DOB : TDateTime);
var
CalvingInfo : TCalvingInfo;
begin
{
   if (( CalvingInfo.ProjCalvingDate > Now ) and
                                     ( StartDate > Now ) and (CalvingInfo.ProjCalvingDate <= StartDate)) then

   for i := 0 to CalfList.Count-1 do
      begin
         if CalfList.Objects[i] <> nil then
            begin
               CalfList.Objects[i]
               NutrientProjection.Insert;   // Inserts a new blank record for a calf
               NutrientProjection.FieldByName('NatIDNum').AsString := 'New Calf ('+ IntToStr(TCalfRecord(CalfList.Objects[i]).DamID)+')';
               NutrientProjection.FieldByName('AnimalID').AsInteger := 0;
               NutrientProjection.FieldByName('DOB').AsDateTime := TCalfRecord(CalfList.Objects[i]).DOB;
               if i < 999999 then
                  NutrientProjection.FieldByName('Sex').AsString := 'Calf' + IntToStr(i+1)
               else
                  NutrientProjection.FieldByName('Sex').AsString := 'Calf';
               //NutrientProjection.FieldByName('Include').AsBoolean := True;
               NutrientProjection.Post;    //Posts new calf record
               // Debug CalfList.Strings[i] := 'Dam: '+ TCalfRecord(CalfList.Objects[i]).DamNo +', Proj: '+ DateToStr(TCalfRecord(CalfList.Objects[i]).DOB);
               TCalfRecord(CalfList.Objects[i]).Free;
            end;
      end;
}
end;

procedure TfmNutrientProductionProjectionRptScr.CalcProjection365(
  AIndex : Byte);
var
   nDaysPerMonth, Day, Month, Year : Word;
begin
   Month := GetComboControl(AIndex).ItemIndex+1;
   Year  := GetComboControl(AIndex).Tag;
   FillChar(ProjectedTotals, SizeOf( TProjectedTotals ), 0);
   nDaysPerMonth := DaysPerMonth(Year, Month);

   for Day := 1 to nDaysPerMonth do // 31 days
      begin
         CalcProjection( EncodeDate(Year, Month, Day), ProjectedTotals);
      end;

   ProjectedTotals.DairyCows := ProjectedTotals.DairyCows/nDaysPerMonth;
   ProjectedTotals.SucklerCows := ProjectedTotals.SucklerCows/nDaysPerMonth;
   ProjectedTotals.Cattle0To12 := ProjectedTotals.Cattle0To12/nDaysPerMonth;
   ProjectedTotals.Cattle12To24 := ProjectedTotals.Cattle12To24/nDaysPerMonth;
   ProjectedTotals.Cattle2Plus := ProjectedTotals.Cattle2Plus/nDaysPerMonth;
end;

function TfmNutrientProductionProjectionRptScr.Round(
  AValue: Double): Integer;
begin
  Result := Trunc(AValue);       // extract the integer part
  if Frac(AValue) >= 0.5 then   // if fractional part >= 0.5 then...
     Result:= Result + 1;   // ...add 1
end;

function TfmNutrientProductionProjectionRptScr.ReportPeriodAsString: string;
var
   StartMonth,StartYear,EndMonth,EndYear : string;
begin
   StartMonth := CapitalizeString(Lowercase(cmbDate1.Text));
   StartYear  := IntToStr(GetComboControl(1).Tag);
   EndMonth   := CapitalizeString(Lowercase(cmbDate12.Text));
   EndYear    := IntToStr(GetComboControl(12).Tag);
   Result     := StartMonth+' '+StartYear +' to '+EndMonth+' '+EndYear;
end;

function TfmNutrientProductionProjectionRptScr.IsFutureDate(
  AControlIndex: Integer): Boolean;

  function GetMonthIndex : Integer;
  begin
     if GetComboControl(AControlIndex).Text = 'JAN' then
        Result := 1
     else if GetComboControl(AControlIndex).Text = 'FEB' then
        Result := 2
     else if GetComboControl(AControlIndex).Text = 'MAR' then
        Result := 3
     else if GetComboControl(AControlIndex).Text = 'APR' then
        Result := 4
     else if GetComboControl(AControlIndex).Text = 'MAY' then
        Result := 5
     else if GetComboControl(AControlIndex).Text = 'JUN' then
        Result := 6
     else if GetComboControl(AControlIndex).Text = 'JUL' then
        Result := 7
     else if GetComboControl(AControlIndex).Text = 'AUG' then
        Result := 8
     else if GetComboControl(AControlIndex).Text = 'SEP' then
        Result := 9
     else if GetComboControl(AControlIndex).Text = 'OCT' then
        Result := 10
     else if GetComboControl(AControlIndex).Text = 'NOV' then
        Result := 11
     else if GetComboControl(AControlIndex).Text = 'DEC' then
        Result := 12;
  end;
var
   y1, m1, d1,
   y2, m2  : word;
begin
   Result := False;
   DecodeDate(Date, y1, m1, d1);
   m2 := GetMonthIndex;
   y2 := GetComboControl(AControlIndex).Tag;
   if (y2 = y1 ) then
      begin
         if m2 >= m1 then
            Result := True // allow projection if month is greater or equal to this month
      end
   else if (y2 > y1 ) then
      Result := True;

   {
   m2 := GetMonthIndex;
   y2 := GetComboControl(AControlIndex).Tag;

   Memo.Lines.add( IntToStr(m2) + '\' + IntToStr(y2));
   Result := True;
   }

end;

procedure TfmNutrientProductionProjectionRptScr.OutputReport;
begin
   //   20/11/20 [V5.9 R7.5] /MK Change - If there are no Waste Productions Rates give error with info on how to enter the rates. 
   if ( not(HasWasteProdRates) ) then
      begin
         MessageDlg('Waste Production Rates are not entered.'+cCRLF+
                    'Click Waste Production Rates, input and save the rates.'+cCRLF+
                    'Then exit the Waste Production Rates screen and view the report again.',mtError,[mbOK],0);
         Exit;
      end;

   FUseForecastFigures := cbUseForecastFigures.Checked;
   cbUseForecastFigures.Enabled := False;

   if DebugMode then
      begin
         if AnimalList = nil then
            AnimalList := TStringList.Create;
         AnimalList.Clear;
      end;

   if fmNutrientProductionProjectionRpt = nil then
      fmNutrientProductionProjectionRpt := TfmNutrientProductionProjectionRpt.Create(nil);

   seAvgNonBovineProduction.PostEditValue;
   ceForageArea.PostEditValue;
   ceJanTotalForecast.PostEditValue;
   ceFebTotalForecast.PostEditValue;
   ceMarTotalForecast.PostEditValue;
   ceAprTotalForecast.PostEditValue;
   ceMayTotalForecast.PostEditValue;
   ceJuneTotalForecast.PostEditValue;
   ceJulyTotalForecast.PostEditValue;
   ceAugTotalForecast.PostEditValue;
   ceSeptTotalForecast.PostEditValue;
   ceOctTotalForecast.PostEditValue;
   ceNovTotalForecast.PostEditValue;
   ceDecTotalForecast.PostEditValue;

   BuildProjection;
   if DebugMode then
      begin
{         if AnimalList <> nil then
            begin
               AnimalList.Sort;
               AnimalList.SaveToFile('C:\NutProd'+ ComboHerd.Text +'.dat');
            end;
}
      end;
   cbUseForecastFigures.Enabled := True;
end;

function TfmNutrientProductionProjectionRptScr.HasWasteProdRates: Boolean;
var
   bHasNRates,
   bHasPRates,
   bHasNIRates : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM PDefs');
         try
            Open;
            bHasNRates := False;
            bHasPRates := False;
            bHasNIRates := False;

            bHasNRates := ( FieldByName('NPDairyCow').AsInteger > 0 ) or
                          ( FieldByName('NPSucklerCow').AsInteger > 0 ) or
                          ( FieldByName('NPCattle2YrsPlus').AsInteger > 0 ) or
                          ( FieldByName('NPCattle1to2Yrs').AsInteger > 0 ) or
                          ( FieldByName('NPCattle0to12Mths').AsInteger > 0 );

            bHasPRates := ( FieldByName('PPDairyCow').AsInteger > 0 ) or
                          ( FieldByName('PPSucklerCow').AsInteger > 0 ) or
                          ( FieldByName('PPCattle2YrsPlus').AsInteger > 0 ) or
                          ( FieldByName('PPCattle1to2Yrs').AsInteger > 0 ) or
                          ( FieldByName('PPCattle0to12Mths').AsInteger > 0 );

            bHasNIRates := ( FieldByName('NINPDairyCows').AsInteger > 0 ) or
                           ( FieldByName('NINPCattleOver24Mths').AsInteger > 0 ) or
                           ( FieldByName('NINPCattle12To24Mths').AsInteger > 0 ) or
                           ( FieldByName('NINPBullBeef0To13Mths').AsInteger > 0 ) or
                           ( FieldByName('NINPBullBeef6To13Mths').AsInteger > 0 ) or
                           ( FieldByName('NINPCattle0To12Mths').AsInteger > 0 ) or
                           ( FieldByName('NINPCalves6To12Mths').AsInteger > 0 ) or
                           ( FieldByName('NINPCalves0To6Mths').AsInteger > 0 );

            if ( WinData.GetHerdCountry(WinData.OwnerFile, ComboHerd.Value) = NIreland ) then
               Result := bHasNIRates
            else
               begin
                  if ( cbNitrogen.Checked ) then
                     Result := bHasNRates
                  else
                     Result := bHasPRates;
               end;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

{ TCalfRecord }

constructor TCalfRecord.Create(ADamID: Integer; ADOB: TDateTime);
begin
   DOB := ADOB;
  DamID := ADamID;
end;

procedure TfmNutrientProductionProjectionRptScr.FormDestroy(
  Sender: TObject);
begin
   WinData.cxHint.HideHint;
   
   if AnimalList <> nil then
      begin
         FreeAndNil(AnimalList);
      end;

   if NutrientProjection <> nil then
      begin
         NutrientProjection.Close;
         NutrientProjection.DeleteTable;
         NutrientProjection.Free;
      end;
//   if HerdProps <> nil then
//      FreeAndNil(HerdProps);
   if fmNutrientProductionProjectionRpt <> nil then
      FreeAndNil(fmNutrientProductionProjectionRpt);
   if cbNitrogen.checked then
      SaveWasteValues(wtNitrogen)
   else
      SaveWasteValues(wtPhosphorus)

end;

procedure TfmNutrientProductionProjectionRptScr.sbViewClick(
  Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   FPreviewReport := True;
   sbView.Enabled := False;
   sbPrint.Enabled := False;
   try
      OutputReport;
   finally
   sbView.Enabled := True;
   sbPrint.Enabled := True;
   end;
end;

procedure TfmNutrientProductionProjectionRptScr.sbExitClick(
  Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TfmNutrientProductionProjectionRptScr.ceJanDCowsExit(
  Sender: TObject);
begin
   ceJanTotalForecast.Value := CalcProjectedWaste(ceJanDCows.Value, ceJanSCows.Value, ceJanCattle012Mths.Value,ceJanCattle12Yr.Value,ceJanCattle2YrPlus.Value );
   ceFebDCowsExit(ceFebDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceFebDCowsExit(
  Sender: TObject);
begin
   ceFebTotalForecast.Value := ceJanTotalForecast.Value + CalcProjectedWaste(ceFebDCows.Value, ceFebSCows.Value, ceFebCattle012Mths.Value,ceFebCattle12Yr.Value,ceFebCattle2YrPlus.Value );
   ceMarDCowsExit(ceMarDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceMarDCowsExit(
  Sender: TObject);
begin
   ceMarTotalForecast.Value := ceFebTotalForecast.Value + CalcProjectedWaste(ceMarDCows.Value, ceMarSCows.Value, ceMarCattle012Mths.Value,ceMarCattle12Yr.Value,ceMarCattle2YrPlus.Value );
   ceAprDCowsExit(ceAprDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceAprDCowsExit(
  Sender: TObject);
begin
   ceAprTotalForecast.Value := ceMarTotalForecast.Value + CalcProjectedWaste(ceAprDCows.Value, ceAprSCows.Value, ceAprCattle012Mths.Value,ceAprCattle12Yr.Value,ceAprCattle2YrPlus.Value );
   ceMayDCowsExit(ceMayDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceMayDCowsExit(
  Sender: TObject);
begin
   ceMayTotalForecast.Value := ceAprTotalForecast.Value + CalcProjectedWaste(ceMayDCows.Value, ceMaySCows.Value, ceMayCattle012Mths.Value,ceMayCattle12Yr.Value,ceMayCattle2YrPlus.Value );
   ceJuneDCowsExit(ceJuneDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceJuneDCowsExit(
  Sender: TObject);
begin
   ceJuneTotalForecast.Value := ceMayTotalForecast.Value + CalcProjectedWaste(ceJuneDCows.Value, ceJuneSCows.Value, ceJuneCattle012Mths.Value,ceJuneCattle12Yr.Value,ceJuneCattle2YrPlus.Value );
   ceJulyDCowsExit(ceJulyDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceJulyDCowsExit(
  Sender: TObject);
begin
   ceJulyTotalForecast.Value := ceJuneTotalForecast.Value + CalcProjectedWaste(ceJulyDCows.Value, ceJulySCows.Value, ceJulyCattle012Mths.Value,ceJulyCattle12Yr.Value,ceJulyCattle2YrPlus.Value );
   ceAugDCowsExit(ceAugDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceAugDCowsExit(
  Sender: TObject);
begin
   ceAugTotalForecast.Value := ceJulyTotalForecast.Value + CalcProjectedWaste(ceAugDCows.Value, ceAugSCows.Value, ceAugCattle012Mths.Value,ceAugCattle12Yr.Value,ceAugCattle2YrPlus.Value );
   ceSeptDCowsExit(ceSeptDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceSeptDCowsExit(
  Sender: TObject);
begin
   ceSeptTotalForecast.Value := ceAugTotalForecast.Value +  CalcProjectedWaste(ceSeptDCows.Value, ceSeptSCows.Value, ceSeptCattle012Mths.Value,ceSeptCattle12Yr.Value,ceSeptCattle2YrPlus.Value );
   ceOctDCowsExit(ceOctDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceOctDCowsExit(
  Sender: TObject);
begin
   ceOctTotalForecast.Value := ceSeptTotalForecast.Value + CalcProjectedWaste(ceOctDCows.Value, ceOctSCows.Value, ceOctCattle012Mths.Value,ceOctCattle12Yr.Value,ceOctCattle2YrPlus.Value );
   ceNovDCowsExit(ceNovDCows);

end;

procedure TfmNutrientProductionProjectionRptScr.ceNovDCowsExit(
  Sender: TObject);
begin
   ceNovTotalForecast.Value := ceOctTotalForecast.Value + CalcProjectedWaste(ceNovDCows.Value, ceNovSCows.Value, ceNovCattle012Mths.Value,ceNovCattle12Yr.Value,ceNovCattle2YrPlus.Value );
   ceDecDCowsExit(ceDecDCows);
end;

procedure TfmNutrientProductionProjectionRptScr.ceDecDCowsExit(
  Sender: TObject);
begin
   ceDecTotalForecast.Value := ceNovTotalForecast.Value + CalcProjectedWaste(ceDecDCows.Value, ceDecSCows.Value, ceDecCattle012Mths.Value,ceDecCattle12Yr.Value,ceDecCattle2YrPlus.Value );
end;

procedure TfmNutrientProductionProjectionRptScr.sbWasteProdRatesClick(
  Sender: TObject);
begin
   TfmSetupWasteProdRates.ShowForm( WinData.GetHerdCountry(WinData.OwnerFile, ComboHerd.Value));
   PDairyCow := GetWasteRateValue(wcDairyCows, AnimalWasteType) / 12;
   PSucklerCow  := GetWasteRateValue(wcSucklerCows, AnimalWasteType) / 12;
   PCattle0To1Yr  := GetWasteRateValue(wcCattle0To1Yr, AnimalWasteType) / 12;
   PCattle1To2Yr  := GetWasteRateValue(wcCattle1To2Yr, AnimalWasteType) / 12;
   PCattle2PlusYr  := GetWasteRateValue(wcCattle2PlusYr, AnimalWasteType) / 12;
   ceJanDCowsExit(ceJanDCows);
end;

procedure TfmNutrientProductionProjectionRptScr.ComboHerdChange(
  Sender: TObject);
begin
   if ComboHerd.Value <> '0' then
      WinData.UserDefaultHerdID := StrToInt(ComboHerd.Value);
end;

procedure TfmNutrientProductionProjectionRptScr.FormKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = 'd' then
      DebugMode := True;
end;

procedure TfmNutrientProductionProjectionRptScr.UpdateDateControls;
var
   i, nMonth, nYear : Integer;
begin

   nMonth := cmboMonth.ItemIndex;
   nYear := StrToInt(cmboYear.Text);
   case nMonth of
      0 : begin
             for i := 0 to 11 do
                begin
                   GetComboControl(i+1).ItemIndex := i;
                   GetComboControl(i+1).Tag := nYear;
                end;
          end;
      1 : begin
             GetComboControl(1).ItemIndex := 1;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 2;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 3;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 4;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 5;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 6;
             GetComboControl(6).Tag := nYear;
             GetComboControl(7).ItemIndex := 7;
             GetComboControl(7).Tag := nYear;
             GetComboControl(8).ItemIndex := 8;
             GetComboControl(8).Tag := nYear;
             GetComboControl(9).ItemIndex := 9;
             GetComboControl(9).Tag := nYear;
             GetComboControl(10).ItemIndex := 10;
             GetComboControl(10).Tag := nYear;
             GetComboControl(11).ItemIndex := 11;
             GetComboControl(11).Tag := nYear;
             GetComboControl(12).ItemIndex := 0;
             GetComboControl(12).Tag := nYear+1;
          end;
      2 : begin
             GetComboControl(1).ItemIndex := 2;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 3;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 4;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 5;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 6;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 7;
             GetComboControl(6).Tag := nYear;
             GetComboControl(7).ItemIndex := 8;
             GetComboControl(7).Tag := nYear;
             GetComboControl(8).ItemIndex := 9;
             GetComboControl(8).Tag := nYear;
             GetComboControl(9).ItemIndex := 10;
             GetComboControl(9).Tag := nYear;
             GetComboControl(10).ItemIndex := 11;
             GetComboControl(10).Tag := nYear;
             GetComboControl(11).ItemIndex := 0;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 1;
             GetComboControl(12).Tag := nYear+1;
          end;
      3 : begin
             GetComboControl(1).ItemIndex := 3;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 4;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 5;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 6;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 7;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 8;
             GetComboControl(6).Tag := nYear;
             GetComboControl(7).ItemIndex := 9;
             GetComboControl(7).Tag := nYear;
             GetComboControl(8).ItemIndex := 10;
             GetComboControl(8).Tag := nYear;
             GetComboControl(9).ItemIndex := 11;
             GetComboControl(9).Tag := nYear;
             GetComboControl(10).ItemIndex := 0;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 1;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 2;
             GetComboControl(12).Tag := nYear+1;
          end;
      4 : begin
             GetComboControl(1).ItemIndex := 4;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 5;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 6;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 7;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 8;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 9;
             GetComboControl(6).Tag := nYear;
             GetComboControl(7).ItemIndex := 10;
             GetComboControl(7).Tag := nYear;
             GetComboControl(8).ItemIndex := 11;
             GetComboControl(8).Tag := nYear;
             GetComboControl(9).ItemIndex := 0;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 1;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 2;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 3;
             GetComboControl(12).Tag := nYear+1;
          end;
      5 : begin
             GetComboControl(1).ItemIndex := 5;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 6;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 7;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 8;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 9;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 10;
             GetComboControl(6).Tag := nYear;
             GetComboControl(7).ItemIndex := 11;
             GetComboControl(7).Tag := nYear;
             GetComboControl(8).ItemIndex := 0;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 1;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 2;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 3;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 4;
             GetComboControl(12).Tag := nYear+1;
          end;
      6 : begin
             GetComboControl(1).ItemIndex := 6;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 7;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 8;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 9;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 10;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 11;
             GetComboControl(6).Tag := nYear;
             GetComboControl(7).ItemIndex := 0;
             GetComboControl(7).Tag := nYear+1;
             GetComboControl(8).ItemIndex := 1;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 2;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 3;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 4;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 5;
             GetComboControl(12).Tag := nYear+1;
          end;
      7 : begin
             GetComboControl(1).ItemIndex := 7;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 8;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 9;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 10;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 11;
             GetComboControl(5).Tag := nYear;
             GetComboControl(6).ItemIndex := 0;
             GetComboControl(6).Tag := nYear+1;
             GetComboControl(7).ItemIndex := 1;
             GetComboControl(7).Tag := nYear+1;
             GetComboControl(8).ItemIndex := 2;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 3;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 4;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 5;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 6;
             GetComboControl(12).Tag := nYear+1;
          end;
      8 : begin
             GetComboControl(1).ItemIndex := 8;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 9;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 10;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 11;
             GetComboControl(4).Tag := nYear;
             GetComboControl(5).ItemIndex := 0;
             GetComboControl(5).Tag := nYear+1;
             GetComboControl(6).ItemIndex := 1;
             GetComboControl(6).Tag := nYear+1;
             GetComboControl(7).ItemIndex := 2;
             GetComboControl(7).Tag := nYear+1;
             GetComboControl(8).ItemIndex := 3;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 4;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 5;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 6;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 7;
             GetComboControl(12).Tag := nYear+1;
          end;
      9 : begin
             GetComboControl(1).ItemIndex := 9;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 10;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 11;
             GetComboControl(3).Tag := nYear;
             GetComboControl(4).ItemIndex := 0;
             GetComboControl(4).Tag := nYear+1;
             GetComboControl(5).ItemIndex := 1;
             GetComboControl(5).Tag := nYear+1;
             GetComboControl(6).ItemIndex := 2;
             GetComboControl(6).Tag := nYear+1;
             GetComboControl(7).ItemIndex := 3;
             GetComboControl(7).Tag := nYear+1;
             GetComboControl(8).ItemIndex := 4;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 5;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 6;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 7;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 8;
             GetComboControl(12).Tag := nYear+1;
          end;
      10 : begin
             GetComboControl(1).ItemIndex := 10;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 11;
             GetComboControl(2).Tag := nYear;
             GetComboControl(3).ItemIndex := 0;
             GetComboControl(3).Tag := nYear+1;
             GetComboControl(4).ItemIndex := 1;
             GetComboControl(4).Tag := nYear+1;
             GetComboControl(5).ItemIndex := 2;
             GetComboControl(5).Tag := nYear+1;
             GetComboControl(6).ItemIndex := 3;
             GetComboControl(6).Tag := nYear+1;
             GetComboControl(7).ItemIndex := 4;
             GetComboControl(7).Tag := nYear+1;
             GetComboControl(8).ItemIndex := 5;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 6;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 7;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 8;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 9;
             GetComboControl(12).Tag := nYear+1;
          end;
      11 : begin
             GetComboControl(1).ItemIndex := 11;
             GetComboControl(1).Tag := nYear;
             GetComboControl(2).ItemIndex := 0;
             GetComboControl(2).Tag := nYear+1;
             GetComboControl(3).ItemIndex := 1;
             GetComboControl(3).Tag := nYear+1;
             GetComboControl(4).ItemIndex := 2;
             GetComboControl(4).Tag := nYear+1;
             GetComboControl(5).ItemIndex := 3;
             GetComboControl(5).Tag := nYear+1;
             GetComboControl(6).ItemIndex := 4;
             GetComboControl(6).Tag := nYear+1;
             GetComboControl(7).ItemIndex := 5;
             GetComboControl(7).Tag := nYear+1;
             GetComboControl(8).ItemIndex := 6;
             GetComboControl(8).Tag := nYear+1;
             GetComboControl(9).ItemIndex := 7;
             GetComboControl(9).Tag := nYear+1;
             GetComboControl(10).ItemIndex := 8;
             GetComboControl(10).Tag := nYear+1;
             GetComboControl(11).ItemIndex := 9;
             GetComboControl(11).Tag := nYear+1;
             GetComboControl(12).ItemIndex := 10;
             GetComboControl(12).Tag := nYear+1;
          end;
   end;
end;

procedure TfmNutrientProductionProjectionRptScr.cbUseForecastFiguresPropertiesChange(
  Sender: TObject);
begin
   Memo.Lines.Clear;
   pForecast.Visible := cbUseForecastFigures.Checked;
   EnableForecastControls (cbUseForecastFigures.Checked);
   if cbUseForecastFigures.Checked then
      begin

      end
   else
      begin

      end;

end;

procedure TfmNutrientProductionProjectionRptScr.FormActivate(
  Sender: TObject);
var
   pt : TPoint;
begin
   FFormShowing := True;

   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;

   //   26/05/15 [V5.4 R7.0] /MK Bug Fix - ComboHerd.Value was being assigned before ComboHerd.LookupSource was assigned.
   ComboHerd.LookupSource := WinData.dsHerdDefaults;
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);
end;

procedure TfmNutrientProductionProjectionRptScr.cmboMonthPropertiesChange(
  Sender: TObject);
begin
   UpdateDateControls;
   Memo.Lines.Clear;
   if cbUseForecastFigures.Checked then
      EnableForecastControls(True);
end;

procedure TfmNutrientProductionProjectionRptScr.cmboYearPropertiesChange(
  Sender: TObject);
begin
   UpdateDateControls;
   Memo.Lines.Clear;
   if cbUseForecastFigures.Checked then
      EnableForecastControls(True);
end;

procedure TfmNutrientProductionProjectionRptScr.EnableForecastControls(
  const AEnable: Boolean);
begin
   if ( IsFutureDate(1) ) then
      begin
         ceJanDCows.Enabled := AEnable;
         ceJanSCows.Enabled := AEnable;
         ceJanCattle012Mths.Enabled := AEnable;
         ceJanCattle12Yr.Enabled := AEnable;
         ceJanCattle2YrPlus.Enabled := AEnable;
         ceJanTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceJanDCows.Enabled := False;
         ceJanSCows.Enabled := False;
         ceJanCattle012Mths.Enabled := False;
         ceJanCattle12Yr.Enabled := False;
         ceJanCattle2YrPlus.Enabled := False;
         ceJanTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(2) ) then
      begin
         ceFebDCows.Enabled := AEnable;
         ceFebSCows.Enabled := AEnable;
         ceFebCattle012Mths.Enabled := AEnable;
         ceFebCattle12Yr.Enabled := AEnable;
         ceFebCattle2YrPlus.Enabled := AEnable;
         ceFebTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceFebDCows.Enabled := False;
         ceFebSCows.Enabled := False;
         ceFebCattle012Mths.Enabled := False;
         ceFebCattle12Yr.Enabled := False;
         ceFebCattle2YrPlus.Enabled := False;
         ceFebTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(3) ) then
      begin
         ceMarDCows.Enabled := AEnable;
         ceMarSCows.Enabled := AEnable;
         ceMarCattle012Mths.Enabled := AEnable;
         ceMarCattle12Yr.Enabled := AEnable;
         ceMarCattle2YrPlus.Enabled := AEnable;
         ceMarTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceMarDCows.Enabled := False;
         ceMarSCows.Enabled := False;
         ceMarCattle012Mths.Enabled := False;
         ceMarCattle12Yr.Enabled := False;
         ceMarCattle2YrPlus.Enabled := False;
         ceMarTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(4) ) then
      begin
         ceAprDCows.Enabled := AEnable;
         ceAprSCows.Enabled := AEnable;
         ceAprCattle012Mths.Enabled := AEnable;
         ceAprCattle12Yr.Enabled := AEnable;
         ceAprCattle2YrPlus.Enabled := AEnable;
         ceAprTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceAprDCows.Enabled := False;
         ceAprSCows.Enabled := False;
         ceAprCattle012Mths.Enabled := False;
         ceAprCattle12Yr.Enabled := False;
         ceAprCattle2YrPlus.Enabled := False;
         ceAprTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(5) ) then
      begin
         ceMayDCows.Enabled := AEnable;
         ceMaySCows.Enabled := AEnable;
         ceMayCattle012Mths.Enabled := AEnable;
         ceMayCattle12Yr.Enabled := AEnable;
         ceMayCattle2YrPlus.Enabled := AEnable;
         ceMayTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceMayDCows.Enabled := False;
         ceMaySCows.Enabled := False;
         ceMayCattle012Mths.Enabled := False;
         ceMayCattle12Yr.Enabled := False;
         ceMayCattle2YrPlus.Enabled := False;
         ceMayTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(6) ) then
      begin
         ceJuneDCows.Enabled := AEnable;
         ceJuneSCows.Enabled := AEnable;
         ceJuneCattle012Mths.Enabled := AEnable;
         ceJuneCattle12Yr.Enabled := AEnable;
         ceJuneCattle2YrPlus.Enabled := AEnable;
         ceJuneTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceJuneDCows.Enabled := False;
         ceJuneSCows.Enabled := False;
         ceJuneCattle012Mths.Enabled := False;
         ceJuneCattle12Yr.Enabled := False;
         ceJuneCattle2YrPlus.Enabled := False;
         ceJuneTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(7) ) then
      begin
         ceJulyDCows.Enabled := AEnable;
         ceJulySCows.Enabled := AEnable;
         ceJulyCattle012Mths.Enabled := AEnable;
         ceJulyCattle12Yr.Enabled := AEnable;
         ceJulyCattle2YrPlus.Enabled := AEnable;
         ceJulyTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceJulyDCows.Enabled := False;
         ceJulySCows.Enabled := False;
         ceJulyCattle012Mths.Enabled := False;
         ceJulyCattle12Yr.Enabled := False;
         ceJulyCattle2YrPlus.Enabled := False;
         ceJulyTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(8)) then
      begin
         ceAugDCows.Enabled := AEnable;
         ceAugSCows.Enabled := AEnable;
         ceAugCattle012Mths.Enabled := AEnable;
         ceAugCattle12Yr.Enabled := AEnable;
         ceAugCattle2YrPlus.Enabled := AEnable;
         ceAugTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceAugDCows.Enabled := False;
         ceAugSCows.Enabled := False;
         ceAugCattle012Mths.Enabled := False;
         ceAugCattle12Yr.Enabled := False;
         ceAugCattle2YrPlus.Enabled := False;
         ceAugTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(9)) then
      begin
         ceSeptDCows.Enabled := AEnable;
         ceSeptSCows.Enabled := AEnable;
         ceSeptCattle012Mths.Enabled := AEnable;
         ceSeptCattle12Yr.Enabled := AEnable;
         ceSeptCattle2YrPlus.Enabled := AEnable;
         ceSeptTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceSeptDCows.Enabled := False;
         ceSeptSCows.Enabled := False;
         ceSeptCattle012Mths.Enabled := False;
         ceSeptCattle12Yr.Enabled := False;
         ceSeptCattle2YrPlus.Enabled := False;
         ceSeptTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(10)) then
      begin
         ceOctDCows.Enabled := AEnable;
         ceOctSCows.Enabled := AEnable;
         ceOctCattle012Mths.Enabled := AEnable;
         ceOctCattle12Yr.Enabled := AEnable;
         ceOctCattle2YrPlus.Enabled := AEnable;
         ceOctTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceOctDCows.Enabled := False;
         ceOctSCows.Enabled := False;
         ceOctCattle012Mths.Enabled := False;
         ceOctCattle12Yr.Enabled := False;
         ceOctCattle2YrPlus.Enabled := False;
         ceOctTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(11) ) then
      begin
         ceNovDCows.Enabled := AEnable;
         ceNovSCows.Enabled := AEnable;
         ceNovCattle012Mths.Enabled := AEnable;
         ceNovCattle12Yr.Enabled := AEnable;
         ceNovCattle2YrPlus.Enabled := AEnable;
         ceNovTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceNovDCows.Enabled := False;
         ceNovSCows.Enabled := False;
         ceNovCattle012Mths.Enabled := False;
         ceNovCattle12Yr.Enabled := False;
         ceNovCattle2YrPlus.Enabled := False;
         ceNovTotalForecast.Enabled := False;
      end;

   if ( IsFutureDate(12) ) then
      begin
         ceDecDCows.Enabled := AEnable;
         ceDecSCows.Enabled := AEnable;
         ceDecCattle012Mths.Enabled := AEnable;
         ceDecCattle12Yr.Enabled := AEnable;
         ceDecCattle2YrPlus.Enabled := AEnable;
         ceDecTotalForecast.Enabled := AEnable;
      end
   else
      begin
         ceDecDCows.Enabled := False;
         ceDecSCows.Enabled := False;
         ceDecCattle012Mths.Enabled := False;
         ceDecCattle12Yr.Enabled := False;
         ceDecCattle2YrPlus.Enabled := False;
         ceDecTotalForecast.Enabled := False;
      end;
{
   ceFebDCows.Enabled := AEnable;
   ceMarDCows.Enabled := AEnable;
   ceAprDCows.Enabled := AEnable;
   ceMayDCows.Enabled := AEnable;
   ceJuneDCows.Enabled := AEnable;
   ceJulyDCows.Enabled := AEnable;
   ceAugDCows.Enabled := AEnable;
   ceSeptDCows.Enabled := AEnable;
   ceOctDCows.Enabled := AEnable;
   ceNovDCows.Enabled := AEnable;
   ceDecDCows.Enabled := AEnable;

   ceFebSCows.Enabled := AEnable;
   ceMarSCows.Enabled := AEnable;
   ceAprSCows.Enabled := AEnable;
   ceMaySCows.Enabled := AEnable;
   ceJuneSCows.Enabled := AEnable;
   ceJulySCows.Enabled := AEnable;
   ceAugSCows.Enabled := AEnable;
   ceSeptSCows.Enabled := AEnable;
   ceOctSCows.Enabled := AEnable;
   ceNovSCows.Enabled := AEnable;
   ceDecSCows.Enabled := AEnable;

   ceFebCattle012Mths.Enabled := AEnable;
   ceMarCattle012Mths.Enabled := AEnable;
   ceAprCattle012Mths.Enabled := AEnable;;
   ceMayCattle012Mths.Enabled := AEnable;
   ceJuneCattle012Mths.Enabled := AEnable;
   ceJulyCattle012Mths.Enabled := AEnable;
   ceAugCattle012Mths.Enabled := AEnable;
   ceSeptCattle012Mths.Enabled := AEnable;
   ceOctCattle012Mths.Enabled := AEnable;
   ceNovCattle012Mths.Enabled := AEnable;
   ceDecCattle012Mths.Enabled := AEnable;


   ceFebCattle12Yr.Enabled := AEnable;
   ceMarCattle12Yr.Enabled := AEnable;
   ceAprCattle12Yr.Enabled := AEnable;
   ceMayCattle12Yr.Enabled := AEnable;
   ceJuneCattle12Yr.Enabled := AEnable;
   ceJulyCattle12Yr.Enabled := AEnable;
   ceAugCattle12Yr.Enabled := AEnable;
   ceSeptCattle12Yr.Enabled := AEnable;
   ceOctCattle12Yr.Enabled := AEnable;
   ceNovCattle12Yr.Enabled := AEnable;
   ceDecCattle12Yr.Enabled := AEnable;


   ceFebCattle2YrPlus.Enabled := AEnable;
   ceMarCattle2YrPlus.Enabled := AEnable;
   ceAprCattle2YrPlus.Enabled := AEnable;
   ceMayCattle2YrPlus.Enabled := AEnable;
   ceJuneCattle2YrPlus.Enabled := AEnable;
   ceJulyCattle2YrPlus.Enabled := AEnable;
   ceAugCattle2YrPlus.Enabled := AEnable;
   ceSeptCattle2YrPlus.Enabled := AEnable;
   ceOctCattle2YrPlus.Enabled := AEnable;
   ceNovCattle2YrPlus.Enabled := AEnable;
   ceDecCattle2YrPlus.Enabled := AEnable;

   ceFebTotalForecast.Enabled := AEnable;
   ceMarTotalForecast.Enabled := AEnable;
   ceAprTotalForecast.Enabled := AEnable;
   ceMayTotalForecast.Enabled := AEnable;
   ceJuneTotalForecast.Enabled := AEnable;
   ceJulyTotalForecast.Enabled := AEnable;
   ceAugTotalForecast.Enabled := AEnable;
   ceSeptTotalForecast.Enabled := AEnable;
   ceOctTotalForecast.Enabled := AEnable;
   ceNovTotalForecast.Enabled := AEnable;
   ceDecTotalForecast.Enabled := AEnable;
 }
end;

procedure TfmNutrientProductionProjectionRptScr.sbPrintClick(
  Sender: TObject);
begin
   FPreviewReport := False;
   OutputReport;
end;

procedure TfmNutrientProductionProjectionRptScr.sbViewMouseLeave
   (Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfmNutrientProductionProjectionRptScr.FormShow(Sender: TObject);
begin
   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cNutrientProdRep);
   WinData.UpdateRecentReportUsage(cNutrientProdRep);
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TfmNutrientProductionProjectionRptScr.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cNutrientProdRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cNutrientProdRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfmNutrientProductionProjectionRptScr.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('nutprodrep.htm')
end;

end.
