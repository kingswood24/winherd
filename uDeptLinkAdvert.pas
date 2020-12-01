{
   01/07/14 [V5.3 R3.0] /MK Change - Allow screen to show even if preference to not show is on
                                     for Email Calf Reg button change in MenuUnit.
                                   - Added more text to tell user that email Calf Reg has been discontinued.

   21/10/14 [V5.3 R7.7] /MK Change - Changed to labels - GL Request.

   21/10/14 [V5.3 R8.1] /MK Change - More changes to labels - GL Request.
}

unit uDeptLinkAdvert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxCheckBox, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls;

type
  TfmDeptLinkAdvert = class(TForm)
    btnClose: TcxButton;
    Bevel1: TBevel;
    cxLabel4: TcxLabel;
    Image1: TImage;
    Image2: TImage;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel2: TcxLabel;
    lLink: TcxLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure cxLabel3Click(Sender: TObject);
    procedure lLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Show ( const AIgnorePreference : Boolean = False );
  end;

var
  fmDeptLinkAdvert: TfmDeptLinkAdvert;

implementation

uses uPreferences, Drawing, KRoutines;

{$R *.DFM}

{ TfmOnlineAppAdvert }

class procedure TfmDeptLinkAdvert.Show ( const AIgnorePreference : Boolean = False );
var
   bShowForm : Boolean;
begin
   bShowForm := Preferences.ValueAsBoolean[cGSDeptLinkDisplay] = True;
   if ( (not(bShowForm)) and (not(AIgnorePreference)) ) then Exit;

   with TfmDeptLinkAdvert.Create(nil) do
      try
         ShowModal;
         //Preferences.ValueAsBoolean[cGSDeptLinkDisplay] := not cbShowOnProgramStartup.Checked;
      finally
         Free;
      end;
end;

procedure TfmDeptLinkAdvert.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmDeptLinkAdvert.FormPaint(Sender: TObject);
begin
   GradVertical(Canvas, ClientRect, clGreen, $0038AF53);
end;

procedure TfmDeptLinkAdvert.cxLabel3Click(Sender: TObject);
begin
   OpenUrl('https://www.agriculture.gov.ie/ssoauthagfood/individual.jsp');
end;

procedure TfmDeptLinkAdvert.lLinkClick(Sender: TObject);
begin
   OpenUrl('http://www.kingswoodcomputing.com/assets/media/images/AIMLinkMessage.jpg');
end;

end.
