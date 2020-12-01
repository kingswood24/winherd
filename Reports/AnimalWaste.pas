unit AnimalWaste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, RxLookup, kwDBNavigator, RXCtrls,
  ComCtrls, ToolWin, Qrctrls, QuickRpt, RXSplit, Db, DBTables, DateUtil,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TLivestockWaste = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    sbView: TRxSpeedButton;
    Label4: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    MtHogget: TDBEdit;
    LowEwe: TDBEdit;
    MtEwe: TDBEdit;
    LowHogget: TDBEdit;
    qAnimalWaste: TQuery;
    Panel2: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    AnimalWasteProd: TQuickRep;
    PageFooterBand3: TQRBand;
    QRLabel44: TQRLabel;
    VerLabelFert: TQRLabel;
    SummaryBand3: TQRBand;
    pbNutMan: TProgressBar;
    QRLabel31: TQRLabel;
    sbCalc: TRxSpeedButton;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Bevel2: TBevel;
    QRLabel32: TQRLabel;
    lAvgN: TQRLabel;
    lAvgP: TQRLabel;
    qrlTotalNKg: TQRLabel;
    qrlTotalPKg: TQRLabel;
    sbWasteProdRates: TRxSpeedButton;
    ToolButton5: TToolButton;
    Label3: TLabel;
    cbStartMonth: TComboBox;
    cbStartYear: TComboBox;
    Label19: TLabel;
    Bevel3: TBevel;
    QRSysData5: TQRSysData;
    RptTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    lHerdId: TQRLabel;
    lForageArea: TQRLabel;
    lDisplayDate: TQRLabel;
    lPeriod: TQRLabel;
    QRShape6: TQRShape;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    MountainHogget: TQRDBText;
    WP_EwesMountain: TQRDBText;
    LowEweLamb: TQRDBText;
    LowlandHogget: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel21: TQRLabel;
    Label20: TLabel;
    Label21: TLabel;
    cbEndMonth: TComboBox;
    cbEndYear: TComboBox;
    QRLabel22: TQRLabel;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MtEweEnter(Sender: TObject);
    procedure MtEweExit(Sender: TObject);
    procedure sbCalcClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HerdComboChange(Sender: TObject);
    procedure QRExpr19Print(sender: TObject; var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure QRLabel35Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRLabel36Print(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel38Print(sender: TObject; var Value: String);
    procedure QRLabel14Print(sender: TObject; var Value: String);
    procedure QRLabel39Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure QRLabel40Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRLabel42Print(sender: TObject; var Value: String);
    procedure QRLabel17Print(sender: TObject; var Value: String);
    procedure QRLabel43Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel45Print(sender: TObject; var Value: String);
    procedure QRLabel19Print(sender: TObject; var Value: String);
    procedure QRLabel46Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure AnimalWasteProdPreview(Sender: TObject);
    procedure AnimalWasteProdBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure sbWasteProdRatesClick(Sender: TObject);
    procedure cbStartMonthChange(Sender: TObject);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    tForageArea : Double;
    bDateChanged : Boolean;
    bDataCalc : Boolean;
    NoOfDays : Word;
    NoOfMonths : Word;
    NoOfYears : Word;
    procedure GetNutrientData;
    procedure ForageAreaCalc;
  public
    { Public declarations }
  end;

  procedure CreateAndShow;

implementation
uses
   uSetupWasteProdRates,
   KRoutines, DairyData, GenTypesConst;

var
  LivestockWaste: TLivestockWaste;
  tLivestockSum : TTable;
{$R *.DFM}


   procedure CreateAndShow;
   begin
      try
         try
            Application.CreateForm(TLivestockWaste, LivestockWaste);
            WinData.LiveStockValues.Open;
            with LivestockWaste do
               begin
                  pbNutMan.Hide;
                  LivestockWaste.ShowModal;
               end;
         except

         end;
      finally
         tLivestockSum.Close;
         tLivestockSum.DeleteTable;
         tLivestockSum.Free;
         LivestockWaste.Free;
      end;
   end;

{
function TLivestockWaste.GetMth(MthName : String) : Integer;
begin
   if MthName = 'January' then
      Result := 1
   else if MthName = 'February' then
      Result := 2
   else if MthName = 'March' then
      Result := 3
   else if MthName = 'April' then
      Result := 4
   else if MthName = 'May' then
      Result := 5
   else if MthName = 'June' then
      Result := 6
   else if MthName = 'July' then
      Result := 7
   else if MthName = 'August' then
      Result := 8
   else if MthName = 'September' then
      Result := 9
   else if MthName = 'October' then
      Result := 10
   else if MthName = 'November' then
      Result := 11
   else if MthName = 'December' then
      Result := 12;
end;
{
function TLivestockWaste.GetEndOfMth(Mth, Yr: Integer): Integer;
begin
   case Mth of
      1: Result := 31;
      2: begin
            if ((Yr mod 4) = 0) then
               Result := 29
            else
               Result := 28;
         end;
      3: Result := 31;
      4: Result := 30;
      5: Result := 31;
      6: Result := 30;
      7: Result := 31;
      8: Result := 31;
      9: Result := 30;
      10:Result := 31;
      11:Result := 30;
      12:Result := 31;
   end;
end;


function TLivestockWaste.GetEndOfMthDate(Mth, Yr: Integer): TDate;
begin
   case Mth of
      0: Result := StrToDateTime('31/12/' + IntToStr(Yr));
      1: Result := StrToDateTime('31/01/' + IntToStr(Yr));
      2: begin
            if ((Yr mod 4) = 0) then
               Result := StrToDateTime('29/02/' + IntToStr(Yr))
             else
               Result := StrToDateTime('28/02/' + IntToStr(Yr));
         end;
      3: Result := StrToDateTime('31/03/' + IntToStr(Yr));
      4: Result := StrToDateTime('30/04/' + IntToStr(Yr));
      5: Result := StrToDateTime('31/05/' + IntToStr(Yr));
      6: Result := StrToDateTime('30/06/' + IntToStr(Yr));
      7: Result := StrToDateTime('31/07/' + IntToStr(Yr));
      8: Result := StrToDateTime('31/08/' + IntToStr(Yr));
      9: Result := StrToDateTime('30/09/' + IntToStr(Yr));
      10:Result := StrToDateTime('31/10/' + IntToStr(Yr));
      11:Result := StrToDateTime('30/11/' + IntToStr(Yr));
      12:Result := StrToDateTime('31/12/' + IntToStr(Yr));
   end;
end;

}
procedure TLivestockWaste.GetNutrientData;
Var
   InputDate : TDate;
   FirstDate : TDate;
   CalcDate : TDate;
   i : Integer;
   nEndMonth : Integer;
   nEndYear : Integer;
   nStartMonth : Integer;
   nStartYear : Integer;

   Count0to6mths : Integer;
   Count6to12mths : Integer;
   Count1to2yrs : Integer;
   Count2plusYrs : Integer;
   CountDairyCows : Integer;       //KVB
   CountSucklerCows : Integer;     //KVB
   Tot0to6mths : Integer;
   Tot6to12mths : Integer;
   Tot1to2yrs : Integer;
   Tot2plusYrs : Integer;
   TotDairyCows : Integer;    //KVB
   TotSucklerCows : Integer;  //KVB

   DisplayDate, StartDate, EndDate : TDateTime;

   ThisMonth : Word;

   procedure CalcAnimals(const nMonth, nYear : Integer);
   var
      CalcDate : TDateTime;
   begin
      // Initialise variables
      Count0to6mths    := 0;
      Count6to12mths   := 0;
      Count1to2yrs     := 0;
      Count2plusYrs    := 0;
      CountDairyCows   := 0;
      CountSucklerCows := 0;

      //First get iterative date
      CalcDate := GetEndOfMthDate(nMonth, nYear);

      //Next go through the tLivestockSum table and count the desired animals

      with tLivestockSum do
         begin
            First;     //Gets first animal in table
            while NOT (tLivestockSum.EOF) do
               begin
                  Update;
                  Application.ProcessMessages;
                  //Now to check if the animal should be counted and if so
                  //to determine how old the animal is
                  if ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (tLivestockSum.FieldByName('DOB').AsDateTime <= CalcDate) AND
                     (tLivestockSum.FieldByName('PurchDate').AsDateTime <= CalcDate)) then      //PurchDate must be <= CalcDate (if PurchDate does not exist, then PurchDate = 0)
                     begin
                          //Need to check if a Sold/Died Date exists
                        if ( tLivestockSum.FieldByName('SaleDeathDate').AsDateTime > 0 ) and (tLivestockSum.FieldByName('SaleDeathDate').AsDateTime <= CalcDate) then
                           Next
                        else if ( tLivestockSum.FieldByName('DateMovedOn').AsDateTime > 0 ) and ( tLivestockSum.FieldByName('DateMovedOn').AsDateTime > CalcDate ) then
                           Next
                        else if ( tLivestockSum.FieldByName('DateMovedOff').AsDateTime > 0 ) and ( tLivestockSum.FieldByName('DateMovedOff').AsDateTime <= CalcDate ) then
                           Next            //Animal Sold/Died on or before CalcDate
                        else
                           begin
                              if ( tLivestockSum.FieldByName('LactNum').asInteger > 1 ) then
                                 begin    //Animal Calved - now a Cow. Must determine whether a Dairy Or Suckler Cow
                                    //Need to include checks for Suckler Cows and Dairy Cows here
                                    if ( tLivestockSum.FieldByName('EligibleForPremium').AsBoolean = True ) then
                                       CountSucklerCows := CountSucklerCows + 1
                                    else
                                       CountDairyCows := CountDairyCows + 1;
                                 end   //EndIf LactNum > 1
                              else
                                 begin   //LactNum < 2   Animal may have calved. Need to check when
                                    if (( tLivestockSum.FieldByName('LactNum').AsInteger = 1 ) AND ( tLivestockSum.FieldByName('FirstCalvingDate').AsDateTime <= CalcDate )) then
                                       begin    //Animal Calved - now a cow. Must determine whether a Dairy Or Suckler Cow
                                          //Need to include checks for Suckler Cows and Dairy Cows here
                                          if ( tLivestockSum.FieldByName('EligibleForPremium').AsBoolean = True ) then
                                             CountSucklerCows := CountSucklerCows + 1
                                          else
                                             CountDairyCows := CountDairyCows + 1;
                                       end
                                    else
                                       begin
                                          if (tLivestockSum.FieldByName('DOB').AsDateTime <= (CalcDate - 731)) then
                                             begin
                                                Count2plusYrs := Count2plusYrs + 1;      //<= two years or more old
                                              end
                                          else If ((tLivestockSum.FieldByName('DOB').AsDateTime > (CalcDate - 731)) AND
                                                   (tLivestockSum.FieldByName('DOB').AsDateTime <= (CalcDate - 365))) then
                                                    begin
                                                       Count1to2yrs := Count1to2yrs + 1;     //1 to 2 years old
                                                    end
                                          else If ((tLivestockSum.FieldByName('DOB').AsDateTime > (CalcDate - 365)) AND
                                                   (tLivestockSum.FieldByName('DOB').AsDateTime <= (CalcDate - 183))) then
                                           begin
                                                    Count6to12mths := Count6to12mths + 1;     //6 to 12 months old
                                          end

                                          else If (tLivestockSum.FieldByName('DOB').AsDateTime > (CalcDate - 183)) then
                                             begin
                                                    Count0to6mths := Count0to6mths + 1;     //Less than 6 months old
                                          end
                                       end;  //EndElse LactNum = 0
                                 end;
                              Next;
                           end;
                     end
                  else
                     Next;
              end;
         end;
      Inc(Tot0to6mths, Count0to6mths);
      Inc(Tot6to12mths, Count6to12mths);
      Inc(Tot1to2yrs, Count1to2yrs);
      Inc(Tot2plusYrs, Count2plusYrs);
      Inc(TotDairyCows, CountDairyCows);
      Inc(TotSucklerCows, CountSucklerCows);
   end;

   function GetNoOfMonths(Date1, Date2 : TDateTime) : Integer;
   var
     d1, m1, y1, d2, m2, y2 : Word;
   begin
      Result := 0;
      DecodeDate(Date1, Y1, M1, D1);
      DecodeDate(Date2, Y2, M2, D2);

      if Y1 <> Y2 then
         begin
            while m1 <= 12 do // count number of months in Year 1
               begin
                  inc(Result);
                  inc(m1);
               end;
            Result := Result + m2; // Add number of months in Year1 to Number of Months in year2
         end
       else
          begin
            while M1 <= m2 do // count number of months in Year2
               begin
                  inc(Result);
                  inc(m1);
               end;
            end
   end;



begin
   bDateChanged := False;
   bDataCalc := True;
   NoOfDays := 0;
   NoOfMonths := 0;
   NoOfYears := 0;

  WinData.tIntHerd.Open;
   with LivestockWaste do
      Try


         nStartMonth := cbStartMonth.ItemIndex+1; // Set the month
         nStartYear := StrToInt(cbStartYear.Text); // Set the Year

         nEndMonth := cbEndMonth.ItemIndex+1; // Set the month
         nEndYear  := StrToInt(cbEndYear.Text); // Set the Year

         StartDate := GetEndOfMthDate(nStartMonth, nStartYear);
         EndDate   := GetEndOfMthDate(nEndMonth, nEndYear);

         if nStartYear >= nEndYear then
            if nStartMonth > nEndMonth then
               begin
                  MessageDlg('Start date cannot be after end date',mtError,[mbOK],0);
                  Abort;
               end;


         DateDiff( StartDate, EndDate, NoOfDays, NoOfMonths, NoOfYears);
         NoOfMonths := GetNoOfMonths(StartDate, EndDate);
         //ShowMessage(IntToStr(NoOfMonths));
         //Inc(NoOfMonths); // Include the current month in Number of Months Since Start Month

         if ( NoOfYears  > 0 ) then
            begin
               MessageDlg('Start/End dates can''t be more than a year apart',mtError,[mbOK],0);
               Abort;
            end;

         // Now get the Date of the first month in the REPS Report
         FirstDate := GetEndOfMthDate(nStartMonth, nStartYear);

         qAnimalWaste.SQL.Clear;
         qAnimalWaste.SQL.Add('DELETE FROM TempLiveStock');
         qAnimalWaste.ExecSQL;

         //Now to create a table of all possible animals
         //First select animals whose Date Of Birth is before last date in REPS report

         qAnimalWaste.SQL.Clear;
         qAnimalWaste.SQL.Add('INSERT INTO TempLiveStock (AnimalID, DOB, LactNum, PrimaryBreed)');
         qAnimalWaste.SQL.Add('SELECT DISTINCT D.ID, D.DateOfBirth, D.LactNo, D.PrimaryBreed');
         qAnimalWaste.SQL.Add('FROM "Animals.db" D');
         qAnimalWaste.SQL.Add('WHERE (not( D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
         qAnimalWaste.SQL.Add(' AND ( D.AnimalDeleted = False )');   //Excludes deleted animals
         qAnimalWaste.SQL.Add(' AND ( D.HerdID = "' + IntToStr(WinData.UserDefaultHerdID) + '" ) ');
         qAnimalWaste.SQL.Add(' AND (D.DateOfBirth <= "' + FormatDateTime(cUSDateStyle,(EndDate)) + '" ) ');
         qAnimalWaste.ExecSQL;

         // new queries to account for interherd movements - 11/4/00 - kr
         // adds animals moved OFF herd after date FROM
         with qAnimalWaste do
            begin
               SQL.Clear;
               SQL.Add('INSERT INTO TempLiveStock (AnimalID, DOB, LactNum, PrimaryBreed)');
               SQL.Add('SELECT DISTINCT D.ID, D.DateOfBirth, D.LactNo, D.PrimaryBreed');
               SQL.Add('FROM "Animals.db" D');
               SQL.Add('LEFT JOIN IHM.db I ON (D.ID = I.AnimalID)');
               SQL.Add('WHERE (I.LastHerdID = "' + HerdCombo.Value + '" )');
               SQL.Add('AND   (I.DateMoved <= "' + FormatDateTime(cUSDateStyle,(EndDate)) + '")');
               SQL.Add('AND   (D.AnimalDeleted = False)');
               ExecSql;
            end;

         // Removes animals moved ON herd after Date TO
         with qAnimalWaste do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM TempLiveStock.db L');
               SQL.Add('WHERE L.AnimalID IN');
               SQL.Add('     (SELECT DISTINCT I.AnimalID');
               SQL.Add('      FROM IHM.db I');
               SQL.Add('	WHERE (I.NewHerdID = "' + HerdCombo.Value + '" )');
               SQL.Add('	AND   (I.DateMoved > "' + FormatDateTime(cUSDateStyle,(EndDate)) + '"))');
               ExecSql;
             end;

         //Now to update tLivestockSum table with Include field set to True
         qAnimalWaste.SQL.Clear;
         qAnimalWaste.SQL.Add('UPDATE ' + tLivestockSum.TableName + ' SET Include = True, EligibleForPremium = FALSE');   //Set Include to true for all animals
         qAnimalWaste.ExecSQL;

         // get record count for progress bar
         // set progress bar parameters
         pbNutMan.Show;
         pbNutMan.Min := 0;
         pbNutMan.Position := pbNutMan.Min;
         pbNutMan.Max := tLivestockSum.RecordCount;
         pbNutMan.Step:= 1;

         //Now to add Date of Purchase and Date of Sale/Death and compare these dates
         //with the earliest (FirstDate) and latest dates (InputDate) in REPS Report.
         //Set Include = False for all animals outside date ranges

         WinData.CheckEvents.Open;
         With tLivestockSum do
            Begin
               First;
               while NOT (tLivestockSum.EOF) do
                  begin
                     Edit;
                     { First get the Purchase event (if any) and exclude those animals purchased after last date in REPS report }

                     if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CPurchaseEvent]),[] ) then
                        begin
                           tLivestockSum.FieldByName('PurchDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                           if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > EndDate then
                              tLivestockSum.FieldByName('Include').AsBoolean := FALSE    { Purchased after last date in REPS Report }
                        end;

                     { Second - if still included, get the Sale/Death event (if any) and exclude those sold/died on or before first date in REPS Report }
                     if (tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CSaleDeathEvent]),[] )) then
                        begin
                           tLivestockSum.FieldByName('SaleDeathDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                           if WinData.CheckEvents.FieldByName('EventDate').AsDateTime <= FirstDate then
                              tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before earliest date in REPS Report
                        end;


                      if ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.tIntHerd.Locate('AnimalID',tLivestockSum.FieldByName('AnimalID').AsVariant,[] ) )) then
                         begin
                            if WinData.tIntHerd.FieldByName('LastHerdID').AsInteger = StrToInt(HerdCombo.Value) then
                               begin
                                  tLivestockSum.FieldByName('DateMovedOff').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                                  If tLivestockSum.FieldByName('DateMovedOff').AsDateTime <= FirstDate then
                                      tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before earliest date in REPS Report
                               end
                            else if WinData.tIntHerd.FieldByName('NewHerdID').AsInteger = StrToInt(HerdCombo.Value) then
                               begin
                                  tLivestockSum.FieldByName('DateMovedOn').AsDateTime := WinData.tIntHerd.FieldByName('DateMoved').AsDateTime;
                                  If tLivestockSum.FieldByName('DateMovedOn').AsDateTime > EndDate then
                                      tLivestockSum.FieldByName('Include').AsBoolean := FALSE;    //Sold/Died on or before earliest date in REPS Report
                               end;
                         end;

                      //Now to check the breeds table and determine whether eligible for Premium
                      If ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (WinData.Breeds.Locate('ID',tLivestockSum.FieldByName('PrimaryBreed').AsVariant,[] ) )) then
                         Begin  //If still included and has a nonzero BreedID, then get Premium Indicator.
                            tLivestockSum.FieldByName('EligibleForPremium').AsBoolean := WinData.Breeds.FieldByName('EligibleForPremium').AsBoolean;
                         End;
                      //Now need to get first calving date (if it exists)
                      If ((tLivestockSum.FieldByName('Include').AsBoolean = TRUE) AND (tLivestockSum.FieldByName('LactNum').AsInteger > 0)) then
                         Begin  //If still included and has a nonzero Lactation Number, then get Date Of First Calving - Note: The CheckEvents table is indexed on EventDate
                            If ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([tLivestockSum.FieldByName('AnimalID').AsVariant,CCalvingEvent]),[] )) then
                               tLivestockSum.FieldByName('FirstCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                         End;

                      Post;
                      pbNutMan.Stepit;
                      Next;
                   End;
            End;
      // initialise Total variables
      Tot0to6mths := 0;
      Tot6to12mths := 0;
      Tot1to2yrs := 0;
      Tot2plusYrs := 0;
      TotDairyCows := 0;
      TotSucklerCows := 0;

      if nStartYear <> nEndYear then
         begin
            for ThisMonth := nStartMonth to 12 do
               begin
                  CalcAnimals(ThisMonth, nStartYear);
               end;

//            DisplayDate := EncodeDate(nEndYear,nEndMonth,DaysPerMonth(nEndYear,nEndMonth));
//            lPeriod.Caption := { lPeriod.Caption + ' - ' + } FormatDateTime('mm / yyyy', DisplayDate);
            for ThisMonth := 1 to nEndMonth do
               begin
                  CalcAnimals(ThisMonth, nEndYear);
               end;
         end
      else
         begin
//            lPeriod.Caption := { lPeriod.Caption + ' - ' + } FormatDateTime('mm / yyyy', DisplayDate);
            for ThisMonth := nStartMonth to nEndMonth do
               begin
                  CalcAnimals(ThisMonth, nEndYear);
               end;
         end;

      DisplayDate := EncodeDate(nStartYear,nStartMonth,DaysPerMonth(nStartYear,nStartMonth));
      lPeriod.Caption := '';
      lPeriod.Caption := Format('From %s %s',[GetMonthShortNameFromMonthIndex(nStartMonth),FormatDateTime('yyyy', DisplayDate)]);
      DisplayDate := EncodeDate(nEndYear,nEndMonth,DaysPerMonth(nEndYear,nEndMonth));
      lPeriod.Caption :=  lPeriod.Caption + Format(' to %s %s',[GetMonthShortNameFromMonthIndex(nEndMonth),FormatDateTime('yyyy', DisplayDate)]);

      //Now to write the REPS report totals figures
      with WinData.LiveStockValues do
         begin
            First;
            Edit;
            try
               FieldByName('WP_DairyCows').AsInteger   := Trunc(TotDairyCows/NoOfMonths);
               FieldByName('WP_SucklerCows').AsInteger := Trunc(TotSucklerCows/NoOfMonths);
               FieldByName('WP_Catt0_12').AsInteger    := Trunc((Tot0to6mths+Tot6to12mths)/NoOfMonths);
               FieldByName('WP_Catt12_24').AsInteger   := Trunc(Tot1to2yrs/NoOfMonths);
               FieldByName('WP_Catt24Plus').AsInteger  := Trunc(Tot2plusYrs/NoOfMonths);
               Post;
            except
               Cancel;
            end;
         end;

            pbNutMan.Hide;
          finally
               WinData.tIntHerd.Close;
          end;
end;

procedure TLivestockWaste.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TLivestockWaste.sbViewClick(Sender: TObject);
begin
   ForageAreaCalc;

   if ( HerdCombo.Value <> '0' ) and ( HerdCombo.Value <> '' ) then
      lHerdId.Caption := HerdCombo.Text
   else
      begin
         MessageDlg('You must select a herd',mtWarning,[mbOK],0);
         HerdCombo.DropDown;
         Abort;
      end;

   if ( tForageArea > 0 ) then
      lForageArea.Caption := FloatToStr(tForageArea)
   else
      lForageArea.Caption := '';

   with qAnimalWaste do
      begin
         SQL.Clear;
         SQL.Add('Select * From LiveStockValues ');
         SQL.Add('Where HerdID = '+HerdCombo.Value+'');
         Open;
      end;

   if ( bDateChanged ) and ( not  bDataCalc ) then
      GetNutrientData;

   AnimalWasteProd.Preview;
end;

procedure TLivestockWaste.FormCreate(Sender: TObject);
begin
   bDateChanged := True;
   bDataCalc := False;

   AnimalWasteProd.Hide;
   WinData.LiveStockValues.Open;

   cbStartYear.Items.Clear;
   cbStartYear.Items.Add(FormatDateTime('yyyy',Date));           //Current year
   cbStartYear.Items.Add(FormatDateTime('yyyy',IncMonth(Date, -12)));
   cbStartYear.Items.Add(FormatDateTime('yyyy',IncMonth(Date, -24)));
   cbStartYear.Items.Add(FormatDateTime('yyyy',IncMonth(Date, -36)));
   cbStartYear.Items.Add(FormatDateTime('yyyy',IncMonth(Date, -48)));

   cbEndYear.Items.Clear;
   cbEndYear.Items.Assign(cbStartYear.Items);

{   cbEndYear.ItemIndex := 0;

   cbStartMonth.ItemIndex := 0;
   try
      if ExtractMonth(Date) <> 1 then
         cbEndMonth.ItemIndex := ExtractMonth(Date)-2;
   except
      cbEndMonth.ItemIndex := 0;
   end;  }

   // This is the way Gerry wants the defaults to appear.
   // 1 month / last year to last month / last year.

   cbStartYear.ItemIndex := 1;
   cbEndYear.ItemIndex := 1;

   cbStartMonth.ItemIndex := 0;
   try
      cbEndMonth.ItemIndex := 11;
   except
   end;


   tLivestockSum := TTable.Create(nil);
   tLivestockSum.DatabaseName := WinData.KingData.DatabaseName;
   tLivestockSum.TableName := 'TempLiveStock';
   tLivestockSum.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
   tLivestockSum.FieldDefs.Add('DOB',ftDate,0,FALSE);
   tLivestockSum.FieldDefs.Add('LactNum',ftSmallint,0,FALSE);
   tLivestockSum.FieldDefs.Add('PrimaryBreed',ftInteger,0,FALSE);
   tLivestockSum.FieldDefs.Add('EligibleForPremium',ftBoolean,0,FALSE);
   tLivestockSum.FieldDefs.Add('PurchDate',ftDate,0,FALSE);
   tLivestockSum.FieldDefs.Add('SaleDeathDate',ftDate,0,FALSE);
   tLivestockSum.FieldDefs.Add('FirstCalvingDate',ftDate,0,FALSE);
   tLivestockSum.FieldDefs.Add('Include',ftBoolean,0,FALSE);
   tLivestockSum.FieldDefs.Add('DateMovedOn',ftDate,0,FALSE);
   tLivestockSum.FieldDefs.Add('DateMovedOff',ftDate,0,FALSE);
   tLivestockSum.CreateTable;
   tLivestockSum.Open;

   if WinData.LiveStockValues.FieldByName('WP_EwesMountain').IsNull then
      Begin
         WinData.LiveStockValues.Edit;
         WinData.LiveStockValues.FieldByName('WP_EwesMountain').AsInteger := 0;
      end;
   if WinData.LiveStockValues.FieldByName('WP_EwesLowland').IsNull then
      Begin
         WinData.LiveStockValues.Edit;
         WinData.LiveStockValues.FieldByName('WP_EwesLowland').AsInteger := 0;
      end;
   if WinData.LiveStockValues.FieldByName('WP_HoggetsMountain').IsNull then
      Begin
         WinData.LiveStockValues.Edit;
         WinData.LiveStockValues.FieldByName('WP_HoggetsMountain').AsInteger := 0;
      end;
   if WinData.LiveStockValues.FieldByName('WP_HoggetsLowland').IsNull then
      Begin
         WinData.LiveStockValues.Edit;
         WinData.LiveStockValues.FieldByName('WP_HoggetsLowland').AsInteger := 0;
      end;

   if ( WinData.LiveStockValues.State = dsEdit ) then
      try
         WinData.LiveStockValues.Post;
      except
         WinData.LiveStockValues.Cancel;
      end;

end;

procedure TLivestockWaste.MtEweEnter(Sender: TObject);
begin
   if WinData.LiveStockValues.State = dsBrowse then
      WinData.LiveStockValues.Edit;
end;

procedure TLivestockWaste.MtEweExit(Sender: TObject);
begin
   if WinData.LiveStockValues.State in dsEditModes then
      WinData.LiveStockValues.Post;
end;

procedure TLivestockWaste.sbCalcClick(Sender: TObject);
begin
   sbCalc.enabled := False;
   try
      if (HerdCombo.Value = '0') then //and (rgSelReport.ItemIndex <> 1) then
         MessageDlg('Please select a Herd', mtinformation, [mbok],0)
      else
         GetNutrientData;
   finally
      sbCalc.enabled := True;
   end;
end;

procedure TLivestockWaste.FormShow(Sender: TObject);
begin
   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
end;

procedure TLivestockWaste.HerdComboChange(Sender: TObject);
begin
   if HerdCombo.Value <> '0' then
      WinData.UserDefaultHerdID := StrToInt(HerdCombo.Value);
end;

procedure TLivestockWaste.ForageAreaCalc;
begin
   tForageArea := WinData.ForageArea; //* dmFarmDiary.DefaultAreaMultTo; only output in metric.
end;

procedure TLivestockWaste.QRExpr19Print(sender: TObject;
  var Value: String);
var
   TotalPKgs : Double;
begin
   lAvgP.Caption := '0';
   if ( tForageArea > 0 ) then
      begin
         if ( Value <> '0' ) or ( Value <> '' ) then
            begin
               try
                  TotalPKgs := StrToFloat(Value);
                  if ( TotalPKgs > 0 ) then
                     lAvgP.Caption := FloatToStrF(TotalPKgs / tForageArea, ffFixed, 8, 2);
               except
               end;
            end;
      end;
end;

procedure TLivestockWaste.FormActivate(Sender: TObject);
begin
   WinData.pDefs.First;
end;

procedure TLivestockWaste.QRLabel35Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_DairyCows.AsInteger *
                ((WinData.pDefsNPDairyCow.AsFloat/12) * NoOfMonths), ffFixed,8, 2);
end;

procedure TLivestockWaste.QRLabel11Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_DairyCows.AsInteger *
                ((WinData.pDefsPPDairyCow.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel36Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_SucklerCows.AsInteger *
                ((WinData.pDefsNPSucklerCow.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel13Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_SucklerCows.AsInteger *
                ((WinData.pDefsPPSucklerCow.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel38Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_Catt0_12.AsInteger *
                ((WinData.pDefsNPCattle0to12Mths.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel14Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_Catt0_12.AsInteger *
                ((WinData.pDefsPPCattle0to12Mths.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel39Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_Catt12_24.AsInteger *
                ((WinData.pDefsNPCattle1to2Yrs.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel15Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_Catt12_24.AsInteger *
                ((WinData.pDefsPPCattle1to2Yrs.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel40Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_Catt24Plus.AsInteger *
                ((WinData.pDefsNPCattle2YrsPlus.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel16Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_Catt24Plus.AsInteger *
                ((WinData.pDefsPPCattle2YrsPlus.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel42Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_EwesMountain.AsInteger *
                ((WinData.pDefsNPMTEweLamb.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel17Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_EwesMountain.AsInteger *
                ((WinData.pDefsPPMTEweLamb.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel43Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_EwesLowland.AsInteger *
                ((WinData.pDefsNPLowEweLamb.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel18Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_EwesLowland.AsInteger *
                ((WinData.pDefsPPLowEweLamb.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel45Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_HoggetsMountain.AsInteger *
                ((WinData.pDefsNPMTHogget.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel19Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_HoggetsMountain.AsInteger *
                ((WinData.pDefsPPMTHogget.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel46Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_HoggetsLowland.AsInteger *
                ((WinData.pDefsNPLowHogget.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.QRLabel20Print(sender: TObject;
  var Value: String);
begin
   Value :=
   FloatToStrF( WinData.LiveStockValuesWP_HoggetsLowland.AsInteger *
                ((WinData.pDefsPPLowHogget.AsFloat/12) * NoOfMonths), ffFixed	, 8, 2);
end;

procedure TLivestockWaste.AnimalWasteProdPreview(Sender: TObject);
var
   TotalKgs : Double;
begin
{
   lAvgN.Caption := '0';
   lAvgP.Caption := '0';
   qrlTotalNKg.Caption := '0';
   qrlTotalPKg.Caption := '0';

   TotalKgs := HerdProps.LiveStockValuesWP_DairyCows.AsInteger * dmFarmDiary.pDefsNPDairyCow.AsFloat +
   HerdProps.LiveStockValuesWP_SucklerCows.AsInteger * dmFarmDiary.pDefsNPSucklerCow.AsFloat +
   HerdProps.LiveStockValuesWP_Catt0_12.AsInteger * dmFarmDiary.pDefsNPCattle0to12Mths.AsFloat +
   HerdProps.LiveStockValuesWP_Catt12_24.AsInteger * dmFarmDiary.pDefsNPCattle1to2Yrs.AsFloat +
   HerdProps.LiveStockValuesWP_Catt24Plus.AsInteger * dmFarmDiary.pDefsNPCattle2YrsPlus.AsFloat +
   HerdProps.LiveStockValuesWP_EwesMountain.AsInteger * dmFarmDiary.pDefsNPMTEweLamb.AsFloat +
   HerdProps.LiveStockValuesWP_EwesLowland.AsInteger * dmFarmDiary.pDefsNPLowEweLamb.AsFloat +
   HerdProps.LiveStockValuesWP_HoggetsMountain.AsInteger * dmFarmDiary.pDefsNPMTHogget.AsFloat +
   HerdProps.LiveStockValuesWP_HoggetsLowland.AsInteger * dmFarmDiary.pDefsNPLowHogget.AsFloat;

   qrlTotalNKg.Caption := FloatToStrF(TotalKgs,ffGeneral, 8, 2);

   if ( tForageArea > 0 ) and ( TotalKgs > 0 ) then
      lAvgN.Caption := FloatToStrF(TotalKgs / tForageArea, ffFixed, 8, 2);

   TotalKgs := 0;

   TotalKgs := HerdProps.LiveStockValuesWP_SucklerCows.AsInteger * dmFarmDiary.pDefsPPSucklerCow.AsFloat +
   HerdProps.LiveStockValuesWP_DairyCows.AsInteger * dmFarmDiary.pDefsPPDairyCow.AsFloat+
   HerdProps.LiveStockValuesWP_Catt0_12.AsInteger * dmFarmDiary.pDefsPPCattle0to12Mths.AsFloat+
   HerdProps.LiveStockValuesWP_Catt12_24.AsInteger * dmFarmDiary.pDefsPPCattle1to2Yrs.AsFloat+
   HerdProps.LiveStockValuesWP_Catt24Plus.AsInteger * dmFarmDiary.pDefsPPCattle2YrsPlus.AsFloat+
   HerdProps.LiveStockValuesWP_EwesMountain.AsInteger * dmFarmDiary.pDefsPPMTEweLamb.AsFloat+
   HerdProps.LiveStockValuesWP_EwesLowland.AsInteger * dmFarmDiary.pDefsPPLowEweLamb.AsFloat+
   HerdProps.LiveStockValuesWP_HoggetsMountain.AsInteger * dmFarmDiary.pDefsPPMTHogget.AsFloat+
   HerdProps.LiveStockValuesWP_HoggetsLowland.AsInteger * dmFarmDiary.pDefsPPLowHogget.AsFloat ;

   qrlTotalPKg.Caption := FloatToStrF(TotalKgs, ffGeneral, 8, 2);

   if ( tForageArea > 0 ) and ( TotalKgs > 0 ) then
      lAvgP.Caption := FloatToStrF(TotalKgs / tForageArea, ffFixed, 8, 2);
       }
end;

procedure TLivestockWaste.AnimalWasteProdBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TotalKgs : Double;
begin
  lAvgN.Caption := '0';
   lAvgP.Caption := '0';
   qrlTotalNKg.Caption := '0';
   qrlTotalPKg.Caption := '0';

   TotalKgs :=

    ( WinData.LiveStockValuesWP_DairyCows.AsInteger *
   ((WinData.pDefsNPDairyCow.AsFloat/12) * NoOfMonths )) +

   WinData.LiveStockValuesWP_SucklerCows.AsInteger *
   ((WinData.pDefsNPSucklerCow.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_Catt0_12.AsInteger *
   ((WinData.pDefsNPCattle0to12Mths.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_Catt12_24.AsInteger *
   ((WinData.pDefsNPCattle1to2Yrs.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_Catt24Plus.AsInteger *
   ((WinData.pDefsNPCattle2YrsPlus.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_EwesMountain.AsInteger *
   ((WinData.pDefsNPMTEweLamb.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_EwesLowland.AsInteger *
   ((WinData.pDefsNPLowEweLamb.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_HoggetsMountain.AsInteger *
   ((WinData.pDefsNPMTHogget.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_HoggetsLowland.AsInteger *
   ((WinData.pDefsNPLowHogget.AsFloat/12) * NoOfMonths );

   qrlTotalNKg.Caption := FloatToStrF(TotalKgs,ffFixed, 8, 2);

   if ( tForageArea > 0 ) and ( TotalKgs > 0 ) then
      lAvgN.Caption := FloatToStrF(TotalKgs / tForageArea, ffFixed, 8, 2);

   TotalKgs := 0;

   TotalKgs :=

   (WinData.LiveStockValuesWP_SucklerCows.AsInteger *
   ((WinData.pDefsPPSucklerCow.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_DairyCows.AsInteger *
   ((WinData.pDefsPPDairyCow.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_Catt0_12.AsInteger *
   ((WinData.pDefsPPCattle0to12Mths.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_Catt12_24.AsInteger *
   ((WinData.pDefsPPCattle1to2Yrs.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_Catt24Plus.AsInteger *
   ((WinData.pDefsPPCattle2YrsPlus.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_EwesMountain.AsInteger *
   ((WinData.pDefsPPMTEweLamb.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_EwesLowland.AsInteger *
   ((WinData.pDefsPPLowEweLamb.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_HoggetsMountain.AsInteger *
   ((WinData.pDefsPPMTHogget.AsFloat/12) * NoOfMonths ) +

   WinData.LiveStockValuesWP_HoggetsLowland.AsInteger *
   ((WinData.pDefsPPLowHogget.AsFloat/12) * NoOfMonths ));

   qrlTotalPKg.Caption := FloatToStrF(TotalKgs, ffFixed, 8, 2);

   if ( tForageArea > 0 ) and ( TotalKgs > 0 ) then
      lAvgP.Caption := FloatToStrF(TotalKgs / tForageArea, ffFixed, 8, 2);
end;

procedure TLivestockWaste.sbWasteProdRatesClick(Sender: TObject);
begin
   TfmSetupWasteProdRates.ShowForm( WinData.GetHerdCountry(WinData.OwnerFile, HerdCombo.Value));
end;

procedure TLivestockWaste.cbStartMonthChange(Sender: TObject);
begin
   bDateChanged := True;
   bDataCalc := False;
end;

procedure TLivestockWaste.QRDBText6Print(sender: TObject;
  var Value: String);
var
   tValue : Double;
begin
   if ( Value <> '' ) then
      begin
         tValue := StrToFloat(Value);
         if ( tValue > 0 ) then
            begin
               tValue := ( tValue / 12 ) * NoOfMonths;
               Value := FloatToStrF(tValue, ffFixed, 8, 2);
            end;
      end;
end;

end.
