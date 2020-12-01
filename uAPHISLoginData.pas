unit uAPHISLoginData;

interface
uses
   Classes, IniFiles, SysUtils, db, dbtables;

type
   TAPHISLoginData = class
   private
     FIniFile : TIniFile;
    function GetBusinessId: string;
    function GetGatewayId: string;
    function GetPassword: string;
    procedure SetBusinessId(const Value: string);
    procedure SetGatewayId(const Value: string);
    procedure SetPassword(const Value: string);
    function DataPath : String;
    function GetLoginDetailsComplete: boolean;
   public
     constructor create;
     destructor Destroy;override;
     property GatewayId : string read GetGatewayId write SetGatewayId;
     property Password : string read GetPassword write SetPassword;
     property BusinessId : string read GetBusinessId write SetBusinessId;
     property LoginDetailsComplete : boolean read GetLoginDetailsComplete;
   end;

implementation
uses
   DCPCryptManagement;
{ TAPHISLoginData }

constructor TAPHISLoginData.create;
begin
   FIniFile := TIniFile.Create(IncludeTrailingBackslash( DataPath ) + 'aphis.config');

end;

function TAPHISLoginData.DataPath: String;
var
   AliasParams : TStringList;
begin
   Result := 'C:\Kingswood Herd Management\Data';
   AliasParams := TStringList.Create;
   try
      Session.GetAliasParams('kingswd', AliasParams );
      Result := AliasParams.Values['PATH'];
   finally
      AliasParams.Free;
   end;
end;

destructor TAPHISLoginData.Destroy;
begin
  FreeAndNil(FIniFile);
  inherited;

end;

function TAPHISLoginData.GetBusinessId: string;
var
  s : string;
begin
   Result := '';
   if FIniFile <> nil then
      begin
         s := FIniFile.ReadString('WebServices', 'BusinessId', '');
         if s <> '' then
            Result := decryptString('FA569882B51142EB89DD9E1298A21A63',s  );
      end;
end;

function TAPHISLoginData.GetGatewayId: string;
var
  s : string;
begin
   Result := '';
   if FIniFile <> nil then
      begin
         s := FIniFile.ReadString('WebServices', 'GatewayId', '');
         if s <> '' then
            Result := decryptString('FFE0737ECBE5463E80956C88F07DFFED', s );
      end;
end;

function TAPHISLoginData.GetLoginDetailsComplete: boolean;
begin
   Result := ((Trim(BusinessId) <> '') and (Trim(GatewayId) <> '') and (Trim(Password) <> ''));
end;

function TAPHISLoginData.GetPassword: string;
var
  s : string;
begin
   Result := '';
   if FIniFile <> nil then
      begin
         s := FIniFile.ReadString('WebServices', 'Password', '');
         if s <> '' then
            Result := decryptString( '6E49D9AE4E9244B2BA6B4EC19DAD2A01', s );
      end;
end;

procedure TAPHISLoginData.SetBusinessId(const Value: string);
begin
   if FIniFile <> nil then
      FIniFile.WriteString('WebServices', 'BusinessId', encryptString('FA569882B51142EB89DD9E1298A21A63', Value ));
end;

procedure TAPHISLoginData.SetGatewayId(const Value: string);
begin
   if FIniFile <> nil then
      FIniFile.WriteString('WebServices', 'GatewayId', encryptString('FFE0737ECBE5463E80956C88F07DFFED', Value ));
end;

procedure TAPHISLoginData.SetPassword(const Value: string);
begin
   if FIniFile <> nil then
      FIniFile.WriteString('WebServices', 'Password', encryptString('6E49D9AE4E9244B2BA6B4EC19DAD2A01', Value ));
end;

end.
