unit CowReportsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TCowReportsForm = class(TForm)
    pExitReports: TPanel;
    ExitButton: TBitBtn;
    bHelp: TBitBtn;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BovineHerdRegRadio: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure BovineHerdRegRadioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CowReportsForm: TCowReportsForm;

implementation
uses
    CowRepFilt;

{$R *.DFM}

procedure TCowReportsForm.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TCowReportsForm.BovineHerdRegRadioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        CowRepFilter.show;
        CowRepFilter.Caption := 'Bovine Herd Register';
        CowRepfilter.pBovineHerdReg.Show;
end;

end.
