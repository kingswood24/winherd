unit uCTSLoginInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxContainer, cxEdit, cxCheckBox, StdCtrls, cxButtons, cxPC, cxControls,
  inifiles, cxTextEdit, cxGroupBox,uCTSLoginData;

type
  TfmCTSLoginInfo = class(TForm)
    PageControl: TcxPageControl;
    tsCTSUserSetup: TcxTabSheet;
    tsSISUserSetup: TcxTabSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    gbCTSUser: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    teCTSUsername: TcxTextEdit;
    teCTSPassword: TcxTextEdit;
    teCTSConfirmPassword: TcxTextEdit;
    gbSISUser: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    teSISUsername: TcxTextEdit;
    teSISEmailAddress: TcxTextEdit;
    cbCTSDefault: TcxCheckBox;
    cbSISDefault: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbSISDefaultClick(Sender: TObject);
    procedure cbCTSDefaultClick(Sender: TObject);
  private
    { Private declarations }
    IniFile : TIniFile;
    CTSLoginData : TCTSLoginData;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  fmCTSLoginInfo: TfmCTSLoginInfo;

implementation

uses KRoutines;

{$R *.DFM}

procedure TfmCTSLoginInfo.FormCreate(Sender: TObject);
var
   DefaultLoginMethod : string;
begin
   CTSLoginData := TCTSLoginData.Create;

   teSISUsername.Text :=  CTSLoginData.SISUsername;
   teSISEmailAddress.Text := CTSLoginData.SISEmailAddress;
   teCTSUsername.Text := CTSLoginData.CTSUsername;
   teCTSPassword.Text := CTSLoginData.CTSPassword;

   DefaultLoginMethod := CTSLoginData.LoginType;
   if DefaultLoginMethod = cLoginType_SIS then
      begin
         cbCTSDefault.Checked := False;
         cbSISDefault.Checked := True;
      end
   else
      begin
         cbSISDefault.Checked := False;
         cbCTSDefault.Checked := True;
      end;
end;

procedure TfmCTSLoginInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ModalResult = mrOk then
      begin
         CTSLoginData.SISUsername := Trim(teSISUsername.Text);
         CTSLoginData.SISEmailAddress := Trim(teSISEmailAddress.Text);
         CTSLoginData.CTSUsername := Trim(teCTSUsername.Text);
         CTSLoginData.CTSPassword := Trim(teCTSPassword.Text);


         if cbSISDefault.Checked then
            CTSLoginData.LoginType := cLoginType_SIS
         else
            CTSLoginData.LoginType := cLoginType_CTS;
      end;
   FreeAndNil(CTSLoginData);
end;

procedure TfmCTSLoginInfo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if ModalResult = mrOK then
      begin
         if (Trim(teCTSPassword.Text) <> '') and (Trim(teCTSConfirmPassword.Text) <> '') then
            begin
               if ( Trim(teCTSPassword.Text) <> Trim(teCTSConfirmPassword.Text) ) then
                  begin
                     CanClose := False;
                     teCTSConfirmPassword.Text := '';
                     MessageDlg('CTS password conflict. Please enter correct password.',mtError,[mbOK],0);
                  end;
            end;
      end;
end;

procedure TfmCTSLoginInfo.cbSISDefaultClick(Sender: TObject);
begin
   if cbSISDefault.State = cbsChecked then
      cbCTSDefault.State := cbsUnchecked;
end;

procedure TfmCTSLoginInfo.cbCTSDefaultClick(Sender: TObject);
begin
   if cbCTSDefault.State = cbsChecked then
      cbSISDefault.State := cbsUnchecked;
end;

class procedure TfmCTSLoginInfo.Execute;
begin
   with TfmCTSLoginInfo.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;

end;

end.
