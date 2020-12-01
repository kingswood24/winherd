{
   24/06/13 [V5.1 R7.5] /MK Change - CalvingLactNo - Change to SQL to find next lactno.
                                   - FormCloseQuery - Allow calving to be saved if date is less than 335 days since last calving.

   01/04/15 [V5.4 R2.3] /MK Bug Fix - CalvingLactNo - Changed logic below to allow users to add calvings for cows with no calvings.
}

unit uCalvingHistoryEntry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, ToolEdit, ExtCtrls;

type
  TfmCalvingHistoryEntry = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    QueryLactationNo: TQuery;
    btnCreateCalving: TButton;
    btnCancel: TButton;
    deCalvingDate: TDateEdit;
    eLactNo: TEdit;
    Label3: TLabel;
    EventInsert: TQuery;
    CalvingsInsert: TQuery;
    QueryEvents: TQuery;
    CloseTimer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CloseTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FAnimalID,
    FAnimalLactNo : Integer;
    function CalvingLactNo : Integer;
  public
    { Public declarations }
    class function CreateCalving(AAnimalID, AAnimalLactNo : Integer) : Boolean;
  end;

var
  fmCalvingHistoryEntry: TfmCalvingHistoryEntry;

implementation

uses DairyData, GenTypesConst;

{$R *.DFM}

{ TForm1 }

class function TfmCalvingHistoryEntry.CreateCalving(AAnimalID, AAnimalLactNo : Integer) : Boolean;
var
   EventID : Integer;
begin
   with TfmCalvingHistoryEntry.Create(nil) do
      try
         FAnimalID := AAnimalID;
         FAnimalLactNo := AAnimalLactNo;

         if ( ShowModal = mrOK ) then
            begin
               WinData.KingData.StartTransaction;
               try
                  EventID := WinData.NewOtherID;
                  EventInsert.Params[0].AsInteger := eventID;
                  EventInsert.Params[1].AsInteger := AAnimalID;
                  EventInsert.Params[2].AsSmallInt := StrToInt(eLactNo.Text);
                  EventInsert.Params[3].AsSmallInt := CCalvingEvent;
                  EventInsert.Params[4].AsString  := 'Calving';
                  EventInsert.Params[5].AsDate := deCalvingDate.Date;
                  EventInsert.Params[6].AsInteger := WinData.HerdIDByAnimalID(AAnimalID);
                  EventInsert.Params[7].Value := True;
                  EventInsert.Params[8].Value := 'A';
                  EventInsert.Params[9].Value := True;
                  EventInsert.Params[10].Value := 'A';
                  EventInsert.Params[11].AsInteger := sINTERNAL;
                  EventInsert.ExecSQL;

                  CalvingsInsert.Params[0].AsInteger := eventID;
                  CalvingsInsert.Params[1].AsString := '';
                  CalvingsInsert.Params[2].AsInteger := 0;
                  CalvingsInsert.Params[3].AsInteger := 0;
                  CalvingsInsert.Params[4].AsInteger := 0;
                  CalvingsInsert.Params[5].AsInteger := 0;
                  CalvingsInsert.Params[6].Value := True;
                  CalvingsInsert.Params[7].Value := True;
                  CalvingsInsert.Params[8].Value := True;
                  CalvingsInsert.Params[9].Value := True;
                  CalvingsInsert.Params[10].Value := True;
                  CalvingsInsert.Params[11].Value := True;
                  CalvingsInsert.Params[12].Value := True;
                  CalvingsInsert.Params[13].Value := True;
                  CalvingsInsert.Params[14].AsInteger := 0;
                  CalvingsInsert.Params[15].AsInteger := 0;
                  CalvingsInsert.Params[16].AsInteger := 0;
                  CalvingsInsert.Params[17].Value := False;
                  CalvingsInsert.Params[18].Value := False;
                  CalvingsInsert.Params[19].Value := False;
                  CalvingsInsert.Params[20].Value := False;
                  CalvingsInsert.Params[21].AsInteger := 0;
                  CalvingsInsert.Params[22].AsInteger := 0;
                  CalvingsInsert.Params[23].AsInteger := 0;
                  CalvingsInsert.Params[24].AsInteger := 0;
                  CalvingsInsert.Params[25].Value := True;
                  CalvingsInsert.Params[26].Value := True;
                  CalvingsInsert.Params[27].Value := True;
                  CalvingsInsert.Params[28].Value := True;
                  CalvingsInsert.Params[29].Value := True;
                  CalvingsInsert.Params[30].Value := True;
                  CalvingsInsert.Params[31].Value := True;
                  CalvingsInsert.Params[32].Value := True;
                  CalvingsInsert.Params[33].AsInteger := 0;
                  CalvingsInsert.Params[34].AsInteger := 0;
                  CalvingsInsert.Params[35].AsInteger := 0;
                  CalvingsInsert.Params[36].AsInteger := 0;
                  CalvingsInsert.Params[37].AsDate := 0;
                  CalvingsInsert.Params[38].AsDate := 0;
                  CalvingsInsert.Params[39].AsDate := 0;
                  CalvingsInsert.Params[40].AsDate := 0;
                  CalvingsInsert.Params[41].AsString := '';
                  CalvingsInsert.Params[42].AsString := '';
                  CalvingsInsert.Params[43].AsString := '';
                  CalvingsInsert.Params[44].AsString := '';
                  CalvingsInsert.ExecSQL;
                  Result := True;
                  WinData.KingData.Commit;
                  MessageDlg('Calving event successfully created',mtInformation,[mbOk],0);
               except
                  WinData.KingData.Rollback;
                  MessageDlg('Calving event creation failed!',mtError,[mbOk],0);
               end;
            end;
      finally
         Free;
      end;
end;

procedure TfmCalvingHistoryEntry.FormShow(Sender: TObject);
var
   LactNo : Integer;
begin
   if LactNo > 0 then
      eLactNo.Text := IntToStr(CalvingLactNo);

   btnCreateCalving.Enabled := True; // let user enter calving of their own free will.
   deCalvingDate.Enabled := True;
end;

function TfmCalvingHistoryEntry.CalvingLactNo: Integer;
begin
   with QueryLactationNo do
      try
        SQL.Clear;
        SQL.Add('SELECT MAX(AnimalLactNo)');
        SQL.Add('FROM Events');
        SQL.Add('WHERE EventType = 5');
        SQL.Add('AND AnimalID = :AnimalID');
        Close;
        Params[0].AsInteger := FAnimalID;
        Open;
        //   01/04/15 [V5.4 R2.3] /MK Bug Fix - Changed logic below to allow users to add calvings for cows with no calvings.
        if ( Fields[0].AsInteger+1 >= FAnimalLactNo ) then
           // Make the next lact no the max LactNo of the animals Calving Events + 1
           // once this lact no is less than or equal to the animals current lact no.
           Result := Fields[0].AsInteger + 1
        else
           // If no calvings for the cow then default lactno to cows current lactno.
           Result := FAnimalLactNo;
      except
      end;
end;

procedure TfmCalvingHistoryEntry.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOK then
      begin
         if deCalvingDate.Date <= 0 then
            begin
               MessageDlg('You must enter a calving date.',mtError,[mbOK],0);
               CanClose := False;
            end
         else
            begin
               QueryEvents.Close;
               QueryEvents.Params[0].AsInteger := FAnimalID;
               QueryEvents.Params[1].AsDate := deCalvingDate.Date;
               try
                  QueryEvents.Open;

                  if ( QueryEvents.RecordCount > 0 ) then
                     begin
                        // Allow new calving to be saved if deCalvingDate.Date is > 335 since the last calving date.
                        QueryEvents.First;
                        if ( (deCalvingDate.Date - QueryEvents.FieldByName('EventDate').AsDateTime) < 335 ) then
                           begin
                              MessageDlg(Format('It is less than 11 months (%d days), since the last calving!',
                                                [Trunc(deCalvingDate.Date - QueryEvents.FieldByName('EventDate').AsDateTime)]),mtError,[mbOk],0);
                              CanClose := False;
                           end;
                     end;
               finally
                  QueryEvents.Close;
               end;
            end;
      end;
end;

procedure TfmCalvingHistoryEntry.CloseTimerTimer(Sender: TObject);
begin
   CloseTimer.Enabled := False;
   Close;
end;

end.
