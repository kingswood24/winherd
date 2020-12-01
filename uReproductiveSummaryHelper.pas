unit uReproductiveSummaryHelper;

interface

uses
   Windows, Classes, SysUtils, db, dbTables, dxmdaset;

   function MinEventDate(const AID, ALactNo, AEvent : Integer ) : TDateTime;

implementation

   function MinEventDate(const AID, ALactNo, AEvent : Integer ) : TDateTime;
   begin
      Result := 0;
      if ( AID > 0 ) and ( AEvent > 0 ) then
         with TQuery.Create(nil) do
            try
               DatabaseName := 'kingswd';
               SQL.Clear;
               SQL.Add('Select AnimalID, MIN(EventDate) MinEventDate From Events');
               SQL.Add('Where (AnimalID = :AID )');
               SQL.Add('And ( EventType = :EventType )');
               SQL.Add('And ( AnimalLactNo = :LactNo )');
               SQL.Add('Group By AnimalID ');
               Params[0].AsInteger := AID;
               Params[1].AsInteger := AEvent;
               Params[2].AsInteger := ALactNo;
               Active := True;
               try
                  Result := FieldByName('MinEventDate').AsDateTime;
               finally
                  Active := False;
               end;
            finally
               Free;
            end;
   end;


end.
