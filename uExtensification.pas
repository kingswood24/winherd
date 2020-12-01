unit uExtensification;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, StdCtrls, Buttons, ExtCtrls, DBTables, DB, Mask, DBCtrls, RXSpin,
  ToolEdit, RXDBCtrl, ComCtrls, CurrEdit, RXCtrls, ToolWin;

type
  TfExtensification = class(TForm)
    dsExtTable: TDataSource;
    pcExtensification: TPageControl;
    tsInputs: TTabSheet;
    tsResults: TTabSheet;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label47: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit33: TDBEdit;
    dbeNoUnder24Mths: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit37: TDBEdit;
    dbe10MthToDeduct: TDBEdit;
    DBEdit41: TDBEdit;
    dbeUnder24MthToDeduct: TDBEdit;
    DBEdit45: TDBEdit;
    dbeOver24MthToDeduct: TDBEdit;
    dbeSBPLessExt: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    dbeForageHectares: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    eNoUnder24Mths: TCurrencyEdit;
    eNoOver24Mths: TCurrencyEdit;
    eSBPExExten: TCurrencyEdit;
    eSBPInclExten: TCurrencyEdit;
    eOverLUS: TCurrencyEdit;
    BeefMemo: TMemo;
    gbBeefApplied: TGroupBox;
    gbNonBeef: TGroupBox;
    gbBeefEligible: TGroupBox;
    lCowAmt2: TLabel;
    lCowAmt: TLabel;
    eCowPnds: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit16: TDBEdit;
    lEweAmt: TLabel;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    lSucklerAmt: TLabel;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    Label29: TLabel;
    Label18: TLabel;
    GroupBox1: TGroupBox;
    Label30: TLabel;
    Label28: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit19: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit30: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit22: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit31: TDBEdit;
    PBar: TProgressBar;
    GenQuery: TQuery;
    ExtTable: TTable;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbCalc: TRxSpeedButton;
    bLUSetup: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    Panel2: TPanel;
    Label9: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    Label1: TLabel;
    DBDateEdit2: TDBDateEdit;
    procedure ExitButtonClick(Sender: TObject);
    procedure cbDefaultHerdCloseUp(Sender: TObject);
    procedure DoCalculations(Sender: TObject);     // Do on screen calculations
    procedure CalculatePremiums(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbe10MthToDeductExit(Sender: TObject);
    procedure dbeUnder24MthToDeductExit(Sender: TObject);
    procedure dbeOver24MthToDeductExit(Sender: TObject);
    procedure dbe10MthToDeductEnter(Sender: TObject);
    procedure bLUSetup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);  // Calc the no applied for and eligible
  private
    { Private declarations }
    YearOfDate,
    MonthOfDate,
    DayOfDate : Word;
    // ExtTable   : TTable;
    // GenQuery   : TQuery;
    EndDate    : TDate;
    TempTable : TTable;
    procedure CheckState;
    procedure InsertDefault ( DefaultHerd : Integer );
    procedure ShowNote;
  public
    { Public declarations }
    procedure GetApplicationsThisYear ( Var First, Under24, Over24 : Integer;
                                        YearOfApplic, HerdID : Integer;
                                        MyTable : TTable );
    procedure CreateTempTable ( var MyTable : TTable );
  end;

// procedure ShowForm;
var
   fExtensification : TfExtensification;

implementation

uses GenTypesConst,
     DairyData,
     uExtDefaults;

{$R *.DFM}
procedure ShowForm;
begin
   with TfExtensification.Create(nil) do
      try
         GenQuery := TQuery.Create(nil);
         GenQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;

         CreateTempTable ( TempTable );
         (*
         TempTable := TTable.Create(Nil);
         TempTable.TableName := 'ExtTemp.db';
         TempTable.TableType := ttParadox;
         TempTable.DatabaseName := WinData.KingData.DatabaseName;
         with TempTable.FieldDefs do
            begin
               Add('AnimalID',ftInteger,0,False);
               Add('AnimalNo',ftString,10,False);
               Add('NatIDNum',ftString,20,False);
               Add('DOB',     ftDate,0,False);
               Add('EligDate',ftDate,0,False);
               Add('ApplicDate',ftDate,0,False);
            end;
         TempTable.CreateTable;
         TempTable.Open;
         *)

         // ExtTable := TTable.Create(Nil);
         ExtTable.TableName := 'ext001.db';
         ExtTable.TableType := ttParadox;
         ExtTable.DatabaseName := WinData.KingData.DatabaseName;

         try  // Try and open the Herd Extensification Defaults
            ExtTable.Open;
            // Search for this herds Defaults
            if NOT ExtTable.Locate('HerdID',WinData.UserDefaultHerdID,[] ) then
               begin
                  InsertDefault ( WinData.UserDefaultHerdID );
                  ExtTable.Edit;
               end
            else
               begin
                  ExtTable.Edit;
                  ExtTable.FieldByName('DateTo').AsDateTime := Date();
                  // cbDefaultHerd.value := ExtTable.FieldByName('HerdID').AsString;
               end;
         except // Cannot Open so create the Table
            // if table won;t open create it
//            Windata.CreateExtTable;
            (*
            with ExtTable.FieldDefs do
               begin
                  Add('HerdID',   ftInteger,0,True);
                  Add('Year',     ftInteger,0,False);
                  Add('DateTo',   ftDate,0,False);
                  Add('FHect',    ftFloat,0,False);
                  Add('LUExtPrem',ftFloat,0,False);
                  Add('LUBase',   ftFloat,0,False);
                  Add('LUMin',    ftFloat,0,False);
                  Add('ExtAmt',   ftFloat,0,False);
                  Add('PremAmt',  ftFloat,0,False);
                  Add('MaxLUS',   ftFloat,0,False);
                  Add('MilkQuota',ftFloat,0,False);
                  Add('PndsCow',  ftFloat,0,False);
                  Add('NoCows',   ftInteger,0,False);
                  Add('PndsEwe',  ftFloat,0,False);
                  Add('NoEwe',    ftInteger,0,False);
                  Add('PndsSuckler',ftFloat,0,False);
                  Add('NoSuckler',ftInteger,0,False);

                  Add('LUS10Mth',       ftFloat,0,False);
                  Add('LUSUnder24Mth',  ftFloat,0,False);
                  Add('LUSOver24Mth',   ftFloat,0,False);
                  Add('LUSCow',         ftFloat,0,False);
                  Add('LUSEwe',         ftFloat,0,False);
                  Add('LUSSuckler',     ftFloat,0,False);
                  Add('TotalAmtCow',    ftFloat,0,False);
                  Add('TotalAmtEwe',    ftFloat,0,False);
                  Add('TotalAmtSuckler',ftFloat,0,False);

                  Add('seNo10Mth',           ftInteger,0,False);  // se = Still Eligible
                  Add('seNoUnder24Mth',      ftInteger,0,False);
                  Add('seNoOver24Mth',       ftInteger,0,False);
                  Add('se10MthLU',           ftFloat,0,False);
                  Add('seUnder24MthLU',      ftFloat,0,False);
                  Add('seOver24MthLU',       ftFloat,0,False);

                  Add('neNo10Mth',           ftInteger,0,False);  // ne = Not Eligible
                  Add('neNoUnder24Mth',      ftInteger,0,False);
                  Add('neNoOver24Mth',       ftInteger,0,False);
                  Add('ne10MthLU',           ftFloat,0,False);
                  Add('neUnder24MthLU',      ftFloat,0,False);
                  Add('neOver24MthLU',       ftFloat,0,False);

                  Add('TotalLUSStillElig',   ftFloat,0,False);
                  Add('TotalLUSAppliedFor',  ftFloat,0,False);
                  Add('TotalLUS',            ftFloat,0,False);

                  //Results Screen
                  Add('TotalLUSExceeding',   ftFloat,0,False);
                  Add('NoSteersUnder24Mths', ftFloat,0,False);
                  Add('NoSteersOver24Mths',  ftFloat,0,False);

                  Add('NoToDeduct10Mth',     ftInteger,0,False);
                  Add('NoToDeductUnder24Mth',ftInteger,0,False);
                  Add('NoToDeductOver24Mth', ftInteger,0,False);

                  Add('Deduct10MthLU',       ftFloat,0,False);
                  Add('DeductUnder24MthLU',  ftFloat,0,False);
                  Add('DeductOver24MthLU',   ftFloat,0,False);

                  Add('TotalSBPExExten',     ftCurrency,0,False);
                  Add('TotalSBPInclExten',   ftCurrency,0,False);

               end;
            with ExtTable.IndexDefs do
               Add('','HerdID',[ixPrimary,ixUnique]);
            // Since the Table was Created a new record needs to be inserted
            ExtTable.CreateTable;
            *)
            ExtTable.Open;
            InsertDefault ( WinData.UserDefaultHerdID );
            ExtTable.Edit;
         end;
         dsExtTable.DataSet := ExtTable;   // Assign the Data Source for Ext. Values
         cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);

         lCowAmt.Caption := lCowAmt.Caption + '(' + CurrencyString + ') ';
         WinData.Defaults.Open;
         pcExtensification.Hide;
         
         ShowModal;
      finally
         WinData.Defaults.Close;
         TempTable.Close;
         TempTable.DeleteTable;
         TempTable.Free;
         GenQuery.Free;
         dsExtTable.Free;
         ExtTable.Close;
         // ExtTable.Free;
         Free;
      end;
end;

procedure TfExtensification.CreateTempTable ( var MyTable : TTable );
begin
   MyTable := TTable.Create(Nil);
   MyTable.TableName := 'ExtTemp.db';
   MyTable.TableType := ttParadox;
   MyTable.DatabaseName := WinData.KingData.DatabaseName;
   with MyTable.FieldDefs do
      begin
         Add('AnimalID',ftInteger,0,False);
         Add('AnimalNo',ftString,10,False);
         Add('NatIDNum',ftString,20,False);
         Add('DOB',     ftDate,0,False);
         Add('EligDate',ftDate,0,False);
         Add('ApplicDate',ftDate,0,False);
      end;
   MyTable.CreateTable;
   MyTable.Open;
end;

procedure TfExtensification.ShowNote;
begin
    BeefMemo.Clear;
    BeefMemo.Lines.Add('''Note that the maximum number of animals that Special Beef Premium will be');
    BeefMemo.Lines.Add('paid on must be less than a stocking density of ' + ExtTable.FieldByName('LUMin').AsString + ' L.U. per Ha. (if you have');
    BeefMemo.Lines.Add('a total of more than 15 L.U.''s). To qualify for extensification, you must');
    BeefMemo.Lines.Add('have a stocking density less than ' + ExtTable.FieldByName('LUBase').AsString + ' L.U.''s per Hectare.''');
end;

procedure TfExtensification.InsertDefault ( DefaultHerd : Integer );
begin
     ExtTable.Insert;
     ExtTable.FieldByName('HerdID').AsInteger := DefaultHerd;
     ExtTable.FieldByName('LUBase').AsFloat  := 1.4;
     ExtTable.FieldByName('LUMin').AsFloat  := StockDenLU; //  SP 2002
     ExtTable.FieldByName('YearToRun').AsFloat  := YearOfDate;
     ExtTable.FieldByName('DateTo').AsDateTime  := Date();
     ExtTable.FieldByName('ExtAmt').AsFloat  := 120;
     ExtTable.FieldByName('PremAmt').AsFloat := 90;
     ExtTable.FieldByName('LUS10Mth').AsFloat := 0.6;
     ExtTable.FieldByName('LUSUnder24Mth').AsFloat := 0.6;
     ExtTable.FieldByName('LUSOver24Mth').AsFloat := 1.0;
     ExtTable.Post;
end;

procedure TfExtensification.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfExtensification.cbDefaultHerdCloseUp(Sender: TObject);
begin
     CheckState;
end;

procedure TfExtensification.CheckState;
begin
     if NOT ExtTable.Locate('HerdID',cbDefaultHerd.Value,[] ) then
        InsertDefault ( StrToInt(cbDefaultHerd.Value) );
     if NOT ( ExtTable.State In dsEditModes ) then
        ExtTable.Edit;
end;

procedure TfExtensification.DoCalculations(Sender: TObject);
begin
    CheckState;
    with ExtTable, WinData do
       begin
          //DeCodeDate(FieldByName('DateTo').AsDateTime, nYear, nMonth, nDay );
          if FieldByName('YearToRun').IsNull then
             FieldByName('YearToRun').AsInteger := YearOfDate;
          FieldByName('LUExtPrem').AsFloat := FieldByName('FHect').AsFloat * FieldByName('LUBase').AsFloat;

          FieldByName('LUSCow').AsFloat := FieldByName('NoCows').AsInteger * cLUSCows; // DefaultsLUCow.AsFloat;
          FieldByName('TotalAmtCow').AsFloat := FieldByName('NoCows').AsInteger * FieldByName('PndsCow').AsFloat;
          FieldByName('LUSEwe').AsFloat := FieldByName('NoEwe').AsInteger * cLUSEwes;  // DefaultsLUEwe.AsFloat;
          FieldByName('TotalAmtEwe').AsFloat := FieldByName('NoEwe').AsInteger * FieldByName('PndsEwe').AsFloat;
          FieldByName('LUSSuckler').AsFloat := FieldByName('NoSuckler').AsInteger * cLUSSuckler;  // DefaultsLUSuckler.AsFloat;
          FieldByName('TotalAmtSuckler').AsFloat := FieldByName('NoSuckler').AsInteger * FieldByName('PndsSuckler').AsFloat;

          FieldByName('MaxLUS').AsFloat := FieldByName('FHect').AsFloat * StockDenLU; //  SP 2002

          FieldByName('se10MthLU').AsFloat := FieldByName('seNo10Mth').AsInteger * cLUS10;  //DefaultsLU10Mth.AsFloat;
          FieldByName('seUnder24MthLU').AsFloat := FieldByName('seNoUnder24Mth').AsInteger * cLUSUnder24;  // DefaultsLUUnder24Mth.AsFloat;
          FieldByName('seOver24MthLU').AsFloat := FieldByName('seNoOver24Mth').AsInteger * cLUSOver24; // DefaultsLUOver24Mth.AsFloat;
          FieldByName('TotalLUSStillElig').AsFloat := FieldByName('se10MthLU').AsFloat +
                                                      FieldByName('seUnder24MthLU').AsFloat +
                                                      FieldByName('seOver24MthLU').AsFloat;

          FieldByName('ne10MthLU').AsFloat := FieldByName('neNo10Mth').AsInteger * cLUS10;   // DefaultsLU10Mth.AsFloat;
          FieldByName('neUnder24MthLU').AsFloat := FieldByName('neNoUnder24Mth').AsInteger * cLUSUnder24; // DefaultsLUUnder24Mth.AsFloat;
          FieldByName('neOver24MthLU').AsFloat := FieldByName('neNoOver24Mth').AsInteger * cLUSOver24;// DefaultsLUOver24Mth.AsFloat;

          FieldByName('TotalLUSAppliedFor').AsFloat := FieldByName('ne10MthLU').AsFloat +
                                                       FieldByName('neUnder24MthLU').AsFloat +
                                                       FieldByName('neOver24MthLU').AsFloat;

          FieldByName('TotalLUS').AsFloat := FieldByName('LUSCow').AsFloat +
                                             FieldByName('LUSEwe').AsFloat +
                                             FieldByName('LUSSuckler').AsFloat +
                                             FieldByName('TotalLUSStillElig').AsFloat +
                                             FieldByName('TotalLUSAppliedFor').AsFloat;
          // Calculate the Results TAB
          if ( FieldByName('TotalLUS').AsFloat - FieldByName('LUExtPrem').AsFloat ) > 0 then
             begin
                try
                   FieldByName('TotalLUSExceeding').AsString :=
                      FloatToStrF((FieldByName('TotalLUS').AsFloat - FieldByName('LUExtPrem').AsFloat),ffFixed,8,2);
                   FieldByName('NoSteersUnder24Mths').AsString :=
                      FloatToStrF((FieldByName('TotalLUSExceeding').AsFloat / FieldByName('LUS10Mth').AsFloat),ffFixed,8,2);
                   FieldByName('NoSteersOver24Mths').AsString :=
                      FloatToStrF((FieldByName('TotalLUSExceeding').AsFloat / FieldByName('LUSOver24Mth').AsFloat),ffFixed,8,2);
                except
                end;
             end
          else
             begin
                FieldByName('TotalLUSExceeding').AsFloat := 0;
                FieldByName('NoSteersUnder24Mths').AsFloat := 0;
                FieldByName('NoSteersOver24Mths').AsFloat := 0;
             end;
          eNoUnder24Mths.Text := FloatToStrF(FieldByName('NoSteersUnder24Mths').AsFloat,ffFixed,8,2);
          eNoOver24Mths.Text := FloatToStrF(FieldByName('NoSteersOver24Mths').AsFloat,ffFixed,8,2);

          FieldByName('TotalSBPExExten').AsFloat := ( FieldByName('seNo10Mth').AsInteger +
                                                      FieldByName('seNoUnder24Mth').AsInteger +
                                                      FieldByName('seNoOver24Mth').AsInteger +
                                                      FieldByName('neNo10Mth').AsInteger +
                                                      FieldByName('neNoUnder24Mth').AsInteger +
                                                      FieldByName('neNoOver24Mth').AsInteger ) *
                                                      FieldByName('PremAmt').AsFloat;

          if FieldByName('NoToDeduct10Mth').AsInteger > 0 then
             FieldByName('Deduct10MthLU').AsFloat := FieldByName('NoToDeduct10Mth').AsInteger *
                                                         cLUS10 // DefaultsLU10Mth.AsFloat
          else
             FieldByName('Deduct10MthLU').AsFloat := 0;
          if FieldByName('NoToDeductUnder24Mth').AsInteger > 0 then
             FieldByName('DeductUnder24MthLU').AsFloat := FieldByName('NoToDeductUnder24Mth').AsInteger *
                                                         cLUSUnder24// DefaultsLUUnder24Mth.AsFloat
          else
             FieldByName('DeductUnder24MthLU').AsFloat := 0;
          if FieldByName('NoToDeductOver24Mth').AsInteger > 0 then
             FieldByName('DeductOver24MthLU').AsFloat := FieldByName('NoToDeductOver24Mth').AsInteger *
                                                         cLUSOver24 //   DefaultsLUOver24Mth.AsFloat
          else
             FieldByName('DeductOver24MthLU').AsFloat := 0;
          eOverLUS.Text := FloatToStrF(FieldByName('TotalLUSExceeding').AsFloat -
                                       ( FieldByName('Deduct10MthLU').AsFloat +
                                         FieldByName('DeductUnder24MthLU').AsFloat +
                                         FieldByName('DeductOver24MthLU').AsFloat ),
                                         ffFixed,8,2);

          if ( FieldByName('TotalLUSExceeding').AsFloat <=
             ( FieldByName('Deduct10MthLU').AsFloat +
               FieldByName('DeductUnder24MthLU').AsFloat +
               FieldByName('DeductOver24MthLU').AsFloat )) then
             FieldByName('TotalSBPInclExten').AsFloat := ( FieldByName('seNo10Mth').AsInteger +
                                                        FieldByName('seNoUnder24Mth').AsInteger +
                                                        FieldByName('seNoOver24Mth').AsInteger +
                                                        FieldByName('neNo10Mth').AsInteger +
                                                        FieldByName('neNoUnder24Mth').AsInteger +
                                                        FieldByName('neNoOver24Mth').AsInteger -
                                                        // Exclude the deductions
                                                        ( FieldByName('NoToDeduct10Mth').AsInteger +
                                                          FieldByName('NoToDeductUnder24Mth').AsInteger +
                                                          FieldByName('NoToDeductOver24Mth').AsInteger )) *
                                                        FieldByName('ExtAmt').AsFloat
          else
             FieldByName('TotalSBPInclExten').AsFloat := FieldByName('TotalSBPExExten').AsFloat;
          eSBPExExten.Text := FloatToStrF(FieldByName('TotalSBPExExten').AsFloat,ffFixed,8,2);
          eSBPInclExten.Text := FloatToStrF(FieldByName('TotalSBPInclExten').AsFloat,ffFixed,8,2);
       end;
end;

procedure TfExtensification.GetApplicationsThisYear ( var First, Under24, Over24 : Integer;
                                                      YearOfApplic, HerdID : Integer;
                                                      MyTable : TTable );
var
    gQuery       : TQuery;
    CutOffMonths : Integer;
    NoOfDays : Double;
    nYear,
    nMonth,
    nDay     : Word;
begin
  try
    gQuery := TQuery.Create(nil);
    gQuery.DatabaseName := WinData.KingData.DatabaseName;
    // Calculate the Number of Animals who have drawn the first Premium this Year
    with gQuery do
       begin
          SQL.Clear;
          SQL.Add('SELECT ID, AnimalNo, NatIDNum, DateOfBirth, EligibilityDate, ApplicationDate FROM Animals A, BeefSub B');
          SQL.Add('WHERE ( A.ID=B.AnimalID )');
          SQL.Add('AND   ( A.Sex = "Steer" )');
          //SQL.Add('OR     ( A.Sex = "Bull" ))'); Calculation for bull premia is now done in uApplications. 
          SQL.Add('AND NOT (A.HerdID= ' + IntToStr(WinData.NONEHerdID) + ')');
          SQL.Add('AND (B.PremiumType = "F")');
          //SQL.Add('OR   (B.PremiumType = "B"))');
          SQL.Add('AND (B.ApplicationID > -1)'); // Application Done
          SQL.Add('AND (Extract( YEAR FROM B.ApplicationDate ) = ' + '''' + IntToStr(YearOfApplic) + '''' +')');
          if ( HerdID > 0 ) then
             SQL.Add('AND (A.HerdID= ' + IntToStr(HerdID) + ')');
          Open;
       end;
    First := gQuery.RecordCount;

    Under24 := 0;
    Over24 := 0;
    MyTable.Close;
    MyTable.EmptyTable;
    MyTable.Open;
    with GQuery do
       begin
          SQL.Clear;
          SQL.Add('INSERT INTO ExtTemp ( AnimalID, AnimalNo, NatIDNum, DOB, EligDate, ApplicDate )');
          SQL.Add('SELECT ID, AnimalNo, NatIDNum, DateOfBirth, EligibilityDate, ApplicationDate FROM Animals A, BeefSub B');
          SQL.Add('WHERE ( A.ID=B.AnimalID )');
          SQL.Add('AND   ( A.Sex = "Steer" )');
          SQL.Add('AND NOT (A.HerdID= ' + IntToStr(WinData.NONEHerdID) + ')');
          SQL.Add('AND (B.PremiumType = "S")');
          SQL.Add('AND (B.ApplicationID > -1)'); // Application Done Yet
          SQL.Add('AND (Extract( YEAR FROM B.ApplicationDate ) = ' + '''' + IntToStr(YearOfApplic) + '''' +')');
          if HerdID > 0 then
             SQL.Add('AND (A.HerdID= ' + IntToStr(HerdID) + ')');
          PrePare;
          ExecSQL;
       end;
    MyTable.First;
    CutOffMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,C,F);
    while NOT MyTable.EOF do
       begin
          NoOfDays := ( MyTable.FieldByName('ApplicDate').AsDateTime-MyTable.FieldByName('DOB').AsDateTime );
          DeCodeDate( MyTable.FieldByName('DOB').AsDateTime, nYear, nMonth, nDay );
          if ( IsLeapYear ( nYear )) And
             ( nMonth <= 2 ) And
             ( nDay <=27 ) then
             NoOfDays := NoOfDays-1;
          if ( NoOfDays <= 730 ) then
             Inc ( Under24 )
          else
             Inc ( Over24 );
          MyTable.Next;
       end;
  finally
     gQuery.Free;
  end;
end;

procedure TfExtensification.CalculatePremiums(Sender: TObject);
Var
   nYear,
   nMonth,
   nDay         : Word;
   NoOfDays     : Double;
   DrawnFirst,
   Under24Mth,
   Over24Mth,
   CutOffMonths : Integer;
begin
    pBar.Show;
    if NOT ( ExtTable.State in dsEditModes ) then
       ExtTable.Edit;

    EndDate := StrToDateTime('31/12/' + ExtTable.FieldByName('YearToRun').AsString);
    gbBeefEligible.Caption := 'Beef Livestock Still Eligible between ' + ExtTable.FieldByName('DateTo').AsString + ' To ' + DateToStr(EndDate);

    Under24Mth := 0;
    Over24Mth := 0;
    TempTable.Close;
    TempTable.EmptyTable;
    TempTable.Open;
    // Calculate the Number of Animals who have NOT drawn the first Premium
    with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('INSERT INTO ExtTemp ( AnimalID, AnimalNo, NatIDNum, DOB, EligDate, ApplicDate )');
          SQL.Add('SELECT ID, AnimalNo, NatIDNum, DateOfBirth, EligibilityDate, ApplicationDate FROM Animals A, BeefSub B');
          SQL.Add('WHERE ( A.ID=B.AnimalID )');
          SQL.Add('AND   (( A.Sex = "Steer" )');
          SQL.Add('OR     ( A.Sex = "Bull" ))');
          SQL.Add('AND NOT (A.HerdID= ' + IntToStr(WinData.NONEHerdID) + ')');
          SQL.Add('AND ((B.PremiumType = "F")');
          SQL.Add('OR   (B.PremiumType = "B"))');
          SQL.Add('AND (B.ApplicationID = -1)'); // No Application Done Yet
          // SQL.Add('AND (B.EligibilityDate <= ' + '''' + FormatDateTime('mm/dd/yyyy',ExtTable.FieldByName('DateTo').AsDateTime) + '''' +')');
          SQL.Add('AND (B.EligibilityDate <= ' + '''' + FormatDateTime('mm/dd/yyyy',EndDate) + '''' +')');

          if Length( cbDefaultHerd.Value ) > 0 then
             SQL.Add('AND (A.HerdID= ' + cbDefaultHerd.Value + ')');
          // Check the Animal is not Sold
          SQL.Add('AND A.ID NOT IN ( SELECT AnimalID FROM Events E');
          SQL.Add('                  WHERE ( E.AnimalID=A.ID )');
          SQL.Add('                  AND ( E.EventType = ' + IntToStr(CSaleDeathEvent) + '))');
          PrePare;
          ExecSQL;
       end;
    TempTable.First;
    CutOffMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,C,F);

    pBar.Min := 1;
    if TempTable.Recordcount > 0 then
       pBar.Max := TempTable.RecordCount;

    while NOT TempTable.EOF do
       begin
          // Use the Date entered by user as the pivot date
          if ( ExtTable.FieldByName('DateTo').AsDateTime > ( IncMonth( TempTable.FieldByName('DOB').AsDateTime, CutOffMonths)-1) ) then
             TempTable.Delete
          else
             TempTable.Next;
          pBar.StepIt;
       end;
    ExtTable.FieldByName('seNo10Mth').AsInteger := TempTable.RecordCount;

    (*
    // Calculate the Number of Animals who have drawn the first Premium this Year
    with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('SELECT ID, AnimalNo, NatIDNum, DateOfBirth, EligibilityDate, ApplicationDate FROM Animals A, BeefSub B');
          SQL.Add('WHERE ( A.ID=B.AnimalID )');
          SQL.Add('AND   (( A.Sex = "Steer" )');
          SQL.Add('OR     ( A.Sex = "Bull" ))');
          SQL.Add('AND NOT (A.HerdID= ' + IntToStr(WinData.DefaultHerdID) + ')');
          SQL.Add('AND ((B.PremiumType = "F")');
          SQL.Add('OR   (B.PremiumType = "B"))');
          SQL.Add('AND (B.ApplicationID > -1)'); // Application Done
          SQL.Add('AND (Extract( YEAR FROM B.ApplicationDate ) = ' + '''' + IntToStr(YearOfDate) + '''' +')');
          if Length( cbDefaultHerd.Value ) > 0 then
             SQL.Add('AND (A.HerdID= ' + cbDefaultHerd.Value + ')');
          Open;
       end;
    ExtTable.FieldByName('neNo10Mth').AsInteger := GenQuery.RecordCount;
    *)
    GetApplicationsThisYear ( DrawnFirst, Under24Mth, Over24Mth, YearOfDate,
                              StrToInt(cbDefaultHerd.Value), TempTable);

    ExtTable.FieldByName('neNo10Mth').AsInteger := DrawnFirst;
    ExtTable.FieldByName('neNoUnder24Mth').AsInteger := Under24Mth;
    ExtTable.FieldByName('neNoOver24Mth').AsInteger := Over24Mth;

    // Calculate the Number of Animals who have NOT drawn the Second Premium
    TempTable.Close;
    TempTable.EmptyTable;
    TempTable.Open;
    with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('INSERT INTO ExtTemp ( AnimalID, AnimalNo, NatIDNum, DOB, EligDate, ApplicDate )');
          SQL.Add('SELECT ID, AnimalNo, NatIDNum, DateOfBirth, EligibilityDate, ApplicationDate FROM Animals A, BeefSub B');
          SQL.Add('WHERE ( A.ID=B.AnimalID )');
          SQL.Add('AND   ( A.Sex = "Steer" )');
          SQL.Add('AND NOT (A.HerdID= ' + IntToStr(WinData.NONEHerdID) + ')');
          SQL.Add('AND (B.PremiumType = "S")');
          SQL.Add('AND (B.ApplicationID = -1)'); // No Application Done Yet
          SQL.Add('AND (B.EligibilityDate <= ' + '''' + FormatDateTime('mm/dd/yyyy',EndDate) + '''' +')');
          if Length( cbDefaultHerd.Value ) > 0 then
             SQL.Add('AND (A.HerdID= ' + cbDefaultHerd.Value + ')');
          // Check the Animal is not Sold
          SQL.Add('AND A.ID NOT IN ( SELECT AnimalID FROM Events E');
          SQL.Add('                  WHERE ( E.AnimalID=A.ID )');
          SQL.Add('                  AND ( E.EventType = ' + IntToStr(CSaleDeathEvent) + '))');
          PrePare;
          ExecSQL;
       end;
    TempTable.First;
    CutOffMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,C,F);
    pBar.Min := 1;
    if TempTable.Recordcount > 0 then
       pBar.Max := TempTable.RecordCount;
    while NOT TempTable.EOF do
       begin
          // Check the DOB against today.
          // NoOfDays := ( Date()-TempTable.FieldByName('DOB').AsDateTime );
          NoOfDays := ( ExtTable.FieldByName('DateTo').AsDateTime-TempTable.FieldByName('DOB').AsDateTime );
          DeCodeDate( TempTable.FieldByName('DOB').AsDateTime, nYear, nMonth, nDay );
          if ( IsLeapYear ( nYear )) And
             ( nMonth <= 2 ) And
             ( nDay <=27 ) then
             NoOfDays := NoOfDays-1;
          if ( NoOfDays <= 730 ) then
             Inc ( Under24Mth )
          else
             Inc ( Over24Mth );
          TempTable.Next;
          pBar.StepIt;
       end;
    ExtTable.FieldByName('seNoUnder24Mth').AsInteger := Under24Mth;
    ExtTable.FieldByName('seNoOver24Mth').AsInteger := Over24Mth;

    // Calculate the Number of Animals who have drawn the Second Premium
    (*
    Under24Mth := 0;
    Over24Mth := 0;
    TempTable.Close;
    TempTable.EmptyTable;
    TempTable.Open;
    with GenQuery do
       begin
          SQL.Clear;
          SQL.Add('INSERT INTO ExtTemp ( AnimalID, AnimalNo, NatIDNum, DOB, EligDate, ApplicDate )');
          SQL.Add('SELECT ID, AnimalNo, NatIDNum, DateOfBirth, EligibilityDate, ApplicationDate FROM Animals A, BeefSub B');
          SQL.Add('WHERE ( A.ID=B.AnimalID )');
          SQL.Add('AND   ( A.Sex = "Steer" )');
          SQL.Add('AND NOT (A.HerdID= ' + IntToStr(WinData.DefaultHerdID) + ')');
          SQL.Add('AND (B.PremiumType = "S")');
          SQL.Add('AND (B.ApplicationID > -1)'); // Application Done Yet
          SQL.Add('AND (Extract( YEAR FROM B.ApplicationDate ) = ' + '''' + IntToStr(YearOfDate) + '''' +')');
          if Length( cbDefaultHerd.Value ) > 0 then
             SQL.Add('AND (A.HerdID= ' + cbDefaultHerd.Value + ')');
          PrePare;
          ExecSQL;
       end;
    TempTable.First;
    CutOffMonths := WinData.GetNoMonthsOrDaysForPrem(WinData.PremiumType,C,F);
    pBar.Min := 1;
    if TempTable.Recordcount > 0 then
       pBar.Max := TempTable.RecordCount;
    while NOT TempTable.EOF do
       begin
          NoOfDays := ( TempTable.FieldByName('ApplicDate').AsDateTime-TempTable.FieldByName('DOB').AsDateTime );
          DeCodeDate( TempTable.FieldByName('DOB').AsDateTime, nYear, nMonth, nDay );
          if ( IsLeapYear ( nYear )) And
             ( nMonth <= 2 ) And
             ( nDay <=27 ) then
             NoOfDays := NoOfDays-1;
          if ( NoOfDays <= 730 ) then
             Inc ( Under24Mth )
          else
             Inc ( Over24Mth );
          TempTable.Next;
          pBar.StepIt;
       end;
    ExtTable.FieldByName('neNoUnder24Mth').AsInteger := Under24Mth;
    ExtTable.FieldByName('neNoOver24Mth').AsInteger := Over24Mth;
    *)

    ExtTable.Post;

    CheckState;
    DoCalculations(Sender);
    ShowNote;
    pBar.Hide;
    pcExtensification.Show;

end;

procedure TfExtensification.DBDateEdit1Exit(Sender: TObject);
begin
    // Get the Year From the Date
    DeCodeDate(ExtTable.FieldByName('DateTo').AsDateTime, YearOfDate, MonthOfDate, DayOfDate );
    if NOT ( ExtTable.State in dsEditModes ) then
       ExtTable.Edit;
    ExtTable.FieldByName('YearToRun').AsInteger := YearOfDate;

    // ReCalculate the screen of user changes the date
    CalculatePremiums(Sender);
end;

procedure TfExtensification.FormShow(Sender: TObject);
begin
     pcExtensification.ActivePage := tsInputs;
//     ShowNote;
end;

procedure TfExtensification.dbe10MthToDeductExit(Sender: TObject);
begin
     with ExtTable do
        if FieldByName('NoToDeduct10Mth').AsInteger > FieldByName('seNo10Mth').AsInteger then
           begin
              MessageDLG('Must be less or equal to No of Steers Left to deduct (10 Mth)',mtInformation,[mbOk],0);
              dbe10MthToDeduct.SetFocus;
           end
        else
           DoCalculations(Sender);
end;

procedure TfExtensification.dbeUnder24MthToDeductExit(Sender: TObject);
begin
     with ExtTable do
        if FieldByName('NoToDeductUnder24Mth').AsInteger > FieldByName('seNoUnder24Mth').AsInteger then
           begin
              MessageDLG('Must be less or equal to No of Steers Left to deduct (Under 24 Mth)',mtInformation,[mbOk],0);
              dbeUnder24MthToDeduct.SetFocus;
           end
        else
           DoCalculations(Sender);
end;

procedure TfExtensification.dbeOver24MthToDeductExit(Sender: TObject);
begin
     with ExtTable do
        if FieldByName('NoToDeductOver24Mth').AsInteger > FieldByName('seNoOver24Mth').AsInteger then
           begin
              MessageDLG('Must be less or equal to No of Steers Left to deduct (Over 24 Mth)',mtInformation,[mbOk],0);
              dbeOver24MthToDeduct.SetFocus;
           end
        else
           DoCalculations(Sender);
end;

procedure TfExtensification.dbe10MthToDeductEnter(Sender: TObject);
begin
     eOverLUS.Top := (Sender as TDBEdit).Top;
end;

procedure TfExtensification.bLUSetup1Click(Sender: TObject);
begin
    WinData.CreateAndShowForm(TfExtDefaults);
end;

procedure TfExtensification.FormCreate(Sender: TObject);
begin
   try
      CreateTempTable ( TempTable );

      ExtTable := TTable.Create(Nil);
      ExtTable.TableName := 'ext001.db';
      ExtTable.TableType := ttParadox;
      ExtTable.DatabaseName := WinData.KingData.DatabaseName;

      try  // Try and open the Herd Extensification Defaults
         ExtTable.Open;
         // Search for this herds Defaults
         if NOT ExtTable.Locate('HerdID',WinData.UserDefaultHerdID,[] ) then
            InsertDefault ( WinData.UserDefaultHerdID )
         else
            begin
               ExtTable.Edit;
                  ExtTable.FieldByName('DateTo').AsDateTime := Date();
                  // cbDefaultHerd.value := ExtTable.FieldByName('HerdID').AsString;
               end;
      except // Cannot Open so create the Table
         // if table won;t open create it
//         Windata.CreateExtTable;
         ExtTable.Open;
         InsertDefault ( WinData.UserDefaultHerdID );
      end;
      dsExtTable.DataSet := ExtTable;   // Assign the Data Source for Ext. Values
      cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);

      lCowAmt.Caption := lCowAmt.Caption + '(' + CurrencyString + ') ';
      WinData.Defaults.Open;
      pcExtensification.Hide;
   except
   end;
end;

procedure TfExtensification.FormDestroy(Sender: TObject);
begin
    WinData.Defaults.Close;
    TempTable.Close;
    TempTable.DeleteTable;
    TempTable.Free;
    ExtTable.Close;
    ExtTable.Free;
end;

end.
