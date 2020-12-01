unit HUKICalfRegErrorReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, StdCtrls, cxButtons;

type
  TfmHUKICalfRegErrorReview = class(TForm)
    cxMemo1: TcxMemo;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddError(Code : Integer; ErrorMessage : String);
  end;

var
  fmHUKICalfRegErrorReview: TfmHUKICalfRegErrorReview;

implementation

{$R *.DFM}

procedure TfmHUKICalfRegErrorReview.AddError(Code: Integer; ErrorMessage: String);
begin
   cxMemo1.Lines.Add('Error Code: ' + IntToStr(Code));
   cxMemo1.Lines.Add('Error Message: ' + ErrorMessage);
   cxMemo1.Lines.Add(#13#10);
end;

procedure TfmHUKICalfRegErrorReview.FormCreate(Sender: TObject);
begin
   cxMemo1.Lines.Clear;
end;

procedure TfmHUKICalfRegErrorReview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
