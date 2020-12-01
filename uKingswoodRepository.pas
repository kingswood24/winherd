unit uKingswoodRepository;

interface
uses
   Classes, db, dbTables, SysUtils;

type
   TKingswoodRepository = class
   protected
      FQuery : TQuery;
   public
      constructor create(const ADatabasePath : string = '');
      destructor destroy;override;
   end;

implementation

{ TKingswoodRepository }

constructor TKingswoodRepository.create(const ADatabasePath : string);
begin
   FQuery := TQuery.Create(nil);
   if (Length(Trim(ADatabasePath)) > 0) then
      FQuery.DatabaseName := ADatabasePath
   else
      FQuery.DatabaseName := 'kingswd';
end;


destructor TKingswoodRepository.destroy;
begin
   if (FQuery <> nil) then
      begin
         FQuery.Close;
         FreeAndNil(FQuery);
      end;
  inherited;

end;

end.
