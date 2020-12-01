{
   17/04/09 [V3.9 R6.7] /MK Additional Feature - Update the eOutstanding Field to show the amount
   of animals on the grid i.e. the Outstanding animals. Only update the eReceived Field when the
   cbAllCalves tickbox is checked.

   16/09/10 [V4.0 R4.7] /SP Change - Set eOutstanding to show all calves that are not ticked as Received.
                                     Michelle thought this was a bug. New feature to be added in future
                                     version to filter by year.

   22/02/12 [V5.0 R4.0] /MK Additional Feature - Move CardReceived To The End Of The Grid.
   22/02/12 [V5.0 R4.0] /MK Additional Feature - Only Set CardReceived If User Double-Clicks Card Received.

   11/05/12 [V5.0 R5.5] /MK Bug Fix - As The Normal Working Of A Tick Box Is A Single Click To Change The Value
                                      The CardReceived Should Change On Single Click Not Double Click.
                                    - On Change Of Value Show Message On First Change Not All Changes Of CardReceived.

   26/06/13 [V5.1 R7.5] /MK Additional Feature - Show CTS Registered calves if Defaults.DefaultCountry is England.
}

unit uCalfRegReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, DBCtrls, ExtCtrls, RXCtrls, ComCtrls, ToolWin, StdCtrls,
  Mask, ToolEdit, TB97Tlbr, TB97, RXDBCtrl, Db, DBTables, dxmdaset, GenTypesConst;

type
  TfmCalfRegReview = class(TForm)
  private
  published
    dbgRegCalves: TDBGridEh;
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    sbExit: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    dsGridData: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    Label3: TLabel;
    cbAllCalves: TCheckBox;
    StatusBar1: TStatusBar;
    ToolbarSep973: TToolbarSep97;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    eReceived: TEdit;
    eOutstanding: TEdit;
    DBNavigator1: TDBNavigator;
    sbPreview: TRxSpeedButton;
    ToolbarSep975: TToolbarSep97;
    TempTable: TTable;
    TempTableID: TAutoIncField;
    TempTableCalfID: TIntegerField;
    TempTableNatIDNum: TStringField;
    TempTableSortNatID: TStringField;
    TempTableAnimalNo: TStringField;
    TempTableSortAnimalNo: TStringField;
    TempTableDateOfBirth: TDateField;
    TempTableColour: TStringField;
    TempTableCBreed: TStringField;
    TempTableCBreedCode: TStringField;
    TempTableSex: TStringField;
    TempTableCardReceived: TBooleanField;
    TempTableDamNatID: TStringField;
    TempTableSireAnimalNo: TStringField;
    TempTableRecModified: TBooleanField;
    sbDOBFilter: TRxSpeedButton;
    sbUnRegCalf: TRxSpeedButton;
    ToolbarSep972: TToolbarSep97;
    TempTableRegisteredWithBandon: TBooleanField;
    TempTableStatus: TIntegerField;
    TempTableEmailCount: TStringField;
    TempTableActionDate: TDateField;
    dxMemData1: TdxMemData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbExecuteClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgRegCalvesGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure dbgRegCalvesTitleClick(Column: TColumnEh);
    procedure sbPreviewClick(Sender: TObject);
    procedure sbDOBFilterClick(Sender: TObject);
    procedure cbAllCalvesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TempTableCardReceivedChange(Sender: TField);
    procedure sbUnRegCalfClick(Sender: TObject);
    procedure TempTableStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TempTableActionDateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure dbgRegCalvesColumns10UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
  private
    { Private declarations }
    ProgBar : TProgressBar;
    LookupCalvings : TTable;
    ShowConfirmMessage : Boolean;
    procedure UpdateCalvings;
//    procedure SetDefaults;
    procedure ShowCounts;
    procedure GetAllCalves;
    procedure TableAfterScroll(Dataset : TDataset);
    procedure FilterTable;

  public
    { Public declarations }
  end;

var
  fmCalfRegReview: TfmCalfRegReview;
const
   cMaxCalves = 4;

implementation
uses
   DairyData, uCalfRegView, DateUtil, kRoutines, BDE;

{$R *.DFM}

procedure TfmCalfRegReview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // need to update calvings table
   dbgRegCalves.DataSource.DataSet.AfterScroll := nil;
   UpdateCalvings;
   if TempTable.Active then
      begin
         TempTable.Active := False;
         TempTable.IndexName := '';
        // TempTable.Filter := '';
       //  TempTable.Filtered := False;
      end;
   Action := caFree;
end;

procedure TfmCalfRegReview.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit );
   WinData.LoadBtnImage(WinData.Images,sbDOBFilter.Glyph,cBtnImgExecute);
//   WinData.LoadBtnImage(sbClear.Glyph, cBtnImgCancel);
   WinData.LoadBtnImage(WinData.Images,sbPreview.Glyph,cBtnImgPreview);

   Windata.CreateTTable(LookupCalvings,nil,'',WinData.Calvings.TableName);
   LookupCalvings.Active := True;
   GetAllCalves;
end;

procedure TfmCalfRegReview.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmCalfRegReview.sbExecuteClick(Sender: TObject);
begin
{   if (( FromDate.Date = StaticFromDate ) and ( ToDate.Date = Date ) ) then
      begin
         if cbAllCalves.Checked then
            begin
               FilterStr := 'Showing All Calves';
               StatusBar1.Panels[0].Text := FilterStr;
               dbgRegCalves.DataSource.DataSet.Filter := '';
               dbgRegCalves.DataSource.DataSet.Filtered := False;
               sbExecute.Font.Color := clRed;
               sbExecute.Caption := 'Filter On';
            end
         else
            SetDefaults;
      end
   else if (( FromDate.Date < 0 ) and ( ToDate.Date < 0 ) ) or ( FromDate.Date > ToDate.Date ) then
      MessageDlg('Invalid date range selected',mtWarning,[mbOK],0)
   else if FromDate.Date < StaticFromDate then
      MessageDlg('From Date cannot be before '+FormatDateTime(cIrishDateStyle, StaticFromDate),mtWarning,[mbOK],0)
   else
      begin
         if cbAllCalves.Checked then
            FilterStr := 'Showing All Calves / Date of Birth Filter'
         else
            FilterStr := 'Date of Birth Filter';

         StatusBar1.Panels[0].Text := FilterStr;
         if cbAllCalves.Checked then
            dbgRegCalves.DataSource.DataSet.Filter := 'DateOfBirth >= '''+ FormatDateTime(cIrishDateStyle, FromDate.Date)+''' AND DateOfBirth <= '''+ FormatDateTime(cIrishDateStyle, ToDate.Date)+''''
         else
            dbgRegCalves.DataSource.DataSet.Filter := 'DateOfBirth >= '''+ FormatDateTime(cIrishDateStyle, FromDate.Date)+''' AND DateOfBirth <= '''+ FormatDateTime(cIrishDateStyle, ToDate.Date)+''' AND CardReceived = False';
         dbgRegCalves.DataSource.DataSet.Filtered := True;
         FromDate.Font.Color := clRed;
         ToDate.Font.Color := clRed;
         sbExecute.Font.Color := clRed;
         sbExecute.Caption := 'Filter On';
      end;
   dbgRegCalves.DataSource.DataSet.First;
   }
end;

procedure TfmCalfRegReview.sbClearClick(Sender: TObject);
begin
//   SetDefaults;
end;

procedure TfmCalfRegReview.FormActivate(Sender: TObject);
begin
//   SetDefaults;
end;

procedure TfmCalfRegReview.UpdateCalvings;
var
   Iterator : Byte;
begin
   ProgBar := TProgressBar.Create(nil);
   ProgBar.Parent := Self;
   ProgBar.Align := alBottom;
   ProgBar.Height := 28;
   ProgBar.Step := 1;
   StatusBar1.Panels[0].Text := 'Updating records, please wait...';
   StatusBar1.Panels[2].Width := 0;
   with dbgRegCalves.DataSource.DataSet do
      try
         DisableControls;
         //Close;
         Filter := 'RecModified = True';
         Filtered := True;
         //Open;
         ProgBar.Max := RecordCount*2;
         First;
         while not eof do
            begin
               Application.ProcessMessages;
               if ( FieldByName('RecModified').AsBoolean ) then
                  for Iterator := 1 to cMaxCalves do
                     if LookUpCalvings.Locate('ID'+IntToStr(Iterator)+'', FieldByName('CalfID').AsInteger, []) then
                        begin
                           try
                              LookUpCalvings.Edit;
                              LookUpCalvings.FieldByName('ID'+IntToStr(Iterator)+'CardReceived').AsBoolean := FieldByName('CardReceived').AsBoolean;
                              LookUpCalvings.FieldByName('ID'+IntToStr(Iterator)+'Notified').AsBoolean := FieldByName('RegisteredWithBandon').AsBoolean;
                              LookUpCalvings.Post;
                              DbiSaveChanges(LookUpCalvings.Handle);
                           except
                              LookUpCalvings.Cancel;
                              MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                           end;
                           Break;
                        end;
               Next;
               ProgBar.Stepby(2);
            end;
      finally
         StatusBar1.Panels[0].Text := '';
         ProgBar.Free;
         EnableControls;
      end;
end;

procedure TfmCalfRegReview.dbgRegCalvesGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if dbgRegCalves.DataSource.DataSet.FieldByName('CardReceived').AsBoolean then
      Background := cl3DLight
   else
      Background := clWhite;
end;

procedure TfmCalfRegReview.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   if Panel = StatusBar1.Panels[3] then
      begin
         if ProgBar <> nil then
         with ProgBar do
            begin
               Top := Rect.Top+1;
               Left := Rect.Left+1;
               Width := ( Rect.Right - Rect.Left ) - 1;
               Height := ( Rect.Bottom - Rect.Top ) -1 ;
             end;
      end;
end;

{
procedure TfmCalfRegReview.SetDefaults;
begin

   StatusBar1.Panels[0].Text := 'Calves not yet received cards';

   dbgRegCalves.DataSource.DataSet.Filter := 'CardReceived = False';
   dbgRegCalves.DataSource.DataSet.Filtered := True;

   FromDate.Date := StaticFromDate;
   FromDate.Font.Color := clBlack;

   ToDate.Date := Date;
   ToDate.Font.Color := clBlack;

   cbAllCalves.Checked := False;

   sbExecute.Font.Color := clBlack;
   sbExecute.Caption := 'Apply Filter';
   dbgRegCalvesTitleClick(dbgRegCalves.Columns[1]);

end;
}

// 17/04/09 [V3.9 R6.7] /MK Additional Feature - Update the eOutstanding Field to show the amount
// of animals on the grid i.e. the Outstanding animals. Only update the eReceived Field when the
// cbAllCalves tickbox is checked.

procedure TfmCalfRegReview.ShowCounts;
var
   Received, NotReceived : Integer;
   BK : TBookMark;
   bFound : Boolean;
begin
(*   Received := 0;
   NotReceived := 0;
   with TempTable do
      begin
         DisableControls;
         BK := GetBookmark;
         try
            bFound := FindFirst;
            if bFound then
               repeat
                   if TempTable.FieldByName('CardReceived').AsBoolean = True then
                      Inc(Received)
                   else
                      Inc(NotReceived);
                   bFound := FindNext;
               until
                 bFound = False;

{            while not EOF do
               begin
                  Next;
               end;}
         finally
            GotoBookmark(BK);
            FreeBookmark(BK);
            EnableControls;
         end;
      end;
   eReceived.Text := IntToStr(Received);
   eOutstanding.Text := IntToStr(NotReceived);
*)

   with TQuery.Create(nil) do
      try
         DatabaseName := WinData.KingData.DatabaseName;
         SQL.Clear;
         SQL.Add('Select Count(CalfID) CID from RegCalves Where CardReceived = True');
         Open;
         try
            First;
            if FieldByName('CID').AsInteger > 0 then
               eReceived.Text := IntToStr(FieldByName('CID').AsInteger)
            else
               eReceived.Text := '0';
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('Select Count(CalfID) CID from RegCalves Where CardReceived <> True');
         Open;
         try
            First;
            if FieldByName('CID').AsInteger > 0 then
               eOutstanding.Text := IntToStr(FieldByName('CID').AsInteger)
            else
               eOutstanding.Text := '0';
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmCalfRegReview.TableAfterScroll(Dataset: TDataset);
begin
   //ShowCounts;
end;

procedure TfmCalfRegReview.dbgRegCalvesTitleClick(Column: TColumnEh);
  function IndexExists(IndexName : String) : Boolean;
  begin
     Result := TTable(dbgRegCalves.DataSource.DataSet).IndexDefs.IndexOf(IndexName) > -1;
  end;
begin
   if Column.Title.SortMarker = smUpEh then
      Column.Title.SortMarker := smDownEh
   else
      Column.Title.SortMarker := smUpEh;

   case Column.Index of
      0 : begin
             if Column.Title.SortMarker = smUpEh then
                begin
                   if IndexExists('dNatID') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'dNatID';
                         StatusBar1.Panels[2].Text := 'Sorting by Nat ID Descending';
                      end;
                end
             else
                begin
                   if IndexExists('iNatID') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'iNatID';
                         StatusBar1.Panels[2].Text := 'Sorting by Nat ID Ascending';
                      end;
                end;
          end;
      1 : begin
             if Column.Title.SortMarker = smUpEh then
                begin
                   if IndexExists('dAnimalNo') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'dAnimalNo';
                         StatusBar1.Panels[2].Text := 'Sorting by Animal No Descending';
                      end;
                end
             else
                begin
                   if IndexExists('iAnimalNo') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'iAnimalNo';
                         StatusBar1.Panels[2].Text := 'Sorting by Animal No Ascending';
                      end;
                end;
          end;
      2 : begin
             if Column.Title.SortMarker = smUpEh then
                begin
                   if IndexExists('dDateOfBirth') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'dDateOfBirth';
                         StatusBar1.Panels[2].Text := 'Sorting by Date of Birth Descending';
                      end;
                end
             else
                begin
                   if IndexExists('iDateOfBirth') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'iDateOfBirth';
                         StatusBar1.Panels[2].Text := 'Sorting by Date of Birth Ascending';
                      end;
                end;
          end;
      7 : begin
             if Column.Title.SortMarker = smUpEh then
                begin
                   if IndexExists('dStatus') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'dStatus';
                         StatusBar1.Panels[2].Text := 'Sorting by Status Descending';
                      end;
                end
             else
                begin
                   if IndexExists('iStatus') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'iStatus';
                         StatusBar1.Panels[2].Text := 'Sorting by Status Ascending';
                      end;
                end;
          end;
      8 : begin
             if Column.Title.SortMarker = smUpEh then
                begin
                   if IndexExists('dActionDate') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'dActionDate';
                         StatusBar1.Panels[2].Text := 'Sorting by Date Descending';
                      end;
                end
             else
                begin
                   if IndexExists('iActionDate') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'iActionDate';
                         StatusBar1.Panels[2].Text := 'Sorting by Date Ascending';
                      end;
                end;
          end;
      9 : begin
             if Column.Title.SortMarker = smUpEh then
                begin
                   if IndexExists('dEmailCount') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'dEmailCount';
                         StatusBar1.Panels[2].Text := 'Sorting by Email Count Descending';
                      end;
                end
             else
                begin
                   if IndexExists('iEmailCount') then
                      begin
                         TTable(dbgRegCalves.DataSource.DataSet).IndexName := 'iEmailCount';
                         StatusBar1.Panels[2].Text := 'Sorting by Email Count Ascending';
                      end;
                end;
          end;
      else
         Column.Title.SortMarker := smNoneEh;
   end;
   dbgRegCalves.DataSource.DataSet.First;

end;

procedure TfmCalfRegReview.sbPreviewClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   try
      try
         Application.CreateForm(TfmCalfRegView, fmCalfRegView)
      except
         on E : EOutOfResources do raise Exception(E.Message);
         on E : EOutOfMemory do raise Exception(E.Message);
      end;

      { Set Report Dataset }
      fmCalfRegView.rCalfReg.Dataset := TempTable;
      { Set Report Titles }
      fmCalfRegView.RptTitle.Caption := 'Calves Registered';
      fmCalfRegView.rCalfReg.ReportTitle := 'Calves Registered';
      { Set Dataset for Detail Components  }
      fmCalfRegView.QRDBText1.DataSet := TempTable;
      fmCalfRegView.QRDBText2.DataSet := TempTable;
      fmCalfRegView.QRDBText3.DataSet := TempTable;
      fmCalfRegView.QRDBText4.DataSet := TempTable;
      fmCalfRegView.QRDBText13.DataSet := TempTable;
      fmCalfRegView.QRDBText12.DataSet := TempTable;
      fmCalfRegView.QRDBText7.DataSet := TempTable;

      fmCalfRegView.QRDBText6.DataSet  := TempTable;
      fmCalfRegView.QRDBText11.DataSet := nil;
      fmCalfRegView.QRDBText5.DataSet  := nil;

      fmCalfRegView.QRDBText8.DataField := 'SireAnimalNo';
      fmCalfRegView.QRDBText8.DataSet  := TempTable;
      fmCalfRegView.QRDBText9.DataSet  := nil;
      fmCalfRegView.QRDBText10.DataSet := nil;

      fmCalfRegView.QRLabel6.Visible := True;
      fmCalfRegView.QRLabel11.Visible := False;
      fmCalfRegView.QRLabel4.Visible := False;
      fmCalfRegView.QRLabel12.Visible := True;
      fmCalfRegView.QRLabel8.Visible := True;
      fmCalfRegView.QRLabel9.Visible := False;
      fmCalfRegView.QRLabel10.Visible := False;
      fmCalfRegView.QRLabel13.Visible := True;
      fmCalfRegView.QRLabel4.Enabled  := False;
      fmCalfRegView.QRLabel6.Enabled  := True;
      fmCalfRegView.QRLabel8.Enabled  := True;
      fmCalfRegView.QRLabel9.Enabled  := False;
      fmCalfRegView.QRLabel10.Enabled := False;
      fmCalfRegView.QRLabel11.Enabled := False;
      fmCalfRegView.QRLabel12.Enabled := True;
      fmCalfRegView.QRLabel13.Enabled := True;

      Screen.Cursor := crDefault;
      fmCalfRegView.rCalfReg.Preview;
   finally
      fmCalfRegView.Free;
   end;

end;

procedure TfmCalfRegReview.GetAllCalves;
var
   TempQuery : TQuery;
   Iterator : Byte;
   DamID, SireID : Integer;
begin
   TempQuery := TQuery.Create(nil);

   try
      TempQuery.DatabaseName := WinData.KingData.DatabaseName;

{      StaticFromDate := StrToDate('01/01/'+ intToStr(CurrentYear));
      if not InputDate('Select date to start from', 'Date:', StaticFromDate) then
         Exit
      else if StaticFromDate <= 0 then
         raise Exception.Create('Invalid date selected');
}
      if TempTable.Exists then // might happen in case of PC crashing
         TempTable.DeleteTable;
      Screen.Cursor := crHourGlass;
      with TempQuery do
         begin
            SQL.Clear;
            SQL.Add(' Create Table RegCalves');
            SQL.Add(' (ID AutoInc,');
            SQL.Add(' CalfID INTEGER, NatIDNum Char(20), SortNatID Char(20), AnimalNo Char(10), SortAnimalNo Char(10),');
            SQL.Add(' DateOfBirth Date, Colour Char(60), CBreed Char(60), CBreedCode Char(6), Sex Char(10), CardReceived BOOLEAN,');
            SQL.Add(' DamNatID Char(20), SireAnimalNo Char(20), RecModified BOOLEAN, RegisteredWithBandon BOOLEAN, Status Integer, EmailCount Char(3), ActionDate Date,');
            SQL.Add(' PRIMARY KEY(ID))');
            Prepare;
            ExecSQL;

            Close;
            SQL.Clear;
            SQL.Add(' INSERT INTO RegCalves ');
            SQL.Add(' ( CalfID, NatIDNum , SortNatID , AnimalNo , SortAnimalNo ,  ');
            SQL.Add('   DateOfBirth , Sex, Colour , CBreed , CBreedCode  )          ');
            SQL.Add(' SELECT DISTINCT                                             ');
            SQL.Add('  A.ID, A.NatIDNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, ');
            SQL.Add('  A.DateOfBirth , A.Sex, G.Description, B.Name, B.Code    ');
            SQL.Add(' FROM Animals A                                              ');
            SQL.Add(' LEFT JOIN Breeds B ON (A.PrimaryBreed = B.ID)               ');
            SQL.Add(' LEFT JOIN GenLook G ON (A.Colour = G.ID)                    ');

            //   26/06/13 [V5.1 R7.5] /MK Additional Feature - Show CTS Registered calves if Defaults.DefaultCountry is England.
            if ( WinData.UserDefaultHerdCountry = England ) then
               begin
                  SQL.Add(' WHERE ( A.ID IN (SELECT DISTINCT C.ID1 FROM Calvings C WHERE ( ID1CTSReg = True ))) ');
                  SQL.Add(' OR    ( A.ID IN (SELECT DISTINCT C.ID2 FROM Calvings C WHERE ( ID2CTSReg = True ))) ');
                  SQL.Add(' OR    ( A.ID IN (SELECT DISTINCT C.ID3 FROM Calvings C WHERE ( ID3CTSReg = True ))) ');
                  SQL.Add(' OR    ( A.ID IN (SELECT DISTINCT C.ID4 FROM Calvings C WHERE ( ID4CTSReg = True ))) ');
               end
            else
               begin
                  SQL.Add(' WHERE ( A.ID IN (SELECT DISTINCT C.ID1 FROM Calvings C WHERE ( ID1Notified = True ))) ');
                  SQL.Add(' OR    ( A.ID IN (SELECT DISTINCT C.ID2 FROM Calvings C WHERE ( ID2Notified = True ))) ');
                  SQL.Add(' OR    ( A.ID IN (SELECT DISTINCT C.ID3 FROM Calvings C WHERE ( ID3Notified = True ))) ');
                  SQL.Add(' OR    ( A.ID IN (SELECT DISTINCT C.ID4 FROM Calvings C WHERE ( ID4Notified = True ))) ');
               end;
            Prepare;
            ExecSQL;

            { Get the CardReceived Status }
            TempTable.FieldByName('CardReceived').OnChange := nil;
            with TempTable do
               begin
                  Close;
                  Open;
                  Filter := '';
                  Filtered := False;
                  First;
                  while not TempTable.eof do
                     begin
                        Edit;
                        FieldByName('RecModified').AsBoolean := False;
                        FieldByName('RegisteredWithBandon').AsBoolean := True;
                        Post;


                        if WinData.LookUpDamSire.Locate('ID', FieldByName('CalfID').AsInteger, []) then
                           begin
                             DamID := WinData.LookUpDamSire.FieldByname('DamID').AsInteger;
                             SireID := WinData.LookUpDamSire.FieldByname('SireID').AsInteger;

                             if DamID > 0 then
                             if WinData.LookUpDamSire.Locate('ID', DamID, []) then
                                try
                                   Edit;
                                   TempTable.FieldByName('DamNatID').AsString := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                                   Post;
                                except
                                   Cancel;
                                end;

                             if SireID > 0 then
                             if WinData.LookUpDamSire.Locate('ID', SireID, []) then
                                try
                                   Edit;
                                   TempTable.FieldByName('SireAnimalNo').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                   Post;
                                except
                                   Cancel;
                                end;

                             for Iterator := 1 to cMaxCalves do
                                begin
                                   if LookUpCalvings.Locate('ID'+IntToStr(Iterator)+'', FieldByName('CalfID').AsInteger, []) then
                                      begin
                                         try
                                            Edit;
                                            FieldByName('CardReceived').AsBoolean := LookUpCalvings.FieldByName('ID'+IntToStr(Iterator)+'CardReceived').AsBoolean;
                                            FieldByName('Status').AsInteger := LookUpCalvings.FieldByName('ID'+IntToStr(Iterator)+'Status').AsInteger;
                                            FieldByName('EmailCount').AsString := LookUpCalvings.FieldByName('ID'+IntToStr(Iterator)+'EMAILCOUNT').AsString;
                                            FieldByName('ActionDate').Value := LookUpCalvings.FieldByName('ID'+IntToStr(Iterator)+'DATE').Value;
                                            if FieldByName('CardReceived').IsNull then
                                               FieldByName('CardReceived').AsBoolean := False;
                                            Post;
                                         except
                                            Cancel;
                                         end;
                                         Break;
                                      end;
                                end;
                           end
                        else
                           Delete;
                        Next;
                     end;
               end;

            if TempTable.RecordCount <= 0 then
               begin
                  MessageDlg('No calves have been found',mtInformation,[mbOK],0);
                  SysUtils.Abort;
               end;

            TempTable.Close;
            TempTable.AddIndex('iNatID', 'SortNatID', [ixCaseInsensitive]);
            TempTable.AddIndex('iAnimalNo', 'SortAnimalNo', [ixCaseInsensitive]);
            TempTable.AddIndex('iDateOfBirth', 'DateOfBirth', [ixCaseInsensitive]);
            TempTable.AddIndex('iEmailCount', 'EmailCount', [ixCaseInsensitive]);
            TempTable.AddIndex('iActionDate', 'ActionDate', [ixCaseInsensitive]);
            TempTable.AddIndex('iStatus', 'Status', [ixCaseInsensitive]);
            TempTable.AddIndex('dNatID', 'SortNatID', [ixDescending]);
            TempTable.AddIndex('dAnimalNo', 'SortAnimalNo', [ixDescending]);
            TempTable.AddIndex('dDateOfBirth', 'DateOfBirth', [ixDescending]);
            TempTable.AddIndex('dEmailCount', 'EmailCount', [ixDescending]);
            TempTable.AddIndex('dActionDate', 'ActionDate', [ixDescending]);
            TempTable.AddIndex('dStatus', 'Status', [ixDescending]);
            TempTable.Open;
            TempTable.IndexName := 'iNatID';
            TempTable.FieldByName('CardReceived').OnChange := TempTableCardReceivedChange;
            Screen.Cursor := crDefault;
        end;
   finally
      TempQuery.Free;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmCalfRegReview.sbDOBFilterClick(Sender: TObject);
begin
   FilterTable;
end;

procedure TfmCalfRegReview.FilterTable;
var
    FilterStr : String;
begin

   TempTable.DisableControls;
   try
      if (FromDate.Date <= 0) and (ToDate.Date <= 0) then
         begin
            TempTable.Filter := '';
            FromDate.Font.Color := clBlack;
            ToDate.Font.Color := clBlack;
            if not cbAllCalves.Checked then
                begin
                   TempTable.Filter := 'CardReceived = False';
                   FilterStr := 'Calves with no cards';
                end
            else
                begin
                   TempTable.Filter := '';
                   FilterStr := 'Showing all calves';
                end;
         end
      else
         begin
            FromDate.Font.Color := clRed;
            ToDate.Font.Color := clRed;
            FilterStr := 'Date of Birth filter';
            if (FromDate.Date > 0) and (ToDate.Date <= 0) then
               TempTable.Filter := 'DateOfBirth >= '''+ FormatDateTime(cIrishDateStyle, FromDate.Date)+''''
            else if (FromDate.Date <= 0 ) and (ToDate.Date > 0) then
               TempTable.Filter := 'DateOfBirth <= '''+ FormatDateTime(cIrishDateStyle, ToDate.Date)+''''
            else
               TempTable.Filter := 'DateOfBirth >= '''+ FormatDateTime(cIrishDateStyle, FromDate.Date)+''' AND DateOfBirth <= '''+ FormatDateTime(cIrishDateStyle, ToDate.Date)+'''';
            if not cbAllCalves.Checked then
               TempTable.Filter := TempTable.Filter + ' AND CardReceived = False AND RegisteredWithBandon=True'
            else
               if FilterStr <> '' then
                  FilterStr := 'Showing all calves and '+ FilterStr
               else
                  FilterStr := 'Showing all calves';
         end;
      TempTable.Filtered := True;
   finally
      ShowCounts;
      TempTable.First;
      TempTable.EnableControls;
      StatusBar1.Panels[0].Text := FilterStr;
   end;
end;

procedure TfmCalfRegReview.cbAllCalvesClick(Sender: TObject);
begin
   FilterTable;
end;

procedure TfmCalfRegReview.FormShow(Sender: TObject);
begin
   FromDate.Date := IncMonth(Date, -12);
   ToDate.Date := Date;
   FilterTable;
   ShowConfirmMessage := True;
   //ShowCounts;
end;

procedure TfmCalfRegReview.TempTableCardReceivedChange(Sender: TField);
begin
   if TempTable.FieldByName('CalfID').AsInteger > 0 then
      begin
         TempTable.FieldByName('RecModified').AsBoolean := True;
//         ShowCounts;
      end;
end;

procedure TfmCalfRegReview.sbUnRegCalfClick(Sender: TObject);
begin
   if TempTable.RecordCount > 0 then
      begin
         if MessageDlg(Format('RELIST For Registration, Calf Number: "%s" '+#13#10+#13#10+#13#10+
                              'This calf will appear on the list of calves TO BE registered the next time'+#13#10+
                              'you register calves with Bandon. This will enable you to send its'+#13#10+
                              'registration to Bandon, if you require to do so.'+#13#10+#13#10+
                              'Are you sure you want to relist this calf number?',
                              [TempTable.FieldByName('NatIDNum').AsString,
                              TempTable.FieldByName('NatIDNum').AsString]),
                              mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               TempTable.Edit;
               TempTable.FieldByName('RecModified').AsBoolean := True;
               TempTable.FieldByName('RegisteredWithBandon').AsBoolean := False;
               TempTable.Post;
               FilterTable;
            end;
      end;
end;

procedure TfmCalfRegReview.TempTableStatusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Sender.AsInteger = 1 then
      Text := 'Emailed'
   else if Sender.AsInteger = 2 then
      Text := 'Posted'
   else if Sender.AsInteger = 3 then
      Text := 'Removed';
end;

procedure TfmCalfRegReview.TempTableActionDateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Sender.asDateTime <= 0 then
      text := '';
end;

procedure TfmCalfRegReview.FormDestroy(Sender: TObject);
begin
   if LookupCalvings <> nil then
      begin
         LookupCalvings.Active := False;
         FreeAndNil(LookupCalvings);
      end;
end;

//   11/05/12 [V5.0 R5.5] /MK Bug Fix - As The Normal Working Of A Tick Box Is A Single Click To Change The Value
//                                      The CardReceived Should Change On Single Click Not Double Click.
//                                    - On Change Of Value Show Message On First Change Not All Changes Of CardReceived.
procedure TfmCalfRegReview.dbgRegCalvesColumns10UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
   Handled := True;
   if ( ShowConfirmMessage ) then
      begin
         ShowConfirmMessage := False;
         if Value then
            begin
               if ( MessageDlg('You are about to mark this animal as card received'+cCRLF+
                               'Are you sure you want to continue?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
                  Exit;
            end
         else
            begin
               if ( MessageDlg('You are about to mark this animal as not card received'+cCRLF+
                               'Are you sure you want to continue?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
                  Exit;
            end;
      end;

   TempTable.Edit;
   TempTable.FieldByName('CardReceived').Value := Value;
   TempTable.Post;
   ShowCounts;
end;

end.

