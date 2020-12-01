{
   16/08/13 [V5.2 R0.0] /MK Change - Added TOutputType to allow report to be viewed or printed.
                                   - Change made to RunReport to pass in TReportOption and TOutputType.

   16/10/13 [V5.2 R2.4] /MK Bug Fix - HealthFilterU PDateFrom and PDateTo was not allowing blank dates - changed to cxDate.
                                      ReportQuery not checking for blank dates.

   05/03/14 [V5.2 R8.8] /MK Additional Feature - Added Expiry Date as requested by Breda Forrest.

   25/01/17 [V5.6 R4.2] /MK Change - Added a Total for Quantity - requested by John Wynne.
                                   - Tidied up the report layout it had huge spacing when running the costings report.

   10/08/20 [V5.9 R5.3] /MK Change - Added the Herd Identity to the top of the report.   
}

unit FeedPurchaseRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, Db, DBTables, QRExport;

type
  TReportOption = (roQualityAss, roFeedCost);
  TOutputType = (otView, otPrint);
  TfmFeedPurch = class(TForm)
    QRFeedPurch: TQuickRep;
    ExtensDetail: TQRBand;
    QRBand6: TQRBand;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    VerLabel: TQRLabel;
    QRBand8: TQRBand;
    QRShape3: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qFeedPurchScr: TQuery;
    LFeedSortOptions: TQRLabel;
    LFeedFromDate: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel28: TQRLabel;
    LFeedToDate: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel11: TQRLabel;
    LSortOrder: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    Comment: TQRRichText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel18: TQRLabel;
    lExpiryDate: TQRLabel;
    qrdbExpiryDate: TQRDBText;
    QRExpr8: TQRExpr;
    qrlHerdIdentityCaption: TQRLabel;
    qrlHerdIdentity: TQRLabel;
    procedure ExtensDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LFeedFromDatePrint(sender: TObject; var Value: String);
  private
    { Private declarations }
    ReportOption : TReportOption;
    procedure ShowLabels(AEnableAndShow : Boolean);
  public
    { Public declarations }
    procedure RunReport(RptOption : TReportOption; AOutputType : TOutputType);
  end;

var
  fmFeedPurch: TfmFeedPurch;

implementation
uses
   GenTypesConst,
   HealthFilterU;
{$R *.DFM}

procedure TfmFeedPurch.RunReport(RptOption : TReportOption; AOutputType : TOutputType);
var
   i : Byte;
begin
   ReportOption := RptOption;
   ShowLabels(RptOption <> roQualityAss);
   with qFeedPurchScr do
      begin
         VerLabel.Caption := 'Herd Management ' + HerdVerNo;
         SQL.Clear;
         SQL.Add('Select Distinct  F.ID, F.BatchNumber, F.EventDate, F.Quantity, F.ExpiryDate,');
         SQL.Add('                 M.Name Manufacturer, FT.Name feedname, G.Description Category, S.Name suppname, ');
         if RptOption = roQualityAss then
            SQL.Add('              F.Comment ')
         else
            SQL.Add('              F.UnitCost, F.OtherCosts, F.TotFeedPrice ');
         SQL.Add('From FdStkEvents F                            ');
         SQL.Add('Left Join FeedTypes FT On (FT.ID = F.FeedType)');
         SQL.Add('Left Join SuppliersBreeders S On (S.ID = F.Supplier)');
         SQL.Add('Left Join Manufacturers M On  (M.ID = F.Manufacturer) ');
         SQL.Add('Left Join GenLook G On ((G.ID = FT.Category) AND (ListType = 16))');
         if ( HeatlthFilter.pDateFrom.Date > 0 ) And ( HeatlthFilter.pDateTo.Date > 0 ) then
            SQL.Add('Where F.EventDate Between ' + '''' + FormatDateTime('mm/dd/yyyy',HeatlthFilter.pDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',HeatlthFilter.pDateTo.Date) + '''' + '');

         case HeatlthFilter.SortByRadio.ItemIndex of
            0 : begin
                   SQL.Add('Order By F.EventDate');
                   LFeedSortOptions.Caption := 'Purchase Date';
                end;
            1 : begin
                   SQL.Add('Order By F.BatchNumber');
                   LFeedSortOptions.Caption := 'Invoice/Batch Number';
                end;
            2 : begin
                   SQL.Add('Order By G.Description');
                   LFeedSortOptions.Caption := 'Feed Category';
                end;
            3 : begin
                   SQL.Add('Order By S.Name');
                   LFeedSortOptions.Caption := 'Suppliers';
                end;
         end;

         case HeatlthFilter.OrderRadio.ItemIndex of
            0 : begin
                   SQL.Add('ASC');
                   LSortOrder.Caption := 'Ascending';
                end;
            1 : begin
                   SQL.Add('DESC');
                   LSortOrder.Caption := 'Descending';
                end;
         end;
      end;

   LFeedFromDate.Caption := DateToStr(HeatlthFilter.pDateFrom.Date);
   LFeedToDate.Caption := DateToStr(HeatlthFilter.pDateTo.Date);
   qrlHerdIdentity.Caption := HeatlthFilter.HerdCombo.Text;
   qFeedPurchScr.Open;

   if ( qFeedPurchScr.RecordCount > 0 ) then
      begin
         if ( AOutputType = otView ) then
            QRFeedPurch.Preview
         else if ( AOutputType = otPrint ) then
            QRFeedPurch.Print;
      end
   else
      MessageDlg('No Feed Purchase Records can be found.',mtInformation,[mbOk],0);

end;

procedure TfmFeedPurch.ExtensDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if ReportOption <> roQualityAss then Exit;
   Comment.Lines.Text := qFeedPurchScr.FieldByName('Comment').AsString;
   case Length(qFeedPurchScr.FieldByName('Comment').AsString) of
     0..50    : begin
                   TQRCustomBand(Sender).Height := 21;
                   Comment.Height := 17;
                end;
     51..100   : begin
                   TQRCustomBand(Sender).Height := 40;
                   Comment.Height := 35;
                end;
     101..150  : begin
                   TQRCustomBand(Sender).Height := 57;
                   Comment.Height := 52;
                end;
   end;
end;

procedure TfmFeedPurch.LFeedFromDatePrint(sender: TObject;
  var Value: String);
begin
   if Value = '00/00/0000' then
      Value := '';
end;

procedure TfmFeedPurch.ShowLabels (AEnableAndShow : Boolean);
begin
   QRExpr2.Enabled := AEnableAndShow;
   QRExpr3.Enabled := AEnableAndShow;
   QRExpr4.Enabled := AEnableAndShow;
   QRExpr5.Enabled := AEnableAndShow;
   QRExpr6.Enabled := AEnableAndShow;
   QRExpr7.Enabled := AEnableAndShow;
   QRDBText6.Enabled := AEnableAndShow;
   QRDBText7.Enabled := AEnableAndShow;
   QRDBText8.Enabled := AEnableAndShow;
   QRLabel9.Enabled := AEnableAndShow;
   QRLabel10.Enabled := AEnableAndShow;
   QRLabel14.Enabled := AEnableAndShow;

   QRExpr2.Visible := AEnableAndShow;
   QRExpr3.Visible := AEnableAndShow;
   QRExpr4.Visible := AEnableAndShow;
   QRExpr5.Visible := AEnableAndShow;
   QRExpr6.Visible := AEnableAndShow;
   QRExpr7.Visible := AEnableAndShow;
   QRDBText6.Visible := AEnableAndShow;
   QRDBText7.Visible := AEnableAndShow;
   QRDBText8.Visible := AEnableAndShow;
   QRLabel8.AutoSize := ( not(AEnableAndShow) );
   if ( AEnableAndShow ) then
      QRLabel8.Caption := 'Cost Per Unit'
   else
      QRLabel8.Caption := 'Feed Purchase Comment';
   QRLabel9.Visible := AEnableAndShow;
   QRLabel10.Visible := AEnableAndShow;
   QRLabel14.Visible := AEnableAndShow;

   if ( not(QRLabel14.Visible) ) then
      begin
         QRLabel13.Top := 5;
         QRExpr8.Top := 5;
      end;
end;

end.
