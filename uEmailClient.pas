{
   13/11/14 [V5.3 R8.9] /MK Change - Change of caption in one item rgEmailClient from Windows Live / Hotmail / Gmail to Gmail / Hotmail / Windows Live - GL Request.
}

unit uEmailClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup;

type
  TfmEmailClient = class(TForm)
    rgEmailClient: TcxRadioGroup;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    btnGMailSettings: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGMailSettingsClick(Sender: TObject);
    procedure rgEmailClientPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  fmEmailClient: TfmEmailClient;

implementation

uses KRoutines, GenTypesConst, DairyData, uMailBoxHelper;

{$R *.DFM}

procedure TfmEmailClient.FormCreate(Sender: TObject);
var
   EmailClient : string;
begin
   EmailClient := WinData.DefaultEmailClient;
   if (Trim(EmailClient) = '') then
      begin
         EmailClient := cEmailClient_MS;
         WinData.DefaultEmailClient := EmailClient;
      end;

   if EmailClient = cEmailClient_MS then
      begin
         rgEmailClient.ItemIndex := 0;
      end
   else if EmailClient = cEmailClient_GMail then
      begin
         rgEmailClient.ItemIndex := 1;
      end;
end;

procedure TfmEmailClient.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   EmailClient : string;
begin
   if ModalResult = mrOK then
      begin
         if rgEmailClient.ItemIndex = 0 then
            begin
               EmailClient := cEmailClient_MS;
            end
         else if rgEmailClient.ItemIndex = 1 then
            begin
               EmailClient := cEmailClient_GMail;
            end;
         WinData.DefaultEmailClient := EmailClient;
      end;
end;

class procedure TfmEmailClient.Execute;
begin
   with TfmEmailClient.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmEmailClient.btnGMailSettingsClick(Sender: TObject);
begin
   WinData.EditMailboxSettings;
end;

procedure TfmEmailClient.rgEmailClientPropertiesChange(Sender: TObject);
begin
   btnGMailSettings.Visible := (rgEmailClient.ItemIndex = 1);
end;

procedure TfmEmailClient.FormActivate(Sender: TObject);
begin
   btnGMailSettings.Visible := (rgEmailClient.ItemIndex = 1);
end;

end.
