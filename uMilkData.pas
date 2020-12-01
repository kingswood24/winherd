unit uMilkData;

interface

type
   TMilkData = class
   public
      class function GetLastRecordingDate(const AHerd : Integer = 0) : TDateTime;
   end;


implementation
uses
   db, dbTables, GenTypesConst;

const
    cMDTTable = 'MDT';
    cMilkDiskTransTable = 'MilkDiskTrans';
{ TMilkData }

class function TMilkData.GetLastRecordingDate(
  const AHerd: Integer): TDateTime;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select Max(RecordingDate) MaxRecordingDate From '+cMDTTable);
         Open;

         try
            First;
            Result := FieldByName('MaxRecordingDate').AsDateTime;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

end.
