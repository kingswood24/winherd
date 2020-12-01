unit uCrushAnimalReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxLabel;

type
  TfmCrushAnimalReview = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    lNatIDNum: TcxLabel;
    lFarmTag: TcxLabel;
    lDateOfWeighing: TcxLabel;
    lWeight: TcxLabel;
    cxButton1: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowAnimalReview(ATag, AFarmTag : String;
       AWeight : Double; AWeighingDate : TDateTime);
  end;



var
  fmCrushAnimalReview: TfmCrushAnimalReview;

implementation

{$R *.DFM}

{ TfmCrushAnimalReview }

{ TfmCrushAnimalReview }

class procedure TfmCrushAnimalReview.ShowAnimalReview(ATag, AFarmTag : String;
   AWeight : Double; AWeighingDate : TDateTime);
begin

   with TfmCrushAnimalReview.Create(nil) do
     try
        lFarmTag.Caption := AFarmTag;
        lNatIDNum.Caption := ATag;
        try
        lWeight.Caption := FloatToStrF(AWeight,ffFixed,8,2) + 'Kgs';
        except
        end;
        try
        lDateOfWeighing.Caption := FormatDateTime('dd/mm/yyyy', AWeighingDate);
        except
        end;
        ShowModal;
     finally
        Free;
     end;
end;

end.
