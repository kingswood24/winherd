unit ActionReminderUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TActionReminderForm = class(TForm)
    pExitReports: TPanel;
    ExitButton: TBitBtn;
    bHelp: TBitBtn;
    GroupBox1: TGroupBox;
    FullActionRemindRadio: TRadioButton;
    DueToCalveRadio: TRadioButton;
    DueForDryingRadio: TRadioButton;
    BovineHerdRegRadio: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure DueToCalveRadioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DueForDryingRadioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RadioButton6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActionReminderForm: TActionReminderForm;

implementation
uses
    ActionReminderFilt;

{$R *.DFM}

procedure TActionReminderForm.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TActionReminderForm.DueToCalveRadioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     ActionReminderFilter.Show;
     ActionReminderFilter.pDueForDryingOff.Hide;
     ActionReminderFilter.pDueFirstService.Hide;
     ActionReminderFilter.pDueToCalve.Show;
     ActionReminderFilter.Caption := 'Due To Calve';
end;

procedure TActionReminderForm.DueForDryingRadioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     ActionReminderFilter.Show;
     ActionReminderFilter.pDueFirstService.Hide;
     ActionReminderFilter.pDueToCalve.Hide;
     ActionReminderFilter.pDueForDryingOff.Show;
     ActionReminderFilter.Caption := 'Due For Drying Off';
end;

procedure TActionReminderForm.RadioButton6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     ActionReminderFilter.Show;
     ActionReminderFilter.pDueForDryingOff.Hide;
     ActionReminderFilter.pDueToCalve.Hide;
     ActionReminderFilter.pDueFirstService.Show;
     ActionReminderFilter.Caption := 'Due First Service';
end;

end.
