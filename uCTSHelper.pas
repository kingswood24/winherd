unit uCTSHelper;

interface

uses
   Forms, Classes, Windows,SysUtils, db, dbTables;
type
  TRegisteredView = (rvAccepted, rvRejected, rvAll);
  TCTSView = (bvToBeRegistered, bvRegistrationResults, bvPreviousResults);

  function GetCTSBatchID(AHerdId : Integer) : Integer;
  procedure CheckCTSWSStatus;

const
   cRequestType_Births = 1;
   cRequestType_Movements = 2;
   cRequestType_CattleOnHolding = 3;

   cOnHoldingType_Animal = 1;
   cOnHoldingType_QueriedAnimal = 2;
   cOnHoldingType_QueriedMovement = 3;

   cNatIdChangeConfirmMsg = 'You have changed the Nat. Id. No to "%s" '+#13#10+#13#10+
                            'Is this the correct Nat. Id. No for this animal?';

   cNatIdRemoveConfirmMsg = 'Are you sure you want to remove the Nat. Id. No. from registration?';
implementation

uses
   GenTypesConst, ShellAPI, kRoutines;

function GetCTSBatchID(AHerdId : Integer) : Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         try
            SQL.Text := 'Select CTSBatchID From Owners Where ID=:ID';
            Params[0].AsInteger := AHerdId;
            Open;

            Result := FieldByName('CTSBatchID').AsInteger+1;

            Close;
            SQL.Text := 'Update Owners Set CTSBatchID =:CTSBatchID';
            Params[0].AsInteger := Result;
            ExecSQL;
         except
            Result := 0;
         end;
      finally
         Free;
      end;
end;

procedure CheckCTSWSStatus;
begin
   OpenUrl('http://www.rpa.gov.uk/rpa/index.nsf/UIMenu/E50B93E88EAADBAF80256F72003DDB5F?opendocument');
end;

end.

