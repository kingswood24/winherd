{
   18/06/13 [V5.1 R7.4] /MK Additional Feature - New unit to show user tag description from Vet Purchase file.

   23/08/13 [V5.2 R0.2] /MK Additional Feature - Added PurchDoseRate from MediPur table to lDrugName.Caption.   
}

unit uDrugPurchTagDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls,
  cxButtons, DairyData, GenTypesConst, db, dbTables, cxMemo;

type
  TfmDrugPurchTagDetails = class(TForm)
    btnExit: TcxButton;
    lTagDesc: TcxLabel;
    lDrugPurchDate: TcxLabel;
    lInfo: TcxLabel;
    lDrugName: TcxLabel;
    moTagDescription: TcxMemo;
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function GetTagNoDescArray ( AMediPurchID : Integer ) : PIntegerArray;
  end;

var
  fmDrugPurchTagDetails: TfmDrugPurchTagDetails;

implementation

{$R *.DFM}

{ TfmDrugPurchTagDetails }

class function TfmDrugPurchTagDetails.GetTagNoDescArray(AMediPurchID: Integer): PIntegerArray;
var
   TempQuery : TQuery;
begin
   with TfmDrugPurchTagDetails.Create(nil) do
      try
         SetLength(Result,0);

         TempQuery := TQuery.Create(nil);
         with TempQuery do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT M.Name, MP.PurchDate, MP.PurchTagNoDesc, MP.PurchDoseRate');
               SQL.Add('FROM Medicine M');
               SQL.Add('LEFT JOIN MediPur MP ON (M.ID = MP.DrugID)');
               SQL.Add('WHERE MP.ID = :MediPurchID');
               Params[0].AsInteger := AMediPurchID;
               Open;
               try
                  First;
                  if ( RecordCount > 0 ) and ( Fields[2].AsString <> '' ) then
                     begin
                        if Fields[3].AsString <> '' then
                           lDrugName.Caption := Fields[0].AsString+ ' / '+Fields[3].AsString
                        else
                           lDrugName.Caption := Fields[0].AsString;
                        lDrugPurchDate.Caption := DateToStr(Fields[1].AsDateTime);
                        moTagDescription.Text := Fields[2].AsString;
                     end
                  else
                     Exit;
               finally
                  Close;
               end;
            finally
               Free;
            end;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmDrugPurchTagDetails.btnExitClick(Sender: TObject);
begin
   Close;
end;

end.
