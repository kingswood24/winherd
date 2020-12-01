unit ClearHerdPassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfmClearHerdPassword = class(TForm)
    pClearPass: TPanel;
    Label4: TLabel;
    ClearPass: TEdit;
    Button3: TButton;
    Button4: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class Function ClearPassword(ThisPass : String) : Boolean;
  end;

var
  fmClearHerdPassword: TfmClearHerdPassword;

implementation

{$R *.DFM}

{ TfmClearHerdPassword }

class function TfmClearHerdPassword.ClearPassword(ThisPass : String): Boolean;
begin

   with TfmClearHerdPassword.Create(nil) do
      try
         Result := False;
         if ShowModal = mrOK then
            Result := ( ClearPass.Text = ThisPass );
      finally
         Free;
      end;
end;

end.

