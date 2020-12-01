unit uHealthEventForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEventForm, cxContainer, cxEdit, dxBar, dxBarExtItems, ActnList,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, ExtCtrls, cxControls,
  dxStatusBar, EventRecording, DB;

type
  TfmHealthEvent = class(TfmEventForm)
    cmboICBFCode: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmboICBFCodePropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    DefaultICBFHealthCode : string;
    FHealthEvent : THealthEvent;
    function GetICBFHealthCode: Integer;
    procedure SetICBFHealthCode(const Value: Integer);
//    function GetEventComment: string;
//    procedure SetEventComment(const Value: string);
  protected
    procedure SaveEvent;override;
    procedure DeleteEvent();override;

    property ICBFHealthCode : Integer read GetICBFHealthCode write SetICBFHealthCode;
   // property EventComment : string read GetEventComment write SetEventComment;
  public
    { Public declarations }
  end;

var
  fmHealthEvent: TfmHealthEvent;
  iDefaultICBFHealthCode : Integer;

implementation

uses GenTypesConst, uHerdLookup, uPreferences;

{$R *.DFM}

procedure TfmHealthEvent.FormCreate(Sender: TObject);
begin
   inherited;
   FEventType := CHealthEvent;
   FHealthEvent := THealthEvent.Create('AHltDB');
   HerdLookup.ICBFHealthCodeLookup.Properties.ListFieldIndex := 0;
   cmboICBFCode.RepositoryItem := HerdLookup.ICBFHealthCodeLookup;

   DefaultICBFHealthCode := Preferences.ValueAsString[cGSCalving_RecordHealthCode];
   HerdLookup.qICBFHealthCodes.Active := True;
   if (Trim(DefaultICBFHealthCode) <> '') then
      begin
         if HerdLookup.qICBFHealthCodes.Locate('LookupCode',DefaultICBFHealthCode,[loCaseInsensitive]) then
            ICBFHealthCode := HerdLookup.qICBFHealthCodes.Fields[0].AsInteger;
      end;

   if (FEventID <= 0) then
      begin
         EventComment := 'Health';
         ActiveControl := cmboICBFCode;
      end;
end;

procedure TfmHealthEvent.FormShow(Sender: TObject);
begin
  inherited;
  AddFilter('Inherd=True');
  AddFilter('Sex="Female"');
  ActivateSearchListing;
  cmboAnimalID.EditValue := FAnimalListQuery.Fields[0].AsInteger;
  cmboAnimalID.Enabled   := FEnableAnimalListing;
end;
{
function TfmHealthEvent.GetEventComment: string;
var
   iICBFCode : Integer;
begin
   Result := Trim(teEventComment.Text);
   {iICBFCode := ICBFHealthCode;
   if (iICBFCode > 0) then
      begin
         Result := Result := ' '+ cmboICBFCode.Text;
      end;
end;}

function TfmHealthEvent.GetICBFHealthCode: Integer;
begin
   Result := cmboICBFCode.EditValue;
end;
{
procedure TfmHealthEvent.SetEventComment(const Value: string);
begin
   teEventComment.Text := Trim(Value);
end;
}
procedure TfmHealthEvent.SetICBFHealthCode(const Value: Integer);
begin
   cmboICBFCode.EditValue := Value;
end;

procedure TfmHealthEvent.cmboICBFCodePropertiesChange(Sender: TObject);
begin
  inherited;
  if ( cmboICBFCode.EditValue > 0 ) then
     begin
        EventComment := 'Health '+ cmboICBFCode.Text;
     end;

end;

procedure TfmHealthEvent.FormDestroy(Sender: TObject);
begin
  inherited;
  HerdLookup.qICBFHealthCodes.Active := False;
  if FHealthEvent <> nil then
     FreeAndNil(FHealthEvent);
end;

procedure TfmHealthEvent.SaveEvent;
begin
  inherited;
  FHealthEvent.Append;
  try
     FHealthEvent.AnimalID := FAnimalID;
     if FOverrideLactNo > 0 then
        FHealthEvent.AnimalLactNo := FOverrideLactNo
     else
        FHealthEvent.AnimalLactNo := FLactNo;
     FHealthEvent.AnimalLactNo := FLactNo;
     FHealthEvent.AnimalHerdID := FHerdID;
     FHealthEvent.EventDate := EventDate;
     FHealthEvent.EventSource := sInternal;
     FHealthEvent.EventComment := EventComment;
     FHealthEvent.HealthCode := ICBFHealthCode;
     //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
     FHealthEvent.ManualComment := False;
     FHealthEvent.Post;

     MessageDlg('Health event successfully saved.',mtInformation,[mbOK],0);
  except
     FHealthEvent.Cancel;
     MessageDlg('Health event could not be saved!',mtError,[mbOK],0);
  end;
  Close;
end;

procedure TfmHealthEvent.DeleteEvent;
begin



  inherited;

end;

end.
