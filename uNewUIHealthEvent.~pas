{
   13/11/11 [V5.0 R2.0] /MK Change - If EventType = DryingOff Then Do Not Show ICBF Event Code.

   14/06/12 [V5.0 R7.2] /MK Bug Fix - Set qHealthCodes.Active On FormCreate And Not Active On FormClose.

   20/03/15 [V5.4 R3.4] /MK Bug Fix - SaveEvent - Using THealthEvent.Quantity instead of THealthEvent.ApplicRate to store ApplicRate.

   18/07/18 [V5.8 R1.1] /MK Change - Replaced Health Code with Admin By as this is a required field - Bellingham Farms.   
}

unit uNewUIHealthEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uAnimalBrowserEventBase, ActnList, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, Db,
  DBTables, GenTypesConst, cxLabel;

type
  TfmNewUIHealthEvent = class(TfmAnimalBrowserEventBase)
    gbAnimalHealth: TGroupBox;
    lEventDate: TcxLabel;
    deEventDate: TcxDateEdit;
    cmboMedicine: TcxLookupComboBox;
    lMedicine: TcxLabel;
    lApplicRate: TcxLabel;
    ceApplicRate: TcxCurrencyEdit;
    ceDays: TcxCurrencyEdit;
    cePerDay: TcxCurrencyEdit;
    lBy: TcxLabel;
    lBy2: TcxLabel;
    lDays: TcxLabel;
    lPerDay: TcxLabel;
    lAdminBy: TcxLabel;
    cmboAdminBy: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
  private
    FAnimalId,
    FLactNo,
    FHerdId : Integer;
    FEventType : TEventType;
  protected
    { Private declarations }
    procedure SaveEvent; override;
    procedure CancelEvent; override;
  public
    { Public declarations }
    class function ShowForm(const AAnimalId, ALactNo, AHerdID : Integer;
       AEventType : TEventType; ANatIDNum, AAnimalNo : String) : Boolean; // returns true if user clicks save.
  end;

var
  fmNewUIHealthEvent: TfmNewUIHealthEvent;

implementation

uses EventRecording, DairyData, uHerdLookup;

{$R *.DFM}

{ TfmAnimalBrowserEventBase }

procedure TfmNewUIHealthEvent.CancelEvent;
begin
  inherited;

end;

procedure TfmNewUIHealthEvent.SaveEvent;
var
   HealthEvent : THealthEvent;
begin

  HealthEvent := THealthEvent.Create('tmpHealthDryOff');
  try
     with HealthEvent do
        begin
           Append;
           AnimalID := FAnimalId;
           AnimalLactNo := FLactNo;
           AnimalHerdID := FHerdId;
           EventType := FEventType;
           DryOffEvent := ( EventType = TDryOff );
           EventDate := deEventDate.Date;
           DrugUsed := cmboMedicine.EditValue;
           //   20/03/15 [V5.4 R3.4] /MK Bug Fix - Using THealthEvent.Quantity instead of THealthEvent.ApplicRate to store ApplicRate.
           RateApplic := ceApplicRate.Value;
           AdminBy := cmboAdminBy.EditValue;
           NoDays := ceDays.EditValue;
           NoTimes := cePerDay.EditValue;
           //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
           ManualComment := False;
           Post;
           FEventSaved := True;
        end;
  finally
     HealthEvent.Free;
  end;

  inherited;

end;

//   13/11/11 [V5.0 R2.0] /MK Change - If EventType = DryingOff Then Do Not Show ICBF Event Code.
class function TfmNewUIHealthEvent.ShowForm(const AAnimalId, ALactNo, AHerdId : Integer;
   AEventType : TEventType; ANatIDNum, AAnimalNo : String) : Boolean;
begin
   with TfmNewUIHealthEvent.Create(nil) do
      try
         if AEventType = THealth then
            begin
               Caption := 'Veterinary';
               gbAnimalHealth.Height := 330;
               Height := 492;
            end
         else if AEventType = TDryOff then
            begin
               Caption := 'Drying Off';
               gbAnimalHealth.Height := 258;
               Height := 406;
            end;

         if not WinData.Medicine.Active then
            WinData.Medicine.Active := True;

         if not HerdLookup.qICBFHealthCodes.Active then
            HerdLookup.qICBFHealthCodes.Active := True;

         if not HerdLookup.qNonICBFHealthCodes.Active then
            HerdLookup.qNonICBFHealthCodes.Active := True;

         ceDays.Value := 1;
         cePerDay.Value := 1;

         with cmboMedicine.Properties do
            begin
               KeyFieldNames := 'ID';
               ListFieldNames := 'Name';
               ListSource := WinData.dsMedicine;
            end;

         if ( not(HerdLookup.QueryAdminBy.Active) ) then
            HerdLookup.QueryAdminBy.Active := True;
         cmboAdminBy.Properties.ListSource := HerdLookup.LookupAdminBy;
         cmboAdminBy.Properties.KeyFieldNames := 'ID';
         cmboAdminBy.Properties.ListFieldNames := 'Name';

         SetGroupBoxCaption(gbAnimalHealth,AAnimalNo,ANatIDNum);

         HerdLookup.HerdOwnerData.HerdID := AHerdID;
         deEventDate.Date := Date;

         FAnimalId := AAnimalId;
         FLactNo := ALactNo;
         FHerdId := AHerdID;
         FEventType := AEventType;

         ShowModal;
      finally
         Free;

         HerdLookup.qICBFHealthCodes.Active := False;
         HerdLookup.qNonICBFHealthCodes.Active := False;

         Result := FEventSaved;
      end;
end;

procedure TfmNewUIHealthEvent.FormCreate(Sender: TObject);
begin
   inherited;
   WinData.OwnerFile.Locate('ID', WinData.UserDefaultHerdID,[]);
end;

end.
