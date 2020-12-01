{

  28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow auto login if the prefix and pin have been previously stored

  22/01/16 [V5.5 R2.3] /MK Change - HUKI have a redirect problem with their URL so I need to change the URL to dairyfacts.co.uk.
}

unit uHUKIRegistrationLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uHUKIRegistrationXMLHTTP, MSXML2_TLB, OleServer, ComObj, ExtCtrls,
  StdCtrls, cxButtons, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit;

const
   cCALFREG_SOCIETY_HUKI = 1;
   cCALFREG_SOCIETY_JERSEY = 2;
   cCALFREG_SOCIETY_BELGIANBLUE = 3;
   cCALFREG_SOCIETY_GUERSEY = 4;
   cCALFREG_SOCIETY_SIMMENTAL = 8;

type
  THUKIRegistrationLogin = class(TForm)
    teHerdPrefix: TcxTextEdit;
    teSecurityPin: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnLogin: TcxButton;
    Bevel1: TBevel;
    lErrorCode: TLabel;
    lErrorMsg: TLabel;
    Bevel2: TBevel;
    pStatus: TPanel;
    Label1: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FResult : Boolean;
    MyDOMDocument : IXMLDOMDocument;
    MyXMLHTTP     : IXMLHTTPRequest;
    FSociety : Integer;
    FMemberHerdPrefix,
    FMemberSecurityPin,
    FProgramsId : String;
    function GetLoginParamStr : string;
    procedure ProccessOutput;
    procedure LoadParams;
    procedure SaveParams;
    procedure Login;
  public
    { Public declarations }
   class function CalfRegistrationLogin : Boolean;
  end;

var
  HUKIRegistrationLogin: THUKIRegistrationLogin;
  HUKILoginVerified : Boolean;

const
   cDEFAULT_CALFREG_SOCIETY = cCALFREG_SOCIETY_HUKI;

implementation
uses
   kRoutines, GenTypesConst, DairyData;

{$R *.DFM}

{ THUKIRegistrationLogin }

class function THUKIRegistrationLogin.CalfRegistrationLogin : Boolean;
begin
   Result := False;

   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;
      
   with THUKIRegistrationLogin.Create(nil) do
      try
         LoadParams;
         ShowModal;
         Result := FResult;
      finally
         Free;
      end;
end;

function THUKIRegistrationLogin.GetLoginParamStr: string;
begin
//  Test Server Result := Format('http://195.153.22.94/calfregistration/login.asp?UPID=%s&Society=%d&Prefix=%s&PIN=%s&APPID=%s',
  //                  [ 'KINGS', FSociety , FMemberHerdPrefix, FMemberSecurityPin , FProgramsId ] );
   Result := Format('http://'+HUKINewServerIPAdd+'/calfregistration/login.asp?UPID=%s&Society=%d&Prefix=%s&PIN=%s&APPID=%s',
                    [ 'KINGS', FSociety , FMemberHerdPrefix, FMemberSecurityPin , FProgramsId ] );

end;

procedure THUKIRegistrationLogin.ProccessOutput;
begin
end;

procedure THUKIRegistrationLogin.LoadParams;
begin
   GetRegValue('SOFTWARE\Kingswood\Herd\HUKI', 'MemberHerdPrefix', FMemberHerdPrefix);
   teHerdPrefix.Text := FMemberHerdPrefix;
   GetRegValue('SOFTWARE\Kingswood\Herd\HUKI', 'MemberSecurityPin', FMemberSecurityPin);
   teSecurityPin.Text := FMemberSecurityPin;
   FSociety := cDEFAULT_CALFREG_SOCIETY;
   FProgramsId := 'xxx';
end;

procedure THUKIRegistrationLogin.SaveParams;
begin
   FMemberHerdPrefix := teHerdPrefix.Text;
   SetRegValue('SOFTWARE\Kingswood\Herd\HUKI', 'MemberHerdPrefix', FMemberHerdPrefix);
   FMemberSecurityPin := teSecurityPin.Text;
   SetRegValue('SOFTWARE\Kingswood\Herd\HUKI', 'MemberSecurityPin', FMemberSecurityPin);
end;

procedure THUKIRegistrationLogin.Login;
var
   XMLResponse : WideString;
   XMLDOMNode : IXMLDOMNode;
   HUKIResponseValue : Integer;
   HUKIResponseText : String;
   i : Integer;
   LoginParamStr : String;
begin
   FResult := False;

   SaveParams;
   LoadParams;
   LoginParamStr := GetLoginParamStr;

   MyXMLHTTP := CreateOleObject('MSXML2.XMLHTTP.3.0') as IXMLHTTPRequest;
   MyXMLHTTP.open('POST', LoginParamStr, FALSE, EmptyParam, EmptyParam);
   MyXMLHTTP.Send(EmptyParam);

   if ( MyXMLHTTP.Status = 200 ) then
      XMLResponse := MyXMLHTTP.responseText
   else
      begin
         lErrorCode.Caption := 'Error: #'+IntToStr( MyXMLHTTP.Status );
         lErrorMsg.Caption := MyXMLHTTP.statusText;
         Height := 258;
      end;

   HUKIResponseValue := -1;
   HUKIResponseText := '';

   MyDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   MyDOMDocument.async := False;

   if ( XMLResponse <> '' ) then
      begin
         MyDOMDocument.loadXML(XMLResponse);
         if ( MyDOMDocument.documentElement.childNodes.Get_length > 0 ) then
            begin
               for i := 0 to MyDOMDocument.documentElement.childNodes.Get_length-1 do
                  begin
                     if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'RC' then
                        begin
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].attributes.getNamedItem('VALUE');
                           try
                              HUKIResponseValue := StrToInt(XMLDOMNode.text);
                           except
                           end;
                        end
                     else if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'STRMSG' then
                        begin
                           XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].attributes.getNamedItem('VALUE');
                           try
                              HUKIResponseText := XMLDOMNode.text;
                           except
                           end;
                        end;
                  end;
            end;
         end;

   if HUKIResponseValue <> 0 then
      begin
         lErrorCode.Caption := 'Error: #'+IntToStr( HUKIResponseValue );
         lErrorMsg.Caption := HUKIResponseText;
         Height := 258;
      end
   else
      begin
         FResult := True;
         HUKILoginVerified := True;
         PostMessage(Handle, WM_CLOSE,0,0);
      end;
end;

procedure THUKIRegistrationLogin.btnLoginClick(Sender: TObject);
begin
   teHerdPrefix.PostEditValue;
   teSecurityPin.PostEditValue;
   Login;
end;

procedure THUKIRegistrationLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   SaveParams;
end;

procedure THUKIRegistrationLogin.FormActivate(Sender: TObject);
begin
   // 28/01/2009 [V3.9 R5.8] /SP
   if ((teHerdPrefix.Text <> '') and (teSecurityPin.Text <> '')) then
      begin
         pStatus.Visible := True;
         Update;
         //btnLogin.Enabled := False;
         Login;
         if not FResult then
            begin
               teHerdPrefix.Text := '';
               teSecurityPin.Text := '';
               teHerdPrefix.PostEditValue;
               teSecurityPin.PostEditValue;
               SaveParams;
            end;
      end
   else
      begin
         pStatus.Visible := False;
         Update;
         Login;
      end;
end;

initialization
   HUKILoginVerified := False;
end.
