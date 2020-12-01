unit PhoneLink;

interface
uses
   Classes, Forms, Windows, SysUtils, Registry, ActiveX, kRoutines,
   Dialogs;

type
   TPhoneLinkMain = procedure (const AppHandle:HWND; var Result : Integer);
   TPhoneLinkSettings = procedure (Handle : HWND);
   PhoneLinkException = class(Exception);
   TPhoneLink = class
   private
      DLLHandle: THandle;
      FuncPtr: TFarProc;
      PhoneLinkMain: TPhoneLinkMain;
      PhoneLinkSettings : TPhoneLinkSettings;
      procedure Activate;
      procedure DeActivate;
      function PLRegistered : Boolean;
      function RegisterPL : Boolean;
      procedure UpdateRegistry;
   protected

   public
      constructor Create;
      destructor Destroy; override;
      procedure ShowMain(var Res : Integer);
      procedure ShowSettings;
      procedure LoadFromFile(var MessageList : TStringList);
      procedure SaveToFile;
   end;


resourcestring
   DLLFileName = 'PhoneLink.dll';
   { Phone ActiveX File }
   PhoneLinkActiveXPath = 'C:\Windows\MobileControl_rt.ocx';
   { Phone Licence File}
   PhoneLinkLicencePath = 'C:\Windows\MobileControl_rt.lic';
   { PhoneLink Output File }
   cPLNokiaMsgFile = 'C:\Kingswood Herd Management\plmsgs';
   { PhoneLink Ini File }
   PhoneLinkIniFile = 'phonelink.ini';
   { PhoneLink Stored Directory }
   PhoneLinkDirectory = 'PhoneLink';
   { Log Dir }
   EventLogDirectory = 'Event Log';

   Reg_DLLActiveXReg = '.DEFAULT\Software\Kingswood\HERD\DLLActiveXReg'; 

const

   cPLFailedToInitialize = -1;
   cPLSuccess = 0;
   cPLNoEventsFound = 1;
   cPLSeachCancelled = 2;
   cPLFailedToConnect = 3;


implementation

{ TPhoneLink }

constructor TPhoneLink.Create;
begin
   Activate;

end;

destructor TPhoneLink.Destroy;
begin
   DeActivate;
   inherited;
end;

procedure TPhoneLink.DeActivate;
begin
   if DLLHandle <> 0 then
      FreeLibrary( DLLHandle );
end;

procedure TPhoneLink.Activate;
begin
   { Check PhoneLink ActiveX is present/registered and Licence is present. }
   if FileExists(PhoneLinkActiveXPath) then
      begin
         if not FileExists(PhoneLinkLicencePath) then
            raise PhoneLinkException.CreateFmt('File name %s', [PhoneLinkLicencePath])
         else if not PLRegistered then
            begin
               if RegisterPL then
                  UpdateRegistry;
            end;
      end;

   if FileExists(ApplicationPath + DLLFileName) then
      DLLHandle := LoadLibrary(PChar(ApplicationPath + DLLFileName))
   else
      raise PhoneLinkException.CreateFmt('A required file %s not found',[DLLFileName]);
end;

procedure TPhoneLink.LoadFromFile(var MessageList: TStringList);
begin
   if ( MessageList <> nil ) then
      if  ( FileExists( cPLNokiaMsgFile )) then
         MessageList.LoadFromFile( cPLNokiaMsgFile )
      else
         MessageDlg('PhoneLink event data no found.',mtError,[mbOK],0);
end;

procedure TPhoneLink.ShowMain(var Res : Integer);
begin
   Res := -1;

   if not FileExists( IniDir + PhoneLinkIniFile ) then
      ShowSettings;

   OleInitialize(Nil); // initialize before call to DLL using ActiveX Control
   try
      try
         FuncPtr := GetProcAddress(DLLHandle, 'PhoneLinkMain');
         if ( FuncPtr <> nil ) then
            begin
               @PhoneLinkMain:= FuncPtr;
               PhoneLinkMain(Application.Handle, Res);
               FuncPtr := nil;
            end;
      finally
      end
   finally
      OleUnInitialize;
   end;
end;

procedure TPhoneLink.ShowSettings;
begin
  if ( DllHandle <> 0 ) then
     begin
        OleInitialize(Nil);
        try
           FuncPtr:= GetProcAddress(DllHandle, 'PhoneLinkSettings');
           if FuncPtr <> NIL then
              begin
                @PhoneLinkSettings:= FuncPtr;
                PhoneLinkSettings(Application.Handle);
              end;
        finally
           OleUnInitialize;
        end;
     end
  else
     raise PhoneLinkException.Create('PhoneLink.dll not initialized');
end;

procedure TPhoneLink.SaveToFile;
var
   AppPath : string;
   StoredFile : string;
begin
   AppPath := ApplicationPath;
   if not DirExists(AppPath + PhoneLinkDirectory) then
      if not CreateDir( AppPath + PhoneLinkDirectory ) then
         MessageDlg(Format('Cannot create directory %s', [AppPath + PhoneLinkDirectory]),mtError,[mbOK],0);

   if not DirExists(AppPath + PhoneLinkDirectory + '\' + EventLogDirectory) then
      if not CreateDir( AppPath + PhoneLinkDirectory + '\' + EventLogDirectory ) then
         MessageDlg(Format('Cannot create directory %s', [ AppPath + PhoneLinkDirectory + '\Event Log' ]),mtError,[mbOK],0);

   StoredFile := AppPath + PhoneLinkDirectory + '\' + EventLogDirectory +'\splevents '+ FormatDateTime('ddmm hhmm', Now()) +'.log';
   CopyFile( PChar(cPLNokiaMsgFile), PChar(StoredFile), False );
   DeleteFile( cPLNokiaMsgFile );
end;

function TPhoneLink.PLRegistered;
var
   Reg : TRegistry;
begin
   Result := False;
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_USERS;
      if Reg.OpenKey(Reg_DLLActiveXReg, False) then
         Result := Reg.ReadBool('PhoneLink');
      Reg.CloseKey;
   finally
      Reg.Free;
   end;
end;

function TPhoneLink.RegisterPL : Boolean;
begin
   Result := False;
   if WinExec(PChar(format('regsvr32 "%s" /s', [PhoneLinkActiveXPath])), SW_HIDE) > 31 then
      Result := True;
end;

procedure TPhoneLink.UpdateRegistry;
var
   Reg : TRegistry;
begin
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_USERS;
      if Reg.OpenKey(Reg_DLLActiveXReg, True) then
         Reg.WriteBool('PhoneLink', True);
      Reg.CloseKey;
   finally
      Reg.Free;
   end;
end;

end.
