{
   31/01/11 [V4.0 R7.9] /MK Bug Fix - Fixed Bug Where Report Does Not Look At AFilters.db.

   24/11/11 [V5.0 R2.2] /MK Additional Feature - Added New Sort By Condition Score.

   31/01/12 [V5.0 R3.6] /MK Change - Added Last 4 Condition Scores To The Report - Added Last Dates To Heading On Report.

   05/10/16 [V5.5 R9.9] /MK Bug Fix - LoadReportData - Only post if table is in Insert or Edit Mode.
                                    - PageHeaderBandBeforePrint - Fixed up interval where date 1 was greater than date 2, date 2 was greater than date 3 and so on.
                            Change - Change mask of CScore1, 2, 3 & 4 on repot to #.00 so 2 decimal place always show - Eddie Jordan/GL.

   10/10/16 [V5.6 R0.8] /MK Change - Changed report so that all dates and scores show for each animal - Eddie Jordan/GL.

   27/11/18 [V5.8 R5.5] /MK Additional Feature - Added Associated Event fields to temp table.
                                               - Added first letter of associated event to DateScore string on report.
                                               - Had to make DateScore report labels bigger to accommodate new associate event single character. 
                                               - Added Export To CSV button to Toolbar - Eddie Jordan.

   28/11/18 [V5.8 R5.5] /MK Bug Fix - LoadReportData - Never looked at what herd was selected in Herd Identity drop-down-box.
}

unit uConditionScoreReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, Db, DBTables, QRExport, QRCtrls, QuickRpt, StdCtrls,
  ComCtrls, ExtCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ToolWin,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxCurrencyEdit, cxCalendar, KRoutines, uHerdLookup, cxButtons;

type
  TfmConditionScoreReport = class(TReportsBaseForm)
    cxLabel9: TcxLabel;
    cmboCSPeriod: TcxComboBox;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    qrdbDateOfBirth: TQRDBText;
    QRDBText3: TQRDBText;
    lDateFrom: TcxLabel;
    lDateTo: TcxLabel;
    ceCondScoreFrom: TcxCurrencyEdit;
    ceCondScoreTo: TcxCurrencyEdit;
    lCondScoreFrom: TcxLabel;
    lCondScoreTo: TcxLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    deDateFrom: TcxDateEdit;
    deDateTo: TcxDateEdit;
    lHFltDateFrom: TQRLabel;
    lFltDateFrom: TQRLabel;
    lFltDateTo: TQRLabel;
    lHFltDateTo: TQRLabel;
    lHFltCondScoreTo: TQRLabel;
    lFltCondScoreFrom: TQRLabel;
    lHFltCondScoreFrom: TQRLabel;
    lFltCondScoreTo: TQRLabel;
    OldQuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel26: TQRLabel;
    QRBand3: TQRBand;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    OldQuickRep: TQuickRep;
    QRBand4: TQRBand;
    QRLabel29: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape2: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel57: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand6: TQRBand;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    qrdbDate_Score1: TQRDBText;
    qrdbDate_Score2: TQRDBText;
    qrdbDate_Score3: TQRDBText;
    qrdbDate_Score4: TQRDBText;
    qrlScore1AVG: TQRLabel;
    qrlScore2AVG: TQRLabel;
    qrlScore3AVG: TQRLabel;
    qrlScore4AVG: TQRLabel;
    qrlAVGScore: TQRLabel;
    btnExportToCSV: TcxButton;
    QRLabel60: TQRLabel;
    procedure sbViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrlScore1AVGPrint(sender: TObject; var Value: String);
    procedure btnExportToCSVClick(Sender: TObject);
  private
    procedure CheckReportData;
    { Private declarations }
  protected
    procedure SetupForm; override;
    procedure LoadReportData;override;
    procedure ViewReport;
  public
    { Public declarations }
    class procedure ShowReport;
  end;

var
  fmConditionScoreReport: TfmConditionScoreReport;

implementation
uses
   GenTypesConst, DairyData;

{$R *.DFM}

{ TReportsBaseForm1 }

procedure TfmConditionScoreReport.SetupForm;
begin
  inherited;
  with TempTable do
     begin
        TableName := 'tmpConditionScores';
        FieldDefs.Clear;
        FieldDefs.Add('Id', ftAutoInc);
        FieldDefs.Add('AnimalNo', ftString, 10);
        FieldDefs.Add('SortAnimalNo', ftString, 10);
        FieldDefs.Add('DateOfBirth', ftDate);
        FieldDefs.Add('LactNo', ftInteger);
        FieldDefs.Add('CSDate1',ftDateTime);
        FieldDefs.Add('CScore1',ftFloat);
        FieldDefs.Add('AssocEvent1',ftString,30);
        FieldDefs.Add('Date_Score1',ftString,20);
        FieldDefs.Add('CSDate2',ftDateTime);
        FieldDefs.Add('CScore2',ftFloat);
        FieldDefs.Add('AssocEvent2',ftString,30);
        FieldDefs.Add('Date_Score2',ftString,20);
        FieldDefs.Add('CSDate3',ftDateTime);
        FieldDefs.Add('CScore3',ftFloat);
        FieldDefs.Add('AssocEvent3',ftString,30);
        FieldDefs.Add('Date_Score3',ftString,20);
        FieldDefs.Add('CSDate4',ftDateTime);
        FieldDefs.Add('CScore4',ftFloat);
        FieldDefs.Add('AssocEvent4',ftString,30);
        FieldDefs.Add('Date_Score4',ftString,20);
        CreateTable;
     end;
end;

procedure TfmConditionScoreReport.sbViewClick(Sender: TObject);
begin
  inherited;
  deDateFrom.PostEditValue;
  deDateTo.PostEditValue;
  ViewReport;
end;

procedure TfmConditionScoreReport.LoadReportData;
var
   PrevAnimalId : Integer;
   RowCount : Integer;
begin
   inherited;
   TempTable.Close;
   TempTable.EmptyTable;
   TempTable.Open;

   if ( not(HerdLookup.mdConditionScoreAssociatedEvents.Active) ) then
      HerdLookup.mdConditionScoreAssociatedEvents.Active := True;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT A.ID AAnimalID, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth, A.LactNo,');
         SQL.Add('       E.AnimalId EAnimalId, E.EventDate,');
         SQL.Add('       CS.Score, CS.AssociatedEventType');
         SQL.Add('FROM Events E');
         SQL.Add('INNER JOIN Animals A on (A.Id=E.AnimalId)');
         SQL.Add('INNER JOIN ConditionScore CS ON (E.Id = CS.EventId) ');

         if cbUseFilter.Checked then
            SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');

         SQL.Add('WHERE (E.EventType=:EType)');

         if ( deDateFrom.Date > 0 ) And ( deDateTo.Date > 0 ) Then
            SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,deDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,deDateTo.Date) + '''' + ')')
         else if ( deDateFrom.Date > 0 ) and ( deDateTo.Date <= 0 ) Then
            SQL.Add('AND (E.EventDate > ' + '''' + FormatDateTime(cUSDateStyle,deDateFrom.Date) + '''' + ') ')
         else if ( deDateFrom.Date <= 0 ) and ( deDateTo.Date > 0 ) Then
            SQL.Add('AND (E.EventDate < ' + '''' + FormatDateTime(cUSDateStyle,deDateTo.Date) + '''' + ') ');

         if ( ceCondScoreFrom.Value <> 0 ) and ( ceCondScoreTo.Value <> 0 ) then
            SQL.Add('AND (CS.Score BETWEEN '+FloatToStr(ceCondScoreFrom.Value)+' And  '+FloatToStr(ceCondScoreTo.Value)+')');

         //   28/11/18 [V5.8 R5.5] /MK Bug Fix - Never looked at what herd was selected in Herd Identity drop-down-box.
         if ( cbHerdIdentity.Value <> '' ) and ( cbHerdIdentity.Value <> '0' ) then
            SQL.Add('AND (A.HerdID = '+cbHerdIdentity.Value+')');

         SQL.Add('ORDER BY E.AnimalId, E.EventDate ASC ');
         Params[0].AsInteger := CCondScoreEvent;

         Open;
         try
            First;

            InitProgress(0, RecordCount, 1, 'Please wait...');

            PrevAnimalId := 0;
            RowCount := 0;

            while ( not(Eof) ) do
               begin
                  if ( Fields[0].AsInteger <> PrevAnimalId ) then
                     begin
                        TempTable.Append;
                        TempTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                        TempTable.FieldByName('SortAnimalNo').AsString := FieldByName('SortAnimalNo').AsString;
                        TempTable.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                        TempTable.FieldByName('LactNo').AsInteger := FieldByName('LactNo').AsInteger;
                        TempTable.FieldByName('CSDate1').AsDateTime := FieldByName('EventDate').AsDateTime;
                        TempTable.FieldByName('CScore1').AsFloat := FieldByName('Score').AsFloat;
                        TempTable.FieldByName('Date_Score1').AsString := FormatDate(FieldByName('EventDate').AsDateTime,dsIrish,False)+' - '+
                                                                         FormatFloat('0.00',FieldByName('Score').AsFloat);
                        if ( FieldByName('AssociatedEventType').AsInteger > 0 ) then
                           if ( HerdLookup.mdConditionScoreAssociatedEvents.Locate('EventType',FieldByName('AssociatedEventType').AsInteger,[]) ) then
                              begin
                                 TempTable.FieldByName('AssocEvent1').AsString := HerdLookup.mdConditionScoreAssociatedEvents.FieldByName('Description').AsString;
                                 TempTable.FieldByName('Date_Score1').AsString := TempTable.FieldByName('Date_Score1').AsString + ' - ' + Copy(TempTable.FieldByName('AssocEvent1').AsString,1,1);
                              end;
                        PrevAnimalId := Fields[0].AsInteger;
                     end
                  else if ( ( Fields[0].AsInteger = PrevAnimalId ) and ( TempTable.FieldByName('CSDate2').AsDateTime <= 0 ) )then
                     begin
                        TempTable.Edit;
                        TempTable.FieldByName('CSDate2').AsDateTime := FieldByName('EventDate').AsDateTime;
                        TempTable.FieldByName('CScore2').AsFloat := FieldByName('Score').AsFloat;
                        TempTable.FieldByName('Date_Score2').AsString := FormatDate(FieldByName('EventDate').AsDateTime,dsIrish,False)+' - '+
                                                                         FormatFloat('0.00',FieldByName('Score').AsFloat);
                        if ( FieldByName('AssociatedEventType').AsInteger > 0 ) then
                           if ( HerdLookup.mdConditionScoreAssociatedEvents.Locate('EventType',FieldByName('AssociatedEventType').AsInteger,[]) ) then
                              begin
                                 TempTable.FieldByName('AssocEvent2').AsString := HerdLookup.mdConditionScoreAssociatedEvents.FieldByName('Description').AsString;
                                 TempTable.FieldByName('Date_Score2').AsString := TempTable.FieldByName('Date_Score2').AsString + ' - ' + Copy(TempTable.FieldByName('AssocEvent2').AsString,1,1);
                              end;
                      end
                  else if ( ( Fields[0].AsInteger = PrevAnimalId ) and ( TempTable.FieldByName('CSDate3').AsDateTime <= 0 ) )then
                     begin
                        TempTable.Edit;
                        TempTable.FieldByName('CSDate3').AsDateTime := FieldByName('EventDate').AsDateTime;
                        TempTable.FieldByName('CScore3').AsFloat := FieldByName('Score').AsFloat;
                        TempTable.FieldByName('Date_Score3').AsString := FormatDate(FieldByName('EventDate').AsDateTime,dsIrish,False)+' - '+
                                                                         FormatFloat('0.00',FieldByName('Score').AsFloat);
                        if ( FieldByName('AssociatedEventType').AsInteger > 0 ) then
                           if ( HerdLookup.mdConditionScoreAssociatedEvents.Locate('EventType',FieldByName('AssociatedEventType').AsInteger,[]) ) then
                              begin
                                 TempTable.FieldByName('AssocEvent3').AsString := HerdLookup.mdConditionScoreAssociatedEvents.FieldByName('Description').AsString;
                                 TempTable.FieldByName('Date_Score3').AsString := TempTable.FieldByName('Date_Score3').AsString + ' - ' + Copy(TempTable.FieldByName('AssocEvent3').AsString,1,1);
                              end;
                      end
                  else if ( ( Fields[0].AsInteger = PrevAnimalId ) and ( TempTable.FieldByName('CSDate4').AsDateTime <= 0 ) )then
                     begin
                        TempTable.Edit;
                        TempTable.FieldByName('CSDate4').AsDateTime := FieldByName('EventDate').AsDateTime;
                        TempTable.FieldByName('CScore4').AsFloat := FieldByName('Score').AsFloat;
                        TempTable.FieldByName('Date_Score4').AsString := FormatDate(FieldByName('EventDate').AsDateTime,dsIrish,False)+' - '+
                                                                         FormatFloat('0.00',FieldByName('Score').AsFloat);
                        if ( FieldByName('AssociatedEventType').AsInteger > 0 ) then
                           if ( HerdLookup.mdConditionScoreAssociatedEvents.Locate('EventType',FieldByName('AssociatedEventType').AsInteger,[]) ) then
                              begin
                                 TempTable.FieldByName('AssocEvent4').AsString := HerdLookup.mdConditionScoreAssociatedEvents.FieldByName('Description').AsString;
                                 TempTable.FieldByName('Date_Score4').AsString := TempTable.FieldByName('Date_Score4').AsString + ' - ' + Copy(TempTable.FieldByName('AssocEvent4').AsString,1,1);
                              end;
                      end;

                  //   05/10/16 [V5.5 R9.9] /MK Bug Fix - Only post if table is in Insert or Edit Mode.
                  if ( TempTable.State in dsEditModes ) then
                     TempTable.Post;

                  Next;
                  StepProgress();
               end;

            if TempTable.State in dsEditModes then
               TempTable.Post;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmConditionScoreReport.ViewReport;
begin
   LoadReportData;
   try
      CheckReportData;

      if ( GenQuery.RecordCount = 0 ) then
         begin
            MessageDlg('No data available to view this report.',mtInformation,[mbOK],0);
            Exit;
         end;

      if ( deDateFrom.Date > 0 ) then
         lFltDateFrom.Caption := DateToStr(deDateFrom.Date)
      else
         lFltDateFrom.Caption := '';
      if ( deDateTo.Date > 0 ) then
         lFltDateTo.Caption := DateToStr(deDateTo.Date)
      else
         lFltDateTo.Caption := '';

      if ( ceCondScoreFrom.EditValue > 0 ) then
         lFltCondScoreFrom.Caption := FloatToStr(ceCondScoreFrom.EditValue)
      else
         lFltCondScoreFrom.Caption := '';
      if ( ceCondScoreTo.EditValue > 0 ) then
         lFltCondScoreTo.Caption := FloatToStr(ceCondScoreTo.EditValue)
      else
         lFltCondScoreTo.Caption := '';

      BaseReport.Preview();
   finally
      ResetProgress;
      GenQuery.Close;
      EnableViewPrintButtons(True);
   end;

end;

class procedure TfmConditionScoreReport.ShowReport;
begin
   with TfmConditionScoreReport.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmConditionScoreReport.FormCreate(Sender: TObject);
begin
  inherited;
   cbUseFilter.Visible := WinData.ActiveFilter;
   cbUseFilter.Checked := ( not(cbUseFilter.Visible) );
   ceCondScoreFrom.Value := 1;
   ceCondScoreFrom.Properties.MinValue := 1;
   ceCondScoreFrom.Properties.MaxValue := 5;
   ceCondScoreTo.Value := 5;
   ceCondScoreTo.Properties.MinValue := 1;
   ceCondScoreTo.Properties.MaxValue := 5;
end;

procedure TfmConditionScoreReport.qrlScore1AVGPrint(sender: TObject; var Value: String);
var
   FieldInt : Integer;
   TempQuery : TQuery;
begin
   inherited;
   Value := '';
   if ( not(Sender is TQRLabel) ) then Exit;

   if ( (Sender as TQRLabel).Tag = 0 ) then Exit;

   TempQuery := TQuery.Create(nil);
   with TempQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AVG(CScore'+IntToStr((Sender as TQRLabel).Tag)+')');
         SQL.Add('FROM '+TempTable.TableName+'');
         SQL.Add('WHERE CScore'+IntToStr((Sender as TQRLabel).Tag)+' > 1');
         try
            Open;
            if ( RecordCount > 0 ) then
               if ( Fields[0].AsFloat > 1 ) then
                  Value := FormatFloat('0.00',Fields[0].AsFloat);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmConditionScoreReport.btnExportToCSVClick(Sender: TObject);
var
   slCSVFileData : TStringList;
   i,
   iLineCount,
   iScoreAvailable : Integer;

   function ScoreAvailable : Integer;
   var
      bDataAvailable : Boolean;
      qDataAvailable : TQuery;
   begin
      Result := 0;
      bDataAvailable := True;
      qDataAvailable := TQuery.Create(nil);
      try
         qDataAvailable.DatabaseName := AliasName;
         while ( bDataAvailable ) and ( Result <= 3 ) do
            begin
               qDataAvailable.SQL.Clear;
               qDataAvailable.SQL.Add('SELECT *');
               qDataAvailable.SQL.Add('FROM '+TempTable.TableName+'');
               qDataAvailable.SQL.Add('WHERE '+Format('CSDate%d',[Result+1])+' IS NOT NULL');
               try
                  qDataAvailable.Open;
                  if ( qDataAvailable.RecordCount > 0 ) then
                    Inc(Result);
                  bDataAvailable := ( qDataAvailable.RecordCount > 0 );
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
      finally
         if ( qDataAvailable <> nil ) then
            begin
               qDataAvailable.Close;
               FreeAndNil(qDataAvailable);
            end;
      end;
   end;

   function ScoreDateToStr ( AScoreDate : TDateTime ) : String;
   begin
      Result := '';
      if ( AScoreDate > 0 ) then
         Result := DateToStr(AScoreDate);
   end;

   function ScoreToStr ( AScore : Double ) : String;
   begin
      Result := '';
      if ( AScore > 0 ) then
         Result := FloatToStr(AScore);
   end;

begin
   inherited;
   LoadReportData;
   CheckReportData;
   if ( GenQuery.RecordCount = 0 ) then
      begin
         MessageDlg('No data available to generate the CSV file.',mtInformation,[mbOK],0);
         Exit;
      end;

   iScoreAvailable := ScoreAvailable;
   slCSVFileData := TStringList.Create();
   try
      for i := 1 to iScoreAvailable do
         begin
            case i of
               1 : slCSVFileData.Add('AnimalNo,DateOfBirth,LactNo,Score1Date,Score1Score,Score1Event,');
               2 : slCSVFileData.Strings[0] := slCSVFileData.Strings[0] + 'Score2Date,Score2Score,Score2Event,';
               3 : slCSVFileData.Strings[0] := slCSVFileData.Strings[0] + 'Score3Date,Score3Score,Score3Event,';
               4 : slCSVFileData.Strings[0] := slCSVFileData.Strings[0] + 'Score4Date,Score4Score,Score4Event';
            end;
         end;

      iLineCount := 1;
      GenQuery.First;
      while ( not(GenQuery.Eof) ) do
         begin
            for i := 1 to iScoreAvailable do
               case i of
                  1 : slCSVFileData.Add(GenQuery.FieldByName('AnimalNo').AsString+','+
                                        ScoreDateToStr(GenQuery.FieldByName('DateOfBirth').AsDateTime)+','+
                                        IntToStr(GenQuery.FieldByName('LactNo').AsInteger)+','+
                                        DateToStr(GenQuery.FieldByName('CSDate1').AsDateTime)+','+
                                        ScoreToStr(GenQuery.FieldByName('CScore1').AsInteger)+','+
                                        GenQuery.FieldByName('AssocEvent1').AsString+'');
                  2 : slCSVFileData.Strings[iLineCount] := slCSVFileData.Strings[iLineCount] + ',' +
                                                           ScoreDateToStr(GenQuery.FieldByName('CSDate2').AsDateTime)+','+
                                                           FloatToStr(GenQuery.FieldByName('CScore2').AsFloat)+','+
                                                           GenQuery.FieldByName('AssocEvent2').AsString;
                  3 : slCSVFileData.Strings[iLineCount] := slCSVFileData.Strings[iLineCount] + ',' +
                                                           ScoreDateToStr(GenQuery.FieldByName('CSDate3').AsDateTime)+','+
                                                           ScoreToStr(GenQuery.FieldByName('CScore3').AsFloat)+','+
                                                           GenQuery.FieldByName('AssocEvent3').AsString;
                  4 : slCSVFileData.Strings[iLineCount] := slCSVFileData.Strings[iLineCount] + ',' +
                                                           ScoreDateToStr(GenQuery.FieldByName('CSDate4').AsDateTime)+','+
                                                           ScoreToStr(GenQuery.FieldByName('CScore4').AsFloat)+','+
                                                           GenQuery.FieldByName('AssocEvent4').AsString;
               end;
            Inc(iLineCount);
            GenQuery.Next;
         end;
      if ( slCSVFileData.Count > 0 ) then
         with TSaveDialog.Create(nil) do
            try
              Filter := 'CSV file|*.csv';
              DefaultExt := 'csv';
              InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
              if ( Execute ) then
                 begin
                    slCSVFileData.SaveToFile(FileName);
                    MessageDlg('Condition Score CSV File successfully saved.',mtInformation,[mbOK],0);
                 end;
            finally
               Free;
            end;
   finally
      if ( slCSVFileData <> nil ) then
         FreeAndNil(slCSVFileData);
      ResetProgress;
      GenQuery.Close;
   end;
end;

procedure TfmConditionScoreReport.CheckReportData;

   function WhichScoreToSortBy : String;
   var
      sFieldName : String;
      i : Integer;
   begin
      Result := '';
      sFieldName := '';
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM '+TempTable.TableName+'');
            try
               for i := 4 downto 1 do
                  begin
                     sFieldName := 'CScore'+IntToStr(i);
                     SQL.Add('WHERE '+sFieldName+' IS NOT NULL');
                     Open;
                     if ( RecordCount > 0 ) then
                        Result := sFieldName;
                     if ( Length(Result) > 0 ) then
                        Break;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT * FROM '+ TempTable.TableName );
         case rgSortBy.ItemIndex of
            0 : SQL.Add('ORDER BY SortAnimalNo ');
            1 : SQL.Add('ORDER BY DateOfBirth ');
            2 : SQL.Add('ORDER BY LactNo ');
            3 : SQL.Add('ORDER BY '+WhichScoreToSortBy+' ');
         end;

         if rgSortOrder.ItemIndex = 1 then
            SQL.Add('DESC ');
         Open;
      end;
end;

end.
