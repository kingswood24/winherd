unit SMSGenerator;

interface

type

  TSMSEventType = (smsBulling, smsService, smsPregDiag, smsHealth, smsDryOff, smsInValid);
  TSMSEventRec = record
    FMsgIndex: Integer;
    FEventDate: TDateTime;
    FEventType: String;
    FAnimalNo: String;
    FParam1: Variant;
    FParam2: Variant;
    FParam3: Variant;
    ValidEMsg : Boolean;
  end;

  TSMSEventGenerator = class(TObject)
  private
     FParser,
     FMsgParser,
     FLineParser : TSPParser;

     FSMSEvent : TSMSEventRec;

     FSMSEventList : TStringList;
     function StripSpaces( StrToStrip : String) : String;
     function GetEventCode(str : String ) : TSMSEventType;

     function CountMsgParams(MsgString : String) : Byte;
     procedure CreateEventRecord(FLine : String);
     procedure LoadEventToList(smsEvent : TSMSEventRec);

  public
     constructor Create;
     destructor Destroy;override;
     function EventList : TStringList;
     function ValidateMsgContent(const MsgString : String) : Boolean;
     procedure CreateEventsFromMsg(const strDate: String; const Msg : WideString);
  end;

implementation

{ TSMSEventGenerator }

function TSMSEventGenerator.CountMsgParams(MsgString: String): Byte;
begin
   try
      FLineParser.Parse(Trim(MsgString));
      Result := FLineParser.Count;
   except
      Result := 0;
   end;
end;

constructor TSMSEventGenerator.Create;
begin
   FSMSEventList := TStringList.Create;

   FMsgParser := TSPParser.Create(nil);
   FMsgParser.Sepchar := Comma;

   FLineParser := TSPParser.Create(nil);
   FLineParser.Sepchar := Space;

   FParser := TSPParser.Create(nil);
   FParser.Sepchar := ',';
end;

procedure TSMSEventGenerator.CreateEventsFromMsg(const strDate: String;
  const Msg: WideString);
  function CheckForDate(var Msg : WideString) : TDateTime;
  type
     TDateRec = record
     Y, M, D, DayCount : Word;
     end;
  var
     nDay : Word;
     nPos : Integer;
     sDay : ShortString;
     Y, M, D : Word;
     x : 0..12;
     Months : Array [0..1] of TDateRec;
  begin
     Result := 0;

     nPos := Pos('.', Msg);
     if nPos > 0 then
        begin
           sDay := StripSpaces(Copy(Msg, nPos+1, MaxInt));
           try
              nDay := StrToInt(sDay);
              for x := Low(Months) to High(Months) do
                  begin
                     DecodeDate(IncMonth(Date, -x), Y, M, D );
                     Months[x].D := D;
                     Months[x].M := M;
                     Months[x].Y := Y;
                  end;
              x := 0;
              if nDay = Months[x].D then
                 Result := Date
              else if nDay < Months[x].D then
                 Result := EncodeDate(Months[x].Y, Months[x].M, nDay)
              else
                 begin
                    Inc(x);
                    while nDay > Months[x].D do
                       begin
                           if nDay in [1..DaysInMonth(Months[x].M, Y)] then
                              begin
                                 Result := EncodeDate(Months[x].Y, Months[x].M, nDay);
                                 Break;
                              end;
                       end;
                 end;
              System.Delete(Msg, nPos, MaxInt);
           except
           end;
        end;
  end;
var
   MultiEvents : Boolean;
   i, j : Integer;
begin
   Msg := UpperCase(msg);

   // Check For Multi Events
   if Pos(',', Msg) > 0 then
      MultiEvents := True
   else
      MultiEvents := False;

   FSMSEvent.FMsgIndex  := MsgIndex;
   try
      if strDate <> '' then
         FSMSEvent.FEventDate := StrToDate(strDate);
      if FSMSEvent.FEventDate <= 0 then
         FSMSEvent.FEventDate := CheckForDate(Msg);
   except
      FSMSEvent.FEventDate := Date;
   end;

   if MultiEvents then
      begin
         FParser.Parse(Msg);
         for i := 1 to FParser.Count do
            CreateEventRecord(FParser.Fields[i]);
      end
   else
      CreateEventRecord(Msg);
end;

procedure TSMSEventGenerator.CreateEventRecord(FLine: String);
begin

end;

destructor TSMSEventGenerator.Destroy;
begin
   try
      if FSMSEventList <> nil then
         SmsEventList.Free;
      if FMsgParser <> nil then
         FMsgParser.Free;
      if FLineParser <> nil then
         FLineParser.Free;
      if FParser <> nil then
         FParser.Free;
   except
   end;
  inherited;
end;

function TSMSEventGenerator.EventList: TStringList;
begin
   if ( FSMSEventList <> nil ) then
      Result := FSMSEventList;
end;

function TSMSEventGenerator.GetEventCode(str: String): TSMSEventType;
begin
   Result := smsInValid;
   case Ord(str[1]) of
      66 : Result := smsBulling;
      68 : Result := smsDryOff;
      72 : Result := smsHealth;
      80 : Result := smsPregDiag;
      83 : Result := smsService;
   end;
end;

procedure TSMSEventGenerator.LoadEventToList(smsEvent: TSMSEventRec);
var
   TmpStr : String;
begin
    TmpStr := '';
    AppendStr(TmpStr, FormatDateTime('dd/mm/yyyy', smsEvent.FEventDate)+Space);
    AppendStr(TmpStr, smsEvent.FEventType+Space);
    AppendStr(TmpStr, smsEvent.FAnimalNo+Space);
    if smsEvent.FParam1 <> null then
       AppendStr(TmpStr, smsEvent.FParam1+Space);
    if smsEvent.FParam2 <> null then
       AppendStr(TmpStr, smsEvent.FParam2+Space);
    if smsEvent.FParam3 <> null then
       AppendStr(TmpStr, smsEvent.FParam3+Space);
    FSMSEventList.Add(TmpStr);
end;

function TSMSEventGenerator.StripSpaces(StrToStrip: String): String;
var
   i,
   j:integer;
begin
   if length(StrToStrip)>0 then
      begin
         i := 1;
         while (i<length(StrToStrip)) and (StrToStrip[i]=' ') do
            i := i+1;
         if StrToStrip[i]=' ' then
            StrToStrip := ''
         else
            begin
               j := length(StrToStrip);
               while (j>1) and (StrToStrip[j]=' ') do
                  j := j-1;
               StrToStrip := copy(StrToStrip,i,j+1-i);
            end;
      end;
   Result := StrToStrip;

end;

function TSMSEventGenerator.ValidateMsgContent(
  const MsgString: String): Boolean;
var
   i : Byte;
   nPos : Word;
begin
   Result := False;

   msgString := Trim(msgString); // Clear any unwanted spaces from the start and end of message.

   if msgString = '' then Exit; // Exit routine if message is blank.

   // Remove Data Indicator if present.
   nPos := Pos('.', msgString);
   if ( nPos > 0 )then
      System.Delete(MsgString, nPos, MaxInt);

   if Length(MsgString) <= 0 then Exit;

   // First char Must be Alpha followed by a space
   if ((msgString[1] in ['B', 'b', 'S', 's', 'P', 'p', 'H', 'h', 'D', 'd']) and (msgString[2] = ' ')) then
         begin
            if Pos(',', MsgString) > 0 then // Content must include field seperator (comma's)
               begin
                  FMsgParser.Parse(MsgString); // Parse content
                  for i := 1 to FMsgParser.Count do // Count number of params
                     case CountMsgParams(FMsgParser.Fields[i]) of
                        2, 3, 4 : Result := True; // Matches the param count set for each eventtype.
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
                     2, 3, 4 : Result := True;
                  end;
               end;
         end;
end;

end.
