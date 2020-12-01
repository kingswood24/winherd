unit EmailAccountInfo;

interface
uses
   Windows, Registry, SysUtils;
   
const
   cAccountKey = '.DEFAULT\Software\Microsoft\Internet Account Manager';
   cAccountDetailsKey = '.DEFAULT\Software\Microsoft\Internet Account Manager\Accounts\';
   cReadAccountKey = 'Default Mail Account';
   cSMTPHost = 'SMTP Server';
   cSMTPID = 'POP3 User Name';
   cUserName = 'SMTP Display Name';
   cUserAddress = 'SMTP EMail Address';

type
  TEmailInfo = record
     Account,
     SMTPHost,
     SMTPID,
     UserName,
     UserAddress : String
  end;

  TEmailAccountInfo = class
  private
    FReg : TRegistry;
    FAccountKey: WideString;
    FAccountDetailsKey: WideString;
    function GetEmailInfo: TEmailInfo;
    procedure SetAccountDetailsKey(const Value: WideString);
    procedure SetAccountKey(const Value: WideString);
    function ValidRegKeys : Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property AccountKey : WideString read FAccountKey write SetAccountKey;
    property AccountDetailsKey : WideString read FAccountDetailsKey write SetAccountDetailsKey;
    property EmailInfo : TEmailInfo read GetEmailInfo;
  end;

implementation

{ TEmailAccountInfo }

constructor TEmailAccountInfo.Create;
begin
   FAccountKey := cAccountKey;
   FAccountDetailsKey := cAccountDetailsKey;
end;

destructor TEmailAccountInfo.Destroy;
begin
  inherited;

end;

function TEmailAccountInfo.GetEmailInfo: TEmailInfo;
begin
   FillChar(Result, SizeOf(Result), #0);

   if ValidRegKeys then
      begin
         // check registry for mail account details
         try
            FReg := TRegistry.Create;
            FReg.RootKey := HKEY_USERS;
            { Default Mail Account }
            if (FReg.OpenKey(FAccountKey,False)) then
               Result.Account := FReg.ReadString(cReadAccountKey);
            FReg.CloseKey;
            { Account Details }
            if (FReg.OpenKey((cAccountDetailsKey+Result.Account), False)) then
               begin
                  Result.SMTPHost    := FReg.ReadString(cSMTPHost);
                  Result.SMTPID      := FReg.ReadString(cSMTPID);
                  Result.UserName    := FReg.ReadString(cUserName);
                  Result.UserAddress := FReg.ReadString(cUserAddress);
               end;
            FReg.CloseKey;
            FReg.Free;
         except
         end;
      end;
end;

procedure TEmailAccountInfo.SetAccountDetailsKey(const Value: WideString);
begin
   if Trim(Value) <> FAccountDetailsKey then
      FAccountDetailsKey := Trim(Value);
end;

procedure TEmailAccountInfo.SetAccountKey(const Value: WideString);
begin
   if Trim(Value) <> FAccountKey then
      FAccountKey := Trim(Value);
end;

function TEmailAccountInfo.ValidRegKeys: Boolean;
begin
   Result := False;
   if (FAccountDetailsKey <> '') and (FAccountKey <> '') then
      Result := True;
end;

end.
