unit uStockBullEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEventForm, cxContainer, cxEdit, dxBar, dxBarExtItems, ActnList,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, cxMaskEdit, cxCalendar, cxTextEdit, ExtCtrls, cxControls,
  dxStatusBar, GenTypesConst, db, dbTables, uHerdLookup;

type
  TStockBullInOrOut = (sbIn, sbOut);
  TAddOrEditEvent = (AddEvent, EditEvent);
  TfmStockBullEvent = class(TForm)
    dxBarManager1: TdxBarManager;
    blbExit: TdxBarLargeButton;
    blbSave: TdxBarLargeButton;
    ActionList: TActionList;
    actExit: TAction;
    actSave: TAction;
    blbCancel: TdxBarLargeButton;
    blbDelete: TdxBarLargeButton;
    actCancel: TAction;
    actDelete: TAction;
    pInfo: TPanel;
    cmboStockBulls: TcxLookupComboBox;
    lBullNo: TcxLabel;
    deEventDate: TcxDateEdit;
    lInOutDate: TcxLabel;
    procedure actSaveExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FStockBullInOrOut : TStockBullInOrOut;
    FAddOrEditEvent : TAddOrEditEvent;
    FQStockBulls : TQuery;
    FDSStockBulls : TDataSource;
    procedure EnableDisableControls(AEnable: Boolean);
    { Private declarations }
  public
    class procedure ShowTheForm ( AStockBullInOrOut : TStockBullInOrOut;
        AAddOrEditEvent : TAddOrEditEvent );
    { Public declarations }
  end;

var
  fmStockBullEvent: TfmStockBullEvent;

implementation

uses DairyData;

{$R *.DFM}

class procedure TfmStockBullEvent.ShowTheForm( AStockBullInOrOut: TStockBullInOrOut;
   AAddOrEditEvent : TAddOrEditEvent );
begin
   with TfmStockBullEvent.Create(nil) do
      try
         WinData.EventType := TStockBull;
         FStockBullInOrOut := AStockBullInOrOut;
         FAddOrEditEvent := AAddOrEditEvent;
         if ( FStockBullInOrOut = sbIn ) then
            lInOutDate.Caption := 'In Date'
         else
            lInOutDate.Caption := 'Out Date';
         deEventDate.Date := Date;
         if ( not(HerdLookup.qStockBulls.Active) ) then
            HerdLookup.qStockBulls.Open;
         cmboStockBulls.EditValue := WinData.AnimalFileByIDID.AsInteger;
         ShowModal;
      finally
         if ( HerdLookup.qStockBulls.Active ) then
            HerdLookup.qStockBulls.Close;
         Free;
      end;
end;

procedure TfmStockBullEvent.actSaveExecute(Sender: TObject);
var
   sEventDesc : String;
   bMessageShown : Boolean;
begin
    deEventDate.PostEditValue;
    cmboStockBulls.PostEditValue;

    sEventDesc := '';
    bMessageShown := False;
    if ( FStockBullInOrOut = sbIN ) then
       sEventDesc := 'Stock Bull In'
    else
       sEventDesc := 'Stock Bull Out';

    if ( HerdLookup.StockBullEventExistsForAnimal(cmboStockBulls.EditValue, deEventDate.Date, sEventDesc) ) then
       begin
          MessageDlg('This event already exists for this animal.',mtError,[mbOK],0);
          Exit;
       end;

    if ( FStockBullInOrOut = sbIN ) then
       HerdLookup.ValidateStockBullEvent(cmboStockBulls.EditValue,True,deEventDate.Date,bMessageShown)
    else
       HerdLookup.ValidateStockBullEvent(cmboStockBulls.EditValue,False,deEventDate.Date,bMessageShown);
    if ( bMessageShown ) then Exit;

    WinData.Events.Append;
    WinData.Events.FieldByName('AnimalID').AsInteger := cmboStockBulls.EditValue;
    WinData.Events.FieldByName('AnimalLactNo').AsInteger := 0;
    WinData.Events.FieldByName('EventType').AsInteger := CStockBullEvent;
    WinData.Events.FieldByName('EventDate').AsDateTime := deEventDate.Date;
    WinData.Events.FieldByName('EventDesc').AsString := sEventDesc;
    WinData.Events.FieldByName('HerdID').AsInteger := WinData.UserDefaultHerdID;
    WinData.Events.FieldByName('EventSource').AsInteger := sINTERNAL;
    WinData.Events.FieldByName('IsSynchronized').AsBoolean := False;
    WinData.Events.Post;

    Close;
end;

procedure TfmStockBullEvent.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmStockBullEvent.actCancelExecute(Sender: TObject);
begin
   if ( WinData.Events.State in dsEditModes ) then
      WinData.Events.Cancel;
   deEventDate.Date := Date;
end;

procedure TfmStockBullEvent.actDeleteExecute(Sender: TObject);
begin
   if ( FAddOrEditEvent = EditEvent ) then
      if ( WinData.Events.FieldByName('ID').AsInteger > 0 ) then
         begin
            WinData.Events.Delete;
            Close;
         end;
end;

procedure TfmStockBullEvent.EnableDisableControls ( AEnable : Boolean );
begin
   actSave.Enabled := AEnable;
   actCancel.Enabled := AEnable;
   cmboStockBulls.Enabled := AEnable;
   deEventDate.Enabled := AEnable;
end;

procedure TfmStockBullEvent.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   EnableDisableControls( FAddOrEditEvent = AddEvent );
end;

end.
