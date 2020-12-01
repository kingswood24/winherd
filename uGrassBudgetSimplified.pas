unit uGrassBudgetSimplified;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, dxmdaset, cxPC, dxBar, dxBarExtItems,
  StdCtrls, cxButtons, cxSSheet, cxSSTypes, cxSSHeaders, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, DateUtil, cxSSUtils, cxSSHelper,
  cxDropDownEdit, cxCalendar, GenTypesConst, dbTables;

type
  TProjectedCalvings = record
    TotalJAN_F1,
    TotalJAN_F2,
    TotalFEB_F1,
    TotalFEB_F2,
    TotalMAR_F1,
    TotalMAR_F2,
    TotalAPR_F1,
    TotalAPR_F2,
    TotalMAY_F1,
    TotalMAY_F2,
    TotalJUN_F1,
    TotalJUN_F2,
    TotalJUL_F1,
    TotalJUL_F2,
    TotalAUG_F1,
    TotalAUG_F2,
    TotalSEPT_F1,
    TotalSEPT_F2,
    TotalOCT_F1,
    TotalOCT_F2,
    TotalNOV_F1,
    TotalNOV_F2,
    TotalDEC_F1,
    TotalDEC_F2 : Integer;
  end;


  TByteNumbers = 0..100;
  TByteNumbersSet = set of TByteNumbers;

  TGrassIntakeRecord = record
    TotalIntakeJan_F1,
    TotalIntakeJan_F2,
    TotalIntakeFEB_F1,
    TotalIntakeFEB_F2,
    TotalIntakeMAR_F1,
    TotalIntakeMAR_F2,
    TotalIntakeAPR_F1,
    TotalIntakeAPR_F2,
    TotalIntakeMAY_F1,
    TotalIntakeMAY_F2,
    TotalIntakeJUN_F1,
    TotalIntakeJUN_F2,
    TotalIntakeJUL_F1,
    TotalIntakeJUL_F2,
    TotalIntakeAUG_F1,
    TotalIntakeAUG_F2,
    TotalIntakeSEPT_F1,
    TotalIntakeSEPT_F2,
    TotalIntakeOCT_F1,
    TotalIntakeOCT_F2,
    TotalIntakeNOV_F1,
    TotalIntakeNOV_F2,
    TotalIntakeDEC_F1,
    TotalIntakeDEC_F2 : double;
  end;

  TfmGrassBudgetSimplified = class(TForm)
    dxBarManager1: TdxBarManager;
    blbExit: TdxBarLargeButton;
    PageControl: TcxPageControl;
    tsGrassIntake: TcxTabSheet;
    tsGrassGrowth: TcxTabSheet;
    cxSpinEdit1: TcxSpinEdit;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    ssGrassGrowth: TcxSpreadSheetBook;
    ssbGrassIntake: TcxSpreadSheetBook;
    Panel1: TPanel;
    pCellInfo: TPanel;
    pnCellsRect: TPanel;
    Panel3: TPanel;
    edtCellEdit: TEdit;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Panel2: TPanel;
    Label1: TLabel;
    DriedOffon: TcxDateEdit;
    procedure ssbGrassIntakeSetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure blbExitClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure ssGrassGrowthSetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure FormCreate(Sender: TObject);
    procedure PageControlDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
  private
    { Private declarations }
    RotationArea : Double;
    AllCows, DryCows, CowsInMilk : Integer;
    Weanlings, Yearlings : Integer;

    ActualBiWeekIndex : Integer;
    BiWeekIndex_ColIndex : Integer;
    DriedOffBiWeekIndex : Integer;

    GrassIntakeRecord : TGrassIntakeRecord;
    FIsUpdate : Boolean;
    ProjectedCalvings, ProjectedCalvingsPostDry : TProjectedCalvings;
    procedure ChangeCellFormat( ACols, ACells : TByteNumbersSet; AFormat : Integer);
    procedure CreateGrassIntakeSpreadSheet;
    procedure CreateGrassGrowthSpreadSheet;
    function GetBiWeekIndex(ADate : TDateTime; AStartIndex : Integer): Integer;
    function GetAllCows : Integer;
    function GetCowsInMilk : Integer;
    function GetRotationArea : Double;
    function CalcInMilkCows(ADateFrom, ADateTo : TDateTime) : Integer;
    function CalcDryCows(ADateFrom, ADateTo : TDateTime) : Integer;
    function GetWeanlings  : Integer;
    function GetYearlings  : Integer;
  public
    { Public declarations }
    class procedure Execute;
  end;



var
  fmGrassBudgetSimplified: TfmGrassBudgetSimplified;

const
   StartBiWeekColIndex = 3;

  // $00C1FFFF

implementation

uses uSQLFilters, DairyData, uSelectFarm, kRoutines;

{$R *.DFM}

{ TfmGrassBudgetSimplified }

class procedure TfmGrassBudgetSimplified.Execute;
begin
   with TfmGrassBudgetSimplified.Create(nil) do
      try
          ShowModal;
      finally
          Free;
      end;
end;

procedure TfmGrassBudgetSimplified.CreateGrassIntakeSpreadSheet;
var
  ColHeader, RowHeader : TcxSSHeader;
  i, j : Integer;
begin

  with ssbGrassIntake do
  begin
    BeginUpdate;
    Try
      AutoRecalc := False;
      ActivePage := 0;                                     // turn our attention to the first page
      if ActiveSheet.Caption <> 'Grass Intake' then
         ActiveSheet.Caption := 'Grass Intake';

      RowHeader := ActiveSheet.Rows;
      RowHeader[3] := 18;
      RowHeader[11] := 35;


      for i := 0 to 27 do
         for j := 0 to 26 do
            begin
               TcxSSHelper.SetCellFont(j, i,j,i,[],8, ActiveSheet, 'Arial');         // set the title and column header fonts
            end;

      for i := 0 to 27 do
         for j := 0 to 26 do
            begin
               TcxSSHelper.SetCellBorders(j,i,j,i, 2, lsThin,ActiveSheet);
               TcxSSHelper.SetCellBorders(j,i,j,i, 1, lsThin,ActiveSheet);
            end;

      TcxSSHelper.SetCellBorders(BiWeekIndex_ColIndex, 4, BiWeekIndex_ColIndex, 27, 0 , lsThick,ActiveSheet);
   //   TcxSSHelper.SetCellBorders(BiWeekIndex_ColIndex, 4, 26, 4, 1, lsThick,ActiveSheet);

      ColHeader := ActiveSheet.Cols;
      ColHeader.Size[0] :=  40;
      for I := 0 to 2 do ColHeader.Size[I] :=  82;
      for I := 3 to 26 do ColHeader.Size[I] :=  42;
      for I := 3 to 26 do
         begin

            if (i in [3,5,7,9,11,13,15,17,19,21,23,25]) then
               begin
                  TcxSSHelper.SetCellAlignment(i,2,i,2,haCenter,vaCenter,ActiveSheet);
                  TcxSSHelper.SetCellText(i, 3,'F1',ActiveSheet);
               end
            else
               TcxSSHelper.SetCellText(i, 3,'F2',ActiveSheet);

         end;

      TcxSSHelper.SetCellAlignment(3,2,26,2,haCENTER,vaBOTTOM,ActiveSheet);

      TcxSSHelper.SetCellPattern(0,1,0,1,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,2,26,3,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,4,0,4,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,6,0,6,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,7,0,7,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,8,0,8,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,9,0,9,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,11,0,11,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,16,0,16,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellAlignment(3, 3, 26, 4 ,haCenter,vaCenter,ActiveSheet);
      TcxSSHelper.SetCellFont(3,3,26,3,[fsBold], 8,ActiveSheet ,'Arial');
      TcxSSHelper.SetCellFont(3,2,26,2,[fsBold], 8,ActiveSheet ,'Arial');

      TcxSSHelper.SetCellText(3, 0,'Fill in the farm area available in each fortnight',ActiveSheet);
      TcxSSHelper.SetCellAlignment(3, 0, 26, 0, haCenter, vaCenter,ActiveSheet);
      TcxSSHelper.SetCellFont(3, 0, 3, 0,[fsBold, fsItalic],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(3, 0, 26 , 0, True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 1,'A',ActiveSheet);
      TcxSSHelper.SetCellText(1, 1,'Area in Rotation',ActiveSheet);
      TcxSSHelper.SetCellFont(1, 1, 1, 1,[fsBold],8,ActiveSheet, 'Arial');

      TcxSSHelper.SetCellMerge(0,2,2,3,True,ActiveSheet);
      TcxSSHelper.SetCellMerge(0,10,2,10,True,ActiveSheet);

      TcxSSHelper.SetCellText(3, 2,'January',ActiveSheet);
      TcxSSHelper.SetCellMerge(3,2,4,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(3, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(4, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellText(5, 2,'February',ActiveSheet);
      TcxSSHelper.SetCellMerge(5,2,6,2,True,ActiveSheet);

      if IsLeapYear(CurrentYear) then
         begin
            TcxSSHelper.SetCellText(5, 4,'14',ActiveSheet);
            TcxSSHelper.SetCellText(6, 4,'15',ActiveSheet);
         end
      else
         begin
            TcxSSHelper.SetCellText(5, 4,'14',ActiveSheet);
            TcxSSHelper.SetCellText(6, 4,'14',ActiveSheet);
         end;

      TcxSSHelper.SetCellText(7, 2,'March',ActiveSheet);
      TcxSSHelper.SetCellMerge(7,2,8,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(7, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(8, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellText(9, 2,'April',ActiveSheet);
      TcxSSHelper.SetCellMerge(9,2,10,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(9, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(10, 4,'15',ActiveSheet);

      TcxSSHelper.SetCellText(11, 2,'May',ActiveSheet);
      TcxSSHelper.SetCellMerge(11,2,12,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(11, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(12, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellText(13, 2,'June',ActiveSheet);
      TcxSSHelper.SetCellMerge(13,2,14,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(13, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(14, 4,'15',ActiveSheet);

      TcxSSHelper.SetCellText(15, 2,'July',ActiveSheet);
      TcxSSHelper.SetCellMerge(15,2,16,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(15, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(16, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellText(17, 2,'August',ActiveSheet);
      TcxSSHelper.SetCellMerge(17,2,18,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(17, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(18, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellText(19, 2,'September',ActiveSheet);
      TcxSSHelper.SetCellMerge(19,2,20,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(19, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(20, 4,'15',ActiveSheet);

      TcxSSHelper.SetCellText(21, 2,'October',ActiveSheet);
      TcxSSHelper.SetCellMerge(21,2,22,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(21, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(22, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellText(23, 2,'November',ActiveSheet);
      TcxSSHelper.SetCellMerge(23,2,24,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(23, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(24, 4,'15',ActiveSheet);

      TcxSSHelper.SetCellText(25, 2,'December',ActiveSheet);
      TcxSSHelper.SetCellMerge(25,2,26,2,True,ActiveSheet);
      TcxSSHelper.SetCellText(25, 4,'15',ActiveSheet);
      TcxSSHelper.SetCellText(26, 4,'16',ActiveSheet);

      TcxSSHelper.SetCellPattern(1, 1, 26, 1, 18, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 4, 26, 4, 33, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 6, 26, 6, 18, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 7, 26, 7, 33, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 8, 26, 8, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 9, 26, 9, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 12, 26, 12, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 13, 26, 13, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 14, 26, 14, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 15, 26, 15, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 17, 26, 17, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 18, 26, 18, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 19, 26, 19, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 20, 26, 20, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 22, 26, 22, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 23, 26, 23, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 24, 26, 24, 18,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 25, 26, 25, 33,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 27, 26, 27, 33,1, fsSolid,ActiveSheet);


      TcxSSHelper.SetCellText(0, 4, 'B',ActiveSheet);
      TcxSSHelper.SetCellText(1, 4, 'Days',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,4,2,4,True,ActiveSheet);


      TcxSSHelper.SetCellText(0, 5, 'MILKING COW INTAKE',ActiveSheet);
      TcxSSHelper.SetCellFont(0, 5,0,5,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(0,5,2,5,True,ActiveSheet);

      TcxSSHelper.SetCellPattern(0,5,2,5,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 6, 'C',ActiveSheet);
      TcxSSHelper.SetCellText(1, 6, 'Number of milking cows',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,6,2,6,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 7, 'D',ActiveSheet);
      TcxSSHelper.SetCellText(1, 7, 'Milking cows/ha (C/A)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,7,2,7,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 8, 'E',ActiveSheet);
      TcxSSHelper.SetCellText(1, 8, 'DM intake/cow/day',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,8,2,8,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 9, 'F',ActiveSheet);
      TcxSSHelper.SetCellText(1, 9, 'Milking cow intake/ha/day (D x E)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,9,2,9,True,ActiveSheet);

{     TcxSSHelper.SetCellText(0, 10,'TOTAL INTAKE/HA/DAY',ActiveSheet);
      TcxSSHelper.SetCellPattern(0,10,2,10,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellFont(0,10,2,10,[fsBold],8,ActiveSheet, 'Arial');


      TcxSSHelper.SetCellText(0, 11,'S',ActiveSheet);
      TcxSSHelper.SetCellText(1, 11,'(S)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1, 11, 2, 11, True,ActiveSheet);
}

      TcxSSHelper.SetCellText(0, 10, 'DRY COW INTAKE',ActiveSheet);
      TcxSSHelper.SetCellMerge(0,10,2,10,True,ActiveSheet);
      TcxSSHelper.SetCellFont(0,10,2,10,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,10,2,10,14,1, fsSolid,ActiveSheet);

    //  TcxSSHelper.SetCellPattern(0,10,2,10,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(1, 11, '(Include in-calf heifers with dry cows from december onwards)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,11,2,11,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,1,2,11,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(1,11,2,11,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellWordBreak(1, 11, 2, 11, True,ActiveSheet);

  //    TcxSSHelper.SetCellPattern(0,11,2,11,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 12, 'G',ActiveSheet);
      TcxSSHelper.SetCellText(1, 12, 'Number of Dry Cows',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,12,2,12,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,12,2,12,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,12,0,12,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 13, 'H',ActiveSheet);
      TcxSSHelper.SetCellText(1, 13, 'Dry Cows/Ha (G/A)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,13,2,13,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,13,2,13,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,13,0,13,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 14, 'I',ActiveSheet);
      TcxSSHelper.SetCellText(1, 14, 'DM Intake/cow/day',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,14,2,14,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,14,2,14,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,14,0,14,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 15, 'J',ActiveSheet);
      TcxSSHelper.SetCellText(1, 15, 'Dry Cow Intake/Ha/Day (HxI)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,15,2,15,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,15,2,15,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,15,0,15,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 16, 'YEARLING (12-24 MTHS) INTAKE',ActiveSheet);
      TcxSSHelper.SetCellMerge(0,16,2,16,True,ActiveSheet);
      TcxSSHelper.SetCellFont(0,16,2,16,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,16,2,16,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 17, 'K',ActiveSheet);
      TcxSSHelper.SetCellText(1, 17, 'Number of yearlings',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,17,2,17,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,17,2,17,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,17,0,17,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 18, 'L',ActiveSheet);
      TcxSSHelper.SetCellText(1, 18, 'Yearlings/ha (K/A)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,18,2,18,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,18,2,18,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,18,0,18,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 19, 'M',ActiveSheet);
      TcxSSHelper.SetCellText(1, 19, 'DM intake/ylg/day',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,19,2,19,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,19,2,19,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,19,0,19,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 20, 'N',ActiveSheet);
      TcxSSHelper.SetCellText(1, 20, 'Yearling intake/ha/day (LxM)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,20,2,20,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,20,2,20,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,20,0,20,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 21, 'WEANLING (RISING 1 YR) INTAKE',ActiveSheet);
      TcxSSHelper.SetCellMerge(0,21,2,21,True,ActiveSheet);
      TcxSSHelper.SetCellFont(0,21,2,21,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,21,2,21,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 22, 'O',ActiveSheet);
      TcxSSHelper.SetCellText(1, 22, 'Number of calves/weanling',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,22,2,22,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,22,2,22,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,22,0,22,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 23, 'P',ActiveSheet);
      TcxSSHelper.SetCellText(1, 23, 'Weanlings/ha (O/A)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,23,2,23,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,23,2,23,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,23,0,23,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 24, 'Q',ActiveSheet);
      TcxSSHelper.SetCellText(1, 24, 'DM intake/weanling/day',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,24,2,24,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,24,2,24,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,24,0,24,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 25, 'R',ActiveSheet);
      TcxSSHelper.SetCellText(1, 25, 'Weanling intake/ha/day (PxQ)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,25,2,25,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,25,2,25,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,25,0,25,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 26, 'TOTAL INTAKE/HA/DAY',ActiveSheet);
      TcxSSHelper.SetCellMerge(0,26,2,26,True,ActiveSheet);
      TcxSSHelper.SetCellFont(0,26,2,26,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,26,2,26,14,1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellText(0, 27, 'S',ActiveSheet);
      TcxSSHelper.SetCellText(1, 27, 'F+J+N+R',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,27,2,27,True,ActiveSheet);
      TcxSSHelper.SetCellFont(1,27,2,27,[],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellPattern(0,27,0,27,14,1, fsSolid,ActiveSheet);

      ChangeCellFormat([3..27],[1,7,9,13,15,18,20,23,25,27], 4);

      // Milking cows/ha (C/A)
      TcxSSHelper.SetCellText(3,7,'=IF(D2=0,"",D7/D2)',ActiveSheet);
      TcxSSHelper.SetCellText(4,7,'=IF(E2=0,"",E7/E2)',ActiveSheet);
      TcxSSHelper.SetCellText(5,7,'=IF(F2=0,"",F7/F2)',ActiveSheet);
      TcxSSHelper.SetCellText(6,7,'=IF(G2=0,"",G7/G2)',ActiveSheet);
      TcxSSHelper.SetCellText(7,7,'=IF(H2=0,"",H7/H2)',ActiveSheet);
      TcxSSHelper.SetCellText(8,7,'=IF(I2=0,"",I7/I2)',ActiveSheet);
      TcxSSHelper.SetCellText(9,7,'=IF(J2=0,"",J7/J2)',ActiveSheet);
      TcxSSHelper.SetCellText(10,7,'=IF(K2=0,"",K7/K2)',ActiveSheet);
      TcxSSHelper.SetCellText(11,7,'=IF(L2=0,"",L7/L2)',ActiveSheet);
      TcxSSHelper.SetCellText(12,7,'=IF(M2=0,"",M7/M2)',ActiveSheet);
      TcxSSHelper.SetCellText(13,7,'=IF(N2=0,"",N7/N2)',ActiveSheet);
      TcxSSHelper.SetCellText(14,7,'=IF(O2=0,"",O7/O2)',ActiveSheet);
      TcxSSHelper.SetCellText(15,7,'=IF(P2=0,"",P7/P2)',ActiveSheet);
      TcxSSHelper.SetCellText(16,7,'=IF(Q2=0,"",Q7/Q2)',ActiveSheet);
      TcxSSHelper.SetCellText(17,7,'=IF(R2=0,"",R7/R2)',ActiveSheet);
      TcxSSHelper.SetCellText(18,7,'=IF(S2=0,"",S7/S2)',ActiveSheet);
      TcxSSHelper.SetCellText(19,7,'=IF(T2=0,"",T7/T2)',ActiveSheet);
      TcxSSHelper.SetCellText(20,7,'=IF(U2=0,"",U7/U2)',ActiveSheet);
      TcxSSHelper.SetCellText(21,7,'=IF(V2=0,"",V7/V2)',ActiveSheet);
      TcxSSHelper.SetCellText(22,7,'=IF(W2=0,"",W7/W2)',ActiveSheet);
      TcxSSHelper.SetCellText(23,7,'=IF(X2=0,"",X7/X2)',ActiveSheet);
      TcxSSHelper.SetCellText(24,7,'=IF(Y2=0,"",Y7/Y2)',ActiveSheet);
      TcxSSHelper.SetCellText(25,7,'=IF(Z2=0,"",Z7/Z2)',ActiveSheet);
      TcxSSHelper.SetCellText(26,7,'=IF(AA2=0,"",AA7/AA2)',ActiveSheet);

      // Milking cow intake/ha/day (D x E)
      TcxSSHelper.SetCellText(3,9,'=(D8*D9)',ActiveSheet);
      TcxSSHelper.SetCellText(4,9,'=(E8*E9)',ActiveSheet);
      TcxSSHelper.SetCellText(5,9,'=(F8*F9)',ActiveSheet);
      TcxSSHelper.SetCellText(6,9,'=(G8*G9)',ActiveSheet);
      TcxSSHelper.SetCellText(7,9,'=(H8*H9)',ActiveSheet);
      TcxSSHelper.SetCellText(8,9,'=(I8*I9)',ActiveSheet);
      TcxSSHelper.SetCellText(9,9,'=(J8*J9)',ActiveSheet);
      TcxSSHelper.SetCellText(10,9,'=(K8*K9)',ActiveSheet);
      TcxSSHelper.SetCellText(11,9,'=(L8*L9)',ActiveSheet);
      TcxSSHelper.SetCellText(12,9,'=(M8*M9)',ActiveSheet);
      TcxSSHelper.SetCellText(13,9,'=(N8*N9)',ActiveSheet);
      TcxSSHelper.SetCellText(14,9,'=(O8*O9)',ActiveSheet);
      TcxSSHelper.SetCellText(15,9,'=(P8*P9)',ActiveSheet);
      TcxSSHelper.SetCellText(16,9,'=(Q8*Q9)',ActiveSheet);
      TcxSSHelper.SetCellText(17,9,'=(R8*R9)',ActiveSheet);
      TcxSSHelper.SetCellText(18,9,'=(S8*S9)',ActiveSheet);
      TcxSSHelper.SetCellText(19,9,'=(T8*T9)',ActiveSheet);
      TcxSSHelper.SetCellText(20,9,'=(U8*U9)',ActiveSheet);
      TcxSSHelper.SetCellText(21,9,'=(V8*V9)',ActiveSheet);
      TcxSSHelper.SetCellText(22,9,'=(W8*W9)',ActiveSheet);
      TcxSSHelper.SetCellText(23,9,'=(X8*X9)',ActiveSheet);
      TcxSSHelper.SetCellText(24,9,'=(Y8*Y9)',ActiveSheet);
      TcxSSHelper.SetCellText(25,9,'=(Z8*Z9)',ActiveSheet);
      TcxSSHelper.SetCellText(26,9,'=(AA8*AA9)',ActiveSheet);

      // Dry cows/ha (G/A)
      TcxSSHelper.SetCellText(3,13,'=IF(D2=0,"",D13/D2)',ActiveSheet);
      TcxSSHelper.SetCellText(4,13,'=IF(E2=0,"",E13/E2)',ActiveSheet);
      TcxSSHelper.SetCellText(5,13,'=IF(F2=0,"",F13/F2)',ActiveSheet);
      TcxSSHelper.SetCellText(6,13,'=IF(G2=0,"",G13/G2)',ActiveSheet);
      TcxSSHelper.SetCellText(7,13,'=IF(H2=0,"",H13/H2)',ActiveSheet);
      TcxSSHelper.SetCellText(8,13,'=IF(I2=0,"",I13/I2)',ActiveSheet);
      TcxSSHelper.SetCellText(9,13,'=IF(J2=0,"",J13/J2)',ActiveSheet);
      TcxSSHelper.SetCellText(10,13,'=IF(K2=0,"",K13/K2)',ActiveSheet);
      TcxSSHelper.SetCellText(11,13,'=IF(L2=0,"",L13/L2)',ActiveSheet);
      TcxSSHelper.SetCellText(12,13,'=IF(M2=0,"",M13/M2)',ActiveSheet);
      TcxSSHelper.SetCellText(13,13,'=IF(N2=0,"",N13/N2)',ActiveSheet);
      TcxSSHelper.SetCellText(14,13,'=IF(O2=0,"",O13/O2)',ActiveSheet);
      TcxSSHelper.SetCellText(15,13,'=IF(P2=0,"",P13/P2)',ActiveSheet);
      TcxSSHelper.SetCellText(16,13,'=IF(Q2=0,"",Q13/Q2)',ActiveSheet);
      TcxSSHelper.SetCellText(17,13,'=IF(R2=0,"",R13/R2)',ActiveSheet);
      TcxSSHelper.SetCellText(18,13,'=IF(S2=0,"",S13/S2)',ActiveSheet);
      TcxSSHelper.SetCellText(19,13,'=IF(T2=0,"",T13/T2)',ActiveSheet);
      TcxSSHelper.SetCellText(20,13,'=IF(U2=0,"",U13/U2)',ActiveSheet);
      TcxSSHelper.SetCellText(21,13,'=IF(V2=0,"",V13/V2)',ActiveSheet);
      TcxSSHelper.SetCellText(22,13,'=IF(W2=0,"",W13/W2)',ActiveSheet);
      TcxSSHelper.SetCellText(23,13,'=IF(X2=0,"",X13/X2)',ActiveSheet);
      TcxSSHelper.SetCellText(24,13,'=IF(Y2=0,"",Y13/Y2)',ActiveSheet);
      TcxSSHelper.SetCellText(25,13,'=IF(Z2=0,"",Z13/Z2)',ActiveSheet);
      TcxSSHelper.SetCellText(26,13,'=IF(AA2=0,"",AA13/AA2)',ActiveSheet);

      // Dry cow intake/ha/day (H x I)
      TcxSSHelper.SetCellText(3,15,'=(D15*D14)',ActiveSheet);
      TcxSSHelper.SetCellText(4,15,'=(E15*E14)',ActiveSheet);
      TcxSSHelper.SetCellText(5,15,'=(F15*F14)',ActiveSheet);
      TcxSSHelper.SetCellText(6,15,'=(G15*G14)',ActiveSheet);
      TcxSSHelper.SetCellText(7,15,'=(H15*H14)',ActiveSheet);
      TcxSSHelper.SetCellText(8,15,'=(I15*I14)',ActiveSheet);
      TcxSSHelper.SetCellText(9,15,'=(J15*J14)',ActiveSheet);
      TcxSSHelper.SetCellText(10,15,'=(K15*K14)',ActiveSheet);
      TcxSSHelper.SetCellText(11,15,'=(L15*L14)',ActiveSheet);
      TcxSSHelper.SetCellText(12,15,'=(M15*M14)',ActiveSheet);
      TcxSSHelper.SetCellText(13,15,'=(N15*N14)',ActiveSheet);
      TcxSSHelper.SetCellText(14,15,'=(O15*O14)',ActiveSheet);
      TcxSSHelper.SetCellText(15,15,'=(P15*P14)',ActiveSheet);
      TcxSSHelper.SetCellText(16,15,'=(Q15*Q14)',ActiveSheet);
      TcxSSHelper.SetCellText(17,15,'=(R15*R14)',ActiveSheet);
      TcxSSHelper.SetCellText(18,15,'=(S15*S14)',ActiveSheet);
      TcxSSHelper.SetCellText(19,15,'=(T15*T14)',ActiveSheet);
      TcxSSHelper.SetCellText(20,15,'=(U15*U14)',ActiveSheet);
      TcxSSHelper.SetCellText(21,15,'=(V15*V14)',ActiveSheet);
      TcxSSHelper.SetCellText(22,15,'=(W15*W14)',ActiveSheet);
      TcxSSHelper.SetCellText(23,15,'=(X15*X14)',ActiveSheet);
      TcxSSHelper.SetCellText(24,15,'=(Y15*Y14)',ActiveSheet);
      TcxSSHelper.SetCellText(25,15,'=(Z15*Z14)',ActiveSheet);
      TcxSSHelper.SetCellText(26,15,'=(AA15*AA14)',ActiveSheet);

      // Yearlings/ha (K/A)
      TcxSSHelper.SetCellText(3,18,'=IF(D2=0,"",D18/D2)',ActiveSheet);
      TcxSSHelper.SetCellText(4,18,'=IF(E2=0,"",E18/E2)',ActiveSheet);
      TcxSSHelper.SetCellText(5,18,'=IF(F2=0,"",F18/F2)',ActiveSheet);
      TcxSSHelper.SetCellText(6,18,'=IF(G2=0,"",G18/G2)',ActiveSheet);
      TcxSSHelper.SetCellText(7,18,'=IF(H2=0,"",H18/H2)',ActiveSheet);
      TcxSSHelper.SetCellText(8,18,'=IF(I2=0,"",I18/I2)',ActiveSheet);
      TcxSSHelper.SetCellText(9,18,'=IF(J2=0,"",J18/J2)',ActiveSheet);
      TcxSSHelper.SetCellText(10,18,'=IF(K2=0,"",K18/K2)',ActiveSheet);
      TcxSSHelper.SetCellText(11,18,'=IF(L2=0,"",L18/L2)',ActiveSheet);
      TcxSSHelper.SetCellText(12,18,'=IF(M2=0,"",M18/M2)',ActiveSheet);
      TcxSSHelper.SetCellText(13,18,'=IF(N2=0,"",N18/N2)',ActiveSheet);
      TcxSSHelper.SetCellText(14,18,'=IF(O2=0,"",O18/O2)',ActiveSheet);
      TcxSSHelper.SetCellText(15,18,'=IF(P2=0,"",P18/P2)',ActiveSheet);
      TcxSSHelper.SetCellText(16,18,'=IF(Q2=0,"",Q18/Q2)',ActiveSheet);
      TcxSSHelper.SetCellText(17,18,'=IF(R2=0,"",R18/R2)',ActiveSheet);
      TcxSSHelper.SetCellText(18,18,'=IF(S2=0,"",S18/S2)',ActiveSheet);
      TcxSSHelper.SetCellText(19,18,'=IF(T2=0,"",T18/T2)',ActiveSheet);
      TcxSSHelper.SetCellText(20,18,'=IF(U2=0,"",U18/U2)',ActiveSheet);
      TcxSSHelper.SetCellText(21,18,'=IF(V2=0,"",V18/V2)',ActiveSheet);
      TcxSSHelper.SetCellText(22,18,'=IF(W2=0,"",W18/W2)',ActiveSheet);
      TcxSSHelper.SetCellText(23,18,'=IF(X2=0,"",X18/X2)',ActiveSheet);
      TcxSSHelper.SetCellText(24,18,'=IF(Y2=0,"",Y18/Y2)',ActiveSheet);
      TcxSSHelper.SetCellText(25,18,'=IF(Z2=0,"",Z18/Z2)',ActiveSheet);
      TcxSSHelper.SetCellText(26,18,'=IF(AA2=0,"",AA18/AA2)',ActiveSheet);

      // Yearling Intake/ha/day (LxM)
      TcxSSHelper.SetCellText(3,20,'=(D19*D20)',ActiveSheet);
      TcxSSHelper.SetCellText(4,20,'=(E19*E20)',ActiveSheet);
      TcxSSHelper.SetCellText(5,20,'=(F19*F20)',ActiveSheet);
      TcxSSHelper.SetCellText(6,20,'=(G19*G20)',ActiveSheet);
      TcxSSHelper.SetCellText(7,20,'=(H19*H20)',ActiveSheet);
      TcxSSHelper.SetCellText(8,20,'=(I19*I20)',ActiveSheet);
      TcxSSHelper.SetCellText(9,20,'=(J19*J20)',ActiveSheet);
      TcxSSHelper.SetCellText(10,20,'=(K19*K20)',ActiveSheet);
      TcxSSHelper.SetCellText(11,20,'=(L19*L20)',ActiveSheet);
      TcxSSHelper.SetCellText(12,20,'=(M19*M20)',ActiveSheet);
      TcxSSHelper.SetCellText(13,20,'=(N19*N20)',ActiveSheet);
      TcxSSHelper.SetCellText(14,20,'=(O19*O20)',ActiveSheet);
      TcxSSHelper.SetCellText(15,20,'=(P19*P20)',ActiveSheet);
      TcxSSHelper.SetCellText(16,20,'=(Q19*Q20)',ActiveSheet);
      TcxSSHelper.SetCellText(17,20,'=(R19*R20)',ActiveSheet);
      TcxSSHelper.SetCellText(18,20,'=(S19*S20)',ActiveSheet);
      TcxSSHelper.SetCellText(19,20,'=(T19*T20)',ActiveSheet);
      TcxSSHelper.SetCellText(20,20,'=(U19*U20)',ActiveSheet);
      TcxSSHelper.SetCellText(21,20,'=(V19*V20)',ActiveSheet);
      TcxSSHelper.SetCellText(22,20,'=(W19*W20)',ActiveSheet);
      TcxSSHelper.SetCellText(23,20,'=(X19*X20)',ActiveSheet);
      TcxSSHelper.SetCellText(24,20,'=(Y19*Y20)',ActiveSheet);
      TcxSSHelper.SetCellText(25,20,'=(Z19*Z20)',ActiveSheet);
      TcxSSHelper.SetCellText(26,20,'=(AA19*AA20)',ActiveSheet);

      // Weanlings/ha (O/A)
      TcxSSHelper.SetCellText(3,23,'=IF(D2=0,"",D23/D2)',ActiveSheet);
      TcxSSHelper.SetCellText(4,23,'=IF(E2=0,"",E23/E2)',ActiveSheet);
      TcxSSHelper.SetCellText(5,23,'=IF(F2=0,"",F23/F2)',ActiveSheet);
      TcxSSHelper.SetCellText(6,23,'=IF(G2=0,"",G23/G2)',ActiveSheet);
      TcxSSHelper.SetCellText(7,23,'=IF(H2=0,"",H23/H2)',ActiveSheet);
      TcxSSHelper.SetCellText(8,23,'=IF(I2=0,"",I23/I2)',ActiveSheet);
      TcxSSHelper.SetCellText(9,23,'=IF(J2=0,"",J23/J2)',ActiveSheet);
      TcxSSHelper.SetCellText(10,23,'=IF(K2=0,"",K23/K2)',ActiveSheet);
      TcxSSHelper.SetCellText(11,23,'=IF(L2=0,"",L23/L2)',ActiveSheet);
      TcxSSHelper.SetCellText(12,23,'=IF(M2=0,"",M23/M2)',ActiveSheet);
      TcxSSHelper.SetCellText(13,23,'=IF(N2=0,"",N23/N2)',ActiveSheet);
      TcxSSHelper.SetCellText(14,23,'=IF(O2=0,"",O23/O2)',ActiveSheet);
      TcxSSHelper.SetCellText(15,23,'=IF(P2=0,"",P23/P2)',ActiveSheet);
      TcxSSHelper.SetCellText(16,23,'=IF(Q2=0,"",Q23/Q2)',ActiveSheet);
      TcxSSHelper.SetCellText(17,23,'=IF(R2=0,"",R23/R2)',ActiveSheet);
      TcxSSHelper.SetCellText(18,23,'=IF(S2=0,"",S23/S2)',ActiveSheet);
      TcxSSHelper.SetCellText(19,23,'=IF(T2=0,"",T23/T2)',ActiveSheet);
      TcxSSHelper.SetCellText(20,23,'=IF(U2=0,"",U23/U2)',ActiveSheet);
      TcxSSHelper.SetCellText(21,23,'=IF(V2=0,"",V23/V2)',ActiveSheet);
      TcxSSHelper.SetCellText(22,23,'=IF(W2=0,"",W23/W2)',ActiveSheet);
      TcxSSHelper.SetCellText(23,23,'=IF(X2=0,"",X23/X2)',ActiveSheet);
      TcxSSHelper.SetCellText(24,23,'=IF(Y2=0,"",Y23/Y2)',ActiveSheet);
      TcxSSHelper.SetCellText(25,23,'=IF(Z2=0,"",Z23/Z2)',ActiveSheet);
      TcxSSHelper.SetCellText(26,23,'=IF(AA2=0,"",AA23/AA2)',ActiveSheet);

      // Weanling intake/ha/day (P x Q)
      TcxSSHelper.SetCellText(3,25,'=(D24*D25)',ActiveSheet);
      TcxSSHelper.SetCellText(4,25,'=(E24*E25)',ActiveSheet);
      TcxSSHelper.SetCellText(5,25,'=(F24*F25)',ActiveSheet);
      TcxSSHelper.SetCellText(6,25,'=(G24*G25)',ActiveSheet);
      TcxSSHelper.SetCellText(7,25,'=(H24*H25)',ActiveSheet);
      TcxSSHelper.SetCellText(8,25,'=(I24*I25)',ActiveSheet);
      TcxSSHelper.SetCellText(9,25,'=(J24*J25)',ActiveSheet);
      TcxSSHelper.SetCellText(10,25,'=(K24*K25)',ActiveSheet);
      TcxSSHelper.SetCellText(11,25,'=(L24*L25)',ActiveSheet);
      TcxSSHelper.SetCellText(12,25,'=(M24*M25)',ActiveSheet);
      TcxSSHelper.SetCellText(13,25,'=(N24*N25)',ActiveSheet);
      TcxSSHelper.SetCellText(14,25,'=(O24*O25)',ActiveSheet);
      TcxSSHelper.SetCellText(15,25,'=(P24*P25)',ActiveSheet);
      TcxSSHelper.SetCellText(16,25,'=(Q24*Q25)',ActiveSheet);
      TcxSSHelper.SetCellText(17,25,'=(R24*R25)',ActiveSheet);
      TcxSSHelper.SetCellText(18,25,'=(S24*S25)',ActiveSheet);
      TcxSSHelper.SetCellText(19,25,'=(T24*T25)',ActiveSheet);
      TcxSSHelper.SetCellText(20,25,'=(U24*U25)',ActiveSheet);
      TcxSSHelper.SetCellText(21,25,'=(V24*V25)',ActiveSheet);
      TcxSSHelper.SetCellText(22,25,'=(W24*W25)',ActiveSheet);
      TcxSSHelper.SetCellText(23,25,'=(X24*X25)',ActiveSheet);
      TcxSSHelper.SetCellText(24,25,'=(Y24*Y25)',ActiveSheet);
      TcxSSHelper.SetCellText(25,25,'=(Z24*Z25)',ActiveSheet);
      TcxSSHelper.SetCellText(26,25,'=(AA24*AA25)',ActiveSheet);

      // Populate Area in Rotation
      for i := BiWeekIndex_ColIndex to 26 do
         begin
            TcxSSHelper.SetCellText(i, 1,FloatToStr(RotationArea),ActiveSheet);
         end;

      // Populate Number of milking cows up tp dry off!
      for i := 1 to DriedOffBiWeekIndex-1 do
         begin
            case i of
               1 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalJAN_F1),ActiveSheet);
               2 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalJAN_F2),ActiveSheet);
               3 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalFEB_F1),ActiveSheet);
               4 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalFEB_F2),ActiveSheet);
               5 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalMAR_F1),ActiveSheet);
               6 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalMAR_F2),ActiveSheet);
               7 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalAPR_F1),ActiveSheet);
               8 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalAPR_F2),ActiveSheet);
               9 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalMAY_F1),ActiveSheet);
               10 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalMAY_F2),ActiveSheet);
               11 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalJUN_F1),ActiveSheet);
               12 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalJUN_F2),ActiveSheet);
               13 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalJUL_F1),ActiveSheet);
               14 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalJUL_F2),ActiveSheet);
               15 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalAUG_F1),ActiveSheet);
               16 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalAUG_F2),ActiveSheet);
               17 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalSEPT_F1),ActiveSheet);
               18 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalSEPT_F2),ActiveSheet);
               19 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalOCT_F1),ActiveSheet);
               20 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalOCT_F2),ActiveSheet);
               21 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalNOV_F1),ActiveSheet);
               22 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalNOV_F2),ActiveSheet);
               23 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalDEC_F1),ActiveSheet);
               24 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvings.TotalDEC_F2),ActiveSheet);
            end;
         end;

      // Populate Number of predicted milking cows after dry off!
      for i := DriedOffBiWeekIndex to 24  do
         begin
            case i of
               1 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalJAN_F1),ActiveSheet);
               2 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalJAN_F2),ActiveSheet);
               3 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalFEB_F1),ActiveSheet);
               4 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalFEB_F2),ActiveSheet);
               5 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalMAR_F1),ActiveSheet);
               6 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalMAR_F2),ActiveSheet);
               7 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalAPR_F1),ActiveSheet);
               8 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalAPR_F2),ActiveSheet);
               9 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalMAY_F1),ActiveSheet);
               10 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalMAY_F2),ActiveSheet);
               11 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalJUN_F1),ActiveSheet);
               12 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalJUN_F2),ActiveSheet);
               13 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalJUL_F1),ActiveSheet);
               14 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalJUL_F2),ActiveSheet);
               15 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalAUG_F1),ActiveSheet);
               16 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalAUG_F2),ActiveSheet);
               17 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalSEPT_F1),ActiveSheet);
               18 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalSEPT_F2),ActiveSheet);
               19 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalOCT_F1),ActiveSheet);
               20 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalOCT_F2),ActiveSheet);
               21 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalNOV_F1),ActiveSheet);
               22 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalNOV_F2),ActiveSheet);
               23 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalDEC_F1),ActiveSheet);
               24 : TcxSSHelper.SetCellText(i+2, 6,IntToStr(ProjectedCalvingsPostDry.TotalDEC_F2),ActiveSheet);
            end;
         end;

      // insert all dry cows.
      for i := BiWeekIndex_ColIndex to 24 do
         begin
            case i of
               1 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               2 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               3 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               4 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               5 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               6 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               7 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               8 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               9 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               10 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               11 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               12 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               13 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               14 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               15 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               16 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               17 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               18 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               19 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               20 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               21 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               22 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               23 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
               24 : TcxSSHelper.SetCellText(i, 12,IntToStr(DryCows),ActiveSheet);
            end;
         end;


      // Populate Number of predicted dry cows after
      for i := DriedOffBiWeekIndex to 24  do
         begin
            case i of
               1 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalJAN_F1),ActiveSheet);
               2 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalJAN_F2),ActiveSheet);
               3 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalFEB_F1),ActiveSheet);
               4 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalFEB_F2),ActiveSheet);
               5 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalMAR_F1),ActiveSheet);
               6 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalMAR_F2),ActiveSheet);
               7 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalAPR_F1),ActiveSheet);
               8 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalAPR_F2),ActiveSheet);
               9 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalMAY_F1),ActiveSheet);
               10 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalMAY_F2),ActiveSheet);
               11 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalJUN_F1),ActiveSheet);
               12 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalJUN_F2),ActiveSheet);
               13 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalJUL_F1),ActiveSheet);
               14 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalJUL_F2),ActiveSheet);
               15 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalAUG_F1),ActiveSheet);
               16 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalAUG_F2),ActiveSheet);
               17 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalSEPT_F1),ActiveSheet);
               18 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalSEPT_F2),ActiveSheet);
               19 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalOCT_F1),ActiveSheet);
               20 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalOCT_F2),ActiveSheet);
               21 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalNOV_F1),ActiveSheet);
               22 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalNOV_F2),ActiveSheet);
               23 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalDEC_F1),ActiveSheet);
               24 : TcxSSHelper.SetCellText(i+2, 12,IntToStr(AllCows-ProjectedCalvingsPostDry.TotalDEC_F2),ActiveSheet);
            end;
         end;


      // insert all dry cows.
      for i := BiWeekIndex_ColIndex to 26 do
         begin
            TcxSSHelper.SetCellText(i, 17,IntToStr(Yearlings),ActiveSheet);
            TcxSSHelper.SetCellText(i, 22,IntToStr(Weanlings),ActiveSheet);
         end;

      // TOTAL INTAKE/HA/DAY - S
      TcxSSHelper.SetCellText(3,27,'=(D10+D16+D21+D26)',ActiveSheet);
      TcxSSHelper.SetCellText(4,27,'=(E10+E16+E21+E26)',ActiveSheet);
      TcxSSHelper.SetCellText(5,27,'=(F10+F16+F21+F26)',ActiveSheet);
      TcxSSHelper.SetCellText(6,27,'=(G10+G16+G21+G26)',ActiveSheet);
      TcxSSHelper.SetCellText(7,27,'=(H10+H16+H21+H26)',ActiveSheet);
      TcxSSHelper.SetCellText(8,27,'=(I10+I16+I21+I26)',ActiveSheet);
      TcxSSHelper.SetCellText(9,27,'=(J10+J16+J21+J26)',ActiveSheet);
      TcxSSHelper.SetCellText(10,27,'=(K10+K16+K21+K26)',ActiveSheet);
      TcxSSHelper.SetCellText(11,27,'=(L10+L16+L21+L26)',ActiveSheet);
      TcxSSHelper.SetCellText(12,27,'=(M10+M16+M21+M26)',ActiveSheet);
      TcxSSHelper.SetCellText(13,27,'=(N10+N16+N21+N26)',ActiveSheet);
      TcxSSHelper.SetCellText(14,27,'=(O10+O16+O21+O26)',ActiveSheet);
      TcxSSHelper.SetCellText(15,27,'=(P10+P16+P21+P26)',ActiveSheet);
      TcxSSHelper.SetCellText(16,27,'=(Q10+Q16+Q21+Q26)',ActiveSheet);
      TcxSSHelper.SetCellText(17,27,'=(R10+R16+R21+R26)',ActiveSheet);
      TcxSSHelper.SetCellText(18,27,'=(S10+S16+S21+S26)',ActiveSheet);
      TcxSSHelper.SetCellText(19,27,'=(T10+T16+T21+T26)',ActiveSheet);
      TcxSSHelper.SetCellText(20,27,'=(U10+U16+U21+U26)',ActiveSheet);
      TcxSSHelper.SetCellText(21,27,'=(V10+V16+V21+V26)',ActiveSheet);
      TcxSSHelper.SetCellText(22,27,'=(W10+W16+W21+W26)',ActiveSheet);
      TcxSSHelper.SetCellText(23,27,'=(X10+X16+X21+X26)',ActiveSheet);
      TcxSSHelper.SetCellText(24,27,'=(Y10+Y16+Y21+Y26)',ActiveSheet);
      TcxSSHelper.SetCellText(25,27,'=(Z10+Z16+Z21+Z26)',ActiveSheet);
      TcxSSHelper.SetCellText(26,27,'=(AA10+AA16+AA21+AA26)',ActiveSheet);

      TcxSSHelper.SetCellReadOnly(0,2,27,4,True,ActiveSheet);
      TcxSSHelper.SetCellReadOnly(0,2,2,27,True,ActiveSheet);

      AutoRecalc := True;
      ActivePage := 0;
      ssbGrassIntakeSetSelection(nil,ActiveSheet);

    Finally
      EndUpdate;
    end;
  end;
end;


procedure TfmGrassBudgetSimplified.ssbGrassIntakeSetSelection(
  Sender: TObject; ASheet: TcxSSBookSheet);
var
  CellObject: TcxSSCellObject;
begin
  CellObject := ASheet.GetCellObject(ASheet.SelectionRect.Left, ASheet.SelectionRect.Top);
  try
    FIsUpdate := True;
    edtCellEdit.Text := CellObject.Text;
    pnCellsRect.Caption := TcxSSHelper.GetCellText(False, ASheet);
  finally
    CellObject.Free;
    FIsUpdate := False;
  end;
end;

procedure TfmGrassBudgetSimplified.blbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmGrassBudgetSimplified.dxBarLargeButton1Click(Sender: TObject);
var
   FileName : TFileName;
begin
   if SaveDialog.Execute then
      begin
         FileName := SaveDialog.FileName;
         if PageControl.ActivePage = tsGrassIntake then
            ssbGrassIntake.SaveToFile(FileName)
         else
            ssGrassGrowth.SaveToFile(FileName);
         MessageDlg(Format('File saved to "%s"',[FileName]),mtInformation,[mbOK],0);
      end;
end;

procedure TfmGrassBudgetSimplified.dxBarLargeButton2Click(Sender: TObject);
var
   FileName : TFileName;
begin
   if OPenDialog.Execute then
      begin
         FileName := OpenDialog.FileName;
         if PageControl.ActivePage = tsGrassIntake then
            ssbGrassIntake.LoadFromFile(FileName)
         else
            ssGrassGrowth.LoadFromFile(FileName);
      end;
end;

procedure TfmGrassBudgetSimplified.CreateGrassGrowthSpreadSheet;
var
  ColHeader, RowHeader : TcxSSHeader;
  i, j : Integer;
begin
  with ssGrassGrowth do
  begin
    BeginUpdate;

    Try
      AutoRecalc := False;
      ActivePage := 1;                                     // turn our attention to the first page
      ActiveSheet.Caption := 'Grass Growth';                    // set the page caption for the first page

      RowHeader := ActiveSheet.Rows;
      RowHeader[12] := 35;
      RowHeader[14] := 35;

      for i := 0 to 14 do
         for j := 0 to 26 do
            begin
               TcxSSHelper.SetCellFont(j, i,j,i,[],8,ActiveSheet, 'Arial');         // set the title and column header fonts
            end;

      for i := 0 to 14 do
         for j := 0 to 26 do
            begin
               TcxSSHelper.SetCellBorders(j,i,j,i, 2, lsThin,ActiveSheet);
               TcxSSHelper.SetCellBorders(j,i,j,i, 1, lsThin,ActiveSheet);
            end;



      ColHeader := ActiveSheet.Cols;
      ColHeader.Size[0] :=  28;
      for I := 1 to 2 do ColHeader.Size[I] :=  115;
      for I := 3 to 30 do ColHeader.Size[I] :=  42;
      for I := 3 to 26 do
        if (i in [3,5,7,9,11,13,15,17,19,21,23,25]) then
           TcxSSHelper.SetCellText(i, 1,'F1',ActiveSheet)
        else
           TcxSSHelper.SetCellText(i, 1,'F2',ActiveSheet);

     with GrassIntakeRecord do
        begin
           TcxSSHelper.SetCellText(3, 4, FloatToStr(TotalIntakeJan_F1),ActiveSheet);
           TcxSSHelper.SetCellText(4, 4, FloatToStr(TotalIntakeJan_F2),ActiveSheet);
           TcxSSHelper.SetCellText(5, 4, FloatToStr(TotalIntakeFeb_F1),ActiveSheet);
           TcxSSHelper.SetCellText(6, 4, FloatToStr(TotalIntakeFeb_F2),ActiveSheet);
           TcxSSHelper.SetCellText(7, 4, FloatToStr(TotalIntakeMar_F1),ActiveSheet);
           TcxSSHelper.SetCellText(8, 4, FloatToStr(TotalIntakeMar_F2),ActiveSheet);
           TcxSSHelper.SetCellText(9, 4, FloatToStr(TotalIntakeApr_F1),ActiveSheet);
           TcxSSHelper.SetCellText(10, 4, FloatToStr(TotalIntakeApr_F2),ActiveSheet);
           TcxSSHelper.SetCellText(11, 4, FloatToStr(TotalIntakeMay_F1),ActiveSheet);
           TcxSSHelper.SetCellText(12, 4, FloatToStr(TotalIntakeMay_F2),ActiveSheet);
           TcxSSHelper.SetCellText(13, 4, FloatToStr(TotalIntakeJun_F1),ActiveSheet);
           TcxSSHelper.SetCellText(14, 4, FloatToStr(TotalIntakeJun_F2),ActiveSheet);
           TcxSSHelper.SetCellText(15, 4, FloatToStr(TotalIntakeJul_F1),ActiveSheet);
           TcxSSHelper.SetCellText(16, 4, FloatToStr(TotalIntakeJul_F2),ActiveSheet);
           TcxSSHelper.SetCellText(17, 4, FloatToStr(TotalIntakeAug_F1),ActiveSheet);
           TcxSSHelper.SetCellText(18, 4, FloatToStr(TotalIntakeAug_F2),ActiveSheet);
           TcxSSHelper.SetCellText(19, 4, FloatToStr(TotalIntakeSept_F1),ActiveSheet);
           TcxSSHelper.SetCellText(20, 4, FloatToStr(TotalIntakeSept_F2),ActiveSheet);
           TcxSSHelper.SetCellText(21, 4, FloatToStr(TotalIntakeOct_F1),ActiveSheet);
           TcxSSHelper.SetCellText(22, 4, FloatToStr(TotalIntakeOct_F2),ActiveSheet);
           TcxSSHelper.SetCellText(23, 4, FloatToStr(TotalIntakeNov_F1),ActiveSheet);
           TcxSSHelper.SetCellText(24, 4, FloatToStr(TotalIntakeNov_F2),ActiveSheet);
           TcxSSHelper.SetCellText(25, 4, FloatToStr(TotalIntakeDec_F1),ActiveSheet);
           TcxSSHelper.SetCellText(26, 4, FloatToStr(TotalIntakeDec_F2),ActiveSheet);
       end;

      TcxSSHelper.SetCellBorders(BiWeekIndex_ColIndex, 2, BiWeekIndex_ColIndex, 14, 0 , lsThick,ActiveSheet);
//      TcxSSHelper.SetCellBorders(BiWeekIndex_ColIndex, 2, BiWeekIndex_ColIndex, 2, 1, lsThick,ActiveSheet);

      ChangeCellFormat([3..26],[4,6,8,10,12,14], 4);

      TcxSSHelper.SetCellPattern(0,0,26,1,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1,2,26,2,33, 1, fsSolid,ActiveSheet);

      TcxSSHelper.SetCellPattern(0,3,0,3,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,2,0,2,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,4,0,4,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,5,0,5,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,6,0,6,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,7,0,7,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,8,0,8,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,9,0,9,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,10,0,10,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,11,0,11,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,12,0,12,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,13,0,13,14,1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(0,14,0,14,14,1, fsSolid,ActiveSheet);


      TcxSSHelper.SetCellPattern(1, 4, 26, 4, 18, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 6, 26, 6, 18, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 8, 26, 8, 33, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 10, 26, 10, 33, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 12, 26, 12, 33, 1, fsSolid,ActiveSheet);
      TcxSSHelper.SetCellPattern(1, 14, 26, 14, 33, 1, fsSolid,ActiveSheet);


      TcxSSHelper.SetCellAlignment(3,0,26,2,haCenter,vaCenter,ActiveSheet);
      TcxSSHelper.SetCellFont(3,0,26,1,[fsBold], 8,ActiveSheet, 'Arial');



      TcxSSHelper.SetCellText(3, 0, 'January',ActiveSheet);
      TcxSSHelper.SetCellMerge(3,0,4,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(3, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(4, 2,'16',ActiveSheet);
      TcxSSHelper.SetCellMerge(3,0,4,0,True,ActiveSheet);

      TcxSSHelper.SetCellText(5, 0,'February',ActiveSheet);
      TcxSSHelper.SetCellMerge(5,0,6,0,True,ActiveSheet);

      if IsLeapYear(CurrentYear) then
         begin
            TcxSSHelper.SetCellText(5, 2,'14',ActiveSheet);
            TcxSSHelper.SetCellText(6, 2,'15',ActiveSheet);
         end
      else
         begin
            TcxSSHelper.SetCellText(5, 2,'14',ActiveSheet);
            TcxSSHelper.SetCellText(6, 2,'14',ActiveSheet);
         end;

      TcxSSHelper.SetCellText(7, 0,'March',ActiveSheet);
      TcxSSHelper.SetCellMerge(7,0,8,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(7, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(8, 2,'16',ActiveSheet);

      TcxSSHelper.SetCellText(9, 0,'April',ActiveSheet);
      TcxSSHelper.SetCellMerge(9,0,10,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(9, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(10, 2,'15',ActiveSheet);

      TcxSSHelper.SetCellText(11, 0,'May',ActiveSheet);
      TcxSSHelper.SetCellMerge(11,0,12,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(11, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(12, 2,'16',ActiveSheet);

      TcxSSHelper.SetCellText(13, 0,'June',ActiveSheet);
      TcxSSHelper.SetCellMerge(13,0,14,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(13, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(14, 2,'15',ActiveSheet);

      TcxSSHelper.SetCellText(15, 0,'July',ActiveSheet);
      TcxSSHelper.SetCellMerge(15,0,16,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(15, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(16, 2,'16',ActiveSheet);

      TcxSSHelper.SetCellText(17, 0,'August',ActiveSheet);
      TcxSSHelper.SetCellMerge(17,0,18,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(17, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(18, 2,'16',ActiveSheet);

      TcxSSHelper.SetCellText(19, 0,'September',ActiveSheet);
      TcxSSHelper.SetCellMerge(19,0,20,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(19, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(20, 2,'15',ActiveSheet);

      TcxSSHelper.SetCellText(21, 0,'October',ActiveSheet);
      TcxSSHelper.SetCellMerge(21,0,22,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(21, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(22, 2,'16',ActiveSheet);

      TcxSSHelper.SetCellText(23, 0,'November',ActiveSheet);
      TcxSSHelper.SetCellMerge(23,0,24,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(23, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(24, 2,'15',ActiveSheet);

      TcxSSHelper.SetCellText(25, 0,'December',ActiveSheet);
      TcxSSHelper.SetCellMerge(25,0,26,0,True,ActiveSheet);
      TcxSSHelper.SetCellText(25, 2,'15',ActiveSheet);
      TcxSSHelper.SetCellText(26, 2,'16',ActiveSheet);



      TcxSSHelper.SetCellText(0, 2, 'B',ActiveSheet);
      TcxSSHelper.SetCellText(1, 2, 'Days',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,2,2,2,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 3, 'INTAKE/HA/DAY (PREV. PAGE)',ActiveSheet);
      TcxSSHelper.SetCellFont(0,3,2,3,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(0,3,2,3,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 4, 'S',ActiveSheet);
      TcxSSHelper.SetCellText(1, 4, 'Intake/ha/day',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,4,2,4,True,ActiveSheet);;

      TcxSSHelper.SetCellText(0, 5, 'GRASS GROWTH/HA/DAY',ActiveSheet);
      TcxSSHelper.SetCellFont(0,5,2,5,[fsBold],8,ActiveSheet,'Arial');
      TcxSSHelper.SetCellMerge(0,5,2,5,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 6, 'T',ActiveSheet);
      TcxSSHelper.SetCellText(1, 6, 'Grass Growth Rate (Kg DM/Ha/Day)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,6,2,6,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 7, 'SURPLUS or DEFICIT/HA/DAY',ActiveSheet);
      TcxSSHelper.SetCellFont(0,7,2,7,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(0,7,2,7,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 8, 'U',ActiveSheet);
      TcxSSHelper.SetCellText(1, 8, 'Surplus/Deficit (T-S) (Kg DM/Ha/Day)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,8,2,8,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 9, 'CHANGE IN GRASS COVER DURING FORTNIGHT',ActiveSheet);
      TcxSSHelper.SetCellFont(0,9,2,9,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(0,9,2,9,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 10, 'V',ActiveSheet);
      TcxSSHelper.SetCellText(1, 10, 'Change (U x B)',ActiveSheet);
      TcxSSHelper.SetCellMerge(1,10,2,10,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 11, 'AVERAGE PASTURE COVER IN EACH FORTNIGHT',ActiveSheet);
      TcxSSHelper.SetCellFont(0,11,2,11,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(0,11,2,11,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 12, 'E',ActiveSheet);
      TcxSSHelper.SetCellText(1, 12, 'Add Change in cover (V) to calculate new cover at the end of each fortnight',ActiveSheet);
      TcxSSHelper.SetCellWordBreak(1, 12, 1, 12, True,ActiveSheet);
      TcxSSHelper.SetCellMerge(1,12,2,12,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 13, 'AVERAGE PASTURE COVER IN EACH FORTNIGHT',ActiveSheet);
      TcxSSHelper.SetCellFont(0,13,2,13,[fsBold],8,ActiveSheet, 'Arial');
      TcxSSHelper.SetCellMerge(0,13,2,13,True,ActiveSheet);

      TcxSSHelper.SetCellText(0, 14, 'E',ActiveSheet);
      TcxSSHelper.SetCellText(1, 14, 'Add Change in cover (V) to calculate target cover for each fortnight',ActiveSheet);
      TcxSSHelper.SetCellWordBreak(1, 14, 1, 14, True,ActiveSheet);
      TcxSSHelper.SetCellMerge(1,14,2,14,True,ActiveSheet);


      TcxSSHelper.SetCellText(3,8,'=D7-D5',ActiveSheet);
      TcxSSHelper.SetCellText(4,8,'=E7-E5',ActiveSheet);
      TcxSSHelper.SetCellText(5,8,'=F7-F5',ActiveSheet);
      TcxSSHelper.SetCellText(6,8,'=G7-G5',ActiveSheet);
      TcxSSHelper.SetCellText(7,8,'=H7-H5',ActiveSheet);
      TcxSSHelper.SetCellText(8,8,'=I7-I5',ActiveSheet);
      TcxSSHelper.SetCellText(9,8,'=J7-J5',ActiveSheet);
      TcxSSHelper.SetCellText(10,8,'=K7-K5',ActiveSheet);
      TcxSSHelper.SetCellText(11,8,'=L7-L5',ActiveSheet);
      TcxSSHelper.SetCellText(12,8,'=M7-M5',ActiveSheet);
      TcxSSHelper.SetCellText(13,8,'=N7-N5',ActiveSheet);
      TcxSSHelper.SetCellText(14,8,'=O7-O5',ActiveSheet);
      TcxSSHelper.SetCellText(15,8,'=P7-P5',ActiveSheet);
      TcxSSHelper.SetCellText(16,8,'=Q7-Q5',ActiveSheet);
      TcxSSHelper.SetCellText(17,8,'=R7-R5',ActiveSheet);
      TcxSSHelper.SetCellText(18,8,'=S7-S5',ActiveSheet);
      TcxSSHelper.SetCellText(19,8,'=T7-T5',ActiveSheet);
      TcxSSHelper.SetCellText(20,8,'=U7-U5',ActiveSheet);
      TcxSSHelper.SetCellText(21,8,'=V7-V5',ActiveSheet);
      TcxSSHelper.SetCellText(22,8,'=W7-W5',ActiveSheet);
      TcxSSHelper.SetCellText(23,8,'=X7-X5',ActiveSheet);
      TcxSSHelper.SetCellText(24,8,'=Y7-Y5',ActiveSheet);
      TcxSSHelper.SetCellText(25,8,'=Z7-Z5',ActiveSheet);
      TcxSSHelper.SetCellText(26,8,'=AA7-AA5',ActiveSheet);

      TcxSSHelper.SetCellText(3,10,'=D9*D3',ActiveSheet);
      TcxSSHelper.SetCellText(4,10,'=E9*E3',ActiveSheet);
      TcxSSHelper.SetCellText(5,10,'=F9*F3',ActiveSheet);
      TcxSSHelper.SetCellText(6,10,'=G9*G3',ActiveSheet);
      TcxSSHelper.SetCellText(7,10,'=H9*H3',ActiveSheet);
      TcxSSHelper.SetCellText(8,10,'=I9*I3',ActiveSheet);
      TcxSSHelper.SetCellText(9,10,'=J9*J3',ActiveSheet);
      TcxSSHelper.SetCellText(10,10,'=K9*K3',ActiveSheet);
      TcxSSHelper.SetCellText(11,10,'=L9*L3',ActiveSheet);
      TcxSSHelper.SetCellText(12,10,'=M9*M3',ActiveSheet);
      TcxSSHelper.SetCellText(13,10,'=N9*N3',ActiveSheet);
      TcxSSHelper.SetCellText(14,10,'=O9*O3',ActiveSheet);
      TcxSSHelper.SetCellText(15,10,'=P9*P3',ActiveSheet);
      TcxSSHelper.SetCellText(16,10,'=Q9*Q3',ActiveSheet);
      TcxSSHelper.SetCellText(17,10,'=R9*R3',ActiveSheet);
      TcxSSHelper.SetCellText(18,10,'=S9*S3',ActiveSheet);
      TcxSSHelper.SetCellText(19,10,'=T9*T3',ActiveSheet);
      TcxSSHelper.SetCellText(20,10,'=U9*U3',ActiveSheet);
      TcxSSHelper.SetCellText(21,10,'=V9*V3',ActiveSheet);
      TcxSSHelper.SetCellText(22,10,'=W9*W3',ActiveSheet);
      TcxSSHelper.SetCellText(23,10,'=X9*X3',ActiveSheet);
      TcxSSHelper.SetCellText(24,10,'=Y9*Y3',ActiveSheet);
      TcxSSHelper.SetCellText(25,10,'=Z9*Z3',ActiveSheet);
      TcxSSHelper.SetCellText(26,10,'=AA9*AA3',ActiveSheet);

      TcxSSHelper.SetCellText(3,12,'=D11',ActiveSheet);
      TcxSSHelper.SetCellText(4,12,'=D13+E11',ActiveSheet);
      TcxSSHelper.SetCellText(5,12,'=E13+F11',ActiveSheet);
      TcxSSHelper.SetCellText(6,12,'=F13+G11',ActiveSheet);
      TcxSSHelper.SetCellText(7,12,'=G13+H11',ActiveSheet);
      TcxSSHelper.SetCellText(8,12,'=H13+I11',ActiveSheet);
      TcxSSHelper.SetCellText(9,12,'=I13+J11',ActiveSheet);
      TcxSSHelper.SetCellText(10,12,'=J13+K11',ActiveSheet);
      TcxSSHelper.SetCellText(11,12,'=K13+L11',ActiveSheet);
      TcxSSHelper.SetCellText(12,12,'=L13+M11',ActiveSheet);

      TcxSSHelper.SetCellText(13,12,'=M13+N11',ActiveSheet);
      TcxSSHelper.SetCellText(14,12,'=N13+O11',ActiveSheet);
      TcxSSHelper.SetCellText(15,12,'=O13+P11',ActiveSheet);
      TcxSSHelper.SetCellText(16,12,'=P13+Q11',ActiveSheet);
      TcxSSHelper.SetCellText(17,12,'=Q13+R11',ActiveSheet);
      TcxSSHelper.SetCellText(18,12,'=R13+S11',ActiveSheet);
      TcxSSHelper.SetCellText(19,12,'=S13+T11',ActiveSheet);
      TcxSSHelper.SetCellText(20,12,'=T13+U11',ActiveSheet);
      TcxSSHelper.SetCellText(21,12,'=U13+V11',ActiveSheet);
      TcxSSHelper.SetCellText(22,12,'=V13+W11',ActiveSheet);
      TcxSSHelper.SetCellText(23,12,'=W13+X11',ActiveSheet);
      TcxSSHelper.SetCellText(24,12,'=X13+Y11',ActiveSheet);
      TcxSSHelper.SetCellText(25,12,'=Y13+Z11',ActiveSheet);
      TcxSSHelper.SetCellText(26,12,'=ZA13+AA11',ActiveSheet);


      AutoRecalc := True;
      ActivePage := 0;
      ssGrassGrowthSetSelection(nil,ActiveSheet);
    Finally
      EndUpdate;
    end;
  end;

end;

procedure TfmGrassBudgetSimplified.FormActivate(Sender: TObject);
begin
CreateGrassIntakeSpreadSheet;
end;

procedure TfmGrassBudgetSimplified.ChangeCellFormat(ACols,
  ACells: TByteNumbersSet; AFormat: Integer);
var
   i , j : Integer;
begin
   for i := Low(TByteNumbers) to High(TByteNumbers) do
      if i in ACols then
         begin
            for j := Low(TByteNumbers) to High(TByteNumbers) do
               if j in  ACells then
                 begin
                    //if PageControl.ActivePage = tsGrassIntake then
                       TcxSSHelper.SetCellFormat(i,j,i,j,AFormat, ssGrassGrowth.ActiveSheet);
                    //else
                       TcxSSHelper.SetCellFormat(i,j,i,j,AFormat, ssbGrassIntake.ActiveSheet);
                 end;

         end;
end;

procedure TfmGrassBudgetSimplified.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
//   pCellInfo.Parent := NewPage;
   if NewPage = tsGrassIntake then
      CreateGrassIntakeSpreadSheet
   else if NewPage = tsGrassGrowth then
      begin
         if PageControl.ActivePage =  tsGrassIntake then
            begin
               // retrieve figures before changing tab.
               with GrassIntakeRecord do
                  begin
                     TotalIntakeJan_F1 := TcxSSHelper.GetCellValue(3,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeJan_F2 := TcxSSHelper.GetCellValue(4,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeFEB_F1 := TcxSSHelper.GetCellValue(5,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeFEB_F2 := TcxSSHelper.GetCellValue(6,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeMAR_F1 := TcxSSHelper.GetCellValue(7,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeMAR_F2 := TcxSSHelper.GetCellValue(8,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeAPR_F1 := TcxSSHelper.GetCellValue(9,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeAPR_F2 := TcxSSHelper.GetCellValue(10,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeMAY_F1 := TcxSSHelper.GetCellValue(11,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeMAY_F2 := TcxSSHelper.GetCellValue(12,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeJUN_F1 := TcxSSHelper.GetCellValue(13,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeJUN_F2 := TcxSSHelper.GetCellValue(14,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeJUL_F1 := TcxSSHelper.GetCellValue(15,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeJUL_F2 := TcxSSHelper.GetCellValue(16,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeAUG_F1 := TcxSSHelper.GetCellValue(17,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeAUG_F2 := TcxSSHelper.GetCellValue(18,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeSEPT_F1 := TcxSSHelper.GetCellValue(19,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeSEPT_F2 := TcxSSHelper.GetCellValue(20,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeOCT_F1 :=  TcxSSHelper.GetCellValue(21,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeOCT_F2 := TcxSSHelper.GetCellValue(22,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeNOV_F1 := TcxSSHelper.GetCellValue(23,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeNOV_F2 :=  TcxSSHelper.GetCellValue(24,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeDEC_F1 := TcxSSHelper.GetCellValue(25,27,ssbGrassIntake.ActiveSheet);
                     TotalIntakeDEC_F2 := TcxSSHelper.GetCellValue(26,27,ssbGrassIntake.ActiveSheet);
                 end;
            end;
         CreateGrassGrowthSpreadSheet
      end;
end;

function TfmGrassBudgetSimplified.GetBiWeekIndex(ADate : TDateTime; AStartIndex : Integer): Integer;
var
  y, m, d : word;
begin
{   DecodeDate(Date, y, m, d);
   case m of
         1 : begin
                if d > 15 then
                   Result := ((StartBiWeekColIndex + 1 ))
                else
                   Result := ((StartBiWeekColIndex ) );
             end;
         2 : begin
                if d > 14 then
                   Result := ((StartBiWeekColIndex + m + 1))
                else
                   Result := ((StartBiWeekColIndex + m ) );
             end
   else
      begin
                if d > 15 then
                   Result := ((StartBiWeekColIndex + m + (m-1)))
                else
                   Result := ((StartBiWeekColIndex + m + (m-2)));
      end;
   end;
}
   DecodeDate(ADate, y, m, d);
   case m of
         1 : begin
                if d > 15 then
                   Result := ((AStartIndex + 1 ))
                else
                   Result := ((AStartIndex ) );
             end;
         2 : begin
                if d > 14 then
                   Result := ((AStartIndex + m + 1))
                else
                   Result := ((AStartIndex + m ) );
             end
   else
      begin
                if d > 15 then
                   Result := ((AStartIndex + m + (m-1)))
                else
                   Result := ((AStartIndex + m + (m-2)));
      end;
   end;
end;

procedure TfmGrassBudgetSimplified.ssGrassGrowthSetSelection(
  Sender: TObject; ASheet: TcxSSBookSheet);
var
  CellObject: TcxSSCellObject;
begin
  CellObject := ASheet.GetCellObject(ASheet.SelectionRect.Left, ASheet.SelectionRect.Top);
  try
    FIsUpdate := True;
    edtCellEdit.Text := CellObject.Text;
    pnCellsRect.Caption := TcxSSHelper.GetCellText(False, ASheet);
  finally
    CellObject.Free;
    FIsUpdate := False;
  end;
end;

function TfmGrassBudgetSimplified.GetRotationArea: Double;
var
   FarmID : Integer;
begin
   FarmID := uSelectFarm.CreateAndShow;
   if (FarmID >-1) then
      begin
         Result := CalcPaddocksRotationArea(FarmID);
      end;
end;

function TfmGrassBudgetSimplified.GetCowsInMilk: Integer;
var
   SQLFilter : TSQLFilter;
begin
   SQLFilter := TSQLFilter.Create;
   try
      SQLFilter.SQLOp := sqlAllStock;
      SQLFilter.StockDate := Date;
      SQLFilter.HerdID := WinData.UserDefaultHerdID;
      Result := SQLFilter.ExecSQL(cMilkingStockOnDate);
   finally
      SQLFilter.Free;
   end;
end;

procedure TfmGrassBudgetSimplified.FormCreate(Sender: TObject);
begin
   PageControl.ActivePage := tsGrassIntake;
   RotationArea := GetRotationArea;
   CowsInMilk := GetCowsInMilk;
   AllCows := GetAllCows;
   DryCows := AllCows - CowsInMilk;
   Weanlings := GetWeanlings;
   Yearlings := GetYearlings;
   BiWeekIndex_ColIndex := GetBiWeekIndex(Date, StartBiWeekColIndex);
   CalcInMilkCows(0,0);
end;

procedure TfmGrassBudgetSimplified.PageControlDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if ATab.IsMainTab then
      begin
         Font.Size := 11;
         Font.Color := clRed;
      end
   else
      begin
         Font.Size := 11;
         Font.Color := clBlack;
      end;

end;

function TfmGrassBudgetSimplified.CalcInMilkCows(ADateFrom,
  ADateTo: TDateTime): Integer;
var
   i : Integer;
   DueToCalveDate : TDateTime;
   NoOfCalves: Integer;
   IsPregnant: String;
   BiWeekIndex : Integer;
   DueCalveBiWeekIndex : Integer;

begin
  { for i := 1 to 26 do
      begin
         if i < CurrentBiWeekIndex then
            MilkingCowRec[i] := 0
         else
            begin
               MilkingCowRec[i] := CowsInMilk;
               Break;
            end;
      end;
   }
   ActualBiWeekIndex := GetBiWeekIndex(Date, 1);
   DriedOffBiWeekIndex := GetBiWeekIndex(DriedOffon.Date, 1);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.ID, A.LactNo                ');
         SQL.Add('FROM Animals A                                ');
         SQL.Add('WHERE (A.AnimalDeleted=False)                 ');
         SQL.ADD('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
         SQL.Add('AND   (Sex = "Female") ');
         SQL.Add('AND   (Inherd=True) ');
         SQL.Add('AND   (Breeding=True) ');
         SQL.Add('AND   (LactNo>0) ');
         Open;
         try
            First;
            while not eof do
               begin
                  DueToCalveDate := WinData.GetProjCalving(FieldByName('ID').AsInteger,FieldByName('LactNo').AsInteger,NoOfCalves,IsPregnant);
                  DueCalveBiWeekIndex := GetBiWeekIndex(DueToCalveDate, 1);
                  if (DueToCalveDate > Date) and (DueToCalveDate < DriedOffon.Date) then
                     begin
                        if DueCalveBiWeekIndex > ActualBiWeekIndex then
                           begin
                              case DueCalveBiWeekIndex of
                                 1 : ProjectedCalvings.TotalJAN_F1 := +1;
                                 2 : ProjectedCalvings.TotalJAN_F2 := +1;
                                 3 : ProjectedCalvings.TotalFEB_F1 := +1;
                                 4 : ProjectedCalvings.TotalFEB_F2 := +1;
                                 5 : ProjectedCalvings.TotalMAR_F1 := +1;
                                 6 : ProjectedCalvings.TotalMAR_F2 := +1;
                                 7 : ProjectedCalvings.TotalAPR_F1 := +1;
                                 8 : ProjectedCalvings.TotalAPR_F2 := +1;
                                 9 : ProjectedCalvings.TotalMAY_F1 := +1;
                                 10 : ProjectedCalvings.TotalMAY_F2 := +1;
                                 11 : ProjectedCalvings.TotalJUN_F1 := +1;
                                 12 : ProjectedCalvings.TotalJUN_F2 := +1;
                                 13 : ProjectedCalvings.TotalJUL_F1 := +1;
                                 14 : ProjectedCalvings.TotalJUL_F2 := +1;
                                 15 : ProjectedCalvings.TotalAUG_F1 := +1;
                                 16 : ProjectedCalvings.TotalAUG_F2 := +1;
                                 17 : ProjectedCalvings.TotalSEPT_F1 := +1;
                                 18 : ProjectedCalvings.TotalSEPT_F2 := +1;
                                 19 : ProjectedCalvings.TotalOCT_F1 := +1;
                                 20 : ProjectedCalvings.TotalOCT_F2 := +1;
                                 21 : ProjectedCalvings.TotalNOV_F1 := +1;
                                 22 : ProjectedCalvings.TotalNOV_F2 := +1;
                                 23 : ProjectedCalvings.TotalDEC_F1 := +1;
                                 24 : ProjectedCalvings.TotalDEC_F2 := +1;
                              end;
                           end;
                     end
                  else if (DueToCalveDate > Date) and (DueToCalveDate > DriedOffon.Date) then
                     begin
                        if DueCalveBiWeekIndex > ActualBiWeekIndex then
                           begin
                              case DueCalveBiWeekIndex of
                                 1 : ProjectedCalvingsPostDry.TotalJAN_F1 := +1;
                                 2 : ProjectedCalvingsPostDry.TotalJAN_F2 := +1;
                                 3 : ProjectedCalvingsPostDry.TotalFEB_F1 := +1;
                                 4 : ProjectedCalvingsPostDry.TotalFEB_F2 := +1;
                                 5 : ProjectedCalvingsPostDry.TotalMAR_F1 := +1;
                                 6 : ProjectedCalvingsPostDry.TotalMAR_F2 := +1;
                                 7 : ProjectedCalvingsPostDry.TotalAPR_F1 := +1;
                                 8 : ProjectedCalvingsPostDry.TotalAPR_F2 := +1;
                                 9 : ProjectedCalvingsPostDry.TotalMAY_F1 := +1;
                                 10 : ProjectedCalvingsPostDry.TotalMAY_F2 := +1;
                                 11 : ProjectedCalvingsPostDry.TotalJUN_F1 := +1;
                                 12 : ProjectedCalvingsPostDry.TotalJUN_F2 := +1;
                                 13 : ProjectedCalvingsPostDry.TotalJUL_F1 := +1;
                                 14 : ProjectedCalvingsPostDry.TotalJUL_F2 := +1;
                                 15 : ProjectedCalvingsPostDry.TotalAUG_F1 := +1;
                                 16 : ProjectedCalvingsPostDry.TotalAUG_F2 := +1;
                                 17 : ProjectedCalvingsPostDry.TotalSEPT_F1 := +1;
                                 18 : ProjectedCalvingsPostDry.TotalSEPT_F2 := +1;
                                 19 : ProjectedCalvingsPostDry.TotalOCT_F1 := +1;
                                 20 : ProjectedCalvingsPostDry.TotalOCT_F2 := +1;
                                 21 : ProjectedCalvingsPostDry.TotalNOV_F1 := +1;
                                 22 : ProjectedCalvingsPostDry.TotalNOV_F2 := +1;
                                 23 : ProjectedCalvingsPostDry.TotalDEC_F1 := +1;
                                 24 : ProjectedCalvingsPostDry.TotalDEC_F2 := +1;
                              end;
                           end;
                     end;
                  Next;
               end;
         finally
            Close;
         end;

         ProjectedCalvings.TotalJAN_F2 := ProjectedCalvings.TotalJAN_F2 + ProjectedCalvings.TotalJAN_F1;
         ProjectedCalvings.TotalFEB_F1 := ProjectedCalvings.TotalFEB_F1 + ProjectedCalvings.TotalJAN_F2;
         ProjectedCalvings.TotalFEB_F2 := ProjectedCalvings.TotalFEB_F2 + ProjectedCalvings.TotalFEB_F1;
         ProjectedCalvings.TotalMAR_F1 := ProjectedCalvings.TotalMAR_F1 + ProjectedCalvings.TotalFEB_F2;
         ProjectedCalvings.TotalMAR_F2 := ProjectedCalvings.TotalMAR_F2 + ProjectedCalvings.TotalMAR_F1;
         ProjectedCalvings.TotalAPR_F1 := ProjectedCalvings.TotalAPR_F1 + ProjectedCalvings.TotalMAR_F2;
         ProjectedCalvings.TotalAPR_F2 := ProjectedCalvings.TotalAPR_F2 + ProjectedCalvings.TotalAPR_F1;
         ProjectedCalvings.TotalMAY_F1 := ProjectedCalvings.TotalMAY_F1 + ProjectedCalvings.TotalAPR_F2;
         ProjectedCalvings.TotalMAY_F2 := ProjectedCalvings.TotalMAY_F2 + ProjectedCalvings.TotalMAY_F1;
         ProjectedCalvings.TotalJUN_F1 := ProjectedCalvings.TotalJUN_F1 + ProjectedCalvings.TotalMAY_F2;
         ProjectedCalvings.TotalJUN_F2 := ProjectedCalvings.TotalJUN_F2 + ProjectedCalvings.TotalJUN_F1;
         ProjectedCalvings.TotalJUL_F1 := ProjectedCalvings.TotalJUL_F1 + ProjectedCalvings.TotalJUN_F2;
         ProjectedCalvings.TotalJUL_F2 := ProjectedCalvings.TotalJUL_F2 + ProjectedCalvings.TotalJUL_F1;
         ProjectedCalvings.TotalAUG_F1 := ProjectedCalvings.TotalAUG_F1 + ProjectedCalvings.TotalJUL_F2;
         ProjectedCalvings.TotalAUG_F2 := ProjectedCalvings.TotalAUG_F2 + ProjectedCalvings.TotalAUG_F1;
         ProjectedCalvings.TotalSEPT_F1 := ProjectedCalvings.TotalSEPT_F1 + ProjectedCalvings.TotalAUG_F2;
         ProjectedCalvings.TotalSEPT_F2 := ProjectedCalvings.TotalSEPT_F2 + ProjectedCalvings.TotalSEPT_F1;
         ProjectedCalvings.TotalOCT_F1 := ProjectedCalvings.TotalOCT_F1 + ProjectedCalvings.TotalSEPT_F2;
         ProjectedCalvings.TotalOCT_F2 := ProjectedCalvings.TotalOCT_F2 + ProjectedCalvings.TotalOCT_F1;
         ProjectedCalvings.TotalNOV_F1 := ProjectedCalvings.TotalNOV_F1 + ProjectedCalvings.TotalOCT_F2;
         ProjectedCalvings.TotalNOV_F2 := ProjectedCalvings.TotalNOV_F2 + ProjectedCalvings.TotalNOV_F1;
         ProjectedCalvings.TotalDEC_F1 := ProjectedCalvings.TotalDEC_F1 + ProjectedCalvings.TotalNOV_F2;
         ProjectedCalvings.TotalDEC_F2 := ProjectedCalvings.TotalDEC_F2 + ProjectedCalvings.TotalDEC_F1;


         ProjectedCalvingsPostDry.TotalJAN_F2 := ProjectedCalvingsPostDry.TotalJAN_F2 + ProjectedCalvingsPostDry.TotalJAN_F1;
         ProjectedCalvingsPostDry.TotalFEB_F1 := ProjectedCalvingsPostDry.TotalFEB_F1 + ProjectedCalvingsPostDry.TotalJAN_F2;
         ProjectedCalvingsPostDry.TotalFEB_F2 := ProjectedCalvingsPostDry.TotalFEB_F2 + ProjectedCalvingsPostDry.TotalFEB_F1;
         ProjectedCalvingsPostDry.TotalMAR_F1 := ProjectedCalvingsPostDry.TotalMAR_F1 + ProjectedCalvingsPostDry.TotalFEB_F2;
         ProjectedCalvingsPostDry.TotalMAR_F2 := ProjectedCalvingsPostDry.TotalMAR_F2 + ProjectedCalvingsPostDry.TotalMAR_F1;
         ProjectedCalvingsPostDry.TotalAPR_F1 := ProjectedCalvingsPostDry.TotalAPR_F1 + ProjectedCalvingsPostDry.TotalMAR_F2;
         ProjectedCalvingsPostDry.TotalAPR_F2 := ProjectedCalvingsPostDry.TotalAPR_F2 + ProjectedCalvingsPostDry.TotalAPR_F1;
         ProjectedCalvingsPostDry.TotalMAY_F1 := ProjectedCalvingsPostDry.TotalMAY_F1 + ProjectedCalvingsPostDry.TotalAPR_F2;
         ProjectedCalvingsPostDry.TotalMAY_F2 := ProjectedCalvingsPostDry.TotalMAY_F2 + ProjectedCalvingsPostDry.TotalMAY_F1;
         ProjectedCalvingsPostDry.TotalJUN_F1 := ProjectedCalvingsPostDry.TotalJUN_F1 + ProjectedCalvingsPostDry.TotalMAY_F2;
         ProjectedCalvingsPostDry.TotalJUN_F2 := ProjectedCalvingsPostDry.TotalJUN_F2 + ProjectedCalvingsPostDry.TotalJUN_F1;
         ProjectedCalvingsPostDry.TotalJUL_F1 := ProjectedCalvingsPostDry.TotalJUL_F1 + ProjectedCalvingsPostDry.TotalJUN_F2;
         ProjectedCalvingsPostDry.TotalJUL_F2 := ProjectedCalvingsPostDry.TotalJUL_F2 + ProjectedCalvingsPostDry.TotalJUL_F1;
         ProjectedCalvingsPostDry.TotalAUG_F1 := ProjectedCalvingsPostDry.TotalAUG_F1 + ProjectedCalvingsPostDry.TotalJUL_F2;
         ProjectedCalvingsPostDry.TotalAUG_F2 := ProjectedCalvingsPostDry.TotalAUG_F2 + ProjectedCalvingsPostDry.TotalAUG_F1;
         ProjectedCalvingsPostDry.TotalSEPT_F1 := ProjectedCalvingsPostDry.TotalSEPT_F1 + ProjectedCalvingsPostDry.TotalAUG_F2;
         ProjectedCalvingsPostDry.TotalSEPT_F2 := ProjectedCalvingsPostDry.TotalSEPT_F2 + ProjectedCalvingsPostDry.TotalSEPT_F1;
         ProjectedCalvingsPostDry.TotalOCT_F1 := ProjectedCalvingsPostDry.TotalOCT_F1 + ProjectedCalvingsPostDry.TotalSEPT_F2;
         ProjectedCalvingsPostDry.TotalOCT_F2 := ProjectedCalvingsPostDry.TotalOCT_F2 + ProjectedCalvingsPostDry.TotalOCT_F1;
         ProjectedCalvingsPostDry.TotalNOV_F1 := ProjectedCalvingsPostDry.TotalNOV_F1 + ProjectedCalvingsPostDry.TotalOCT_F2;
         ProjectedCalvingsPostDry.TotalNOV_F2 := ProjectedCalvingsPostDry.TotalNOV_F2 + ProjectedCalvingsPostDry.TotalNOV_F1;
         ProjectedCalvingsPostDry.TotalDEC_F1 := ProjectedCalvingsPostDry.TotalDEC_F1 + ProjectedCalvingsPostDry.TotalNOV_F2;
         ProjectedCalvingsPostDry.TotalDEC_F2 := ProjectedCalvingsPostDry.TotalDEC_F2 + ProjectedCalvingsPostDry.TotalDEC_F1;

         for i := ActualBiWeekIndex to DriedOffBiWeekIndex do
            case i of
               1 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalJAN_F1 := CowsInMilk+ProjectedCalvings.TotalJAN_F1
                      else
                         ProjectedCalvings.TotalJAN_F1 := ProjectedCalvings.TotalJAN_F1;
                   end;
               2 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalJAN_F2 := CowsInMilk+ProjectedCalvings.TotalJAN_F2
                      else
                         ProjectedCalvings.TotalJAN_F2 := ProjectedCalvings.TotalJAN_F2
                   end;
               3 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalFEB_F1 := CowsInMilk+ProjectedCalvings.TotalFEB_F1
                      else
                         ProjectedCalvings.TotalFEB_F1 := ProjectedCalvings.TotalFEB_F1;
                   end;
               4 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalFEB_F2 := CowsInMilk+ProjectedCalvings.TotalFEB_F2
                      else
                         ProjectedCalvings.TotalFEB_F2 := ProjectedCalvings.TotalFEB_F2
                   end;
               5 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalMAR_F1 := CowsInMilk+ProjectedCalvings.TotalMAR_F1
                      else
                         ProjectedCalvings.TotalMAR_F1 := ProjectedCalvings.TotalMAR_F1
                   end;
               6 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalMAR_F2 := CowsInMilk+ProjectedCalvings.TotalMAR_F2
                      else
                         ProjectedCalvings.TotalMAR_F2 := ProjectedCalvings.TotalMAR_F2;
                   end;
               7 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalAPR_F1 := CowsInMilk+ProjectedCalvings.TotalAPR_F1
                      else
                         ProjectedCalvings.TotalAPR_F1 := ProjectedCalvings.TotalAPR_F1;
                   end;
               8 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalAPR_F2 := CowsInMilk+ProjectedCalvings.TotalAPR_F2
                      else
                         ProjectedCalvings.TotalAPR_F2 := ProjectedCalvings.TotalAPR_F2;
                   end;
               9 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalMAY_F1 := CowsInMilk+ProjectedCalvings.TotalMAY_F1
                      else
                         ProjectedCalvings.TotalMAY_F1 := ProjectedCalvings.TotalMAY_F1;
                   end;
               10 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalMAY_F2 := CowsInMilk+ProjectedCalvings.TotalMAY_F2
                      else
                         ProjectedCalvings.TotalMAY_F2 := ProjectedCalvings.TotalMAY_F2;
                    end;
               11 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalJUN_F1 := CowsInMilk+ProjectedCalvings.TotalJUN_F1
                      else
                         ProjectedCalvings.TotalJUN_F1 := ProjectedCalvings.TotalJUN_F1;
                    end;
               12 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalJUN_F2 := CowsInMilk+ProjectedCalvings.TotalJUN_F2
                      else
                         ProjectedCalvings.TotalJUN_F2 := ProjectedCalvings.TotalJUN_F2;
                    end;
               13 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalJUL_F1 := CowsInMilk+ProjectedCalvings.TotalJUL_F1
                      else
                         ProjectedCalvings.TotalJUL_F1 := ProjectedCalvings.TotalJUL_F1;
                    end;
               14 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalJUL_F2 := CowsInMilk+ProjectedCalvings.TotalJUL_F2
                      else
                         ProjectedCalvings.TotalJUL_F2 := ProjectedCalvings.TotalJUL_F2;
                    end;
               15 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalAUG_F1 := CowsInMilk+ProjectedCalvings.TotalAUG_F1
                      else
                         ProjectedCalvings.TotalAUG_F1 := ProjectedCalvings.TotalAUG_F1;
                    end;
               16 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalAUG_F2 := CowsInMilk+ProjectedCalvings.TotalAUG_F2
                      else
                         ProjectedCalvings.TotalAUG_F2 := ProjectedCalvings.TotalAUG_F2;
                    end;
               17 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalSEPT_F1 := CowsInMilk+ProjectedCalvings.TotalSEPT_F1
                      else
                         ProjectedCalvings.TotalSEPT_F1 := ProjectedCalvings.TotalSEPT_F1;
                    end;
               18 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalSEPT_F2 := CowsInMilk+ProjectedCalvings.TotalSEPT_F2
                      else
                         ProjectedCalvings.TotalSEPT_F2 := ProjectedCalvings.TotalSEPT_F2;
                    end;
               19 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalOCT_F1 := CowsInMilk+ProjectedCalvings.TotalOCT_F1
                      else
                         ProjectedCalvings.TotalOCT_F1 := ProjectedCalvings.TotalOCT_F1;
                    end;
               20 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalOCT_F2 := CowsInMilk+ProjectedCalvings.TotalOCT_F2
                      else
                         ProjectedCalvings.TotalOCT_F2 := ProjectedCalvings.TotalOCT_F2;
                    end;
               21 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalNOV_F1 := CowsInMilk+ProjectedCalvings.TotalNOV_F1
                      else
                         ProjectedCalvings.TotalNOV_F1 := ProjectedCalvings.TotalNOV_F1;
                    end;
               22 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalNOV_F2 := CowsInMilk+ProjectedCalvings.TotalNOV_F2
                      else
                         ProjectedCalvings.TotalNOV_F2 := ProjectedCalvings.TotalNOV_F2;
                    end;
               23 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalDEC_F1 := CowsInMilk+ProjectedCalvings.TotalDEC_F1
                      else
                         ProjectedCalvings.TotalDEC_F1 := ProjectedCalvings.TotalDEC_F1;
                    end;
               24 : begin
                      if DriedOffBiWeekIndex >  i then
                         ProjectedCalvings.TotalDEC_F2 := CowsInMilk+ProjectedCalvings.TotalDEC_F2
                      else
                         ProjectedCalvings.TotalDEC_F2 := ProjectedCalvings.TotalDEC_F2;
                    end;
            end;

         for i := DriedOffBiWeekIndex to 24 do
            case i of
               1 : begin
                      ProjectedCalvingsPostDry.TotalJAN_F1 := ProjectedCalvingsPostDry.TotalJAN_F1;
                   end;
               2 : begin
                      ProjectedCalvingsPostDry.TotalJAN_F2 := ProjectedCalvingsPostDry.TotalJAN_F2
                   end;
               3 : begin
                      ProjectedCalvingsPostDry.TotalFEB_F1 := ProjectedCalvingsPostDry.TotalFEB_F1;
                   end;
               4 : begin
                      ProjectedCalvingsPostDry.TotalFEB_F2 := ProjectedCalvingsPostDry.TotalFEB_F2
                   end;
               5 : begin
                      ProjectedCalvingsPostDry.TotalMAR_F1 := ProjectedCalvingsPostDry.TotalMAR_F1
                   end;
               6 : begin
                      ProjectedCalvingsPostDry.TotalMAR_F2 := ProjectedCalvingsPostDry.TotalMAR_F2;
                   end;
               7 : begin
                      ProjectedCalvingsPostDry.TotalAPR_F1 := ProjectedCalvingsPostDry.TotalAPR_F1;
                   end;
               8 : begin
                      ProjectedCalvingsPostDry.TotalAPR_F2 := ProjectedCalvingsPostDry.TotalAPR_F2;
                   end;
               9 : begin
                      ProjectedCalvingsPostDry.TotalMAY_F1 := ProjectedCalvingsPostDry.TotalMAY_F1;
                   end;
               10 : begin
                       ProjectedCalvingsPostDry.TotalMAY_F2 := ProjectedCalvingsPostDry.TotalMAY_F2;
                    end;
               11 : begin
                       ProjectedCalvingsPostDry.TotalJUN_F1 := ProjectedCalvingsPostDry.TotalJUN_F1;
                    end;
               12 : begin
                       ProjectedCalvingsPostDry.TotalJUN_F2 := ProjectedCalvingsPostDry.TotalJUN_F2;
                    end;
               13 : begin
                       ProjectedCalvingsPostDry.TotalJUL_F1 := ProjectedCalvingsPostDry.TotalJUL_F1;
                    end;
               14 : begin
                       ProjectedCalvingsPostDry.TotalJUL_F2 := ProjectedCalvingsPostDry.TotalJUL_F2;
                    end;
               15 : begin
                       ProjectedCalvingsPostDry.TotalAUG_F1 := ProjectedCalvingsPostDry.TotalAUG_F1;
                    end;
               16 : begin
                       ProjectedCalvingsPostDry.TotalAUG_F2 := ProjectedCalvingsPostDry.TotalAUG_F2;
                    end;
               17 : begin
                       ProjectedCalvingsPostDry.TotalSEPT_F1 := ProjectedCalvingsPostDry.TotalSEPT_F1;
                    end;
               18 : begin
                       ProjectedCalvingsPostDry.TotalSEPT_F2 := ProjectedCalvingsPostDry.TotalSEPT_F2;
                    end;
               19 : begin
                       ProjectedCalvingsPostDry.TotalOCT_F1 := ProjectedCalvingsPostDry.TotalOCT_F1;
                    end;
               20 : begin
                       ProjectedCalvingsPostDry.TotalOCT_F2 := ProjectedCalvingsPostDry.TotalOCT_F2;
                    end;
               21 : begin
                       ProjectedCalvingsPostDry.TotalNOV_F1 := ProjectedCalvingsPostDry.TotalNOV_F1;
                    end;
               22 : begin
                       ProjectedCalvingsPostDry.TotalNOV_F2 := ProjectedCalvingsPostDry.TotalNOV_F2;
                    end;
               23 : begin
                       ProjectedCalvingsPostDry.TotalDEC_F1 := ProjectedCalvingsPostDry.TotalDEC_F1;
                    end;
               24 : begin
                       ProjectedCalvingsPostDry.TotalDEC_F2 := ProjectedCalvingsPostDry.TotalDEC_F2;
                    end;
            end;

      finally
         Free;
      end;
end;

function TfmGrassBudgetSimplified.GetAllCows: Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT Count(A.ID) CID               ');
         SQL.Add('FROM Animals A                       ');
         SQL.Add('WHERE (A.LactNo > 0)                 ');
         SQL.Add('AND (A.Sex = "Female")               ');
         SQL.Add('AND (A.AnimalDeleted =False)         ');
         SQL.Add('AND (A.Breeding = True)              ');
         SQL.Add('AND (A.InHerd=True)                  ');
         SQL.ADD('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
         Open;
         try
            First;
            Result := FieldByName('CID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TfmGrassBudgetSimplified.CalcDryCows(ADateFrom,
  ADateTo: TDateTime): Integer;
begin

end;

function TfmGrassBudgetSimplified.GetWeanlings: Integer;
var
   y, m, d : word;
   CutOffDate : TDateTime;
begin
   DecodeDate(Date, y, m, d);

   Dec(y);

   CutOffDate := EncodeDate(y, 1,1);


//Weanlings, Yearlings : Integer;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT Count(A.ID) CID               ');
         SQL.Add('FROM Animals A                       ');
         SQL.Add('WHERE (A.LactNo = 0)                 ');
         SQL.Add('AND (A.AnimalDeleted =False)         ');
         SQL.Add('AND (A.InHerd=True)                  ');
         SQL.ADD('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
         SQL.ADD('AND (A.DateOfBirth >= ''' + FormatDate(CutOffDate,dsUS) + ''')');
         Open;
         try
            First;
            Result := FieldByName('CID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TfmGrassBudgetSimplified.GetYearlings: Integer;
var
   y, m, d : word;
   CutOffDate : TDateTime;
begin
   DecodeDate(Date, y, m, d);
   Dec(y);
   CutOffDate := EncodeDate(y, 1,1);
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT Count(A.ID) CID               ');
         SQL.Add('FROM Animals A                       ');
         SQL.Add('WHERE (A.LactNo = 0)                 ');
         SQL.Add('AND (A.AnimalDeleted =False)         ');
         SQL.Add('AND (A.InHerd=True)                  ');
         SQL.ADD('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
         SQL.ADD('AND (A.DateOfBirth < ''' + FormatDate(CutOffDate,dsUS) + ''')');
         Open;
         try
            First;
            Result := FieldByName('CID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

end.

