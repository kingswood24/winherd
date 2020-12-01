(*
From 1999 on the WinData.Applications.FieldByName('ApplicationType').Value := 'A' to
show that the Application can contain 10/22 or Bull premiums.
It was previously F = 10 Month
                  S = 22 Month
                  B = Bull Premium
 _____________________________________________________________________________

  SP 14/10/2002:-

  Stocking Density

  procedure DoExtCalculations;

  Livestock Units worked out independably from uExtensification.
  Livestock Units for Animals applied and animals currently being applied.

  procedure CheckPremClaimLimits;

  Message content changed, to show how many animals to remove before
  proceeding with application.

  Rel 3.5 9.3

  SP 14/10/2002.
  _____________________________________________________________________________

  SP 21/10/2002 :-

  procedure DoExtCalculations :-
          Fix mis-calculation Inter Herd Tranfer Animals .

  SP 21/10/2002.
  _____________________________________________________________________________

  { SP 10/12/2002 }
  { Use Suckler quota for Livestock Units equivilent }


  { SP 10/12/2002. }

  *)
unit uApplications;

interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, ExtCtrls, Buttons, RxDBComb, Mask, ToolEdit,
  DBTables, Grids, DBGrids, RXDBCtrl, RXLookup, CurrEdit, Menus,
  RXCtrls, ToolWin, ComCtrls, GenTypesConst;

type
  TWhatToDo = (Query,NoQuery);
  TCalledFrom = (ApplyToDept, Report);
  TfApplications = class(TForm)

    qGetAnimals: TQuery;
    dsGetAnimals: TDataSource;
    pDoingSomething: TPanel;
    Label10: TLabel;
    DoingSomething: TProgressBar;
    pExtensification: TPanel;
    tExtDefaults: TTable;
    dsExtDefaults: TDataSource;
    GenQuery: TQuery;
    LUSetup: TBitBtn;
    mGridPop: TPopupMenu;
    NationalIDNumber1: TMenuItem;
    AnimalNumber1: TMenuItem;
    DateOfBirth1: TMenuItem;
    PremiumType1: TMenuItem;
    N1: TMenuItem;
    Ascending1: TMenuItem;
    Descending1: TMenuItem;
    AnimalGrid: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbSelect: TRxSpeedButton;
    sbExten: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbGridOptions: TRxSpeedButton;
    ToolButton8: TToolButton;
    Panel4: TPanel;
    Label5: TLabel;
    cbHerdID: TRxDBLookupCombo;
    TempEvents: TTable;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label25: TLabel;
    dbeQuota: TDBEdit;
    DBEdit2: TDBEdit;
    NoSucklerHeifers: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    dbeAvgGallons: TDBEdit;
    LUTotal: TCurrencyEdit;
    ThisApplicTotal: TCurrencyEdit;
    TotalSoFarThisYear: TCurrencyEdit;
    Label23: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    dbeHectares: TDBEdit;
    Less20: TCurrencyEdit;
    GridToolBar: TPanel;
    sbPreview: TRxSpeedButton;
    sbPrintApplic: TRxSpeedButton;
    sbRemove: TRxSpeedButton;
    sbSaveApplication: TRxSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    qNoMales: TQuery;
    ebNoApplic: TCurrencyEdit;
    Label9: TLabel;
    Panel1: TPanel;
    lNoThisYear: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ebBullPrem: TCurrencyEdit;
    ebSecondPrem: TCurrencyEdit;
    ebFirstPrem: TCurrencyEdit;
    lMaxApplics: TLabel;
    NoSucklers: TDBEdit;
    Label6: TLabel;
    dbeLUSucklerHeifers: TDBEdit;
    qHerdDefaults: TQuery;
    dsHerdDefaults: TDataSource;
    qNIPrem: TQuery;
    qUKIrishPrem: TQuery;
    Label1: TLabel;
    tExtDefaultsHerdId: TIntegerField;
    tExtDefaultsYearToRun: TIntegerField;
    tExtDefaultsDateTo: TDateField;
    tExtDefaultsFHect: TFloatField;
    tExtDefaultsLUExtPrem: TFloatField;
    tExtDefaultsLUBase: TFloatField;
    tExtDefaultsLUMin: TFloatField;
    tExtDefaultsExtAmt: TFloatField;
    tExtDefaultsPremAmt: TFloatField;
    tExtDefaultsMaxLUS: TFloatField;
    tExtDefaultsMilkQuota: TFloatField;
    tExtDefaultsPndsCow: TFloatField;
    tExtDefaultsNoCows: TIntegerField;
    tExtDefaultsPndsEwe: TFloatField;
    tExtDefaultsNoEwe: TIntegerField;
    tExtDefaultsPndsSuckler: TFloatField;
    tExtDefaultsNoSuckler: TIntegerField;
    tExtDefaultsLUS10Mth: TFloatField;
    tExtDefaultsLUSUnder24Mth: TFloatField;
    tExtDefaultsLUSOver24Mth: TFloatField;
    tExtDefaultsLUSCow: TFloatField;
    tExtDefaultsLUSEwe: TFloatField;
    tExtDefaultsLUSSuckler: TFloatField;
    tExtDefaultsTotalAmtCow: TFloatField;
    tExtDefaultsTotalAmtEwe: TFloatField;
    tExtDefaultsTotalAmtSuckler: TFloatField;
    tExtDefaultsseNo10Mth: TIntegerField;
    tExtDefaultsseNoUnder24Mth: TIntegerField;
    tExtDefaultsseNoOver24Mth: TIntegerField;
    tExtDefaultsse10MthLU: TFloatField;
    tExtDefaultsseUnder24MthLU: TFloatField;
    tExtDefaultsseOver24MthLU: TFloatField;
    tExtDefaultsneNo10Mth: TIntegerField;
    tExtDefaultsneNoUnder24Mth: TIntegerField;
    tExtDefaultsneNoOver24Mth: TIntegerField;
    tExtDefaultsne10MthLU: TFloatField;
    tExtDefaultsneUnder24MthLU: TFloatField;
    tExtDefaultsneOver24MthLU: TFloatField;
    tExtDefaultsTotalLUSStillElig: TFloatField;
    tExtDefaultsTotalLUSAppliedFor: TFloatField;
    tExtDefaultsTotalLUS: TFloatField;
    tExtDefaultsTotalLUSExceeding: TFloatField;
    tExtDefaultsNoSteersUnder24Mths: TFloatField;
    tExtDefaultsNoSteersOver24Mths: TFloatField;
    tExtDefaultsNoToDeduct10Mth: TIntegerField;
    tExtDefaultsNoToDeductUnder24Mth: TIntegerField;
    tExtDefaultsNoToDeductOver24Mth: TIntegerField;
    tExtDefaultsDeduct10MthLU: TFloatField;
    tExtDefaultsDeductUnder24MthLU: TFloatField;
    tExtDefaultsDeductOver24MthLU: TFloatField;
    tExtDefaultsTotalSBPExExten: TCurrencyField;
    tExtDefaultsTotalSBPInclExten: TCurrencyField;
    tExtDefaultsAvgGallons: TFloatField;
    tExtDefaultsSucklerQuota: TIntegerField;
    tExtDefaultsNoSucklerHeifers: TIntegerField;
    tExtDefaultsLUSSucklerHeifers: TFloatField;
    tExtDefaultsExtDate1: TDateField;
    tExtDefaultsExtDate2: TDateField;
    tExtDefaultsExtDate3: TDateField;
    tExtDefaultsExtDate4: TDateField;
    tExtDefaultsForageAreaHa: TFloatField;
    tExtDefaultsNumEwes: TIntegerField;
    tExtDefaultsExtDate5: TDateField;
    tExtDefaultsExtDate6: TDateField;
    pApps: TPanel;
    lEligRetentionDate: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    EligDate: TDateEdit;
    RetentionDate: TEdit;
    ApplicDate: TDateEdit;
    gSortBy: TRadioGroup;
    gOrderBy: TRadioGroup;
    pNIrish: TPanel;
    rgPremType: TRadioGroup;
    gbColours: TGroupBox;
    l10MonthT: TLabel;
    l22MonthT: TLabel;
    lBullT: TLabel;
    l10Month: TLabel;
    l22Month: TLabel;
    lBull: TLabel;
    e10Month: TEdit;
    e22Month: TEdit;
    eBull: TEdit;
    TotalAnimals: TEdit;
    procedure bExitClick(Sender: TObject);
    procedure bSelectAnimalsClick(Sender: TObject);
    procedure ApplicDateExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bRemoveAnimalClick(Sender: TObject);
    procedure bPrintApplic1Click(Sender: TObject);
    procedure AnimalGridGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure EligDateExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbSaveApplicationClick(Sender: TObject);
    procedure gOrderByClick(Sender: TObject);
    procedure cbHerdIDChange(Sender: TObject);
    procedure bShowExtClick(Sender: TObject);
    procedure LUSetupClick(Sender: TObject);
    procedure dbeQuotaExit(Sender: TObject);
    procedure dbeAvgGallonsEnter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure NoSucklerHeifersExit(Sender: TObject);
    procedure EligDateChange(Sender: TObject);
    procedure dbeHectaresExit(Sender: TObject);
    procedure NationalIDNumber1Click(Sender: TObject);
    procedure AnimalNumber1Click(Sender: TObject);
    procedure DateOfBirth1Click(Sender: TObject);
    procedure PremiumType1Click(Sender: TObject);
    procedure Ascending1Click(Sender: TObject);
    procedure Descending1Click(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NoSucklersExit(Sender: TObject);
    procedure ebFirstPremChange(Sender: TObject);
    procedure ebNoApplicChange(Sender: TObject);
    procedure rgPremTypeClick(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
  private
    { private declarations }
    cYear, cMonth, cDay : Word;

    TotalLUThisApplic,
    TotalLUThisYear     : Double;
    LUSCows,
    LUSSuckler,
    LUSUnder24,
    LUSOver24,
    LUS10,
    LUSEwes,
    LUBullOver24 : Double;
    Total10Months,
    Total22Months,
    TotalBull    : Integer;
    Month10Col,
    Month22Col,
    BullCol     : TColor;
    ViewIt      : Boolean;
    HerdRestricted : Boolean;
    SuckApplicMade : Boolean; // If false keep Cow/Heifer Figures at 0!
    procedure CalcRetention( WhatToDo : TWhatToDo );
    procedure HideShowGrid(HideOrShow : Char);
    procedure BlankReport;
    procedure BuildPages;
    procedure BuildLine(MyDataSet : TQuery; LineCount : Word; FirstPage : Boolean );
    procedure DoExtCalculations;
    procedure SetLUValues;
    procedure CalcLUS;
    procedure EraseTable;
    procedure GetAnimalCounts(MyTable : TTable);
    function  GetNoOfFirstPremAppliedFor : Integer;
    function  GetNoOfSecondPremAppliedFor : Integer;
    function  GetNoOfBullPremAppliedFor : Integer;
    function  GetNoOfSucklerAvailable : Integer;
    function  GetNoOfApplicsThisYear : Integer;
    function  NINatID(NatIDNum: string; StartPos: integer): String;
    procedure GetNosAppliedForThisYear;
    function  CheckEligDate : Boolean;
    procedure CheckPremClaimLimits;
    procedure SetPanel;
    procedure SetUpNIPages;
    function StripSpaces(str : String) : String;
    Procedure GetNIAppsThisYear;
    procedure SetNIDataSet(SetActive : Boolean);
    function StripPunctuation(StrToStrip: String ): String;
    function PadRight(Str : String; Len : Integer) : String;
    function NumSuckApplied(var Cows, Heifers : Integer) : Boolean;
    procedure CheckSucklerNos;
    procedure ResetSucklerNos(ShowMess : Boolean);
    procedure CheckForageHectares;
    procedure LoadSuckQuotaNos;
    procedure ValidateQuotaEdit;
  public
    { public declarations }
    PremSource  : TDataSource;
    PremTable   : TTable;
    SavedApplication : Boolean;
    PageCount : Integer;
    property NoOfFirstPremAppliedFor : Integer read GetNoOfFirstPremAppliedFor;
    property NoOfSecondPremAppliedFor : Integer read GetNoOfSecondPremAppliedFor;
    property NoOfBullPremAppliedFor : Integer read GetNoOfBullPremAppliedFor;
    property NoOfApplicsThisYear : Integer read GetNoOfApplicsThisYear;
    property NoOfSucklerAvailable : Integer read GetNoOfSucklerAvailable;
    // This will fill the PremTable - Createed by CreatePremTable with the relevant animals
    procedure RunApplicQuery(MyTable : TTable; GenQuery : TQuery; EligDate : TDateTime; HerdID : String; CalledFrom : TCalledFrom; ToBeAppliedFor : Boolean );

  end;

  procedure ShowTheForm(Country : TCountry; ShowStkDen : Boolean);

var
  fApplications: TfApplications;

implementation
uses
    DairyData,
    Dialogs,
    uExtDefaults,
    uExtensification,
    uSB2001,
    BDE,
    uRemarks,
    Printers,
    Def,
    uNIPremApplics;

const
    cGallsPerCow  = 876;
    cLitresPerCow = 5730;
//    cThisYear     = 2003;
    cThisYear     = 2004;

var
    WhichReg : TCountry;
    EndPos   : Integer;
    TotalSuckCows,
    TotalSuckHeifers,
    TotalSuckAnimals : Integer;

{$R *.DFM}

    procedure ShowTheForm(Country : TCountry; ShowStkDen : Boolean);
    var
       Sender : TObject;
    begin
       with fApplications do
          try
             try
                if fApplications = nil then
                   Application.CreateForm(TfApplications, fApplications);
             except
                MessageDlg('Cannot create form, close program and reboot',mtError,[mbOK],0);
             end;
{             try
                tExtDefaults.Open;

             except
                // Index needs  building
                tExtDefaults.Close;
                try
                   SysUtils.DeleteFile(WinData.KingData.Directory + 'ext001.px');
                except
                   //
                end;
                tExtDefaults.AddIndex('','HerdID',[ixUnique,ixPrimary]);
                tExtDefaults.Open;
             end;
}
             WhichReg := Country;
             PremSource := TDataSource.Create(nil);
             PremTable := TTable.Create(nil);
             SetPanel; // Set the Main Panel

             Case Country of
                Ireland  : with PremTable do
                              begin
                                 TableType := ttParadox;
                                 TableName := 'TempPrm';
                                 DatabaseName := WinData.KingData.DatabaseName;
                                 FieldDefs.Clear;
                                 FieldDefs.Add('AID',ftInteger,0,False);           // Animal ID
                                 FieldDefs.Add('PremiumType',ftString,1,False);    // Event ID
                                 FieldDefs.Add('AnimalCode',ftString,20,False);    // Animal Code
                                 FieldDefs.Add('SortAnimalNo',ftString,20,False);  // Animal Code
                                 FieldDefs.Add('NatID',ftString,20,False);         // Natid of the Animal
                                 FieldDefs.Add('SortNatID',ftString,20,False);     // Natid of the Animal
                                 FieldDefs.Add('Colour',ftString,30,False);        // SP 24/10/00 Added for NI Prems
                                 FieldDefs.Add('DOB',ftDate,0,False);              // Date of Birth of the Animal
                                 FieldDefs.Add('Sex',ftString,10,False);
                                 FieldDefs.Add('Herd',ftString,15,False);
                                 FieldDefs.Add('TestEligDate',ftDate,0,False);
                                 FieldDefs.Add('EventID',ftInteger,0,False);       // Event ID
                                 FieldDefs.Add('PremiumName',ftString,20,False);
                                 FieldDefs.Add('Printed',ftBoolean,0,False);

                                 // Set the HerdID Combo, only look for Irish Herds
                                 with qHerdDefaults do
                                    begin
                                       SQL.Clear;
                                       SQL.Text := 'Select * From Owners Where Country = 1 AND (( usercandelete = true ) OR ( UserCanDelete IS NULL ))';
                                       Open;
                                    end;

                              end;
                NIreland  : with PremTable do
                               begin
                                  TableType := ttParadox;
                                  TableName := 'TempPrm';
                                  DatabaseName := WinData.KingData.DatabaseName;
                                  FieldDefs.Clear;
                                  FieldDefs.Add('AID',ftInteger,0,False);           // Animal ID
                                  FieldDefs.Add('PremiumType',ftString,1,False);    // Event ID
                                  FieldDefs.Add('AnimalCode',ftString,20,False);    // Animal Code
                                  FieldDefs.Add('SortAnimalNo',ftString,20,False);  // Animal Code
                                  FieldDefs.Add('NatID',ftString,20,False);         // Natid of the Animal
                                  FieldDefs.Add('SortNatID',ftString,20,False);     // Natid of the Animal
                                  FieldDefs.Add('DOB',ftDate,0,False);              // Date of Birth of the Animal
                                  FieldDefs.Add('Sex',ftString,10,False);
                                  FieldDefs.Add('Herd',ftString,15,False);
                                  FieldDefs.Add('TestEligDate',ftDate,0,False);
                                  FieldDefs.Add('EventID',ftInteger,0,False);       // Event ID
                                  FieldDefs.Add('PremiumName',ftString,20,False);
                                  FieldDefs.Add('Name',FtString,20,False);
                                  FieldDefs.Add('Printed',ftBoolean,0,False);
                                  FieldDefs.Add('NITag',ftBoolean,0,False);
                                  FieldDefs.Add('F1',FtString,1,False);
                                  FieldDefs.Add('F2',FtString,1,False);
                                  FieldDefs.Add('F3',FtString,1,False);
                                  FieldDefs.Add('F4',FtString,1,False);
                                  FieldDefs.Add('F5',FtString,1,False);
                                  FieldDefs.Add('F6',FtString,1,False);
                                  FieldDefs.Add('F7',FtString,1,False);
                                  FieldDefs.Add('F8',FtString,1,False);
                                  FieldDefs.Add('F9',FtString,1,False);
                                  FieldDefs.Add('F10',FtString,1,False);
                                  FieldDefs.Add('F11',FtString,1,False);
                                  FieldDefs.Add('F12',FtString,1,False);
                                  FieldDefs.Add('F13',FtString,1,False);
                                  FieldDefs.Add('F14',FtString,1,False);

                                  // Set the HerdID Combo, only look for Irish Herds
                                  with qHerdDefaults do
                                     begin
                                        SQL.Clear;
                                        SQL.Text := 'Select * From Owners Where Country <> 1 AND (( usercandelete = true ) OR ( UserCanDelete IS NULL ))';
                                        Open;
                                     end;

                               end;

             end;

             PageCount := 1; // ini pagecount

             with PremTable do
                begin
                   // Indexes
                   IndexDefs.Clear;
                   IndexDefs.Add('','AID;PremiumType',[ixPrimary,ixUnique]);
                   IndexDefs.Add('iNatID','NatID',[ixCaseInSensitive]);
                   IndexDefs.Add('iAnimalCode','AnimalCode',[ixCaseInSensitive]);
                   IndexDefs.Add('iStAnimalNo','SortAnimalNo',[ixCaseInSensitive]);
                   IndexDefs.Add('iStNatID','SortNatID',[ixCaseInSensitive]);
                   IndexDefs.Add('iDOB','DOB',[ixCaseInSensitive]);
                   IndexDefs.Add('iPremType','PremiumType',[ixCaseInSensitive]);
                   //Descending Indexes
                   IndexDefs.Add('iNatIDd','NatID',[ixCaseInSensitive,ixDescending]);
                   IndexDefs.Add('iAnimalCoded','AnimalCode',[ixCaseInSensitive,ixDescending]);
                   IndexDefs.Add('iStAnimalNod','SortAnimalNo',[ixCaseInSensitive,ixDescending]);
                   IndexDefs.Add('iStNatIDd','SortNatID',[ixCaseInSensitive,ixDescending]);
                   IndexDefs.Add('iDOBd','DOB',[ixCaseInSensitive,ixDescending]);
                   IndexDefs.Add('iPremTyped','PremiumType',[ixCaseInSensitive,ixDescending]);

                   CreateTable;
                   IndexName := 'iStNatID';
                   Open;

                   PremSource.DataSet := PremTable;
                end;

                try
                   // Set the Default Herd ID
                   cbHerdID.Value := IntToStr(WinData.UserDefaultHerdID);
                except
                   MessageDlg('Unable to locate herd',mtError,[mbOK],0);
                   SysUtils.Abort;
                end;

                if cbHerdID.Value <> '0' then
                   try
                      tExtDefaults.Open;
                      tExtDefaults.Locate('HerdID', StrToInt(cbHerdID.Value), [loCaseInsensitive]);
                   except
                   end;
//                CheckSucklerNos;

                SavedApplication := True;
                HideShowGrid('H');
                sbSaveApplication.Enabled := false;

                Month10Col := clGreen;
                Month22Col := clBlue;
                BullCol := clFuchsia;

                l10Month.Color := Month10Col;
                l22Month.Color := Month22Col;
                lBull.Color := BullCol;
                pDoingSomething.Hide;

                SetLUValues;

                pExtensification.Hide;
                pExtensification.Align := alTop;

                if ShowStkDen then
                   begin
                      pExtensification.Show;
                      pApps.Hide;
                      sbExten.Down := True;
                      FormShow(nil);
                      bShowExtClick(Sender);
                   end;

             ShowModal;
       finally
          try
             tExtDefaults.Close;
             PremTable.Close;
             fApplications.PremTable.DeleteTable;
             fApplications.PremTable.Free;
             fApplications.PremSource.Free;
             fApplications.Free;
             fApplications := nil;
          except
             MessageDlg('An unexpected error occured, close program and reboot',mtError,[mbok],0);
          end;
       end;

end;

procedure TfApplications.ResetSucklerNos(ShowMess : Boolean);
var
   Sender : TDBEdit;
begin
   if ShowMess then
      begin
         MessageDlg('No. of cows and/or heifers entered do not tally with nos. on Suckler Premium Application.'+#13+
                    'Ensure total no. of animals is the same in both and that no. of cows + heifers (> 24) is >= no. of cows.',mtInformation,[mbOK],0);
      end;

   if tExtDefaults.Locate('HerdID', StrToInt(cbHerdID.Value), [loCaseInsensitive]) then
      begin
         tExtDefaults.Edit;
         tExtDefaults.FieldByName('NoSuckler').AsInteger        := TotalSuckAnimals;
         tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger := 0;
         tExtDefaults.Post;
      end;
   CalcLUS;
end;

function TfApplications.GetNoOfSucklerAvailable : Integer;
var
    Amt20Perc   : Integer;
    TotalAvailable : Integer;
    TestDate : TDateTime;
begin

    RESULT := 0;
    TotalAvailable := 0;
    Amt20Perc := 0;
    if NOT ( tExtDefaults.State in dsEditModes ) then
       tExtDefaults.Edit;

    TestDate := EligDate.Date;
    IncMonth(TestDate,-8);

    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(A.ID) CountAvailable FROM Animals A, Events E, Breeds B');
           SQL.Add('WHERE (A.ID=E.AnimalID)');
           SQL.Add('AND   (A.LactNo=E.AnimalLactNo)');
           SQL.Add('AND   (A.LactNo>0)');
           SQL.Add('AND   (E.EventType=' + IntToStr(cCalvingEvent) + ')');
           SQL.Add('AND   (A.InHerd=TRUE)');
           SQL.Add('AND   (A.AnimalDeleted=FALSE)');
           SQL.Add('AND   (A.Sex="Female")');
           SQL.Add('AND   (A.PrimaryBreed=B.ID)');
           SQL.Add('AND   (B.EligibleForPremium=TRUE)');
           Open;
           if NOT IsEmpty then
              begin
                 TotalAvailable := FieldByName('CountAvailable').AsInteger;
                 Amt20Perc := Trunc(TotalAvailable * 0.2);
              end;
       end;

    if (TotalAvailable < tExtDefaults.FieldByName('SucklerQuota').AsInteger ) then
       with GenQuery do
          begin
             SQL.Clear;
             SQL.Add('SELECT COUNT(A.ID) CountAvailable FROM Animals A, Breeds B');
             SQL.Add('WHERE (A.InHerd=TRUE)');
             SQL.Add('AND   (A.AnimalDeleted=FALSE)');
             SQL.Add('AND   (A.Sex="Female")');
             SQL.Add('AND   (A.PrimaryBreed=B.ID)');
             SQL.Add('AND   (B.EligibleForPremium=TRUE)');
             SQL.Add('AND   (A.DateOfBirth<"' + FormatDateTime('mm/dd/yyyy',TestDate) + '")');
             Open;
             if NOT IsEmpty then
                if FieldByName('CountAvailable').AsInteger <= Amt20Perc then
                  TotalAvailable := TotalAvailable + FieldByName('CountAvailable').AsInteger
                else
                  TotalAvailable := TotalAvailable + Amt20Perc;
         end;

    // if you're over Quota then reset to the Quota
    if TotalAvailable > tExtDefaults.FieldByName('SucklerQuota').AsInteger then
       TotalAvailable := tExtDefaults.FieldByName('SucklerQuota').AsInteger;

    RESULT := TotalAvailable;

end;


function TfApplications.GetNoOfFirstPremAppliedFor : Integer;
begin
    RESULT := 0;

    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(EventID) CountForApplic FROM ' + WinData.BeefSubsidy.TableName + ' B, ');
           SQL.Add('Applications A');
           SQL.Add('WHERE (PremiumType="F")');
           If (cbHerdID.Text <> 'All Herds' ) then             //SP
             SQL.Add(' AND (A.HerdID = "' + cbHerdID.Value + '")'); //SP
           SQL.Add('AND (A.ApplicationID=B.ApplicationID)');
           SQL.Add('AND ( EXTRACT(YEAR FROM ApplicationDate)=' + IntToStr(cYear) + ')');
           SQL.Add('AND (ApplicationID <> -1)');
           Open;
           if NOT IsEmpty then
              RESULT := FieldByName('CountForApplic').AsInteger;
       end;
end;

function TfApplications.GetNoOfSecondPremAppliedFor : Integer;
begin
    RESULT := 0;
    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(EventID) CountForApplic FROM ' + WinData.BeefSubsidy.TableName + ' B, ');
           SQL.Add('Applications A');
           SQL.Add('WHERE (PremiumType="S")');
          If (cbHerdID.Text <> 'All Herds' ) then             //SP
             SQL.Add(' AND (A.HerdID = "' + cbHerdID.Value + '")'); //SP
           SQL.Add('AND (A.ApplicationID=B.ApplicationID)');
           SQL.Add('AND ( EXTRACT(YEAR FROM ApplicationDate)=' + IntToStr(cYear) + ')');
           SQL.Add('AND (ApplicationID <> -1)');
           Open;
           if NOT IsEmpty then
              RESULT := FieldByName('CountForApplic').AsInteger;
       end;
end;

function TfApplications.GetNoOfBullPremAppliedFor : Integer;
begin
    RESULT := 0;
    with GenQuery do
       begin
           SQL.Clear;
           SQL.Add('SELECT COUNT(EventID) CountForApplic FROM ' + WinData.BeefSubsidy.TableName + ' B, ');
           SQL.Add('Applications A');
           SQL.Add('WHERE (PremiumType="B")');
          If (cbHerdID.Text <> 'All Herds' ) then             //SP
             SQL.Add(' AND (A.HerdID = "' + cbHerdID.Value + '")'); //SP
           SQL.Add('AND (A.ApplicationID=B.ApplicationID)');
           SQL.Add('AND ( EXTRACT(YEAR FROM ApplicationDate)=' + IntToStr(cYear) + ')');
           SQL.Add('AND (ApplicationID <> -1)');
           Open;
           if NOT IsEmpty then
              RESULT := FieldByName('CountForApplic').AsInteger;
       end;
end;

function TfApplications.GetNoOfApplicsThisYear : Integer;
begin
    RESULT := 0;
    lNoThisYear.Caption := 'No. Animals Applied for in ' + IntToStr(cYear);

    with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('SELECT COUNT(ApplicationID) CountOfApplic FROM ' + WinData.Applications.TableName + ' A');
          SQL.Add('WHERE (EXTRACT(YEAR FROM A."Date")=' + IntToStr(cYear) + ')');
          If (cbHerdID.Text <> 'All Herds' ) then                            //KVB
             SQL.Add(' AND (A.HerdID = "' + cbHerdID.Value + '")');            //KVB
          Open;
          if NOT IsEmpty then
             RESULT := FieldByName('CountOfApplic').AsInteger;
       end;
end;

procedure TfApplications.bExitClick(Sender: TObject);
begin
    Close;
end;

procedure TfApplications.CalcRetention( WhatToDo : TWhatToDo );
begin
   if WhichReg = Ireland then
      RetentionDate.Text := FormatDateTime('dd/mm/yyyy',WinData.GetRetensionDate(ApplicDate.Date, WinData.PremiumType))
   else
      RetentionDate.Text := FormatDateTime('dd/mm/yyyy',WinData.GetRetensionDate(EligDate.Date, WinData.PremiumType));
   // Run the Query and Show the Results
   if ( WhatToDo = Query ) then
      RunApplicQuery ( PremTable, qGetAnimals, EligDate.Date, cbHerdID.Value, ApplyToDept, TRUE );
end;

procedure TfApplications.HideShowGrid(HideOrShow : Char);
begin
     if HideOrShow = 'H' then
        begin
             GridToolBar.Hide;
             AnimalGrid.Hide;
             sbGridOptions.Enabled   := False;
        end
     else
        begin
           AnimalGrid.Show;
           GridToolBar.Show;
           sbGridOptions.Enabled     := True;
           NationalIDNumber1.Checked := True;
           Ascending1.Checked        := True;
        end;
end;

// Seperates the NI Tag Number
function TfApplications.NINatID(NatIDNum: string; StartPos: integer): String;
var
   i : integer;
begin
   RESULT := NatIDNum;
      for i := (StartPos+1) to Length(NatIDNum) do
         begin
            if ((copy(NatIDNum,i,1) = '/') or (copy(NatIDNum,i,1) = '-') or (copy(NatIDNum,i,1) = ' ')) then
               begin
                    RESULT := Copy(NatIDNum,(StartPos+1),((i-1)-StartPos));
	            EndPos := i;
                    exit;
               end;
            if  i = Length(NatIDNum) then
                RESULT := Copy(NatIDNum,(StartPos+1),(i-StartPos));
         end;  //EndFor
end;

procedure TfApplications.RunApplicQuery(MyTable : TTable; GenQuery : TQuery; EligDate : TDateTime; HerdID : String; CalledFrom : TCalledFrom; ToBeAppliedFor : Boolean );

   function ValidateTag(Tag: String): String;
   const
      DoubleSpace = '  ';
      DoubleHyphen = '--';
      DoubleFSlash = '//';
      DoubleBSlash = '\\';
   var
      OrigTag : String;
   begin
      OrigTag := Tag;
      try

         while Pos(DoubleSpace, Tag) > 0 do
            Delete(Tag, Pos(DoubleSpace, Tag), 1);

         while Pos(DoubleHyphen, Tag) > 0 do
            Delete(Tag, Pos(DoubleHyphen, Tag), 1);

         while Pos(DoubleFSlash, Tag) > 0 do
            Delete(Tag, Pos(DoubleFSlash, Tag), 1);

         while Pos(DoubleBSlash, Tag) > 0 do
            Delete(Tag, Pos(DoubleBSlash, Tag), 1);
         Result := Tag;
      except
         Result := OrigTag;
      end;
   end;

const
   j = 5;
Var
   ValidRecord : Boolean;
   CutOffmonths : Integer;
   s, CC, AHN, CKD, BN, NatIDNum, Str : String;
   i : Integer;
begin
     if CalledFrom = ApplyToDept then
        begin
           pDoingSomething.BringToFront;
           pDoingSomething.Parent := Screen.ActiveForm;
           pDoingSomething.Align := AlBottom;
           pDoingSomething.Show;
           pDoingSomething.ReFresh;
           DoingSomething.Step := 0;
           Total10Months := 0;
           Total22Months := 0;
           TotalBull     := 0;
        end;

     //Copy the Data From the SQL Into the Table
     MyTable.DisableControls;
     //PremTable.DisableControls;

     MyTable.Close;
     //PremTable.Close;

     GenQuery.SQL.Clear;
     GenQuery.SQL.Add('DELETE FROM ' + MyTable.TableName );
     GenQuery.ExecSQL;

     GenQuery.SQL.Clear;

     GenQuery.SQL.Add('INSERT INTO ' + MyTable.TableName + ' ( AID, ANIMALCODE,');
     GenQuery.SQL.Add('       SortAnimalNo, NATID, SortNatID, DOB, Sex, HERD,');
     GenQuery.SQL.Add('       TESTELIGDATE, EventId, PremiumType)');
     GenQuery.SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
     GenQuery.SQL.Add('       A.DateOfBirth, A.Sex, O.HerdIdentity, B.EligibilityDate,');
     GenQuery.SQL.Add('       B.EventID, B.PremiumType');
     GenQuery.SQL.Add('FROM Animals A, BeefSub B, Owners O');
     GenQuery.SQL.Add('WHERE (A.ID=B.AnimalId)');
     if WhichReg = NIreland then
        begin
           if rgPremType.ItemIndex = 1 then
              GenQuery.SQL.Add('AND (B.PremiumType="F")');
           if rgPremType.ItemIndex = 2 then
              GenQuery.SQL.Add('AND (B.PremiumType="S")');
           if rgPremType.ItemIndex = 3 then
              GenQuery.SQL.Add('AND (B.PremiumType="B")');
        end;
     GenQuery.SQL.Add('AND (A.HerdID=O.ID)');
     GenQuery.SQL.Add('AND (A.AnimalDeleted=FALSE)');
     GenQuery.SQL.Add('AND (A.InHerd=TRUE)');    // Make sure its not sold/Dead
     if Length(HerdID) > 0 then
        if HerdID <> '0' then
           GenQuery.SQL.Add('AND (A.HerdID= ' + HerdID + ')');
     GenQuery.SQL.Add('AND (B.EligibilityDate <= ' + '''' + FormatDateTime('mm/dd/yyyy',EligDate) + '''' +')');
     if CalledFrom = ApplyToDept then
        GenQuery.SQL.Add('AND (B.ApplicationID = -1)')
     else if ToBeAppliedFor then
        GenQuery.SQL.Add('AND (B.ApplicationID = -1)');

     GenQuery.Prepare;
     GenQuery.ExecSQL;

     MyTable.Open;

     with MyTable do
        begin
           First;
           while NOT EOF do
              begin
                 Edit;
                 // loop thro' table to break up NI NatID
                 if WhichReg = NIreland then
                    begin
                       NatIDNum := '';
                       if NOT(WinData.WhatStyleNatID(MyTable.FieldByName('NatID').AsString, True ) IN ([Style1999,Style1996,StylePre1996])) then
                          begin
                             EndPos := 0;
                             CC     := '';
                             AHN    := '';
                             BN     := '';
                             CKD    := '';
                             S := ValidateTag(MyTable.FieldByName('NatID').AsString);

                             if (Pos('UK 9', s) > 0) then
                                begin
                                   System.Delete(s, 3, 1);
                                   MyTable.FieldByName('NatID').AsString := s;
                                end;

                             if ((Pos('UK', s) > 0) OR (Pos('NO', s) > 0)) then
                                CC  := NINatID(s,EndPos); // Country Code
                             AHN    := NINatID(s,EndPos); // Animal Herd No 3 up to 6
                             BN     := NINatID(s,EndPos); // Check Digit
                             if Length(BN) > 4 then
                                begin
                                   CKD := BN[5];
                                   BN  := Copy(BN, 1, 4); // Just get 4 chars for bar no!!
                                end
                             else
                                CKD    := NINatID(s,EndPos); // Bar No

                             // Check Digit 1 char
                             if CKD <> '' then
                                MyTable.FieldByName('F14').AsString := CKD;

                             if BN <> '' then
                                begin
                                   // BarNo 4 chars
                                   for i := 1 to Length(BN) do
                                      case i of
                                         1 : MyTable.FieldByName('F10').AsString := BN[1];
                                         2 : MyTable.FieldByName('F11').AsString := BN[2];
                                         3 : MyTable.FieldByName('F12').AsString := BN[3];
                                         4 : MyTable.FieldByName('F13').AsString := BN[4];
                                      end;
                                end;

                             if AHN <> '' then
                                begin
                                   // Animal Herd No 3-6 Chars
                                   for i := 1 to Length(AHN) do
                                      case i of
                                         1 : MyTable.FieldByName('F4').AsString  := AHN[1];
                                         2 : MyTable.FieldByName('F5').AsString  := AHN[2];
                                         3 : MyTable.FieldByName('F6').AsString  := AHN[3];
                                         4 : MyTable.FieldByName('F7').AsString  := AHN[4];
                                         5 : MyTable.FieldByName('F8').AsString  := AHN[5];
                                         6 : MyTable.FieldByName('F9').AsString  := AHN[6];
                                      end;
                                end;

                             if CC <> '' then
                                begin
                                   // Country Code if Any
                                   for i := 1 to Length(CC) do
                                      case i of
                                         1 : MyTable.FieldByName('F1').AsString  := CC[1];
                                         2 : MyTable.FieldByName('F2').AsString  := CC[2];
                                         3 : MyTable.FieldByName('F3').AsString  := CC[3];
                                      end;
                                end;

                             if ((Pos('UK9', s) > 0) OR (CC= '')) then
                                MyTable.FieldByName('NITag').AsBoolean := True
                             else
                                begin
                                   MyTable.FieldByName('NITag').AsBoolean := False;
                                   s := StripPunctuation(MyTable.FieldByName('NatID').AsString);
                                   s := PadRight(s, 14);
                                   for i := 1 to Length(s) do
                                      case i of
                                         1  : MyTable.FieldByName('F1').AsString  := s[i];
                                         2  : MyTable.FieldByName('F2').AsString  := s[i];
                                         3  : MyTable.FieldByName('F3').AsString  := s[i];
                                         4  : MyTable.FieldByName('F4').AsString  := s[i];
                                         5  : MyTable.FieldByName('F5').AsString  := s[i];
                                         6  : MyTable.FieldByName('F6').AsString  := s[i];
                                         7  : MyTable.FieldByName('F7').AsString  := s[i];
                                         8  : MyTable.FieldByName('F8').AsString  := s[i];
                                         9  : MyTable.FieldByName('F9').AsString  := s[i];
                                         10 : MyTable.FieldByName('F10').AsString := s[i];
                                         11 : MyTable.FieldByName('F11').AsString := s[i];
                                         12 : MyTable.FieldByName('F12').AsString := s[i];
                                         13 : MyTable.FieldByName('F13').AsString := s[i];
                                         14 : MyTable.FieldByName('F14').AsString := s[i];
                                      end;
                                end;
                          end
                       else
                          begin
                             if (WinData.WhatStyleNatID(MyTable.FieldByName('NatID').AsString, True ) = Style1999) then
                                begin
                                   NatIDNum := WinData.StripAllNomNumAlpha(MyTable.FieldByName('NatID').AsString);
                                   for i := 1 to Length(NatIDNum) do
                                      case i of
                                         1  : MyTable.FieldByName('F1').AsString  := NatIDNum[i];
                                         2  : MyTable.FieldByName('F2').AsString  := NatIDNum[i];
                                         3  : MyTable.FieldByName('F3').AsString  := NatIDNum[i];
                                         4  : MyTable.FieldByName('F4').AsString  := NatIDNum[i];
                                         5  : MyTable.FieldByName('F5').AsString  := NatIDNum[i];
                                         6  : MyTable.FieldByName('F6').AsString  := NatIDNum[i];
                                         7  : MyTable.FieldByName('F7').AsString  := NatIDNum[i];
                                         8  : MyTable.FieldByName('F8').AsString  := NatIDNum[i];
                                         9  : MyTable.FieldByName('F9').AsString  := NatIDNum[i];
                                         10 : MyTable.FieldByName('F10').AsString := NatIDNum[i];
                                         11 : MyTable.FieldByName('F11').AsString := NatIDNum[i];
                                         12 : MyTable.FieldByName('F12').AsString := NatIDNum[i];
                                         13 : MyTable.FieldByName('F13').AsString := NatIDNum[i];
                                         14 : MyTable.FieldByName('F14').AsString := NatIDNum[i];
                                      end;
                                   MyTable.FieldByName('NITag').AsBoolean := False;
                                end;
                          end;
                    end;

                 if ( FieldByName('PremiumType').AsString = 'S' ) then
                    begin
                       FieldByName('PremiumName').AsString := 'Second Age';
                       CutOffMonths := 0;
                    end
                 else if ( FieldByName('PremiumType').AsString = 'F' ) then
                    begin
                       CutOffMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,C,F);
                       FieldByName('PremiumName').AsString := 'First Age';
                    end
                 else if ( FieldByName('PremiumType').AsString = 'B' ) then
                    begin
                       CutOffMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,C,B);
                       FieldByName('PremiumName').AsString := 'Bull';
                    end
                 else
                    CutOffMonths := 0;
                 Post;

                 // Check the SEX and the Premium type match
                 ValidRecord := (( FieldByName('PremiumType').AsString = 'S' ) and
                                 ( UpperCase(FieldByName('Sex').AsString) = 'STEER' )) Or
                                (( FieldByName('PremiumType').AsString = 'B' ) and
                                 ( UpperCase(FieldByName('Sex').AsString) = 'BULL' )) Or
                                (( FieldByName('PremiumType').AsString = 'F' ) and
                                 ( UpperCase(FieldByName('Sex').AsString) = 'STEER' ));

                 if ValidRecord then  // check the Elig date is before Sale/Death Date
                    ValidRecord := NOT ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([FieldByName('AID').Value,CSaleDeathEvent]),[] ));

                 if (( FieldByName('PremiumType').AsString = 'S' ) and (ValidRecord )) or
                    // Bull Premium has no upper limit from 2000 on
                    (( FieldByName('PremiumType').AsString = 'B' ) and (ValidRecord )) then
                    Next
                 else if ( EligDate > ( IncMonth( FieldByName('DOB').AsDateTime, CutOffMonths)-1) ) and
                          ValidRecord then
                    Delete   // Delete Set the NEXT Record
                 else if NOT ValidRecord then
                    Delete
                 else
                    Next;
                 if CalledFrom = ApplyToDept then
                    DoingSomething.Position := PremTable.RecNo;
              end;
              if CalledFrom = ApplyToDept then
                 DoingSomething.Position := 100;
        end;

     if CalledFrom = ApplytoDept then
        begin
           AnimalGrid.DataSource := PremSource;
           GetAnimalCounts(MyTable);
        end;

     MyTable.First;
     MyTable.EnableControls;

     if CalledFrom = ApplyToDept then
        begin

 {          if ( WhichReg = NIreland ) then
              begin



              end
           else }if ( cYear <> cThisYear ) then
              GridToolBar.Visible := False
           else
              GridToolBar.Visible := True;

           if MyTable.RecordCount > 0 then
              HideShowGrid('S')
           else
              begin
                 MessageDLG('No Eligible Animals',mtInformation,[mbOK],0);
                 sbPreview.Enabled := False;
                 sbPrintApplic.Enabled   := False;
                 sbRemove.Enabled   := False;
                 sbSaveApplication.Enabled   := False;
              end;

           pDoingSomething.Hide;
           DoingSomething.Position := 0;
        end;
end;

procedure TfApplications.GetAnimalCounts(MyTable : TTable);
begin
   if ((WhichReg = NIreland) AND (rgPremType.ItemIndex = 0)) then
      TotalAnimals.Text := ''
   else
      TotalAnimals.Text := IntToStr(MyTable.RecordCount);

   e10Month.Font.Color := Month10Col;
   e22Month.Font.Color := Month22Col;
   eBull.Font.Color :=    BullCol;

   // Get the Count of the animal types
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT Count( AID ) MyCount FROM ' + MyTable.TableName );
   GenQuery.SQL.Add('WHERE PremiumType = "F"');
   GenQuery.Open;
   e10Month.Text := GenQuery.FieldByName('MyCount').AsString;
   Total10Months := GenQuery.FieldByName('MyCount').AsInteger;

   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT Count( AID ) MyCount FROM ' + MyTable.TableName );
   GenQuery.SQL.Add('WHERE PremiumType = "S"');
   GenQuery.Open;
   e22Month.Text := GenQuery.FieldByName('MyCount').AsString;
   Total22Months := GenQuery.FieldByName('MyCount').AsInteger;

   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT Count( AID ) MyCount FROM ' + MyTable.TableName );
   GenQuery.SQL.Add('WHERE PremiumType = "B"');
   GenQuery.Open;
   eBull.Text  := GenQuery.FieldByName('MyCount').AsString;
   TotalBull   := GenQuery.FieldByName('MyCount').AsInteger;
end;

procedure TfApplications.bSelectAnimalsClick(Sender: TObject);
begin
   sbRemove.Enabled   := True;
   if not sbExten.Down then
      begin
         if CheckEligDate then
            begin
               if ApplicDate.Date < EncodeDate(2004, 01, 01) then
                  begin
                     // ensure application is in cYear for Rep. Irish & N. Irish Herds
                     sbPreview.Enabled := False;
                     sbPrintApplic.Enabled := False;
                  end
               else if ( WhichReg = Ireland ) and ( ApplicDate.Date > EncodeDate(2004, 12, 31)) then
                  begin
                     // if Irish Herd ensure App Date is not after 31/12/2004
                     sbPreview.Enabled := False;
                     sbPrintApplic.Enabled := False;
                  end
               else if ( WhichReg = NIreland ) and ( ApplicDate.Date > EncodeDate(2005, 01, 25)) then
                  begin
                     // NI Premium App can take place up to 25/1/2005
                     sbPreview.Enabled := False;
                     sbPrintApplic.Enabled := False;
                  end
               else
                  begin
                     sbPreview.Enabled := True;
                     sbPrintApplic.Enabled := True;
                  end;

               if ( Length(cbHerdID.Value) > 0 ) And ( cbHerdID.Value <> '0' ) then
                  begin
                     sbSaveApplication.Enabled := False;
                     // If you are showing Extensification then recalc the LUS
                     if pExtensification.Showing then
                        CalcLUS;
                     CalcRetention(Query);
                  end
               else // ( Length(cbHerdID.Value) > 0 ) And ( cbHerdID.Value <> '0' ) then
                  begin
                     MessageDLG('You must select a Herd',mtWarning,[mbOK],0);
                     cbHerdID.SetFocus;
                  end;
            end
         else  //CheckEligDate then
            EligDate.SetFocus;
      end
   else if CheckEligDate then
      begin
         sbSaveApplication.Enabled := False;
         CalcRetention(Query);
         if pExtensification.Showing then
            CalcLUS;
      end;

   CheckForageHectares;

   if WhichReg = Ireland then
      CheckPremClaimLimits;
end;

procedure TfApplications.ApplicDateExit(Sender: TObject);
begin
   // Allow application to be two weeks ahead.
   if ((ApplicDate.Date) > ( ((Date)+14) )) then
      begin
         MessageDlg('Application date cannot be more than 14 days from today'+#13+
                    're-setting to todays date',mtWarning,[mbOk],0);
         ApplicDate.Date := Date;
         ApplicDate.SetFocus;
         SysUtils.Abort;
      end;

   if WhichReg = NIreland then
      CalcRetention(NoQuery)
   else
      begin
         if ( ApplicDate.Date < EligDate.Date ) then
            begin
                MessageDLG('Application Date cannot be before Eligability Date',mtInformation,[mbOK],0);
                ApplicDate.SetFocus;
            end
         else
            // Calculate the Retention Date.
            CalcRetention(NoQuery);
      end;
end;

procedure TfApplications.FormDestroy(Sender: TObject);
begin
     // Close and Remove the Temporary Table from Disk
{     PremTable.Close;
     //PremTable.DeleteTable;
     PremTable.Free;
     // Free Memory for the Datasource
     PremSource.Free;
     // Free the form
  //   Free;} 
end;

procedure TfApplications.bRemoveAnimalClick(Sender: TObject);
begin
     if PremTable.RecordCount > 0 then
        begin
           AnimalGrid.SelectedRows.Delete;
           GetAnimalCounts ( PremTable );
        end;
     // Calculate the LUS
     CalcLUS;
end;

procedure TfApplications.BlankReport;
begin
   with fSB2001 do
      begin
         // Blank Bull fields
         A1.Caption := '';
         A2.Caption := '';
         A3.Caption := '';
         A4.Caption := '';
         A5.Caption := '';
         A6.Caption := '';
         A7.Caption := '';
         A8.Caption := '';
         A9.Caption := '';
         A10.Caption := '';
         A11.Caption := '';
         A12.Caption := '';
         A13.Caption := '';
         A14.Caption := '';
         A15.Caption := '';
         B1.Caption := ''; B8.Caption := ''; B15.Caption := '';
         B2.Caption := ''; B9.Caption := ''; B16.Caption := '';
         B3.Caption := ''; B10.Caption := ''; B17.Caption := '';
         B4.Caption := ''; B11.Caption := ''; B18.Caption := '';
         B5.Caption := ''; B12.Caption := ''; B19.Caption := '';
         B6.Caption := ''; B13.Caption := ''; B20.Caption := '';
         B7.Caption := ''; B14.Caption := ''; B21.Caption := '';

         //Blank the Restricted Herd Fields
         R1.Caption := ''; R16.Caption := ''; R31.Caption := '';
         R2.Caption := ''; R17.Caption := ''; R32.Caption := '';
         R3.Caption := ''; R18.Caption := ''; R33.Caption := '';
         R4.Caption := ''; R19.Caption := ''; R34.Caption := '';
         R5.Caption := ''; R20.Caption := ''; R35.Caption := '';
         R6.Caption := ''; R21.Caption := ''; R36.Caption := '';
         R7.Caption := ''; R22.Caption := ''; R37.Caption := '';
         R8.Caption := ''; R23.Caption := ''; R38.Caption := '';
         R9.Caption := ''; R24.Caption := ''; R39.Caption := '';
         R10.Caption := ''; R25.Caption := ''; R40.Caption := '';
         R11.Caption := ''; R26.Caption := ''; R41.Caption := '';
         R12.Caption := ''; R27.Caption := ''; R42.Caption := '';
         R13.Caption := ''; R28.Caption := ''; R43.Caption := '';
         R14.Caption := ''; R29.Caption := ''; R44.Caption := '';
         R15.Caption := ''; R30.Caption := ''; R45.Caption := '';
      end;
end;

procedure TfApplications.BuildPages;
Var
   MyQuery    : TQuery;
   RecCount   : Integer;
   TotalClaimed : Integer;

   procedure SetUpPages;
   var
      BullCount,
      SteerCount : Integer;
   begin
     try
        MyQuery := TQuery.Create(nil);
        MyQuery.DatabaseName := WinData.KingData.DatabaseName;
        MyQuery.SQL.Clear;
        MyQuery.SQL.Add('SELECT * FROM TempPrm WHERE Printed=FALSE');
        Case gOrderBy.ItemIndex of
          0 : case gSortBy.ItemIndex of
                 0 : MyQuery.SQL.Add('ORDER BY SortNatID'); //SP  13/10/00 Sorting fix
                 1 : MyQuery.SQL.Add('ORDER BY SortAnimalNo'); //SP
                 2 : MyQuery.SQL.Add('ORDER BY DOB');
                 3 : MyQuery.SQL.Add('ORDER BY PremiumType');
              end;
          1 : case gSortBy.ItemIndex of
                 0 : MyQuery.SQL.Add('ORDER BY SortNatID Desc');
                 1 : MyQuery.SQL.Add('ORDER BY SortAnimalNo Desc');
                 2 : MyQuery.SQL.Add('ORDER BY DOB Desc');
                 3 : MyQuery.SQL.Add('ORDER BY PremiumType Desc');
              end;
        end;
        MyQuery.Open;
        MyQuery.First;

        BullCount := 1;
        SteerCount := 1;
        while ( NOT MyQuery.EOF ) And ( SteerCount < 46 ) do
           begin
              if PremTable.Locate('AID;PremiumType',VarArrayOf([MyQuery.FieldByName('AID').Value,
                                                                MyQuery.FieldByName('PremiumType').Value]),[] ) then
                 begin
                    if ( BullCount <= 21 ) And ( UPPERCASE(MyQuery.FieldByName('SEX').AsString ) = 'BULL') then
                       begin
                          BuildLine(MyQuery, BullCount, FALSE );
                          PremTable.Edit;
                          PremTable.FieldByName('Printed').AsBoolean := TRUE;
                          PremTable.Post;
                          Inc(BullCount);
                       end;
                    if ( HerdRestricted ) And ( SteerCount <= 45 ) And ( UPPERCASE(MyQuery.FieldByName('SEX').AsString ) = 'STEER') then
                       begin
                          BuildLine(MyQuery, SteerCount, FALSE );
                          PremTable.Edit;
                          PremTable.FieldByName('Printed').AsBoolean := TRUE;
                          PremTable.Post;
                          Inc(SteerCount);
                       end;
                 end;
              MyQuery.Next;
              if (( SteerCount > 45 ) and ( HerdRestricted )) or
                  ( BullCount > 21 ) or ( MyQuery.EOF ) then
                 begin
                     if ViewIt then
                        fSB2001.RestrictedHerd.Preview
                     else
                        begin
                           fSB2001.RestrictedHerd.Print;
                           fSB2001.RestrictedHerd.Print;
                        end;
                     SteerCount := 1;
                     BullCount := 1;
                     BlankReport;
                 end;
           end;
     finally
        MyQuery.Close;
        MyQuery.Free;
     end;
   end;

begin
   if WhichReg = Ireland then
      try
         MyQuery := TQuery.Create(nil);
         MyQuery.DatabaseName := WinData.KingData.DatabaseName;
         MyQuery.SQL.Clear;
         MyQuery.SQL.Add('UPDATE TempPrm SET Printed=FALSE');
         MyQuery.ExecSQL;
      finally
         MyQuery.Close;
         MyQuery.Free;
      end;

   if WhichReg = Ireland then
      begin
         if PremTable.RecordCount > 99 then
            begin
               fSB2001.NoCattle0.Caption := Copy(IntToStr(PremTable.RecordCount),1,1);
               fSB2001.NoCattle1.Caption := Copy(IntToStr(PremTable.RecordCount),2,1);
               fSB2001.NoCattle2.Caption := Copy(IntToStr(PremTable.RecordCount),3,1);
               fSB2001.Enclosed0.Caption := Copy(IntToStr(PremTable.RecordCount),1,1);
               fSB2001.Enclosed1.Caption := Copy(IntToStr(PremTable.RecordCount),2,1);
               fSB2001.Enclosed2.Caption := Copy(IntToStr(PremTable.RecordCount),3,1);
            end
         else if PremTable.RecordCount > 9 then
            begin
               fSB2001.NoCattle0.Caption := '0';
               fSB2001.NoCattle1.Caption := Copy(IntToStr(PremTable.RecordCount),1,1);
               fSB2001.NoCattle2.Caption := Copy(IntToStr(PremTable.RecordCount),2,1);
               fSB2001.Enclosed0.Caption := '0';
               fSB2001.Enclosed1.Caption := Copy(IntToStr(PremTable.RecordCount),1,1);
               fSB2001.Enclosed2.Caption := Copy(IntToStr(PremTable.RecordCount),2,1);
            end
         else
            begin
               fSB2001.NoCattle0.Caption := '0';
               fSB2001.NoCattle1.Caption := '0';
               fSB2001.NoCattle2.Caption := Copy(IntToStr(PremTable.RecordCount),1,1);
               fSB2001.Enclosed0.Caption := '0';
               fSB2001.Enclosed1.Caption := '0';
               fSB2001.Enclosed2.Caption := Copy(IntToStr(PremTable.RecordCount),1,1);
            end;
         if HerdRestricted then
            begin
               fSB2001.Enclosed0.Caption := '0';
               fSB2001.Enclosed1.Caption := '0';
               fSB2001.Enclosed2.Caption := '0'; //SP 13/12/00 Blank out number of cards, if restricted herd
            end;
         if ( Total10Months + Total22Months ) > 99 then
            begin
               fSB2001.NoCast0.Caption := Copy(IntToStr(Total10Months + Total22Months),1,1);
               fSB2001.NoCast1.Caption := Copy(IntToStr(Total10Months + Total22Months),2,1);
               fSB2001.NoCast2.Caption := Copy(IntToStr(Total10Months + Total22Months),3,1);
            end
         else if Total10Months + Total22Months > 9 then
            begin
               fSB2001.NoCast0.Caption := '0';
               fSB2001.NoCast1.Caption := Copy(IntToStr(Total10Months + Total22Months),1,1);
               fSB2001.NoCast2.Caption := Copy(IntToStr(Total10Months + Total22Months),2,1);
            end
         else
            begin
               fSB2001.NoCast0.Caption := '0';
               fSB2001.NoCast1.Caption := '0';
               fSB2001.NoCast2.Caption := Copy(IntToStr(Total10Months + Total22Months),1,1);
            end;

         if ( TotalBull ) > 99 then
            begin
               fSB2001.NoBulls0.Caption := Copy(IntToStr(TotalBull),1,1);
               fSB2001.NoBulls1.Caption := Copy(IntToStr(TotalBull),2,1);
               fSB2001.NoBulls2.Caption := Copy(IntToStr(TotalBull),3,1);
            end
         else if TotalBull > 9 then
            begin
               fSB2001.NoBulls0.Caption := '0';
               fSB2001.NoBulls1.Caption := Copy(IntToStr(TotalBull),1,1);
               fSB2001.NoBulls2.Caption := Copy(IntToStr(TotalBull),2,1);
            end
         else
            begin
               fSB2001.NoBulls0.Caption := '0';
               fSB2001.NoBulls1.Caption := '0';
               fSB2001.NoBulls2.Caption := Copy(IntToStr(TotalBull),1,1);
            end;

         // About to print the 1st page of the application
         BlankReport;

         RecCount := 1;
         // Set a filter on record for Bulls
         try
            MyQuery := TQuery.Create(nil);
            MyQuery.DatabaseName := WinData.KingData.DatabaseName;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('SELECT * FROM TempPrm WHERE UPPER(SEX) = "BULL"');
            case gOrderBy.ItemIndex of
              0 : case gSortBy.ItemIndex of
                     0 : MyQuery.SQL.Add('ORDER BY SortNatID'); //SP  13/10/00 Sorting fix
                     1 : MyQuery.SQL.Add('ORDER BY SortAnimalNo');  //SP
                     2 : MyQuery.SQL.Add('ORDER BY DOB');
                     3 : MyQuery.SQL.Add('ORDER BY PremiumType');
                  end;
              1 : case gSortBy.ItemIndex of
                     0 : MyQuery.SQL.Add('ORDER BY SortNatID Desc');
                     1 : MyQuery.SQL.Add('ORDER BY SortAnimalNo Desc');
                     2 : MyQuery.SQL.Add('ORDER BY DOB Desc');
                     3 : MyQuery.SQL.Add('ORDER BY PremiumType Desc');
                  end;
            end;

            MyQuery.Open;
            MyQuery.First;
            while ( NOT MyQuery.EOF ) AND ( RecCount <= 15 ) Do
               begin
                  BuildLine(MyQuery, RecCount, TRUE );
                  Inc(RecCount);
                  if PremTable.Locate('AID;PremiumType',VarArrayOf([MyQuery.FieldByName('AID').Value,
                                                                    MyQuery.FieldByName('PremiumType').Value]),[] ) then
                     begin
                        PremTable.Edit;
                        PremTable.FieldByName('Printed').AsBoolean := TRUE;
                        PremTable.Post;
                     end;
                  MyQuery.Next;
               end;
         finally
            MyQuery.Close;
            MyQuery.Free;
         end;

         if ViewIt then
            begin
               fSB2001.QRApplications.DataSet  := PremTable;
               fSB2001.RestrictedHerd.DataSet  := PremTable;
                  begin
                     fSB2001.QRApplications.Preview;
                     if HerdRestricted or ( TotalBull > 15 ) then
                        begin
                           BlankReport;
                           // Get the 2nd Page Ready
                           SetUpPages;
                        end;
                  end;
            end
         else
            begin
               fSB2001.QRApplications.Print;
               fSB2001.QRApplications.Print;
               if HerdRestricted or ( TotalBull > 15 ) then
                  begin
                     BlankReport;
                     // Get the 2nd Page Ready
                     SetUpPages;
                  end;
            end;
      end
   else if WhichReg = NIreland then
      begin
         try

            SetNIDataSet(True);
            SetUpNIPages;
            // Call SQL Here....
            with qNIPrem do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('Select Distinct T.F1, T.F2, T.F3, T.F4, T.F5, T.F6, T.F7, T.F8, T.F9, T.F10, T.F11, T.F12, T.F13, T.F14 ');
                  SQL.Add('From TempPrm T ');
                  SQL.Add('Where (T.NITag = True) ');
                  Open;
               end;

            if qNIPrem.RecordCount > 0 then
               begin
                  TotalClaimed := qNIPrem.RecordCount;
                  fNIPremApplics.qrNIDetail.DataSet := qNIPrem;
                  fNIPremApplics.qrDetail.Visible := True;
                  fNIPremApplics.qrDetail.Height := 26;
               end
            else
               begin
                  fNIPremApplics.qrDetail.Visible := False;
                  fNIPremApplics.qrDetail.Height := 0;
               end;

            with qUKIrishPrem do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('Select Distinct T.F1, T.F2, T.F3, T.F4, T.F5, T.F6, T.F7, T.F8, T.F9, T.F10, T.F11, T.F12, T.F13, T.F14 ');
                  SQL.Add('From TempPrm T ');
                  SQL.Add('Where (T.NITag = False) ');
                  Open;
               end;

            if qUKIrishPrem.RecordCount > 0 then
               begin
                  TotalClaimed := TotalClaimed+qUKIrishPrem.RecordCount;
                  fNIPremApplics.qrNIDetail2.DataSet := qUKIrishPrem;
                  fNIPremApplics.qrDetail2.Visible := True;
                  fNIPremApplics.qrDetail2.Height := 26;
               end
            else
               begin
                  fNIPremApplics.qrDetail2.Visible := False;
                  fNIPremApplics.qrDetail2.Height := 0;
               end;

            fNIPremApplics.lTot.Caption  := IntToStr(TotalClaimed);
            fNIPremApplics.qrSectionC.Height := 0;
            fNIPremApplics.qrSectionC.Enabled := False;
            fNIPremApplics.qrSectionA.Top := 38;
            fNIPremApplics.qrSectionA.Height := 1047;
            fNIPremApplics.qrSectionA.Enabled := True;
            if ViewIt then
               begin
                  fNIPremApplics.qrNIPremium.Preview;
                  fNIPremApplics.qrNIDetail.Preview;
                  if qUKIrishPrem.RecordCount > 0 then
                     fNIPremApplics.qrNIDetail2.Preview;
               end
            else
               begin
                  fNIPremApplics.qrNIPremium.Print;
                  fNIPremApplics.qrNIPremium.Print;
                  fNIPremApplics.qrNIDetail.Print;
                  fNIPremApplics.qrNIDetail.Print;
                  if qUKIrishPrem.RecordCount > 0 then
                     begin
                        fNIPremApplics.qrNIDetail2.Print;
                        fNIPremApplics.qrNIDetail2.Print;
                     end;
               end;

            fNIPremApplics.qrSectionA.Height := 0;
            fNIPremApplics.qrSectionA.Enabled := False;
            fNIPremApplics.qrSectionC.Top := 38;
            fNIPremApplics.qrSectionC.Height := 1047;
            fNIPremApplics.qrSectionC.Enabled := True;
            if ViewIt then
               fNIPremApplics.qrNIPremium.Preview
            else
               begin
                  fNIPremApplics.qrNIPremium.Print;
                  fNIPremApplics.qrNIPremium.Print;
               end;
         finally
            SetNIDataSet(False);
            fNIPremApplics.qrNIDetail.DataSet := nil;
            fNIPremApplics.qrNIDetail2.DataSet := nil;
         end;
      end;
   PageCount := 1; // reset pagecount
end;

procedure TfApplications.SetUpNIPages;
const
   FirstAgeDetailHeader  = 'Section B - 1st age Steers - do not include bulls on this form';
   SecondAgeDetailHeader = 'Section B - 2nd age Steers - do not include bulls on this form';
   BullDetailHeader      = 'Section B - Beef Special Premium Scheme (Bull) 2004';
   FirstPremType         = '1st Age Premium';
   SecondPremType        = '2nd Age Premium Claim';
   BullPremType          = 'Bull';
   Bulls                 = 'Bulls,';
   Steers                = 'Steers,';
   cWhichType            = 'None of the animals entered hereon have previously received %s under this Scheme';
   cWhichTypeBF           = 'first age or bull premium';
   cWhichTypeS            = 'second age or bull premium';
   cClaim                = 'I claim payment of %s in accordance with the terms and conditions of the Scheme '+
                           'and the regulations of the European Community pertaining to the Scheme.';
   cClaimFirst            = 'first age Beef Special Premium';
   cClaimBull             = 'Bull Premium';
   cClaimSecond           = 'second age Beef Special Premium';
begin
   { procedure modified for 2003 prem applics NN/SP 17/12/2003 }
   with fNIPremApplics do
      begin
         case rgPremType.ItemIndex of
            1 : begin
                   // First Age Premium
                   Desc.Caption          := 'BP2';
                   lPremType.Caption     := FirstPremType;
                   lDetailHeader.Caption := FirstAgeDetailHeader;
                   QRMemo1.Lines.Clear;
                   QRMemo1.Lines.Add('For Steers at least 7 months and under 20 months old on the first day of the retention period');
                   QRMemo2.Lines.Clear;
                   lAType.Caption        := Steers;
                   LWhichType.Caption    := Format(cWhichType, [cWhichTypeBF]);
                   lClaim.Caption        := Format(cClaim, [cClaimFirst]);
                end;
            2 : begin
                   // Second Age Premium
                   Desc.Caption          := 'BP3';
                   lPremType.Caption     := SecondPremType;
                   lDetailHeader.Caption := SecondAgeDetailHeader;
                   QRMemo1.Lines.Clear;
                   QRMemo1.Lines.Add('For Steers at least 20 months old on the first day of the retention period');
                   QRMemo2.Lines.Clear;
                   lAType.Caption        := Steers;
                   LWhichType.Caption    := Format(cWhichType, [cWhichTypeS]);
                   lClaim.Caption        := Format(cClaim, [cClaimSecond]);
                end;
            3 : begin
                   // Bull Premium
                   Desc.Caption          := 'BP5';
                   lPremType.Caption     := BullPremType;
                   lDetailHeader.Caption := BullDetailHeader;
                   QRMemo1.Lines.Clear;
                   QRMemo1.Lines.Add('For Bulls of at least 7 months on the first day of the retention period.');
                   QRMemo2.Lines.Clear;
                   QRMemo2.Lines.Add('NB There is no longer an upper age limit for bull premium.');
                   lAType.Caption        := Bulls;
                   LWhichType.Caption    := Format(cWhichType, [cWhichTypeBF]);
                   lClaim.Caption        := Format(cClaim, [cClaimBull]);
                end;
         end;
      end;
end;

procedure TfApplications.BuildLine(MyDataSet : TQuery; LineCount : Word; FirstPage : Boolean );
Var
   IDStr : string;
   IEPos : Integer;
begin
     with fSB2001 Do
        begin
           //IDStr := PremTable.FieldByName('NatID').AsString;
           IDStr := MyDataSet.FieldByName('NatID').AsString;
           IEPos := POS('IE',IDStr);
           if ( IEPos > 0 ) then
              Delete (IDStr,IEPos,2);
           IDStr := WinData.StripAllSpaces(IDStr);
           if FirstPage and (UPPERCASE( MyDataSet.FieldByName('Sex').AsString ) = 'BULL') then
              Case LineCount of
                 1 : A1.Caption := IDStr;
                 2 : A2.Caption := IDStr;
                 3 : A3.Caption := IDStr;
                 4 : A4.Caption := IDStr;
                 5 : A5.Caption := IDStr;
                 6 : A6.Caption := IDStr;
                 7 : A7.Caption := IDStr;
                 8 : A8.Caption := IDStr;
                 9 : A9.Caption := IDStr;
                 10 : A10.Caption := IDStr;
                 11 : A11.Caption := IDStr;
                 12 : A12.Caption := IDStr;
                 13 : A13.Caption := IDStr;
                 14 : A14.Caption := IDStr;
                 15 : A15.Caption := IDStr;
              end
           else  // Build if restricted Herd
              begin
                  if UPPERCASE( MyDataSet.FieldByName('Sex').AsString ) = 'BULL' then
                     Case LineCount of
                        1 : B1.Caption := IDStr;    2 : B2.Caption := IDStr;
                        3 : B3.Caption := IDStr;    4 : B4.Caption := IDStr;
                        5 : B5.Caption := IDStr;    6 : B6.Caption := IDStr;
                        7 : B7.Caption := IDStr;    8 : B8.Caption := IDStr;
                        9 : B9.Caption := IDStr;   10 : B10.Caption := IDStr;
                        11 : B11.Caption := IDStr; 12 : B12.Caption := IDStr;
                        13 : B13.Caption := IDStr; 14 : B14.Caption := IDStr;
                        15 : B15.Caption := IDStr; 16 : B16.Caption := IDStr;
                        17 : B17.Caption := IDStr; 18 : B18.Caption := IDStr;
                        19 : B19.Caption := IDStr; 20 : B20.Caption := IDStr;
                        21 : B21.Caption := IDStr;
                     end
                  else
                     Case LineCount of
                        1 : R1.Caption := IDStr; 2 : R2.Caption := IDStr;
                        3 : R3.Caption := IDStr; 4 : R4.Caption := IDStr;
                        5 : R5.Caption := IDStr; 6 : R6.Caption := IDStr;
                        7 : R7.Caption := IDStr; 8 : R8.Caption := IDStr;
                        9 : R9.Caption := IDStr; 10 : R10.Caption := IDStr;
                        11 : R11.Caption := IDStr; 12 : R12.Caption := IDStr;
                        13 : R13.Caption := IDStr; 14 : R14.Caption := IDStr;
                        15 : R15.Caption := IDStr; 16 : R16.Caption := IDStr;
                        17 : R17.Caption := IDStr; 18 : R18.Caption := IDStr;
                        19 : R19.Caption := IDStr; 20 : R20.Caption := IDStr;
                        21 : R21.Caption := IDStr; 22 : R22.Caption := IDStr;
                        23 : R23.Caption := IDStr; 24 : R24.Caption := IDStr;
                        25 : R25.Caption := IDStr; 26 : R26.Caption := IDStr;
                        27 : R27.Caption := IDStr; 28 : R28.Caption := IDStr;
                        29 : R29.Caption := IDStr; 30 : R30.Caption := IDStr;
                        31 : R31.Caption := IDStr; 32 : R32.Caption := IDStr;
                        33 : R33.Caption := IDStr; 34 : R34.Caption := IDStr;
                        35 : R35.Caption := IDStr; 36 : R36.Caption := IDStr;
                        37 : R37.Caption := IDStr; 38 : R38.Caption := IDStr;
                        39 : R39.Caption := IDStr; 40 : R40.Caption := IDStr;
                        41 : R41.Caption := IDStr; 42 : R42.Caption := IDStr;
                        43 : R43.Caption := IDStr; 44 : R44.Caption := IDStr;
                        45 : R45.Caption := IDStr;
                     end;
              end;
        end;
end;

procedure TfApplications.bPrintApplic1Click(Sender: TObject);
var
   dtDay, dtMonth, dtYear : Word;
   NoMales : Integer;
begin
   CheckForageHectares;
   if WhichReg = NIreland then
      if rgPremType.ItemIndex = 0 then
         begin
            MessageDlg('You must select a Premium Type before application can be made',mtInformation,[mbOk],0);
            Exit;
         end;
   // SP
   if WhichReg = Ireland then
      CheckPremClaimLimits;
   if WhichReg = NIreland then
      GetNIAppsThisYear;
   // ensure application is in 2002
   if ( ApplicDate.Date < EncodeDate(2004, 01, 01) ) or ( ApplicDate.Date > EncodeDate(2004, 12, 31) ) then
      begin
         MessageDlg(Format('Application Date must be in %d', [cThisYear]),mtError,[mbOk],0);
         Exit;
      end;
{   else if  then
      begin
         MessageDlg('Application Date must be in 2004',mtError,[mbOk],0);
         Exit;
      end;
}
   sbSaveApplication.Enabled := False;
   SavedApplication := False;
   PremTable.DisableControls;
   ViewIt := (Sender as TRxSpeedbutton).Name = 'sbPreview';

   if WhichReg = Ireland then
      begin
         // Get the Number of Males for this Herd if a herd is selected
         if ( cbHerdID.Value > '0' ) then
            try
               qNoMales.Close;
               qNoMales.ParamByName('HID').AsInteger := StrToInt(cbHerdId.Value);
               qNoMales.Open;
               if ( NOT qNoMales.IsEmpty ) then
                  NoMales := qNoMales.FieldByName('CountOfMales').AsInteger
               else
                  NoMales := 0;
            except
               ShowMessage('Cannot get Number of Male Animals - Fill this area on the form Manually');
            end
         else
            ShowMessage('Cannot get Number of Male Animals - Fill this area on the form Manually' + #13 +
                        'OR You have to Select a Herd and reselect the Animals');
      end;

   try
      if ( cbHerdID.Value > '0' ) then
         if WinData.OwnerFile.Locate('ID',cbHerdId.Value,[] ) then

            if WhichReg = NIreland then
               begin
                  fNIPremApplics := TfNIPremApplics.Create(nil);
                  with fNIPremApplics, WinData.OwnerFile Do
                     begin
                        Title.Caption              := UPPERCASE(FieldByName('Title').AsString);
                        FirstName.Caption          := UPPERCASE(FieldByName('FirstName').AsString);
                        Surname.Caption            := UPPERCASE(FieldByName('Surname').AsString);
                        HerdNum.Caption            := UPPERCASE(FieldByName('HerdIdentity').AsString);  //SP
                        NIAddress1.Caption         := UPPERCASE(FieldByName('Address1').AsString);
                        NIAddress2.Caption         := UPPERCASE(FieldByName('Address2').AsString);
                        NIAddress3.Caption         := UPPERCASE(FieldByName('Address3').AsString);
                        NIAddress4.Caption         := UPPERCASE(FieldByName('Address4').AsString);
                        TelNumber.Caption          := FieldByName('Phone').AsString;
                        lClientRefNo.Caption       := UPPERCASE(FieldByName('ClientRefNo').AsString);
                        lFarmSurveyNo.Caption      := UPPERCASE(FieldByName('FarmSurveyNo').AsString);
                        LPostcode.Caption          := '';

                        lRetentionDate.Caption     := DateToStr(EligDate.Date);

                        Titlea.Caption             := Title.Caption;
                        Namea.Caption              := FirstName.Caption;
                        SurNamea.Caption           := Surname.Caption;
                        NIAddress1a.Caption        := NIAddress1.Caption;
                        NIAddress2a.Caption        := NIAddress2.Caption;
                        NIAddress3a.Caption        := NIAddress3.Caption;
                        HerdNoa.Caption            := HerdNum.Caption;

                        Titleb.Caption             := Title.Caption;
                        Nameb.Caption              := FirstName.Caption;
                        SurNameb.Caption           := Surname.Caption;
                        NIAddress1b.Caption        := NIAddress1.Caption;
                        NIAddress2b.Caption        := NIAddress2.Caption;
                        NIAddress3b.Caption        := NIAddress3.Caption;
                        HerdNob.Caption            := HerdNum.Caption;

                        Titlec.Caption             := Title.Caption;
                        Namec.Caption              := FirstName.Caption;
                        SurNamec.Caption           := Surname.Caption;
                        NIAddress1c.Caption        := NIAddress1.Caption;
                        NIAddress2c.Caption        := NIAddress2.Caption;
                        NIAddress3c.Caption        := NIAddress3.Caption;
                        HerdNoc.Caption            := HerdNum.Caption;

//                        NIPlaceForInspect1.Caption := FieldByName('PlaceForInspection1').AsString;
//                        NIPlaceForInspect2.Caption := FieldByName('PlaceForInspection2').AsString; NN 17/12/2002

                     end;
               end
            else
               begin
                  // Rep of Ireland Report
                  fSB2001 := TfSB2001.Create(nil);
                  with fSB2001, WinData.OwnerFile Do
                     begin
                        HerdOwner.Caption    := UPPERCASE(FieldByName('Name').AsString);
                        Address1.Caption     := UPPERCASE(FieldByName('Address1').AsString);
                        Address2.Caption     := UPPERCASE(FieldByName('Address2').AsString);
                        Address3.Caption     := UPPERCASE(FieldByName('Address3').AsString);
                        Address4.Caption     := UPPERCASE(FieldByName('Address4').AsString);
                        qrDBEanHerd.BarCode  := Uppercase(FieldByName('HerdIdentity').AsString); // 03/01/01 SP Barcode component
                        qrDBEanHerdA.BarCode := Uppercase(FieldByName('HerdIdentity').AsString);
                        TelNo.Caption        := FieldByName('Phone').AsString;
                        EMail.Caption        := FieldByName('e-mail').AsString;
                        if Length(FieldByName('RSINumber').AsString) > 0 then
                           PPSNum.Caption       := FieldByName('RSINumber').AsString
                        else
                           PPSNum.Caption := '';
                        if Length(FieldByName('Fax').AsString) > 0 then
                           MobileNum.Caption    := FieldByName('Fax').AsString
                        else
                           MobileNum.Caption := '';
                        HerdRestricted       := FieldByName('Restricted').AsBoolean;
                        if HerdRestricted then
                           begin
                              lYesRestricted.Caption    := CHR(0252);
                              lNoRestricted.Caption     := '';
                              TelNo2.Caption            := FieldByName('Phone').AsString;
                           end
                        else
                           begin
                              lYesRestricted.Caption    := '';
                              lNoRestricted.Caption     := CHR(0252);
                              TelNo2.Caption            := ''
                           end;
                        PlaceForInspect1.Caption := FieldByName('PlaceForInspection1').AsString;
                        PlaceForInspect2.Caption := FieldByName('PlaceForInspection2').AsString;
                        HerdLetter.Caption := Copy(FieldByName('HerdIdentity').AsString,1,1);
                        HerdNos.Caption := Copy(FieldByName('HerdIdentity').AsString,2,Length(FieldByName('HerdIdentity').AsString));
                        RHerdLetter.Caption := Copy(FieldByName('HerdIdentity').AsString,1,1);
                        RHerdNos.Caption := Copy(FieldByName('HerdIdentity').AsString,2,Length(FieldByName('HerdIdentity').AsString));
                     end;
               end;

      if (WhichReg <> NIreland) then
         begin
            BlankReport;
            with fSB2001 do
               begin
                  DeCodeDate ( ApplicDate.Date, dtYear, dtMonth, dtDay );
                  if dtDay < 10 then
                     begin
                        Day1.Caption := '0';
                        Day2.Caption := IntToStr(dtDay);
                        RD1.Caption := '0';
                        RD2.Caption := IntToStr(dtDay);
                     end
                  else
                     begin
                        Day1.Caption := Copy(IntToStr(dtDay),1,1);
                        Day2.Caption := Copy(IntToStr(dtDay),2,1);
                        RD1.Caption := Copy(IntToStr(dtDay),1,1);
                        RD2.Caption := Copy(IntToStr(dtDay),2,1);
                     end;
                  if ( dtMonth < 10 ) then
                     begin
                        Month1.Caption := '0';
                        Month2.Caption := IntToStr(dtMonth);
                        RM1.Caption := '0';
                        RM2.Caption := IntToStr(dtMonth);
                     end
                  else
                     begin
                        Month1.Caption := Copy(IntToStr(dtMonth),1,1);
                        Month2.Caption := Copy(IntToStr(dtMonth),2,1);
                        RM1.Caption := Copy(IntToStr(dtMonth),1,1);
                        RM2.Caption := Copy(IntToStr(dtMonth),2,1);
                     end;
               end;
         end;
      PremTable.First;
      BuildPages;
   finally
      if WhichReg = NIreland then
         fNIPremApplics.Free
      else
         fSB2001.Free;
      PremTable.EnableControls;
   end;
   if NOT ViewIt then
      if MessageDlg('Is the Printed Application OK and Correct ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         sbSaveApplication.Enabled := True
      else
         sbSaveApplication.Enabled := False;
end;

procedure TfApplications.AnimalGridGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if PremTable.FieldByName('PremiumType').AsString = 'F' then
     AFont.Color := Month10Col
  else if PremTable.FieldByName('PremiumType').AsString = 'S' then
     AFont.Color := Month22Col
  else if PremTable.FieldByName('PremiumType').AsString = 'B' then
     AFont.Color := BullCol;
end;

procedure TfApplications.SetLUValues;
begin
   LUSCows    := cLUSCows;
   LUSSuckler := cLUSSuckler;
   LUSUnder24 := cLUSUnder24;
   LUSOver24  := cLUSOver24;
   LUS10      := cLUS10;
   LUSEwes    := cLUSEwes;
   LUBullOver24 := cBullOver24;
end;

procedure TfApplications.EraseTable;
begin
   // Erase the Temp Data and Set Count to 0
   try
      PremTable.Close;
      GenQuery.SQL.Clear;
      GenQuery.SQL.Add('DELETE FROM ' + PremTable.TableName );
      GenQuery.ExecSQL;
   finally
      e10Month.Text := '0';
      e22Month.Text := '0';
      eBull.Text    := '0';
      PremTable.Open;
   end;
end;

procedure TfApplications.EligDateExit(Sender: TObject);
begin
   if WhichReg = Ireland then
      begin
         if EligDate.Date > ApplicDate.Date then
            begin
               ApplicDate.Date := EligDate.Date;
               MessageDLG('Application Date has been changed',mtWarning,[mbOK],0);
            end
         else if NOT CheckEligDate then
            EligDate.SetFocus;
      end
   else
      begin
         // in the case of NIreland the Elig date must be within two months of the application date.
         if EligDate.Date > IncMonth(ApplicDate.Date-1, 2) then
            begin
               MessageDlg('Retention start must be within two months of the application date'+#13+
                          're-setting to default date',mtWarning,[mbOK],0);
               EligDate.Date := Date;
               EligDate.SetFocus;
               SysUtils.Abort;
            end;
      end;
end;

procedure TfApplications.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if NOT SavedApplication then
        if ( MessageDLG('Application has not been Saved - Do you want to Save it',mtWarning,[mbYes,mbNo],0) = mrYes ) then
           CanClose := False;
end;

procedure TfApplications.sbSaveApplicationClick(Sender: TObject);
begin
   CheckForageHectares;
     try
        TempEvents.Open;
        WinData.Applications.Insert;
        WinData.Applications.FieldByName('Date').Value := ApplicDate.Date;
        try
           WinData.Applications.FieldByName('HerdID').AsInteger := StrToInt(cbHerdID.Value);
        except
           WinData.Applications.FieldByName('HerdID').AsInteger := 0;
        end;
        WinData.Applications.FieldByName('ApplicationType').Value := 'A';
        WinData.Applications.FieldByName('Description').Value := 'Premium Application';
        if WhichReg = NIreland then
           case rgPremType.ItemIndex of
              //0 : do nothing
              1 : WinData.Applications.FieldByName('PremType').Value := 'F';
              2 : WinData.Applications.FieldByName('PremType').Value := 'S';
              3 : WinData.Applications.FieldByName('PremType').Value := 'B';
           end;
        WinData.Applications.Post;
        // Go to last application and get its ID
        WinData.Applications.Last;
        PremTable.First;      // move to the First Record
        while ( NOT PremTable.EOF ) do
           begin
              try
                 if WinData.BeefSubsidy.Locate('EventId',PremTable.FieldByName('EventId').Value,[]) then
                    begin
                       WinData.BeefSubsidy.Edit;
                       WinData.BeefSubsidy.FieldByName('ApplicationID').Value := WinData.Applications.FieldByName('ApplicationID').Value;
                       WinData.BeefSubsidy.FieldByName('ApplicationDate').Value := ApplicDate.Date;
                       WinData.BeefSubsidy.FieldByName('RetensionDate').Value := StrToDate(RetentionDate.Text);
                       WinData.BeefSubsidy.Post;
                       WinData.KingData.ApplyUpdates([WinData.BeefSubsidy]);
                       if TempEvents.Locate('ID',PremTable.FieldByName('EventID').AsInteger,[] ) then
                          begin
                             TempEvents.Edit;
                             TempEvents.FieldByName('EventDate').AsDateTime := ApplicDate.Date;
                             if PremTable.FieldByName('PremiumType').AsString = 'F' then
                                TempEvents.FieldByName('EventDesc').AsString := cFirstDrawn
                             else if PremTable.FieldByName('PremiumType').AsString = 'S' then
                                TempEvents.FieldByName('EventDesc').AsString := cSecondDrawn
                             else if PremTable.FieldByName('PremiumType').AsString = 'B' then
                                TempEvents.FieldByName('EventDesc').AsString := cBullDrawn;
                             TempEvents.Post;
                          end;
                    end;
              except
                 ShowMessage('Could not Update Premium Information - Contact Kingswood Computing');
              end;
              PremTable.Next;
           end;
        SavedApplication := True;
     finally
        TempEvents.Close;
        PremTable.Close;
        PremTable.EmptyTable;
        WinData.Applications.Cancel;
        sbSaveApplication.Enabled := False;
        e10Month.Text := '0';
        e22Month.Text := '0';
        eBull.Text := '0';
        TotalAnimals.Text := '0'; 
        GetNosAppliedForThisYear;
        CalcLUs;
    end;
end;

procedure TfApplications.gOrderByClick(Sender: TObject);
begin
     PremTable.Close;
     Case gOrderBy.ItemIndex of
          0 : case gSortBy.ItemIndex of
                 0 : PremTable.IndexName := 'iStNatID'; //SP 13/10/00 Sorting fix
                 1 : PremTable.IndexName := 'iStAnimalNo'; //SP
                 2 : PremTable.IndexName := 'iDOB';
                 3 : PremTable.IndexName := 'iPremType';
              end;
          1 : case gSortBy.ItemIndex of
                 0 : PremTable.IndexName := 'iStNatIDd'; //SP 13/10/00 Sorting fix
                 1 : PremTable.IndexName := 'iStAnimalNod'; //SP
                 2 : PremTable.IndexName := 'iDOBd';
                 3 : PremTable.IndexName := 'iPremTyped';
              end;
     end;
     PremTable.Open;
end;

procedure TfApplications.cbHerdIDChange(Sender: TObject);
begin
   if pExtensification.Showing then
      begin
          bShowExtClick(Sender);   // 13/11/00 SP To refresh the Extens figures
      end;
    if tExtDefaults.Active then
       tExtDefaults.Locate('HerdID',cbHerdID.Value,[] );
    // If the Herd ID Changes then empty the Table
    EraseTable;
end;

procedure TfApplications.DoExtCalculations;
var
   NoOfDays       : Double;
   YearOFDate,
   DrawnFirst,
   Under24Month,
   Over24Month : Integer;
   nYear,
   nMonth,
   nDay           : Word;
   TempTable      : TTable;
begin
   try
      TotalLUThisApplic := 0;
      TotalLUThisYear   := 0;

      { ----- Animals to currently applying for ----- }
      with GenQuery do
         begin
            Under24Month  := 0;
            Over24Month   := 0;
            SQL.Clear;
            SQL.Add('SELECT * FROM ' + PremTable.TableName);
            SQL.Add('WHERE (PremiumType IN ("B","F","S")) ');
            Open;
            First;

            while NOT EOF do
               begin
                  NoOfDays := ( ApplicDate.Date-FieldByName('DOB').AsDateTime );
                  DeCodeDate( FieldByName('DOB').AsDateTime, nYear, nMonth, nDay );

                  if ( IsLeapYear ( nYear )) And
                     ( nMonth <= 2 ) And
                     ( nDay <=27 ) then
                     NoOfDays := NoOfDays-1;

                  if ( NoOfDays <= 730 ) then
                     Inc ( Under24Month )
                  else
                     Inc ( Over24Month );
                  Next;
               end;
            Close;
         end;

      try
         TotalLUThisApplic    := ( Under24Month*cLUSUnder24 + Over24Month*cLUSOver24 );
         ThisApplicTotal.Text := FloatToStrF(TotalLUThisApplic,ffFixed,6,2);
      except
         ThisApplicTotal.Text := '';
      end;

      { ----- End Animals to currently applying for ----- }

      { ----- Animals already applied for ----- }

      Under24Month  := 0;
      Over24Month   := 0;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT B.ApplicationDate As ApplicDate, (B.EventID), ');
            SQL.Add('                A.DateOfBirth                        ');
            SQL.Add('FROM BeefSub B, Animals A, Applications P            ');
            SQL.Add('WHERE (B.AnimalID=A.ID)                        ');
            SQL.Add('AND   (P.ApplicationID=B.ApplicationID)        ');
            SQL.Add('AND   (B.ApplicationID <> -1 )                 ');
            SQL.Add('AND   (B.PremiumType IN ("B","F","S"))         ');
            SQL.Add('AND   (EXTRACT(YEAR FROM B.ApplicationDate)= ' + IntToStr(cYear) + ')');
            SQL.Add('AND   (P.HerdID = '+ cbHerdID.Value +' )       ');
            Open;
            First;
            GenQuery.RecordCount;
            while NOT EOF do
               begin
                  NoOfDays := ( FieldByName('ApplicDate').AsDateTime - FieldByName('DateOfBirth').AsDateTime );
                  DeCodeDate( FieldByName('DateOfBirth').AsDateTime, nYear, nMonth, nDay );

                  if ( IsLeapYear ( nYear )) And
                     ( nMonth <= 2 ) And
                     ( nDay <=27 ) then
                     NoOfDays := NoOfDays-1;

                  if ( NoOfDays <= 730 ) then
                     Inc ( Under24Month )
                  else
                     Inc ( Over24Month );
                  Next;
               end;

            Close;
         end;

      try
         TotalLUThisYear := ( Under24Month * LUSUnder24 + Over24Month * LUSOver24 );
         TotalSoFarThisYear.Text := FloatToStrF(TotalLUThisYear,ffFixed,6,2);
      except
         TotalSoFarThisYear.Text := '';
      end;

      { ----- End Animals already applied for ----- }

   finally
      // Using the TempTable search for the Record for this herd
      with tExtDefaults do
         if NOT Locate('HerdId',cbHerdID.Value,[] ) then
            begin
               // Append Record
               Append;
               FieldByName('HerdID').AsInteger := StrToInt(cbHerdID.Value);
               DeCodeDate( EligDate.Date, nYear, nMonth, nDay );
               FieldByName('YearToRun').AsInteger := nYear;
               FieldByName('DateTo').AsDateTime := EligDate.Date;
               Post;
            end;
   end;

end;

procedure TfApplications.GetNosAppliedForThisYear;
var NoOfApplics : Integer;
    MaxNoApplics : Integer;     //KVB

begin
    ebFirstPrem.Text  := IntToStr(NoOfFirstPremAppliedFor);
    ebSecondPrem.Text := IntToStr(NoOfSecondPremAppliedFor);
    ebBullPrem.Text   := IntToStr(NoOfBullPremAppliedFor);
    NoOfApplics       := NoOfApplicsThisYear;
    ebNoApplic.Text   := IntToStr(NoOfApplics);

//    tExtDefaults.Edit;
//    tExtDefaults.FieldByName('NoSuckler').AsVariant := NoOfSucklerAvailable;
//    tExtDefaults.Post;

    // Limit for Herd is 12 applics a year per herd!!!!
    if NoOfApplics >= MaxNoApplicsPerHerd then
       begin
          ebNoApplic.font.Color := clRed;
          if NoOfApplics = MaxNoApplics then
             lMaxApplics.Caption := 'MAX'
          else
             lMaxApplics.Caption := 'OVER';
          lMaxApplics.Show;
       end
    else
       begin
          ebNoApplic.font.Color := clBlack;
          lMaxApplics.Hide;
       end;
end;

procedure TfApplications.bShowExtClick(Sender: TObject);
begin
   if sbExten.Down then
      begin
         Caption := 'Beef Premium Applications '+IntToStr(cThisYear)+' - Stocking Density Restriction';
         if CheckEligDate then
            begin
               LoadSuckQuotaNos;
               CheckSucklerNos;
               pExtensification.Show;
               pApps.Hide;
               Refresh;
               GetNosAppliedForThisYear;
               CalcLUS;
            end
         else
            begin
               sbExten.Down := FALSE;
               EligDate.SetFocus;
            end;
      end
   else
       begin
          Caption := 'Beef Premium Applications '+IntToStr(cThisYear)+'';
          try
             cbHerdID.SetFocus;
          except
          end;
          pApps.Show;
          pExtensification.Hide;
       end;
end;

procedure TfApplications.LUSetupClick(Sender: TObject);
begin
    WinData.CreateAndShowForm(TfExtDefaults);
    SetLUValues;
    CalcLUS;
end;

procedure TfApplications.dbeQuotaExit(Sender: TObject);
begin
    if tExtDefaults.FieldByName('AvgGallons').AsFloat = 0 then
       begin
          if NOT ( tExtDefaults.State in dsEditModes ) then
             tExtDefaults.Edit;
          if WhichReg = Ireland then
             tExtDefaults.FieldByName('AvgGallons').AsFloat := cGallsPerCow
          else
             tExtDefaults.FieldByName('AvgGallons').AsFloat := cLitresPerCow;
       end;
   CalcLUS;
end;

procedure TfApplications.dbeAvgGallonsEnter(Sender: TObject);
begin
    if tExtDefaults.FieldByName('AvgGallons').AsFloat <= 0 then
       begin
          tExtDefaults.Edit;
          if WhichReg = Ireland then
             tExtDefaults.FieldByName('AvgGallons').AsFloat := cGallsPerCow
          else
             tExtDefaults.FieldByName('AvgGallons').AsFloat := cLitresPerCow;
          tExtDefaults.Post;
       end;
end;

procedure TfApplications.CalcLUS;
var
   TotalLUS,
   LUS : Double;
begin
   try
      GroupBox2.SetFocus;
   except
   end;
   // Calculate the LUS for this year and current applic
   DoExtCalculations;
   if NOT ( tExtDefaults.State in dsEditModes ) then
      tExtDefaults.Edit;

   LUS := 0;
   // Cow LUS
   if ( tExtDefaults.FieldByName('AvgGallons').AsFloat > 0 ) then
      begin
         LUS := ( ( tExtDefaults.FieldByName('MilkQuota').AsFloat / tExtDefaults.FieldByName('AvgGallons').AsFloat ) * LUSCows );
         tExtDefaults.FieldByName('LUSCow').AsString := FloatToStrF(LUS,ffFixed,8,2);
      end
   else
      tExtDefaults.FieldByName('LUSCow').AsFloat := 0;

   // Accumulate the Total
   TotalLUS := LUS;

   // Ewe LUS
   LUS := ( tExtDefaults.FieldByName('NumEwes').AsFloat * LUSEwes );
   tExtDefaults.FieldByName('LUSEwe').AsString := FloatToStrF(LUS,ffFixed,8,2);
   TotalLUS := TotalLUS + LUS;

   // Suckler Cows
   LUS := ( tExtDefaults.FieldByName('NoSuckler').AsFloat * 1.0 );
   tExtDefaults.FieldByName('LUSSuckler').AsString := FloatToStrF(LUS,ffFixed,8,2);
   TotalLUS := TotalLUS + LUS;

   // Suckler Heifers
   LUS := ( tExtDefaults.FieldByName('NoSucklerHeifers').AsFloat * 0.6 );
   tExtDefaults.FieldByName('LUSSucklerHeifers').AsString := FloatToStrF(LUS,ffFixed,8,2);
   TotalLUS := TotalLUS + LUS;

   // Add in the Beef LUS
   TotalLUS := TotalLUS + TotalLUThisYear + TotalLUThisApplic;
   LUTotal.Text := FloatToStrF(TotalLUS,ffFixed,8,2);

   Less20.Text := FloatToStrF(( tExtdefaults.FieldByName('FHect').AsFloat * StockDenLU), ffFixed, 8, 2); //  SP 2002
   if ( TotalLUS < tExtdefaults.FieldByName('FHect').AsFloat * StockDenLU ) then  //  SP 2002
      Less20.Font.Color := clGreen
   else
      Less20.Font.Color := clRed;

   if cbHerdID.Value <> '0' then
      if tExtDefaults.FieldByName('FHect').AsFloat <= 0 then
         begin
            MessageDlg('Please input you Forage Hectares',mtWarning,[mbOK],0);
            try
              dbeHectares.SetFocus;
            except
            end;
         end;
end;

procedure TfApplications.DBEdit2Exit(Sender: TObject);
begin
   CalcLUS;
end;

procedure TfApplications.NoSucklerHeifersExit(Sender: TObject);
begin
   if SuckApplicMade then
      begin
         tExtDefaults.DisableControls;
         with tExtDefaults do
            begin
               if FieldByName('NoSuckler').AsInteger < TotalSuckCows then
                   ResetSucklerNos(True)
               else if (FieldByName('NoSuckler').AsInteger + FieldByName('NoSucklerHeifers').AsInteger) <> TotalSuckAnimals then
                   ResetSucklerNos(True)
               else
                  CalcLUS;
            end;
         tExtDefaults.EnableControls;
      end
   else
      begin
         if tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger < WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger then
            begin
               tExtDefaults.Edit;
               tExtDefaults.FieldByName('NoSuckler').AsInteger := WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger-tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger;
               tExtDefaults.Post;
            end;
         ValidateQuotaEdit;
      end;
end;

procedure TfApplications.NoSucklersExit(Sender: TObject);
begin
   if SuckApplicMade then
      begin
         tExtDefaults.DisableControls;
         if tExtDefaults.Active then
            begin
               if (TotalSuckAnimals > 0) then
                  if tExtDefaults.Locate('HerdID', cbHerdID.Value, [loCaseInsensitive] ) then
                     begin
                        tExtDefaults.Edit;
                        tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger := TotalSuckAnimals - tExtDefaults.FieldByName('NoSuckler').AsInteger;
                        tExtDefaults.Post;
                     end;
            end;

         with tExtDefaults do
            begin
               if FieldByName('NoSuckler').AsInteger < TotalSuckCows then
                   ResetSucklerNos(True)
               else if (FieldByName('NoSuckler').AsInteger > TotalSuckAnimals) then
                   ResetSucklerNos(True)
               else if (FieldByName('NoSuckler').AsInteger + FieldByName('NoSucklerHeifers').AsInteger) <> TotalSuckAnimals then
                   ResetSucklerNos(True)
               else
                  CalcLUS;
            end;
         tExtDefaults.EnableControls;
      end
   else
      begin
         if tExtDefaults.FieldByName('NoSuckler').AsInteger < WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger then
            begin
               tExtDefaults.Edit;
               tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger := WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger-tExtDefaults.FieldByName('NoSuckler').AsInteger;
               tExtDefaults.Post;
            end;
         ValidateQuotaEdit;
      end;
end;

procedure TfApplications.EligDateChange(Sender: TObject);
begin
   if PremTable.Active then
      if ( PremTable.RecordCount > 0 ) then
         EraseTable;
end;

procedure TfApplications.dbeHectaresExit(Sender: TObject);
begin
   if tExtDefaults.FieldByName('FHect').AsFloat > 0 then
      CalcLUS;
end;

procedure TfApplications.NationalIDNumber1Click(Sender: TObject);
begin
     gSortBy.ItemIndex := 0;
     NationalIDNumber1.Checked := True;
end;

procedure TfApplications.AnimalNumber1Click(Sender: TObject);
begin
     gSortBy.ItemIndex := 1;
     AnimalNumber1.Checked := True;
end;

procedure TfApplications.DateOfBirth1Click(Sender: TObject);
begin
     gSortBy.ItemIndex := 2;
     DateOfBirth1.Checked := True;
end;

procedure TfApplications.PremiumType1Click(Sender: TObject);
begin
     gSortBy.ItemIndex := 3;
     PremiumType1.Checked := True;
end;

procedure TfApplications.Ascending1Click(Sender: TObject);
begin
     gOrderBy.ItemIndex := 0;
     Ascending1.Checked := True;
end;

procedure TfApplications.Descending1Click(Sender: TObject);
begin
     gOrderBy.ItemIndex := 1;
     Descending1.Checked := True;
end;

procedure TfApplications.sbHelpClick(Sender: TObject);
begin
    WinData.HTMLHelp('applications.htm');
end;

procedure TfApplications.FormShow(Sender: TObject);
begin
   //WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,cbHerdID.Value);
   gSortBy.ItemIndex := 0;
   NationalIDNumber1.Checked := True;
   EligDate.Date := Date;
   ApplicDate.Date := Date;
end;

function TfApplications.CheckEligDate : Boolean;
begin
   // Check the Date is within the Current Year
   RESULT := True;
   DecodeDate(EligDate.Date,cYear,cMonth,cDay);
end;


procedure TfApplications.ebFirstPremChange(Sender: TObject);
begin
   if WhichReg = Ireland then
      begin
         if (Sender AS TCurrencyEdit).Value > 180 then
            (Sender AS TCurrencyEdit).Font.Color := clRed
         else
            (Sender AS TCurrencyEdit).Font.Color := clBlack;
      end
end;

procedure TfApplications.CheckPremClaimLimits;
var
   First,
   Second,
   Bull,
   NoApplics : Integer;
   TotalClaimed : array [0..2] of Integer;
begin
   FillChar(TotalClaimed, SizeOf(TotalClaimed),0);

   TotalClaimed[0] := GetNoOfBullPremAppliedFor;
   TotalClaimed[1] := GetNoOfFirstPremAppliedFor;
   TotalClaimed[2] := GetNoOfSecondPremAppliedFor;

   // 12 Applics per year per herd!!
   NoApplics := GetNoOfApplicsThisYear;
   if TotalClaimed[0] > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed, you have exceeded the '+IntToStr(MaxPremLimit)+' limit,'+#13+
                    'for the Bull Premiums',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end
   else if TotalClaimed[1] > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed, you have exceeded the '+IntToStr(MaxPremLimit)+' limit,'+#13+
                   'for the First Age Premiums',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end
   else if ((TotalClaimed[0]) + (TotalClaimed[1])) > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed, you have exceeded the '+IntToStr(MaxPremLimit)+' limit,'+#13+
                    'for the combined Bull and First Age Premiums',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end
   else if TotalClaimed[2] > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed, you have exceeded the '+IntToStr(MaxPremLimit)+' limit,'+#13+
                    'for the Second Age Premiums',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end;

   // Now check the combined animals applied and animals being applied!
   if eBull.Text <> '' then
      Bull   := StrToInt(eBull.Text)
   else
      Bull := 0;
   if e10Month.Text <> '' then
      First  := StrToInt(e10Month.Text)
   else
      First := 0;
   if e22Month.Text <> '' then
      Second := StrToInt(e22Month.Text)
   else
      Second := 0;

   if (TotalClaimed[0]+Bull) > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed with the current number of Bulls.'+#13+
                    'Please remove "'+ IntToStr(TotalClaimed[0]+Bull-MaxPremLimit) +'" before continuing.',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end
   else if (TotalClaimed[1]+First) > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed with the current number of First Age Steers.'+#13+
                    'Please remove "'+ IntToStr(TotalClaimed[1]+First-MaxPremLimit) +'" before continuing.',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end
   else if ((TotalClaimed[0]+Bull) + (TotalClaimed[1]+First)) > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed with the current number of Bulls && First Age Steers.'+#13+
                    'Please remove "'+ IntToStr((TotalClaimed[0]+ TotalClaimed[1] + (Bull+First)) -MaxPremLimit) +'" before continuing.',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end
   else if (TotalClaimed[2]+Second) > MaxPremLimit then
      begin
         MessageDlg('The Application cannot be processed with the current number of Second Age Steers.'+#13+
                    'Please remove "'+ IntToStr(TotalClaimed[2] + Second-MaxPremLimit) +'" before continuing.',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end;
   if NoApplics >= MaxNoApplicsPerHerd then
      begin
         MessageDlg('The Application cannot be processed,'+#13+
                    'you have '+IntToStr(NoApplics)+' applications already made this year,'+#13+
                    'for herd '+cbHerdID.Text+'',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end;
end;

procedure TfApplications.ebNoApplicChange(Sender: TObject);
begin
   if WhichReg = Ireland then
      begin
         if (Sender AS TCurrencyEdit).Value > 12 then
            (Sender AS TCurrencyEdit).Font.Color := clRed
         else
            (Sender AS TCurrencyEdit).Font.Color := clBlack;
      end;
end;

procedure TfApplications.SetPanel;
begin
   //Set the Main detail Panel
   if WhichReg = Ireland then
      begin
         rgPremType.Visible := False;
         gbColours.Left     := rgPremType.Left;
         lEligRetentionDate.Caption := 'Become Eligible on or Before';
      end
   else if WhichReg = NIreland then
      begin
         rgPremType.Visible := True;
         gbColours.Left     := 165;
         lEligRetentionDate.Caption := 'Retention Start Date';
      end;
end;

procedure TfApplications.rgPremTypeClick(Sender: TObject);
begin
   sbSelect.Enabled  := True;
   if (rgPremtype.ItemIndex = 1) then
      begin
         e10Month.Visible  := True;
         l10MonthT.Visible := True;
         l10Month.Visible  := True;
         bSelectAnimalsClick(Sender);
      end
   else
      begin
         e10Month.Visible  := False;
         l10MonthT.Visible := False;
         l10Month.Visible  := False;
      end;
   if (rgPremtype.ItemIndex = 2) then
      begin
         e22Month.Visible  := True;
         l22MonthT.Visible := True;
         l22Month.Visible  := True;
         e22Month.Top      := e10Month.Top;
         l22MonthT.Top     := l10MonthT.Top;
         l22Month.Top      := l10Month.Top;
         bSelectAnimalsClick(Sender);
      end
   else
      begin
         e22Month.Visible  := False;
         l22MonthT.Visible := False;
         l22Month.Visible  := False;
      end;
   if (rgPremtype.ItemIndex = 3) then
      begin
         eBull.Visible     := True;
         lBullT.Visible    := True;
         lbull.Visible     := True;
         eBull.Top         := e10Month.Top;
         lBullT.Top        := l10MonthT.Top;
         lbull.Top         := l10Month.Top;
         bSelectAnimalsClick(Sender);
      end
   else
      begin
         eBull.Visible     := False;
         lBullT.Visible    := False;
         lbull.Visible     := False;
      end;

   if (rgPremtype.ItemIndex = 0) then
      begin
         e10Month.Top  := 18;
         l10MonthT.Top := 20;
         l10Month.Top  := 20;

         e10Month.Visible  := True;
         l10MonthT.Visible := True;
         l10Month.Visible  := True;

         e22Month.Top  := 44;
         l22MonthT.Top := 48;
         l22Month.Top  := 48;

         e22Month.Visible  := True;
         l22MonthT.Visible := True;
         l22Month.Visible  := True;

         eBull.Top     := 70;
         lBullT.Top    := 76;
         lbull.Top     := 76;

         eBull.Visible     := True;
         lBullT.Visible    := True;
         lbull.Visible     := True;
         bSelectAnimalsClick(Sender);
      end;
end;

function TfApplications.StripSpaces(str: String): String;
var
   P : Integer;
begin
   RESULT := Str;
   while Pos(' ', str) > 0 do
      begin
         P := Pos(' ', str);
         Delete(str, P, 1);
      end;
   RESULT := Str;
end;

procedure TfApplications.GetNIAppsThisYear;
begin
   with GenQuery do
      begin
         case rgPremType.ItemIndex of
            1 : begin
                   SQL.Clear;
                   SQL.Add('SELECT COUNT(ApplicationID) AppCount');
                   SQL.Add('FROM Applications A');
                   SQL.Add('WHERE (A.PremType = "F")');
                   SQL.Add('AND   (A.HerdID = '+cbHerdID.Value+')');
                   SQL.Add('AND   (EXTRACT(Year From A."Date") =' + IntToStr(cYear) + ')');
                   Open;

                   // Max 6 First Age per herd/per year
                   if GenQuery.FieldByName('AppCount').AsInteger >= Max1stApplicNI then
                      begin
                         MessageDlg('Unable to proceed with application.'+#13+
                                    'Your First Age Beef Special Premia Limit of '+IntToStr(Max1stApplicNI)+' applications per year has been reached',mtInformation,[mbOK],0);
                         SysUtils.Abort;
                      end;
                end;
            2 : begin
                   SQL.Clear;
                   SQL.Add('SELECT COUNT(ApplicationID) AppCount');
                   SQL.Add('FROM Applications A');
                   SQL.Add('WHERE (A.PremType = "S")');
                   SQL.Add('AND   (A.HerdID = '+cbHerdID.Value+')');
                   SQL.Add('AND   (EXTRACT(Year From A."Date") =' + IntToStr(cYear) + ')');
                   Open;

                   // Max 10 Second Age per herd/per year
                   if GenQuery.FieldByName('AppCount').AsInteger >= Max2ndApplicNI then
                      begin
                         MessageDlg('Unable to proceed with application.'+#13+
                                    'Your Second Age Beef Special Premia Limit of '+IntToStr(Max2ndApplicNI)+' applications per year has been reached',mtInformation,[mbOK],0);
                         SysUtils.Abort;
                      end;
                end;
            3 : begin
                   SQL.Clear;
                   SQL.Add('SELECT COUNT(A.ApplicationID) AppCount');
                   SQL.Add('FROM Applications A');
                   SQL.Add('WHERE (A.PremType = "B")');
                   SQL.Add('AND   (A.HerdID = '+cbHerdID.Value+')');
                   SQL.Add('AND   (EXTRACT(Year From A."Date") =' + IntToStr(cYear) + ')');
                   Open;

                   // Max 6 bull per herd/per year
                   if GenQuery.FieldByName('AppCount').AsInteger >= MaxBullApplicNI then
                      begin
                         MessageDlg('Unable to proceed with application.'+#13+
                                    'Your Beef Special Premia Limit of '+IntToStr(MaxBullApplicNI)+' applications per year has been reached',mtInformation,[mbOK],0);
                         SysUtils.Abort;
                      end;
                end;
         end;
      end;
end;

procedure TfApplications.SetNIDataSet(SetActive: Boolean);
begin
   with fNIPremApplics, fApplications do
      if SetActive then
         begin
            QRDBText5.DataSet := qNIPrem;
            QRDBText6.DataSet := qNIPrem;
            QRDBText7.DataSet := qNIPrem;
            QRDBText8.DataSet := qNIPrem;
            QRDBText9.DataSet := qNIPrem;
            QRDBText10.DataSet := qNIPrem;
            QRDBText11.DataSet := qNIPrem;
            QRDBText12.DataSet := qNIPrem;
            QRDBText13.DataSet := qNIPrem;
            QRDBText14.DataSet := qNIPrem;
            QRDBText15.DataSet := qNIPrem;
            QRDBText16.DataSet := qNIPrem;
            QRDBText17.DataSet := qNIPrem;
            QRDBText18.DataSet := qNIPrem;

            QRDBText19.DataSet := qUKIrishPrem;
            QRDBText20.DataSet := qUKIrishPrem;
            QRDBText21.DataSet := qUKIrishPrem;
            QRDBText22.DataSet := qUKIrishPrem;
            QRDBText23.DataSet := qUKIrishPrem;
            QRDBText24.DataSet := qUKIrishPrem;
            QRDBText25.DataSet := qUKIrishPrem;
            QRDBText26.DataSet := qUKIrishPrem;
            QRDBText27.DataSet := qUKIrishPrem;
            QRDBText28.DataSet := qUKIrishPrem;
            QRDBText29.DataSet := qUKIrishPrem;
            QRDBText30.DataSet := qUKIrishPrem;
            QRDBText31.DataSet := qUKIrishPrem;
            QRDBText32.DataSet := qUKIrishPrem;
         end
      else
         begin
            QRDBText5.DataSet := nil;
            QRDBText6.DataSet := nil;
            QRDBText7.DataSet := nil;
            QRDBText8.DataSet := nil;
            QRDBText9.DataSet := nil;
            QRDBText10.DataSet := nil;
            QRDBText11.DataSet := nil;
            QRDBText12.DataSet := nil;
            QRDBText13.DataSet := nil;
            QRDBText14.DataSet := nil;
            QRDBText15.DataSet := nil;
            QRDBText16.DataSet := nil;
            QRDBText17.DataSet := nil;
            QRDBText18.DataSet := nil;

            QRDBText19.DataSet := nil;
            QRDBText20.DataSet := nil;
            QRDBText21.DataSet := nil;
            QRDBText22.DataSet := nil;
            QRDBText23.DataSet := nil;
            QRDBText24.DataSet := nil;
            QRDBText25.DataSet := nil;
            QRDBText26.DataSet := nil;
            QRDBText27.DataSet := nil;
            QRDBText28.DataSet := nil;
            QRDBText29.DataSet := nil;
            QRDBText30.DataSet := nil;
            QRDBText31.DataSet := nil;
            QRDBText32.DataSet := nil;
         end;
end;

function TfApplications.StripPunctuation(StrToStrip: String): String;
var
   i,
   LenOfStr : Integer;
   TempStr  : String;
begin
   TempStr := StrToStrip;
   LenOfStr := Length(TempStr);
   if (LenOfStr > 0) then
      for i := 1 to LenOfStr do
         if NOT (TempStr[i] IN ['A'..'Z','a'..'z','0'..'9']) then
            Delete(TempStr,i,1);
   Result := TempStr;
end;

function TfApplications.PadRight(Str: String; Len: Integer): String;
begin
   while Length(Str) < Len do
      Str := Str + ' ';
   Result := Str;
end;

function TfApplications.NumSuckApplied(var Cows,
  Heifers: Integer): Boolean;
begin

end;

procedure TfApplications.DBEdit2Change(Sender: TObject);
begin
//   CalcLUS;
end;

procedure TfApplications.CheckSucklerNos;
begin

   WinData.tSApplic.Open;
   SuckApplicMade := WinData.tSApplic.Locate('HerdID;YearOfApplic', VarArrayOf([StrToInt(cbHerdID.Value), cThisYear]), [loCaseInsensitive] );
   WinData.tSApplic.Close;

   TotalSuckCows    := 0;
   TotalSuckHeifers := 0;
   TotalSuckAnimals := 0;

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT COUNT(A.AnimalID) Result');
         SQL.Add('FROM sAppliedFor A          ');
         SQL.Add('LEFT JOIN sApplic S ON (S.ID = A.ApplicationID) ');
         SQL.Add('WHERE (S.HerdID = '+ cbHerdID.Value +')');
         SQL.Add('AND   (S.YearOfApplic = '+IntToStr(cThisYear) + ')');
         SQL.Add('AND   (A.LactNo <> 0) ');
         Open;

         TotalSuckCows := GenQuery.FieldByName('Result').AsInteger;
{
         if TotalSuckCows > 0 then
            begin
               tExtDefaults.Edit;
               tExtDefaults.FieldByName('NoSuckler').AsInteger := TotalSuckCows;
               tExtDefaults.Post;
            end;
}
         Close;

         SQL.Clear;
         SQL.Add('SELECT COUNT(A.AnimalID) Result');
         SQL.Add('FROM sAppliedFor A          ');
         SQL.Add('LEFT JOIN sApplic S ON (S.ID = A.ApplicationID) ');
         SQL.Add('WHERE (S.HerdID = '+ cbHerdID.Value +')');
         SQL.Add('AND   (S.YearOfApplic = '+IntToStr(cThisYear) + ')');
         SQL.Add('AND   (A.LactNo = 0) ');
         Open;

         TotalSuckHeifers := GenQuery.FieldByName('Result').AsInteger;
{         if TotalSuckHeifers > 0 then
            begin
               tExtDefaults.Edit;
               tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger := TotalSuckHeifers;
               tExtDefaults.Post;
            end;
}
         Close;

         TotalSuckAnimals := TotalSuckCows+TotalSuckHeifers;

         if tExtDefaults.Locate('HerdID', StrToInt(cbHerdID.Value), [loCaseInsensitive] ) then
            if tExtDefaults.FieldByName('NoSuckler').AsInteger + tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger <> TotalSuckAnimals then
               if SuckApplicMade then //
                  ResetSucklerNos(False);
      end;
end;

procedure TfApplications.CheckForageHectares;
begin
   if tExtDefaults.Active then
      begin
         CalcLUS;
         if tExtDefaults.Locate('HerdID', StrToInt(cbHerdID.Value), [loCaseInsensitive]) then
            if tExtDefaults.FieldByName('FHect').AsFloat <= 0 then
               begin
                  MessageDlg('Please input you Forage Hectares',mtError,[mbOK],0);
                  SysUtils.Abort;
               end
            else if LUTotal.Value > Less20.Value then // For less20 to have a value FHect must be > 0
               begin
                  MessageDlg('Unable to proceed with Application - you have exceeded your Stocking Density Limit for this year.'+#13+
                             'Check figures for forage hectares and various premia.',mtError,[mbOK],0);
                  SysUtils.Abort;
               end;
      end;
end;

procedure TfApplications.LoadSuckQuotaNos;
begin
   if not SuckApplicMade then
      //if ((tExtDefaults.FieldByName('NoSuckler').AsInteger <= 0 ) and (tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger <= 0)) then
      { SP 10/12/2002 Get Quota if applic is not made. Put Quota into NoSuckler Field  }
      try
         if WinData.OwnerFile.Locate('ID', StrToInt(cbHerdID.Value), []) then
            if WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger > 0 then
               begin
                  tExtDefaults.Edit;
                  tExtDefaults.FieldByName('NoSuckler').AsInteger  := WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger;
                  tExtDefaults.FieldByName('LUSSuckler').AsString  := FloatToStrF(WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger*cLUSSuckler,ffFixed,8,2);
                  tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger := 0;
                  tExtDefaults.FieldByName('LUSSucklerHeifers').AsFloat  := 0;
                  tExtDefaults.Post;
               end
            else
               begin
                  tExtDefaults.Edit;
                  tExtDefaults.FieldByName('NoSuckler').AsInteger := 0;
                  tExtDefaults.FieldByName('LUSSuckler').AsFloat  := 0;
                  tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger := 0;
                  tExtDefaults.FieldByName('LUSSucklerHeifers').AsFloat  := 0;
                  tExtDefaults.Post;
               end;
      except
      end;
end;

procedure TfApplications.ValidateQuotaEdit;
begin
   // No Application made suckler quota being used instead.
   // Only allow an even divid of the quota between Cows and Heifers.
   // if division of quota <> equal to orginal quota then reset to orginal quota.
   if WinData.OwnerFile.Locate('ID', StrToInt(cbHerdID.Value), []) then
      if WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger > 0 then // Quota is there
         begin
            if tExtDefaults.FieldByName('NoSuckler').AsInteger +
               tExtDefaults.FieldByName('NoSucklerHeifers').AsInteger <> WinData.OwnerFile.FieldByName('SucklerQuota').AsInteger then
               LoadSuckQuotaNos;
         end;
   CalcLUS;
end;

end.