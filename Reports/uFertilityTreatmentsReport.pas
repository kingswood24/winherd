{
   08/12/11 [V5.0 R2.6] /MK Bug Fix - Unable To Run Report By Treatment Due - Params Was Set Wrong In SQL.

   17/09/12 [V5.0 R9.9] /MK Change - Added check for ReportType.

   20/09/12 [V5.0 R9.9] /MK Change - If EventType is HerdVaccinaton then To Date should be 6 months from today.
}

unit uFertilityTreatmentsReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, QRCtrls, Db, DBTables, QRExport, QuickRpt, StdCtrls,
  ComCtrls, ExtCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ToolWin,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DateUtil, dxmdaset,
  cxCheckBox;

type
  TReportEventType = ( retHealth, retVaccination );
  TfmFertilityTreatmentsReport = class(TReportsBaseForm)
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    lDueType: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    LookupReminders: TcxLookupComboBox;
    Label1: TLabel;
    QRDBText1: TQRDBText;
    mdFertilityData: TdxMemData;
    mdFertilityDatasd: TBooleanField;
    cbFavourite: TcxCheckBox;
    lVaccine: TQRLabel;
    qrdbVaccine: TQRDBText;
    procedure sbViewClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure SubDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FReportEventType : TReportEventType;
    procedure OutputReport(APreview : Boolean = True);
  public
    { Public declarations }
    class procedure ShowReportScreen(AReportEventType : TReportEventType);
  end;

var
  fmFertilityTreatmentsReport: TfmFertilityTreatmentsReport;

implementation

uses uHerdLookup, GenTypesConst, DairyData;

{$R *.DFM}

{ TfmFertilityTreatmentsReport }

procedure TfmFertilityTreatmentsReport.OutputReport(APreview: Boolean);
var
   sField, sOrder : String;
   fd : TFieldDef;
   MaxReportDays : Integer;
   EventMinDate, EventMaxDate : TDateTime;
begin
   with GenQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT Max(ReportInDays) MaxReportDays From Health ');
         Open;
         try
            First;
            MaxReportDays := FieldByName('MaxReportDays').asInteger;
         finally
            Close;
            if MaxReportDays > 0 then
               begin
                  EventMinDate := FromDate.Date - MaxReportDays+1;
                  EventMaxDate := ToDate.Date + MaxReportDays+1;
               end;
         end;

         SQL.Clear;
         SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, E.EventDate,');
         SQL.Add('       E.EventDesc, G2.Description HealthDesc, G.Description ReminderDesc, H.ReportInDays, MA.Name AdminBy,');
         SQL.Add('       M.Name Vaccine');
         SQL.Add('FROM Animals A                          ');
         SQL.Add('LEFT JOIN Events E ON (E.AnimalID=A.ID) ');
         SQL.Add('LEFT JOIN Health H ON (H.EventID=E.ID)  ');
         SQL.Add('LEFT JOIN GenLook G ON (G.ID=H.ReportID)');
         SQL.Add('LEFT JOIN Medicine M ON (M.ID=H.DrugUsed)');
         if ( FReportEventType = retHealth ) then
            SQL.Add('LEFT JOIN GenLook G2 ON (G2.ID=H.FarmCode)')
         else
            SQL.Add('LEFT JOIN GenLook G2 ON (G2.ID=H.HealthCode)');
         SQL.Add('LEFT JOIN MedAdmin MA ON (MA.ID=H.AdminBy)');
         SQL.Add('WHERE (E.EventType = :EventType)');
         SQL.Add('AND   (E.EventDate Between :AFromDate and :AToDate)');
         SQL.Add('AND   (A.InHerd=True)');
         SQL.Add('AND   (A.AnimalDeleted=False)');
         SQL.Add('AND   (A.HerdID=:HerdID)');
         if not VarIsNull(LookupReminders.Editvalue) then
            SQL.Add('AND (H.ReportID=:ReportID)');
         if cbUseFilter.Checked then
            SQL.Add('AND (A.ID IN (SELECT DISTINCT(AID) From AFilters))');

         if ( FReportEventType = retHealth ) then
            Params[0].AsInteger := CHealthEvent
         else
            Params[0].AsInteger := CHerdVaccination;

         Params[1].AsDateTime := EventMinDate;
         Params[2].AsDateTime := EventMaxDate;
         Params[3].AsInteger := HerdID;
         if not VarIsNull(LookupReminders.EditValue) then
            //   08/12/11 [V5.0 R2.6] /MK Bug Fix - Params For LookupReminder.EditValue Was Set To 2.
            Params[4].AsInteger := LookupReminders.EditValue;
         Open;

         mdFertilityData.FieldDefs.Clear;
         mdFertilityData.CreateFieldsFromDataSet(GenQuery);
         with mdFertilityData.FieldDefs.AddFieldDef do
         begin
           Name := 'DueToDate';
           DataType := ftDateTime;
           CreateField(mdFertilityData);
         end;
         mdFertilityData.LoadFromDataSet(GenQuery);

         mdFertilityData.DisableControls;
         mdFertilityData.First;
         try
            while not mdFertilityData.eof do
               begin
                  mdFertilityData.Edit;
                  mdFertilityData.FieldByName('DueToDate').AsDateTime := IncDay(mdFertilityData.FieldByName('EventDate').AsDateTime, mdFertilityData.FieldByName('ReportInDays').AsInteger);
                  mdFertilityData.Post;
                  mdFertilityData.Next;
               end;
         finally
            mdFertilityData.First;
            mdFertilityData.EnableControls;
         end;

         Close;
         case rgSortBy.ItemIndex of
            0 : mdFertilityData.SortedField := 'SortAnimalNo';
            1 : mdFertilityData.SortedField := 'SortNatID';
            2 : mdFertilityData.SortedField := 'EventDate';
            3 : mdFertilityData.SortedField := 'ReminderDesc';
            4 : mdFertilityData.SortedField := 'DueToDate';
         end;

         if rgSortOrder.ItemIndex = 0 then
            mdFertilityData.SortOptions := [soDesc,soCaseInsensitive]
         else
            mdFertilityData.SortOptions := [soCaseInsensitive];

         if APreview then
            BaseReport.Preview
         else
            BaseReport.Print;
         mdFertilityData.Close;
      finally
         EnableViewPrintButtons(True);
      end;
end;

class procedure TfmFertilityTreatmentsReport.ShowReportScreen(AReportEventType : TReportEventType);
begin
   with TfmFertilityTreatmentsReport.Create(nil) do
      try
         FReportEventType := AReportEventType;
         ShowAllHerds := False;
         if ( FReportEventType = retHealth ) then
            begin
               Caption := 'Veterinary Due To List';
               ReportTitle.Caption := 'Veterinary Due To List';
            end
         else
            begin
               Caption := 'Vaccination Due To List';
               ReportTitle.Caption := 'Vaccination Due To List';
            end;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmFertilityTreatmentsReport.sbViewClick(Sender: TObject);
begin
  inherited;
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   if ( FReportEventType = retHealth ) then
      begin
         lDueType.Caption := 'Treatment Due';
         QRLabel12.Caption := 'Program';
         QRLabel17.Enabled := True;
         QRDBText9.Enabled := True;
         QRLabel22.Left := 841;
         QRDBText1.Left := 841;
         lDueType.Left := 609;
         QRDBText13.Left := 609;
         QRLabel20.Left := 377;
         QRDBText12.Left := 377;
         lVaccine.Enabled := False;
         qrdbVaccine.Enabled := False;
      end
   else
      begin
         lDueType.Caption := 'To Do Next';
         QRLabel12.Caption := 'Disease';
         QRLabel17.Enabled := False;
         QRDBText9.Enabled := False;
         QRLabel22.Left := 960;
         QRDBText1.Left := 960;
         lDueType.Left := 709;
         QRDBText13.Left := 709;
         QRLabel20.Left := 477;
         QRDBText12.Left := 477;
         lVaccine.Enabled := True;
         qrdbVaccine.Enabled := True;
         lVaccine.Left := 300;
         qrdbVaccine.Left := 300;
      end;
   OutputReport;
end;

procedure TfmFertilityTreatmentsReport.sbPrintClick(Sender: TObject);
begin
  inherited;
  OutputReport(False);
end;

procedure TfmFertilityTreatmentsReport.SubDetailBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := ((mdFertilityData.FieldByName('DueToDate').AsDateTime>0) and (mdFertilityData.FieldByName('DueToDate').AsDateTime>=FromDate.Date) and (mdFertilityData.FieldByName('DueToDate').AsDateTime<=ToDate.Date));
end;

procedure TfmFertilityTreatmentsReport.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FormatDateTime(cIrishDateStyle, mdFertilityData.FieldByName('DueToDate').AsDateTime);
end;

procedure TfmFertilityTreatmentsReport.FormCreate(Sender: TObject);
begin
   inherited;
   WinData.CanShowStandardReportHint := True;
   cbUseFilter.Visible := True;
   HerdLookup.LookupHealthReportDesc.Active := True;
   FromDate.Date := Date; // default to todays date
   ToDate.Date := Date+14 // default to todays date + 14
end;

procedure TfmFertilityTreatmentsReport.FormDestroy(Sender: TObject);
begin
  inherited;
  WinData.cxHint.HideHint;

  HerdLookup.LookupHealthReportDesc.Active := False;
end;

procedure TfmFertilityTreatmentsReport.cbUseFilterClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmFertilityTreatmentsReport.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Trim(Value);
end;

procedure TfmFertilityTreatmentsReport.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Trim(Value);

end;

procedure TfmFertilityTreatmentsReport.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Trim(Value);

end;

procedure TfmFertilityTreatmentsReport.FormActivate(Sender: TObject);
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

procedure TfmFertilityTreatmentsReport.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfmFertilityTreatmentsReport.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cVetDueToListRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cVetDueToListRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfmFertilityTreatmentsReport.FormShow(Sender: TObject);
begin
   inherited;
   if FReportEventType = retVaccination then
      begin
         Label1.Caption := 'To Do Next';
         ToDate.Date := IncMonth(ToDate.Date,6);
      end
   else
      Label1.Caption := 'Treatment Due';
   cbFavourite.Checked := WinData.IsReportFavourite(cVetDueToListRep);
   WinData.UpdateRecentReportUsage(cVetDueToListRep);
end;

end.
