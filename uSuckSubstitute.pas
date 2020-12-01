unit uSuckSubstitute;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxDBComb, RXCtrls, ComCtrls, ToolWin, ToolEdit, RXDBCtrl, Mask,
  DBCtrls, ExtCtrls, kwDBNavigator, Db, DBTables, RxLookup;

type
  TfSuckSubstitute = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Comment: TDBEdit;
    ReplacementDate: TDBDateEdit;
    qEligible: TQuery;
    dsEligible: TDataSource;
    dbnSuckReplace: TKwDBNavigator;
    ToolButton3: TToolButton;
    EligibleAnimals: TRxDBLookupCombo;
    AnimalReplaced: TEdit;
    lApplicDate: TLabel;
    Label5: TLabel;
    Description: TDBComboBox;
    procedure sbExitClick(Sender: TObject);
    procedure dbnSuckReplaceBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure dbnSuckReplaceClick(Sender: TObject; Button: TKNavigateBtn);
    procedure EligibleAnimalsCloseUp(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DescriptionChange(Sender: TObject);
  private
    { Private declarations }
    AnimalID,
    ReplaceAnimalID  : Integer;
    EightMonth : String;
    sMinHeifers,
    sMaxHeifers,
    sHeifersApplied : Integer;
    Num : String;
    procedure GetAllEligibleAnimals(Heifer : Boolean); // Indicate whether heifer or cow.
    procedure HeiferSQL;
    procedure CowSQL;
    procedure AnimalsSQL; // Both heifers and cows
    procedure GetAnimalsForSuckReplace;
    procedure IncDecAnimalsApplied;
  public
    { Public declarations }
  end;

  procedure ShowForm(AID : Integer; Desc : String; EventDate : TDateTime);

var
  fSuckSubstitute: TfSuckSubstitute;

implementation

uses
   DairyData,
   GenTypesConst;

const
   sComment = 'Suckler Cow Replacement';

{$R *.DFM}

procedure ShowForm(AID : Integer; Desc : String; EventDate : TDateTime);
var
   BoolArray : Array [0..2] of Boolean; // 0 = Was Heifer now cow, 1 = Still Heifer, 2 = Always cow
begin
   with TfSuckSubstitute.Create(nil) do
      try

         if EventDate <= 0 then
            begin
               MessageDlg('Invalid date selected, aborting',mtWarning,[mbOK],0);
               Abort;
            end;

         // First initiate the bool array
         FillChar(BoolArray, SizeOf(BoolArray), False);
         AnimalID := AID;
         ReplaceAnimalID := 0;

         WinData.SuckReplace.Open;
         WinData.SuckReplace.Append;

         WinData.tSAppliedFor.Close;
         WinData.tSAppliedFor.CachedUpdates := True;
         WinData.tSAppliedFor.Open;

         ReplacementDate.Date := Date;
         Comment.Text         := sComment;

         // All eligible Heifers
//       EightMonth := FormatDateTime('mm/dd/yyyy',IncMonth(WinData.dSuckApplicDate,-8));
//       EightMonth := FormatDateTime('mm/dd/yyyy',IncMonth(Date,-8)); // SP Changed 02/04/2002 should be calc based on todays Date.
         EightMonth := FormatDateTime('mm/dd/yyyy', IncMonth( EventDate, -8) ); // SP Changed 29/03/2004 should be calc based on Animals Sale/Death Date

         lApplicDate.Caption := FormatDateTime('dd/mm/yyyy',WinData.dSuckApplicDate);
         AnimalReplaced.Text := WinData.AnimalFileByIDNatIDNum.AsString;

         WinData.CheckEvents.Filter := '';
         WinData.CheckEvents.Filtered := False;

         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(WinData.AnimalFileByIDID.AsInteger) + ') And (EventType = ' + IntToStr(CCalvingEvent) + ')';
         WinData.CheckEvents.Filtered := True;
         WinData.CheckEvents.First;

         // First see if animal was heifer when applic was made, dLact=0.
         // compare to current lact, if it has current lact changed, if so class it as a cow.
         if WinData.dLactNo = 0 then
            begin
               if WinData.dLactNo <> WinData.AnimalFileByIDLactNo.AsInteger then
                  BoolArray[0] := True
               else
                  BoolArray[1] := True;
            end
         else
            BoolArray[2] := True;

         // Clear the Filter
         WinData.CheckEvents.Filter := '';
         WinData.CheckEvents.Filtered := False;

         if BoolArray[0] OR BoolArray[1] then
            begin
               // Write the descriptions
               Description.Items.Clear;
               Description.Items.Add('Sale');
               Description.Items.Add('Death');
              // Description.Items.Add('Calving'); SP '04 whole block prob needs rewriting. but last year (2004) of premiums so just leave as is

               if Desc <> '' then
                  Description.Text := Desc;

               GetAllEligibleAnimals(True); // True meaning animal is a Heifer
            end
         else
            begin
               // Write the descriptions, leave out calving if cows
               Description.Items.Clear;
               Description.Items.Add('Sale');
               Description.Items.Add('Death');

               if Desc <> '' then
                  Description.Text := Desc;

               GetAllEligibleAnimals(False); // False meaning animal is a Cow
            end;

         WinData.SuckReplace.FieldByName('LastAID').AsInteger := AID;
         WinData.SuckReplace.FieldByName('SuckApplicID').AsInteger := WinData.dSuckApplicID;
         WinData.SuckReplace.FieldByName('SuckApplicDate').AsDateTime := WinData.dSuckApplicDate;
         WinData.SuckReplace.FieldByName('Description').AsString := Desc;

         ShowModal;

      finally
         qEligible.Close;
         qEligible.Free;

         WinData.SuckReplace.CancelUpdates;
         WinData.SuckReplace.Close;

         WinData.tSAppliedFor.CancelUpdates;
         WinData.tSAppliedFor.Close;
         WinData.tSAppliedFor.CachedUpdates := False;

         Free;
      end;
end;

procedure TfSuckSubstitute.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfSuckSubstitute.AnimalsSQL;
begin
   qEligible.SQL.Clear;
   qEligible.SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.AnimalNo, A.LactNo ');
   qEligible.SQL.Add('FROM Animals A, Breeds B');
   qEligible.SQL.Add('WHERE (A.DateOfBirth <= "' + EightMonth + '")');
   qEligible.SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
   qEligible.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
   qEligible.SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
   qEligible.SQL.Add('AND   (A.InHerd=TRUE)');
   qEligible.SQL.Add('AND   (A.PrimaryBreed=B.ID)');
   qEligible.SQL.Add('AND   (B.EligibleForPremium=TRUE)');
   qEligible.SQL.Add('AND   (A.ID NOT IN (SELECT DISTINCT S.AnimalID FROM sAppliedFor S ');
   qEligible.SQL.Add('                    WHERE S.ApplicationID='+IntToStr(WinData.dSuckApplicID)+'))');
   qEligible.SQL.Add('AND   (A.HerdID= ' + IntToStr(WinData.dSuckHerdID) + ')');
   qEligible.Open;
   if qEligible.RecordCount <= 0 then
      begin
         MessageDlg('There are no eligible animals for replacement',mtWarning,[mbOK],0);
         Abort;
      end;

end;

procedure TfSuckSubstitute.CowSQL;
begin
   qEligible.SQL.Clear;
   qEligible.SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.AnimalNo, A.LactNo ');
   qEligible.SQL.Add('FROM Animals A, Breeds B');
   qEligible.SQL.Add('WHERE (A.LactNo > 0) ');
   qEligible.SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
   qEligible.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
   qEligible.SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
   qEligible.SQL.Add('AND   (A.InHerd=TRUE)');
   qEligible.SQL.Add('AND   (A.PrimaryBreed=B.ID)');
   qEligible.SQL.Add('AND   (B.EligibleForPremium=TRUE)');
   qEligible.SQL.Add('AND   (A.ID NOT IN (SELECT DISTINCT S.AnimalID FROM sAppliedFor S ');
   qEligible.SQL.Add('                    WHERE S.ApplicationID='+IntToStr(WinData.dSuckApplicID)+'))');
   qEligible.SQL.Add('AND (A.HerdID= ' + IntToStr(WinData.dSuckHerdID) + ')');
   qEligible.Open;
   if qEligible.RecordCount <= 0 then
      begin
         MessageDlg('There are no eligible cows for replacement',mtWarning,[mbOK],0);
         Abort;
      end;
end;

procedure TfSuckSubstitute.HeiferSQL;
begin
   qEligible.SQL.Clear;
   qEligible.SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.AnimalNo, A.LactNo ');
   qEligible.SQL.Add('FROM   Animals A, Breeds B');
   qEligible.SQL.Add('WHERE (A.DateOfBirth <= "' + EightMonth + '")');
   qEligible.SQL.Add('AND   (A.LactNo = 0)');
   qEligible.SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
   qEligible.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
   qEligible.SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
   qEligible.SQL.Add('AND   (A.InHerd=TRUE)');
   qEligible.SQL.Add('AND   (A.PrimaryBreed=B.ID)');
   qEligible.SQL.Add('AND   (B.EligibleForPremium=TRUE)');
   // Excludes
   qEligible.SQL.Add('AND   (A.ID NOT IN (SELECT DISTINCT S.AnimalID FROM sAppliedFor S ');
   qEligible.SQL.Add('                    WHERE S.ApplicationID='+IntToStr(WinData.dSuckApplicID)+'))');
   qEligible.SQL.Add('AND (A.HerdID= ' + IntToStr(WinData.dSuckHerdID) + ')');
   qEligible.Open;
   if qEligible.RecordCount <= 0 then
      begin
         MessageDlg('There are no eligible heifers for replacement',mtWarning,[mbOK],0);
         Abort;
      end;
end;

procedure TfSuckSubstitute.GetAllEligibleAnimals(Heifer: Boolean);
begin
   GetAnimalsForSuckReplace;
(*
   if sMinHeifers > 0 then  { SP From '04 this will always be 0, because there is no minimum requirement for heifers }
      begin
         if sHeifersApplied <= sMinHeifers then
            begin
               // If only the MIN number of heifers are applied, then a heifer must replace a heifer but a cow can be replaced
               // by either a cow or a heifer
               if Heifer then
                  HeiferSQL
               else
                  AnimalsSQL;
            end
         else if sHeifersApplied >= sMaxHeifers then
            begin
               // if the MAX number of heifers are applied, then a heifer can be replaced by a cow or a heifer, but a cow can only
               // be replaced by a cow
               if Heifer then
                  AnimalsSQL
               else
                  CowSQL;
            end
         else
            AnimalsSQL;
      end
   else
      begin

Removed from 2004 slaughter premium  *)

         if sHeifersApplied >= sMaxHeifers then  { If }
            begin
               if Heifer then
                  AnimalsSQL
               else
                  CowSQL;
            end
         else
            begin
(*
               if Heifer then
                  HeiferSQL
               else
                  CowSQL;

Removed from 2004 slaughter premium  *)

{               if Heifer then
                  HeiferSQL
               else}
                  AnimalsSQL;
            end;
//      end;
end;

procedure TfSuckSubstitute.dbnSuckReplaceBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if Button = kwnbPost then
      begin
         if ReplaceAnimalID <= 0 then
            begin
               MessageDlg('You must select a replacement animal',mtError,[mbOK],0);
               Abort;
            end;

         if ReplacementDate.Date <= 0 then
            begin
               MessageDlg('You must enter a replacement date',mtError,[mbOK],0);
               Abort;
            end;

         if Description.Text = '' then
            begin
               MessageDlg('Please select a description',mtError,[mbOk],0);
               Abort;
            end;
      end;
end;

procedure TfSuckSubstitute.dbnSuckReplaceClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if Button = kwnbPost then
      begin
         if MessageDlg('Are you sure you want to replace animal '+AnimalReplaced.Text+', with animal '+Num+'',mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               IncDecAnimalsApplied;
               if WinData.tSAppliedFor.Locate('AnimalID;ApplicationID;ApplicationDate',VarArrayOf([AnimalID,WinData.dSuckApplicID,WinData.dSuckApplicDate]),[]) then
                  begin
                     WinData.tSAppliedFor.Edit;
                     WinData.tSAppliedFor.FieldByName('AnimalID').AsInteger := ReplaceAnimalID;
                     WinData.tSAppliedFor.Post;

                     WinData.SuckReplace.ApplyUpdates;
                     WinData.tSAppliedFor.ApplyUpdates;

                     MessageDlg('Replacement Complete.',mtInformation,[mbOK],0);
                     Close;
                  end
               else
                  begin
                     MessageDlg('Cannot locate record, contact Kingswood',mtError,[mbOK],0);
                     WinData.SuckReplace.CancelUpdates;
                     WinData.tSAppliedFor.CancelUpdates;
                     Abort;
                  end;
            end
         else
            begin
               WinData.SuckReplace.CancelUpdates;
               WinData.tSAppliedFor.CancelUpdates;
               Close;
            end;
      end
   else
      begin
         WinData.SuckReplace.CancelUpdates;
         WinData.tSAppliedFor.CancelUpdates;
         Close;
      end;
end;

procedure TfSuckSubstitute.EligibleAnimalsCloseUp(Sender: TObject);
begin
   // This is the AnimalID to replace old one.
   if EligibleAnimals.KeyValue > 0 then
      ReplaceAnimalID := EligibleAnimals.KeyValue;
   Num := EligibleAnimals.Text;
end;

procedure TfSuckSubstitute.sbHelpClick(Sender: TObject);
begin
   //
end;

procedure TfSuckSubstitute.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.SuckReplace, ModalResult = mrOK );
end;

procedure TfSuckSubstitute.GetAnimalsForSuckReplace;
var
   ACount : TQuery;
   nYear,
   nMonth,
   nDay : Word;
begin
   try
      try
         sHeifersApplied := 0;
         sMinHeifers     := 0;
         sMaxHeifers     := 0;

         DecodeDate(Date, nYear, nMonth, nDay);

         ACount := TQuery.Create(nil);
         ACount.DataBaseName := WinData.KingData.DataBaseName;
         with ACount do
            begin
               SQL.Clear;
               SQL.Add('SELECT * FROM SApplic');
               SQL.Add('WHERE (YearOfApplic = ' + '''' + IntToStr(nYear) + '''' +')');
               SQL.Add('AND (HerdID= ' + IntToStr(WinData.dSuckHerdID) + ')');
               Open;

               if ACount.FieldByName('MinHeifer').AsInteger > 0 then
                  sMinHeifers := ACount.FieldByName('MinHeifer').AsInteger;
               if ACount.FieldByName('MaxHeifer').AsInteger > 0 then
                  sMaxHeifers := ACount.FieldByName('MaxHeifer').AsInteger;
               if ACount.FieldByName('HeifersApplied').AsInteger > 0 then
                  sHeifersApplied := ACount.FieldByName('HeifersApplied').AsInteger;
            end;
      except
       //
      end;
   finally
      ACount.Close;
      ACount.Free;
   end;
end;

procedure TfSuckSubstitute.DescriptionChange(Sender: TObject);
begin
   if WinData.SuckReplace.State = dsInsert then
      WinData.SuckReplace.FieldByName('Description').AsString := (Sender As TDBComboBox).Text;
end;

procedure TfSuckSubstitute.IncDecAnimalsApplied;
begin
   if WinData.LookUpDamSire.Locate('NatIDNum', Num, []) then
      begin
         if WinData.LookUpDamSire.FieldByName('LactNo').AsInteger = 0 then
            WinData.IncDecAnimalsApplied(cIncHefs)
         else
            WinData.IncDecAnimalsApplied(cIncCows)
      end;
end;

end.
