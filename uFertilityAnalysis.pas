{
   17/02/11 [V4.0 R8.2] /MK Additional Feature - New Feature For Kay Carson Weekly Export.

   28/09/11 [V5.0 R0.9] /MK Additional Feature - Changed Caption To Weekly Diary And Export File FileName To WeeklyDiary.

   09/02/12 [V5.0 R3.7] /MK Additional Feature - New CheckBox - If Unticked Do Not Export AnimalId's Just Animal Counts.
}

unit uFertilityAnalysis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  DB, DBTables, StdCtrls, cxButtons, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar, GenTypesConst,
  contnrs, cxCheckBox;

const
   MildMastitis = 'Mastitis - Mild';
   ModerateMastitis = 'Mastitis - Moderate';
   SevereMastitis = 'Mastitis - Severe';
   Lameness = 'Lameness';
   ClinicalLameness = 'Clinical Lameness';

type
  TServiceAnalysis = class
     Cows1stService,
     Cows2ndService,
     Cows3rdService,
     Cows4thService,
     Cows5AndMoreServices : Integer;
     Heifers1stService,
     Heifers2ndService,
     Heifers3rdService,
     Heifers4thService,
     Heifers5AndMoreServices : Integer;
     StrawsUsed : Double;

     constructor create;
  end;

  TEventDetail = class
     NatIdNum,
     AnimalNo,
     Comment : string;
     LactNo : Integer;
     constructor create;
  end;

  TCalvingDetail = class(TEventDetail)
  private
    function GetHasMultiCalves: Boolean;
  public
     LiveMaleCount, LiveFemaleCount : Byte;
     DeadMaleCount, DeadFemaleCount : Byte;
     constructor create;
     property HasMultiCalves : Boolean read GetHasMultiCalves;
  end;

  TCalvings = class(TObjectList)
  private
    FIndex : Integer;
  public
    function AddCalvingDetail : TCalvingDetail;
    procedure First;
    procedure Next;
    function Eof : Boolean;
    function CurrentEvent : TCalvingDetail;
  end;

  TCalvingAnalysis = class
     AbortedCalveCount : Integer;
     AbortedCalvings : TCalvings;

     AssistedCalvingModerateCount : Integer;
     AssistedCalvingsModerate : TCalvings;

     AssistedCalvingSeriousCount : Integer;
     AssistedCalvingsSerious : TCalvings;

     MilkFeverCount : Integer;
     MilkFeverCalvings : TCalvings;

     RetainedCleansingsCount : Integer;
     RetainedCleansingCalvings : TCalvings;

     DisplacedAbomasumsCount : Integer;
     DisplacedAbomasumCalvings : TCalvings;

     DirtyAt3WeeksAfterCalvingCount : Integer;
     DirtyAt3WeeksAfterCalvings : TCalvings;

     CowStillBornCalvingCount : Integer;
     HeiferStillBornCalvingCount : Integer;
     StillBornCalvings : TCalvings;

     CowLiveBirthCalvingCount : Integer;
     HeiferLiveBirthCalvingCount : Integer;
     AllCalvings : TCalvings;

     CowDeathAtBirthCalvingCount : Integer;
     HeiferDeathAtBirthCalvingCount : Integer;
     DeathAtBirthCalvings : TCalvings;

     ScouringCalvingCount : Integer; // ??? not sure about this one - check with GL.!
     constructor create;
     destructor destroy; override;
  end;

  THealthEvents = class(TObjectList)
  private
    FIndex : Integer;
  public
    function AddEventDetail : TEventDetail;
    procedure First;
    procedure Next;
    function Eof : Boolean;
    function CurrentEvent : TEventDetail;
  end;

  THealthAnalysis = class
     MildMastitisCount,
     ModerateMastitisCount,
     SevereMastitisCount,
     LamenessCount,
     ClinicalLamnessCount : Integer;

     MildMastitisEvents,
     ModerateMastitisEvents,
     SevereMastitisEvents,
     LamenessEvents,
     ClinicalLamnessEvents : THealthEvents;

     FootTrimmer, FootBath : Boolean;
     constructor create;
     destructor destroy;override;
  end;

  TfmFertilityAnalysis = class(TfmBaseForm)
    cxMemo1: TcxMemo;
    btnLoad: TcxButton;
    deFromDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deToDate: TcxDateEdit;
    SaveDialog: TSaveDialog;
    cbExportAnimalIDs: TcxCheckBox;
    procedure btnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);

  private
    { Private declarations }
    FServiceAnalysis : TServiceAnalysis;
    FCalvingAnalysis : TCalvingAnalysis;
    FHealthAnalysis : THealthAnalysis;
    FEventQuery : TQuery;
    procedure SetupForm;
    function GetServiceAnalysis(AFromDate, AToDate : TDateTime) : TServiceAnalysis;
    function GetCalvingAnalysis(AFromDate, AToDate : TDateTime) : TCalvingAnalysis;
    function GetHealthAnalysis(AFromDate, AToDate : TDateTime) : THealthAnalysis;
    procedure AddAnimalIdToEventDetail(AEventDetail : TEventDetail);
    function IsStillBirth : Boolean;
    function LiveCalveBirth : Boolean;
    function IsMultiBirth : Boolean;

    procedure AddToLog(AText : String);

    function IsInfectedAfterCalving(const AAnimalId, ALactNo : Integer) : string;
  public
    { Public declarations }
    class procedure ShowForm();
  end;

var
  fmFertilityAnalysis: TfmFertilityAnalysis;

implementation
uses
   kRoutines;

{$R *.DFM}

{ TfmFertilityAnalysis }

function TfmFertilityAnalysis.GetServiceAnalysis(AFromDate,
  AToDate: TDateTime): TServiceAnalysis;
var
   AnimalIdsString : String;
   AnimalIds : array of Integer;
   ArrayIndex : Integer;
begin

   ArrayIndex := 0;
   AnimalIdsString := '';
   SetLength(AnimalIds, ArrayIndex);
   Result := TServiceAnalysis.Create;

   with FEventQuery do
      begin
         // get all animals served in period.
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(A.ID)');
         SQL.Add('FROM Events E');
         SQL.Add('INNER JOIN Animals A ON (A.Id=E.AnimalId)');
         SQL.Add('WHERE (E.EventType = 2)');
         SQL.Add('AND (E.AnimalLactNo=A.LactNo)');
         SQL.Add('AND (E.EventDate BETWEEN :AFromDate AND :AToDate)');
         SQL.Add('AND (A.Sex="Female")');
         SQL.Add('AND (A.HerdId=:HerdId)');
         SQL.Add('AND (A.InHerd=True)');
         SQL.Add('AND (A.Breeding=True)');
         Params[0].AsDateTime := deFromDate.Date;
         Params[1].AsDateTime := deToDate.Date;
         Params[2].AsInteger := UserDefaultHerdID;
         Open;

         try
            First;
            while not eof do
               begin
                  SetLength(AnimalIds, ArrayIndex+1);
                  AnimalIds[ArrayIndex] := Fields[0].AsInteger;
                  Inc(ArrayIndex);
                  Next;
               end;
         finally
            Close;
         end;

         if ( ArrayIndex = 0 ) then
            begin
               Exit; // no services have been found using specified filter
            end;

         AnimalIdsString := IntArrayToSQLInString(AnimalIds);

         SQL.Clear;
         SQL.Add('SELECT A.AnimalNo, A.LactNo, Count(E.ID) CountOfEvents, Sum(S.AmountOfStraw) StrawsUsed');
         SQL.Add('FROM Events E');
         SQL.Add('INNER JOIN Services S ON (S.EventId=E.Id)');
         SQL.Add('INNER JOIN Animals A ON (A.Id=E.AnimalId)');
         SQL.Add('WHERE (E.AnimalId IN '+AnimalIdsString+')');
         SQL.Add('AND (E.EventType = 2)');
         SQL.Add('AND (E.AnimalLactNo=A.LactNo)');
         SQL.Add('AND (E.EventDate BETWEEN :AFromDate AND :AToDate)');
         SQL.Add('GROUP BY A.AnimalNo, A.LactNo');
         // Services will only happen in three month period.
         // Limit the event date range to 3 months from ToDate.
         Params[0].AsDateTime := IncMonth(deToDate.Date, -3);
         Params[1].AsDateTime := deToDate.Date;
         Open;
         try
            First;
            while not eof do
               begin
                  case ( FieldByName('CountOfEvents').AsInteger ) of
                     1 : begin
                            if FieldByName('LactNo').AsInteger > 0 then
                               Inc(Result.Cows1stService)
                            else
                               Inc(Result.Heifers1stService);
                         end;
                     2 : begin
                            if FieldByName('LactNo').AsInteger > 0 then
                               Inc(Result.Cows2ndService)
                            else
                               Inc(Result.Heifers2ndService);
                         end;
                     3 : begin
                            if FieldByName('LactNo').AsInteger > 0 then
                               Inc(Result.Cows3rdService)
                            else
                               Inc(Result.Heifers3rdService);
                         end;
                     4 : begin
                            if FieldByName('LactNo').AsInteger > 0 then
                               Inc(Result.Cows4thService)
                            else
                               Inc(Result.Heifers4thService);
                         end;
                   else
                      begin
                          if FieldByName('CountOfEvents').AsInteger > 4 then
                             begin
                                if FieldByName('LactNo').AsInteger > 0 then
                                   Inc(Result.Cows5AndMoreServices)
                                else
                                   Inc(Result.Heifers5AndMoreServices)
                             end;
                      end;
                  end;
                  Result.StrawsUsed := Result.StrawsUsed + FieldByName('StrawsUsed').AsFloat;
                  Next;
               end;
         finally
            Close;
         end;
      end;
end;

function TfmFertilityAnalysis.GetCalvingAnalysis(AFromDate,
  AToDate: TDateTime): TCalvingAnalysis;
var
   CalvingDetail : TCalvingDetail;
   CalfIndex : Byte;
   BirthType : string;
   FertilityCheckComment : string;
begin

   Result := TCalvingAnalysis.Create;

   with FEventQuery do
      begin
         // get all calving records in specified period.
         SQL.Clear;

         SQL.Add('SELECT A.ID, A.NatIdNum, A.AnimalNo, A.LactNo, E.EventDate, C.ID1, C.ID2, C.ID3, C.ID4,');
         SQL.Add('C.CalfDead1, C.CalfDead2, C.CalfDead3, C.CalfDead4, G.Description BirthType,');
         SQL.Add('C1.NatIdNum, C2.NatIdNum, C3.NatIdNum, C4.NatIdNum, C1.Sex Calf1Sex, C2.Sex Calf2Sex,');
         SQL.Add('C3.Sex Calf3Sex, C4.Sex Calf4Sex, E.EventDesc Comment,');
         SQL.Add('C.AbortedCalving, C.AssistedCalvingModerate, C.AssistedCalvingSerious, ');
         SQL.Add('C.MilkFever, C.RetainedCleansing, C.DisplacedAbomasums');
         SQL.Add('FROM Events E');
         SQL.Add('INNER JOIN Animals A ON (A.Id=E.AnimalId)');
         SQL.Add('INNER JOIN Calvings C ON (C.EventId=E.Id)');
         SQL.Add('LEFT JOIN Animals C1 ON (C1.Id=C.Id1)');
         SQL.Add('LEFT JOIN Animals C2 ON (C2.Id=C.Id2)');
         SQL.Add('LEFT JOIN Animals C3 ON (C3.Id=C.Id3)');
         SQL.Add('LEFT JOIN Animals C4 ON (C4.Id=C.Id4)');
         SQL.Add('LEFT JOIN Genlook G ON (G.Id=C.BirthType)');
         SQL.Add('WHERE (E.EventType = 5)');
         SQL.Add('AND (E.AnimalLactNo=A.LactNo)');
         SQL.Add('AND (E.EventDate BETWEEN :AFromDate AND :AToDate)');
         SQL.Add('AND (A.Sex="Female")');
         SQL.Add('AND (A.HerdId=:HerdId)');
         SQL.Add('AND (A.InHerd=True)');
         Params[0].AsDateTime := AFromDate;
         Params[1].AsDateTime := AToDate;
         Params[2].AsInteger := UserDefaultHerdID;
         Open;

         if ( RecordCount = 0 ) then
            begin
               Exit; // no Calvings have been found using specified filter
            end;

         try
            First;
            while not eof do
               begin
                  if ( FieldByName('AbortedCalving').AsBoolean ) then
                     begin
                        Inc(Result.AbortedCalveCount);
                        AddAnimalIdToEventDetail(Result.AbortedCalvings.AddCalvingDetail);
                     end;

                  if ( FieldByName('AssistedCalvingModerate').AsBoolean ) then
                     begin
                        Inc(Result.AssistedCalvingModerateCount);
                        AddAnimalIdToEventDetail(Result.AssistedCalvingsModerate.AddCalvingDetail);
                     end;

                  if ( FieldByName('AssistedCalvingSerious').AsBoolean ) then
                     begin
                        Inc(Result.AssistedCalvingSeriousCount);
                        AddAnimalIdToEventDetail(Result.AssistedCalvingsSerious.AddCalvingDetail);
                     end;

                  if ( FieldByName('MilkFever').AsBoolean ) then
                     begin
                        Inc(Result.MilkFeverCount);
                        AddAnimalIdToEventDetail(Result.MilkFeverCalvings.AddCalvingDetail);
                     end;

                  if ( FieldByName('RetainedCleansing').AsBoolean ) then
                     begin
                        Inc(Result.RetainedCleansingsCount);
                        AddAnimalIdToEventDetail(Result.RetainedCleansingCalvings.AddCalvingDetail);
                     end;

                  if ( FieldByName('DisplacedAbomasums').AsBoolean ) then
                     begin
                        Inc(Result.DisplacedAbomasumsCount);
                        AddAnimalIdToEventDetail(Result.DisplacedAbomasumCalvings.AddCalvingDetail);
                     end;
                  // Remember to check for fertility event.

                  BirthType := UPPERCASE(FieldByName('BirthType').AsString);

                  if IsStillBirth then
                     begin
                        CalvingDetail := Result.DisplacedAbomasumCalvings.AddCalvingDetail;
                        AddAnimalIdToEventDetail(CalvingDetail);
                        if CalvingDetail.LactNo = 1 then
                            Inc(Result.HeiferStillBornCalvingCount)
                        else
                            Inc(Result.CowStillBornCalvingCount);
                     end
                  else
                     begin
                        CalvingDetail := Result.AllCalvings.AddCalvingDetail;
                        { prop CalvingDetail.HasMultiCalves }
                        AddAnimalIdToEventDetail(CalvingDetail);

                        if LiveCalveBirth then
                           begin
                              if CalvingDetail.LactNo = 1 then
                                  Inc(Result.HeiferLiveBirthCalvingCount)
                              else
                                  Inc(Result.CowLiveBirthCalvingCount)
                           end;

                        for CalfIndex := 1 to 4 do
                           begin
                              if ( FieldByName(Format('ID%d',[CalfIndex])).AsInteger > 0 ) then
                                 begin
                                    if ( FieldByName(Format('Calf%dSex',[CalfIndex])).AsString = cSex_Female ) then
                                        begin
                                           if not ( FieldByName(Format('CalfDead%d',[CalfIndex])).AsBoolean ) then
                                              Inc(CalvingDetail.LiveFemaleCount)
                                           else
                                              Inc(CalvingDetail.DeadFemaleCount);
                                        end
                                    else if ( FieldByName(Format('Calf%dSex',[CalfIndex])).AsString = cSex_Bull ) or ( FieldByName(Format('Calf%dSex',[CalfIndex])).AsString = cSex_Steer ) then
                                        begin
                                           if not ( FieldByName(Format('CalfDead%d',[CalfIndex])).AsBoolean ) then
                                              Inc(CalvingDetail.LiveMaleCount)
                                           else
                                              Inc(CalvingDetail.DeadMaleCount);
                                        end;
                                 end;
                           end;

                        if ( CalvingDetail.DeadMaleCount > 0 ) or ( CalvingDetail.DeadFemaleCount > 0 ) then
                           begin
                              if CalvingDetail.LactNo = 1 then
                                 begin
                                    Inc(Result.HeiferDeathAtBirthCalvingCount);
                                 end
                              else
                                 begin
                                    Inc(Result.CowDeathAtBirthCalvingCount);
                                 end;
                           end;
                     end;

                  FertilityCheckComment := IsInfectedAfterCalving(FieldByName('Id').AsInteger,FieldByName('LactNo').AsInteger);
                  if (FertilityCheckComment <> '') then
                     begin
                        Inc(Result.DirtyAt3WeeksAfterCalvingCount);
                        CalvingDetail := Result.DirtyAt3WeeksAfterCalvings.AddCalvingDetail;
                        AddAnimalIdToEventDetail(CalvingDetail);
                        CalvingDetail.Comment := FertilityCheckComment;
                     end;
                  Next;
               end;
         finally
            Close;
         end;
      end;
end;

procedure TfmFertilityAnalysis.SetupForm;
begin
   cxMemo1.Lines.Clear;
end;

procedure TfmFertilityAnalysis.btnLoadClick(Sender: TObject);
var
   CowTotalLiveMale, CowTotalLiveFemale, CowTotalLiveTwins,
   CowTotalDeadMale, CowTotalDeadFemale : Integer;

   HeiferTotalLiveMale, HeiferTotalLiveFemale, HeiferTotalLiveTwins,
   HeiferTotalDeadMale, HeiferTotalDeadFemale : Integer;

   StrList : TStringList;
   i : Integer;

   bExportAnimalIDs : Boolean;
begin
  inherited;
   cxMemo1.Clear;

   CowTotalLiveMale := 0;
   CowTotalLiveFemale := 0;
   CowTotalLiveTwins := 0;
   CowTotalDeadMale := 0;
   CowTotalDeadFemale := 0;

   HeiferTotalLiveMale := 0;
   HeiferTotalLiveFemale := 0;
   HeiferTotalLiveTwins := 0;
   HeiferTotalDeadMale := 0;
   HeiferTotalDeadFemale := 0;

   StrList := TStringList.Create;

   bExportAnimalIDs := not(cbExportAnimalIDs.Checked);

   cxMemo1.Lines.Clear;
   if FServiceAnalysis <> nil then
      FreeAndNil(FServiceAnalysis);
   FServiceAnalysis := GetServiceAnalysis(deFromDate.Date, deToDate.Date);

   AddToLog(Format('Service Period,SRVPERIOD,%s,%s',[DateToStr(deFromDate.Date),DateToStr(deToDate.Date)]));

   AddToLog(Format('AI Cows 1st Service,SRVC1,%d',[FServiceAnalysis.Cows1stService]));

   AddToLog(Format('AI Cows 2nd Service,SRVC2,%d',[FServiceAnalysis.Cows2ndService]));

   AddToLog(Format('AI Cows 3rd Service,SRVC3,%d',[FServiceAnalysis.Cows3rdService]));

   AddToLog(Format('AI Cows 4th Service,SRVC4,%d',[FServiceAnalysis.Cows4thService]));

   AddToLog(Format('AI Cows 5th Service plus,SRVC5,%d',[FServiceAnalysis.Cows5AndMoreServices]));

   AddToLog(Format('AI Heifers 1st Service,SRVH1,%d',[FServiceAnalysis.Heifers1stService]));

   AddToLog(Format('AI Heifers 2nd Service,SRVH2,%d',[FServiceAnalysis.Heifers2ndService]));

   AddToLog(Format('AI Heifers 3rd Service,SRVH3,%d',[FServiceAnalysis.Heifers3rdService]));

   AddToLog(Format('AI Heifers 4th Service,SRVH4,%d',[FServiceAnalysis.Heifers4thService]));

   AddToLog(Format('AI Heifers 5th Service plus,SRVH5,%d',[FServiceAnalysis.Heifers5AndMoreServices]));

   AddToLog(Format('Number of straws used,SRVSTR,%f',[FServiceAnalysis.StrawsUsed]));

   AddToLog('');
   AddToLog('########################################################################');

   if FCalvingAnalysis <> nil then
      FreeAndNil(FCalvingAnalysis);
   FCalvingAnalysis := GetCalvingAnalysis(deFromDate.Date, deToDate.Date);

   AddToLog('');

   AddToLog(Format('Aborted Calves,CLVABRT,%d',[FCalvingAnalysis.AbortedCalveCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AbortedCalvings.First;
         while not FCalvingAnalysis.AbortedCalvings.Eof do
            begin
               if (FCalvingAnalysis.AbortedCalvings.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVABRTID,%s,%s',
                     [
                       FCalvingAnalysis.AbortedCalvings.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.AbortedCalvings.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.AbortedCalvings.Next;
            end;
      end;

   AddToLog(Format('Assisted Calving - Moderate,CLVASS,%d', [FCalvingAnalysis.AssistedCalvingModerateCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AssistedCalvingsModerate.First;
         while not FCalvingAnalysis.AssistedCalvingsModerate.Eof do
            begin
               if (FCalvingAnalysis.AssistedCalvingsModerate.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVASSID,%s,%s',
                     [
                       FCalvingAnalysis.AssistedCalvingsModerate.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.AssistedCalvingsModerate.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.AssistedCalvingsModerate.Next;
            end;
      end;

   AddToLog(Format('Assisted Calving - Serious,CLVASSS,%d', [FCalvingAnalysis.AssistedCalvingSeriousCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AssistedCalvingsSerious.First;
         while not FCalvingAnalysis.AssistedCalvingsSerious.Eof do
            begin
               if (FCalvingAnalysis.AssistedCalvingsSerious.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVASSID,%s,%s',
                     [
                       FCalvingAnalysis.AssistedCalvingsSerious.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.AssistedCalvingsSerious.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.AssistedCalvingsSerious.Next;
            end;
      end;

   AddToLog(Format('Milk Fever,CLVMF,%d', [FCalvingAnalysis.MilkFeverCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.MilkFeverCalvings.First;
         while not FCalvingAnalysis.MilkFeverCalvings.Eof do
            begin
               if (FCalvingAnalysis.MilkFeverCalvings.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVMFID,%s,%s',
                     [
                       FCalvingAnalysis.MilkFeverCalvings.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.MilkFeverCalvings.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.MilkFeverCalvings.Next;
            end;
      end;

   AddToLog(Format('Retained Cleansings,CLVRC,%d', [FCalvingAnalysis.RetainedCleansingsCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.RetainedCleansingCalvings.First;
         while not FCalvingAnalysis.RetainedCleansingCalvings.Eof do
            begin
               if (FCalvingAnalysis.RetainedCleansingCalvings.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVRCID,%s,%s',
                     [
                       FCalvingAnalysis.RetainedCleansingCalvings.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.RetainedCleansingCalvings.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.RetainedCleansingCalvings.Next;
            end;
      end;

   AddToLog(Format('Displaced Abomasums,CLVDA,%d', [FCalvingAnalysis.DisplacedAbomasumsCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.DisplacedAbomasumCalvings.First;
         while not FCalvingAnalysis.DisplacedAbomasumCalvings.Eof do
            begin
               if (FCalvingAnalysis.DisplacedAbomasumCalvings.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVDAID,%s,%s',
                     [
                       FCalvingAnalysis.DisplacedAbomasumCalvings.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.DisplacedAbomasumCalvings.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.DisplacedAbomasumCalvings.Next;
            end;
      end;

   AddToLog(Format('Dirty at 3 wks after calving,CLVD3WK,%d', [FCalvingAnalysis.DirtyAt3WeeksAfterCalvingCount]));
   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.DirtyAt3WeeksAfterCalvings.First;
         while not FCalvingAnalysis.DirtyAt3WeeksAfterCalvings.Eof do
            begin
               if (FCalvingAnalysis.DirtyAt3WeeksAfterCalvings.CurrentEvent <> nil ) then
                  begin
                     AddToLog(Format('ID,CLVD3WKID,%s,%s',
                     [
                       FCalvingAnalysis.DirtyAt3WeeksAfterCalvings.CurrentEvent.NatIdNum,
                       FCalvingAnalysis.DirtyAt3WeeksAfterCalvings.CurrentEvent.Comment
                     ]));
                  end;
               FCalvingAnalysis.DirtyAt3WeeksAfterCalvings.Next;
            end;
      end;

   AddToLog('');
   AddToLog('########################################################################');
   AddToLog('');
   AddToLog('Cows calving details');

   AddToLog(Format('Still Born,CLVCSB,%d', [FCalvingAnalysis.CowStillBornCalvingCount]));

   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.StillBornCalvings.First;
         while not FCalvingAnalysis.StillBornCalvings.Eof do
            begin
               if (FCalvingAnalysis.StillBornCalvings.CurrentEvent <> nil ) then
                  begin
                     if ( FCalvingAnalysis.StillBornCalvings.CurrentEvent.LactNo > 1 ) then
                        begin
                           AddToLog(Format('ID,CLVCSBID,%s,%s',
                           [
                             FCalvingAnalysis.StillBornCalvings.CurrentEvent.NatIdNum,
                             FCalvingAnalysis.StillBornCalvings.CurrentEvent.Comment
                           ]));
                        end;
                  end;
               FCalvingAnalysis.StillBornCalvings.Next;
            end;
      end;

   AddToLog(Format('Live Births,CLVCLB,%d', [FCalvingAnalysis.CowLiveBirthCalvingCount]));

   FCalvingAnalysis.AllCalvings.First;
   while not FCalvingAnalysis.AllCalvings.Eof do
      begin
         if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
            begin
               if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo > 1 ) then
                  begin
                     Inc(CowTotalLiveMale, FCalvingAnalysis.AllCalvings.CurrentEvent.LiveMaleCount);
                     Inc(CowTotalLiveFemale, FCalvingAnalysis.AllCalvings.CurrentEvent.LiveFemaleCount);
                     if ( FCalvingAnalysis.AllCalvings.CurrentEvent.HasMultiCalves ) then
                        Inc(CowTotalLiveTwins);
                  end;
            end;
         FCalvingAnalysis.AllCalvings.Next;
      end;
   AddToLog(Format('(Male),CLVCLBM,%d',[CowTotalLiveMale]));
   AddToLog(Format('(Female),CLVCLBF,%d',[CowTotalLiveFemale]));
   AddToLog(Format('Twins,CLVCLBT,%d',[CowTotalLiveTwins]));

   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AllCalvings.First;
         while not FCalvingAnalysis.AllCalvings.Eof do
            begin
               if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
                  begin
                     if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo > 1 ) then
                        begin
                           AddToLog(Format('Details,CLVCLBID,%s,%s',
                           [
                             FCalvingAnalysis.AllCalvings.CurrentEvent.NatIdNum,
                             FCalvingAnalysis.AllCalvings.CurrentEvent.Comment
                           ]));
                        end;
                  end;
               FCalvingAnalysis.AllCalvings.Next;
            end;
      end;

   AddToLog('Scouring,0');
   AddToLog('Details, ');

   AddToLog(Format('Deaths,CLVCD,%d', [FCalvingAnalysis.CowDeathAtBirthCalvingCount]));

   FCalvingAnalysis.AllCalvings.First;
   while not FCalvingAnalysis.AllCalvings.Eof do
      begin
         if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
            begin
               if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo > 1 ) then
                  begin
                     Inc(CowTotalDeadMale, FCalvingAnalysis.AllCalvings.CurrentEvent.DeadMaleCount);
                     Inc(CowTotalDeadFemale, FCalvingAnalysis.AllCalvings.CurrentEvent.DeadFemaleCount);
                  end;
          end;
         FCalvingAnalysis.AllCalvings.Next;
      end;
   AddToLog(Format('(Male),CLVCDM,%d',[CowTotalDeadMale]));
   AddToLog(Format('(Female),CLVCDF,%d',[CowTotalDeadFemale]));

   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AllCalvings.First;
         while not FCalvingAnalysis.AllCalvings.Eof do
            begin
               if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
                  begin
                     if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo > 1 ) then
                        begin
                           if ( FCalvingAnalysis.AllCalvings.CurrentEvent.DeadMaleCount > 0 ) or
                              ( FCalvingAnalysis.AllCalvings.CurrentEvent.DeadFemaleCount > 0 ) then
                           AddToLog(Format('Details,CLVCDID,%s,%s',
                           [
                             FCalvingAnalysis.AllCalvings.CurrentEvent.NatIdNum,
                             FCalvingAnalysis.AllCalvings.CurrentEvent.Comment
                           ]));
                        end;
                end;
               FCalvingAnalysis.AllCalvings.Next;
            end;
      end;

   AddToLog('');
   AddToLog('########################################################################');
   AddToLog('');
   AddToLog('Heifers calving details');

   AddToLog(Format('Still Born,CLVHSB,%d', [FCalvingAnalysis.HeiferStillBornCalvingCount]));

   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.StillBornCalvings.First;
         while not FCalvingAnalysis.StillBornCalvings.Eof do
            begin
               if (FCalvingAnalysis.StillBornCalvings.CurrentEvent <> nil ) then
                  begin
                     if ( FCalvingAnalysis.StillBornCalvings.CurrentEvent.LactNo = 1 ) then
                        begin
                           AddToLog(Format('Details,CLVHSBID,%s,%s',
                           [
                             FCalvingAnalysis.StillBornCalvings.CurrentEvent.NatIdNum,
                             FCalvingAnalysis.StillBornCalvings.CurrentEvent.Comment
                           ]));
                        end;
                  end;
               FCalvingAnalysis.StillBornCalvings.Next;
            end;
      end;

   AddToLog(Format('Live Births,CLVHLB,%d', [FCalvingAnalysis.HeiferLiveBirthCalvingCount]));

   FCalvingAnalysis.AllCalvings.First;
   while not FCalvingAnalysis.AllCalvings.Eof do
      begin
         if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
            begin
               if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo = 1 ) then
                  begin
                     Inc(HeiferTotalLiveMale, FCalvingAnalysis.AllCalvings.CurrentEvent.LiveMaleCount);
                     Inc(HeiferTotalLiveFemale, FCalvingAnalysis.AllCalvings.CurrentEvent.LiveFemaleCount);
                     if ( FCalvingAnalysis.AllCalvings.CurrentEvent.HasMultiCalves ) then
                        Inc(HeiferTotalLiveTwins);
                  end;
            end;
         FCalvingAnalysis.AllCalvings.Next;
      end;
   AddToLog(Format('(Male),CLVHLBM,%d',[HeiferTotalLiveMale]));
   AddToLog(Format('(Female),CLVHLBF,%d',[HeiferTotalLiveFemale]));
   AddToLog(Format('Twins,CLVHLBT,%d',[HeiferTotalLiveTwins]));

   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AllCalvings.First;
         while not FCalvingAnalysis.AllCalvings.Eof do
            begin
               if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
                  begin
                     if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo = 1 ) then
                        begin
                           AddToLog(Format('Details,CLVHLBID,%s,%s',
                           [
                             FCalvingAnalysis.AllCalvings.CurrentEvent.NatIdNum,
                             FCalvingAnalysis.AllCalvings.CurrentEvent.Comment
                           ]));
                        end;
                  end;
               FCalvingAnalysis.AllCalvings.Next;
            end;
      end;

   AddToLog('Scouring,0');
   AddToLog('Details, ');

   AddToLog(Format('Deaths,CLVHD,%d', [FCalvingAnalysis.HeiferDeathAtBirthCalvingCount]));

   FCalvingAnalysis.AllCalvings.First;
   while not FCalvingAnalysis.AllCalvings.Eof do
      begin
         if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
            begin
               if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo = 1 ) then
                  begin
                      if ( FCalvingAnalysis.AllCalvings.CurrentEvent.DeadMaleCount > 0 ) or
                         ( FCalvingAnalysis.AllCalvings.CurrentEvent.DeadFemaleCount > 0 ) then
                      begin
                         Inc(HeiferTotalDeadMale, FCalvingAnalysis.AllCalvings.CurrentEvent.DeadMaleCount);
                         Inc(HeiferTotalDeadFemale, FCalvingAnalysis.AllCalvings.CurrentEvent.DeadFemaleCount);
                      end;
                  end;
          end;
         FCalvingAnalysis.AllCalvings.Next;
      end;

   AddToLog(Format('(Male),CLVHDM,%d',[HeiferTotalDeadMale]));
   AddToLog(Format('(Female),CLVHDF,%d',[HeiferTotalDeadFemale]));

   if not(bExportAnimalIDs) then
      begin
         FCalvingAnalysis.AllCalvings.First;
         while not FCalvingAnalysis.AllCalvings.Eof do
            begin
               if (FCalvingAnalysis.AllCalvings.CurrentEvent <> nil ) then
                  begin
                     if ( FCalvingAnalysis.AllCalvings.CurrentEvent.LactNo = 1 ) then
                        begin
                            if ( FCalvingAnalysis.AllCalvings.CurrentEvent.DeadMaleCount > 0 ) or
                               ( FCalvingAnalysis.AllCalvings.CurrentEvent.DeadFemaleCount > 0 ) then
                           AddToLog(Format('Details,CLVHDID,%s,%s',
                           [
                             FCalvingAnalysis.AllCalvings.CurrentEvent.NatIdNum,
                             FCalvingAnalysis.AllCalvings.CurrentEvent.Comment
                           ]));

                        end;
                end;
               FCalvingAnalysis.AllCalvings.Next;
            end;
      end;

   AddToLog('');
   AddToLog('########################################################################');
   AddToLog('');

   if FHealthAnalysis <> nil then
      FreeAndNil(FHealthAnalysis);
   FHealthAnalysis := GetHealthAnalysis(deFromDate.Date, deToDate.Date);

   AddToLog('Mastits');
   // Health Mastitis Mild Count
   AddToLog(Format('Mild,HLTMAMIL,%d', [FHealthAnalysis.MildMastitisCount]));

   // Health Mastitis Mild IDs
   if not(bExportAnimalIDs) then
      begin
         FHealthAnalysis.MildMastitisEvents.First;
         while not FHealthAnalysis.MildMastitisEvents.Eof do
            begin
               if (FHealthAnalysis.MildMastitisEvents.CurrentEvent <> nil ) then
                  begin
                     StrList.Add(Format('Details,HLTMAID,%s,%s',
                     [
                       FHealthAnalysis.MildMastitisEvents.CurrentEvent.NatIdNum,
                       FHealthAnalysis.MildMastitisEvents.CurrentEvent.Comment
                     ]));
                  end;
               FHealthAnalysis.MildMastitisEvents.Next;
            end;
      end;

   // Health Mastitis Moderate Count
   AddToLog(Format('Moderate,HLTMAMOD,%d', [FHealthAnalysis.ModerateMastitisCount]));

   // Health Mastitis Moderate IDS - output as HLTMAID
   if not(bExportAnimalIDs) then
      begin
         FHealthAnalysis.ModerateMastitisEvents.First;
         while not FHealthAnalysis.ModerateMastitisEvents.Eof do
            begin
               if (FHealthAnalysis.ModerateMastitisEvents.CurrentEvent <> nil ) then
                  begin
                     StrList.Add(Format('Details,HLTMAID,%s,%s',
                     [
                       FHealthAnalysis.ModerateMastitisEvents.CurrentEvent.NatIdNum,
                       FHealthAnalysis.ModerateMastitisEvents.CurrentEvent.Comment
                     ]));
                  end;
               FHealthAnalysis.ModerateMastitisEvents.Next;
            end;
      end;

   // Health Mastitis Severe Count
   AddToLog(Format('Severe,HLTMASEV,%d', [FHealthAnalysis.SevereMastitisCount]));

   // Health Mastitis Severe IDS - output as HLTMAID
   if not(bExportAnimalIDs) then
      begin
         FHealthAnalysis.SevereMastitisEvents.First;
         while not FHealthAnalysis.SevereMastitisEvents.Eof do
            begin
               if (FHealthAnalysis.SevereMastitisEvents.CurrentEvent <> nil ) then
                  begin
                     StrList.Add(Format('Details,HLTMAID,%s,%s',
                     [
                       FHealthAnalysis.SevereMastitisEvents.CurrentEvent.NatIdNum,
                       FHealthAnalysis.SevereMastitisEvents.CurrentEvent.Comment
                     ]));
                  end;
               FHealthAnalysis.SevereMastitisEvents.Next;
            end;
      end;

   for i:=0 to StrList.Count-1 do
      AddToLog(StrList.Strings[i]);
   StrList.Clear;

   AddToLog(Format('Lamness,HLTLM,%d', [FHealthAnalysis.LamenessCount]));

   if not(bExportAnimalIDs) then
      begin
         FHealthAnalysis.LamenessEvents.First;
         while not FHealthAnalysis.LamenessEvents.Eof do
            begin
               if (FHealthAnalysis.LamenessEvents.CurrentEvent <> nil ) then
                  begin
                     StrList.Add(Format('Details,HLTLMID,%s,%s',
                     [
                       FHealthAnalysis.LamenessEvents.CurrentEvent.NatIdNum,
                       FHealthAnalysis.LamenessEvents.CurrentEvent.Comment
                     ]));
                  end;
               FHealthAnalysis.LamenessEvents.Next;
            end;
      end;

   AddToLog(Format('No of cases of clinical lamness,HLTCLM,%d', [FHealthAnalysis.ClinicalLamnessCount]));
   if not(bExportAnimalIDs) then
      begin
         FHealthAnalysis.ClinicalLamnessEvents.First;
         while not FHealthAnalysis.ClinicalLamnessEvents.Eof do
            begin
               if (FHealthAnalysis.ClinicalLamnessEvents.CurrentEvent <> nil ) then
                  begin
                     StrList.Add(Format('Details,HLTLMID,%s,%s',
                     [
                       FHealthAnalysis.ClinicalLamnessEvents.CurrentEvent.NatIdNum,
                       FHealthAnalysis.ClinicalLamnessEvents.CurrentEvent.Comment
                     ]));
                  end;
               FHealthAnalysis.ClinicalLamnessEvents.Next;
            end;
      end;

   for i:=0 to StrList.Count-1 do
      AddToLog(StrList.Strings[i]);
   StrList.Clear;

   if SaveDialog.Execute then
      begin
         StrList.Text := cxMemo1.Lines.Text;

         StrList.SaveToFile(SaveDialog.FileName);
         if FileExists(SaveDialog.FileName) then
            ShowMessage('File created successfully')
         else
            ShowMessage('Error creating file.') ;
      end;
end;

class procedure TfmFertilityAnalysis.ShowForm;
begin
   with TfmFertilityAnalysis.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmFertilityAnalysis.AddAnimalIdToEventDetail(AEventDetail : TEventDetail);
begin
   with AEventDetail do
      begin
         NatIdNum := FEventQuery.FieldByName('NatIdNum').AsString;
         AnimalNo := FEventQuery.FieldByName('AnimalNo').AsString;
         Comment := FEventQuery.FieldByName('Comment').AsString;
         LactNo := FEventQuery.FieldByName('LactNo').AsInteger;
      end;
end;

function TfmFertilityAnalysis.IsStillBirth : Boolean;
begin
   Result := (FEventQuery.FieldByName('ID1').AsInteger <= 0) and
             (FEventQuery.FieldByName('ID2').AsInteger <= 0) and
             (FEventQuery.FieldByName('ID3').AsInteger <= 0) and
             (FEventQuery.FieldByName('ID4').AsInteger <= 0);
end;

function TfmFertilityAnalysis.LiveCalveBirth : Boolean;
begin
   Result := ( not IsStillBirth ) and (
             (not FEventQuery.FieldByName('CalfDead1').AsBoolean) or
             (not FEventQuery.FieldByName('CalfDead2').AsBoolean) or
             (not FEventQuery.FieldByName('CalfDead3').AsBoolean) or
             (not FEventQuery.FieldByName('CalfDead4').AsBoolean) );
end;

function TfmFertilityAnalysis.IsMultiBirth : Boolean;
var
   LiveCalfCount : Integer;
begin
// 2 or more live calves considered as twin.
// at time of writing this there was no
// provision (nothing documented) for triplets/Quadruplets
   LiveCalfCount := 0;
   if ((FEventQuery.FieldByName('ID1').AsInteger > 0) and (not FEventQuery.FieldByName('CalfDead1').AsBoolean)) then
      Inc(LiveCalfCount);
   if ((FEventQuery.FieldByName('ID2').AsInteger > 0) and (not FEventQuery.FieldByName('CalfDead2').AsBoolean)) then
      Inc(LiveCalfCount);
   if ((FEventQuery.FieldByName('ID3').AsInteger > 0) and (not FEventQuery.FieldByName('CalfDead3').AsBoolean)) then
      Inc(LiveCalfCount);
   if ((FEventQuery.FieldByName('ID4').AsInteger > 0) and (not FEventQuery.FieldByName('CalfDead4').AsBoolean)) then
      Inc(LiveCalfCount);
   Result := (LiveCalfCount >= 2);
end;

procedure TfmFertilityAnalysis.AddToLog(AText: String);
begin
   cxMemo1.Lines.Add(AText);
end;

function TfmFertilityAnalysis.IsInfectedAfterCalving(const AAnimalId,
  ALactNo: Integer): string;
begin
   Result := '';
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT F.EventId, E.EventDesc FROM FertilityCheck F ');
         SQL.Add('INNER JOIN Events E ON (F.EventId=E.ID) ');
         SQL.Add('WHERE (E.AnimalId = :AnimalId)');
         SQL.Add('AND (E.AnimalLactNo = :LactNo)');
         SQL.Add('AND (E.EventType = :EventType)');
         SQL.Add('AND (F.Status = (SELECT DISTINCT (G.ID)  ');
         SQL.Add('                 FROM GenLook G');
         SQL.Add('                 WHERE (G.ListType='+IntToStr(LFertilityCheck_Status)+' )');
         SQL.Add('                 AND (G.Description="Infected")))');
         Params[0].AsInteger := AAnimalId;
         Params[1].AsInteger := ALactNo;
         Params[2].AsInteger := CFertilityCheck;
         Open;
         try
            First;
            if (FieldByName('EventId').AsInteger > 0) then
                begin
                   Result := FieldByname('EventDesc').AsString;
                   if Trim(Result) = '' then
                      Result := 'Fertility Check - Infected';
                end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

{ THealthAnalysis }

function TfmFertilityAnalysis.GetHealthAnalysis(AFromDate,
  AToDate: TDateTime): THealthAnalysis;
var
   AnimalIdsString : String;
   AnimalIds : array of Integer;
   ArrayIndex : Integer;
   HealthDetail : TEventDetail;
begin
   ArrayIndex := 0;
   AnimalIdsString := '';
   SetLength(AnimalIds, ArrayIndex);
   Result := THealthAnalysis.Create;

   with FEventQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT A.AnimalNo, A.NatIdNum, A.LactNo, G.ID, G.Description HealthDescription, E.EventDesc Comment');
         SQL.Add('FROM Events E');
         SQL.Add('INNER JOIN Animals A ON (A.ID=E.AnimalID)');
         SQL.Add('INNER JOIN Health H On (H.EventID=E.ID)');
         SQL.Add('INNER JOIN Genlook G On (G.ID=H.FarmCode)');
         SQL.Add('WHERE (E.EventType = '+ IntToStr(cHealthEvent) +' )');
         SQL.Add('AND (E.AnimalLactNo=A.LactNo)');
         SQL.Add('AND (E.EventDate BETWEEN :AFromDate AND :AToDate)');
         SQL.Add('AND (G.Description In ("'+ MildMastitis +'" , "'+ ModerateMastitis +'" , "'+ SevereMastitis +'" , "'+ Lameness +'" , "'+ ClinicalLameness +'"))');
         SQL.Add('ORDER BY A.NatIdNum');

         Params[0].AsDateTime := deFromDate.Date;
         Params[1].AsDateTime := deToDate.Date;
         Open;
         try
            First;
            while not eof do
               begin
                  if FieldByName('HealthDescription').AsString = MildMastitis then
                     begin
                        Inc(Result.MildMastitisCount);
                        HealthDetail := Result.MildMastitisEvents.AddEventDetail;
                     end
                  else if FieldByName('HealthDescription').AsString = ModerateMastitis then
                     begin
                        Inc(Result.ModerateMastitisCount);
                        HealthDetail := Result.ModerateMastitisEvents.AddEventDetail;
                     end
                  else if FieldByName('HealthDescription').AsString = SevereMastitis then
                     begin
                        Inc(Result.SevereMastitisCount);
                        HealthDetail := Result.SevereMastitisEvents.AddEventDetail;
                     end
                  else if FieldByName('HealthDescription').AsString = Lameness then
                     begin
                        Inc(Result.LamenessCount);
                        HealthDetail := Result.LamenessEvents.AddEventDetail;
                     end
                  else if FieldByName('HealthDescription').AsString = ClinicalLameness then
                     begin
                        Inc(Result.ClinicalLamnessCount);
                        HealthDetail := Result.ClinicalLamnessEvents.AddEventDetail;
                     end;
                  AddAnimalIdToEventDetail(HealthDetail);
                  Next;
               end;
         finally
            Close;
         end;
      end;
end;

{ TServiceAnalysis }

constructor TServiceAnalysis.create;
begin
   Cows1stService := 0;
   Cows2ndService := 0;
   Cows3rdService := 0;
   Cows4thService := 0;
   Cows5AndMoreServices := 0;
   Heifers1stService := 0;
   Heifers2ndService := 0;
   Heifers3rdService := 0;
   Heifers4thService := 0;
   Heifers5AndMoreServices := 0;
   StrawsUsed := 0;
end;

{ TCalvingAnalysis }

constructor TCalvingAnalysis.create;
begin
   AbortedCalveCount := 0;
   AssistedCalvingModerateCount := 0;
   AssistedCalvingSeriousCount := 0;
   MilkFeverCount := 0;
   RetainedCleansingsCount := 0;
   DisplacedAbomasumsCount := 0;
   DirtyAt3WeeksAfterCalvingCount := 0;
   CowStillBornCalvingCount := 0;
   HeiferStillBornCalvingCount := 0;
   CowLiveBirthCalvingCount := 0;
   HeiferLiveBirthCalvingCount := 0;
   CowDeathAtBirthCalvingCount := 0;
   HeiferDeathAtBirthCalvingCount := 0;
   ScouringCalvingCount := 0; // ??? not sure about this one - check with GL.!

   AbortedCalvings := TCalvings.Create;
   AssistedCalvingsModerate := TCalvings.Create;
   AssistedCalvingsSerious := TCalvings.Create;
   MilkFeverCalvings := TCalvings.Create;
   RetainedCleansingCalvings := TCalvings.Create;
   DisplacedAbomasumCalvings := TCalvings.Create;
   DirtyAt3WeeksAfterCalvings := TCalvings.Create;
   StillBornCalvings := TCalvings.Create;
   AllCalvings := TCalvings.Create;
   DeathAtBirthCalvings := TCalvings.Create;
end;

destructor TCalvingAnalysis.destroy;
begin
   SafeFreeAndNil(AbortedCalvings);
   SafeFreeAndNil(AssistedCalvingsModerate);
   SafeFreeAndNil(AssistedCalvingsSerious);
   SafeFreeAndNil(MilkFeverCalvings);
   SafeFreeAndNil(RetainedCleansingCalvings);
   SafeFreeAndNil(DisplacedAbomasumCalvings);
   SafeFreeAndNil(DirtyAt3WeeksAfterCalvings);
   SafeFreeAndNil(StillBornCalvings);
   SafeFreeAndNil(AllCalvings);
   SafeFreeAndNil(DeathAtBirthCalvings);
   inherited;
end;

{ TEventDetail }

constructor TEventDetail.create;
begin
   NatIdNum := '';
   AnimalNo := '';
   Comment := '';
   LactNo := 0;
end;

{ TCalvingDetail }

constructor TCalvingDetail.create;
begin
   LiveMaleCount := 0;
   LiveFemaleCount := 0;
   DeadMaleCount := 0;
   DeadFemaleCount := 0;
end;

function TCalvingDetail.GetHasMultiCalves: Boolean;
begin
   Result := ((LiveMaleCount + LiveFemaleCount) > 1);
end;

{ TCalvings }

function TCalvings.AddCalvingDetail: TCalvingDetail;
begin
   Result := TCalvingDetail.Create;
   Add(Result);
end;

procedure TfmFertilityAnalysis.FormCreate(Sender: TObject);
begin
  inherited;
  FEventQuery := TQuery.Create(nil);
  FEventQuery.DatabaseName := AliasName;
  cxMemo1.Lines.Clear;
  deFromDate.Date := Date-7;
  deToDate.Date := Date;
end;

function TCalvings.CurrentEvent: TCalvingDetail;
begin
   Result := nil;
   if ((FIndex >= 0 )and (FIndex <= Count-1)) then
      Result := Items[FIndex] as TCalvingDetail;
end;

function TCalvings.Eof: Boolean;
begin
   Result := (FIndex > Count -1);
end;

procedure TCalvings.First;
begin
   FIndex := 0;
end;

procedure TCalvings.Next;
begin
   Inc(FIndex);
end;

procedure TfmFertilityAnalysis.btnClearClick(Sender: TObject);
begin
  inherited;
end;

{ THealthAnalysis }

constructor THealthAnalysis.create;
begin
   MildMastitisCount := 0;
   ModerateMastitisCount := 0;
   SevereMastitisCount := 0;
   LamenessCount := 0;
   ClinicalLamnessCount := 0;
   FootTrimmer := False;
   FootBath := False;

   MildMastitisEvents := THealthEvents.Create;
   ModerateMastitisEvents := THealthEvents.Create;
   SevereMastitisEvents := THealthEvents.Create;
   LamenessEvents := THealthEvents.Create;
   ClinicalLamnessEvents := THealthEvents.Create;
end;

destructor THealthAnalysis.destroy;
begin
  SafeFreeAndNil(MildMastitisEvents);
  SafeFreeAndNil(ModerateMastitisEvents);
  SafeFreeAndNil(SevereMastitisEvents);
  SafeFreeAndNil(LamenessEvents);
  SafeFreeAndNil(ClinicalLamnessEvents);
  inherited;
end;

{ THealthEvents }

function THealthEvents.AddEventDetail: TEventDetail;
begin
   Result := TEventDetail.Create;
   Add(Result);
end;

function THealthEvents.CurrentEvent: TEventDetail;
begin
   Result := nil;
   if ((FIndex >= 0 )and (FIndex <= Count-1)) then
      Result := Items[FIndex] as TEventDetail;
end;

function THealthEvents.Eof: Boolean;
begin
   Result := (FIndex > Count -1);
end;

procedure THealthEvents.First;
begin
   FIndex := 0;
end;

procedure THealthEvents.Next;
begin
   Inc(FIndex);
end;

end.

