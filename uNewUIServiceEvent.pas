{
   14/06/12 [V5.0 R7.2] /MK Bug Fix - Set BullQuery.Active On FormCreate And Not Active On FormClose.
}

unit uNewUIServiceEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uAnimalBrowserEventBase, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxLabel, StdCtrls, ActnList, cxButtons, db, DBTables;

type
  TfmNewUIServiceEvent = class(TfmAnimalBrowserEventBase)
    gbAnimalHeatBulling: TGroupBox;
    lEventDate: TcxLabel;
    lBullUsed: TcxLabel;
    lInseminator: TcxLabel;
    deEventDate: TcxDateEdit;
    cmboBullUsed: TcxLookupComboBox;
    cmboInseminator: TcxLookupComboBox;
    dsBullUsed: TDataSource;
  private
    FAnimalId,
    FLactNo,
    FHerdId : Integer;
    { Private declarations }
  protected
    { Private declarations }
    procedure SaveEvent; override;
    procedure CancelEvent; override;
  public
    { Public declarations }
    class function ShowForm(AAnimalID, ALactNo, AHerdId: Integer;
      ANatIDNum, AAnimalNo: String): Boolean;
  end;

var
  fmNewUIServiceEvent: TfmNewUIServiceEvent;

implementation

uses uHerdLookup, DairyData, EventRecording;

{$R *.DFM}

procedure TfmNewUIServiceEvent.CancelEvent;
begin
  inherited;
  // Cancel Event.
end;

procedure TfmNewUIServiceEvent.SaveEvent;
var
   ServiceEvent : TServiceEvent;
begin
   ServiceEvent := TServiceEvent.Create('TempService');
   with ServiceEvent do
      try
         Append;
         AnimalID := FAnimalId;
         AnimalLactNo := FLactNo;
         AnimalHerdID := FHerdId;

         EventDate := deEventDate.Date;
         ServiceBull := cmboBullUsed.EditValue;
         Technician := cmboInseminator.EditValue;

         Post;

         FEventSaved := True;
      finally
         Free;
      end;
  inherited;
end;

class function TfmNewUIServiceEvent.ShowForm(AAnimalID, ALactNo, AHerdId: Integer;
   ANatIDNum, AAnimalNo: String) : Boolean;
begin
   with TfmNewUIServiceEvent.Create(nil) do
      try
         deEventDate.Date := Date;

         if ( not(HerdLookup.qServiceBullUsed.Active) ) then
            HerdLookup.qServiceBullUsed.Active := True
         else
            begin
               HerdLookup.qServiceBullUsed.Active := False;
               HerdLookup.qServiceBullUsed.Active := True;
            end;

         Herdlookup.dsServiceBullUsed.DataSet := HerdLookup.qServiceBullUsed;

         if ( not(WinData.qObservedBy.Active) ) then
            WinData.qObservedBy.Active := True;

         FAnimalId := AAnimalID;
         FLactNo := ALactNo;
         FHerdId := AHerdId;

         with cmboBullUsed.Properties do
            begin
               KeyFieldNames := 'ID';
               ListFieldNames := 'AnimalNo';
               ListSource := HerdLookup.dsServiceBullUsed;
            end;

         with cmboInseminator.Properties do
            begin
               KeyFieldNames := 'ID';
               ListFieldNames := 'Description';
               ListSource := WinData.dsObservedBy;
            end;

         SetGroupBoxCaption(gbAnimalHeatBulling,AAnimalNo,ANatIDNum);

         ShowModal;
      finally

         Free;

         HerdLookup.qServiceBullUsed.Active := False;

         Result := FEventSaved;
      end;
end;

end.
