{
------------------------------------------------------------------------------
    SP 01/10/2002:-

    Change grids. Main/Milk Trans Grids.

    Added: Averages
           Totals

    Modified: Milk Disk Review Report
              Averages, Totals and Font postions and font colours etc.

    SP 01/10/2002.
------------------------------------------------------------------------------
   10/11/10 [V4.0 R5.6] /MK Additional Feature - If Animal Grid Filter Applied then Only Show Animals In Filter On Grid/Report
                                               - If Animal Grid Filter Applied Show pAnimalGridFilterApplied.
                                               - Changed Grid.DisplayFormat of DailyYield, DailyBFat, DailyProt, CumBFat, CumProt to 0.0 instead of #.##.
                                               - Changed Report.Mask of DailyYield, DailyBFat, DailyProt, CumBFat, CumProt to 0.0 instead of #.##.

   19/04/11 [V4.0 R9.8] /MK Additional Feature - When Summing Values For Footer Check For Filtered Animals In SQL.

   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.


   18/05/12 [V5.0 R5.9] /MK Additional Feature - Added Calc Fields For Solids And Total Solids In Daily And Cummulative.

   28/05/12 [V5.0 R6.0] /MK Bug Fix - Removed Sorting For Calc Fields As Calc Fields On Current Grid Cannot Be Sorted
                                    - Might Need To Change Grid to cxGrid.

   28/05/12 [V5.0 R6.0] /MK Additional Feature - Add Footers For New Calc Fields.

   06/06/12 [V5.0 R6.0] /MK Change - Changed Grid.DisplayFormat of DailyYield, DailyBFat, DailyProt, CumBFat, CumProt to 0.00 instead of 0.0
                                   - Request By GL From David Allen.

   03/01/13 [V5.1 R3.6] /MK Bug Fix - MilkDiskReview Report shows 1 decimal place for BFat and Prot where they should always be 2 decimals.   
}

unit uMilkDiskReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, ExtCtrls,DBTables,DB,
  ComCtrls, RXCtrls, ToolWin, IniFiles, Qrctrls, QuickRpt,
  DBGridEh, QRExport, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxControls,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxContainer, cxEdit,
  cxLabel, cxCheckBox;

type
  TfMilkDiskReview = class(TForm)
    qMainMilk: TQuery;
    dsMDT: TDataSource;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    qMilkTrans: TQuery;
    dsMilkTrans: TDataSource;
    sbPrint: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbPreview: TRxSpeedButton;
    qMilkTransID: TIntegerField;
    qMilkTransMDTID: TIntegerField;
    qMilkTransAnimalID: TIntegerField;
    qMilkTransAnimalCode: TStringField;
    qMilkTransLactNo: TSmallintField;
    qMilkTransHerdNumber: TStringField;
    qMilkTransDateofRecording: TDateField;
    qMilkTransDailyYield: TFloatField;
    qMilkTransDailyBfatPerc: TFloatField;
    qMilkTransDailyProtPerc: TFloatField;
    qMilkTransDailyLactPerc: TFloatField;
    qMilkTransSCC: TSmallintField;
    qMilkTransCumYield: TFloatField;
    qMilkTransCumBfatPerc: TFloatField;
    qMilkTransCumProtPerc: TFloatField;
    qMilkTransCumLactPerc: TFloatField;
    qMilkTransNoOfRecordings: TSmallintField;
    qMilkTransDaysInMilk: TSmallintField;
    qMilkTransEventType: TIntegerField;
    qMilkTransEventDate: TDateField;
    qMilkTransYield305: TFloatField;
    qMilkTransBfat305Perc: TFloatField;
    qMilkTransProt305Perc: TFloatField;
    qMilkTransLact305Perc: TFloatField;
    qMilkTransNMRRecording: TBooleanField;
    MilkTrans: TDBGridEh;
    MainMilkTrans: TDBGridEh;
    Splitter1: TSplitter;
    ToolButton4: TToolButton;
    MilkDiskReview: TQuickRep;
    MDRHeader: TQRBand;
    HeadCaption: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    AN: TQRLabel;
    SomaticCC: TQRLabel;
    LN: TQRLabel;
    DY: TQRLabel;
    DBP: TQRLabel;
    DIM: TQRLabel;
    DPP: TQRLabel;
    CPP: TQRLabel;
    CBFP: TQRLabel;
    CY: TQRLabel;
    MDRDetail: TQRSubDetail;
    AnimalNo: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    MDRFooter: TQRBand;
    QRLabel34: TQRLabel;
    PremVerLabel: TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    MilkTransGridLevel: TcxGridLevel;
    MilkTransGrid: TcxGrid;
    MilkTransGridDBBandedTableView: TcxGridDBBandedTableView;
    MilkTransGridDBBandedTableViewID: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewMDTID: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewAnimalID: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewAnimalCode: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewLactNo: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewHerdNumber: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewDateofRecording: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewDailyYield: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewDailyBfatPerc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewDailyProtPerc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewDailyLactPerc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewSCC: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewCumYield: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewCumBfatPerc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewCumProtPerc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewCumLactPerc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewNoOfRecordings: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewDaysInMilk: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewEventType: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewEventDate: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewYield305: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewBfat305Perc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewProt305Perc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewLact305Perc: TcxGridDBBandedColumn;
    MilkTransGridDBBandedTableViewNMRRecording: TcxGridDBBandedColumn;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    pAnimalGridFilterApplied: TPanel;
    ToolButton8: TToolButton;
    pFavourite: TPanel;
    cbFavourite: TcxCheckBox;
    qMilkTransDailyBFatKgs: TFloatField;
    qMilkTransDailyProtKgs: TFloatField;
    qMilkTransDailyTotalSolids: TFloatField;
    qMilkTransCumBFatKgs: TFloatField;
    qMilkTransCumProtKgs: TFloatField;
    qMilkTransCumTotalSolids: TFloatField;
    procedure ExitButtonClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure MainMilkTrans2CellClick(Column: TColumn);
    procedure MilkTransTitleClick(Column: TColumnEh);
    procedure qMainMilkAfterScroll(DataSet: TDataSet);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qMilkTransCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    OrderBy,
    LastOrderBy,
    LastSortByField : String;
    procedure SetUpTransQuery(SortBy:String);
    function GetSortByField : String;
    procedure SetFields;
    procedure SetSortByField ( Value : String );
    procedure CalcWeightedAverages;
  public
    { Public declarations }
    property SortByField : String read GetSortByField write SetSortByField;
  end;

  procedure AddTrace(ALine : string);

var
   TraceStack : TStringList;

  procedure CreateAndShow;

implementation
uses
    QRExtra,
    GenTypesConst,
    DairyData;

{$R *.DFM}

procedure AddTrace(ALine : string);
begin

   if TraceStack = nil then
      TraceStack := TStringList.Create;
   TraceStack.Add(FormatDateTime('hh:nn:ss', now)+ ' : ' +ALine);
   TraceStack.SaveToFile('C:\kingswood herd management\trace.dat');
end;

procedure CreateAndShow;
begin
//   AddTrace('init form create()');

     with TfMilkDiskReview.Create(nil) Do
        try
           pAnimalGridFilterApplied.Visible := WinData.ActiveFilter;

//           AddTrace('form create() success');
           MilkDiskReview.Hide;
//           AddTrace('rpt prepare');
           qMainMilk.Open;
//           AddTrace('activate query');

           CalcWeightedAverages;
//           AddTrace('init calcs');
           OrderBy := '';
           SortByField := '';
//           AddTrace('show form');
           ShowModal;
        finally
           qMainMilk.Close;
           Free;
           FreeAndNil(TraceStack);
        end;
end;

function TfMilkDiskReview.GetSortByField : String;
begin
    RESULT := LastSortByField;
end;

procedure TfMilkDiskReview.SetSortByField ( Value : String );
var i : Integer;
begin
//   AddTrace('SetSortByField()');

   if Value <> LastSortByField then
      begin
         LastSortByField := Value;
         SetUpTransQuery ( LastSortByField );
      end
   else // Change the Sort Order
      begin
         if OrderBy = 'Asc' then
            OrderBy := 'Desc'
         else
            OrderBy := 'Asc';
//          AddTrace('SetUpTransQuery');
         SetUpTransQuery ( LastSortByField );
      end;

//   AddTrace('Sort Column Markers');
   for i := 0 to MilkTrans.Columns.Count-1 do
      if ( LastSortByField = MilkTrans.Columns[i].Field.FieldName ) then
         if OrderBy = 'Asc' then
            MilkTrans.Columns[i].Title.SortMarker := smDownEh
         else
            MilkTrans.Columns[i].Title.SortMarker := smUpEh;
//   AddTrace('SetSortByField.SetFields.begin');
   SetFields;
//   AddTrace('SetSortByField.SetFields.end');
end;

procedure TfMilkDiskReview.SetUpTransQuery ( SortBy : String );
begin
   with qMilkTrans do
      begin
         PremVerLabel.Caption := 'Herd Management ' + HerdVerNo;
         SQL.Clear;
         SQL.Add('SELECT A.SortAnimalNo, M.* FROM MilkDiskTrans M');
         SQL.Add('LEFT JOIN Animals A on (M.AnimalID=A.ID)');
         SQL.Add('WHERE (MDTID=:ID)');

         if WinData.FilteredAnimals.RecordCount > 0 then
            begin
                SQL.Add('AND A.ID IN (SELECT AF.AID FROM AFILTERS AF)');
            end;

         if (SortBy = '') or (SortBy = 'AnimalCode') then
            SQL.Add('ORDER BY SortAnimalNo ' + OrderBy)
         else
            SQL.Add('ORDER BY ' + SortBy + ' ' + OrderBy );
//         AddTrace('Activate db query ' + SQL.Text);
         Open;
      end;
//   AddTrace('SetUpTransQuery.SetFields');
   SetFields;
end;

procedure TfMilkDiskReview.ExitButtonClick(Sender: TObject);
begin
     Close;
end;


procedure TfMilkDiskReview.sbPrintClick(Sender: TObject);
begin
    try
       if (Sender as TRxSpeedButton).Name = 'sbPreview' then
          MilkDiskReview.Preview
       else
          Windata.CallPrintDialog(MilkDiskReview);
          // end;
    finally
       //
    end;
end;

procedure TfMilkDiskReview.SetFields;
begin
   // SP 07/11/2001 Hide the Lactation column if the Recording came directly from IDRC Import program.
   // This is done because the import doesn't use the proper LactNo's, uses the current LactNo, which the
   // user doesn't need. Show if the Recording came from milkdisk.
//   AddTrace('SetFields.begin');
   {try
      if Copy(MainMilkTrans.Columns[0].Field.Value,1,4) = 'IDRC' then
         MilkTrans.Columns[1].Visible := True
      else
         MilkTrans.Columns[1].Visible := False;
   except
      on e : exception do
         raise Exception.Create(E.Message);
   end;}
//   AddTrace('SetFields.end');
end;

procedure TfMilkDiskReview.MainMilkTrans2CellClick(Column: TColumn);
begin
   SetFields;
end;

procedure TfMilkDiskReview.MilkTransTitleClick(Column: TColumnEh);
begin
   //   28/05/12 [V5.0 R6.0] /MK Bug Fix - Removed Sorting For Calc Fields As Calc Fields On Current Grid Cannot Be Sorted
   //                                    - Might Need To Change Grid to cxGrid.
   if not( (Column.Field.FieldName = 'DailyBFatKgs') or (Column.Field.FieldName = 'DailyProtKgs') or
           (Column.Field.FieldName = 'DailyTotalSolids') or (Column.Field.FieldName = 'CumBFatKgs') or
           (Column.Field.FieldName = 'CumProtKgs') or (Column.Field.FieldName = 'CumTotalSolids') ) then
   SortByField := Column.Field.FieldName;
end;

procedure TfMilkDiskReview.CalcWeightedAverages;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('Select SUM((M.DailyBfatPerc / 100) * M.DailyYield) / SUM(M.DailyYield) * 100 M.DAILYBFATYIELD,');
         SQL.Add('       SUM((M.DailyProtPerc / 100) * M.DailyYield) / SUM(M.DailyYield) * 100 M.DAILYPROTYIELD,');
         SQL.Add('       SUM((M.CumBfatPerc / 100) * M.CumYield) / SUM(M.CumYield) * 100 M.CUMBFATYIELD,');
         SQL.Add('       SUM((M.CumProtPerc / 100) * M.CumYield) / SUM(M.CumYield) * 100 M.CUMPROTYIELD');
         SQL.Add('FROM MilkDiskTrans M');
         SQL.Add('WHERE M.MDTID = :ID');

         if WinData.FilteredAnimals.RecordCount > 0 then
            begin
                SQL.Add('AND M.AnimalID IN (SELECT AF.AID FROM AFILTERS AF)');
            end;

         Params[0].AsInteger := qMainMilk.FieldByName('ID').AsInteger;
         Open;
         try
            First;
            MilkTrans.Columns[4].Footers[0].Value := FormatFloat('0.00', FieldByName('DAILYBFATYIELD').AsFloat);
            MilkTrans.Columns[5].Footers[0].Value := FormatFloat('0.00', FieldByName('DAILYPROTYIELD').AsFloat);

            MilkTrans.Columns[9].Footers[0].DisplayFormat := '#';
            MilkTrans.Columns[10].Footers[0].Value := FormatFloat('0.00', FieldByName('CUMBFATYIELD').AsFloat);
            MilkTrans.Columns[11].Footers[0].Value := FormatFloat('0.00', FieldByName('CUMPROTYIELD').AsFloat);
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfMilkDiskReview.qMainMilkAfterScroll(DataSet: TDataSet);
begin
   CalcWeightedAverages;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfMilkDiskReview.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cMonthRecReviewRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cMonthRecReviewRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfMilkDiskReview.FormShow(Sender: TObject);
begin
   cbFavourite.Checked := WinData.IsReportFavourite(cMonthRecReviewRep);
   WinData.UpdateRecentReportUsage(cMonthRecReviewRep);
end;

//   18/05/12 [V5.0 R5.9] /MK Additional Feature - Added Calc Fields For Solids And Total Solids In Daily And Cummulative.
procedure TfMilkDiskReview.qMilkTransCalcFields(DataSet: TDataSet);
begin
   if qMilkTrans.FieldByName('DailyBfatPerc').AsFloat > 0 then
      qMilkTransDailyBfatKgs.Value := ((qMilkTrans.FieldByName('DailyBfatPerc').AsFloat / 100 ) * (qMilkTrans.FieldByName('DailyYield').AsFloat));

   if qMilkTrans.FieldByName('DailyProtPerc').AsFloat > 0 then
      qMilkTransDailyProtKgs.Value := ((qMilkTrans.FieldByName('DailyProtPerc').AsFloat / 100 ) * (qMilkTrans.FieldByName('DailyYield').AsFloat));

   qMilkTransDailyTotalSolids.Value := (qMilkTransDailyBfatKgs.Value + qMilkTransDailyProtKgs.Value);

   if qMilkTrans.FieldByName('CumBfatPerc').AsFloat > 0 then
      qMilkTransCumBFatKgs.Value :=  ((qMilkTrans.FieldByName('CumBfatPerc').AsFloat / 100 ) * (qMilkTrans.FieldByName('CumYield').AsFloat));

   if qMilkTrans.FieldByName('CumProtPerc').AsFloat > 0 then
      qMilkTransCumProtKgs.Value := ((qMilkTrans.FieldByName('CumProtPerc').AsFloat / 100 ) * (qMilkTrans.FieldByName('CumYield').AsFloat));

   qMilkTransCumTotalSolids.Value := (qMilkTransCumBFatKgs.Value + qMilkTransCumProtKgs.Value);
end;

end.
