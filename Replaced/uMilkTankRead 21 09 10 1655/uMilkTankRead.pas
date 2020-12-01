unit uMilkTankRead;

{
  "Milk Cheque" become "Milk Statements"
  "Milk Tank" becomes "Bulk Tank"

  28/06/10 [V4.0 R3.8] /MK Additional Feature - New cxGrids introduced. Old grids removed.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, dbTables, StdCtrls, ExtCtrls, Grids, DBGridEh, RXCtrls, ComCtrls,
  ToolWin, uSPParser, DBCtrls, DateUtil, RXDBCtrl, Menus, Buttons, Mask,
  ToolEdit, DBGrids, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TFilterType = (ftStatements, ftBulkTank);
  TDisplayData = (ddThisImport, ddAllImports);
  TRecordType = (rtFileHeader, rtMilkStatement, rtBulkTankRead, rtUnknown);
  TfmMilkTankRead = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbImport: TRxSpeedButton;
    sbOptions: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbSave: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbReview: TRxSpeedButton;
    ToolButton6: TToolButton;
    sbHelp: TRxSpeedButton;
    OpenDialog: TOpenDialog;
    pDetails: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Parser: TSPParser;
    pProgress: TPanel;
    lStatus: TLabel;
    ProgressBar1: TProgressBar;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    pErrors: TPanel;
    mErrors: TMemo;
    Label9: TLabel;
    Button1: TButton;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    StatementNav: TDBNavigator;
    BulkNav: TDBNavigator;
    gbFilter: TGroupBox;
    rgFilterBy: TRadioGroup;
    cbFromYear: TComboBox;
    lMonth: TLabel;
    cbFromMonth: TComboBox;
    lYear: TLabel;
    Label11: TLabel;
    cbToYear: TComboBox;
    cbToMonth: TComboBox;
    Label14: TLabel;
    lFilterBy: TLabel;
    StatementRecCount: TDBStatusLabel;
    BulkTankRecCount: TDBStatusLabel;
    pOwner: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eMilkCo: TEdit;
    eStatementDate: TEdit;
    mOwner: TMemo;
    eFileName: TEdit;
    cbEditCheque: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    sbFilter: TSpeedButton;
    ToDate: TDateEdit;
    FromDate: TDateEdit;
    pmAllowEdit: TPopupMenu;
    pmiAllowManualEdit: TMenuItem;
    cxgMilkStatement: TcxGrid;
    cxgMilkStatementDBTableView: TcxGridDBTableView;
    cxgMilkStatementDBTableViewCalMthEnd: TcxGridDBColumn;
    cxgMilkStatementDBTableViewDateStart: TcxGridDBColumn;
    cxgMilkStatementDBTableViewDateEnd: TcxGridDBColumn;
    cxgMilkStatementDBTableViewLiqMilkProd: TcxGridDBColumn;
    cxgMilkStatementDBTableViewPrcPerLtrLiq: TcxGridDBColumn;
    cxgMilkStatementDBTableViewProcMilkProd: TcxGridDBColumn;
    cxgMilkStatementDBTableViewPrcPerLtrProc: TcxGridDBColumn;
    cxgMilkStatementDBTableViewGrossValMilk: TcxGridDBColumn;
    cxgMilkStatementDBTableViewNetValMilk: TcxGridDBColumn;
    cxgMilkStatementDBTableViewAvgPerFat: TcxGridDBColumn;
    cxgMilkStatementDBTableViewAvgPerProtein: TcxGridDBColumn;
    cxgMilkStatementDBTableViewAvgPerLac: TcxGridDBColumn;
    cxgMilkStatementDBTableViewAvgPerSolid: TcxGridDBColumn;
    cxgMilkStatementDBTableViewAvgSCC: TcxGridDBColumn;
    cxgMilkStatementDBTableViewDBColumn1TCB: TcxGridDBColumn;
    cxgMilkStatementDBTableViewDBColumn2TCB: TcxGridDBColumn;
    cxgMilkStatementDBTableViewDBColumn3TCB: TcxGridDBColumn;
    cxgMilkStatementDBTableViewAvgTherm: TcxGridDBColumn;
    cxgMilkStatementLevel1: TcxGridLevel;
    cxgBulkTankDetails: TcxGrid;
    cxgBulkTankDetailsDBTableView: TcxGridDBTableView;
    cxgBulkTankDetailsDBTableViewDateCollected: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewAmtCollect: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewPerFat: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewPerProtein: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewPerLac: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewPerSolid: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewSCC: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewTCB: TcxGridDBColumn;
    cxgBulkTankDetailsDBTableViewThermoduric: TcxGridDBColumn;
    cxgBulkTankDetailsLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbImportClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure cbEditChequeClick(Sender: TObject);
    procedure dbgMilkStatementsGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure sbReviewClick(Sender: TObject);
    procedure sbFilterClick(Sender: TObject);
    procedure rgFilterByClick(Sender: TObject);
    procedure dbgMilkStatementsTitleClick(Column: TColumnEh);
    procedure iEndDate1Click(Sender: TObject);
    procedure dEndDate1Click(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure pmiAllowManualEditClick(Sender: TObject);
    procedure StatementNavClick(Sender: TObject; Button: TNavigateBtn);
    procedure BulkNavClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
     UpdatesPending,
     ProblemsOnDisk : Boolean;
     tMilkStatements,
     tBulkTank : TTable;
     dsMilkStatements,
     dsBulkTank : TDataSource;
     FFileName : String;
     FMilkFile : TextFile;
     FLine : String;
     ReadErrors : TStringList;
     FilterType : TFilterType;
     DisplayData : TDisplayData;
     qFilter : TQuery;
     dsFilter : TDataSource;
     procedure CreateAndOpenTables;
     procedure ImportFile;
     procedure SaveStatementRecord;
     procedure SaveBulkRecord;
     procedure OutputHeader;
     function RecordType : TRecordType;
     procedure SaveToDatabase;
     function AlphaStrToDate(AStrDate : String) : TDateTime;
     procedure FilterStatements(FromMth, FromYr, ToMth, ToYr : Word);
     procedure FilterBulkTankReadings(FromDate, ToDate : TDateTime);
     procedure MilkStatementAfterPost(Sender : TDataSet);
     procedure BulkTankAfterPost(Sender : TDataSet);
     procedure DisableDetailsAndFilters;
     procedure EnableDetailsAndFilters;
  public
    { Public declarations }
  end;

const
   { Units }
   UM_Litres = 0;
   sUM_Litres = 'LITRES';

   BtnCap_ApplyFilter = 'Apply Filter';
   BtnCap_ClearFilter = 'Clear Filter';

var
  fmMilkTankRead: TfmMilkTankRead;

implementation
uses
  uUpdateTables, GenTypesConst, DairyData, KRoutines, KDbRoutines,
  uGlobalSettings, uPreferences;

{$R *.DFM}

{ TfmMilkTankRead }

procedure TfmMilkTankRead.CreateAndOpenTables;
begin

   try
      if not uUpdateTables.CreateMilkTankTables then
         begin
            MessageDlg('Cannot open Bulk Tank tables.'+#13#10+cErrorContact,mtError,[mbOK],0);
            Abort;
         end;

      WinData.MilkCheque.Open;
      WinData.MilkTank.Open;

      tMilkStatements := TTable.Create(nil);
      tMilkStatements.DatabaseName := AliasName;
      tMilkStatements.TableType := ttParadox;
      tMilkStatements.TableName := 'tMilkStatements';
      tMilkStatements.FieldDefs.Assign(WinData.MilkCheque.FieldDefs);
      tMilkStatements.FieldDefs.Add('StrUnitMeasure', ftString, 10, False);
      tMilkStatements.CreateTable;
      tMilkStatements.Open;

      dsMilkStatements := TDataSource.Create(nil);
      dsMilkStatements.DataSet := tMilkStatements;
//      dbgMilkStatements.DataSource := dsMilkStatements;
      cxgMilkStatementDBTableView.DataController.DataSource := dsMilkStatements;
      StatementNav.DataSource := dsMilkStatements;
      StatementRecCount.DataSource := dsMilkStatements;

      tMilkStatements.AfterPost := MilkStatementAfterPost;

      tBulkTank := TTable.Create(nil);
      tBulkTank.DatabaseName := AliasName;
      tBulkTank.TableType := ttParadox;
      tBulkTank.TableName := 'tMilkTank';
      tBulkTank.FieldDefs.Assign(WinData.MilkTank.FieldDefs);
      tBulkTank.CreateTable;
      tBulkTank.Open;

      dsBulkTank := TDataSource.Create(nil);
      dsBulkTank.DataSet := tBulkTank;
      cxgBulkTankDetailsDBTableView.DataController.DataSource := dsBulkTank;

      BulkNav.DataSource := dsBulkTank;
      BulkTankRecCount.DataSource := dsBulkTank;

      tBulkTank.AfterPost := BulkTankAfterPost;
      UpdatesPending := False;

      qFilter := TQuery.Create(nil);
      qFilter.DatabaseName := AliasName;

      dsFilter := TDataSource.Create(nil);
      dsFilter.DataSet := qFilter;

   except
      on E : Exception do
         raise Exception.Create('Unable to open Milk Tank database tables.'+#13#10+cErrorContact);
   end;
end;

procedure TfmMilkTankRead.FormCreate(Sender: TObject);
var
   ThisYear : String;
begin
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbImport.Glyph, cBtnImgLoad);
   WinData.LoadBtnImage(sbOptions.Glyph, cBtnImgOptions);
   WinData.LoadBtnImage(sbSave.Glyph, cBtnImgSave);
   WinData.LoadBtnImage(sbReview.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(sbFilter.Glyph, cBtnImgExecute);

   ToDate.Hide;
   FromDate.Hide;
   lMonth.Show;
   lYear.Show;
   cbFromMonth.Show;
   cbFromYear.Show;
   cbToYear.Show;
   cbToMonth.Show;

   sbSave.Enabled := False;
   pProgress.Hide;
   CreateAndOpenTables;
   ReadErrors := TStringList.Create;
   FilterType := ftStatements;
   DisplayData := ddThisImport;

      ThisYear := IntToStr(ExtractYear(Date));

   if cbFromYear.Items.IndexOf(ThisYear) < 0 then
      cbFromYear.Items.Add(ThisYear);

   cbToYear.Clear;
   cbToYear.Items.Assign(cbFromYear.Items);

   cbFromMonth.ItemIndex := 0;
   cbFromYear.ItemIndex := cbFromYear.Items.IndexOf(ThisYear);

   cbToMonth.ItemIndex := DateUtil.ExtractMonth(Date)-1;
   cbToYear.ItemIndex := cbFromYear.Items.IndexOf(ThisYear);

   sbOptions.Visible := True;

   if Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] then
      begin
         pmiAllowManualEdit.Checked := True;
         sbImport.Visible := False;
         sbSave.Enabled := True;
         sbReview.Enabled := False;

         cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
         StatementNav.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
         StatementRecCount.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;

         cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
         BulkNav.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
         BulkTankRecCount.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
         DisableDetailsAndFilters;
      end
   else
      begin
         pmiAllowManualEdit.Checked := False;
         sbImport.Visible := True;
         sbSave.Enabled := False;
         sbReview.Enabled := True;
         EnableDetailsAndFilters;
      end;

end;


procedure TfmMilkTankRead.FormDestroy(Sender: TObject);
begin
   if tMilkStatements <> nil then
      try
         tMilkStatements.Active := False;
         tMilkStatements.DeleteTable;
      finally
         tMilkStatements.Free;
      end;

   if tBulkTank <> nil then
      try
         tBulkTank.Active := False;
         tBulkTank.DeleteTable;
      finally
         tBulkTank.Free;
      end;

   if qFilter <> nil then
      try
         qFilter.Active := False;
      finally
         qFilter.Free;
      end;

   if dsFilter <> nil then
      dsFilter.Free;

   WinData.MilkCheque.Close;
   WinData.MilkTank.Close;

   if ReadErrors <> nil then
      ReadErrors.Free;
end;

procedure TfmMilkTankRead.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmMilkTankRead.sbImportClick(Sender: TObject);
begin
   if OpenDialog.Execute then
      begin
         FFileName := OpenDialog.FileName;
         if (FileExists(FFileName)) then
            if MessageDlg(Format('Import file %s',[ExtractFileName(FFileName)]), mtConfirmation, [mbYes,mbNo],0) = idYes then
               ImportFile;

      end;
end;

procedure TfmMilkTankRead.sbSaveClick(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to save milk tank records?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      if ReadErrors.Count > 0 then
         begin
            if MessageDlg('Errors have occurred during the import process, do you to review them?',mtConfirmation,[mbYes,mbNo],0) = idYes then
               begin
                  mErrors.Text := ReadErrors.Text;
                  Splitter2.Show;
                  pErrors.Show;
               end;
         end
      else
         SaveToDatabase;
end;

procedure TfmMilkTankRead.FormCloseQuery(Sender: TObject;
   var CanClose: Boolean);
begin
   //if not(UpdatesPending) then
   //   CanClose := MessageDlg('Are you sure you want to exit?', mtConfirmation,[mbYes,mbNo],0) = idYes
 //  else
//      begin
         CanClose := Not(UpdatesPending);
         if not CanClose then
            if Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] = True then
               if MessageDlg('Records have not been saved, exit anyway?', mtConfirmation,[mbYes,mbNo],0) = idYes then
                  CanClose := True
            else
            if MessageDlg('File content has not been saved, exit anyway?', mtConfirmation,[mbYes,mbNo],0) = idYes then
               CanClose := True;
     // end;
end;

procedure TfmMilkTankRead.Button1Click(Sender: TObject);
begin
   Splitter2.Hide;
   pErrors.Hide;
   if MessageDlg('Do you want to save disk contents to database?', mtConfirmation, [mbYes,mbNo],0) = idYes then
      SaveToDatabase
end;

procedure TfmMilkTankRead.cbEditChequeClick(Sender: TObject);
begin
{
   if cbEditCheque.Checked then
     begin
        dbgMilkStatements.OptionsEh := dbgMilkStatements.OptionsEh - [dghRowHighlight];
        dbgBulkTank.OptionsEh := dbgMilkStatements.OptionsEh;
        dbgMilkStatements.ReadOnly := False;
        dbgBulkTank.ReadOnly := False;
     end
   else
      begin
         dbgMilkStatements.OptionsEh := dbgMilkStatements.OptionsEh + [dghRowHighlight];
         dbgBulkTank.OptionsEh := dbgMilkStatements.OptionsEh;
         dbgMilkStatements.ReadOnly := True;
         dbgBulkTank.ReadOnly := True;
      end;
}
end;

procedure TfmMilkTankRead.dbgMilkStatementsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if TDBGridEh(Sender).DataSource.Dataset.RecNo mod 2 = 1 then
     Background := $00E2DB9A
   else
     Background := $00F2EFD2;
end;

procedure TfmMilkTankRead.sbReviewClick(Sender: TObject);
begin
   if sbReview.Down then
      begin
         DisplayData := ddAllImports;

//         dbgMilkStatements.SumList.Active := False;
         cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
//         dbgMilkStatements.SumList.Active := False;

//         dbgBulkTank.SumList.Active := False;
         cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
//         dbgBulkTank.SumList.Active := True;

         pOwner.Hide;

     {    pDetails.Align := alBottom;
         pDetails.Height := 165;
         pDetails.Show;

         rgFilterBy.Align := AlLeft;
         rgFilterBy.Columns := 1;
         rgFilterBy.Width := 150;

         gbFilter.Align := alLeft;
         gbFilter.Width := 250;
     }

         sbImport.Enabled := False;
//         sbSave.Enabled := False;
      end

   else
      begin
         DisplayData := ddThisImport;
         cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
         cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
         pOwner.Show;
      {
         rgFilterBy.Columns := 2;
         rgFilterBy.Align := AlTop;
         rgFilterBy.Height := 38;

         gbFilter.Align := Altop;
         gbFilter.Height := 160;

         pDetails.Align := alLeft;
         pDetails.Width := 201;
         }
         sbImport.Enabled := True;
//         sbSave.Enabled := True;
      end;

   StatementNav.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
   StatementRecCount.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
   BulkNav.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
   BulkTankRecCount.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
end;

procedure TfmMilkTankRead.sbFilterClick(Sender: TObject);
begin
   if sbFilter.Tag = 0 then
      begin
         sbFilter.Caption := BtnCap_ClearFilter;
         sbFilter.Tag := 1;
         sbFilter.Font.Color := clRed;
         sbFilter.Font.Style := sbFilter.Font.Style + [fsBold];


         if FilterType = ftStatements then
            try
               Screen.Cursor := crHourGlass;

               FilterStatements( cbFromMonth.ItemIndex+1, // From Month
                                 StrToInt( cbFromYear.Items[cbFromYear.ItemIndex]), // From Year
                                 cbToMonth.ItemIndex+1,   // To Month
                                 StrToInt( cbToYear.Items[cbToYear.ItemIndex]) // To Year
                               );

            finally
               Screen.Cursor := crDefault;
            end
         else
            try
                Screen.Cursor := crHourGlass;
                FilterBulkTankReadings(FromDate.Date, ToDate.Date);
            finally
               Screen.Cursor := crDefault;
            end;
      end
   else
      begin
         sbFilter.Caption := BtnCap_ApplyFilter;
         sbFilter.Font.Color := clBlack;
         sbFilter.Font.Style := sbFilter.Font.Style - [fsBold];
         qFilter.Active := False;
         if DisplayData = ddThisImport then
            begin

               if FilterType = ftStatements then
                  begin
                     cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
                     StatementRecCount.DataSource := dsMilkStatements;
                  end
               else
                  begin
                     cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
                     BulkTankRecCount.DataSource := dsBulkTank;
                  end;
            end
         else
            begin
               if FilterType = ftStatements then
                  begin
                     cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
                     StatementRecCount.DataSource := WinData.dsMilkCheque;
                  end
               else
                  begin
                     cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
                     BulkTankRecCount.DataSource := WinData.dsMilkTank;
                  end;
            end;
         sbFilter.Tag := 0;
      end;
//  28/06/10 [V4.0 R3.8] /MK Additional Feature - New cxGrids introduced. No need for the below as old grids removed.
//   dbgMilkStatements.SumList.RecalcAll;
//   dbgBulkTank.SumList.RecalcAll;
end;

procedure TfmMilkTankRead.rgFilterByClick(Sender: TObject);
begin
   FilterType := TFilterType(rgFilterBy.ItemIndex);
   if FilterType = ftStatements then
      begin
         gbFilter.Caption := 'Filter Statements';
         lFilterBy.Caption := 'Calender Month End';
         ToDate.Hide;
         FromDate.Hide;
         lMonth.Show;
         lYear.Show;
         cbFromMonth.Show;
         cbFromYear.Show;
         cbToYear.Show;
         cbToMonth.Show;
      end
   else
      begin
         gbFilter.Caption := 'Filter Bulk Tank';
         lFilterBy.Caption := 'Date Collected';
         if FromDate.Date <= 0 then
            FromDate.Date := IncMonth(Date, -3);
         if ToDate.Date <= 0 then
            ToDate.Date := Date;
         ToDate.Show;
         FromDate.Show;
         lMonth.Hide;
         lYear.Hide;
         cbFromMonth.Hide;
         cbFromYear.Hide;
         cbToYear.Hide;
         cbToMonth.Hide;
      end;
end;

procedure TfmMilkTankRead.ImportFile;
begin
   sbSave.Enabled := False;
   ProblemsOnDisk := False;
   lStatus.Caption := 'Importing File...';
   cbEditCheque.Show;
   try

//  28/06/10 [V4.0 R3.8] /MK Additional Feature - New cxGrids introduced. Old grids removed.
//      dbgMilkStatements.SumList.Active := False;
//      dbgBulkTank.SumList.Active := False;

      tMilkStatements.DisableControls;
      tBulkTank.DisableControls;
      pProgress.Show;

      if tMilkStatements.RecordCount > 0 then
         KDbRoutines.SQLEmptyTable(tMilkStatements.TableName);
      if tBulkTank.RecordCount > 0 then
         KDbRoutines.SQLEmptyTable(tBulkTank.TableName);


      StatusBar1.Panels[0].Text := 'Importing file, please wait...';
      if not FileExists(FFileName) then
         begin
            MessageDlg('Cannot find Milk Tank file',mtError,[mbOK],0);
            Abort;
         end;

      {$I-}
      AssignFile(FMilkFile, FFileName);
      Reset(FMilkFile);
      {$I+}

      ProgressBar1.Max := FileSize(FMilkFile);

      while not eof(FMilkFile) do
         begin
            Application.ProcessMessages;
            Readln(FMilkFile, FLine);

            case RecordType of
               rtFileHeader : OutputHeader;
               rtMilkStatement : SaveStatementRecord;
               rtBulkTankRead : SaveBulkRecord;
            end;

            ProgressBar1.Position := FilePos(FMilkFile);
         end;
      CloseFile(FMilkFile);
      UpdatesPending := True;
      if not ProblemsOnDisk then
         StatusBar1.Panels[0].Text := 'File successfully imported.'
      else
         StatusBar1.Panels[0].Text := 'File imported - with errors on disk.';
      sbSave.Enabled := True;
  //  28/06/10 [V4.0 R3.8] /MK Additional Feature - New cxGrids introduced. Old grids removed.
  //  dbgMilkStatements.SumList.Active := True;
  //  dbgBulkTank.SumList.Active := True;

  //  dbgMilkStatements.SumList.RecalcAll;
  //  dbgBulkTank.SumList.RecalcAll;
   finally
      tMilkStatements.First;
      tBulkTank.First;
      tMilkStatements.EnableControls;
      tBulkTank.EnableControls;
      lStatus.Caption := '';
      ProgressBar1.Position := 0;
      pProgress.Hide;
   end;
end;

procedure TfmMilkTankRead.SaveStatementRecord;
begin
   with tMilkStatements, Parser do
      begin
         Parse(FLine);
         try
            Append;
            if (not IsNull[2]) then
               FieldByName('CalMthEnd').AsDateTime := AlphaStrToDate(Fields[2]);
            if (not IsNull[3]) then
               FieldByName('DateStart').AsDateTime := AlphaStrToDate(Fields[3]);
            if (not IsNull[4]) then
               FieldByName('DateEnd').AsDateTime := AlphaStrToDate(Fields[4]);
            if (not IsNull[5]) then
               FieldByName('LiqMilkProd').AsFloat := StrToFloat(Fields[5]);
            if (not IsNull[6]) then
               FieldByName('PrcPerLtrLiq').AsFloat := StrToFloat(Fields[6]);
            if (not IsNull[7]) then
               FieldByName('ProcMilkProd').AsFloat := StrToFloat(Fields[7]);
            if (not IsNull[8]) then
               FieldByName('PrcPerLtrProc').AsFloat := StrToFloat(Fields[8]);
            if (not IsNull[9]) then
               FieldByName('GrossValMilk').AsFloat := StrToFloat(Fields[9]);
            if (not IsNull[10]) then
               FieldByName('NetValMilk').AsFloat := StrToFloat(Fields[10]);
            if (not IsNull[11]) then
               FieldByName('AvgPerFat').AsFloat := StrToFloat(Fields[11]);
            if (not IsNull[12]) then
               FieldByName('AvgPerProtein').AsFloat := StrToFloat(Fields[12]);
            if (not IsNull[13]) then
               FieldByName('AvgPerLac').AsFloat := StrToFloat(Fields[13]);
            if (not IsNull[14]) then
               FieldByName('AvgPerSolid').AsFloat := StrToFloat(Fields[14]);
            if (not IsNull[15]) then
               FieldByName('AvgSCC').AsFloat := StrToFloat(Fields[15]);
            if (not IsNull[16]) then
               FieldByName('1TCB').AsFloat := StrToFloat(Fields[16]);
            if (not IsNull[17]) then
               FieldByName('2TCB').AsFloat := StrToFloat(Fields[17]);
            if (not IsNull[18]) then
               FieldByName('3TCB').AsFloat := StrToFloat(Fields[18]);
            if (not IsNull[19]) then
               FieldByName('AvgTherm').AsFloat := StrToFloat(Fields[19]);

            if (not IsNull[20]) then
               begin
                  if UPPERCASE(Fields[20]) = sUM_Litres then
                     FieldByName('UnitMeasure').AsFloat := UM_Litres;
               end;

            Post;
         except
            on E : Exception do
               begin
                  ProblemsOnDisk := True;
                  Cancel;
                  ReadErrors.Add(FLine);
               end;
         end;
      end;
end;

procedure TfmMilkTankRead.SaveBulkRecord;
begin
   with tBulkTank, Parser do
      begin
         Parse(FLine);
         try
            Append;
            if (not IsNull[2]) then
               FieldByName('DateCollected').AsFloat := AlphaStrToDate(Fields[2]);
            if (not IsNull[3]) then
               FieldByName('AmtCollect').AsFloat := StrToFloat(Fields[3]);
            if (not IsNull[4]) then
               FieldByName('PerFat').AsFloat := StrToFloat(Fields[4]);
            if (not IsNull[5]) then
               FieldByName('PerProtein').AsFloat := StrToFloat(Fields[5]);
            if (not IsNull[6]) then
               FieldByName('PerLac').AsFloat := StrToFloat(Fields[6]);
            if (not IsNull[7]) then
               FieldByName('PerSolid').AsFloat := StrToFloat(Fields[7]);
            if (not IsNull[8]) then
               FieldByName('SCC').AsFloat := StrToFloat(Fields[8]);
            if (not IsNull[9]) then
               FieldByName('TCB').AsFloat := StrToFloat(Fields[9]);
            if (not IsNull[10]) then
               FieldByName('Thermoduric').AsFloat := StrToFloat(Fields[11]);
            if (not IsNull[11]) then
               begin
                  if UPPERCASE(Fields[11]) = sUM_Litres then
                     FieldByName('UnitMeasure').AsFloat := UM_Litres;
               end;
            Post;
         except
            on E : Exception do
               begin
                  ProblemsOnDisk := True;
                  Cancel;
                  ReadErrors.Add(FLine);
               end;
         end;
      end;
end;

function TfmMilkTankRead.RecordType : TRecordType;
var
   RecordIdentifier : PChar;
begin
   RecordIdentifier := PChar(UPPERCASE(Copy(FLine, 2, 1)));
   case Ord(RecordIdentifier^) of
      72 : Result := rtFileHeader; // 'H'
      67 : Result := rtMilkStatement; // 'C'
      84 : Result := rtBulkTankRead // 'T'
   else
      Result := rtUnknown;
   end
end;

procedure TfmMilkTankRead.OutputHeader;
begin
   Parser.Parse(FLine);
   eFileName.Text := ExtractFileName(FFileName);
   eMilkCo.Text := Trim(Parser.Fields[2]);
   eStatementDate.Text := Trim(Parser.Fields[4]);
   mOwner.Text := Trim(Parser.Fields[6]);
end;

function TfmMilkTankRead.AlphaStrToDate(AStrDate: String): TDateTime;
var
   nDay, nMonth, nYear : Integer;
begin
   Result := 0;
   if Length(AStrDate) <> 11 then Exit;
   nDay := StrToInt(Copy(AStrDate, 1, 2));
   nMonth := GetMonthIndexFromStr(Copy(AStrDate, 4, 3), True);
   nYear := StrToInt(Copy(AStrDate, 8, 4));
   Result := EncodeDate(nYear, nMonth, nDay);
end;

procedure TfmMilkTankRead.FilterStatements(FromMth, FromYr, ToMth, ToYr : Word);
var
   FromDate,
   ToDate : String;
begin
   FromDate := IntToStr(FromMth) + '/' + IntToStr(DaysPerMonth(FromYr, FromMth)) + '/' + IntToStr(FromYr);
   ToDate := IntToStr(ToMth) + '/' + IntToStr(DaysPerMonth(ToYr, ToMth)) + '/' + IntToStr(ToYr);

   qFilter.SQL.Clear;
   if DisplayData = ddThisImport then
      qFilter.SQL.Add(cSQL_SELECTALL + tMilkStatements.TableName)
   else
      qFilter.SQL.Add(cSQL_SELECTALL + WinData.MilkCheque.TableName);
   qFilter.SQL.Add('WHERE ( CalMthEnd Between "'+FromDate+'" AND "'+ToDate+'" )');
   qFilter.Open;

   cxgMilkStatementDBTableView.DataController.DataSource := dsFilter;
   StatementRecCount.DataSource := dsFilter;
end;

procedure TfmMilkTankRead.FilterBulkTankReadings(FromDate,
  ToDate: TDateTime);
begin
   qFilter.SQL.Clear;
   if DisplayData = ddThisImport then
      qFilter.SQL.Add(cSQL_SELECTALL + tBulkTank.TableName)
   else
      qFilter.SQL.Add(cSQL_SELECTALL + WinData.MilkTank.TableName);
   qFilter.SQL.Add('WHERE ( DateCollected Between "'+FormatDateTime(cUSDateStyle,FromDate)+'" AND "'+FormatDateTime(cUSDateStyle,ToDate)+'" )');
   qFilter.Open;
   cxgBulkTankDetailsDBTableView.DataController.DataSource := dsFilter;
   BulkTankRecCount.DataSource := dsFilter;
end;

procedure TfmMilkTankRead.SaveToDatabase;
var
  Iterator : Integer;
begin
   WinData.KingData.StartTransaction;
   lStatus.Caption := 'Updating database...';
   pProgress.Show;
   cbEditCheque.Hide;
   try

      StatusBar1.Panels[0].Text := 'Updating database please wait...';
      Screen.Cursor := crHourGlass;
      ProgressBar1.Max := tMilkStatements.RecordCount + tBulkTank.RecordCount;
      ProgressBar1.Step := 1;
      Enabled := False;
      sbSave.Enabled := False;

      try
         with tMilkStatements do
            try
               DisableControls;
               First;
               while not eof do
                  begin
                     Application.ProcessMessages;
                     if not WinData.MilkCheque.Locate('CalMthEnd', tMilkStatements.FieldByName('CalMthEnd').AsDateTime, []) then
                        WinData.MilkCheque.Append
                     else
                        WinData.MilkCheque.Edit;

                     for Iterator := 1 to FieldCount-2 do // dont save StrUnitMeasure
                         WinData.MilkCheque.Fields[Iterator].Value := tMilkStatements.Fields[Iterator].Value;
                     Next;
                     ProgressBar1.StepIt;
                  end;
            finally
               EnableControls;
            end;

         with tBulkTank do
            try
               DisableControls;
               First;
               while not eof do
                  begin
                     Application.ProcessMessages;
                     if not WinData.MilkTank.Locate('DateCollected', tBulkTank.FieldByName('DateCollected').AsDateTime, []) then
                        WinData.MilkTank.Append
                     else
                        WinData.MilkTank.Edit;

                     for Iterator := 1 to FieldCount-1 do
                         WinData.MilkTank.Fields[Iterator].Value := tBulkTank.Fields[Iterator].Value;
                     Next;
                     ProgressBar1.StepIt;
                  end;
            finally
               EnableControls;
            end;

         WinData.MilkCheque.ApplyUpdates;
         WinData.MilkTank.ApplyUpdates;
         WinData.KingData.Commit;
         UpdatesPending := False;
         StatusBar1.Panels[0].Text := 'Database update complete.';
//         KDbRoutines.SQLEmptyTable(tMilkStatements.TableName); ?? not sure whether data should remain on grid for display purposes
//         KDbRoutines.SQLEmptyTable(tBulkTank.TableName); ?? not sure whether data should remain on grid for display purposes
         MessageDlg('Database successully updated!',mtInformation,[mbOK],0);
      except
         WinData.MilkCheque.CancelUpdates;
         WinData.MilkTank.CancelUpdates;
         WinData.KingData.Rollback;
         StatusBar1.Panels[0].Text := 'Database update failed!';
         MessageDlg('Database update failed!'+#13#10+cErrorContact,mtError,[mbOk],0);
      end;

   finally
      WinData.MilkCheque.Close;
      WinData.MilkTank.Close;
      WinData.MilkCheque.Open;
      WinData.MilkTank.Open;
      Enabled := True;
      lStatus.Caption := '';
      Screen.Cursor := crDefault;
      lStatus.Caption := '';
      ProgressBar1.Position := 0;
      pProgress.Hide;
   end;

end;

procedure TfmMilkTankRead.BulkTankAfterPost(Sender: TDataSet);
begin
   //TDBGridEh(dbgBulkTank).SumList.RecalcAll;
end;

procedure TfmMilkTankRead.MilkStatementAfterPost(Sender: TDataSet);
begin
   //TDBGridEh(dbgMilkStatements).SumList.RecalcAll;
end;

procedure TfmMilkTankRead.dbgMilkStatementsTitleClick(Column: TColumnEh);
begin
{   SortByIndexedField := Column.Field.FieldName;
   case Column.Title.SortMarker of
      smDownEh: begin
                   SortByIndexedField := 'd'+SortByIndexedField;
                   Column.Title.SortMarker := smUpEh;
                end;
      smUpEh,
      smNoneEh: begin
                   SortByIndexedField := 'i'+SortByIndexedField;
                   Column.Title.SortMarker := smDownEh;
                end;
   end;
   WinData.MilkCheque.IndexName := SortByIndexedField;
}
end;

procedure TfmMilkTankRead.iEndDate1Click(Sender: TObject);
begin
 //  WinData.MilkCheque.IndexName := 'iDateEnd';
end;

procedure TfmMilkTankRead.dEndDate1Click(Sender: TObject);
begin
  // WinData.MilkCheque.IndexName := 'dDateEnd';
end;

procedure TfmMilkTankRead.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('bulktank.htm'); 
end;

procedure TfmMilkTankRead.pmiAllowManualEditClick(Sender: TObject);
begin
   if not Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] then
      begin
         pmiAllowManualEdit.Checked := True;
         Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] := True;
         Close;
      end
   else
      begin
         pmiAllowManualEdit.Checked := False;
         Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] := False;
         Close;
      end;
end;

procedure TfmMilkTankRead.DisableDetailsAndFilters;
begin
   pOwner.Enabled := False;
   Label4.Enabled := False;
   Label7.Enabled := False;
   Label8.Enabled := False;
   eFileName.Enabled := False;
   mOwner.Enabled := False;
   Label6.Enabled := False;
   eMilkCo.Enabled := False;
   Label5.Enabled := False;
   eStatementDate.Enabled := False;
   cbEditCheque.Visible := False;
   rgFilterBy.Enabled := False;
   gbFilter.Enabled := False;
   lFilterBy.Enabled := False;
   lMonth.Enabled := False;
   lYear.Enabled := False;
   Label11.Enabled := False;
   cbFromMonth.Enabled := False;
   cbFromYear.Enabled := False;
   cbToMonth.Enabled := False;
   cbToYear.Enabled := False;
   Label14.Enabled := False;
   FromDate.Enabled := False;
   ToDate.Enabled := False;
   sbFilter.Enabled := False;
   StatementNav.Enabled := True;
   BulkNav.Visible := True;
end;

procedure TfmMilkTankRead.EnableDetailsAndFilters;
begin
   pOwner.Enabled := True;
   Label4.Enabled := True;
   Label7.Enabled := True;
   Label8.Enabled := True;
   eFileName.Enabled := True;
   mOwner.Enabled := True;
   Label6.Enabled := True;
   eMilkCo.Enabled := True;
   Label5.Enabled := True;
   eStatementDate.Enabled := True;
   cbEditCheque.Visible := True;
   rgFilterBy.Enabled := True;
   gbFilter.Enabled := True;
   lFilterBy.Enabled := True;
   lMonth.Enabled := True;
   lYear.Enabled := True;
   Label11.Enabled := True;
   cbFromMonth.Enabled := True;
   cbFromYear.Enabled := True;
   cbToMonth.Enabled := True;
   cbToYear.Enabled := True;
   Label14.Enabled := True;
   FromDate.Enabled := True;
   ToDate.Enabled := True;
   sbFilter.Enabled := True;
   StatementNav.Enabled := False;
   BulkNav.Enabled := False;
end;

procedure TfmMilkTankRead.StatementNavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   UpdatesPending := True;
end;

procedure TfmMilkTankRead.BulkNavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   UpdatesPending := True;
end;

end.
