unit uSiemensSMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VaConst, VaTypes, VaClasses, VaComm, StdCtrls, dbtables, db, OleServer,
  ExtCtrls, uSPParser, sms_message, uSMSParser, KRoutines, ComCtrls,
  uKParser;

type
  TMessageList = Array [0..99] of TSMSMessage;
  TfmSiemensSMS = class(TForm)
    Button1: TButton;
    Comm: TVaComm;
    GSMTimer: TTimer;
    ReceiveTimer: TTimer;
    Label1: TLabel;
    lStatus: TLabel;
    MessageParser: TSPParser;
    MsgStats: TSPParser;
    Bevel1: TBevel;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CommData(Sender: TObject; Count: Integer);
    procedure GSMTimerTimer(Sender: TObject);
    procedure ReceiveTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    SMSMsg : TSMSMessage;
//    SMSMsgList : TMessageList;
    CommOutput : String;
    SMSEventList : TStringList;
    SMSEventGen : TSMSEventGenerator;
    function RemoveControlChars(Str :String) : String;
    function SendCommand(Command : String) : String;
    procedure ParseCommOutput(CommOutput : String);
    function MakeMessage(MsgData : String) : TSMSMessage;
//    procedure ParseMessageData(MessageData : String);
    function RightOfStr(Str : String; StartPos : Integer) : String;
    function LeftOfStr(Str : String; EndPos : Integer) : String;
  public
    { Public declarations }
    procedure GetMessages(var EventList : TStringList; var Result : Integer);
  end;

const
   LineFeed = #13#10;
   HisLine = crlf;
   AT_DELETE = 'at+cmgd=';
   AT_RECEIVE_READ = 'at+cmgl="Rec Read"';
   AT_RECEIVE_UNREAD = 'at+cmgl="Rec Unread"';
   AT_OK = LineFeed + 'OK' + LineFeed;
   AT_ERROR = LineFeed + 'ERROR' + LineFeed;
   AT_CMGL_START = 'CMGL:';
   AT_SEND = 'at+cmgs=';
   AT_MODE_PDU = 'at+cmgf=0';
   AT_MODE_TXT = 'at+cmgf=1';

var
  fmSiemensSMS: TfmSiemensSMS;

implementation

{$R *.DFM}

procedure TfmSiemensSMS.FormCreate(Sender: TObject);
begin
   // Initialize Message Object
   SMSEventGen := TSMSEventGenerator.Create;
   SMSMsg := TSMSMessage.Create;
   SMSEventList := TStringList.Create;
   Comm.PortNum := 1;
   try
      Comm.Open;
      SendCommand(AT_MODE_TXT);
{      if UPPERCASE(RemoveControlChars(CommOutput)) <> 'OK' then
         raise Exception.Create('Comm Error : Unable to send command');
}
   except
     on E : Exception do
        ShowMessage(E.Message);
   end;
end;

procedure TfmSiemensSMS.FormDestroy(Sender: TObject);
begin
   SMSMsg.Free;
   try
      Comm.PurgeRead;
      Comm.Close;
   except
     on E : Exception do
        ShowMessage(E.Message);
   end;
end;

function TfmSiemensSMS.SendCommand(Command: String): String;
var
   Buffer : String;
   CommConnect : Boolean;
begin
   try
      with Comm do
         begin
            CommOutput := '';
            CommConnect := WriteText(Command+LineFeed);
            if not CommConnect then
               raise Exception.CreateFmt('Unable to communicate with COM Port %d',[Comm.PortNum]);
         end;
   except
   end;
end;

procedure TfmSiemensSMS.CommData(Sender: TObject; Count: Integer);
begin
   CommOutput := CommOutput+Comm.ReadText;
end;


procedure TfmSiemensSMS.GSMTimerTimer(Sender: TObject);
begin
   lStatus.Caption := 'Communicating with COM Port '+IntToStr(Comm.PortNum);
   GSMTimer.Enabled := False;
   SendCommand(AT_RECEIVE_UNREAD);
   ReceiveTimer.Enabled := True;
end;

procedure TfmSiemensSMS.ReceiveTimerTimer(Sender: TObject);
begin
   ReceiveTimer.Enabled := False;
   ParseCommOutput(CommOutput);
end;

procedure TfmSiemensSMS.ParseCommOutput(CommOutput : String);
var
   CommResult,
   TempStr, StrWithControls : String;
   i : Byte;
   MsgCount : Integer;
   TempMsg : TSMSMessage;
begin

   ProgressBar.Min := 0;
   ProgressBar.Max := GetTokenCount(CommOutput, AT_CMGL_START);
   if ProgressBar.Max > 0 then
      ProgressBar.Visible := True;
   lStatus.Caption := 'Searching for messages...';
   Application.ProcessMessages;

   CommResult := Trim(Copy(Trim(CommOutput), Length(CommOutput)-7, MaxInt));
   // Check Comm Result
   CommResult := RemoveControlChars(CommResult);
   if UPPERCASE(CommResult) = 'ERROR' then
      begin
         lStatus.Caption := 'Error Reading COM Output';
         raise Exception.CreateFmt('Error reading Comm Port %d',[Comm.PortNum]);
      end
   else if UPPERCASE(CommResult) <> 'OK' then
      begin
         lStatus.Caption := 'COM Port : Unknown error';
         raise Exception.CreateFmt('COM Port %d Error : Unknown error',[Comm.PortNum]);
      end;

   // Remove Receive Command from Outout
   Delete(CommOutput, 1, Length(AT_RECEIVE_UNREAD));
   // Check if Messages Exist
   TempStr := RemoveControlChars(CommOutput);

   if Length(TempStr) <= 2 then
      begin
         MessageDlg('No new messages found',mtInformation,[mbOk],0);
         lStatus.Caption := 'No new messages found...';
         ModalResult := mrOk;
      end
   else
      begin
         MessageParser.Parse(CommOutput);
         for i := 1 to MessageParser.Count do
             begin
                Application.ProcessMessages;
                StrWithControls := MessageParser.Fields[i];
                TempStr := RemoveControlChars(StrWithControls);
                if Length(TempStr) > 0 then
                   begin
                      TempMsg := MakeMessage(StrWithControls);
                      if SMSEventGen.ValidateMsgContent(TempMsg.MsgText) then
                         begin
                            SMSEventGen.ParseMessage(TempMsg.MsgDateTime, TempMsg.MsgText, TempMsg.MsgIndex, -1 );
                            SendCommand(AT_DELETE+IntToStr(TempMsg.MsgIndex));
                         end;
                      Inc(MsgCount);
                      ProgressBar.Position := MsgCount;
                   end;
             end;
         SMSEventList := SMSEventGen.SMSEventList;
         if SMSEventList.Count > 0 then
            ModalResult := MrOk
      end;
   if ProgressBar.Visible then
      ProgressBar.Visible := False;
end;

procedure TfmSiemensSMS.FormActivate(Sender: TObject);
begin
   GSMTimer.Enabled := True;
end;

procedure TfmSiemensSMS.Button1Click(Sender: TObject);
begin
   if Button1.Caption = '&Cancel' then
      ModalResult := mrCancel
   else
      ModalResult := mrOK;
   Close;
end;

function TfmSiemensSMS.MakeMessage(MsgData : String) : TSMSMessage;
var
   Done : Boolean;
   i : Byte;
   TempStr,
   MsgStr : String;
begin
  // if message is last in msgdata remove AT_OK
  if Pos(AT_OK, MsgData) > 0 then
     Delete(MsgData, POS(AT_OK, MsgData), Length(AT_OK));
  MsgStr := LeftOfStr(MsgData, Pos(LineFeed, MsgData));
  MsgStr := RightOfStr(MsgStr, Length(AT_CMGL_START)+1);
  MsgStr := Trim(MsgStr);
  Done := False;
  while not Done do
     begin
        MsgStats.Parse(MsgStr);
        case MsgStats.Count of
            4: begin { STO SENTS }
                  SMSMsg.MsgIndex  := StrToInt(MsgStats.Fields[1]);
                  SMSMsg.MsgStatus := MsgStats.Fields[2];
                  SMSMsg.MsgMSISDN := MsgStats.Fields[3];
                  SMSMsg.MsgName   := MsgStats.Fields[4];
                  SMSMsg.MsgText   := RightOfStr(MsgData, Length(MsgData) - Length(MsgStr) - Length(AT_CMGL_START) - 1);
                  SMSMsg.MsgText   := LeftOfStr(SMSMsg.MsgText, Length(SMSMsg.MsgText) - Length(LineFeed));
               end;
           5,
           6 : begin { RECEIVED }
                  SMSMsg.MsgIndex  := StrToInt(MsgStats.Fields[1]);
                  SMSMsg.MsgStatus := StringReplace(MsgStats.Fields[2], '"', '', [rfReplaceAll]);
                  SMSMsg.MsgMSISDN := StringReplace(MsgStats.Fields[3], '"', '', [rfReplaceAll]);
                  SMSMsg.MsgName   := StringReplace(MsgStats.Fields[4], '"', '', [rfReplaceAll]);
                  SMSMsg.MsgDateTime := StringReplace(MsgStats.Fields[5], '"', '', [rfReplaceAll]);
                  SMSMsg.MsgDateTime := Copy(SMSMsg.MsgDateTime, 7, 2) + '/' + Copy(SMSMsg.MsgDateTime, 4, 2) + '/' + Copy(SMSMsg.MsgDateTime, 1, 2);
                  TempStr := RightOfStr(MsgData, Length(MsgStr) + Length(AT_CMGL_START)+1);
                  while Pos(LineFeed, TempStr) > 0 do
                     Delete(TempStr, Pos(LineFeed, TempStr), Length(LineFeed));
                  SMSMsg.MsgText   := StringReplace(TempStr, '"', '', [rfReplaceAll]);
               end;
           11: begin
                  SMSMsg.MsgIndex  := StrToInt(MsgStats.Fields[1]);
                  SMSMsg.MsgStatus := MsgStats.Fields[2];
                  SMSMsg.MsgMSISDN := MsgStats.Fields[3];
               end;
        end;
        Done := True;
     end;
    Result := SMSMsg;
end;
{
procedure TfmSiemensSMS.ParseMessageData(MessageData: String);
var
   Done : Boolean;
   TokenPos,
   MessageDataEnd : Integer;
   strData : String;
begin
   Done := False;
   while not Done do
      begin
         TokenPos := Pos(AT_CMGL_START, MessageData);
         if ((VarIsNull(TokenPos)) or (TokenPos = 0)) then
            Done := True
         else
            begin
               Done := False;
               MessageDataEnd := Pos(LineFeed, MessageData)-1;
               strData := Copy(MessageData, 1, MessageDataEnd);
               strData := Copy(MessageData, Length(AT_CMGL_START)+1, MessageDataEnd-Length(AT_CMGL_START)+1);
               Done := True;
            end
      end;
end;
}
function TfmSiemensSMS.LeftOfStr(Str: String; EndPos: Integer): String;
begin
   Result := Copy(Str, 1, EndPos-1);
end;

function TfmSiemensSMS.RightOfStr(Str: String; StartPos: Integer): String;
begin
   Result := Copy(Str, StartPos, Length(Str));
end;

procedure TfmSiemensSMS.GetMessages(var EventList: TStringList; var Result: Integer);
begin
   Result := ShowModal;
   try
      EventList.Assign(SmsEventList);
      Free;
   except
   end;
end;

function TfmSiemensSMS.RemoveControlChars(Str: String): String;
begin
   while Pos(#13, Str) > 0 do
      Delete(Str, Pos(#13, Str), 1);
   while Pos(#10, Str) > 0 do
      Delete(Str, Pos(#10, Str), 1);
   while Pos('"', Str) > 0 do
      Delete(Str, Pos('"', Str), 1);
   Result := Str;
end;

end.
