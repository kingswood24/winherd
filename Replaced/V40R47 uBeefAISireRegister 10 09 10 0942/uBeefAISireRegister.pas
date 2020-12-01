{

   Unit Created : 20/02/2009 V3.9 R6.3 /SP

   08/01/2009 [V3.9 R5.6] /SP Default Sire To Pedigree AISire.Pedigree := True;

}
unit uBeefAISireRegister;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxSSheet, ExtCtrls, dxBar, dxBarExtItems, ActnList,
  cxControls, dxStatusBar, cxContainer, cxEdit, cxTextEdit, cxHyperLinkEdit,
  LMDWebBase, LMDWebConfig, LMDWebHTTPGet, Db, dxmdaset, Menus, StdCtrls,
  cxButtons, cxLabel, cxMaskEdit, cxDropDownEdit, cxSSPainters, cxGroupBox,
  dbTables, cxMemo, cxProgressBar, LMDDownload, cxSSHeaders;

type
  TfmBeefAISireRegister = class(TfmBaseForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SpreadSheet: TcxSpreadSheet;
    dxBarLargeButton1: TdxBarLargeButton;
    actOptions: TAction;
    heDownload: TcxHyperLinkEdit;
    GetAllBulls: TLMDWebHTTPGet;
    actUpdateSettings: TAction;
    dxBarPopupMenu1: TdxBarPopupMenu;
    bbUpdateSettings: TdxBarButton;
    cxGroupBox1: TcxGroupBox;
    cmboSearchField: TcxComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    teSearchText: TcxTextEdit;
    btnSearch: TcxButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actAddSire: TAction;
    GetSerNo: TLMDWebHTTPGet;
    GetWebUpdate: TLMDWebHTTPGet;
    ProgressBar: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure actUpdateSettingsExecute(Sender: TObject);
    procedure SpreadSheetCustomPaint(Sender: TObject;
      var PainterClass: TcxSheetPainterClass);
    procedure SpreadSheetTopLeftChanging(Sender: TcxSSBookSheet;
      var ATopLeft: TPoint);
    procedure btnSearchClick(Sender: TObject);
    procedure SpreadSheetActiveCellChanging(Sender: TcxSSBookSheet;
      const ActiveCell: TPoint; var CanSelect: Boolean);
    procedure cmboSearchFieldPropertiesChange(Sender: TObject);
    procedure teSearchTextPropertiesChange(Sender: TObject);
    procedure actAddSireExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GetSerNoProcessed(Sender: TObject);
    procedure heDownloadClick(Sender: TObject);
    procedure GetWebUpdateProcessed(Sender: TObject);
    procedure GetAllBullsProcessed(Sender: TObject);
    procedure GetAllBullsProgress(Sender: TLMDWebHTTPGet;
      Item: TLMDDownloadItem);
    procedure SpreadSheetClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FSireCodeCol : Integer;
    FSireNameCol : Integer;
    FSireBreedCol : Integer;
    FDataTopRow : Integer;
    FDataLeftColIndex : Integer;
    FSireFileName : string;
    FNextStartIndex : Integer;
    FcxSSBookSheet : TcxSSBookSheet;
    FSelectedRowIndex : Integer;
    FUpdateAvailable : Boolean;
    FAIWebServerFileName : string;
    procedure LoadSettings;
    procedure LoadFromDisk;
    procedure LoadAIFile;
    procedure DownloadAIFile;
    procedure SearchForAnimal(AStartIndex : Integer);
    procedure SelectRow(ARowIndex : Integer);
    procedure AddSire;
    function AnimalInUse(const ACode, AName : String): Integer;
    procedure CheckSireSelected;
  public
    { Public declarations }
  end;

var
  fmBeefAISireRegister: TfmBeefAISireRegister;

implementation

uses KRoutines, uPreferences, DairyData, cxSSHelper,
  uBeefAISireRegisterSettings, cxSSTypes, EventRecording, SQLHelper,
  GenTypesConst, Def, uDownloadValidation, UserMsgConst;

{$R *.DFM}

{ TfmBeefAISireRegister }

procedure TfmBeefAISireRegister.LoadAIFile;
begin
   FSireFileName := 'C:\Kingswood Herd Management\' + WinData.BeefAISireFileName;
   if FileExists(FSireFileName) then
      begin
         LoadFromDisk;
      end
   else
      begin
         DownloadAIFile;
      end;

   StatusBar.Panels[0].Text := 'File: '+ExtractFileName(FSireFileName);
end;

procedure TfmBeefAISireRegister.FormCreate(Sender: TObject);
begin
  inherited;
  ProgressBar.Position := 0;
  ProgressBar.Visible := False;
  FSelectedRowIndex := 0;
  LoadSettings;
end;

procedure TfmBeefAISireRegister.LoadFromDisk;
var
   RowHeader : TcxSSHeader;
begin
   if FileExists(FSireFileName) then
      begin
         SpreadSheet.BeginUpdate;
         try
            SpreadSheet.LoadFromFile(FSireFileName);
            TcxSSHelper.SetCellReadOnly(0,0,SpreadSheet.Sheet.ColumnCount-1,SpreadSheet.Sheet.RowCount-1,True,SpreadSheet.Sheet);
            SpreadSheet.Sheet.Cols.Size[FSireCodeCol] := 85;
            SpreadSheet.Sheet.Cols.Size[FSireNameCol] := 250;
            SpreadSheet.Sheet.Cols.Size[FSireBreedCol] := 85;
            //SpreadSheet.Sheet.Cols.
            RowHeader := SpreadSheet.Sheet.Rows;
            RowHeader.Size[FDataTopRow-3] := 30; // Column Captions Row
            RowHeader.Size[FDataTopRow-2] := 30; // Column Captions Row
            RowHeader.Size[FDataTopRow-1] := 55; // Column Captions Row


            {FixedColNumber := 5;
            FixedRowNumber := 4;
            APoint := Point(0, 0);
            APrevPoint := APoint;
            AFixFlag := True;}
         finally
            SpreadSheet.EndUpdate;
            SelectRow( FDataTopRow );
         end;
      end;
end;

procedure TfmBeefAISireRegister.LoadSettings;
begin
  with TfmBeefAISireRegisterSettings.Create(nil) do
     try
        MemData.First;
        // AI Sire Code
        FSireCodeCol := MemData.Fields[2].AsInteger-1;
        MemData.Next;
        // AI Sire Name
        FSireNameCol := MemData.Fields[2].AsInteger-1;
        MemData.Next;
        // AI Sire Breed
        FSireBreedCol := MemData.Fields[2].AsInteger-1;
        MemData.Next;
        // Data Top Row Index - begining of data rows
        FDataTopRow := MemData.Fields[2].AsInteger-1;
        MemData.Next;
        // Left Col Index - begining of data cols
        FDataLeftColIndex := MemData.Fields[2].AsInteger-1;
        MemData.Close;
     finally
        Free;
     end;
end;

procedure TfmBeefAISireRegister.actUpdateSettingsExecute(Sender: TObject);
begin
  inherited;
  TfmBeefAISireRegisterSettings.Load;
end;

procedure TfmBeefAISireRegister.SpreadSheetCustomPaint(Sender: TObject;
  var PainterClass: TcxSheetPainterClass);
begin
  inherited;
  {PainterClass := TMyPainter;}
end;

procedure TfmBeefAISireRegister.SpreadSheetTopLeftChanging(
  Sender: TcxSSBookSheet; var ATopLeft: TPoint);
begin
  inherited;

  APrevPoint := APoint;
  APoint := ATopLeft;
end;

procedure TfmBeefAISireRegister.SearchForAnimal(AStartIndex: Integer);
var
   SearchText, SearchField, FieldValue : string;
   SearchColIndex : Integer;
   Success : Boolean;
   i : Integer;
   s : string;
begin
   if cmboSearchField.ItemIndex = 0 then
      SearchColIndex := FSireCodeCol
   else
      SearchColIndex := FSireNameCol;

   SpreadSheet.BeginUpdate;
   with SpreadSheet.Sheet do
      begin

         try
            SearchText := Trim(teSearchText.Text);
            if SearchText <> '' then
               begin
                  SearchText := UPPERCASE(teSearchText.Text);

                  Screen.Cursor := crHourGlass;
                  Success := False;

                  try
                     for i := AStartIndex to RowCount - 1 do
                        begin
                           FieldValue := TcxSSHelper.GetCellValue(SearchColIndex, i, SpreadSheet.Sheet);

                           if not VarIsNull(FieldValue) then
                              begin
                                 FieldValue := UPPERCASE(FieldValue);
                                 if (SearchColIndex = FSireCodeCol) then
                                    begin
                                       if (SearchText = System.Copy(FieldValue, 1, Length(SearchText))) then
                                          begin
                                             SpreadSheet.Sheet.ActiveCell := Point(FSireCodeCol,i);
                                             SelectRow(i);
                                             Success := True;
                                             Break;
                                          end;
                                    end
                                 else
                                    begin
                                       if Pos( SearchText, FieldValue) > 0 then
                                          begin
                                             SpreadSheet.Sheet.ActiveCell := Point(FSireCodeCol,i);
                                             SelectRow(i);
                                             FNextStartIndex := i+1;
                                             Success := True;
                                             Break;
                                          end;
                                    end;
                              end;
                        end;

                     if not Success then
                        begin
                           FNextStartIndex := 0;
                           s := '';
                           if AStartIndex > 0 then
                              s := 'further ';
                           MessageDlg(Format('The search for "%s" did not return any %sresults.',[teSearchText.Text,s]),mtInformation,[mbOK],0)
                        end;
                  finally
                     Screen.Cursor := crDefault;
                  end;
               end
            else
               begin
               end;
         finally
            SpreadSheet.EndUpdate;
         end;
      end;
end;

procedure TfmBeefAISireRegister.btnSearchClick(Sender: TObject);
var
  ActiveRow : Integer;
begin
  inherited;
  if cmboSearchField.ItemIndex = 1 then
     begin
        if btnSearch.Caption = 'Search' then
           begin
               btnSearch.Caption := 'Continue';
               FNextStartIndex := 5;
               ActiveRow := FNextStartIndex;
           end
        else
           ActiveRow := FNextStartIndex;
     end
  else
     begin
        ActiveRow := 5;
     end;

  SearchForAnimal( ActiveRow );
end;

procedure TfmBeefAISireRegister.SpreadSheetActiveCellChanging(
  Sender: TcxSSBookSheet; const ActiveCell: TPoint;
  var CanSelect: Boolean);
begin
  inherited;
  TcxSSHelper.SetCellPattern(ActiveCell.y,ActiveCell.x,ActiveCell.y,ActiveCell.x, 14, 1,fsSolid, SpreadSheet.Sheet);
end;

procedure TfmBeefAISireRegister.SelectRow(ARowIndex : Integer);
var
   MyRect : TRect;
begin
   FSelectedRowIndex := ARowIndex;
   MyRect.Left := 0;
   MyRect.Top := ARowIndex;
   MyRect.Bottom := ARowIndex;
   MyRect.Right := SpreadSheet.Sheet.ColumnCount-1;
   if not PtInRect(SpreadSheet.Sheet.Corners, SpreadSheet.Sheet.ActiveCell) then
     SpreadSheet.Sheet.Corners := MyRect;
   SpreadSheet.SelectionRect := MyRect;
end;

procedure TfmBeefAISireRegister.cmboSearchFieldPropertiesChange(
  Sender: TObject);
begin
  inherited;
  FNextStartIndex := 0;
  btnSearch.Caption := 'Search';
  teSearchText.Text := '';
end;

procedure TfmBeefAISireRegister.teSearchTextPropertiesChange(
  Sender: TObject);
begin
  inherited;
  FNextStartIndex := 0;
  if teSearchText.Text = '' then
     btnSearch.Caption := 'Search';
end;

procedure TfmBeefAISireRegister.AddSire;
var
   AISire : TAnimalRecord;
   bFound : Boolean;
   AnimalID : Integer;
   Name, Code, Breed : string;
begin
  inherited;
  CheckSireSelected;

  // Add selected animal
  Code := TcxSSHelper.GetCellValue(FSireCodeCol, FSelectedRowIndex, SpreadSheet.Sheet);
  Name := TcxSSHelper.GetCellValue(FSireNameCol, FSelectedRowIndex, SpreadSheet.Sheet);
  Breed := TcxSSHelper.GetCellValue(FSireBreedCol, FSelectedRowIndex, SpreadSheet.Sheet);

  if MessageDlg( Format('Add Sire "%s" to your animal database?',[Name]),mtConfirmation,[mbYes,mbNo],0) = idNo then Exit;

  AnimalID := AnimalInUse(Code,Name);

  if (AnimalID<=0) then
     begin
        // Add animal to database
        AISire := TAnimalRecord.Create;
        AISire.CreateBullSemenStkRecord := True;
        try
           AISire.RaiseExceptions := False;

           AISire.AddToNoneHerd;
           AISire.AnimalNo := Code;
           AISire.Name := Trim(Name);
           AISire.Sex := cSex_Bull;
           AISire.LactNo := 0;
           AISire.InHerd := True;
           AISire.Breeding := True;
           AISire.DamID  := 0;
           AISire.SireID := 0;
           AISire.AnimalDeleted := False;

           // 08/01/2009 V3.9 R5.6 /SP Default Sire To Pedigree
           AISire.Pedigree := True;

           AISire.PrimaryBreedCode := Breed;
           if not AISire.Save then
              AISire.Cancel
           else
              begin
                 // Add BullSemenStk Record
                 with TQuery.Create(nil) do
                    try
                       DatabaseName := AliasName;
                       SQL.Clear;
                       SQL.Add('INSERT INTO BullExt (AnimalID)');
                       SQL.Add('VALUES (:AnimalID)');
                       Params[0].AsInteger := AISire.ID;
                       ExecSQL;
                    finally
                       Free;
                    end;

                 FBooleanResult := True;
                 MessageDlg(cSireAddedToDB,mtInformation,[mbOK],0);
              end;
           FBooleanResult := True; // sire has been added, reload queries containing ai sires.
        finally
           FreeAndNil(AISire);
        end;
     end
  else
     begin
        // update animal fields in database
        if MessageDlg(cSireAlreadyExists,mtConfirmation,[mbYes,mbNo],0) = idYes then
           begin
              with TQuery.Create(nil) do
                 try
                    DatabaseName := AliasName;
                    SQL.Clear;
                    SQL.Add('SELECT AnimalID FROM BullSemenStk');
                    SQL.Add('WHERE AnimalID = :AnimalID');
                    Params[0].AsInteger := AnimalID;
                    Open;
                    try
                       First;
                       bFound := Fields[0].AsInteger = AnimalID;
                    finally
                       Close;
                    end;
                    if not (bFound) then
                       begin
                          SQL.Clear;
                          SQL.Add('INSERT INTO BullSemenStk (AnimalID)');
                          SQL.Add('VALUES (:AnimalID)');
                          Params[0].AsInteger := AnimalID;
                          ExecSQL;
                       end
                    else
                       begin
                          SQL.Clear;
                          SQL.Add('UPDATE BullSemenStk SET InUse=True');
                          SQL.Add('WHERE AnimalID = :AnimalID');
                          Params[0].AsInteger := AnimalID;
                          ExecSQL;
                       end
                 finally
                    Free;
                 end;

              with TQuery.Create(nil) do
                 try
                    DatabaseName := AliasName;
                    SQL.Clear;
                    SQL.Add('SELECT AnimalID FROM BullExt');
                    SQL.Add('WHERE AnimalID = :AnimalID');
                    Params[0].AsInteger := AnimalID;
                    Open;
                    try
                       First;
                       bFound := Fields[0].AsInteger = AnimalID;
                    finally
                       Close;
                    end;
                    if not (bFound) then
                       begin
                          SQL.Clear;
                          SQL.Add('INSERT INTO BullExt (AnimalID)');
                          SQL.Add('VALUES (:AnimalID)');
                          Params[0].AsInteger := AnimalID;
                          ExecSQL;
                       end;
                 finally
                    Free;
                 end;
           end;
     end;

end;

function TfmBeefAISireRegister.AnimalInUse(const ACode,
  AName: String): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add( InsertSELECT(['ID']));
         SQL.Add( InsertFROM(['Animals']));
         SQL.Add( InsertWHERE(['AnimalNo'],[':AnimalNo']));
         SQL.Add( InsertOR(['UPPER(Name)'],[':Name']));
         Params[0].AsString := ACode;
         Params[1].AsString := UPPERCASE(AName);
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;

end;

procedure TfmBeefAISireRegister.actAddSireExecute(Sender: TObject);
begin
  inherited;
  AddSire;
end;

procedure TfmBeefAISireRegister.FormShow(Sender: TObject);
begin
  inherited;
  SelectRow(FDataTopRow);
end;

procedure TfmBeefAISireRegister.GetSerNoProcessed(Sender: TObject);
var
   FileName : string;
{   StrList  : TStringList;
   i : Integer;
   Str : String;}
begin
  inherited;
{  FAllowDownload := False;

  FileName := IncludeTrailingBackslash(GetSerNo.DownloadDir) + GetSerNo.DestinationName;
  if not OkToDownload(FileName, Def.Definition.dSerialNo) then
   if FileExists(FileName) then
      begin
         StrList := TStringList.Create;
         try
            StrList.LoadFromFile( FileName );
            Str := PadLeft(IntToStr(Def.Definition.dSerialNo),'0',4) + ' True';
            i := StrList.IndexOf(Str);
            FAllowDownload := i > -1;
         finally
            StrList.Clear; // Clear File contents
            StrList.SaveToFile( FileName ); // Save Empty file
            StrList.Free;
            DeleteFile( FileName ); // Delete file from disk
         end;
      end;
   if not FAllowDownload then
   MessageDlg('Unable to proceed with download. Please contact Kingswood '+#13#10+
              'concerning your annual maintenance.',mtError,[mbOK],0);
              }
   FileName := IncludeTrailingBackslash(GetSerNo.DownloadDir) + GetSerNo.DestinationName;
   AllowDownload := OkToDownload(FileName, Def.Definition.dSerialNo);
   if not AllowDownload then
      MessageDlg(cSupportExpired,mtError,[mbOK],0);
end;

procedure TfmBeefAISireRegister.heDownloadClick(Sender: TObject);
begin
  inherited;
  DownloadAIFile;
end;

procedure TfmBeefAISireRegister.GetWebUpdateProcessed(Sender: TObject);
var
   FileName : string;
   StrList  : TStringList;
   i : Integer;
   Str : String;
   FileNameOnFile : string;
begin
  inherited;
  FUpdateAvailable := False;
   FileName := IncludeTrailingBackslash(GetWebUpdate.DownloadDir) + GetWebUpdate.DestinationName;
   if FileExists(FileName) then
      begin
         StrList := TStringList.Create;
         try
            StrList.LoadFromFile( FileName );
            FAIWebServerFileName := StrList.Values['beefaisiresfname'];
            if FAIWebServerFileName <> '' then
               FUpdateAvailable := ((WinData.BeefAISireFileName='') or (FAIWebServerFileName<>WinData.BeefAISireFileName));
         finally
            StrList.Clear; // Clear File contents
            StrList.SaveToFile( FileName ); // Save Empty file
            StrList.Free;
            DeleteFile( FileName ); // Delete file from disk
         end;
      end;

   if not FUpdateAvailable then
      MessageDlg('No update is available at this time.',mtError,[mbOK],0);
end;

procedure TfmBeefAISireRegister.GetAllBullsProcessed(Sender: TObject);
var
  FileName : string;
begin
  inherited;
  FileName := IncludeTrailingBackslash(GetAllBulls.DownloadDir) + GetAllBulls.DestinationName;
  if FileExists(FileName) then
     begin
        WinData.BeefAISireFileName := FAIWebServerFileName;
        MessageDlg('The new sire register has been successfully downloaded and installed.'+cCRLFx2+'Click OK to begin using the new sire register.',mtInformation,[mbOK],0);
        LoadAIFile;
     end;
  ProgressBar.Visible := False;
  ProgressBar.Position := 0;
end;

procedure TfmBeefAISireRegister.DownloadAIFile;
begin
   Screen.Cursor := crHourGlass;
   try
      GetSerNo.Process(False, False);
      if AllowDownload then
         begin
            GetWebUpdate.Process(False, False);
            if FUpdateAvailable then
               begin
                  GetAllBulls.DestinationName := FAIWebServerFileName;
                  ProgressBar.Position := 0;
                  ProgressBar.Visible := True;
                  GetAllBulls.Process(False, True);
               end;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;


procedure TfmBeefAISireRegister.GetAllBullsProgress(Sender: TLMDWebHTTPGet;
  Item: TLMDDownloadItem);
begin
  inherited;
  ProgressBar.Position := Item.Progress;
  if ProgressBar.Position >= 100 then
     begin
        ProgressBar.Visible := False;
        ProgressBar.Position := 0;
     end;
  Update;
end;

procedure TfmBeefAISireRegister.SpreadSheetClick(Sender: TObject);
begin
  inherited;
  SelectRow( SpreadSheet.Sheet.ActiveCell.y );

end;

procedure TfmBeefAISireRegister.CheckSireSelected;
const
  InvalidSireSelection = 'You have not selected a valid sire.';
var
   Name, Code, Breed : string;
begin
  if FSelectedRowIndex < FDataTopRow then
     begin
        MessageDlg(InvalidSireSelection,mtError,[mbOk],0);
        Abort;
     end;
  Code := TcxSSHelper.GetCellValue(FSireCodeCol, FSelectedRowIndex, SpreadSheet.Sheet);
  Name := TcxSSHelper.GetCellValue(FSireNameCol, FSelectedRowIndex, SpreadSheet.Sheet);
  Breed := TcxSSHelper.GetCellValue(FSireBreedCol, FSelectedRowIndex, SpreadSheet.Sheet);
  if ((Trim(Code) = '') or (Trim(Name)='') or (Trim(Breed)='')) then
     begin
        MessageDlg(InvalidSireSelection,mtError,[mbOk],0);
        Abort;
     end;
end;

procedure TfmBeefAISireRegister.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  dxBarPopupMenu1.PopupFromCursorPos;
end;

procedure TfmBeefAISireRegister.FormActivate(Sender: TObject);
begin
  inherited;
  OnActivate := nil;
  Update;
  LoadAIFile;
end;

end.
