unit FertilityAnalysisUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFertilityAnalysisForm = class(TForm)
    pExitReports: TPanel;
    ExitButton: TBitBtn;
    bHelp: TBitBtn;
    GroupBox1: TGroupBox;
    ActionRemindRadio: TRadioButton;
    RadioButton2: TRadioButton;
    HeatServiceListing: TRadioButton;
    BovineHerdRegRadio: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton7: TRadioButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure HeatServiceListingMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionRemindRadioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FertilityAnalysisForm: TFertilityAnalysisForm;

implementation
uses
    ActionReminderUnit,
    FertilityAnalysisFilt;

{$R *.DFM}

procedure TFertilityAnalysisForm.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TFertilityAnalysisForm.HeatServiceListingMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     FertilityAnalysisFilter.Caption := 'Heats / Services Listing';
     FertilityAnalysisFilter.Show;
     FertilityAnalysisFilter.pHeatServiceListing.Show;     
end;

procedure TFertilityAnalysisForm.ActionRemindRadioMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
     ActionReminderForm.Show;
end;

end.
