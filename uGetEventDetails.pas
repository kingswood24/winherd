unit uGetEventDetails;

interface

uses
   Windows, Classes, SysUtils, db, dbtables, uProgressIndicator;
type

   TActionReminderData = class
   private
      GenQuery : TQuery;
      EventTable,
      DetailTable,
      TempTable  : TTable;
      FShowProgress: Boolean;
      FHerdID: Integer;
      FFromDate: TDateTime;
      FToDate: TDateTime;
      procedure InitializeTempTable;virtual;abstract;
   public
      constructor create;
      destructor Destroy;override;
      property HerdID : Integer read FHerdID write FHerdID;
      property ShowProgress : Boolean read FShowProgress write FShowProgress;
      property FromDate : TDateTime read FFromDate write FFromDate;
      property ToDate : TDateTime read FToDate write FToDate;
   end;


   TDueServiceData = class(TActionReminderData)
   private
      procedure InitializeTempTable;override;
      procedure GetServiceData;
   public
      //procedure GetServiceData
      constructor Create;
   end;

const
   AliasName = 'kingswd';

implementation

{ TActionReminderData }

constructor TActionReminderData.create;
begin

   EventTable := TTable.Create(nil);
   EventTable.DatabaseName :=  AliasName;
   EventTable.TableName := 'Events';
   EventTable.Active := True;

   DetailTable := TTable.Create(nil);
   DetailTable.DatabaseName :=  AliasName;

   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName :=  AliasName;

   FShowProgress := False;
   FHerdID := 0;
   FFromDate := 0;
   FToDate := 0;
end;

destructor TActionReminderData.Destroy;
begin
  inherited;
  if DetailTable <>  nil then
     begin
        DetailTable.Close;
        DetailTable.Free;
     end;
  if EventTable <>  nil then
     begin
        EventTable.Close;
        EventTable.Free;
     end;
  if GenQuery <>  nil then
     begin
        GenQuery.Close;
        GenQuery.Free;
     end;
end;

{ TDueServiceData }

constructor TDueServiceData.Create;
begin
  inherited;
  if DetailTable <> nil then
     begin
        DetailTable.TableName := 'Services';
        DetailTable.Active := True;
     end;

  InitializeTempTable;
end;

procedure TDueServiceData.GetServiceData;
begin

end;

procedure TDueServiceData.InitializeTempTable;
begin
  inherited;

  with TempTable do
     begin
         Close;
         TableName := 'DueServiceData';

         FieldDefs.Clear;
         FieldDefs.Add('AnimalID',ftInteger,0,False);
         FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
         FieldDefs.Add('AnimalNo',ftString,10,False);
         FieldDefs.Add('SortAnimalNo',ftString,10,False);
         FieldDefs.Add('DOB',ftDate,0,False);
         FieldDefs.Add('LastCalvDate',ftDate,0,False);
         FieldDefs.Add('LastCalvType',ftString,10,False);
         FieldDefs.Add('PlannedBull',ftString,10,False);
         FieldDefs.Add('DaysInMilk',ftFloat,0,False);
         FieldDefs.Add('DueService',ftDate,0,False);
         FieldDefs.Add('NextObsDate',ftDate,0,False);
         FieldDefs.Add('DriedOffOn',ftDate,0,False);
         FieldDefs.Add('NextHeat',ftDate,0,False);
         FieldDefs.Add('PrevYield',ftFloat,0,False);
         FieldDefs.Add('RepType',ftString,1,False);
         FieldDefs.Add('DueAfter',ftDate,0,False);
         FieldDefs.Add('NoServes',ftInteger,0,False);
         FieldDefs.Add('LastBull',ftString,10,False);
         FieldDefs.Add('DaysToService',ftFloat,0,False);
         FieldDefs.Add('AvgDailyYield',ftFloat,0,False);
         FieldDefs.Add('LastService',ftDate,0,False);
         FieldDefs.Add('Include',ftBoolean,0,False);
         FieldDefs.Add('LastServiceDate',ftDate,0,False);
         FieldDefs.Add('HeatDate',ftDate,0,False);
         FieldDefs.Add('Category',ftInteger,0,False);
         FieldDefs.Add('ServiceType', ftString, 10, False); { SP 27/11/2002 }
         FieldDefs.Add('OverDue', ftBoolean);


         IndexDefs.Clear;
         IndexDefs.Add('AnimalIDx','AnimalID',[ixPrimary]);
         CreateTable;
         Open;
     end;


end;

end.
