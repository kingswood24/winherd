unit BullReportsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TBullReportsForm = class(TForm)
    gBullReports: TGroupBox;
    BrowseSireRegisterRadio: TRadioButton;
    HerdStatisticsRadio: TRadioButton;
    BullsUsedInHerdRadio: TRadioButton;
    pExitReports: TPanel;
    bExit: TBitBtn;
    bHelp: TBitBtn;
    procedure bExitClick(Sender: TObject);
    procedure BullsUsedInHerdRadioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BrowseSireRegisterRadioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BullReportsForm: TBullReportsForm;

implementation
uses
    BullReportsFilt;

{$R *.DFM}

procedure TBullReportsForm.bExitClick(Sender: TObject);
begin
     Close;
end;

procedure TBullReportsForm.BullsUsedInHerdRadioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     BullReportsFilter.Caption := 'Bulls Used In Herd';
     BullReportsFilter.Show;
     BullReportsFilter.pSireSelection.Hide;     
     BullReportsFilter.pBullsInHerd.Show;
end;

procedure TBullReportsForm.BrowseSireRegisterRadioMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
     BullReportsFilter.Caption := 'Sire Register';
     BullReportsFilter.Show;
     BullReportsFilter.pBullsInHerd.Hide;
     BullReportsFilter.pSireSelection.Show;
end;

end.
