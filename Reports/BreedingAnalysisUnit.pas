unit BreedingAnalysisUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TBreedingAnalysisForm = class(TForm)
    pExitReports: TPanel;
    ExitButton: TBitBtn;
    bHelp: TBitBtn;
    GroupBox1: TGroupBox;
    BestCowsInHerdRadio: TRadioButton;
    BestCowsOnFileRadio: TRadioButton;
    SireComparisonsRadio: TRadioButton;
    CowFamilyRadio: TRadioButton;
    DamComparisonsRadio: TRadioButton;
    SelectedCowsRadio: TRadioButton;
    SelectedCowsByIndicesRadio: TRadioButton;
    CowAncestryReportRadio: TRadioButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure BestCowsInHerdRadioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BreedingAnalysisForm: TBreedingAnalysisForm;

implementation
Uses
     BreedingAnalysisFilt;

{$R *.DFM}

procedure TBreedingAnalysisForm.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TBreedingAnalysisForm.BestCowsInHerdRadioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     BreedingAnalysisFilter.Caption := 'Best Cows In Herd';
     BreedingAnalysisFilter.pBestCowsInHerd.Visible := True;
     BreedingAnalysisFilter.pBestCowsInHerd.Enabled := True;
     BreedingAnalysisFilter.Show;
end;

end.
