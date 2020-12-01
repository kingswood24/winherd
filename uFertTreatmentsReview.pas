{
 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Put title on chart preview, Link to Fertility Programs.

 02/04/2009 [Dev V3.9 R6.7] /SP Program Change - Re-calc of Weekend days (Displayed in different colour)
                                                 Monday was also appearing in weekend colour.

 15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
}

unit uFertTreatmentsReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, ActnList, dxBar, dxBarExtItems, cxControls, dxStatusBar,
  cxSSheet, Db, DBTables, cxSSTypes, cxSSHeaders, cxSSUtils, cxSSHelper,
  StdCtrls, cxButtons, DateUtil, cxDropDownEdit, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxCalendar, ExtCtrls, dxPSCore, dxPSBaseGridLnk,
  dxPScxSSLnk, RXSlider, cxGroupBox, cxRadioGroup, cxSSPainters, cxCheckBox;


type
  TByteNumbers = 0..255;
  TByteNumbersSet = set of TByteNumbers;


  TfmFertTreatmentsReview = class(TfmBaseForm)
    SpreadSheet: TcxSpreadSheet;
    QueryNotPregCows: TQuery;
    pFilter: TPanel;
    deStartDate: TcxDateEdit;
    lStartDate: TLabel;
    Label2: TLabel;
    cmboDisplayCows: TcxComboBox;
    QueryServicedCows: TQuery;
    QueryCulledCows: TQuery;
    QueryPregnantCows: TQuery;
    blbBuildChart: TdxBarLargeButton;
    pActions: TPanel;
    blbPreview: TdxBarLargeButton;
    actPreview: TAction;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterdxcplFertilityTreatmentChart: TdxSpreadSheetReportLink;
    ChartTimer: TTimer;
    rgDateSelection: TcxRadioGroup;
    dxBarLargeButton1: TdxBarLargeButton;
    actFertPrograms: TAction;
    cbFavourite: TcxCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure blbBuildChartClick(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure ChartTimerTimer(Sender: TObject);
    procedure cmboDisplayCowsPropertiesChange(Sender: TObject);
    procedure RxSlider1Change(Sender: TObject);
    procedure rgDateSelectionPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpreadSheetCustomPaint(Sender: TObject;
      var PainterClass: TcxSheetPainterClass);
    procedure SpreadSheetTopLeftChanging(Sender: TcxSSBookSheet;
      var ATopLeft: TPoint);
    procedure actHelpExecute(Sender: TObject);
    procedure actFertProgramsExecute(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure SetupChart(ADate : TDateTime);
  public
    { Public declarations }
    RowCount : integer;
    RowPos : Integer;
    Colour : Integer;
    WeekendDays : TByteNumbersSet;
    FDate : TDateTime;
    procedure OutputCurrentlyOnProgram;
    procedure OutputServicedCows;
    procedure OutputPregnantCows;
    procedure OutputCulledCows;
    procedure MySetCellPattern(ACols, ACells: TByteNumbersSet; ABackground, AForeGround : word;
       AFillStyle : TcxSSFillStyle; AActiveSheet : TcxSSBookSheet);
    class function Execute : Boolean;
  end;

var
  fmFertTreatmentsReview: TfmFertTreatmentsReview;

implementation

uses GenTypesConst, DairyData, uSetupFertPrograms;

{$R *.DFM}

{ TfmFertTreatmentsReview }

class function TfmFertTreatmentsReview.Execute: Boolean;
begin
   with TfmFertTreatmentsReview.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmFertTreatmentsReview.SetupChart(ADate : TDateTime);
var
  ColHeader, RowHeader : TcxSSHeader;
  i, j : Integer;
  s : string;
begin
   Screen.Cursor := crHourGlass;
   try
   with SpreadSheet do
      begin
         BeginUpdate;
         try
         Sheet.ClearAll;
         StatusBar.Panels[0].Text := 'Creating Treatment Chart, please wait...';
         Update;

         RowCount := 0;
         RowPos := 1;
         if cmboDisplayCows.ItemIndex = 0 then
            begin
               OutputCurrentlyOnProgram;
            end
         else if cmboDisplayCows.ItemIndex = 1 then
            begin
               OutputServicedCows;
            end
         else if cmboDisplayCows.ItemIndex = 2 then
            begin
               OutputPregnantCows;
            end
         else if cmboDisplayCows.ItemIndex = 3 then
            begin
               OutputCulledCows;
            end
         else
            begin
               OutputCurrentlyOnProgram;
               OutputServicedCows;
               OutputPregnantCows;
               OutputCulledCows;
            end;

         RowHeader := Sheet.Rows;
         for i := 1 to RowCount do
            RowHeader.Size[i] := RowHeader.DefaultSize*3;

         ColHeader := Sheet.Cols;
         ColHeader.Size[0] := 70;
         for i := 1 to 21 do
            ColHeader.Size[i] :=  80;

         TcxSSHelper.SetCellText(0, 0, 'Animal No.', Sheet);
         TcxSSHelper.SetCellText(1, 0, 'Status', Sheet);


         // 02/04/2009 [Dev V3.9 R6.7] /SP Program Change - Re-calc of Weekend days (Displayed in different colour) Monday was also appearing in weekend colour.
         WeekendDays := [];

         if ( cmboDisplayCows.ItemIndex in [0,4]) then
            begin
               for i := 2 to 16 do
                  begin
                     TcxSSHelper.SetCellText(i, 0, FormatDateTime('ddd d', ADate+(i-2)), Sheet);
                     s := FormatDateTime('ddd',ADate+(i-2));
                     if ((s = 'Sun') or (s = 'Sat' )) then
                        Include(WeekendDays, i);
                  end;
               MySetCellPattern(WeekendDays,[1..RowCount],16, 1, fsSolid,Sheet  );
               TcxSSHelper.SetCellPattern(0,0,21,0, 14, 1,fsSolid, Sheet);
            end
         else
            begin
               TcxSSHelper.SetCellPattern(0,0,1,0, 14, 1,fsSolid, Sheet);
            end;

         TcxSSHelper.SetCellFormat(1, 0, 16,0,17 , Sheet);
         TcxSSHelper.SetCellPattern(0,0,0,RowCount, 14, 1,fsSolid, Sheet);
         TcxSSHelper.SetCellFont(0,0,16,RowCount, [fsBold] , 8, Sheet, 'Tahoma');
         TcxSSHelper.SetCellAlignment(0,0,16,RowCount, haCenter, vaCenter,Sheet);
         TcxSSHelper.SetCellAlignment(1,1,16,RowCount, haLeft, vaCenter,Sheet);

         TcxSSHelper.SetCellFont(1,1,16,RowCount, [] , 8, Sheet, 'Tahoma');

         TcxSSHelper.SetCellReadOnly(0,0,16,RowCount,True,Sheet);
         TcxSSHelper.SetCellWordBreak(0,0,16,RowCount,True,Sheet);

         StatusBar.Panels[0].Text := '';

         finally
           EndUpdate;
           Update;
         end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmFertTreatmentsReview.FormActivate(Sender: TObject);
begin
  inherited;
  Update;
  cmboDisplayCowsPropertiesChange(nil);
end;

procedure TfmFertTreatmentsReview.MySetCellPattern(ACols, ACells: TByteNumbersSet; ABackground, AForeGround : Word;
       AFillStyle : TcxSSFillStyle; AActiveSheet : TcxSSBookSheet);
var
   i , j : Integer;
begin
   for i := Low(TByteNumbers) to High(TByteNumbers) do
      if i in ACols then
         begin
            for j := Low(TByteNumbers) to High(TByteNumbers) do
               if j in  ACells then
                  TcxSSHelper.SetCellPattern(i,j,i,j, ABackground, AForeGround, fsSolid, AActiveSheet);
         end;
end;

procedure TfmFertTreatmentsReview.FormShow(Sender: TObject);
begin
  inherited;
  deStartDate.Date := Date;
  cmboDisplayCows.ItemIndex := 0;

  //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
  cbFavourite.Checked := WinData.IsReportFavourite(cFertTreatChartRep);
  WinData.UpdateRecentReportUsage(cFertTreatChartRep);
end;

procedure TfmFertTreatmentsReview.OutputCulledCows;
begin
   QueryCulledCows.Close;
   QueryCulledCows.open;
   Inc(RowCount, QueryCulledCows.RecordCount);
   while not QueryCulledCows.Eof do
      begin
         if QueryCulledCows.FieldByName('AnimalNo').AsString <> '' then
            TcxSSHelper.SetCellText(0, RowPos, QueryCulledCows.FieldByName('AnimalNo').AsString, SpreadSheet.Sheet)
         else
            TcxSSHelper.SetCellText(0, RowPos, '###', SpreadSheet.Sheet);
         TcxSSHelper.SetCellText(1, RowPos, 'Culled', SpreadSheet.Sheet);
         Inc(RowPos);
         QueryCulledCows.Next;
      end;
end;

procedure TfmFertTreatmentsReview.OutputCurrentlyOnProgram;
var
  ProgramStart, TreatmentStart : TDateTime;
  DayColIndex : Integer;
  DisplayProgramDetails : Boolean;
begin
   QueryNotPregCows.Close;
 //  QueryNotPregCows.params[0].asDateTime := Date - 22;    And (F.StartDate>:StartDate)
   QueryNotPregCows.open;

   while not QueryNotPregCows.Eof do
      begin
         if QueryNotPregCows.FieldByName('ProgramID').AsInteger > 0 then
            begin
               DisplayProgramDetails := False;
               ProgramStart := QueryNotPregCows.FieldByName('StartDate').AsDateTime;
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;

                     SQL.Add('Select * From FertTreatments Where ParentProgram = :ParentProgram');
                     Params[0].AsInteger := QueryNotPregCows.FieldByName('ProgramID').AsInteger;
                     Open;
                     First;
                     while not eof do
                        begin
                           TreatmentStart := ProgramStart + FieldByName('StartDay').AsInteger;
                           if (TreatmentStart >= FDate) and (TreatmentStart <= FDate+15) then
                              begin
                                 DisplayProgramDetails := True;
                                 DayColIndex := Trunc(TreatmentStart - FDate) +1;
                                 if (DayColIndex >-1) and (DayColIndex <= 15) then
                                    begin
                                       TcxSSHelper.SetCellText(DayColIndex+1, RowPos, FieldByName('Description').AsString, SpreadSheet.Sheet);
                                    end;
                              end;
                           Next;
                        end;
                     Close;
                  finally
                     Free;
                  end;

               if DisplayProgramDetails then
                  begin
                     TcxSSHelper.SetCellText(0, RowPos, QueryNotPregCows.FieldByName('AnimalNo').AsString, SpreadSheet.Sheet);
                     TcxSSHelper.SetCellText(1, RowPos, QueryNotPregCows.FieldByName('Description').AsString, SpreadSheet.Sheet);
                     Inc(RowPos);
                     Inc(RowCount, 1);
                  end;

            end;
         QueryNotPregCows.Next;
      end;
end;

procedure TfmFertTreatmentsReview.OutputPregnantCows;
begin
   QueryPregnantCows.Close;
   QueryPregnantCows.open;
   Inc(RowCount, QueryPregnantCows.RecordCount);
   while not QueryPregnantCows.Eof do
      begin
         if QueryPregnantCows.FieldByName('AnimalNo').AsString <> '' then
            TcxSSHelper.SetCellText(0, RowPos, QueryPregnantCows.FieldByName('AnimalNo').AsString, SpreadSheet.Sheet)
         else
            TcxSSHelper.SetCellText(0, RowPos, '###', SpreadSheet.Sheet);
         TcxSSHelper.SetCellText(1, RowPos, 'Pregnant', SpreadSheet.Sheet);
         Inc(RowPos);
         QueryPregnantCows.Next;
      end;
end;

procedure TfmFertTreatmentsReview.OutputServicedCows;
begin
   QueryServicedCows.Close;
   QueryServicedCows.open;
   Inc(RowCount, QueryServicedCows.RecordCount);
   while not QueryServicedCows.Eof do
      begin
         if QueryServicedCows.FieldByName('AnimalNo').AsString <> '' then
            TcxSSHelper.SetCellText(0, RowPos, QueryServicedCows.FieldByName('AnimalNo').AsString, SpreadSheet.Sheet)
         else
            TcxSSHelper.SetCellText(0, RowPos, '###', SpreadSheet.Sheet);
         TcxSSHelper.SetCellText(1, RowPos, 'Served', SpreadSheet.Sheet);
         Inc(RowPos);
         QueryServicedCows.Next;
      end;
end;

procedure TfmFertTreatmentsReview.blbBuildChartClick(Sender: TObject);
begin
  inherited;
  SetupChart(Date);
end;

procedure TfmFertTreatmentsReview.actPreviewExecute(Sender: TObject);
begin
  inherited;
  if Length(ComponentPrinter.PrintTitle) = 0 then
     ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
  ComponentPrinterdxcplFertilityTreatmentChart.Preview()
end;

procedure TfmFertTreatmentsReview.ChartTimerTimer(Sender: TObject);
begin
  inherited;
  ChartTimer.Enabled := False;
  Enabled := False;
  Screen.Cursor := crHourGlass;
  try
     SetupChart(FDate);
  finally
     Screen.Cursor := crDefault;
     enabled := True;
  end;
end;

procedure TfmFertTreatmentsReview.cmboDisplayCowsPropertiesChange(
  Sender: TObject);
begin
  inherited;
  cmboDisplayCows.DroppedDown := False;
  ChartTimer.Enabled := True;
end;

procedure TfmFertTreatmentsReview.RxSlider1Change(Sender: TObject);
begin
   inherited;
//   Label1.Caption := 'Day '+IntToStr(RxSlider1.Value);
end;

procedure TfmFertTreatmentsReview.rgDateSelectionPropertiesChange(
  Sender: TObject);
begin
  inherited;
  if rgDateSelection.ItemIndex = 0 then
     FDate := Date-15
  else
     FDate := Date;
  SetupChart(FDate);
end;

procedure TfmFertTreatmentsReview.FormCreate(Sender: TObject);
begin
  inherited;
  SSBookSheet := SpreadSheet.Sheet;
  FDate := Date;
  FixedColNumber := 2;
  FixedRowNumber := 1;
  APoint := Point(0, 0);
  APrevPoint := APoint;
  AFixFlag := True;
end;

procedure TfmFertTreatmentsReview.SpreadSheetCustomPaint(Sender: TObject;
  var PainterClass: TcxSheetPainterClass);
begin
  inherited;
  PainterClass := TMyPainter;
end;

procedure TfmFertTreatmentsReview.SpreadSheetTopLeftChanging(
  Sender: TcxSSBookSheet; var ATopLeft: TPoint);
begin
  inherited;
  APrevPoint := APoint;
  APoint := ATopLeft;
end;

procedure TfmFertTreatmentsReview.actHelpExecute(Sender: TObject);
begin
  inherited;
     WinData.HTMLHelp('ferttreatrep.htm');
end;

procedure TfmFertTreatmentsReview.actFertProgramsExecute(Sender: TObject);
begin
  inherited;
  TfmSetupFertPrograms.Execute;
end;


{
Select A.AnimalNo, A.SortAnimalNo, F.ProgramID, F.StartDate, FP.Description From Animals  A
Left Join  FertProgAdmin F ON (F.AnimalID=A.ID)
Left Join  FertPrograms FP ON (FP.ID=F.ProgramID)
WHERE (A.ID IN (SELECT E.AnimalID FROM Events E 
                         LEFT JOIN PregnancyDiag P ON (E.ID=P.EventID) 
                         WHERE (A.ID=E.AnimalID)    
                         AND   (A.LactNo=E.AnimalLactNo)  
                         AND   (E.EventType = 3)
                         AND   (P.PregnancyStatus=False)
                         AND   (F.LactNo = E.AnimalLactNo) ))
AND NOT (A.ID IN (SELECT E.AnimalID FROM Events E 
                         WHERE (A.ID=E.AnimalID)    
                         AND   (A.LactNo=E.AnimalLactNo)  
                         AND   (E.EventType = 24)))
And A.InHerd=True
And A.Sex = "Female"
And A.Breeding=True
And A.AnimalDeleted=False	
And F.ProgramID>0							 

Order By SortAnimalNo
}

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmFertTreatmentsReview.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cFertTreatChartRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cFertTreatChartRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.