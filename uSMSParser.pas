unit uSMSParser;

interface

uses
   Classes, SysUtils, Parser, Dialogs;

type
   TSMSEventType = (smsBulling, smsService, smsPregDiag, smsHealth, smsDryOff, smsInValid);
   TSMSRecord = record
     FMsgIndex: Integer;
     FEventDate: TDateTime;
     FEventType: String;
     FAnimalNo: String;
     FParam1: Variant;
     FParam2: Variant;
     FParam3: Variant;
     ValidEMsg : Boolean;
   end;

   TSMSEventGenerator = Class
   private
      procedure CreateEventRecord(FLine : String);
      procedure LoadMsgsToList;
      procedure InitializeParsers;
      procedure FreeParsers;

      function CountMsgParams(MsgString : String) : Byte;
      function GetEventCode(str : String ) : TSMSEventType;
   public
      SMSEventList : TStringList;
      procedure ParseMessage(strDate: String; Msg : WideString; MsgIndex, Mem : Integer);
      function ValidateMsgContent(MsgString : String) : Boolean;
      constructor Create;
      destructor Destroy;override;
   end;

var
   FParser,
   LineParser,
   MsgParser : TParser;
   SMSEventObject : TSMSRecord;
   SMS_Count : Integer;
   EventArray : array [0..50] of TSMSRecord;
   NextEventID : Integer;

const
   cSpace = ' ';
   cComma = ',';

implementation

{ tSMSGenerator }

function TSMSEventGenerator.CountMsgParams(MsgString: String): Byte;
begin
   try
      LineParser.Parse(Trim(MsgString));
      Result := LineParser.Parsecount;
   except
      Result := 0;
   end;
end;

constructor TSMSEventGenerator.Create;
begin
   InitializeParsers;
   SMSEventList := TStringList.Create;
end;

procedure TSMSEventGenerator.CreateEventRecord(FLine: String);
var
  SMSEventType : TSMSEventType;
begin
   FParser.FieldSep := ' ';
   FLine := TrimRight(FLine);
   FParser.Parse(FLine);
   SMSEventType := GetEventCode(FParser.ParseFields[0]);
   case SMSEventType of
      smsBulling  : begin
                       SMSEventObject.FEventType := 'B';
                       SMSEventObject.FAnimalNo  := FParser.Parsefields[2];
                       case FParser.Parsecount of
                          2 : begin
                                 SMSEventObject.FParam1    := Null;
                                 SMSEventObject.FParam2    := Null;
                                 SMSEventObject.FParam3    := Null;
                              end;
                          3 : begin
                                 SMSEventObject.FParam1    := FParser.Parsefields[3];
                                 SMSEventObject.FParam2    := Null;
                                 SMSEventObject.FParam3    := Null;
                              end;
                       end;
                       Inc(SMS_Count);
                    end;
      smsService  : if FParser.Parsecount = 3 then
                       begin
                          SMSEventObject.FEventType := 'S';
                          SMSEventObject.FAnimalNo  := FParser.Parsefields[2];
                          SMSEventObject.FParam1    := FParser.Parsefields[3];
                          SMSEventObject.FParam2    := Null;
                          SMSEventObject.FParam3    := Null;
                          Inc(SMS_Count);
                       end;
      smsPregDiag : if FParser.Parsecount = 3 then
                       begin
                          SMSEventObject.FEventType := 'P';
                          SMSEventObject.FAnimalNo  := FParser.Parsefields[2];
                          SMSEventObject.FParam1    := FParser.Parsefields[3];
                          SMSEventObject.FParam2    := Null;
                          SMSEventObject.FParam3    := Null;
                          Inc(SMS_Count);
                       end;
      smsHealth   : if FParser.Parsecount = 4 then
                       begin
                          SMSEventObject.FEventType := 'H';
                          SMSEventObject.FAnimalNo  := FParser.Parsefields[2];
                          SMSEventObject.FParam1    := FParser.Parsefields[3];
                          SMSEventObject.FParam2    := FParser.Parsefields[4];
                          SMSEventObject.FParam3    := FParser.Parsefields[5];
                          Inc(SMS_Count);
                       end;
      smsDryOff   : if FParser.Parsecount = 4 then
                       begin
                          SMSEventObject.FEventType := 'D';
                          SMSEventObject.FAnimalNo  := FParser.Parsefields[2];
                          SMSEventObject.FParam1    := FParser.Parsefields[3];
                          SMSEventObject.FParam2    := FParser.Parsefields[4];
                          SMSEventObject.FParam3    := FParser.Parsefields[5];
                          Inc(SMS_Count);
                       end;
   end;

   if SMSEventType <> smsInValid then
      begin
         EventArray[NextEventID] := SMSEventObject;
         Inc(NextEventID);
      end;

end;

destructor TSMSEventGenerator.Destroy;
begin
  inherited;
  FreeParsers;
end;

procedure TSMSEventGenerator.FreeParsers;
begin
  if MsgParser <> nil then
     MsgParser.Free;
  if LineParser <> nil then
     LineParser.Free;
  if FParser <> nil then
     FParser.Free;
end;

function TSMSEventGenerator.GetEventCode(str: String): TSMSEventType;
begin
   Result := smsInValid;
   if str[1] = 'B' then
      Result := smsBulling
   else if str[1] = 'S' then
      Result := smsService
   else if str[1] = 'P' then
      Result := smsPregDiag
   else if str[1] = 'H' then
      Result := smsHealth
   else if str[1] = 'D' then
      Result := smsDryOff;
end;

procedure TSMSEventGenerator.InitializeParsers;
begin
   MsgParser := TParser.Create;
   MsgParser.FieldSep := cComma;
   LineParser := TParser.Create;
   LineParser.FieldSep := cSpace;
end;

procedure TSMSEventGenerator.LoadMsgsToList;
var
   i : Byte;
   TmpStr : String;
begin
   for i := 0 to SMS_Count-1 do
      begin
         TmpStr := '';
         AppendStr(TmpStr, FormatDateTime('dd/mm/yyyy', EventArray[i].FEventDate)+cSpace);
         AppendStr(TmpStr, EventArray[i].FEventType+cSpace);
         AppendStr(TmpStr, EventArray[i].FAnimalNo+cSpace);
         if EventArray[i].FParam1 <> null then
            AppendStr(TmpStr, EventArray[i].FParam1+cSpace);
         if EventArray[i].FParam2 <> null then
            AppendStr(TmpStr, EventArray[i].FParam2+cSpace);
         if EventArray[i].FParam3 <> null then
            AppendStr(TmpStr, EventArray[i].FParam3+cSpace);
         SMSEventList.Add(TmpStr);
      end;
end;

procedure TSMSEventGenerator.ParseMessage(strDate: String; Msg: WideString;
  MsgIndex, Mem: Integer);
var
   MultiEvents : Boolean;
   List : TStringList;
   i,
   j : Integer;
begin
   try
      FParser := TParser.Create;
      Msg := UpperCase(msg);
      // Check For Multi Events
      if Pos(',', Msg) > 0 then
         MultiEvents := True
      else
         MultiEvents := False;

      SMSEventObject.FMsgIndex  := MsgIndex;
      try
         SMSEventObject.FEventDate := StrToDate(strDate);
      except
         SMSEventObject.FEventDate := Date;
      end;

      if MultiEvents then
         begin
            List := TStringList.Create;
            FParser.FieldSep := ',';
            FParser.Parse(Msg);
            for i := 1 to FParser.Parsecount do
               List.Add(FParser.Parsefields[i]);
            for i := 0 to List.Count-1 do
               CreateEventRecord(List.Strings[i]);
            LoadMsgsToList;
         end
      else
         begin
            CreateEventRecord(Msg);
            LoadMsgsToList;
         end;
   finally
      if List <> nil then
         List.Free;
   end;

end;

function TSMSEventGenerator.ValidateMsgContent(MsgString: String): Boolean;
var
   i : Byte;
begin
   Result := False;
   if ((msgString[1] in ['B', 'S', 'P', 'H', 'D']) and (msgString[2] = ' ')) then
         begin
            if Pos(',', MsgString) > 0 then
               begin
                  MsgParser.Parse(MsgString);
                  for i := 1 to MsgParser.Parsecount do
                     case CountMsgParams(MsgParser.Parsefields[i]) of
                        2, 3, 4 : Result := True;
                     else
                        begin
                           Result := False;
                           Exit;
                        end;
                     end;
               end
            else
               begin
                  case CountMsgParams(msgString) of
                     3, 4 : Result := True;
                  end;
               end;
         end;
end;

end.
