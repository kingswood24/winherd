unit sms_message;

interface
uses
Classes, Sysutils;

type
  TSMSMessage = class
  private
    strDate : WideString;
    nIndex : Integer;
    strMSISDN : WideString;
    strName : WideString;
    strStatus : WideString;
    strData : WideString;
    function GetDateTime: WideString;
    function getIndex: Integer;
    function GetMSISDN: WideString;
    function getName: WideString;
    function getStatus: WideString;
    function GetText: WideString;
    procedure SetDateTime(const Value: WideString);
    procedure SetIndex(const Value: Integer);
    procedure SetMSISDN(const Value: WideString);
    procedure SetName(const Value: WideString);
    procedure SetStatus(const Value: WideString);
    procedure SetText(const Value: WideString);
  public
     property MsgMSISDN : WideString read GetMSISDN write SetMSISDN;
     property MsgDateTime : WideString read GetDateTime write SetDateTime;
     property MsgText : WideString read GetText write SetText;
     property MsgIndex : Integer read getIndex write SetIndex;
     property MsgStatus : WideString read getStatus write SetStatus;
     property MsgName : WideString read getName write SetName;
  end;

implementation

{ TSMSMessage }

function TSMSMessage.GetMSISDN: WideString;
begin
   Result := strMSISDN;
end;

procedure TSMSMessage.SetMSISDN(const Value: WideString);
begin
   strMSISDN := Value;
end;

function TSMSMessage.GetDateTime: WideString;
begin
   result := strDate;
end;

function TSMSMessage.getIndex: Integer;
begin
   result := nIndex;
end;

function TSMSMessage.getName: WideString;
begin
   result := strName;
end;

function TSMSMessage.getStatus: WideString;
begin
   result := strStatus;
end;

function TSMSMessage.GetText: WideString;
begin
   result := strData;
end;

procedure TSMSMessage.SetDateTime(const Value: WideString);
begin
   strDate := value;
end;

procedure TSMSMessage.SetIndex(const Value: Integer);
begin
   nIndex := Value;
end;

procedure TSMSMessage.SetName(const Value: WideString);
begin
   strName := Value;
end;

procedure TSMSMessage.SetStatus(const Value: WideString);
begin
   strStatus := Value;
end;

procedure TSMSMessage.SetText(const Value: WideString);
begin
   strData := Value;
end;

end.
