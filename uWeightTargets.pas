unit uWeightTargets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxDBEdit, cxLabel,
  DairyData, dxBarDBNav, GenTypesConst, cxCheckBox;

type
  TfmWeightTargets = class(TfmBaseForm)
    dbceBirthTarget: TcxDBCurrencyEdit;
    dbce6WeekTarget: TcxDBCurrencyEdit;
    dbce3MonthTarget: TcxDBCurrencyEdit;
    dbce6MonthTarget: TcxDBCurrencyEdit;
    dbce12MonthTarget: TcxDBCurrencyEdit;
    dbce15MonthTarget: TcxDBCurrencyEdit;
    dbce21MonthTarget: TcxDBCurrencyEdit;
    dbce24MonthTarget: TcxDBCurrencyEdit;
    lBirth: TcxLabel;
    l6Weeks: TcxLabel;
    l3Months: TcxLabel;
    l6Months: TcxLabel;
    l12Months: TcxLabel;
    l15Months: TcxLabel;
    l21Months: TcxLabel;
    l24Months: TcxLabel;
    actSave: TAction;
    actCancel: TAction;
    lDailyKgWarning: TcxLabel;
    dbceDailKgWarning: TcxDBCurrencyEdit;
    blbExit: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure dbceBirthTargetPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FWeighRepOptions : TWeighRepOptions;
    procedure EnableDisableControls(AEnable : Boolean);
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmWeightTargets: TfmWeightTargets;

implementation

{$R *.DFM}

{ TfmWeightTargets }

class procedure TfmWeightTargets.ShowTheForm;
begin
   with TfmWeightTargets.Create(nil) do
      try
         if ( WinData.TargetWeights.Active ) then
            begin
               WinData.TargetWeights.Active := False;
               WinData.TargetWeights.Active := True;
            end
         else
            WinData.TargetWeights.Active := True;

         if WinData.TargetWeights.RecordCount = 0 then
            WinData.TargetWeights.Append;

         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmWeightTargets.actSaveExecute(Sender: TObject);
begin
   inherited;
   WinData.TargetWeights.Post;
   Close;
end;

procedure TfmWeightTargets.actCancelExecute(Sender: TObject);
begin
   inherited;
   WinData.TargetWeights.Cancel;
   EnableDisableControls(False);
end;

procedure TfmWeightTargets.EnableDisableControls(AEnable : Boolean);
begin
   actSave.Enabled := AEnable;
   actCancel.Enabled := AEnable;
end;

procedure TfmWeightTargets.dbceBirthTargetPropertiesChange(
  Sender: TObject);
begin
   inherited;
   EnableDisableControls(True);
end;

procedure TfmWeightTargets.FormActivate(Sender: TObject);
begin
   inherited;
   EnableDisableControls(False);
   OnActivate := nil;
end;

end.
