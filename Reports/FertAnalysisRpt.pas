unit FertAnalysisRpt;

{
------------------------------------------------------------------------------
 SP 25/09/2002:-

 New Option: cbUseFilters "Use Animal Grid Filter"
 procedure modifed: GetAnimals. New SQL Line Use animals only in Filter Table.

 SP 25/09/2002.
 ______________________________________________________________________________

 SP 26/09/2002:-

 Changed Screen Layout
 Changed Caption of cbUseFilters to "Use Main Filter?"

 SP 26/09/2002.
 ______________________________________________________________________________
------------------------------------------------------------------------------

 15/01/11 [V4.0 R7.6] /MK Additional Feature - Added New Radio Item, PD Date, To RgFilterby.
                                             - Added New Variables For PDProjDate and ServProjDate.
                                             - If PDProjDate > ServProjDate Then DueCalvDate Is PDProjDate Else ServProjDate.

 07/10/11 [V5.0 R1.3] /MK Change - Changed Caption of QRLabel15 From Pregnancy Status To PD Status.

 11/10/11 [V5.0 R1.3] /MK Bug Fix - Include False PD Results In Report.

 28/10/11 [V5.0 R1.7] /MK Bug Fix - LoadScreenDefaults - If TIndividualCowFert LactRange ToLact Result = 0 Then ToLact := 30.

 15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

 08/01/13 [V5.1 R3.7] /MK Bug Fix - QRDBText13/PDStatus - Set To Front as BullCode was overwriting PDStatus.
                                  - QRDBText15/BullCode - Set Autosize to False and set width to stop overwrite of PDStatus.

 06/03/13 [V5.1 R5.0] /MK Bug Fix - Moved GetServiceInfo to before GetPDInfo LastServiceDate to fix CalveToConception always showing zero.

 04/12/13 [V5.2 R6.6] /MK Bug Fix - PDProjDate and ServProjDate added to ResetVariables so dates are calculated for each animal correctly.
                                    As dates were not being zeroised, the Due To Calve date was been calculated for animals that should be due.
                                  - If DueToCalveDate and DueToDryOffDate.OnPrint - if Value is "30/12/1899" then Value should be "".

 03/06/15 [V5.4 R7.0] /MK Additional Feature - Added WinData.BreedingingDataHelper to the report to make it quicker to run.
                                             - GetServiceInfo - Added GetServiceBull_WithEventID_BySQL sub function to make the report quicker.
                                                              - Added ServBullGestPeriod variable to store the gestation period of the service bull instead of the default 283.
                                             - GetAnimals - Show error message if no data to view on the report.
                          Change - GetCalfSex - Use Calvings.DeadCalf1-4 instead of Animals.InHerd boolean when showing dead calves lower case calf sex.
                          Bug Fix - GetCalfSex - Program was incorrectly assigning Calv1 instead of Calv2, 3 or 4 so twins, triplets or quads were not showing on the report.
                                  - QRDBText3OnPrint & QRDBText8OnPrint - If zero date in database i.e. "30/12/1899", show empty string.

 19/03/20 [V5.9 R2.9] /MK Additional Feature - Added the cows current EBI value after Calv to Concep - Adrian Rothwell.
                                             - Added sort for EBI and Calve to Concep - Adrian Rothwell.                                   
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, RXCtrls,
  ComCtrls, ToolWin, db, dbTables, RXSpin, QRExport, ReportDefaults,
  cxControls, cxContainer, cxEdit, cxCheckBox, uBreedingDataHelper;

type
  TfmFertAnalysisRpt = class(TForm)
    FertRepScr: TQuickRep;
    QRBand14: TQRBand;
    QRBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    QRLabel1:
    TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
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
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    lHerdID: TQRLabel;
    LSortOption: TQRLabel;
    lSortOrder: TQRLabel;
    QRLabel79: TQRLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    rgSortOrder: TRadioGroup;
    RgSortBy: TRadioGroup;
    RptQuery: TQuery;
    pbBar: TProgressBar;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel22: TQRLabel;
    VerLabel: TQRLabel;
    RgFilterby: TRadioGroup;
    QRLabel24: TQRLabel;
    lFromDate: TQRLabel;
    QRLabel26: TQRLabel;
    lToDate: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    lFromLactNo: TQRLabel;
    QRLabel31: TQRLabel;
    lToLactNo: TQRLabel;
    lFilter: TQRLabel;
    QRLabel23: TQRLabel;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    QRShape1: TQRShape;
    cbUseFilter: TCheckBox;
    Panel2: TPanel;
    lFilterby: TLabel;
    Label4: TLabel;
    FromDate: TDateEdit;
    FromLact: TRxSpinEdit;
    ToDate: TDateEdit;
    ToLact: TRxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    ToolButton5: TToolButton;
    lFilterByDate: TQRLabel;
    QRExpr3: TQRExpr;
    rgLact: TRadioGroup;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbFavourite: TcxCheckBox;
    qrlEBI: TQRLabel;
    QRDBText17: TQRDBText;
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RgFilterbyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure rgLactClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    TempQuery: TQuery;
    OrderBy,
    SortByField : String;
    LastServiceDate,
    PDProjDate : TDateTime;
    ServProjDate : TDateTime;
    ProjCalvDate : TDateTime;
    DaysFirstServe,
    DaysLastServe : Double;
    NoServices,
    ServBullGestPeriod : Integer;
    BullUsed,
    Preg : String;
    DaysCalveToPD : Integer;
    LastCalvingDate : TDateTime;
    BirthType,
    CalveType : String;
    DryOffDate,
    PDDate : TDateTime;
    Calf1,
    Calf2,
    Calf3,
    Calf4 : String;
    IndividualCowFert : TIndividualCowFert;
    FBreedingDataHelper : TBreedingDataHelper;
    procedure BuildTempTable;
    procedure GetAnimals;
    procedure ProcessAnimals;
    function GetCalfSex(AID, LactNo : Integer; var Calv1, Calv2, Calv3, Calv4: String) : Boolean;
    function GetCalvingInfo(AID, LactNo : Integer; var CalvingDate : TDateTime; var CalveType, BirthType : String) : Boolean;
    function GetServiceInfo(AID, LactNo : Integer; var LastServe, DateDue : TDateTime;
                            var DaysFirst, DaysLast : Double; var NoServes, ServBullGestPeriod : Integer; var BullUsed : String) : Boolean;
    function GetPDInfo(AID, LactNo : Integer; var PDStatus : String; var PDDate : TDateTime) : Boolean;
    function GetDryOffInfo(AID, LactNo : Integer; var DryDate : TDateTime) : Boolean;
    procedure ResetVariables;
    procedure AssignCaps;

    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;

    { Private declarations }
  public
    { Public declarations }
  end;


  procedure ShowTheForm;

var
  fmFertAnalysisRpt: TfmFertAnalysisRpt;
  TempTable: TTable;

implementation
uses
   GenTypesConst,
   DairyData,
   KRoutines;
{$R *.DFM}
  procedure ShowTheForm; // SP JT
  begin
        try
           Application.CreateForm(TfmFertAnalysisRpt,fmFertAnalysisRpt);
           try
              TempTable := TTable.Create(nil);
              TempTable.DataBaseName := WinData.KingData.DatabaseName;
              TempTable.TableName := 'TempFertAna';

              With TempTable.FieldDefs do
                 begin
                    Add('AnimalID',ftInteger,0,False);
                    Add('AnimalNo',ftString,10,False);
                    Add('SortAnimalNo',ftString,10,False);
                    Add('LactNo',ftInteger,0,False);
                    Add('BirthDate',ftDate,0,False);
                    Add('CalfType',ftString,10,False);
                    Add('BirthType',ftString,30,False);
                    Add('DaysInMilk',ftFloat,0,False);
                    Add('NoOfServ',ftInteger,0,False);
                    Add('LastServe',ftDate,0,False);
                    Add('ServBullGestPeriod',ftInteger);
                    Add('DayFirstServ',ftFloat,0,False);
                    Add('DayLastServ',ftFloat,0,False);
                    Add('ClvToConcep',ftFloat,0,False);
                    Add('Bull',ftString,10,False);
                    Add('PregStatus',ftString,1,False);
                    Add('PDDate',ftDate,0,False);
                    Add('ProjCalvDate',ftDate,0,False);
                    Add('DryDate',ftDate,0,False);
                    Add('EBI',ftFloat,0,False);
                 end;
              TempTable.CreateTable;
              TempTable.Open;

              if not WinData.ExportToPDA then
                 fmFertAnalysisRpt.ShowModal
              else
                 fmFertAnalysisRpt.sbView.Click;
           except
              MessageDlg('Cannot create form, close program and reboot',mtError,[mbOk],0);
           end;
        finally
           with fmFertAnalysisRpt do
              begin
                 TempTable.Close;
                 TempTable.DeleteTable;
                 TempTable.Free;
                 Free;
              end;
        end;
  end;

procedure TfmFertAnalysisRpt.sbViewClick(Sender: TObject);
begin
   if ( HerdCombo.Value = '0' ) then
      begin
         MessageDlg('You must select a herd',mtError,[mbOK],0);
         Exit;
      end;
   sbView.Enabled  := False;
   sbPrint.Enabled := False;
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;
   GetAnimals;
   Application.ProcessMessages;
   AssignCaps;
   if ( WinData.ExportToPDA ) then
      begin
         WinData.PDALinkExport.ExportReport( FertRepScr );
      end
   else if ( (Sender as TRxSpeedButton).Hint = 'View' ) then
      FertRepScr.Preview
   else
      Windata.CallPrintDialog(FertRepScr);
   sbView.Enabled := True;
   sbPrint.Enabled := True;
end;


procedure TfmFertAnalysisRpt.BuildTempTable;
begin

end;

procedure TfmFertAnalysisRpt.GetAnimals;
begin
   TempQuery:= TQuery.Create(nil);
   TempQuery.DataBaseName:= WinData.KingData.DatabaseName;

   with TempQuery do
      begin
         SQL.Clear;
         SQL.Add('Delete from TempFertAna');
         ExecSQL;

         SQL.Clear;
         if  rgLact.ItemIndex = 0 then
            begin
               SQL.Add('INSERT INTO TempFertAna (AnimalID, AnimalNo, SortAnimalNo, LactNo, BirthDate )');
               SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, A.LactNo, A.DateOfBirth ');
               SQL.Add('FROM Animals A               ');

               if cbUseFilter.Checked then
                  SQL.Add(', ' + WinData.FilteredAnimals.TableName + ' FA WHERE (A.ID=FA.AID) ') // SP 25/09/2002
               else
                  SQL.Add('WHERE (A.InHerd= True) ');

               SQL.Add('AND   (A.Sex = "Female")  ');
               SQL.Add('AND   (A.Breeding = True) ');
               SQL.Add('AND   (A.AnimalDeleted = False)');
               SQL.Add('AND   (A.HerdID = ' + HerdCombo.Value + ')');
            end
         else
            begin
               SQL.Add('INSERT INTO TempFertAna (AnimalID, AnimalNo, SortAnimalNo, LactNo, BirthDate )');
               SQL.Add('Select E.AnimalID, A.AnimalNO, A.SortAnimalNo, E.AnimalLactNo, A.DateOfBirth ');
               SQL.Add(' From Events E ');
               SQL.Add('LEFT JOIN Animals A on (A.ID=E.AnimalID) ');
               if cbUseFilter.Checked then
                  SQL.Add(', ' + WinData.FilteredAnimals.TableName + ' FA WHERE (A.ID=FA.AID) ') // SP 25/09/2002
               else
                  SQL.Add('WHERE (A.InHerd= True) ');
               SQL.Add('AND   (A.Sex = "Female")  ');
               SQL.Add('AND   (A.Breeding = True) ');
               SQL.Add('AND   (A.AnimalDeleted = False)');
               SQL.Add('AND   (A.HerdID = ' + HerdCombo.Value + ')');
               SQL.Add('Group By E.AnimalID, E.AnimalLactNo, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth ');
            end;
         ExecSQL;
         TempQuery.Close;
         TempQuery.Free;
         ProcessAnimals;
      end;

   with RptQuery do
      begin
         SQL.Clear;
         if rgLact.ItemIndex = 1 then
            begin
               SQL.Add('Select AnimalID, LactNo, AnimalNo, SortAnimalNo, BirthDate, CalfType, BirthType, DaysInMilk, ');
               SQL.Add('NoOfServ, LastServe, DayfirstServ, DayLastServ, ClvToConcep, Bull, PregStatus, ProjCalvDate, DryDate, EBI');
               SQL.Add('From TempFertAna ');
            end
         else
            SQL.Add('Select * From TempFertAna ');

         case RgFilterby.ItemIndex of
            0 : begin
                   SQL.Add('Where (LactNo > 0 )');
                   if ((FromDate.Date > 0) and (ToDate.Date <= 0)) then
                      SQL.Add('AND   (BirthDate >= ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''')
                   else if ((FromDate.Date <= 0) AND (ToDate.Date > 0)) then
                      SQL.Add('AND   (BirthDate <= ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date > 0)) then
                      SQL.Add('AND   (BirthDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                   SQL.Add('AND   (LactNo >= ' + FromLact.Text + ') and (Lactno <= ' + ToLact.Text + ')');
                   lFilter.Caption := 'Calving Date';
                end;
            1  : begin
                   if ((FromDate.Date > 0) and (ToDate.Date <= 0)) then
                      SQL.Add('Where  (LastServe >= ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date <= 0)) then
                      SQL.Add('Where  (LastServe  <= ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date > 0)) then
                      SQL.Add('Where  (LastServe  BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                    SQL.Add('AND    (LactNo >= ' + FromLact.Text + ') and (Lactno <= ' + ToLact.Text + ')');
                    lFilter.Caption := 'Service Date';
                 end;
            2  : begin
                   if ((FromDate.Date > 0) and (ToDate.Date <= 0)) then
                      SQL.Add('Where  (PDDate  >= ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date <= 0)) then
                      SQL.Add('Where  (PDDate <= ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date > 0)) then
                      SQL.Add('Where  (PDDate  BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                    SQL.Add('AND    (LactNo >= ' + FromLact.Text + ') and (Lactno <= ' + ToLact.Text + ')');
                    lFilter.Caption := 'PD Date';
                 end;
            3  : begin
                   if ((FromDate.Date > 0) and (ToDate.Date <= 0)) then
                      SQL.Add('Where  (DryDate  >= ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date <= 0)) then
                      SQL.Add('Where  (DryDate <= ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''')
                   else if ((ToDate.Date > 0) and (FromDate.Date > 0)) then
                      SQL.Add('Where  (DryDate  BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                    SQL.Add('AND    (LactNo >= ' + FromLact.Text + ') and (Lactno <= ' + ToLact.Text + ')');
                    lFilter.Caption := 'Dry Off Date';
                 end;
         end;
         lFilterByDate.Caption := lFilter.Caption + ':';
         case RgSortBy.ItemIndex of
            0 : begin
                   SQL.Add('ORDER BY SortAnimalNo, LactNo');
                   lSortOption.Caption := 'Animal Number';
                end;
            1 : begin
                   SQL.Add('ORDER BY LactNo, SortAnimalNo');
                   lSortOption.Caption := 'Lactation Number';
                end;
            2 : begin
                   SQL.Add('ORDER BY BirthDate');
                   lSortOption.Caption := 'Calving / Birth Date';
                end;
            3 : begin
                   SQL.Add('ORDER BY LastServe');
                   lSortOption.Caption := 'Last Service';
                end;
            4 : begin
                   SQL.Add('ORDER BY ProjCalvDate');
                   lSortOption.Caption := 'Due Calving Date';
                end;
            5 : begin
                   SQL.Add('ORDER BY DaysInMilk');
                   lSortOption.Caption := 'Days In Milk';
                end;
            6 : begin
                   SQL.Add('ORDER BY ClvToConcep');
                   lSortOption.Caption := 'Clv To Concep.';
                end;
            7 : begin
                   SQL.Add('ORDER BY EBI');
                   lSortOption.Caption := 'EBI';
                end;
         end;

         case rgSortOrder.ItemIndex of
            0 : begin
                   SQL.Add('ASC');
                   lSortOrder.Caption := 'Ascending';
                end;
            1 : begin
                   SQL.Add('DESC');
                   lSortOrder.Caption := 'Decending';
                end;
         end;
         Open;
         //   03/06/15 [V5.4 R7.0] /MK Additional Feature - Show error message if no data to view on the report.
         if ( RecordCount = 0 ) then
            begin
               MessageDlg('No Indvidual Cow Fertility records have been found.',mtError,[mbOK],0);
               sbView.Enabled := True;
               sbPrint.Enabled := True;
               SysUtils.Abort;
            end;
      end;
end;

procedure TfmFertAnalysisRpt.ProcessAnimals;
begin
   FBreedingDataHelper.CreateTempBreedingDataTables;
   with TempTable do
      begin
         First;
         pbBar.Min := 0;
         pbBar.Max := TempTable.RecordCount;
         pbBar.Show;

         while ( not(Eof) ) do
            begin
               Edit;
               Application.ProcessMessages;
               ResetVariables;
               { Calving Information }
               if ( TempTable.FieldByName('LactNo').AsInteger > 0 ) then
                  if ( GetCalvingInfo(TempTable.FieldByName('AnimalID').AsInteger,
                                      TempTable.FieldByName('LactNo').AsInteger,
                                      LastCalvingDate,CalveType,BirthType) ) then
                     begin
                        TempTable.FieldByName('BirthDate').AsDateTime := LastCalvingDate;
                        if ( Length(BirthType) > 0 ) then
                           if ( Pos('ICBF-',BirthType) > 0 ) then
                              BirthType := Copy(BirthType,8,Length(BirthType)-7);
                        TempTable.FieldByName('BirthType').AsString := BirthType;
                     end;


                  if ( LastCalvingDate > 0 ) then
                     begin
                        Calf1 := '';
                        Calf2 := '';
                        Calf3 := '';
                        Calf4 := '';
                        if ( GetCalfSex(TempTable.FieldByName('AnimalID').AsInteger,
                                        TempTable.FieldByName('LactNo').AsInteger,
                                        Calf1,Calf2,Calf3,Calf4) ) then
                        if ( Calf2 <> '' ) then
                           Calf1 := Calf1 + ',' + Calf2;
                        if ( Calf3 <> '' ) then
                           Calf1 := Calf1 + ',' + Calf3;
                        if ( Calf4 <> '' ) then
                           Calf1 := Calf1 + ',' + Calf4;
                        TempTable.FieldByName('CalfType').AsString := Calf1;

                     end;

               { End Calving Information }

               //   06/03/13 [V5.1 R4.9] /MK Bug Fix - Moved GetServiceInfo to before GetPDInfo LastServiceDate
               //                                      was not being assiged prior to CalveToConception check.
               { Service Information }
               if ( GetServiceInfo(TempTable.FieldByName('AnimalID').AsInteger,
                                   TempTable.FieldByName('LactNo').AsInteger,
                                   LastServiceDate,ProjCalvDate,DaysFirstServe,DaysLastServe,NoServices,ServBullGestPeriod,BullUsed) ) then
                  begin
                      TempTable.FieldByName('NoOfServ').AsInteger := NoServices;
                      TempTable.FieldByName('LastServe').AsDateTime := LastServiceDate;
                      TempTable.FieldByName('DayFirstServ').AsFloat := DaysFirstServe;
                      TempTable.FieldByName('DayLastServ').AsFloat := DaysLastServe;
                      //   TempTable.FieldByName('ProjCalvDate').AsDateTime := ProjCalvDate;
                      TempTable.FieldByName('ServBullGestPeriod').AsInteger := ServBullGestPeriod;
                      TempTable.FieldByName('Bull').AsString := BullUsed;
                  end;
               { End Service Information }

               { PD Information }
               if GetPDInfo( TempTable.FieldByName('AnimalID').AsInteger,
                             TempTable.FieldByName('LactNo').AsInteger, Preg, PDDate ) then
                  begin
                     TempTable.FieldByName('PregStatus').AsString := Preg;
                     //   11/10/11 [V5.0 R1.3] /MK Bug Fix - Always include PDDate regardless of PDStatus.
                     TempTable.FieldByName('PDDate').AsDateTime := PDDate;
                     if Preg = 'Y' then
                        begin
                           { Calving to Conception }
                           if (LastCalvingDate > 0 ) AND (LastServiceDate > 0 ) then
                              TempTable.FieldByName('ClvToConcep').AsFloat := LastServiceDate - LastCalvingDate
                           else if (LastServiceDate > 0 ) AND (LastCalvingDate <= 0 ) then
                              TempTable.FieldByName('ClvToConcep').AsFloat := LastServiceDate - TempTable.FieldByName('BirthDate').AsDateTime
                           else
                              TempTable.FieldByName('ClvToConcep').AsFloat := 0;
                        end;
                  end;
               { End PD Information }

               { Assign ProjCalvDate From PDProjDate if PDProjDate > ServProjDate }
               if PDProjDate > ServProjDate then
                  TempTable.FieldByName('ProjCalvDate').AsDateTime := PDProjDate
               else
                  TempTable.FieldByName('ProjCalvDate').AsDateTime := ServProjDate;

               if TempTable.FieldByName('LactNo').AsInteger > 0 then
                  begin
                     if GetDryOffInfo( TempTable.FieldByName('AnimalID').AsInteger,
                                       TempTable.FieldByName('LactNo').AsInteger,
                                       DryOffDate) then
                        if DryOffDate > 0 then
                           begin
                              TempTable.FieldByName('DryDate').AsDateTime := DryOffDate;
                              if LastCalvingDate > 0 then
                                 TempTable.FieldByName('DaysInMilk').AsFloat := DryOffDate - LastCalvingDate;
                           end
                        else
                           begin
                              if LastCalvingDate > 0 then
                                 TempTable.FieldByName('DaysInMilk').AsFloat := Date - LastCalvingDate
                              else
                                 TempTable.FieldByName('DaysInMilk').AsFloat := Date - TempTable.FieldByName('BirthDate').AsFloat;
                           end;
                  end
               else
                  begin


                  end;

               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add('SELECT EBI');
                     SQL.Add('FROM CowExt');
                     SQL.Add('WHERE AnimalID = :AID');
                     Params[0].AsInteger := TempTable.FieldByName('AnimalID').AsInteger;
                     try
                        Open;
                        if ( RecordCount > 0 ) then
                           TempTable.FieldByName('EBI').AsFloat := FieldByName('EBI').AsFloat;
                     except
                        on e : Exception do
                           ShowDebugMessage(e.Message);
                     end;
                  finally
                     Free;
                  end;

               Post;
               Next;
               pbBar.Position := TempTable.RecNo;
            end;
      end;

   pbBar.Position := 0;
   pbBar.Hide;

end;

function TfmFertAnalysisRpt.GetCalvingInfo(AID, LactNo : Integer;
                                           var CalvingDate : TDateTime;
                                           var CalveType, BirthType : String) : Boolean;
var
   BT,
   EventID : Integer;
begin
   // Get the Calving Record
   //WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CCalvingEvent) + ')';
   //WinData.CheckEvents.Filtered := True;
   FBreedingDataHelper.TempCalvings.Filtered := False;
   FBreedingDataHelper.TempCalvings.Filter := '';
   FBreedingDataHelper.TempCalvings.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ')';
   FBreedingDataHelper.TempCalvings.Filtered := True;

   //if WinData.CheckEvents.FindLast then
   if ( FBreedingDataHelper.TempCalvings.FindLast ) then
      begin
         //CalvingDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
         CalvingDate := FBreedingDataHelper.TempCalvings.FieldByName('EventDate').AsDateTime;
         //EventID := WinData.CheckEvents.FieldByName('ID').AsInteger;
         EventID := FBreedingDataHelper.TempCalvings.FieldByName('EventID').AsInteger;

         if (EventID > 0) then
            begin
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add('SELECT BirthType From Calvings Where EventID=:EventID');
                     Params[0].AsInteger := EventID;
                     Open;
                     try
                        First;
                        BT := Fields[0].AsInteger;
                     finally
                        Close;
                     end;
                  finally
                     Free;
                  end;
               if ( BT > 0 ) then
                  begin
                     if WinData.GenLookUp.Locate('ID', BT, []) then
                        BirthType := WinData.GenLookUp.FieldByName('Description').AsString;
                  end;
            end;

         Result := True;
      end;
   // Clear the Filter
   //WinData.CheckEvents.Filter := '';
   //WinData.CheckEvents.Filtered := False;
   FBreedingDataHelper.TempCalvings.Filtered := False;
   FBreedingDataHelper.TempCalvings.Filter := '';
end;

function TfmFertAnalysisRpt.GetServiceInfo(AID, LactNo : Integer; var LastServe, DateDue : TDateTime;
                            var DaysFirst, DaysLast : Double; var NoServes, ServBullGestPeriod : Integer; var BullUsed : String) : Boolean;
var
   EventID,
   ServiceBull,
   iServBullGestPeriod : Integer;
   ServiceBullCode : String;
   TestDate   : TDateTime;

   function GetServiceBull_WithEventID_BySQL ( AEventID : Integer ) : Integer;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT S.ServiceBull, A.AnimalNo');
            SQL.Add('FROM Services S');
            SQL.Add('LEFT JOIN Animals A ON (A.ID = S.ServiceBull)');
            SQL.Add('WHERE EventID = '+IntToStr(AEventID)+'');
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               Result := Fields[0].AsInteger;
               if ( Length(Fields[1].AsString) > 0 ) then
                  ServiceBullCode := Fields[1].AsString;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   // Get the Last Service Record
   //WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
   //WinData.CheckEvents.Filtered := True;
   FBreedingDataHelper.TempServices.Filtered := False;
   FBreedingDataHelper.TempServices.Filter := '';
   FBreedingDataHelper.TempServices.Filtered := True;
   FBreedingDataHelper.TempServices.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ')';

   //NoServes := WinData.CheckEvents.RecordCount;
   NoServes := FBreedingDataHelper.TempServices.RecordCount;

   //if WinData.CheckEvents.FindFirst then
   if ( FBreedingDataHelper.TempServices.FindFirst ) then
      begin
         if ( LastCalvingDate > 0 ) then
            //DaysFirst := WinData.CheckEvents.FieldByName('EventDate').AsDateTime - LastCalvingDate
            DaysFirst := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime - LastCalvingDate
         else
            DaysFirst := 0;
         Result := True;

         //if WinData.CheckEvents.FindLast then
         if ( FBreedingDataHelper.TempServices.FindLast ) then
            begin
               //LastServe := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               LastServe := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
               //DaysLast := Date - WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               DaysLast := ( Date - FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime );
               //EventID := WinData.CheckEvents.FieldByName('ID').AsInteger;
               EventID := FBreedingDataHelper.TempServices.FieldByName('EventID').AsInteger;
            end;

         ServiceBull := 0;
         ServiceBullCode := '';
         if ( EventID > 0 ) then
            ServiceBull := GetServiceBull_WithEventID_BySQL(EventID);
            //if WinData.LookUpServices.Locate('EventID', EventID, []) then
            if ( ServiceBull > 0 ) then
               begin
                  iServBullGestPeriod := FBreedingDataHelper.GetGestation ( ServiceBull );
                  //TestDate   := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                  TestDate   := FBreedingDataHelper.TempServices.FieldByName('EventDate').AsDateTime;
                  TestDate   := ( TestDate + iServBullGestPeriod );
                  ServProjDate := TestDate;
                  {
                  if WinData.LookUpDamSire.Locate('ID', WinData.LookUpServices.FieldByName('ServiceBull').AsInteger, []) then
                     if Length(WinData.LookUpDamSire.FieldByName('AnimalNo').AsString) > 0 then
                        BullUsed := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString
                     else
                        BullUsed := '';
                  }
                  BullUsed := ServiceBullCode;
               end;
      end;
   // Clear the Filter
   //WinData.CheckEvents.Filter := '';
   FBreedingDataHelper.TempServices.Filter := '';
   //WinData.CheckEvents.Filtered := False;
   FBreedingDataHelper.TempServices.Filtered := False;
end;

function TfmFertAnalysisRpt.GetPDInfo(AID, LactNo: Integer;
  var PDStatus : String; var PDDate : TDateTime): Boolean;
var
   EventID : Integer;
   Gestation : Double;
   NoDaysPreg : Double;
begin
   EventID := 0;
   // Get the Preg Diag Record
   //WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
   //WinData.CheckEvents.Filtered := True;
   FBreedingDataHelper.TempPregDiag.Filter := '';
   FBreedingDataHelper.TempPregDiag.Filtered := False;
   FBreedingDataHelper.TempPregDiag.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ')';
   FBreedingDataHelper.TempPregDiag.Filtered := True;

   //if ( WinData.CheckEvents.FindLast ) then
   if ( FBreedingDataHelper.TempPregDiag.FindLast ) then
      begin
//         if WinData.CheckEvents.FieldByName('PDDate').AsDateTime > LastServiceDate then
         //if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > LastServiceDate then
         if ( FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime > LastServiceDate ) then
            begin
               //EventID := WinData.CheckEvents.FieldByName('ID').AsInteger;
               EventID := FBreedingDataHelper.TempPregDiag.FieldByName('EventID').AsInteger;
               //PDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               PDDate := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
            end
         else
            begin
               PDStatus := 'U';
               Result := True;
            end;
      end;

   if ( EventID > 0 ) then
      begin
          with TQuery.Create(nil) do
             try
                DatabaseName := AliasName;
                SQL.Clear;
                SQL.Add('SELECT PregnancyStatus, DaysInCalf');
                SQL.Add('FROM PregnancyDiag');
                SQL.Add('WHERE EventID = '+IntToStr(EventID)+'');
                try
                   Open;
                   if ( RecordCount > 0 ) then
                      begin
                         if ( Fields[0].AsBoolean ) then
                            begin
                               PDStatus := 'Y';
                               if ( ServBullGestPeriod > 0 ) then
                                  Gestation := ServBullGestPeriod
                               else
                                  Gestation := 283;
                               PDDate := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
                               NoDaysPreg := Fields[1].AsInteger;
                               if ( NoDaysPreg > 0 ) then
                                  begin
                                     if ( NoDaysPreg >= 0 ) and
                                        ( NoDaysPreg <= Gestation ) then
                                          PDProjDate := PDDate + (Gestation-NoDaysPreg) // Projected Date
                                     else
                                        PDProjDate := PDDate + Gestation; // Projected Date
                                  end;
                            end
                         else
                            PDStatus := 'N';
                      end;
                except
                   on e : Exception do
                      ShowMessage(e.Message);
                end;
             finally
                Free;
             end;
         {
         if WinData.LookUpPDs.Locate('EventID', EventID, []) then
            if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
               begin
                  PDStatus := 'Y';
                  Gestation := 283;
                  //PDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                  PDDate := FBreedingDataHelper.TempPregDiag.FieldByName('EventDate').AsDateTime;
                  NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                  if NoDaysPreg > 0 then
                     begin
                        if ( NoDaysPreg >= 0 ) And
                           ( NoDaysPreg <= 283 ) then
                             PDProjDate := PDDate + (Gestation-NoDaysPreg) // Projected Date
                        else
                           PDProjDate := PDDate + Gestation; // Projected Date
                     end;
               end
            else
               PDStatus := 'N';
         }
         Result := True;
      end;

   // Clear the Filter
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;
end;

function TfmFertAnalysisRpt.GetDryOffInfo(AID, LactNo: Integer;
  var DryDate: TDateTime): Boolean;
var
   EventID : Integer;
begin
   // Get the DryOff Record
   //WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CDryOffEvent) + ')';
   //WinData.CheckEvents.Filtered := True;
   FBreedingDataHelper.TempDryingOffs.Filter := '';
   FBreedingDataHelper.TempDryingOffs.Filtered := False;
   FBreedingDataHelper.TempDryingOffs.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ')';
   FBreedingDataHelper.TempDryingOffs.Filtered := True;

   //if WinData.CheckEvents.FindLast then
   if ( FBreedingDataHelper.TempDryingOffs.FindLast ) then
      //DryDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
      DryDate := FBreedingDataHelper.TempDryingOffs.FieldByName('EventDate').AsDateTime
   else
      DryDate := 0;
   Result := True;

   // Clear the Filter
   //WinData.CheckEvents.Filter := '';
   //WinData.CheckEvents.Filtered := False;
   FBreedingDataHelper.TempDryingOffs.Filter := '';
   FBreedingDataHelper.TempDryingOffs.Filtered := False;
end;

procedure TfmFertAnalysisRpt.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmFertAnalysisRpt.FormShow(Sender: TObject);
begin
   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   FertRepScr.Hide;
   pbBar.Hide;
   FromDate.Date := IncMonth(Date,-12);
   ToDate.Date :=(Date);

   //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cIndCowFertRep);
   WinData.UpdateRecentReportUsage(cIndCowFertRep);
   if ( WinData.FBreedingDataHelper <> nil ) then
      FreeAndNil(WinData.FBreedingDataHelper);
end;

procedure TfmFertAnalysisRpt.ResetVariables;
begin
    LastServiceDate := 0;
    ProjCalvDate := 0;
    DaysFirstServe := 0;
    DaysLastServe := 0;
    NoServices := 0;
    ServBullGestPeriod := 0;
    BullUsed := '';
    Preg :='';
    DaysCalveToPD := 0;
    LastCalvingDate := 0;
    BirthType :='';
    CalveType :='';
    DryOffDate:= 0;
    PDDate := 0;
    PDProjDate := 0;
    ServProjDate := 0;
end;

procedure TfmFertAnalysisRpt.RgFilterbyClick(Sender: TObject);
begin
   case RgFilterby.ItemIndex of
      0 :lFilterby.Caption := 'Calving Date:';
      1 :lFilterby.Caption := 'Service Date:';
      2 :lFilterby.Caption := 'PD Date:';
      3 :lFilterby.Caption := 'Dry Off Date:';
   end;
end;

function TfmFertAnalysisRpt.GetCalfSex(AID, LactNo: Integer; var Calv1,
  Calv2, Calv3, Calv4: String): Boolean;
begin
   with RptQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT A1.Sex A1Sex, A2.Sex A2Sex, A3.Sex A3Sex, A4.Sex A4Sex,');
         //   03/06/15 [V5.4 R7.0] /MK Bug Fix - Use Calvings.DeadCalf1-4 instead of Animals.InHerd boolean when showing dead calves lower case calf sex.
         SQL.Add('       C.CalfDead1 CalfDead1, C.CalfDead2 CalfDead2, C.CalfDead3 CalfDead3, C.CalfDead4 CalfDead4');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Calvings C ON (E.ID=C.EventID)');
         SQL.Add('LEFT JOIN Animals A1 ON (C.ID1=A1.ID)');
         SQL.Add('LEFT JOIN Animals A2 ON (C.ID2=A2.ID)');
         SQL.Add('LEFT JOIN Animals A3 ON (C.ID3=A3.ID)');
         SQL.Add('LEFT JOIN Animals A4 ON (C.ID4=A4.ID)');
         SQL.Add('WHERE (E.AnimalID='+IntToStr(AID)+')');
         SQL.Add('AND   (E.AnimalLactNo = '+IntToStr(LactNo)+')');
         SQL.Add('AND   (E.EventType = '+IntToStr(cCalvingEvent)+')');
         Open;

         if ( RecordCount > 0 ) then
            begin
               if ( Length(FieldbyName('A1Sex').AsString) > 0 ) then
                  if ( FieldbyName('A1Sex').AsString <> 'Female' ) then
                     begin
                        if ( FieldByName('CalfDead1').AsBoolean ) then
                           Calv1 := 'm'
                        else
                           Calv1 := 'M';
                     end
                  else
                     begin
                        if ( FieldByName('CalfDead1').AsBoolean ) then
                           Calv1 := 'f'
                        else
                           Calv1 := 'F';
                     end;

               //   03/06/15 [V5.4 R7.0] /MK Bug Fix - Program was incorrectly assigning Calv1 instead of Calv2.
               if ( Length(FieldbyName('A2Sex').AsString) > 0 ) then
                  if ( FieldbyName('A2Sex').AsString <> 'Female' ) then
                     begin
                        if ( FieldByName('CalfDead2').AsBoolean ) then
                           Calv2 := 'm'
                        else
                           Calv2 := 'M';
                     end
                  else
                     begin
                        if ( FieldByName('CalfDead2').AsBoolean ) then
                           Calv2 := 'f'
                        else
                           Calv2 := 'F';
                     end;

               //   03/06/15 [V5.4 R7.0] /MK Bug Fix - Program was incorrectly assigning Calv1 instead of Calv3.
               if ( Length(FieldbyName('A3Sex').AsString) > 0 ) then
                  if ( FieldByName('A3Sex').AsString <> 'Female' ) then
                     begin
                        if ( FieldByName('CalfDead3').AsBoolean ) then
                           Calv3 := 'm'
                        else
                           Calv3 := 'M';
                     end
                  else
                     begin
                        if ( FieldByName('CalfDead3').AsBoolean ) then
                           Calv3 := 'f'
                        else
                           Calv3 := 'F';
                     end;

               //   03/06/15 [V5.4 R7.0] /MK Bug Fix - Program was incorrectly assigning Calv1 instead of Calv4.
               if ( Length(FieldbyName('A4Sex').AsString) > 0 ) then
                  if ( FieldByName('A4Sex').AsString <> 'Female' ) then
                     begin
                        if FieldByName('CalfDead4').AsBoolean then
                           Calv4 := 'm'
                        else
                           Calv4 := 'M';
                     end
                  else
                     begin
                        if ( FieldByName('CalfDead4').AsBoolean ) then
                           Calv4 := 'f'
                        else
                           Calv4 := 'F';
                     end;
               Result := True;
            end;
      end;
end;

procedure TfmFertAnalysisRpt.AssignCaps;
begin
   lHerdID.Caption := HerdCombo.Text;
   VerLabel.Caption := 'Herd Management ' + HerdVerNo;
   lFromDate.Caption := FromDate.Text;
   lToDate.Caption := ToDate.Text;
   lFromLactNo.Caption := FromLact.Text;
   lToLactNo.Caption := ToLact.Text;
end;

procedure TfmFertAnalysisRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   RptQuery.Close;
end;

procedure TfmFertAnalysisRpt.FormCreate(Sender: TObject);
begin
   FBreedingDataHelper := TBreedingDataHelper.Create();
   WinData.CanShowStandardReportHint := True;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph, cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph, cBtnImgHelp);
   try
      HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   except
   end;
   cbUseFilter.Checked := WinData.ActiveFilter;
//   if cbUseFilter.Visible then
//      cbUseFilter.Checked := True;
   LoadScreenDefaults;
end;

procedure TfmFertAnalysisRpt.cbUseFilterClick(Sender: TObject);
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

procedure TfmFertAnalysisRpt.rgLactClick(Sender: TObject);
begin
  if rgLact.ItemIndex = 1 then
     begin
        if ToDate.Date > 0 then
           FromDate.Date := IncMonth(ToDate.Date, -240);
     end
  else
     begin
        if ToDate.Date > 0 then
           FromDate.Date := IncMonth(ToDate.Date, -12);
     end;
end;

procedure TfmFertAnalysisRpt.LoadScreenDefaults;
var
   LR : TIntRange;
begin
   IndividualCowFert := TIndividualCowFert.Create(cRD_IndividualCowFert);
   try
      rgLact.ItemIndex := IndividualCowFert.LactationType;
      RgFilterby.ItemIndex := IndividualCowFert.ReportOn;
      ToDate.Date := Date;
      if IndividualCowFert.DateInterval > 0 then
         FromDate.Date := Trunc( ToDate.Date - IndividualCowFert.DateInterval );
      LR := IndividualCowFert.LactRange;
      FromLact.AsInteger := LR.IntFrom;
      ToLact.AsInteger := LR.IntTo;

      //   28/10/11 [V5.0 R1.7] /MK Bug Fix - If TIndividualCowFert LactRange ToLact Result = 0 Then ToLact := 30.
      if ( ToLact.AsInteger = 0 ) then
         ToLact.Value := 30;

      RgSortBy.ItemIndex := IndividualCowFert.SortField;
      rgSortOrder.ItemIndex := IndividualCowFert.SortOrder;
   finally
      FreeAndNil( IndividualCowFert );
   end;
end;

procedure TfmFertAnalysisRpt.SaveScreenDefaults;
var
   LR : TIntRange;
begin
   IndividualCowFert := TIndividualCowFert.Create(cRD_IndividualCowFert);
   try
      IndividualCowFert.LactationType := rgLact.ItemIndex;
      IndividualCowFert.ReportOn := RgFilterby.ItemIndex;
      if (FromDate.Date > 0) and (ToDate.Date > 0) then
         IndividualCowFert.DateInterval := Trunc(ToDate.Date - FromDate.Date);
      LR.IntFrom := FromLact.AsInteger;
      LR.IntTo := ToLact.AsInteger;
      IndividualCowFert.LactRange := LR;
      IndividualCowFert.SortField := RgSortBy.ItemIndex;
      IndividualCowFert.SortOrder := rgSortOrder.ItemIndex;
   finally
      FreeAndNil( IndividualCowFert );
   end;
end;

procedure TfmFertAnalysisRpt.FormDestroy(Sender: TObject);
begin
   if ( FBreedingDataHelper <> nil ) then
      FreeAndNil(FBreedingDataHelper);
   SaveScreenDefaults;
end;

procedure TfmFertAnalysisRpt.FormActivate(Sender: TObject);
var
  pt : TPoint;
begin
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

procedure TfmFertAnalysisRpt.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfmFertAnalysisRpt.QRDBText12Print(sender: TObject;
  var Value: String);
begin
   if ( Value = '30/12/1899' ) or ( Value = '30/12/99' ) then
      Value := '';
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmFertAnalysisRpt.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cIndCowFertRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cIndCowFertRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.


