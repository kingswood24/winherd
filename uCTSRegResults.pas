unit uCTSRegResults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxControls, cxContainer, cxListBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Db, DBTables,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxEdit, cxLabel;

type
  TCTSResultType = (rtBirth, rtMovement);
  TfmCTSRegResults = class(TForm)
    cxButton1: TcxButton;
    RejectionGridTableView: TcxGridDBTableView;
    RejectionGridLevel: TcxGridLevel;
    RejectionGrid: TcxGrid;
    RejectionGridTableViewID: TcxGridDBColumn;
    RejectionGridTableViewAnimalID: TcxGridDBColumn;
    RejectionGridTableViewTxnId: TcxGridDBColumn;
    RejectionGridTableViewCode: TcxGridDBColumn;
    RejectionGridTableViewDesc: TcxGridDBColumn;
    RejectionGridTableViewSev: TcxGridDBColumn;
    RejectionGridTableViewField: TcxGridDBColumn;
    AnimalLabel: TcxLabel;
    cxLabel1: TcxLabel;
    procedure RejectionGridTableViewSevGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DisplayRejectionResults(ACTSResultType : TCTSResultType; ANatID : String; AAnimalID, ABatchID : Integer);
  end;

var
  fmCTSRegResults: TfmCTSRegResults;

implementation

uses GenTypesConst, uCTSHelper;

{$R *.DFM}

{ TForm1 }

class procedure TfmCTSRegResults.DisplayRejectionResults(
  ACTSResultType: TCTSResultType; ANatID : String; AAnimalID, ABatchID : Integer);
var
   QueryCTSRejection : TQuery;
   dsQueryCTSRejection : TDataSource;
   RegType : string;
begin

   with TfmCTSRegResults.Create(nil) do
      try
         QueryCTSRejection := TQuery.Create(nil);
         QueryCTSRejection.DatabaseName := AliasName;

         dsQueryCTSRejection := TDataSource.Create(nil);
         dsQueryCTSRejection.DataSet :=  QueryCTSRejection;
         RejectionGridTableView.DataController.DataSource := dsQueryCTSRejection;

         try
            with QueryCTSRejection do
               begin
                  if (ACTSResultType = rtBirth) then
                     begin
                        SQL.Add('Select * from CTSRejected');
                        SQL.Add('Where AnimalID =:Animal');
                        SQL.Add('And CTSBatchId=:CTSBatchId');
                        SQL.Add('And RejectType=:RejectType');
                        RegType := 'Birth';
                     end
                  else if (ACTSResultType = rtMovement) then
                     begin
                        SQL.Add('Select * from CTSRejected');
                        SQL.Add('Where AnimalID =:Animal');
                        SQL.Add('And CTSBatchId=:CTSBatchId');
                        SQL.Add('And RejectType=:RejectType');
                        RegType := 'Movement';
                     end;
                  Params[0].AsInteger := AAnimalID;
                  Params[1].AsInteger := ABatchID;
                  if (ACTSResultType = rtBirth) then
                     Params[2].AsInteger := cRequestType_Births
                  else
                     Params[2].AsInteger := cRequestType_Movements;
                  Open;
               end;
            if (ACTSResultType = rtBirth) then
               AnimalLabel.Caption := Format(AnimalLabel.Caption, ['birth', ANatID])
            else
               AnimalLabel.Caption := Format(AnimalLabel.Caption, ['movement', ANatID]);

            Caption := Format('CTS %s Registration Results - %s',[RegType,ANatID]);
            ShowModal;
         finally
            QueryCTSRejection.Close;
            FreeAndNil(QueryCTSRejection);
            FreeAndNil(dsQueryCTSRejection);
         end;
      finally
         Free;
      end;
end;


procedure TfmCTSRegResults.RejectionGridTableViewSevGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if uppercase(AText) = 'W' then
      AText := 'Warning'
   else if uppercase(AText) = 'E' then
      AText := 'Error'
   else
      AText := 'Unknown';
end;

end.
