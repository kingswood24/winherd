{

  05/01/2009 [V3.8 R 5.6] /SP : Additional Feature - Ability for user to print breeding chart report with Animal No. values only.
                            All breeding data should be ommitted.


}
unit uHeatServiceFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DBLookup, ComCtrls, Db,
  DBTables, ToolEdit, RXLookup, RXDBCtrl, RXSpin, Menus, Qrctrls, quickrpt,
  RXCtrls, ToolWin, QRExport, ReportDefaults, kDBRoutines;

type
  TfHeatServiceFilt = class(TForm)
    pHeatService: TPanel;
    MyQuery: TQuery;
    MyTable: TTable;
    lDateFrom: TLabel;
    Label5: TLabel;
    LactLabel: TLabel;
    MonthToLabel: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
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
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    Query1: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    seConditionScoreFrom: TRxSpinEdit;
    seConditionScoreTo: TRxSpinEdit;
    sbOptions: TRxSpeedButton;
    ToolButton4: TToolButton;
    PopupMenu1: TPopupMenu;
    PrintBlankBreedingChart1: TMenuItem;
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure rgDateClick(Sender: TObject);
    procedure FromDateExit(Sender: TObject);
    procedure ToDateExit(Sender: TObject);
    procedure LastServiceDate;
    procedure LastHeatDate;
    procedure GetConditionScores;
    procedure FormDestroy(Sender: TObject);
    procedure PrintBlankBreedingChart1Click(Sender: TObject);
  private
    { Private declarations }
    OutSideHerd : Integer;
    HeatsServicesPDs : THeatsServicesPDs;
    procedure BuildTable;
    procedure LoadScreenDefaults;
    procedure SaveScreenDefaults;
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

Procedure TfHeatServiceFilt.BuildTable;
Var
   i          : Integer;
   BullUsed   : String;
   HasService,
   HasHeat    : Boolean;
Begin
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

            end;
         CreateTable;
      except
         messagedlg('Cannot create table - close program and try again',mtError,[mbOK],0);
      end;
   try
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('INSERT INTO TempAnimals (ID, AnimalNo, SortAnimalNo,');
      MyQuery.SQL.Add('                         LactNo, CurrLactNo, CalvingDate)');
      MyQuery.SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, E.AnimalLactNo,');
      MyQuery.SQL.Add('                A.LactNo, E.EventDate');
      MyQuery.SQL.Add('FROM Animals A');
      MyQuery.SQL.Add('LEFT JOIN Events E ON ((E.AnimalID=A.ID)');
      MyQuery.SQL.Add('AND (E.EventType='+IntToStr(CCalvingEvent)+')');
      if (rgLact.ItemIndex = 0) then
         MyQuery.SQL.Add('AND (A.LactNo=E.AnimalLactNo))')
      else
         MyQuery.SQL.Add(')');
      MyQuery.SQL.Add('WHERE (NOT (A.Herdid='+IntToStr(WinData.NONEHerdID)+'))');
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
      MyQuery.SQL.Add('GROUP BY A.ID, A.AnimalNo, A.SortAnimalNo, E.AnimalLactNo, A.LactNo, E.EventDate');
      MyQuery.ExecSQL;
      //if (rgDate.ItemIndex = 0) and (FromDate.Date = 0) and (ToDate.Date = 0) then
      //   MyQuery.SQL.Add('AND (A.LactNo=E.AnimalLactNo))')
      //else
      //   MyQuery.SQL.Add(')');
   finally
      MyQuery.Close;     // Altered to allow previous lactations - kr/sp - 23/10/00
   end;
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
                  WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(FieldByName('Id').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CBullingEvent) + ')';
                  WinData.CheckEvents.Filtered := True;
                  if WinData.CheckEvents.RecordCount >= 4 then
                     i := 4
                  else
                     i := WinData.CheckEvents.RecordCount;
          //        if WinData.CheckEvents.RecordCount > 0 then
            //         begin
                   WinData.CheckEvents.Last;
                   FieldByName('IrregularHeat').AsBoolean := FALSE;
                   while ( NOT WinData.CheckEvents.BOF ) And ( i > 0 ) do
                       begin
                          HasHeat := TRUE;
                        case i of
                           1 : begin
                                  FieldByName('FirstHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  if FieldByName('SecondHeat').AsDateTime > 0 then
                                     begin
                                        FieldByName('FirstHeatInt').Value := FieldByName('SecondHeat').AsDateTime-FieldByName('FirstHeat').AsDateTime;
                                        if NOT ( FieldByName('FirstHeatInt').AsInteger in [18..24] ) then
                                           FieldByName('IrregularHeat').AsBoolean := TRUE;
                                     end;
                               end;
                           2 : begin
                                  FieldByName('SecondHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  if FieldByName('ThirdHeat').AsDateTime > 0 then
                                     begin
                                        FieldByName('SecondHeatInt').Value := FieldByName('ThirdHeat').AsDateTime-FieldByName('SecondHeat').AsDateTime;
                                        if NOT ( FieldByName('SecondHeatInt').AsInteger in [18..24] ) then
                                           FieldByName('IrregularHeat').AsBoolean := TRUE;
                                     end;
                               end;
                           3 : begin
                                  FieldByName('ThirdHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  if FieldByName('FourthHeat').AsDateTime > 0 then
                                     begin
                                        FieldByName('ThirdHeatInt').Value := FieldByName('ThirdHeat').AsDateTime-FieldByName('FourthHeat').AsDateTime;
                                        if NOT ( FieldByName('ThirdHeatInt').AsInteger in [18..24] ) then
                                           FieldByName('IrregularHeat').AsBoolean := TRUE;
                                     end;
                               end;
                           4 : FieldByName('FourthHeat').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        end;
                        Dec(i);
                        WinData.CheckEvents.Prior;
                     end;
                  // Clear the Filter
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
                  FieldByName('IrregularService').AsBoolean := FALSE;
                  while ( NOT WinData.CheckEvents.BOF ) And ( i > 0 ) do
                     begin
                        HasService := TRUE;
                        // Get the Bull Used
                        BullUsed := '';
                        if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                           if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                              BullUsed := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        case i of
                            1 : begin
                                  FieldByName('FirstService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  FieldByName('FirstBull').AsString := BullUsed;
                                  if FieldByName('SecondService').AsDateTime > 0 then
                                     begin
                                        FieldByName('FirstInt').Value := FieldByName('SecondService').AsDateTime-FieldByName('FirstService').AsDateTime;
                                        if NOT ( FieldByName('FirstInt').AsInteger in [18..24] ) then
                                           FieldByName('IrregularService').AsBoolean := TRUE;
                                     end;
                               end;
                           2 : begin
                                  FieldByName('SecondService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  FieldByName('SecondBull').AsString := BullUsed;
                                  if FieldByName('ThirdService').AsDateTime > 0 then
                                     begin
                                        FieldByName('SecondInt').Value := FieldByName('ThirdService').AsDateTime-FieldByName('SecondService').AsDateTime;
                                        if NOT ( FieldByName('SecondInt').AsInteger in [18..24] ) then
                                           FieldByName('IrregularService').AsBoolean := TRUE;
                                     end;
                               end;
                           3 : begin
                                  FieldByName('ThirdService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  FieldByName('ThirdBull').AsString := BullUsed;
                                  if FieldByName('FourthService').AsDateTime > 0 then
                                     begin
                                        FieldByName('ThirdInt').Value := FieldByName('FourthService').AsDateTime-FieldByName('ThirdService').AsDateTime;
                                        if NOT ( FieldByName('ThirdInt').AsInteger in [18..24] ) then
                                           FieldByName('IrregularService').AsBoolean := TRUE;
                                     end;
                               end;
                           4 : begin
                                  FieldByName('FourthService').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                                  FieldByName('FourthBull').AsString := BullUsed;
                               end;
                        end;
                     Dec(i);
                     WinData.CheckEvents.Prior;
                  end;
                  // Clear the Filter
                  WinData.CheckEvents.Filter := '';
                  WinData.CheckEvents.Filtered := False;
                  // Check if they are PD
                  FieldByName('PD').AsString := '';
                  if Windata.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType', VarArrayOf([FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger,cPregDiagEvent]), [] )  then
                     if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                        if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                           FieldByName('PD').AsString := 'Yes'
                        else
                           FieldByName('PD').AsString := 'No';
                  Next;
                  pbCount.Position := pbCount.Position + 1;
               end;
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
      GetConditionScores;
{      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('DELETE FROM TempAnimals');
      MyQuery.SQL.Add('WHERE NOT ( ConditionScore Between ' + seConditionScoreFrom.Text + ' AND ' + seConditionScoreTo.Text + ')' );
      MyQuery.ExecSQL;
 remove for the time being - GL - 26/10/06
}
      pbCount.Hide;
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
                    qrdbFirstBullInt.DataField := 'FirstBull';
                    qrdbSecondBullInt.DataField := 'SecondBull';
                    qrdbThirdBullInt.DataField := 'ThirdBull';
                    qrdbFourthBullInt.DataField := 'FourthBull';
                 end
              else
                 begin
                    qrdbFirstBullInt.DataField := 'FirstInt';
                    qrdbSecondBullInt.DataField := 'SecondInt';
                    qrdbThirdBullInt.DataField := 'ThirdInt';
                    qrdbFourthBullInt.DataField := '';
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
                 fHeatServiceScr.qrShowIntOrBull.Caption := 'Services - Showing Bull used'
              else
                 fHeatServiceScr.qrShowIntOrBull.Caption := 'Services - Showing intervals';
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

              if not WinData.ExportToPDA then
                 begin
                    if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                       begin
                          fHeatServiceScr.PrintingReport := FALSE;
                          fHeatServiceScr.Preview;
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

procedure TfHeatServiceFilt.FromDateExit(Sender: TObject);
begin
   if (FromDate.Date > 0) then
      ToDate.Date := FromDate.Date + 366;
end;

procedure TfHeatServiceFilt.ToDateExit(Sender: TObject);
begin
   if (ToDate.Date > FromDate.Date + 366) then
      begin
         ToDate.SetFocus;
         messagedlg('The To Date must not be more than'+#13+
                    'one year after the From Date.',mtError,[mbOK],0);
      end;
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
         First;
         while not(MyTable.eof) do
            begin
               Edit;
               if MyTable.FieldByName('FourthService').AsDateTime > 0 then
                  MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('FourthService').AsDateTime
               else if MyTable.FieldByName('ThirdService').AsDateTime > 0 then
                  MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('ThirdService').AsDateTime
               else if MyTable.FieldByName('SecondService').AsDateTime > 0 then
                  MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('SecondService').AsDateTime
               else if MyTable.FieldByName('FirstService').AsDateTime > 0 then
                  MyTable.FieldByName('LastService').AsDateTime := MyTable.FieldByName('FirstService').AsDateTime
               else MyTable.FieldByName('LastService').AsDateTime := 0;
               Next;
            end;
      end;
end;

procedure TfHeatServiceFilt.LastHeatDate;
begin
   with MyTable do
      begin
         First;
         while not(MyTable.eof) do
            begin
               Edit;
               if MyTable.FieldByName('FourthHeat').AsDateTime > 0 then
                  MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('FourthHeat').AsDateTime
               else if MyTable.FieldByName('ThirdHeat').AsDateTime > 0 then
                  MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('ThirdHeat').AsDateTime
               else if MyTable.FieldByName('SecondHeat').AsDateTime > 0 then
                  MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('SecondHeat').AsDateTime
               else if MyTable.FieldByName('FirstHeat').AsDateTime > 0 then
                  MyTable.FieldByName('LastHeat').AsDateTime := MyTable.FieldByName('FirstHeat').AsDateTime
               else MyTable.FieldByName('LastHeat').AsDateTime := 0;
               Next;
            end;
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
      rgBullService.ItemIndex := HeatsServicesPDs.ReportOn;
      LR := HeatsServicesPDs.LactRange;
      FromLact.AsInteger := LR.IntFrom;
      if LR.IntTo = 0 then
         ToLact.AsInteger := 30
      else
         ToLact.AsInteger := LR.IntTo;
      rgSortby.ItemIndex := HeatsServicesPDs.SortField;
      rgSortOrder.ItemIndex := HeatsServicesPDs.SortOrder;
      if HeatsServicesPDs.DateInterval > 0 then
         begin
            ToDate.Date := Date;
            FromDate.Date := Trunc(Date - HeatsServicesPDs.DateInterval);
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
      HeatsServicesPDs.ReportOn := rgBullService.ItemIndex;
      HeatsServicesPDs.SortField := rgSortby.ItemIndex;
      HeatsServicesPDs.SortOrder := rgSortOrder.ItemIndex;
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

procedure TfHeatServiceFilt.GetConditionScores;
begin
   with MyTable do
      begin
         First;
         while not(MyTable.eof) do
            begin
               Edit;
               MyTable.FieldByName('ConditionScore').AsFloat := GetConditionScore( MyTable.FieldByName('ID').AsInteger, MyTable.FieldByName('LactNo').AsInteger);
               Post;
               Next;
            end;
      end;
end;

procedure TfHeatServiceFilt.PrintBlankBreedingChart1Click(Sender: TObject);
begin
   TfHeatServiceScr.PrintBlank(HerdNum.KeyValue);
end;

end.
