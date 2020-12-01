unit SMSNokia;

interface
uses
  Windows, Messages, SysUtils, Classes, Forms, Dialogs,
  SMS3ASuiteLib_TLB, ComCtrls, ActiveX, ComObj;

type
  TEventSink = class(TObject, IUnknown, IDispatch, ISMSReceiveNotify)
  private
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: integer; stdcall;
    function _Release: integer; stdcall;
    { IDispatch }
    function GetTypeInfoCount(out Count: integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames( const IID: TGUID; Names: Pointer;
                            NameCount, LocaleID: integer;
                            DispIDs: Pointer ): HResult; stdcall;
    function Invoke( DispID: integer; const IID: TGUID; LocaleID: integer;
                     Flags: Word; var Params; VarResult, ExcepInfo,
                     ArgErr: Pointer): HResult; stdcall;
    { Own correspondents for the notifications }
    function DoShortMsgReceived(SMSMemory: SMS_MEMORY_LOCATION; index: Integer; const pSMS: IShortMessage): HResult; stdcall;
    function DoSMSMemoryFull(SMSMemory: SMS_MEMORY_LOCATION): HResult; stdcall;
    function DoShortMsgSent(const pSMS: IShortMessage): HResult; stdcall;
    { ISMSReceiveNotify }
    function ISMSReceiveNotify.ShortMsgReceived = DoShortMsgReceived;
    function ISMSReceiveNotify.SMSMemoryFull = DoSMSMemoryFull;
    function ISMSReceiveNotify.ShortMsgSent = DoShortMsgSent;
  private
    FOwner : TForm;    // Reference to the owner form
  public
    constructor Create(Owner: TForm);
  end;

implementation

{ TEventSink }

function TEventSink._AddRef: integer;
begin
  inherited;
  Result := S_OK;
end;

function TEventSink._Release: integer;
begin
  inherited;
  Result := S_OK;
end;

constructor TEventSink.Create(Owner: TForm);
begin
  FOwner := Owner;
end;

function TEventSink.DoShortMsgReceived(SMSMemory: SMS_MEMORY_LOCATION;
  index: Integer; const pSMS: IShortMessage): HResult;
begin
  // Set receive timer, which will start messaging reading
  //ReceiveTimer.Enabled := true;
  Result := S_OK;
end;

function TEventSink.DoShortMsgSent(const pSMS: IShortMessage): HResult;
begin
  MessageDlg('SMS sent!', mtInformation, [mbOk], 0);
  Result := S_OK;
end;

function TEventSink.DoSMSMemoryFull(SMSMemory: SMS_MEMORY_LOCATION): HResult;
begin
  MessageDlg( 'SMS memory full. Please remove some messages.',
              mtError, [mbOk], 0 );
  Result := S_OK;
end;

function TEventSink.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TEventSink.GetTypeInfo(Index, LocaleID: integer; out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
  pointer (TypeInfo) := NIL;
end;

function TEventSink.GetTypeInfoCount(out Count: integer): HResult;
begin
  Result := E_NOTIMPL;
  Count := 0;
end;

function TEventSink.Invoke(DispID: integer; const IID: TGUID;
  LocaleID: integer; Flags: Word; var Params; VarResult, ExcepInfo,
  ArgErr: Pointer): HResult;
begin
  inherited;
  Result := S_OK;
end;

function TEventSink.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := E_NOINTERFACE;
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    if IsEqualIID(IID, ISMSReceiveNotify) then
      QueryInterface(IDispatch, Obj)
    else
      Result := E_NOINTERFACE;
end;

end.
 