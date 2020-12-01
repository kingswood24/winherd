unit uProcessBarcodeScan;

interface

uses
   DairyData, GenTypesConst, SysUtils, db, Dialogs, DBTables;

type
   BarcodeScan = class
   private

      { Private Declarations }
   public
      { Public Declarations }
      FAnimalQuery : TQuery;
      constructor Create;
      destructor Destroy;
      procedure ProcessBarcodeScan (FScanCode : String; FCountry : Integer);
   end;

implementation

constructor BarcodeScan.Create;
begin
   FAnimalQuery := TQuery.Create(nil);
   FAnimalQuery.DatabaseName := AliasName;

   FAnimalQuery.FieldDefs.Add('DateOfBirth',ftDateTime,0,False);
   FAnimalQuery.FieldDefs.Add('Sex',ftString,10,False);
   FAnimalQuery.FieldDefs.Add('Breed',ftInteger,0,False);
end;

destructor BarcodeScan.Destroy;
begin
  inherited;
  if FAnimalQuery <> nil then
     begin
        FAnimalQuery.Active := False;
        FreeAndNil(FAnimalQuery);
     end;
end;

procedure BarcodeScan.ProcessBarcodeScan (FScanCode : String; FCountry : Integer);
var
   ScanStr : String;
   MyString : String;
   SetFocus : Boolean;
   DateOfBirth : String;
   BreedCode : String;
   Sex : Char;
   I : Integer;
begin
   SetFocus := False;

   if WinData.DefCountry(FCountry) = England then
      begin
         if ( Length(Trim(FScanCode)) > 0 ) then
            begin
               ScanStr := WinData.StripAllSpaces( FScanCode ) ;
               Delete(ScanStr, Length(ScanStr)-1,2);
               for i := Length(ScanStr) downto 1 do
                  begin
                     if ( ScanStr[i] in ['A'..'Z','a'..'z'] ) then
                        MyString := ScanStr[i] + MyString
                     else
                        Break;
                  end;

               Delete( ScanStr, Length(ScanStr)-Length(MyString)+1,Length( MyString ));
               Sex := MyString[1];
               Delete(MyString,1,1);
               BreedCode := MyString;
               MyString := '';

               for i := Length(ScanStr) downto 1 do
                  begin
                     if ( ScanStr[i] in ['0'..'9'] ) then
                        begin
                           MyString := ScanStr[i] + MyString;
                           if Length(MyString) = 8 then
                              Break;
                        end;
                  end;
               DateOfBirth := MyString;
               if WinData.AnimalFileByID.State in dsEditModes then
                  begin
                     WinData.AnimalFileByID.FieldByName('DateOfBirth').AsString := Copy(DateOfBirth, 1, 2) + '/' + Copy(DateOfBirth, 3, 2)+ '/' + Copy(DateOfBirth, 5, 4);
                     If (UPPERCASE(Sex) = 'F') then
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Female'
                     else if WinData.GlobalSettings.DefaultMaleSex <> '' then
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := WinData.GlobalSettings.DefaultMaleSex
                     else
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Bull';// Advice from George TGM

                     SetFocus := True;
                  end;

               if WinData.Breeds.Locate('Code', BreedCode,[]) then
                  begin
                     WinData.AnimalFileByID.FieldByName('PrimaryBreed').AsInteger := WinData.Breeds.FieldByName('ID').AsInteger;
                  end
               else
                  begin
                     ShowMessage('Animal Breed "' + BreedCode + '"  not in table, please add'  + #13 + 'breed code');
                     SetFocus := True;
                  end;
            end;
      end
   else
      begin
         If ( Length(FScanCode) >=11 ) Then //KB
            Begin
               WinData.AnimalFileByID.FieldByName('DateOfBirth').AsString := Copy(FScanCode, 1, 2) + '/' + Copy(FScanCode, 3, 2)+ '/' + Copy(FScanCode, 5, 4);
               WinData.AnimalFileByID.Edit;
               If (UPPERCASE(Copy(FScanCode, 9, 1)) = 'F') then
                  WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Female'
               else
                  begin
                     if WinData.GlobalSettings.DefaultMaleSex <> '' then
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := WinData.GlobalSettings.DefaultMaleSex
                     else
                        WinData.AnimalFileByID.FieldByName('Sex').AsString := 'Steer';
                     SetFocus := True;
                  end;
               MyString := (UPPERCASE(Copy(FScanCode, 10, (Strlen(PChar(FScanCode)) - 9))));
               WinData.Breeds.First;
               if WinData.Breeds.Locate('Code', MyString,[]) then
                  begin
                     WinData.AnimalFileByID.FieldByName('PrimaryBreed').AsInteger := WinData.Breeds.FieldByName('ID').AsInteger;
                  end
               else
                  begin
                     ShowMessage('Animal Breed ''' + (UpperCase(Copy(FScanCode, 10, Strlen(PChar(FScanCode))))) + '''  not in table, please add'  + #13 + 'breed code');
                     SetFocus := True;
                  end;
                //  WinData.AnimalFileByID.Post;
               FScanCode := '';
            end;
      end;
end;

end.
