unit uMedNullGroupVetRegWarning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  uAnimalRemedyData, uMedicinesNullGroup;

type
  TfmMedNullGroupVetRegWarning = class(TForm)
    pInfoTreatWithMedNoGroup: TPanel;
    lInfo: TcxLabel;
    btnContinue: TcxButton;
    btnFix: TcxButton;
    procedure btnFixClick(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
  private
    FAnimalRemedyData : TAnimalRemedyData;
    FCloseWarning : Boolean;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm (var ACloseWarning : Boolean);
  end;

var
  fmMedNullGroupVetRegWarning: TfmMedNullGroupVetRegWarning;

implementation

{$R *.DFM}

{ TfmMedNullGroupVetRegWarning }

class procedure TfmMedNullGroupVetRegWarning.ShowTheForm (var ACloseWarning : Boolean);
begin
   with TfmMedNullGroupVetRegWarning.Create(nil) do
      try
         ShowModal;
      finally
         ACloseWarning := FCloseWarning;
         Free;
      end;
end;

procedure TfmMedNullGroupVetRegWarning.btnFixClick(Sender: TObject);
begin
   TfmMedicinesNullGroup.ShowTheForm(False);
   if ( FAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal = 0 ) then
      btnContinueClick(Sender);
end;

procedure TfmMedNullGroupVetRegWarning.btnContinueClick(Sender: TObject);
begin
   FCloseWarning := True;
   Close;
end;

end.
