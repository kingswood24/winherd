unit uAccsReps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, RXCtrls, RxLookup,db, dbTables,
  Menus, FileCtrl;

type
  TfmAccsReps = class(TForm)
    Bevel4: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    Label1: TLabel;
    RxSpeedButton8: TRxSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Exit: TRxSpeedButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    lHerdFarm: TLabel;
    HerdCombo: TRxDBLookupCombo;
    ToolButton4: TToolButton;
    RxSpeedButton6: TRxSpeedButton;
    ToolButton3: TToolButton;
    RxSpeedButton5: TRxSpeedButton;
    NLAccs: TTable;
    Groups: TTable;
    PopupMenu1: TPopupMenu;
    LivestockClassification1: TMenuItem;
    pbCollectData: TProgressBar;
    RxSpeedButton7: TRxSpeedButton;
    procedure ExitClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxSpeedButton3Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure RxSpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButton6Click(Sender: TObject);
    procedure HerdComboCloseUp(Sender: TObject);
    procedure LivestockClassification1Click(Sender: TObject);
    procedure RxSpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
    Depreciation : double;
    GroupsChecked,
    NlaccsChecked : Boolean;
    function ValidHerdID : Boolean;
    procedure CheckValidHerdID;
    procedure CheckTables;
    procedure NAlccsIntegrityCheck;
    procedure GroupsIntegrityCheck;
    function TablesExist : Boolean;
    function UnallocBalances : Boolean;
  public
    { Public declarations }
    ReportTypeDairy : Boolean;
    HerdID : Integer;
  end;

const
   DbPath = 'C:\Kingsacc\';

var
  fmAccsReps: TfmAccsReps;

implementation

uses
   DairyData, uProfitLoss, uBalanceSheet, uDairyProfit, uSWSReport, KRoutines, LiveStkClass, uLivestockSum, Def;

{$R *.DFM}

procedure TfmAccsReps.ExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmAccsReps.RxSpeedButton1Click(Sender: TObject);
begin
   CheckTables;
   CheckValidHerdID;
   Application.CreateForm(TfmProfitLoss, fmProfitLoss);
end;

function TfmAccsReps.ValidHerdID : Boolean;
begin
   Result := HerdCombo.Value <> '0';
end;

procedure TfmAccsReps.CheckValidHerdID;
begin
   if not ValidHerdID then
      begin
         MessageDlg('Please select a herd',mtInformation,[mbOK],0);
         Abort;
      end;
end;

procedure TfmAccsReps.RxSpeedButton3Click(Sender: TObject);
begin
   CheckTables;
   CheckValidHerdID;
   Application.CreateForm(TfmProfitMonitor, fmProfitMonitor);
   if UnallocBalances then
      if MessageDlg('You have several Unallocated Variable Cost balances.'+#13+
                    'Click "Yes" to automatically allocate the balances'+#13+
                    'on the basis of Entreprise Livestock Units'+#13+
                    'Click "No" to manually allocate the balances'+#13+
                    'using Entreprise Transfers in the Accounts Program?',mtConfirmation,[mbYes,mbNo],0) = idYes then
         fmProfitMonitor.SetUnallocated(HerdCombo.KeyValue, NLAccs.DatabaseName);
   uDairyProfit.Preview(HerdCombo.KeyValue);
   try
      fmProfitMonitor.Free;
   except
   end;
end;

procedure TfmAccsReps.RxSpeedButton2Click(Sender: TObject);
begin
   CheckTables;
   CheckValidHerdID;
   Application.CreateForm(TfmBalanceSheet, fmBalanceSheet);
end;

procedure TfmAccsReps.RxSpeedButton4Click(Sender: TObject);
begin
   CheckValidHerdID;
   if Definition.dUseKingsAccs then
      WinData.CallProg.Accounts(' R ' + RegistrySerialNum, WinData.UserDefaultHerdID)
   else
      WinData.CallProg.Accounts(' R ', WinData.UserDefaultHerdID);
end;

procedure TfmAccsReps.NAlccsIntegrityCheck;
begin
   with NLAccs do
      try
         { Open Table }
         Open;
         { Go to First Record In The Table }
         First;
         while not eof do
            begin
               { Make All Negative Balances a Positive Figure }
               if (((FieldByName('Category').AsString = 'EI') or (FieldByName('Category').AsString = 'LI')) and (FieldByName('Balance').AsFloat < 0)) then
                  begin
                     { Now Save The New Balance }
                     Edit;
                     FieldByName('Balance').AsFloat := FieldByName('Balance').AsFloat * -1;
                     Post;
                  end;
               { Capitalize All Names }
               if Length(Trim(FieldByName('Name').AsString)) > 0 then
                  begin
                     Edit;
                     FieldByName('Name').AsString := CapitalizeString(FieldByName('Name').AsString);
                     Post;
                  end;
               { Go To Next Record In Table }
               Next;
            end;
      finally
         { Close Table }
         Close;
      end;
end;

procedure TfmAccsReps.FormCreate(Sender: TObject);
begin
   HerdCombo.Value := intToStr(WinData.UserDefaultHerdID);
   CheckTables;
end;

procedure TfmAccsReps.GroupsIntegrityCheck;
var
   TempStr : String;
   TempChar : String;
   i : Byte;
begin
   with Groups do
      try
         { Open Table }
         Open;
         { Go to First Record In The Table }
         First;
         while not eof do
            begin
               { Capitalize All Names }
               if Length(Trim(FieldByName('Groupdesc').AsString)) > 0 then
                  begin
                     Edit;
                     FieldByName('GroupDesc').AsString := CapitalizeString(FieldByName('GroupDesc').AsString);
                     Post;
                  end;
               { Go To Next Record In Table }
               Next;
            end;
      finally
         { Close Table }
         Close;
      end;
end;

procedure TfmAccsReps.CheckTables;
begin
   NlaccsChecked := False;
   GroupsChecked := False;
   if not TablesExist then
      begin
         MessageDlg('Unable to load Accs database.'+#13+#13+
                    'Select the herd associated with your accounts company'+#13+
                    'and click Import Data to regenerate database',mtInformation,[mbOK],0);
         Abort;
      end
   else
      begin
         NAlccsIntegrityCheck;
         NlaccsChecked := True;
         GroupsIntegrityCheck;
         GroupsChecked := True;
      end;
end;

procedure TfmAccsReps.RxSpeedButton6Click(Sender: TObject);
begin
   if Definition.dUseKingsAccs then
      begin
         pbCollectData.Visible := True;
         pbCollectData.Max := 13;
         pbCollectData.Step := 1;
         WinData.CallProg.Accounts(' NL ' + RegistrySerialNum, WinData.UserDefaultHerdID);
         pbCollectData.StepIt;
         WinData.DataForAccounts := True;
         uLivestockSum.ShowTheForm(RepsStkInventSilent, pbCollectData);
         pbCollectData.Visible := False;
         WinData.DataForAccounts := False;
      end
   else
      begin
         pbCollectData.Visible := True;
         pbCollectData.Max := 13;
         pbCollectData.Step := 1;
         WinData.CallProg.Accounts(' NL ', WinData.UserDefaultHerdID);
         pbCollectData.StepIt;
         WinData.DataForAccounts := True;
         uLivestockSum.ShowTheForm(RepsStkInventSilent, pbCollectData);
         pbCollectData.Visible := False;
         WinData.DataForAccounts := False;
      end;
end;

function TfmAccsReps.TablesExist: Boolean;
var
   TempName : String;
begin
   Result := False;
   TempName := DbPath + WinData.GetAccsCompany(WinData.UserDefaultHerdID);

   if DirectoryExists(TempName) then
      begin
         if NLaccs.Active then
            NLaccs.Active := False;
         NLaccs.DatabaseName := TempName;

         if Groups.Active then
            Groups.Active := False;
         Groups.DatabaseName := TempName;
         Result := (NLaccs.Exists) and (Groups.Exists);
      end;
end;

procedure TfmAccsReps.HerdComboCloseUp(Sender: TObject);
begin
   WinData.UserDefaultHerdID := StrToInt(HerdCombo.Value);
   CheckTables;
end;

procedure TfmAccsReps.LivestockClassification1Click(Sender: TObject);
begin
   LiveStkClass.RunReport(StrToInt(HerdCombo.Value));
end;

function TfmAccsReps.UnallocBalances: Boolean;
var
   qUnallocated : TQuery;
begin
   Result := False;
   qUnallocated := TQuery.Create(nil);
   try
      qUnallocated.DatabaseName := NLAccs.DatabaseName;

      with qUnallocated do
         begin
            sql.Clear;
            sql.Add('SELECT COUNT(ID) CID FROM Nlaccs');
            sql.Add('WHERE Balance > 0');
            sql.Add('AND ID in (301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311)');
            Open;

            if FieldByName('CID').asInteger > 0 then
               Result := True;
            Close;
         end;
   finally
      Free;
   end;
end;


procedure TfmAccsReps.RxSpeedButton7Click(Sender: TObject);
begin
   CheckTables;
   CheckValidHerdID;
   Application.CreateForm(TfmSWSReport, fmSWSReport);
   try
   if UnallocBalances then
      fmSWSReport.SetUnallocated(HerdCombo.KeyValue, NLAccs.DatabaseName);
   uSWSReport.Preview(HerdCombo.KeyValue);

   finally
      fmSWSReport.Free;
   end;
end;

end.


