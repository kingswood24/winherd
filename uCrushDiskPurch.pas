unit uCrushDiskPurch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGridEh, ComCtrls, db, dbTables, uSPParser, DBCtrlsEh,
  DBGrids, ExtCtrls, RXCtrls, kwDBNavigator, ToolWin, PrnDbgeh, QRCtrls,
  QuickRpt, RXDBCtrl, QRExport;

type
  TfmCrushDiskPurch = class(TForm)
    sbSave: TRxSpeedButton;
    CrushGrid: TDBGridEh;
    StatusBar1: TStatusBar;
    cwfOpen: TOpenDialog;
    LookupCrushDiskTrans: TTable;
    Parser: TSPParser;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    CfDivider: TToolButton;
    sbPrint: TRxSpeedButton;
    sbImport: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel6: TQRLabel;
    VerNo: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    qrGroupName: TQRLabel;
    QRLabel8: TQRLabel;
    qrFilter: TQRLabel;
    Panel2: TPanel;
    Label3: TLabel;
    lGroupName: TLabel;
    sbCancel: TRxSpeedButton;
    ToolButton4: TToolButton;
    QRShape1: TQRShape;
    ToolButton6: TToolButton;
    QRLabel9: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    Panel1: TPanel;
    Panel3: TPanel;
    RecordNo: TDBStatusLabel;
    Label4: TLabel;
    NavBar: TKwDBNavigator;
    GroupBox2: TGroupBox;
    sbEdit: TRxSpeedButton;
    Label2: TLabel;
    ToolButton7: TToolButton;
    rgShowAnimals: TRadioGroup;
    sbViewInfo: TRxSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CrushGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CrushGridTitleClick(Column: TColumnEh);
    procedure sbExitClick(Sender: TObject);
    procedure sbImportClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure CrushGridDblClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rgShowAnimalsClick(Sender: TObject);
    procedure sbViewInfoClick(Sender: TObject);
  private
    { Private declarations }
//    FGroupID : Integer;
    tCrushTable : TTable;
    qCrushQuery : TQuery;
    dsCrush : TDataSource;
    tCrushDiskTrans : TTable;
    FNextCrushDiskID: Integer;
    procedure SetNextCrushDiskID(const Value: Integer);
    function GetNextCrushDiskID: Integer;
    procedure CreateAll;
    procedure Tidyup;
    procedure LoadFile;
    procedure LoadAnimals(ShowAll : Boolean= False);
    function CountFileByGroup : Integer;
    function CountAnimals(Matched : Boolean) : Integer;
    procedure UpdateStatusBar;
    procedure CrushAfterPost(Sender : TDataSet);
    procedure ViewInfo;
    property NextCrushDiskID : Integer read GetNextCrushDiskID write SetNextCrushDiskID;
//    function CountAnimalsByGroup: Integer;

  public
    { Public declarations }
  end;

  function ShowTheForm(const GrpID : Integer) : Integer;

var
  fmCrushDiskPurch: TfmCrushDiskPurch;

implementation
uses
   GenTypesConst, DairyData, uCrushDiskEdit;

{$R *.DFM}

  function ShowTheForm(const GrpID : Integer) : Integer;

//  function GroupExists : Boolean;
//  begin
//     Result := WinData.LookupGroups.Locate('ID', GrpID, []);
//  end;

  begin

//           if not GroupExists then
//              raise Exception.CreateFmt('Unable to locate Group. ID: %d',[GrpID]);
     Application.CreateForm(TfmCrushDiskPurch, fmCrushDiskPurch);
     try
        try
//           WinData.LookupGroups.Open;

//           fmCrushDiskPurch.FGroupID := GrpID;

//           fmCrushDiskPurch.lGroupName.Caption := WinData.LookupGroups.Lookup('ID', GrpID, 'Description');
           fmCrushDiskPurch.ShowModal;
        except
           raise Exception.Create(cFormCreateError);
        end;


     finally

        if fmCrushDiskPurch <> nil then
           with fmCrushDiskPurch do
              begin
                 tCrushTable.Filtered := False;
                 Result := tCrushTable.RecordCount;
//                 WinData.LookupGroups.Close;
                 qCrushQuery.Close;
                 qCrushQuery.Free;
                 tCrushTable.Close;
                 tCrushTable.DeleteTable;
                 tCrushTable.Free;
                 if tCrushDiskTrans <> nil then
                    begin
                       tCrushDiskTrans.Close;
                       tCrushDiskTrans.DeleteTable;
                       tCrushDiskTrans.Free;
                    end;
                 FreeAndNil(fmCrushDiskPurch);
                 fmCrushDiskPurch := nil;
              end;
     end;
end;

procedure TfmCrushDiskPurch.CreateAll;
begin
   qCrushQuery := TQuery.Create(nil);
   qCrushQuery.DatabaseName := AliasName;

   tCrushTable := TTable.Create(nil);
   with tCrushTable do
      try
         DatabaseName := AliasName;
         TableType := ttParadox;
         TableName := 'tCrushReview';

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftInteger, 0, False);
               Add('DiskID', ftInteger);
               Add('cfNatIDNum', ftString, 20, False);
               Add('cfAnimalNo', ftString, 10, False);
               Add('cfWeight', ftFloat, 0, False);
               Add('cfWeighDate', ftDate, 0, False);
               Add('HasCard', ftBoolean, 0, False);
               Add('LoadedFromFile', ftBoolean);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary, ixUnique]);
               Add('icfNatIDNum', 'cfNatIDNum', [ixCaseInsensitive]);
               Add('icfAnimalNo', 'cfAnimalNo', [ixCaseInsensitive]);
               Add('icfWeight', 'cfWeight', [ixCaseInsensitive]);
               Add('icfWeighDate', 'cfWeighDate', [ixCaseInsensitive]);

               Add('dcfNatIDNum', 'cfNatIDNum', [ixCaseInsensitive, ixDescending]);
               Add('dcfAnimalNo', 'cfAnimalNo', [ixCaseInsensitive, ixDescending]);
               Add('dcfWeight', 'cfWeight', [ixCaseInsensitive, ixDescending]);
               Add('dcfWeighDate', 'cfWeighDate', [ixCaseInsensitive, ixDescending]);
            end;

         CreateTable;
         Open;

         dsCrush := TDataSource.Create(nil);
         dsCrush.DataSet := tCrushTable;
         CrushGrid.DataSource := dsCrush;
         NavBar.DataSource := dsCrush;
         RecordNo.DataSource := dsCrush;

         LoadAnimals;
//         UpdateStatusBar;
         sbEditClick(nil);
         AfterPost := CrushAfterPost;
      except
         on E : EDatabaseError do
            raise Exception.Create(E.Message);
      end;
   try
      WinData.CreateTTable(tCrushDiskTrans , nil, WinData.KingData.DatabaseName, 'tcrushdisktrans');
      tCrushDiskTrans.FieldDefs.Assign(WinData.CrushDiskTrans.FieldDefs);
      tCrushDiskTrans.FieldDefs.Add('LoadedFromFile',ftBoolean);
      tCrushDiskTrans.IndexDefs.Assign(WinData.CrushDiskTrans.IndexDefs);
      tCrushDiskTrans.CreateTable;
      tCrushDiskTrans.Open;
   except
      raise Exception.create('Unable to create temporary tables'+#13#10+cErrorContact);
   end;

end;

procedure TfmCrushDiskPurch.Tidyup;
begin

end;

procedure TfmCrushDiskPurch.LoadFile;
var
  cf : TextFile;
  sTempStr, sBuffer : String;
  pFieldData : PChar;
  CrushDiskID : Integer;
  LineNum : Integer;
begin
   LineNum := 1;
   if not FileExists(cwfOpen.FileName) then
      begin
         MessageDlg('Cannot find crush weighing file', mtError, [mbOk], 0);
         Exit;
      end;

   tCrushDiskTrans.Open;

   dsCrush.DataSet := nil;
   CrushGrid.Columns[0].FieldName := 'AnimalTag';
   CrushGrid.Columns[1].FieldName := 'AnimalNum';
   CrushGrid.Columns[2].FieldName := 'AnimalWgt';
   CrushGrid.Columns[3].FieldName := 'WeighingDate';
   dsCrush.DataSet := tCrushDiskTrans;
   FNextCrushDiskID := NextCrushDiskID;

   try
      LookupCrushDiskTrans.Open;
      tCrushDiskTrans.DisableControls;
      AssignFile(cf,  cwfOpen.FileName);
      Reset(cf);
      Screen.Cursor := crHourGlass;
      DateSeparator := '-';

      while not eof(cf) do
         try
            ReadLn(cf, sBuffer);
            if Trim(sBuffer) = '' then Continue;

            SetLength(sBuffer, Length(sBuffer));
            Parser.Parse(sBuffer);

            pFieldData := PChar(Parser.Fields[2]);
            sTempStr := AnsiExtractQuotedStr(pFieldData , '"');
            if (Length(sTempStr) <= 0) or (Length(sTempStr) > tCrushDiskTrans.FieldByName('AnimalTag').Size) then
               begin
                  if MessageDlg(Format('Invalid line content. Line number %d'+#13#10+#13#10+'%s'+#13#10+#13#10+'Animal Tag Number not of expected size',[linenum,sBuffer] ),mtError,[mbOK, mbCancel],0) = idOk then
                     Continue
                  else
                     raise exception.create('Crush Intake cancelled');
               end;

            if LookupCrushDiskTrans.Locate('AnimalTag', sTempStr, []) then
               begin
                  MessageDlg(Format('Tag: "%s" '+#13#10+#13#10+'already found in group:'+#13#10+#13#10+'"%s"',[sTempStr, WinData.LookupGroups.Lookup('ID', WinData.CrushDisk.Lookup('ID', LookupCrushDiskTrans.FieldByName('DiskID').AsInteger, 'GroupID'), 'Description')]),mtError,[mbOK],0);
                  Continue;
               end;

            tCrushDiskTrans.Append;

            tCrushDiskTrans.FieldByName('DiskID').AsInteger := FNextCrushDiskID;
            tCrushDiskTrans.FieldByName('AnimalTag').AsString := sTempStr;

            pFieldData := PChar(Parser.Fields[3]);
            sTempStr := AnsiExtractQuotedStr(pFieldData , '"');
            if ( Length(sTempStr) > tCrushDiskTrans.FieldByName('AnimalNum').Size ) then
               begin
                  tCrushDiskTrans.Cancel;
                  if MessageDlg(Format('Invalid line content. Line number %d'+#13#10+#13#10+'%s'+#13#10+#13#10+'Animal Number not of expected size',[linenum,sBuffer] ),mtError,[mbOK, mbCancel],0) = idOk then
                     Continue
                  else
                     raise exception.create('Crush Intake cancelled');
               end;
            tCrushDiskTrans.FieldByName('AnimalNum').AsString := sTempStr;

            try
               pFieldData := PChar(UPPERCASE(Parser.Fields[4]));
               sTempStr := AnsiExtractQuotedStr(pFieldData, '"');
               System.Delete(sTempStr , Pos('KG', sTempStr), 2);
               tCrushDiskTrans.FieldByName('AnimalWgt').AsFloat := StrToFloat(sTempStr);
            except
               tCrushDiskTrans.Cancel;
               if MessageDlg(Format('Invalid line content. Line number %d'+#13#10+#13#10+'%s'+#13#10+#13#10+'Unable to animal weight ',[linenum, sBuffer] ),mtError,[mbOK, mbCancel],0) = idOk then
                  Continue
               else
                  raise exception.create('Crush Intake cancelled');
            end;

            pFieldData := PChar(Parser.Fields[6]);
            try
               tCrushDiskTrans.FieldByName('WeighingDate').AsDateTime := StrToDate(AnsiExtractQuotedStr(pFieldData, '"'));
            except
               tCrushDiskTrans.Cancel;
               if MessageDlg(Format('Invalid line content. Line number %d'+#13#10+#13#10+'%s'+#13#10+#13#10+'Unable to animal weight ',[linenum, sBuffer] ),mtError,[mbOK, mbCancel],0) = idOk then
                  Continue
               else
                  raise exception.create('Crush Intake cancelled');
            end;

            tCrushDiskTrans.FieldByName('LoadedFromFile').AsBoolean := True;
            tCrushDiskTrans.Post;
            Application.ProcessMessages;
            Inc(LineNum);
         except
            if tCrushDiskTrans.State in dseditmodes then
               tCrushDiskTrans.Cancel;
            tCrushDiskTrans.Close;
            tCrushDiskTrans.EmptyTable;
            LoadAnimals;
            raise;
         end;

   finally
      CloseFile(cf);
      DateSeparator := '/'; // NB!Make sure to reset the date sep.
      LookupCrushDiskTrans.Close;
      if tCrushDiskTrans.Active then
         begin
            tCrushDiskTrans.First;
            tCrushDiskTrans.EnableControls;
            if tCrushDiskTrans.RecordCount > 0 then
               begin
                  sbSave.Enabled := True;
                  sbCancel.Enabled := True;
               end;
         end;
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmCrushDiskPurch.FormCreate(Sender: TObject);
begin
   qrFilter.Caption := '';
   qrGroupName.Caption := '';
   QuickRep1.Hide;
   FNextCrushDiskID := 0;
   WinData.LoadBtnImage(sbPrint.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbImport.Glyph, cBtnImgLoad);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(sbSave.Glyph, cBtnImgSave);
   WinData.LoadBtnImage(sbCancel.Glyph, cBtnImgCancel);
   sbSave.Enabled := False;
   sbCancel.Enabled := False;
   rgShowAnimals.ItemIndex := 0;
end;

procedure TfmCrushDiskPurch.FormShow(Sender: TObject);
begin
   Update;
   Application.ProcessMessages;
   CreateAll;
end;

function TfmCrushDiskPurch.CountFileByGroup: Integer;
begin
   try
      qCrushQuery.SQL.Clear;
      qCrushQuery.SQL.Add('SELECT COUNT(ID) CountOfID FROM CrushDisk ');
//      qCrushQuery.SQL.Add('WHERE GroupID = :GID ');
//      qCrushQuery.Params[0].AsInteger := FGroupID;
      qCrushQuery.Open;
      qCrushQuery.First;
      Result := qCrushQuery.FieldByName('CountOfID').AsInteger;
   finally
      qCrushQuery.Close;
   end;
end;

procedure TfmCrushDiskPurch.LoadAnimals(ShowAll : Boolean= False);
begin
   {if FGroupID <= 0 then
      begin
         MessageDlg('Cannot determine GroupId, restart program',mtWarning,[mbOK],0);
         Exit;
      end;
   }

   tCrushTable.DisableControls;
   tCrushTable.Filter := '';
   tCrushTable.Filtered := False;
   dsCrush.DataSet := nil;
   CrushGrid.Columns[0].FieldName := 'cfNatIDNum';
   CrushGrid.Columns[1].FieldName := 'cfAnimalNo';
   CrushGrid.Columns[2].FieldName := 'cfWeight';
   CrushGrid.Columns[3].FieldName := 'cfWeighDate';
   try
      qCrushQuery.SQL.Clear;
      qCrushQuery.SQL.Add('DELETE FROM tCrushReview');
      qCrushQuery.ExecSQL;


      qCrushQuery.SQL.Clear;
      qCrushQuery.SQL.Add('INSERT INTO tCrushReview (ID, DiskID, cfNatIDNum, cfAnimalNo, cfWeight, cfWeighDate, HasCard, LoadedFromFile) ');
      qCrushQuery.SQL.Add('SELECT DISTINCT C.ID, DiskID, C.AnimalTag, C.AnimalNum, C.AnimalWgt, C.WeighingDate, C.HasCard, False ');
      qCrushQuery.SQL.Add('FROM CrushDiskTrans C');
      if not ShowAll then
         qCrushQuery.SQL.Add('WHERE  (HasCard = False)');
      qCrushQuery.ExecSQL;

   finally
      dsCrush.DataSet := tCrushTable;
      tCrushTable.First;
      tCrushTable.Refresh;
      tCrushTable.EnableControls;
      UpdateStatusBar;
   end;
end;

procedure TfmCrushDiskPurch.CrushGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if dsCrush.DataSet <> tCrushTable then Exit;
//   if not Assigned(tCrushTable) then Exit;
  if ( tCrushTable.State <> dsInactive ) and ( tCrushTable.RecordCount > 0 ) then
     if ( tCrushTable.FieldByName('HasCard').AsBoolean = False ) then
        AFont.Color := clRed;
end;

procedure TfmCrushDiskPurch.CrushGridTitleClick(Column: TColumnEh);
var
   Identifier : Byte;
begin
   if Column.Title.SortMarker <> smUpEh then
      begin
         Column.Title.SortMarker := smUpEh;
         Identifier := 100;
      end
   else
      begin
         Column.Title.SortMarker := smDownEh;
         Identifier := 105;
      end;

   if tCrushTable.IndexDefs.IndexOf(Chr(Identifier)+Column.Field.FieldName) > 0 then
      tCrushTable.IndexName := Chr(Identifier)+Column.Field.FieldName;
end;

{function TfmCrushDiskPurch.CountAnimalsByGroup: Integer;
begin
   try
//      qCrushQuery.SQL.Add('WHERE ( CT.DiskID IN (SELECT CD.ID FROM CrushDisk CD ');
//      qCrushQuery.SQL.Add('                      WHERE ( CD.GroupID = :GID ))) ');
//      qCrushQuery.Params[0].AsInteger := FGroupID;

      qCrushQuery.SQL.Clear;
      qCrushQuery.SQL.Add('SELECT COUNT(CT.ID) CountOfID FROM CrushDiskTrans CT ');
      qCrushQuery.SQL.Add('WHERE Matched = False');
      qCrushQuery.Open;
      qCrushQuery.First;
      Result := qCrushQuery.FieldByName('CountOfID').AsInteger;


   finally
      qCrushQuery.Close;
   end;

end;
}
procedure TfmCrushDiskPurch.UpdateStatusBar;
begin
   try
      StatusBar1.Panels[0].Text := 'Total:';
      StatusBar1.Panels[1].Text := 'Files: '+IntToStr(CountFileByGroup);
      StatusBar1.Panels[2].Text := 'Matched: '+IntToStr(CountAnimals(True));
      StatusBar1.Panels[3].Text := 'Not Matched: '+IntToStr(CountAnimals(False));
   except
      MessageDlg('Unable to load totals',mtWarning,[mbOK],0);
   end;
end;

procedure TfmCrushDiskPurch.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmCrushDiskPurch.sbImportClick(Sender: TObject);
begin
   if cwfOpen.Execute then
      begin
         Application.ProcessMessages;
         LoadFile;
         UpdateStatusBar;
      end;
end;

procedure TfmCrushDiskPurch.CrushAfterPost(Sender: TDataSet);
begin
   if WinData.CrushDiskTrans.Locate('ID', tCrushTable.FieldByName('ID').AsInteger, []) then
      try
         WinData.CrushDiskTrans.Edit;
         if tCrushTable.FieldByName('cfNatIDNum').Value <> WinData.CrushDiskTrans.FieldByName('AnimalTag').Value then
            WinData.CrushDiskTrans.FieldByName('AnimalTag').Value := tCrushTable.FieldByName('cfNatIDNum').Value;
         if tCrushTable.FieldByName('cfAnimalNo').Value <> WinData.CrushDiskTrans.FieldByName('AnimalNum').Value then
            WinData.CrushDiskTrans.FieldByName('AnimalNum').Value := tCrushTable.FieldByName('cfAnimalNo').Value;
         if tCrushTable.FieldByName('cfWeight').Value <> WinData.CrushDiskTrans.FieldByName('AnimalWgt').Value then
            WinData.CrushDiskTrans.FieldByName('AnimalWgt').Value := tCrushTable.FieldByName('cfWeight').Value;
         if tCrushTable.FieldByName('cfWeighDate').Value <> WinData.CrushDiskTrans.FieldByName('WeighingDate').Value then
            WinData.CrushDiskTrans.FieldByName('WeighingDate').Value := tCrushTable.FieldByName('cfWeighDate').Value;
         WinData.CrushDiskTrans.Post;
      except
         if WinData.CrushDiskTrans.State in dsEditModes then
            WinData.CrushDiskTrans.Cancel;
      end;
   UpdateStatusBar;
end;

procedure TfmCrushDiskPurch.sbPrintClick(Sender: TObject);
begin
   QuickRep1.DataSet := tCrushTable;
   QRDBText1.DataSet := tCrushTable;
   QRDBText2.DataSet := tCrushTable;
   QRDBText3.DataSet := tCrushTable;
   QRDBText4.DataSet := tCrushTable;
   qrGroupName.Caption := lGroupName.Caption;
   case rgShowAnimals.ItemIndex of
      0 : qrFilter.Caption := 'Showing animals not matched from crush';
      1 : qrFilter.Caption := 'Showing animals matched from crush';
      2 : qrFilter.Caption := 'Showing all animals from crush';
   end;


   QuickRep1.Preview;
end;

procedure TfmCrushDiskPurch.sbEditClick(Sender: TObject);
begin
   if sbEdit.Down then
      begin
//         CrushGrid.ReadOnly := False;
         GroupBox2.Font.Color := clRed;
         CrushGrid.Options := [dgEditing,dgAlwaysShowEditor,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
         StatusBar1.Panels[4].Text := 'Status: Edit Mode';
         tCrushTable.Filter := 'HasCard = False';
         tCrushTable.Filtered := True;
         MessageDlg('Only animals that have not been matched can be modified.',mtInformation,[mbOK],0);
      end
   else
      begin
//         CrushGrid.ReadOnly := True;
         GroupBox2.Font.Color := clWindowText;
         CrushGrid.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
         StatusBar1.Panels[4].Text := 'Status: Read Only';
      end;
end;

procedure TfmCrushDiskPurch.sbHelpClick(Sender: TObject);
begin
//
end;

procedure TfmCrushDiskPurch.SetNextCrushDiskID(const Value: Integer);
begin
   with WinData.OtherIDs do
      begin
         Open;
         try
            First;
            Edit;
            FieldByName('CrushDiskId').AsInteger := Value;
            Post;
         finally
            Close;
         end;
      end;
end;

function TfmCrushDiskPurch.GetNextCrushDiskID: Integer;
begin
   with WinData.OtherIDs Do
      begin
         Open;
         try
            First;
            Result := FieldByName('CrushDiskId').AsInteger + 1;
         finally
            Close;
         end;
      end;
end;

procedure TfmCrushDiskPurch.sbSaveClick(Sender: TObject);
begin
   if MessageDlg('Save crush animals to the database?',mtConfirmation,[mbYes, mbNo],0) = idno then
      Exit;

   try
      WinData.CrushDisk.Append;
      WinData.CrushDisk.FieldByName('ID').AsInteger := FNextCrushDiskID;
//      WinData.CrushDisk.FieldByName('GroupID').AsInteger := FGroupID;
      WinData.CrushDisk.FieldByName('ReadDate').AsDateTime := Date;
      WinData.CrushDisk.FieldByName('PurchWgtFile').AsBoolean := True;
      WinData.CrushDisk.Post;
      NextCrushDiskID := FNextCrushDiskID;

      with tCrushDiskTrans do
         begin
            First;
            while not eof do
               begin
                  if tCrushDiskTrans.FieldByName('LoadedFromFile').AsBoolean then
                     begin
                        //
                        WinData.CrushDiskTrans.Append;
                        WinData.CrushDiskTrans.FieldByName('DiskId').AsInteger := FNextCrushDiskID;
                        WinData.CrushDiskTrans.FieldByName('AnimalTag').AsString := FieldByName('AnimalTag').AsString;
                        WinData.CrushDiskTrans.FieldByName('AnimalNum').AsString := FieldByName('AnimalNum').AsString;
                        WinData.CrushDiskTrans.FieldByName('AnimalWgt').AsFloat := FieldByName('AnimalWgt').AsFloat;
                        WinData.CrushDiskTrans.FieldByName('WeighingDate').AsDateTime := FieldByName('WeighingDate').AsDateTime;
                        WinData.CrushDiskTrans.FieldByName('HasCard').AsBoolean := False;
                        WinData.CrushDiskTrans.Post;
                     end;
                  Next;
               end;
         end;
      tCrushDiskTrans.Close;
      tCrushDiskTrans.EmptyTable;
      sbSave.Enabled := False;
      sbCancel.Enabled := False;
      LoadAnimals;
   except
   end;
end;

procedure TfmCrushDiskPurch.sbCancelClick(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to discard crush animals?',mtConfirmation,[mbYes, mbNo],0) = idno then
      Exit;
   tCrushDiskTrans.Close;
   tCrushDiskTrans.EmptyTable;
   sbSave.Enabled := False;
   sbCancel.Enabled := False;
   LoadAnimals;
end;

procedure TfmCrushDiskPurch.CrushGridDblClick(Sender: TObject);
begin
   ViewInfo;
end;

procedure TfmCrushDiskPurch.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if tCrushTable.FieldByName('HasCard').AsBoolean then
      DetailBand1.Font.Color := clNavy
   else
      DetailBand1.Font.Color := clRed;
end;

procedure TfmCrushDiskPurch.rgShowAnimalsClick(Sender: TObject);
var
   i : Integer;
begin
   Screen.Cursor := crHourGlass;
   sbEdit.Down := False;
   sbEdit.Click;
   try
      for i := 0 to rgShowAnimals.Items.Count-1 do
         begin
            if i = rgShowAnimals.ItemIndex then
               begin
                  TRadioButton(rgShowAnimals.Controls[i]).Font.Style := [fsBold];
               end
            else
               begin
                  TRadioButton(rgShowAnimals.Controls[i]).Font.Style := [];
               end
         end;

      case rgShowAnimals.ItemIndex of
         0 : begin
                LoadAnimals(True);
                tCrushTable.Filter := 'HasCard = False';
                tCrushTable.Filtered := True;
             end;
         1 : begin
                LoadAnimals(True);
                tCrushTable.Filter := 'HasCard = True';
                tCrushTable.Filtered := True;
             end;
         2 : begin
                LoadAnimals(True);
                tCrushTable.Filter := '';
                tCrushTable.Filtered := False;
             end;
      end;

   finally
      Screen.Cursor := crDefault;
   end;
end;

{function TfmCrushDiskPurch.CountAnimalsMatched: Integer;
begin
//      qCrushQuery.SQL.Add('WHERE ( CT.DiskID IN (SELECT CD.ID FROM CrushDisk CD ');
//      qCrushQuery.SQL.Add('                      WHERE ( CD.GroupID = :GID ))) ');
//      qCrushQuery.Params[0].AsInteger := FGroupID;

   try
      qCrushQuery.SQL.Clear;
      qCrushQuery.SQL.Add('SELECT COUNT(CT.ID) CountOfID FROM CrushDiskTrans CT ');
      qCrushQuery.SQL.Add('WHERE Matched = False');
      qCrushQuery.Open;
      qCrushQuery.First;
      Result := qCrushQuery.FieldByName('CountOfID').AsInteger;


   finally
      qCrushQuery.Close;
   end;
end;
}
function TfmCrushDiskPurch.CountAnimals(Matched: Boolean): Integer;
begin
   qCrushQuery.SQL.Clear;
   qCrushQuery.SQL.Add('SELECT COUNT(CT.ID) CountOfID FROM CrushDiskTrans CT ');
   if Matched then
      qCrushQuery.SQL.Add('WHERE HasCard = True')
   else
      qCrushQuery.SQL.Add('WHERE HasCard = False');
   qCrushQuery.Open;
   qCrushQuery.First;
   Result := qCrushQuery.FieldByName('CountOfID').AsInteger;
end;

procedure TfmCrushDiskPurch.sbViewInfoClick(Sender: TObject);
begin
   ViewInfo;
end;

procedure TfmCrushDiskPurch.ViewInfo;
var
   iFieldArray : Array [0..4] of String;
   RecordModified : Boolean;
begin
   if dsCrush.DataSet <> tCrushTable then Exit;

   iFieldArray[0] := CrushGrid.Columns[0].FieldName; // natid
   iFieldArray[1] := CrushGrid.Columns[1].FieldName;
   iFieldArray[2] := CrushGrid.Columns[2].FieldName;
   iFieldArray[3] := CrushGrid.Columns[3].FieldName;
   RecordModified := FALSE;
   TfmCrushDiskEdit.Create(self).ShowTheForm(cftPurchase, CrushGrid.DataSource, iFieldArray, RecordModified);
   if RecordModified then
      begin
         LookupCrushDiskTrans.Open;
         try
            if LookupCrushDiskTrans.Locate('ID', tCrushTable.FieldByName('ID').AsInteger, []) then
               begin
                  LookupCrushDiskTrans.Edit;
                  if tCrushTable.FieldByName('cfNatIDNum').AsString <> LookupCrushDiskTrans.FieldByName('AnimalTag').AsString then
                     LookupCrushDiskTrans.FieldByName('AnimalTag').AsString := tCrushTable.FieldByName('cfNatIDNum').AsString;

                  if tCrushTable.FieldByName('cfAnimalNo').AsString <> LookupCrushDiskTrans.FieldByName('AnimalNum').AsString then
                     LookupCrushDiskTrans.FieldByName('AnimalNum').AsString := tCrushTable.FieldByName('cfAnimalNo').AsString;

                  if tCrushTable.FieldByName('cfWeight').AsFloat <> LookupCrushDiskTrans.FieldByName('AnimalWgt').AsFloat then
                     LookupCrushDiskTrans.FieldByName('AnimalWgt').AsFloat := tCrushTable.FieldByName('cfWeight').AsFloat;

                  if tCrushTable.FieldByName('cfWeighDate').AsDateTime <> LookupCrushDiskTrans.FieldByName('WeighingDate').AsDateTime then
                     LookupCrushDiskTrans.FieldByName('WeighingDate').AsDateTime := tCrushTable.FieldByName('cfWeighDate').AsDateTime;

                  if tCrushTable.FieldByName('HasCard').AsBoolean <> LookupCrushDiskTrans.FieldByName('HasCard').AsBoolean then
                     LookupCrushDiskTrans.FieldByName('HasCard').AsBoolean := tCrushTable.FieldByName('HasCard').AsBoolean;
                  LookupCrushDiskTrans.Post;
               end;
         finally
            LookupCrushDiskTrans.Close;
         end;
      end;
end;

end.