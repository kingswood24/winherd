{
   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Option Added.
}

unit SCCAnalysis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, QRCtrls, Db, DBTables, QRExport, QuickRpt, ComCtrls,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ToolWin, ReportDefaults,
  cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TSCCAnalysisForm = class(TReportsBaseForm)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
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
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    GroupBox2: TGroupBox;
    CalveMonthFrom: TComboBox;
    Label1: TLabel;
    CalveMonthTo: TComboBox;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    LactNoFrom: TComboBox;
    LactNoTo: TComboBox;
    cbUseLactNoFlt: TCheckBox;
    cbCalveMthFlt: TCheckBox;
    QRLabel20: TQRLabel;
    QRDBText10: TQRDBText;
    eMastitusCode: TEdit;
    Label5: TLabel;
    cbFavourite: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure cbUseLactNoFltClick(Sender: TObject);
    procedure LactNoFromChange(Sender: TObject);
    procedure LactNoToChange(Sender: TObject);
    procedure eMastitusCodeChange(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MastitisID : Integer;
    LookupMDT : TTable;
    SCCAnalysisDefaults : TSCCAnalysisDefaults;
    procedure LoadSCCData;
    procedure SaveScreenDefaults;override;
    procedure LoadScreenDefaults;override;
  public
    { Public declarations }
  end;

  procedure ShowForm;

var
  SCCAnalysisForm: TSCCAnalysisForm;

const
  cMaxLactNo = 30;
  cMaxMonth = 12;
  cMonthFieldStartIndex = 6; //

implementation
uses
   DairyData, GenTypesConst, kDbRoutines;

{$R *.DFM}

  procedure ShowForm;
  begin
     Application.CreateForm(TSCCAnalysisForm, SCCAnalysisForm);
     try
        if not SCCAnalysisForm.PDAExport then
           SCCAnalysisForm.ShowModal
        else
           SCCAnalysisForm.sbView.Click;
     finally
        FreeAndNil(SCCAnalysisForm);
     end;
  end;

procedure TSCCAnalysisForm.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;

  WinData.CanShowStandardReportHint := True;

  cbUseFilter.Checked  := WinData.ActiveFilter;
//  if ShowFilter then
 //    cbUseFilter.Checked := TRUE;
  ShowDichromatic := True;
  for i := 1 to cMaxLactNo do LactNoFrom.Items.Add(IntToStr(i));
  LactNoTo.Items.Assign(LactNoFrom.Items);

  LactNoFrom.ItemIndex := 0;
  LactNoTo.ItemIndex := cMaxLactNo-1;

  for i := 1 to cMaxMonth do CalveMonthFrom.Items.Add(IntToStr(i));
  CalveMonthTo.Items.Assign(CalveMonthFrom.Items);

  CalveMonthFrom.ItemIndex := 0;
  CalveMonthTo.ItemIndex := cMaxMonth-1;

  with TempTable do
     begin
        TableName := 'SCCAnalysis';
        with FieldDefs do
           begin
              Clear;
              // NOTE : Only add fields from end of table fielddefs!!!   cMonthFieldStartIndex is set at 6
              Add('ID', ftAutoInc);
              Add('AnimalID', ftInteger);
              Add('AnimalNo', ftString,10);
              Add('SortAnimalNo', ftString,10);
              Add('LactNo', ftInteger);
              Add('CalvingDate', ftDate);
              Add('CMonthIndex',ftInteger);
              Add('SCCJAN',ftInteger);
              Add('SCCFEB',ftInteger);
              Add('SCCMAR',ftInteger);
              Add('SCCAPR',ftInteger);
              Add('SCCMAY',ftInteger);
              Add('SCCJUNE',ftInteger);
              Add('SCCJULY',ftInteger);
              Add('SCCAUG',ftInteger);
              Add('SCCSEPT',ftInteger);
              Add('SCCOCT',ftInteger);
              Add('SCCNOV',ftInteger);
              Add('SCCDEC',ftInteger);
              Add('MRCount',ftInteger);
              Add('NoOfIncidents',ftInteger);
           end;

        with IndexDefs do
           begin
              Clear;
              Add('iID', 'ID', [ixPrimary]);
              Add('iAnimalID', 'AnimalID', [ixUnique]);
           end;

        CreateTable;
        IndexName := 'iAnimalID';
        Active := True;
     end;
end;

procedure TSCCAnalysisForm.LoadSCCData;
var
   d,m,y : word;
   mrDate : TDateTime;
   MRCount : Integer;
   MAQuery : TQuery;
begin

   SQLEmptyTable( TempTable.TableName );
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Insert into SCCAnalysis (AnimalID, AnimalNo, SortAnimalNo, LactNo) ');
         SQL.Add('Select Distinct(A.ID), A.AnimalNo, A.SortAnimalNo, A.LactNo ');
         SQL.Add('From Animals A ');
         if ( cbUseFilter.Checked ) then
            SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
         SQL.Add('Where (A.Sex ="Female")');
         SQL.Add('And (A.Inherd = True )');
         SQL.Add('And ( A.LactNo > 0 )');
         SQL.Add('And ( A.AnimalDeleted = False )');
         if ( HerdID > 0 ) then
            SQL.Add('And ( A.HerdID = :AHerdID )')
         else
            SQL.Add('And ( A.HerdID > 0 )');
         if cbUseLactNoFlt.Checked then
            begin
               SQL.Add('And LactNo Between :LactFrom and :LactTo');
               Params[1].Value := LactNoFrom.ItemIndex+1;
               Params[2].Value := LactNoTo.ItemIndex+1;
            end;


         Params[0].Value := HerdID;
         ExecSQL;
      end;

   MAQuery := TQuery.Create(nil);
   MAQuery.DatabaseName := AliasName;

   LookupMDT := TTable.Create(nil);
   LookupMDT.DatabaseName := AliasName;
   LookupMDT.TableName := 'MilkDiskTrans';
   LookupMDT.Active := True;

   MAQuery.SQL.Clear;
   MAQuery.SQL.Add('Select Count(E.ID) CountOfId From Events E, Health H');
   MAQuery.SQL.Add('Where (E.AnimalID = :AAnimalID)');
   MAQuery.SQL.Add('AND (E.AnimalLactNo = :ALactNo)');
   MAQuery.SQL.Add('AND (E.ID=H.EventID)');
   MAQuery.SQL.Add('And (E.EventType IN (4,6)) ');
   MAQuery.SQL.Add('And (H.HealthCode = :AHealthCode) ');

   if WinData.GenLookUp.Locate('ListType;LookupCode', VarArrayOf([13, Trim(eMastitusCode.Text)]), []) then
      MastitisID := WinData.GenLookUp.FieldByName('ID').AsInteger
   else
      MessageDlg('Mastitis Code not found.'+cCRLF+cCRLF+
                 'Ensure the mastitus code is entered correctly',mtWarning,[mbOK],0);

   InitProgress(0,TempTable.RecordCount,1,'Please wait...');
   try

      with TempTable do
         begin
            First;
            while not eof do
               begin
                  Application.ProcessMessages;
                  TempTable.Edit;
                  try
                     TempTable.FieldByName('CalvingDate').AsDateTime :=
                       WinData.EventDataHelper.GetLastEventDate(TempTable.FieldByName('AnimalID').AsInteger,
                                                TempTable.FieldByName('LactNo').AsInteger,
                                                cCalvingEvent);

                     if ( MastitisID > 0 ) then
                        begin
                           MAQuery.ParamByName('AAnimalID').AsInteger := TempTable.FieldByName('AnimalID').AsInteger;
                           MAQuery.ParamByName('ALactNo').AsInteger := TempTable.FieldByName('LactNo').AsInteger;
                           MAQuery.ParamByName('AHealthCode').AsInteger := MastitisID;

                           MAQuery.Active := True;
                           try
                              if ( MAQuery.FieldByName('CountOfId').AsInteger > 0 ) then
                              TempTable.FieldByName('NoOfIncidents').AsInteger := MAQuery.FieldByName('CountOfId').AsInteger;
                           finally
                              MAQuery.Active := False;
                           end;
                        end;

                     TempTable.Post;
                  except
                     TempTable.Cancel;
                  end;

                  LookupMDT.Filter := Format('AnimalID = %d and LactNo = %d',
                                             [TempTable.FieldByName('AnimalID').AsInteger,
                                              TempTable.FieldByName('LactNo').AsInteger]);
                  LookupMDT.Filtered := True;
                  MRCount := 0;

                  try
                     if LookupMDT.FindFirst then
                        begin
                           repeat
                              mrDate := LookupMDT.FieldByName('DateOfRecording').AsDateTime;
                              if (mrDate > 0) then
                                 begin
                                    DecodeDate( mrDate, y, m, d );
                                    if LookupMDT.FieldByName('SCC').AsInteger > 0 then
                                       begin
                                          // SCC > 0 indicates a valid recording.
                                          Inc(MRCount); // Inc Rec Count
                                          TempTable.Edit;
                                          try
                                             TempTable.Fields[m+cMonthFieldStartIndex].Value := LookupMDT.FieldByName('SCC').AsInteger;
                                             TempTable.FieldByName('MRCount').Value := MRCount;
                                             TempTable.Post;
                                          except
                                             TempTable.Cancel;
                                          end;
                                       end;
                                 end;
                           until
                              not LookupMDT.FindNext;
                        end;
                  finally
                     LookupMDT.Filter := '';
                     LookupMDT.Filtered := False;
                  end;
                  Next;
                  ProgBar.StepIt;
               end;
         end;
      ChangeMade := False;
   finally
      ResetProgress;
      LookupMDT.Active := False;
      LookupMDT.Free;
      MAQuery.Free;
   end;

end;

procedure TSCCAnalysisForm.sbViewClick(Sender: TObject);
begin
  Inherited;
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   EnableViewPrintButtons(False);
   try
      if ChangeMade then
         LoadSCCData;

      with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('Select * from SCCAnalysis');
          SQL.Add('Where AnimalID > 0 ');
          if cbCalveMthFlt.Checked then
             SQL.Add('AND (EXTRACT(MONTH From CalvingDate) Between ' + CalveMonthFrom.Text + ' and ' + CalveMonthTo.Text + ')');
          case rgSortBy.ItemIndex of
             0 : SQL.Add('Order By SortAnimalNo ');
             1 : SQL.Add('Order By LactNo');
             2 : SQL.Add('Order By CalvingDate');
             3 : SQL.Add('Order By NoOfIncidents');
          end;
          if rgSortOrder.ItemIndex = 1 then
             SQL.Add('DESC');
          Open;
          try
             if ( RecordCount > 0 ) then
                begin
                   qrlSortBy.Caption := SortByField;
                   qrlSortOrder.Caption := SortByOrder;
                   qrlHerdIdentity.Caption := HerdIdentity;

                   if not PDAExport then
                      begin
                         if ((Sender as TRxSpeedButton).Tag = 0 ) then
                            BaseReport.Preview
                         else
                            BaseReport.Print;
                      end
                   else
                      ExportToPDA( BaseReport );
                end
             else
                MessageDlg('There are no records to view',mtInformation,[mbOK],0);
          finally
             Close;
          end;
       end;
   finally
      inherited;
      EnableViewPrintButtons(True);
   end;
end;

procedure TSCCAnalysisForm.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  try
     StrToFloat(Value);
  except
     Value := '';
  end;
end;

procedure TSCCAnalysisForm.cbUseLactNoFltClick(Sender: TObject);
begin
  inherited;
  ChangeMade := True;
end;

procedure TSCCAnalysisForm.LactNoFromChange(Sender: TObject);
begin
  inherited;
  ChangeMade := True;
end;

procedure TSCCAnalysisForm.LactNoToChange(Sender: TObject);
begin
  inherited;
  ChangeMade := True;
end;

procedure TSCCAnalysisForm.LoadScreenDefaults;
var
  IR : TIntRange;
begin
  inherited;
  SCCAnalysisDefaults := TSCCAnalysisDefaults.Create(cRD_SCCAnalysis);
  try
     cbUseLactNoFlt.Checked := SCCAnalysisDefaults.LactFlt;
     cbCalveMthFlt.Checked := SCCAnalysisDefaults.CalvingMonthFlt;
     IR := SCCAnalysisDefaults.MonthRange;
     try
        CalveMonthFrom.ItemIndex := CalveMonthFrom.Items.IndexOf(IntToStr( IR.IntFrom ));
     except
        CalveMonthTo.ItemIndex := 0;
     end;
     try
        CalveMonthTo.ItemIndex := CalveMonthTo.Items.IndexOf(IntToStr( IR.IntTo ));
     except
        CalveMonthTo.ItemIndex := CalveMonthTo.Items.Count-1;
     end;
     IR := SCCAnalysisDefaults.LactRange;
     try
        LactNoFrom.ItemIndex := LactNoFrom.Items.IndexOf(IntToStr( IR.IntFrom ));
     except
        LactNoFrom.ItemIndex := 0;
     end;
     try
        LactNoTo.ItemIndex := LactNoTo.Items.IndexOf(IntToStr( IR.IntTo ));
     except
        LactNoTo.ItemIndex := LactNoTo.Items.Count-1;
     end;

     rgSortBy.ItemIndex := SCCAnalysisDefaults.SortField;
     rgSortOrder.ItemIndex := SCCAnalysisDefaults.SortOrder;
     cbDichromatic.Checked := SCCAnalysisDefaults.Dichromatic;
  finally
     FreeAndNil(SCCAnalysisDefaults);
  end;

end;

procedure TSCCAnalysisForm.SaveScreenDefaults;
var
  IR : TIntRange;
begin
  inherited;
  SCCAnalysisDefaults := TSCCAnalysisDefaults.Create(cRD_SCCAnalysis);
  try
     SCCAnalysisDefaults.LactFlt := cbUseLactNoFlt.Checked;
     SCCAnalysisDefaults.CalvingMonthFlt := cbCalveMthFlt.Checked;
     try
        IR.IntFrom := StrToInt( CalveMonthFrom.Text );
     except
     end;
     try
        IR.IntTo := StrToInt( CalveMonthTo.Text );
     except
     end;
     SCCAnalysisDefaults.MonthRange := IR;
     try
        IR.IntFrom := StrToInt( LactNoFrom.Text );
     except
     end;
     try
        IR.IntTo := StrToInt( LactNoTo.Text );
     except
     end;
     SCCAnalysisDefaults.LactRange := IR;
     SCCAnalysisDefaults.SortField := rgSortBy.ItemIndex;
     SCCAnalysisDefaults.SortOrder := rgSortOrder.ItemIndex;
     SCCAnalysisDefaults.Dichromatic := cbDichromatic.Checked;
  finally
     FreeAndNil(SCCAnalysisDefaults);
  end;
end;

procedure TSCCAnalysisForm.eMastitusCodeChange(Sender: TObject);
begin
  inherited;
  ChangeMade := True;
end;

procedure TSCCAnalysisForm.cbUseFilterClick(Sender: TObject);
begin
  inherited;

    //
end;

procedure TSCCAnalysisForm.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
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

procedure TSCCAnalysisForm.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TSCCAnalysisForm.FormDestroy(Sender: TObject);
begin
  inherited;
  WinData.cxHint.HideHint;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Option Added.
procedure TSCCAnalysisForm.cbFavouritePropertiesChange(Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cSCCCurLactAnalysisRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cSCCCurLactAnalysisRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Option Added.
procedure TSCCAnalysisForm.FormShow(Sender: TObject);
begin
  inherited;
  cbFavourite.Checked := WinData.IsReportFavourite(cSCCCurLactAnalysisRep);
  WinData.UpdateRecentReportUsage(cSCCCurLactAnalysisRep);
end;

end.
