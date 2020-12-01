unit uCreateAnimalXMLIHMFileProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxProgressBar,
  db, dbTables, xml_generator, MSXML2_TLB,
  FileCtrl, GenTypesConst, ComObj, uPreferences, KRoutines,
  uAnimal, ExtCtrls;

type
  TfmCreateAnimalXMLIHMFileProgress = class(TForm)
    pbAnimalXMLIHMDataFile: TcxProgressBar;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    FDOMDocument : IXMLDOMDocument;
    FFieldToFile : String;
    FMaxAnimalsInXMLExport : Integer;
    FDataSet : TDataSet;
    FFileDirectory : String;
    procedure CreateXMLFile;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm (ADataSet : TDataSet);
  end;

var
  fmCreateAnimalXMLIHMFileProgress: TfmCreateAnimalXMLIHMFileProgress;

implementation

{$R *.DFM}

{ TfmAnimalXMLIHMDataFile }

procedure TfmCreateAnimalXMLIHMFileProgress.FormCreate(Sender: TObject);
begin
   FDOMDocument := nil;

   // If registry key for MaxAnimalsInXMLExportFile does not exist then create one and default it to 100.
   if ( not(Preferences.PreferenceExists(cMaxAnimalsInXMLExportFile)) ) then
      Preferences.ValueAsInteger[cMaxAnimalsInXMLExportFile] := 100;

   // Read MaxAnimalsInXMLExportFile registry key as FMaxAnimalsInXMLExport.
   FMaxAnimalsInXMLExport := Preferences.ValueAsInteger[cMaxAnimalsInXMLExportFile];

   FFileDirectory := IncludeTrailingBackslash(ApplicationPath)+'Kingswood Movements';
end;

class procedure TfmCreateAnimalXMLIHMFileProgress.ShowTheForm (ADataSet : TDataSet);
begin
   with TfmCreateAnimalXMLIHMFileProgress.Create(nil) do
      try
         FDataSet := ADataSet;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCreateAnimalXMLIHMFileProgress.FormActivate(Sender: TObject);
begin
   CreateXMLFile();
end;

procedure TfmCreateAnimalXMLIHMFileProgress.CreateXMLFile;
var
   D,
   M,
   Y : Word;
   ItemCount : Integer;
   S : String;
   HiddenFileWrite : Boolean;

   XMLDOMNodeList : IXMLDOMNodeList;
   XMLDOMNode, MovementXMLDOMNode, AnimalsNode : IXMLDOMNode;
   AnimalXMLDOMNode : IXMLDOMElement;

   EventDetailXMLDOMNode : IXMLDOMNode;
   EventsNode, EventNode : IXMLDOMElement;

   LactDetailNode : IXMLDOMNode;
   LactHistoryNode, LactNode : IXMLDOMElement;

   AnimalDetailXMLDOMNode : IXMLDOMElement;

   ProcInstr : IXMLDOMProcessingInstruction; // XML declaration

   FEventQuery : TQuery;
   FSubEventQuery : TQuery;

   FLactQuery : TQuery;
   CheckLactHistory : Boolean;

   DamNode : IXMLDOMElement;
   SireNode : IXMLDOMElement;
   BullNode : IXMLDOMElement;

   tmpNode : IXMLDOMNode;

   // New integers introduced to store Animal Count and File Count.
   iAnimalCount, iFileCount : Integer;

   // New boolean created to store when a nex XML file is generated.
   NewFileCreated : Boolean;

   FileName,
   BackupFileName,
   FilePath,
   BackupFilePath : String;

   Animal,
   DamInfo,
   SireInfo : TAnimal;

begin
   Timer.Enabled := False;
   if ( FDataSet = nil ) then Exit;

   FDataSet.DisableControls;
   DecodeDate(Date, Y, M, D);

   BackupFilePath := IncludeTrailingBackslash(FFileDirectory)+'Backup';

   if not DirectoryExists(FFileDirectory) then
      CreateDir(FFileDirectory);
   if not DirectoryExists(BackupFilePath) then
      CreateDir(BackupFilePath);

   FEventQuery := TQuery.Create(nil);
   FEventQuery.DatabaseName := AliasName;
   FEventQuery.SQL.Add('SELECT ID, AnimalLactNo, EventDate, EventType, EventDesc');
   FEventQuery.SQL.Add('FROM Events ');
   FEventQuery.SQL.Add('WHERE ( AnimalID=:AID ) ');
   FEventQuery.SQL.Add('AND EventType IN (1,2,3,4,5,6,38)');
   FEventQuery.SQL.Add('ORDER BY AnimalLactNo, EventDate');

   FSubEventQuery := TQuery.Create(nil);
   FSubEventQuery.DatabaseName := AliasName;

   FLactQuery := TQuery.Create(nil);
   FLactQuery.DatabaseName := AliasName;
   FLactQuery.SQL.Text := 'Select * From MilkDisk Where AnimalID=:AID Order By LactNo';

   FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   ProcInstr := FDOMDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'); // encoding="UTF-8"');
   FDOMDocument.appendChild(ProcInstr); // Add XML Declaration

   MovementXMLDOMNode := FDOMDocument.createElement('KingswoodMovements'); // Create Root Node
   FDOMDocument.appendChild(MovementXMLDOMNode); // Add Root Node

   AnimalsNode := FDOMDocument.createElement('Animals');
   MovementXMLDOMNode.appendChild(AnimalsNode);

   FileName := 'KWAnimalExport'+FormatDateTime(' dd mm yy hh nn',now)+'.xml';
   FilePath := IncludeTrailingBackslash(FFileDirectory)+FileName;
   BackupFilePath := IncludeTrailingBackslash(BackupFilePath)+FileName;

   pbAnimalXMLIHMDataFile.Properties.Min := 0;
   pbAnimalXMLIHMDataFile.Properties.Max := FDataSet.RecordCount;
   pbAnimalXMLIHMDataFile.Position := 0;
   Application.ProcessMessages;
   Update;

   FDataSet.DisableControls; { Disable controls }
   try
      with FDataSet do { Loop through table, write data file }
         begin
            First;
            // Set iAnimalCount to zero to start with.
            iAnimalCount := 0;
            // Set iFileCount to 1 to start with.
            iFileCount := 1;
            while not eof do
               begin
                  if ( (Copy(FilePath,Length(FilePath)-5,2) = '#'+IntToStr(iFileCount)) and (not(NewFileCreated)) ) then
                     begin
                        // If the file number of the last created XML file is the same as the file count and no new file has been created
                        // then create a new XML file.
                        FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                        ProcInstr := FDOMDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'); // encoding="UTF-8"');
                        FDOMDocument.appendChild(ProcInstr); // Add XML Declaration

                        MovementXMLDOMNode := FDOMDocument.createElement('KingswoodMovements'); // Create Root Node
                        FDOMDocument.appendChild(MovementXMLDOMNode); // Add Root Node

                        AnimalsNode := FDOMDocument.createElement('Animals');
                        MovementXMLDOMNode.appendChild(AnimalsNode);

                        // Set file created to True.
                        NewFileCreated := True;

                        // Increase the file count after each new XML file is created.
                        Inc(iFileCount);
                     end;

                  AnimalXMLDOMNode := FDOMDocument.createElement('Animal'); // Create Animal Node
                  AnimalsNode.appendChild(AnimalXMLDOMNode); // Add Animal Node

                  Animal := GetAnimal(FDataSet.FieldByName('AnimalID').AsInteger);

                  CheckLactHistory := ( (Animal.Sex = 'Female') and (Animal.LactNo > 0) );

                  { AnimalNo 10(Char) }
                  if ( Length(Animal.AnimalNo) > 0 ) then
                     begin
                        FFieldToFile := (Animal.AnimalNo);
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('AnimalNo');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { NatIDNum 20(Char) }
                  if ( Length(Animal.NatIdNum) > 0 ) then
                     begin
                        FFieldToFile := (Animal.NatIdNum);
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('NatIDNum');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { DateOfBirth 10(Char) }
                  if Animal.DateOfBirth > 0 then
                     begin
                        FFieldToFile := (DateToStr(Animal.DateOfBirth));
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('DOB');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { BreedCode 3(Char) }
                  if ( Length(Animal.BreedCode) > 0 ) then
                     begin
                        FFieldToFile := Animal.BreedCode;
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('BreedCode');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { Sex 1(Char) }
                  if Animal.Sex = 'Female' then
                     FFieldToFile := 'Female'
                  else if Animal.Sex = 'Bull' then
                     FFieldToFile := 'Bull'
                  else if Animal.Sex = 'Steer' then
                     FFieldToFile := 'Steer';

                  AnimalDetailXMLDOMNode := FDOMDocument.createElement('Sex');
                  AnimalDetailXMLDOMNode.text := FFieldToFile;
                  AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

                  if ( FFieldToFile = 'Female' ) then
                     begin
                        FFieldToFile := (IntToStr(Animal.LactNo));
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('LactNo');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;
                  FFieldToFile := '';

                  { Colour Code 3(Char) }
                  if ( Length(Animal.ColourCode) > 0 ) then
                     begin
                        FFieldToFile := (Animal.ColourCode);
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('ColourCode');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { Name 40(Char) }
                  if ( Length(Animal.Name) > 0 ) then
                     begin
                        FFieldToFile := Animal.Name;
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('Name');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { HerdBookNo 16(Char) }
                  if ( Length(Animal.HerdBookNo) > 0 ) then
                     begin
                        FFieldToFile := Animal.HerdBookNo;
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('HerdBookNo');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { TransponderNo 20(Char) }
                  if ( Length(Animal.TransponderNo) > 0 ) then
                     begin
                        FFieldToFile := Animal.TransponderNo;
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('TransponderNo');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { Breeding 1(Char) }
                  if ( Animal.Breeding ) then
                     FFieldToFile := 'True'
                  else
                     FFieldToFile := 'False';

                  AnimalDetailXMLDOMNode := FDOMDocument.createElement('Breeding');
                  AnimalDetailXMLDOMNode.text := FFieldToFile;
                  AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

                  FFieldToFile := '';

                  { TBTest Date 10(Char) 15 - Bruce Test Date 10(Char) }
                  if ( Animal.TBTestDate > 0 ) then
                     begin
                        FFieldToFile := (DateToStr(Animal.TBTestDate));
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('TBTestDate');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  { TBTest Date 10(Char) 15 - Bruce Test Date 10(Char) }
                  if ( Animal.BruceTestDate > 0 ) then
                     begin
                        FFieldToFile := (DateToStr(Animal.BruceTestDate));
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('BruceDate');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  {
                  if FDataSet.FieldByName('Price').Value <> Null then
                     begin
                        FFieldToFile := (FDataSet.FieldByName('Price').Value);
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('Price');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  if FDataSet.FieldByName('Weight').Value <> Null then
                     begin
                        FFieldToFile := FDataSet.FieldByName('Weight').Value;
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('Weight');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;

                  if FDataSet.FieldByName('LotNumber').Value <> Null then
                     begin
                        FFieldToFile := FDataSet.FieldByName('LotNumber').Value;
                        AnimalDetailXMLDOMNode := FDOMDocument.createElement('LotNumber');
                        AnimalDetailXMLDOMNode.text := FFieldToFile;
                        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                     end;
                  }

                  { 16 - Dam NatID Num 20(Char) 17 - Sire NatID Num 20(Char) }
                  DamInfo := GetAnimal(Animal.DamId);
                  if ( DamInfo <> nil ) then
                     begin
                        if ( Length(DamInfo.NatIdNum) > 0 ) then
                           begin
                              FFieldToFile := (DamInfo.NatIdNum);
                              AnimalDetailXMLDOMNode := FDOMDocument.createElement('DamIDNum');
                              AnimalDetailXMLDOMNode.text := FFieldToFile;
                              AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                           end;
                     end;

                  SireInfo := GetAnimal(Animal.SireID);
                  if ( SireInfo <> nil ) then
                     begin
                        if ( Length(SireInfo.NatIdNum) > 0 ) then
                           begin
                              FFieldToFile := (SireInfo.NatIdNum);
                              AnimalDetailXMLDOMNode := FDOMDocument.createElement('SireIDNum');
                              AnimalDetailXMLDOMNode.text := FFieldToFile;
                              AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                           end;
                     end;

                  if ( DamInfo <> nil ) then
                     begin
                        DamNode := FDOMDocument.createElement('Dam');

                        tmpNode := FDOMDocument.createElement('NatIDNum');
                        tmpNode.Text := DamInfo.NatIdNum;
                        DamNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('AnimalNo');
                        tmpNode.Text := DamInfo.AnimalNo;
                        DamNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('Sex');
                        tmpNode.Text := DamInfo.Sex;
                        DamNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('DOB');
                        tmpNode.Text := DateToStr(DamInfo.DateOfBirth);
                        DamNode.AppendChild(tmpNode);

                        if ( DamInfo.Sex = 'Female' ) then
                           begin
                              tmpNode := FDOMDocument.createElement('LactNo');
                              tmpNode.Text := IntToStr(DamInfo.LactNo);
                              DamNode.AppendChild(tmpNode);
                           end;

                        tmpNode := FDOMDocument.createElement('Breed');
                        tmpNode.Text := DamInfo.BreedCode;
                        DamNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('Colour');
                        tmpNode.Text := DamInfo.ColourCode;
                        DamNode.AppendChild(tmpNode);

                        AnimalXMLDOMNode.appendChild(DamNode);
                     end;

                  if ( SireInfo <> nil ) then
                     begin
                        SireNode := FDOMDocument.createElement('Sire');

                        tmpNode := FDOMDocument.createElement('NatIDNum');
                        tmpNode.Text := SireInfo.NatIdNum;
                        SireNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('AnimalNo');
                        tmpNode.Text := SireInfo.AnimalNo;
                        SireNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('Sex');
                        tmpNode.Text := SireInfo.Sex;
                        SireNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('DOB');
                        tmpNode.Text := DateToStr(SireInfo.DateOfBirth);
                        SireNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('Breed');
                        tmpNode.Text := SireInfo.BreedCode;
                        SireNode.AppendChild(tmpNode);

                        tmpNode := FDOMDocument.createElement('Colour');
                        tmpNode.Text := SireInfo.ColourCode;
                        SireNode.AppendChild(tmpNode);

                        AnimalXMLDOMNode.appendChild(SireNode);
                     end;

                  EventsNode := FDOMDocument.createElement('Events');
                  AnimalXMLDOMNode.appendChild(EventsNode);

                  FEventQuery.Active := False;
                  FEventQuery.Params[0].AsInteger := Animal.Id;
                  FEventQuery.Active := True;
                  try
                     if ( FEventQuery.RecordCount > 0 ) then
                        begin

                           FEventQuery.First;
                           while not FEventQuery.eof do
                              begin
                                 EventNode := FDOMDocument.createElement('Event');
                                 EventNode.setAttribute('Type', FEventQuery.FieldByName('EventType').AsInteger);
                                 EventNode.setAttribute('LactNo', FEventQuery.FieldByName('AnimalLactNo').AsInteger);

                                 EventDetailXMLDOMNode := FDOMDocument.createElement('EventDate');
                                 EventDetailXMLDOMNode.text := DateToStr(FEventQuery.FieldByName('EventDate').AsDateTime);
                                 EventNode.appendChild(EventDetailXMLDOMNode);

                                 EventDetailXMLDOMNode := FDOMDocument.createElement('EventDesc');
                                 EventDetailXMLDOMNode.text := FEventQuery.FieldByName('EventDesc').AsString;
                                 EventNode.appendChild(EventDetailXMLDOMNode);

                                 case FEventQuery.FieldByName('EventType').AsInteger of
                                    1 : begin
                                           FSubEventQuery.SQL.Clear;
                                           FSubEventQuery.SQL.Add('SELECT A.AnimalNo, A.NatIdNum, A.DateOfBirth, A.Name, A.HerdBookNo, B.Code');
                                           FSubEventQuery.SQL.Add('FROM Animals A');
                                           FSubEventQuery.SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
                                           FSubEventQuery.SQL.Add('WHERE (A.ID = (SELECT PlannedBull From Bullings');
                                           FSubEventQuery.SQL.Add('              WHERE (EventID=:EID)))');
                                           FSubEventQuery.SQL.Add('AND (( A.AnimalNo IS NOT NULL ) OR ( A.NatIdNum IS NOT NULL ) OR ( A.Name IS NOT NULL ) OR ( A.HerdBookNo IS NOT NULL ) ) ');
                                           FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                           FSubEventQuery.Open;

                                           try
                                              if FSubEventQuery.RecordCount > 0 then
                                                 begin
                                                    FSubEventQuery.First;

                                                    BullNode := FDOMDocument.createElement('PlannedBull');

                                                    tmpNode := FDOMDocument.createElement('AnimalNo');
                                                    tmpNode.text := FSubEventQuery.FieldByName('AnimalNo').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('NatIdNum');
                                                    tmpNode.text := FSubEventQuery.FieldByName('NatIdNum').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('DOB');
                                                    tmpNode.text := DateToStr(FSubEventQuery.FieldByName('DateOfBirth').AsDateTime);
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('Name');
                                                    tmpNode.text := FSubEventQuery.FieldByName('Name').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('HerdBookNo');
                                                    tmpNode.text := FSubEventQuery.FieldByName('HerdBookNo').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('Breed');
                                                    tmpNode.text := FSubEventQuery.FieldByName('Code').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    EventNode.appendChild(BullNode);
                                                 end;
                                           finally
                                              FSubEventQuery.Close;
                                           end;
                                        end;
                                    2 : begin
                                           FSubEventQuery.SQL.Clear;
                                           FSubEventQuery.SQL.Add('SELECT A.AnimalNo, A.NatIdNum, A.DateOfBirth, A.Name, B.Code');
                                           FSubEventQuery.SQL.Add('FROM Animals A');
                                           FSubEventQuery.SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
                                           FSubEventQuery.SQL.Add('WHERE (A.ID = (SELECT ServiceBull From Services');
                                           FSubEventQuery.SQL.Add('              WHERE (EventID=:EID)))');
                                           FSubEventQuery.SQL.Add('AND (( A.AnimalNo IS NOT NULL ) OR ( A.NatIdNum IS NOT NULL ) OR ( A.Name IS NOT NULL ) OR ( A.HerdBookNo IS NOT NULL ) ) ');
                                           FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                           FSubEventQuery.Open;

                                           try
                                              if FSubEventQuery.RecordCount > 0 then
                                                 begin
                                                    FSubEventQuery.First;

                                                    BullNode := FDOMDocument.createElement('ServiceBull');

                                                    tmpNode := FDOMDocument.createElement('AnimalNo');
                                                    tmpNode.text := FSubEventQuery.FieldByName('AnimalNo').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('NatIdNum');
                                                    tmpNode.text := FSubEventQuery.FieldByName('NatIdNum').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('DOB');
                                                    tmpNode.text := DateToStr(FSubEventQuery.FieldByName('DateOfBirth').AsDateTime);
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('Name');
                                                    tmpNode.text := FSubEventQuery.FieldByName('Name').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    tmpNode := FDOMDocument.createElement('Breed');
                                                    tmpNode.text := FSubEventQuery.FieldByName('Code').AsString;
                                                    BullNode.appendChild(tmpNode);

                                                    EventNode.appendChild(BullNode);
                                                 end;
                                           finally
                                              FSubEventQuery.Close;
                                           end;
                                        end;
                                    3 : begin
                                           FSubEventQuery.SQL.Clear;
                                           FSubEventQuery.SQL.Add('SELECT P.PregnancyStatus, P.NoCalves, P.DaysInCalf');
                                           FSubEventQuery.SQL.Add('FROM PregnancyDiag P');
                                           FSubEventQuery.SQL.Add('WHERE (P.EventID=:EID)');
                                           FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                           FSubEventQuery.Open;

                                           try
                                              if FSubEventQuery.RecordCount > 0 then
                                                 begin

                                                    FSubEventQuery.First;

                                                    EventDetailXMLDOMNode := FDOMDocument.createElement('PregnancyStatus');
                                                    if FSubEventQuery.FieldByName('PregnancyStatus').AsBoolean then
                                                       EventDetailXMLDOMNode.text := 'Pregnant'
                                                    else
                                                       EventDetailXMLDOMNode.text := 'Not Pregnant';
                                                    EventNode.appendChild(EventDetailXMLDOMNode);

                                                    EventDetailXMLDOMNode := FDOMDocument.createElement('NoCalves');
                                                    EventDetailXMLDOMNode.text := IntToStr(FSubEventQuery.FieldByName('NoCalves').AsInteger);
                                                    EventNode.appendChild(EventDetailXMLDOMNode);

                                                    EventDetailXMLDOMNode := FDOMDocument.createElement('DaysInCalf');
                                                    EventDetailXMLDOMNode.text := IntToStr(FSubEventQuery.FieldByName('DaysInCalf').AsInteger);
                                                    EventNode.appendChild(EventDetailXMLDOMNode);
                                                 end;

                                           finally
                                              FSubEventQuery.Close;
                                           end;

                                        end;
                                    4,
                                    6,
                                   38 : begin
                                           FSubEventQuery.SQL.Clear;
                                           FSubEventQuery.SQL.Add('SELECT M.DrugCode, H.RateApplic, M.VPANo ');
                                           FSubEventQuery.SQL.Add('FROM Health H');
                                           FSubEventQuery.SQL.Add('LEFT JOIN Medicine M ON (M.ID=H.DrugUsed)');
                                           FSubEventQuery.SQL.Add('WHERE (H.EventID=:EID)');
                                           FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                           FSubEventQuery.Open;

                                           try
                                              if FSubEventQuery.RecordCount > 0 then
                                                 begin
                                                    FSubEventQuery.First;

                                                    EventDetailXMLDOMNode := FDOMDocument.createElement('DrugCode');
                                                    EventDetailXMLDOMNode.text := FSubEventQuery.FieldByName('DrugCode').AsString;
                                                    EventNode.appendChild(EventDetailXMLDOMNode);

                                                    EventDetailXMLDOMNode := FDOMDocument.createElement('VPANo');
                                                    EventDetailXMLDOMNode.text := FSubEventQuery.FieldByName('VPANo').AsString;
                                                    EventNode.appendChild(EventDetailXMLDOMNode);

                                                    EventDetailXMLDOMNode := FDOMDocument.createElement('ApplicRate');
                                                    EventDetailXMLDOMNode.text := FloatToStr(FSubEventQuery.FieldByName('RateApplic').AsFloat);
                                                    EventNode.appendChild(EventDetailXMLDOMNode);
                                                 end;

                                           finally
                                              FSubEventQuery.Close;
                                           end;

                                        end;
                                    5 : begin
                                           // Calving nothing to export yet 10 /2/ 10
                                        end;
                                 end;

                                 EventsNode.appendChild(EventNode);
                                 FEventQuery.Next;
                              end;
                        end
                  finally
                     FEventQuery.Active := False;
                  end;

                  if CheckLactHistory then
                     begin
                        LactHistoryNode := FDOMDocument.createElement('Lactations');
                        AnimalXMLDOMNode.appendChild(LactHistoryNode);

                        FLactQuery.Active := False;
                        FLactQuery.Params[0].AsInteger := Animal.Id;
                        FLactQuery.Active := True;
                        try

                           if ( FLactQuery.RecordCount > 0 ) then
                              begin

                                 FLactQuery.First;
                                 while not FLactQuery.eof do
                                    begin
                                       LactNode := FDOMDocument.createElement('Lact');
                                       LactNode.setAttribute('No', FLactQuery.FieldByName('LactNo').AsInteger);

                                       LactDetailNode := FDOMDocument.createElement('DY');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyYield').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('DBPc');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyBfatPerc').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('DPPc');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyProtPerc').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('DLPc');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyLactosePerc').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('CY');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumYield').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('CBPc');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumBfatPerc').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('CPPc');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumProtPerc').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('CLPc');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumLactosePerc').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('Recs');
                                       LactDetailNode.text := IntToStr(FLactQuery.FieldByName('NoOfRecordings').AsInteger);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('DIM');
                                       LactDetailNode.text := IntToStr(FLactQuery.FieldByName('DaysInMilk').AsInteger);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('Y305');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('Yield305').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('BPc305');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('BfatPerc305').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('PPc305');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('ProtPerc305').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('LPc305');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('LactosePerc305').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactDetailNode := FDOMDocument.createElement('SCC');
                                       LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('SCC').AsFloat);
                                       LactNode.appendChild(LactDetailNode);

                                       LactHistoryNode.appendChild(LactNode);

                                       FLactQuery.Next;
                                    end;
                              end
                        finally
                           FLactQuery.Active := False;
                        end;
                     end;

                  Inc(iAnimalCount);
                  // If the animal count is FMaxAnimalsInXMLExport and the first file then create file name with #1 at the end.
                  if ( (iAnimalCount div FMaxAnimalsInXMLExport) = 1 ) and ( iFileCount = 1 ) then
                     begin
                        if ( Copy(FilePath,Length(FilePath)-3,4) ) = '.xml' then
                           FilePath := Copy(FilePath,0,Length(FilePath)-4)+'#1.xml';
                        if ( Copy(BackupFilePath,Length(BackupFilePath)-3,4) ) = '.xml' then
                           BackupFilePath := Copy(BackupFilePath,0,Length(BackupFilePath)-4)+'#1.xml';
                        FDOMDocument.Save(FilePath);
                        FDOMDocument.Save(BackupFilePath);
                        NewFileCreated := False;
                     end
                  // If the animal count is the file count * FMaxAnimalsInXMLExport then this must be the next file to create.
                  else if ( (iAnimalCount = ( iFileCount * FMaxAnimalsInXMLExport )) ) then
                     begin
                        if ( Copy(FilePath,Length(FilePath)-3,4) ) = '.xml' then
                           FilePath := Copy(FilePath,0,Length(FilePath)-6)+'#'+IntToStr(iFileCount)+'.xml';
                        if ( Copy(BackupFilePath,Length(BackupFilePath)-3,4) ) = '.xml' then
                           BackupFilePath := Copy(BackupFilePath,0,Length(BackupFilePath)-6)+'#'+IntToStr(iFileCount)+'.xml';
                        FDOMDocument.Save(FilePath);
                        FDOMDocument.Save(BackupFilePath);
                        NewFileCreated := False;
                     end;

                  pbAnimalXMLIHMDataFile.Position := pbAnimalXMLIHMDataFile.Position+1;
                  Application.ProcessMessages;
                  Update;

                  Next;
              end;
        end;

     // If the first file has been created the save the remainder of animals that were put into the last XML file
     // then save this remainder to its own XML file.
     if ( iFileCount > 1 ) then
        begin
           if ( Copy(FilePath,Length(FilePath)-5,1) ) = '#' then
              FilePath := Copy(FilePath,0,Length(FilePath)-6)+'#'+IntToStr(iFileCount)+'.xml';
           if ( Copy(BackupFilePath,Length(BackupFilePath)-5,1) ) = '#' then
              BackupFilePath := Copy(FilePath,0,Length(BackupFilePath)-6)+'#'+IntToStr(iFileCount)+'.xml';
           FDOMDocument.Save(FilePath);
           FDOMDocument.Save(BackupFilePath);
        end
     else
        // Else if only one file was created then save the file without a "#" at the end of the file name.
        begin
           FDOMDocument.Save(FilePath);
           FDOMDocument.Save(BackupFilePath);
        end;

     if not FileExists(FilePath) then
        raise Exception.Create('Error creating file. Contact Kingswood Computing Ltd.');
   finally
      FDataSet.First;
      FDataSet.EnableControls;

      Timer.Enabled := True;
   end;
end;

procedure TfmCreateAnimalXMLIHMFileProgress.TimerTimer(Sender: TObject);
begin
   Close;
end;

end.