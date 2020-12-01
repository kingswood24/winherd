{
   Last changed 24/04/02  to include Pedigree Comments

   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
}

unit uHerdBrochureFlt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DBTables, Db, RXCtrls,
  ComCtrls, ToolWin, RXLookup, Qrctrls, QuickRpt, QRExport, ReportDefaults,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxCheckBox;

type
  TfHerdBrochureFlt = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    Label7: TLabel;
    Herd: TRxDBLookupCombo;
    qHerdB: TQuery;
    pbBrochure: TProgressBar;
    cbimgs: TCheckBox;
    cbUseFilter: TCheckBox;
    GroupBox1: TGroupBox;
    cbCowStatus: TCheckBox;
    cbLastServeDate: TCheckBox;
    cbComments: TCheckBox;
    cbLactInclude: TCheckBox;
    qMilk: TQuery;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    HerdBrochureScr: TQuickRep;
    PageHeaderBand2: TQRBand;
    QRSubDetail2: TQRSubDetail;
    Group1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRImAnimal: TQRImage;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrdbDamHBN: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    lDam: TQRLabel;
    qrdbDamName: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText25: TQRDBText;
    CClass: TQRDBText;
    CScore: TQRDBText;
    BScore: TQRDBText;
    BClass: TQRDBText;
    qrdbDamClass: TQRDBText;
    qrdbDamScore: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    lDamsDam: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    lPregnant: TQRLabel;
    IsPreg: TQRDBText;
    lService: TQRLabel;
    ServiceDate: TQRDBText;
    dbText: TQRDBRichText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText1: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    LFooter1: TQRLabel;
    VerLabel: TQRLabel;
    ServeBull: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel3: TQRLabel;
    qMilkTotals: TQuery;
    QRDBText11: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qDaysInMilk: TQuery;
    QRDBText17: TQRDBText;
    gbAncestryDetails: TcxGroupBox;
    cbIncludeDDam: TCheckBox;
    cbDamSireHBNo: TCheckBox;
    cbGrandDamSires: TCheckBox;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    cbFavourite: TcxCheckBox;
    //cbImages: TCheckBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure HerdCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure IsPregPrint(sender: TObject; var Value: String);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Group1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure HerdChange(Sender: TObject);
    procedure cbGrandDamSiresClick(Sender: TObject);
    procedure cbIncludeDDamClick(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    HerdQuery : TQuery;
    MyTable : TTable;
    MyDataSource : TDataSource;

//    FileName : String;
    AID : String;
    FileExt : String;
    FileToPrint : String;
//    FileHeight : Integer;
//    FileWidth : Integer;
    HerdBrochureDefaults : THerdBrochureDefaults;
    FHerdType : string;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;

    function GetSireID(AAnimalID : Integer) : Integer;
    function GetDamID(AAnimalID : Integer) : Integer;
    procedure ShowGrandAncestorControls(const AShow : Boolean);
  public
    { Public declarations }
    IncludeImages : Boolean;
  end;

var
  fHerdBrochureFlt: TfHerdBrochureFlt;

const
   cGrandAncestorControlTagId  = 1;

  procedure ShowForm;

implementation
uses
   GenTypesConst,
   DairyData, uHerdLookup;

var
   WhichReg     : TCountry;
   k : Integer;

procedure ShowForm;
begin
   with TfHerdBrochureFlt.Create(nil) do
      try
         HerdBrochureScr.Hide;
         HerdQuery := TQuery.Create(nil);
         HerdQuery.DatabaseName := WinData.KingData.DatabaseName;

         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := WinData.KingData.DatabaseName;
         MyTable.TableType := ttParadox;
         MyTable.TableName := 'HerdBrochure.db';
         MyTable.FieldDefs.Clear;

         MyTable.FieldDefs.Add('ID',ftAutoInc,0,FALSE);
         MyTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);  //KVB
         MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         MyTable.FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
         MyTable.FieldDefs.Add('Name',ftString,40,FALSE);
         MyTable.FieldDefs.Add('Sex',ftString,10,FALSE);
         MyTable.FieldDefs.Add('HerdBookNo',ftString,20,FALSE);
         MyTable.FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
         MyTable.FieldDefs.Add('CurrLact',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('Pregnant',ftString,10,FALSE);
         MyTable.FieldDefs.Add('ServeDate',ftDate,0,FALSE);
         MyTable.FieldDefs.Add('ServeBull',ftString,6);

         MyTable.FieldDefs.Add('CClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('CScore',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('CNoOfEx',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('BClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('BScore',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('BNoOfEx',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('SireID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('DamID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('DDamID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('SireName',ftString,40,FALSE);

         MyTable.FieldDefs.Add('SireHBN',ftString,20,FALSE);
         MyTable.FieldDefs.Add('SireClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('SireScore',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('SireNoOfEx',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('DamName',ftString,40,FALSE);

         MyTable.FieldDefs.Add('DamHBN',ftString,20,FALSE);
         MyTable.FieldDefs.Add('DamClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('DamScore',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('DamNoOfEx',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('LactNo',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('GDamID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('GDamName',ftString,40,FALSE);
         MyTable.FieldDefs.Add('GDamHBN',ftString,20,FALSE);
         MyTable.FieldDefs.Add('GDamClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('GDamScore',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('GDamNoOfEx',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('GDonorDamID',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('DSireID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('DSireName',ftString,40,FALSE);
         MyTable.FieldDefs.Add('DSireHBN',ftString,20,FALSE);
         MyTable.FieldDefs.Add('DSireClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('DSireScore',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('SDamID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('SDamName',ftString,40,FALSE);
         MyTable.FieldDefs.Add('SDamHBN',ftString,20,FALSE);
         MyTable.FieldDefs.Add('SDamClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('SDamScore',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('SSireID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('SSireName',ftString,40,FALSE);
         MyTable.FieldDefs.Add('SSireHBN',ftString,20,FALSE);
         MyTable.FieldDefs.Add('SSireClass',ftString,2,FALSE);
         MyTable.FieldDefs.Add('SSireScore',ftInteger,0,FALSE);


         MyTable.FieldDefs.Add('BFat305',ftfloat,0,FALSE);
         MyTable.FieldDefs.Add('Prot305',ftfloat,0,FALSE);
         MyTable.FieldDefs.Add('DaysInMilk',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('Yield305',ftfloat,0,FALSE);
         MyTable.FieldDefs.Add('CalvDate',ftDate,0,FALSE);

         MyTable.FieldDefs.Add('PedComments',ftBlob, 180, FALSE);

         MyTable.IndexDefs.Clear;
         MyTable.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
         MyTable.CreateTable;
         MyTable.Open;


         MyDataSource := TDataSource.Create(nil);
         qMilk.DataSource := MyDataSource;
         qMilkTotals.DataSource := MyDataSource;
         qDaysInMilk.DataSource := MyDataSource;
         if not WinData.ExportToPDA then
            ShowModal
         else
            begin
               sbView.Click;
            end;

      finally
         MyDataSource.Free;
         HerdQuery.Free;
         MyTable.Close;
         MyTable.DeleteTable;
         MyTable.Free;
         Free;
      end;
end;

{$R *.DFM}

procedure TfHerdBrochureFlt.ExitBtnClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TfHerdBrochureFlt.ViewBtnClick(Sender: TObject);
var
   GDam : TQuery;
   IsPreg : String;
   NumCalves : Integer;
   AncestorID : Integer;
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   sbView.Enabled := False;
   sbPrint.Enabled := False;
   qMilk.DataSource := nil;
   qMilkTotals.DataSource := nil;
   qDaysInMilk.DataSource := nil;

   MyTable.Close;
   MyTable.Open;
   k := 0;
   GDam := TQuery.Create(Self);
   GDam.DatabaseName := WinData.KingData.DatabaseName;
   try
      FHerdType := HerdLookup.GetHerdTypeAsString(StrToInt(Herd.Value));
   except
      FHerdType := cDairyHerd;
   end;
   IncludeImages := FALSE;
   if cbimgs.Checked then
      IncludeImages := TRUE;
   Try
//      HerdBrochureScr := THerdBrochureScr.Create(Application);
      VerLabel.Caption := 'Herd Management ' + HerdVerNo;
      with qHerdB do
         begin
            // empty table first
            SQL.Clear;
            SQL.Add('DELETE FROM '+MyTable.TableName);
            ExecSQL;
            // SQL re-written to bring in HUKI classification, Herd distinction and to allow front screen filter- 12/7/00 kr
            // re-written again to include donor dam info  - 25/9/00 - kr
            SQL.Clear;
            SQL.Add('INSERT INTO '+MyTable.TableName);
            SQL.Add('            (AnimalID, AnimalNo, SortAnimalNo, Name, Sex, HerdBookNo, CurrLact, DateOfBirth,'); //KVB
            SQL.Add('             CClass, CScore, CNoOfEx, BClass, BScore, BNoOfEx,');
            SQL.Add('             SireID, DamID, DDamID, SireName, SireHBN,');
            SQL.Add('             SireClass, SireScore, SireNoOfEx, PedComments ) ');
            {if cbLactInclude.Checked then
               SQL.Add('          ,LactNo, BFat305, Prot305, DaysInMilk, Yield305, CalvDate )')
            else
               SQL.Add('          ) ');
            }
            SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, A.Name, A.Sex, A.HerdBookNo, A.LactNo, A.DateOfBirth,');   //KVB
            SQL.Add('		     C.LatestClass, C.LatestClassScore, C.NoOfTimesClassedEX,');
            SQL.Add('		     B.LatestClass, B.LatestClassScore, B.NoOfTimesClassedEX,');
            SQL.Add('		     A.SireID, A.DamID, A.DonorDamID, Sire.Name, Sire.HerdBookNo,');
            SQL.Add('		     SB.LatestClass, SB.LatestClassScore, SB.NoOfTimesClassedEX, P.AnimalPedDetails');
            {if cbLactInclude.Checked then
               SQL.Add('             ,M.LactNo, M.BfatPerc305, M.ProtPerc305, M.DaysInMilk, M.Yield305, E.EventDate');
            }
            if cbUseFilter.Checked then
               begin
                  SQL.Add('FROM ' + WinData.FilteredAnimals.TableName + ' FA');
                  SQL.Add('LEFT JOIN "Animals.db" A ON (FA.AID=A.ID)');
               end
            else
               begin
                  SQL.Add('FROM "Animals.DB" A');
               end;

            SQL.Add('LEFT JOIN "CowExt.db" C     ON (A.ID=C.AnimalID)');
            SQL.Add('LEFT JOIN "BullExt.db" B    ON (A.ID=B.AnimalID)');
            SQL.Add('LEFT JOIN "Animals.db" Sire ON (A.SireID=Sire.ID)');
            SQL.Add('LEFT JOIN "BullExt.db" SB   ON (Sire.ID=SB.AnimalID)');

            {if cbLactInclude.Checked then
                begin
                   SQL.Add('LEFT JOIN "MilkDisk.DB" M ON (A.ID=M.AnimalID)');
                   SQL.Add('LEFT JOIN "Events.DB"   E ON (M.AnimalID=E.AnimalID)');
                   SQL.Add('  			      AND (M.LactNo=E.AnimalLactNo)');
                   SQL.Add('                          AND (E.EventType=' + IntToStr(CCalvingEvent) + ')');
                end;
            }
//            if cbComments.Checked then
               { New Left Join, for Pedigree Comments }
            SQL.Add('LEFT JOIN "PedDetails" P    ON (P.AnimalID=A.ID) ');

            SQL.Add('WHERE (A.AnimalDeleted=FALSE)');
            SQL.Add('AND   (A.Breeding=TRUE)');

            if Herd.Value <> '0' then
               SQL.Add('AND (A.HerdID = ' + Herd.Value + ')')
            else
               SQL.Add('AND (A.HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');     //KVB
      ///      if not cbUseFilter.Checked then
      //         SQL.Add('And Inherd=True');
            ExecSQL;

            // set progress bar
            pbBrochure.Show;

            pbBrochure.Min  := 0;
            pbBrochure.Max  := MyTable.RecordCount;
            pbBrochure.Step := 1;
            pbBrochure.Position := 0;

            // re-query for dam/donordam info
            MyTable.First;
            while NOT MyTable.EOF do
               begin
                  MyTable.Edit;

                  // SP 12/02/2002
                  if MyTable.FieldByName('Sex').AsString = 'Female' then
                     begin
                        if cbCowStatus.Checked then
                           begin
                              // First of all see if the animal is female, if so is she pregnant
                              if WinData.GetProjCalving(MyTable.FieldByName('AnimalId').AsInteger,
                                                        MyTable.FieldByName('CurrLact').AsInteger, NumCalves, IsPreg ) > 0 then
                                 MyTable.FieldByName('Pregnant').AsString := IsPreg
                              else
                                 MyTable.FieldByName('Pregnant').AsString :=  'Not Served';
                           end;

                        // SP 12/02/2002
                        if cbLastServeDate.Checked then
                           begin
                              WinData.CheckEvents.Filter := '';
                              WinData.CheckEvents.Filtered := False;

                              WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(MyTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(MyTable.FieldByName('CurrLact').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                              WinData.CheckEvents.Filtered := True;

                              if WinData.CheckEvents.FindLast then
                                 begin
                                    MyTable.FieldByName('ServeDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                    if WinData.LookUpServices.Locate('EventID', WinData.CheckEvents.FieldByName('ID').AsInteger, []) then
                                       begin
                                          if WinData.LookUpServices.FieldByName('ServiceBull').AsInteger > 0 then
                                             begin
                                                if WinData.LookUpDamSire.Locate('ID', WinData.LookUpServices.FieldByName('ServiceBull').AsInteger, []) then
                                                   MyTable.FieldByName('ServeBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                             end;
                                       end;
                                 end;
                              WinData.CheckEvents.Filter := '';
                              WinData.CheckEvents.Filtered := False;
                           end;
                     end;
                  // Now Get the Dam/Donor Dam details
                  qHerdB.SQL.Clear;
                  qHerdB.SQL.Add('SELECT A.Name Name, A.HerdBookNo HerdBookNo, C.LatestClass Class, C.LatestClassScore Score, C.NoOfTimesClassedEX NoOfEx, ');
                  qHerdB.SQL.Add('       A.DamID, A.DonorDamID ');
                  qHerdB.SQL.Add('FROM Animals A');
                  if MyTable.FieldByName('DamID').Value > 0 then
                     begin
                        qHerdB.SQL.Add('LEFT JOIN CowExt C ON ('+IntToStr(MyTable.FieldByName('DamID').AsInteger)+'=C.AnimalID)');
                        qHerdB.SQL.Add('WHERE (A.ID = '+IntToStr(MyTable.FieldByName('DamID').AsInteger)+')');
                     end
                  else
                     begin
                        qHerdB.SQL.Add('LEFT JOIN CowExt C ON ('+IntToStr(MyTable.FieldByName('DDamID').AsInteger)+'=C.AnimalID)');
                        qHerdB.SQL.Add('WHERE (A.ID = '+IntToStr(MyTable.FieldByName('DDamID').AsInteger)+')');
                     end;
                  qHerdB.Open;
                  if MyTable.FieldByName('DamID').Value > 0 then
                     MyTable.FieldByName('DamName').AsString := FieldByName('Name').AsString
                  else if MyTable.FieldByName('DDamID').Value > 0 then
                     MyTable.FieldByName('DamName').AsString := FieldByName('Name').AsString+' (Donor)';
                  MyTable.FieldByName('DamHBN').AsString     := FieldByName('HerdBookNo').AsString;
                  MyTable.FieldByName('DamClass').AsString   := FieldByName('Class').AsString;
                  MyTable.FieldByName('DamScore').AsInteger  := FieldByName('Score').AsInteger;
                  MyTable.FieldByName('DamNoOfEx').AsInteger := FieldByName('NoOfEx').AsInteger;
                  MyTable.FieldByName('GDamID').AsInteger    := FieldByName('DamID').AsInteger;
                  MyTable.FieldByName('GDonorDamID').AsInteger := FieldByName('DonorDamID').AsInteger;
                  qHerdB.Close;

                  // Now Get the GDam/GDonorDam details if cbIncludeDDam checked
                  // SP 12/02/2002
                  if cbIncludeDDam.Checked then
                     with GDam do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT A.Name Name, A.HerdBookNo HerdBookNo, C.LatestClass Class, C.LatestClassScore Score, C.NoOfTimesClassedEX NoOfEx ');
                           SQL.Add('FROM Animals A');
                           if MyTable.FieldByName('GDamID').Value > 0 then
                              begin
                                 SQL.Add('LEFT JOIN CowExt C ON ('+IntToStr(MyTable.FieldByName('GDamID').AsInteger)+'=C.AnimalID)');
                                 SQL.Add('WHERE (A.ID = '+IntToStr(MyTable.FieldByName('GDamID').AsInteger)+')');
                              end
                           else
                              begin
                                 SQL.Add('LEFT JOIN CowExt C ON ('+IntToStr(MyTable.FieldByName('GDonorDamID').AsInteger)+'=C.AnimalID)');
                                 SQL.Add('WHERE (A.ID = '+IntToStr(MyTable.FieldByName('GDonorDamID').AsInteger)+')');
                              end;
                           Open;

                           if MyTable.FieldByName('GDamID').Value > 0 then
                              MyTable.FieldByName('GDamName').AsString := FieldByName('Name').AsString
                           else if MyTable.FieldByName('GDonorDamID').Value > 0 then
                              MyTable.FieldByName('GDamName').AsString := FieldByName('Name').AsString+' (Donor)';
                           MyTable.FieldByName('GDamHBN').AsString     := FieldByName('HerdBookNo').AsString;
                           MyTable.FieldByName('GDamClass').AsString   := FieldByName('Class').AsString;
                           MyTable.FieldByName('GDamScore').AsInteger  := FieldByName('Score').AsInteger;
                           MyTable.FieldByName('GDamNoOfEx').AsInteger := FieldByName('NoOfEx').AsInteger;
                        end;

                  if cbGrandDamSires.Checked then
                     begin

                        // Get the Sires Sire
                        if MyTable.FieldByName('DamID').Value > 0 then
                           AncestorID := MyTable.FieldByName('DamID').AsInteger
                        else
                           AncestorID := MyTable.FieldByName('DDamID').AsInteger;

                        AncestorID := GetSireID(AncestorID);

                        if AncestorID > 0 then
                           begin
                              qHerdB.SQL.Clear;
                              qHerdB.SQL.Add('SELECT A.Name Name, A.HerdBookNo HerdBookNo, B.LatestClass Class, B.LatestClassScore Score, B.NoOfTimesClassedEX NoOfEx, ');
                              qHerdB.SQL.Add('       A.DamID, A.DonorDamID ');
                              qHerdB.SQL.Add('FROM Animals A');
                              qHerdB.SQL.Add('LEFT JOIN BullExt B ON (B.AnimalID=:BAID)');
                              qHerdB.SQL.Add('WHERE (A.ID = :AID)');
                              qHerdB.Params[0].AsInteger := AncestorID;
                              qHerdB.Params[1].AsInteger := AncestorID;
                              qHerdB.Open;
                              try
                                 qHerdB.First;
                                 MyTable.FieldByName('DSireID').AsInteger  := AncestorID;
                                 MyTable.FieldByName('DSireName').AsString := qHerdB.FieldByName('Name').AsString;
                                 MyTable.FieldByName('DSireHBN').AsString     := qHerdB.FieldByName('HerdBookNo').AsString;
                                 MyTable.FieldByName('DSireClass').AsString   := qHerdB.FieldByName('Class').AsString;
                                 MyTable.FieldByName('DSireScore').AsInteger  := qHerdB.FieldByName('Score').AsInteger;
                              finally
                                 qHerdB.Close;
                              end;
                           end;

                        // Get the Sires Sire
                        AncestorID := GetSireID(MyTable.FieldByName('SireID').AsInteger);

                        if AncestorID > 0 then
                           begin
                              qHerdB.SQL.Clear;
                              qHerdB.SQL.Add('SELECT A.Name Name, A.HerdBookNo HerdBookNo, B.LatestClass Class, B.LatestClassScore Score, B.NoOfTimesClassedEX NoOfEx, ');
                              qHerdB.SQL.Add('       A.DamID, A.DonorDamID ');
                              qHerdB.SQL.Add('FROM Animals A');
                              qHerdB.SQL.Add('LEFT JOIN BullExt B ON (B.AnimalID=:BAID)');
                              qHerdB.SQL.Add('WHERE (A.ID = :AID)');
                              qHerdB.Params[0].AsInteger := AncestorID;
                              qHerdB.Params[1].AsInteger := AncestorID;
                              qHerdB.Open;
                              try
                                 qHerdB.First;
                                 MyTable.FieldByName('SSireID').AsInteger  := AncestorID;
                                 MyTable.FieldByName('SSireName').AsString := qHerdB.FieldByName('Name').AsString;
                                 MyTable.FieldByName('SSireHBN').AsString     := qHerdB.FieldByName('HerdBookNo').AsString;
                                 MyTable.FieldByName('SSireClass').AsString   := qHerdB.FieldByName('Class').AsString;
                                 MyTable.FieldByName('SSireScore').AsInteger  := qHerdB.FieldByName('Score').AsInteger;
                              finally
                                 qHerdB.Close;
                              end;
                           end;

                        AncestorID := GetDamID(MyTable.FieldByName('SireID').AsInteger);

                        if AncestorID > 0 then
                           begin
                              qHerdB.SQL.Clear;
                              qHerdB.SQL.Add('SELECT A.Name Name, A.HerdBookNo HerdBookNo, C.LatestClass Class, C.LatestClassScore Score, C.NoOfTimesClassedEX NoOfEx, ');
                              qHerdB.SQL.Add('       A.DamID, A.DonorDamID ');
                              qHerdB.SQL.Add('FROM Animals A');
                              qHerdB.SQL.Add('LEFT JOIN CowExt C ON (C.AnimalID=:CAID)');
                              qHerdB.SQL.Add('WHERE (A.ID = :AID)');
                              qHerdB.Params[0].AsInteger := AncestorID;
                              qHerdB.Params[1].AsInteger := AncestorID;
                              qHerdB.Open;
                              try
                                 qHerdB.First;
                                 MyTable.FieldByName('SDamID').AsInteger  := AncestorID;
                                 MyTable.FieldByName('SDamName').AsString := qHerdB.Fields[0].AsString;
                                 MyTable.FieldByName('SDamHBN').AsString     := qHerdB.FieldByName('HerdBookNo').AsString;
                                 MyTable.FieldByName('SDamClass').AsString   := qHerdB.FieldByName('Class').AsString;
                                 MyTable.FieldByName('SDamScore').AsInteger  := qHerdB.FieldByName('Score').AsInteger;
                              finally
                                 qHerdB.Close;
                              end;
                           end;
                     end;

                  MyTable.Post;
                  MyTable.Next;

                  pbBrochure.StepIt;
               end;


            // re-query for output
            SQL.Clear;
            SQL.Add('SELECT * FROM '+MyTable.TableName);
            SQL.Add('ORDER BY SortAnimalNo, LactNo ASC ');// SP 03/07/2001
            Open;
            if cbLactInclude.Checked then
               begin
                  MyDataSource.DataSet := qHerdB;
                  qMilk.DataSource := MyDataSource;
                  qMilkTotals.DataSource := MyDataSource;
                  qDaysInMilk.DataSource := MyDataSource;
                  qMilk.Active := True;
                  qMilkTotals.Active := True;
                  qDaysInMilk.Active := True;
               end
            else
               MyDataSource.DataSet := nil;
         end;

    {  if not cbLactInclude.Checked then
         QRBand1.Height := 0
      else
         QRBand1.Height := 16;
     }

      pbBrochure.Hide;
      if WinData.ExportToPDA then
         begin
            WinData.PDALinkExport.ExportReport( HerdBrochureScr );
         end
      else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
         HerdBrochureScr.Preview
      else
         Begin                       //KVB
              HerdBrochureScr.Print;
         end;
   finally
      qMilk.Active := False;
      qMilkTotals.Active := False;
      qDaysInMilk.Active := False;
      pbBrochure.Hide;
      GDam.Close;
      GDam.Free;
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TfHerdBrochureFlt.HerdCloseUp(Sender: TObject);
begin
   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,Herd.Value);
end;

procedure TfHerdBrochureFlt.FormActivate(Sender: TObject);
var
  pt : TPoint;
begin
   LoadScreenDefaults;
   OnActivate := nil;

   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;
end;

procedure TfHerdBrochureFlt.QRDBText1Print(sender: TObject;
  var Value: String);
begin
   if Value = '30/12/1899' then
      Value := '';
end;

procedure TfHerdBrochureFlt.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{   if ((IncludeImages) AND (FileExists(FileToPrint + FileExt))) then
      Begin
         // Need to sublcass to get to protected function "AvailableSpace".
         if TMyQuickRep(HerdBrochureScr).AvailableSpace <= Round(Sender.Size.Length)+Group1.Height then
            Sender.ParentReport.NewColumn;
      end
   else if NOT(IncludeImages) OR NOT(FileExists(FileToPrint + FileExt)) then
      begin}
         // Need to sublcass to get to protected function "AvailableSpace".
         if TQuickRep(HerdBrochureScr).AvailableSpace <= Round(Sender.Size.Length)+Group1.Height then
            Sender.ParentReport.NewColumn;
//      end;
end;

procedure TfHerdBrochureFlt.IsPregPrint(sender: TObject;
  var Value: String);
begin
   if Value = 'Not Served' then
      begin
         lService.Enabled := False;
         lService.Visible := False;
      end
   else
      begin
         lService.Enabled := True;
         lService.Visible := True;
      end
end;

procedure TfHerdBrochureFlt.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Font.Color := clBlue;
      end
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TfHerdBrochureFlt.FormCreate(Sender: TObject);
begin
   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,Herd.Value);
   Herd.value := IntToStr(WinData.UserDefaultHerdID);
   //cbIncFilter.Checked := WinData.ActiveFilter;
   pbBrochure.Hide;
   HerdBrochureScr.Visible := FALSE;
   cbUseFilter.Checked := WinData.ActiveFilter;
   WinData.CanShowStandardReportHint := True;
{   if cbUseFilter.Visible then
      cbUseFilter.Checked := True
   else
      cbUseFilter.Hide;
   }
   LoadScreenDefaults;
end;

procedure TfHerdBrochureFlt.LoadScreenDefaults;
begin
   HerdBrochureDefaults := THerdBrochureDefaults.Create(cRD_HerdBrochure);
   try
      cbimgs.checked := HerdBrochureDefaults.IncludeImages;
      cbIncludeDDam.checked := HerdBrochureDefaults.IncludeDDam;
      cbDamSireHBNo.checked := HerdBrochureDefaults.IncludeSireDamHBNo;
      cbComments.checked := HerdBrochureDefaults.IncludeComments;
      cbCowStatus.checked := HerdBrochureDefaults.IncludeCowStatus;
      cbLastServeDate.checked := HerdBrochureDefaults.IncludeLastService;
      cbLactInclude.checked := HerdBrochureDefaults.IncludeLactations;
   finally
      FreeAndNil(HerdBrochureDefaults);
   end;
end;

procedure TfHerdBrochureFlt.SaveScreenDefaults;
begin
   HerdBrochureDefaults := THerdBrochureDefaults.Create(cRD_HerdBrochure);
   try
      HerdBrochureDefaults.IncludeImages := cbimgs.checked;
      HerdBrochureDefaults.IncludeDDam := cbIncludeDDam.checked;
      HerdBrochureDefaults.IncludeSireDamHBNo := cbDamSireHBNo.checked;
      HerdBrochureDefaults.IncludeComments := cbComments.checked;
      HerdBrochureDefaults.IncludeCowStatus := cbCowStatus.checked;
      HerdBrochureDefaults.IncludeLastService := cbLastServeDate.checked;
      HerdBrochureDefaults.IncludeLactations := cbLactInclude.checked;
   finally
      FreeAndNil(HerdBrochureDefaults);
   end;
end;

procedure TfHerdBrochureFlt.FormDestroy(Sender: TObject);
begin
   SaveScreenDefaults;
   WinData.cxHint.HideHint;
end;

procedure TfHerdBrochureFlt.Group1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
const
    jpeg = '.jpeg';
    jpg  = '.jpg';
begin

//   QRBand1BeforePrint(Sender, PrintBand );

   AID := qHerdB.FieldByName('AnimalID').AsString;
   FileExt := '.jpg';

   FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + '1';  //Animal Image
   if FileExists(FileToPrint+jpeg) then
      FileToPrint := FileToPrint+jpeg
   else if FileExists(FileToPrint+jpg) then
      FileToPrint := FileToPrint+jpg;

   if ((IncludeImages) and FileExists(FileToPrint)) then
      begin
         //Load Image into GenImage to get image size
         QRImAnimal.Enabled := True;
         QRImAnimal.Visible := True;
         QRImAnimal.Stretch := False;
         QRImAnimal.Height := 160;
         QRImAnimal.Width := 260;
         QRImAnimal.Left := Group1.Width-QRImAnimal.Width-20;
         QRImAnimal.Picture.LoadFromFile(FileToPrint);   //Animal Image
         QRImAnimal.Stretch := True;   //Now to Stretch Image to fit
         if cbComments.Checked then
            begin
               if Length(qHerdB.FieldByName('PedComments').AsString) <= 0 then
                  Group1.Height := QRImAnimal.Top+QRImAnimal.Height+8
               else
                  begin
                     dbText.Top := QRImAnimal.Top+QRImAnimal.Height+15;
                     Group1.Height := dbText.Top+dbText.Height+15;
                  end;
            end
         else
            Group1.Height := QRImAnimal.Top+QRImAnimal.Height+8;
      end
   else if not(IncludeImages) or not(FileExists(FileToPrint)) then
      begin
         if cbComments.Checked then
            begin
               if Length(qHerdB.FieldByName('PedComments').AsString) <= 0 then
                  Group1.Height := lDamsDam.Top+lDamsDam.Height+8
               else
                  begin
                     dbText.Top := lDamsDam.Top+lDamsDam.Height+15;
                     Group1.Height := dbText.Top+dbText.Height+15;
                  end;
            end
         else
            Group1.Height := lDamsDam.Top+lDamsDam.Height+8;

         QRImAnimal.Enabled := False;
         QRImAnimal.Visible := False;
         QRImAnimal.Width := 0;   //Animal Image
      end;

   if not cbGrandDamSires.Checked then
      begin
         lDamsDam.Visible := False;
         QRDBText7.Visible := False;
         QRDBText8.Visible := False;
         QRDBText9.Visible := False;
         QRDBText6.Visible := False;
         lDamsDam.Enabled := False;
         QRDBText7.Enabled := False;
         QRDBText8.Enabled := False;
         QRDBText9.Enabled := False;
         QRDBText6.Enabled := False;
         lDam.Top := 80;
         qrdbDamName.Top := 80;
         qrdbDamHBN.Top := 80;
         qrdbDamClass.Top := 80;
         qrdbDamScore.Top := 80;
         ShowGrandAncestorControls(False);

         if cbIncludeDDam.Checked then
            begin
               lDamsDam.Enabled := True;
               lDamsDam.Visible := True;
               QRDBText7.Enabled := True;
               QRDBText7.Visible := True;
               QRDBText8.Enabled := True;
               QRDBText8.Visible := True;
               QRDBText9.Enabled := True;
               QRDBText9.Visible := True;
               QRDBText6.Enabled := True;
               QRDBText6.Visible := True;

               lDamsDam.Top := 100;
               QRDBText7.Top := 100;
               QRDBText8.Top := 100;
               QRDBText9.Top := 100;
               QRDBText6.Top := 100;
            end
      end
   else
      begin
         lDam.Top := 130;
         qrdbDamName.Top := 130;
         qrdbDamHBN.Top := 130;
         qrdbDamClass.Top := 130;
         qrdbDamScore.Top := 130;
         ShowGrandAncestorControls(True);
         lDamsDam.Enabled := True;
         lDamsDam.Visible := True;
         QRDBText7.Enabled := True;
         QRDBText7.Visible := True;
         QRDBText8.Enabled := True;
         QRDBText8.Visible := True;
         QRDBText9.Enabled := True;
         QRDBText9.Visible := True;
         QRDBText6.Enabled := True;
         QRDBText6.Visible := True;

         lDamsDam.Top := 170;
         QRDBText7.Top := 170;
         QRDBText8.Top := 170;
         QRDBText9.Top := 170;
         QRDBText6.Top := 170;


      end;

   // SP 12/02/2002
   if cbDamSireHBNo.Checked then
      begin
         qrdbDamHBN.Visible := True;
         QRDBText23.Visible := True;
         QRDBText6.Visible  := True;
     //    QRDBText16.Visible := True;
   //      QRDBText17.Visible := True;
         QRDBText6.Enabled  := True;
         qrdbDamHBN.Enabled := True;
         QRDBText23.Enabled := True;
    //     QRDBText16.Enabled := True;
   //      QRDBText17.Enabled := True;
      end
   else
      begin
         QRDBText6.Visible  := False;
         qrdbDamHBN.Visible := False;
         QRDBText23.Visible := False;
         QRDBText6.Enabled  := False;
         qrdbDamHBN.Enabled := False;
         QRDBText23.Enabled := False;
      //   QRDBText16.Visible := False;
    //     QRDBText17.Visible := False;
    //     QRDBText16.Enabled := False;
    //     QRDBText17.Enabled := False;
      end;
   // SP 12/02/2002
   if cbCowStatus.Checked then
      begin
         lPregnant.Enabled := True;
         lPregnant.Visible := True;
         IsPreg.Visible := True;
         IsPreg.Enabled := True;
      end
   else
      begin
         lPregnant.Enabled := False;
         lPregnant.Visible := False;
         IsPreg.Visible := False;
         IsPreg.Enabled := False;
      end;

   // SP 12/02/2002
   if cbLastServeDate.Checked then
      begin
         ServiceDate.Enabled := True;
         ServiceDate.Visible := True;
         lService.Enabled := True;
         lService.Visible := True;
         ServeBull.Enabled := True;
         ServeBull.Visible := True;

//         lPreg.Visible := True;
//         qrPreg.Visible := True;
      //   lServe.Visible := True;
       //  qrServe.Visible := True;
//         lPreg.Enabled := True;
  ///       qrPreg.Enabled := True;
     //    lServe.Enabled := True;
       //  qrServe.Enabled := True;
      end
   else
      begin
         lService.Enabled := False;
         lService.Visible := False;
         ServiceDate.Enabled := False;
         ServiceDate.Visible := False;
         ServeBull.Enabled := False;
         ServeBull.Visible := False;
  //       lPreg.Visible := False;
    //     qrPreg.Visible := False;
  //       lServe.Visible := False;
    //     qrServe.Visible := False;
//         lPreg.Enabled := False;
  //       qrPreg.Enabled := False;
    //     lServe.Enabled := False;
      //   qrServe.Enabled := False;
      end;

   if cbComments.Checked then
      begin
         dbText.Enabled := True;
         dbText.Visible := True;
//         dbText2.Enabled := True;
  //       dbText2.Visible := True;
      end
   else
      begin
         dbText.Enabled := False;
         dbText.Visible := False;
    //     dbText2.Enabled := False;
      //   dbText2.Visible := False;
      end;

end;

procedure TfHerdBrochureFlt.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := ((cbLactInclude.Checked) and (FHerdType=cDairyHerd));
end;

procedure TfHerdBrochureFlt.GroupFooterBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ((cbLactInclude.Checked) and (FHerdType=cDairyHerd));
end;

procedure TfHerdBrochureFlt.HerdChange(Sender: TObject);
begin
   try
      FHerdType := HerdLookup.GetHerdTypeAsString(StrToInt(Herd.Value));
   except
      FHerdType := cDairyHerd;
   end;
   cbLactInclude.Visible := (FHerdType = cDairyHerd);
   if (not cbLactInclude.Visible) then
      cbLactInclude.Checked := False;
end;

procedure TfHerdBrochureFlt.cbGrandDamSiresClick(Sender: TObject);
begin

   if cbGrandDamSires.Checked then
      begin
         if not(cbIncludeDDam.Checked) then
            cbIncludeDDam.Checked := True;
      end;

end;

function TfHerdBrochureFlt.GetSireID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if AAnimalID > 0 then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('Select SireID From Animals Where ID=:ID');
               Params[0].AsInteger := AAnimalID;
               Open;
               try
                  First;
                  Result := Fields[0].AsInteger;
               finally
                  Close;
               end;
            finally
               Free;
            end;
      end;
end;

function TfHerdBrochureFlt.GetDamID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if AAnimalID > 0 then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('Select DamID From Animals Where ID=:ID');
               Params[0].AsInteger := AAnimalID;
               Open;
               try
                  First;
                  Result := Fields[0].AsInteger;
               finally
                  Close;
               end;
            finally
               Free;
            end;
      end;
end;

procedure TfHerdBrochureFlt.ShowGrandAncestorControls(const AShow : Boolean);
var
   i : Integer;
begin
   for i := 0 to Group1.ControlCount-1 do
      if Group1.Controls[i] is TQRCustomLabel then
         if (Group1.Controls[i] as TQRCustomLabel).Tag = cGrandAncestorControlTagId then
            begin
               (Group1.Controls[i] as TQRCustomLabel).Visible := AShow;
               (Group1.Controls[i] as TQRCustomLabel).Enabled := AShow;
            end;
end;

procedure TfHerdBrochureFlt.cbIncludeDDamClick(Sender: TObject);
begin
   if ( not cbIncludeDDam.Checked ) and (cbGrandDamSires.Checked) then
      begin
         MessageDlg('You have selected "Include Grand Dams/Sires", '+cCRLF+
                    'therefore "Include Dam''s Dam" must be selected',mtInformation,[mbOk],0);
         cbIncludeDDam.Checked := True;
      end;
end;

procedure TfHerdBrochureFlt.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfHerdBrochureFlt.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cHerdBrochRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cHerdBrochRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfHerdBrochureFlt.FormShow(Sender: TObject);
begin
   cbFavourite.Checked := WinData.IsReportFavourite(cHerdBrochRep);
   WinData.UpdateRecentReportUsage(cHerdBrochRep);
end;

end.
