{
  Unit Created : 17/02/2009 V3.8 R 6.2 /SP
}
unit uEventForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,db,
  dbTables, cxLabel, cxTextEdit, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ExtCtrls, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TEventFormClass = class of TfmEventForm;
  TfmEventForm = class(TfmBaseForm)
    EditStyleControllerFlat: TcxEditStyleController;
    pEventControls: TPanel;
    deEventDate: TcxDateEdit;
    teEventComment: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    dxBarLargeButton1: TdxBarLargeButton;
    actSave: TAction;
    actCancel: TAction;
    actDelete: TAction;
    lIdType: TcxLabel;
    cmboAnimalID: TcxLookupComboBox;
    blbDelete: TdxBarLargeButton;
    teAnimalId: TcxTextEdit;
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    FSearchField : string;
    FFilterList : TStringList;
    function GetEventComment: string;
    function GetEventDate: TDateTime;
    procedure SetEventComment(const Value: string);
    procedure SetEventDate(const Value: TDateTime);
    { Private declarations }
  protected
    FAnimalListQuery : TQuery;
    FAnimalListDataSource : TDataSource;
    FAnimalQuery : TQuery;
    FEventQuery : TQuery;
    FDefaultEventDate : TDateTime;
    FEnableAnimalListing : Boolean;
    FAnimalID : Integer;
    FDateOfBirth : TDateTime;
    FLactNo : Integer;
    FEventDate : TDateTime;
    FEventType : Integer;
    FEventID : Integer;
    FHerdID : Integer;
    FAnimalNo : string;
    FNatIdNum : string;
    FOverrideLactNo : Integer;
    procedure LoadAnimal;
    procedure LoadEventFromDB;dynamic;
    procedure SaveEventToDB;dynamic;
    procedure ValidateInput;dynamic;
    procedure FinalizeForm;
    procedure ActivateSearchListing;
    procedure AddFilter(AFilter : string);
    procedure SetupForm();virtual;
    procedure SaveEvent();virtual;
    procedure UpdateEvent();virtual;
    procedure DeleteEvent();virtual;

    function ConfirmDelete : Boolean;

    property EventComment : string read GetEventComment write SetEventComment;
    property EventDate : TDateTime read GetEventDate write SetEventDate;

  public
    { Public declarations }
    class function LoadEvent(AAnimalID, AEventID, ALactNo : Integer; ADefaultEventDate : TDateTime;
        AEnableAnimalListing : Boolean; AEventFormClass : TEventFormClass) : boolean;
  end;

var
  fmEventForm: TfmEventForm;

const
   cCRLF = #13#10;

implementation
uses
   GenTypesConst, SQLHelper, kRoutines, DairyData;

{$R *.DFM}

{ TfmEventForm }

class function TfmEventForm.LoadEvent(AAnimalID, AEventID, ALactNo : Integer; ADefaultEventDate : TDateTime;
   AEnableAnimalListing : Boolean; AEventFormClass : TEventFormClass) : boolean;
begin
   with AEventFormClass.Create(nil) do
      try
         FDefaultEventDate := ADefaultEventDate;
         if (FDefaultEventDate<=0) then
            FDefaultEventDate := Date;
         EventDate := FDefaultEventDate;
         FEnableAnimalListing := AEnableAnimalListing;
         FEventID := AEventID;
         FAnimalID := AAnimalID;
         // Allow specification of lactno, might not want to record the event on animals current lactno
         FOverrideLactNo := ALactNo;
         SetupForm;

         ShowModal;
      finally
         FinalizeForm;
         Free;
      end;

end;

procedure TfmEventForm.LoadAnimal;
begin
   FAnimalQuery.Close;
   FAnimalQuery.Params[0].AsInteger := FAnimalID;
   FAnimalQuery.Open;


   FAnimalNo := FAnimalQuery.Fields[1].Asstring;
   FNatIdNum := FAnimalQuery.Fields[2].Asstring;
   FLactNo := FAnimalQuery.Fields[3].AsInteger;
   FHerdID := FAnimalQuery.Fields[4].AsInteger;
   FDateOfBirth := FAnimalQuery.Fields[5].AsDateTime;
end;

procedure TfmEventForm.LoadEventFromDB;
var
   sSubTableName : string;
begin
   if (FEventID <= 0) then exit;

   case FEventType of
      CCondScoreEvent : sSubTableName := 'ConditionScore';
      CHealthEvent    : sSubTableName := 'Health';
      CFertilityCheck : sSubTableName := 'FertilityCheck';
   end;

   FEventQuery.Close;
   FEventQuery.SQL.Add(InsertSELECT(['E.*', 'ES.*']));
   FEventQuery.SQL.Add(InsertFROM(['Events E ', sSubTableName +' ES']));
   FEventQuery.SQL.Add(InsertWHERE(['E.ID'],[':ID']));
   FEventQuery.SQL.Add(InsertAND(['E.ID'],['ES.EventID']));
   FEventQuery.Params[0].AsInteger := FEventID;
   FEventQuery.Open;

   FEventDate := FEventQuery.FieldByName('EventDate').AsDateTime;

   EventDate := FEventQuery.FieldByName('EventDate').AsDateTime;
   EventComment := FEventQuery.FieldByName('EventDesc').AsString;
   if ( FSearchField = 'AnimalNo' ) then
      teAnimalID.Text := FAnimalNo
   else
      teAnimalID.Text := FNatIdNum;
end;

procedure TfmEventForm.ValidateInput;
begin
   if ( deEventDate.Date < FDateOfBirth ) then
      begin
         MessageDlg(Format('The event date you have entered "%s" is before the animal date of birth "%s"'+cCRLF+
                           'Please re-enter event date.',[ FormatDate(deEventDate.Date,dsIrish),FormatDate(FDateOfBirth,dsIrish)]),mtError,[mbOK],0);
         Abort;
      end;
end;

procedure TfmEventForm.SaveEventToDB;
begin
   ValidateInput;
   if (FEventID > 0) then
      begin
         UpdateEvent;
         MessageDlg('Event details have been successfully updated.',mtInformation,[mbok],0);
      end
   else
      begin
         SaveEvent;
         MessageDlg('Event created successfully.',mtInformation,[mbok],0);
      end ;
end;

procedure TfmEventForm.actSaveExecute(Sender: TObject);
begin
  inherited;
  SaveEventToDB;
end;

procedure TfmEventForm.actCancelExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmEventForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  DeleteEvent();
end;

procedure TfmEventForm.FinalizeForm;
begin
   if FEventQuery <> nil then
      begin
         FEventQuery.Close;
         FreeAndNil(FEventQuery);
      end;
   if FAnimalQuery <> nil then
      begin
         FAnimalQuery.Close;
         FreeAndNil(FAnimalQuery);
      end;
   if FFilterList <> nil then
      FreeAndNil(FFilterList);

   if FAnimalListDataSource <> nil then
      begin
         FAnimalListDataSource.DataSet := nil;
         FreeAndNil(FAnimalListDataSource);
      end;
   if FAnimalListQuery <> nil then
      begin
         FAnimalListQuery.Close;
         FreeAndNil(FAnimalListQuery);
      end;

end;

procedure TfmEventForm.SetupForm;
begin
  FFilterList := TStringList.Create;

  FEventQuery := TQuery.Create(nil);
  FEventQuery.DatabaseName := AliasName;

  FAnimalQuery := TQuery.Create(nil);
  FAnimalQuery.DatabaseName := AliasName;
  FAnimalQuery.SQL.Add(InsertSelect(['ID', 'AnimalNo','NatIdNum','LactNo','HerdID','DateOfBirth']));
  FAnimalQuery.SQL.Add(InsertFROM(['Animals']));
  FAnimalQuery.SQL.Add(InsertWHERE(['ID'],[':ID']));

  FAnimalListQuery := TQuery.Create(nil);
  FAnimalListQuery.DatabaseName := AliasName;

  FAnimalListDataSource := TDataSource.Create(nil);
  FAnimalListDataSource.DataSet := FAnimalListQuery;

  cmboAnimalID.Properties.ListSource := FAnimalListDataSource;

  FSearchField := WinData.SearchField;
  if ( FSearchField = 'AnimalNo' ) then
     lIdType.Caption := 'Animal No.'
  else
     lIdType.Caption := 'Nat. Id. No.';

  if (FEventID > 0) then
     begin
        teAnimalId.Visible := True;
        cmboAnimalID.Visible := False;
     end
  else
     begin
        cmboAnimalID.Visible := True;
        teAnimalId.Visible := False;
     end;
  LoadAnimal;
  LoadEventFromDB;
end;

function TfmEventForm.GetEventComment: string;
begin
   Result := Trim(teEventComment.Text);
end;

function TfmEventForm.GetEventDate: TDateTime;
begin
   Result := deEventDate.Date;
end;

procedure TfmEventForm.SetEventComment(const Value: string);
begin
   teEventComment.Text := Trim(Value);
end;

procedure TfmEventForm.SetEventDate(const Value: TDateTime);
begin
   deEventDate.Date := Value;
end;

procedure TfmEventForm.AddFilter(AFilter: string);
begin
   FFilterList.Add(AFilter);
end;

procedure TfmEventForm.ActivateSearchListing;
var
   i : Integer;
begin
   if (FEventID > 0) then Exit;
   FAnimalListQuery.Close;
   FAnimalListQuery.SQL.Add(InsertSELECT(['ID','NatIdNum','AnimalNo','Sex','LactNo','DateOfBirth']));
   FAnimalListQuery.SQL.Add(InsertFROM(['Animals']));
   FAnimalListQuery.SQL.Add(InsertWHERE(['HerdID'],[':HerdID']));
   for i := 0 to FFilterList.Count-1 do
      FAnimalListQuery.SQL.Add( 'AND ('+FFilterList.Strings[i]+')');
   FAnimalListQuery.Params[0].AsInteger := FHerdID;
   FAnimalListQuery.Open;
end;

procedure TfmEventForm.UpdateEvent;
begin
   if (FEventID <= 0) then Exit;

   try
      FEventQuery.Close;
      FEventQuery.SQL.Clear;
      FEventQuery.SQL.Add('UPDATE Events SET EventDate = :EventDate, EventDesc=:Comment');
      FEventQuery.SQL.Add('WHERE (ID=:EventId)');
      FEventQuery.Params[0].AsDateTime := deEventDate.Date;
      FEventQuery.Params[1].AsString := teEventComment.Text;
      FEventQuery.Params[2].AsInteger := FEventId;
      FEventQuery.ExecSQL;
   except
      on e : exception do
         begin
            raise Exception.Create('Cannot update event details!');
         end;
   end;
end;

procedure TfmEventForm.SaveEvent;
begin
end;

procedure TfmEventForm.DeleteEvent;
begin
   try
      FEventQuery.Close;
      FEventQuery.SQL.Clear;
      FEventQuery.SQL.Add('DELETE FROM Events');
      FEventQuery.SQL.Add('WHERE (ID=:EventId)');
      FEventQuery.Params[0].AsInteger := FEventId;

      FEventQuery.ExecSQL;

   except
      on E : Exception do
         begin
            raise Exception.Create('Cannot delete event!');
         end;
   end;
   Close;
end;


function TfmEventForm.ConfirmDelete: Boolean;
begin
   Result := (MessageDlg('Are you sure you want to delete this event?',mtConfirmation,[mbYes, mbNo],0) = idYes);
end;

end.
