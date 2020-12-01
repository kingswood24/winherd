unit uWeighingFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, ExtCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin, Mask,
  ToolEdit, Qrctrls, quickrpt, Db, DBTables, QRExport, ReportDefaults;

type
  TWeighingIntervalRec = record
     TotAnimals : Integer;
     TotalWeight, TotalWeighGain, TotalGainPerDay : Double;
     TotalNumDays : Integer;
  end;

  TfWeighingFilt = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    pStockOnHand: TPanel;
    rgReportOn: TRadioGroup;
    rgSortBy: TRadioGroup;
    rgSortOrder: TRadioGroup;
    SwitchLabel: TLabel;
    Label2: TLabel;
    FromWtDate: TDateEdit;
    ToWtDate: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    FromDOB: TDateEdit;
    ToDOB: TDateEdit;
    qWeighing: TQuery;
    rgNumSelect: TRadioGroup;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    FromPurchDate: TDateEdit;
    ToPurchDate: TDateEdit;
    GenQuery: TQuery;
    qReport: TQuery;
    MyTable: TTable;
    cbUseFilters: TCheckBox;
    cbLeftHerd: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    WeighingRep: TQuickRep;
    TitleBand1: TQRBand;
    SummaryBand2: TQRBand;
    PageFooterBand1: TQRBand;
    WeighingDetail: TQRBand;
    qrUsingFilters: TLabel;
    RptTitle: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData2: TQRSysData;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    lNumber: TQRLabel;
    lWeight: TQRLabel;
    lDOB: TQRLabel;
    dbNumber: TQRDBText;
    DOBDisplayDate: TQRDBText;
    DOBDisplayWeight: TQRDBText;
    WeighingsTable: TTable;
    dsMaster: TDataSource;
    WeighingsTableID: TAutoIncField;
    WeighingsTableWeighingDate: TDateTimeField;
    WeighingsTableAnimalID: TIntegerField;
    WeighingsTableWeight: TFloatField;
    WeighingsTableNoDays: TIntegerField;
    WeighingsTableWeightGain: TFloatField;
    WeighingsTableGainPerDay: TFloatField;
    WeighingsTableWeighDesc: TStringField;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText12: TQRDBText;
    qrsdWeighingRecords: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    lAverages: TQRLabel;
    VerLabel: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    IntervalAnalysisRpt: TQuickRep;
    PageFooterBand2: TQRBand;
    QRLoopBand1: TQRLoopBand;
    qrIntervalIndex: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrTotalAnimalsInInterval: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    qrAverageWeightGain: TQRLabel;
    qrAverageGainPerDay: TQRLabel;
    qrAverageDaysToWeighing: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel16: TQRLabel;
    qrAverageWeight: TQRLabel;
    PurchDate: TQRDBText;
    PurchWeight: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    qrTotalIntervals: TQRLabel;
    QRLabel17: TQRLabel;
    VerLabel2: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText2: TQRDBText;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WeighingDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ToDOBEnter(Sender: TObject);
    procedure ToWtDateEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WeighingRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLoopBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure IntervalAnalysisRptAfterPreview(Sender: TObject);
    procedure PageFooterBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsdWeighingRecordsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbUseFiltersClick(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
  private
    { Private declarations }
    WeighingDefaults : TWeighingDefaults;
    WeighingIntArray : array of TWeighingIntervalRec;
    procedure BuildWeighing;
    procedure BlankCaptions;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
    procedure OutputIntervalSummary;
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation
uses
    GenTypesConst,
    DairyData, KDBRoutines;
var
  fWeighingFilt: TfWeighingFilt;

{$R *.DFM}

procedure ShowTheForm;
begin
   Application.CreateForm(TfWeighingFilt, fWeighingFilt);
   try
      if not WinData.ExportToPDA then
         fWeighingFilt.ShowModal
      else
         fWeighingFilt.sbView.Click;
    finally
       FreeAndNil(fWeighingFilt);
    end;
end;

procedure TfWeighingFilt.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TfWeighingFilt.BuildWeighing;
begin
     Try
        VerLabel.Caption := 'Herd Management ' + HerdVerNo;

        SQLEmptyTable(MyTable.TableName);
        SQLEmptyTable(WeighingsTable.TableName);

        //Fill Table
        qWeighing.SQL.Clear;
        qWeighing.SQL.Add('INSERT INTO tWeighing ( AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatIDNum,');
        qWeighing.SQL.Add('                       DateOfBirth, Sex, BirthWeight, HerdIdentity, BCode, DamNumber )');
        qWeighing.SQL.Add('SELECT DISTINCT  A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatId,');
        qWeighing.SQL.Add('                 A.DateOfBirth, A.Sex, A.BirthWeight, O.HerdIdentity, B.Code');
        if Windata.SearchField = 'AnimalNo' then
           qWeighing.SQL.Add('                  , AD.AnimalNo ')
        else
           qWeighing.SQL.Add('                  , AD.NatIDNum ');

        qWeighing.SQL.Add('FROM Animals A ');
        qWeighing.SQL.Add('LEFT JOIN Animals AD ON (AD.ID=A.DamID)');
        qWeighing.SQL.Add('LEFT JOIN Breeds B  ON (B.ID=A.PrimaryBreed)');
        qWeighing.SQL.Add('LEFT JOIN Owners O ON (O.ID=A.HerdID)');
        if cbUseFilters.Checked then
           qWeighing.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
        qWeighing.SQL.Add('WHERE (O.ID = A.HerdID) AND (A.ID IN ( SELECT AnimalID FROM Events WHERE (EventType = ' + IntToStr(CWeightEvent) + ')))');  //Weighing Event
        if (ComboHerd.Value <> '0' ) then
           qWeighing.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ')
        else
           qWeighing.SQL.ADD(' AND (NOT(A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
        if not cbLeftHerd.Checked then
           qWeighing.SQL.ADD('AND (A.InHerd = TRUE) ');
        case rgReportOn.ItemIndex of
           0 : qWeighing.SQL.ADD(' AND NOT(A.SEX = "Female")');
           1 : qWeighing.SQL.ADD(' AND (A.SEX = "Bull")');
           2 : qWeighing.SQL.ADD(' AND (A.SEX = "Steer")');
           3 : qWeighing.SQL.ADD(' AND (A.SEX = "Female")');
        end;
        if ( FromDOB.Date > 0 ) and  ( ToDOB.Date > 0 ) then
           qWeighing.SQL.Add('AND ( A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromDOB.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDOB.Date) + '''' + ')')
        else if ( FromDOB.Date > 0 ) and  ( ToDOB.Date <= 0 ) then
           qWeighing.SQL.ADD(' AND (A.DateOfBirth >= ' + '''' + FormatDateTime(cUSDateStyle, FromDOB.Date) + '''' + ')')
        else if ( FromDOB.Date <= 0 ) and  ( ToDOB.Date > 0 ) then
           qWeighing.SQL.ADD(' AND (A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle, ToDOB.Date) + '''' + ')');
        qWeighing.ExecSQL;


        //Look for Weighing Events
        GenQuery.SQL.Clear;
        GenQuery.SQL.Add('INSERT INTO tWeighingRecords (AnimalID,WeighingDate, Weight, WeighDesc)');
        GenQuery.SQL.Add('Select E.AnimalID, E.EventDate, W.Weight, E.EventDesc ');
        GenQuery.SQL.Add('From Events E, Weights W');
        GenQuery.SQL.Add('Where (W.EventID = E.ID)');
        GenQuery.SQL.Add('And (E.AnimalID IN (SELECT DISTINCT(AnimalID) FROM tWeighing )) ');
        if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date > 0 ) then
           GenQuery.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToWtDate.Date) + '''' + ')')
        else if ( FromWtDate.Date > 0 ) and  ( ToWtDate.Date <= 0 ) then
           GenQuery.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromWtDate.Date) + '''' + ')')
        else if ( FromWtDate.Date <= 0 ) and  ( ToWtDate.Date > 0 ) then
           GenQuery.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToWtDate.Date) + '''' + ')');
        GenQuery.ExecSQL;

        GenQuery.SQL.Clear;
        GenQuery.SQL.Add('Delete From tWeighing where not    ');
        GenQuery.SQL.Add('  AnimalID in ( Select Distinct(AnimalId) From tWeighingRecords )');
        GenQuery.ExecSQL;

        WeighingsTable.Refresh; // Refresh table contents.

        //Now to add in all Events
        With MyTable do
           MyTable.First;
           MyTable.Edit;
           While NOT MyTable.EOF do
              Begin
                 MyTable.Edit;
                 //Look for  ANY Purchase Events
                 GenQuery.SQL.Clear;
                 GenQuery.SQL.Add('SELECT E.EventDate AS PurchDate, P.MeasuredWtDate AS PurchMeasuredWtDt, P.Weight AS PurchWeight,');
                 GenQuery.SQL.Add('       P.MeasuredWeight AS PurchMeasuredWt, P.Price, E.EventDesc AS PurchDesc,');
                 GenQuery.SQL.Add('       B.Name BuyerName, S.Name SupplierName     ');
                 GenQuery.SQL.Add('FROM Events E, Purchases P');
                 GenQuery.SQL.Add('LEFT JOIN SuppliersBreeders S ON (P.Supplier=S.ID)');
                 GenQuery.SQL.Add('LEFT JOIN Buyers B ON (P.Buyer=B.ID)');
                 GenQuery.SQL.Add('WHERE (P.EventID = E.ID)');
                 GenQuery.SQL.Add('AND (E.AnimalID = ' + '''' + MyTable.FieldByName('AnimalID').AsString + '''' + ')');
                 GenQuery.SQL.Add('AND (E.EventType = ' + IntToStr(CPurchaseEvent) + ')');  //Event Type = Purchase
                 if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date > 0 ) then
                    GenQuery.SQL.Add('AND ( E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle, FromPurchDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle, ToPurchDate.Date) + '''' + ')')
                 else if ( FromPurchDate.Date > 0 ) and  ( ToPurchDate.Date <= 0 ) then
                    GenQuery.SQL.ADD(' AND (E.EventDate >= ' + '''' + FormatDateTime(cUSDateStyle, FromDOB.Date) + '''' + ')')
                 else if ( FromPurchDate.Date <= 0 ) and  ( ToPurchDate.Date > 0 ) then
                    GenQuery.SQL.ADD(' AND (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle, ToDOB.Date) + '''' + ')');
                 GenQuery.Open;

                 MyTable.FieldByName('PurchDate').AsDateTime := GenQuery.FieldByName('PurchDate').AsDateTime;
                 MyTable.FieldByName('PurchMeasuredWtDt').AsDateTime := GenQuery.FieldByName('PurchMeasuredWtDt').AsDateTime;
                 MyTable.FieldByName('PurchWeight').AsFloat := GenQuery.FieldByName('PurchWeight').AsFloat;
                 MyTable.FieldByName('PurchMeasuredWt').AsFloat := GenQuery.FieldByName('PurchMeasuredWt').AsFloat;
                 MyTable.FieldByName('PurchDesc').AsString := GenQuery.FieldByName('PurchDesc').AsString;
                 MyTable.FieldByName('Price').AsFloat := GenQuery.FieldByName('Price').AsFloat;
                 MyTable.FieldByName('BuyerName').AsString := GenQuery.FieldByName('BuyerName').AsString;
                 MyTable.FieldByName('SupplierName').AsString := GenQuery.FieldByName('SupplierName').AsString;

                 MyTable.Post;
                 MyTable.Next;
              end;  //EndWhile NOT MyTable.EOF do

        WeighingsTable.MasterSource := dsMaster;
        WeighingsTable.MasterFields := 'AnimalID';
        WeighingsTable.IndexName := 'iAnimalIDWeighingDate';

        //Now to extract those records from MyTable that we need.
        qReport.SQL.Clear;
        qReport.SQL.Add('SELECT DISTINCT AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatIDNum,');
        qReport.SQL.Add('                DateOfBirth, Sex, BirthWeight, HerdIdentity, PurchDate,');
        qReport.SQL.Add('                PurchMeasuredWtDt, PurchWeight, PurchMeasuredWt, PurchDesc,');
        qReport.SQL.Add('                SupplierName, BuyerName, BCode, DamNumber');
        qReport.SQL.Add('FROM tWeighing');
        if (rgNumSelect.ItemIndex = 0) AND (rgSortBy.ItemIndex = 0) then //SP To sort by Tag num
           begin
              // Order By SortNatIDNum
              qReport.SQL.Add('ORDER BY SortNatIDNum');
              SortLabel.Caption := 'Ordered By National ID Number';
           end
        else if (rgNumSelect.ItemIndex = 1) AND (rgSortBy.ItemIndex = 0) then
           Begin
              // Order By SortAnimal
              qReport.SQL.Add('ORDER BY SortAnimalNo ');
              SortLabel.Caption := 'Ordered By Animal Number';
            end
        else if (rgSortBy.ItemIndex = 1) then
           begin
              // Order By DateOfBirth
              qReport.SQL.Add('ORDER BY DateOfBirth ');
              SortLabel.Caption := 'Ordered By Date Of Birth';
           end;

        if rgSortOrder.ItemIndex = 0 Then
           begin
              // Sort By ASC
              qReport.SQL.Add('Asc');
              OrderLabel.Caption := 'In Ascending Order';
           end
        else
           begin
              // Sort By DESC
              qReport.SQL.Add('Desc');
              OrderLabel.Caption := 'In Descending Order';
           end;

        qReport.Open;

     finally
        //
     end;
end;

procedure TfWeighingFilt.sbViewClick(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;
   sbView.Enabled := False;
   sbPrint.Enabled := False;

   try
      with WeighingRep do
         begin
            If rgNumSelect.ItemIndex = 0 then
               Begin
                  lNumber.Caption := 'Nat. Id. No.:';
                  dbNumber.DataSet := qReport;
                  dbNumber.DataField := 'NatIDNum';
               End
            Else
               Begin
                  lNumber.Caption := 'Animal No.:';
                  dbNumber.DataSet := qReport;
                  dbNumber.DataField := 'AnimalNo';
               End;

            BuildWeighing;    // Calls Procedure to build the report

            WinData.cxHint.HideHint;

            If ( qReport.RecordCount > 0 ) then
               Begin
                  if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                     with WeighingRep do     // View Report
                        Begin
                           WeighingDetail.Font.Color := clNavy;
                           RptTitle.Font.Color := clRed;
                           WeighingRep.Preview;
                           OutputIntervalSummary;
                        End
                  else
                     with WeighingRep do     // Print Report
                        begin
                           WeighingDetail.Font.Color := clBlack;
                           RptTitle.Font.Color := clBlack;
                           Windata.CallPrintDialog(WeighingRep);
                        end;
               End
            Else
               MessageDlg('No records have been selected for printing. Please try again.',mtInformation, [mbOK],0);
           end;
   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TfWeighingFilt.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   try
      with MyTable do
         begin
            //Animals.db
            FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
            FieldDefs.Add('AnimalNo',ftString,10,FALSE);
            FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
            FieldDefs.Add('NatIDNum',ftString,20,FALSE);
            FieldDefs.Add('SortNatIDNum',ftString,20,FALSE);
            FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
            FieldDefs.Add('Sex',ftString,10,FALSE);
            FieldDefs.Add('BirthWeight',ftFloat,0,FALSE);
            FieldDefs.Add('HerdIdentity',ftString,15,FALSE);    //Not yet used
            FieldDefs.Add('SireName',ftString,40,FALSE);     //Not yet used
            FieldDefs.Add('DamName',ftString,40,FALSE);     //Not yet used
            FieldDefs.Add('GeneticDamName',ftString,40,FALSE);     //Not yet used
            FieldDefs.Add('DamNumber',ftString,25,FALSE); { NatId or Animal No}
            FieldDefs.Add('BCode',ftString,6,FALSE);

            //Events.db + Purchases.db
            FieldDefs.Add('PurchDate',ftDate,0,FALSE);
            FieldDefs.Add('PurchMeasuredWtDt',ftDate,0,FALSE);
            FieldDefs.Add('PurchWeight',ftFloat,0,FALSE);
            FieldDefs.Add('PurchMeasuredWt',ftFloat,0,FALSE);
            FieldDefs.Add('PurchDesc',ftString,30,FALSE);
            FieldDefs.Add('SupplierName',ftString,30,FALSE);  //Not yet used
            FieldDefs.Add('BuyerName',ftString,30,FALSE);     //Not yet used
            FieldDefs.Add('Price',ftFloat);     //Not yet used
            CreateTable;
            Open;
         end;

      with WeighingsTable do
         begin
            CreateTable;
            Open;
         end;

    except
       Raise Exception.Create('Cannot create table, close program and reboot');
    end;

//   if WinData.ActiveFilter then
      cbUseFilters.Checked := WinData.ActiveFilter;
   WeighingRep.Hide;   //Hides report from screen
end;

procedure TfWeighingFilt.WeighingDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   // Check whether there is sufficient room to print Group Band plus one Detail Band
   If ((WeighingDetail.Height) > (WeighingRep.Height - (WeighingRep.Page.TopMargin + WeighingRep.Page.BottomMargin + PageFooterBand1.Height + WeighingRep.CurrentX))) then
      WeighingDetail.ForceNewPage := True
   Else
      WeighingDetail.ForceNewPage := False;
end;

procedure TfWeighingFilt.ToDOBEnter(Sender: TObject);
begin
    if ToDOB.Date < FromDOB.Date then
       if FromDOB.Date > 0 then
          ToDOB.Date := FromDOB.Date;
end;

procedure TfWeighingFilt.ToWtDateEnter(Sender: TObject);
begin
    if ToWtDate.Date < FromWtDate.Date then
       if FromWtDate.Date > 0 then
          ToWtDate.Date := FromWtDate.Date;
end;

procedure TfWeighingFilt.FormActivate(Sender: TObject);
var
  pt : TPoint;
begin
   // set the Default Herd Into the Combo Box
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);

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

procedure TfWeighingFilt.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('InterWeighing.htm');
end;

procedure TfWeighingFilt.BlankCaptions;
begin

end;

procedure TfWeighingFilt.FormDestroy(Sender: TObject);
begin
   if MyTable <> nil then
      with MyTable do
         begin
            if Active then
               Active := False;
            DeleteTable;
            Free;
        end;
   if WeighingsTable <> nil then
      with WeighingsTable do
         begin
            if Active then
               Active := False;
            DeleteTable;
        end;
   SaveScreenDefaults;
end;

procedure TfWeighingFilt.LoadScreenDefaults;
begin
   WeighingDefaults := TWeighingDefaults.Create(cRD_WeighingReport);
   try
      cbLeftHerd.Checked := WeighingDefaults.IncludeLeftHerd;
      rgReportOn.ItemIndex := WeighingDefaults.ReportOn;
      rgNumSelect.ItemIndex := WeighingDefaults.IdentityField;
      ToDOB.Date := Date;
      if WeighingDefaults.DOBInterval > 0 then
         FromDOB.Date := Trunc(Date - WeighingDefaults.DOBInterval);
      ToPurchDate.Date := Date;
      if WeighingDefaults.PurchaseInterval > 0 then
         FromPurchDate.Date := Trunc(Date - WeighingDefaults.PurchaseInterval);
      ToWtDate.Date := Date;
      if WeighingDefaults.WeighingInterval > 0 then
         FromWtDate.Date := Trunc(Date - WeighingDefaults.WeighingInterval);
      rgSortBy.ItemIndex := WeighingDefaults.SortField;
      rgSortOrder.ItemIndex := WeighingDefaults.SortOrder;
   finally
      FreeAndNil(WeighingDefaults);
   end;

end;

procedure TfWeighingFilt.SaveScreenDefaults;
begin
   WeighingDefaults := TWeighingDefaults.Create(cRD_WeighingReport);
   try
      WeighingDefaults.IncludeLeftHerd := cbLeftHerd.Checked;
      WeighingDefaults.ReportOn := rgReportOn.ItemIndex;
      WeighingDefaults.IdentityField := rgNumSelect.ItemIndex;
      if ( ToDOB.Date > 0 ) and ( FromDOB.Date > 0 ) then
         WeighingDefaults.DOBInterval := Trunc(ToDOB.Date - FromDOB.Date);

      if ( ToPurchDate.Date > 0 ) and ( FromPurchDate.Date > 0 ) then
         WeighingDefaults.PurchaseInterval := Trunc(ToPurchDate.Date - FromPurchDate.Date);

      if ( ToWtDate.Date > 0 ) and ( FromWtDate.Date > 0 ) then
         WeighingDefaults.WeighingInterval := Trunc(ToWtDate.Date - FromWtDate.Date);

      WeighingDefaults.SortField := rgSortBy.ItemIndex;
      WeighingDefaults.SortOrder := rgSortOrder.ItemIndex;
   finally
      FreeAndNil(WeighingDefaults);
   end;
end;

procedure TfWeighingFilt.FormShow(Sender: TObject);
begin
   LoadScreenDefaults;
end;

procedure TfWeighingFilt.WeighingRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

   if cbUseFilters.Checked then
      qrUsingFilters.Caption := '(Using Animal Grid Filter)'
   else
      qrUsingFilters.Caption := '';
   SetLength(WeighingIntArray, 0);
end;

procedure TfWeighingFilt.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   LastWeight : Double;
   LastDate : TDateTime;
   WeighGain : Double;
   GainPerDay : Double;
   NumDays : Integer;
   Intervals : Integer;
begin
   LastWeight := 0;
   LastDate   := 0;
   WeighGain  := 0;
   GainPerDay := 0;
   NumDays    := 0;

   if ( qReport.FieldByName('PurchDate').AsDateTime > 0 ) then
      begin
         lDOB.Caption := 'Purchase Date:';
         lWeight.Caption := 'Purchase Weight:';
         PurchDate.Enabled := True;
         PurchWeight.Enabled := True;
         DOBDisplayDate.Enabled := False;
         DOBDisplayWeight.Enabled := False;
         WeighingDetail.Height := 42;
      end
   else
      begin
         lDOB.Caption := 'Date Of Birth:';
         lWeight.Caption := 'Birth Weight:';
         PurchDate.Enabled := False;
         PurchWeight.Enabled := False;
         DOBDisplayDate.Enabled := True;
         DOBDisplayWeight.Enabled := True;
         WeighingDetail.Height := 24;
      end;

   Intervals := 0;
   WeighingsTable.First;
   if WeighingsTable.RecordCount > 0 then
      begin
         repeat
            Inc(Intervals);
            if Intervals > Length(WeighingIntArray) then
               begin
                  SetLength(WeighingIntArray, Intervals);
                  FillChar(WeighingIntArray[Intervals-1], SizeOf(TWeighingIntervalRec), 0);
               end;

            if Intervals = 1 then
               begin
                  if ( qReport.FieldByName('PurchDate').AsDateTime > 0 ) then
                     begin
                        LastDate := qReport.FieldByName('PurchDate').AsDateTime;
                        LastWeight := qReport.FieldByName('PurchWeight').AsFloat;
                     end
                  else
                     begin
                        LastDate := qReport.FieldByName('DateOfBirth').AsDateTime;
                        LastWeight := qReport.FieldByName('BirthWeight').AsFloat;
                     end;

                  WeighGain := ( WeighingsTable.FieldByName('Weight').AsFloat - LastWeight );
                  NumDays := Trunc( WeighingsTable.FieldByName('WeighingDate').AsDateTime - LastDate );
                  try
                     GainPerDay := WeighGain / NumDays;
                  except
                  end;
               end
            else
               begin
                  WeighGain := WeighingsTable.FieldByName('Weight').AsFloat - LastWeight;
                  NumDays := Trunc( WeighingsTable.FieldByName('WeighingDate').AsDateTime - LastDate );
                  try
                     GainPerDay := WeighGain / NumDays;
                  except
                  end;
               end;

            WeighingIntArray[Intervals-1].TotAnimals := WeighingIntArray[Intervals-1].TotAnimals+1;
            WeighingIntArray[Intervals-1].TotalWeighGain := WeighingIntArray[Intervals-1].TotalWeighGain + WeighGain;
            WeighingIntArray[Intervals-1].TotalGainPerDay := WeighingIntArray[Intervals-1].TotalGainPerDay + GainPerDay;
            WeighingIntArray[Intervals-1].TotalNumDays := WeighingIntArray[Intervals-1].TotalNumDays + NumDays;

            // Set the Interval number of Days since
            WeighingsTable.Edit;
            WeighingsTable.FieldByName('WeightGain').AsFloat := WeighGain;
            WeighingsTable.FieldByName('GainPerDay').AsFloat := GainPerDay;
            WeighingsTable.FieldByName('NoDays').AsInteger := NumDays;
            WeighingsTable.Post;

            LastDate := WeighingsTable.FieldByName('WeighingDate').AsDateTime;
            LastWeight := WeighingsTable.FieldByName('Weight').AsFloat;

            // only include end weights when selecting the weighing intervals.
            WeighingIntArray[Intervals-1].TotalWeight := WeighingIntArray[Intervals-1].TotalWeight + LastWeight;

            WeighingsTable.Next;
         until
            WeighingsTable.eof
   end;
end;

procedure TfWeighingFilt.OutputIntervalSummary;
begin
   QRLoopBand1.PrintCount := Length(WeighingIntArray);
   IntervalAnalysisRpt.Preview;
end;

procedure TfWeighingFilt.QRLoopBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   TotalAnimals : Integer;
begin
   qrIntervalIndex.Caption := IntToStr(QRLoopBand1.Count+1);
   TotalAnimals := WeighingIntArray[QRLoopBand1.Count].TotAnimals;
   qrTotalAnimalsInInterval.Caption := IntToStr(WeighingIntArray[QRLoopBand1.Count].TotAnimals);
   qrAverageWeight.Caption := FloatToStrF(WeighingIntArray[QRLoopBand1.Count].TotalWeight / TotalAnimals, ffFixed, 8, 2);
   qrAverageWeightGain.Caption := FloatToStrF(WeighingIntArray[QRLoopBand1.Count].TotalWeighGain / TotalAnimals, ffFixed, 8, 2);
   qrAverageGainPerDay.Caption := FloatToStrF(WeighingIntArray[QRLoopBand1.Count].TotalGainPerDay / TotalAnimals, ffFixed, 8, 2);
   qrAverageDaysToWeighing.Caption := IntToStr(Trunc(WeighingIntArray[QRLoopBand1.Count].TotalNumDays / TotalAnimals ));
end;


procedure TfWeighingFilt.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTotalIntervals.Caption := IntToStr(Length(WeighingIntArray));
end;

procedure TfWeighingFilt.IntervalAnalysisRptAfterPreview(Sender: TObject);
begin
   SetLength(WeighingIntArray, 0);
end;

procedure TfWeighingFilt.PageFooterBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   VerLabel2.Caption := 'Herd Management ' + HerdVerNo;

end;

procedure TfWeighingFilt.qrsdWeighingRecordsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := WeighingsTable.FieldByName('WeighingDate').AsDateTime > 0;
end;

procedure TfWeighingFilt.cbUseFiltersClick(Sender: TObject);
begin
   if cbUseFilters.Checked then
      begin
         if not WinData.ActiveFilter then
            cbUseFilters.State := cbUnchecked
         else
            cbUseFilters.Font.Color := clRed
      end
   else
      cbUseFilters.Font.Color := clBlack;
end;

procedure TfWeighingFilt.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

end.
