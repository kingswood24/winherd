{ Unit Created : 16/12/2008 V3.8 R 5.5 /SP

  05/01/09 [V3.8 R5.6] /SP Additional Feature - Include Weaning Docility / Quality status in Grid View.

  13/12/16 [V5.6 R3.8] /MK Additional Feature - Added changes to include the ICBF Calf Survey Events.
}

unit uAWReviewCalves;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Db, dxmdaset,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxEdit, cxGroupBox, dbtables, ExtCtrls, StdCtrls, cxButtons,
  dxPSCore, dxPScxCommon, dxPScxGridLnk;

type
  TfmAWReviewCalves = class(TForm)
    dsAWCalves: TDataSource;
    mdAWCalves: TdxMemData;
    mdAWCalvesNatIdNum: TStringField;
    mdAWCalvesSortNatID: TStringField;
    mdAWCalvesAnimalNo: TStringField;
    mdAWCalvesSortAnimalNo: TStringField;
    mdAWCalvesPrimaryBreed: TIntegerField;
    mdAWCalvesSex: TStringField;
    mdAWCalvesDisbuddingDate: TDateTimeField;
    mdAWCalvesCastrationDate: TDateTimeField;
    mdAWCalvesWeaningDate: TDateTimeField;
    mdAWCalvesMealFeedingDate: TDateTimeField;
    mdAWCalvesDateOfBirth: TDateField;
    Bevel1: TBevel;
    mdAWCalvesID: TIntegerField;
    Panel1: TPanel;
    btnClose: TcxButton;
    mdAWCalvesDocility: TStringField;
    mdAWCalvesQuality: TStringField;
    btnPrint: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    cplGridEventData: TdxGridReportLink;
    GridEventData: TcxGrid;
    GridEventDataDBTableView: TcxGridDBTableView;
    GridEventDataDBTableViewRecId: TcxGridDBColumn;
    GridEventDataDBTableViewID: TcxGridDBColumn;
    GridEventDataDBTableViewNatIdNum: TcxGridDBColumn;
    GridEventDataDBTableViewSortNatID: TcxGridDBColumn;
    GridEventDataDBTableViewAnimalNo: TcxGridDBColumn;
    GridEventDataDBTableViewSortAnimalNo: TcxGridDBColumn;
    GridEventDataDBTableViewDateOfBirth: TcxGridDBColumn;
    GridEventDataDBTableViewSex: TcxGridDBColumn;
    GridEventDataDBTableViewPrimaryBreed: TcxGridDBColumn;
    GridEventDataDBTableViewDisbuddingDate: TcxGridDBColumn;
    GridEventDataDBTableViewCastrationDate: TcxGridDBColumn;
    GridEventDataDBTableViewMealFeedingDate: TcxGridDBColumn;
    GridEventDataDBTableViewWeaningDate: TcxGridDBColumn;
    GridEventDataDBTableViewCalfDocility: TcxGridDBColumn;
    GridEventDataDBTableViewCalfQuality: TcxGridDBColumn;
    GridEventDataLevel: TcxGridLevel;
    GridEventDataDBTableViewCalfVitality: TcxGridDBColumn;
    mdAWCalvesVitality: TStringField;
    mdAWCalvesCalfSize: TStringField;
    mdAWCalvesCalfScour: TStringField;
    mdAWCalvesCalfPneumonia: TStringField;
    GridEventDataDBTableViewCalfSize: TcxGridDBColumn;
    GridEventDataDBTableViewCalfScour: TcxGridDBColumn;
    GridEventDataDBTableViewCalfPneumonia: TcxGridDBColumn;
    mdAWCalvesCalfSurveyDate: TDateField;
    GridEventDataDBTableViewCalfSurveyDate: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridEventDataDBTableViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FHerdID : Integer;
    procedure LoadCalves;
  public
    { Public declarations }
    class procedure Execute(AHerdID : Integer);
  end;

var
  fmAWReviewCalves: TfmAWReviewCalves;

implementation
uses
   GenTypesConst, uHerdLookup, kDBRoutines, DairyData;

{$R *.DFM}

class procedure TfmAWReviewCalves.Execute(AHerdID: Integer);
var
   ListFieldIndex : Integer;
begin

   with TfmAWReviewCalves.Create(nil) do
      try
         FHerdID := AHerdID;
         GridEventDataDBTableViewPrimaryBreed.RepositoryItem := HerdLookup.erBreedLookup;
         LoadCalves;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAWReviewCalves.LoadCalves;
var
   CalveQuery : TQuery;
   EventDate : TDateTime;
   EventDetailsArray : TEventDetailsArray;
   FieldValue : Variant;
begin
   mdAWCalves.Active := False;
   Screen.Cursor := crHourGlass;
   try
      CalveQuery := TQuery.Create(nil);
      with CalveQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('Select ID, NatIDNum, SortNatID, AnimalNo, SortAnimalNo, DateOfBirth, PrimaryBreed, Sex From Animals');
            SQL.Add('Where HerdID=:HerdID');
            SQL.Add('And Inherd=True');
            SQL.Add('And AnimalDeleted=False');
            SQL.Add('And LactNo=0');
            SQL.Add('And DateOfBirth>=:DOB');

            Params[0].AsInteger := FHerdID;
            Params[1].AsDateTime := EncodeDate(2008,01,01);
            Open;

            with mdAWCalves do
               begin
                  LoadFromDataSet(CalveQuery);
                  First;
                  while not eof do
                     begin
                        mdAWCalves.Edit;

                        EventDate := WinData.EventDataHelper.GetLastEventDate(mdAWCalvesID.AsInteger, 0, CDisbuddingEvent);
                        if (EventDate > 0) then
                           mdAWCalvesDisbuddingDate.AsDateTime := EventDate;

                        EventDate := WinData.EventDataHelper.GetLastEventDate(mdAWCalvesID.AsInteger, 0, CCastrateEvent);
                        if (EventDate > 0) then
                           mdAWCalvesCastrationDate.AsDateTime := EventDate;

                        EventDate := WinData.EventDataHelper.GetLastEventDate(mdAWCalvesID.AsInteger, 0, CMealFeedingEvent);
                        if (EventDate > 0) then
                           mdAWCalvesMealFeedingDate.AsDateTime := EventDate;

                        // Get weaning details...

                        with TQuery.Create(nil) do
                           try
                              DatabaseName := AliasName;
                              SQL.Clear;
                              SQL.Add('SELECT E.EventDate, W.Docility, W.Quality');
                              SQL.Add('FROM Events E');
                              SQL.Add('INNER JOIN Weaning W ON (E.ID=W.EventID)');
                              SQL.Add('WHERE (E.AnimalID=:AID)');
                              SQL.Add('AND   (E.EventType=:ET)');
                              SQL.Add('AND   (E.AnimalLactNo=0)');
                              SQL.Add('ORDER BY E.EventDate DESC');
                              Params[0].AsInteger := mdAWCalvesID.AsInteger;
                              Params[1].AsInteger := CWeaningEvent;
                              Open;
                              try
                                 First;
                                 if ( Fields[0].AsDateTime > 0 ) then
                                    begin
                                       mdAWCalvesWeaningDate.AsDateTime := Fields[0].AsDateTime;
                                       if ( Fields[1].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID',Fields[1].AsInteger,[]) ) then
                                             mdAWCalvesDocility.AsString := WinData.WeaningScoresDescription.AsString;
                                       if ( Fields[2].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID', Fields[2].AsInteger,[]) ) then
                                             mdAWCalvesQuality.AsString := WinData.WeaningScoresDescription.AsString;
                                    end;
                              finally
                                 Close;
                              end;

                              SQL.Clear;
                              SQL.Add('SELECT E.EventDate, C.Docility, C.Quality, C.CalfVitality, C.CalfSize, C.CalfScour, C.CalfPneumonia');
                              SQL.Add('FROM Events E');
                              SQL.Add('INNER JOIN ICBFCalfSurveyEvent C ON (E.ID=C.EventID)');
                              SQL.Add('WHERE (E.AnimalID=:AID)');
                              SQL.Add('AND   (E.EventType=:ET)');
                              SQL.Add('AND   (E.AnimalLactNo=0)');
                              SQL.Add('ORDER BY E.EventDate DESC');
                              Params[0].AsInteger := mdAWCalvesID.AsInteger;
                              Params[1].AsInteger := CICBFCalfSurveyEvent;
                              Open;
                              try
                                 First;
                                 if ( Fields[0].AsDateTime > 0 ) then
                                    begin
                                       mdAWCalvesCalfSurveyDate.AsDateTime := Fields[0].AsDateTime;
                                       if ( Fields[1].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID',Fields[1].AsInteger,[]) ) then
                                             mdAWCalvesDocility.AsString := WinData.WeaningScoresDescription.AsString;
                                       if ( Fields[2].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID', Fields[2].AsInteger,[]) ) then
                                             mdAWCalvesQuality.AsString := WinData.WeaningScoresDescription.AsString;
                                       if ( Fields[3].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID', Fields[3].AsInteger,[]) ) then
                                             mdAWCalvesVitality.AsString := WinData.WeaningScoresDescription.AsString;
                                       if ( Fields[4].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID', Fields[4].AsInteger,[]) ) then
                                             mdAWCalvesCalfSize.AsString := WinData.WeaningScoresDescription.AsString;
                                       if ( Fields[5].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID', Fields[5].AsInteger,[]) ) then
                                             mdAWCalvesCalfScour.AsString := WinData.WeaningScoresDescription.AsString;
                                       if ( Fields[6].AsInteger > 0 ) then
                                          if ( WinData.WeaningScores.Locate('ID', Fields[6].AsInteger,[]) ) then
                                             mdAWCalvesCalfPneumonia.AsString := WinData.WeaningScoresDescription.AsString;
                                    end;
                              finally
                                 Close;
                              end;
                           finally
                              Free
                           end;

                        mdAWCalves.Post;
                        Next;
                     end;
               end;
         finally
            mdAWCalves.First;
            GridEventDataDBTableView.Controller.FocusedRowIndex := 0;
            Free;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmAWReviewCalves.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   mdAWCalves.Close;
end;

procedure TfmAWReviewCalves.GridEventDataDBTableViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   AText := VarToStr(ARecord.Values[GridEventDataDBTableViewNatIdNum.Index]);
end;

procedure TfmAWReviewCalves.FormCreate(Sender: TObject);
begin
   cplGridEventData.Component := GridEventData;
   cplGridEventData.ReportTitle.Text := Caption + ' - ' + FormatDateTime(cIrishDateStyle, Date);
   WinData.WeaningScores.Active := True;
end;

procedure TfmAWReviewCalves.FormDestroy(Sender: TObject);
begin
   WinData.WeaningScores.Active := False;
end;

procedure TfmAWReviewCalves.btnPrintClick(Sender: TObject);
begin
   if ( mdAWCalves.RecordCount > 0 ) then
      begin
         if Length(dxComponentPrinter1.PrintTitle) = 0 then
            dxComponentPrinter1.PrintTitle := 'Kingswood Grid Print';
         if not cplGridEventData.PreviewExists then
            cplGridEventData.Preview;
      end;
end;

end.
