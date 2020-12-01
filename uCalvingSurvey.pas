unit uCalvingSurvey;

interface

type

  TCalvingSurvey = class
  public
     AnimalId, LactNo, HerdId, EventId : Integer;
     CalvingDate : TDateTime;
     AbortedCalving,
     AssistedCalvingModerate,
     AssistedCalvingSerious,
     MilkFever,
     RetainedCleansing,
     DisplacedAbomasums : Boolean;
     ConditionScore : Variant;
     ConditionScoreComment : String;
     ShowCSInfo : Boolean;
     ShowBirthTypeInfo : Boolean;
     RegisterCalves : Boolean;
     procedure Clear;
     constructor create;
  end;

implementation

{ TCalvingSurvey }

procedure TCalvingSurvey.Clear;
begin
   AnimalId := 0;
   LactNo := 0;
   HerdId := 0;
   EventId := 0;
   CalvingDate := 0;
   AbortedCalving := False;
   AssistedCalvingModerate := False;
   AssistedCalvingSerious := False;
   MilkFever := False;
   RetainedCleansing := False;
   DisplacedAbomasums := False;
   ConditionScore := Null;
   ConditionScoreComment := '';
   ShowCSInfo := False;
   ShowBirthTypeInfo := False;
   RegisterCalves  := False;
end;

constructor TCalvingSurvey.create;
begin
   Clear;
end;

end.
 