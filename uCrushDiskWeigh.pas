unit uCrushDiskWeigh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, db, dbTables, DBGridEh, uSPParser, ExtCtrls, RXCtrls,
  ComCtrls, ToolWin, RxLookup, RXDBCtrl, kwDBNavigator, DBgrids, uEditEx,
  DBCtrlsEh, uCrushHelper, KRoutines;

type
  TfmCrushDiskWeigh = class(TForm)
    CrushGrid: TDBGridEh;
    Parser: TSPParser;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    sbRecord: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbLoad: TRxSpeedButton;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Label1: TLabel;
    Edit1: TEditEx;
    Label3: TLabel;
    Edit2: TEditEx;
    Bevel1: TBevel;
    cwfOpen: TOpenDialog;
    NavBar: TKwDBNavigator;
    Label4: TLabel;
    Label2: TLabel;
    CrushTable: TTable;
    CrushTableID: TAutoIncField;
    CrushTableAnimalID: TIntegerField;
    CrushTablecfNatIDNum: TStringField;
    CrushTableSortNatID: TStringField;
    CrushTablecfAnimalNo: TStringField;
    CrushTablecfWeight: TFloatField;
    CrushTablecfWeighDate: TDateField;
    CrushTableRecorded: TBooleanField;
    CrushTableLactNo: TIntegerField;
    CrushTableHerdID: TIntegerField;
    CrushTablePenname: TStringField;
    CrushTablePenID: TIntegerField;
    GroupLinks: TTable;
    Pen: TRxDBLookupCombo;
    cbEditData: TDBCheckBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure sbLoadClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbRecordClick(Sender: TObject);
    procedure CrushGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CrushGridDblClick(Sender: TObject);
    procedure PenCloseUp(Sender: TObject);
    procedure GroupLinksBeforePost(DataSet: TDataSet);
    procedure cbEditDataClick(Sender: TObject);
  private
    { Private declarations }
    {CrushTable,} MatchTable: TTable;
    MyQuery : TQuery;
    cf : TextFile;
    dsCrushTable : TDataSource;

    procedure Import(FName : TFileName);
    procedure LoadHerd;
    procedure GetExistingGrpID(const AID : Integer; const GroupType : String; var GrpID : Integer );
    procedure AssignPenToAnimals(PenID : Integer);
  public
    { Public declarations }

  end;

  procedure ShowTheForm;

var
  fmCrushDiskWeigh: TfmCrushDiskWeigh;

implementation
uses
   DairyData, GenTypesConst, EventRecording, uUpdateTables,
   uGroupSetUp, BDE,uCrushDiskEdit;

{$R *.DFM}

  procedure ShowTheForm;
  var
     bAlreadyOpen : Boolean;
  begin
     try
        try
           Application.CreateForm(TfmCrushDiskWeigh, fmCrushDiskWeigh);

           try
              bAlreadyOpen := WinData.LookupGroups.Active;
              if not bAlreadyOpen then
                 WinData.LookupGroups.Active := True;
              WinData.LookupGroups.Filter := 'GroupType = ''Batch''';
              WinData.LookupGroups.Filtered := True;
           except
              raise Exception.Create('Unable to load group types'+#13#10+cErrorContact);
           end;

           fmCrushDiskWeigh.ShowModal;
        except
           raise Exception.Create(cFormCreateError);
        end;

     finally
        if TfmCrushDiskWeigh <> nil then
           with fmCrushDiskWeigh do
              begin
                 CrushTable.Close;
                 CrushTable.DeleteTable;

                 if MatchTable <> nil then
                    begin
                       MatchTable.Close;
                       MatchTable.DeleteTable;
                       MatchTable.Free;
                    end;
                 if MyQuery <> nil then
                    begin
                       MyQuery.Close;
                       MyQuery.Free;
                    end;

                 if dsCrushTable <> nil then
                    dsCrushTable.Free;

                 WinData.LookupGroups.Filter := '';
                 WinData.LookupGroups.Filtered := False;
                 WinData.LookupGroups.Active := bAlreadyOpen;

                 Free;
              end;
     end;
  end;

procedure TfmCrushDiskWeigh.FormCreate(Sender: TObject);
var
   PenLookupField : TField;
begin
   if not uUpdateTables.CreateCrushTables then
      raise Exception.Create('Unable to create temp tables, contact Kingswood');

   Edit1.Text := '0';
   Edit2.Text := '0';

   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbLoad.Glyph,cBtnImgLoad);
   WinData.LoadBtnImage(WinData.Images,sbRecord.Glyph,cBtnImgRecord);

   MyQuery := TQuery.Create(nil);
   MyQuery.DatabaseName := AliasName;

   MatchTable := TTable.Create(nil);
   with MatchTable do
      begin
         DatabaseName := AliasName;
         TableType := ttParadox;
         TableName := 'tCrushMatch';

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc, 0, False);
               Add('AnimalID', ftInteger, 0, False);
               Add('MatchNatIDNum', ftString, 20, False);
               Add('LactNo', ftInteger, 0, False);
               Add('HerdID', ftInteger, 0, False);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary, ixUnique]);
               Add('iAnimalID', 'AnimalID', [ixCaseInsensitive]);
            end;
         CreateTable;
         Open;

         LoadHerd;
      end;

   //CrushTable := TTable.Create(nil);
   with CrushTable do
      try
         DatabaseName := AliasName;
         TableType := ttParadox;
         TableName := 'tCrush';

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc, 0, False);
               Add('AnimalID', ftInteger, 0, False);
               Add('cfNatIDNum', ftString, 20, False);
               Add('SortNatID', ftString, 20, False);
               Add('cfAnimalNo', ftString, 10, False);
               Add('cfWeight', ftFloat, 0, False);
               Add('cfWeighDate', ftDate, 0, False);
               Add('Recorded', ftBoolean, 0, False);
               Add('LactNo', ftInteger, 0, False);
               Add('HerdID', ftInteger, 0, False);
               Add('PenName', ftString, 30, False);
               Add('PenID', ftInteger, 0, False);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary, ixUnique]);
               Add('icfNatIDNum', 'cfNatIDNum', [ixCaseInsensitive]);
               Add('iSortNatID', 'SortNatID', [ixCaseInsensitive]);
               Add('dSortNatID', 'SortNatID', [ixDescending, ixCaseInsensitive]);
            end;

         CreateTable;
         Open;

         CrushGrid.Columns[4].DropDownRows := WinData.LookupGroups.RecordCount;

      except
         on E : EDatabaseError do
            raise Exception.Create(E.Message);
      end;

      dsCrushTable := TDataSource.Create(nil);
      dsCrushTable.DataSet := CrushTable;
      CrushGrid.DataSource := dsCrushTable;
      NavBar.DataSource := dsCrushTable;
end;

procedure TfmCrushDiskWeigh.Import(FName : TFileName);
var
   i : Byte;
   Buffer : String;
   TempStr : String;
   AlreadyActive : Boolean;
   TempPChar : PChar;
   GrpID : Integer;
begin

   if not FileExists(cwfOpen.FileName) then
      begin
         MessageDlg('File does not exist', mtError, [mbOk], 0);
         Exit;
      end;

   StatusBar1.Panels[0].Text := 'File: '+ cwfOpen.FileName;

   with WinData.LookUpDamSire do
      begin
         AlreadyActive := Active;
         if not AlreadyActive then
            Active := True;
      end;

   WinData.SQLEmptyTable(CrushTable.TableName);
   try
      GroupLinks.Open;
   except
      on E :Exception do
         ShowMessage(E.Message);
   end;
   try
      CrushTable.Refresh;
      CrushTable.DisableControls;
      AssignFile(cf,  cwfOpen.FileName);
      Reset(cf);

      Screen.Cursor := crHourGlass;
      DateSeparator := '-';
      while not eof(cf) do
         begin
            Application.ProcessMessages;
            ReadLn(cf, Buffer);
            SetLength(Buffer, Length(Buffer));
            Parser.Parse(Buffer);
            TempPChar := PChar(Parser.Fields[2]);
            TempStr := AnsiExtractQuotedStr(TempPChar, '"');
            try
               CrushTable.Append;
               CrushTable.FieldByName('cfNatIDNum').AsString := TempStr;
               TempPChar := PChar(Parser.Fields[3]);
               CrushTable.FieldByName('cfAnimalNo').AsString := AnsiExtractQuotedStr(TempPChar, '"');
               try
                  TempPChar := PChar(UPPERCASE(Parser.Fields[4]));
                  TempStr := AnsiExtractQuotedStr(TempPChar, '"');
                  System.Delete(TempStr , Pos('KG',TempStr), 2);
                  TempStr := Trim(TempStr);
                  CrushTable.FieldByName('cfWeight').AsFloat := StrToFloat(TempStr);
               except
               end;
               TempPChar := PChar(Parser.Fields[6]);
               CrushTable.FieldByName('cfWeighDate').AsDateTime := StrToDate(AnsiExtractQuotedStr(TempPChar, '"'));
               if MatchTable.Locate('MatchNatIDNum', CrushTable.FieldByName('cfNatIDNum').AsString, [loCaseInsensitive]) then
                  begin
                     CrushTable.FieldByName('AnimalID').AsInteger := MatchTable.FieldByName('AnimalID').AsInteger;
                     CrushTable.FieldByName('HerdID').AsInteger := MatchTable.FieldByName('HerdID').AsInteger;
                     CrushTable.FieldByName('LactNo').AsInteger := MatchTable.FieldByName('LactNo').AsInteger;

                     if CrushTable.FieldByName('AnimalID').AsInteger > 0 then
                         begin
                            GetExistingGrpID(CrushTable.FieldByName('AnimalID').AsInteger, 'Batch', GrpID);
                            if GrpID > 0 then
                               if GroupLinks.Locate('GroupID;AnimalID', VarArrayOf([GrpID, CrushTable.FieldByName('AnimalID').AsInteger]), []) then
                                  CrushTable.FieldByName('PenID').AsInteger := GroupLinks.FieldByName('GroupID').AsInteger;
                         end;
                  end;
               CrushTable.Post;
            except
               CrushTable.Cancel;
            end;
         end;
      Edit1.Text := IntToStr(CrushTable.RecordCount);
      sbRecord.Enabled := True;
      cbEditData.Enabled := True;
   finally
      CloseFile(cf);
      GroupLinks.Close;
      Screen.Cursor := crDefault;
      DateSeparator := '/'; // NB! Make sure to reset the date sep.
      CrushTable.First;
      CrushTable.EnableControls;
   end;
end;

procedure TfmCrushDiskWeigh.sbLoadClick(Sender: TObject);
begin
   if not cwfOpen.Execute then Exit;

   try
      Import(cwfOpen.FileName);
   except
      MessageDlg('Unable to load totals',mtWarning,[mbOK],0);
   end;

end;

procedure TfmCrushDiskWeigh.LoadHerd;
var
   tNatIdNum : String[20];
begin
   Screen.Cursor := crHourGlass;
   try
      WinData.SQLEmptyTable(MatchTable.TableName);
      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO tCrushMatch (AnimalID, MatchNatIDNum, LactNo, HerdID ) ');
            SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.LactNo, A.HerdID From Animals A');
            SQL.Add('WHERE ( A.InHerd = True ) ');
            SQL.Add('AND ( A.HerdID <> ' + IntToStr(WinData.NONEHerdID)+ ')');
            SQL.Add('AND ( A.AnimalDeleted = False ) ');
            SQL.Add('AND ( A.NatIDNum IS NOT NULL )');
            ExecSQL;
         end;

      with MatchTable do
         begin
            Screen.Cursor := crHourGlass;
            Open;
            First;
            while not eof do
               try
                  Edit;
                  tNatIdNum := UPPERCASE(FieldByName('MatchNatIDNum').AsString);
                  if (WhatStyleNatID(tNatIdNum, False) in [Style1999, Style1996]) then
                     if Copy(tNatIdNum, 1, 2) = 'IE' then
                        System.Delete(tNatIdNum, 1, 2);
                  tNatIdNum := WinData.StripAllNomNumAlpha(tNatIdNum);
                  tNatIdNum := WinData.StripAllSpaces(tNatIdNum);
                  FieldByName('MatchNatIDNum').AsString := tNatIdNum;
                  Post;
                  Next;
               except
                  Cancel;
                  raise;
               end;
         end;

      finally
         MatchTable.First;
         Screen.Cursor := crDefault;
      end;

end;

procedure TfmCrushDiskWeigh.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmCrushDiskWeigh.sbRecordClick(Sender: TObject);
var
   WeighingEvent : TWeighingEvent;
   NoRecorded : Integer;
   GrpID : Integer;
begin
   if MessageDlg('Update all animals with weighing events?', mtConfirmation,[mbYes,mbNo],0) = idno then Exit;

   cbEditData.Enabled := False;
   WeighingEvent := TWeighingEvent.Create('CWeights');
   NoRecorded := 0;

   with CrushTable do
      try
         GroupLinks.Open;
         First;
         while not Eof do
            begin

               if not ( CrushTable.FieldByName('AnimalID').AsInteger > 0 ) then
                  begin
                     Next;
                     Continue;
                  end;

               if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventDate;EventType',
                                  VarArrayOf([CrushTable.FieldByName('AnimalID').AsInteger,
                                              CrushTable.FieldByName('LactNo').AsInteger,
                                              CrushTable.FieldByName('cfWeighDate').AsDateTime,
                                              CWeightEvent]), []) then
                  if MessageDlg(Format('Animal %s already has weighing event on %s'+#13#10+#13#10+
                                       'Do you want to record this event anyway?',
                                       [CrushTable.FieldByName('cfNatIDNum').AsString,
                                       FormatDateTime('dd/mm/yyyy', CrushTable.FieldByName('cfWeighDate').AsDateTime)]),mtconfirmation,[mbYes,mbNo],0) = idNo then
                     begin
                        Next;
                        Continue;
                     end;

               { Check if animal is already in "Batch" group }
               GetExistingGrpID(CrushTable.FieldByName('AnimalID').AsInteger, 'Batch', GrpID);
               if GrpID > 0 then
                  begin
                     { edit existing grplink record}
                     if GroupLinks.Locate('GroupID;AnimalID', VarArrayOf([GrpID, CrushTable.FieldByName('AnimalID').AsInteger]), []) then
                        try
                           GroupLinks.Edit;
                           GroupLinks.FieldByName('GroupID').AsInteger := CrushTable.FieldByName('PenID').AsInteger; // New Pen
                           GroupLinks.FieldByName('DateJoined').AsDateTime := Date;
                           GroupLinks.Post;
                        except
                           GroupLinks.Cancel;
                        end;
                  end
               else if (CrushTable.FieldByName('PenID').AsInteger > 0) and (CrushTable.FieldByName('AnimalID').AsInteger > 0) then
                  try
                     { Add new grplink record}
                     GroupLinks.Append;
                     GroupLinks.FieldByName('AnimalID').AsInteger := CrushTable.FieldByName('AnimalID').AsInteger;
                     GroupLinks.FieldByName('GroupID').AsInteger := CrushTable.FieldByName('PenID').AsInteger;
                     GroupLinks.FieldByName('DateJoined').AsDateTime := Date;
                     GroupLinks.Post;
                  except
                     on E : EDatabaseError do
                        begin
                           GroupLinks.Cancel;
                           ShowMessage(E.Message);
                        end;
                  end;

               WeighingEvent.Append;
               try
                  WeighingEvent.EventType := TWeight;
                  WeighingEvent.AnimalID     := CrushTable.FieldByName('AnimalID').AsInteger;
                  WeighingEvent.AnimalLactNo := CrushTable.FieldByName('LactNo').AsInteger;
                  WeighingEvent.AnimalHerdID := CrushTable.FieldByName('HerdID').AsInteger;
                  WeighingEvent.EventDate    := CrushTable.FieldByName('cfWeighDate').AsDateTime;
                  WeighingEvent.Weight       := CrushTable.FieldByName('cfWeight').AsFloat;
                  WeighingEvent.EventComment := 'Crush Weighing';
                  WeighingEvent.EventSource := sEXTERNAL;
                  WeighingEvent.Post;

                  CrushTable.Edit;
                  CrushTable.FieldByName('Recorded').AsBoolean := True;
                  CrushTable.Post;

                  Inc(NoRecorded);
                  Edit2.Text := IntToStr(NoRecorded);
               except
                  CrushTable.Cancel;
                  WeighingEvent.Cancel;
               end;
               Application.ProcessMessages;
               Next;
            end;
         if NoRecorded > 0 then
            begin
               MessageDlg('Crush weighing events successfully completed!',mtInformation,[mbOk],0);
               sbRecord.Enabled := False;
            end
         else
            MessageDlg('No animals on crush file could not be located in database',mtWarning,[mbOk],0);
      finally
         First;
         GroupLinks.Close;
         WeighingEvent.Free;
      end;
end;

procedure TfmCrushDiskWeigh.CrushGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if not ( CrushTable.FieldByName('AnimalID').AsInteger > 0 ) then
      AFont.Color := clRed
   else if CrushTable.FieldByName('Recorded').AsBoolean then
      AFont.Color := clGreen;

end;

procedure TfmCrushDiskWeigh.CrushGridDblClick(Sender: TObject);
var
   iFieldArray : Array [0..5] of String;
   FRecModified : Boolean;
begin
   if CrushTable.RecordCount <= 0 then Exit;

   iFieldArray[0] := CrushGrid.Columns[0].FieldName; // natid
   iFieldArray[1] := CrushGrid.Columns[1].FieldName;
   iFieldArray[2] := CrushGrid.Columns[2].FieldName;
   iFieldArray[3] := CrushGrid.Columns[3].FieldName;
   iFieldArray[4] := CrushGrid.Columns[4].FieldName;
   TfmCrushDiskEdit.Create(self).ShowTheForm(cftweighing, CrushGrid.DataSource, iFieldArray,FRecModified);
end;

procedure TfmCrushDiskWeigh.PenCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
   if Pen.KeyValue = 0 then
      begin
         if MessageDlg('Do you want to add a new Pen in Group Set-up?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               uGroupSetUp.ShowTheFormID(2, GroupID);   // Ind = 2 displays shortened version for Pens
               if GroupID > 0 then
                  begin
                     Pen.KeyValue := GroupID;
                     PenCloseUp(Pen)
                  end;
            end;
      end
   else if Pen.KeyValue > 0 then
      if MessageDlg(Format('Do you want to add all animals '+#13#10+'to Pen "%s"',[Pen.Text]),mtConfirmation,[mbYes,mbNo],0) = idYes then
         AssignPenToAnimals(Pen.KeyValue);
end;

procedure TfmCrushDiskWeigh.AssignPenToAnimals(PenID: Integer);
begin

   with CrushTable do
      begin
         Screen.Cursor := crHourGlass;
         DisableControls;
         try
            First;

            while not ( eof ) do
               begin
                  try
                     Edit;
                     FieldByName('PenID').AsInteger := PenID;
                     Post;
                  except
                     Cancel;
                  end;

                  Next;
               end;
         finally
            First;
            EnableControls;
            Screen.Cursor := crDefault;
         end;

      end;
end;


procedure TfmCrushDiskWeigh.GetExistingGrpID(const AID: Integer;
  const GroupType: String; var GrpID: Integer);
begin
   GrpID := 0;

   with TQuery.Create(nil) do
      try
         DatabaseName := WinData.KingData.DatabaseName;
         SQL.Add('SELECT GroupID, AnimalID, GroupType FROM grps, grplinks');
         SQL.Add('WHERE (AnimalID=' + IntToStr(AID) + ')');
         SQL.Add('AND   (GroupType="' + GroupType + '")');
         SQL.Add('AND   (ID=GroupID)');
         Open;
         if RecordCount > 0 then
            begin
               if FieldByName('GroupID').AsInteger > 0 then
                  GrpID := FieldByName('GroupID').AsInteger;
            end;
      finally
         Free;
      end;
end;

procedure TfmCrushDiskWeigh.GroupLinksBeforePost(DataSet: TDataSet);
begin
   DBISaveChanges(GroupLinks.Handle);
end;

procedure TfmCrushDiskWeigh.cbEditDataClick(Sender: TObject);
begin
   if cbEditData.Checked then
      begin
         CrushGrid.ReadOnly := False;
         CrushGrid.Options := [dgEditing,dgAlwaysShowEditor,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
         StatusBar1.Panels[1].Text := 'Edit';
         cbEditData.Font.Color := ClRed;
      end
   else
      begin
         CrushGrid.ReadOnly := True;
         CrushGrid.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
         StatusBar1.Panels[1].Text := 'Read Only';
         cbEditData.Font.Color := clBlack;
      end;
end;

end.
