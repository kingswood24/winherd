unit uHerdRec;

{
   Herd Reconciliation SP 15/03/2003

   01/04/11 [V4.0 R9.1] /SP Additional Feature - Look At New FilteredTableName Property In uSQLFilters.

   06/05/11 [V4.1 R0.1] /MK Change - Show Load From File Screen On FormCreate
                                   - Default CMMSDataFile OpenDialog FileName To herdprofile.txt
                                   - Default Files Of Type To Text If Ireland And XL If England.
                                   - Status Bar Should Show Matched and Not Matched After File Is Loaded.

   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.

   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   12/03/13 [V5.1 R5.2] /MK Change - Added QuickReportFilters for Web, CSV, XL, Word and Text.

   05/05/17 [V5.6 R8.0] /MK Change - Removed Load File as its not required any longer. This screen is not used
                                     in England since the HerdRec was done with CTS Online - GL/Sean Tynan request.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RXCtrls, RXDBCtrl, Menus, StdCtrls, Mask, DBCtrlsEh, Grids,
  DBGridEh, ComCtrls, ToolWin, QuickRpt, Qrctrls, ExtCtrls, PrnDbgeh,
  ToolEdit, uSQLFilters, OleServer, Excel97, GenTypesConst, uSPParser,
  jpeg, cxControls, cxContainer, cxEdit, cxImage, mmSystem, cxCheckBox,
  QRExport;

type
  THerdRec = class(TForm)
    AnimalGrid: TDBGridEh;
    dsAnimalTable: TDataSource;
    PopupMenu1: TPopupMenu;
    qAnimals: TQuery;
    AnimalTable: TTable;
    UseBarCodeScanner1: TMenuItem;
    UseKeyBoardInput1: TMenuItem;
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    sbSettings: TRxSpeedButton;
    PrintDBGridEh1: TPrintDBGridEh;
    sbPrint: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    NotFound1: TMenuItem;
    NotSearched1: TMenuItem;
    Found1: TMenuItem;
    tCMMS: TTable;
    CMMSDatafile: TOpenDialog;
    XLApp: TExcelApplication;
    Panel1: TPanel;
    Label2: TLabel;
    StockDate: TDateEdit;
    lInputType: TLabel;
    SearchNatIDNum: TDBEditEh;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Report: TQuickRep;
    PageHeaderBand2: TQRBand;
    lHeader: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRSubDetail2: TQRSubDetail;
    NatIDNum: TQRDBText;
    PageFooterBand2: TQRBand;
    VerLabel: TQRLabel;
    SummaryBand1: TQRBand;
    Total: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    Parser: TSPParser;
    sbOptions: TRxSpeedButton;
    ToolButton6: TToolButton;
    PopupMenu3: TPopupMenu;
    SelectAllAnimals1: TMenuItem;
    DeSelectAllAnimals1: TMenuItem;
    StatusBar1: TStatusBar;
    imgBarcode: TcxImage;
    Timer1: TTimer;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    SPParser1: TSPParser;
    cbFavourite: TcxCheckBox;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure FormCreate(Sender: TObject);
    procedure SearchNatIDNumChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure UseBarCodeScanner1Click(Sender: TObject);
    procedure UseKeyBoardInput1Click(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure Found1Click(Sender: TObject);
    procedure AnimalGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure sbLoadClick(Sender: TObject);
    procedure AnimalGridDblClick(Sender: TObject);
    procedure RemainingEnter(Sender: TObject);
    procedure DeSelectAllAnimals1Click(Sender: TObject);
    procedure SelectAllAnimals1Click(Sender: TObject);
    procedure StockDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure SearchNatIDNumExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbHelpClick(Sender: TObject);
    procedure StockDateChange(Sender: TObject);
    procedure StockDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StockDateExit(Sender: TObject);
    procedure CMMSDatafileShow(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    CheckStockDate : Boolean;
    NumFound : Integer;
    UseScanner : Boolean;
    F : TextFile;
    SQLFilter : TSQLFilter;
    MassAdd : Boolean;
    DefaultCountry : TCountry;
    DefaultHeading : ShortString;
    LastScannedTagNotFound : string;
    procedure LoadAnimals(AStockDate : TDateTime);overload;
    procedure LoadAnimals;overload;
    procedure Import;
    procedure MatchFromFile;
    procedure MatchFromHerd;
    procedure OutputResults;
    procedure ClearFields;
    procedure GetRawData;
    procedure PopulateFromExcel(Matrix : Variant; X, Y : Integer);
  public
    { Public declarations }
  end;

  //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
  procedure CreateAndShow( AHerdID : Integer; AReconcileByCard, AFromMainGridClick : Boolean );

const
   BCMS_RecTypeFieldIndex = 2;
   BCMS_NatIdFieldIndex = 4;
   StartRow = 2;
var
  HerdRec: THerdRec;
  FHerdID : Integer;
  FReconcileByCards,
  FFromMainGridClick : Boolean;

implementation

uses DairyData, KRoutines;

{$R *.DFM}

  //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
  procedure CreateAndShow( AHerdID : Integer; AReconcileByCard, AFromMainGridClick : Boolean );
  begin
     if (AHerdID = 0) then
        begin
           MessageDlg('Unable to proceed. You must select a valid Herd',mtWarning,[mbOK],0);
           Exit;
        end;

     //   Check if the newer direct link to AIM exists.
     //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
     FFromMainGridClick := AFromMainGridClick;
     FReconcileByCards := AReconcileByCard;
     if (WinData.CanMakeAIMRequests) and ( not(FReconcileByCards) ) then
        begin
           WinData.GoToHerdProfile(WinData.UserDefaultHerdId);
           Exit;
        end;

     try
        FHerdID := AHerdID;
        Application.CreateForm(THerdRec, HerdRec);
        HerdRec.ShowModal;
     finally
        with HerdRec do
           begin
              SafeFreeAndNil(SQLFilter);
              AnimalTable.Close;
              AnimalTable.DeleteTable;
              qAnimals.Cancel;
              qAnimals.Close;
              FreeAndNil(HerdRec);
           end;

     end;
  end;

procedure THerdRec.FormCreate(Sender: TObject);
begin
   Timer1.Enabled := False;
   { Ge the registered country for the default herd }
   DefaultCountry := Windata.UserDefaultHerdCountry;
   if DefaultCountry = Ireland then
      DefaultHeading := 'CMMS'
   else if DefaultCountry = England then
      DefaultHeading := 'BCMS'
   else
      DefaultHeading := '';

   { Set the form caption }
   if ( DefaultHeading <> '' ) then
      Caption := DefaultHeading + ' Livestock Reconciliation'
   else
      Caption := 'Livestock Reconciliation';

   Report.Hide;

   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint2);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);

   { Default stock date to today }
   StockDate.Date := Date;
   { Default to use barcode scanner }
   UseScanner := Windata.UseScanner;

   { Hide the selected checkbox grid column }
   AnimalGrid.Columns[0].Visible := False;

   { Hide the manual input options }
   sbOptions.Visible := False;

   { Create HerdRec table }
   AnimalTable.TableName := 'HerdRec';
   AnimalTable.FieldDefs.Clear;
   AnimalTable.FieldDefs.Add('ID', ftInteger, 0, False);
   AnimalTable.FieldDefs.Add('NatIDNum', ftString, 20, False);
   AnimalTable.FieldDefs.Add('SortNatIDNum', ftString, 20, False);
   AnimalTable.FieldDefs.Add('AnimalNo', ftString, 10, False);
   AnimalTable.FieldDefs.Add('SortAnimalNo', ftString, 10, False);
   AnimalTable.FieldDefs.Add('Sex', ftString, 10, False);
   AnimalTable.FieldDefs.Add('Found', ftBoolean, 0, False);
   AnimalTable.FieldDefs.Add('SearchField', ftString, 20, False);
   with AnimalTable.IndexDefs do
      begin
         Clear;
         Add('iID', 'ID', [ixPrimary, ixUnique]);
         Add('aSortNatID', 'SortNatIDNum', [ixCaseInsensitive]);
         Add('aSortAnimalNo', 'SortAnimalNo', [ixCaseInsensitive]);
         Add('aSex', 'Sex', [ixCaseInsensitive]);
         Add('dSortNatID', 'SortNatIDNum', [ixDescending, ixCaseInsensitive]);
         Add('dSortAnimalNo', 'SortAnimalNo', [ixDescending, ixCaseInsensitive]);
         Add('dSex', 'Sex', [ixDescending, ixCaseInsensitive]);
      end;
   AnimalTable.CreateTable;

   SQLFilter := TSQLFilter.Create;
   SQLFilter.SQLOp := sqlAllStock;
   SQLFilter.StockDate := StockDate.Date;
   SQLFilter.HerdID := FHerdID;
   SQLFilter.OpenSQL(cAllStockOnDate);
   LoadAnimals;
end;

procedure THerdRec.SearchNatIDNumChange(Sender: TObject);
   procedure NatIDFound;
   begin
      if not AnimalTable.FieldByName('Found').AsBoolean then
         begin
            AnimalTable.Edit;
            AnimalTable.FieldByName('Found').AsBoolean := True;
            AnimalTable.Post;

            Inc(NumFound);
            StatusBar1.Panels[1].Text := 'Found: '+ IntToStr(NumFound);
            StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
         end;
      { Only Clear Edit Box if scanning, handy to leave with existing NatID, makes search alot quicker. }
      if UseScanner then
         SearchNatIDNum.Text := '';
   end;

var
   sField : String;
begin
   if UseScanner then Exit;
   if Length(Trim(SearchNatIDNum.Text)) > 0 then
      begin
         if UseScanner then
            begin
               sField := 'SearchField';
               AnimalGrid.Columns[0].Visible := False;
               sbOptions.Visible := False;
            end
         else
            begin
               sField := 'NatIDNum';
               AnimalGrid.Columns[0].Visible := True;
               sbOptions.Visible := True;
            end;
         if (AnimalGrid.DataSource.DataSet.Locate(sField, Trim(SearchNatIDNum.Text), [] )) then
            NatIDFound;
      end;
end;

procedure THerdRec.FormShow(Sender: TObject);
begin
   ClearFields;
   StatusBar1.Panels[1].Text := 'Found: '+ IntToStr(NumFound);
   StatusBar1.Panels[0].Text := 'Total: '+ IntToStr(AnimalTable.RecordCount);
   StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);

   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
   WinData.UpdateRecentReportUsage(cCMMSRecRep);
   if FFromMainGridClick then
      cbFavourite.Visible := False
   else
      cbFavourite.Checked := WinData.IsReportFavourite(cCMMSRecRep);
end;

procedure THerdRec.AnimalGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
   if AnimalTable.FieldByName('Found').isnull  then
      AnimalGrid.Canvas.Font.Color := clBlack
   else if AnimalTable.FieldByName('Found').AsBoolean = False then
      AnimalGrid.Canvas.Font.Color := clRed
   else if AnimalTable.FieldByName('Found').AsBoolean = True then
      AnimalGrid.Canvas.Font.Color := clBlue;

   AnimalGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure THerdRec.UseBarCodeScanner1Click(Sender: TObject);
begin
   UseBarCodeScanner1.Checked := True;
   UseScanner := True;
   AnimalGrid.Columns[0].Visible := False;
   sbOptions.Visible := False;
   lInputType.Caption := 'Scan Nat. Id. No. >>';
   imgBarcode.Visible := True;
   StatusBar1.Panels[3].Text := cBarCodeScannerOnCaption;
end;

procedure THerdRec.UseKeyBoardInput1Click(Sender: TObject);
begin
   UseKeyBoardInput1.Checked := True;
   UseScanner := False;
   AnimalGrid.Columns[0].Visible := True;
   sbOptions.Visible := True;
   lInputType.Caption := 'Type Nat. Id. No >>';
   imgBarcode.Visible := False;
   StatusBar1.Panels[3].Text := cBarCodeScannerOffCaption;
end;

procedure THerdRec.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure THerdRec.Found1Click(Sender: TObject);
var
   TempHeader : String;
begin
   case TMenuItem(Sender).Tag of
      0 : AnimalTable.Filter := 'Found = True';
      1 : AnimalTable.Filter := 'Found = False';
      2 : AnimalTable.Filter := 'Found IS NULL';
   end;
   AnimalTable.Filtered := True;
   TempHeader := TMenuItem(Sender).Caption;
   Delete(TempHeader, Pos('&', TempHeader), 1);
   PrintDBGridEh1.PageFooter.LeftText.Clear;
   PrintDBGridEh1.PageFooter.LeftText.Add('Total: '+IntToStr(AnimalTable.RecordCount));
   PrintDBGridEh1.PageHeader.LeftText.Clear;
   PrintDBGridEh1.PageHeader.LeftText.Add('Herd Reconciliation - Animals '+ TempHeader);
   PrintDBGridEh1.Preview;
   AnimalTable.Filter := '';
   AnimalTable.Filtered := False;
end;

procedure THerdRec.AnimalGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  case Column.Index of
     1 : case Column.Title.SortMarker of
            smDownEh: begin
                         Column.Title.SortMarker := smUpEh;
                         AnimalTable.IndexName := 'dSortNatID';
                      end;
            smUpEh,
            smNoneEh: begin
                         Column.Title.SortMarker := smDownEh;
                         AnimalTable.IndexName := 'aSortNatID';
                      end;
          end;
      2 : case Column.Title.SortMarker of
            smDownEh: begin
                         Column.Title.SortMarker := smUpEh;
                         AnimalTable.IndexName := 'dSortAnimalNo';
                      end;
            smUpEh,
            smNoneEh: begin
                         Column.Title.SortMarker := smDownEh;
                         AnimalTable.IndexName := 'aSortAnimalNo';
                      end;
          end;
      3 : case Column.Title.SortMarker of
            smDownEh: begin
                         Column.Title.SortMarker := smUpEh;
                         AnimalTable.IndexName := 'dSex';
                      end;
            smUpEh,
            smNoneEh: begin
                         Column.Title.SortMarker := smDownEh;
                         AnimalTable.IndexName := 'aSex';
                      end;
          end;
   end;
   AnimalTable.First;
end;

procedure THerdRec.sbLoadClick(Sender: TObject);
begin
   StatusBar1.Panels[1].Text := '';
   StatusBar1.Panels[2].Text := '';
   CMMSDatafile.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
   if CMMSDatafile.Execute then
      if not fileExists(CMMSDatafile.FileName) then
         ShowMessage('Unable to find '+DefaultHeading+' datafile')
      else
         begin
            Import;
            Application.ProcessMessages;
            MatchFromFile;
            Application.ProcessMessages;
            MatchFromHerd;
            Application.ProcessMessages;
            OutputResults;
            Application.ProcessMessages;
            tCMMS.Close;
            tCMMS.DeleteTable;
         end;
end;

procedure THerdRec.Import;
var
   Buffer : String;
begin
   with tCMMS do
      begin
         FieldDefs.Clear;
         FieldDefs.Add('NatIDNum', ftString, 20, False);
         FieldDefs.Add('FNatIDNum', ftString, 20, False);
         FieldDefs.Add('Found', ftBoolean, 0, False);
         CreateTable;
         Open;
      end;
   GetRawData;
end;

procedure THerdRec.MatchFromFile;
begin
   with tCMMS do
      begin
         First;
         while not eof do
            begin
               Edit;
               if AnimalTable.Locate('SearchField', tCMMS.FieldByName('NatIDNum').AsString, [] ) then
                  FieldByName('Found').AsBoolean := True
               else
                  FieldByName('Found').AsBoolean := False;
               Post;
               Next;
            end;
      end;
end;

procedure THerdRec.MatchFromHerd;
begin
   with AnimalTable do
      begin
         First;
         while not eof do
            begin
               Edit;
               if tCMMS.Locate('NatIDNum', AnimalTable.FieldByName('SearchField').AsString, [] ) then
                  FieldByName('Found').AsBoolean := True
               else
                  FieldByName('Found').AsBoolean := False;
               Post;
               Next;
            end;
      end
end;

procedure THerdRec.OutputResults;
begin
   tCMMS.Filter := 'Found = False';
   tCMMS.Filtered := True;
   VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK

   if tCMMS.RecordCount > 0 then
      begin
         MessageDlg('Some animals on '+DefaultHeading+' datafile have not been found on your Herd database'+#13+
                    'Click OK to preview these animals',mtWarning,[mbOk],0);
         lHeader.Caption := DefaultHeading+' Datafile Animals NOT found on your Herd database';

         NatIDNum.DataField := 'FNatIDNum';
         NatIDNum.DataSet := tCMMS;
         Report.DataSet := tCMMS;
         Total.Caption := 'Total: '+IntToStr(tCMMS.RecordCount);
         Report.Preview;
      end
   else
      MessageDlg('ALL animals on the '+DefaultHeading+' datafile have been found on your Herd database.',mtinformation,[mbOk],0);

   tCMMS.Filter := '';
   tCMMS.Filtered := False;

   AnimalTable.DisableControls;
   AnimalTable.Filter := 'Found = False';
   AnimalTable.Filtered := True;

   if AnimalTable.RecordCount > 0 then
      begin
         MessageDlg('Some animals on your Herd database have not been found on '+DefaultHeading+' datafile'+#13+
                    'Click OK to preview these animals',mtWarning,[mbOk],0);
         lHeader.Caption := 'Animals on your Herd database NOT found in '+DefaultHeading+' datafile';

         NatIDNum.DataField := 'NatIDNum';
         NatIDNum.DataSet := AnimalTable;
         Report.DataSet := AnimalTable;

         Total.Caption := 'Total: '+IntToStr(AnimalTable.RecordCount);
         Report.Preview;
      end
   else
      MessageDlg('ALL animals on your Herd database have been found on the '+DefaultHeading+' datafile',mtinformation,[mbOk],0);

   AnimalTable.Filter := '';
   AnimalTable.Filtered := False;
   AnimalTable.EnableControls;
end;

procedure THerdRec.LoadAnimals;
var
   Style : TNatIDStyle;
   Len : Byte;
   Str : String;
begin
   qAnimals.SQL.Clear;
   qAnimals.SQL.Add('Delete From '+AnimalTable.TableName+'');
   qAnimals.ExecSQL;

   qAnimals.SQL.Clear;
   qAnimals.SQL.Add('INSERT INTO HerdRec (ID, NatIDNum, SortNatIDNum, AnimalNo, SortAnimalNo, Sex)   ');
   qAnimals.SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.Sex ');
   qAnimals.SQL.Add('FROM Animals A                                              ');
   qAnimals.SQL.Add('WHERE (A.ID IN (Select Distinct AnimalID From '  + SQLFilter.FilteredTableName + ' ))   ');
   qAnimals.ExecSQL;

   AnimalTable.Active := True;

   ClearFields;
   StatusBar1.Panels[1].Text := 'Found: '+ IntToStr(NumFound);
   StatusBar1.Panels[0].Text := 'Total: '+ IntToStr(AnimalTable.RecordCount);
   StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);

   if AnimalTable.RecordCount > 0 then
      with AnimalTable do
         begin
            First;
            while not eof do
               begin
                  if Length(FieldByName('NatIDNum').AsString) > 0 then
                     begin
                        Edit;
                        Style := WhatStyleNatID(AnimalTable.FieldByName('NatIDNum').AsString, False );
                        Str := WinData.StripAllNomNumAlpha(AnimalTable.FieldByName('NatIDNum').AsString);
                        Len   := Length(Str);
                        // Remove "IE"
                        if ( ((Style = Style1999) and (Len = 14)) or ((Style = Style1996) and (Len = 11)) ) then
                           System.Delete(Str, 1, 2)
                        else if ( (Style = StyleEID) and (Len = 15) ) then 
                           System.Delete(Str, 1, 3);

                        FieldByName('SearchField').AsString := Str;
                        Post;
                     end;
                  Next;
               end;
            AnimalTable.IndexName := 'aSortNatID';
            First;
         end
   else
      MessageDlg('There are no animals to be shown for specified date',mtInformation,[mbOk],0);
end;

procedure THerdRec.ClearFields;
begin
   StatusBar1.Panels[0].Text := 'Total: 0';
   StatusBar1.Panels[2].Text := 'Remaining: 0';
   StatusBar1.Panels[1].Text := 'Found: 0';
end;

procedure THerdRec.GetRawData;
var
   WorkBook : _WorkBook;
   WorkSheet : _WorkSheet;
   x, y : Integer;
   RangeMatrix : Variant;
   sFile : WideString;
   Buffer, TempStr, FNatID : String;
   Style : TNatIDStyle;
   Len : Byte;
   Str : String;
   BCMSFile : TStringList;
   FBuffer : String;
   pTempStr : PChar;
begin
   if ( DefaultCountry = Ireland ) then
      begin
         if LowerCase(ExtractFileExt(CMMSDatafile.FileName)) = '.xls' then
            begin
               Screen.Cursor := crHourGlass;
               x := 1;
               sFile := CMMSDatafile.FileName;
               XLApp.Connect;
               XLApp.WorkBooks.Open(sFile,EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                                          EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                                          EmptyParam,EmptyParam,EmptyParam,EmptyParam,
                                          0);
               WorkBook := XLApp.WorkBooks.Item[x];
               WorkSheet := WorkBook.WorkSheets.Get_Item(1) as _WorkSheet;
               WorkSheet.Cells.SpecialCells(xlCellTypeLastCell,EmptyParam).Activate;
               X := XLApp.ActiveCell.Row;
               Y := XLApp.ActiveCell.Column;
               RangeMatrix := XLApp.Range['A1',XLApp.Cells.Item[X,Y]].Value;
               XLApp.Quit;
               XLApp.Disconnect;
               PopulateFromExcel(RangeMatrix, x, y);
            end
         else
            begin
               if Pos('Crush', CMMSDataFile.FileName) > 0 then
                  begin
                     AssignFile(F,  CMMSDataFile.FileName);
                     Reset(F);
                     while not eof(F) do
                        begin
                           ReadLn(F, Buffer);
                           if Trim(Buffer) = '' then Continue;

                           SetLength(Buffer, Length(Buffer));
                           Parser.Parse(Buffer);

                           pTempStr := PChar(Parser.Fields[2]);
                           TempStr := AnsiExtractQuotedStr(pTempStr, '"');
                           CheckNatID(TempStr, FNatID, True);
                           tCMMS.Append;
                           tCMMS.FieldByName('FNatIDNum').AsString := TempStr;
                           Style := WhatStyleNatID(TempStr, False );
                           Str := WinData.StripAllNomNumAlpha(TempStr);
                           Len := Length(TempStr);
                           if ( ((Style = Style1999) and (Len = 14)) or ((Style = Style1996) and (Len = 11)) ) then
                              System.Delete(Str, 1, 2)
                           else if ( (Style = StyleEID) and (Len = 15) ) then
                              System.Delete(Str, 1, 3);
                           tCMMS.FieldByName('NatIDNum').AsString := TempStr;
                           tCMMS.Post;
                        end;
                  end
               else
                  begin
                     AssignFile(F, CMMSDatafile.FileName);
                     Reset(F);
                     while not eof(F) do
                        begin
                           Buffer := '';
                           Readln(F, Buffer);
                           SetLength(Buffer, Length(Buffer)+1);
                           if Trim(Buffer) <> '' then
                              begin
                                 if Pos(',', Buffer) > 0 then
                                    begin
                                       TempStr := Copy(Buffer, 1, Pos(',', Buffer)-1);
                                       CheckNatID(TempStr, FNatID, False);
                                       tCMMS.Append;
                                       tCMMS.FieldByName('FNatIDNum').AsString := TempStr;
                                       Style := WhatStyleNatID(TempStr, False );
                                       Str := WinData.StripAllNomNumAlpha(TempStr);
                                       Len := Length(TempStr);
                                       if ( ((Style = Style1999) and (Len = 14)) or ((Style = Style1996) and (Len = 11)) ) then
                                          System.Delete(Str, 1, 2)
                                       else if ( (Style = StyleEID) and (Len = 15) ) then
                                          System.Delete(Str, 1, 3);
                                       tCMMS.FieldByName('NatIDNum').AsString := TempStr;
                                       tCMMS.Post;
                                       Inc(NumFound);
                                       StatusBar1.Panels[1].Text := 'Found: '+ IntToStr(NumFound);
                                    end;
                              end;
                        end;
                     end;
               CloseFile(F);
               StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
            end;
      end
   else if ( DefaultCountry = England ) then
      begin
         BCMSFile := TStringList.Create;
         try
            BCMSFile.LoadFromFile(CMMSDatafile.FileName);

            for x := 0 to Pred( BCMSFile.Count) do
                begin
                   Application.ProcessMessages;

                   FBuffer := Trim(BCMSFile.Strings[x]);
                   if FBuffer <> '' then
                      begin
                         Parser.Parse(FBuffer);

                         if UPPERCASE(Parser.Fields[BCMS_RecTypeFieldIndex]) <> 'A' then
                            Continue;

                         tCMMS.Append;
                         tCMMS.FieldByName('FNatIDNum').AsString := Parser.Fields[BCMS_NatIdFieldIndex];
                         tCMMS.FieldByName('NatIDNum').AsString := WinData.StripAllNomNumAlpha(tCMMS.FieldByName('FNatIDNum').AsString);
                         tCMMS.Post;
                      end;
                end;
         finally
            FreeAndNil(BCMSFile);
         end;
      end;
end;

procedure THerdRec.PopulateFromExcel(Matrix : Variant; X, Y : Integer);
var
   Style : TNatIDStyle;
   Len : Byte;
   Str : String;
   NewNatID : String;
   nIndex : OleVariant;
begin
   qAnimals.SQL.Clear;
   qAnimals.SQL.Add('Delete From '+tCMMS.TableName+'');
   qAnimals.ExecSQL;

   nIndex := StartRow; // Start in row 2, first row is head "Tag Number"
   while nIndex <= x do
      begin
         tCMMS.Append;
         tCMMS.FieldByName('NatIDNum').AsString := Matrix[nIndex, y]; // Used to locate in AnimalTable
         if ( WhatStyleNatID(tCMMS.FieldByName('NatIDNum').AsString, False ) in ([StyleEID,Style1999,Style1996,StylePre1996]) ) then
            begin
               CheckNatID(tCMMS.FieldByName('NatIDNum').AsString, NewNatID ,True);
               tCMMS.FieldByName('FNatIDNum').AsString := NewNatID;
            end
         else
            tCMMS.FieldByName('FNatIDNum').AsString := tCMMS.FieldByName('NatIDNum').AsString;
         Style := WhatStyleNatID(tCMMS.FieldByName('NatIDNum').AsString, False );
         Str := WinData.StripAllNomNumAlpha(tCMMS.FieldByName('NatIDNum').AsString);
         Len   := Length(Str);
         // Remove "IE"
         if ( ((Style = Style1999) and (Len = 14)) or ((Style = Style1996) and (Len = 11)) ) then
            System.Delete(Str, 1, 2)
         else if ( (Style = StyleEID) and (Len = 15) ) then
            System.Delete(Str, 1, 3);
         tCMMS.FieldByName('NatIDNum').AsString := Str;

         tCMMS.Post;
         Inc(nIndex);
      end;
   Screen.Cursor := crDefault;
end;

procedure THerdRec.AnimalGridDblClick(Sender: TObject);
begin
   if UseScanner = False then
      if AnimalTable.FieldByName('Found').AsBoolean = True then
         begin
            if NumFound <= AnimalTable.RecordCount then
               begin
                  Inc(NumFound);
                  StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
                  SearchNatIDNum.SetFocus;
               end;
         end
      else
         begin
            if NumFound > 0 then
               begin
                  NumFound := (NumFound - 1);
                  StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
                  SearchNatIDNum.SetFocus;
               end;   
         end;
end;

procedure THerdRec.RemainingEnter(Sender: TObject);
begin
   SearchNatIDNum.SetFocus;
end;

procedure THerdRec.DeSelectAllAnimals1Click(Sender: TObject);
begin
   AnimalTable.First;
   while not AnimalTable.eof do
      begin
         AnimalTable.Edit;
         AnimalTable.FieldByName('Found').AsBoolean := False;
         AnimalTable.Post;
         AnimalTable.Next;
         if NumFound > 0 then
            begin
               NumFound := (NumFound - 1);
               StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
            end;
      end;

end;

procedure THerdRec.SelectAllAnimals1Click(Sender: TObject);
begin
   AnimalTable.First;
   while not AnimalTable.eof do
      begin
         AnimalTable.Edit;
         AnimalTable.FieldByName('Found').AsBoolean := True;
         AnimalTable.Post;
         AnimalTable.Next;
         if NumFound <= AnimalTable.RecordCount then
            begin
               Inc(NumFound);
               StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
            end;
      end;
end;

procedure THerdRec.StockDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   if CheckStockDate then
      LoadAnimals(ADate);
end;

procedure THerdRec.SearchNatIDNumExit(Sender: TObject);
   procedure NatIDFound;
   begin


      if not AnimalTable.FieldByName('Found').AsBoolean then
         begin
            AnimalTable.Edit;
            AnimalTable.FieldByName('Found').AsBoolean := True;
            AnimalTable.Post;

            Inc(NumFound);
            StatusBar1.Panels[1].Text := 'Found: '+ IntToStr(NumFound);
            StatusBar1.Panels[2].Text := 'Remaining: '+ IntToStr(AnimalTable.RecordCount - NumFound);
         end;
      SearchNatIDNum.Text := '';
      SearchNatIDNum.SetFocus;
   end;

var
   sField : String;
begin

   if not UseScanner then Exit;



   if Length(Trim(SearchNatIDNum.Text)) > 0 then
      begin
         if UseScanner then
            begin
               sField := 'SearchField';
               AnimalGrid.Columns[0].Visible := False;
               sbOptions.Visible := False;
            end
         else
            begin
               sField := 'NatIDNum';
               AnimalGrid.Columns[0].Visible := True;
               sbOptions.Visible := True;
            end;

         if (AnimalGrid.DataSource.DataSet.Locate(sField, Trim(SearchNatIDNum.Text), [] )) then
            NatIDFound
         else
            begin
               LastScannedTagNotFound := SearchNatIDNum.Text;
               SearchNatIDNum.Text := '';
               SearchNatIDNum.SetFocus;
               Timer1.Enabled := True;
            end;
      end;
end;

procedure THerdRec.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := False;
   MessageDlg('Cannot find National Id. No.: '+Trim(LastScannedTagNotFound),mtWarning,[mbOk],0);
   LastScannedTagNotFound := '';
end;

procedure THerdRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Timer1.Enabled := False;
end;

procedure THerdRec.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('cmmsreconcile.htm');
end;

procedure THerdRec.StockDateChange(Sender: TObject);
begin

   CheckStockDate := True;
{   StockDate.CheckValidDate;
   if  ( StockDate.Date > 0 ) then
      if MessageDlg(Format('List all animals for stock date "%s", are you sure?',
          [FormatDateTime(cIrishDateStyle, StockDate.Date)]),
           mtConfirmation, [mbYes,mbNo] ,0) = idYes then
         begin
            ClearFields;
            TRxSpeedButton(Sender).Enabled := False;
            SQLFilter.StockDate := StockDate.Date;
            SQLFilter.HerdID := FHerdID;
            SQLFilter.OpenSQL(cAllStockOnDate);
            LoadAnimals;
            TRxSpeedButton(Sender).Enabled := True;
         end;
      }
end;

procedure THerdRec.StockDateKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

//   if StockDate.CheckOnExit
end;

procedure THerdRec.StockDateExit(Sender: TObject);
begin
   if CheckStockDate then
      LoadAnimals(StockDate.Date);
end;

procedure THerdRec.LoadAnimals(AStockDate: TDateTime);
begin
   if ( AStockDate > 0 ) then
      if MessageDlg(Format('List all animals for stock date "%s", are you sure?',
          [FormatDateTime(cIrishDateStyle, AStockDate)]),
           mtConfirmation, [mbYes,mbNo] ,0) = idYes then
         begin
            CheckStockDate := False;
            StockDate.Enabled := False;
            try
               SQLFilter.StockDate := AStockDate;
               SQLFilter.HerdID := FHerdID;
               SQLFilter.OpenSQL(cAllStockOnDate);
               LoadAnimals;
            finally
               StockDate.Enabled := True;
            end;
         end;
end;

procedure THerdRec.CMMSDatafileShow(Sender: TObject);
begin
   if DefaultCountry = Ireland then
       CMMSDatafile.FilterIndex := 1
   else if DefaultCountry = England then
       CMMSDatafile.FilterIndex := 2
   else
       CMMSDatafile.FilterIndex := 1
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure THerdRec.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cCMMSRecRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cCMMSRecRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
