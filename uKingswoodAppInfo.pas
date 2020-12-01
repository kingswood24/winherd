{
   04/12/15 [V5.5 R1.6] /MK Change - Removed link to website and changed text of lShowAppInformation - GL request. 
}

unit uKingswoodAppInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxImage, ExtCtrls, cxLabel, cxCheckBox,
  cxTextEdit, cxHyperLinkEdit, DairyData, ShellAPI;

type
  TfmKingswoodAppInfo = class(TForm)
    pTopPanel: TPanel;
    pBottomPanel: TPanel;
    lTopInfo: TcxLabel;
    imgKingswoodApp: TcxImage;
    lInfoLabel: TcxLabel;
    pBottomBar: TPanel;
    cbShowOnStartup: TcxCheckBox;
    lBottomInfo: TcxLabel;
    lShowAppInformation: TcxLabel;
    procedure cbShowOnStartupPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure ShowTheForm;
    { Public declarations }
  end;

var
  fmKingswoodAppInfo: TfmKingswoodAppInfo;

implementation

{$R *.DFM}

{ TfmKingswoodAppInfo }

class procedure TfmKingswoodAppInfo.ShowTheForm;
begin
   with TfmKingswoodAppInfo.Create(nil) do
      try
         ShowModal;
      finally
         Free
      end;
end;

procedure TfmKingswoodAppInfo.cbShowOnStartupPropertiesChange(Sender: TObject);
begin
   WinData.GlobalSettings.DisplayKingswoodAppInfoScreen := ( not(cbShowOnStartup.Checked) );
   WinData.SavePreferences;
   if ( cbShowOnStartup.Checked ) then
      Close;
end;

end.
