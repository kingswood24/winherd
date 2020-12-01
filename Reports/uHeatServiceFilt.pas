{
  05/01/09 [V3.8 R5.6] /SP Additional Feature - Ability for user to print breeding chart report with Animal No. values only.
                                                   All breeding data should be ommitted.

  01/10/10 [V4.0 R4.9] /MK Additional Feature - Added New Inseminator Field Into the Breeding Chart.
                                              - Added Inseminator To rgBullService.

  27/10/10 [V4.0 R5.1] /MK Bug Fix - uHeatServiceFilt - If Inseminator Blank Error showed.

  15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

  18/06/12 [V5.0 R7.2] /MK Additional Feature - New Procedure To Calc DueServiceDate.
                                              - New RadioGroup To Show Sum Column Items.
                                              - Removed Interval From rgBullService As Interval Added To Report By Default.

  12/07/13 [V5.1 R8.4] /MK Additional Feature - Added Apply Animal Grid Filter check box to the report.

  17/09/13 [V5.2 R1.4] /MK Change - Changed caption of cbIncludeAnimalGridFilter to "Apply Animal Grid Filter".
                                  - If checked then colour should be Blue not Red.

  09/06/14 [V5.3 R1.7] /MK Change - Used separate tables for Heats, Services, PregDiag and Calving event details i.e.
                                    AnimalID, EventDate and LactNo instead of using Events.Filter to speed up the report.

  10/06/14 [V5.3 R1.7] /MK Change - Moved the generation of ConditionScore from a procedure that loops through the table again
                                    into the first loop of the table only if Condition Score is selected in rgIncludeInSumColumn.

  16/07/18 [V5.8 R1.0] /MK Additional Feature - Added Days Since Last Service to the report - Declan O'Meara.
                                              - Could not fit Days Since Last Service in rgIncludeInSumColumn so GL suggested Days Served.

  08/01/20 [V5.9 R1.6] /MK Change - BuildTable - Assign new TBreedingDataHelper.IncludeLeftHerdAnimals the cbIncludeall.Checked to show Calvings of sold animals - Heulwen (Dales).
}

unit uHeatServiceFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DBLookup, ComCtrls, Db,
  DBTables, ToolEdit, RXLookup, RXDBCtrl, RXSpin, Menus, Qrctrls, quickrpt,
  RXCtrls, ToolWin, QRExport, ReportDefaults, kDBRoutines, cxControls,
  cxContainer, cxEdit, cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGroupBox, cxRadioGroup, DateUtil, uBreedingDataHelper;

type
  TfHeatServiceFilt = class(TForm)
    pHeatService: TPanel;
    MyQuery: TQuery;
    MyTable: TTable;
    lDateFrom: TLabel;
    Label5: TLabel;
    LactLabel: TLabel;
    MonthToLabel: TLabel;
    rgDate: TRadioGroup;
    rgSortby: TRadioGroup;
    rgSortOrder: TRadioGroup;
    FromLact: TRxSpinEdit;
    ToLact: TRxSpinEdit;
    rgBullService: TRadioGroup;
    rgShowWhat: TRadioGroup;
    pbCount: TProgressBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdNum: TRxDBLookupCombo;
    cbIncludeall: TCheckBox;
    rgLact: TRadioGroup;
    Query1: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    seConditionScoreFrom: TRxSpinEdit;
    seConditionScoreTo: TRxSpinEdit;
    sbOptions: TRxSpeedButton;
    ToolButton4: TToolButton;
    PopupMenu1: TPopupMenu;
    PrintBlankBreedingChart1: TMenuItem;
    cbFavourite: TcxCheckBox;
    FromDate: TcxDateEdit;
    ToDate: TcxDateEdit;
    cbIncludeAnimalGridFilter: TCheckBox;
    rgIncludeInSumColumn: TRadioGroup;
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure rgDateClick(Sender: TObject);
    procedure LastServiceDate;
    procedure LastHeatDate;
    procedure FormDestroy(Sender: TObject);
    procedure PrintBlankBreedingChart1Click(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FromDatePropertiesChange(Sender: TObject);
    procedure ToDatePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    OutSideHerd : Integer;
    HeatsServicesPDs : THeatsServicesPDs;
    LastHeatDateCalcs,
    LastServiceDateCalcs : Boolean;
    procedure BuildTable;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
    procedure CalcDueServiceDate;
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation
uses
    uHeatServiceScr,
    GenTypesConst,
    DairyData;

var
  fHeatServiceFilt: TfHeatServiceFilt;

{$R *.DFM}

procedure ShowTheForm;
begin
   Application.CreateForm(TfHeatServiceFilt, fHeatServiceFilt);
   try
      fHeatServiceFilt.cbIncludeAnimalGridFilter.Visible := WinData.ActiveFilter;
      fHeatServiceFilt.cbIncludeAnimalGridFilter.Checked := WinData.ActiveFilter;
      if fHeatServiceFilt.cbIncludeAnimalGridFilter.Checked then
         fHeatServiceFilt.cbIncludeAnimalGridFilter.Font.Color := clBlue
      else
         fHeatServiceFilt.cbIncludeAnimalGridFilter.Font.Color := clBlack;

      if not WinData.ExportToPDA then
         fHeatServiceFilt.ShowModal
      else
         begin
            fHeatServiceFilt.sbView.Click;
         end;
   finally
      FreeAndNil(fHeatServiceFilt);
   end;
end;

procedure TfHeatServiceFilt.BuildTable;
var
   i : Integer;
   BullUsed : String;
   HasService,
   HasHeat : Boolean;
   BreedingData : TBreedingDataHelper;
   qGetData : TQuery;
begin
   BreedingData := TBreedingDataHelper.Create();
   try
      //   08/01/20 [V5.9 R1.6] /MK Change - Assign new TBreedingDataHelper.IncludeLeftHerdAnimals the cbIncludeall.Checked to show Calvings of sold animals - Heulwen (Dales).
      BreedingData.IncludeLeftHerdAnimals := cbIncludeall.Checked;
      BreedingData.CreateTempBreedingDataTables;

      with MyTable Do
         try
            Close;
            TableType := ttParadox;
            TableName := 'TempAnimals';
            with FieldDefs do
               begin
                  Clear;
                  Add('ID',ftInteger,0,False);
                  Add('AnimalNo',ftString,10,False);
                  Add('SortAnimalNo',ftString,10,False);
                  Add('LactNo',ftInteger,0,False);
                  Add('CurrLactNo',ftInteger,0,False);   // 23/10/00 KR/SP
                  Add('DateOfBirth',ftDate,0,False);
                  Add('CalvingDate',ftDate,0,False);
                  Add('FirstHeat',ftDate,0,False);
                  Add('SecondHeat',ftDate,0,False);
                  Add('ThirdHeat',ftDate,0,False);
                  Add('FourthHeat',ftDate,0,False);
                  Add('LastHeat',ftDate,0,False);
                  Add('FirstHeatInt',ftInteger,0,False);
                  Add('SecondHeatInt',ftInteger,0,False);
                  Add('ThirdHeatInt',ftInteger,0,False);
                  Add('FirstService',ftDate,0,False);
                  Add('SecondService',ftDate,0,False);
                  Add('ThirdService',ftDate,0,False);
                  Add('FourthService',ftDate,0,False);
                  Add('LastService',ftDate,0,False);
                  Add('FirstBull',ftString,15,False);
                  Add('SecondBull',ftString,15,False);
                  Add('ThirdBull',ftString,15,False);
                  Add('FourthBull',ftString,15,False);
                  Add('FirstInt',ftInteger,0,False);
                  Add('SecondInt',ftInteger,0,False);
                  Add('ThirdInt',ftInteger,0,False);
                  Add('PD',ftString,3,False);
                  Add('IrregularHeat',ftBoolean,0,False);
                  Add('IrregularService',ftBoolean,0,False);
                  Add('PDDate',ftDate,0,False);
                  Add('ConditionScore',ftFloat);
                  Add('Inseminator1',ftString,60,False);
                  Add('Inseminator2',ftString,60,False);
                  Add('Inseminator3',ftString,60,False);
                  Add('Inseminator4',ftString,60,False);
                  Add('DueServiceDate',ftDate,0,False);
                  Add('DaysSinceLastService',ftInteger);

               end;
            CreateTable;
         except
            messagedlg('Cannot create table - close program and try again',mtError,[mbOK],0);
         end;
      try
         MyQuery.SQL.Clear;
         MyQuery.SQL.Add('INSERT INTO TempAnimals (ID, AnimalNo, SortAnimalNo, LactNo,');
         MyQuery.SQL.Add('                         CurrLactNo, DateOfBirth, CalvingDate)');
         MyQuery.SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, E.AnimalLactNo,');
         MyQuery.SQL.Add('                A.LactNo, A.DateOfBirth, E.EventDate');
         MyQuery.SQL.Add('FROM Animals A');
         MyQuery.SQL.Add('LEFT JOIN '+BreedingData.TempCalvings.TableName+' E ON (E.AnimalID = A.ID)');
         {
               MyQuery.SQL.Add('AND (E.EventType='+IntToStr(CCalvingEvent)+'))');
         if (rgLact.ItemIndex = 0) then
            MyQuery.SQL.Add('AND (A.LactNo=E.AnimalLactNo))')
         else
            MyQuery.SQL.Add(')');
         }
         MyQuery.SQL.Add('WHERE ( NOT(A.Herdid='+IntToStr(WinData.NONEHerdID)+') )');
         if (rgLact.ItemIndex = 0) then
            MyQuery.SQL.Add('AND (A.LactNo=E.AnimalLactNo)');
         MyQuery.SQL.Add('AND   (A.Herdid='+HerdNum.Value +')');
         MyQuery.SQL.Add('AND   (A.Sex="Female")');
         MyQuery.SQL.Add('AND   (A.Breeding=TRUE)');
         if NOT cbIncludeall.Checked then
            MyQuery.SQL.Add('AND   (A.InHerd=TRUE)');
         MyQuery.SQL.Add('AND   (A.AnimalDeleted=FALSE)');
         MyQuery.SQL.Add('AND   (A.LactNo BETWEEN '+IntToStr(FromLact.AsInteger)+' AND '+IntToStr(ToLact.AsInteger)+')');
         if ( FromLact.AsInteger = 0 ) then
            MyQuery.SQL.Add('AND (A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle,Now()-365) + '''' + ')');   // 23/10/00 KR/SP Excludes animals younger than a year
         if (rgDate.ItemIndex = 0) and (FromDate.Date <> 0) and (ToDate.Date <> 0) then
            MyQuery.SQL.Add('AND (E.EventDate BETWEEN "' + FormatDateTime(cUSDateStyle,FromDate.Date) + '" AND "' + FormatDateTime(cUSDateStyle,ToDate.Date) + '")');

         if ( cbIncludeAnimalGridFilter.Checked ) then
            begin
               MyQuery.SQL.Add('AND (A.ID IN (SELECT AF.AID FROM AFilters AF))');
            end;

         MyQuery.SQL.Add('GROUP BY A.ID, A.AnimalNo, A.SortAnimalNo, E.AnimalLactNo, A.LactNo, A.DateOfBirth, E.EventDate');

         MyQuery.ExecSQL;
         //if (rgDate.ItemIndex = 0) and (FromDate.Date = 0) and (ToDate.Date = 0) then
         //   MyQuery.SQL.Add('AND (A.LactNo=E.AnimalLactNo))')
         //else
         //   MyQuery.SQL.Add(')');
      finally
         MyQuery.Close;     // Altered to allow previous lactations - kr/sp - 23/10/00
      end;

      Query1.SQL.Clear;
      Query1.SQL.Add('SELECT Max(E.EventDate) PDDate');
      Query1.SQL.Add('FROM '+BreedingData.TempPregDiag.TableName+' E');
      Query1.SQL.Add('WHERE AnimalID = :AID');
      Query1.SQL.Add('AND EventDate Between :AFromDate AND :AToDate');

      // Find Heat Record for these Animals
      try
         with MyTable do
            begin
               Open;
               First;
               // Set the gauge range
               pbCount.Show;
               pbCount.Min := 0;
               pbCount.Max := RecordCount;
               pbCount.Position := 0;

               qGetData := TQuery.Create(nil);
               qGetData.DatabaseName := AliasName;

               while NOT EOF do
                  begin
                     Edit;
                     Query1.Close;
                     Query1.Params[0].AsInteger := FieldByName('ID').AsInteger;
                     Query1.Params[1].AsDateTime := FromDate.Date;
                     Query1.Params[2].AsDateTime := ToDate.Date;
                     Query1.Open;
                     try
                        Query1.First;
                        FieldByName('PDDate').AsDateTime := Query1.FieldByName('PDDate').AsDateTime;
                     finally
                        Query1.Close;
                     end;

                     // make Null lactations = current lactation
                     if FieldByName('LactNo').IsNull then  // 23/10/00 KR/SP Fix to bring in non-calved animals with lactno greater than (0)
                        FieldByName('LactNo').AsInteger := FieldByName('CurrLactNo').AsInteger;
                     HasHeat := FALSE;
                     HasService := FALSE;
                     // Find the Bulling Events for this Animal
                     {
                     WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CBullingEvent) + ')';
                     WinData.CheckEvents.Filtered := True;
                     if WinData.CheckEvents.RecordCount >= 4 then
                        i := 4
                     else
                        i := WinData.CheckEvents.RecordCount;
             //        if WinData.CheckEvents.RecordCount > 0 then
               //         begin
                      WinData.CheckEvents.Last;
                      }

                     qGetData.Close;
                     qGetData.SQL.Clear;
                     qGetData.SQL.Add('SELECT EventID, EventDate');
                     qGetData.SQL.Add('FROM '+BreedingData.TempBullings.TableName+'');
                     qGetData.SQL.Add('WHERE AnimalID = :AnimalID');
                     qGetData.SQL.Add('AND AnimalLactNo = :AAnimalLactNo');
                     qGetData.SQL.Add('ORDER BY EventDate');
                     qGetData.Params[0].AsInteger := MyTable.FieldByName('Id').AsInteger;
                     qGetData.Params[1].AsInteger := MyTable.FieldByName('LactNo').AsInteger;
                     try
                        qGetData.Open;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                     if qGetData.RecordCount >= 4 then
                        i := 4
                     else
                        i := qGetData.RecordCount;
                     qGetData.Last;

                     FieldByName('IrregularHeat').AsBoolean := FALSE;
                     //while ( NOT WinData.CheckEvents.BOF ) And ( i > 0 ) do
                     while ( NOT qGetData.BOF ) And ( i > 0 ) do
                         begin
                            HasHeat := TRUE;

                          case i of
                             1 : begin
                                    //FieldByName('FirstHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                    FieldByName('FirstHeat').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                    if FieldByName('SecondHeat').AsDateTime > 0 then
                                       begin
                                          FieldByName('FirstHeatInt').Value := FieldByName('SecondHeat').AsDateTime-FieldByName('FirstHeat').AsDateTime;
                                          if NOT ( FieldByName('FirstHeatInt').AsInteger in [18..24] ) then
                                             FieldByName('IrregularHeat').AsBoolean := TRUE;
                                       end;
                                 end;
                             2 : begin
                                    //FieldByName('SecondHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                    FieldByName('SecondHeat').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                    if FieldByName('ThirdHeat').AsDateTime > 0 then
                                       begin
                                          FieldByName('SecondHeatInt').Value := FieldByName('ThirdHeat').AsDateTime-FieldByName('SecondHeat').AsDateTime;
                                          if NOT ( FieldByName('SecondHeatInt').AsInteger in [18..24] ) then
                                             FieldByName('IrregularHeat').AsBoolean := TRUE;
                                       end;
                                 end;
                             3 : begin
                                    //FieldByName('ThirdHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                    FieldByName('ThirdHeat').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                    if FieldByName('FourthHeat').AsDateTime > 0 then
                                       begin
                                          FieldByName('ThirdHeatInt').Value := FieldByName('ThirdHeat').AsDateTime-FieldByName('FourthHeat').AsDateTime;
                                          if NOT ( FieldByName('ThirdHeatInt').AsInteger in [18..24] ) then
                                             FieldByName('IrregularHeat').AsBoolean := TRUE;
                                       end;
                                 end;
                             //4 : FieldByName('FourthHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                             4 : FieldByName('FourthHeat').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                          end;
                          Dec(i);
                          //WinData.CheckEvents.Prior;
                          qGetData.Prior;
                       end;

                     // Clear the Filter
                     {
                     WinData.CheckEvents.Filter := '';
                     WinData.CheckEvents.Filtered := False;
                     // Find the Service Events for this Animal
                     WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                     WinData.CheckEvents.Filtered := True;
                     if WinData.CheckEvents.RecordCount >= 4 then
                        i := 4
                     else
                        i := WinData.CheckEvents.RecordCount;
                     WinData.CheckEvents.Last;
                     }
                     qGetData.Close;
                     qGetData.SQL.Clear;
                     qGetData.SQL.Add('SELECT EventID, EventDate');
                     qGetData.SQL.Add('FROM '+BreedingData.TempServices.TableName+'');
                     qGetData.SQL.Add('WHERE AnimalID = :AnimalID');
                     qGetData.SQL.Add('AND AnimalLactNo = :AAnimalLactNo');
                     qGetData.SQL.Add('ORDER BY EventDate');
                     qGetData.Params[0].AsInteger := MyTable.FieldByName('Id').AsInteger;
                     qGetData.Params[1].AsInteger := MyTable.FieldByName('LactNo').AsInteger;
                     try
                        qGetData.Open;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                     if qGetData.RecordCount >= 4 then
                        i := 4
                     else
                        i := qGetData.RecordCount;
                     qGetData.Last;

                     FieldByName('IrregularService').AsBoolean := FALSE;
                     //while ( NOT WinData.CheckEvents.BOF ) And ( i > 0 ) do
                     while ( NOT qGetData.BOF ) And ( i > 0 ) do
                        begin
                           HasService := TRUE;
                           // Get the Bull Used
                           BullUsed := '';
                           //if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                           if WinData.LookUpServices.Locate('EventID',qGetData.FieldByName('EventID').AsInteger,[]) then
                              if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                                 BullUsed := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                           case i of
                               1 : begin
                                     //FieldByName('FirstService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                     FieldByName('FirstService').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                     FieldByName('FirstBull').AsString := BullUsed;
                                     //if ( WinData.LookupServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) ) then
                                     if ( WinData.LookupServices.Locate('EventID',qGetData.FieldByName('EventID').AsInteger,[]) ) then
                                        begin
                                           if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('Technician').AsInteger,[]) then
                                              FieldByName('Inseminator1').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                        end;

                                     if FieldByName('SecondService').AsDateTime > 0 then
                                        begin
                                           FieldByName('FirstInt').Value := FieldByName('SecondService').AsDateTime-FieldByName('FirstService').AsDateTime;
                                           if NOT ( FieldByName('FirstInt').AsInteger in [18..24] ) then
                                              FieldByName('IrregularService').AsBoolean := TRUE;
                                        end;
                                  end;
                              2 : begin
                                     //FieldByName('SecondService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                     FieldByName('SecondService').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                     FieldByName('SecondBull').AsString := BullUsed;
                                     //if ( WinData.LookupServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) ) then
                                     if ( WinData.LookupServices.Locate('EventID',qGetData.FieldByName('EventID').AsInteger,[]) ) then
                                        begin
                                           if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('Technician').AsInteger,[]) then
                                              FieldByName('Inseminator2').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                        end;

                                     if FieldByName('ThirdService').AsDateTime > 0 then
                                        begin
                                           FieldByName('SecondInt').Value := FieldByName('ThirdService').AsDateTime-FieldByName('SecondService').AsDateTime;
                                           if NOT ( FieldByName('SecondInt').AsInteger in [18..24] ) then
                                              FieldByName('IrregularService').AsBoolean := TRUE;
                                        end;
                                  end;
                              3 : begin
                                     //FieldByName('ThirdService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                     FieldByName('ThirdService').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                     FieldByName('ThirdBull').AsString := BullUsed;
                                     //if ( WinData.LookupServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) ) then
                                     if ( WinData.LookupServices.Locate('EventID',qGetData.FieldByName('EventID').AsInteger,[]) ) then
                                        begin
                                           if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('Technician').AsInteger,[]) then
                                              FieldByName('Inseminator3').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                        end;

                                     if FieldByName('FourthService').AsDateTime > 0 then
                                        begin
                                           FieldByName('ThirdInt').Value := FieldByName('FourthService').AsDateTime-FieldByName('ThirdService').AsDateTime;
                                           if NOT ( FieldByName('ThirdInt').AsInteger in [18..24] ) then
                                              FieldByName('IrregularService').AsBoolean := TRUE;
                                        end;
                                  end;
                              4 : begin
                                     //FieldByName('FourthService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                     FieldByName('FourthService').AsDateTime := qGetData.FieldByName('EventDate').AsDateTime;
                                     FieldByName('FourthBull').AsString := BullUsed;
                                     //if ( WinData.LookupServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) ) then
                                     if ( WinData.LookupServices.Locate('EventID',qGetData.FieldByName('EventID').AsInteger,[]) ) then
                                        begin
                                           if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('Technician').AsInteger,[]) then
                                              FieldByName('Inseminator4').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                        end;
                                  end;
                           end;
                        Dec(i);
                        //WinData.CheckEvents.Prior;
                        qGetData.Prior;
                     end;

                     // Clear the Filter
                     //WinData.CheckEvents.Filter := '';
                     BreedingData.TempPregDiag.Filter := '';
                     //WinData.CheckEvents.Filtered := False;
                     BreedingData.TempPregDiag.Filtered := False;
                     // Check if they are PD
                     FieldByName('PD').AsString := '';
                     //if Windata.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType', VarArrayOf([FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger,cPregDiagEvent]), [] )  then
                     if BreedingData.TempPregDiag.Locate('AnimalID;AnimalLactNo', VarArrayOf([FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger]), [] )  then
                        //if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                        if WinData.LookUpPDs.Locate('EventID',BreedingData.TempPregDiag.FieldByName('EventID').AsInteger,[]) then
                           if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                              FieldByName('PD').AsString := 'Yes'
                           else
                              FieldByName('PD').AsString := 'No';

                     if ( rgIncludeInSumColumn.ItemIndex = 3 ) then
                        MyTable.FieldByName('ConditionScore').AsFloat := GetConditionScore(MyTable.FieldByName('ID').AsInteger, MyTable.FieldByName('LactNo').AsInteger);

                     Next;

                     pbCount.Position := pbCount.Position + 1;
                  end;

               //   15/06/12 [V5.0 R7.2] /MK Additional Feature - Create Last Heat And Service Dates.
               if ( rgIncludeInSumColumn.ItemIndex in [0,1] ) then
                   begin
                      LastHeatDate;
                      LastServiceDate;
                      CalcDueServiceDate;
                   end;

               FreeAndNil(qGetData);
            end;
      finally
         // Delete any Animals outside the Service/Heat Dates if selected
         if ( rgDate.ItemIndex in [1,2,3] ) and
            ( FromDate.Date > 0 ) and ( ToDate.Date > 0 ) then
            begin
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('DELETE FROM TempAnimals');
               if rgDate.ItemIndex = 1 then  // Use Date range as Heats Date
                  begin
                     MyQuery.SQL.Add('WHERE NOT ( FirstHeat Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' );
                     MyQuery.SQL.Add('Or    SecondHeat Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''');
                     MyQuery.SQL.Add('Or    ThirdHeat Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''');
                     MyQuery.SQL.Add('Or    FourthHeat Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' +')');
                  end
               else if rgDate.ItemIndex = 2 then  // Use Date range as Service Date
                  begin
                     MyQuery.SQL.Add('WHERE NOT ( FirstService Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' );
                     MyQuery.SQL.Add('Or    SecondService Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''');
                     MyQuery.SQL.Add('Or    ThirdService Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''');
                     MyQuery.SQL.Add('Or    FourthService Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' +')');
                  end
               else if rgDate.ItemIndex = 3 then  // Use Date range as PD Date
                  begin
                     MyQuery.SQL.Add('WHERE NOT ( PDDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' );
                     MyQuery.SQL.Add('AND ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                  end;
               MyQuery.ExecSQL;
            end;
         // Hide the progressbar

   {
         MyQuery.SQL.Clear;
         MyQuery.SQL.Add('DELETE FROM TempAnimals');
         MyQuery.SQL.Add('WHERE NOT ( ConditionScore Between ' + seConditionScoreFrom.Text + ' AND ' + seConditionScoreTo.Text + ')' );
         MyQuery.ExecSQL;
         remove for the time being - GL - 26/10/06
   }
         pbCount.Hide;
      end;
   finally
      FreeAndNil(BreedingData);
   end;
end;

procedure TfHeatServiceFilt.ViewBtnClick(Sender: TObject);
begin
   if (( FromDate.Date = 0 ) And ( ToDate.Date > 0 )) or
      (( FromDate.Date > 0 ) And ( ToDate.Date = 0 )) or
      (ToDate.Date > FromDate.Date + 366) then
      MessageDLG('You must enter Date from and to,'+#13+
                 'and not more than one year apart.',mtInformation,[mbOk],0)
   else
     try
        sbView.Enabled := FALSE;
        sbPrint.Enabled := FALSE;

        // Create and insert all info. into TEMP table
        BuildTable;
        // Create the Report Object
        fHeatServiceScr := TfHeatServiceScr.Create(nil);
        with fHeatServiceScr do
           begin
              // Set the Datafield name depending on user selection
              if rgBullService.ItemIndex = 0 then  // Use the Bull Codes
                 begin
                    qrdbFirstBull.DataField := 'FirstBull';
                    qrdbSecondBull.DataField := 'SecondBull';
                    qrdbThirdBull.DataField := 'ThirdBull';
                    qrdbFourthBull.DataField := 'FourthBull';
                 end
              else if rgBullService.ItemIndex = 1 then
                 begin
                    qrdbFirstBull.DataField := 'Inseminator1';
                    qrdbSecondBull.DataField := 'Inseminator2';
                    qrdbThirdBull.DataField := 'Inseminator3';
                    qrdbFourthBull.DataField := 'Inseminator4';
                 end;

              lSumCol.Caption := '';
              qrdbSumCol.DataField := '';
              if ( rgIncludeInSumColumn.ItemIndex = 0 ) then
                 begin
                    lSumCol.Caption := 'Due Service';
                    qrdbSumCol.DataField := 'DueServiceDate';
                    qrdbSumCol.Mask := 'dd/MM/yy';
                 end
              else if ( rgIncludeInSumColumn.ItemIndex = 1 ) then
                 begin
                    lSumCol.Caption := 'Days'+cCRLF+'Served';
                    qrdbSumCol.DataField := 'DaysSinceLastService';
                 end
              else if ( rgIncludeInSumColumn.ItemIndex = 2 ) then
                 begin
                    lSumCol.Caption := 'Preg.'+cCRLF+'Diag.';
                    qrdbSumCol.DataField := 'PD';
                 end
              else if ( rgIncludeInSumColumn.ItemIndex = 3 ) then
                 begin
                    lSumCol.Caption := 'Cond.'+cCRLF+'Score';
                    qrdbSumCol.DataField := 'ConditionScore';
                    qrdbSumCol.Mask := '#.0';
                    qrdbSumCol.Alignment := taLeftJustify;
                 end;

              // Open the Query
              qHeatService.SQL.Clear;
              qHeatService.SQL.Add('SELECT * FROM TempAnimals');
              // Sort By
              if rgSortBy.ItemIndex = 0 then
                 begin
                    qHeatService.SQL.Add('ORDER BY SortAnimalNo');
                    fHeatServiceScr.SortedByLabel.Caption := 'Cow No';
                 end
              else if rgSortBy.ItemIndex = 1 then
                 begin
                    qHeatService.SQL.Add('ORDER BY CalvingDate');
                    fHeatServiceScr.SortedByLabel.Caption := 'Calving Date';
                 end
              else if rgSortBy.ItemIndex = 2 then
                 begin
                    qHeatService.SQL.Add('ORDER BY PD, SortAnimalNo'); //JT 5/6/2002
                    fHeatServiceScr.SortedByLabel.Caption := 'PD''d';
                 end
              else if rgSortBy.ItemIndex = 3 then
                 begin
                    LastServiceDate;
                    qHeatService.SQL.Add('ORDER BY FirstService');
                    fHeatServiceScr.SortedByLabel.Caption := 'First Service Date';
                 end
              else if rgSortBy.ItemIndex = 4 then
                 begin
                    LastServiceDate;
                    qHeatService.SQL.Add('ORDER BY LastService'); //JT 30/03/2004
                    fHeatServiceScr.SortedByLabel.Caption := 'Last Service Date';
                 end
              else if rgSortBy.ItemIndex = 5 then
                 begin
                    LastHeatDate;
                    qHeatService.SQL.Add('ORDER BY LastHeat'); //JT 30/03/2004
                    fHeatServiceScr.SortedByLabel.Caption := 'Heat Date';
                 end;
              // Sort Order
              if rgSortOrder.ItemIndex = 0 then
                 begin
                    qHeatService.SQL.Add('asc');
                    fHeatServiceScr.OrderLabel.Caption := 'Ascending';
                 end
              else if rgSortOrder.ItemIndex = 1 then
                 begin
                    qHeatService.SQL.Add('desc');
                    fHeatServiceScr.OrderLabel.Caption := 'Descending';
                 end;

              // Set up the Report Headings
              case rgDate.ItemIndex of
                 0 : fHeatServiceScr.qrDateText.Caption := 'Calving';
                 1 : fHeatServiceScr.qrDateText.Caption := 'Heat';
                 2 : fHeatServiceScr.qrDateText.Caption := 'Service';
              end;

              if rgBullService.ItemIndex = 0 then
                 fHeatServiceScr.qrShowIntOrBull.Caption := 'Services (Intervals / Bulls Used)'
              else
                 fHeatServiceScr.qrShowIntOrBull.Caption := 'Services (Intervals / Inseminator)';

              if FromDate.Date > 0 then
                 fHeatServiceScr.qrFromDate.Caption := DateToStr(FromDate.Date)
              else
                 fHeatServiceScr.qrFromDate.Caption := ' ';
              if ToDate.Date > 0 then
                 fHeatServiceScr.qrToDate.Caption   := DateToStr(ToDate.Date)
              else
                 fHeatServiceScr.qrToDate.Caption := ' ';
              fHeatServiceScr.qrLactfrom.Caption := IntToStr(FromLact.AsInteger);
              fHeatServiceScr.qrLactTo.Caption := IntToStr(ToLact.AsInteger);

              // Set the Showwhat value in the Report object to allow
              // Irregular Heats or services only be printed
              fHeatServiceScr.ShowWhat := rgShowWhat.ItemIndex;
              case rgShowWhat.ItemIndex of
                 0 : fHeatServiceScr.qrshowwhat.Caption := 'All Heats/Services';
                 1 : fHeatServiceScr.qrshowwhat.Caption := 'Irregular Heats ( outside 18 to 24 days)';
                 2 : fHeatServiceScr.qrshowwhat.Caption := 'Irregular Services ( outside 18 to 24 days)';
              end;

              // Open the Query to build the Report
              qHeatService.Open;

              //   18/06/12 [V5.0 R7.2] /MK Bug Fix -  Added Information Message If No Records Found.
              if ( qHeatService.RecordCount <= 0 ) then
                 MessageDlg('No records have been found',mtInformation,[mbOK],0)
              else
                 begin
                    if not WinData.ExportToPDA then
                       begin
                          if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                             begin
                                fHeatServiceScr.Preview;
                                fHeatServiceScr.PrintingReport := FALSE;
                             end
                          else
                             begin
                                // if printing set the colour of the detail line to black
                                fHeatServiceScr.Detail.Font.Color := clBlack;
                                fHeatServiceScr.PrintingReport := TRUE;
                                Windata.CallPrintDialog(fHeatServiceScr);
                             end;
                       end
                    else
                       begin
                          WinData.PDALinkExport.ExportReport( fHeatServiceScr );
                       end;
                 end;
           end;
     finally
        // Close/Delete the Temporary Table
        MyTable.Close;
        MyTable.DeleteTable;
        // Free the Report Object
        fHeatServiceScr.Free;
        sbView.Enabled := TRUE;
        sbPrint.Enabled := TRUE;
     end;
End;

procedure TfHeatServiceFilt.FormShow(Sender: TObject);
begin
   HerdNum.Value := IntToStr(WinData.UserDefaultHerdID);
   // Set the Date to use to Calving
   rgDateClick(Sender);
   LoadScreenDefaults;

   //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cBreedingChartRep);
   WinData.UpdateRecentReportUsage(cBreedingChartRep);
end;

procedure TfHeatServiceFilt.ExitBtnClick(Sender: TObject);
var
   i : Integer;
begin
   Close;
end;

procedure TfHeatServiceFilt.rgDateClick(Sender: TObject);
begin
   if rgDate.ItemIndex = 0 then
      lDateFrom.Caption := 'Calving Date From'
   else if rgDate.ItemIndex = 1 then
      lDateFrom.Caption := 'Heat Date From'
   else if rgDate.ItemIndex = 2 then
      lDateFrom.Caption := 'Service Date From'
   else if rgDate.ItemIndex = 3 then
      lDateFrom.Caption := 'PD Date From';
end;

{
      // altered to allow previous lactations - kr/sp - 2/8/00
      // and again to work properly - kr/sp - 20/10/00
      MyQuery.SQL.Add('INSERT INTO TempAnimals (ID, AnimalNo, SortAnimalNo,');
      MyQuery.SQL.Add('                         LactNo, CalvingDate, PDDate)');
      MyQuery.SQL.Add('SELECT DISTINCT ID, AnimalNo, SortAnimalNo,');
      MyQuery.SQL.Add('                E.AnimalLactNo, E.EventDate,E2.EventDate');
      MyQuery.SQL.Add('FROM Animals A');
      MyQuery.SQL.Add('LEFT JOIN Events E ON (E.AnimalID=A.ID) And (E.EventType='+IntToStr(CCalvingEvent) + ')');
      if (rgDate.ItemIndex = 0) and (FromDate.Date = 0) and (ToDate.Date = 0) then
         MyQuery.SQL.Add('AND (A.LactNo=E.AnimalLactNo)');
      MyQuery.SQL.Add('LEFT JOIN Events E2 ON (A.ID=E2.AnimalID) And (E2.AnimalLactNo=E.AnimalLactNo) And (E2.EventType='+IntToStr(CPregDiagEvent) + ')');
      MyQuery.SQL.Add('WHERE NOT (A.Herdid = ' + IntToStr(WinData.NONEHerdID) +')');
      MyQuery.SQL.Add('AND (A.Herdid = ' + HerdNum.Value +')');
      MyQuery.SQL.Add('AND (A.Sex="Female")');
      MyQuery.SQL.Add('AND (A.Breeding=TRUE)');
      MyQuery.SQL.Add('AND (A.InHerd=TRUE)');
      MyQuery.SQL.Add('AND (A.AnimalDeleted=FALSE)');
      MyQuery.SQL.Add('AND (A.LactNo BETWEEN ' + IntToStr(FromLact.AsInteger) + ' AND ' + IntToStr(ToLact.AsInteger) + ')');
      if ( FromLact.AsInteger = 0 ) then
         MyQuery.SQL.Add('AND (A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle,Now()-365) + '''' + ')');
      if (rgDate.ItemIndex = 0) and (FromDate.Date <> 0) and (ToDate.Date <> 0) then
         MyQuery.SQL.Add('AND (E.EventDate BETWEEN "' + FormatDateTime(cUSDateStyle,FromDate.Date) + '" AND "' + FormatDateTime(cUSDateStyle,ToDate.Date) + '")');
}

procedure TfHeatServiceFilt.LastServiceDate;
begin
   with MyTable do
      begin
         LastServiceDateCalcs := False;
         First;
         while not(MyTable.eof) do
            begin
               Edit;
               if not(LastServiceDateCalcs) then
                  begin
                     if MyTable.FieldByName('FourthService').AsDateTime > 0 then
                        MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('FourthService').AsDateTime
                     else if MyTable.FieldByName('ThirdService').AsDateTime > 0 then
                        MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('ThirdService').AsDateTime
                     else if MyTable.FieldByName('SecondService').AsDateTime > 0 then
                        MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('SecondService').AsDateTime
                     else if MyTable.FieldByName('FirstService').AsDateTime > 0 then
                        MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('FirstService').AsDateTime
                     else
                        MyTable.FieldByName('LastService').AsDateTime := 0;

                     if ( MyTable.FieldByName('LastService').AsDateTime > 0 ) and
                        ( MyTable.FieldByName('LastService').AsDateTime < Date ) then
                        MyTable.FieldByName('DaysSinceLastService').AsInteger := Trunc(Date - MyTable.FieldByName('LastService').AsDateTime);

                     Next;
                  end;
            end;
         LastServiceDateCalcs := True;
      end;
end;

procedure TfHeatServiceFilt.LastHeatDate;
begin
   with MyTable do
      begin
         LastHeatDateCalcs := False;
         First;
         while not(MyTable.eof) do
            begin
               Edit;
               //if MyTable.FieldByName('FourthHeat').AsDateTime > 0 then
                  //MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('FourthHeat').AsDateTime
               if not(LastHeatDateCalcs) then
                  begin
                     if MyTable.FieldByName('ThirdHeat').AsDateTime > 0 then
                        MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('ThirdHeat').AsDateTime
                     else if MyTable.FieldByName('SecondHeat').AsDateTime > 0 then
                        MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('SecondHeat').AsDateTime
                     else if MyTable.FieldByName('FirstHeat').AsDateTime > 0 then
                        MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('FirstHeat').AsDateTime
                     else MyTable.FieldByName('LastHeat').AsDateTime := 0;
                     Next;
                  end;
            end;
         LastHeatDateCalcs := True;
      end;
end;

procedure TfHeatServiceFilt.LoadScreenDefaults;
var
   LR : TIntRange;
begin
   HeatsServicesPDs := THeatsServicesPDs.Create(cRD_HeatsServicesPDs);
   try
      cbIncludeall.Checked := HeatsServicesPDs.IncludeLeftHerd;
      rgLact.ItemIndex := HeatsServicesPDs.IncLactation;
      rgDate.ItemIndex := HeatsServicesPDs.DateRefers;
      rgShowWhat.ItemIndex := HeatsServicesPDs.ShowIrregular;
      rgBullService.ItemIndex := HeatsServicesPDs.IncServices;
      //   18/06/12 [V5.0 R7.2] /MK Additional Feature - New Report Default For rgIncludeInSumColumn.
      rgIncludeInSumColumn.ItemIndex := HeatsServicesPDs.IncSumColumn;
      LR := HeatsServicesPDs.LactRange;
      FromLact.AsInteger := LR.IntFrom;
      if LR.IntTo = 0 then
         ToLact.AsInteger := 30
      else
         ToLact.AsInteger := LR.IntTo;
      rgSortby.ItemIndex := HeatsServicesPDs.SortField;
      rgSortOrder.ItemIndex := HeatsServicesPDs.SortOrder;
      if HeatsServicesPDs.DateInterval > 0 then
         FromDate.Date := Trunc(Date - HeatsServicesPDs.DateInterval)
      else
         begin
            FromDate.Date := IncYear(Date,-1);
            ToDate.Date := Date;
         end;
   finally
      FreeAndNil(HeatsServicesPDs);
   end;
end;

procedure TfHeatServiceFilt.SaveScreenDefaults;
var
   LR : TIntRange;
begin
   HeatsServicesPDs := THeatsServicesPDs.Create(cRD_HeatsServicesPDs);
   try
      HeatsServicesPDs.IncludeLeftHerd := cbIncludeall.Checked;
      HeatsServicesPDs.IncLactation := rgLact.ItemIndex;
      HeatsServicesPDs.DateRefers := rgDate.ItemIndex;
      HeatsServicesPDs.ShowIrregular := rgShowWhat.ItemIndex;
      HeatsServicesPDs.IncServices := rgBullService.ItemIndex;
      HeatsServicesPDs.SortField := rgSortby.ItemIndex;
      HeatsServicesPDs.SortOrder := rgSortOrder.ItemIndex;
      //   18/06/12 [V5.0 R7.2] /MK Additional Feature - New Report Default For rgIncludeInSumColumn.
      HeatsServicesPDs.IncSumColumn := rgIncludeInSumColumn.ItemIndex;
      LR.IntFrom := FromLact.AsInteger;
      LR.IntTo   := ToLact.AsInteger;
      HeatsServicesPDs.LactRange := LR;
      if ( FromDate.Date > 0 ) and ( ToDate.Date > 0 ) then
         HeatsServicesPDs.DateInterval := Trunc(ToDate.Date - FromDate.Date);
   finally
      FreeAndNil(HeatsServicesPDs);
   end;
end;

procedure TfHeatServiceFilt.FormDestroy(Sender: TObject);
begin
   SaveScreenDefaults;
end;

procedure TfHeatServiceFilt.PrintBlankBreedingChart1Click(Sender: TObject);
begin
   TfHeatServiceScr.PrintBlank(HerdNum.KeyValue);
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfHeatServiceFilt.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cBreedingChartRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cBreedingChartRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfHeatServiceFilt.FromDatePropertiesChange(Sender: TObject);
begin
   if (FromDate.Date > 0) then
      ToDate.Date := FromDate.Date + 366;
end;

procedure TfHeatServiceFilt.ToDatePropertiesChange(Sender: TObject);
begin
   if (ToDate.Date > FromDate.Date + 366) then
      begin
         ToDate.SetFocus;
         messagedlg('The To Date must not be more than'+#13+
                    'one year after the From Date.',mtError,[mbOK],0);
      end;
end;

//   18/06/12 [V5.0 R7.2] /MK Additional Feature - New Procedure To Calc DueServiceDate.
procedure TfHeatServiceFilt.CalcDueServiceDate;
const
   XTarget  = 730;
   BullGest = 283;
   DaysFirstService = 42;
var
   dLastCalvingDate,
   dLastHeatDate,
   dLastServiceDate,
   dDueServiceDate : TDateTime;
   iAnimalLactNo : Integer;
begin
   if ( not(MyTable.Active) ) then
      MyTable.Active := True;

   with MyTable do
      begin
         First;
         while not Eof do
            begin
               // Set All Vars To 0.
               iAnimalLactNo := 0;
               dLastCalvingDate := 0;
               dLastHeatDate := 0;
               dLastServiceDate := 0;

               dLastCalvingDate := MyTable.FieldByName('CalvingDate').AsDateTime;
               dLastHeatDate := MyTable.FieldByName('LastHeat').AsDateTime;
               dLastServiceDate := MyTable.FieldByName('LastService').AsDateTime;
               iAnimalLactNo := MyTable.FieldByName('CurrLactNo').AsInteger;

               Edit;
               if ( dLastServiceDate > 0 ) or ( dLastHeatDate > 0 ) then
                  begin
                     if dLastServiceDate > dLastHeatDate then
                        begin
                           dDueServiceDate := dLastServiceDate + 21;
                           MyTable.FieldByName('DueServiceDate').AsDateTime := dDueServiceDate;
                        end
                     else
                        begin
                           dDueServiceDate := dLastHeatDate + 21;
                           MyTable.FieldByName('DueServiceDate').AsDateTime := dDueServiceDate
                        end;
                  end;
               {
               //   18/06/12 [V5.0 R7.2] /MK Change - GL - Only Calc DueServiceDate If Service or Heat Events Exist.
                     else
                        if ( dLastCalvingDate > 0 ) then
                           begin
                              dDueServiceDate := dLastCalvingDate + DaysFirstService;
                              MyTable.FieldByName('DueServiceDate').AsDateTime := dDueServiceDate;
                           end;
                  end;
               else
                  begin
                     dDueServiceDate := MyTable.FieldByName('DateOfBirth').AsDateTime + XTarget - BullGest;
                     MyTable.FieldByName('DueServiceDate').AsDateTime := dDueServiceDate;
                  end;
               }
               Post;
               Next;
            end;
      end;
end;

end.
