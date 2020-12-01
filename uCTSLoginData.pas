unit uCTSLoginData;

interface
uses
   Classes, SysUtils, inifiles, db, dbtables;
type
   TCTSLoginData = class
   private
     FIniFile : TIniFile;
    function DataPath : String;
    function GetCTSPassword: string;
    function GetCTSUsername: string;
    function GetSISEmailAddress: string;
    function GetSISUsername: string;
    procedure SetCTSPassword(const Value: string);
    procedure SetCTSUsername(const Value: string);
    procedure SetSISEmailAddress(const Value: string);
    procedure SetSISUsername(const Value: string);
    function GetLoginType: string;
    procedure SetLoginType(const Value: string);
   public
     constructor create;
     destructor Destroy;override;
     property SISUsername : string read GetSISUsername write SetSISUsername;
     property SISEmailAddress : string read GetSISEmailAddress write SetSISEmailAddress;
     property CTSUsername : string read GetCTSUsername write SetCTSUsername;
     property CTSPassword : string read GetCTSPassword write SetCTSPassword;
     property LoginType : string read GetLoginType write SetLoginType;
   end;

const
   cLoginType_SIS = 'SIS';
   cLoginType_CTS = 'CTS';


implementation

{ TCTSLoginData }

constructor TCTSLoginData.create;
begin
   FIniFile := TIniFile.Create(IncludeTrailingBackslash( DataPath ) + 'ctsws.config');
end;

function TCTSLoginData.DataPath: String;
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

destructor TCTSLoginData.Destroy;
begin
  FreeAndNil(FIniFile);
  inherited;
end;

function TCTSLoginData.GetCTSPassword: string;
begin
   Result := FIniFile.ReadString('CTS', 'Password', '');
end;

function TCTSLoginData.GetCTSUsername: string;
begin
   Result := FIniFile.ReadString('CTS', 'Username', '');
end;

function TCTSLoginData.GetLoginType: string;
begin
   Result := FIniFile.ReadString('SYSTEM', 'Default', 'CTS');
end;

function TCTSLoginData.GetSISEmailAddress: string;
begin
   Result := FIniFile.ReadString('SIS', 'EmailAddress', '');;
end;

function TCTSLoginData.GetSISUsername: string;
begin
   Result := FIniFile.ReadString('SIS', 'Username', '');
end;

procedure TCTSLoginData.SetCTSPassword(const Value: string);
begin
   FIniFile.WriteString('CTS', 'Password', Value);
end;

procedure TCTSLoginData.SetCTSUsername(const Value: string);
begin
   FIniFile.WriteString('CTS', 'Username', Value);
end;

procedure TCTSLoginData.SetLoginType(const Value: string);
begin
   FIniFile.WriteString('SYSTEM', 'Default', Value)
end;

procedure TCTSLoginData.SetSISEmailAddress(const Value: string);
begin
   FIniFile.WriteString('SIS', 'EmailAddress', Value);
end;

procedure TCTSLoginData.SetSISUsername(const Value: string);
begin
   FIniFile.WriteString('SIS', 'Username', Value);
end;

end.
