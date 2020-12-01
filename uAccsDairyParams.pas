unit uAccsDairyParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxTextEdit, cxCurrencyEdit, cxContainer, cxEdit, cxLabel,
  dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar, SampleAccounts,
  DairyData, db, dbTables;

type
  TfmAccsDairyParams = class(TfmBaseForm)
    lMilkFedToCalves: TcxLabel;
    lProteinPerc: TcxLabel;
    lFatPerc: TcxLabel;
    ceMilkFedToCalves: TcxCurrencyEdit;
    ceProteinPerc: TcxCurrencyEdit;
    ceFatPerc: TcxCurrencyEdit;
    lMilkFromCoOp: TcxLabel;
    ceMilkFromCoOp: TcxCurrencyEdit;
    lTotalMilkProduced: TcxLabel;
    ceTotalMilkProduced: TcxCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure ceMilkFedToCalvesPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ceProteinPercPropertiesChange(Sender: TObject);
    procedure ceFatPercPropertiesChange(Sender: TObject);
  private
    FGetAccData : TSampleAccounts;
    FHerdID : Integer;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm ( AHerdID : Integer );
  end;

var
  fmAccsDairyParams: TfmAccsDairyParams;

implementation

{$R *.DFM}

{ TfmAccsDairyParams }

class procedure TfmAccsDairyParams.ShowTheForm ( AHerdID : Integer );
begin
   with TfmAccsDairyParams.Create(nil) do
      try
         Application.CreateForm(TfmAccsDairyParams,fmAccsDairyParams);
         FHerdID := AHerdID;
         FGetAccData := TSampleAccounts.Create(FHerdID);
         ShowModal;
      finally
         Free;
         if FGetAccData <> nil then
            FreeAndNil(FGetAccData);
      end;
end;

procedure TfmAccsDairyParams.FormShow(Sender: TObject);
begin
   inherited;

   if WinData.ProfitMonitor.Active = False then
      WinData.ProfitMonitor.Active := True;

   if WinData.ProfitMonitor.RecordCount = 0 then
      begin
         WinData.ProfitMonitor.Append;
         WinData.ProfitMonitor.FieldByName('HerdID').AsInteger := FHerdID;
         WinData.ProfitMonitor.Post;
      end;

   //ceMilkFromCoOp.Value := FGetAccData.TotalMilkSalesQuantity;
   //ceMilkFedToCalves.Value := FGetAccData.MilkFedToCalves;
   //ceTotalMilkProduced.Value := ceMilkFromCoOp.Value + ceMilkFedToCalves.Value;
   //ceProteinPerc.Value := FGetAccData.ProteinPerc;
   //ceFatPerc.Value := FGetAccData.FatPerc;
end;

procedure TfmAccsDairyParams.ceMilkFedToCalvesPropertiesChange(
  Sender: TObject);
begin
   inherited;
   ceMilkFedToCalves.PostEditValue;
   if ( ceMilkFromCoOp.EditValue > 0 ) and ( ceMilkFedToCalves.EditValue > 0 ) then
      begin
         ceTotalMilkProduced.EditValue := ( ceMilkFromCoOp.EditValue + ceMilkFedToCalves.EditValue );
         //FGetAccData.MilkFedToCalves := ceMilkFedToCalves.EditValue;
      end;
end;

procedure TfmAccsDairyParams.ceProteinPercPropertiesChange(
  Sender: TObject);
begin
   inherited;
   ceProteinPerc.PostEditValue;
   if ( ceProteinPerc.EditValue > 0 ) then
      //FGetAccData.ProteinPerc := ceProteinPerc.EditValue;
end;

procedure TfmAccsDairyParams.ceFatPercPropertiesChange(Sender: TObject);
begin
   inherited;
   ceFatPerc.PostEditValue;
   if ( ceFatPerc.EditValue > 0 ) then
      //FGetAccData.FatPerc := ceFatPerc.EditValue;
end;

procedure TfmAccsDairyParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if WinData.ProfitMonitor.Active then
      WinData.ProfitMonitor.Active := False;
   inherited;
end;

end.
