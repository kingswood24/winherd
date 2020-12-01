unit uSireAnalysisFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxSpinEdit, DateUtil;

type
  TfmSireAnalysisFilter = class(TForm)
    btnOK: TcxButton;
    btnCancel: TcxButton;
    lInfo: TcxLabel;
    seCalcYear: TcxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure seCalcYearPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FCurrentYear : Integer;
  public
    { Public declarations }
    class function GetWeightGainCalcYear : Integer;
  end;

var
  fmSireAnalysisFilter: TfmSireAnalysisFilter;

implementation

{$R *.DFM}

{ TfmUpdateAnimalGainPerDayMsg }

class function TfmSireAnalysisFilter.GetWeightGainCalcYear: Integer;
begin
   Result := 0;
   with TfmSireAnalysisFilter.Create(nil) do
      try
         ShowModal;
         if ( ModalResult = mrOK ) then
            Result := seCalcYear.EditValue;
      finally
         Free;
      end;
end;

procedure TfmSireAnalysisFilter.FormCreate(Sender: TObject);
begin
   FCurrentYear := ExtractYear(Date);
   seCalcYear.Properties.MaxValue := FCurrentYear;
   seCalcYear.EditValue := ( FCurrentYear - 2 );
end;

procedure TfmSireAnalysisFilter.seCalcYearPropertiesEditValueChanged(Sender: TObject);
begin
   seCalcYear.PostEditValue;
end;

end.
