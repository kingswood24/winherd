unit uHerdStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TB97Tlbr, RXCtrls, TB97, DBTables, Db, RxLookup,
  Qrctrls, QuickRpt, ComCtrls, QRExport;

type
  TfHerdStat = class(TForm)
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    SbExit: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    ToolbarSep973: TToolbarSep97;
    HerdCombo: TRxDBLookupCombo;
    Label15: TLabel;
    pDairy: TPanel;
    Label13: TLabel;
    lTotCowsInHerd: TLabel;
    LTotPdCon: TLabel;
    LTotServNotPd: TLabel;
    LTotNotServ: TLabel;
    LTotInMilk: TLabel;
    LTotDry: TLabel;
    LPercCowsInHerd: TLabel;
    LPercPdCon: TLabel;
    LPercServNotPd: TLabel;
    LPercNotServ: TLabel;
    LPercInMilk: TLabel;
    LPercDry: TLabel;
    Label2: TLabel;
    pAny: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    LTotDairyHeif: TLabel;
    LTotBeefHeif: TLabel;
    LTotDairyBull: TLabel;
    LTotBeefBull: TLabel;
    LTotSteers: TLabel;
    LPercDairyHeif: TLabel;
    LPercBeefHeif: TLabel;
    LPercDairyBull: TLabel;
    LPercSteers: TLabel;
    LPercBeefBull: TLabel;
    Label14: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Lable2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label19: TLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    qrStats: TQuickRep;
    QRBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    lHerd: TQRLabel;
    QRBand2: TQRBand;
    Label12: TLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRTotCows: TQRLabel;
    QRTotNotServed: TQRLabel;
    QRTotServedNotPD: TQRLabel;
    QRTotPdCon: TQRLabel;
    QRTotMilk: TQRLabel;
    QRTotDry: TQRLabel;
    QRPerCows: TQRLabel;
    QRPerNotServed: TQRLabel;
    QRPerServedNotPD: TQRLabel;
    QRPerPdCon: TQRLabel;
    QRPerMilk: TQRLabel;
    QRPerDry: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRTotDHeifers: TQRLabel;
    QRTotBHeifers: TQRLabel;
    QRTotDBulls: TQRLabel;
    QRTotSteers: TQRLabel;
    QRTotBBulls: TQRLabel;
    QRPerDHeifers: TQRLabel;
    QRPerBHeifers: TQRLabel;
    QRPerDBulls: TQRLabel;
    QRPerBBulls: TQRLabel;
    QRPerSteers: TQRLabel;
    Timer1: TTimer;
    Label16: TLabel;
    lTotNotPreg: TLabel;
    lPerclNotPreg: TLabel;
    pbar: TProgressBar;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure SbExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HerdComboCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
//     AllCows : Integer;
     HerdType : Integer;
     procedure BlankCaptions;
     procedure DoSQLs;
     procedure AssignCaptions;
     function GetAllCows: Integer;
     procedure SetAllCows(const Value: Integer);
  public
    { Public declarations }
     AllCows : Integer;
     HerdTotal : Integer;
     AnimalCount : Double;
     procedure ShowTheForm;
     property sAllCows : Integer read GetAllCows write SetAllCows;
  end;

var
  fHerdStat: TfHerdStat;

const
   CowsInHerd  = 0;
   InMilk      = 1;
   Dry         = 2;
   NotServed   = 3;
   ServedNotPD = 4;
   PDConfirmed = 5;
   NotPreg     = 6;
   DHeifers    = 7;
   BHeifers    = 8;
   DBulls      = 9;
   BBulls      = 10;
   Steers      = 11;



implementation
uses
   DairyData,
   GenTypesConst,
   uHerdStatsExtended, MenuUnit;

{$R *.DFM}


procedure TfHerdStat.DoSQLs;
const
   Mainsql =  'WHERE (A.LactNo > 0) AND (A.Sex = "Female") AND (A.Breeding = True) AND (A.InHerd=True) AND (A.AnimalDeleted=False)';

var
   n,
   i : Integer;
   GenQuery : TQuery;
   sCowsInHerd : String;
//   AllCows : Integer;
begin

   if HerdCombo.Value = '0' then Exit;

   pbar.Position := 0;
   pbar.Show;

   try
      try
         GenQuery := TQuery.Create(nil);
         GenQuery.DatabaseName := WinData.KingData.DatabaseName;

         with GenQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT A.ID                      ');
               SQL.Add('FROM Animals A                            ');
               SQL.Add('WHERE (A.InHerd=True)                     ');
               SQL.Add('AND (A.AnimalDeleted =False)              ');
               SQL.Add('AND (A.HerdID = ' + HerdCombo.Value + ' ) ');
               Open;

               if GenQuery.RecordCount > 0 then
                  HerdTotal := GenQuery.RecordCount;
               pbar.StepIt;
            end;

         for i := 0 to 11 do
            begin
               Application.ProcessMessages;
               with GenQuery do
                  begin
                     Close;
                     SQL.Clear;
                     AnimalCount := 0;
                     case i of
                        CowsInHerd  : begin
                                         SQL.Add('SELECT DISTINCT A.ID                 ');
                                         SQL.Add('FROM Animals A                       ');
                                         SQL.Add('WHERE (A.LactNo > 0)                 ');
                                         SQL.Add('AND (A.Sex = "Female")               ');
                                         SQL.Add('AND (A.AnimalDeleted =False)         ');
                                         SQL.Add('AND (A.Breeding = True)              ');
                                         SQL.Add('AND (A.InHerd=True)                  ');
                                         SQL.Add('AND (A.HerdId = '+HerdCombo.Value+' )');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                               LTotCowsInHerd.Caption := IntToStr(GenQuery.RecordCount);
                                               AllCows := StrToInt(LTotCowsInHerd.Caption);
                                               LPercCowsInHerd.Caption := '100';
                                               SAllCows := AllCows;
                                            end;

                                     end;
                        InMilk      : begin
                                         //
                                      end;
                        Dry         : begin
                                         SQL.Add('SELECT DISTINCT A.ID  ');
                                         SQL.Add('FROM Animals A        ');
                                         SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)');
                                         SQl.Add(Mainsql                 );
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' ) ');
                                         SQL.Add('AND   (A.LactNo = E.AnimalLactNo)  ');
                                         SQL.Add('AND   (E.EventType = '+IntToStr(cDryOffEvent)+')  ');
                                         Open;

                                         LTotDry.Caption := IntToStr(GenQuery.RecordCount) ;
                                         AnimalCount := StrToFloat( LTotDry.Caption);
                                         LPercDry.Caption := FloatToStrF(((AnimalCount / AllCows) * 100),ffFixed, 8, 1);


                                         LTotInMilk.Caption := IntToStr(AllCows - GenQuery.RecordCount);
                                         AnimalCount := StrToFloat(LTotInMilk.Caption);
                                         LPercInMilk.Caption := FloatToStrF(((AnimalCount / AllCows) * 100),ffFixed, 8, 1);
                                      end;
                        NotServed   : begin
                                         SQL.Add('SELECT DISTINCT A.ID ');
                                         SQL.Add('FROM Animals A       ');
                                         SQL.Add(Mainsql                );
                                         SQL.Add('AND (A.HerdID = '+HerdCombo.Value+' )  ');
                                         SQL.Add('AND (NOT A.ID IN (SELECT DISTINCT E.AnimalID ');
                                         SQL.Add('                  FROM Events E              ');
                                         SQL.Add('                  WHERE (A.ID=E.AnimalID)     ');
                                         SQL.Add('                  AND   (A.LactNo = E.AnimalLactNo)');
                                         SQL.Add('                  AND   (E.EventType = '+IntToStr(cServiceEvent)+')))');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                               LTotNotServ.Caption := IntToStr(GenQuery.RecordCount);
                                               AnimalCount := StrToFloat(LTotNotServ.Caption);
                                               LPercNotServ.Caption := FloatToStrF(((AnimalCount / AllCows) * 100),ffFixed, 8, 1);
                                            end;

                                      end;
                        ServedNotPD : begin
                                         SQL.Add('SELECT DISTINCT A.ID                     ');
                                         SQL.Add('FROM Animals A                           ');
                                         SQL.Add('WHERE (A.Sex = "Female")                 ');
                                         SQL.Add('AND   (A.Breeding = True)                ');
                                         SQL.Add('AND   (A.LactNo > 0)                     ');
                                         SQL.Add('AND   (A.InHerd=True)                    ');
                                         SQL.Add('AND   (A.AnimalDeleted=False)            ');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )  ');
                                         SQL.Add('AND (A.ID IN (SELECT DISTINCT(E.AnimalID) FROM Events E   ');
                                         SQL.Add('              WHERE (A.ID=E.AnimalID)     ');
                                         SQL.Add('              AND   (A.LactNo=E.AnimalLactNo)   ');
                                         SQL.Add('              AND   (E.EventType = '+IntToStr(cServiceEvent)+'))    ');
                                         SQL.Add('              AND   NOT(A.ID IN (SELECT DISTINCT(E.AnimalID) FROM Events E  ');
                                         SQL.Add('                                 WHERE (A.ID=E.AnimalID)    ');
                                         SQL.Add('                                 AND   (A.LactNo=E.AnimalLactNo)  ');
                                         SQL.Add('                                 AND   (E.EventType = '+IntToStr(cPregDiagEvent)+'))))');
                                         ExecSQL;
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              LTotServNotPd.Caption := IntToStr(GenQuery.RecordCount);
                                              AnimalCount := StrToFloat( LTotServNotPd.Caption);
                                              LPercServNotPd.Caption := FloatToStrF(((AnimalCount / AllCows) * 100),ffFixed, 8, 1);
                                            end;
                                      end;
                        PDConfirmed : begin
                                         SQL.Add('SELECT DISTINCT A.ID                         ');
                                         SQL.Add('FROM Animals A                               ');
                                         SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)      ');
                                         SQL.Add('LEFT JOIN PregnancyDiag P ON (E.ID=P.EventID)');
                                         SQL.Add('WHERE (A.LactNo > 0)');
                                         SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                                         SQL.Add('AND (A.Sex = "Female")');
                                         SQL.Add('AND (A.Breeding = True)');
                                         SQL.Add('AND (A.InHerd=True)');
                                         SQL.Add('AND (A.AnimalDeleted=False)');
                                         SQL.Add('AND (A.HerdId = '+HerdCombo.Value+' )      ');
                                         SQL.Add('AND (P.PregnancyStatus=True)               ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              LTotPdCon.Caption := IntToStr(GenQuery.RecordCount);
                                              AnimalCount := StrToFloat( LTotPdCon.Caption);
                                              LPercPdCon.Caption := FloatToStrF(((AnimalCount / AllCows) * 100),ffFixed, 8, 1);
                                            end;

                                      end;
                        NotPreg     : begin
                                         SQL.Add('SELECT DISTINCT A.ID                         ');
                                         SQL.Add('FROM Animals A                               ');
                                         SQL.Add('LEFT JOIN Events E ON (A.ID=E.AnimalID)      ');
                                         SQL.Add('LEFT JOIN PregnancyDiag P ON (E.ID=P.EventID)');
                                         SQL.Add('WHERE (A.LactNo > 0)');
                                         SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                                         SQL.Add('AND (A.Sex = "Female")');
                                         SQL.Add('AND (A.Breeding = True)');
                                         SQL.Add('AND (A.InHerd=True)');
                                         SQL.Add('AND (A.AnimalDeleted=False)');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )      ');
                                         SQL.Add('AND   (P.PregnancyStatus=False)               ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              lTotNotPreg.Caption := IntToStr(GenQuery.RecordCount);
                                              AnimalCount := GenQuery.RecordCount;
                                              lPerclNotPreg.Caption := FloatToStrF(((AnimalCount / AllCows) * 100),ffFixed, 8, 1);
                                            end;
                                      end;
                        DHeifers    : begin
                                         SQL.Add('SELECT DISTINCT A.ID                       ');
                                         SQL.Add('FROM Animals A                             ');
                                         SQL.Add('WHERE (A.LactNo = 0)                       ');
                                         SQL.Add('AND   (A.Sex = "Female")                   ');
                                         SQL.Add('AND   (A.AnimalDeleted=False)              ');
                                         SQL.Add('AND   (A.Breeding = True)                  ');
                                         SQL.Add('AND   (A.InHerd=True)                      ');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              LTotDairyHeif.Caption := IntToStr(GenQuery.RecordCount) ;
                                              AnimalCount := StrToFloat(  LTotDairyHeif.Caption);
                                              LPercDairyHeif.Caption := FloatToStrF(((AnimalCount / HerdTotal) * 100),ffFixed, 8, 1);
                                            end;
                                      end;
                        BHeifers    : begin
                                         SQL.Add('SELECT DISTINCT A.ID                       ');
                                         SQL.Add('FROM Animals A                             ');
                                         SQL.Add('WHERE (A.LactNo = 0)                       ');
                                         SQL.Add('AND   (A.Sex = "Female")                   ');
                                         SQL.Add('AND   (A.Breeding = False)                 '); //check with gerry
                                         SQL.Add('AND   (A.InHerd=True)                      ');
                                         SQL.Add('AND   (A.AnimalDeleted=False)              ');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                               LTotBeefHeif.Caption := IntToStr(GenQuery.RecordCount);
                                               AnimalCount := StrToFloat( LTotBeefHeif.Caption);
                                               LPercBeefHeif.Caption := FloatToStrF(((AnimalCount / HerdTotal) * 100),ffFixed, 8, 1);
                                            end;
                                      end;
                        DBulls      : begin
                                         SQL.Add('SELECT DISTINCT A.ID                       ');
                                         SQL.Add('FROM Animals A                             ');
                                         SQL.Add('WHERE (A.Sex = "Bull")                     ');
                                         SQL.Add('AND   (A.AnimalDeleted=False)              ');
                                         SQL.Add('AND   (A.Breeding = True)                  ');
                                         SQL.Add('AND   (A.InHerd=True)                      ');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              LTotDairyBull.Caption := IntToStr(GenQuery.RecordCount) ;
                                              AnimalCount := StrToFloat( LTotDairyBull.Caption);
                                              LPercDairyBull.Caption := FloatToStrF(((AnimalCount / HerdTotal) * 100),ffFixed, 8, 1);
                                            end;
                                      end;
                        BBulls      : begin
                                         SQL.Add('SELECT DISTINCT A.ID                       ');
                                         SQL.Add('FROM Animals A                             ');
                                         SQL.Add('WHERE (A.Sex = "Bull")                     ');
                                         SQL.Add('AND   (A.AnimalDeleted=False)              ');
                                         SQL.Add('AND   (A.Breeding = False)                 ');
                                         SQL.Add('AND   (A.InHerd=True)                      ');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              LTotBeefBull.Caption := IntToStr(GenQuery.RecordCount) ;
                                              AnimalCount := StrToFloat(  LTotBeefBull.Caption);
                                              LPercBeefBull.Caption := FloatToStrF(((AnimalCount / HerdTotal) * 100),ffFixed, 8, 1);
                                            end;

                                      end;
                        Steers      : begin
                                         SQL.Add('SELECT DISTINCT A.ID                       ');
                                         SQL.Add('FROM Animals A                             ');
                                         SQL.Add('WHERE (A.Sex = "Steer")                    ');
                                         SQL.Add('AND   (A.AnimalDeleted=False)              ');
                                         SQL.Add('AND   (A.Breeding = False)                 ');
                                         SQL.Add('AND   (A.InHerd=True)                      ');
                                         SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+' )    ');
                                         Open;

                                         if GenQuery.RecordCount > 0 then
                                            begin
                                              LTotSteers.Caption := IntToStr(GenQuery.RecordCount);
                                              AnimalCount := StrToFloat(    LTotSteers.Caption);
                                              LPercSteers.Caption := FloatToStrF(((AnimalCount / HerdTotal) * 100),ffFixed, 8, 1);
                                            end;

                                      end;
                     end;
                  end;
               pbar.StepIt;
            end;
      except
      end;
   finally
      pbar.Position := 0;
      pbar.Hide;
      GenQuery.Close;
      GenQuery.Free;
   end;

end;

procedure TfHerdStat.ShowTheForm;
begin
end;

procedure TfHerdStat.SbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfHerdStat.FormShow(Sender: TObject);
begin
  // Height := MenuForm.Height - MenuForm.Height + 40;
   IntToStr(WinData.UserDefaultHerdID);
   pDairy.Visible := True;
   pAny.Visible   := True;
   HerdType := WinData.dsHerdDefaults.DataSet.FieldByName('TypeOfHerd').AsInteger;
   if HerdType = 25 then
      begin
         pDairy.Visible := False;
         pAny.Top := pDairy.Top;
      end;
   BlankCaptions;
   Timer1.Enabled := True;

end;

procedure TfHerdStat.BlankCaptions;
begin
   lTotCowsInHerd.Caption  := '0';
   LTotPdCon.Caption       := '0';
   LTotServNotPd.Caption   := '0';
   LTotNotServ.Caption     := '0';
   LTotInMilk.Caption      := '0';
   LTotDry.Caption         := '0';
   LTotDairyHeif.Caption   := '0';
   LTotBeefHeif.Caption    := '0';
   LTotDairyBull.Caption   := '0';
   LTotBeefBull.Caption    := '0';
   LTotSteers.Caption      := '0';
   LPercCowsInHerd.Caption := '0';
   LPercPdCon.Caption      := '0';
   LPercServNotPd.Caption  := '0';
   LPercNotServ.Caption    := '0';
   LPercInMilk.Caption     := '0';
   LPercDry.Caption        := '0';
   LPercDairyHeif.Caption  := '0';
   LPercBeefHeif.Caption   := '0';
   LPercDairyBull.Caption  := '0';
   LPercSteers.Caption     := '0';
   LPercBeefBull.Caption   := '0';
   lTotNotPreg.Caption     := '0';
   lPerclNotPreg.Caption   := '0';
end;

procedure TfHerdStat.HerdComboCloseUp(Sender: TObject);
begin
   BlankCaptions;
   DoSQLs;
end;

procedure TfHerdStat.FormCreate(Sender: TObject);
begin
   try
      Left := MenuForm.Left + 50;
      HerdCombo.KeyValue := WinData.UserDefaultHerdID;
   except
      //
   end;
end;

procedure TfHerdStat.RxSpeedButton1Click(Sender: TObject);
begin
   try
      Application.CreateForm(TfHerdStatsExtended, fHerdStatsExtended);
      fHerdStatsExtended.Left := fHerdStat.Left+fHerdStat.Width+5;
      fHerdStatsExtended.ShowModal;
   finally
      fHerdStatsExtended.Free;
   end;
end;

procedure TfHerdStat.sbPrintClick(Sender: TObject);
begin
   AssignCaptions;
   qrStats.Print;
end;

procedure TfHerdStat.AssignCaptions;
begin
   lHerd.Caption := HerdCombo.Text;
   QRTotCows.Caption          := lTotCowsInHerd.Caption;
   QRTotNotServed.Caption     := LTotNotServ.Caption;
   QRTotServedNotPD.Caption   := LTotServNotPd.Caption;
   QRTotPdCon.Caption         := LTotPdCon.Caption;
   QRTotMilk.Caption          := LTotInMilk.Caption;
   QRTotDry.Caption           := LTotDry.Caption;
   QRPerCows.Caption          := LPercCowsInHerd.Caption;
   QRPerNotServed.Caption     := LPercNotServ.Caption;
   QRPerServedNotPD.Caption   := LPercServNotPd.Caption;
   QRPerPdCon.Caption         := LPercPdCon.Caption;
   QRPerMilk.Caption          := LPercInMilk.Caption;
   QRPerDry.Caption           := LPercDry.Caption;
   QRTotDHeifers.Caption      := LTotDairyHeif.Caption;
   QRTotBHeifers.Caption      := LTotBeefHeif.Caption;
   QRTotDBulls.Caption        := LTotDairyBull.Caption;
   QRTotBBulls.Caption        := LTotBeefBull.Caption;
   QRTotSteers.Caption        := LTotSteers.Caption;
   QRPerDHeifers.Caption      := LPercDairyHeif.Caption;
   QRPerBHeifers.Caption      := LPercBeefHeif.Caption;
   QRPerDBulls.Caption        := LPercDairyBull.Caption;
   QRPerBBulls.Caption        := LPercBeefBull.Caption;
   QRPerSteers.Caption        := LPercSteers.Caption;
end;

function TfHerdStat.GetAllCows: Integer;
begin
   RESULT := AllCows;
end;

procedure TfHerdStat.SetAllCows(const Value: Integer);
begin
   AllCows := Value;
end;

procedure TfHerdStat.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := False;
   DoSQLs;
end;

end.

