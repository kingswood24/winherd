unit uSuckApplic;
{
    ** New Suckler Cow Rules for 2002
       1) < 14 cows, user can apply up to 40% Max Heifers.
       2) >= 14 cows, user must apply for at least 15% and no more than 40%
       3) The 15% cannot calve during retention period, if they do then use substitute event.
     **

  ----------------------------------------------------------------------------
  SP 10/10/2002:-

  Remove Minimum Heifer Requirement:- Ignore Requirement if NIreland Herd.
  New NI Applic Form for print and preview.

  SP 10/10/2002.

  ----------------------------------------------------------------------------

  SP 08/01/2003:-

  function AllEligibleAnimalsUnderQuota: Boolean;

  Changed to take account of all animals being applied for, and not all eligible
  animals in the herd at application date.

  SP 08/01/2003.

  ----------------------------------------------------------------------------

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, ToolEdit, StdCtrls, Menus, RxLookup, RXCtrls, ComCtrls,
  ToolWin, Grids, DBGrids, RXDBCtrl, DBTables, Db, DBCtrls;

type
  TSuckApplic = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbSelect: TRxSpeedButton;
    sbSaveApplication: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbGridOptions: TRxSpeedButton;
    ToolButton4: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton8: TToolButton;
    Panel4: TPanel;
    Label8: TLabel;
    cbHerdID: TRxDBLookupCombo;
    pmSort: TPopupMenu;
    NationalIDNumber1: TMenuItem;
    AnimalNumber1: TMenuItem;
    DateOfBirth1: TMenuItem;
    N1: TMenuItem;
    Ascending1: TMenuItem;
    Descending1: TMenuItem;
    Panel1: TPanel;
    Label4: TLabel;
    RetentionDate: TEdit;
    ApplicDate: TDateEdit;
    Label3: TLabel;
    ToolButton5: TToolButton;
    Bevel1: TBevel;
    Label1: TLabel;
    TotalAnimals: TEdit;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    eTotCows: TEdit;
    eTotHeif: TEdit;
    lHeiferRange: TLabel;
    GridToolBar: TPanel;
    sbPreview: TRxSpeedButton;
    sbPrintApplic: TRxSpeedButton;
    Bevel3: TBevel;
    sbRemove: TRxSpeedButton;
    Bevel4: TBevel;
    sbDelHeifer: TRxSpeedButton;
    sbBlockRemove: TRxSpeedButton;
    eBlockRemove: TMaskEdit;
    pGrids: TPanel;
    CowGrid: TRxDBGrid;
    HeiferGrid: TRxDBGrid;
    Splitter1: TSplitter;
    PremTable: TTable;
    dsPremSource: TDataSource;
    qApplics: TQuery;
    dsApplication: TDataSource;
    GenQuery: TQuery;
    dsGetAnimals: TDataSource;
    qGetAnimals: TQuery;
    qHeifers: TQuery;
    dsHeifers: TDataSource;
    Bevel6: TBevel;
    lMax: TLabel;
    eHMaxallowed: TEdit;
    Bevel10: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel11: TBevel;
    Label2: TLabel;
    Bevel13: TBevel;
    Cows: TTable;
    Heifers: TTable;
    Bevel12: TBevel;
    lCowRange: TLabel;
    lMin2: TLabel;
    eCMinAllowed: TEdit;
    pMilkQuota: TPanel;
    Label11: TLabel;
    LastCalving: TMenuItem;
    SuckQuota: TEdit;
    MilkQuota: TEdit;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Label7: TLabel;
    procedure sbRemoveClick(Sender: TObject);
    procedure sbDelHeiferClick(Sender: TObject);
    procedure sbBlockRemoveClick(Sender: TObject);
    procedure sbSaveApplicationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbHerdIDChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NationalIDNumber1Click(Sender: TObject);
    procedure sbSelectClick(Sender: TObject);
    procedure sbPreviewClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SuckQuotaExit(Sender: TObject);
    procedure CowsAfterDelete(DataSet: TDataSet);
    procedure HeifersAfterDelete(DataSet: TDataSet);
    procedure MilkQuotaExit(Sender: TObject);
    procedure AnimalNumber1Click(Sender: TObject);
    procedure DateOfBirth1Click(Sender: TObject);
    procedure LastCalvingClick(Sender: TObject);
    procedure Ascending1Click(Sender: TObject);
    procedure MilkQuotaChange(Sender: TObject);
    procedure ApplicDateChange(Sender: TObject);
  private
    { Private declarations }
//    Sorted : Boolean;
//    SortFieldName,
//    OrderFieldName,
    orderbystring,
    sortbystring : String;
    ApplicYear,
    MaxGroup : Integer;
//    TotalThisYear : Integer;
    ViewIt        : Boolean;
//    TwoYear,
//    FormNo,
    EightMonth    : String;
    Restricted : Boolean;
    MaxHeifersAllowed,
    MinHeifersAllowed : Double;
    CowCount : Integer;
    
//    SingleRemove : Boolean;
    procedure CalcRetention;
    procedure OutputReport;
    procedure EraseTable;
    procedure GetAnimalCounts;
    procedure RunApplicQuery;
    procedure SetApplicYear;
    procedure FillApplicQuery;
    procedure FillGrids;
    procedure GetCows;
    procedure GetHeifers;
    function CalcEightMonth : TDateTime;
    procedure CalcHeifersAllowed(AnimalCount : Variant);
    procedure ResetFields;
    procedure CheckHeiferCount;
//    function AlreadyApplied : Boolean;
    function UnderQuota : Boolean;
    function AllEligibleAnimalsUnderQuota : Boolean;
    procedure GetQuotas;
    procedure ResetRanges;
    procedure ApplicMadeThisYear;
    procedure CheckAppDate;
  public
    { Public declarations }
    SavedApplication : Boolean;
  end;

var
  SuckApplic: TSuckApplic;

implementation
uses
   GenTypesConst,
   DairyData,
   uSC2001,
   Def,
   uNISuckForm;

const
   SixMonths = 6;
   HeiferRange = 14;

var
   SuckRep : TfSC2001;
   TotAnimals : Integer;
   RegCountry : TCountry;

{$R *.DFM}

procedure TSuckApplic.sbRemoveClick(Sender: TObject);
var
   Bookmark : TBookMark;
   nBookmark : Integer;
begin
   nBookmark := 0;
   // SP '04
   if not (dsGetAnimals.Dataset.Bof) or not (dsGetAnimals.Dataset.eof) then
      try
         Bookmark := dsGetAnimals.Dataset.GetBookmark;
         dsGetAnimals.Dataset.Disablecontrols;
         if dsGetAnimals.Dataset.RecNo > 1 then
            begin
               dsGetAnimals.Dataset.Next;
               if dsGetAnimals.Dataset.eof then
                  begin
                     dsGetAnimals.Dataset.Last;
                     dsGetAnimals.Dataset.Prior;
                  end;
               nBookmark := dsGetAnimals.Dataset.FieldByName('AID').AsInteger;
               dsGetAnimals.Dataset.GotoBookmark(Bookmark);
            end;
         dsGetAnimals.Dataset.FreeBookmark(Bookmark);
      finally
         dsGetAnimals.Dataset.Enablecontrols;
      end;

   if PremTable.RecordCount > 0 then
      begin
         // delete animal from table
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE from ' + PremTable.TableName );
               SQL.Add('WHERE NatID = "' + CowGrid.Columns.Grid.SelectedField.AsString + '" ');
               ExecSQl;
            end;
      end
   else
      messagedlg('Please select animals for application',mtError,[mbOK],0);

   // refresh grid and counts
   FillGrids;
   GetAnimalCounts;
   if not (dsGetAnimals.Dataset.Bof) or not (dsGetAnimals.Dataset.eof) then
      try
         dsGetAnimals.Dataset.Disablecontrols;
         if nBookmark > 0 then
            dsGetAnimals.Dataset.Locate('AID', nBookmark, []); // Try locate animal previously bookmarked.
      finally
         dsGetAnimals.Dataset.Enablecontrols;
      end;
end;

procedure TSuckApplic.sbDelHeiferClick(Sender: TObject);
var
   Bookmark : TBookMark;
   nBookmark : Integer;
begin
   { SP 10/10/2002 }
   nBookmark := 0;

{  Removed SP '04

   if RegCountry = Ireland then
      if (StrToInt(eTotHeif.Text) - 1) < StrToInt(eHMinAllowed.Text) then
          begin
             MessageDlg('Unable to remove '+eTotHeif.Text+' heifers,'+ #13 +
                        'there must be at least '+eHMinAllowed.Text+' applied for',mtWarning,[mbOK],0);
             Exit;
          end;
}
   // SP '04
   if not (dsHeifers.Dataset.Bof) or not (dsHeifers.Dataset.eof) then  // enable the grid display
      try
         Bookmark := dsHeifers.Dataset.GetBookmark;  // Bookmark the current animal to be removed.
         dsHeifers.Dataset.Disablecontrols;
         if dsHeifers.Dataset.RecNo > 1 then // if the current animal is not the first on the grid proceed
            begin
               dsHeifers.Dataset.Next; // Get the next animal onm grid.
               if dsHeifers.Dataset.eof then // if not at end of grid
                  begin
                     dsHeifers.Dataset.Last; // go back to last animal
                     dsHeifers.Dataset.Prior; // now go to previous animal
                  end;
               nBookmark := dsHeifers.Dataset.FieldByName('AID').AsInteger; // This is animal we want to focus back on after delete is complete.
               dsHeifers.Dataset.GotoBookmark(Bookmark); // go to the bookmark for current animal to be deleted.
            end;
         dsHeifers.Dataset.FreeBookmark(Bookmark); // free the current bookmark for animal to be deleted.
      finally
         dsHeifers.Dataset.Enablecontrols; // enable the grid display.
      end;

   if PremTable.RecordCount > 0 then
      begin
        // delete animal from table
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE from ' + PremTable.TableName );
               SQL.Add('WHERE NatID = "' + (HeiferGrid.Columns.Grid.SelectedField.AsString) + '" ');
               ExecSQl;
            end;
      end
   else
      Messagedlg('Please select animals for application',mtError,[mbOK],0);

   // refresh grid and counts
   FillGrids;
   GetAnimalCounts;
   // SP '04
   if not (dsHeifers.Dataset.Bof) or not (dsHeifers.Dataset.eof) then // if animals exist
      try
         dsHeifers.Dataset.Disablecontrols;
         if nBookmark > 0 then
            dsHeifers.Dataset.Locate('AID', nBookmark, []); // Try locate animal previously bookmarked.
      finally
         dsHeifers.Dataset.Enablecontrols;
      end;
end;

procedure TSuckApplic.sbBlockRemoveClick(Sender: TObject);
var
   i,
   NoToRemove : integer;
begin
   { SP 10/10/2002 }
   NoToRemove := StrToInt(Windata.StripAllSpaces(eBlockRemove.Text));
   if NoToRemove > StrToInt(eTotHeif.Text) then
      messagedlg('Not enough heifers left to remove',mtError,[mbOK],0);
{   else if RegCountry = Ireland then
        if CowCount >= HeiferRange then
           begin
              if StrToInt((eTotHeif.Text))-NoToRemove < StrToInt(eHMinAllowed.Text) then
                 begin
                    MessageDlg('Unable to remove '+IntToStr(NoToRemove)+' heifers,'+ #13 +
                               'there must be at least '+eHMinAllowed.Text+' applied for',mtWarning,[mbOK],0);
                    Exit;
                 end;
           end;
}
   // remove multiple heifers
   for i := 1 to NoToRemove do
      sbDelHeiferClick(Sender);
end;

procedure TSuckApplic.sbSaveApplicationClick(Sender: TObject);
var
   RetentionDate,
   ApplicationDate : TDateTime;
   i : Integer;
begin
   ApplicMadeThisYear; // Make sure Suck App hasn't been claimed before!
   { SP 10/10/2002 }
   try
      ApplicationDate := ApplicDate.Date;
      RetentionDate   := IncMonth(ApplicDate.Date+1,SixMonths);

      WinData.tSAppliedFor.Open;
      WinData.tSApplic.Open;
      WinData.tSApplic.Append;
      WinData.tSApplic.FieldByName('DateOfApplic').Value := ApplicDate.Date;
      WinData.tSApplic.FieldByName('RetensionDate').Value := RetentionDate;
      WinData.tSApplic.FieldByName('YearOfApplic').Value := ApplicYear;

      if Length(cbHerdID.Value) > 0 then
         WinData.tSApplic.FieldByName('HerdID').Value := cbHerdID.Value;
      WinData.tSApplic.FieldByName('Description').Value := 'Suckler Premium Application';

{ Removed SP '04

      if eHMinAllowed.Visible then
         WinData.tSApplic.FieldByName('MinHeifer').AsInteger := StrToInt(eHMinAllowed.Text)
      else
         WinData.tSApplic.FieldByName('MinHeifer').AsInteger := 0;
}
      WinData.tSApplic.FieldByName('MinHeifer').AsInteger := 0;

      // Max heifers is always applicable.
      WinData.tSApplic.FieldByName('MaxHeifer').AsInteger      := StrToInt(eHMaxallowed.Text);
      WinData.tSApplic.FieldByName('HeifersApplied').AsInteger := StrToInt(eTotHeif.Text);
      WinData.tSApplic.FieldByName('CowsApplied').AsInteger    := StrToInt(eTotCows.Text);
      WinData.tSApplic.Post;

      PremTable.First;
      while ( NOT PremTable.EOF ) do
         begin
            with WinData.tSAppliedFor do
               begin
                  Append;
                  FieldByName('ApplicationID').Value         := WinData.tSApplic.FieldByName('ID').Value;
                  FieldByName('AnimalID').Value              := PremTable.FieldByName('AID').AsInteger;
                  FieldByName('ApplicationDate').AsDateTime  := ApplicationDate;
                  FieldByName('RetensionDate').AsDateTime    := RetentionDate;
                  // Store the Lactno, can tell later what type of animal was applied Cow/Heifer.
                  FieldByName('LactNo').AsInteger            := PremTable.FieldByName('LactNo').AsInteger;
                  Post;
               end;
            PremTable.Next;
         end;

      WinData.tSAppliedFor.FlushBuffers;
      SavedApplication := True;
   finally
      WinData.tSAppliedFor.Close;
      WinData.tSApplic.Close;
      PremTable.Close;
      PremTable.EmptyTable;
      sbSaveApplication.Enabled := False;
      FillApplicQuery;
   end;
   ResetRanges;
   // empty table
   EraseTable;
   // empty grids
   FillGrids;
   // clear totals
   GetAnimalCounts;
end;

procedure TSuckApplic.FormCreate(Sender: TObject);
begin
   { SP 10/10/2002 }
   with PremTable do
      begin
         TableType := ttParadox;
         TableName := 'TempPrm';
         FieldDefs.Clear;
         FieldDefs.Add('AID',ftInteger,0,False);
         FieldDefs.Add('AnimalCode',ftString,20,False);
         FieldDefs.Add('NatID',ftString,20,False);
         FieldDefs.Add('SortNatID',ftString,20,False);      //KVB
         FieldDefs.Add('SortAnimalNo',ftString,10,False);   //KVB
         FieldDefs.Add('LactNo',ftInteger,0,False);
         FieldDefs.Add('DOB',ftDate,0,False);
         FieldDefs.Add('Sex',ftString,10,False);
         FieldDefs.Add('CMonth',ftFloat,0,False);
         FieldDefs.Add('CYear',ftFloat,0,False);
         FieldDefs.Add('Breed',ftString,6,False);
         FieldDefs.Add('LastCalving',ftDate,0,False);
         FieldDefs.Add('PrintGroup',ftinteger,0,False);
         FieldDefs.Add('Type',ftString,1,False);

         // Indexes
         IndexDefs.Clear;
         IndexDefs.Add('','AID',[ixPrimary,ixUnique]);
         IndexDefs.Add('iACode','AnimalCode',[ixCaseInSensitive]);
         IndexDefs.Add('iNatID','NatId',[ixCaseInSensitive]);
         IndexDefs.Add('iStNatID','SortNatID',[ixCaseInSensitive]);
         IndexDefs.Add('iStAnimalNo','SortAnimalNo',[ixCaseInSensitive]);
         IndexDefs.Add('iDOB','DOB',[ixCaseInSensitive]);
         IndexDefs.Add('iLC','LastCalving',[ixCaseInSensitive]);

         //Descending Indexes
         IndexDefs.Add('iACoded','AnimalCode',[ixCaseInSensitive,ixDescending]);
         IndexDefs.Add('iNatIdd','NatId',[ixCaseInSensitive,ixDescending]);
         IndexDefs.Add('iStNatIDd','SortNatID',[ixCaseInSensitive,ixDescending]);
         IndexDefs.Add('iStAnimalNod','SortAnimalNo',[ixCaseInSensitive,ixDescending]);
         IndexDefs.Add('iDOBd','DOB',[ixCaseInSensitive,ixDescending]);
         IndexDefs.Add('iLCd','LastCalving',[ixCaseInSensitive,ixDescending]);
         CreateTable;
         IndexName := 'iNatID';
         Open;
      end;

   orderbystring := 'SortNatId';
   sortbystring  := 'Asc';
   RegCountry := WinData.DefCountry(WinData.UserDefaultHerdID);
{   if RegCountry = NIreland then
      eHMinAllowed.Hide;
      begin
         lHeiferRange.Hide;
         eHMinAllowed.Hide;

         eHMaxallowed.Hide;
         lMax.Hide;
         lMin.Hide;

         lCowRange.Left    := lHeiferRange.Left;
         eCMinAllowed.Left := eHMinAllowed.Left;
         eCMaxAllowed.Left := eHMaxallowed.Left;
         lMax2.Left := lMax.Left;
         lMin2.Left := lMin.Left;

      end;
}
   // Set the Default Herd ID
   cbHerdID.LookupSource := WinData.dsHerdDefaults;
   cbHerdID.Value := IntToStr(WinData.UserDefaultHerdID);
   ApplicDate.Date := Date;
   SavedApplication := False;
   sbSaveApplication.Enabled := False;
   FillApplicQuery;
end;

procedure TSuckApplic.CalcRetention;
begin
   SetApplicYear;
   // ApplicDate.Date+1 = Allow for one day postage of application!!
   RetentionDate.Text := FormatDateTime('dd/mm/yyyy',IncMonth(ApplicDate.Date+1,SixMonths));
end;

procedure TSuckApplic.EraseTable;
begin
   // Erase the Temp Data and Set Count to 0
   try
      PremTable.DisableControls;
      PremTable.Close;

      GenQuery.SQL.Clear;
      GenQuery.SQL.Add('DELETE FROM ' + PremTable.TableName );
      GenQuery.ExecSQL;

   finally
      PremTable.Open;
      PremTable.EnableControls;
      GetAnimalCounts;
   end;
end;

procedure TSuckApplic.FillApplicQuery;
begin
   // Fill the Application Query and Show Drop Down List
   qApplics.SQL.Clear;
   qApplics.SQL.Add('SELECT ID, RetensionDate, DateOfApplic');
   qApplics.SQL.Add('FROM SApplic');
   qApplics.SQL.Add('WHERE (HerdID= ' + cbHerdID.Value + ')');
   qApplics.Open;
end;

procedure TSuckApplic.FillGrids;
begin
   with qGetAnimals do       //KVB - Overwrites SQL in component
      begin
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM ' + PremTable.TableName + ' P');
         SQL.Add('WHERE (P.LactNo > 0)');
         SQL.Add('ORDER BY ' + orderbystring + ' ' + sortbystring + ' ');
         Open;
      end;

   with qHeifers do
      begin
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM ' + PremTable.TableName + ' P');
         SQL.Add('WHERE (P.LactNo = 0)');
         SQL.Add('ORDER BY ' + orderbystring + ' ' + sortbystring + ' ');
         Open;
      end;
end;

procedure TSuckApplic.RunApplicQuery;
begin
   // Get 8 month date
   EightMonth := FormatDateTime('mm/dd/yyyy',CalcEightMonth);

   // Set the Application Year
   SetApplicYear;   // SP '04 maybe take this out
   // Check Appic hasn't been made already this year.
   ApplicMadeThisYear;
   // close tables & queries
   PremTable.DisableControls;
   PremTable.Close;

   qGetAnimals.Close;       //Gets animals >=2 years old   SQL overwritten   KVB
   qHeifers.Close;          //Gets animals <2 years old    SQL overwritten  KVB

   // empty table
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('DELETE FROM ' + PremTable.TableName );
   GenQuery.ExecSQL;

   // Get all eligible cows
   GetCows;

   // Get all eligible heifers
   GetHeifers;

   // open Premtable
   PremTable.Open;
   PremTable.First;
   PremTable.EnableControls;

   FillGrids;
   GetAnimalCounts;

   if PremTable.RecordCount = 0 then
      MessageDLG('No Eligible Animals',mtInformation,[mbOK],0);
end;

procedure TSuckApplic.SetApplicYear;
Var
   aDay, aYear, aMonth : Word;
begin
   // Calculate the Retention Date.
   DeCodeDate(ApplicDate.Date,aYear, aMonth, aDay );
   ApplicYear := aYear;
end;

procedure TSuckApplic.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if not (WinData.SuckApplicApplied(StrToInt(cbHerdID.Value), ApplicYear)) then
      if not(SavedApplication) then
         begin
            if sbSaveApplication.Visible = True then
               begin
                  if ( MessageDLG('Application has not been Saved - Do you want to Save it?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
                     CanClose := False;
               end
            else
               if (MessageDlg('Application is incomplete - Do you want to exit?',mtWarning,[mbYes,mbNo],0) = mrNo) then
                  CanClose := False;
         end;
end;

procedure TSuckApplic.cbHerdIDChange(Sender: TObject);
begin
   if WinData.OwnerFile.Locate('ID', cbHerdID.KeyValue, [] ) then
      if WinData.OwnerFile.FieldByName('TypeOfHerd').AsInteger = 24 then
         pMilkQuota.Visible := True
      else
         pMilkQuota.Visible := False;

   GetQuotas;
   ResetRanges;
   // check for existing application on new herd
   FillApplicQuery;
   // If the Herd ID Changes then empty the Table
   EraseTable;
   // empty grids
   FillGrids;
   // clear totals
   GetAnimalCounts;
end;

procedure TSuckApplic.FormShow(Sender: TObject);
begin
   ApplicDate.Date := Date;
   RetentionDate.Text := '';
   if (WinData.UserTypeOfHerd = 'Dairy') then
      pMilkQuota.Visible := True
   else
      pMilkQuota.Visible := False;
   GetQuotas;
end;

procedure TSuckApplic.GetCows;
begin
   // fill table for calved cows
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('INSERT INTO ' + PremTable.TableName + ' ( AID, ANIMALCODE, NATID, SortNatID, SortAnimalNo, ');
   GenQuery.SQL.Add('LactNo, Dob, Sex, CMonth, CYear, Breed, LastCalving, Type )');
   GenQuery.SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.SortNatID, A.SortAnimalNo, A.LactNo, A.DateOfBirth, "Cow", ');
   GenQuery.SQL.Add('EXTRACT(MONTH FROM EventDate) AS EMonth,');
   GenQuery.SQL.Add('EXTRACT(YEAR FROM EventDate) AS EYear, B.Code, E.EventDate, "C"');
   GenQuery.SQL.Add('FROM Animals A, Events E, Breeds B');
   GenQuery.SQL.Add('WHERE (A.ID=E.AnimalId)');
   GenQuery.SQL.Add('AND   (A.LactNo=E.AnimalLactNo)');
   GenQuery.SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
   GenQuery.SQL.Add('AND   (E.EventType = ' + IntToStr(CCalvingEvent) + ')');
   GenQuery.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
   GenQuery.SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
   GenQuery.SQL.Add('AND   (A.InHerd=TRUE)');
   GenQuery.SQL.Add('AND   (A.PrimaryBreed=B.ID)');
   GenQuery.SQL.Add('AND   (B.EligibleForPremium=TRUE)');
   if Length(cbHerdID.Value) > 0 then
      if cbHerdID.Value <> '0' then
         GenQuery.SQL.Add('AND (A.HerdID= ' + cbHerdID.Value + ')');
   GenQuery.ExecSQL;

   // fill table with non-calved cows with LactNo > 0
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('INSERT INTO ' + PremTable.TableName + ' ( AID, ANIMALCODE, NATID, SortNatID, SortAnimalNo, ');
   GenQuery.SQL.Add('LactNo, DOB, Sex, Breed, Type)');
   GenQuery.SQL.Add('SELECT DISTINCT ID, AnimalNo, NatIDNum, SortNatID, SortAnimalNo, LactNo, DateOfBirth, "Cow", B.Code, "C"');
   GenQuery.SQL.Add('FROM   Animals A, Breeds B');
   GenQuery.SQL.Add('WHERE (A.LactNo > 0) ');
   GenQuery.SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
   GenQuery.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
   GenQuery.SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
   GenQuery.SQL.Add('AND   (A.InHerd=TRUE)');
   GenQuery.SQL.Add('AND   (A.PrimaryBreed=B.ID)');
   GenQuery.SQL.Add('AND   (B.EligibleForPremium=TRUE)');
   GenQuery.SQL.Add('AND   (A.ID NOT IN (SELECT DISTINCT P.AID FROM ' + PremTable.TableName + ' P))');
   GenQuery.SQL.Add('AND   (A.HerdID= ' + cbHerdID.Value + ')');
   GenQuery.ExecSQL;
end;

procedure TSuckApplic.GetHeifers;
begin
   // fill table for non-calved heifers > 8 months
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('INSERT INTO ' + PremTable.TableName + ' ( AID, ANIMALCODE, NATID, SortNatID, SortAnimalNo, ');
   GenQuery.SQL.Add('LactNo, DOB, Sex, Breed, Type)');
   GenQuery.SQL.Add('SELECT DISTINCT ID, AnimalNo, NatIDNum, SortNatID, SortAnimalNo, LactNo, DateOfBirth, "Heifer", B.Code, "H"');
   GenQuery.SQL.Add('FROM   Animals A, Breeds B');
   GenQuery.SQL.Add('WHERE (A.DateOfBirth <= "' + EightMonth + '")');
   GenQuery.SQL.Add('AND   (A.LactNo = 0)');
   GenQuery.SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
   GenQuery.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
   GenQuery.SQL.Add('AND   (UPPER(A.Sex)="FEMALE")');
   GenQuery.SQL.Add('AND   (A.InHerd=TRUE)');
   GenQuery.SQL.Add('AND   (A.PrimaryBreed=B.ID)');
   GenQuery.SQL.Add('AND   (B.EligibleForPremium=TRUE)');
   GenQuery.SQL.Add('AND   (A.ID NOT IN (SELECT DISTINCT P.AID FROM ' + PremTable.TableName + ' P))');
   if Length(cbHerdID.Value) > 0 then
      if cbHerdID.Value <> '0' then
         GenQuery.SQL.Add('AND (A.HerdID= ' + cbHerdID.Value + ')');
   GenQuery.ExecSQL;
end;

function TSuckApplic.CalcEightMonth: TDateTime;
begin
   RESULT := IncMonth(ApplicDate.Date,-8);
end;

procedure TSuckApplic.sbSelectClick(Sender: TObject);
Var
   OwnerFileClosed : Boolean;
begin
   ApplicDateChange(nil);
   if ( Length(cbHerdID.Value) > 0 ) And ( cbHerdID.Value <> '0' ) then
      begin
         //KVB - First find out if Herd is Restricted
         If WinData.OwnerFile.State = dsInactive then
            Begin
                WinData.OwnerFile.Open;
                OwnerFileClosed := True;
            End
         Else
                OwnerFileClosed := False;
         If WinData.OwnerFile.Locate('ID', cbHerdID.Value, []) then
            Begin
                 Restricted := WinData.OwnerFile.FieldByName('Restricted').AsBoolean;
            End;
         If OwnerFileClosed = True then
                WinData.OwnerFile.Close;
         //Now with rest of processing.
         if ApplicDate.Text <> '  /  /    ' then
            begin
               RunApplicQuery;
               CalcRetention;
            end
         else
            begin
               ApplicDate.SetFocus;
               messagedlg('Please select application Date',mtWarning,[mbOK],0);
            end;
      end
   else
      begin
         MessageDLG('You must select a Herd',mtWarning,[mbOK],0);
         cbHerdID.SetFocus;
      end;

   TotAnimals := StrToInt(TotalAnimals.Text);
   Cows.IndexName := 'iStNatID';
   Heifers.IndexName := 'iStNatID';
   Cows.First;
   Heifers.First;
{
   if PremTable.RecordCount > 0 then
      MessageDlg('Please note that in addition to the 15% dry Heifers, '+#13+
                 'you can also apply for up to 20% of your quota made up of' +#13+
                 'heifers that will calve in the calendar year '+IntToStr(ApplicYear)+'.' +#13+
                 'These heifers can avail of the second top up of about 76 Euro/head',mtInformation,[mbOK], 0);

   Removed 29/03/2004 for 2004 req. GL

}

end;

procedure TSuckApplic.sbPreviewClick(Sender: TObject);
var
   TotCows : integer;
begin
   CheckHeiferCount;

   // Check if Dairy herd, if so make sure Milk Quota is entered and NOT > 35,470
   if pMilkQuota.Visible then
      begin
         if StrToFloat(MilkQuota.Text) <= 0 then
            begin
               MessageDlg('Unable to proceed with application.'+#13+
                          'Please check Milk Quota figure is correct.',mtError,[mbOk],0);
               MilkQuota.SetFocus;
               Abort;
            end
         else if StrToFloat(MilkQuota.Text) > StrToFloat(SuckMilkQuotaLimit) then
            begin
               MessageDlg('Unable to proceed with application.'+#13+
                          'Your''re Milk Quota figure '+MilkQuota.Text+', cannot exceed '+(SuckMilkQuotaLimit)+'.'+#13+
                          'Please check Milk Quota is correct',mtError,[mbOk],0);
               MilkQuota.SetFocus;
               Abort;
            end;
      end;

   if AllEligibleAnimalsUnderQuota then
      if MessageDlg('The number of eligible animals '+IntToStr(TotAnimals)+' is less than 90% of you Suckler Quota '+SuckQuota.Text+','+#13+
                    'This may mean you will lose some of your Suckler Quota, are you sure you want to proceed?',mtWarning,[mbyes,mbNo],0) = idNo then
                     Abort;

   if UnderQuota then
      if MessageDlg('The number of animals on the application '+TotalAnimals.Text+' is less than you Suckler Quota '+SuckQuota.Text+','+#13+
                    'and less than the no. eligible, are you sure you want to proceed?',mtWarning,[mbyes,mbNo],0) = idNo then
                     Abort;


   if StrToInt(TotalAnimals.Text) > StrToFloat(SuckQuota.Text) then
      if MessageDlg('The number of animals on the application '+TotalAnimals.Text+' exceeds your Suckler Quota '+SuckQuota.Text+','+#13+
                    'Are you sure you want to proceed?',mtInformation,[mbyes,mbNo],0) = idNo then
                     Abort;

   if RegCountry = NIreland then
      try
         if PremTable.RecordCount <= 0 then
            begin
               MessageDLG('No Animals to Apply for',mtInformation,[mbOK],0);
               Exit;
            end;

         sbSaveApplication.Enabled := False;
         SavedApplication := False;
         PremTable.DisableControls;
         Application.CreateForm(TfmNISuckForm, fmNISuckForm);
         fmNISuckForm.lRetentionDate.Caption := RetentionDate.Text;
         fmNISuckForm.lAppDate.Caption       := DateToStr(ApplicDate.Date);
         fmNISuckForm.VerLabel.Caption := 'Herd Management '+ HerdVerNo;
         fmNISuckForm.lRetentionDate2.Caption := RetentionDate.Text;
         fmNISuckForm.lAppDate2.Caption       := DateToStr(ApplicDate.Date);
         fmNISuckForm.VerLabel2.Caption := 'Herd Management '+ HerdVerNo;

         fmNISuckForm.qCows.Open;
         fmNISuckForm.qHeifers.Open;

         ViewIt := (Sender as TRxSpeedButton).Name = 'sbPreview';
         if ViewIt then
            begin
               fmNISuckForm.qrCows.Preview;
               fmNISuckForm.qrHeifers.Preview;
            end
         else
            begin
               fmNISuckForm.qrCows.Print;
               fmNISuckForm.qrHeifers.Print;
            end;

         fmNISuckForm.qCows.Close;
         fmNISuckForm.qHeifers.Close;
         if NOT ViewIt then
            if MessageDlg('Is the Printed Application OK and Correct ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               sbSaveApplication.Enabled := True
            else
               sbSaveApplication.Enabled := False;
      finally
         fmNISuckForm.Free;
         PremTable.EnableControls;
      end
   else
      begin
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT Count(ID) CowCount FROM Animals.db');
               SQL.Add('WHERE (NatIdNum IS NOT NULL)');
               SQL.Add('AND (AnimalDeleted=FALSE)');
               SQL.Add('AND (UPPER(Sex)="FEMALE")');
               SQL.Add('AND (InHerd=TRUE)');
               SQL.Add('AND (HerdID= ' + cbHerdID.Value + ')');
               SQL.Add('AND (LactNo > 0)');
               Open;
               TotCows := GenQuery.FieldByName('CowCount').AsInteger;
            end;

            if PremTable.RecordCount > 0 then
               begin
                  sbSaveApplication.Enabled := False;
                  SavedApplication := False;
                  PremTable.DisableControls;
                  ViewIt := (Sender as TRxSpeedButton).Name = 'sbPreview';
                  try
                     SavedApplication := True;
                     SuckRep := TfSC2001.Create(nil);         //KVB
                     // Get the Herd Owner Info.
                     if ( cbHerdID.Value > '0' ) then
                        if WinData.OwnerFile.Locate('ID',cbHerdID.Value, [] ) then
                            with SuckRep, WinData.OwnerFile Do
                              begin
                                 HerdOwner.Caption    := FieldByName('Name').AsString;
                                 Address1.Caption     := FieldByName('Address1').AsString;
                                 Address2.Caption     := FieldByName('Address2').AsString;
                                 Address3.Caption     := FieldByName('Address3').AsString;
                                 Address4.Caption     := FieldByName('Address4').AsString;

                                 if Length(FieldByName('RSINumber').AsString) > 0 then
                                    lPPSNo.Caption := FieldByName('RSINumber').AsString
                                 else
                                    begin
                                       lPPSNo.Enabled := False;
                                       lPPSNo.Hide; //Visible := False;
                                    end;

                                 if Length(FieldByName('Phone').AsString) > 0 then
                                    begin
                                       TelNo1.Caption := FieldByName('Phone').AsString;
                                       TelNo2.Caption := FieldByName('Phone').AsString;
                                    end
                                 else if Length(FieldByName('Fax').AsString) > 0 then
                                    begin
                                       TelNo1.Caption := FieldByName('Fax').AsString;
                                       TelNo2.Caption := FieldByName('Fax').AsString;
                                    end
                                 else
                                    begin
                                       TelNo1.Caption := '';
                                       TelNo2.Caption := '';
                                    end;

                                 Date1.Caption        := FormatDateTime('dd/mm/yyyy',ApplicDate.Date);
                                 Date2.Caption        := FormatDateTime('dd/mm/yyyy',ApplicDate.Date);
                                 HerdNo.Caption       := FieldByName('HerdIdentity').AsString;  //KVB
                                 HerdNoA.Caption      := FieldByName('HerdIdentity').AsString;  //KVB
                                 qrDBEanHerd.BarCode  := Uppercase(FieldByName('HerdIdentity').AsString);
                                 qrDBEanHerdA.BarCode := Uppercase(FieldByName('HerdIdentity').AsString);
                                 qrTotCows.caption    := eTotCows.text;
                                 qrTotHeif.caption    := eTotHeif.text;
                                 qrTotApplic.caption  := TotalAnimals.text;
                                 qrTotAnimals.caption := IntToStr(TotCows);     //KVB
                                 qrInspect1.caption   := FieldByName('PlaceForInspection1').AsString;
                                 qrInspect2.caption   := FieldByName('PlaceForInspection2').AsString;
                                 If Restricted then     //KVB - Restricted/Not Restricted Tick
                                    Begin
                                       QRImageRestricted.Enabled := True;
                                       QRImageNotRestricted.Enabled := False;
                                       TotalCount.Caption   := '';
                                    End
                                 Else
                                    Begin
                                       QRImageRestricted.Enabled := False;
                                       QRImageNotRestricted.Enabled := True;
                                       TotalCount.Caption   := TotalAnimals.Text;
                                    End;
                                 if pMilkQuota.Visible then
                                    begin
                                       if ((NOT(MilkQuota.Text = '')) OR (NOT(MilkQuota.Text = ''))) then
                                          begin
                                             lMilkQuota.Caption := MilkQuota.Text;
                                             NonQuotaTick.Enabled := False;
                                             NonQuotaTick.Visible := False;
                                          end
                                       else
                                          begin
                                             lMilkQuota.Caption := '';
                                             QuotaTick.Enabled := False;
                                             QuotaTick.Visible := False;
                                          end;
                                    end
                                 else
                                    begin
                                       QuotaTick.Enabled := False;
                                       QuotaTick.Visible := False;
                                       lMilkQuota.Caption := '';
                                    end;

                              end;
                     OutputReport;
                  finally
                     PremTable.EnableControls;
                     SuckRep.Free;
                  end;
                  if NOT ViewIt then
                     if MessageDlg('Is the Printed Application OK and Correct ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        sbSaveApplication.Enabled := True
                     else
                        sbSaveApplication.Enabled := False;
               end
            else
               MessageDLG('No Animals to Apply for',mtInformation,[mbOK],0);
      end;
end;

procedure TSuckApplic.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('sucklerprem.htm');
end;

procedure TSuckApplic.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TSuckApplic.FormDestroy(Sender: TObject);
begin
   // Close and Remove the Temporary Table from Disk
   Cows.Close;
   Cows.Free;
   Heifers.Close;
   Heifers.Free;
   PremTable.Close;
   PremTable.DeleteTable;
   PremTable.Free;
end;

procedure TSuckApplic.CalcHeifersAllowed(AnimalCount : Variant);

const
   MaxHeifPerc = 0.40;
   //MinHeifPerc = 0.15;

var
   DecDigits : Real;
begin
   { SP 10/10/2002 }

   ResetFields;
   if AnimalCount > 0 then
      begin
         MaxHeifersAllowed := MaxHeifPerc*AnimalCount;
         DecDigits := Frac(MaxHeifersAllowed);
         if DecDigits >= 0.5 then
            MaxHeifersAllowed := MaxHeifersAllowed+0.1;
         eHMaxAllowed.Text  := IntToStr(Round(MaxHeifersAllowed));
      end;

{         if AnimalCount < HeiferRange then // 2003 This meant you can only have upper limit of 40% total cattle being applied
            begin
               Position := 0;
               Sub := '';
               // user can apply up to 40% Max Heifers.
               MaxHeifersAllowed := MaxHeifPerc*AnimalCount;
               // Check to see if its a decimal figure. Round in Delphi rounds down to an even number
               // if its say 5.5 or 6.5
               If Pos('.',FloatToStr(MaxHeifersAllowed)) > 0 then
                  begin
                     Position := Pos('.',FloatToStr(MaxHeifersAllowed));
                     Sub := Copy(FloatToStr(MaxHeifersAllowed), Position+1, 1);
                     if StrToInt(Sub) >= 5 then
                        MaxHeifersAllowed := MaxHeifersAllowed+0.1;
                  end;
               eHMinAllowed.Text := '0';
               eHMaxAllowed.Text := IntToStr(Round(MaxHeifersAllowed));
            end
         else
            begin

               Position := 0;
               Sub := '';
               // user can apply Min 15% and Max 40% Heifers.
               MinHeifersAllowed := MinHeifPerc*AnimalCount;
               If Pos('.',FloatToStr(MinHeifersAllowed)) > 0 then
                  begin
                     Position := Pos('.',FloatToStr(MinHeifersAllowed));
                     Sub := Copy(FloatToStr(MinHeifersAllowed), Position+1, 1);
                     if StrToInt(Sub) >= 5 then
                        MinHeifersAllowed := MinHeifersAllowed+0.1;
                  end;
               eHMinAllowed.Text  := IntToStr(Round(MinHeifersAllowed));
}

//               Position := 0;
//               Sub := '';


{               If Pos('.',FloatToStr(MaxHeifersAllowed)) > 0 then
                  begin
                     Position := Pos('.',FloatToStr(MaxHeifersAllowed));
                     Sub := Copy(FloatToStr(MaxHeifersAllowed), Position+1, 1);
                     if StrToInt(Sub) >= 5 then

                  end;
               eHMaxAllowed.Text  := IntToStr(Round(MaxHeifersAllowed));

            end;
      end;
{
   if RegCountry = Ireland then
      if AnimalCount < HeiferRange then
         begin
            lMin.Hide;
            eHMinAllowed.Hide;
            lMax.Show;
            eHMaxAllowed.Show;
         end
      else
         begin
            lMin.Show;
            eHMinAllowed.Show;
            lMax.Show;
            eHMaxAllowed.Show;
         end;
}
end;

procedure TSuckApplic.GetAnimalCounts;
var
   HeiferCount : Word;
   MinHeifers,
   MaxHeifers : Integer;
begin
   { SP 10/10/2002 }

   TotalAnimals.Text := IntToStr(PremTable.RecordCount);

   // count for cow grid        //Cows = Animals that have calved - using LactNo
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT COUNT(AID) CowCount');
   GenQuery.SQL.Add('FROM ' + PremTable.TableName + ' P');
   GenQuery.SQL.Add('WHERE (P.LactNo > 0)');
   GenQuery.Open;
   CowCount := GenQuery.FieldByName('CowCount').AsInteger;
   eTotCows.Text := IntToStr(CowCount);

   // count for heifer grid      //Heifers = Animals 8+ months old that have not calved - using LactNo
   GenQuery.SQL.Clear;
   GenQuery.SQL.Add('SELECT COUNT(AID) HeiferCount');
   GenQuery.SQL.Add('FROM ' + PremTable.TableName + ' P');
   GenQuery.SQL.Add('WHERE (P.LactNo = 0)');
   GenQuery.Open;
   HeiferCount := GenQuery.FieldByName('HeiferCount').AsInteger;
   eTotHeif.Text := IntToStr(HeiferCount);

   if PremTable.RecordCount > 0 then
      begin
         if StrToFloat(SuckQuota.Text) <= 0 then
            begin
               MessageDlg('Please ensure your Suckler Quota figure is entered before proceeding with application',mtInformation,[mbOK],0);
               try
                  SuckQuota.SetFocus;
               except
                  //
               end;
               Abort;
            end
         else
            begin
               if StrToInt(TotalAnimals.Text) < StrToFloat(SuckQuota.Text) then
                  begin
                     { Calculate based on total animals (Cows+Heifers) }
                     CalcHeifersAllowed(CowCount+HeiferCount);
                     eCMinAllowed.Text := IntToStr((StrToInt(TotalAnimals.Text))-(StrToInt(eHMaxAllowed.Text)));
                  end
               else
                  begin
                     { Calculate based on suckler quota }
                     CalcHeifersAllowed(StrToFloat(SuckQuota.Text));
                     eCMinAllowed.Text := FloatToStr((StrToFloat(SuckQuota.Text))-(StrToFloat(eHMaxAllowed.Text)));
                     eCMinAllowed.Text := FloatToStr(WinData.kround(StrToFloat(eCMinAllowed.Text)));
                  end;
            end;
      end;

   //Now to colour eTotHeif
   { If Total Heifers is greater than Maximum Heifers Allowed }
   if StrToInt(eTotHeif.Text) > StrToInt(eHMaxAllowed.Text) then
      begin
         eTotHeif.Color := clWhite;
         eTotHeif.Font.Color := clRed;
      end
   else
      begin
         eTotHeif.Font.Color := clWindowText;
         eTotHeif.Color := $00A3E998;
      end;

//   if (((StrToFloat(eTotCows.Text) >= StrToFloat(eCMinAllowed.Text)) AND (StrToFloat(eTotCows.Text) <= StrToFloat(eCMaxAllowed.Text)))) then


   { If Total cows is greater than or equal to Minimum Cows Allowed }
   if (StrToFloat(eTotCows.Text) >= StrToFloat(eCMinAllowed.Text)) then
      begin
         eTotCows.Font.Color := clWindowText;
         eTotCows.Color := $00A3E998;
      end
   else
      begin
         eTotCows.Color := clWhite;
         eTotCows.Font.Color := clRed;
      end;

      if StrToFloat(TotalAnimals.Text) > StrToFloat(SuckQuota.Text) then
         begin
            TotalAnimals.Color := clWhite;
            TotalAnimals.Font.Color := clGreen;
         end
      else if StrToFloat(TotalAnimals.Text) < StrToFloat(SuckQuota.Text) then
         begin
            TotalAnimals.Color := clWhite;
            TotalAnimals.Font.Color := clRed;
         end
      else
         begin
            TotalAnimals.Font.Color := clWindowText;
            TotalAnimals.Color := $00A3E998;
         end;
      ResetFields; // hide/show - - min/max fields

   Cows.Filter := 'Type = ''C''';
   Cows.Filtered := True;
   Cows.Open;

   Heifers.Filter := 'Type = ''H''';
   Heifers.Filtered := True;
   Heifers.Open;

end;

procedure TSuckApplic.ResetFields;
begin
{   if CowCount < HeiferRange then
      begin
         lMin.Hide;
         eHMinAllowed.Hide;
         lMax.Show;
         eHMaxAllowed.Show;
      end
   else
      begin
         lMin.Show;
         eHMinAllowed.Show;
         lMax.Show;
         eHMaxAllowed.Show;
      end;
}
end;

procedure TSuckApplic.CheckHeiferCount;
begin
   { SP 10/10/2002 }
   if RegCountry = Ireland then
      begin
         if CowCount < HeiferRange then
            begin
 //              lMin.Hide;
//               eHMinAllowed.Hide;
               // user can apply up to 40% Max Heifers.
               if StrToInt(eTotHeif.Text) > StrToInt(eHMaxAllowed.Text) then
                  begin
                     Messagedlg('There are too many heifers.'+#13+
                                'Use the REMOVE heifer option to get the heifers within the required range.',mtWarning,[mbOK],0);
                     Abort;
                  end;
            end
         else
            begin
{
               lMin.Show;
               eHMinAllowed.Show;
               if StrToInt(eTotHeif.Text) < StrToInt(eHMinAllowed.Text) then
                  begin
                     Messagedlg('There are not enough heifers',mtWarning,[mbOK],0);
                     Abort;
                  end;
}
               if StrToInt(eTotHeif.Text) > StrToInt(eHMaxAllowed.Text) then
                  begin
                     Messagedlg('There are too many heifers.'+#13+
                                'Use the REMOVE heifer option to get the heifers within the required range.',mtWarning,[mbOK],0);
                     Abort;
                  end;
            end;
      end
   else
      if StrToInt(eTotHeif.Text) > StrToInt(eHMaxAllowed.Text) then
         begin
            Messagedlg('There are too many heifers.'+#13+
                       'Use the REMOVE heifer option to get the heifers within the required range.',mtWarning,[mbOK],0);
            Abort;
         end;
end;

procedure TSuckApplic.SuckQuotaExit(Sender: TObject);
begin
   if Length(Trim(SuckQuota.Text)) > 0 then
      begin
         if WinData.OwnerFile.Locate('ID', cbHerdID.KeyValue, [] ) then
            try
               WinData.OwnerFile.Edit;
               WinData.OwnerFile.FieldByName('SucklerQuota').AsFloat := StrToFloat(SuckQuota.Text);
               WinData.OwnerFile.Post;

               sbSelectClick(Sender);
            except
               WinData.OwnerFile.Cancel;
               SuckQuota.Text := '0';
               MessageDlg('Invalid value for suckler quota, please re-enter.',mtError,[mbOk],0);
            end;
      end;
end;

procedure TSuckApplic.CowsAfterDelete(DataSet: TDataSet);
begin
   GetAnimalCounts;
end;

procedure TSuckApplic.HeifersAfterDelete(DataSet: TDataSet);
begin
   GetAnimalCounts;
end;

function TSuckApplic.UnderQuota: Boolean;
const
   CutOffPerc = 0.9; // 90% / 100
begin
   RESULT := FALSE;
   if StrToInt(TotalAnimals.Text) < StrToFloat(SuckQuota.Text) then
      RESULT := True
   else
      RESULT := False;
end;

procedure TSuckApplic.MilkQuotaExit(Sender: TObject);
begin
   MilkQuotaChange(Sender);
end;

function TSuckApplic.AllEligibleAnimalsUnderQuota: Boolean;
const
   CutOffPerc = 0.9; // 90% / 100
begin
   { Last Revision  SP 08/01/2003 }
   RESULT := FALSE;
   // 90% check!
   try
      TotAnimals := StrToInt(TotalAnimals.Text); // SP 08/01/2003
      if TotAnimals < CutOffPerc*StrToFloat(SuckQuota.Text) then
         RESULT := True
      else
         RESULT := False;
   except
   end;
end;

procedure TSuckApplic.OutputReport;
var
   i,
   group1,
   group2,
   printgroup,
   printrec,
   heifprint,
   RecCount,
   TotCows,
   TotHeif,
   CowUpDate,
   groupcount,
   RecToInsert : integer;
   PrintMoreThanOne : Boolean;
begin
   //assign print numbers depending on Heifer/Cow     //KVB
   PrintRec := 60;  //Restricted Herds Cows
   HeifPrint := 20;  //Heifers
   with SuckRep do
      try
         with qSuckler do
            begin
               // find if blank calving exists
               SQL.Clear;
               SQL.Add('SELECT COUNT(AID) NoCalv FROM ' + PremTable.TableName );
               SQL.Add('WHERE (LactNo > 0)');
               SQL.Add('AND   (LastCalving IS NULL)');
               Open;

               // if yes, raise warning
               if qSuckler.FieldByName('NoCalv').AsInteger > 0 then
                  messagedlg('There is at least one cow without a recorded calving date.'+#13#13+
                             'You may want to ensure all calving dates are valid.',mtWarning,[mbOK],0);

               // get cow count
               SQL.Clear;
               SQL.Add('SELECT COUNT(AID) CowCount FROM ' + PremTable.TableName );
               SQL.Add('WHERE (LactNo > 0)');
               open;
               TotCows := qSuckler.FieldByName('CowCount').AsInteger;

               // get cows
               SQL.Clear;
               SQL.Add('SELECT * FROM ' + PremTable.TableName );
               SQL.Add('WHERE (LactNo > 0)');
               SQL.Add('ORDER BY ' + orderbystring + ' ' + sortbystring + ' ');

               Open;
               First;
               PrintGroup := 1;
               RecCount   := 1;

               // Assign print groups to cows
               while NOT eof do
                  begin
                     if PremTable.Locate('AID',FieldByName('AID').value,[]) then
                        begin
                           PremTable.edit;
                           PremTable.FieldByName('PrintGroup').AsInteger := PrintGroup;
                           PremTable.post;
                           Inc(RecCount);
                           //Increment PrintGroup
                           If RecCount = 61 then
                                Begin
                                     RecCount := 1;
                                     inc(PrintGroup);
                                End;
                        end;
                     next;
                  end;

               maxgroup := printgroup + 1;
               // update cow count (for heifers = 0)
               SQL.Clear;
               SQL.Add('SELECT COUNT(AID) CowCount FROM ' + PremTable.TableName );
               SQL.Add('WHERE (LactNo > 0)');
               open;
               CowUpdate := qSuckler.FieldByName('CowCount').AsInteger;
            end;

         with qHeifer do
            begin
               // get heifer count
               SQL.Clear;
               SQL.Add('SELECT COUNT(AID) HeifCount FROM ' + PremTable.TableName );
               SQL.Add('WHERE (LactNo = 0)');
               open;
               TotHeif := qHeifer.FieldByName('HeifCount').AsInteger;

               // get heifers
               SQL.Clear;
               SQL.Add('SELECT * FROM ' + PremTable.TableName );
               SQL.Add('WHERE (LactNo = 0)');
               SQL.Add('ORDER BY ' + orderbystring + ' ' + sortbystring + ' ');
               open;

               First;
               PrintGroup := 1;
               RecCount   := 1;
               // assign print groups to heifers
               while NOT EOF do
                  begin
                     if PremTable.Locate('AID',FieldByName('AID').value,[]) then
                        begin
                           PremTable.Edit;
                           PremTable.FieldByName('PrintGroup').AsInteger := PrintGroup;
                           PremTable.Post;
                           Inc(RecCount);
                           if RecCount > HeifPrint then
                              begin
                                 RecCount := 1;
                                 //KVB Separate reports for 2001, no longer need to keep print groups in line
                                 {// increment twice to keep in line with cows print group
                                 inc(printgroup);}
                                 inc(printgroup);
                              end;
                        end;
                     next;
                  end;

               if PrintGroup > MaxGroup-1 then
                  MaxGroup := PrintGroup+1;

               if Restricted then
                  MaxGroup := PrintGroup+1;

            end;

         // loop to produce multiple forms
         group1 := 1;
         group2 := 2;
         while group2 <= maxgroup do
            begin
               with qSuckler do
                  begin
                     // select cows by printgroup
                     SQL.Clear;
                     SQL.Add('SELECT * FROM ' + PremTable.TableName );
                     SQL.Add('WHERE (LactNo > 0)');
                     SQL.Add('AND   (PrintGroup BETWEEN ' + IntToStr(group1) + ' AND ' + IntToStr(group2) + ')' );
                     SQL.Add('ORDER BY PrintGroup, ' + orderbystring + ' ' + sortbystring + ' ');
                     open;
                  end;

               with qHeifer do
                  begin
                     // select heifers by printgroup
                     SQL.Clear;
                     SQL.Add('SELECT * FROM ' + PremTable.TableName );
                     SQL.Add('WHERE (LactNo = 0)');
                     SQL.Add('AND   (PrintGroup BETWEEN ' + IntToStr(group1) + ' AND ' + IntToStr(group2) + ')' );
                     SQL.Add('ORDER BY PrintGroup, ' + orderbystring + ' ' + sortbystring + ' ');
                     open;
                  end;

               //KVB Now need to fill the labels with the appropriate data
               //KVB First SC2001 Form with Heifer details        ***********
               qHeifer.First;
               If qHeifer.EOF then
                  lHeifer01.Caption := ''
               Else
                  lHeifer01.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer02.Caption := ''
               Else
                   lHeifer02.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer03.Caption := ''
               Else
                  lHeifer03.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer04.Caption := ''
               Else
                  lHeifer04.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer05.Caption := ''
               Else
                  lHeifer05.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;

               If qHeifer.EOF then
                  lHeifer06.Caption := ''
               Else
                  lHeifer06.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer07.Caption := ''
               Else
                  lHeifer07.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer08.Caption := ''
               Else
                  lHeifer08.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer09.Caption := ''
               Else
                  lHeifer09.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer10.Caption := ''
               Else
                  lHeifer10.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer11.Caption := ''
               Else
                  lHeifer11.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer12.Caption := ''
               Else
                  lHeifer12.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer13.Caption := ''
               Else
                  lHeifer13.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer14.Caption := ''
               Else
                  lHeifer14.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer15.Caption := ''
               Else
                  lHeifer15.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer16.Caption := ''
               Else
                  lHeifer16.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer17.Caption := ''
               Else
                  lHeifer17.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer18.Caption := ''
               Else
                  lHeifer18.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer19.Caption := ''
               Else
                  lHeifer19.Caption := qHeifer.FieldByName('NatID').AsString;
               qHeifer.Next;
               If qHeifer.EOF then
                  lHeifer20.Caption := ''
               Else
                  lHeifer20.Caption := qHeifer.FieldByName('NatID').AsString;
               //Now to check if Restricted Herd
               If Restricted then
                  Begin    //KVB Need to input the SC2001A labels
                       qSuckler.First;
                       If qSuckler.EOF then
                          Begin
                               lCow01.Caption := '';
                               lCowBreed01.Caption := '';
                          End
                       Else
                          Begin
                               lCow01.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed01.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow02.Caption := '';
                               lCowBreed02.Caption := '';
                          End
                       Else
                          Begin
                               lCow02.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed02.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow03.Caption := '';
                               lCowBreed03.Caption := '';
                          End
                       Else
                          Begin
                               lCow03.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed03.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow04.Caption := '';
                               lCowBreed04.Caption := '';
                          End
                       Else
                          Begin
                               lCow04.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed04.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow05.Caption := '';
                               lCowBreed05.Caption := '';
                          End
                       Else
                          Begin
                               lCow05.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed05.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow06.Caption := '';
                               lCowBreed06.Caption := '';
                          End
                       Else
                          Begin
                               lCow06.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed06.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow07.Caption := '';
                               lCowBreed07.Caption := '';
                          End
                       Else
                          Begin
                               lCow07.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed07.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow08.Caption := '';
                               lCowBreed08.Caption := '';
                          End
                       Else
                          Begin
                               lCow08.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed08.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow09.Caption := '';
                               lCowBreed09.Caption := '';
                          End
                       Else
                          Begin
                               lCow09.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed09.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow10.Caption := '';
                               lCowBreed10.Caption := '';
                          End
                       Else
                          Begin
                               lCow10.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed10.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow11.Caption := '';
                               lCowBreed11.Caption := '';
                          End
                       Else
                          Begin
                               lCow11.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed11.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow12.Caption := '';
                               lCowBreed12.Caption := '';
                          End
                       Else
                          Begin
                               lCow12.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed12.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow13.Caption := '';
                               lCowBreed13.Caption := '';
                          End
                       Else
                          Begin
                               lCow13.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed13.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow14.Caption := '';
                               lCowBreed14.Caption := '';
                          End
                       Else
                          Begin
                               lCow14.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed14.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow15.Caption := '';
                               lCowBreed15.Caption := '';
                          End
                       Else
                          Begin
                               lCow15.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed15.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow16.Caption := '';
                               lCowBreed16.Caption := '';
                          End
                       Else
                          Begin
                               lCow16.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed16.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow17.Caption := '';
                               lCowBreed17.Caption := '';
                          End
                       Else
                          Begin
                               lCow17.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed17.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow18.Caption := '';
                               lCowBreed18.Caption := '';
                          End
                       Else
                          Begin
                               lCow18.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed18.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow19.Caption := '';
                               lCowBreed19.Caption := '';
                          End
                       Else
                          Begin
                               lCow19.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed19.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow20.Caption := '';
                               lCowBreed20.Caption := '';
                          End
                       Else
                          Begin
                               lCow20.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed20.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow21.Caption := '';
                               lCowBreed21.Caption := '';
                          End
                       Else
                          Begin
                               lCow21.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed21.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow22.Caption := '';
                               lCowBreed22.Caption := '';
                          End
                       Else
                          Begin
                               lCow22.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed22.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow23.Caption := '';
                               lCowBreed23.Caption := '';
                          End
                       Else
                          Begin
                               lCow23.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed23.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow24.Caption := '';
                               lCowBreed24.Caption := '';
                          End
                       Else
                          Begin
                               lCow24.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed24.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow25.Caption := '';
                               lCowBreed25.Caption := '';
                          End
                       Else
                          Begin
                               lCow25.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed25.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow26.Caption := '';
                               lCowBreed26.Caption := '';
                          End
                       Else
                          Begin
                               lCow26.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed26.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow27.Caption := '';
                               lCowBreed27.Caption := '';
                          End
                       Else
                          Begin
                               lCow27.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed27.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow28.Caption := '';
                               lCowBreed28.Caption := '';
                          End
                       Else
                          Begin
                               lCow28.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed28.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow29.Caption := '';
                               lCowBreed29.Caption := '';
                          End
                       Else
                          Begin
                               lCow29.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed29.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow30.Caption := '';
                               lCowBreed30.Caption := '';
                          End
                       Else
                          Begin
                               lCow30.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed30.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow31.Caption := '';
                               lCowBreed31.Caption := '';
                          End
                       Else
                          Begin
                               lCow31.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed31.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow32.Caption := '';
                               lCowBreed32.Caption := '';
                          End
                       Else
                          Begin
                               lCow32.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed32.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow33.Caption := '';
                               lCowBreed33.Caption := '';
                          End
                       Else
                          Begin
                               lCow33.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed33.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow34.Caption := '';
                               lCowBreed34.Caption := '';
                          End
                       Else
                          Begin
                               lCow34.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed34.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow35.Caption := '';
                               lCowBreed35.Caption := '';
                          End
                       Else
                          Begin
                               lCow35.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed35.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow36.Caption := '';
                               lCowBreed36.Caption := '';
                          End
                       Else
                          Begin
                               lCow36.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed36.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow37.Caption := '';
                               lCowBreed37.Caption := '';
                          End
                       Else
                          Begin
                               lCow37.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed37.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow38.Caption := '';
                               lCowBreed38.Caption := '';
                          End
                       Else
                          Begin
                               lCow38.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed38.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow39.Caption := '';
                               lCowBreed39.Caption := '';
                          End
                       Else
                          Begin
                               lCow39.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed39.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow40.Caption := '';
                               lCowBreed40.Caption := '';
                          End
                       Else
                          Begin
                               lCow40.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed40.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow41.Caption := '';
                               lCowBreed41.Caption := '';
                          End
                       Else
                          Begin
                               lCow41.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed41.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow42.Caption := '';
                               lCowBreed42.Caption := '';
                          End
                       Else
                          Begin
                               lCow42.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed42.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow43.Caption := '';
                               lCowBreed43.Caption := '';
                          End
                       Else
                          Begin
                               lCow43.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed43.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow44.Caption := '';
                               lCowBreed44.Caption := '';
                          End
                       Else
                          Begin
                               lCow44.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed44.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow45.Caption := '';
                               lCowBreed45.Caption := '';
                          End
                       Else
                          Begin
                               lCow45.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed45.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow46.Caption := '';
                               lCowBreed46.Caption := '';
                          End
                       Else
                          Begin
                               lCow46.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed46.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow47.Caption := '';
                               lCowBreed47.Caption := '';
                          End
                       Else
                          Begin
                               lCow47.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed47.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow48.Caption := '';
                               lCowBreed48.Caption := '';
                          End
                       Else
                          Begin
                               lCow48.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed48.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow49.Caption := '';
                               lCowBreed49.Caption := '';
                          End
                       Else
                          Begin
                               lCow49.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed49.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow50.Caption := '';
                               lCowBreed50.Caption := '';
                          End
                       Else
                          Begin
                               lCow50.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed50.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow51.Caption := '';
                               lCowBreed51.Caption := '';
                          End
                       Else
                          Begin
                               lCow51.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed51.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow52.Caption := '';
                               lCowBreed52.Caption := '';
                          End
                       Else
                          Begin
                               lCow52.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed52.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow53.Caption := '';
                               lCowBreed53.Caption := '';
                          End
                       Else
                          Begin
                               lCow53.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed53.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow54.Caption := '';
                               lCowBreed54.Caption := '';
                          End
                       Else
                          Begin
                               lCow54.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed54.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow55.Caption := '';
                               lCowBreed55.Caption := '';
                          End
                       Else
                          Begin
                               lCow55.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed55.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow56.Caption := '';
                               lCowBreed56.Caption := '';
                          End
                       Else
                          Begin
                               lCow56.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed56.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow57.Caption := '';
                               lCowBreed57.Caption := '';
                          End
                       Else
                          Begin
                               lCow57.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed25.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow58.Caption := '';
                               lCowBreed58.Caption := '';
                          End
                       Else
                          Begin
                               lCow58.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed58.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow59.Caption := '';
                               lCowBreed59.Caption := '';
                          End
                       Else
                          Begin
                               lCow59.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed59.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                       qSuckler.Next;
                       If qSuckler.EOF then
                          Begin
                               lCow60.Caption := '';
                               lCowBreed60.Caption := '';
                          End
                       Else
                          Begin
                               lCow60.Caption := qSuckler.FieldByName('NatID').AsString;
                               lCowBreed60.Caption := qSuckler.FieldByName('Breed').AsString;
                          End;
                  End;


                  if ViewIt then
                     begin
                       SuckRep.SC2001.Preview;
                       If Restricted then
                          SuckRep.SC2001a.Preview;
                     end
                  else
                     begin
                       //Need to print three copies of each form
                       SuckRep.SC2001.Print;
                       SuckRep.SC2001.Print;
                       SuckRep.SC2001.Print;
                       If Restricted then
                         Begin
                              SuckRep.SC2001a.Print;
                              SuckRep.SC2001a.Print;
                              SuckRep.SC2001a.Print;
                         end;
                     end;
                  inc(group1);
                  group2 := group1 + 1
               end;
      finally
         Close;
         // delete blank records from table
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE from ' + PremTable.TableName );
               SQL.Add('WHERE DoB = "12/30/1899" ');
               ExecSQl;
            end;
         // refresh grid and counts
         FillGrids;
         GetAnimalCounts;
      end;
end;

procedure TSuckApplic.AnimalNumber1Click(Sender: TObject);
var
   i : Integer;
begin
   (Sender as TMenuItem).Checked := True;
   for i := 0 to pmSort.Items.Count-1 do
      begin
         if pmSort.Items[i].Checked then
            if pmSort.Items[i].Hint = 'desc' then
               begin
                  Cows.IndexName := 'iStAnimalNod';
                  Heifers.IndexName := 'iStAnimalNod';
               end
            else if pmSort.Items[i].Hint = 'asc' then
               begin
                  Cows.IndexName := 'iStAnimalNo';
                  Heifers.IndexName := 'iStAnimalNo';
               end;
      end;
end;

procedure TSuckApplic.DateOfBirth1Click(Sender: TObject);
var
   i : Integer;
begin
   (Sender as TMenuItem).Checked := True;
   for i := 0 to pmSort.Items.Count-1 do
      begin
         if pmSort.Items[i].Checked then
            if pmSort.Items[i].Hint = 'desc' then
               begin
                  Cows.IndexName := 'iDOBd';
                  Heifers.IndexName := 'iDOBd';
               end
            else if pmSort.Items[i].Hint = 'asc' then
               begin
                  Cows.IndexName := 'iDOB';
                  Heifers.IndexName := 'iDOB';
               end;
      end;
end;

procedure TSuckApplic.LastCalvingClick(Sender: TObject);
var
   i : Integer;
begin
   (Sender as TMenuItem).Checked := True;
   for i := 0 to pmSort.Items.Count-1 do
      begin
         if pmSort.Items[i].Checked then
            if pmSort.Items[i].Hint = 'desc' then
               begin
                  Cows.IndexName := 'iLCd';
               end
            else if pmSort.Items[i].Hint = 'asc' then
               begin
                  Cows.IndexName := 'iLC';
               end;
      end;
end;

procedure TSuckApplic.NationalIDNumber1Click(Sender: TObject);
var
   TempStr : String;
   i : Integer;
begin
   (Sender as TMenuItem).Checked := True;
   for i := 0 to pmSort.Items.Count-1 do
      begin
         if pmSort.Items[i].Checked then
            if pmSort.Items[i].Hint = 'desc' then
               begin
                  Cows.IndexName := 'iStNatIDd';
                  Heifers.IndexName := 'iStNatIDd';
               end
            else if pmSort.Items[i].Hint = 'asc' then
               begin
                  Cows.IndexName := 'iStNatID';
                  Heifers.IndexName := 'iStNatID';
               end;
      end;
end;

procedure TSuckApplic.Ascending1Click(Sender: TObject);
begin
   if pmSort.Items[0].Checked then
      NationalIDNumber1Click(Sender)
   else if pmSort.Items[1].Checked then
      AnimalNumber1Click(Sender)
   else if pmSort.Items[2].Checked then
      DateOfBirth1Click(Sender)
   else if pmSort.Items[3].Checked then
      LastCalvingClick(Sender);
end;

procedure TSuckApplic.MilkQuotaChange(Sender: TObject);
begin
   if Length(Trim(MilkQuota.Text)) > 0 then
      if WinData.OwnerFile.Locate('ID', cbHerdID.KeyValue, [] ) then
         try
            WinData.OwnerFile.Edit;
            WinData.OwnerFile.FieldByName('MilkQuota').AsFloat := StrToFloat(MilkQuota.Text);
            WinData.OwnerFile.Post;
         except
            WinData.OwnerFile.Cancel;
            MilkQuota.Text := '0';
            MessageDlg('Invalid value for milk quota, please re-enter.',mtError,[mbOk],0);
         end;
end;

procedure TSuckApplic.GetQuotas;
begin
   if WinData.OwnerFile.Locate('ID', cbHerdID.KeyValue,[] ) then
      begin
         SuckQuota.Text := FloatToStr(WinData.OwnerFile.FieldByName('SucklerQuota').AsFloat);
         MilkQuota.Text := FloatToStr(WinData.OwnerFile.FieldByName('MilkQuota').AsFloat);
      end;
end;

procedure TSuckApplic.ResetRanges;
begin
//   eHMinAllowed.Text := '0';
   eHMaxAllowed.Text := '0';
   eCMinAllowed.Text := '0';
//   eCMaxAllowed.Text := '0';
end;

procedure TSuckApplic.ApplicMadeThisYear;
begin
   // First do check to make sure this is first and only application for ApplicYear
   if (WinData.SuckApplicApplied(StrToInt(cbHerdID.Value), ApplicYear)) then
      begin
         MessageDlg('A Suckler Application has already been made this year',mtInformation,[mbOK],0);
         Abort;
      end;
end;

procedure TSuckApplic.CheckAppDate;
const

   MsgToShow = 'Application date cannot be %s, resetting to today';

   SPBeforeDate = 'before ' + SPOpeningDate;
   SPAfterDate  = 'after '  + SPClosingDate;
   SPAfterToday = 'after ';

   procedure DisplayMessagage(Msg : String);
   begin
      if Self.Showing then
         MessageDlg(Format(MsgToShow,[Msg]),mtError,[mbOK],0);
      ApplicDate.Date := Date;
      try
         ApplicDate.SetFocus;
      except
      end;
      Sysutils.Abort;
   end;

begin
   if ApplicDate.Date < StrToDate(SPOpeningDate) then
      DisplayMessagage(SPBeforeDate)
   else if ApplicDate.Date > StrToDate(SPClosingDate) then
      DisplayMessagage(SPAfterDate)
   else if ApplicDate.Date > Date+7 then
      DisplayMessagage(SPAfterToday + FormatDateTime('dd/mm/yyyy', Date+7));
end;

procedure TSuckApplic.ApplicDateChange(Sender: TObject);
begin
   if RegCountry = Ireland then
      begin
         CheckAppDate;
         CalcRetention;
      end
   else
      CalcRetention;
   { SP 10/10/2002 }

end;

end.
