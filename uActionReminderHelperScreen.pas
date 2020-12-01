unit uActionReminderHelperScreen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uActionWarningReminders, ExtCtrls, uSPParser, QuickRpt, QRCtrls;

type
  TActionReminderHelperScreen = class(TForm)
    Button1: TButton;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    Parser: TSPParser;
    LoopBandFirstServiceWith4Days: TQRLoopBand;
    QRLabel1: TQRLabel;
    DataLabel: TQRLabel;
    LoopBandlRepeatServiceWith4Days: TQRLoopBand;
    LoopBandNoHeatService61DaysCalved: TQRLoopBand;
    LoopBandNoHeatService42To60DaysCalved: TQRLoopBand;
    LoopBand3MoreServicesRecorded: TQRLoopBand;
    LoopBandsMissedHeatUnusualCycle: TQRLoopBand;
    LoopBandCowsCalvedLessThanVWP: TQRLoopBand;
    LoopBandConsiderPDAfterServiceXDays: TQRLoopBand;
    LoopBandCowsNotPregnant: TQRLoopBand;
    QRShape1: TQRShape;
    procedure Button1Click(Sender: TObject);
    procedure LoopBandFirstServiceWith4DaysBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LoopBandlRepeatServiceWith4DaysBeforePrint(
      Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LoopBandNoHeatService61DaysCalvedBeforePrint(
      Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LoopBandNoHeatService42To60DaysCalvedBeforePrint(
      Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LoopBand3MoreServicesRecordedBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LoopBandsMissedHeatUnusualCycleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LoopBandCowsCalvedLessThanVWPBeforePrint(
      Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LoopBandConsiderPDAfterServiceXDaysBeforePrint(
      Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure LoopBandCowsNotPregnantBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    slFirstServiceWith4Days : TStringList;
    slRepeatServiceWith4Days : TStringList;
    slNoHeatServiceXDaysCalved : TStringList;
    slNoHeatServiceXToYDaysCalved : TStringList;
    slXOrMoreServicesRecorded : TStringList;
    slMissedHeatUnusualCycle : TStringList;
    slCowsCalvedLessThanVWP : TStringList;
    slConsiderPDAfterServiceXDays : TStringList;
    slCowsNotPregnant  : TStringList;
    BreedingData : TBreedingData;
    procedure PrepareStringOutput(var Asl : TStringList; RawOutput : String);
  public
    { Public declarations }
  end;

var
  ActionReminderHelperScreen: TActionReminderHelperScreen;

implementation
uses
   DairyData, kRoutines;
{$R *.DFM}

procedure TActionReminderHelperScreen.Button1Click(Sender: TObject);
var
  sNoHeatServiceXDaysCalved,
  sNoHeatServiceXToYDaysCalved,
  sXOrMoreServicesRecorded,
  sMissedHeatUnusualCycle : String;
  sFirstServiceWithXDays,
  sRepeatServiceWithXDays : String;

  sCalvedLessThanVWP,
  sConsiderPDAfterServiceXDays,
  sCowsNotPregnant : String;

  i : Integer;
begin
   BreedingData := TBreedingData.Create;

   BreedingData.FromDate := Date;
   BreedingData.ToDate := Date+4;
   BreedingData.DaysFirstService := 42;
   BreedingData.ShowProgress := True;
   BreedingData.IncludeOverDue := True;
   BreedingData.HerdID := WinData.UserDefaultHerdID;

   BreedingData.Execute;

   slFirstServiceWith4Days := TStringList.Create;
   sFirstServiceWithXDays := BreedingData.OutputResult(alFirstServiceWith4Days);
   PrepareStringOutput(slFirstServiceWith4Days, sFirstServiceWithXDays);
   LoopBandFirstServiceWith4Days.PrintCount := slFirstServiceWith4Days.Count+2;

   slRepeatServiceWith4Days := TStringList.Create;
   sRepeatServiceWithXDays := BreedingData.OutputResult(alRepeatServiceWith4Days);
   PrepareStringOutput(slRepeatServiceWith4Days, sRepeatServiceWithXDays);
   LoopBandlRepeatServiceWith4Days.PrintCount := slRepeatServiceWith4Days.Count+1;

   slNoHeatServiceXDaysCalved := TStringList.Create;
   sNoHeatServiceXDaysCalved := BreedingData.OutputResult(wlNoHeatServiceXDaysCalved);
   PrepareStringOutput(slNoHeatServiceXDaysCalved, sNoHeatServiceXDaysCalved);
   LoopBandNoHeatService61DaysCalved.PrintCount := slNoHeatServiceXDaysCalved.Count+2;

   slNoHeatServiceXToYDaysCalved := TStringList.Create;
   sNoHeatServiceXToYDaysCalved := BreedingData.OutputResult(wlNoHeatServiceXPeriodDaysCalved);
   PrepareStringOutput(slNoHeatServiceXToYDaysCalved, sNoHeatServiceXToYDaysCalved);
   LoopBandNoHeatService42To60DaysCalved.PrintCount := slNoHeatServiceXToYDaysCalved.Count+1;

   slXOrMoreServicesRecorded := TStringList.Create;
   sXOrMoreServicesRecorded := BreedingData.OutputResult(wlCheckNoServicesRecorded);
   PrepareStringOutput(slXOrMoreServicesRecorded, sXOrMoreServicesRecorded);
   LoopBand3MoreServicesRecorded.PrintCount := slXOrMoreServicesRecorded.Count+1;

   slMissedHeatUnusualCycle := TStringList.Create;
   sMissedHeatUnusualCycle := BreedingData.OutputResult(wlMissedHeatUnusualCycle);
   PrepareStringOutput(slMissedHeatUnusualCycle, sMissedHeatUnusualCycle);
   LoopBandsMissedHeatUnusualCycle.PrintCount := slMissedHeatUnusualCycle.Count+1;

   slCowsCalvedLessThanVWP := TStringList.Create;
   sCalvedLessThanVWP := BreedingData.OutputResult(wlMissedHeatUnusualCycle);
   PrepareStringOutput(slCowsCalvedLessThanVWP, sCalvedLessThanVWP);
   LoopBandCowsCalvedLessThanVWP.PrintCount := slCowsCalvedLessThanVWP.Count+2;


   slConsiderPDAfterServiceXDays := TStringList.Create;
   sConsiderPDAfterServiceXDays := BreedingData.OutputResult(rlConsiderPDAfterServiceXDays);
   PrepareStringOutput(slConsiderPDAfterServiceXDays, sConsiderPDAfterServiceXDays);
   LoopBandConsiderPDAfterServiceXDays.PrintCount := slConsiderPDAfterServiceXDays.Count+1;

   slCowsNotPregnant := TStringList.Create;
   sCowsNotPregnant := BreedingData.OutputResult(rlCowsNotPregnant);
   PrepareStringOutput(slCowsNotPregnant, sCowsNotPregnant);
   LoopBandCowsNotPregnant.PrintCount := slCowsCalvedLessThanVWP.Count+1;


   QuickRep1.Preview;

   slFirstServiceWith4Days.Free;
   slRepeatServiceWith4Days.Free;
   slNoHeatServiceXDaysCalved.Free;
   slNoHeatServiceXToYDaysCalved.Free;
   slXOrMoreServicesRecorded.Free;
   slMissedHeatUnusualCycle.Free;
   slCowsCalvedLessThanVWP.Free;
   slConsiderPDAfterServiceXDays.Free;
   slCowsNotPregnant.Free;


   BreedingData.Free;
end;


procedure TActionReminderHelperScreen.PrepareStringOutput(
  var Asl: TStringList; RawOutput: String);
var
   i : Integer;
   s : String;
begin
   Asl.Clear;
   Parser.Parse(RawOutput);
   for i := 0 to Parser.Count-1 do
      begin
         if ( (i+1) Mod 7) = 0 then
           begin
              Asl.Add( s );
              s := '';
           end
         else
            if s = '' then
               s := s + Parser.Fields[i+1]
            else
               s := s + PadLeft(Parser.Fields[i+1], ' ', 10);
      end;
   if s <> '' then
      Asl.Add( s  );
end;

procedure TActionReminderHelperScreen.LoopBandFirstServiceWith4DaysBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandFirstServiceWith4Days.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandFirstServiceWith4Days.Count = 0 then
      begin
         DataLabel.Font.Size := 13;
         DataLabel.Font.Style := [fsBold];
         DataLabel.Caption := 'Action List:';
      end
   else
      begin
         DataLabel.Font.Style := [fsBold];

         if LoopBandFirstServiceWith4Days.Count = 1 then
            begin
               DataLabel.Font.Size := 11;
               DataLabel.Caption := '1. Cows ready for serivce within next 4 days'
            end
         else
            begin
               DataLabel.Font.Style := [];
               DataLabel.Font.Size := 12;
               DataLabel.Caption := slFirstServiceWith4Days.Strings[ LoopBandFirstServiceWith4Days.Count-2 ]; //QRMemo1.Lines.Add(  );
               QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
               QRShape1.Enabled := QRShape1.Visible;
            end;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBandlRepeatServiceWith4DaysBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandlRepeatServiceWith4Days.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandlRepeatServiceWith4Days.Count = 0 then
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         DataLabel.Caption := '2. Cows which may repeat within the next 4 days'
      end
   else
      begin
         DataLabel.Font.Style := [];
         DataLabel.Font.Size := 12;
         DataLabel.Caption := slRepeatServiceWith4Days.Strings[ LoopBandlRepeatServiceWith4Days.Count-1 ];
         QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
         QRShape1.Enabled := QRShape1.Visible;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBandNoHeatService61DaysCalvedBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandNoHeatService61DaysCalved.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandNoHeatService61DaysCalved.Count = 0 then
      begin
         DataLabel.Font.Size := 13;
         DataLabel.Font.Style := [fsBold];
         DataLabel.Caption := 'Warning List:';
      end
   else
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         if LoopBandNoHeatService61DaysCalved.Count = 1 then
            DataLabel.Caption := '1. Cows with no previous heat or service recorded (greater than 60 days calved)'
         else
            begin
               DataLabel.Font.Style := [];
               DataLabel.Font.Size := 12;
               DataLabel.Caption := slNoHeatServiceXDaysCalved.Strings[ LoopBandNoHeatService61DaysCalved.Count-2 ];
               QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
               QRShape1.Enabled := QRShape1.Visible;
            end;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBandNoHeatService42To60DaysCalvedBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandNoHeatService42To60DaysCalved.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandNoHeatService42To60DaysCalved.Count = 0 then
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         DataLabel.Caption := '2. Cows with no previous heat or service recorded (42-60 days calved)';

         if (Sender as  TQRLoopBand).PrintCount = 1 then
            begin
               QRShape1.Visible := True;
               QRShape1.Enabled := True;
            end;
      end
   else
      begin
         DataLabel.Font.Style := [];
         DataLabel.Font.Size := 12;
         DataLabel.Caption := slNoHeatServiceXToYDaysCalved.Strings[ LoopBandNoHeatService42To60DaysCalved.Count-1 ];
         QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
         QRShape1.Enabled := QRShape1.Visible;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBand3MoreServicesRecordedBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBand3MoreServicesRecorded.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBand3MoreServicesRecorded.Count = 0 then
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         DataLabel.Caption := '3. Cows with three or more services to date';
      end
   else
      begin
         DataLabel.Font.Style := [];
         DataLabel.Font.Size := 12;
         DataLabel.Caption := slXOrMoreServicesRecorded.Strings[ LoopBand3MoreServicesRecorded.Count-1 ];
         QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
               QRShape1.Enabled := QRShape1.Visible;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBandsMissedHeatUnusualCycleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandsMissedHeatUnusualCycle.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandsMissedHeatUnusualCycle.Count = 0 then
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         DataLabel.Caption := '4. Cows with missed heat or unusual cycle length';
      end
   else
      begin
         DataLabel.Font.Style := [];
         DataLabel.Font.Size := 12;
         DataLabel.Caption := slMissedHeatUnusualCycle.Strings[ LoopBandsMissedHeatUnusualCycle.Count-1 ];
         QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
               QRShape1.Enabled := QRShape1.Visible;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBandCowsCalvedLessThanVWPBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandCowsCalvedLessThanVWP.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandCowsCalvedLessThanVWP.Count = 0 then
      begin
         DataLabel.Font.Size := 13;
         DataLabel.Font.Style := [fsBold];
         DataLabel.Caption := 'Reminder List:';
      end
   else
      begin
         DataLabel.Font.Style := [fsBold];

         if LoopBandCowsCalvedLessThanVWP.Count = 1 then
            begin
               DataLabel.Font.Size := 11;
               DataLabel.Caption := '1. Cows calved less than your voluntary waiting period (and not ready for service)';
            end
         else
            begin
               DataLabel.Font.Style := [];
               DataLabel.Font.Size := 12;
               DataLabel.Caption := slCowsCalvedLessThanVWP.Strings[ LoopBandCowsCalvedLessThanVWP.Count-2 ]; //QRMemo1.Lines.Add(  );
               QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
               QRShape1.Enabled := QRShape1.Visible;
            end;
      end;
   PrintBand := True;

end;

procedure TActionReminderHelperScreen.LoopBandConsiderPDAfterServiceXDaysBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandConsiderPDAfterServiceXDays.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandConsiderPDAfterServiceXDays.Count = 0 then
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         DataLabel.Caption := '2. Cows more than 6 weeks since last AI (consider for pregnancy diagnosis)';
      end
   else
      begin
         DataLabel.Font.Style := [];
         DataLabel.Font.Size := 12;
         DataLabel.Caption := slConsiderPDAfterServiceXDays.Strings[ LoopBandConsiderPDAfterServiceXDays.Count-1 ];
         QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
               QRShape1.Enabled := QRShape1.Visible;
      end;
   PrintBand := True;
end;

procedure TActionReminderHelperScreen.LoopBandCowsNotPregnantBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
//   LoopBandCowsNotPregnant.Frame.DrawBottom := False;
   DataLabel.Parent := Sender;
   QRShape1.Parent := Sender;
   QRShape1.Visible := False;
   QRShape1.Enabled := False;
   if LoopBandCowsNotPregnant.Count = 0 then
      begin
         DataLabel.Font.Style := [fsBold];
         DataLabel.Font.Size := 11;
         DataLabel.Caption := '3. Cows with negative pregnancy test';
      end
   else
      begin
         DataLabel.Font.Style := [];
         DataLabel.Font.Size := 12;
         DataLabel.Caption := slCowsNotPregnant.Strings[ LoopBandCowsNotPregnant.Count-1 ];
         QRShape1.Visible := (Sender as  TQRLoopBand).Count+1 = (Sender as  TQRLoopBand).PrintCount;
//            LoopBandCowsNotPregnant.Frame.DrawBottom := True;
               QRShape1.Enabled := QRShape1.Visible;
      end;
   PrintBand := True;
end;

end.
