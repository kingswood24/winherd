unit uProgressIndicator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TProgressIndicator = class(TForm)
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetProgressValues(const MinValue, MaxValue, Step : Integer);
    procedure SetPosition(const Pos: Integer);
    function GetPosition: Integer;
    function GetMax: Integer;
    procedure SetMax(const Value: Integer);
  public
    { Public declarations }
    procedure StepIt(const StepBy : Integer = 1);
    property Position : Integer read GetPosition write SetPosition;
    property Max : Integer read GetMax write SetMax;
  end;

  procedure ShowProgressIndicator(const FormCaption : string; const MinValue, MaxValue, Step  : Integer);

var
  ProgressIndicator: TProgressIndicator;

implementation

{$R *.DFM}

  procedure ShowProgressIndicator(const FormCaption : string; const MinValue, MaxValue, Step  : Integer);
  begin
     Application.CreateForm(TProgressIndicator, ProgressIndicator);
     try
        ProgressIndicator.Caption := FormCaption;
        ProgressIndicator.SetProgressValues(MinValue, MaxValue, Step);
        ProgressIndicator.Show;
     except
        FreeAndNil(ProgressIndicator);
        MessageDlg('Cannot create progress indicator',mtError,[mbOK],0);
     end;
  end;

{ TProgressIndicator }

procedure TProgressIndicator.SetProgressValues(const MinValue, MaxValue, Step: Integer);
begin
   ProgressBar1.Min := MinValue;
   ProgressBar1.Max := MaxValue;
   ProgressBar1.Step := Step;
end;

procedure TProgressIndicator.StepIt(const StepBy: Integer);
begin
   ProgressBar1.StepBy(StepBy);
   if ((ProgressBar1.Position mod 5) = 0 ) then
      Application.ProcessMessages;
end;

procedure TProgressIndicator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TProgressIndicator.FormShow(Sender: TObject);
begin
{
   Top := (Application.MainForm.ClientHeight - ( Height + 40 ));
   Left := (Application.MainForm.ClientWidth - ( Width + 80))
}

end;


procedure TProgressIndicator.SetPosition(const Pos: Integer);
begin
   ProgressBar1.Position := Pos;
   if Pos = 0 then
      Update;
end;

function TProgressIndicator.GetPosition: Integer;
begin
   Result := ProgressBar1.Position;
end;

function TProgressIndicator.GetMax: Integer;
begin
   Result := ProgressBar1.Max;
end;

procedure TProgressIndicator.SetMax(const Value: Integer);
begin
   ProgressBar1.Max := Value;
end;

end.
