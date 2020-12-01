unit uPDAExportSynch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Registry, GenTypesConst, ExtCtrls, ComCtrls, PDALink;

type
  TPDAExportSynch = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateStatusLabel(Str : String);
    procedure ExportReports;
  public
    { Public declarations }
  end;

var
  PDAExportSynch: TPDAExportSynch;

implementation
uses
   DairyData, StockInHerdFilt, SaleEligibility,
   uRestrictAnimals, HealthFilterU, SCCAnalysis,
   uHeatServiceFilt, ActionReminderFilt, uWeighingFilt,
   BreedingAnalysisFilt, FertAnalysisRpt, uSalesReport,
   uHerdBrochureFlt, kRoutines;

{$R *.DFM}

procedure TPDAExportSynch.FormCreate(Sender: TObject);
begin
   Label1.Caption := 'Please wait...';
   WinData.PDALinkExport := TPDALink.Create(DataDir);
end;

procedure TPDAExportSynch.UpdateStatusLabel(Str: String);
begin
   Label1.Caption := Str;
   Update;
end;

procedure TPDAExportSynch.ExportReports;
var
   ReportCount, ReportIndex : Integer;
   CurrentReport : string;
begin
   WinData.ExportToPDA := TRUE;
   Screen.Cursor := crHourGlass;
   ReportCount := WinData.PDALinkExport.EnumerateActiveReports * 3;

   if ReportCount > 0 then
      begin
         ProgressBar1.Max := ReportCount;
         if ReportCount > 1 then
            ProgressBar1.Show;

         try
            for ReportIndex := 0 to WinData.PDALinkExport.ActiveReportList.Count-1 do
               begin
                  Application.ProcessMessages;
                  CurrentReport := WinData.PDALinkExport.ActiveReportList.Strings[ReportIndex];
                  WinData.PDALinkExport.ReadReportInfo( CurrentReport );

                  if WinData.PDALinkExport.PDALinkReportInfo.ReportActive then
                     begin
                        UpdateStatusLabel(CurrentReport);
                        case WinData.PDALinkExport.PDALinkReportInfo.ReportIndex of
                           PDARepStockOnHand : StockInHerdFilt.ShowForm(StockOnHand);
                           PDARepPurchSalesAnalysis : StockInHerdFilt.ShowForm(PurchSales);
                           PDARepSalesPlanner : SaleEligibility.CreateAndShow(rtSalesPlanner);
                           PDARepRestrictedAnimals : uRestrictAnimals.CreateAndShowForm;
                           PDARepVetTreatmentsReport :
                              begin
                                 HealthFilterU.ReportType := rtMediTreat;
                                 Application.CreateForm(THeatlthFilter, HeatlthFilter);
                                 try
                                    try
                                       HeatlthFilter.sbView.Click;
                                    except
                                    end;
                                 finally
                                    HeatlthFilter.Free;
                                 end;
                                 ProgressBar1.StepIt;
                              end;
                           PDARepSCCAnalysis : SCCAnalysis.ShowForm;
                           PDARepHeatsServicesPDs : uHeatServiceFilt.ShowTheForm;
                           PDARepDueService : RunReport(rmPDAExport,[arDueService]);
                           PDARepDuePregnancyDiag : RunReport(rmPDAExport,[arDuePD]);
                           PDARepDueForDryingOff : RunReport(rmPDAExport,[arDueDryOff]);
                           PDARepDueToCalve : RunReport(rmPDAExport,[arDueCalve]);
                           PDARepWeighingReport : FertAnalysisRpt.ShowTheForm;
                           PDARepBestCowsInHerd : BreedingAnalysisFilt.ShowForm;
                           PDARepHerdBrochure : uHerdBrochureFlt.ShowForm;
                           PDARepCattleMargins : uSalesReport.ShowTheForm;
                           PDARepIndividualCowFertility : FertAnalysisRpt.ShowTheForm;
                        end;
                        ProgressBar1.StepIt;
                     end;
               end;
         finally
             WinData.PDALinkExport.ClearActiveReports;
             WinData.ExportToPDA := FALSE;
             ProgressBar1.Position := 0;
             ProgressBar1.Hide;

             Screen.Cursor := crDefault;
             UpdateStatusLabel('Complete!');
             MessageDlg('Export Complete!',mtInformation,[mbOk],0);
             Close;
             if MessageDlg('Do you want to expore export files?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                WinData.PDALinkExport.ExploreOutput;
         end;
      end;
end;

procedure TPDAExportSynch.FormShow(Sender: TObject);
begin

   if WinData.PDALinkExport.Active then
      Timer1.Enabled := True
   else
      begin
         MessageDlg('No settings have been found for download'+ cCRLF +
                    'Please go to PDALink\Settings before download',mtInformation,[mbOK],0);
      end;
end;

procedure TPDAExportSynch.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := False;
   ExportReports;
end;

procedure TPDAExportSynch.FormDestroy(Sender: TObject);
begin
   if ( WinData.PDALinkExport <> nil ) then
      FreeAndNil(WinData.PDALinkExport);
end;

procedure TPDAExportSynch.FormPaint(Sender: TObject);
begin
   if not WinData.PDALinkExport.Active then
      Close;

end;

end.
