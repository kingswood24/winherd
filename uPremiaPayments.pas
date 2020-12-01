unit uPremiaPayments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, TB97, TB97Tlbr, StdCtrls, RxLookup, ExtCtrls, Mask, ToolEdit,
  RXDBCtrl, db, dbtables, DBCtrls, Menus, Grids, DBGrids, RXSplit, BDE;

type
   TPremType = (Beef, Suck, Slgth);
   TPaymentDetails = Record
      PaymentType : Record
                 Beef    : Record
                    Month9_Rec   : Double; // P for Payed!
                    Month21_Rec  : Double;
                    BullP_Rec    : Double;

                    Month9_Calc  : Double; // AC for Amount Calculated!
                    Month21_Calc : Double;
                    Bull_Calc    : Double;

                    Month9_Clm   : Word; // C for claimed!
                    Month21_Clm  : Word;
                    Bull_Clm     : Word;
                 end;
                 Suckler : Record
                    CowHeif_Rec    : Word;
                    HeifTopUp_Rec  : Word;
                    CowHeif_Calc    : Double;
                    HeifTopUp_Calc : Double;
                    CowHeif_Clm     : Word;
                    HeifTopUp_Clm  : Word;
                 end;
                 Slaughter : Record
                    Slaught_Rec      : Word;
                    Slaught_Calc     : Double;
                    Slaught_Clm      : Word;

                    HeifSlaught_Rec  : Word;
                    HeifSlaught_Calc : Double;
                    HeifSlaught_Clm  : Word;
                 end;

      end;

{      PaymentAmount : record
         First_Amt     : Double;
         Second_Amt    : Double;
         Bull_Amt      : Double;
         SuckCow_Amt   : Double;
         SuckHeif_Amt  : Double;
         HeifSlght_Amt : Double;
         Slght_Amt     : Double;
         Running_Amt   : Double;
      end;
}
   end;
  TPremiaPayments = class(TForm)
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    sbExit: TRxSpeedButton;
    sbSave: TRxSpeedButton;
    sbCancel: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    HerdCombo: TRxDBLookupCombo;
    Label1: TLabel;
    ToolbarSep974: TToolbarSep97;
    sbDefaults: TRxSpeedButton;
    pmPremType: TPopupMenu;
    SpecialBeefPremium1: TMenuItem;
    SucklerCowPremium1: TMenuItem;
    SlaughterPremium1: TMenuItem;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep976: TToolbarSep97;
    qPrevPayments: TQuery;
    dsPrevPayments: TDataSource;
    p: TPanel;
    gbApplied: TGroupBox;
    lFirst: TLabel;
    lSecond: TLabel;
    lBull: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label27: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit12: TEdit;
    Edit11: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label11: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    LookUpPayments: TRxDBLookupCombo;
    Label2: TLabel;
    PayComment2: TDBMemo;
    PayGrid: TStringGrid;
    ToolbarSep975: TToolbarSep97;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    PaymentTable: TTable;
    dsPaymentTable: TDataSource;
    PaymentTableID: TAutoIncField;
    PaymentTableApplicID: TIntegerField;
    PaymentTablePayDate: TDateField;
    PaymentTablePayRefNo: TStringField;
    PaymentTablePayOrdNo: TStringField;
    PaymentTableBeefReduct: TCurrencyField;
    PaymentTableFirst_Amt: TCurrencyField;
    PaymentTableSecond_Amt: TCurrencyField;
    PaymentTableBull_Amt: TCurrencyField;
    PaymentTableFirst_Clm: TIntegerField;
    PaymentTableSecond_Clm: TIntegerField;
    PaymentTableBull_Clm: TIntegerField;
    PaymentTableSuckCowHeif_Amt: TCurrencyField;
    PaymentTableSuckHeifTopUp_Amt: TCurrencyField;
    PaymentTableSuckCowHeif_Clm: TIntegerField;
    PaymentTableSuckHeifTopUp_Clm: TIntegerField;
    PaymentTableSlght_Amt: TCurrencyField;
    PaymentTableSlghtHeifTopUp_Amt: TCurrencyField;
    PaymentTableSlght_Clm: TIntegerField;
    PaymentTableSlghtHeifTopUp_Clm: TIntegerField;
    PaymentTablePenalty_Amt: TCurrencyField;
    PaymentTableRunning_Amt: TCurrencyField;
    PaymentTablePayable_Amt: TCurrencyField;
    PaymentTableBalanceDue: TCurrencyField;
    PaymentTableComment: TBlobField;
    RxSplitter1: TRxSplitter;
    RxSplitter2: TRxSplitter;
    RxSplitter4: TRxSplitter;
    RxSplitter5: TRxSplitter;
    PaymentTablePayType: TIntegerField;
    qPrevPaymentsID: TIntegerField;
    qPrevPaymentsApplicID: TIntegerField;
    qPrevPaymentsPayDate: TDateField;
    qPrevPaymentsPayRefNo: TStringField;
    qPrevPaymentsPayOrdNo: TStringField;
    qPrevPaymentsBeefReduct: TCurrencyField;
    qPrevPaymentsPayType: TIntegerField;
    qPrevPaymentsFirst_Amt: TCurrencyField;
    qPrevPaymentsSecond_Amt: TCurrencyField;
    qPrevPaymentsBull_Amt: TCurrencyField;
    qPrevPaymentsFirst_Clm: TIntegerField;
    qPrevPaymentsSecond_Clm: TIntegerField;
    qPrevPaymentsBull_Clm: TIntegerField;
    qPrevPaymentsSuckCowHeif_Amt: TCurrencyField;
    qPrevPaymentsSuckHeifTopUp_Amt: TCurrencyField;
    qPrevPaymentsSuckCowHeif_Clm: TIntegerField;
    qPrevPaymentsSuckHeifTopUp_Clm: TIntegerField;
    qPrevPaymentsSlght_Amt: TCurrencyField;
    qPrevPaymentsSlghtHeifTopUp_Amt: TCurrencyField;
    qPrevPaymentsSlght_Clm: TIntegerField;
    qPrevPaymentsSlghtHeifTopUp_Clm: TIntegerField;
    qPrevPaymentsPenalty_Amt: TCurrencyField;
    qPrevPaymentsRunning_Amt: TCurrencyField;
    qPrevPaymentsPayable_Amt: TCurrencyField;
    qPrevPaymentsBalanceDue: TCurrencyField;
    qPrevPaymentsComment: TBlobField;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label23: TLabel;
    Label9: TLabel;
    Bevel6: TBevel;
    Label12: TLabel;
    Bevel5: TBevel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    PayComment: TDBMemo;
    PaymentDate: TDBDateEdit;
    Panel3: TPanel;
    RxSpeedButton2: TRxSpeedButton;
    ApplicDate: TRxDBLookupCombo;
    ToolbarSep972: TToolbarSep97;
    lF: TLabel;
    lS: TLabel;
    lB: TLabel;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbDefaultsClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure ApplicDateCloseUp(Sender: TObject);
    procedure SpecialBeefPremium1Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure LookUpPaymentsCloseUp(Sender: TObject);
    procedure SucklerCowPremium1Click(Sender: TObject);
    procedure SlaughterPremium1Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure PaymentTableAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    dsApplications : TDataSource;
    qApplications,
    GenQuery : TQuery;
    qExistingPayments : TQuery;
    dsExistingPayments : TDataSource;
    sPayID : SmallInt;
    First_Amt,
    Second_Amt,
    Bull_Amt,
    SuckCowHeif_Amt,
    SuckHeifTopUp_Amt,
    Slght_Amt,
    HeifSlghtTopUp_Amt,
    Running_Amt   : Double;
    SlghtYearStart,
    SlghtYearEnd : TDateTime;
    procedure InitializeVars;
    procedure SetDataSource;
    procedure SetUpApplications;
    function GetNoOfFirstPremAppliedFor: Integer;
    function GetNoOfSecondPremAppliedFor : Integer;
    function GetNoOfBullPremAppliedFor : Integer;
    function GetNoOfSlghtAppliedFor : String;
    function GetNoOfSlghtHeifAppliedFor : String;

    procedure GetPremAppllied;
    procedure LoadDefaults(Year : Integer);
    procedure CheckInputs;
    procedure GatherPrevInfo;
    procedure DrawGrid;
    procedure GatherInfo;
    procedure PayableAmt;
    function CheckPaymentState : Boolean;
    function TotalPayable : Currency;
    procedure LoadPrevPayGrid;
    procedure LoadSuckApplied;
    function GetCurrYear : Integer;
    Function GetYearStart : TDateTime;
    Function GetYearEnd : TDateTime;
    procedure ClearEdits;
    function CurrYear : String;
    procedure ClearDetails;
  public
    { Public declarations }
  end;

var
  PremiaPayments: TPremiaPayments;
  PayRec : TPaymentDetails;
  Prem : TPremType;

const
   BeefPrem  = 1;
   SuckPrem  = 2;
   SlghtPrem = 3;

implementation
uses
   DairyData,
   uExtDefaults,
   GenTypesConst;
{$R *.DFM}

procedure TPremiaPayments.InitializeVars;
begin
   //
end;

procedure TPremiaPayments.sbExitClick(Sender: TObject);
begin
   if PaymentTable.State in dsEditModes then
      PaymentTable.Cancel;
   Close;
end;

procedure TPremiaPayments.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(sbSave.Glyph, cBtnImgSave);
   WinData.LoadBtnImage(sbCancel.Glyph, cBtnImgCancel);

   qExistingPayments := TQuery.Create(nil);
   qExistingPayments.DatabaseName := WinData.KingData.DataBaseName;

   dsExistingPayments := TDataSource.Create(nil);
   dsExistingPayments.DataSet := qExistingPayments;

   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := WinData.KingData.DataBaseName;

   qApplications := TQuery.Create(nil);
   qApplications.DatabaseName := WinData.KingData.DataBaseName;

   dsApplications := TDataSource.Create(nil);
   dsApplications.DataSet := qApplications;

//   qPrevPayments.Open;

   LoadDefaults(GetCurrYear);

   SetDataSource;
end;

procedure TPremiaPayments.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   PaymentTable.Close;
   DBEdit4.DataSource  := nil;
   DBEdit6.DataSource  := nil;
   DBEdit7.DataSource  := nil;
   DBEdit8.DataSource  := nil;
   DBEdit9.DataSource  := nil;
   DBEdit10.DataSource := nil;
   DBEdit11.DataSource  := nil;
   PaymentDate.DataSource := nil;
   PayComment.DataSource  := nil;

   GenQuery.Close;
   GenQuery.Free;
   qPrevPayments.Close;
   qPrevPayments.Free;
   qApplications.Close;
   qApplications.Free;
   qExistingPayments.Close;
   qExistingPayments.Free;
   PaymentTable.Close;
end;

procedure TPremiaPayments.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TPremiaPayments.SetDataSource;
begin
   PaymentDate.DataField := 'PayDate';
   DBEdit4.DataField := 'PayRefNo';
   Case Prem of
      Beef :  begin
                 DBEdit7.DataField  := 'First_Amt';
                 DBEdit6.DataField  := 'First_Amt';
                 DBEdit8.DataField  := 'Second_Amt';
                 DBEdit9.DataField  := 'Second_Amt';
                 DBEdit10.DataField := 'Bull_Amt';
                 DBEdit11.DataField := 'Bull_Amt';
              end;
      Suck  : begin

                 DBEdit7.DataField := 'SuckCowHeif_Amt';
                 DBEdit6.DataField := 'SuckCowHeif_Amt';
                 DBEdit9.DataField := 'SuckHeifTopUp_Amt';
                 DBEdit8.DataField := 'SuckHeifTopUp_Amt';
                 DBEdit10.DataField := '';
              end;
      Slgth : begin
                 DBEdit7.DataField := 'Slght_Amt';
                 DBEdit6.DataField := 'Slght_Amt';
                 DBEdit9.DataField := 'SlghtHeifTopUp_Amt';
                 DBEdit8.DataField := 'SlghtHeifTopUp_Amt';
                 DBEdit10.DataField := '';
              end;
   end;

   PayComment.DataField := 'Comment';
   PayComment2.DataField := 'Comment';

   DBEdit4.DataSource  := dsPaymentTable;
   DBEdit6.DataSource  := dsPaymentTable;
   DBEdit7.DataSource  := dsPaymentTable;
   DBEdit8.DataSource  := dsPaymentTable;
   DBEdit9.DataSource  := dsPaymentTable;
   DBEdit10.DataSource := dsPaymentTable;
   DBEdit11.DataSource  := dsPaymentTable;

   PaymentDate.DataSource := dsPaymentTable;
   PayComment.DataSource  := dsPaymentTable;

end;

function TPremiaPayments.GetNoOfBullPremAppliedFor : Integer;
begin
    RESULT := 0;
    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(EventID) CountForApplic FROM ' + WinData.BeefSubsidy.TableName + ' B, ');
           SQL.Add('Applications A');
           SQL.Add('WHERE (PremiumType="B")');
           SQL.Add('AND (A.HerdID = "' + HerdCombo.Value + '")');
           SQL.Add('AND (A.ApplicationID=B.ApplicationID)');
           SQL.Add('AND (ApplicationID =' + IntToStr(ApplicDate.KeyValue) + ')');
           Open;
           if NOT IsEmpty then
              RESULT := FieldByName('CountForApplic').AsInteger;
       end;
end;

function TPremiaPayments.GetNoOfFirstPremAppliedFor : Integer;
begin
    RESULT := 0;
    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(EventID) CountForApplic FROM ' + WinData.BeefSubsidy.TableName + ' B, ');
           SQL.Add('Applications A');
           SQL.Add('WHERE (PremiumType="F")');
           SQL.Add('AND (A.HerdID = "' + HerdCombo.Value + '")');
           SQL.Add('AND (A.ApplicationID=B.ApplicationID)');
           SQL.Add('AND (ApplicationID =' + IntToStr(ApplicDate.KeyValue) + ')');
           Open;
           if NOT IsEmpty then
              RESULT := FieldByName('CountForApplic').AsInteger;
       end;
end;

function TPremiaPayments.GetNoOfSecondPremAppliedFor : Integer;
begin
    RESULT := 0;
    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(EventID) CountForApplic FROM ' + WinData.BeefSubsidy.TableName + ' B, ');
           SQL.Add('Applications A');
           SQL.Add('WHERE (PremiumType="S")');
           SQL.Add('AND (A.HerdID = "' + HerdCombo.Value + '")');
           SQL.Add('AND (A.ApplicationID=B.ApplicationID)');
           SQL.Add('AND (ApplicationID =' + IntToStr(ApplicDate.KeyValue) + ')');
           Open;
           if NOT IsEmpty then
              RESULT := FieldByName('CountForApplic').AsInteger;
       end;
end;

procedure TPremiaPayments.SetUpApplications;
begin
   ApplicDate.LookupSource := nil;
   ApplicDate.LookupField := '';
   ApplicDate.LookupDisplay := '';


   if pmPremType.Items[0].Checked then
      begin
         with qApplications do
            begin
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ApplicationID, A.ApplicationType, A."Date", A.Description');
               SQL.Add('FROM Beefsub B, Applications A           ');
               SQL.Add('WHERE (A.ApplicationID = B.ApplicationID)');
               SQL.Add('AND   (A.HerdID= '+HerdCombo.Value+')    ');
               SQL.Add('ORDER BY A."Date"                        ');
               Open;

               ApplicDate.LookupSource := dsApplications;
               ApplicDate.LookupField := 'ApplicationID';
               ApplicDate.LookupDisplay := 'Date;Description';
               if RecordCount > 1 then
                  ApplicDate.DisplayEmpty := 'Application Date';
            end;
      end
   else if pmPremType.Items[1].Checked then
      begin
         with qApplications do
            begin
               SQL.Clear;
               SQL.Add('SELECT DISTINCT s.ID PremID, s.DateOfApplic, s.Description');
               SQL.Add('FROM sApplic s ');
               SQL.Add('WHERE (s.HerdID= '+HerdCombo.Value+')');
               SQL.Add('ORDER BY s.DateOfApplic');
               Open;

               ApplicDate.LookupSource := dsApplications;
               ApplicDate.LookupField := 'PremID';
               ApplicDate.LookupDisplay := 'DateOfApplic;Description';
               if RecordCount > 1 then
                  ApplicDate.DisplayEmpty := 'Application Date';
            end;
      end
   else
end;

procedure TPremiaPayments.FormShow(Sender: TObject);
begin
   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   DrawGrid;
   SetUpApplications;
   GatherInfo;
   GatherPrevInfo;
end;

procedure TPremiaPayments.sbDefaultsClick(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfExtDefaults);
end;

procedure TPremiaPayments.GetPremAppllied;
var
   Proceed : Boolean;
begin
   Proceed :=  ((HerdCombo.Value <> '0') AND (ApplicDate.Value <> '0'));
   if Proceed then
      with PayRec.PaymentType.Beef do
         begin
            Month9_Clm  := GetNoOfFirstPremAppliedFor;
            Edit7.Text := IntToStr(Month9_Clm);
            Month21_Clm := GetNoOfSecondPremAppliedFor;
            Edit8.Text := IntToStr(Month21_Clm);
            Bull_Clm    := GetNoOfBullPremAppliedFor;
            Edit9.Text := IntToStr(Bull_Clm);
            Month9_Calc := Month9_Clm*First_Amt;
            Edit13.Text := FloatToStrF(Month9_Calc, ffFixed, 8, 2);
            Month21_Calc := Month21_Clm*Second_Amt;
            Edit14.Text := FloatToStrF(Month21_Calc, ffFixed, 8, 2);
            Bull_Calc := Bull_Clm*Bull_Amt;
            Edit15.Text := FloatToStrF(Bull_Calc, ffFixed, 8, 2);
         end;

   if ApplicDate.Value <> '0' then
      with PayGrid, PayRec.PaymentType.Beef do
         begin
            Cells[2, 3] := DBEdit7.Text;
            Cells[2, 4] := DBEdit9.Text;
            Cells[2, 5] := DBEdit10.Text;
            Cells[5, 3] := Edit13.Text;
            Cells[4, 3] := ApplicDate.Text;
            Cells[5, 4] := Edit14.Text;
            Cells[4, 4] := ApplicDate.Text;
            Cells[5, 5] := Edit15.Text;
            Cells[4, 5] := ApplicDate.Text;

            Cells[2, 3] := IntToStr(Month9_Clm);
            Cells[2, 4] := IntToStr(Month21_Clm);
            Cells[2, 5] := IntToStr(Bull_Clm);
         end;

end;

procedure TPremiaPayments.LoadDefaults(Year : Integer);
begin
   WinData.PremiaDefaults.Active := True;
   if Year > 0 then
      if WinData.PremiaDefaults.Locate('Year', Year, []) then
         begin
            First_Amt := WinData.PremiaDefaults.FieldByName('Month10').AsCurrency;
            Second_Amt := WinData.PremiaDefaults.FieldByName('Month22').AsCurrency;
            Bull_Amt := WinData.PremiaDefaults.FieldByName('Bull').AsCurrency;
            SuckCowHeif_Amt := WinData.PremiaDefaults.FieldByName('SuckCowHeif').AsCurrency;
            SuckHeifTopUp_Amt := WinData.PremiaDefaults.FieldByName('SuckHeifTopUp').AsCurrency;
            Slght_Amt := WinData.PremiaDefaults.FieldByName('SlgthPrem').AsCurrency;
            HeifSlghtTopUp_Amt := WinData.PremiaDefaults.FieldByName('SlgthTopUpPrem').AsCurrency;

            with PayGrid do
                begin
                   Cells[1 , 1 ] := FloatToStrF(SuckCowHeif_Amt, ffCurrency, 16, 2);
                   Cells[1 , 2 ] := FloatToStrF(SuckHeifTopUp_Amt,ffCurrency, 16, 2);
                   Cells[1 , 3 ] := FloatToStrF(First_Amt,   ffCurrency, 16, 2);
                   Cells[1 , 4 ] := FloatToStrF(Second_Amt, ffCurrency, 16, 2);
                   Cells[1 , 5 ] := FloatToStrF(Bull_Amt, ffCurrency, 16, 2);
                   Cells[1 , 7 ] := FloatToStrF(Slght_Amt, ffCurrency, 16, 2);
                   Cells[1 , 8 ] := FloatToStrF(HeifSlghtTopUp_Amt, ffCurrency, 16, 2);
                end;
         end
      else
         if MessageDlg(Format('Unable to load defaults for year %d, do you want to %d defaults into system?',[Year, Year]),mtConfirmation,[mbYes,mbNo],0) = idYes then
            WinData.CreateAndShowForm(TfExtDefaults);
   WinData.PremiaDefaults.Active := False;
end;

procedure TPremiaPayments.sbSaveClick(Sender: TObject);
begin

   CheckInputs; // Make sure all details are present and correct.

   with PaymentTable do
      Case Prem of
         Beef  : Try
                    FieldByName('First_Clm').AsInteger  := StrToInt(Edit7.Text);
                    FieldByName('Second_Clm').AsInteger := StrToInt(Edit8.Text);
                    FieldByName('Bull_Clm').AsInteger   := StrToInt(Edit9.Text);
                    FieldByName('PayType').AsInteger := BeefPrem;
                 except
                  //
                 end;
         Suck  : begin
                    FieldByName('SuckCowHeif_Clm').AsInteger  := StrToInt(Edit7.Text);
                    FieldByName('SuckHeifTopup_Clm').AsInteger := StrToInt(Edit8.Text);
                    FieldByName('PayType').AsInteger := SuckPrem;
                 end;
         Slgth : begin
                    FieldByName('Slght_Clm').AsInteger  := StrToInt(Edit7.Text);
                    FieldByName('SuckHeifTopUp_Clm').AsInteger := StrToInt(Edit8.Text);
                    FieldByName('PayType').AsInteger := SlghtPrem;
                 end;
      end;

   if Prem in ([Beef, Suck]) then
      PaymentTable.FieldByName('ApplicID').AsInteger := ApplicDate.KeyValue;

   PaymentTable.Post;
   qPrevPayments.Close;
   qPrevPayments.Open;

   MessageDlg('Payment Complete!',mtInformation,[mbOk],0);
end;

procedure TPremiaPayments.CheckInputs;
begin
   // Make sure all details are present and correct.
end;

procedure TPremiaPayments.GatherInfo;
begin
   LoadDefaults(GetCurrYear);
   Case Prem of
      Beef : GetPremAppllied;
      Suck : LoadSuckApplied;
      Slgth : begin
                 Edit7.Text := GetNoOfSlghtAppliedFor;
                 Edit8.Text := GetNoOfSlghtHeifAppliedFor;
              end;
   end;
   GatherPrevInfo;
end;

procedure TPremiaPayments.ApplicDateCloseUp(Sender: TObject);
begin
   ClearDetails;
   if (ApplicDate.Value <> '0') then
      begin
         PaymentTable.Open;
         PaymentTable.Append;
         PaymentDate.Date := Date;
         GatherInfo;
      end
   else
      MessageDlg('You must select an Application Date before adding payment',mtInformation,[mbOK],0);
end;

procedure TPremiaPayments.Edit7Change(Sender: TObject);
begin
   if (Sender As TEdit).Text = '' then Exit;
   with PayGrid do
      Case Prem of
         Beef :  with PayRec.PaymentType.Beef do
                    begin
                       Month9_Calc := Month9_Clm*First_Amt;
                       Edit13.Text := FloatToStrF(Month9_Calc, ffFixed, 8, 2);
                    end;
         Suck : with PayRec.PaymentType.Suckler do
                   begin
                      CowHeif_Calc := CowHeif_Clm*SuckCowHeif_Amt;
                      Edit13.Text := FloatToStrF(CowHeif_Calc, ffFixed, 8, 2);
                   end;
         Slgth :with PayRec.PaymentType.Slaughter do
                   begin
                      Slaught_Calc := Slaught_Clm*Slght_Amt;
                      Edit13.Text := FloatToStrF(Slaught_Calc, ffFixed, 8, 2);
                   end;
      end;
end;

procedure TPremiaPayments.Edit8Change(Sender: TObject);
begin
   if (Sender As TEdit).Text = '' then Exit;
   with PayGrid do
      Case Prem of
         beef : with PayRec.PaymentType.Beef do
                   begin
                      Month21_Calc := Month21_Clm*Second_Amt;
                      Edit14.Text  := FloatToStrF(Month21_Calc, ffFixed, 8, 2);
                   end;
         Suck : with PayRec.PaymentType.Suckler do
                   begin
                      HeifTopUp_Calc := HeifTopUp_Clm*SuckHeifTopUp_Amt;
                      Edit14.Text := FloatToStrF(HeifTopUp_Calc, ffFixed, 8, 2);
                   end;
         Slgth :with PayRec.PaymentType.Slaughter do
                   begin
                      HeifSlaught_Calc := HeifSlaught_Clm*HeifSlghtTopUp_Amt;
                      Edit14.Text := FloatToStrF(HeifSlaught_Calc, ffFixed, 8, 2);
                   end;
      end;

end;

procedure TPremiaPayments.Edit9Change(Sender: TObject);
begin
   if (Sender As TEdit).Text = '' then Exit;
   Case Prem of
      Beef : with PayRec.PaymentType.Beef do
             begin
                Bull_Calc := Bull_Clm*Bull_Amt;
                Edit15.Text := FloatToStrF(Bull_Calc, ffFixed, 8, 2);
             end;
      Suck : begin
             end;
     Slgth : begin
             end;
   end;
end;

procedure TPremiaPayments.DrawGrid;
var
   i : ShortInt;
begin
  for i := 0 to PayGrid.RowCount-1 do
     PayGrid.Rows[i].Clear;

  for i := 0 to PayGrid.ColCount-1 do
     PayGrid.Cols[i].Clear;

   with PayGrid do
      begin
         if Cells[0, 0] <> 'Scheme' then
            begin
               ColWidths[0] := 115;
               ColWidths[2] := 50;
               for i := 1 to ColCount-1 do
                  if not i = 2 then
                     ColWidths[i] := 70;

               //   Col Row
               Cells[0, 0] := 'Scheme';
               Cells[1, 0] := 'Rate';
               Cells[2, 0] := 'Applied';
               Cells[3, 0] := 'Payable';
               Cells[4, 0] := 'Pay Date';
               Cells[5, 0] := 'Total Due';

               Cells[0, 1] := 'Suckler';
               Cells[0, 2] := 'Heifer Top-up';
               Cells[0, 3] := 'First Age';
               Cells[0, 4] := 'Second Age';
               Cells[0, 5] := 'Bull';
               Cells[0, 7] := 'Slght. Prem.';
               Cells[0, 8] := 'Heifer Slght. Top-up';

               {Cells[0, 11] := 'Area Comp.';
               Cells[0, 12] := 'Allowance';
               Cells[0, 13] := 'Mountain';
               Cells[0, 14] := 'Area Aid';
               Cells[0, 15] := 'Cereals';
               Cells[0, 16] := 'Set Aside';
               Cells[0, 17] := 'Maize Silage';
               Cells[0, 18] := 'Oilseeds';
               Cells[0, 19] := 'Protein Crops';
               Cells[0, 20] := 'Linseed';}
            end;
      LoadDefaults(GetCurrYear);
   end;

end;

procedure TPremiaPayments.GatherPrevInfo;
begin
   with qExistingPayments do
      begin
         Close;
         Sql.Clear;

         Case Prem of
            Beef : if ApplicDate.KeyValue > 0 then
                      begin
                         Sql.Add('Select  Sum(First_Amt) F, Sum(Second_Amt) S, Sum(Bull_Amt) B From PremiaPayments P ');
                         Sql.Add('Where P.ApplicID = :ApplicID');
                         ParamByName('ApplicID').AsInteger := StrToInt(ApplicDate.Value);
                         Open;

                         Edit1.Text := CurrToStr(qExistingPayments.FieldByName('F').AsCurrency);
                         Edit2.Text := CurrToStr(qExistingPayments.FieldByName('S').AsCurrency);
                         Edit3.Text := CurrToStr(qExistingPayments.FieldByName('B').AsCurrency);
                      end;
            Suck :  if ApplicDate.KeyValue > 0 then
                      begin
                         Sql.Add('Select  Sum(SuckCowHeif_Amt) C, Sum(SuckHeifTopUp_Amt) H From PremiaPayments P');
                         Sql.Add('Where P.ApplicID = :ApplicID');
                         ParamByName('ApplicID').AsInteger := StrToInt(ApplicDate.Value);
                         Open;

                         Edit1.Text := CurrToStr(qExistingPayments.FieldByName('C').AsCurrency);
                         Edit2.Text := CurrToStr(qExistingPayments.FieldByName('H').AsCurrency);
                      end;
            Slgth: begin
                      Sql.Add('Select Sum(Slght_Amt) S, Sum(SlghtHeifTopUp_Amt) H From PremiaPayments P');
                      Sql.Add('Where (Extract(YEAR From PayDate) = '+CurrYear+')');
                      Open;

                      Edit1.Text := CurrToStr(qExistingPayments.FieldByName('S').AsCurrency);
                      Edit2.Text := CurrToStr(qExistingPayments.FieldByName('H').AsCurrency);
                   end;
         end;
      end;
end;

procedure TPremiaPayments.sbCancelClick(Sender: TObject);
begin
   PaymentTable.Cancel;
   PaymentTable.Close;
end;

procedure TPremiaPayments.PayableAmt;
begin
   //
end;

function TPremiaPayments.CheckPaymentState: Boolean;
begin
   if PaymentTable.State = dsInsert then
      Result := True
   else
      Result := False;
end;

function TPremiaPayments.TotalPayable: Currency;
begin
   with PayRec.PaymentType.Beef do
      begin
         Result := Month9_Calc+
                   Month21_Calc+
                   Bull_Calc;
      end;
end;

procedure TPremiaPayments.LookUpPaymentsCloseUp(Sender: TObject);
begin
   if PaymentTable.State = dsInsert then
      begin
         MessageDlg('Please Save Payment before selecting previous payment date',mtError,[mbOk],0);
         Exit;
      end
   else if LookUpPayments.Value = '0' then Exit
   else LoadPrevPayGrid; // Load up grid based a payment date.
end;

procedure TPremiaPayments.LoadPrevPayGrid;
var
   ApplicID : Integer;
   Y, M, D : Word;
begin

   if (LookUpPayments.Value = '0') then Exit;

   DrawGrid;

   Case qPrevPayments.FieldByName('PayType').AsInteger of
      1 : Prem := Beef;
      2 : Prem := Suck;
      3 : Prem := Slgth;
   end;

   PayComment2.DataSource := dsPrevPayments;
   PayComment2.DataField := 'Comment';

   DecodeDate(StrToDate(LookUpPayments.Text), Y, M, D);

   with PayGrid, qPrevPayments do
      begin
         case Prem of
            Beef : begin
                      // 9 month payments
                      PayGrid.Cells[2, 3] := IntToStr(FieldByName('First_Clm').AsInteger);
                      PayGrid.Cells[3, 3] := CurrToStrF(FieldByName('First_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 3] := DateToStr(FieldByName('PayDate').AsDateTime);
                      // 21 month payments
                      PayGrid.Cells[2, 4] := IntToStr(FieldByName('Second_Clm').AsInteger);
                      PayGrid.Cells[3, 4] := CurrToStrF(FieldByName('Second_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 4] := DateToStr(FieldByName('PayDate').AsDateTime);
                      // Bull payments
                      PayGrid.Cells[2, 5] := IntToStr(FieldByName('Bull_Clm').AsInteger);
                      PayGrid.Cells[3, 5] := CurrToStrF(FieldByName('Bull_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 5] := DateToStr(FieldByName('PayDate').AsDateTime);

                      PayGrid.Cells[5, 3] := CurrToStrF(FieldByName('First_Clm').AsInteger*First_Amt, ffCurrency, 2);
                      PayGrid.Cells[5, 4] := CurrToStrF(FieldByName('Second_Clm').AsInteger*Second_Amt, ffCurrency, 2);
                      PayGrid.Cells[5, 5] := CurrToStrF(FieldByName('Bull_Clm').AsInteger*Bull_Amt, ffCurrency, 2);
                   end;
            Suck : begin
                      // Col Row
                      PayGrid.Cells[2, 1] := IntToStr(FieldByName('SuckCowHeif_Clm').AsInteger);
                      PayGrid.Cells[3, 1] := CurrToStrF(FieldByName('SuckCowHeif_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 1] := DateToStr(FieldByName('PayDate').AsDateTime);

                      PayGrid.Cells[2, 2] := IntToStr(FieldByName('SuckHeifTopUp_Clm').AsInteger);
                      PayGrid.Cells[3, 2] := CurrToStrF(FieldByName('SuckHeifTopUp_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 2] := DateToStr(FieldByName('PayDate').AsDateTime);

                      PayGrid.Cells[5, 1] := CurrToStrF(FieldByName('SuckCowHeif_Clm').AsInteger*SuckCowHeif_Amt, ffCurrency, 2);
                      PayGrid.Cells[5, 2] := CurrToStrF(FieldByName('SuckHeifTopUp_Clm').AsInteger*SuckHeifTopUp_Amt, ffCurrency, 2);
                   end;
           Slgth : begin
                      // Col Row
                      PayGrid.Cells[2, 7] := IntToStr(FieldByName('Slght_Clm').AsInteger);
                      PayGrid.Cells[3, 7] := CurrToStrF(FieldByName('Slght_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 7] := DateToStr(FieldByName('PayDate').AsDateTime);

                      PayGrid.Cells[2, 8] := IntToStr(FieldByName('SlghtHeifTopUp_Clm').AsInteger);
                      PayGrid.Cells[3, 8] := CurrToStrF(FieldByName('SlghtHeifTopUp_Amt').AsFloat, ffCurrency, 2);
                      PayGrid.Cells[4, 8] := DateToStr(FieldByName('PayDate').AsDateTime);

                      PayGrid.Cells[5, 7] := CurrToStrF(FieldByName('Slght_Clm').AsInteger*Slght_Amt, ffCurrency, 2);
                      PayGrid.Cells[5, 8] := CurrToStrF(FieldByName('SlghtHeifTopUp_Clm').AsInteger*HeifSlghtTopUp_Amt, ffCurrency, 2);
                   end;
         end;
      end;
end;

procedure TPremiaPayments.SucklerCowPremium1Click(Sender: TObject);
begin
   ClearEdits;
   SucklerCowPremium1.Checked := True;
   SlaughterPremium1.Checked := False;
   SpecialBeefPremium1.Checked := False;

   lF.Caption := 'Cow/Heifer';
   lS.Caption := 'Heifer Top-up';
   lB.Visible := False;

   Prem := Suck;

   lFirst.Caption   := 'Cow/Heifer';
   lSecond.Caption  := 'Heifer Top-up';

   lBull.Visible := False;
   Edit9.Visible := False;
   DBEdit10.Visible := False;

   Edit14.Visible := False;
   Edit11.Visible := False;
   Edit15.Visible := False;
   DBEdit11.Visible := False;
   Edit3.Visible := False;
   Edit12.Visible := False;
   ApplicDate.Visible := True;

   with qPrevPayments do
      begin
         SQL.Clear;
         SQL.Add('Select * From PremiaPayments where PayType = '+IntToStr(SuckPrem)+'');
         Open;
      end;

   SetDataSource;
   DrawGrid;
   SetUpApplications;
end;

procedure TPremiaPayments.SlaughterPremium1Click(Sender: TObject);
begin
   PaymentTable.Open;
   PaymentTable.Append;
   PaymentDate.Date := Date;

   ClearEdits;
   SucklerCowPremium1.Checked := False;
   SlaughterPremium1.Checked := True;
   SpecialBeefPremium1.Checked := False;
   Prem := Slgth;

   lFirst.Caption := 'Steer/Heifer/Cow';
   lSecond.Caption := 'Heifer Top-up';

   lF.Caption := 'Steer/Heifer/Cow';
   lS.Caption := 'Heifer Top-up';

   lB.Visible := False;

//   Edit11.Visible := False;
   lBull.Visible := False;
   Edit9.Visible := False;
   DBEdit10.Visible := False;
   Edit15.Visible := False;
   DBEdit11.Visible := False;
   Edit3.Visible := False;
   Edit12.Visible := False;
   ApplicDate.Visible := False;

   SlghtYearStart := GetYearStart;
   SlghtYearEnd   := GetYearEnd;

   with qPrevPayments do
      begin
         SQL.Clear;
         SQL.Add('Select * From PremiaPayments where PayType = '+IntToStr(SlghtPrem)+'');
         Open;
      end;

   SetDataSource;
   DrawGrid;
   GatherInfo;
end;

procedure TPremiaPayments.SpecialBeefPremium1Click(Sender: TObject);
begin
   ClearEdits;
   SucklerCowPremium1.Checked := False;
   SlaughterPremium1.Checked := False;
   SpecialBeefPremium1.Checked := True;

   lF.Caption := 'First Age';
   lS.Caption := 'Second Age';
   lB.Visible := True;
   DBEdit10.Visible := True;

   Prem := Beef;

   lFirst.Caption := 'First Age';
   lSecond.Caption := 'Second Age';

   lBull.Visible      := True;
   Edit9.Visible      := True;
   DBEdit10.Visible   := True;
   Edit14.Visible     := True;
   Edit15.Visible     := True;
   DBEdit11.Visible   := True;
   Edit3.Visible      := True;
   Edit12.Visible     := True;
   Edit11.Visible     := True;
   ApplicDate.Visible := True;

   with qPrevPayments do
      begin
         SQL.Clear;
         SQL.Add('Select * From PremiaPayments where PayType = '+IntToStr(BeefPrem)+'');
         Open;
      end;

   SetDataSource;
   DrawGrid;
   SetUpApplications;
end;

procedure TPremiaPayments.LoadSuckApplied;
var
   Proceed : Boolean;
begin
   Proceed :=  ((HerdCombo.Value <> '0') AND (ApplicDate.Value <> '0'));
   if NOT proceed then Exit;
   with GenQuery do
      begin
         Close;
         SQL.Clear;
         SQL.Add('Select Count (AnimalID) CID From SAppliedFor S');
         SQL.Add('Where S.ApplicationID = '+ApplicDate.Value+' ');
         Open;
         if RecordCount > 0 then
            PayRec.PaymentType.Suckler.CowHeif_Clm := GenQuery.FieldByName('CID').AsInteger;
         Edit7.Text := IntToStr(PayRec.PaymentType.Suckler.CowHeif_Clm);

         Close;
         SQL.Clear;
         SQL.Add('Select Count (AnimalID) CID From SAppliedFor S');
         SQL.Add('Where S.ApplicationID = '+ApplicDate.Value+' ');
         SQL.Add('AND LactNo = 0 ');
         Open;
         if RecordCount > 0 then
            PayRec.PaymentType.Suckler.HeifTopUp_Clm := GenQuery.FieldByName('CID').AsInteger;
         Edit8.Text := IntToStr(PayRec.PaymentType.Suckler.HeifTopUp_Clm);
      end;
end;

function TPremiaPayments.GetCurrYear: Integer;
var
   Y, M, D : Word;
begin
   Result := WinData.GetCurrentYear;
   if Prem  in ([Beef, Suck]) then
      if ((ApplicDate.Text <> 'Application Date') AND (ApplicDate.Text <> '')) then
         begin
            DecodeDate(StrToDate(ApplicDate.Text), Y, M, D);
            Result := Y;
         end;
end;

procedure TPremiaPayments.DBEdit6Change(Sender: TObject);
var
   c : Double;
begin
   if (Sender As TDBEdit).Field.IsNull then Exit;
   C := 0;
   with PayGrid do
      Case Prem of
         Beef : Case (Sender As TDBEdit).Tag of
                   4 : begin
                          C := StrToFloat(Edit1.Text)+StrToFloat(DBEdit6.Field.Text);
                          C := StrToFloat(Edit13.Text) - C;
                          Edit10.Text := FloatToStrF(c, ffCurrency, 16, 2);
                          Cells[3, 3] := (Sender As TDBEdit).Field.Text;
                       end;
                   5 : begin
                          C := StrToFloat(Edit2.Text)+StrToFloat(DBEdit8.Field.Text);
                          C := StrToFloat(Edit14.Text) - C;
                          Edit11.Text := FloatToStrF(c, ffCurrency,16, 2);
                          Cells[3, 4] := (Sender As TDBEdit).Field.Text;
                       end;
                   6 : begin
                          C := StrToFloat(Edit3.Text)+StrToFloat(DBEdit11.Field.Text);
                          C := StrToFloat(Edit15.Text) - C;
                          Edit12.Text := FloatToStrF(C, ffCurrency,16, 2);
                          Cells[3, 5] := (Sender As TDBEdit).Field.Text;
                       end;
                end;
         Suck : Case (Sender As TDBEdit).Tag of
                   4 : begin
                          C := StrToFloat(Edit1.Text) + StrToFloat(DBEdit6.Field.Text);
                          C := StrToFloat(Edit13.Text) - C;
                          Edit10.Text := FloatToStrF(c, ffCurrency,16, 2);
//                          Cells[3, 1] := (Sender As TDBEdit).Field.Text;
                       end;
                   5 : begin
                          C := StrToFloat(Edit2.Text) + StrToFloat(DBEdit8.Field.Text);
                          C := StrToFloat(Edit14.Text) - C;
                          Edit11.Text := FloatToStrF(c, ffCurrency,16, 2);
//                          Cells[3, 2] := (Sender As TDBEdit).Field.Text;
                       end;
                end;
        Slgth : Case (Sender As TDBEdit).Tag of
                   4 : begin
                          C := StrToFloat(Edit1.Text) + StrToFloat(DBEdit6.Field.Text);
                          C := StrToFloat(Edit13.Text) - C;
                          Edit10.Text := FloatToStrF(c, ffCurrency,16, 2);
//                          Cells[3, 7] := (Sender As TDBEdit).Field.Text;
                       end;
                   5 : begin
                          C := StrToFloat(Edit2.Text) + StrToFloat(DBEdit8.Field.Text);
                          C := StrToFloat(Edit14.Text) - C;
                          Edit11.Text := FloatToStrF(c, ffCurrency,16, 2);
//                          Cells[3, 8] := (Sender As TDBEdit).Field.Text;
                       end;
                end;
      end;
end;

function TPremiaPayments.GetNoOfSlghtAppliedFor: String;
begin
   Result := '0';
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT  Count(A.ID) CAID            ');
         SQL.Add('FROM Animals A                               ');
         SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)  ');
         SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)      ');
         SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID=S.EventID)  ');
         SQL.Add('WHERE (A.HerdID= "'+HerdCombo.Value+'")   ');
         SQL.Add('AND (A.DateOfBirth IS NOT NULL) ');
         SQL.Add('AND (A.AnimalDeleted=FALSE)     ');
         SQL.Add('AND (A.InHerd=False)            ');
         SQL.Add('AND (E.EventType = ' + IntToStr(CSaleDeathEvent) + ')');
         SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',SlghtYearStart) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',SlghtYearEnd) + '''' + ')');
         SQL.Add('AND (S.Slaughter = TRUE)');
         Open;
         PayRec.PaymentType.Slaughter.Slaught_Clm  := FieldByName('CAID').AsInteger;
         Result := IntToStr(FieldByName('CAID').AsInteger);
      end;
end;

function TPremiaPayments.GetNoOfSlghtHeifAppliedFor: String;
begin
   Result := '0';
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT  Count(A.ID) CAID            ');
         SQL.Add('FROM Animals A                               ');
         SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)  ');
         SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)      ');
         SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID=S.EventID)  ');
         SQL.Add('WHERE (A.HerdID= "'+HerdCombo.Value+'")   ');
         SQL.Add('AND (A.LactNo = 0) ');
         SQL.Add('AND (A.DateOfBirth IS NOT NULL) ');
         SQL.Add('AND (A.AnimalDeleted=FALSE)');
         SQL.Add('AND (A.InHerd=False)');
         SQL.Add('AND (E.EventType = ' + IntToStr(CSaleDeathEvent) + ')');
         SQL.Add('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',SlghtYearStart) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',SlghtYearEnd) + '''' + ')');
         SQL.Add('AND (S.Slaughter = TRUE)');
         Open;
         PayRec.PaymentType.Slaughter.HeifSlaught_Clm  := FieldByName('CAID').AsInteger;
         Result := IntToStr(FieldByName('CAID').AsInteger);
      end;
end;

function TPremiaPayments.GetYearEnd: TDateTime;
var
   Temp : String;
   Y, M, D : Word;
begin
   DecodeDate(Date, y, m, d);
   Temp := '31/12/' + IntToStr(Y);
   Result := StrToDate(Temp);
end;

function TPremiaPayments.GetYearStart: TDateTime;
var
   Temp : String;
   Y, M, D : Word;
begin
   DecodeDate(Date, y, m, d);
   Temp := '01/01/' + IntToStr(Y);
   Result := StrToDate(Temp);
end;

procedure TPremiaPayments.ClearEdits;
var
   i : SmallInt;
begin
    for i := 0 to gbApplied.ControlCount-1 do
       if (gbApplied.Controls[i] is TEdit) then
           (gbApplied.Controls[i] As TEdit).Text := '0';
end;

function TPremiaPayments.CurrYear: String;
var
   Y, M, D : Word;
begin
   DecodeDate(Date, y, m, d);
   Result := IntToStr(Y);
end;

procedure TPremiaPayments.PaymentTableAfterPost(DataSet: TDataSet);
begin
   DBISaveChanges(PaymentTable.Handle);
end;

procedure TPremiaPayments.ClearDetails;
var
   i : Integer;
begin
   for i := 0 to gbApplied.ControlCount-1 do
      if gbApplied.Controls[i] is TEdit then
         TEdit(gbApplied.Controls[i]).Text := '';
end;

end.
