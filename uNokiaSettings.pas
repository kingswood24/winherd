unit uNokiaSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, StdCtrls, RXSpin, RXCtrls, ExtCtrls, IniFiles,
  Mask, ToolEdit, CurrEdit, SMSComp, ComCtrls, kRoutines;

type
  ComError = Exception;
  TfmNokiaSettings = class(TForm)
    Bevel1: TBevel;
    TestConnection: TRxSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    ConnectMode: TComboBox;
    COM: TComboBox;
    RxSpeedButton1: TRxSpeedButton;
    SMS: TOxygenSMS;
    StatusBar1: TStatusBar;
    procedure TestConnectionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure COMChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure ConnectModeChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    IniFileName : String;
    sStrings : TStringList;
    IniFile : TIniFile;
    COMPort : Byte;
    ConnectionType : Byte;
    ChangesMade : Boolean;
    procedure SaveSettings;
    procedure CreateSettingFile;

  public
    //HideConnectButton : Boolean;
    { Public declarations }
  end;

var
  fmNokiaSettings: TfmNokiaSettings;

const
   ConnectionClosed = 0;
   ConnectionOpen   = 1;
   ConnectionBusy   = 2;

implementation
uses
   GenTypesConst;

{$R *.DFM}

procedure TfmNokiaSettings.TestConnectionClick(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := 'Attempting connection...';
   SMS.ComNumber := COM.ItemIndex+1;
   SMS.ConnectionMode := ConnectMode.ItemIndex;
   try
      if SMS.Open then
         begin
            if SMS.State = ConnectionOpen then
               begin
                  SMS.Close; // Com port is open, close it.
                  StatusBar1.Panels[0].Text := 'Connection successful';
                  MessageDlg('Nokia Phone Link : Connection successful!',mtInformation,[mbOK],0);
               end
            else if SMS.State = ConnectionBusy then
               begin
                  SMS.Close; // Com port is open, close it.
                  StatusBar1.Panels[0].Text := 'COM Port is busy. ';
                  MessageDlg('Can establish control of COM port '+IntToStr(SMS.ComNumber)+', port is busy',mtInformation,[mbOK],0);
               end;
         end
      else
         begin
            SMS.Close; // Com port is open, close it.
            StatusBar1.Panels[0].Text := 'Connection failed';
            if MessageDlg('Nokia Phone Link : Connection failed!',mtInformation,[mbOK, mbRetry],0) = idRetry then
               TestConnectionClick(self);
         end;
   except
      raise ComError.Create('Unable to establish a connection');
   end;
end;

procedure TfmNokiaSettings.FormCreate(Sender: TObject);
var
  x : integer;
begin
   sStrings := TStringList.Create;
   IniFileName := IniDir + cPhoneLinkIniFile;
   if not FileExists(IniFileName) then
      CreateSettingFile
   else
      begin
         IniFile := TIniFile.Create(IniFileName);
         COM.ItemIndex := IniFile.ReadInteger(IniNokia, IniComPort, -1) - 1;
         ConnectMode.ItemIndex := IniFile.ReadInteger(IniNokia, IniNokiaConnectionType, 1);
      end;
   ChangesMade := False;
   StatusBar1.Panels[0].Text := '';
end;

procedure TfmNokiaSettings.SaveSettings;
begin
   sStrings.Clear;
   IniFile.WriteInteger(IniNokia, IniComPort, COM.ItemIndex+1);
   IniFile.WriteInteger(IniNokia, IniNokiaConnectionType, ConnectMode.ItemIndex);
end;

procedure TfmNokiaSettings.CreateSettingFile;
begin
   IniFile := TIniFile.Create(IniFileName);
   sStrings.Clear;
   sStrings.Append('['+IniNokia+']');
   sStrings.Append(#13);
   sStrings.Append(IniComPort+'=1');
   sStrings.Append(IniNokiaConnectionType+'=1');
   sStrings.Append(#13);
   sStrings.Append('['+IniSiemens+']');
   sStrings.Append(IniComPort+'=1');
   sStrings.SaveToFile(IniFileName);
end;

procedure TfmNokiaSettings.COMChange(Sender: TObject);
begin
   ChangesMade := True;
end;

procedure TfmNokiaSettings.FormDestroy(Sender: TObject);
begin
   IniFile.Free;
   sStrings.Free;
end;

procedure TfmNokiaSettings.RxSpeedButton1Click(Sender: TObject);
begin
//   ModalResult := mrOk;
end;

procedure TfmNokiaSettings.ConnectModeChange(Sender: TObject);
begin
   ChangesMade := True;
end;

procedure TfmNokiaSettings.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (( ChangesMade ) and ( MessageDlg('Do you want to save these settings',mtInformation,[mbYes,mbNo],0) = mrYes )) then
      SaveSettings;
end;

procedure TfmNokiaSettings.FormShow(Sender: TObject);
begin
{   if HideConnectButton then
      TestConnection.Hide;
}
end;

end.