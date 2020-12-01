unit uFertilityCheckEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEventForm, cxContainer, cxEdit, dxBar, dxBarExtItems, ActnList,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, cxTextEdit, cxMaskEdit, cxCalendar, ExtCtrls, cxControls,
  dxStatusBar, StdCtrls, cxButtons;

type
  TfmFertilityCheckEdit = class(TfmEventForm)
    Label39: TLabel;
    cmboFertilityCheckStatus: TcxLookupComboBox;
    Label40: TLabel;
    cmboFertilityCheckAction: TcxLookupComboBox;
    Label41: TLabel;
    cmboFertilityCheckFertilityProgram: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FOriginalFertProgram : Integer;
  protected
     procedure UpdateEvent;override;
     procedure DeleteEvent();override;
     procedure LoadEventFromDB;override;
  public
    { Public declarations }
  end;

var
  fmFertilityCheckEdit: TfmFertilityCheckEdit;

implementation

uses uHerdLookup, GenTypesConst, uFertProgramAdmin, DairyData;

{$R *.DFM}

{ TfmFertilityCheckEdit }

procedure TfmFertilityCheckEdit.UpdateEvent;
begin
   inherited;

   if (FEventId <= 0) then Exit;

   try
      FEventQuery.Close;
      FEventQuery.SQL.Clear;
      FEventQuery.SQL.Add('UPDATE FertilityCheck SET Status =:Status, Action=:Action, FertProgram=:FertProgram');
      FEventQuery.SQL.Add('WHERE (EventID=:EventId)');
      FEventQuery.Params[0].Value := cmboFertilityCheckStatus.EditValue;
      FEventQuery.Params[1].Value := cmboFertilityCheckAction.EditValue;
      FEventQuery.Params[2].Value := cmboFertilityCheckFertilityProgram.EditValue;
      FEventQuery.Params[3].AsInteger := FEventId;
      FEventQuery.ExecSQL;

   except
      on E : Exception do
         begin
            raise Exception.Create('Cannot update event details!');
         end;
   end;
end;

procedure TfmFertilityCheckEdit.FormCreate(Sender: TObject);
begin
  inherited;
  HerdLookup.QueryFertilityCheckStatus.Active := True;
  HerdLookup.QueryFertilityCheckAction.Active := True;
  HerdLookup.QueryFertPrograms.Active := True;
  FEventType := CFertilityCheck;
  Caption := 'Fertility Check';
end;

procedure TfmFertilityCheckEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  HerdLookup.QueryFertilityCheckStatus.Active := False;
  HerdLookup.QueryFertilityCheckAction.Active := False;
  HerdLookup.QueryFertPrograms.Active := False;
end;

procedure TfmFertilityCheckEdit.DeleteEvent;
begin
   if (FEventID <= 0) or (not ConfirmDelete) then Exit;

   if not VarIsNull(cmboFertilityCheckFertilityProgram.EditValue) then
      begin
         if MessageDlg(Format('Do you want to remove animal from Fertility Program "%s" ?',[cmboFertilityCheckFertilityProgram.Text]),mtConfirmation,[mbYes,mbNo],0) = idYes then
            WinData.FertilityPrograms.RemoveProgramFromAnimal(FEventID);
      end;

   try
      FEventQuery.Close;
      FEventQuery.SQL.Clear;
      FEventQuery.SQL.Add('DELETE FROM FertilityCheck');
      FEventQuery.SQL.Add('WHERE (EventID=:EventId)');
      FEventQuery.Params[0].ASInteger := FEventID;
      FEventQuery.ExecSQL;
   except
      on E : Exception do
         begin
            raise Exception.Create('Cannot delete event details!');
         end;
   end;
  inherited;
end;

procedure TfmFertilityCheckEdit.actSaveExecute(Sender: TObject);
begin

  if not VarIsNull(cmboFertilityCheckFertilityProgram.EditValue) then
     begin
        if (cmboFertilityCheckFertilityProgram.EditValue <> FOriginalFertProgram) then
           begin
              // Remove exising program
              WinData.FertilityPrograms.RemoveProgramFromAnimal(

              FEventID

              );

              // Start animal on new program
              WinData.FertilityPrograms.StartAnimalOnProgram(

              FAnimalID, FLactNo, cmboFertilityCheckFertilityProgram.EditValue, FEventID, deEventDate.Date

              );

           end;
     end;
  inherited;
//
end;

procedure TfmFertilityCheckEdit.actDeleteExecute(Sender: TObject);
begin
  inherited;
   //
end;

procedure TfmFertilityCheckEdit.LoadEventFromDB;
begin
  inherited;
  cmboFertilityCheckStatus.EditValue := FEventQuery.FieldByName('Status').AsInteger;
  cmboFertilityCheckAction.EditValue := FEventQuery.FieldByName('Action').AsInteger;
  FOriginalFertProgram := FEventQuery.FieldByName('FertProgram').AsInteger;
  cmboFertilityCheckFertilityProgram.EditValue := FOriginalFertProgram;
end;

end.
