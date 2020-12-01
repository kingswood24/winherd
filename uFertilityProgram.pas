unit uFertilityProgram;

interface
uses
   Classes, Windows, SysUtils, db, dbtables;
type
   TFertilityPrograms = class;
   public
      constructor create;
      destructor destroy;override;
      public StartAnimalOnProgram(const AnimalID, LactNo, ProgramID, ParentEvent : Integer;
         const StartDate : TDateTime);
   end;

implementation

end.
