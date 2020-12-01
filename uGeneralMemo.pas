unit uGeneralMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, ExtCtrls, StdCtrls,
  cxButtons;

type
  TMemoType = (mtInvalidGrades, mtBCMSRec, mtRepeatVaccine);

  TfmGeneralMemo = class(TForm)
    pMemoBox: TPanel;
    pBottomBar: TPanel;
    Memo: TcxMemo;
    btnClose: TcxButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm (AMemo : TStringList; AMemoType : TMemoType);
  end;

var
  fmGeneralMemo: TfmGeneralMemo;

implementation

{$R *.DFM}

{ TfmGeneralMemo }

class procedure TfmGeneralMemo.ShowTheForm (AMemo : TStringList; AMemoType : TMemoType);
var
   i : Integer;
begin
   with TfmGeneralMemo.Create(nil) do
      try
         case AMemoType of
            mtInvalidGrades : Caption := 'Invalid Grades';
            mtBCMSRec : Caption := 'BCMS Block Update';
            mtRepeatVaccine : Caption := 'Repeat Vaccination Events';
         end;
         Memo.Clear;
         for i := 0 to AMemo.Count-1 do
            Memo.Lines.Add(AMemo.Strings[i]);
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmGeneralMemo.btnCloseClick(Sender: TObject);
begin
   Close;
end;

end.
