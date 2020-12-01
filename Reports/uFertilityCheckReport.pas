{
   29/04/11 [V4.0 R9.9] /MK Change - If FertCheckProgram Start Date Is Blank Then Use FertCheckEventDate.
                                   - Filter By EventDate From And To.

   30/04/11 [V4.0 R9.9] /MK Change - GL Wanted To Show All FertCheck Events Even If No Action Or Status.

   01/11/11 [V5.0 R1.7] /MK Additional Feature - Added PDStatus To The Report.

   02/11/11 [V5.0 R1.7] /MK Additional Feature - Added ShowRadioGroup For AnimalNo/NatIDNo.
                                               - Dependant On ShowRadioGroup Change qrlAnimalNoNatID & qrdbAnimalNoNatID Captions.
                                               - Added PDDate To Report.
                                               - Added Headings Above Fertility Check Data & PD Data.

   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   03/09/14 [V5.3 R5.7] /MK Bug Fix - On print if PregDiagDate is null date (30/12/1899) then value should be blank.   
}

unit uFertilityCheckReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, Db, DBTables, QRExport, QRCtrls, QuickRpt, StdCtrls,
  ComCtrls, ExtCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ToolWin,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckBox;

type
  TfmFertilityCheckReport = class(TReportsBaseForm)
    qrlAnimalNoNatID: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrdbAnimalNoNatID: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    Label1: TLabel;
    cmboFertilityStatus: TcxComboBox;
    cmboFertilityAction: TcxComboBox;
    Label2: TLabel;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    rgShow: TRadioGroup;
    cbFavourite: TcxCheckBox;
    procedure sbViewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    procedure LoadReportData;override;
    procedure SetupForm;override;
    procedure LoadFertiltiyCheckData;
  public
    { Public declarations }
    class procedure ShowReport;
  end;

var
  fmFertilityCheckReport: TfmFertilityCheckReport;

implementation

uses GenTypesConst, uHerdLookup, DairyData;

{$R *.DFM}

procedure TfmFertilityCheckReport.LoadFertiltiyCheckData;
begin
//
end;

//   01/11/11 [V5.0 R1.7] /MK Additional Feature - Added PDStatus To The Report.
procedure TfmFertilityCheckReport.LoadReportData;
var
   Status, Action : Integer;
   FCEventDate, FCStartDate, PDEventDate : TDateTime;
   AnimalId, AnimalLactNo : Integer;

   function GetPDStatus ( AAnimalId, ALactNo : Integer ) : String;
   begin
      Result := '';
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT E.EventDate, P.PregnancyStatus');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN PregnancyDiag P ON (P.EventID = E.ID)');
            SQL.Add('WHERE E.EventType = '+ IntToStr(CPregDiagEvent)+' ');
            SQL.Add('AND E.AnimalID = :AAnimalId');
            SQL.Add('AND E.AnimalLactNo = :ALactNo');
            Params[0].AsInteger := AAnimalId;
            Params[1].AsInteger := ALactNo;
            Open;
            try
               First;
               if ( VarIsNull(Fields[1].AsBoolean) ) then
                  begin
                     Result := '';
                     PDEventDate := 0;
                  end
               else if ( Fields[1].AsBoolean = False ) then
                  begin
                     Result := 'No';
                     PDEventDate := Fields[0].AsDateTime;
                  end
               else if ( Fields[1].AsBoolean = True ) then
                  begin
                     Result := 'Yes';
                     PDEventDate := Fields[0].AsDateTime;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
  inherited;

  with GenQuery do
     begin

        SQL.Clear;
        SQL.Add('DELETE FROM tmpFertilityCheck');
        ExecSQL;

        SQL.Clear;
        SQL.Add('INSERT INTO tmpFertilityCheck (AnimalID, AnimalNo, SortAnimalNo, NatIdNum, SortNatId,');
        SQL.Add('         DateOfBirth, LactNo )');
        SQL.Add('SELECT DISTINCT (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatId, ');
        SQL.Add('         A.DateOfBirth, A.LactNo');
        SQL.Add('FROM Animals A');
        SQL.Add('WHERE A.ID IN (');
        SQL.Add('   SELECT DISTINCT(E.AnimalID)');
        SQL.Add('   FROM Events E');
        SQL.Add('   WHERE (E.EventType = '+ IntToStr( CFertilityCheck ) +')');
        if (HerdId > 0) then
            SQL.Add('   AND (E.HerdId = '+ IntToStr( HerdId ) +')');
        SQL.Add(' ) ');
        SQL.Add('AND ( A.InHerd = True) ');
        SQL.Add('AND ( A.AnimalDeleted = False) ');
        if (HerdId > 0) then
           SQL.Add('AND ( A.HerdId = '+ IntToStr( HerdId ) +')');
        if cbUseFilter.Checked then
           begin

           end;
        ExecSQL;
     end;

     GenQuery.SQL.Clear;
     GenQuery.SQL.Add('SELECT E.EventDate From Events E');
     GenQuery.SQL.Add('WHERE (E.EventType = '+ IntToStr( CFertilityCheck ) +')');
     GenQuery.SQL.Add('AND E.AnimalID = :AAnimalID');
     GenQuery.SQL.Add('AND E.AnimalLactno = :ALactNo');
     TempTable.Open;
     GenQuery.Params[0].AsInteger := TempTable.FieldByName('AnimalID').AsInteger;
     GenQuery.Params[1].AsInteger := TempTable.FieldByName('LactNo').AsInteger;
     GenQuery.Open;
     FCEventDate := GenQuery.FieldByName('EventDate').AsDateTime;

  with GenQuery do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT E.EventDate, G1.Description Status, G2.Description Action, FP.Description FertProgram ');
        SQL.Add('FROM Events E');
        SQL.Add('INNER JOIN FertilityCheck F ON (F.EventID=E.ID)');
        SQL.Add('LEFT JOIN FertPrograms FP ON (FP.ID = F.FertProgram)');
        SQL.Add('LEFT JOIN GenLook G1 ON (G1.ID = F.Status)');
        SQL.Add('LEFT JOIN GenLook G2 ON (G2.ID = F.Action)');
        SQL.Add('WHERE (E.AnimalID=:AnimalID)');
        SQL.Add('AND (E.AnimalLactNo =:LactNo)');
        {
        //   30/04/11 [V4.0 R9.9] /MK Change - GL Wanted To Show All FertCheck Events Even If No Action Or Status.
        SQL.Add('AND (G1.ListType = '+ IntToStr(LFertilityCheck_Status) +')');
        SQL.Add('AND (G2.ListType = '+ IntToStr(LFertilityCheck_Action) +')');
        }
        SQL.Add('ORDER BY E.EventDate DESC');
     end;

  with TempTable do
     begin
        Close;
        Open;
        InitProgress(0, TempTable.RecordCount, 1, 'Please wait...');
        First;
        while not eof do
           begin
              AnimalId := FieldByName('AnimalId').AsInteger;
              AnimalLactNo := FieldByName('LactNo').AsInteger;

              GenQuery.Params[0].AsInteger := AnimalId;
              GenQuery.Params[1].AsInteger := AnimalLactNo;
              GenQuery.Open;
              try
                  GenQuery.First;
                  Edit;

                  if ( ( GenQuery.FieldByName('EventDate').AsDateTime ) > ( FCEventDate ) ) then
                     FieldByName('EventDate').AsDateTime := GenQuery.FieldByName('EventDate').AsDateTime
                  else
                     FieldByName('EventDate').AsDateTime := FCEventDate;

                  FieldByName('Status').AsString := GenQuery.FieldByName('Status').AsString;
                  FieldByName('Action').AsString := GenQuery.FieldByName('Action').AsString;
                  FieldByName('FertProgram').AsString := GenQuery.FieldByName('FertProgram').AsString;
                  FieldByName('PDStatus').AsString := GetPDStatus(AnimalId,AnimalLactNo);
                  FieldByName('PDEventDate').AsDateTime := PDEventDate;

                  Post;
                  StepProgress();
              finally
                 GenQuery.Close;
              end;
              Next;
           end;
     end;

     with GenQuery do
        try
           SQL.Clear;
           SQL.Add('SELECT * FROM tmpFertilityCheck');
           SQL.Add('WHERE (AnimalId > 0)');
           if ( FromDate.Date <> 0 ) And ( ToDate.Date <> 0 ) Then
              SQL.Add('AND (EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')')
           else if ( FromDate.Date <> 0 ) and ( ToDate.Date <= 0 ) Then
              SQL.Add('AND (EventDate > ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ') ')
           else if ( FromDate.Date <= 0 ) and ( ToDate.Date <> 0 ) Then
              SQL.Add('AND (EventDate < ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ') ');


        if ( cmboFertilityStatus.ItemIndex > 0 ) then
           begin

              if ( cmboFertilityStatus.Properties.Items.Objects[cmboFertilityStatus.ItemIndex] <> nil ) then
                 begin
                    Status := Integer(cmboFertilityStatus.Properties.Items.Objects[cmboFertilityStatus.ItemIndex]);
                    if ( Status > 0 ) then
                       begin
                          SQL.Add('AND (Status =:Status)');
                          ParamByName('Status').AsString := cmboFertilityStatus.Text;
                       end;

                 end;
           end;

        if ( cmboFertilityAction.ItemIndex > 0 ) then
           begin

              if ( cmboFertilityAction.Properties.Items.Objects[cmboFertilityAction.ItemIndex] <> nil ) then
                 begin
                    Action := Integer(cmboFertilityAction.Properties.Items.Objects[cmboFertilityAction.ItemIndex]);
                    if ( Action > 0 ) then
                       begin
                          SQL.Add('AND (Action =:Action)');
                          ParamByName('Action').AsString := cmboFertilityAction.Text;
                       end;
                 end;
           end;

           qrlAnimalNoNatID.Caption := '';
           qrdbAnimalNoNatID.DataField := '';
           case rgShow.ItemIndex of
              0 : begin
                     qrlAnimalNoNatID.Caption := 'Animal No';
                     qrdbAnimalNoNatID.DataField := 'AnimalNo';
                  end;
              1 : begin
                     qrlAnimalNoNatID.Caption := 'Nat. Id. No.';
                     qrdbAnimalNoNatID.DataField := 'NatIDNum';
                  end;
           end;

           case rgSortBy.ItemIndex of
              1 : SQL.Add('ORDER BY SortNatID');
              2 : SQL.Add('ORDER BY DateOfBirth, SortNatID');
              3 : SQL.Add('ORDER BY EventDate, SortNatID');
              4 : SQL.Add('ORDER BY Status, SortNatID');
              5 : SQL.Add('ORDER BY Action, SortNatID');
           end;

           if ( rgSortOrder.ItemIndex = 1 ) then
              SQL.Add(' DESC');

           Open;
           ResetProgress;
           if RecordCount > 0 then
              begin

                 BaseReport.Preview();

              end
           else
              MessageDlg('No records have been found.',mtInformation,[mbOK],0);
        finally
           Close;
        end;
   EnableViewPrintButtons(True);
end;

procedure TfmFertilityCheckReport.sbViewClick(Sender: TObject);
begin
  inherited;
  sbView.Hint := '';
  LoadReportData();
  sbView.Hint := 'Click Here To View This Report On Screen';
end;

procedure TfmFertilityCheckReport.SetupForm;
begin
  inherited;
  with TempTable do
     begin

        DatabaseName := AliasName;
        TableName := 'tmpFertilityCheck';
        FieldDefs.Clear;

        FieldDefs.Add('AnimalID', ftInteger);
        FieldDefs.Add('AnimalNo', ftString, 10);
        FieldDefs.Add('SortAnimalNo', ftString, 10);
        FieldDefs.Add('NatIDNum', ftString, 20);
        FieldDefs.Add('SortNatID', ftString, 20);
        FieldDefs.Add('DateOfBirth', ftDateTime);
        FieldDefs.Add('LactNo', ftInteger);

        FieldDefs.Add('EventDate', ftDateTime);
        FieldDefs.Add('Status', ftString, 60);
        FieldDefs.Add('Action', ftString, 60);
        FieldDefs.Add('FertProgram', ftString, 60);

        FieldDefs.Add('PDEventDate', ftDateTime, 0);
        FieldDefs.Add('PDStatus', ftString, 5);

        IndexDefs.Clear;
        IndexDefs.Add('iAnimalID', 'AnimalID', [ixPrimary, ixUnique]);
        IndexDefs.Add('iSortAnimalNo', 'SortAnimalNo', [ixCaseInsensitive]);
        IndexDefs.Add('iSortNatIdNum', 'NatIdNum', [ixCaseInsensitive]);
        IndexDefs.Add('iDateOfBirth', 'DateOfBirth', [ixCaseInsensitive]);
        IndexDefs.Add('iLactNo', 'LactNo', [ixCaseInsensitive]);
        IndexDefs.Add('iStatus', 'Status', [ixCaseInsensitive]);
        IndexDefs.Add('iAction', 'Action', [ixCaseInsensitive]);
        IndexDefs.Add('iFertProgram', 'FertProgram', [ixCaseInsensitive]);

        CreateTable;
     end;

  with HerdLookup do
     begin
        QueryFertilityCheckStatus.Active := True;
        try
            cmboFertilityStatus.Properties.Items.AddObject('No Filter', pointer(0));
            while not QueryFertilityCheckStatus.eof do
               begin
                  cmboFertilityStatus.Properties.Items.AddObject(QueryFertilityCheckStatus.FieldByName('Description').AsString, pointer(QueryFertilityCheckStatus.FieldByName('ID').AsInteger));
                  QueryFertilityCheckStatus.Next;
               end;
        finally
           cmboFertilityStatus.ItemIndex := 0;
           QueryFertilityCheckStatus.Active := False;
        end;

        QueryFertilityCheckAction.Active := True;
        try
            cmboFertilityAction.Properties.Items.AddObject('No Filter', pointer(0));
            while not QueryFertilityCheckAction.eof do
               begin
                  cmboFertilityAction.Properties.Items.AddObject(QueryFertilityCheckAction.FieldByName('Description').AsString, pointer(QueryFertilityCheckAction.FieldByName('ID').AsInteger));
                  QueryFertilityCheckAction.Next;
               end;
        finally
           cmboFertilityAction.ItemIndex := 0;
           QueryFertilityCheckAction.Active := False;
        end;
     end;

   cbUseFilter.Visible := WinData.ActiveFilter;
   if cbUseFilter.Visible then
      cbUseFilter.Checked := True;

   ReportTitle.Caption := 'Fertility Check Report';
end;

class procedure TfmFertilityCheckReport.ShowReport;
begin
   with TfmFertilityCheckReport.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmFertilityCheckReport.FormShow(Sender: TObject);
begin
   inherited;
   cbFavourite.Checked := WinData.IsReportFavourite(cFertCheckRep);
   WinData.UpdateRecentReportUsage(cFertCheckRep);
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmFertilityCheckReport.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cFertCheckRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cFertCheckRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfmFertilityCheckReport.QRDBText1Print(sender: TObject;
  var Value: String);
begin
   inherited;
   if ( Value = '30/12/1899' ) then
      Value := '';
end;

end.
