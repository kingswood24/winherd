unit ActionReminderFilt;

{
  ----------------------------------------------------------------------------
  31/01/2003:-

  Due to Calve Project Due to calve date based on the number of days pregnant.

  31/01/2003.
  ----------------------------------------------------------------------------
  SP 23/03/2003:- V3.6 R5.5

  Due to Calve, Option "Restrict calvings to period between"

  Either Bewteen a given period or up until a given date

  SP 23/03/2003:- V3.6 R5.5
  ----------------------------------------------------------------------------
  06/01/2009 [Rel V3.9 R4.8, Dev V3.9 R5.6] /SP Bug Fix - Inclusion of "OR PD = Twins" in Due To Dry Off Report, If the animal is expecting
                                                          twins, if was being ignored by the qDueForDryingOff SQL Text. SQL Text only including
                                                          PD="Yes" or PD="Undefined" qDueForDryingOff.SQL.Add('And ((PD = "Yes") Or (PD = "Twins") Or (PD = "UnDefined")');


  22/01/2009 [Dev V3.9 R5.8] /MK Additional Feature - Option to include Nat Id. No . in the DueToCalve Rpt.
                                                      Change made to TempTable to Change NatID to a ShortNatID to allow for the NatID to appear in the
                                                      Status Field of the DuetoCalve Report. This change will bring in the last 5 digits plus the space
                                                      of an Irish Tag Number and the last 6 digits without spaces of a Northern Irish Tag Number

  03/03/2009 [Dev V3.9 R6.5] /SP Program Change - Do not check if animal is served before checking if animal is pregnant SP/GL

  14/04/2009 [Dev V3.9 R6.7] /MK Additional Feature - Change made to report to allow for both the Due Dry Off Date for the Service and the
                                                      PD to show on the report if the Include Service AND PD Projected Dates tick box is ticked.

  28/09/10 [V4.0 R4.8] /MK Change - Allowed ShortNatIDNum to take account of UK Tags.
                                  - Allowed for Irish Old Brass Tags and Old Plastic Tags.

  ----------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, ToolEdit, RXSpin, RXLookup,
  quickrpt, Db, DBTables, Qrctrls, RXCtrls, ToolWin, Menus, QRExport,
  GenTypesConst, ReportDefaults, KDBRoutines;

type
  TReportMode = (rmProAction, rmPDAExport, rmNormal);
  TActionReminderFilter = class(TForm)
    pDueToCalve: TPanel;
    pDueForDryingOff: TPanel;
    pDueFirstService: TPanel;
    IncCows: TCheckBox;
    IncHeifers: TCheckBox;
    Label3: TLabel;
    OlderCows: TCheckBox;
    FirstLactCows: TCheckBox;
    ldaysFirstService: TLabel;
    lperiod: TLabel;
    Label4: TLabel;
    DryingDoubleSpace: TCheckBox;
    DryingBlank: TCheckBox;
    DoubleSpace: TCheckBox;
    CalveBlank: TCheckBox;
    CalveSort: TCheckBox;
    SortDryOffDate: TCheckBox;
    ToServiceDate: TDateEdit;
    DryingDate: TDateEdit;
    CalveDateFrom: TDateEdit;
    DaysforDryingOff: TRxSpinEdit;
    DaysFirstService: TRxSpinEdit;
    pbCount: TProgressBar;
    PdScr: TQuickRep;
    qReportPD: TQuery;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    DateLabel: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    PremRepFirstPrem: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel34: TQRLabel;
    VerLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    pDueToPD: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    cbIncCows: TCheckBox;
    cbIncCowsNot: TCheckBox;
    CheckBox4: TCheckBox;
    PDDate: TDateEdit;
    PDSince: TRxSpinEdit;
    RadioGroup1: TRadioGroup;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    cbIncHeifers: TCheckBox;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    rgOrder: TRadioGroup;
    rgSort: TRadioGroup;
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    ToolButton2: TToolButton;
    cbIncludeNOTPD: TCheckBox;
    gbfilter: TGroupBox;
    FirstServeIncCows: TCheckBox;
    FirstServeIncHeifers: TCheckBox;
    cbExtended: TCheckBox;
    lTo: TLabel;
    From: TLabel;
    ExcludeOver: TCheckBox;
    gbInclude: TGroupBox;
    cbNoheatsServices: TCheckBox;
    cbReHeatsNotServed: TCheckBox;
    cbRepeatService: TCheckBox;
    FromServiceDate: TDateEdit;
    GroupBox1: TGroupBox;
    ServiceSort: TCheckBox;
    CalvingSort: TCheckBox;
    cbIncludeNotPreg: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    sbPrint: TRxSpeedButton;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    AnimalNo: TCheckBox;
    lCalveDateTo: TLabel;
    CalveDateTo: TDateEdit;
    cbPeriodBetween: TCheckBox;
    lCalveDateFrom: TLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    rgSortBy: TRadioGroup;
    cbIncludenotServed: TCheckBox;
    seDaysAfterCalving: TRxSpinEdit;
    lDaysAfterCalving: TLabel;
    cbShowNatID: TCheckBox;
    cbIncludeServAndPD: TCheckBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToServiceDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure ServiceBlankClick(Sender: TObject);
    procedure CalveDateFromAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure DryingDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ToServiceDateExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FromServiceDateAcceptDate(Sender: TObject;
      var ADate: TDateTime; var Action: Boolean);
    procedure FromServiceDateExit(Sender: TObject);
    procedure FirstServeIncHeifersClick(Sender: TObject);
    procedure FirstServeIncCowsClick(Sender: TObject);
    procedure ServiceSortClick(Sender: TObject);
    procedure CalvingSortClick(Sender: TObject);
    procedure PDDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure AnimalNoClick(Sender: TObject);
    procedure cbPeriodBetweenClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbIncludenotServedClick(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
  private
    { Private declarations }
    DueServiceDefaults : TDueServiceDefaults;
    DuePregDiagDefaults : TDuePregDiagDefaults;
    DueDryOffDefaults : TDueDryOffDefaults;
    DueCalvingDefaults : TDueCalvingDefaults;
    ARReportType : TActionReminderReport;
    procedure BuildDueToCalve;
    procedure BuildDueToDryOff;
    procedure BuildDueFirstService;
    procedure CalcServiceDate;
    procedure ServiceDue;
    procedure BuildDueToPD;

    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
  public
    { Public declarations }
//    procedure DataFormCheck;

     RunWithProgressOnly : Boolean;
  ShowDate,
  IsPregYesNo,
  IsPreg : String;
  NumCalves : Integer;
  TempTable : TTable;
  HasHeat,
  HasCalvingEvent,
  IsServed,
  IsPregnant,
  IsDry     : Boolean;
  CutOffDate,
  TestDate,
  PriorServeDate,
  PriorBullingDate  : TDateTime;
  end;

  procedure RunReport( ReportMode : TReportMode; ActionReminderReports : TActionReminderReports);

const

   DuePD_DaysSinceCalvingToday = 50;


var
  ActionReminderFilter: TActionReminderFilter;

implementation
uses
    DueToCalve,
    DueForDryingOff,
    DairyData,
    DueFirstService,
    uProgressIndicator,
    MenuUnit, kRoutines, uHerdLookup;

const
   Cycle21  = 21;
   Cycle24  = 24;
   Cycle42  = 42;

   Cycle    = Cycle21;
   XTARGET  = 730;
   BULLGEST = 283;

{$R *.DFM}

  procedure RunReport( ReportMode : TReportMode; ActionReminderReports : TActionReminderReports);

    procedure PreviewReport(VisiblePanel : TPanel);
    begin
       ActionReminderFilter.pDueForDryingOff.Hide;
       ActionReminderFilter.pDueToCalve.Hide;
       ActionReminderFilter.pDueToPD.Hide;
       ActionReminderFilter.pDueFirstService.Hide;

       VisiblePanel.Show;
       Screen.Cursor := crDefault;
       try
          ActionReminderFilter.sbView.click;
       finally
          Screen.Cursor := crHourGlass;
       end;
    end;

  begin
     Screen.Cursor := crHourGlass;

     if ReportMode = rmProAction then
        if (ActionList = nil) then raise Exception.Create('Object().ActionList. An unexpected error has occurred - aborting');

     ActionReminderFilter := TActionReminderFilter.Create(nil);
     try
        ActionReminderFilter.RunWithProgressOnly := ReportMode = rmProAction;

        ActionReminderFilter.FormShow(nil);

        if ( arDueService in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.ToServiceDate.Date := ActionList.ServiceEndDate;
              PreviewReport(ActionReminderFilter.pDueFirstService);
           end;

        if ReportMode = rmProAction then
           Sleep(1500);

        if ( arDuePD in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.PDDate.Date := ActionList.PregDiagEndDate;
              PreviewReport(ActionReminderFilter.pDueToPD);
           end;

        if ReportMode = rmProAction then
           Sleep(1500);

        if ( arDueDryOff in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.DryingDate.Date := ActionList.DryOffEndDate;
              PreviewReport(ActionReminderFilter.pDueForDryingOff);
           end;

        if ReportMode = rmProAction then
           Sleep(1500);

        if ( arDueCalve in ActionReminderReports ) then
           begin
              if ReportMode = rmProAction then
                 ActionReminderFilter.CalveDateFrom.Date := ActionList.CalveEndDate;
              PreviewReport(ActionReminderFilter.pDueToCalve);
           end;
     finally
       ActionReminderFilter.Free;
       Screen.Cursor := crDefault;
     end;
  end;

procedure TActionReminderFilter.ExitBtnClick(Sender: TObject);
var Key: Word;
begin
     Close;
end;

procedure TActionReminderFilter.BuildDueToPD;
Var
   NoDaysPreg: Integer;
   IncludeAnimal,
   UsedPD    : Boolean;
   PDProjDate,
   TestDate,
   LastServiceDate,
   LastPDDate  : TDateTime;
   LastCalvingDate : TDateTime;
   DaysSinceLastCalving : Integer;

begin
    {
    Build the Due To Calve Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }

    if RunWithProgressOnly then
       begin
          ShowProgressIndicator('Compiling Due PD Report, please wait...', 0,0,1);
       end;

       VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
       With WinData.TempTable Do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueToPD';

              FieldDefs.Clear;
              // Alter these field to report heading FK
              FieldDefs.Add('AnimalID',ftInteger,0,True);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False);
              FieldDefs.Add('LastCalvingDate',ftDate,0,False);
              FieldDefs.Add('Served',ftInteger,0,False); // Served No.
              FieldDefs.Add('PD',ftString,10,False);
              FieldDefs.Add('LastServiceDate',ftDate,0,False);
              FieldDefs.Add('DaysSince',ftFloat,0,False); // Days Since on Rpt
              FieldDefs.Add('LastBull',ftString,10,False);
              FieldDefs.Add('PlanBull',ftString,10,False);
              FieldDefs.Add('DuePDDate',ftDateTime,0,False);
              FieldDefs.Add('ServiceType',ftString,10,False); { SP 27/11/2002 }
              FieldDefs.Add('DaysAfterLastCalving',ftInteger);

              IndexDefs.Clear;
              CreateTable;
              Open;

              // You'll need to add another TReport
              with qReportPD do
                 begin
                    SQL.Clear;
                    // Get all possible animals
                    SQL.Add('SELECT DISTINCT ID, LactNo, AnimalNo, SortAnimalNo From');
                    SQL.Add('"Animals.db" A, "Events" E');
                    SQL.Add('Where (A.Sex="Female")');
                    SQL.Add('AND (A.Inherd = TRUE)');
                    SQL.Add('AND (A.ID = E.AnimalId)');
                    SQL.Add('AND (A.Breeding=TRUE)');
                    SQL.Add('AND (A.AnimalDeleted = FALSE)');
                    if not cbIncludenotServed.Checked then
                       begin
                          { animal must have service recorded }
                          SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                          SQL.Add('AND (E.EventType = ' + IntToStr(CServiceEvent) + ')'); // Service
                       end;
                    SQL.Add('AND ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                    if Length(cbDefaultHerd.Value) > 0 then
                       if cbDefaultHerd.Value <> '0' then
                          SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');

                    // Store Animals with PD record for the Current Lactation in the TEMP Table
                    Open;
                    First;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := RecordCount
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := RecordCount;
                       end;
                    while NOT EOF do
                       begin
                          DaysSinceLastCalving := 0;
                          IncludeAnimal := TRUE;
                          WinData.TempTable.Insert;
                          WinData.TempTable.FieldByName('AnimalId').AsInteger := FieldByName('ID').AsInteger;
                          WinData.TempTable.FieldByName('AnimalLactNo').AsInteger := FieldByName('LactNo').AsInteger;
                          WinData.TempTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;

                          WinData.TempTable.FieldByName('SortAnimalNo').AsString := FieldByName('SortAnimalNo').AsString;

                          NoDaysPreg := 0;
                          UsedPD := FALSE;
                          // Check the PD Scan Against the Date today if it's more than 10 days display Message
                          if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                                  VarArrayOf([FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger,CPregDiagEvent]),[] ) then
                             begin
                                // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
                                if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                   if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                                      begin
                                         //WinData.TempTable.FieldByName('PD').AsString := 'Yes';
                                         UsedPD := TRUE;
                                         IncludeAnimal := False;
                                      end
                                   else if ( WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean = FALSE ) then
                                      begin
                                         //WinData.TempTable.FieldByName('PD').AsString := 'No';
                                         IncludeAnimal := True;
                                      end;
                             end;

                          WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime :=
                                  WinData.EventDataHelper.GetLastEventDate(FieldByName('Id').AsInteger, FieldByName('LactNo').AsInteger, cCalvingEvent);

                          // Get the Last Service Record
                          WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                          WinData.CheckEvents.Filtered := True;
                          if WinData.CheckEvents.FindLast then
                             begin
                                WinData.TempTable.FieldByName('LastServiceDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                WinData.TempTable.FieldByName('Served').AsInteger := WinData.CheckEvents.RecordCount;
                                WinData.TempTable.FieldByName('DaysSince').AsFloat := ( PDDate.date - WinData.TempTable.FieldByName('LastServiceDate').AsDateTime );
                                WinData.TempTable.FieldByName('DuePDDate').AsDateTime := (WinData.TempTable.FieldByName('LastServiceDate').AsDateTime + PDSince.Value);
                                // Check the Calving Record for the Bull used in last service

                                if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                         WinData.TempTable.FieldByName('LastBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                      if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[] ) then
                                         WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                   end;

                             end
                          else if ( cbIncludenotServed.Checked ) then // if not Serviced then check no. of days since last calving.
                             begin
                                { Animal has no service record, get number of days since last calving }
                                if ( WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime > 0 ) and
                                      ( WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime < Date ) then
                                   begin
                                      WinData.TempTable.FieldByName('DaysAfterLastCalving').AsInteger :=
                                          Trunc( Date - WinData.TempTable.FieldByName('LastCalvingDate').AsDateTime );
                                      if ( WinData.TempTable.FieldByName('DaysAfterLastCalving').AsInteger > 0 ) then
                                         begin
                                            // Include animals not served more than X days.
                                            // X = FieldByName('DaysAfterLastCalving').AsInteger - seDaysAfterCalving.AsInteger
                                            IncludeAnimal := ( WinData.TempTable.FieldByName('DaysAfterLastCalving').AsInteger > seDaysAfterCalving.AsInteger );
                                            if ( IncludeAnimal ) then // set the pd value to "Undefinded"
                                               WinData.TempTable.FieldByName('pd').AsString := 'Undefined';
                                         end;
                                   end;
                             end;

                          // Clear the Filter
                          WinData.CheckEvents.Filter := '';
                          WinData.CheckEvents.Filtered := False;

                          if WinData.GetProjCalving(WinData.TempTable.FieldByName('AnimalId').AsInteger,
                                                    WinData.TempTable.FieldByName('AnimalLactNo').AsInteger, NumCalves, IsPreg ) > 0 then
                             begin
                                if NumCalves = 1 then
                                  WinData.TempTable.FieldByName('PD').AsString := IsPreg
                                else if NumCalves > 1 then
                                  // set caption to Twins, irrespectful of NumCalves count. ignoring fact might be triplets or other
                                  WinData.TempTable.FieldByName('PD').AsString := 'Twins';
                             end;

                          // Clear the Filter
                          WinData.CheckEvents.Filter := '';
                          WinData.CheckEvents.Filtered := False;

                          WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CBullingEvent) + ')';
                          WinData.CheckEvents.Filtered := True;
                          if WinData.CheckEvents.FindLast then
                             begin
                                if WinData.LookUpBullings.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpDamSire.Locate('ID',WinData.LookUpBullings.FieldByName('PlannedBull').AsString,[] ) then
                                         WinData.TempTable.FieldByName('PlanBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                   end;
                             end;
                          // Clear the Filter
                          WinData.CheckEvents.Filter := '';
                          WinData.CheckEvents.Filtered := False;

                          if IncludeAnimal then
                             WinData.TempTable.Post
                          else
                             WinData.TempTable.Cancel;

                          qReportPD.Next;

                          if RunWithProgressOnly then
                             ProgressIndicator.Position := qReportPD.RecNo
                          else
                             pbCount.Position := qReportPD.RecNo;
                       end;

                    // Reset the Query for the Report
                    qReportPD.Sql.Clear;
                    qReportPD.Sql.Add('SELECT * FROM DueToPD');
                    if cbIncludenotServed.Checked then
                      begin
                        qReportPD.SQL.Add('WHERE ((DuePDDate <= ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +')');
                        qReportPD.SQL.Add('OR (( DuePDDate IS NULL ) And ( DaysAfterLastCalving > '+IntToStr(seDaysAfterCalving.AsInteger)+' ))) ');
                      end
                    else
                       qReportPD.SQL.Add('WHERE (DuePDDate <= ' + '''' + FormatDateTime(cUSDateStyle, PDDate.Date) + '''' +')');

                    If not( cbIncCowsNot.Checked ) then
                       qReportPD.SQL.Add('and (PD <> "No")');

                    if NOT ( cbIncCows.Checked And cbIncHeifers.Checked ) then
                       begin
                          if cbIncCows.Checked then
                             qReportPD.Sql.Add('AND ( AnimalLactNo > 0 )')
                          else
                             qReportPD.Sql.Add('AND ( AnimalLactNo = 0 )');
                       end;

                    If rgOrder.ItemIndex = 0 Then
                       qReportPD.Sql.Add('Order by DuePDDate')
                    Else
                       qReportPD.Sql.Add('Order by SortAnimalNo');

                    If rgSort.ItemIndex = 0 Then
                       qReportPD.Sql.Add('Asc')
                    Else
                       qReportPD.Sql.Add('Desc');

                    DateLabel.Caption:= PDDate.Text;
                    qReportPD.Open;
                 end;

              {if DoubleSpace.Checked then
                 begin
                    DueToCalveScr.Details.Height := 24;
                    DueToCalveScr.Details.Height := 30;
                 end}
          end;
    if RunWithProgressOnly then
       uProgressIndicator.ProgressIndicator.Close;
end;

procedure TActionReminderFilter.BuildDueToCalve;
Var
   NoDaysPreg,
   Gestation : Integer;
   IncludeAnimal,
   UsedPD    : Boolean;
   PDProjDate,
   PdDate,
   TestDate  : TDateTime;
   LookupCalvings : TTable;

   TempStr : string;

   HealthWithDrawalInfo : THealthWithDrawalInfo;

   function DueToCalveInPeriod : Boolean;
   begin
      if cbPeriodBetween.Checked then
         begin
            if (CalveDateFrom.Date > 0) and (CalveDateTo.Date > 0) then
               Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime >= CalveDateFrom.Date ) and ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime <= CalveDateTo.Date )
            else if (CalveDateFrom.Date <= 0) and (CalveDateTo.Date > 0) then
               Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime <= CalveDateTo.Date )
            else if (CalveDateFrom.Date > 0 ) and (CalveDateTo.Date <= 0) then
               Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime >= CalveDateFrom.Date );
         end
      else
         Result := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime <= CalveDateFrom.Date );
   end;

begin
    {
    Build the Due To Calve Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }
    if RunWithProgressOnly then
       begin
          ShowProgressIndicator('Compiling Due To Calve Report, please wait...', 0,0,1);
       end;


   WinData.CreateTTable(LookupCalvings,nil,'',WinData.Calvings.TableName);
   LookupCalvings.Active := True;
   try
       WinData.LookUpMilkDisk.Open; //joanne tighe 6/02/2004
       With WinData.TempTable Do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueToCalve';

              FieldDefs.Clear;
              FieldDefs.Add('AnimalID',ftInteger,0,True);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False);
              FieldDefs.Add('EventId',ftInteger,0,False);
              FieldDefs.Add('EventDate',ftDate,0,False);
              FieldDefs.Add('LastBirth',ftString,15,False);
              FieldDefs.Add('LastCalfType',ftString,10,False);
              FieldDefs.Add('BullUsed',ftString,10,False);
              FieldDefs.Add('ServiceType',ftString,10,False);
              FieldDefs.Add('YieldToDate',ftFloat,0,False);
              FieldDefs.Add('CalvingIndex',ftInteger,0,False);
              FieldDefs.Add('DaysToCalving',ftInteger,0,False);
              FieldDefs.Add('DueToCalve',ftDate,0,False);
              FieldDefs.Add('PD',ftString,9,False);
              FieldDefs.Add('Status',ftString,10,False);
              FieldDefs.Add('ConditionScore',ftFloat,0,False);
              //  22/01/2009 [Dev V3.9 R5.8] /MK Added the ShortNatID, NatID and SortNatID to DueToCalve Table
              FieldDefs.Add('ShortNatIDNum',ftString,20,False);
              FieldDefs.Add('NatIDNum',ftString,20,False);
              FieldDefs.Add('SortNatID',ftString,20,False);

              FieldDefs.Add('HealthDate',ftDate,0,False);
              FieldDefs.Add('WithdrawalDate',ftDate,0,False);
              FieldDefs.Add('WithdrawalFromDryOff',ftBoolean,0,False);

              IndexDefs.Clear;
              IndexDefs.Add('','AnimalID',[ixPrimary, ixUnique]);
              IndexDefs.Add('iDueDate','DueToCalve',[ixCaseInsensitive]);
              CreateTable;
              Open;

              with DueToCalveScr do
                 begin
                    qDueToCalve.Close;
                    qDueToCalve.SQL.Clear;
                    // Get all possible animals
                    qDueToCalve.SQL.Add('SELECT DISTINCT ID, LactNo, AnimalNo, SortAnimalNo, NatIDNum From');
                    qDueToCalve.SQL.Add('"Animals.db" A, "Events.db" E');
                    qDueToCalve.SQL.Add('Where (A.Sex="Female")');
                    qDueToCalve.SQL.Add('AND (A.ID = E.AnimalId)');
                    qDueToCalve.SQL.Add('AND (A.Inherd = TRUE)');
                    qDueToCalve.SQL.Add('AND (A.Breeding = TRUE)');
                    qDueToCalve.SQL.Add('AND (A.LactNo = E.AnimalLactNo)');
                    qDueToCalve.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                    qDueToCalve.SQL.Add('AND ((E.EventType = ' + IntToStr(CServiceEvent) + ')'); // Service
                    qDueToCalve.SQL.Add('OR    (E.EventType = ' + IntToStr(CPregDiagEvent) + '))');
                    qDueToCalve.SQL.Add('AND ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                    if Length(cbDefaultHerd.Value) > 0 then
                       if cbDefaultHerd.Value <> '0' then
                          qDueToCalve.SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');
                    if NOT ( IncCows.Checked And IncHeifers.Checked ) then
                       begin
                          if IncCows.Checked then
                             qDueToCalve.Sql.Add('AND ( A.LactNo > 0 )')
                          else
                             qDueToCalve.Sql.Add('AND ( A.LactNo = 0 )');
                       end;

                    // Store Animals with PD record for the Current Lactation in the TEMP Table
                    qDueToCalve.Open;
                    qDueToCalve.First;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := qDueToCalve.RecordCount;
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := qDueToCalve.RecordCount;
                       end;
                    while NOT qDueToCalve.EOF do
                       begin
                          IncludeAnimal := TRUE;
                          WinData.TempTable.Insert;

                          WinData.TempTable.FieldByName('AnimalId').AsInteger := qDueToCalve.FieldByName('ID').AsInteger;
                          WinData.TempTable.FieldByName('AnimalLactNo').AsInteger := qDueToCalve.FieldByName('LactNo').AsInteger;
                          WinData.TempTable.FieldByName('AnimalNo').AsString := qDueToCalve.FieldByName('AnimalNo').AsString;

                          //  22/01/2009 [Dev V3.9 R5.8] /MK
                          WinData.TempTable.FieldByName('NatIDNum').AsString := qDueToCalve.FieldByName('NatIDNum').AsString;

                          if WinData.IsNINatID(WinData.TempTable.FieldByName('NatIDNum').AsString) then
                             begin
                                TempStr := StripAllSpaces(WinData.TempTable.FieldByName('NatIDNum').AsString);
                                WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-6,MaxInt);
                             end
                          else
                             //  28/09/10 [V4.0 R4.8] /MK Change - Allowed ShortNatIDNum to take account of UK Tags.
                             if Copy(WinData.TempTable.FieldByName('NatIDNum').AsString,1,2) = 'UK' then
                                begin
                                   TempStr := StripAllSpaces(WinData.TempTable.FieldByName('NatIDNum').AsString);
                                   WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-4,MaxInt);
                                end
                          else
                            if Copy(WinData.TempTable.FieldByName('NatIDNum').AsString,1,2) = 'IE' then
                                begin
                                   TempStr := qDueToCalve.FieldByName('NatIDNum').AsString;
                                   if WinData.WhatStyleNatID(WinData.TempTable.FieldByName('NatIDNum').AsString,False) = Style1999 then
                                      begin
                                         TempStr := StripAllSpaces(TempStr);
                                         WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-4,MaxInt)
                                      end
                                   else
                                      begin
                                         TempStr := StripAllSpaces(TempStr);
                                         WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-4,MaxInt);
                                      end;
                                end
                          else
                             if not ( ( Copy(WinData.TempTable.FieldByName('NatIDNum').AsString,1,2) = 'IE' ) or
                                ( Copy(WinData.TempTable.FieldByName('NatIDNum').AsString,1,2) = 'UK' ) ) then
                                begin
                                   TempStr := StripAllSpaces(WinData.TempTable.FieldByName('NatIDNum').AsString);
                                   WinData.TempTable.FieldByName('ShortNatIDNum').AsString := Copy(TempStr,Length(TempStr)-5,MaxInt);
                                end;

                          WinData.TempTable.FieldByName('SortAnimalNo').AsString := qDueToCalve.FieldByName('SortAnimalNo').AsString;
                          WinData.TempTable.FieldByName('ConditionScore').AsFloat := GetConditionScore(qDueToCalve.FieldByName('ID').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger);

                          NoDaysPreg := 0;
                          UsedPD := FALSE;

                          // Check the PD Scan Against the Date today if it's more than 10 days display Message
                          WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(qDueToCalve.FieldByName('ID').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueToCalve.FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
                          WinData.CheckEvents.Filtered := True;
                          if WinData.CheckEvents.FindLast then
                             begin
                                // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
                                if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                   if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                                      begin
                                         UsedPD := TRUE;
                                         Gestation := 283;
                                         PDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                         NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                                         if NoDaysPreg > 0 then
                                            begin
                                               if ( NoDaysPreg >= 0 ) And
                                                  ( NoDaysPreg <= 283 ) then
                                                    PDProjDate := PDDate + (Gestation-NoDaysPreg) // Projected Date
                                               else
                                                  PDProjDate := PDDate + Gestation; // Projected Date
                                               // Projected Date
                                               WinData.TempTable.FieldByName('DueToCalve').AsDateTime := PDProjDate;
                                               // No of Days to Calving negitive indicates past projected Calving Date
                                               WinData.TempTable.FieldByName('DaysToCalving').Value := ( PDProjDate - Now() );
                                            end
                                         else
                                            WinData.TempTable.FieldByName('DueToCalve').AsDateTime := 0;
                                      end
                                   else if ( WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean = FALSE ) then
                                      if cbIncludeNOTPD.State in [cbUnChecked] then
                                         IncludeAnimal := FALSE;
                             end;

                          if IncludeAnimal then
                             begin
                                // Clear the Filter
                                WinData.CheckEvents.Filter := '';
                                WinData.CheckEvents.Filtered := False;

                                // Get the Last Service Record
                                WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(qDueToCalve.FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueToCalve.FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                                WinData.CheckEvents.Filtered := True;
                                if WinData.CheckEvents.FindLast then
                                   begin
                                      Gestation := 283;
                                      TestDate  := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                      // Check the Calving Record for the Bull used in last service
                                      if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                         begin
                                            Gestation := WinData.BreedingDataHelper.GetGestation ( WinData.LookUpServices.FieldByName('ServiceBull').AsInteger );
                                            // Bull Used
                                            if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                               WinData.TempTable.FieldByName('BullUsed').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                            // Service Type
                                            if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[] ) then
                                               WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                         end;

                                      TestDate := TestDate+Gestation;
                                      if not( WinData.TempTable.FieldByName('DueToCalve').AsDateTime > 0 ) then // Only Predict from Service if PD Proj Calve is <= 0.
                                         begin
                                            // Projected Date
                                            WinData.TempTable.FieldByName('DueToCalve').AsDateTime := TestDate;
                                            // No of Days to Calving negitive indicates past projected Calving Date
                                            WinData.TempTable.FieldByName('DaysToCalving').Value := ( TestDate - Now() );
                                         end;
                                   end;


                                IncludeAnimal := DueToCalveInPeriod;

                                if IncludeAnimal then
                                   begin
                                      // Clear the Filter
                                      WinData.CheckEvents.Filter := '';
                                      WinData.CheckEvents.Filtered := False;

                                      if WinData.GetProjCalving(WinData.TempTable.FieldByName('AnimalId').AsInteger,
                                                                WinData.TempTable.FieldByName('AnimalLactNo').AsInteger, NumCalves, IsPreg ) > 0 then
                                         begin


                                            if NumCalves = 1 then
                                               WinData.TempTable.FieldByName('PD').AsString := IsPreg
                                            else if NumCalves > 1 then
                                               // set caption to Twins, irrespectful of NumCalves count. ignoring fact might be triplets or other
                                               WinData.TempTable.FieldByName('PD').AsString := 'Twins';
                                         end;

                                      // Check for a Drying off Record
                                      if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([qDueToCalve.FieldByName('ID').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger,CDryOffEvent]),[]) then
                                         WinData.TempTable.FieldByName('Status').AsString := 'Dry'
                                      else if WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 then
                                         WinData.TempTable.FieldByName('Status').AsString := 'Dry'
                                      else
                                         WinData.TempTable.FieldByName('Status').AsString := 'In Milk';

                                      // Calcalate the Calving Index - Last Calving Date - Last Service Date
                                      // Get the Birth Type of the previous Calving
                                      if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([qDueToCalve.FieldByName('ID').AsInteger,qDueToCalve.FieldByName('LactNo').AsInteger,CCalvingEvent]),[]) then
                                         begin
                                            WinData.TempTable.FieldByName('CalvingIndex').Value := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime - WinData.CheckEvents.FieldByName('EventDate').AsDateTime );
                                            if LookUpCalvings.Locate('EventId',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                               begin
                                                  if WinData.GenLookUp.Locate('ID',LookUpCalvings.FieldByName('BirthType').AsInteger,[]) then
                                                     WinData.TempTable.FieldByName('LastBirth').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                                  // Get the Calves Sex and Concat into LAstCalf String.
                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID1').AsInteger,[]) then
                                                     WinData.TempTable.FieldByName('LastCalfType').AsString := Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID2').AsInteger,[]) then
                                                     WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +    //KVB
                                                                                                         Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID3').AsInteger,[]) then
                                                     WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +    //KVB
                                                                                                         Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                                  if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID4').AsInteger,[]) then
                                                     WinData.TempTable.FieldByName('LastCalfType').AsString := WinData.TempTable.FieldByName('LastCalfType').AsString + '/' +    //KVB
                                                                                                         Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                               end;
                                         end;

                                        // Get the Milk Production Info for the Last Lactation. joanne tighe 6/02/2004
                                      if WinData.LookUpMilkDisk.Locate('AnimalId;LactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger-1]),[]) then
                                         begin
                                            if WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat > 0 then
                                               WinData.TempTable.FieldByName('YieldToDate').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat / WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat
                                            else
                                               WinData.TempTable.FieldByName('YieldToDate').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat;
                                         end;
                                      HealthWithDrawalInfo := HerdLookup.MaxDrugWithDrawalDate(WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('DueToCalve').AsDateTime);
                                      WinData.TempTable.FieldByName('HealthDate').AsDateTime := HealthWithDrawalInfo.StartDate;
                                      WinData.TempTable.FieldByName('WithdrawalDate').AsDateTime := HealthWithDrawalInfo.WithDrawalDate;
                                      WinData.TempTable.FieldByName('WithdrawalFromDryOff').AsBoolean := HealthWithDrawalInfo.DryOff;
                                      WinData.TempTable.Post;
                                   end
                                else
                                   WinData.TempTable.Cancel;
                             end
                          else
                             WinData.TempTable.Cancel;

                          qDueToCalve.Next;
                          if RunWithProgressOnly then
                             begin
                                ProgressIndicator.Position := qDueToCalve.RecNo;
                             end
                          else
                             begin
                                pbCount.Position := qDueToCalve.RecNo;
                             end;
                       end;

                    // ReSet the Query for the Report
                    qDueToCalve.Sql.Clear;
                    qDueToCalve.Sql.Add('SELECT * FROM DueToCalve');
                    if cbPeriodBetween.Checked then
                       begin
                          if (CalveDateFrom.Date > 0) and (CalveDateTo.Date > 0) then
                             qDueToCalve.SQL.Add('WHERE ( DueToCalve BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,CalveDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,CalveDateTo.Date) + '''' + ')')
                          else if (CalveDateFrom.Date <= 0) and (CalveDateTo.Date > 0) then
                             qDueToCalve.SQL.Add('WHERE ( DueToCalve <= ' + '''' + FormatDateTime(cUSDateStyle,CalveDateTo.Date) + '''' + ')')
                          else if (CalveDateFrom.Date > 0 ) and (CalveDateTo.Date <= 0) then
                             qDueToCalve.SQL.Add('WHERE ( DueToCalve >= ' + '''' + FormatDateTime(cUSDateStyle,CalveDateFrom.Date) + '''' + ')');
                       end
                    else
                       qDueToCalve.SQL.Add('WHERE ( DueToCalve <= ' + '''' + FormatDateTime(cUSDateStyle,CalveDateFrom.Date) + '''' + ')');

                    // Set the Sort Order of the Query
                    if CalveSort.Checked then
                       qDueToCalve.Sql.Add('ORDER BY DueToCalve')
                    else
                       qDueToCalve.Sql.Add('ORDER BY SortAnimalNo');
                    qDueToCalve.Open;
                 end;

              if cbPeriodBetween.Checked then    //joanne tighe bug fix 6/02/2004 changed mm/dd to dd/mm
                 begin
                    DueToCalveScr.Period.Caption := 'Period From '+FormatDateTime(cIrishDateStyle,CalveDateFrom.Date)+' To '+FormatDateTime(cIrishDateStyle,CalveDateTo.Date);
                    DueToCalveScr.BlankFormDate.Caption := 'Period From '+FormatDateTime(cIrishDateStyle,CalveDateFrom.Date)+' To '+FormatDateTime(cIrishDateStyle,CalveDateTo.Date);
                 end
              else
                 begin
                    DueToCalveScr.Period.Caption := 'For Period Ending '+FormatDateTime(cIrishDateStyle,CalveDateFrom.Date)+'';
                    DueToCalveScr.BlankFormDate.Caption := DueToCalveScr.Period.Caption;
                 end;

              if DoubleSpace.Checked then
                 begin
                    DueToCalveScr.Details.Height := 24;
                    DueToCalveScr.Details.Height := 30;
                 end
          end;
   finally
      LookupCalvings.Active := False;
      FreeAndNil(LookupCalvings);
      if RunWithProgressOnly then
         uProgressIndicator.ProgressIndicator.Close;
   end;
end;

procedure TActionReminderFilter.BuildDueToDryOff;
const
   NoServiceGestation = 283;
Var
   Gestation : Integer;
   TestDate  : TDateTime;
   NoDaysPreg : Integer;
   PDProjDate : TDateTime;
begin
    {
    Build the Due To DryOff Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }
    try
       // Open the LookUp to Milk disk Cumulatives
    if RunWithProgressOnly then
       begin
          ShowProgressIndicator('Compiling Due For Dry Off Report, please wait...', 0,0,1);
       end;

       WinData.LookUpMilkDisk.Open;

       With WinData.TempTable Do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueToDryOff';

              FieldDefs.Clear;
              // FieldDefs.Add('DueID',ftAutoInc,0,TRUE);
              FieldDefs.Add('AnimalID',ftInteger,0,False);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False); //joanne tighe 9/02/2004
              FieldDefs.Add('EventId',ftInteger,0,False);
              FieldDefs.Add('EventDate',ftDate,0,False);
              FieldDefs.Add('LastCalvDate',ftDate,0,False);
              FieldDefs.Add('BullUsed',ftString,10,False);
              FieldDefs.Add('ServiceType',ftString,10,False);
              FieldDefs.Add('DaysInMilk',ftFloat,0,False);
              FieldDefs.Add('DaysToCalving',ftInteger,0,False);
              FieldDefs.Add('DueToCalve',ftDate,0,False);
              FieldDefs.Add('PD',ftString,9,False);
              FieldDefs.Add('DriedOffOn',ftDate,0,False);
              FieldDefs.Add('IsDry',ftBoolean,0,False);
              FieldDefs.Add('CurrRec',ftFloat,0,False);
              FieldDefs.Add('LatestSCC',ftFloat,0,False);
              FieldDefs.Add('SDriedOffOn',ftDate,0,False);
              FieldDefs.Add('PDriedOffOn',ftDate,0,False);



              IndexDefs.Clear;
              //IndexDefs.Add('','DueID',[ixPrimary, ixUnique]);
              //IndexDefs.Add('iDueDate','DueToCalve',[ixCaseInsensitive]);
              IndexDefs.Add('','AnimalID',[ixPrimary, ixUnique]);
              CreateTable;
              Open;

              with DueForDryingOffScr do
                 begin
                    qDueForDryingOff.SQL.Clear;
                    qDueForDryingOff.Close;
                    // Select Events of Service type and their associated Animal file info.    //joanne tighe 9/02/2004
                    qDueForDryingOff.SQL.Add('SELECT DISTINCT ID, AnimalID, AnimalLactNo, AnimalNo, AnimalLactNo, SortAnimalNo, EventDate From');
                    qDueForDryingOff.SQL.Add('"Animals.db" A, "Events.db" E');  //joanne tighe 9/02/2004
//                    qDueForDryingOff.SQL.Add('Select E.ID, E.AnimalID, E.AnimalLactNo, A.SortAnimalNo, E.EventDate,');
//                    qDueForDryingOff.SQL.Add('A.AnimalNo From "Events.db" E,');
//                    qDueForDryingOff.SQL.Add('"Animals.db" A');
                    qDueForDryingOff.SQL.Add('WHERE ((E.EventType = ' + IntToStr(CServiceEvent) + ') ');
                    qDueForDryingOff.SQL.Add('OR     (E.EventType = ' + IntToStr(CPregDiagEvent) + ')) ');
                    qDueForDryingOff.SQL.Add('AND (E.AnimalID=A.ID)');
                    qDueForDryingOff.SQL.Add('AND (E.AnimalLactNo = A.LactNo)');
                    qDueForDryingOff.SQL.Add('AND (A.InHerd = TRUE)');
                    qDueForDryingOff.SQL.Add('AND (A.Breeding = TRUE)');
                    qDueForDryingOff.SQL.Add('AND (A.LactNo>0)');
                    qDueForDryingOff.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                    qDueForDryingOff.SQL.Add('AND ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                    if Length(cbDefaultHerd.Value) > 0 then
                       if cbDefaultHerd.Value <> '0' then
                          qDueForDryingOff.SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');

                    // Store Animals with PD record for the Current Lactation in the TEMP Table
                    qDueForDryingOff.Open;
                    qDueForDryingOff.First;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := qDueforDryingOff.RecordCount;
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := qDueforDryingOff.RecordCount;
                       end;

                    while NOT qDueForDryingOff.EOF do
                       begin
                          Try
                             if NOT WinData.TempTable.Locate('AnimalID',
                                    qDueForDryingOff.FieldByName('AnimalID').AsInteger,[]) then
                                begin
                                   WinData.TempTable.Insert;
                                   WinData.TempTable.FieldByName('AnimalId').AsInteger := qDueForDryingOff.FieldByName('AnimalID').AsInteger;
                                   WinData.TempTable.FieldByName('AnimalLactNo').AsInteger := qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger;
                                   WinData.TempTable.FieldByName('EventID').AsInteger := qDueForDryingOff.FieldByName('ID').AsInteger;
                                   WinData.TempTable.FieldByName('EventDate').AsDateTime := qDueForDryingOff.FieldByName('EventDate').AsDateTime;
                                   WinData.TempTable.FieldByName('AnimalNo').AsString := qDueForDryingOff.FieldByName('AnimalNo').AsString;
                                   WinData.TempTable.FieldByName('SortAnimalNo').AsString := qDueForDryingOff.FieldByName('SortAnimalNo').AsString; //joanne tighe 9/02/2004

                                   // Get the Last Service Record
                                   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                                   WinData.CheckEvents.Filtered := True;
                                   try
                                      if WinData.CheckEvents.FindLast then
                                         begin
                                            Gestation := 283;
                                            TestDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                            Showdate := DateToStr(TestDate);
                                            // Check the Calving Record for the Bull used in last service
                                            if WinData.LookUpServices.Locate('EventID', WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                               begin
                                                  Gestation := WinData.BreedingDataHelper.GetGestation ( WinData.LookUpServices.FieldByName('ServiceBull').AsInteger );
                                                  // Bull Used
                                                  if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                                     WinData.TempTable.FieldByName('BullUsed').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                  // Service Type
                                                  if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[] ) then
                                                     WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                               end;
                                            TestDate := TestDate + Gestation;

                                            // Projected Date
                                            WinData.TempTable.FieldByName('DueToCalve').AsDateTime := TestDate;
                                            // No of Days to Calving negitive indicates past projected Calving Date
                                            WinData.TempTable.FieldByName('DaysToCalving').Value := ( TestDate - Now() );
                                            // Calculate the Drying Off Date from the Projected Date less the user inputted days
                                            WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := (TestDate - DaysForDryingOff.AsInteger);
                                            WinData.TempTable.FieldByName('SDriedOffOn').AsDateTime := WinData.TempTable.FieldByName('DriedOffOn').AsDateTime;
                                         end;
                                      finally
                                         WinData.CheckEvents.Filter := '';
                                         WinData.CheckEvents.Filtered := False;
                                      end;

                                      WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
                                      WinData.CheckEvents.Filtered := True;
                                      try
                                         if WinData.CheckEvents.FindLast then
                                            if WinData.LookUpPDs.Locate('EventID', WinData.CheckEvents.FieldByName('ID').AsInteger, []) then
                                               begin
                                                  if ((WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean) AND
                                                      (WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger > 0)) then
                                                      begin
                                                         if Gestation = 0 then
                                                            Gestation := NoServiceGestation;
                                                         TestDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                                         NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                                                         if NoDaysPreg > 0 then
                                                            begin
                                                               if ( NoDaysPreg >= 0 ) and ( NoDaysPreg <= 283 ) then
                                                                  PDProjDate := TestDate + ( Gestation - NoDaysPreg) // Projected Date
                                                               else
                                                                  PDProjDate := TestDate + Gestation; // Projected Date

                                                               // Projected Date
                                                               WinData.TempTable.FieldByName('DueToCalve').AsDateTime := PDProjDate;
                                                               // No of Days to Calving negitive indicates past projected Calving Date
                                                               WinData.TempTable.FieldByName('DaysToCalving').Value := ( PDProjDate - Now() );

                                                               if ( PDProjDate > 0 ) and ( DaysForDryingOff.AsInteger > 0 ) then
                                                               WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := PDProjDate - DaysForDryingOff.AsInteger;
                                                               WinData.TempTable.FieldByName('PDriedOffOn').AsDateTime := WinData.TempTable.FieldByName('DriedOffOn').AsDateTime;
                                                            end
   {                                                      WinData.TempTable.FieldByName('DueToCalve').AsDateTime := TestDate+NoServiceGestation;
                                                         WinData.TempTable.FieldByName('DaysToCalving').Value   := ( WinData.TempTable.FieldByName('DueToCalve').AsDateTime - Date);
                                                         WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := (TestDate + ( NoServiceGestation - DaysForDryingOff.AsInteger ));
   }
                                                      end;
                                               end;
                                      finally
                                         //Clear the Filter
                                         WinData.CheckEvents.Filter := '';
                                         WinData.CheckEvents.Filtered := False;
                                      end;


                                   WinData.TempTable.FieldByName('IsDry').AsBoolean :=
                                       WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',
                                          VarArrayOf([qDueForDryingOff.FieldByName('AnimalID').AsInteger,
                                                      qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger,
                                                      CDryOffEvent]),[]);

                                   if WinData.GetProjCalving(WinData.TempTable.FieldByName('AnimalId').AsInteger,
                                                             WinData.TempTable.FieldByName('AnimalLactNo').AsInteger, NumCalves, IsPreg ) > 0 then
                                   begin
                                      if NumCalves = 1 then
                                         WinData.TempTable.FieldByName('PD').AsString := IsPreg
                                      else if NumCalves > 1 then
                                         // set caption to Twins, irrespectful of NumCalves count. ignoring fact might be triplets or other
                                         WinData.TempTable.FieldByName('PD').AsString := 'Twins';
                                   end;

                                   // Calcalate the Calving Index - Last Calving Date - Last Service Date
                                   // Get the Birth Type of the previous Calving
                                   if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([qDueForDryingOff.FieldByName('AnimalID').AsInteger,qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger,CCalvingEvent]),[]) then
                                      WinData.TempTable.FieldByName('LastCalvDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;

                                      // Get the Latest Daily Recording .. SP 1/9/00
                                   if WinData.LookUpMilkDisk.Locate('AnimalId;LactNo',VarArrayOf([qDueForDryingOff.FieldByName('AnimalID').AsInteger,qDueForDryingOff.FieldByName('AnimalLactNo').AsInteger]),[] ) then
                                      begin
                                         WinData.TempTable.FieldByName('CurrRec').AsFloat := WinData.LookUpMilkDisk.FieldByName('DailyYield').AsFloat;
                                         WinData.TempTable.FieldByName('DaysInMilk').AsFloat := Date - WinData.TempTable.FieldByName('LastCalvDate').AsDateTime+1;           //SP
                                         WinData.TempTable.FieldByName('LatestSCC').AsFloat := WinData.LookUpMilkDisk.FieldByName('SCC').AsFloat;
                                      end;

                                   if RunWithProgressOnly then
                                      begin
                                         ProgressIndicator.Position := qDueforDryingOff.RecNo;
                                      end
                                   else
                                      begin
                                         pbCount.Min := 0;
                                         pbCount.Position := qDueforDryingOff.RecNo;
                                      end;

                                   // post last record to table
                                   if qDueForDryingOff.RecNo = qDueForDryingOff.RecordCount then
                                      WinData.TempTable.Post;       // ?????
                                end;

                             qDueForDryingOff.Next;
                          except
                             WinData.TempTable.Cancel;
                             qDueForDryingOff.Next;
                          end;
                       end;

                    // ReSet the Query for the Report
                    qDueForDryingOff.Sql.Clear;
                    qDueForDryingOff.Sql.Add('Select DISTINCT  * from DueToDryOff');
                    qDueForDryingOff.SQL.Add('Where (DriedOffOn <= ' + '''' + FormatDateTime(cUSDateStyle,DryingDate.Date) + '''' +')');
                    qDueForDryingOff.SQL.Add('And ((PD = "Yes") Or (PD = "Twins") Or (PD = "UnDefined")'); // << 06/01/2009 [Rel V3.9 R4.8, Dev V3.9 R5.6] Bug Fix /SP - "OR PD = Twins"
                    //qDueForDryingOff.SQL.Add('And ((PD = "Yes") Or (PD = "UnDefined")'); 06/01/2009
                    if cbIncludeNotPreg.State in [cbChecked] then
                       qDueForDryingOff.SQL.Add('                 Or (PD = "No"))    ')
                    else
                       qDueForDryingOff.SQL.Add('                 )                  ');
                    qDueForDryingOff.SQL.Add('And (IsDry = False)');
                    if NOT ( OlderCows.Checked And FirstLactCows.Checked ) then
                       begin
                          if OlderCows.Checked then
                             qDueForDryingOff.Sql.Add('And ( AnimalLactNo > 1 )')
                          else
                             qDueForDryingOff.Sql.Add('And ( AnimalLactNo = 1 )');
                       end;
                    // Set the Sort Order of the Query
                    if SortDryOffDate.Checked then
                       qDueForDryingOff.Sql.Add('Order By DueToCalve')
                    else
                        qDueForDryingOff.Sql.Add('Order By SortAnimalNo');   //joanne tighe 9/02/2004
                    qDueForDryingOff.Open;
                 end;
              DueForDryingOffScr.Period.Caption := 'Up To ' +  DryingDate.Text;
              DueForDryingOffScr.BlankFormDate.Caption := 'Up To ' +  DryingDate.Text;
              if DryingDoubleSpace.Checked then
                 DueForDryingOffScr.QRSubDetail1.Height := 30;
          end;
    finally
       // Close the LookUp to Milk disk Cumulatives
       WinData.LookUpMilkDisk.Close;
    end;
    if RunWithProgressOnly then
       uProgressIndicator.ProgressIndicator.Close;
end;

procedure TActionReminderFilter.BuildDueFirstService;
Var
   Gestation,
   cHeatCycle : Integer;
   LookupCalvings : TTable;
begin

    if RunWithProgressOnly then
       begin
          ShowProgressIndicator('Compiling Due Service Report, please wait...', 0,0,1);
       end;

   WinData.LookUpMilkDisk.Open;
    {
    Build the Due To DryOff Temporary Table Select all Events with CPregDiag type and
    a Record on the Animal file with the same ID and Lactation Number.
    }
       TestDate := Date();
       CutOffDate := Date()-365;
       DueFirstServiceScr.Period.Caption := 'Period ' + FormatDateTime(cIrishDateStyle,FromServiceDate.Date) + ' to ' + FormatDateTime(cIrishDateStyle,ToServiceDate.Date);
       DueFirstServiceScr.PeriodExtended.Caption := 'Period ' + FormatDateTime(cIrishDateStyle,FromServiceDate.Date) + ' to ' + FormatDateTime(cIrishDateStyle,ToServiceDate.Date);
       DueFirstServiceScr.BlankFormDate.Caption := 'Period ' + FormatDateTime(cIrishDateStyle,FromServiceDate.Date) + ' to ' + FormatDateTime(cIrishDateStyle,ToServiceDate.Date);
       DueFirstServiceScr.OverDueCutOffDate := FromServiceDate.Date;

    WinData.CreateTTable(LookupCalvings, nil, '', WinData.Calvings.TableName);
    LookupCalvings.Active := True;
    try
       with WinData.TempTable do
          begin
              Close;
              TableType := ttParadox;
              TableName := 'DueFirstService';

              FieldDefs.Clear;
              FieldDefs.Add('AnimalID',ftInteger,0,False);
              FieldDefs.Add('AnimalLactNo',ftInteger,0,False);
              FieldDefs.Add('AnimalNo',ftString,10,False);
              FieldDefs.Add('SortAnimalNo',ftString,10,False);
              FieldDefs.Add('DOB',ftDate,0,False);
              FieldDefs.Add('LastCalvDate',ftDate,0,False);
              FieldDefs.Add('LastCalvType',ftString,10,False);
              FieldDefs.Add('PlannedBull',ftString,10,False);
              FieldDefs.Add('DaysInMilk',ftFloat,0,False);
              FieldDefs.Add('DueService',ftDate,0,False);
              FieldDefs.Add('NextObsDate',ftDate,0,False);
              FieldDefs.Add('DriedOffOn',ftDate,0,False);
              FieldDefs.Add('NextHeat',ftDate,0,False);
              FieldDefs.Add('PrevYield',ftFloat,0,False);
              FieldDefs.Add('RepType',ftString,1,False);
              FieldDefs.Add('DueAfter',ftDate,0,False);
              FieldDefs.Add('NoServes',ftInteger,0,False);
              FieldDefs.Add('LastBull',ftString,10,False);
              FieldDefs.Add('DaysToService',ftFloat,0,False);
              FieldDefs.Add('AvgDailyYield',ftFloat,0,False);
              FieldDefs.Add('LastService',ftDate,0,False);
              FieldDefs.Add('Include',ftBoolean,0,False);
              FieldDefs.Add('LastServiceDate',ftDate,0,False);
              FieldDefs.Add('HeatDate',ftDate,0,False);
              FieldDefs.Add('Category',ftInteger,0,False);
              FieldDefs.Add('ServiceType', ftString, 10, False); { SP 27/11/2002 }
              FieldDefs.Add('OverDue', ftBoolean);

              IndexDefs.Clear;
              CreateTable;
              Open;

              with DueFirstServiceScr do
                 begin
                    with qDueFirstService do
                      begin
                        SQL.Clear;
                        Close;

                        // Select Events of Service type and their associated Animal file info.
                        SQL.Add('INSERT INTO DueFirstService (AnimalID, AnimalLactNo, AnimalNo, SortAnimalno, DOB)');
                        SQL.Add('SELECT DISTINCT ID, LactNo, AnimalNo, SortAnimalNo, DateOfBirth');
                        SQL.Add('FROM "Animals.db" A');
                        SQL.Add('WHERE (A.InHerd = TRUE)');
                        // They are OVER 1 year old
                        SQL.Add('AND ((A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle,CutOffDate) + '''' + ')');
                        SQL.Add('OR   ((A.DateOfBirth Is Null) And (A.LactNo > 0 )) )');
                        SQL.Add('AND (A.Sex = "Female")');
                        SQL.Add('AND (A.Breeding = TRUE)');
                        SQL.Add('AND (A.AnimalDeleted=FALSE)');
                        SQL.Add('And ( NOT (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                        if Length(cbDefaultHerd.Value) > 0 then
                           if cbDefaultHerd.Value <> '0' then
                              SQL.Add('And (A.HerdID = ' + cbDefaultHerd.Value + ')');
                        ExecSQL;
                      end;

                    if RunWithProgressOnly then
                       begin
                          ProgressIndicator.Max := WinData.TempTable.RecordCount;
                       end
                    else
                       begin
                          pbCount.Min := 0;
                          pbCount.Max := WinData.TempTable.RecordCount;
                       end;

                    WinData.TempTable.First;
                    while NOT WinData.TempTable.EOF do
                       begin
                          WinData.TempTable.FieldByName('AnimalNo').AsString;
                          WinData.TempTable.Edit;
                          WinData.TempTable.FieldByName('Include').AsBoolean := FALSE;
                          // See if the Animal has been served
                          IsServed := FALSE;
                          WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                          WinData.CheckEvents.Filtered := True;
                          if WinData.CheckEvents.FindLast then
                             begin
                                IsServed := TRUE;
                                //WinData.TempTable.FieldByName('DueService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime + Cycle;
//                                WinData.TempTable.FieldByName('DueAfter').AsDateTime := FieldByName('DueService').AsDateTime + Cycle; // ???????
                                WinData.TempTable.FieldByName('DueAfter').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime + Cycle; // ???????
                                WinData.TempTable.FieldByName('NoServes').AsInteger := WinData.CheckEvents.RecordCount;
                                WinData.TempTable.FieldByName('LastService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                WinData.TempTable.FieldByName('DaysToService').AsFloat := (TestDate-WinData.TempTable.FieldByName('LastService').AsDateTime);
                                if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                                   if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[]) then
                                      WinData.TempTable.FieldByName('LastBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').AsInteger,[] ) then
                                   WinData.TempTable.FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                             end;
                          WinData.CheckEvents.Filter := '';
                          WinData.CheckEvents.Filtered := False;

                          IsPregnant := FALSE;

                          { 03/03/2009 [Dev V3.9 R6.5] /SP Program Change }
                          { Do not check if animal is served before checking if animal is pregnant SP/GL 03/03/2009 }
                          //if IsServed then
                             //begin
                                // See if the Animal is Pregnant
                          WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
                          WinData.CheckEvents.Filtered := True;
                          try
                             if WinData.CheckEvents.FindLast then
                                if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                                   IsPregnant := WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean;
                          finally
                             WinData.CheckEvents.Filter := '';
                             WinData.CheckEvents.Filtered := False;
                          end;
                             //end;

                          // Check for Dried Off
                          IsDry := FALSE;
                          if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger,CDryOffEvent]),[]) then
                             begin
                                IsDry := TRUE;
                                WinData.TempTable.FieldByName('DriedOffOn').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                             end;

                          // Check for heat/bulling date and the Planned Bull
                          HasHeat := FALSE;
                          WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(WinData.TempTable.FieldByName('AnimalId').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(WinData.TempTable.FieldByName('AnimalLactNo').AsInteger) + ') And (EventType = ' + IntToStr(CBullingEvent) + ')';
                          //WinData.CheckEvents.Filtered := True;
                          if WinData.CheckEvents.FindLast then
                             begin
                                HasHeat := TRUE;
                                WinData.TempTable.FieldByName('HeatDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                if WinData.LookUpBullings.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                   if WinData.LookUpDamSire.Locate('ID',WinData.LookUpBullings.FieldByName('PlannedBull').AsString,[]) then
                                      WinData.TempTable.FieldByName('PlannedBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                // get the Previous Bull used
                                if WinData.CheckEvents.FindPrior then
                                   if WinData.LookUpBullings.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                      if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastBull').AsString := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;

                             end;
                          WinData.CheckEvents.Filter := '';
                          //WinData.CheckEvents.Filtered := False;

                          WinData.TempTable.FieldByName('DaysInMilk').AsFloat := 0;
                          // Check the last Calving type
                          HasCalvingEvent := FALSE;
                          if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger,CCalvingEvent]),[]) then
                             begin
                                HasCalvingEvent := TRUE;
                                WinData.TempTable.FieldByName('DaysInMilk').AsFloat := (TestDate-WinData.CheckEvents.FieldByName('EventDate').AsDateTime);
                                WinData.TempTable.FieldByName('LastCalvDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                if LookUpCalvings.Locate('EventId',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                                   begin
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID1').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID2').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := WinData.TempTable.FieldByName('LastCalvType').AsString + '/' +
                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID3').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := WinData.TempTable.FieldByName('LastCalvType').AsString + '/' +
                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                      if WinData.LookUpDamSire.Locate('ID',LookUpCalvings.FieldByName('ID4').AsInteger,[]) then
                                         WinData.TempTable.FieldByName('LastCalvType').AsString := WinData.TempTable.FieldByName('LastCalvType').AsString + '/' +
                                            Copy(WinData.LookUpDamSire.FieldByName('Sex').AsString,1,1);
                                   end;
                             end;

                          ServiceDue;

                          // Get the Milk Production Info for the Last Lactation.
                          if WinData.TempTable.FieldByName('Include').AsBoolean then
                             if WinData.LookUpMilkDisk.Locate('AnimalId;LactNo',VarArrayOf([WinData.TempTable.FieldByName('AnimalID').AsInteger,WinData.TempTable.FieldByName('AnimalLactNo').AsInteger-1]),[]) then
                                begin
                                   WinData.TempTable.FieldByName('PrevYield').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat;
                                   if WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat > 0 then
                                      WinData.TempTable.FieldByName('AvgDailyYield').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat / WinData.LookUpMilkDisk.FieldByName('DaysInMilk').AsFloat
                                   else
                                      WinData.TempTable.FieldByName('AvgDailyYield').AsFloat := WinData.LookUpMilkDisk.FieldByName('CumYield').AsFloat;
                                end;


                          // WinData.TempTable.Post;
                          WinData.TempTable.Next;
                          if RunWithProgressOnly then
                             begin
                                ProgressIndicator.Position := WinData.TempTable.RecNo;
                             end
                          else
                             begin
                                pbCount.Min := 0;
                                pbCount.Position := WinData.TempTable.RecNo;
                             end;
                       end;

                    // ReSet the Query for the Report
                   with qDueFirstService do
                      begin
                         Sql.Clear;
                         Sql.Add('DELETE FROM DueFirstService');
                         SQL.Add('WHERE (Include=False) ');
                         ExecSql;
                      end;
                    // Report Types
                    if NOT ( cbNoheatsServices.Checked ) then
                       with qDueFirstService do
                          begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE (RepType="F")');
                            ExecSql;
                          end;
                    if NOT ( cbReHeatsNotServed.Checked ) then
                       with qDueFirstService do
                          begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE (RepType="H")');
                            ExecSql;
                       end;
                    if NOT ( cbRepeatService.Checked ) then
                       with qDueFirstService do
                          begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE (RepType="R")');
                            ExecSql;
                       end;

                   if not ( ExcludeOver.Checked ) then // Exclude animals with Due service after ToServiceDate
                      begin
                         with qDueFirstService do
                            begin
                               Sql.Clear;
                               Sql.Add('DELETE FROM DueFirstService');
                               SqL.Add('WHERE ( DueService > ' + '''' + FormatDateTime(cUSDateStyle,ToServiceDate.Date) + '''' + ')');
                               ExecSql;
                            end;
                      end
                   else
                      with qDueFirstService do // Exclude animals with Due service outside of date range.
                         begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE ( DueService < ' + '''' + FormatDateTime(cUSDateStyle,FromServiceDate.Date) + '''' + ') ');//OR (OverDue = TRUE) ');
                            ExecSql;
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            Sql.Add('WHERE ( DueService > ' + '''' + FormatDateTime(cUSDateStyle,ToServiceDate.Date)   + '''' + ') ');//OR (OverDue = TRUE) ');
                            ExecSql;
                         end;


                   if NOT ( FirstServeIncCows.Checked ) then
                      with qDueFirstService do
                         begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            SQL.Add('WHERE AnimalLactNo > 0 ');
                            ExecSql;
                         end;

                   // Cows or Heifers
                   if NOT ( FirstServeIncHeifers.Checked ) then
                      with qDueFirstService do
                         begin
                            Sql.Clear;
                            Sql.Add('DELETE FROM DueFirstService');
                            SQL.Add('WHERE AnimalLactNo = 0 ');
                            ExecSql;
                         end;

                    qDueFirstService.Sql.Clear;
                    qDueFirstService.Sql.Add('SELECT DISTINCT * FROM DueFirstService');
                    // Set the Sort Order of the Query
                    if (rgSortBy.ItemIndex = 0 ) then
                       qDueFirstService.Sql.Add('Order By SortAnimalNo')
                    else if (rgSortBy.ItemIndex = 1 ) then
                       qDueFirstService.Sql.Add('Order By DueService')
                    else if (rgSortBy.ItemIndex = 2 ) then
                       qDueFirstService.Sql.Add('Order By LastCalvDate');


                    qDueFirstService.Open;
                 end;
          end;
    finally

       pbCount.Position := 0;
       pbCount.Hide;

       WinData.LookUpMilkDisk.Close;
       LookupCalvings.Active := False;
       FreeAndNil(LookupCalvings);
       if RunWithProgressOnly then
          uProgressIndicator.ProgressIndicator.Close;
    end;
end;

procedure TActionReminderFilter.ServiceDue;
begin
   // Set default value "False", this will be overridden in CalcServiceDate if animal is over 21day cycle.
   WinData.TempTable.FieldByName('OverDue').AsBoolean := False;

   if NOT ISDry AND NOT IsPregnant then
   // See if Animal is Due First Service - Check if they have been served This Lactation
   if ( NOT IsServed ) AND (WinData.TempTable.FieldByName('HeatDate').AsDateTime = 0) then
      begin
         // Due First Service
         WinData.TempTable.FieldByName('RepType').AsString := 'F';
         if WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 then
            // If 0 lact animal, service due is Calving Date + 730 (Xtarget) - 283 (Bullgest)
            WinData.TempTable.FieldByName('DueService').AsDateTime := WinData.TempTable.FieldByName('DOB').AsDateTime + XTARGET - BULLGEST
         else if HasCalvingEvent then
            // Calculate the service date 42 days after the last calving date.
            WinData.TempTable.FieldByName('DueService').AsDateTime := WinData.TempTable.FieldByName('LastCalvDate').AsDateTime + DaysFirstService.AsInteger
         else
            // Safety net, just in case!!
            WinData.TempTable.FieldByName('DueService').Value := Null;

             // if 0 lact animal > yearold
         if ((( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 ) And
             ( TestDate-WinData.TempTable.FieldByName('DOB').AsDateTime > 365 ))
         Or  //  if > 0 lact animal, DueService <= User input ServiceDate, and not dried off
             ( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger > 0 )) And
             ( WinData.TempTable.FieldByName('DueService').AsDateTime <= ToServiceDate.Date ) And
             (( NOT IsDry )
         Or  // Cover 0 lact animal that is dry
             (( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 ) And ( IsDry ))) Then
         WinData.TempTable.FieldByName('Include').AsBoolean := TRUE;
      end
   // Check for last bulling Date, if found calculate the due service date
   else if (NOT IsServed) AND (WinData.TempTable.FieldByName('HeatDate').AsDateTime > 0) then
      begin
         WinData.TempTable.FieldByName('RepType').AsString := 'H';
         if WinData.TempTable.FieldByName('HeatDate').AsDateTime > WinData.TempTable.FieldByName('LastCalvDate').AsDateTime then
            CalcServiceDate;
      end
   else
      Begin // If they have a Service include/exclude animal and calculate DueService date
         WinData.TempTable.FieldByName('RepType').AsString := 'R';  // Due Repeat Service
{         if ( NOT IsPregnant ) And
            (( NOT IsDry ) Or ( WinData.TempTable.FieldByName('AnimalLactNo').AsInteger = 0 )) And
             ((( WinData.TempTable.FieldByName('DueService').AsDateTime >= TestDate) And
               ( WinData.TempTable.FieldByName('DueService').AsDateTime <= ToServiceDate.Date ))

               Or
}
{         if  (( WinData.TempTable.FieldByName('DueAfter').AsDateTime >= TestDate) And
               ( WinData.TempTable.FieldByName('DueAfter').AsDateTime <= ToServiceDate.Date )) Or
              (( IncOver.Checked ) And
               ( WinData.TempTable.FieldByName('DueService').AsDateTime <= TestDate))) then
 }
         CalcServiceDate;
      end;
end;

procedure TActionReminderFilter.CalcServiceDate;
var
   LastServiceDate,
   LastEventDate,
   DateDiff,
   LastHeatDate : TDateTime;
   CycleDateDiff : Double;
   Result : Boolean;
begin
   LastServiceDate := WinData.TempTable.FieldByName('LastService').AsDateTime;
   LastHeatDate := WinData.TempTable.FieldByName('HeatDate').AsDateTime;
   DateDiff := 0;
   CycleDateDiff := 0;
   Result := FALSE;

   // Use the latest event Service r Bulling
   if LastServiceDate > LastHeatDate then
      LastEventDate := LastServiceDate
   else
      LastEventDate := LastHeatDate;

   // Define if the cow is due for overdue/due service.
   // Check the difference between the last eventdate and today.
   // predict a new Due Service Date from last Service/Bulling Date.

    // WinData.TempTable.FieldByName('OverDue').AsBoolean tells us if animal is
    // over 21 day cycle + 3 day saftey margin.

    // This field (along with check for DueService date before today) is used
    // to determine what animals should appear red in report.
    // Added SP 26/05/04.


   DateDiff := ( TestDate - LastEventDate );
   if ( DateDiff < Cycle21 ) then
      begin
         CycleDateDiff := ( Cycle21 - DateDiff );
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := False;
         Result := TRUE;
      end
   else if ( DateDiff >= Cycle21 ) And ( DateDiff <= Cycle24 ) then
      begin
         CycleDateDiff := ( Cycle21 - DateDiff );
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := False;
         Result := TRUE;
      end
   else if ( DateDiff > Cycle24 ) And ( DateDiff <= Cycle42 ) then
      begin
         CycleDateDiff := ( Cycle42 - DateDiff );
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := True; // Missed Cycle // not(IncOver.Checked);
         Result := TRUE;
      end
   else if ( DateDiff > Cycle42 ) then
      begin
         CycleDateDiff := ( Cycle42 - DateDiff ); // Way overdue
         WinData.TempTable.FieldByName('DueService').AsDateTime := TestDate + CycleDateDiff;
         WinData.TempTable.FieldByName('OverDue').AsBoolean := True; // Missed Cycle
         Result := TRUE;
      end;

   WinData.TempTable.FieldByName('Include').AsBoolean := Result
end;


procedure TActionReminderFilter.ViewBtnClick(Sender: TObject);
begin
   pbcount.visible := True;
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;
   sbView.Enabled := False;
   sbPrint.Enabled := False;
     // Due to Calve Report
   try
      if pDueToCalve.Visible then
         begin
            if ( NOT ( IncCows.Checked )) and ( NOT ( IncHeifers.Checked )) then
               ShowMessage('You must select either Cows or/and Heifers')
            else
               try
                 DueToCalveScr := TDueToCalveScr.Create(nil);
                 with DueToCalveScr do
                    begin
                       BuildDueToCalve;

                       if DueToCalveScr.qDueToCalve.RecordCount <= 0 then
                          begin
                             MessageDlg('No Due To Calve records have been found',mtInformation,[mbOK],0);
                             Exit;
                          end;

                       DueToCalveScr.PrintOutBlank := False;
                       DueToCalveScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK

                       if WinData.ExportToPDA then
                          begin
                             WinData.PDALinkExport.ExportReport( DueToCalveScr );
                          end
                       else
                          begin
                             //  22/01/2009 [Dev V3.9 R5.8] /MK
                             if cbShowNatID.Checked then
                                begin
                                  DueToCalveScr.L2.Caption := 'NatID';
                                  DueToCalveScr.QRDBText2.DataField := 'ShortNatIDNum';
                                end
                             else
                                begin
                                  DueToCalveScr.L2.Caption := 'Status';
                                  DueToCalveScr.QRDBText2.DataField := 'Status';
                             end;

                             if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                                begin
                                   DueToCalveScr.Details.Font.Color := clNavy;
                                   DueToCalveScr.FBTitle1.Font.Color := clRed;
                                   DueToCalveScr.FBTitle2.Font.Color := clRed;
                                   DueToCalveScr.Preview;
                                   pbCount.Position := 0;
                                end
                             else
                                begin
                                   DueToCalveScr.Details.Font.Color := clBlack;
                                   DueToCalveScr.FBTitle1.Font.Color := clBlack;
                                   DueToCalveScr.FBTitle2.Font.Color := clBlack;
                                   Windata.CallPrintDialog(DueToCalveScr);
                                   if CalveBlank.Checked then
                                      begin
                                         DueToCalveScr.PrintOutBlank := True;
                                         DueToCalveScr.Print;
                                         pbCount.Position := 0;
                                      end;
                                end;
                          end;
                    end;
            finally
               DueToCalveScr.qDueToCalve.Close;
               DueToCalveScr.Free;
            end
         end
      // Due for Drying Off
      else if pDueForDryingOff.Visible then
         begin
         if ( NOT ( OlderCows.Checked )) and ( NOT ( FirstLactCows.Checked )) then
            ShowMessage('You must select either Cows or/and Heifers')

         else
            try
               DueForDryingOffScr := TDueForDryingOffScr.Create(nil);
               BuildDueToDryOff;

               if DueForDryingOffScr.qDueForDryingOff.RecordCount <= 0 then
                  begin
                     MessageDlg('No Due Dry Off records have been found',mtInformation,[mbOK],0);
                     Exit;
                  end;

               DueForDryingOffScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo;// Added 11/12/98 - FK
               if WinData.ExportToPDA then
                  begin
                     WinData.PDALinkExport.ExportReport(  DueForDryingOffScr );
                  end
               else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                 begin
                   DueForDryingOffScr.QRSubDetail1.Font.Color := clNavy;
                   DueForDryingOffScr.QRSubDetail2.Font.Color := clNavy;
                   DueForDryingOffScr.RptTitle1.Font.Color := clRed;
                   DueForDryingOffScr.RptTitle3.Font.Color := clRed;
                   with DueForDryingOffScr.qDueForDryingOff do
                      begin
                         if cbIncludeServAndPD.Checked then
                            DueForDryingOffScr.DueForDryingOffType := ddExtended
                         else
                            DueForDryingOffScr.DueForDryingOffType := ddNormal;

                         DueForDryingOffScr.Preview;
                         pbCount.Position := 0;
                      end;
                 end
               else
                 begin
                   DueForDryingOffScr.QRSubDetail1.Font.Color := clBlack;
                   DueForDryingOffScr.QRSubDetail2.Font.Color := clBlack;
                   DueForDryingOffScr.RptTitle1.Font.Color := clBlack;
                   DueForDryingOffScr.RptTitle3.Font.Color := clBlack;
                   with DueForDryingOffScr.qDueForDryingOff do
                      begin
                         if DryingBlank.Checked then
                            begin
                               DueForDryingOffScr.DueForDryingOffType := ddBlank;
                               Windata.CallPrintDialog(DueForDryingOffScr);
                               pbCount.Position := 0;
                            end
                         else if cbIncludeServAndPD.Checked then
                            begin
                               DueForDryingOffScr.DueForDryingOffType := ddExtended;
                               Windata.CallPrintDialog(DueForDryingOffScr);
                               pbCount.Position := 0;
                            end
                         else
                            begin
                               DueForDryingOffScr.DueForDryingOffType := ddNormal;
                               Windata.CallPrintDialog(DueForDryingOffScr);
                               pbCount.Position := 0;
                            end

                      end;
                 end;
            finally
               DueForDryingOffScr.qDueForDryingOff.Close;
               DueForDryingOffScr.Free;
            end
         end
      else if pDueFirstService.Visible then
         begin
         if ( NOT ( FirstServeIncCows.Checked )) and ( NOT ( FirstServeIncHeifers.Checked )) then
            ShowMessage('You must select either Cows or/and Heifers')
         else
           try
             DueFirstServiceScr := TDueFirstServiceScr.Create(nil);
             BuildDueFirstService;
             if DueFirstServiceScr.qDueFirstService.RecordCount <= 0 then
                begin
                   MessageDlg('No Due Service records have been found',mtInformation,[mbOK],0);
                   Exit;
                end;

             DueFirstServiceScr.PrintOutBlank := False;
             DueFirstServiceScr.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
             DueFirstServiceScr.verno2.Caption := 'Herd Management ' + HerdVerNo;
             DueFirstServiceScr.MainheadingShort.Caption := 'Due Service';
             DueFirstServiceScr.MainheadingLong.Caption := 'Due Service';
             DueFirstServiceScr.DataEntryHeading.Caption := 'Due Service';
             {if rbWhichType.ItemIndex = 0 then // 1st Service
               begin
                  DueFirstServiceScr.MainheadingLong.Caption := DueFirstServiceScr.MainheadingLong.Caption + 'Due 1st Service';
                  DueFirstServiceScr.MainheadingShort.Caption := DueFirstServiceScr.MainheadingShort.Caption + 'Due 1st Service';
                  DueFirstServiceScr.DataEntryHeading.Caption := DueFirstServiceScr.DataEntryHeading.Caption + 'Due 1st Service';
               end
             else if rbWhichType.ItemIndex = 1 then // Repeat Service
               begin
                  DueFirstServiceScr.MainheadingLong.Caption := DueFirstServiceScr.MainheadingLong.Caption + 'Due Repeat Service';
                  DueFirstServiceScr.MainheadingShort.Caption := DueFirstServiceScr.MainheadingShort.Caption + 'Due Repeat Service';
                  DueFirstServiceScr.DataEntryHeading.Caption := DueFirstServiceScr.DataEntryHeading.Caption + 'Due Repeat Service';
               end
             else
               begin
                  DueFirstServiceScr.MainheadingLong.Caption := DueFirstServiceScr.MainheadingLong.Caption + 'Due 1st/Repeat Service';
                  DueFirstServiceScr.MainheadingShort.Caption := DueFirstServiceScr.MainheadingShort.Caption + 'Due 1st/Repeat Service';
                  DueFirstServiceScr.DataEntryHeading.Caption := DueFirstServiceScr.DataEntryHeading.Caption + 'Due 1st/Repeat Service';
               end;}
               if WinData.ExportToPDA then
                  begin
                     WinData.PDALinkExport.ExportReport( DueFirstServiceScr );
                  end
             else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                Begin
                   DueFirstServiceScr.MainDetail.Font.Color := clNavy;
                   DueFirstServiceScr.OtherDetail.Font.Color := clNavy;
                   DueFirstServiceScr.MainHeadingShort.Font.Color := clRed;
                   DueFirstServiceScr.DataEntryHeading.Font.Color := clRed;
                   DueFirstServiceScr.MainHeadingLong.Font.Color := clRed;
                   With DueFirstServiceScr.qDueFirstService  do
                      if cbExtended.Checked then
                         begin
                            DueFirstServiceScr.qrDetailedService.Preview;
                            pbCount.Position := 0;
                         end
                      else
                         begin
                            DueFirstServiceScr.PrintOutBlank := FALSE;
                            DueFirstServiceScr.Preview;
                            pbCount.Position := 0;
                            {if ServiceBlank.Checked then
                               begin
                                  DueFirstServiceScr.PrintOutBlank := TRUE;
                                  DueFirstServiceScr.Preview;
                                  pbCount.Position := 0;
                               end;}
                         end;
                end
             else
                Begin
                   DueFirstServiceScr.MainDetail.Font.Color := clNavy;
                   DueFirstServiceScr.OtherDetail.Font.Color := clNavy;
                   DueFirstServiceScr.MainHeadingShort.Font.Color := clRed;
                   DueFirstServiceScr.DataEntryHeading.Font.Color := clRed;
                   DueFirstServiceScr.MainHeadingLong.Font.Color := clRed;
                   with DueFirstServiceScr.qDueFirstService do
                        begin
                           if cbExtended.Checked then
                              Windata.CallPrintDialog(DueFirstServiceScr.qrDetailedService)
                           else
                              begin
                                 DueFirstServiceScr.PrintOutBlank := FALSE;
                                 Windata.CallPrintDialog(DueFirstServiceScr);
                                 {if ServiceBlank.Checked then
                                    begin
                                       DueFirstServiceScr.PrintOutBlank := TRUE;
                                       DueFirstServiceScr.Print;
                                       pbCount.Position := 0;
                                    end;}
                             end;
                        end;
               end;
           finally
               DueFirstServiceScr.qDueFirstService.Close;
               DueFirstServiceScr.Free;
           end
         end
      Else if pDueToPD.Visible then
         begin
            if ( NOT ( cbIncCows.Checked )) and ( NOT ( cbIncHeifers.Checked )) then
               ShowMessage('You must select either Cows or/and Heifers')
            else
               try
                  BuildDueToPD;
                  if qReportPD.RecordCount <= 0 then
                     begin
                        MessageDlg('No Due PD records have been found',mtInformation,[mbOK],0);
                        Exit;
                     end;
                  VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
                  if WinData.ExportToPDA then
                     begin
                        WinData.PDALinkExport.ExportReport( PDScr );
                     end
                  else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                     begin
                        PDScr.Preview;
                        pbCount.Position := 0;
                     end
                  Else
                      Begin
                         If Windata.PrintDialog1.Execute then
                            begin
                               PDScr.PrinterSettings.FirstPage := Windata.PrintDialog1.FromPage;
                               PDScr.PrinterSettings.LastPage := Windata.PrintDialog1.ToPage;
                               PDScr.PrinterSettings.Copies := Windata.PrintDialog1.Copies;
                               PDScr.Print;
                               pbCount.Position := 0;
                            End;
                      End;
               finally
                  qReportPD.Close;
               end;
         end;
      // Destroy the TempTable
      if WinData.TempTable.Active then
         begin
            WinData.TempTable.Close;
            WinData.TempTable.DeleteTable;
         end;
   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
    pbCount.Hide;
    pbCount.Position := 0;
end;

procedure TActionReminderFilter.FormShow(Sender: TObject);
begin
   PdScr.Hide;
   pbcount.visible := False;
   cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   if pDueFirstService.Visible then
      begin
         FromServiceDate.Date := Date();
         ToServiceDate.Date := Date + 21; // Increased to 21 from 7 SP 15/05/01
      end
   else If pDueToCalve.Visible Then
      begin
         lCalveDateTo.Hide;{ SP 22/03/2003 }
         CalveDateTo.Hide; { SP 22/03/2003 }
         CalveDateFrom.Left := 200;
         CalveDateFrom.Date := Date; { SP 22/03/2003 }
         lCalveDateFrom.Caption := 'For Period Ending'; { SP 22/03/2003 }
      end
   else if pDueForDryingOff.Visible then
      DryingDate.Date := Date
   else if pDueToPD.Visible then
      PDDate.Date := Date; { SP 22/03/2003 }


   if pDueFirstService.Visible then
      ARReportType := arDueService
   else if pDueToPD.Visible then
      ARReportType := arDuePD
   else if pDueForDryingOff.Visible then
      ARReportType := arDueDryOff
   else if pDueToCalve.Visible then
      ARReportType := arDueCalve;

   LoadScreenDefaults;
end;

procedure TActionReminderFilter.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // CalveDate.Date := Now(); { SP 22/03/2003 }
   // Call the routine to check which radiobutton is selected

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

procedure TActionReminderFilter.ToServiceDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
    if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
        Action := TRUE
    else
       begin
          Action := FALSE;
          MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
       end;
end;

procedure TActionReminderFilter.ServiceBlankClick(Sender: TObject);
begin
   {if ServiceBlank.Checked then
      begin
         cbExtended.Checked := FALSE;
         cbExtended.Hide;
      end
   else
      cbExtended.Show;}
end;

procedure TActionReminderFilter.CalveDateFromAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   if not cbPeriodBetween.Checked then
      begin
         if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
           Action := TRUE
         else
            begin
               Action := FALSE;
               MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
            end;
      end;
end;

procedure TActionReminderFilter.DryingDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
    if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
        Action := TRUE
    else
       begin
          Action := FALSE;
          MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
       end;
end;

procedure TActionReminderFilter.FormCreate(Sender: TObject);
var
  i : Integer;
begin
   WinData.CanShowStandardReportHint := True;
   seDaysAfterCalving.AsInteger := DuePD_DaysSinceCalvingToday;
   PDScr.hide;
   cbIncludenotServedClick(nil);
   for i := 0 to rgSortBy.ControlCount -1 do
      TRadioButton( rgSortBy.Controls[i]).Font.Style := [];
end;

procedure TActionReminderFilter.ToServiceDateExit(Sender: TObject);
begin
   if not cbPeriodBetween.Checked then
      begin
         if (Sender is TDateEdit) then
            begin
               if not((Sender as TDateEdit).Date >= Date) then
                  begin
                     MessageDLG('Date must be on or after the System Date - Resetting to Todays Date',mtInformation,[mbOK],0);
                     (Sender as TDateEdit).Date := Date();
                     (Sender as TDateEdit).SetFocus;
                  end
               else if (Sender as TDateEdit).Date = 0 then
                  begin
                     MessageDLG('Date cannot be blank - Resetting to Todays Date',mtInformation,[mbOK],0);
                     (Sender as TDateEdit).Date := Date();
                     (Sender as TDateEdit).SetFocus;
                  end;
            end;
      end;
end;

procedure TActionReminderFilter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //   If Key = VK_ESCAPE then sbExit.Click;
end;

procedure TActionReminderFilter.FromServiceDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   if (FromServiceDate.Text = '  /  /    ' ) then
      MessageDLG('You must enter a from date',mtInformation,[mbOK],0)
   else if (FromServiceDate.Date <= Date - 366) then
      begin
         MessageDLG('Date must not be more than 1 year from the System Date - Resetting to System Date',mtInformation,[mbOK],0);
         FromServiceDate.Date := Date();
      end;
end;

procedure TActionReminderFilter.FromServiceDateExit(Sender: TObject);
begin
   if ( FromServiceDate.Date > ToServiceDate.Date ) then
      begin
         MessageDLG('Date must be on or before To Date - Resetting to System Date',mtInformation,[mbOK],0);
         FromServiceDate.Date := Date();
      end;
end;

procedure TActionReminderFilter.FirstServeIncHeifersClick(Sender: TObject);
begin
   if NOT FirstServeIncHeifers.Checked then
      if NOT FirstServeIncCows.Checked then
         MessageDLG('Either Cows or Heifers must be selected',mtError,[mbok],0);
end;

procedure TActionReminderFilter.FirstServeIncCowsClick(Sender: TObject);
begin
   FirstServeIncHeifersClick(Sender);
end;

procedure TActionReminderFilter.ServiceSortClick(Sender: TObject);
begin
   if ServiceSort.Checked then
      begin
         CalvingSort.Checked := FALSE;
         AnimalNo.Checked := FALSE;
      end;
end;

procedure TActionReminderFilter.CalvingSortClick(Sender: TObject);
begin
   if CalvingSort.Checked then
      begin
         ServiceSort.Checked := FALSE;
         AnimalNo.Checked := FALSE;
      end;
end;

procedure TActionReminderFilter.AnimalNoClick(Sender: TObject);
begin
   if AnimalNo.Checked then
      begin
         ServiceSort.Checked := FALSE;
         CalvingSort.Checked := FALSE;
      end;
end;

procedure TActionReminderFilter.PDDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if ( ADate >= Date() ) AND ( ADate <= Date()+999 ) then
      Action := TRUE
  else
     begin
        Action := FALSE;
        MessageDLG('Date must be on or after the System Date - Resetting to Previous Date',mtInformation,[mbOK],0);
     end;
end;

procedure TActionReminderFilter.QRDBText1Print(sender: TObject;
  var Value: String);
begin
   if (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0  then
      Value := '';
end;


procedure TActionReminderFilter.cbPeriodBetweenClick(Sender: TObject);
begin
   { SP 22/03/2003 }
   if TCheckBox(Sender).Checked then
      begin
         CalveDateFrom.Left := 160;
         lCalveDateFrom.Caption := 'Period From';
         CalveDateFrom.Date := IncMonth(Date, -1);
         CalveDateTo.Date := IncMonth(Date, 1);
         lCalveDateTo.Show;
         CalveDateTo.Show;
      end
   else
      begin
         lCalveDateTo.Hide;
         CalveDateTo.Hide;
         CalveDateFrom.Left := 200;
         CalveDateFrom.Date := Date;
         lCalveDateFrom.Caption := 'For Period Ending';
      end;
end;

procedure TActionReminderFilter.LoadScreenDefaults;
begin
   case ARReportType of
     arDueService :
        begin
           DueServiceDefaults := TDueServiceDefaults.Create(cRD_DueService);
           try

              if DueServiceDefaults.NoDays = 0 then
                 DaysFirstService.AsInteger := 42 // default to 42 days
              else
                 DaysFirstService.AsInteger := DueServiceDefaults.NoDays;

              cbNoheatsServices.Checked := DueServiceDefaults.DueServeNoHeat;
              cbReHeatsNotServed.Checked := DueServiceDefaults.DueServiceWithHeat;
              cbRepeatService.Checked := DueServiceDefaults.DueRepeatService;
              FirstServeIncCows.Checked := DueServiceDefaults.IncludeCows;
              FirstServeIncHeifers.Checked := DueServiceDefaults.IncludeHeifers;
              cbExtended.Checked := DueServiceDefaults.ExtendedDetails;
              rgSortBy.ItemIndex := DueServiceDefaults.SortField;
              ExcludeOver.Checked := DueServiceDefaults.ExcludeOverDue;
           finally
              FreeAndNil(DueServiceDefaults);
           end;
        end;
     arDuePD :
        begin
           DuePregDiagDefaults := TDuePregDiagDefaults.Create(cRD_DuePregDiag);
           try
              if ( DuePregDiagDefaults.NoDays = 0 ) then
                 PDSince.AsInteger := 70
              else
                 PDSince.AsInteger := DuePregDiagDefaults.NoDays;
              cbIncCows.Checked := DuePregDiagDefaults.IncludeCows;
              cbIncHeifers.Checked := DuePregDiagDefaults.IncludeHeifers;
              cbIncCowsNot.Checked := DuePregDiagDefaults.IncludeNotPregnant;
              CheckBox4.Checked := DuePregDiagDefaults.DoubleSpacing;
              CheckBox1.Checked := DuePregDiagDefaults.BlankEntryForm;
              RadioGroup1.ItemIndex := DuePregDiagDefaults.ReportOn;
              rgOrder.ItemIndex := DuePregDiagDefaults.SortField;
              rgSort.ItemIndex := DuePregDiagDefaults.SortOrder;
           finally
              FreeAndNil(DuePregDiagDefaults);
           end;
        end;
     arDueDryOff :
        begin
           DueDryOffDefaults := TDueDryOffDefaults.Create(cRD_DueDryOff);
           try
              if DueDryOffDefaults.NoDays = 0 then
                 DaysforDryingOff.AsInteger := 70
              else
                 DaysforDryingOff.AsInteger := DueDryOffDefaults.NoDays;
              DryingDoubleSpace.Checked := DueDryOffDefaults.DoubleSpacing;
              DryingBlank.Checked := DueDryOffDefaults.BlankEntryForm;
              OlderCows.Checked := DueDryOffDefaults.IncludeCows;
              FirstLactCows.Checked := DueDryOffDefaults.IncludeHeifers;
              cbIncludeNotPreg.Checked := DueDryOffDefaults.IncludeNotPregnant;
              SortDryOffDate.Checked := DueDryOffDefaults.SortByDate;
              rgOrder.ItemIndex := DueDryOffDefaults.SortField;
              rgSort.ItemIndex := DueDryOffDefaults.SortOrder;
           finally
              FreeAndNil(DueDryOffDefaults);
           end;
        end;
     arDueCalve :
        begin
           DueCalvingDefaults := TDueCalvingDefaults.Create(cRD_DueCalving);
           try
              if DueCalvingDefaults.RestrictToPeriod then
                 begin
                    CalveDateFrom.Date := IncMonth(Date, -1);
                    if DueCalvingDefaults.DateInterval > 0 then
                       CalveDateTo.Date   := Trunc( CalveDateFrom.Date + DueCalvingDefaults.DateInterval)
                 end
              else
                 { Set the CalveDateFrom to today }
                 CalveDateFrom.Date := Date;
              DoubleSpace.Checked := DueCalvingDefaults.DoubleSpacing;
              CalveBlank.Checked := DueCalvingDefaults.BlankEntryForm;
              IncCows.Checked := DueCalvingDefaults.IncludeCows;
              IncHeifers.Checked := DueCalvingDefaults.IncludeHeifers;
              cbIncludeNOTPD.Checked := DueCalvingDefaults.IncludeNotPregnant;
              CalveSort.Checked := DueCalvingDefaults.SortByDate;
           finally
              FreeAndNil(DueCalvingDefaults);
           end;
        end;
   end;
end;

procedure TActionReminderFilter.SaveScreenDefaults;
var
  DueServiceDefaults : TDueServiceDefaults;
begin
   case ARReportType of
     arDueService :
        begin
           DueServiceDefaults := TDueServiceDefaults.Create(cRD_DueService);
           try
              DueServiceDefaults.NoDays := DaysFirstService.AsInteger;
              DueServiceDefaults.DueServeNoHeat := cbNoheatsServices.Checked;
              DueServiceDefaults.DueServiceWithHeat := cbReHeatsNotServed.Checked;
              DueServiceDefaults.DueRepeatService := cbRepeatService.Checked;
              DueServiceDefaults.IncludeCows := FirstServeIncCows.Checked;
              DueServiceDefaults.IncludeHeifers := FirstServeIncHeifers.Checked;
              DueServiceDefaults.ExtendedDetails := cbExtended.Checked;
              DueServiceDefaults.SortField := rgSortBy.ItemIndex;
              DueServiceDefaults.ExcludeOverDue := ExcludeOver.Checked;
           finally
              FreeAndNil(DueServiceDefaults);
           end;
        end;
     arDuePD :
        begin
           DuePregDiagDefaults := TDuePregDiagDefaults.Create(cRD_DuePregDiag);
           try
              DuePregDiagDefaults.NoDays := PDSince.AsInteger;
              DuePregDiagDefaults.IncludeCows := cbIncCows.Checked;
              DuePregDiagDefaults.IncludeHeifers := cbIncHeifers.Checked;
              DuePregDiagDefaults.IncludeNotPregnant := cbIncCowsNot.Checked;
              DuePregDiagDefaults.DoubleSpacing := CheckBox4.Checked;
              DuePregDiagDefaults.BlankEntryForm := CheckBox1.Checked;
              DuePregDiagDefaults.ReportOn := RadioGroup1.ItemIndex;
              DuePregDiagDefaults.DaysAfterCalving := seDaysAfterCalving.AsInteger;
              DuePregDiagDefaults.IncludeNotServed := cbIncludenotServed.Checked;
              DuePregDiagDefaults.SortField := rgOrder.ItemIndex;
              DuePregDiagDefaults.SortOrder := rgSort.ItemIndex;
           finally
              FreeAndNil(DuePregDiagDefaults);
           end;
        end;
     arDueDryOff :
        begin
           DueDryOffDefaults := TDueDryOffDefaults.Create(cRD_DueDryOff);
           try
              DueDryOffDefaults.NoDays := DaysforDryingOff.AsInteger;
              DueDryOffDefaults.DoubleSpacing := DryingDoubleSpace.Checked;
              DueDryOffDefaults.BlankEntryForm := DryingBlank.Checked;
              DueDryOffDefaults.IncludeCows := OlderCows.Checked;
              DueDryOffDefaults.IncludeHeifers := FirstLactCows.Checked;
              DueDryOffDefaults.IncludeNotPregnant := cbIncludeNotPreg.Checked;
              DueDryOffDefaults.SortByDate := SortDryOffDate.Checked;
              DueDryOffDefaults.SortField := rgOrder.ItemIndex;
              DueDryOffDefaults.SortOrder := rgSort.ItemIndex ;
           finally
              FreeAndNil(DueDryOffDefaults);
           end;
        end;
     arDueCalve :
        begin
           DueCalvingDefaults := TDueCalvingDefaults.Create(cRD_DueCalving);
           try
              if DueCalvingDefaults.RestrictToPeriod then
                 begin
                    if ( CalveDateTo.Date > 0 ) and ( CalveDateFrom.Date > 0 ) then
                       DueCalvingDefaults.DateInterval := Trunc(CalveDateTo.Date - CalveDateFrom.Date);
                 end;
              DueCalvingDefaults.DoubleSpacing := DoubleSpace.Checked;
              DueCalvingDefaults.BlankEntryForm := CalveBlank.Checked;
              DueCalvingDefaults.IncludeCows := IncCows.Checked;
              DueCalvingDefaults.IncludeHeifers := IncHeifers.Checked;
              DueCalvingDefaults.IncludeNotPregnant := cbIncludeNOTPD.Checked;
              DueCalvingDefaults.SortByDate := CalveSort.Checked;
           finally
              FreeAndNil(DueCalvingDefaults);
           end;
        end;
   end;
end;

procedure TActionReminderFilter.FormDestroy(Sender: TObject);
begin
   SaveScreenDefaults;
   WinData.cxHint.HideHint;
end;

procedure TActionReminderFilter.cbIncludenotServedClick(Sender: TObject);
begin
   if not cbIncludenotServed.Checked then
      begin
         cbIncCows.Top := 105;
         seDaysAfterCalving.Visible := FALSE;
         lDaysAfterCalving.Visible  := FALSE;
      end
   else
      begin
         cbIncCows.Top := 135;
         seDaysAfterCalving.Visible := True;
         lDaysAfterCalving.Visible  := True;
      end;
   cbIncHeifers.Top := cbIncCows.Top + 20;
   cbIncCowsNot.Top := cbIncHeifers.Top + 20;
end;

procedure TActionReminderFilter.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

end.
