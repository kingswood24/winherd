unit uHerdStatsExtended;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RxLookup, TB97Tlbr, RXCtrls, TB97, Mask, ToolEdit,
  Db, DBTables, ComCtrls, Qrctrls, QuickRpt, QRExport;

type
  TfHerdStatsExtended = class(TForm)
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    SbExit: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    Panel2: TPanel;
    Label15: TLabel;
    HerdCombo : TRxDBLookupCombo;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LPercFourthServ: TLabel;
    LPercAllServ: TLabel;
    LTotFirstServ: TLabel;
    LPercFirstServ: TLabel;
    LTotSecondServ: TLabel;
    LPercSecondServ: TLabel;
    LTotThirdServ: TLabel;
    LPercThirdServ: TLabel;
    LTotFourthServ: TLabel;
    LTotAllServ: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lTotAllCalvings: TLabel;
    LTotStillBirth: TLabel;
    lTotSingleBirths: TLabel;
    lTotTwinBirths: TLabel;
    lPercAllCalvings: TLabel;
    LPercStillBirth: TLabel;
    lPercSingleBirths: TLabel;
    lPercTwinBirths: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    LTotLiveCalves: TLabel;
    LPercLiveCalves: TLabel;
    LTotDeadCalves: TLabel;
    Label25: TLabel;
    LPercDeadCalves: TLabel;
    Label27: TLabel;
    LTotHeiferCalves: TLabel;
    LPercHeiferCalves: TLabel;
    LTotBullCalves: TLabel;
    LPercBullCalves: TLabel;
    Label22: TLabel;
    LTotAllCalves: TLabel;
    LPercAllCalves: TLabel;
    Bevel4: TBevel;
    Bevel2: TBevel;
    lAvgServe: TLabel;
    Bevel5: TBevel;
    Label13: TLabel;
    Bevel6: TBevel;
    qrExtended: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    Services: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel44: TQRLabel;
    QRTotBullCalves: TQRLabel;
    QRTotHeiferCalves: TQRLabel;
    QRTotDeadCalves: TQRLabel;
    QRTotLiveCalves: TQRLabel;
    QRTotAllCalves: TQRLabel;
    QRTotTwinBirths: TQRLabel;
    QRTotSingleBirths: TQRLabel;
    QRTotStillBirth: TQRLabel;
    QRTotAllCalvings: TQRLabel;
    QRTotFourthServ: TQRLabel;
    QRTotThirdServ: TQRLabel;
    QRTotSecondServ: TQRLabel;
    QRTotFirstServ: TQRLabel;
    QRTotAllServ: TQRLabel;
    QRPercAllServ: TQRLabel;
    QRPercFirstServ: TQRLabel;
    QRPerSecondServ: TQRLabel;
    QRPerThirdServ: TQRLabel;
    QRPercFourthServ: TQRLabel;
    QRPercAllCalvings: TQRLabel;
    QRPercStillBirth: TQRLabel;
    QRPercSingleBirths: TQRLabel;
    QRPercTwinBirths: TQRLabel;
    QRPercAllCalves: TQRLabel;
    QRPercLiveCalves: TQRLabel;
    QRPercDeadCalves: TQRLabel;
    QRPercHeiferCalves: TQRLabel;
    QRPercBullCalves: TQRLabel;
    QRLabel13: TQRLabel;
    lHerd: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel16: TQRLabel;
    Label12: TLabel;
    Label20: TLabel;
    lNoAnimalsServiced: TLabel;
    qCalfIndex: TQuery;
    Panel4: TPanel;
    Label11: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lActCalfIndex: TLabel;
    lProjCalfIndex: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    Timer: TTimer;
    procedure SbExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HerdComboCloseUp(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure FromDateChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }

    TempTable : TTable;
    procedure DoSQLs;
    procedure BlankCaptions;
    procedure AssignCaptions;
    procedure GetCalvingIndex;
  public
    { Public declarations }
     HerdTotal : Double;
     procedure ShowTheForm;
  end;

var
   fHerdStatsExtended: TfHerdStatsExtended;
   ServiceRecords : record
     AllServices : Integer;
     Service1    : Integer;
     Service2    : Integer;
     Service3    : Integer;
     Service4AndMore : Integer;
   end;
const
   AllCalvings       = 0;
   StillBirths       = 1;
   NoSingleBirth     = 2;
   NoTwinBirths      = 3;
   AllCalves         = 4;
   LiveCalves        = 5;
   DeadCalves        = 6;
   HeiferCalves      = 7;
   BulCalves         = 8;
   AllServices       = 9;
   CalvingIndex      = 10;

implementation
uses
   DairyData,
   GenTypesConst,
   uHerdStat, MenuUnit;
   {$R *.DFM}


procedure TfHerdStatsExtended.DoSQLs;
var
   i           : Integer;
   HerdTotal,
   AnimalCount : Double;
   NoTwins     : Integer;
   MyQuery,
   qSecond     : TQuery;
   Bull  : Integer;
   Heifer  : Integer;
   Calvings : Double;
   TwinBirths : Integer;
   Calves   : Integer;
   DeadCalv : Integer;
   SingleBirths : Integer;
   StillBirth : Integer;
   CalvingNoLiveBirths : Integer;
   CalvesList : TStringList;
   LastCalvDate : Integer;
   LactNo : Integer;
   LastLactNo : Integer;
begin
   CalvesList := TStringList.Create;

   if HerdCombo.Value <> '0' then
   try
      try
         MyQuery := TQuery.Create(nil);
         MyQuery.DatabaseName := WinData.KingData.DatabaseName;
         FillChar(ServiceRecords, SizeOf(ServiceRecords), 0);
         with MyQuery do
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT DISTINCT Count(A.ID) CountAID      ');
               SQL.Add('FROM Animals A                            ');
               SQL.Add('WHERE (A.InHerd=True)                     ');
               SQL.Add('AND (A.AnimalDeleted =False)              ');
               SQL.Add('AND (A.HerdID = ' + HerdCombo.Value + ' ) ');
               Prepare;
               Open;

               if MyQuery.FieldByName('CountAID').AsInteger > 0 then
                  HerdTotal := StrToFloat(MyQuery.FieldByName('CountAID').AsString);
            end;

         qSecond := TQuery.Create(nil);
         qSecond.DatabaseName := WinData.KingData.DatabaseName;

         for i := 0 to 13 do
            with MyQuery do
               begin
                  Close;
                  SQL.Clear;
                  AnimalCount := 0;
                  case i of
                     AllCalvings      : try
                                           SQL.Add('SELECT  Distinct E.ID                    ');
                                           SQL.Add('FROM    Events E                         ');
                                           SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE  (E.HerdId = '+HerdCombo.Value+' ) ');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.ADD('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;


                                           if MyQuery.RecordCount > 0 then
                                              begin
                                                 lTotAllCalvings.Caption := IntToStr(MyQuery.RecordCount);
                                                 lPercAllCalvings.Caption := '100';
                                                 Calvings := StrToFloat(lTotAllCalvings.Caption);
                                              end;
                                        except
                                          //
                                        end;
                     NoSingleBirth    : try
                                           SQL.Add('SELECT Count (E.ID)  EID                ');
                                           SQL.Add('FROM Calvings   C                       ');
                                           SQL.Add('LEFT JOIN Events E ON (C.EventID=E.ID)   ');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1  is null))  ');
                                           SQL.Add('OR    ((C.ID2 > 0) And  (C.CalfDead2  is null))   ');
                                           SQL.Add('OR    ((C.ID3 > 0) And  (C.CalfDead3  is null))   ');
                                           SQL.Add('OR    ((C.ID4 > 0) And  (C.CalfDead4  is null)))  ');
                                           SQL.Add('AND NOT (((C.ID1 > 0)  AND     (C.CalfDead1 is Null ))  ');
                                           SQL.Add('AND   ((C.ID2 > 0)   AND     (C.CalfDead2 is Null ))  ');
                                           SQL.Add('OR    ((C.ID3 > 0)   AND     (C.CalfDead3 is Null ))  ');
                                           SQL.Add('OR    ((C.ID4 > 0)   AND     (C.CalfDead4 is Null ))) ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )  ');
                                           SQL.Add('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           SingleBirths := MyQuery.FieldByName('EID').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count (E.ID)  EID               ');
                                           SQL.Add('FROM Calvings C                         ');
                                           SQL.Add('LEFT JOIN Events E ON (C.EventID=E.ID)  ');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = False   ))  ');
                                           SQL.Add('OR    ((C.ID2 > 0) And  (C.CalfDead2 = False  ))   ');
                                           SQL.Add('OR    ((C.ID3 > 0) And  (C.CalfDead3 = False  ))   ');
                                           SQL.Add('OR    ((C.ID4 > 0) And  (C.CalfDead4 = False  )))  ');
                                           SQL.Add('AND NOT (((C.ID1 > 0)  AND     (C.CalfDead1 = False ))  ');
                                           SQL.Add('AND   ((C.ID2 > 0)   AND     (C.CalfDead2 = False ))  ');
                                           SQL.Add('OR    ((C.ID3 > 0)   AND     (C.CalfDead3 = False ))  ');
                                           SQL.Add('OR    ((C.ID4 > 0)   AND     (C.CalfDead4 = False ))) ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           SingleBirths := SingleBirths + MyQuery.FieldByName('EID').AsInteger;

                                           if SingleBirths > 0 then
                                              lTotSingleBirths.Caption := IntToStr(SingleBirths);


                                           lPercSingleBirths.Caption := FloatToStrF((((SingleBirths) / Calvings)*100),ffFixed, 8, 1);
                                        except
                                          //
                                        end;

                     StillBirths      : try
                                           SQL.Clear;
                                           SQL.Add('SELECT  Count (E.ID) NoLiveCalves    ');
                                           SQL.Add('FROM    Events E                        ');
                                           SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))');
                                           SQL.Add('OR    ((C.ID2 > 0) And  (C.CalfDead2 = True  ))');
                                           SQL.Add('OR    ((C.ID3 > 0) And  (C.CalfDead3 = True  ))');
                                           SQL.Add('OR    ((C.ID4 > 0) And  (C.CalfDead4 = True  )))');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           CalvingNoLiveBirths := MyQuery.FieldByName('NoLiveCalves').AsInteger;;
                                           LTotStillBirth.Caption := IntToStr( CalvingNoLiveBirths );
                                           LPercStillBirth.Caption := FloatToStrF(((CalvingNoLiveBirths / Calvings)*100),ffFixed, 8, 1);

                                           SQL.Clear;
                                           SQL.Add('SELECT  Count (E.ID) DC              ');
                                           SQL.Add('FROM    Events E                        ');
                                           SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE   DeadCalves > 0                  ');
                                           SQL.Add('AND    ((C.ID1 <= 0)   ');
                                           SQL.Add('AND     (C.ID2 <= 0)   ');
                                           SQL.Add('AND     (C.ID3 <= 0)   ');
                                           SQL.Add('AND     (C.ID4 <= 0))   ');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           StillBirth := MyQuery.FieldByName('DC').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count (C.EventId)  CD1          ');
                                           SQL.Add('FROM    Calvings C                      ');
                                           SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
                                           SQL.Add('AND    ((C.ID2 = 0) And  (C.CalfDead2 = False ))  ');
                                           SQL.Add('AND    ((C.ID3 = 0) And  (C.CalfDead3 = False ))  ');
                                           SQL.Add('AND    ((C.ID4 = 0) And  (C.CalfDead4 = False ))) ');
                                           SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           StillBirth := StillBirth + MyQuery.FieldByName('CD1').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count (C.EventId)  CD2           ');
                                           SQL.Add('FROM    Calvings C                      ');
                                           SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
                                           SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2 = True  ))  ');
                                           SQL.Add('AND    ((C.ID3 = 0) And  (C.CalfDead3 = False ))  ');
                                           SQL.Add('AND    ((C.ID4 = 0) And  (C.CalfDead4 = False ))) ');
                                           SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           StillBirth := StillBirth + MyQuery.FieldByName('CD2').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count (C.EventId)  CD3           ');
                                           SQL.Add('FROM    Calvings C                      ');
                                           SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
                                           SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2 = True  ))   ');
                                           SQL.Add('AND    ((C.ID3 > 0) And  (C.CalfDead3 = True  ))   ');
                                           SQL.Add('AND    ((C.ID4 = 0) And  (C.CalfDead4 = False )))  ');
                                           SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           StillBirth := StillBirth + MyQuery.FieldByName('CD3').AsInteger ;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count (C.EventId)  CD4           ');
                                           SQL.Add('FROM    Calvings C                      ');
                                           SQL.Add('LEFT JOIN  Events E  ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE (((C.ID1 > 0) And  (C.CalfDead1 = True  ))  ');
                                           SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2 = True  ))   ');
                                           SQL.Add('AND    ((C.ID3 > 0) And  (C.CalfDead3 = True  ))   ');
                                           SQL.Add('AND    ((C.ID4 > 0) And  (C.CalfDead4 = True  )))  ');
                                           SQL.Add('AND    (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.Add('AND    (E.EventType = '+IntToStr(CCalvingEvent)+')');
                                           SQL.Add('AND    (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           StillBirth := StillBirth + MyQuery.FieldByName('CD4').AsInteger ;
                                           if StillBirth > 0 then
                                              LTotDeadCalves.Caption := IntToStr(StillBirth);
                                           LPercDeadCalves.Caption := FloatToStrF(((StrToFloat(LTotDeadCalves.Caption) / Calvings)*100),ffFixed, 8, 1);
                                        except
                                         //
                                        end;
                     NoTwinBirths     : try
                                           SQL.Add('SELECT Count (E.ID) CID                 ');
                                           SQL.Add('FROM  Events E                          ');
                                           SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE  (((C.ID1 > 0) And  (C.CalfDead1  is null))  ');
                                           SQL.Add('AND    ((C.ID2 > 0) And  (C.CalfDead2  is null))   ');
                                           SQL.Add('OR    ((C.ID3 > 0) And  (C.CalfDead3  is null))   ');
                                           SQL.Add('OR    ((C.ID4 > 0) And  (C.CalfDead4  is null)))  ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           TwinBirths := MyQuery.FieldByName('CID').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count (E.ID) CID                 ');
                                           SQL.Add('FROM  Events E                          ');
                                           SQL.Add('LEFT JOIN Calvings C ON (C.EventID=E.ID)');
                                           SQL.Add('WHERE (((C.ID1 > 0)  AND     (C.CalfDead1 = False ))  ');
                                           SQL.Add('AND   ((C.ID2 > 0)   AND     (C.CalfDead2 = False ))  ');
                                           SQL.Add('OR    ((C.ID3 > 0)   AND     (C.CalfDead3 = False ))  ');
                                           SQL.Add('OR    ((C.ID4 > 0)   AND     (C.CalfDead4 = False ))) ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' ) ');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           TwinBirths := TwinBirths + MyQuery.FieldByName('CID').AsInteger;

                                           if TwinBirths > 0 then
                                              lTotTwinBirths.Caption := IntToStr(TwinBirths);

                                           lPercTwinBirths.Caption := FloatToStrF(((StrToFloat(lTotTwinBirths.Caption) / Calvings)*100),ffFixed, 8, 1);
                                        except
                                        //
                                        end;
                    AllCalves        : try
                                           LPercAllCalves.Caption := '100';

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.ID1) CID1               ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (((C.ID1 > 0) AND   (C.CalfDead1 = False))  ');
                                           SQL.Add('OR ((C.ID1 > 0) AND   (C.CalfDead1 is Null)))  ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;


                                           Calves := MyQuery.FieldByName('CID1').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.ID2) CID2              ');
                                           SQL.Add('FROM Calvings C                       ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID)');
                                           SQL.Add('WHERE (((C.ID2 > 0)   AND   (C.CalfDead2 = False)) ');
                                           SQL.Add('OR ((C.ID2 > 0) AND   (C.CalfDead2 is Null)))  ');
                                           SQL.Add('AND (E.HerdId = '+HerdCombo.Value+' ) ');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Calves := Calves+MyQuery.FieldByName('CID2').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.ID3) CID3               ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (((C.ID3 > 0)  AND   (C.CalfDead3 = False)) ');
                                           SQL.Add('OR ((C.ID3 > 0) AND   (C.CalfDead3 is Null)))  ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Calves := Calves+MyQuery.FieldByName('CID3').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.ID4) CID4               ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (((C.ID4 > 0)  AND   (C.CalfDead4 = False)) ');
                                           SQL.Add('OR ((C.ID4 > 0) AND   (C.CalfDead4 is Null)))  ');
                                           SQL.Add('AND (E.HerdId = '+HerdCombo.Value+' )  ');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Calves := Calves+MyQuery.FieldByName('CID4').AsInteger;

                                           if Calves > 0 then
                                              LPercAllCalves.Caption := '100'
                                           else
                                              LPercAllCalves.Caption := '0';
                                           LTotLiveCalves.Caption := IntToStr(Calves);

                                           SQL.Clear;
                                           SQL.Add('SELECT Distinct Sum(C.DeadCalves) CID  ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (C.DeadCalves > 0 )              ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           DeadCalv := MyQuery.FieldByName('CID').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.CalfDead1) CID1         ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (C.CalfDead1 = True)             ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+') ');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           DeadCalv := DeadCalv + MyQuery.FieldByName('CID1').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.CalfDead2) CID2         ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (C.CalfDead2 = True)             ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           DeadCalv := DeadCalv +MyQuery.FieldByName('CID2').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.CalfDead3) CID3         ');
                                           SQL.Add('FROM Calvings C                        ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID) ');
                                           SQL.Add('WHERE (C.CalfDead3 = True)            ');
                                           SQL.Add('AND   (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           DeadCalv := DeadCalv + MyQuery.FieldByName('CID3').AsInteger;


                                           SQL.Clear;
                                           SQL.Add('SELECT Count(C.CalfDead4) CID4        ');
                                           SQL.Add('FROM Calvings C                       ');
                                           SQL.Add('LEFT JOIN Events E ON (E.ID=C.EventID)');
                                           SQL.Add('WHERE    (C.CalfDead4 = True)        ');
                                           SQL.Add('AND  (E.HerdId = '+HerdCombo.Value+' )');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           DeadCalv := DeadCalv + MyQuery.FieldByName('CID4').AsInteger;


                                           LTotDeadCalves.Caption := IntToStr(DeadCalv);

                                           LTotAllCalves.Caption := IntToStr(Calves);


                                           LTotAllCalves.Caption := IntToStr(StrToInt(LTotLiveCalves.Caption) + StrToInt(LTotDeadCalves.Caption));

                                           LPercLiveCalves.Caption := FloatToStrF((((StrToFloat(LTotLiveCalves.Caption)) / StrToInt(LTotAllCalves.Caption))*100),ffFixed, 8, 1);
                                           LPercDeadCalves.Caption := FloatToStrF((((StrToFloat(LTotDeadCalves.Caption)) / StrToInt(LTotAllCalves.Caption))*100),ffFixed, 8, 1);

                                        except;
                                         //
                                        end;
                     LiveCalves       : begin
                                        //
                                        end;
                     DeadCalves       : begin
                                        //
                                        end;
                     HeiferCalves     : try

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID)  AID1                                    ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID1            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead1 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead1 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   (A.Sex = "Female")                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Heifer := MyQuery.FieldByName('AID1').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID)  AID2                                       ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID2            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead2 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead2 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   (A.Sex = "Female")                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           Heifer :=Heifer + MyQuery.FieldByName('AID2').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID)  AID3                                     ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID3            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead3 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead3 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   (A.Sex = "Female")                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           Heifer :=Heifer + MyQuery.FieldByName('AID3').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID)  AID4                                      ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID4            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead4 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead4 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   (A.Sex = "Female")                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;
                                           Heifer :=Heifer + MyQuery.FieldByName('AID4').AsInteger;

                                           if Heifer > 0 then

                                              LTotHeiferCalves.Caption := IntToStr(Heifer);
                                           LPercHeiferCalves.Caption := FloatToStrF((((StrToFloat(LTotHeiferCalves.Caption)) / StrToInt(LTotLiveCalves.Caption))*100),ffFixed, 8, 1);
                                        except
                                         //
                                        end;
                     BulCalves        : try

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID)  AID1                                    ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID1            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead1 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead1 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer")) ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Bull := MyQuery.FieldByName('AID1').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID) AID2                                     ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID2            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead2 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead2 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer"))                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Bull :=Bull + MyQuery.FieldByName('AID2').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID) AID3                                     ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID3            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead3 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead3 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer"))                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Bull :=Bull + MyQuery.FieldByName('AID3').AsInteger;

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(A.ID) AID4                                     ');
                                           SQL.Add('FROM Animals A                                   ');
                                           SQL.Add('WHERE (A.ID IN (SELECT DISTINCT C.ID4            ');
                                           SQL.Add('                FROM Calvings C                  ');
                                           SQL.ADD('                WHERE ((C.CalfDead4 = False)     ');
                                           SQL.Add('                OR     (C.CalfDead4 IS    Null)) ');
                                           SQL.Add('      )         )                                ');
                                           SQL.Add('AND   ((A.Sex = "Bull") OR    (A.Sex = "Steer"))                         ');
                                           SQL.Add('AND   (A.HerdId = '+HerdCombo.Value+')           ');
                                           SQL.ADD('AND   (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           Bull :=Bull + MyQuery.FieldByName('AID4').AsInteger;

                                           if Bull > 0 then
                                              LTotBullCalves.Caption := IntToStr(Bull);
                                           LPercBullCalves.Caption := FloatToStrF((((StrToFloat(LTotBullCalves.Caption)) / StrToInt(LTotLiveCalves.Caption))*100),ffFixed, 8, 1);
                                        except
                                        //
                                        end;
                     AllServices      : try
                                           SQL.Add('SELECT DISTINCT(E.AnimalID) ');
                                           SQL.Add('FROM  Events E                                   ');
                                           SQL.Add('WHERE   (E.HerdId = '+HerdCombo.Value+' )        ');
                                           SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           SQL.ADD('ORDER BY E.AnimalID');
                                           Prepare;
                                           Open;
                                           lNoAnimalsServiced.Caption := IntToStr(MyQuery.RecordCount); // Number of animals serviced between that period

                                           SQL.Clear;
                                           SQL.Add('SELECT Count(E.ID) CEID ');
                                           SQL.Add('FROM  Events E                                   ');
                                           SQL.Add('WHERE   (E.HerdId = '+HerdCombo.Value+' )        ');
                                           SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           Prepare;
                                           Open;

                                           if MyQuery.FieldByName('CEID').AsInteger > 0 then
                                              begin
                                                 LTotAllServ.Caption := IntToStr(MyQuery.FieldByName('CEID').AsInteger);
                                                 ServiceRecords.AllServices := MyQuery.FieldByName('CEID').AsInteger;
                                                 lAvgServe.Caption := FloatToStrF(ServiceRecords.AllServices / (StrToInt(lNoAnimalsServiced.Caption)),ffFixed, 8, 1);
                                              end;

                                           SQL.Clear;
                                           SQL.Add('SELECT DISTINCT E.ID, E.AnimalID, E.AnimalLactNo, E.EventDate  ');
                                           SQL.Add('FROM Events E                                    ');
                                           SQL.Add('LEFT JOIN Animals A ON (A.ID=E.AnimalID)         ');
                                           SQL.Add('WHERE (A.HerdId = '+HerdCombo.Value+' )          ');
                                           SQL.Add('AND   (E.EventType = '+IntToStr(CServiceEvent)+')');
                                           SQL.ADD('AND   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                           SQL.ADD('GROUP BY E.ID, E.AnimalID, E.AnimalLactNo, E.EventDate           ');
                                           Prepare;
                                           Open;

                                           if MyQuery.RecordCount > 0 then
                                              begin
                                                 First;
                                                 While not MyQuery.EOF do
                                                    begin
                                                       qSecond.Close;
                                                       qSecond.SQL.Clear;
                                                       qSecond.SQL.Add('Select Count(E.ID) CEID        ');
                                                       qSecond.SQL.Add('From Events E                  ');
                                                       qSecond.SQL.Add('Where (E.AnimalID = :EAnimalID)');
                                                       qSecond.SQL.Add('And   (E.AnimalLactNo = :LactNo)');
                                                       qSecond.SQL.Add('And   (E.EventType = '+IntToStr(CServiceEvent)+')');
                                                       qSecond.SQL.Add('And   (E.EventDate BETWEEN ' + '''' + FormatDateTime('mm/dd/yyyy',FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime('mm/dd/yyyy',ToDate.Date) + '''' + ')');
                                                       qSecond.ParamByName('EAnimalID').AsInteger := MyQuery.FieldByName('AnimalID').AsInteger;
                                                       qSecond.ParamByName('LactNo').AsInteger := MyQuery.FieldByName('AnimalLactNo').AsInteger;
                                                       qSecond.Prepare;
                                                       qSecond.Open;

                                                       if qSecond.FieldByName('CEID').AsInteger = 1 then
                                                          Inc(ServiceRecords.Service1)
                                                       else if qSecond.FieldByName('CEID').AsInteger = 2 then
                                                          Inc(ServiceRecords.Service2)
                                                       else if qSecond.FieldByName('CEID').AsInteger = 3 then
                                                          Inc(ServiceRecords.Service3)
                                                       else if qSecond.FieldByName('CEID').AsInteger >= 4 then
                                                          Inc(ServiceRecords.Service4AndMore);
                                                        MyQuery.Next;
                                                    end;
                                              end;
                                              if ServiceRecords.Service1 > 0 then
                                                 LPercAllServ.Caption       := '100';

                                              LTotFirstServ.Caption  := IntToStr(ServiceRecords.Service1);
                                              LTotSecondServ.Caption := IntToStr(ServiceRecords.Service2);
                                              LTotThirdServ.Caption  := IntToStr(ServiceRecords.Service3);
                                              LTotFourthServ.Caption := IntToStr(ServiceRecords.Service4AndMore);

                                              LPercFirstServ.Caption  := FloatToStrF(((ServiceRecords.Service1 / ServiceRecords.AllServices) * 100),ffFixed, 8, 1);
                                              LPercSecondServ.Caption := FloatToStrF(((ServiceRecords.Service2 / ServiceRecords.AllServices) * 100),ffFixed, 8, 1);
                                              LPercThirdServ.Caption  := FloatToStrF(((ServiceRecords.Service3 / ServiceRecords.AllServices) * 100),ffFixed, 8, 1);
                                              LPercFourthServ.Caption := FloatToStrF(((ServiceRecords.Service4AndMore / ServiceRecords.AllServices) * 100),ffFixed, 8, 1);
                                       except
                                       //
                                       end;
                     end;
               end;

except
   //
end;
finally
  MyQuery.Close;
  MyQuery.Free;
end;
end;

procedure TfHerdStatsExtended.ShowTheForm;
begin
end;

procedure TfHerdStatsExtended.SbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfHerdStatsExtended.FormShow(Sender: TObject);
begin
   FromDate.Date := IncMonth(Date, -12);
   ToDate.Date := Date;
   if HerdCombo.Value = '0' then
      HerdCombo.Value := fHerdStat.HerdCombo.Value;
   BlankCaptions;
   Update;
   Timer.Enabled := True;
end;

procedure TfHerdStatsExtended.BlankCaptions;
begin
   lTotAllCalvings.Caption    := '0';
   lTotStillBirth.Caption     := '0';
   lTotSingleBirths.Caption   := '0';
   lTotTwinBirths.Caption     := '0';
   LPercStillBirth.Caption    := '0';
   lPercSingleBirths.Caption  := '0';
   lPercTwinBirths.Caption    := '0';
   LTotAllCalves.Caption      := '0';
   LPercAllCalves.Caption     := '0';
   lTotLiveCalves.Caption     := '0';
   lTotDeadCalves.Caption     := '0';
   lTotHeiferCalves.Caption   := '0';
   lTotBullCalves.Caption     := '0';
   lPercLiveCalves.Caption    := '0';
   lPercDeadCalves.Caption    := '0';
   lPercHeiferCalves.Caption  := '0';
   lPercBullCalves.Caption    := '0';
   LTotAllServ.Caption        := '0';
   LTotFirstServ.Caption      := '0';
   LTotSecondServ.Caption     := '0';
   LTotThirdServ.Caption      := '0';
   LTotFourthServ.Caption     := '0';
   lPercAllCalvings.Caption   := '0';
   LPercAllServ.Caption       := '0';
   LPercFirstServ.Caption     := '0';
   LPercSecondServ.Caption    := '0';
   LPercThirdServ.Caption     := '0';
   LPercFourthServ.Caption    := '0';
   lAvgServe.Caption := '0';
   lProjCalfIndex.Caption    := '0';
   lActCalfIndex.Caption := '0';
end;

procedure TfHerdStatsExtended.AssignCaptions;
begin
   lHerd.Caption := HerdCombo.Text;
   QRTotAllServ.Caption         := LTotAllServ.Caption;
   QRTotFirstServ.Caption       := LTotFirstServ.Caption;
   QRTotSecondServ.Caption      := LTotSecondServ.Caption;
   QRTotThirdServ.Caption       := LTotThirdServ.Caption;
   QRTotFourthServ.Caption      := LTotFourthServ.Caption;
   QRTotAllCalvings.Caption     := LTotAllCalvings.Caption;
   QRTotStillBirth.Caption      := LTotStillBirth.Caption;
   QRTotAllCalves.Caption       := LTotAllCalves.Caption;
   QRTotSingleBirths.Caption    := LTotSingleBirths.Caption;
   QRTotTwinBirths.Caption      := LTotTwinBirths.Caption;
   QRTotLiveCalves.Caption      := LTotLiveCalves.Caption;
   QRTotDeadCalves.Caption      := LTotDeadCalves.Caption;
   QRTotHeiferCalves.Caption    := LTotHeiferCalves.Caption;
   QRTotBullCalves.Caption      := LTotBullCalves.Caption;
   QRPercAllServ.Caption        := LPercAllServ.Caption;
   QRPercFirstServ.Caption      := LPercFirstServ.Caption;
   QRPerSecondServ.Caption      := LPercSecondServ.Caption;
   QRPerThirdServ.Caption       := LPercThirdServ.Caption;
   QRPercFourthServ.Caption     := LPercFourthServ.Caption;
   QRPercAllCalvings.Caption    := lPercAllCalvings.Caption;
   QRPercStillBirth.Caption     := LPercStillBirth.Caption;
   QRPercSingleBirths.Caption   := lPercSingleBirths.Caption;
   QRPercTwinBirths.Caption     := lPercTwinBirths.Caption;
   QRPercAllCalves.Caption      := LPercAllCalves.Caption;
   QRPercLiveCalves.Caption     := LPercLiveCalves.Caption;
   QRPercDeadCalves.Caption     := LPercDeadCalves.Caption;
   QRPercHeiferCalves.Caption   := LPercHeiferCalves.Caption;
   QRPercBullCalves.Caption     := LPercBullCalves.Caption;
end;

procedure TfHerdStatsExtended.HerdComboCloseUp(Sender: TObject);
begin
   BlankCaptions;
   DoSQLs;
   GetCalvingIndex;
end;

procedure TfHerdStatsExtended.FormResize(Sender: TObject);
begin
   Width := 359;
   Height := 581;
end;

procedure TfHerdStatsExtended.sbPrintClick(Sender: TObject);
begin
   AssignCaptions;
   qrExtended.Print;
end;

procedure TfHerdStatsExtended.FromDateChange(Sender: TObject);
begin
   BlankCaptions;
   Refresh;
   DoSQLs;
   GetCalvingIndex;
end;

procedure TfHerdStatsExtended.GetCalvingIndex;
var
   ActualCalfIndex, ProjCalfIndex, CalfIndex : Integer;
   UsedPD    : Boolean;
   NoDaysPreg,
   CowSum,
   Gestation,
   ActualCowNum,
   ProjCowNum : Integer;
   ThisCalvingDate, LastCalvingDate,
   ProjCalvingDate : TDateTime;
   CalvingInfo : TCalvingInfo;


begin
      qCalfIndex := TQuery.Create(nil);
      with qCalfIndex do
         try
            DatabaseName := 'kingswd';
            SQL.CLEAR;
            SQL.Add('SELECT A.ID AnimalID, A.LactNo ');
            SQL.Add('FROM Animals A');
            SQL.Add('WHERE (A.LactNo > 0 )');
            SQL.Add('AND (A.InHerd = TRUE)');
            SQL.Add('AND (A.AnimalDeleted=FALSE)');
            Open;

            ActualCalfIndex := 0;
            ProjCalfIndex := 0;
            while NOT EOF do
               begin
                  LastCalvingDate := 0;
                  ThisCalvingDate := 0;
                  ProjCalvingDate := 0;

                  WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(FieldByName('AnimalID').AsInteger) + ')And (EventType = ' + IntToStr(CCalvingEvent) + ')';
                  WinData.CheckEvents.Filtered := True;
                  if WinData.CheckEvents.FindLast then
                     begin
                        ThisCalvingDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        if WinData.CheckEvents.FindPrior then
                           LastCalvingDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     end;

                   if (ThisCalvingDate > 0) and (LastCalvingDate > 0) then
                      begin
                          Inc(ActualCalfIndex, Round(ThisCalvingDate - LastCalvingDate));
                          Inc(ActualCowNum);
                       end;

                        // GetProjected Calving
                        CalvingInfo := WinData.GetProjCalvingInfo(FieldByName('AnimalID').AsInteger, FieldByName('LactNo').AsInteger);
                        if (ThisCalvingDate > 0) and (CalvingInfo.ProjCalvingDate > 0) then
                           begin
                              CalfIndex := 0;
                              CalfIndex :=  Round(CalvingInfo.ProjCalvingDate - ThisCalvingDate);
                              ProjCalfIndex := (ProjCalfIndex + CalfIndex);
                              Inc(ProjCowNum);
                           end;
                  WinData.CheckEvents.Filter := '';
                  WinData.CheckEvents.Filtered := False;
                  Next;
               end;
               if ActualCowNum > 0 then
                  ActualCalfIndex := (ActualCalfIndex div ActualCowNum);
               lActCalfIndex.Caption := IntToStr(ActualCalfIndex);
               if ( ProjCowNum > 0 ) then
                  ProjCalfIndex := (ProjCalfIndex div ProjCowNum);
               lProjCalfIndex.Caption := IntToStr(ProjCalfIndex);
               Application.Processmessages;
         finally
            Close;
            Free;
         end;
end;
procedure TfHerdStatsExtended.TimerTimer(Sender: TObject);
begin
   Timer.Enabled := False;
   DoSQLs;
   GetCalvingIndex;
end;

end.


