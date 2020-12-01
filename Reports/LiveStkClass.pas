{
   *******************************************************************************
   *  joanne tighe                                                               *
   *      16/03/2004                                                             *
   *  the original age categories for heifers and cattle                         *
   *  were as follows 0-6 mths, 6-24mths, and 24+. Instead                       *
   *  of change the names of the variables i left them to the original names     *
   *  hense  BDS06Months is really for a twelve month period.                    *
   *******************************************************************************

   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
}

unit LiveStkClass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls, db, DBTables, ComCtrls, ToolWin,
  RXCtrls, TB97, TB97Tlbr, QRExport, cxControls, cxContainer, cxEdit,
  cxCheckBox;

type
  TReportType = (LiveStkLoud, LiveStkSilent);
  TLivestockNumbers = record
     DairyCows,
     SucklerCows,
     StockBulls,
     BFC06Months,
     BFC624Months,
     BFC24Months,
     BDS06Months,
     BDS624Months,
     BDS24Months,
     TotalDairy,
     TotalSuck,
     TotalStockBull,
     TotalBFC06,
     TotalBFC624,
     TotalBFC24,
     TotalBDS06,
     TotalBDS624,
     TotalBDS24,
     TOTCOWSTART,
     TotJanCow,
     TotFebCow,
     TotMarCow,
     TotAprCow,
     TotMayCow,
     TotJunCow,
     TotJulCow,
     TotAugCow,
     TotSeptCow,
     TotOctCow,
     TotNovCow,
     TotDecCow,
     TotalJan,
     TotalFeb,
     TotalMar,
     TotalApr,
     TotalMay,
     TotalJun,
     TotalJul,
     TotalAug,
     TotalSept,
     TotalOct,
     TotalNov,
     TotalDec : Integer;
     AvgDairyCows,
     AvgSucklerCows,
     AvgStockBull,
     AvgBFC06Months,
     AvgBFC624Months,
     AvgBFC24Months,
     AvgBDS06Months,
     AvgBDS624Months,
     AvgBDS24Months : double;
     TotalLUs,
     lLUTotStart,
     lLUTotJan,
     lLUTotFeb,
     lLUTotMar,
     lLUTotApr,
     lLUTotMay,
     lLUTotJun,
     lLUTotJul,
     lLUTotAug,
     lLUTotSep,
     lLUTotOct,
     lLUTotNov,
     lLUTotDec : Double;

  end;

  TfmLiveStkClass = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    cbMonths: TComboBox;
    cbYear: TComboBox;
    QRBand2: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRSysData1: TQRSysData;
    lPeriod: TQRLabel;
    QRLabel26: TQRLabel;
    lHerdID: TQRLabel;
    QRBand1: TQRBand;
    QRShape10: TQRShape;
    QRShape17: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape11: TQRShape;
    QRShape18: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel44: TQRLabel;
    SCJAN: TQRLabel;
    BCJAN: TQRLabel;
    BC1JAN: TQRLabel;
    BC2JAN: TQRLabel;
    BSJAN1: TQRLabel;
    BS1JAN: TQRLabel;
    BS2JAN: TQRLabel;
    DCFEB: TQRLabel;
    SCFEB: TQRLabel;
    BCFEB: TQRLabel;
    BC1FEB: TQRLabel;
    BC2FEB: TQRLabel;
    BSFEB: TQRLabel;
    BS1FEB: TQRLabel;
    BS2FEB: TQRLabel;
    DCMAR: TQRLabel;
    SCMAR: TQRLabel;
    BCMAR: TQRLabel;
    BC1MAR: TQRLabel;
    BC2MAR: TQRLabel;
    BSMAR: TQRLabel;
    BS1MAR: TQRLabel;
    BS2MAR: TQRLabel;
    DCAPR: TQRLabel;
    SCAPR: TQRLabel;
    BCAPR: TQRLabel;
    BC1APR: TQRLabel;
    BC2APR: TQRLabel;
    BSAPR: TQRLabel;
    BS1APR: TQRLabel;
    BS2APR: TQRLabel;
    DCMAY: TQRLabel;
    SCMAY: TQRLabel;
    BCMAY: TQRLabel;
    BC1MAY: TQRLabel;
    BC2MAY: TQRLabel;
    BSMAY: TQRLabel;
    BS1MAY: TQRLabel;
    BS2MAY: TQRLabel;
    DCJUN: TQRLabel;
    SCJUN: TQRLabel;
    BCJUN: TQRLabel;
    BC1JUN: TQRLabel;
    BC2JUN: TQRLabel;
    BSJUN: TQRLabel;
    BS1JUN: TQRLabel;
    BS2JUN: TQRLabel;
    DCJUL: TQRLabel;
    SCJUL: TQRLabel;
    BCJUL: TQRLabel;
    BC1JUL: TQRLabel;
    BC2JUL: TQRLabel;
    BSJUL: TQRLabel;
    BS1JUL: TQRLabel;
    BS2JUL: TQRLabel;
    DCAUG: TQRLabel;
    SCAUG: TQRLabel;
    BCAUG: TQRLabel;
    BC1AUG: TQRLabel;
    BC2AUG: TQRLabel;
    BSAUG: TQRLabel;
    BS1AUG: TQRLabel;
    BS2AUG: TQRLabel;
    DCSEPT: TQRLabel;
    SCSEPT: TQRLabel;
    BCSEPT: TQRLabel;
    BC1SEPT: TQRLabel;
    BC2SEPT: TQRLabel;
    BSSEPT: TQRLabel;
    BS1SEPT: TQRLabel;
    BS2SEPT: TQRLabel;
    DCOCT: TQRLabel;
    SCOCT: TQRLabel;
    BCOCT: TQRLabel;
    BC1OCT: TQRLabel;
    BC2OCT: TQRLabel;
    BSOCT: TQRLabel;
    BS1OCT: TQRLabel;
    BS2OCT: TQRLabel;
    DCNOV: TQRLabel;
    SCNOV: TQRLabel;
    BCNOV: TQRLabel;
    BC1NOV: TQRLabel;
    BC2NOV: TQRLabel;
    BSNOV: TQRLabel;
    BS1NOV: TQRLabel;
    BS2NOV: TQRLabel;
    DCDEC: TQRLabel;
    SCDEC: TQRLabel;
    BCDEC: TQRLabel;
    BC1DEC: TQRLabel;
    BC2DEC: TQRLabel;
    BSDEC: TQRLabel;
    BS1DEC: TQRLabel;
    BS2DEC: TQRLabel;
    DCJAN: TQRLabel;
    QRShape19: TQRShape;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr39: TQRExpr;
    QRShape21: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape12: TQRShape;
    QRShape16: TQRShape;
    lAvgDC: TQRLabel;
    lAvgSC: TQRLabel;
    lAvgBC06: TQRLabel;
    lAvgBC624: TQRLabel;
    lAvgBC24: TQRLabel;
    lAvgBS06: TQRLabel;
    lAvgBS624: TQRLabel;
    lAvgB24: TQRLabel;
    lAvgTotal: TQRLabel;
    lTotalJan: TQRLabel;
    lTotalFeb: TQRLabel;
    lTotalMar: TQRLabel;
    lTotalApr: TQRLabel;
    lTotalMay: TQRLabel;
    lTotalJun: TQRLabel;
    lTotalJul: TQRLabel;
    lTotalAug: TQRLabel;
    lTotalSept: TQRLabel;
    lTotalOct: TQRLabel;
    lTotalNov: TQRLabel;
    lTotalDec: TQRLabel;
    qrLiveStkClass: TQuickRep;
    lSCAvgLUs: TQRLabel;
    lAvgTotalU1: TQRLabel;
    lAvgTotalCPC: TQRLabel;
    lRPAvgLUs: TQRLabel;
    lAvgTotalU2: TQRLabel;
    lAvgTotalRPC: TQRLabel;
    lDCAvgLUs: TQRLabel;
    lAvgTotalU: TQRLabel;
    lAvgTotalDCPC: TQRLabel;
    QRShape15: TQRShape;
    QRLabel25: TQRLabel;
    VerLabel: TQRLabel;
    JanYr: TQRLabel;
    FebYr: TQRLabel;
    MarYr: TQRLabel;
    AprYr: TQRLabel;
    JulYr: TQRLabel;
    MayYr: TQRLabel;
    AugYr: TQRLabel;
    JunYr: TQRLabel;
    OctYr: TQRLabel;
    SepYr: TQRLabel;
    NovYr: TQRLabel;
    DecYr: TQRLabel;
    Bevel1: TBevel;
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    sbExit: TRxSpeedButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    QRSysData2: TQRSysData;
    QRShape33: TQRShape;
    QRLabel27: TQRLabel;
    SBJAN: TQRLabel;
    SBFEB: TQRLabel;
    SBMAR: TQRLabel;
    SBAPR: TQRLabel;
    SBMAY: TQRLabel;
    SBJUN: TQRLabel;
    SBJUL: TQRLabel;
    SBAUG: TQRLabel;
    SBSEP: TQRLabel;
    SBOCT: TQRLabel;
    SBNOV: TQRLabel;
    SBDEC: TQRLabel;
    lAvgSB: TQRLabel;
    QRShape34: TQRShape;
    QRLabel28: TQRLabel;
    EWEJAN: TQRLabel;
    EWEFEB: TQRLabel;
    EWEMAR: TQRLabel;
    EWEAPR: TQRLabel;
    EWEMAY: TQRLabel;
    EWEJUN: TQRLabel;
    EWEJUL: TQRLabel;
    EWEAUG: TQRLabel;
    EWESEP: TQRLabel;
    EWEOCT: TQRLabel;
    EWENOV: TQRLabel;
    EWEDEC: TQRLabel;
    lAvgEwe24: TQRLabel;
    QRShape35: TQRShape;
    QRLabel55: TQRLabel;
    RAMJAN: TQRLabel;
    RAMFEB: TQRLabel;
    RAMMAR: TQRLabel;
    RAMAPR: TQRLabel;
    RAMMAY: TQRLabel;
    RAMJUN: TQRLabel;
    RAMJUL: TQRLabel;
    RAMAUG: TQRLabel;
    RAMSEP: TQRLabel;
    RAMOCT: TQRLabel;
    RAMNOV: TQRLabel;
    RAMDEC: TQRLabel;
    lAvgRam: TQRLabel;
    QRLabel69: TQRLabel;
    HOGJAN: TQRLabel;
    HOGFEB: TQRLabel;
    HOGMAR: TQRLabel;
    HOGAPR: TQRLabel;
    HOGMAY: TQRLabel;
    HOGJUN: TQRLabel;
    HOGJUL: TQRLabel;
    HOGAUG: TQRLabel;
    HOGSEP: TQRLabel;
    HOGOCT: TQRLabel;
    HOGNOV: TQRLabel;
    HOGDEC: TQRLabel;
    lAvgHog: TQRLabel;
    QRShape36: TQRShape;
    QRLabel83: TQRLabel;
    lTotCowJan: TQRLabel;
    lTotCowFeb: TQRLabel;
    lTotCowMar: TQRLabel;
    lTotCowApr: TQRLabel;
    lTotCowMay: TQRLabel;
    lTotCowJun: TQRLabel;
    lTotCowJul: TQRLabel;
    lTotCowAug: TQRLabel;
    lTotCowSep: TQRLabel;
    lTotCowOct: TQRLabel;
    lTotCowNov: TQRLabel;
    lTotCowDec: TQRLabel;
    lAvgTotCow: TQRLabel;
    QRShape37: TQRShape;
    QRLabel97: TQRLabel;
    TotSheepJan: TQRLabel;
    TotSheepFeb: TQRLabel;
    TotSheepMar: TQRLabel;
    TotSheepApr: TQRLabel;
    TotSheepMay: TQRLabel;
    TotSheepJun: TQRLabel;
    TotSheepJul: TQRLabel;
    TotSheepAug: TQRLabel;
    TotSheepSep: TQRLabel;
    TotSheepOct: TQRLabel;
    TotSheepNov: TQRLabel;
    TotSheepDec: TQRLabel;
    lAvgTotSheep: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel29: TQRLabel;
    DCSTART: TQRLabel;
    SCSTART: TQRLabel;
    SBSTART: TQRLabel;
    BC1START: TQRLabel;
    BC2START: TQRLabel;
    BC2MSTART: TQRLabel;
    RH1START: TQRLabel;
    RH2START: TQRLabel;
    RH2MSTART: TQRLabel;
    EWESTART: TQRLabel;
    RAMSTART: TQRLabel;
    HOGSTART: TQRLabel;
    lTotCowStart: TQRLabel;
    TOTSHEEPSTART: TQRLabel;
    lTotalStart: TQRLabel;
    StartYr: TQRLabel;
    lMonth: TQRLabel;
    QRShape40: TQRShape;
    lAvgDCLU: TQRLabel;
    lAvgSCLU: TQRLabel;
    lAvgSBLU: TQRLabel;
    lAvgBC06LU: TQRLabel;
    lAvgBC624LU: TQRLabel;
    lAvgBC24LU: TQRLabel;
    lAvgBS06LU: TQRLabel;
    lAvgBS624LU: TQRLabel;
    lAvgB24LU: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel59: TQRLabel;
    lAvgTotalLU: TQRLabel;
    pbCount: TProgressBar;
    QRShape41: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbFavourite: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
     tLiveStkClass : TTable;
     tLivestockCategoryByStockDate : TTable;
     qLiveStkClass : TQuery;
     nMonth : Byte;
     nYear : Integer;
     dEndDate,
     FromDate  : TDateTime;
     FHerdID : Integer;
     LiveStkNums : TLivestockNumbers;
     AvgTotDCPC,
     AvgTotCPC,
     AvgTotRPC : Double;
     FReportType : TReportType;

     procedure ResetCaptions;
     function GetMth(MonthName : String) : Byte;
     function GetEndOfMthDate(Mth, Yr : Integer) : TDate;
     procedure RepHeaderYears(Mth, Yr: Integer);
     procedure CreateTables;
     procedure SetAccsDatePeriod;
  public
    { Public declarations }
     procedure BuildReport;
  end;

  procedure RunReport(HerdID : Integer; WhichReportType : TReportType = LiveStkLoud);

var
  fmLiveStkClass: TfmLiveStkClass;

implementation

uses Dairydata, GenTypesConst, uAccsReps, KRoutines, KDBRoutines, ChkDebug;


   procedure RunReport(HerdID : Integer; WhichReportType : TReportType);
   begin
      try
         try
            Application.CreateForm(TfmLiveStkClass, fmLiveStkClass); { Create instance of report }
            fmLiveStkClass.FHerdID := HerdID;
            fmLiveStkClass.FReportType := WhichReportType;
            { fmLiveStkClass.ShowModal; Not needed for this report! }
         except
            on E : Exception do { Show message if form create is unsuccessful }
               ShowMessage('Cannot create form, close program and reboot');
         end;
         if fmLiveStkClass.FReportType = LiveStkLoud then
            fmLiveStkClass.ShowModal
         else
            fmLiveStkClass.BuildReport;
      finally
         if fmLiveStkClass <> nil then { if Form created successfully then free the form }
            with fmLiveStkClass do
               begin
                  tLiveStkClass.Close;
                  tLiveStkClass.DeleteTable;
                  tLiveStkClass.Free;
                  Free;
               end;
      end;
   end;

{$R *.DFM}

{ TfmLiveStkClass }

function TfmLiveStkClass.GetMth(MonthName: String): Byte;
begin
   if MonthName = 'January' then
      Result := 1
   else if MonthName = 'February' then
      Result := 2
   else if MonthName = 'March' then
      Result := 3
   else if MonthName = 'April' then
      Result := 4
   else if MonthName = 'May' then
      Result := 5
   else if MonthName = 'June' then
      Result := 6
   else if MonthName = 'July' then
      Result := 7
   else if MonthName = 'August' then
      Result := 8
   else if MonthName = 'September' then
      Result := 9
   else if MonthName = 'October' then
      Result := 10
   else if MonthName = 'November' then
      Result := 11
   else if MonthName = 'December' then
      Result := 12;
end;

function TfmLiveStkClass.GetEndOfMthDate(Mth, Yr: Integer): TDate;
var
   S : String;
begin
   case Mth of
      0: begin
            Result := StrToDateTime('31/12/' + IntToStr(Yr));
         end;
      1: Result := StrToDateTime('31/01/' + IntToStr(Yr));
      2: begin
            if ((Yr mod 4) = 0) then
               Result := StrToDateTime('29/02/' + IntToStr(Yr))
             else
               Result := StrToDateTime('28/02/' + IntToStr(Yr));
         end;
      3: Result := StrToDateTime('31/03/' + IntToStr(Yr));
      4: Result := StrToDateTime('30/04/' + IntToStr(Yr));
      5: Result := StrToDateTime('31/05/' + IntToStr(Yr));
      6: Result := StrToDateTime('30/06/' + IntToStr(Yr));
      7: Result := StrToDateTime('31/07/' + IntToStr(Yr));
      8: Result := StrToDateTime('31/08/' + IntToStr(Yr));
      9: Result := StrToDateTime('30/09/' + IntToStr(Yr));
      10:Result := StrToDateTime('31/10/' + IntToStr(Yr));
      11:Result := StrToDateTime('30/11/' + IntToStr(Yr));
      12:Result := StrToDateTime('31/12/' + IntToStr(Yr));
   end;
end;

procedure TfmLiveStkClass.ResetCaptions;
var i: integer;
begin
   for i := 0 to QRBand1.ControlCount -1 do
      begin
         if QRBand1.Controls[i] is TQRLabel then
            if (QRBand1.Controls[i] as TQRLabel).Tag = 1 then
               (QRBand1.Controls[i] as TQRLabel).Caption := ''
            else if (QRBand1.Controls[i] as TQRLabel).Tag = 2 then
               (QRBand1.Controls[i] as TQRLabel).Caption := '0';
      end;
end;

procedure TfmLiveStkClass.RepHeaderYears(Mth, Yr: Integer);
var
   CaptionLen : Integer;
begin
   // First initialise all the values
   JanYr.Caption := cbYear.Text;  //This value is always this year
   FebYr.Caption := '';
   MarYr.Caption := '';
   AprYr.Caption := '';
   MayYr.Caption := '';
   JunYr.Caption := '';
   JulYr.Caption := '';
   AugYr.Caption := '';
   SepYr.Caption := '';
   OctYr.Caption := '';
   NovYr.Caption := '';
   DecYr.Caption := '';
   StartYr.Caption := '';

   if Length(cbMonths.Items[cbMonths.ItemIndex]) = 4 then
      CaptionLen := 4
   else
      CaptionLen := 3;

   if cbMonths.ItemIndex <> 0 then
      lMonth.Caption :=  Copy( cbMonths.Items[cbMonths.ItemIndex], 1, CaptionLen)
   else
      lMonth.Caption :=  'Dec';

   if Length(lMonth.Caption) = 3 then
      lMonth.Caption := lMonth.Caption + '.';

   //Now to fill in correct values
   Case Mth of
        1 : Begin   //End Date of January
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := IntToStr(Yr - 1);
                 MarYr.Caption := IntToStr(Yr - 1);
                 AprYr.Caption := IntToStr(Yr - 1);
                 MayYr.Caption := IntToStr(Yr - 1);
                 JunYr.Caption := IntToStr(Yr - 1);
                 JulYr.Caption := IntToStr(Yr - 1);
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        2 : Begin   //End Date of February
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := IntToStr(Yr - 1);
                 AprYr.Caption := IntToStr(Yr - 1);
                 MayYr.Caption := IntToStr(Yr - 1);
                 JunYr.Caption := IntToStr(Yr - 1);
                 JulYr.Caption := IntToStr(Yr - 1);
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        3 : Begin   //End Date of March
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := IntToStr(Yr - 1);
                 MayYr.Caption := IntToStr(Yr - 1);
                 JunYr.Caption := IntToStr(Yr - 1);
                 JulYr.Caption := IntToStr(Yr - 1);
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        4 : Begin   //End Date of April
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := IntToStr(Yr - 1);
                 JunYr.Caption := IntToStr(Yr - 1);
                 JulYr.Caption := IntToStr(Yr - 1);
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        5 : Begin   //End Date of May
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := IntToStr(Yr - 1);
                 JulYr.Caption := IntToStr(Yr - 1);
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        6 : Begin   //End Date of June
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := IntToStr(Yr - 1);
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        7 : Begin   //End Date of July
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := cbYear.Text;
                 AugYr.Caption := IntToStr(Yr - 1);
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        8 : Begin   //End Date of August
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := cbYear.Text;
                 AugYr.Caption := cbYear.Text;
                 SepYr.Caption := IntToStr(Yr - 1);
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        9 : Begin   //End Date of September
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := cbYear.Text;
                 AugYr.Caption := cbYear.Text;
                 SepYr.Caption := cbYear.Text;
                 OctYr.Caption := IntToStr(Yr - 1);
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        10 : Begin   //End Date of October
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := cbYear.Text;
                 AugYr.Caption := cbYear.Text;
                 SepYr.Caption := cbYear.Text;
                 OctYr.Caption := cbYear.Text;
                 NovYr.Caption := IntToStr(Yr - 1);
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        11 : Begin   //End Date of November
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := cbYear.Text;
                 AugYr.Caption := cbYear.Text;
                 SepYr.Caption := cbYear.Text;
                 OctYr.Caption := cbYear.Text;
                 NovYr.Caption := cbYear.Text;
                 DecYr.Caption := IntToStr(Yr - 1);
            End;
        12 : Begin   //End Date of December
                 StartYr.Caption := IntToStr(Yr -1);
                 FebYr.Caption := cbYear.Text;
                 MarYr.Caption := cbYear.Text;
                 AprYr.Caption := cbYear.Text;
                 MayYr.Caption := cbYear.Text;
                 JunYr.Caption := cbYear.Text;
                 JulYr.Caption := cbYear.Text;
                 AugYr.Caption := cbYear.Text;
                 SepYr.Caption := cbYear.Text;
                 OctYr.Caption := cbYear.Text;
                 NovYr.Caption := cbYear.Text;
                 DecYr.Caption := cbYear.Text;
            End;
   End;
end;

procedure TfmLiveStkClass.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   qrLiveStkClass.Hide;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint);
   { Get list of Years, work back from current year by 4 }
   cbYear.Items.Add(FormatDateTime('yyyy', Date));
   cbYear.Items.Add(FormatDateTime('yyyy', IncMonth(Date, -12)));
   cbYear.Items.Add(FormatDateTime('yyyy', IncMonth(Date, -24)));
   cbYear.Items.Add(FormatDateTime('yyyy', IncMonth(Date, -36)));
   cbYear.Items.Add(FormatDateTime('yyyy', IncMonth(Date, -48)));

   CreateTables;

end;

procedure TfmLiveStkClass.FormShow(Sender: TObject);
begin
   cbMonths.ItemIndex := 11;
   cbYear.ItemIndex := 1;

   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cProfitMonSumRep);
   WinData.UpdateRecentReportUsage(cProfitMonSumRep);
end;

procedure TfmLiveStkClass.sbViewClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   Screen.Cursor := crHourGlass;

   sbView.Enabled := False;
   sbPrint.Enabled := False;

   try
      BuildReport; { Build Report, This will fill in information and preview the Quick Report }
      if TRXSpeedButton(Sender).Name = 'sbView' then
         begin
            Screen.Cursor := crDefault;
            qrLiveStkClass.Preview; { Preview the Report }
         end
      else
         qrLiveStkClass.Print;
   finally
      pbCount.Position := 0;

      sbView.Enabled := True;
      sbPrint.Enabled := True;

      Screen.Cursor := crDefault;
   end;

end;

procedure TfmLiveStkClass.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TfmLiveStkClass.CreateTables;
begin
   try
      with tLiveStkClass do
         begin
           tLiveStkClass := TTable.Create(nil);
           tLiveStkClass.Databasename := WinData.KingData.DatabaseName;
           tLiveStkClass.Tablename    := 'tLiveStkClass';
           with tLiveStkClass.FieldDefs do
              begin
                 Add('AnimalID',ftInteger,0,FALSE            );
                 Add('DOB',ftDate,0,FALSE                    );
                 Add('LactNum',ftSmallint,0,FALSE            );
                 Add('Breeding',ftBoolean,0,FALSE            );
                 Add('PrimaryBreed',ftInteger,0,FALSE        );
                 Add('EligibleForPremium',ftBoolean,0,FALSE  );
                 Add('PurchDate',ftDate,0,FALSE              );
                 Add('SaleDeathDate',ftDate,0,FALSE          );
                 Add('FirstCalvingDate',ftDate,0,FALSE       );
                 Add('Include',ftBoolean,0,FALSE             );
                 Add('DateMovedOn',ftDate,0,FALSE            );
                 Add('DateMovedOff',ftDate,0,FALSE           );
                 Add('Sex',ftString,10,FALSE                 );
                 Add('NatIDNum',ftString,20,FALSE                 );
               end;
           tLiveStkClass.CreateTable;
           tLiveStkClass.Open;
         end;
      except
         MessageDlg('There is a problem creating the table, please close the program and contact Kingswood',mtError,[mbok],0);
         Abort;
      end;

     if DevMachine then
        tLivestockCategoryByStockDate := CreateLivestockCategoryByStockDateTable;

end;

procedure TfmLiveStkClass.BuildReport;
var
   i : Smallint;
   D,
   M,
   Y : Integer;
   CalcDate : TDateTime;
   BeefAnimal : Boolean;
   OwnersAlreadyOpen  : Boolean;
   S : String;


   procedure AddToLivestockCategoryByStockDate(Category : string);
   begin

      if not Assigned(tLivestockCategoryByStockDate) then exit;

      tLivestockCategoryByStockDate.Append;
      tLivestockCategoryByStockDate.FieldByName('AnimalID').AsInteger := tLiveStkClass.FieldByName('AnimalID').AsInteger;
      tLivestockCategoryByStockDate.FieldByName('StockDate').AsDateTime := CalcDate;
      tLivestockCategoryByStockDate.FieldByName('NatIDNum').AsString := tLiveStkClass.FieldByName('NatIDNum').AsString;
      tLivestockCategoryByStockDate.FieldByName('DateOfBirth').AsDateTime := tLiveStkClass.FieldByName('DOB').AsDateTime;
      tLivestockCategoryByStockDate.FieldByName('LactNo').AsInteger := tLiveStkClass.FieldByName('LactNum').AsInteger;
      tLivestockCategoryByStockDate.FieldByName('Sex').AsString := tLiveStkClass.FieldByName('Sex').AsString;
      tLivestockCategoryByStockDate.FieldByName('PurchDate').AsDateTime := tLiveStkClass.FieldByName('PurchDate').AsDateTime;
      tLivestockCategoryByStockDate.FieldByName('SaleDeathDate').AsDateTime := tLiveStkClass.FieldByName('SaleDeathDate').AsDateTime;
      tLivestockCategoryByStockDate.FieldByName('FirstCalvingDate').AsDateTime := tLiveStkClass.FieldByName('FirstCalvingDate').AsDateTime;
      tLivestockCategoryByStockDate.FieldByName('Category').AsString := Category;
      tLivestockCategoryByStockDate.Post;

   end;

begin
   if Assigned(tLivestockCategoryByStockDate) then SQLEmptyTable(tLivestockCategoryByStockDate.TableName);
   
   if FReportType = LiveStkLoud then
      begin
         ResetCaptions; { Reset all captions on Quick Report }
         nMonth := GetMth(cbMonths.Text);
         nYear := StrToInt(cbYear.Text);
         pbCount.Show;
         pbCount.Min := 0;
         pbCount.Max := 15;
         pbCount.Position := 0;
      end
   else
      SetAccsDatePeriod;

   dEndDate := GetEndOfMthDate(nMonth, nYear);
   FromDate := GetEndOfMthDate(nMonth, nYear - 1);

   S := cbMonths.Text + ' - ' + cbYear.Text;

   try
      if Windata.OwnerFile.Active then
         begin
            Windata.OwnerFile.Active := True;
            OwnersAlreadyOpen := True;
         end;

      if Windata.OwnerFile.Locate('ID',FHerdID,[]) then
         lHerdID.Caption := WinData.OwnerFile.FieldByName('HerdIdentity').AsString;

      if not OwnersAlreadyOpen then
         Windata.OwnerFile.Active := False;
   except
      if FReportType <> LiveStkSilent then
         lHerdID.Caption := '';
   end;

   with qLiveStkClass do
      begin
         qLiveStkClass := TQuery.Create(nil);
         qLiveStkClass.DatabaseName := WinData.KingData.DatabaseName;

         qLiveStkClass.SQL.Clear;
         qLiveStkClass.SQL.Add('DELETE FROM tLiveStkClass');
         qLiveStkClass.ExecSQL;

         qLiveStkClass.SQL.Clear;
         qLiveStkClass.SQL.Add('INSERT INTO tLiveStkClass (AnimalID, DOB, LactNum, PrimaryBreed, Breeding, Sex, NatIDNum)');
         qLiveStkClass.SQL.Add('SELECT DISTINCT D.ID, D.DateOfBirth, D.LactNo, D.PrimaryBreed, Breeding, Sex, NatIDNum   ');
         qLiveStkClass.SQL.Add('FROM Animals.db D                                               ');
         qLiveStkClass.SQL.Add('WHERE ( D.HerdID = "' + IntToStr(FHerdID) + '" )                 ');
         qLiveStkClass.SQL.Add('AND ( D.DateOfBirth <= "' + FormatDateTime(cUSDateStyle,(dEndDate)) + '")');
         qLiveStkClass.SQL.Add('AND ( D.AnimalDeleted = False )  '); { Now to select required animals by DOB - }
         qLiveStkClass.ExecSQL;                                                                              { must be <= Input Date }
//         pbCount.StepIt;
      end;

      with qLiveStkClass do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO tLiveStkClass (AnimalID, DOB, LactNum, PrimaryBreed, Breeding, Sex, NatIDNum)');
            SQL.Add('SELECT DISTINCT D.ID, D.DateOfBirth, D.LactNo, D.PrimaryBreed, Breeding, Sex, NatIDNum   ');
            SQL.Add('FROM "Animals.db" D                                                     ');
            SQL.Add('LEFT JOIN IHM.db I ON (D.ID = I.AnimalID)                               ');
            SQL.Add('WHERE (I.LastHerdID = "' + IntToStr(FHerdID) + '" )                      ');
            SQL.Add('AND   (I.DateMoved <= "' + FormatDateTime(cUSDateStyle,(dEndDate)) + '")');
            SQL.Add('AND   (D.AnimalDeleted = False)                                         ');
            ExecSql;
//            pbCount.StepIt;
         end;

      // Removes animals moved ON herd after Date TO
      with qLiveStkClass do
         begin
            SQL.Clear;
            SQL.Add('DELETE FROM tLiveStkClass L                                             ');
            SQL.Add('WHERE L.AnimalID IN                                                     ');
            SQL.Add('     (SELECT DISTINCT I.AnimalID                                        ');
            SQL.Add('      FROM IHM.db I                                                     ');
            SQL.Add('      WHERE (I.NewHerdID = "' + IntToStr(FHerdID) + '" )                 ');
            SQL.Add('	   AND   (I.DateMoved > "' + FormatDateTime(cUSDateStyle,(dEndDate)) + '"))');
            ExecSql;
          end;

      with qLiveStkClass do
         begin
             SQL.Clear;
             SQL.Add('UPDATE ' + tLiveStkClass.TableName + ' SET Include = True, EligibleForPremium = FALSE');   //Set Include to true for all animals
             ExecSQL;
          end;

      WinData.tIntHerd.Open;
      with tLiveStkClass do
         begin
            if FReportType = LiveStkLoud then
               pbCount.Max := RecordCount;
            First;
            while not (tLiveStkClass.EOF) do
               begin
                  Application.ProcessMessages;
                  Edit;
                  { First get the Purchase event (if any) and exclude those animals purchased after last date in REPS report }
                  WinData.CheckEvents.Open;
                  if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLiveStkClass.FieldByName('AnimalID').AsVariant,CPurchaseEvent]),[] ) then
                      begin
                         tLiveStkClass.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                         if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > dEndDate then
                            tLiveStkClass.FieldByName('Include').AsBoolean := FALSE    //Purchased after last date in REPS Report
                      end;

                   { Second - if still included, get the Sale/Death event (if any) and exclude those sold/died on or before first date in REPS Report }
                   if (tLiveStkClass.FieldByName('Include').AsBoolean = TRUE) AND (WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLiveStkClass.FieldByName('AnimalID').AsVariant,CSaleDeathEvent]),[] )) then
                      begin
                         tLiveStkClass.FieldByName('SaleDeathDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                         If WinData.CheckEvents.FieldByName('EventDate').AsDateTime <= FromDate then
                            tLiveStkClass.FieldByName('Include').AsBoolean := FALSE;    { Sold/Died on or before earliest date in REPS Report }
                      end;

                   if ((tLiveStkClass.FieldByName('Include').AsBoolean = TRUE) AND (WinData.tIntHerd.Locate('AnimalID',tLiveStkClass.FieldByName('AnimalID').AsVariant,[] ) )) then
                      begin
                         if WinData.tIntHerd.FieldByName('LastHerdID').AsInteger = FHerdID then
                            begin
                               tLiveStkClass.FieldByName('DateMovedOff').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                               if tLiveStkClass.FieldByName('DateMovedOff').AsDateTime <= FromDate then
                                   tLiveStkClass.FieldByName('Include').AsBoolean := FALSE;    { Sold/Died on or before earliest date in REPS Report  }
                            end
                         else if WinData.tIntHerd.FieldByName('NewHerdID').AsInteger = FHerdID then
                            begin
                               tLiveStkClass.FieldByName('DateMovedOn').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                               If tLiveStkClass.FieldByName('DateMovedOn').AsDateTime > dEndDate then
                                   tLiveStkClass.FieldByName('Include').AsBoolean := FALSE;    { Sold/Died on or before earliest date in REPS Report }
                            end;
                      end;

                   { Now to check the breeds table and determine whether eligible for Premium }
                   if ((tLiveStkClass.FieldByName('Include').AsBoolean = TRUE) AND (WinData.Breeds.Locate('ID',tLiveStkClass.FieldByName('PrimaryBreed').AsVariant,[] ) )) then
                      begin  //If still included and has a nonzero BreedID, then get Premium Indicator.
                        tLiveStkClass.FieldByName('EligibleForPremium').AsBoolean := WinData.Breeds.FieldByName('EligibleForPremium').AsBoolean;
                      end;

                   { Now need to get first calving date (if it exists) }
                   if ((tLiveStkClass.FieldByName('Include').AsBoolean = TRUE) AND (tLiveStkClass.FieldByName('LactNum').AsInteger > 0)) then
                      begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                         tLiveStkClass.FieldByName('FirstCalvingDate').AsDateTime := WinData.EventDataHelper.GetFirstEventDate(tLiveStkClass.FieldByName('AnimalID').AsVariant,CCalvingEvent);
                      end;
                  Post;
                  Next;
                  pbCount.StepIt;
               end;

         FillChar(LiveStkNums, SizeOf(LiveStkNums), 0);



         for i := 11 downto -1 do
            begin
               { First get iterative date }
                if i = -1 then
                  CalcDate := FromDate
                else if nMonth - i > 0 then   //Year does not need changing
                  CalcDate := GetEndOfMthDate(((nMonth+12-i) mod 12), nYear )
                else
                  CalcDate := GetEndOfMthDate(((nMonth+12-i) mod 12), nYear- 1);



               { Next go through the tLivestockSum table and count the desired animals }
                First;

                while not (eof) do
                   begin
                      {if ((DateToStr(CalcDate) = '31/01/2009' ) and (FieldByName('AnimalID').AsInteger = 2185)) then
                         begin
                            ShowMessage('2185');
                         end;}

                      if not ( FieldByName('Include').AsBoolean ) then
                         Next
                      else if ( FieldByName('DOB').AsDateTime > CalcDate ) then
                         Next
                      else if ( FieldByName('PurchDate').AsDateTime > 0 ) and ( FieldByName('PurchDate').AsDateTime > CalcDate ) then
                         Next
                      else if ( FieldByName('SaleDeathDate').AsDateTime > 0 ) and ( FieldByName('SaleDeathDate').AsDateTime <= CalcDate ) then
                         Next
                      else if ( FieldByName('DateMovedOn').AsDateTime > 0 ) and ( FieldByName('DateMovedOn').AsDateTime <= CalcDate ) then
                         Next
                      else if ( FieldByName('DateMovedOff').AsDateTime > 0 ) and ( FieldByName('DateMovedOff').AsDateTime <= CalcDate ) then
                         Next
                      else // ok to proceed
                         begin
                            if ( FieldByName('LactNum').AsInteger > 0 ) and ( UPPERCASE(FieldByName('SEX').AsString) = 'FEMALE') then
                               { Must be a Cow into 2nd lactation }
                               begin
                                  BeefAnimal := (FieldByName('EligibleForPremium').AsBoolean);
                                  if ( FieldByName('FirstCalvingDate').AsDateTime <= CalcDate ) then
                                     begin
                                        if ( BeefAnimal ) then
                                           { Suckler Cow }
                                           begin
                                              Inc(LiveStkNums.SucklerCows);
                                              AddToLivestockCategoryByStockDate('Suckler Cow');
                                           end
                                        else
                                           { Dairy Cow }
                                           begin
                                              Inc(LiveStkNums.DairyCows);
                                              AddToLivestockCategoryByStockDate('Dairy Cow');
                                           end
                                     end
                                  else
                                     begin
                                        if (FieldByName('DOB').AsDateTime < IncMonth(CalcDate, -24)) then
                                            begin
                                               if FieldByName('Breeding').AsBoolean then
                                                  begin
                                                     Inc(LiveStkNums.BDS24Months);
                                                     AddToLivestockCategoryByStockDate('Repl. Heifer 2+ Yrs');
                                                  end
                                               else
                                                  begin
                                                     Inc(LiveStkNums.BFC24Months);
                                                     AddToLivestockCategoryByStockDate('Beef Cattle 2+ Yrs');
                                                  end;
                                            end
                                        else if ((FieldByName('DOB').AsDateTime >= IncMonth(CalcDate, -24)) and (FieldByName('DOB').AsDateTime < IncMonth(CalcDate, -12))) then
                                            begin
                                               if FieldByName('Breeding').AsBoolean then
                                                  begin
                                                     Inc(LiveStkNums.BDS624Months);
                                                     AddToLivestockCategoryByStockDate('Repl. Heifer 12-24 Mths');
                                                  end
                                               else
                                                  begin
                                                     Inc(LiveStkNums.BFC624Months);
                                                     AddToLivestockCategoryByStockDate('Beef Cattle 12-24 Mths');
                                                  end;
                                            end
                                        else if (FieldByName('DOB').AsDateTime >= (IncMonth(CalcDate, -12))) then
                                            begin
                                               if FieldByName('Breeding').AsBoolean then
                                                  begin
                                                     Inc(LiveStkNums.BDS06Months);
                                                     AddToLivestockCategoryByStockDate('Repl. Heifer 0-12 Mths');
                                                  end
                                               else
                                                  begin
                                                     Inc(LiveStkNums.BFC06Months);
                                                     AddToLivestockCategoryByStockDate('Beef Cattle 0-12 Mths');
                                                  end;
                                            end;
                                     end;
                               end
                            else if (UPPERCASE(FieldByName('SEX').AsString) = 'BULL') and FieldByName('Breeding').AsBoolean then
                               begin
                                 Inc(LiveStkNums.StockBulls); { Stock Bulls }
                                 AddToLivestockCategoryByStockDate('Stock Bull');
                               end
                            else
                               begin
                                  if (FieldByName('DOB').AsDateTime < IncMonth(CalcDate, -24)) then
                                      begin
                                         if FieldByName('Breeding').AsBoolean then
                                            begin
                                               Inc(LiveStkNums.BDS24Months);
                                               AddToLivestockCategoryByStockDate('Repl. Heifer 2+ Yrs');
                                            end
                                         else
                                            begin
                                               Inc(LiveStkNums.BFC24Months);
                                               AddToLivestockCategoryByStockDate('Beef Cattle 2+ Yrs');
                                            end;
                                      end
                                  else if ((FieldByName('DOB').AsDateTime >= IncMonth(CalcDate, -24)) and (FieldByName('DOB').AsDateTime < IncMonth(CalcDate, -12))) then
                                      begin
                                         if FieldByName('Breeding').AsBoolean then
                                            begin
                                               Inc(LiveStkNums.BDS624Months);
                                               AddToLivestockCategoryByStockDate('Repl. Heifer 12-24 Mths');
                                            end
                                         else
                                            begin
                                               Inc(LiveStkNums.BFC624Months);
                                               AddToLivestockCategoryByStockDate('Beef Cattle 12-24 Mths');
                                            end;
                                      end
                                  else if (FieldByName('DOB').AsDateTime >= (IncMonth(CalcDate, -12))) then
                                      begin
                                         if FieldByName('Breeding').AsBoolean then
                                            begin
                                               Inc(LiveStkNums.BDS06Months);
                                               AddToLivestockCategoryByStockDate('Repl. Heifer 0-12 Mths');
                                            end
                                         else
                                            begin
                                               Inc(LiveStkNums.BFC06Months);
                                               AddToLivestockCategoryByStockDate('Beef Cattle 0-12 Mths');
                                            end;
                                      end;
                               end;
                            Next;
                         end;
                   end;

                  if i = -1 then
                  {Write values for Start}
                     begin
                        if FReportType = LiveStkLoud then
                           begin
                              with LiveStkNums do
                                 begin
                                    DCSTART.Caption   := IntToStr(DairyCows);
                                    SCSTART.Caption   := IntToStr(SucklerCows);
                                    SBSTART.Caption   := IntToStr(StockBulls);
                                    BC1START.Caption   := IntToStr(BFC06Months);
                                    BC2START.Caption  := IntToStr(BFC624Months);
                                    BC2MSTART.Caption  := IntToStr(BFC24Months);
                                    RH1START.Caption  := IntToStr(BDS06Months);
                                    RH2START.Caption  := IntToStr(BDS624Months);
                                    RH2MSTART.Caption  := IntToStr(BDS24Months);
                                    TOTCOWSTART := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                                 BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                    lLUTotStart := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                    lTotalStart.Caption := VarToStr(lLUTotStart);
                                 end;
                           end;
                     end
                  { Now to write the counts to the REPS Report totals }
                  else

                  case ((nMonth+12-i) mod 12) of
                     1 : begin
                            { January }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCJAN.Caption   := IntToStr(DairyCows);
                                        SCJAN.Caption   := IntToStr(SucklerCows);
                                        SBJAN.Caption   := IntToStr(StockBulls);
                                        BCJAN.Caption   := IntToStr(BFC06Months);
                                        BC1JAN.Caption  := IntToStr(BFC624Months);
                                        BC2JAN.Caption  := IntToStr(BFC24Months);
                                        BSJAN1.Caption  := IntToStr(BDS06Months);
                                        BS1JAN.Caption  := IntToStr(BDS624Months);
                                        BS2JAN.Caption  := IntToStr(BDS24Months);
                                     end;
                                  TotJanCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotJan := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalJan.Caption := VarToStr(lLUTotJan);

                               end;
                         end;
                     2 : begin
                            { February }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCFEB.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCFEB.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBFEB.Caption   := IntToStr(StockBulls);
                                        BCFEB.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1FEB.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2FEB.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSFEB.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1FEB.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2FEB.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotFebCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotFeb := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalFeb.Caption := VarToStr(lLUTotFeb);
                               end;
                         end;
                     3 : begin
                            { March }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCMAR.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCMAR.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBMAR.Caption   := IntToStr(StockBulls);
                                        BCMAR.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1MAR.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2MAR.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSMAR.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1MAR.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2MAR.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotMarCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotMar := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalMar.Caption := VarToStr(lLUTotMar);
                               end;
                         end;
                     4 : begin
                            { April }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCAPR.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCAPR.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBAPR.Caption   := IntToStr(StockBulls);
                                        BCAPR.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1APR.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2APR.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSAPR.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1APR.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2APR.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotAprCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotApr := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalApr.Caption := VarToStr(lLUTotApr);
                               end;
                         end;
                     5 : begin
                            { May }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCMAY.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCMAY.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBMAY.Caption   := IntToStr(StockBulls);
                                        BCMAY.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1MAY.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2MAY.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSMAY.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1MAY.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2MAY.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotMayCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotMay := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalMay.Caption := VarToStr(lLUTotMay);
                               end;
                         end;
                     6 : begin
                            { June }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCJUN.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCJUN.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBJUN.Caption   := IntToStr(StockBulls);
                                        BCJUN.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1JUN.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2JUN.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSJUN.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1JUN.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2JUN.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotJunCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotJun := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalJun.Caption := VarToStr(lLUTotJun);
                               end;
                         end;
                     7 : begin
                            { July }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCJUL.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCJUL.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBJUL.Caption   := IntToStr(StockBulls);
                                        BCJUL.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1JUL.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2JUL.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSJUL.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1JUL.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2JUL.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotJulCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotJul := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then











                                     lTotalJul.Caption := VarToStr(lLUTotJul);
                               end;
                         end;
                     8 : begin
                            { August }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCAUG.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCAUG.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBAUG.Caption   := IntToStr(StockBulls);
                                        BCAUG.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1AUG.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2AUG.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSAUG.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1AUG.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2AUG.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                    end;
                                  TotAugCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotAug := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalAug.Caption := VarToStr(lLUTotAug);
                               end;
                         end;
                     9 : begin
                            { September }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCSEPT.Caption  := IntToStr(LiveStkNums.DairyCows);
                                        SCSEPT.Caption  := IntToStr(LiveStkNums.SucklerCows);
                                        SBSEP.Caption   := IntToStr(StockBulls);
                                        BCSEPT.Caption  := IntToStr(LiveStkNums.BFC06Months);
                                        BC1SEPT.Caption := IntToStr(LiveStkNums.BFC624Months);
                                        BC2SEPT.Caption := IntToStr(LiveStkNums.BFC24Months);
                                        BSSEPT.Caption  := IntToStr(LiveStkNums.BDS06Months);
                                        BS1SEPT.Caption := IntToStr(LiveStkNums.BDS624Months);
                                        BS2SEPT.Caption := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotSeptCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                                BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotSep := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalSept.Caption := VarToStr(lLUTotSep);
                               end;
                         end;
                    10 : begin
                            { October }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCOCT.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCOCT.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBOCT.Caption   := IntToStr(StockBulls);
                                        BCOCT.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1OCT.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2OCT.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSOCT.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1OCT.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2OCT.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotOctCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotOct := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));
                                  if FReportType = LiveStkLoud then
                                     lTotalOct.Caption := VarToStr(lLUTotOct);
                               end;
                         end;
                    11 : begin
                            { November }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCNOV.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCNOV.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBNOV.Caption   := IntToStr(StockBulls);
                                        BCNOV.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1NOV.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2NOV.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSNOV.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1NOV.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2NOV.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotNovCow := (DairyCows + SucklerCows + StockBulls +BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotNov := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));

                                  if FReportType = LiveStkLoud then
                                     lTotalNov.Caption := VarToStr(lLUTotNov);
                               end;
                         end;
                     0 : begin
                            { December - mod calculation produces 0 for December }
                            with LiveStkNums do
                               begin
                                  if FReportType = LiveStkLoud then
                                     begin
                                        DCDEC.Caption   := IntToStr(LiveStkNums.DairyCows);
                                        SCDEC.Caption   := IntToStr(LiveStkNums.SucklerCows);
                                        SBDEC.Caption   := IntToStr(StockBulls);
                                        BCDEC.Caption   := IntToStr(LiveStkNums.BFC06Months);
                                        BC1DEC.Caption  := IntToStr(LiveStkNums.BFC624Months);
                                        BC2DEC.Caption  := IntToStr(LiveStkNums.BFC24Months);
                                        BSDEC.Caption   := IntToStr(LiveStkNums.BDS06Months);
                                        BS1DEC.Caption  := IntToStr(LiveStkNums.BDS624Months);
                                        BS2DEC.Caption  := IntToStr(LiveStkNums.BDS24Months);
                                     end;
                                  TotDecCow := (DairyCows + SucklerCows + StockBulls + BFC06Months + BFC624Months +
                                               BFC24Months + BDS06Months + BDS624Months + BDS24Months);
                                  lLUTotDec := (DairyCows + SucklerCows + StockBulls +
                                                          BDS24Months + BFC24Months + ((BFC06Months + BDS06Months)*0.3) +
                                                          ((BFC624Months + BDS624Months)*0.7));

                                  if FReportType = LiveStkLoud then
                                     lTotalDec.Caption := VarToStr(lLUTotDec);
                               end;
                         end;
                  end;


                  if ( i = -1 ) then // Reset Totals, they are not included in Avgs
                     with LiveStkNums do
                        begin
                           DairyCows    := 0;
                           SucklerCows  := 0;
                           StockBulls   := 0;
                           BFC06Months  := 0;
                           BFC624Months := 0;
                           BFC24Months  := 0;
                           BDS06Months  := 0;
                           BDS624Months := 0;
                           BDS24Months  := 0;
                        end;


                  { Work out totals for averages }
                  with LiveStkNums do
                     begin
                        Inc(TotalDairy,  DairyCows);
                        Inc(TotalSuck,   SucklerCows);
                        Inc(TotalStockBull, StockBulls);
                        Inc(TotalBFC06,  BFC06Months);
                        Inc(TotalBFC624, BFC624Months);
                        Inc(TotalBFC24,  BFC24Months);
                        Inc(TotalBDS06,  BDS06Months);
                        Inc(TotalBDS624, BDS624Months);
                        Inc(TotalBDS24,  BDS24Months);
                     end;

                  with LiveStkNums do
                     begin
                        DairyCows    := 0;
                        SucklerCows  := 0;
                        StockBulls   := 0;
                        BFC06Months  := 0;
                        BFC624Months := 0;
                        BFC24Months  := 0;
                        BDS06Months  := 0;
                        BDS624Months := 0;
                        BDS24Months  := 0;
                     end;

//               pbCount.StepIt;
            end; { End For }


           { Totals }
            with LiveStkNums do
              begin
                 if FReportType = LiveStkLoud then
                    begin
                       lTotCowStart.Caption  := IntToStr(TOTCOWSTART);
                       lTotCowJan.Caption  := IntToStr(TotJanCow);
                       lTotCowFeb.Caption  := IntToStr(TotFebCow);
                       lTotCowMar.Caption  := IntToStr(TotMarCow);
                       lTotCowApr.Caption  := IntToStr(TotAprCow);
                       lTotCowMay.Caption  := IntToStr(TotMayCow);
                       lTotCowJun.Caption  := IntToStr(TotJunCow);
                       lTotCowJul.Caption  := IntToStr(TotJulCow);
                       lTotCowAug.Caption  := IntToStr(TotAugCow);
                       lTotCowSep.Caption := IntToStr(TotSeptCow);
                       lTotCowOct.Caption  := IntToStr(TotOctCow);
                       lTotCowNov.Caption  := IntToStr(TotNovCow);
                       lTotCowDec.Caption  := IntToStr(TotDecCow);
                    end;
              end;
                  // Do rest of totals.

            with LiveStkNums do
              begin
                  { Averages }
                  LiveStkNums.AvgDairyCows     := LiveStkNums.TotalDairy  / 12;
                  LiveStkNums.AvgSucklerCows   := LiveStkNums.TotalSuck   / 12;
                  LiveStkNums.AvgStockBull     := LiveStkNums.TotalStockBull / 12;
                  LiveStkNums.AvgBFC06Months   := LiveStkNums.TotalBFC06  / 12;
                  LiveStkNums.AvgBFC624Months  := LiveStkNums.TotalBFC624 / 12;
                  LiveStkNums.AvgBFC24Months   := LiveStkNums.TotalBFC24  / 12;
                  LiveStkNums.AvgBDS06Months   := LiveStkNums.TotalBDS06  / 12;
                  LiveStkNums.AvgBDS624Months  := LiveStkNums.TotalBDS624 / 12;
                  LiveStkNums.AvgBDS24Months   := LiveStkNums.TotalBDS24  / 12;
              end;

            with LiveStkNums do
              begin
                 if FReportType = LiveStkLoud then
                    begin
                       lAvgDC.Caption    := FloatToStrF(LiveStkNums.AvgDairyCows, ffFixed, 8, 2      );
                       lAvgSC.Caption    := FloatToStrF((LiveStkNums.AvgSucklerCows), ffFixed, 8, 2  );
                       lAvgSB.Caption    := FloatToStrF((LiveStkNums.AvgStockBull), ffFixed, 8, 2  );
                       lAvgBC06.Caption  := FloatToStrF((LiveStkNums.AvgBFC06Months), ffFixed, 8, 2  );
                       lAvgBC624.Caption := FloatToStrF((LiveStkNums.AvgBFC624Months), ffFixed, 8, 2 );
                       lAvgBC24.Caption  := FloatToStrF((LiveStkNums.AvgBFC24Months), ffFixed, 8, 2  );
                       lAvgBS06.Caption  := FloatToStrF((LiveStkNums.AvgBDS06Months), ffFixed, 8, 2  );
                       lAvgBS624.Caption := FloatToStrF((LiveStkNums.AvgBDS624Months), ffFixed, 8, 2 );
                       lAvgB24.Caption   := FloatToStrF((LiveStkNums.AvgBDS24Months), ffFixed, 8, 2  );



                       {lAvgTotCow.Caption:= FloatToStrF((LiveStkNums.AvgDairyCows +
                                                        LiveStkNums.AvgSucklerCows +
                                                        LiveStkNums.AvgStockBull +
                                                        LiveStkNums.AvgBFC06Months +
                                                        LiveStkNums.AvgBFC624Months +
                                                        LiveStkNums.AvgBFC24Months +
                                                        LiveStkNums.AvgBDS06Months +
                                                        LiveStkNums.AvgBDS624Months +
                                                        LiveStkNums.AvgBDS24Months), ffFixed, 8, 2  );
                       }
                       with LiveStkNums do
                          begin
                             { Average for Monthly Totals }
                             lAvgTotCow.Caption:= FloatToStrF( (TotalDairy + TotalSuck + TotalStockBull +
                                                                TotalBFC06 + TotalBFC624 + TotalBFC24 +
                                                                TotalBDS06 + TotalBDS624 + TotalBDS24 ) DIV 12, ffFixed, 8, 2  );;

                          end;

                    end;
              end;

            with LiveStkNums do
              begin
                 if FReportType = LiveStkLoud then
                    begin
                {AverageLU}
                      lAvgDCLU.Caption    := FloatToStrF(LiveStkNums.AvgDairyCows, ffFixed, 8, 2      );
                      lAvgSCLU.Caption    := FloatToStrF((LiveStkNums.AvgSucklerCows), ffFixed, 8, 2  );
                      lAvgSBLU.Caption    := FloatToStrF((LiveStkNums.AvgStockBull), ffFixed, 8, 2  );
                      lAvgBC06LU.Caption  := FloatToStrF(((LiveStkNums.AvgBFC06Months)*0.3), ffFixed, 8, 2  );
                      lAvgBC624LU.Caption := FloatToStrF(((LiveStkNums.AvgBFC624Months)*0.7), ffFixed, 8, 2 );
                      lAvgBC24LU.Caption  := FloatToStrF((LiveStkNums.AvgBFC24Months), ffFixed, 8, 2  );
                      lAvgBS06LU.Caption  := FloatToStrF(((LiveStkNums.AvgBDS06Months)*0.3), ffFixed, 8, 2  );
                      lAvgBS624LU.Caption := FloatToStrF(((LiveStkNums.AvgBDS624Months)*0.7), ffFixed, 8, 2 );
                      lAvgB24LU.Caption   := FloatToStrF((LiveStkNums.AvgBDS24Months), ffFixed, 8, 2  );
                      lAvgTotalLU.Caption:= FloatToStrF((LiveStkNums.AvgDairyCows +
                                                       LiveStkNums.AvgSucklerCows +
                                                       LiveStkNums.AvgStockBull +
                                                       (LiveStkNums.AvgBFC06Months*0.3) +
                                                       (LiveStkNums.AvgBFC624Months*0.7) +
                                                       LiveStkNums.AvgBFC24Months +
                                                       (LiveStkNums.AvgBDS06Months*0.3) +
                                                       (LiveStkNums.AvgBDS624Months*0.7) +
                                                       LiveStkNums.AvgBDS24Months), ffFixed, 8, 2  );


                      {                  lAvgTotal.Caption := FloatToStrF(((LiveStkNums.TotalLJan +
                                                         LiveStkNums.TotalFeb  +
                                                         LiveStkNums.TotalMar  +
                                                         LiveStkNums.TotalApr  +
                                                         LiveStkNums.TotalMay  +
                                                         LiveStkNums.TotalJun  +
                                                         LiveStkNums.TotalJul  +
                                                         LiveStkNums.TotalAug  +
                                                         LiveStkNums.TotalSept +
                                                         LiveStkNums.TotalOct  +
                                                         LiveStkNums.TotalNov  +
                                                         LiveStkNums.TotalDec ) div 12), ffFixed, 8, 2);
           }
                       lAvgTotal.Caption := VarToStr((lLUTotJan + lLUTotFeb + lLUTotMar  +
                                                         lLUTotApr  +
                                                         lLUTotMay  +
                                                         lLUTotJun  +
                                                         lLUTotJul  +
                                                         lLUTotAug  +
                                                         lLUTotSep  +
                                                         lLUTotOct  +
                                                         lLUTotNov  +
                                                         lLUTotDec)/12);



                         lDCAvgLUs.Caption := FloatToStrF((LiveStkNums.AvgDairyCows), ffFixed, 8, 2);
                         lSCAvgLUs.Caption := FloatToStrF((LiveStkNums.AvgBFC24Months + LiveStkNums.AvgSucklerCows + (LiveStkNums.AvgBFC624Months * 0.7) + (LiveStkNums.AvgBFC06Months * 0.3)), ffFixed, 8, 2);
                         lRPAvgLUs.Caption := FloatToStrF((LiveStkNums.AvgStockBull + (LiveStkNums.AvgBDS624Months * 0.7) + LiveStkNums.AvgBDS24Months + (LiveStkNums.AvgBDS06Months * 0.3)), ffFixed, 8, 2);
                    end;
              end;

            with LiveStkNums do
              begin
                 TotalLUs := (LiveStkNums.AvgStockBull + LiveStkNums.AvgDairyCows +
                              LiveStkNums.AvgSucklerCows + (LiveStkNums.AvgBFC624Months * 0.7) +
                              LiveStkNums.AvgBFC24Months + (LiveStkNums.AvgBDS624Months * 0.7)
                              + LiveStkNums.AvgBDS24Months) + (LiveStkNums.AvgBDS06Months * 0.3) + (LiveStkNums.AvgBFC06Months * 0.3);
              end;

              begin
                 if FReportType = LiveStkLoud then
                    begin
                       lAvgTotalU.Caption  := FloatToStrF(LiveStkNums.TotalLUs, ffFixed, 8, 2);
                       lAvgTotalU1.Caption := lAvgTotalU.Caption;
                       lAvgTotalU2.Caption := lAvgTotalU.Caption;
                    end;



                     try
                        AvgTotDCPC := ((LiveStkNums.AvgDairyCows / LiveStkNums.TotalLUs) * 100);
                        if FReportType = LiveStkLoud then
                           lAvgTotalDCPC.Caption := FloatToStrF(AvgTotDCPC, ffFixed, 8, 2);
                     except
                        if FReportType = LiveStkLoud then
                           lAvgTotalDCPC.Caption := '0';
                     end;

                     try
                        AvgTotCPC := (((LiveStkNums.AvgSucklerCows + (LiveStkNums.AvgBFC06Months * 0.3) + (LiveStkNums.AvgBFC624Months * 0.7) + LiveStkNums.AvgBFC24Months) / LiveStkNums.TotalLUs) * 100);
                        if FReportType = LiveStkLoud then
                           lAvgTotalCPC.Caption  := FloatToStrF(AvgTotCPC, ffFixed, 8, 2);
                     except
                        if FReportType = LiveStkLoud then
                           lAvgTotalCPC.Caption  := '0';
                     end;

                     try
                        AvgTotRPC := ((((LiveStkNums.AvgBDS06Months * 0.3) + LiveStkNums.AvgStockBull + (LiveStkNums.AvgBDS624Months * 0.7) + LiveStkNums.AvgBDS24Months) / LiveStkNums.TotalLUs) * 100);
                        if FReportType = LiveStkLoud then
                           lAvgTotalRPC.Caption  := FloatToStrF(AvgTotRPC, ffFixed, 8, 2);
                     except
                        if FReportType = LiveStkLoud then
                           lAvgTotalRPC.Caption  := '0';
                     end;

                     WinData.LiveStockValues.Active := True;
                     if WinData.LiveStockValues.Locate('HerdID', FHerdID, []) then
                        WinData.LiveStockValues.Edit
                     else
                        begin
                           WinData.LiveStockValues.Append;
                           WinData.LiveStockValues.FieldByName('HerdID').AsInteger := FHerdID;
                        end;

                     try
                        WinData.LiveStockValues.FieldByName('AvgDairyPerc').AsFloat := (AvgTotDCPC);
                     except
                     end;
                     try
                        WinData.LiveStockValues.FieldByName('AvgCattlePerc').AsFloat := AvgTotCPC;
                     except
                     end;
                     try
                        WinData.LiveStockValues.FieldByName('AvgReplacePerc').AsFloat := AvgTotRPC;
                     except
                     end;
                     WinData.LiveStockValues.Post;
                     WinData.LiveStockValues.Active := False;
               end;

         end; { End with tLiveStkClass do }

   if FReportType = LiveStkLoud then
      begin
         WinData.tIntHerd.Close;
         VerLabel.Caption := 'Kingswood HERD '+ HerdVerNo;
         lPeriod.Caption := S;
         RepHeaderYears(nMonth, nYear);
         pbCount.Hide;
      end;
   if Assigned(tLivestockCategoryByStockDate) then DBIForceWrite(tLivestockCategoryByStockDate);

end;

procedure TfmLiveStkClass.SetAccsDatePeriod;
var
 FINANCIALYEAR : TFINANCIALYEAR;
begin

   FINANCIALYEAR := GetFinancialYearData(FHerdID);

   if FINANCIALYEAR.Month > 0 then
      nMonth := FINANCIALYEAR.Month
   else
      raise Exception.Create('Cannot find StartMonth value. Please run Update Figures.');

   if FINANCIALYEAR.Year > 0 then
      nYear  := FINANCIALYEAR.Year
   else
      raise Exception.Create('Cannot find YearEnd value. Please run Update Figures.');
end;

procedure TfmLiveStkClass.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   
   if Assigned(tLivestockCategoryByStockDate) then
     begin
        tLivestockCategoryByStockDate.Close;
        tLivestockCategoryByStockDate.DeleteTable;
        FreeAndNil(tLivestockCategoryByStockDate);
     end;
end;

procedure TfmLiveStkClass.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;
end;

procedure TfmLiveStkClass.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TfmLiveStkClass.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cProfitMonSumRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cProfitMonSumRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.

