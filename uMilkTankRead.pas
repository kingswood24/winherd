{
  "Milk Cheque" become "Milk Statements"
  "Milk Tank" becomes "Bulk Tank"

  28/06/10 [V4.0 R3.8] /MK Additional Feature - New cxGrids introduced. Old grids removed.

  02/12/10 [V4.0 R6.1] /MK Bug - If Manual Entry Do Not Hide Filter Area.

  07/12/10 [V4.0 R6.1] /MK Change - Footer For Average Columns Shows Averages.

  21/05/12 [V5.0 R5.9] /MK Change - Changes To Fix Filtering Problems In Statements And Tank Reading On Manual Entry.

  23/05/12 [V5.0 R6.0] /MK Change - Bulk Tank Footers From Fat Onwards Should Be Averages Not Totals.

  31/05/12 [V5.0 R6.0] /MK Bug - DisableDetailsAndFilters - BulkNav Was Not Being Enabled.

  31/05/12 [V5.0 R6.0] /MK Change - Changes To The Grids On Manual - No Need To Save As Grid Automatically Posts To The Table.

  05/07/12 [V5.0 R7.5] /MK Bug Fix - Fixed Problem With The FromYear And ToYear Not Showing Current Years From Database.
                                   - Enable/Disable Controls Not Enabling Save and Read File Correctly.

  20/08/12 [V5.0 R8.6] /MK Change - Read file to StringList and then process.

  10/10/12 [V5.1 R0.3] /MK Bug Fix - Prompt save of database after import.

  19/10/12 [V5.1 R0.5] /MK Change - Changed layout of Filter options - program now allows for both filter of statement and tank.
                                  - Created one procedure to Enable or Disable Details and Filters - removed old separate procedures.

  05/03/14 [V5.2 R8.8] /MK Bug Fix - Caption of 2nd & 3rd TCB columns were set to TBC.

  26/11/15 [V5.5 R1.3] /MK Bug Fix - Removed all average footers for percentage fields i.e. fat%, prot%, lactose% and solids non fat%
                                     in both the Milk Statement and Bulk Tank grid - GL/Brendan Meade (6980) request.
                                   - Discussed adding weighted kg values to the grid i.e. ( bfat/prot% x 100 ) / liquid milk + processed milk but
                                     GL thought best not to add this in yet as no one was looking for it.

  11/04/17 [V5.6 R5.7] /MK Bug Fix - FormCloseQuery - CanClose was not assigned from MessageDlg if Preferences.AllowBulkTankEdit was not selected.
}

unit uMilkTankRead;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, dbTables, StdCtrls, ExtCtrls, Grids, DBGridEh, RXCtrls, ComCtrls,
  ToolWin, uSPParser, DBCtrls, DateUtil, RXDBCtrl, Menus, Buttons, Mask,
  ToolEdit, DBGrids, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxCustomData, cxButtons, cxContainer, cxEdit, cxGroupBox;

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
    pTankFilter: TPanel;
    gbFilterTank: TcxGroupBox;
    Label3: TLabel;
    Label10: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    btnFilterBulkTank: TcxButton;
    pStatementFilter: TPanel;
    gbFilterStatement: TGroupBox;
    lMonth: TLabel;
    lYear: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    cbFromYear: TComboBox;
    cbFromMonth: TComboBox;
    cbToYear: TComboBox;
    cbToMonth: TComboBox;
    btnFilterStatement: TcxButton;
    pDateFilterHeader: TPanel;
    Label15: TLabel;
    Panel5: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbImportClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure dbgMilkStatementsGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure sbReviewClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure pmiAllowManualEditClick(Sender: TObject);
    procedure StatementNavClick(Sender: TObject; Button: TNavigateBtn);
    procedure BulkNavClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnFilterStatementClick(Sender: TObject);
    procedure btnFilterBulkTankClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
     UpdatesPending,
     ProblemsOnDisk : Boolean;
     tMilkStatements,
     tBulkTank : TTable;
     dsMilkStatements,
     dsBulkTank : TDataSource;
     FFileName : String;
     FLine : String;
     ReadErrors : TStringList;
     FilterType : TFilterType;
     DisplayData : TDisplayData;
     qFilterTank : TQuery;
     qFilterStatement : TQuery;
     dsFilterTank : TDataSource;
     dsFilterStatement : TDataSource;
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
     procedure ResetForm;
     procedure AddRecord(ATable : TTable);
     procedure cxgMilkStatementGridManualKeyDown(Sender: TObject;
       var Key: Word; Shift: TShiftState);
    procedure cxgBulkTankGridManualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CreateDateFilters;
    procedure SetFilterButtonStyle(AEnable: Boolean;
      var AButton: TcxButton);
    procedure EnableDisableDetailsandToolBar(AEnable: Boolean);
    procedure EnableDisableTableViewPropertes(AEnable : Boolean; ADBTableView : TcxGridDBTableView);
    procedure EnableDisableFilters(AEnableStatement, AEnableBulkTank : Boolean);
  public
    { Public declarations }
  end;

const
   { Units }
   UM_Litres = 0;
   sUM_Litres = 'LITRES';

   BtnCap_ApplyFilter = 'Apply Filter';
   BtnCap_ClearFilter = 'Clear Filter';
   tmpFileName = 'tmpBulkTankFile.txt';

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
      cxgMilkStatementDBTableView.DataController.DataSource := dsMilkStatements;
      StatementNav.DataSource := dsMilkStatements;
      StatementRecCount.DataSource := dsMilkStatements;

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

      UpdatesPending := False;

      qFilterTank := TQuery.Create(nil);
      qFilterTank.DatabaseName := AliasName;

      dsFilterTank := TDataSource.Create(nil);
      dsFilterTank.DataSet := qFilterTank;

      qFilterStatement := TQuery.Create(nil);
      qFilterStatement.DatabaseName := AliasName;

      dsFilterStatement := TDataSource.Create(nil);
      dsFilterStatement.DataSet := qFilterStatement;

   except
      on E : Exception do
         raise Exception.Create('Unable to open Milk Tank database tables.'+#13#10+cErrorContact);
   end;
end;

procedure TfmMilkTankRead.FormCreate(Sender: TObject);
var
   ThisYear : String;
   bStatementHasData,
   bTankHasData : Boolean;
begin
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbImport.Glyph,cBtnImgLoad);
   WinData.LoadBtnImage(WinData.Images,sbOptions.Glyph,cBtnImgOptions);
   WinData.LoadBtnImage(WinData.Images,sbSave.Glyph,cBtnImgSave);
   WinData.LoadBtnImage(WinData.Images,sbReview.Glyph,cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);

   lMonth.Show;
   lYear.Show;
   cbFromMonth.Show;
   cbFromYear.Show;
   cbToYear.Show;
   cbToMonth.Show;

   pProgress.Hide;
   CreateAndOpenTables;
   ReadErrors := TStringList.Create;
   FilterType := ftStatements;
   DisplayData := ddThisImport;

   sbOptions.Visible := True;

   ResetForm;
   sbSave.Enabled := False;

   bStatementHasData := ( cxgMilkStatementDBTableView.DataController.DataSource.DataSet.RecordCount > 0 );
   bTankHasData := ( cxgBulkTankDetailsDBTableView.DataController.DataSource.DataSet.RecordCount > 0 );
   EnableDisableFilters(bStatementHasData, bTankHasData);
end;

procedure TfmMilkTankRead.FormDestroy(Sender: TObject);
begin
   //   20/08/12 [V5.0 R8.6] /MK Change - Delete read bulk tank file to recycle bin.
   if FileExists(FFileName) then
      DeleteFile(FFileName,True);

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

   if qFilterTank <> nil then
      try
         qFilterTank.Active := False;
      finally
         qFilterTank.Free;
      end;

   if dsFilterTank <> nil then
      dsFilterTank.Free;

   if qFilterStatement <> nil then
      try
         qFilterStatement.Active := False;
      finally
         qFilterStatement.Free;
      end;

   if dsFilterStatement <> nil then
      dsFilterStatement.Free;

   WinData.MilkCheque.Close;
   WinData.MilkTank.Close;

   if ReadErrors <> nil then
      ReadErrors.Free;
end;

procedure TfmMilkTankRead.sbExitClick(Sender: TObject);
begin
   if ( WinData.MilkCheque.RecordCount > 0 ) then
      begin
         if ( not(WinData.MilkCheque.FieldByName('CalMthEnd').AsDateTime > 0) ) then
            WinData.MilkCheque.Delete;
      end;
   if ( WinData.MilkTank.RecordCount > 0 ) then
      begin
         if ( not(WinData.MilkTank.FieldByName('DateCollected').AsDateTime > 0) ) then
            WinData.MilkTank.Delete;
      end;
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

procedure TfmMilkTankRead.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := ( not(UpdatesPending) );
   if ( not(CanClose) ) then
      begin
         if ( Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] = True ) then
            CanClose := ( MessageDlg('Records have not been saved, exit anyway?', mtConfirmation,[mbYes,mbNo],0) = idYes )
         else
            CanClose := ( MessageDlg('File content has not been saved, exit anyway?', mtConfirmation,[mbYes,mbNo],0) = idYes );
      end;
end;

procedure TfmMilkTankRead.Button1Click(Sender: TObject);
begin
   Splitter2.Hide;
   pErrors.Hide;
   if ( MessageDlg('Do you want to save disk contents to database?', mtConfirmation, [mbYes,mbNo],0) = idYes ) then
      SaveToDatabase
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
   if ( sbReview.Down ) then
      begin
         DisplayData := ddAllImports;
         cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
         cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
         pOwner.Hide;
         sbImport.Enabled := False;
      end
   else
      begin
         DisplayData := ddThisImport;
         cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
         cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
         pOwner.Show;
         sbImport.Enabled := True;
      end;
   StatementNav.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
   StatementRecCount.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
   BulkNav.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
   BulkTankRecCount.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
end;

procedure TfmMilkTankRead.ImportFile;
var
   i : Integer;
   sFileName : String;
   MilkFile : TextFile;
   FileList : TStringList;
begin
   sFileName := ApplicationPath + tmpFileName;

   sbSave.Enabled := False;
   ProblemsOnDisk := False;
   lStatus.Caption := 'Importing File...';
   cbEditCheque.Show;
   try
      //  28/06/10 [V4.0 R3.8] /MK Additional Feature - New cxGrids introduced. Old grids removed.
      //  dbgMilkStatements.SumList.Active := False;
      //  dbgBulkTank.SumList.Active := False;

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

      //   20/08/12 [V5.0 R8.6] /MK Change - Load bulk tank file to StringList.
      FileList := TStringList.Create;
      FileList.LoadFromFile(FFileName);
      //   20/08/12 [V5.0 R8.6] /MK Change - Save StringList to file.
      FileList.SaveToFile(sFileName);
      //AssignFile(MilkFile, FFileName);
      //   20/08/12 [V5.0 R8.6] /MK Change - Assign saved StringList to Text File.
      AssignFile(MilkFile, sFileName);
      Reset(MilkFile);

      ProgressBar1.Max := FileSize(MilkFile);

      while not Eof(MilkFile) do
         begin
            Application.ProcessMessages;
            Readln(MilkFile, FLine);

            case RecordType of
               rtFileHeader : OutputHeader;
               rtMilkStatement : SaveStatementRecord;
               rtBulkTankRead : SaveBulkRecord;
            end;

            ProgressBar1.Position := FilePos(MilkFile);
         end;

      UpdatesPending := True;
      if not ProblemsOnDisk then
         StatusBar1.Panels[0].Text := 'File successfully imported.'
      else
         StatusBar1.Panels[0].Text := 'File imported - with errors on disk.';

      //   10/10/12 [V5.1 R0.3] /MK Bug Fix - Prompt save of database after import.
      sbSave.Enabled := True;
      sbSave.Click;

      EnableDisableFilters(FileList.Count > 0, FileList.Count > 0);

      CloseFile(MilkFile);
      FileList.Free;
      SysUtils.DeleteFile(sFileName);

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

   try
      qFilterStatement.SQL.Clear;
      qFilterStatement.SQL.Add(cSQL_SELECTALL + WinData.MilkCheque.TableName);
      qFilterStatement.SQL.Add('WHERE ( CalMthEnd Between "'+FromDate+'" AND "'+ToDate+'" )');
      qFilterStatement.Open;
   finally
      cxgMilkStatementDBTableView.DataController.DataSource := dsFilterStatement;
      StatementRecCount.DataSource := dsFilterStatement;
   end;

end;

procedure TfmMilkTankRead.FilterBulkTankReadings(FromDate,
  ToDate: TDateTime);
begin
   try
      qFilterTank.SQL.Clear;
      qFilterTank.SQL.Add(cSQL_SELECTALL + WinData.MilkTank.TableName);
      qFilterTank.SQL.Add('WHERE ( DateCollected Between "'+FormatDateTime(cUSDateStyle,FromDate)+'" AND "'+FormatDateTime(cUSDateStyle,ToDate)+'" )');
      qFilterTank.Open;
   finally
      cxgBulkTankDetailsDBTableView.DataController.DataSource := dsFilterTank;
      BulkTankRecCount.DataSource := dsFilterTank;
   end;
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
         ResetForm;
      end
   else
      begin
         pmiAllowManualEdit.Checked := False;
         Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] := False;
         ResetForm;
      end;
end;

procedure TfmMilkTankRead.StatementNavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   if ( Button = nbInsert ) then
      AddRecord(WinData.MilkCheque);
end;

procedure TfmMilkTankRead.BulkNavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   if ( Button = nbInsert ) then
      AddRecord(WinData.MilkTank);
end;

procedure TfmMilkTankRead.ResetForm;
begin
   cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
   cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;

   if Preferences.ValueAsBoolean[cGSAllowBulkTankEdit] then
      begin
         pmiAllowManualEdit.Checked := True;
         sbImport.Visible := False;
         sbReview.Enabled := False;

         WinData.MilkCheque.CachedUpdates := False;
         WinData.MilkTank.CachedUpdates := False;

         StatementNav.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
         StatementRecCount.DataSource := cxgMilkStatementDBTableView.DataController.DataSource;
         EnableDisableTableViewPropertes(True,cxgMilkStatementDBTableView);

         BulkNav.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
         BulkTankRecCount.DataSource := cxgBulkTankDetailsDBTableView.DataController.DataSource;
         EnableDisableTableViewPropertes(True,cxgBulkTankDetailsDBTableView);

         EnableDisableDetailsandToolBar(False);
         AddRecord(WinData.MilkTank);
         AddRecord(WinData.MilkCheque);
      end
   else
      begin
         pmiAllowManualEdit.Checked := False;
         sbImport.Visible := True;
         sbReview.Enabled := True;

         WinData.MilkCheque.CachedUpdates := True;
         WinData.MilkTank.CachedUpdates := True;

         StatementNav.DataSource := nil;
         StatementRecCount.DataSource := nil;

         BulkNav.DataSource := nil;
         BulkTankRecCount.DataSource := nil;

         EnableDisableTableViewPropertes(False,cxgMilkStatementDBTableView);
         EnableDisableTableViewPropertes(False,cxgBulkTankDetailsDBTableView);

         EnableDisableDetailsandToolBar(True);
      end;
end;

procedure TfmMilkTankRead.cxgMilkStatementGridManualKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_DOWN ) then
      begin
         AddRecord(WinData.MilkCheque);
      end;
end;

procedure TfmMilkTankRead.cxgBulkTankGridManualKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_DOWN ) then
      begin
         AddRecord(WinData.MilkTank);
      end;
end;

procedure TfmMilkTankRead.AddRecord(ATable : TTable);
begin
   if ( ATable.RecordCount > 0 ) then
      begin
         if ( ATable.State = dsInsert ) then
            begin
               ATable.Post;
               ATable.Append;
            end
         else
            ATable.Append;
      end
   else
      ATable.Append;
end;

procedure TfmMilkTankRead.CreateDateFilters;
var
   i : Integer;
   CurrStateDate : TDateTime;
   CurrStateYear, Year : String;
begin
   cbFromYear.Items.Clear;
   CurrStateDate := 0;
   CurrStateYear := '';
   Year := '';
   for i := 0 to cxgMilkStatementDBTableView.DataController.RecordCount-1 do
      begin
         if ( cxgMilkStatementDBTableView.DataController.Values[i,cxgMilkStatementDBTableViewDateStart.Index] > 0 ) then
            begin
               CurrStateDate := cxgMilkStatementDBTableView.DataController.Values[i,cxgMilkStatementDBTableViewDateStart.Index];
               CurrStateYear := IntToStr(ExtractYear(CurrStateDate));
               if CurrStateYear > Year then
                  begin
                     Year := CurrStateYear;
                     cbFromYear.Items.Add(Year);
                  end;
            end;
      end;

   cbFromYear.ItemIndex := 0;
   cbToYear.Clear;
   cbToYear.Items.Assign(cbFromYear.Items);

   cbFromMonth.ItemIndex := 0;
   cbFromYear.ItemIndex := 0;

   cbToMonth.ItemIndex := DateUtil.ExtractMonth(CurrStateDate)-1;
   cbToYear.ItemIndex := cbFromYear.Items.IndexOf(Year);

   if FromDate.Date <= 0 then
      FromDate.Date := IncMonth(Date, -3);
   if ToDate.Date <= 0 then
      ToDate.Date := Date;
end;

procedure TfmMilkTankRead.btnFilterStatementClick(Sender: TObject);
begin
   if Sender is TcxButton then
      begin
         if ( (Sender as TcxButton).Tag = 0 ) then
            begin
               SetFilterButtonStyle(False,btnFilterStatement);
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
            end
         else if ( (Sender as TcxButton).Tag = 1 ) then
            begin
               SetFilterButtonStyle(True,btnFilterStatement);
               qFilterStatement.Active := False;

               cxgMilkStatementDBTableView.DataController.DataSource := WinData.dsMilkCheque;
               if DisplayData = ddThisImport then
                  StatementRecCount.DataSource := dsMilkStatements
               else
                  StatementRecCount.DataSource := WinData.dsMilkCheque;
            end;
      end;
end;

procedure TfmMilkTankRead.btnFilterBulkTankClick(Sender: TObject);
begin
   if ( Sender is TcxButton ) then
      if ( (Sender as TcxButton).Tag = 0 ) then
         begin
            SetFilterButtonStyle(False,btnFilterBulkTank);
            try
               Screen.Cursor := crHourGlass;
               FilterBulkTankReadings(FromDate.Date, ToDate.Date);
            finally
               Screen.Cursor := crDefault;
            end;
         end
      else if ( (Sender as TcxButton).Tag = 1 ) then
         begin
            SetFilterButtonStyle(True,btnFilterBulkTank);
            qFilterTank.Active := False;
            cxgBulkTankDetailsDBTableView.DataController.DataSource := WinData.dsMilkTank;
            if DisplayData = ddThisImport then
               BulkTankRecCount.DataSource := dsBulkTank
            else
               BulkTankRecCount.DataSource := WinData.dsMilkTank;
         end;
end;

procedure TfmMilkTankRead.SetFilterButtonStyle ( AEnable : Boolean;
   var AButton : TcxButton);
begin
   if AEnable then
      begin
         AButton.Caption := BtnCap_ApplyFilter;
         AButton.Font.Color := clBlack;
         AButton.Font.Style := AButton.Font.Style - [fsBold];
         AButton.Tag := 0;
      end
   else
      begin
         AButton.Caption := BtnCap_ClearFilter;
         AButton.Font.Color := clRed;
         AButton.Font.Style := AButton.Font.Style + [fsBold];
         AButton.Tag := 1;
      end;
end;

procedure TfmMilkTankRead.EnableDisableDetailsandToolBar ( AEnable : Boolean );
begin
   pOwner.Enabled := AEnable;
   Label4.Enabled := AEnable;
   Label7.Enabled := AEnable;
   Label8.Enabled := AEnable;
   eFileName.Enabled := AEnable;
   mOwner.Enabled := AEnable;
   Label6.Enabled := AEnable;
   eMilkCo.Enabled := AEnable;
   Label5.Enabled := AEnable;
   eStatementDate.Enabled := AEnable;
   cbEditCheque.Visible := AEnable;
   StatementNav.Enabled := not(AEnable);
   BulkNav.Enabled := not(AEnable);

   sbImport.Visible := AEnable;
   sbImport.Enabled := AEnable;

   sbSave.Visible := AEnable;
   sbSave.Enabled := AEnable;

   if not(AEnable) then
      begin
         sbImport.Width := 0;
         sbImport.Caption := '';
         ToolButton2.Width := 0;
         ToolButton2.Style := tbsSeparator;

         sbSave.Width := 0;
         sbSave.Caption := '';
         ToolButton5.Width := 0;
         ToolButton5.Style := tbsSeparator;
      end
   else
      begin
         sbImport.Width := 108;
         sbImport.Caption := '&Read File';
         sbImport.Enabled := True;
         ToolButton2.Width := 5;
         ToolButton2.Style := tbsDivider;

         sbSave.Width := 88;
         sbSave.Caption := '&Save';
         sbSave.Enabled := True;
         ToolButton5.Width := 5;
         ToolButton5.Style := tbsDivider;
      end;
end;

procedure TfmMilkTankRead.FormActivate(Sender: TObject);
begin
   btnFilterBulkTank.Enabled := cxgBulkTankDetailsDBTableView.DataController.DataSource.DataSet.RecordCount > 0;
   btnFilterStatement.Enabled := cxgMilkStatementDBTableView.DataController.DataSource.DataSet.RecordCount > 0;

   OnActivate := nil;
end;

procedure TfmMilkTankRead.EnableDisableTableViewPropertes(AEnable: Boolean;
  ADBTableView: TcxGridDBTableView);
begin
   with ADBTableView do
      begin
         OptionsData.Editing := AEnable;
         OptionsData.Appending := AEnable;
         OptionsSelection.CellSelect := AEnable;
         OptionsBehavior.FocusCellOnTab := AEnable;
         OptionsBehavior.FocusFirstCellOnNewRecord := AEnable;
         if AEnable then
            begin
               DataController.Options := [dcoAssignGroupingValues,dcoAssignMasterDetailKeys,dcoSaveExpanding,dcoImmediatePost];
               if ADBTableView.Name = 'cxgMilkStatementDBTableView' then
                  ADBTableView.OnKeyDown := cxgMilkStatementGridManualKeyDown
               else if ADBTableView.Name = 'cxgBulkTankDetailsDBTableView' then
                  ADBTableView.OnKeyDown := cxgBulkTankGridManualKeyDown;
            end
         else
            DataController.Options := [];
      end;
end;

procedure TfmMilkTankRead.EnableDisableFilters(AEnableStatement,
   AEnableBulkTank : Boolean);
begin
   lMonth.Enabled := AEnableStatement;
   lYear.Enabled := AEnableStatement;
   Label11.Enabled := AEnableStatement;
   Label14.Enabled := AEnableStatement;
   cbFromMonth.Enabled := AEnableStatement;
   cbToMonth.Enabled := AEnableStatement;
   cbFromYear.Enabled := AEnableStatement;
   cbToYear.Enabled := AEnableStatement;
   btnFilterStatement.Enabled := AEnableStatement;

   Label3.Enabled := AEnableBulkTank;
   FromDate.Enabled := AEnableBulkTank;
   Label10.Enabled := AEnableBulkTank;
   ToDate.Enabled := AEnableBulkTank;
   btnFilterBulkTank.Enabled := AEnableBulkTank;

   if ( AEnableBulkTank or AEnableStatement ) then
      CreateDateFilters;
end;

end.