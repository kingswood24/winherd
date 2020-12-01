unit uNewUIBullingEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uAnimalBrowserEventBase, ActnList, StdCtrls, cxButtons, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar, uHerdLookup,
  GenTypesConst, Db, DBTables, EventRecording, DairyData, cxLabel;

type
  TfmNewUIBullingEvent = class(TfmAnimalBrowserEventBase)
    gbAnimalHeatBulling: TGroupBox;
    lEventDate: TcxLabel;
    lPlannedBull: TcxLabel;
    lObservedBy: TcxLabel;
    deEventDate: TcxDateEdit;
    cmboPlannedBull: TcxLookupComboBox;
    cmboObservedBy: TcxLookupComboBox;
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
    class function ShowForm (AAnimalID, ALactNo, AHerdId : Integer; ANatIDNum, AAnimalNo : String) : Boolean;
  end;

var
  fmNewUIBullingEvent: TfmNewUIBullingEvent;

implementation

{$R *.DFM}

{ TfmNewUIBullingEvent }

procedure TfmNewUIBullingEvent.CancelEvent;
begin
  inherited;
  // Cancel Event
end;

procedure TfmNewUIBullingEvent.SaveEvent;
var
   BullingEvent : TBullingEvent;
begin
   BullingEvent := TBullingEvent.Create('TempBulling');
   with BullingEvent do
      try
         Append;
         AnimalID := FAnimalId;
         AnimalLactNo := FLactNo;
         AnimalHerdID := FHerdId;

         EventDate := deEventDate.Date;
         PlannedBull := cmboPlannedBull.EditValue;
         ObservedBy := cmboObservedBy.EditValue;

         Post;

         FEventSaved := True;
      finally
         Free;
      end;

   inherited;
end;

class function TfmNewUIBullingEvent.ShowForm(AAnimalID, ALactNo, AHerdId: Integer;
   ANatIDNum, AAnimalNo: String) : Boolean;
begin
   with TfmNewUIBullingEvent.Create(nil) do
      try
         deEventDate.Date := Date;

         if ( not(HerdLookup.qPlannedBull.Active) ) then
            HerdLookup.qPlannedBull.Active := True;

         if ( not(WinData.qObservedBy.Active) ) then
            WinData.qObservedBy.Active := True;

         FAnimalId := AAnimalID;
         FLactNo := ALactNo;
         FHerdId := AHerdId;

         with cmboPlannedBull.Properties do
            begin
               KeyFieldNames := 'ID';
               ListFieldNames := 'Code';
               ListSource := HerdLookup.dsPlannedBull;
            end;

         with cmboObservedBy.Properties do
            begin
               KeyFieldNames := 'ID';
               ListFieldNames := 'Description';
               ListSource := WinData.dsObservedBy;
            end;

         SetGroupBoxCaption(gbAnimalHeatBulling,AAnimalNo,ANatIDNum);

         ShowModal;
      finally

         Free;

         Result := FEventSaved;
      end;
end;

end.
