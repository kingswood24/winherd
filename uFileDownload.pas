unit uFileDownload;

interface

uses
   Classes, SysUtils, Windows, ComCtrls, WinInet, Dialogs, LMDWebBase, LMDWebConfig, LMDWebHTTPGet,
   FileCtrl;

type
   TFileDownloader = class
   private
      FDefaultDirectory : string;
      FProgressBar : TProgressBar;
      procedure SetProgressBar(const Value: TProgressBar);
      function GetConnected: Boolean;
      procedure SetConnected(const Value: Boolean);
      procedure SetDefaultDirectory(const Value: string);
      procedure SetLocalFileName(const Value: string);
      procedure SetServerPassword(const Value: string);
      procedure SetServerUserName(const Value: string);
   protected
      FDownloader : TLMDWebHTTPGet;
      property DefaultDirectory : string write SetDefaultDirectory;
      procedure GetRASEntries;
   public
      function Connect : Boolean;
      procedure Disconnect;
      constructor create;
      destructor Destroy; override;
      property Connected : Boolean read GetConnected write SetConnected;
      property ProgressBar : TProgressBar write SetProgressBar;
      property ServerUserName : string write SetServerUserName;
      property ServerPassword : string write SetServerPassword;
      property LocalFileName : string write SetLocalFileName;
   end;



implementation

{ TFileDownloader }

constructor TFileDownloader.create;
begin
   DefaultDirectory := ExtractFilePath(ParamStr(0))+'Temp';
   FDownloader := TLMDWebHTTPGet.Create(nil);
end;

destructor TFileDownloader.Destroy;
begin
  FDownloader.Free;
  inherited;
end;

procedure TFileDownloader.Disconnect;
begin

end;

function TFileDownloader.Connect: Boolean;
begin

   if not Connected then
      begin



      end

end;

function TFileDownloader.GetConnected: Boolean;
var
  dwConnectionTypes: DWORD;
begin
   dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
   Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

procedure TFileDownloader.SetConnected(const Value: Boolean);
begin
   if Value <> Connected then
      begin
         if Value then
            begin
               if not ( Connect ) then raise Exception.Create('Unable to establish connection');
            end
         else
            Disconnect;
      end
end;

procedure TFileDownloader.SetProgressBar(const Value: TProgressBar);
begin
   if Value <> FProgressBar then
      FProgressBar := Value;
end;

procedure TFileDownloader.SetDefaultDirectory(const Value: string);
begin
   if Value <> FDefaultDirectory then
      begin
         if not CreateDir(Value) then
            raise Exception.Create('Unable to create temp directory');
         FDefaultDirectory := Value;
      end;
end;

procedure TFileDownloader.SetLocalFileName(const Value: string);
begin
   if Value <> FDownloader.DestinationName then
      FDownloader.DestinationName := Value;
end;

procedure TFileDownloader.SetServerPassword(const Value: string);
begin
   if Value <> FDownloader.UserName then
      FDownloader.UserName := Value;
end;

procedure TFileDownloader.SetServerUserName(const Value: string);
begin
   if Value <> FDownloader.Password then
      FDownloader.Password := Value;
end;

procedure TFileDownloader.GetRASEntries;
begin

end;

end.
