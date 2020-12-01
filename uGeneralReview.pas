unit uGeneralReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxLabel;

type
  TReviewType = (rtGroups, rtAIMHerdRec);
  TfmGeneralReview = class(TForm)
    pBottom: TPanel;
    btnClose: TcxButton;
    btnIgnoreErrors: TcxButton;
    mReview: TcxMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnIgnoreErrorsClick(Sender: TObject);
  private
    { Private declarations }
    FIgnoreErrors : Boolean;
  public
    { Public declarations }
    class procedure ShowTheForm (AReviewType : TReviewType; AReviewList : TStringList;
       var AIgnoreErrors : Boolean; const AHasErrors : Boolean = False);
  end;

var
  fmGeneralReview: TfmGeneralReview;

implementation

{$R *.DFM}

class procedure TfmGeneralReview.ShowTheForm (AReviewType : TReviewType; AReviewList : TStringList;
   var AIgnoreErrors : Boolean; const AHasErrors : Boolean = False);
var
   i : Integer;
begin
   with TfmGeneralReview.Create(nil) do
      try
         mReview.Lines.Clear;
         mReview.Lines.Add('');
         for i := 0 to AReviewList.Count-1 do
            mReview.Lines.Add(AReviewList.Strings[i]);
         case AReviewType of
            rtGroups : begin
                          Caption := 'Review Groups';
                          btnIgnoreErrors.Caption := 'Move Animals';
                       end;
            rtAIMHerdRec : Caption := 'Herd Rec. Ignored Animals';
         end;
         btnIgnoreErrors.Visible := AHasErrors;
         ShowModal;
         AIgnoreErrors := FIgnoreErrors;
      finally
         Free;
      end;
end;

procedure TfmGeneralReview.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmGeneralReview.btnIgnoreErrorsClick(Sender: TObject);
begin
   FIgnoreErrors := True;
   Close;
end;

end.
