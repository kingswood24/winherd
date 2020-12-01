{
   - SP 05/11/2010

   Redirect Individual Weaning to block weaning, tighter weaning event validation
   has been introduced making use of the TAWWeaningEventValidator class.

   Prevent change of weaning date on event grid. This only applies to weaning event.
   Weaning date must be the same for each weaning record. - Agreed with GL

   23/11/10 [V4.0 R5.] /MK Bug Fix - Added InitPopup Events To EventTable Docility And CalfQuality Columns.

   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                                   - Changed CreateWeaning ShowMessage "two days" to 2.

   17/11/11 [V5.0 R2.1] /MK Bug Fix - New Procedure UpdateDisbuddingVet For cmboVet.Exit and cmboVet.CloseUp.

   30/05/12 [V5.0 R6.0] /MK Bug Fix - UpdateWeaningCmbo - New Procedure To Update Fields In TempAnimal Table On CloseUp.

   23/11/12 [V5.1 R1.2] /MK Bug Fix - UpdateAnimals - WeaningDate was never being set. Code was for MealFeedingDate even though MealFeedingDate is already set.

   07/05/13 [V5.1 R7.1] /MK Bug Fix - Added OnCloseUp Event to deEventDate - UpdateRecord only updates for animals that are selected.

   15/05/13 [V5.1 R7.1] /MK Additional Feature - Added Dam and Stock Events for ICBF new Beef Data Program.

   20/09/13 [V5.2 R1.5] /MK Additional Feature - Added Calf Survey Event.
                                               - CalfSurveyEvent - Only show animals that are greater than 5 months old.
                            Change - Moved the Calf Quality and Calf Docility Events to the Calf Survey Event from Weaning.
                                   - Added colour to BDP Event pages (Calf Survey, Dam and Stock Bull Events).

   24/10/13 [V5.2 R3.8] /MK Change - No need to show DamNatID for Dam and Stock Bull Events.
                                   - Only include AFilter animals if WinData.ActiveFilter.
                                   - Only Dams if calved this year.
                                   - Show animals that regardless of InHerd status if EventType = TICBFCalfSurveyEvent or ICBFDamEvent.

  25/10/13 [V5.2 R3.8] /MK Change - GetAnimals - Only show calves that were born from 2013.

  05/11/13 [V5.2 R5.1] /MK Bug Fix - GetAnimals - Do not exclude animals by date of birth >= 01/01/2008 if Dam or Stock Bull Events.

  07/01/14 [V5.2 R7.5] /MK Bug Fix - FilterOutAnimals - DamEvent - New way to get the dams of this year and last year if calved on/after 01/01/2013.

  30/04/14 [V5.3 R0.0] /MK Change - Include Stock Bulls not in herd i.e. sold stock bulls - Ivan Thomas.

  30/10/14 [V5.3 R8.8] /MK Bug Fix - ICBFCalfSurvey - Calf must be 5 months old not 20 weeks - GL request - Albert Bailey problem.
                           Change - ValidateICBFCalfSurveyEvents - Changed warning to that of ICBF spec sheet "5 months old or older" instead of "at least 5 months old".

  16/06/16 [V5.5 R6.8] /MK Additional Feature - New traits required for ICBF Calf Survey - vitality, size, scour and pneumonia.
                                              * NOTE * - ICBF require asked for the Calf Vitality and Calf Size to be recorded on the birth of the calf
                                                         but the whole ICBF Calf Survey can only be recorded on calves that are 5 months old.
                                                         I explained this to GL who said that we should just leave the restriction in place for now
                                                         and then come back to it if someone asks to make the change as normal farmers would only be
                                                         recording these events months after they were born.

  28/06/17 [V5.6 R8.9] /MK Change - Grid now shows all calves regardless of age but disables the input of Docility, Quality, Scour and Pneumonia
                                    for calves that are less than 5 months old.
                                  - GetAnimals - Check to see if there are incomplete Calf Survey events i.e. only vitality and size were entered by the user.
                                                 and load these parameters into the grid. The user is not allowed to changed these parameters.
                                  - ValidateICBFCalfSurveyEvents - Remove calves that already have a complete calf survey event i.e. all parameters are added.

  29/06/17 [V5.6 R9.0] /MK Change - Formatted area above the grid and the grid to show Vitality and Size first as these are required at Date of Birth.

  14/11/17 [V5.7 R3.0] /MK Change - UpdateRecord - tsCalfSurveyEvent - Using continue here where there was no for i used. Change AFieldValue to Null instead.
}

unit uAWEventsByGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxSplitter, Db, dxmdaset, cxTextEdit, cxDropDownEdit, cxLabel,
  cxMaskEdit, cxCalendar, StdCtrls, cxButtons, cxContainer, cxEdit, cxMemo,
  cxRichEdit, ExtCtrls, dxStatusBar, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, dxBar, dxBarExtItems, dbtables,
  GenTypesConst, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, cxLookupDBGrid, cxFilter, DateUtil, cxCustomData;

type
  TfmAWEventsByGroup = class(TForm)
    dxBarManager1: TdxBarManager;
    blbClose: TdxBarLargeButton;
    btnGrpWelfHelp: TdxBarLargeButton;
    EventPageControl: TcxPageControl;
    tsDisbudding: TcxTabSheet;
    tsCastration: TcxTabSheet;
    tsMealFeeding: TcxTabSheet;
    tsWeaning: TcxTabSheet;
    EventGridLevel: TcxGridLevel;
    EventGrid: TcxGrid;
    StatusBar: TdxStatusBar;
    tsGuidelines: TcxTabSheet;
    btnReadGuidelines: TcxButton;
    deEventDate: TcxDateEdit;
    EventDateLabel: TcxLabel;
    VeterinarianLabel: TcxLabel;
    cmboVeterinarian: TcxLookupComboBox;
    teComment: TcxTextEdit;
    CommentLabel: TcxLabel;
    cxSplitter1: TcxSplitter;
    dxBarLargeButton2: TdxBarLargeButton;
    dsEventDataTable: TDataSource;
    blbSave: TdxBarLargeButton;
    blbSelectAll: TdxBarLargeButton;
    ActualWeightLabel: TLabel;
    deWeightDate: TcxDateEdit;
    ceWeight: TcxCurrencyEdit;
    EventGridDBTableView: TcxGridDBTableView;
    EventGridDBTableViewRecId: TcxGridDBColumn;
    EventGridDBTableViewSelected: TcxGridDBColumn;
    EventGridDBTableViewID: TcxGridDBColumn;
    EventGridDBTableViewAnimalNo: TcxGridDBColumn;
    EventGridDBTableViewSortAnimalNo: TcxGridDBColumn;
    EventGridDBTableViewNatIDNum: TcxGridDBColumn;
    EventGridDBTableViewSortNatID: TcxGridDBColumn;
    EventGridDBTableViewDateOfBirth: TcxGridDBColumn;
    EventGridDBTableViewLactNo: TcxGridDBColumn;
    EventGridDBTableViewDamNatID: TcxGridDBColumn;
    EventGridDBTableViewEventDate: TcxGridDBColumn;
    EventGridDBTableViewEventDesc: TcxGridDBColumn;
    EventGridDBTableViewDamSortNatIDNo: TcxGridDBColumn;
    EventGridDBTableViewCalfDocility: TcxGridDBColumn;
    EventGridDBTableViewCalfQuality: TcxGridDBColumn;
    EventGridDBTableViewCalfWeight: TcxGridDBColumn;
    EventGridDBTableViewWeightDate: TcxGridDBColumn;
    EventGridDBTableViewSex: TcxGridDBColumn;
    EventDataTable: TTable;
    EventDataTableID: TIntegerField;
    EventDataTableAnimalNo: TStringField;
    EventDataTableSortAnimalNo: TStringField;
    EventDataTableNatIDNum: TStringField;
    EventDataTableSortNatID: TStringField;
    EventDataTableDateOfBirth: TDateTimeField;
    EventDataTableLactNo: TIntegerField;
    EventDataTableDamNatID: TStringField;
    EventDataTableEventDate: TDateTimeField;
    EventDataTableEventDesc: TStringField;
    EventDataTableVeterinarian: TIntegerField;
    EventDataTableSortDamNatIDNo: TStringField;
    EventDataTableHerdID: TIntegerField;
    EventDataTableSelected: TBooleanField;
    EventDataTableCalfDocility: TIntegerField;
    EventDataTableCalfQuality: TIntegerField;
    EventDataTableCalfWeight: TFloatField;
    EventDataTableWeightDate: TDateTimeField;
    EventDataTableSex: TStringField;
    EventGridDBTableViewVeterinarian: TcxGridDBColumn;
    dxBarLargeButton3: TdxBarLargeButton;
    btnNotApplicable: TcxButton;
    blbReviewWelfareEvents: TdxBarLargeButton;
    EventGridDBTableViewDisbuddingDate: TcxGridDBColumn;
    EventGridDBTableViewCastrationDate: TcxGridDBColumn;
    EventGridDBTableViewMealFeedingDate: TcxGridDBColumn;
    EventGridDBTableViewWeaningDate: TcxGridDBColumn;
    EventDataTableDisbuddingDate: TDateTimeField;
    EventDataTableCastrationDate: TDateTimeField;
    EventDataTableMealFeedingDate: TDateTimeField;
    EventDataTableWeaningDate: TDateTimeField;
    tsDamEvent: TcxTabSheet;
    MilkAbilityLabel: TLabel;
    cmboCowMilkAbility: TcxLookupComboBox;
    CowQualityLabel: TLabel;
    cmboCowDocility: TcxLookupComboBox;
    EventGridDBTableViewICBFDamMilkAbility : TcxGridDBColumn;
    EventGridDBTableViewICBFDamDocility: TcxGridDBColumn;
    EventGridDBTableViewICBFStockBullFunctionality: TcxGridDBColumn;
    EventGridDBTableViewICBFStockBullDocility: TcxGridDBColumn;
    tsStockBullEvent: TcxTabSheet;
    BullFunctionalityLabel: TLabel;
    cmboBullFunctionality: TcxLookupComboBox;
    BullDocilityLabel: TLabel;
    cmboBullDocility: TcxLookupComboBox;
    EventDataTableICBFDamEventDate: TDateTimeField;
    EventDataTableICBFDamMilkAbility: TIntegerField;
    EventDataTableICBFDamDocility: TIntegerField;
    EventDataTableIICBFSBEventDate: TDateTimeField;
    EventDataTableICBFSBFunctionality: TIntegerField;
    EventDataTableICBFSBDocility: TIntegerField;
    tsCalfSurveyEvent: TcxTabSheet;
    DocilityLabel: TLabel;
    cmboCalfDocility: TcxLookupComboBox;
    CalfQualityLabel: TLabel;
    cmboCalfQuality: TcxLookupComboBox;
    EventDataTableICBFCalfSurveyDate: TDateField;
    EventDataTableLastCalvingDate: TDateTimeField;
    CalfVitalityLabel: TLabel;
    cmboCalfVitality: TcxLookupComboBox;
    CalfSizeLabel: TLabel;
    cmboCalfSize: TcxLookupComboBox;
    CalfScourLabel: TLabel;
    cmboCalfScour: TcxLookupComboBox;
    CalfPneumoniaLabel: TLabel;
    cmboCalfPneumonia: TcxLookupComboBox;
    EventGridDBTableViewCalfVitality: TcxGridDBColumn;
    EventGridDBTableViewCalfSize: TcxGridDBColumn;
    EventGridDBTableViewCalfScour: TcxGridDBColumn;
    EventGridDBTableViewCalfPneumonia: TcxGridDBColumn;
    EventDataTableCalfVitality: TIntegerField;
    EventDataTableCalfSize: TIntegerField;
    EventDataTableCalfScour: TIntegerField;
    EventDataTableCalfPneumonia: TIntegerField;
    EventDataTableExistingEventID: TIntegerField;
    EventGridDBTableViewExistingEventID: TcxGridDBColumn;
    procedure btnReadGuidelinesClick(Sender: TObject);
    procedure EventPageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure blbCloseClick(Sender: TObject);
    procedure blbSelectAllClick(Sender: TObject);
    procedure deEventDateExit(Sender: TObject);
    procedure teCommentExit(Sender: TObject);
    procedure ceWeightExit(Sender: TObject);
    procedure deWeightDateExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure blbSaveClick(Sender: TObject);
    procedure EventDataTableSelectedChange(Sender: TField);
    procedure EventDataTableAfterPost(DataSet: TDataSet);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure tsWeaningShow(Sender: TObject);
    procedure EventPageControlChange(Sender: TObject);
    procedure btnNotApplicableClick(Sender: TObject);
    procedure btnGrpWelfHelpClick(Sender: TObject);
    procedure blbReviewWelfareEventsClick(Sender: TObject);
    procedure EventGridDBTableViewInitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure deEventDatePropertiesCloseUp(Sender: TObject);
    procedure FilterList1PropertiesInitPopup(Sender: TObject);
    procedure FilterList2PropertiesInitPopup(Sender: TObject);
    procedure EventComboExitOrCloseUp(Sender: TObject);
    procedure DBTableViewComboCloseUp(Sender: TObject);
    procedure EventGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FFormShowing : Boolean;
    FHerdID : Integer;
    FEventType : TEventType;
    procedure ShowGuideline(AEventIndex : Byte);
    procedure GetAnimals(AEventType : TEventType; ARemoveExisting : Boolean=True);
    procedure UpdateRecord(AFieldName : String; AFieldValue : Variant);
    procedure SetupEvent(AEventType : TEventType);
    procedure SelectAll(ASelect : Boolean);
    procedure ChangeControlPosition(AControl : TControl;ATop, ALeft : Integer);
    procedure ValidateDisbuddingEvents;
    procedure CreateDisbuddingEvents;
    procedure ValidateCastrationEvents;
    procedure CreateCastrationEvents;

    procedure ValidateWeaningEvents;
    procedure CreateWeaningEvents;

    procedure CreateMealFeedingEvents;
    procedure ValidateMealFeedingEvents;
    Procedure CMDialogKey( var msg: TWMKey ); message CM_DIALOGKEY;
    function  SelectedCount : Integer;

    procedure CheckNoOfRecordedWeanings;
    procedure UpdateEventCombo(AComboType: TcxLookupComboBox);

    procedure CreateICBFDamEvents;
    procedure CreateICBFStockBullEvents;
    procedure CreateICBFCalfSurveyEvents;
    procedure ValidateICBFCalfSurveyEvents;
    procedure FilterOutAnimals(AEventType : TEventType);
    procedure ValidateICBFDamSurveyEvents;
    procedure ValidateICBFStockBullSurveyEvents;
    function AnimalIsAtMinAge ( ADateOfBirth, AEventDate : TDateTime; AMinAgeInc : Integer ) : Boolean;

  public
    { Public declarations }
    class procedure ShowAWEventsByGroup(AHerdID : Integer; AEventType : TEventType=TDisbudding);
  end;

var
  fmAWEventsByGroup: TfmAWEventsByGroup;

const
   ControlTopPosition = 20;
   LabelTopPosition = 23;
   ControlLeftPosition = 128;
   LabelLeftPosition = 26;
   MessageHeader = 'Kingswood Herd';


implementation

uses uImageStore, uHerdLookup, DairyData, EventRecording, uRemarks, KDBRoutines,
     uAWReviewEvents, uAWWeaningEventValidator;

{$R *.DFM}

class procedure TfmAWEventsByGroup.ShowAWEventsByGroup(AHerdID : Integer;
  AEventType: TEventType);
begin
   with TfmAWEventsByGroup.Create(niL) do
      try
         FHerdID := AHerdID;
         EventPageControl.ActivePageIndex := -1;
         case AEventType of
            TDisbudding          : EventPageControl.ActivePage := tsDisbudding;
            TCastrate            : EventPageControl.ActivePage := tsCastration;
            TMealFeeding         : EventPageControl.ActivePage := tsMealFeeding;
            TWean                : EventPageControl.ActivePage := tsWeaning;
            TICBFDamEvent        : EventPageControl.ActivePage := tsDamEvent;
            TICBFStockBullEvent  : EventPageControl.ActivePage := tsStockBullEvent;
            TICBFCalfSurveyEvent : EventPageControl.ActivePage := tsCalfSurveyEvent;
         end;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAWEventsByGroup.FormCreate(Sender: TObject);
begin
   FEventType := TDisbudding;

   if EventDataTable.Exists then EventDataTable.DeleteTable;

   EventDataTable.DatabaseName := AliasName;

   EventDataTable.FieldDefs.Clear;
   EventDataTable.FieldDefs.Add('ID',ftInteger);
   EventDataTable.FieldDefs.Add('AnimalNo',ftString,10);
   EventDataTable.FieldDefs.Add('SortAnimalNo',ftString,10);
   EventDataTable.FieldDefs.Add('NatIDNum',ftString,20);
   EventDataTable.FieldDefs.Add('SortNatID',ftString,20);
   EventDataTable.FieldDefs.Add('DateOfBirth',ftDateTime);
   EventDataTable.FieldDefs.Add('LactNo',ftInteger);
   EventDataTable.FieldDefs.Add('DamNatID',ftString,20);
   EventDataTable.FieldDefs.Add('EventDate',ftDateTime);
   EventDataTable.FieldDefs.Add('EventDesc',ftString,30);
   EventDataTable.FieldDefs.Add('Veterinarian',ftInteger);
   EventDataTable.FieldDefs.Add('SortDamNatIDNo',ftString,20);
   EventDataTable.FieldDefs.Add('HerdID',ftInteger);
   EventDataTable.FieldDefs.Add('Selected',ftBoolean);
   EventDataTable.FieldDefs.Add('CalfDocility',ftInteger);
   EventDataTable.FieldDefs.Add('CalfQuality',ftInteger);
   EventDataTable.FieldDefs.Add('CalfVitality',ftInteger);
   EventDataTable.FieldDefs.Add('CalfSize',ftInteger);
   EventDataTable.FieldDefs.Add('CalfScour',ftInteger);
   EventDataTable.FieldDefs.Add('CalfPneumonia',ftInteger);
   EventDataTable.FieldDefs.Add('CalfWeight',ftFloat);
   EventDataTable.FieldDefs.Add('WeightDate',ftDateTime);
   EventDataTable.FieldDefs.Add('Sex',ftString,6);
   EventDataTable.FieldDefs.Add('DisbuddingDate',ftDateTime);
   EventDataTable.FieldDefs.Add('CastrationDate',ftDateTime);
   EventDataTable.FieldDefs.Add('MealFeedingDate',ftDateTime);
   EventDataTable.FieldDefs.Add('WeaningDate',ftDateTime);
   EventDataTable.FieldDefs.Add('ICBFDamEventDate',ftDateTime);
   EventDataTable.FieldDefs.Add('ICBFDamMilkAbility',ftInteger);
   EventDataTable.FieldDefs.Add('ICBFDamDocility',ftInteger);
   EventDataTable.FieldDefs.Add('ICBFSBEventDate',ftDateTime);
   EventDataTable.FieldDefs.Add('ICBFSBFunctionality',ftInteger);
   EventDataTable.FieldDefs.Add('ICBFSBDocility',ftInteger);
   EventDataTable.FieldDefs.Add('ICBFCalfSurveyDate',ftDateTime);
   EventDataTable.FieldDefs.Add('LastCalvingDate',ftDateTime);
   EventDataTable.FieldDefs.Add('ExistingEventID',ftInteger);
   EventDataTable.CreateTable;

   //dsEventData.Dataset := EventDataTable;
   EventDataTable.Open;

   ImageStore := TImageStore.Create(nil);
   FFormShowing := False;
   WinData.WeaningScores.Active := True;
   WinData.mdICBFCalfSizeScores.Active := True;
   WinData.DamAndBullICBFScores.Active := True;
end;

procedure TfmAWEventsByGroup.FormActivate(Sender: TObject);
begin
   FFormShowing := True;
end;

procedure TfmAWEventsByGroup.FormDestroy(Sender: TObject);
begin
   EventDataTable.Close;
   EventDataTable.DeleteTable;
   FreeAndNil(EventDataTable);
   FreeAndNil(ImageStore);
   WinData.WeaningScores.Active := False;
   WinData.mdICBFCalfSizeScores.Active := False;
   WinData.DamAndBullICBFScores.Active := False;
end;

procedure TfmAWEventsByGroup.btnReadGuidelinesClick(
  Sender: TObject);
begin
   ShowGuideline(EventPageControl.ActivePage.Tag);
end;

procedure TfmAWEventsByGroup.ShowGuideline(AEventIndex: Byte);
var
   i : Integer;
begin
   for i := 0 to tsGuidelines.ControlCount-1 do
      begin
         if ( tsGuidelines.Controls[i] is TPanel ) then
            ( tsGuidelines.Controls[i] as TPanel ).Visible := (( tsGuidelines.Controls[i] as TPanel ).Tag = AEventIndex);
      end;
   tsGuidelines.TabVisible := True;
   EventPageControl.ActivePage := tsGuidelines;

end;

procedure TfmAWEventsByGroup.GetAnimals(AEventType : TEventType;
  ARemoveExisting: Boolean);
var
  TempQuery : TQuery;
  bError : Boolean;
begin
   bError := False;

   if ( AEventType = TICBFCalfSurveyEvent ) then
      EventGridDBTableViewDateOfBirth.SortOrder := soDescending
   else
      EventGridDBTableViewDateOfBirth.SortOrder := soNone;

   case AEventType of
      TDisbudding   : begin
                         EventGridDBTableViewDisbuddingDate.Visible := False;
                         EventGridDBTableViewCastrationDate.Visible := True;
                         EventGridDBTableViewMealFeedingDate.Visible := True;
                         EventGridDBTableViewWeaningDate.Visible := True;
                      end;
      TCastrate     : begin
                         EventGridDBTableViewDisbuddingDate.Visible := True;
                         EventGridDBTableViewCastrationDate.Visible := False;
                         EventGridDBTableViewMealFeedingDate.Visible := True;
                         EventGridDBTableViewWeaningDate.Visible := True;
                      end;
      TMealFeeding  : begin
                         EventGridDBTableViewDisbuddingDate.Visible := True;
                         EventGridDBTableViewCastrationDate.Visible := True;
                         EventGridDBTableViewMealFeedingDate.Visible := False;
                         EventGridDBTableViewWeaningDate.Visible := True;
                      end;
      TWean         : begin
                         EventGridDBTableViewDisbuddingDate.Visible := True;
                         EventGridDBTableViewCastrationDate.Visible := True;
                         EventGridDBTableViewMealFeedingDate.Visible := True;
                         EventGridDBTableViewWeaningDate.Visible := False;
                      end;
   end;

   if ( AEventType in [TICBFDamEvent,TICBFStockBullEvent, TICBFCalfSurveyEvent] ) then
      begin
         EventGridDBTableViewDisbuddingDate.Visible := False;
         EventGridDBTableViewCastrationDate.Visible := False;
         EventGridDBTableViewMealFeedingDate.Visible := False;
         EventGridDBTableViewWeaningDate.Visible := False;
      end;

   //   24/10/13 [V5.2 R3.8] /MK Change - No need to show DamNatID for Dam and Stock Bull Events.
   EventGridDBTableViewDamNatID.Visible := ( not(AEventType in [TICBFDamEvent, TICBFStockBullEvent]) );

   EventGridLevel.GridView.DataController.BeginFullUpdate;
   Screen.Cursor := crHourGlass;
   try
      EventDataTable.Active := False;
      EventDataTable.EmptyTable;
      EventDataTable.Active := True;

      TempQuery := TQuery.Create(nil);
      with TempQuery do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT A.Id, A.NatIDNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth, ');
            SQL.Add('       A.LactNo, A.HerdID, A.Sex, A.Breeding, B.InUse,');
            SQL.Add('       D.NatIDNum, D.SortNatID');
            SQL.Add('FROM Animals A');
            SQL.Add('LEFT JOIN Animals D ON (A.DamID=D.ID)');
            SQL.Add('LEFT JOIN BullSemenStk B ON (B.AnimalID=A.ID)');

            if ( AEventType = TICBFDamEvent ) then
                SQL.Add('WHERE A.LactNo > 0')
            else
                SQL.Add('WHERE A.LactNo = 0');

            //   30/04/14 [V5.3 R0.0] /MK Change - Include Stock Bulls not in herd i.e. sold stock bulls
            if ( not(AEventType in [TICBFDamEvent, TICBFCalfSurveyEvent, TICBFStockBullEvent]) ) then
               SQL.Add('AND A.Inherd = True');

            SQL.Add('AND A.AnimalDeleted = False');
            SQL.Add('AND A.HerdID = :HerdID');

            if ( AEventType in [TCastrate,TICBFStockBullEvent] ) then
               SQL.Add('AND A.Sex = "Bull"')
            else if ( AEventType = TICBFDamEvent ) then
               SQL.Add('AND A.Sex = "Female"');

            if ( AEventType = TICBFStockBullEvent ) then
               SQL.Add('AND ( A.Breeding = True ) and ( B.InUse = True )');

            //   25/10/13 [V5.2 R3.8] /MK Change - Only show calves that were born from 2013.
            if ( AEventType = TICBFCalfSurveyEvent ) then
               SQL.Add('AND (A.DateOfBirth >= '''+ FormatDateTime( 'mm/dd/yyyy', EnCodeDate(2013, 1, 1) ) +''')')
            //   05/11/13 [V5.2 R5.1] /MK Bug Fix - Do not exclude animals by date of birth >= 01/01/2008 if Dam or Stock Bull Events.
            else if ( not(AEventType in [TICBFDamEvent,TICBFStockBullEvent]) ) then
               SQL.Add('AND (A.DateOfBirth >= '''+ FormatDateTime( 'mm/dd/yyyy', EnCodeDate(2008, 1, 1) ) +''')');

            if ( WinData.ActiveFilter ) then
               SQL.Add('AND (A.ID IN (Select AID FROM AFilters))' );

            if ( not(AEventType in [TICBFDamEvent,TICBFStockBullEvent,TICBFCalfSurveyEvent]) ) then
               begin
                  SQL.Add('AND NOT (A.ID IN (Select AnimalID FROM Events E ');
                  case AEventType of
                     TDisbudding          : SQL.Add(Format('Where E.EventType in (%d,%d)))',[cDisbuddingEvent,cDisbuddingNAEvent]));
                     TCastrate            : SQL.Add(Format('Where E.EventType in (%d,%d)))',[CCastrateEvent,CCastrationNAEvent]));
                     TMealFeeding         : SQL.Add(Format('Where E.EventType = %d))',[CMealFeedingEvent]));
                     TWean                : SQL.Add(Format('Where E.EventType = %d))',[CWeaningEvent]));
                     //TICBFCalfSurveyEvent : SQL.Add(Format('Where E.EventType = %d))',[CICBFCalfSurveyEvent]));
                  end;
               end;

            Params[0].AsInteger := FHerdID;
            Open;
            try
               First;
               while ( not(Eof) ) do
                  begin
                     if ( not(EventDataTable.Locate('ID', Fields[0].AsInteger,[])) ) then
                        begin
                           EventDataTable.Append;
                           try
                              EventDataTable.FieldByName('ID').AsInteger := Fields[0].AsInteger;
                              EventDataTable.FieldByName('NatIDNum').AsString := Fields[1].AsString;
                              EventDataTable.FieldByName('SortNatID').AsString := Fields[2].AsString;
                              EventDataTable.FieldByName('AnimalNo').AsString  := Fields[3].AsString;
                              EventDataTable.FieldByName('SortAnimalNo').AsString  := Fields[4].AsString;
                              EventDataTable.FieldByName('DateOfBirth').AsDateTime  := Fields[5].AsDateTime;
                              EventDataTable.FieldByName('LactNo').AsInteger := Fields[6].AsInteger;
                              EventDataTable.FieldByName('HerdID').AsInteger := Fields[7].AsInteger;
                              EventDataTable.FieldByName('Sex').AsString := Fields[8].AsString;
                              EventDataTable.FieldByName('DamNatID').AsString := Fields[11].AsString;
                              EventDataTable.FieldByName('SortDamNatIDNo').AsString := Fields[12].AsString;

                              EventDataTable.FieldByName('EventDate').AsDateTime := Date;
                              EventDataTable.FieldByName('Selected').AsBoolean := False;

                              EventDataTable.FieldByName('DisbuddingDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CDisbuddingEvent);
                              if ( EventDataTable.FieldByName('DisbuddingDate').AsDateTime <= 0 ) then
                                 EventDataTable.FieldByName('DisbuddingDate').Clear;
                              EventDataTable.FieldByName('CastrationDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CCastrateEvent);
                              if ( EventDataTable.FieldByName('CastrationDate').AsDateTime <= 0 ) then
                                 EventDataTable.FieldByName('CastrationDate').Clear;
                              EventDataTable.FieldByName('MealFeedingDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CMealFeedingEvent);
                              if ( EventDataTable.FieldByName('MealFeedingDate').AsDateTime <= 0 ) then
                                 EventDataTable.FieldByName('MealFeedingDate').Clear;

                              //   23/11/12 [V5.1 R1.2] /MK Bug Fix - WeaningDate was never being set. Code was for MealFeedingDate even though MealFeedingDate is already set.
                              EventDataTable.FieldByName('WeaningDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CWeaningEvent);
                              if ( EventDataTable.FieldByName('WeaningDate').AsDateTime <= 0 ) then
                                 EventDataTable.FieldByName('WeaningDate').Clear;

                              case AEventType of
                               TDisbudding          : EventDataTable.FieldByName('EventDesc').AsString := 'Disbudding';
                               TCastrate            : EventDataTable.FieldByName('EventDesc').AsString := 'Castration';
                               TMealFeeding         : EventDataTable.FieldByName('EventDesc').AsString := 'Meal Feeding';
                               TWean                : EventDataTable.FieldByName('EventDesc').AsString := 'Weaning';
                               TICBFDamEvent        : EventDataTable.FieldByName('EventDesc').AsString := 'Dam Event';
                               TICBFStockBullEvent  : EventDataTable.FieldByName('EventDesc').AsString := 'Stock Bull Event';
                               TICBFCalfSurveyEvent : EventDataTable.FieldByName('EventDesc').AsString := 'Calf Survey Event';
                              end;

                              EventDataTable.Post;
                           except
                              EventDataTable.Cancel;
                              bError := True;
                           end;
                        end;
                     Next;
                  end;

               if ( AEventType in [TICBFDamEvent,TICBFStockBullEvent] ) then
                  begin
                     EventDataTable.First;
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT E.AnimalID, E.EventDate, E.ICBFNotified,');
                     if ( AEventType = TICBFDamEvent ) then
                        SQL.Add('       CE.MilkAbility, CE.Docility ')
                     else if ( AEventType = TICBFStockBullEvent ) then
                        SQL.Add('       SB.Functionality, SB.Docility');
                     SQL.Add('FROM Events E');
                     SQL.Add('LEFT JOIN ICBFDamEvent CE ON (CE.EventID = E.ID)');
                     SQL.Add('LEFT JOIN ICBFStockBullEvent SB ON (SB.EventID = E.ID)');
                     if ( AEventType = TICBFDamEvent ) then
                        SQL.Add('WHERE E.EventType = '+IntToStr(CICBFDamEvent)+'')
                     else if ( AEventType = TICBFStockBullEvent ) then
                        SQL.Add('WHERE E.EventType = '+IntToStr(CICBFStockBullEvent)+'');
                     Open;
                     First;
                     while ( not(Eof) ) do
                        try
                           case AEventType of
                               TICBFDamEvent       : begin
                                                        if ( FieldByName('MilkAbility').AsInteger > 0 ) then
                                                            if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                                               begin
                                                                  EventDataTable.Edit;
                                                                  EventDataTable.FieldByName('ICBFDamMilkAbility').AsInteger := FieldByName('MilkAbility').AsInteger;
                                                                  EventDataTable.Post;
                                                               end;
                                                        if ( FieldByName('Docility').AsInteger > 0 ) then
                                                            if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                                               begin
                                                                  EventDataTable.Edit;
                                                                  EventDataTable.FieldByName('ICBFDamDocility').AsInteger := FieldByName('Docility').AsInteger;
                                                                  EventDataTable.Post;
                                                               end;
                                                     end;
                               TICBFStockBullEvent : begin
                                                        if ( FieldByName('Functionality').AsInteger > 0 ) then
                                                            if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                                               begin
                                                                  EventDataTable.Edit;
                                                                  EventDataTable.FieldByName('ICBFSBFunctionality').AsInteger := FieldByName('Functionality').AsInteger;
                                                                  EventDataTable.Post;
                                                               end;
                                                        if ( FieldByName('Docility').AsInteger > 0 ) then
                                                            if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                                               begin
                                                                  EventDataTable.Edit;
                                                                  EventDataTable.FieldByName('ICBFSBDocility').AsInteger := FieldByName('Docility').AsInteger;
                                                                  EventDataTable.Post;
                                                               end;
                                                     end;
                           end;
                           Next;
                        except

                        end;
                  end;

               if ( AEventType = TICBFCalfSurveyEvent ) then
                  begin
                     // 28/06/17 [V5.6 R8.9] /MK Change - Check to see if there are incomplete Calf Survey events i.e. only vitality and size were entered by the user.
                     //                                   and load these parameters into the grid. The user is not allowed to changed these parameters.
                     EventDataTable.First;
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT E.ID, E.AnimalID, E.EventDate, E.ICBFNotified,');
                     SQL.Add('       CS.CalfVitality, CS.CalfSize');
                     SQL.Add('FROM Events E');
                     SQL.Add('LEFT JOIN ICBFCalfSurveyEvent CS ON (CS.EventID = E.ID)');
                     SQL.Add('WHERE E.EventType = '+IntToStr(CICBFCalfSurveyEvent)+'');
                     Open;
                     First;
                     while ( not(Eof) ) do
                        begin
                           if ( WinData.IsIncompleteCalfSurveyEvent(FieldByName('ID').AsInteger) ) then
                              begin
                                 if ( FieldByName('CalfVitality').AsInteger > 0 ) then
                                     if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                        begin
                                           EventDataTable.Edit;
                                           EventDataTable.FieldByName('CalfVitality').AsInteger := FieldByName('CalfVitality').AsInteger;
                                           EventDataTable.Post;
                                        end;
                                 if ( FieldByName('CalfSize').AsInteger > 0 ) then
                                     if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                        begin
                                           EventDataTable.Edit;
                                           EventDataTable.FieldByName('CalfSize').AsInteger := FieldByName('CalfSize').AsInteger;
                                           EventDataTable.Post;
                                        end;
                              end
                           else
                              begin
                                  if ( EventDataTable.Locate('ID',FieldByName('AnimalID').AsInteger,[]) ) then
                                     EventDataTable.Delete;
                              end;
                           Next;
                        end;
                  end;

            finally
               Close;
            end;
         finally
            Free;
         end;

      FilterOutAnimals(AEventType);

   finally
      EventDataTable.Close;
      EventDataTable.Open;
      EventDataTable.First;
      EventGridDBTableView.DataController.FocusedRowIndex := 0;
      StatusBar.Panels[0].Text := Format('Total: (%d)',[ EventDataTable.RecordCount]);
      EventGridLevel.GridView.DataController.EndFullUpdate;
      Screen.Cursor := crDefault;
      if bError then
         MessageDlg('A problem occurred while gathering data - contact Kingswood',mtError,[mbOk],0);
   end;
end;

procedure TfmAWEventsByGroup.UpdateRecord(AFieldName: String; AFieldValue: Variant);
var
  BK : TBookmark ;
begin
   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;
          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          BK := GetBookmark;
          try
             First;
             while ( not(Eof) ) do
                begin
                   if AFieldName <> 'Selected' then
                      begin
                         if FieldByName('Selected').AsBoolean then
                            begin
                               if ( EventPageControl.ActivePage = tsCalfSurveyEvent ) then
                                  begin
                                     if ( AFieldName = 'CalfDocility' ) or ( AFieldName = 'CalfQuality' ) or
                                        ( AFieldName = 'CalfScour' ) or ( AFieldName = 'CalfPneumonia' ) then
                                        begin
                                           //   14/11/17 /MK Change - Using continue here where there was no for i used. Change AFieldValue to Null instead.
                                           if ( not(AnimalIsAtMinAge(FieldByName('DateOfBirth').AsDateTime,
                                                                     FieldByName('EventDate').AsDateTime,5)) ) then
                                              AFieldValue := Null;
                                        end
                                     else if ( AFieldName = 'CalfVitality' ) or ( AFieldName = 'CalfSize' ) then
                                        begin
                                           //   14/11/17 /MK Change - Using continue here where there was no for i used. Change AFieldValue to Null instead.
                                           if ( FieldByName('ExistingEventID').AsInteger > 0 ) then
                                              AFieldValue := Null;
                                        end;
                                  end;
                               Edit;
                               FieldByName(AFieldName).Value := AFieldValue;
                               Post;
                            end;
                      end
                   else
                      begin
                         Edit;
                         FieldByName(AFieldName).Value := AFieldValue;
                         if EventDataTable.State = dsEdit then
                            EventDataTable.Post;
                      end;
                   Next;
                end;
          finally
             GotoBookmark(BK);
             FreeBookmark(BK);
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
          end;
       end;
end;

procedure TfmAWEventsByGroup.EventPageControlPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   if FFormShowing then
      AllowChange := MessageDLG('Are you finished with ' + EventPageControl.ActivePage.Caption+'?',mtConfirmation,[mbYes,mbNo],0) = idYes;

   if (AllowChange) and (NewPage <> nil) then
      begin
         if NewPage <> tsGuidelines then
            begin
               EventPageControl.Tabs.BeginUpdate;
               try
                  tsGuidelines.TabVisible  := False;
                  btnReadGuidelines.Parent := NewPage;
                  EventDateLabel.Parent    := NewPage;
                  deEventDate.Parent       := NewPage;
                  CommentLabel.Parent      := NewPage;
                  teComment.Parent         := NewPage;
                  btnNotApplicable.Parent  := NewPage;
                  if NewPage = tsDisbudding then
                     FEventType := TDisbudding
                  else if (NewPage = tsCastration) then
                     FEventType := TCastrate
                  else if (NewPage = tsMealFeeding) then
                     FEventType := TMealFeeding
                  else if (NewPage = tsWeaning) then
                     FEventType := TWean
                  else if (NewPage = tsDamEvent) then
                     FEventType := TICBFDamEvent
                  else if (NewPage = tsStockBullEvent) then
                     FEventType := TICBFStockBullEvent
                  else if (NewPage = tsCalfSurveyEvent) then
                     FEventType := TICBFCalfSurveyEvent;

                  SetupEvent(FEventType);
               finally
                  EventPageControl.Tabs.EndUpdate;
               end;
               Update;
            end
         else
            begin


            end;
      end;
end;

procedure TfmAWEventsByGroup.SetupEvent(AEventType : TEventType);
begin
   if ( not(AEventType in ([])) ) then
      begin
         btnNotApplicable.Caption := '';
         btnNotApplicable.Visible := False;

         deEventDate.TabOrder := 0;

         ChangeControlPosition(EventDateLabel, 23, 26);
         ChangeControlPosition(deEventDate, 20, 128);
         deEventDate.Date := Date;

         if AEventType = TDisbudding then
            begin
               EventGridDBTableViewEventDate.Options.Editing := True;
               ChangeControlPosition(VeterinarianLabel, 63, 26);
               ChangeControlPosition(cmboVeterinarian, 60, 128);

               ChangeControlPosition(CommentLabel, 103, 26);
               ChangeControlPosition(teComment, 100, 128);

               cmboVeterinarian.Clear;
               teComment.EditValue := 'Disbudding';

               //EventGridLevel.GridView := DisbuddingEventGridDBTableView;

               cmboVeterinarian.TabOrder := 1;
               teComment.TabOrder := 2;

               EventGridDBTableViewCalfDocility.Visible := False;
               EventGridDBTableViewCalfQuality.Visible := False;
               EventGridDBTableViewCalfWeight.Visible := False;
               EventGridDBTableViewCalfVitality.Visible := False;
               EventGridDBTableViewCalfSize.Visible := False;
               EventGridDBTableViewCalfScour.Visible := False;
               EventGridDBTableViewCalfPneumonia.Visible := False;
               EventGridDBTableViewWeightDate.Visible := False;
               EventGridDBTableViewVeterinarian.Visible := True;

               btnNotApplicable.Caption := 'Disbudding is not applicable for selected animal(s)';
               btnNotApplicable.Visible := True;

            end
         else if ((AEventType = TCastrate) or (AEventType = TMealFeeding)) then
            begin
               EventGridDBTableViewEventDate.Options.Editing := True;
               ChangeControlPosition(CommentLabel, 63, 26);
               ChangeControlPosition(teComment, 60, 128);

               if (AEventType = TCastrate) then
                  teComment.EditValue := 'Castration'
               else
                  teComment.EditValue := 'Meal Feeding';
               //EventGridLevel.GridView := CastrationEventGridDBTableView;

               teComment.TabOrder := 1;
               EventGridDBTableViewCalfDocility.Visible := False;
               EventGridDBTableViewCalfQuality.Visible := False;
               EventGridDBTableViewCalfVitality.Visible := False;
               EventGridDBTableViewCalfSize.Visible := False;
               EventGridDBTableViewCalfScour.Visible := False;
               EventGridDBTableViewCalfPneumonia.Visible := False;
               EventGridDBTableViewCalfWeight.Visible := False;
               EventGridDBTableViewWeightDate.Visible := False;
               EventGridDBTableViewVeterinarian.Visible := False;

               if AEventType = TCastrate then
                  begin
                     btnNotApplicable.Caption := 'Castration is not applicable for selected animal(s)';
                     btnNotApplicable.Visible := True;
                  end;
            end
         else if ( AEventType = TWean ) then
            begin
               EventGridDBTableViewEventDate.Options.Editing := True;

               ChangeControlPosition(ActualWeightLabel, 60, 26);
               ChangeControlPosition(ceWeight, 62, 128);

               ChangeControlPosition(deWeightDate, 62, 300);

               ChangeControlPosition(CommentLabel, 23, 320);
               ChangeControlPosition(teComment, 20, 380);

               teComment.EditValue := 'Weaning';
               ceWeight.Clear;
               deWeightDate.Clear;
               //EventGridLevel.GridView := WeaningEventGridDBTableView;

               ceWeight.TabOrder := 1;
               deWeightDate.TabOrder := 2;
               teComment.TabOrder := 3;

               EventGridDBTableViewCalfDocility.Visible := False;
               EventGridDBTableViewCalfQuality.Visible := False;
               EventGridDBTableViewCalfVitality.Visible := False;
               EventGridDBTableViewCalfSize.Visible := False;
               EventGridDBTableViewCalfScour.Visible := False;
               EventGridDBTableViewCalfPneumonia.Visible := False;
               EventGridDBTableViewCalfWeight.Visible := True;
               EventGridDBTableViewWeightDate.Visible := True;
               EventGridDBTableViewVeterinarian.Visible := False;
            end
         else if ((AEventType = TICBFDamEvent) or (AEventType = TICBFStockBullEvent) or
            (AEventType = TICBFCalfSurveyEvent) ) then
            begin
               EventGridDBTableViewEventDate.Options.Editing := True;
               ChangeControlPosition(CommentLabel, 23, 320);
               ChangeControlPosition(teComment, 20, 380);

               if (AEventType = TICBFDamEvent) then
                  begin
                     teComment.EditValue := 'Dam Event';
                     EventGridDBTableViewICBFStockBullFunctionality.Visible := False;
                     EventGridDBTableViewICBFStockBullDocility.Visible := False;
                     EventGridDBTableViewICBFDamMilkAbility.Visible := True;
                     EventGridDBTableViewICBFDamDocility.Visible := True;

                     ChangeControlPosition(MilkAbilityLabel, 63, 26);
                     ChangeControlPosition(cmboCowMilkAbility, 60, 128);

                     ChangeControlPosition(CowQualityLabel, 103, 26);
                     ChangeControlPosition(cmboCowDocility, 100, 128);

                     cmboCowMilkAbility.TabOrder := 1;
                     cmboCowDocility.TabOrder := 2;
                     teComment.TabOrder := 3;
                  end
               else if ( AEventType = TICBFStockBullEvent ) then
                  begin
                     teComment.EditValue := 'Stock Bull Event';
                     EventGridDBTableViewICBFStockBullFunctionality.Visible := True;
                     EventGridDBTableViewICBFStockBullDocility.Visible := True;
                     EventGridDBTableViewICBFDamMilkAbility.Visible := False;
                     EventGridDBTableViewICBFDamDocility.Visible := False;

                     ChangeControlPosition(BullFunctionalityLabel, 63, 26);
                     ChangeControlPosition(cmboBullFunctionality, 60, 128);

                     ChangeControlPosition(BullDocilityLabel, 103, 26);
                     ChangeControlPosition(cmboBullDocility, 100, 128);

                     cmboBullFunctionality.TabOrder := 1;
                     cmboBullDocility.TabOrder := 2;
                     teComment.TabOrder := 3;
                  end
               else if ( AEventType = TICBFCalfSurveyEvent ) then
                  begin
                     cmboCalfDocility.Clear;
                     cmboCalfQuality.Clear;
                     cmboCalfVitality.Clear;
                     cmboCalfSize.Clear;
                     cmboCalfScour.Clear;
                     cmboCalfPneumonia.Clear;

                     teComment.EditValue := 'Calf Survey Event';
                     EventGridDBTableViewCalfDocility.Visible := True;
                     EventGridDBTableViewCalfQuality.Visible := True;
                     EventGridDBTableViewCalfVitality.Visible := True;
                     EventGridDBTableViewCalfSize.Visible := True;
                     EventGridDBTableViewCalfScour.Visible := True;
                     EventGridDBTableViewCalfPneumonia.Visible := True;
                     EventGridDBTableViewICBFStockBullFunctionality.Visible := False;
                     EventGridDBTableViewICBFStockBullDocility.Visible := False;
                     EventGridDBTableViewICBFDamMilkAbility.Visible := False;
                     EventGridDBTableViewICBFDamDocility.Visible := False;

                     ChangeControlPosition(CalfVitalityLabel, 62, 26);
                     ChangeControlPosition(cmboCalfVitality, 58, 128);

                     ChangeControlPosition(CalfSizeLabel, 94, 26);
                     ChangeControlPosition(cmboCalfSize, 90, 128);

                     ChangeControlPosition(DocilityLabel, 126, 26);
                     ChangeControlPosition(cmboCalfDocility, 122, 128);

                     ChangeControlPosition(CalfQualityLabel, 158, 26);
                     ChangeControlPosition(cmboCalfQuality, 154, 128);

                     ChangeControlPosition(CalfScourLabel, 62, 374);
                     ChangeControlPosition(cmboCalfScour, 58, 478);

                     ChangeControlPosition(CalfPneumoniaLabel, 94, 374);
                     ChangeControlPosition(cmboCalfPneumonia, 90, 478);

                     cmboCalfDocility.TabOrder := 1;
                     cmboCalfQuality.TabOrder := 2;
                     cmboCalfVitality.TabOrder := 3;
                     cmboCalfSize.TabOrder := 4;
                     cmboCalfScour.TabOrder := 5;
                     cmboCalfPneumonia.TabOrder := 6;
                     teComment.TabOrder := 7;
                  end;

               teComment.TabOrder := 1;
               if ( AEventType <> TICBFCalfSurveyEvent ) then
                  begin
                     EventGridDBTableViewCalfDocility.Visible := False;
                     EventGridDBTableViewCalfQuality.Visible := False;
                     EventGridDBTableViewCalfVitality.Visible := False;
                     EventGridDBTableViewCalfSize.Visible := False;
                     EventGridDBTableViewCalfScour.Visible := False;
                     EventGridDBTableViewCalfPneumonia.Visible := False;
                  end;

               EventGridDBTableViewCalfWeight.Visible := False;
               EventGridDBTableViewWeightDate.Visible := False;
               EventGridDBTableViewVeterinarian.Visible := False;
            end;
      end;

   EventGridDBTableViewICBFStockBullFunctionality.Visible := ( AEventType = TICBFStockBullEvent );
   EventGridDBTableViewICBFStockBullDocility.Visible := ( AEventType = TICBFStockBullEvent );
   EventGridDBTableViewICBFDamMilkAbility.Visible := ( AEventType = TICBFDamEvent );
   EventGridDBTableViewICBFDamDocility.Visible := ( AEventType = TICBFDamEvent );

end;

procedure TfmAWEventsByGroup.blbCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfmAWEventsByGroup.SelectAll(ASelect: Boolean);
begin
   UpdateRecord( 'Selected', ASelect);
end;

procedure TfmAWEventsByGroup.blbSelectAllClick(Sender: TObject);
begin
   SelectAll(True);
end;

procedure TfmAWEventsByGroup.ChangeControlPosition(AControl : TControl;ATop,
ALeft : Integer);
begin
   AControl.Top :=ATop;
   AControl.Left:=ALeft;
end;

procedure TfmAWEventsByGroup.deEventDateExit(Sender: TObject);
begin
   UpdateRecord( 'EventDate', (Sender as TcxDateEdit).EditValue);
end;

procedure TfmAWEventsByGroup.teCommentExit(Sender: TObject);
begin
   UpdateRecord( 'EventDesc', teComment.Text);
end;

procedure TfmAWEventsByGroup.ceWeightExit(Sender: TObject);
begin
   UpdateRecord( 'CalfWeight', ceWeight.EditValue);
end;

procedure TfmAWEventsByGroup.deWeightDateExit(Sender: TObject);
begin
   if (deWeightDate.Date > Date) then
      begin
         MessageDlg('Weighing Date cannot be after today.',mtError,[mbOK],0);
         SysUtils.Abort;
      end;
   UpdateRecord( 'WeightDate', deWeightDate.Date);
end;

procedure TfmAWEventsByGroup.blbSaveClick(Sender: TObject);
begin
   if ( MessageDlg('Are all details correct?',mtConfirmation,[mbYes,mbNo],0) = idNo ) then Exit;
   case FEventType of
      TDisbudding          : CreateDisbuddingEvents;
      TCastrate            : CreateCastrationEvents;
      TMealFeeding         : CreateMealFeedingEvents;
      TWean                : CreateWeaningEvents;
      TICBFDamEvent        : CreateICBFDamEvents;
      TICBFStockBullEvent  : CreateICBFStockBullEvents;
      TICBFCalfSurveyEvent : CreateICBFCalfSurveyEvents;
   end;
   GetAnimals(FEventType);
end;

procedure TfmAWEventsByGroup.CreateDisbuddingEvents;
var
   DisbuddingEvent : TDisbuddingEvent;
   TotalCreated : Integer;
begin
   TotalCreated := 0;
   ValidateDisbuddingEvents;
   with EventDataTable do
       begin

          if ( not(Active) ) then Exit;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          DisbuddingEvent := TDisbuddingEvent.Create('DIS');
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         // ** validate event details.
                         DisbuddingEvent.Append;
                         try
                            DisbuddingEvent.AnimalID     := FieldByName('ID').AsInteger;
                            DisbuddingEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                            DisbuddingEvent.AnimalHerdID := FieldByName('HerdID').AsInteger;
                            if FieldByName('Veterinarian').AsInteger > 0 then
                               DisbuddingEvent.Vet := FieldByName('Veterinarian').AsInteger;
                            DisbuddingEvent.EventDate := FieldByName('EventDate').AsDateTime;
                            DisbuddingEvent.EventComment := FieldByName('EventDesc').AsString;
                            DisbuddingEvent.Post;
                            Inc(TotalCreated);
                         except
                            DisbuddingEvent.Cancel;
                            MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                       'Failed to create Disbudding event.',mtError,[mbOk],0);
                         end;
                         // lets create the event.
                      end;
                   Next;
                end;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             FreeAndNil(DisbuddingEvent);
             MessageDlg(Format('"%d" disbudding event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
          end;
       end;
end;

procedure TfmAWEventsByGroup.ValidateDisbuddingEvents;
var
   TempInt : Integer;
begin
   with EventDataTable do
       begin
          if not Active then exit;

          if State = dsEdit then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         if WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CDisbuddingEvent) > 0 then
                            begin
                               MessageDlg('A Disbudding event has already been recorded for this animal.',mtInformation,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime > Date then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime < FieldByName('DateOfBirth').AsDateTime then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth.',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;

                         // complete validation checks before disbudding can be saved.
                         // 1. Disbudding date must be within 21 days of DOB
                         // 2. If Disbudding date is > 14 Days days of DOB, Vet must be used.
                         // 3. This event is not recorded for polled animals, definition of polled animals = ??
                         // Possibly this might relate to what breed the animal might be. Ignore rule 3 for now. - 13/12/2007
                         TempInt := Trunc(EventDataTable.FieldByName('EventDate').AsDateTime - EventDataTable.FieldByName('DateOfBirth').AsDateTime);
                         if TempInt > 21 then
                            begin

                               if EventDataTable.FieldByName('Veterinarian').AsInteger <= 0 then
                                  begin
                                     MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                'It has been %d days since animal date of birth.'+#13#10+
                                                'If you disbud a calf after 14 days, you must enter a vet.'
                                                ,[FieldByName('NatIDNum').AsString,TempInt]),mtWarning,[mbOk],0);
                                     SysUtils.Abort;
                                  end;

                               {
                               if MessageDlg(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString]) +#13#10+#13#10+
                                                    'The animal is more than 21 days of age.'+#13#10+
                                                    'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                               }
                               //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                               if Application.MessageBox(PChar(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString]) +#13#10+#13#10+
                                                               'The animal is more than 21 days of age.'+#13#10+
                                                               'Do you want to continue?'),PChar(MessageHeader),
                                                               MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then

                               SysUtils.Abort;
                            end
                         else if TempInt > 14 then
                            begin
                               // ensure vet is assigned.
                               if EventDataTable.FieldByName('Veterinarian').AsInteger <= 0 then
                                  begin
                                     MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                'It has been %d days since animal date of birth.'+#13#10+
                                                'If you disbud a calf after 14 days, you must enter a vet.'
                                                ,[FieldByName('NatIDNum').AsString,TempInt]),mtWarning,[mbOk],0);
                                     SysUtils.Abort;
                                  end;
                            end
                         else if TempInt < 0 then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString]) +#13#10+#13#10+
                                                 'The disbudding date must be after animal date of birth.',mtError,[mbOk],0);
                               SysUtils.Abort;
                            end;
                      end;
                   Next;
                end;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
          end;
       end;
end;

procedure TfmAWEventsByGroup.CreateCastrationEvents;
var
   CastrationEvent : TCastrationEvent;
   TotalCreated : Integer;
begin
   TotalCreated := 0;
   ValidateCastrationEvents;
   with EventDataTable do
       begin
          if not Active then exit;

          if State = dsEdit then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          CastrationEvent := TCastrationEvent.Create('CAS');
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         CastrationEvent.Append;
                         try
                            CastrationEvent.AnimalID     := FieldByName('ID').AsInteger;
                            CastrationEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                            CastrationEvent.AnimalHerdID := FieldByName('HerdID').AsInteger;
                            CastrationEvent.EventDate    := FieldByName('EventDate').AsDateTime;
                            CastrationEvent.EventComment := FieldByName('EventDesc').AsString;
                            CastrationEvent.Post;
                            Inc(TotalCreated);
                         except
                            CastrationEvent.Cancel;

                            MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                       'Failed to create Castration event.',mtError,[mbOk],0);
                         end;
                      end;
                   Next;
                end;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             FreeAndNil(CastrationEvent);
             MessageDlg(Format('"%d" Castration event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
          end;
       end;
end;

procedure TfmAWEventsByGroup.ValidateCastrationEvents;
var
   TempDate : TDateTime;
   WeaningDate : TDateTime;
begin
   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;

          if State = dsEdit then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin

                         if WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CCastrateEvent) > 0 then
                            begin
                               MessageDlg('A Castration event has already been recorded for this animal.',mtInformation,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime > Date then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime < FieldByName('DateOfBirth').AsDateTime then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth.',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;


                         TempDate := IncMonth(FieldByName('EventDate').AsDateTime, -6);
                         if FieldByName('DateOfBirth').AsDateTime < TempDate then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                          'This castration event cannot continue.'+#13#10+
                                          'The animal is more than 6 months of age.',mtError,[mbOk],0);
                               SysUtils.Abort;
                            end;

                         if not WinData.CastrationQueryWeaning(FieldByName('ID').AsInteger, FieldByName('EventDate').AsDateTime, WeaningDate ) then
                            begin
                               {
                               if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                     'A Weaning Event for "%s" has been found for this animal.'+#13#10+
                                                     'The Castration Date entered must be at least 4 weeks before'+#13#10+
                                                     'the Weaning Date, or at least 2 weeks after the weaning date.'+#13#10+#13#10+
                                                     'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(WeaningDate)]),mtWarning,[mbYes,mbNo],1) = idNo then
                               }
                               //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                               if Application.MessageBox(PChar(Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                                      'A Weaning Event for "%s" has been found for this animal.'+#13#10+
                                                                      'The Castration Date entered must be at least 4 weeks before'+#13#10+
                                                                      'the Weaning Date, or at least 2 weeks after the weaning date.'+#13#10+#13#10+
                                                                      'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(WeaningDate)])),PChar(MessageHeader),
                                                                      MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then
                               SysUtils.Abort;
                            end;
                      end;
                   Next;
                end;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
          end;
       end;
end;

procedure TfmAWEventsByGroup.CreateMealFeedingEvents;
var
   MealFeedingEvent : TMealFeedingEvent;
   TotalCreated : Integer;
begin
   TotalCreated := 0;
   ValidateMealFeedingEvents;
   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          MealFeedingEvent := TMealFeedingEvent.Create('WEA');
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         MealFeedingEvent.Append;
                         try
                            MealFeedingEvent.AnimalID     := FieldByName('ID').AsInteger;
                            MealFeedingEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                            MealFeedingEvent.AnimalHerdID := FieldByName('HerdID').AsInteger;
                            MealFeedingEvent.EventDate := FieldByName('EventDate').AsDateTime;
                            MealFeedingEvent.EventComment := FieldByName('EventDesc').AsString;
                            MealFeedingEvent.Post;
                            Inc(TotalCreated);
                         except
                            MealFeedingEvent.Cancel;

                            MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                       'Failed to create Weaning event.',mtError,[mbOk],0);

                         end;
                      end;
                   Next;
                end;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             FreeAndNil(MealFeedingEvent);
             MessageDlg(Format('"%d" Meal Feeding event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
          end;
       end;
end;

procedure TfmAWEventsByGroup.ValidateMealFeedingEvents;
var
   WeaningDate : TDateTime;
begin
   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;
          if ( State = dsEdit ) then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         if WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CMealFeedingEvent) > 0 then
                            begin
                               MessageDlg('A Meal Feeding event has already been recorded for this animal.',mtInformation,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime > Date then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime < FieldByName('DateOfBirth').AsDateTime then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;

                         // Check disbudding event has been recorded.
                         if not WinData.CheckEventExists(FieldByName('ID').AsInteger,-1,CDisbuddingEvent) then
                            begin
                               {
                               if MessageDlg(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                             'No disbudding event has been recorded for this animal.'+#13#10+#13#10+
                                             'Are you sure you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                               }
                               //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                               if Application.MessageBox(PChar(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                               'No disbudding event has been recorded for this animal.'+#13#10+#13#10+
                                                               'Do you want to continue?'),PChar(MessageHeader),
                                                               MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then

                               SysUtils.Abort;
                            end;

                         // if Bull, check castration event has been recorded where applicable.
                         // NOTE, if bull is being sold as "Whole" the recording of castration
                         // event is not required.
                         if FieldByName('Sex').AsString = cSex_Bull then
                            begin
                               if not WinData.CheckEventExists(FieldByName('ID').AsInteger,-1,CCastrateEvent) then
                                  begin
                                     {
                                     if MessageDlg(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                   'No castration event has been recorded for this animal.'+#13#10+#13#10+
                                                   'Are you sure you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                     }
                                     //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                                     if Application.MessageBox(PChar(Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                                     'No castration event has been recorded for this animal.'+#13#10+#13#10+
                                                                     'Do you want to continue?'),PChar(MessageHeader),
                                                                     MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then
                                     SysUtils.Abort;
                                  end;
                            end;

                         if not WinData.MealFeedingQueryWeaning(FieldByName('ID').AsInteger, FieldByName('EventDate').AsDateTime, WeaningDate) then
                            begin
                               {
                               if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                              'A Weaning Event date for the "%s" has been found for this animal.'+#13#10+
                                              'The Meal Feeding Event date must be at least 4 weeks before'+#13#10+
                                              'Weaning date and continued for 2 weeks after the Weaning date.'+#13#10+#13#10+
                                              'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(WeaningDate)]),mtWarning,[mbYes,mbNo],0) = idNo then
                               }
                               //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                               if Application.MessageBox(PChar(Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                               'A Weaning Event date for the "%s" has been found for this animal.'+#13#10+
                                                               'The Meal Feeding Event date must be at least 4 weeks before'+#13#10+
                                                               'Weaning date and continued for 2 weeks after the Weaning date.'+#13#10+#13#10+
                                                               'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(WeaningDate)])),PChar(MessageHeader),
                                                               MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then

//                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
  //                                                'Feeding Event must be at least 4 weeks before Weaning'+#13#10+
    //                                              'and continued for two weeks after Weaning.',mtError,[mbOK],0);
                               SysUtils.Abort;
                            end;
                      end;
                   Next;
                end;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
          end;
       end;
end;

procedure TfmAWEventsByGroup.CreateWeaningEvents;
var
   WeaningEvent : TWeaningEvent;
   TotalCreated : Integer;
begin
   TotalCreated := 0;
   Screen.Cursor := crHourGlass;
   try
      ValidateWeaningEvents;
      with EventDataTable do
          begin
             if ( not(Active) ) then Exit;
             DisableControls;
             EventGridLevel.GridView.DataController.BeginFullUpdate;
             WeaningEvent := TWeaningEvent.Create('CAS');
             try
                First;
                while not eof do
                   begin
                      if FieldByName('Selected').AsBoolean then
                         begin
                            WeaningEvent.Append;
                            try
                               WeaningEvent.AnimalID     := FieldByName('ID').AsInteger;
                               WeaningEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                               WeaningEvent.AnimalHerdID := FieldByName('HerdID').AsInteger;
                               WeaningEvent.EventDate    := FieldByName('EventDate').AsDateTime;
                               WeaningEvent.EventComment := FieldByName('EventDesc').AsString;
                               WeaningEvent.Weight       := FieldByName('CalfWeight').AsFloat;
                               WeaningEvent.WeightOnDate := FieldByName('WeightDate').AsDateTime;
                               WeaningEvent.Post;
                               Inc(TotalCreated);
                            except
                               WeaningEvent.Cancel;
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                          'Failed to create Weaning event.',mtError,[mbOk],0);
                            end;
                         end;
                      Next;
                   end;
             finally
                EventGridLevel.GridView.DataController.EndFullUpdate;
                EnableControls;
                FreeAndNil(WeaningEvent);
                MessageDlg(Format('"%d" Weaning event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
             end;
          end;
   finally
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmAWEventsByGroup.ValidateWeaningEvents;
var
   CastrationDate, MealFeedingDate : TDateTime;
   MinAge : TDateTime;
   RecordEvents : Boolean;
   ErrorMsg : string;
begin
   { CheckNoOfRecordedWeanings; <-- removed by SP. validation replaced by TAWWeaningEventValidator class }

   RecordEvents := False;
   ErrorMsg := '';

   deEventDate.PostEditValue;

   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;
          if ( State = dsEdit ) then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         if WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CWeaningEvent) > 0 then
                            begin
                               MessageDlg('A Weaning event has already been recorded for this animal.',mtInformation,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime > Date then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime < FieldByName('DateOfBirth').AsDateTime then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;

                         if not WinData.WeaningQueryCastration(FieldByName('ID').AsInteger, FieldByName('EventDate').AsDateTime, CastrationDate) then
                            begin
                               {
                               if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                     'A Castration Event date for the "%s" has been found for this animal.'+#13#10+
                                                     'The Weaning date must be at least 4 weeks after the Castration Date.'+#13#10+#13#10+
                                                     'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(CastrationDate)]),mtWarning,[mbYes,mbNo],0) = idNo then
                               }
                               //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                               if Application.MessageBox(PChar(Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                               'A Castration Event date for the "%s" has been found for this animal.'+#13#10+
                                                               'The Weaning date must be at least 4 weeks after the Castration Date.'+#13#10+#13#10+
                                                               'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(CastrationDate)])),PChar(MessageHeader),
                                                               MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then
                               SysUtils.Abort;
                            end;

                         if not WinData.WeaningQueryMealFeeding(FieldByName('ID').AsInteger, FieldByName('EventDate').AsDateTime, MealFeedingDate) then
                            begin
                               {
                               if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                     'A Feeding Event date for the "%s" has been found for this animal.'+#13#10+
                                                     'The Meal Feeding Event date must be at least 4 weeks before'+#13#10+
                                                     'Weaning date and continued for 2 weeks after the Weaning date.'+#13#10+#13#10+
                                                     'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(MealFeedingDate)]),mtWarning,[mbYes,mbNo],1) = idNo then
                               }
                               //   16/11/11 [V5.0 R2.1] /MK Change - Changed MessageDlg Box to Application.MessageBox to Default To No.
                               if Application.MessageBox(PChar(Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                               'A Feeding Event date for the "%s" has been found for this animal.'+#13#10+
                                                               'The Meal Feeding Event date must be at least 4 weeks before'+#13#10+
                                                               'Weaning date and continued for 2 weeks after the Weaning date.'+#13#10+#13#10+
                                                               'Do you want to continue?',[FieldByName('NatIDNum').AsString,DateToStr(MealFeedingDate)])),PChar(MessageHeader),
                                                               MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = idNo then
                               SysUtils.Abort;
                            end;

                          if FieldByName('CalfWeight').AsFloat > 0 then
                             begin
                                if FieldByName('WeightDate').AsDateTime <= 0 then
                                   begin
                                      if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'No weighing date has been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                         SysUtils.Abort;
                                   end;
                             end;

                          // Introduction of 8 week rule ( Notified by Craig in ICBF 05/11/2010
                          // Calf must be at least 8 weeks old at the time of Weaning Date.
                          MinAge := FieldByName('DateOfBirth').AsDateTime + ( 8 {weeks} * 7 { days } ) ;

                          if EventDataTable.FieldByName('EventDate').AsDateTime < MinAge then
                             begin
                                MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Animal must be at least 8 weeks old before weaning.',mtWarning,[mbOK],0);
                                SysUtils.Abort;
                             end;
                      end;
                   Next;
                end;

                RecordEvents := True;
          finally

             if RecordEvents then
                begin
                   with TAWWeaningEventValidator.create(FHerdID, deEventDate.Date, SelectedCount ) do
                      try
                         RecordEvents := IsWeaningPermissible;
                         ErrorMsg := ErrorText
                      finally
                         Free;
                      end;

                   if not RecordEvents then
                      begin
                         MessageDlg(ErrorMsg,mtError,[mbOK],0);
                      end
                end;
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             if not RecordEvents then
                Abort;
          end;
       end;
end;

procedure TfmAWEventsByGroup.CreateICBFDamEvents;
var
   ICBFDamEvent : TICBFDamEventRec;
   TotalCreated : Integer;
   LastEventDate : TDateTime;
   LastEventID : Integer;
   TempEvents,
   TempICBFDamEvents : TTable;
   EventDateChanged,
   EditEventSaved : Boolean;
begin
   try
      //ValidateICBFDamSurveyEvents;

      TotalCreated := 0;
      TempEvents := TTable.Create(nil);
      TempEvents.DatabaseName := AliasName;
      TempEvents.TableName := 'Events';

      TempICBFDamEvents := TTable.Create(nil);
      TempICBFDamEvents.DatabaseName := AliasName;
      TempICBFDamEvents.TableName := 'ICBFDamEvent';
      TempICBFDamEvents.Open;

      with EventDataTable do
          begin
             if ( not(Active) ) then Exit;
             DisableControls;
             EventGridLevel.GridView.DataController.BeginFullUpdate;
             ICBFDamEvent := TICBFDamEventRec.Create('ICBFDAM');
             try
                First;
                while ( not(Eof) ) do
                   begin
                      if ( FieldByName('Selected').AsBoolean ) then
                         begin
                            // Don't do anything unless Docility and/or Milk Ability fields have data.
                            if ( FieldByName('ICBFDamDocility').AsInteger = 0 ) and ( FieldByName('ICBFDamMilkAbility').AsInteger = 0 ) then Exit;

                            TempEvents.Filtered := False;
                            TempEvents.Filter := '';
                            TempEvents.Filter := 'EventType = '+IntToStr(CICBFDamEvent)+'';
                            TempEvents.Filtered := True;
                            TempEvents.Open;

                            LastEventDate := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger,
                                                                                      FieldByName('LactNo').AsInteger,
                                                                                      CICBFDamEvent);

                            if TempEvents.Locate('AnimalID;AnimalLactNo;EventDate;EventType;HerdID',
                                                  VarArrayOf([FieldByName('ID').AsInteger,
                                                              FieldByName('LactNo').AsInteger,
                                                              LastEventDate,CICBFDamEvent,
                                                              FieldByName('HerdID').AsInteger]),[]) then
                               LastEventID := TempEvents.FieldByName('ID').AsInteger;

                            TempEvents.Filter := '';
                            TempEvents.Filtered := False;
                            TempEvents.Open;

                            if ( LastEventID = 0 ) then
                               begin
                                  ICBFDamEvent.Append;
                                  try
                                     ICBFDamEvent.AnimalID     := FieldByName('ID').AsInteger;
                                     ICBFDamEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                                     ICBFDamEvent.AnimalHerdID := FieldByName('HerdID').AsInteger;
                                     ICBFDamEvent.EventDate    := FieldByName('EventDate').AsDateTime;
                                     ICBFDamEvent.EventComment := FieldByName('EventDesc').AsString;
                                     ICBFDamEvent.EventType    := TICBFDamEvent;
                                     ICBFDamEvent.Docility     := FieldByName('ICBFDamDocility').AsInteger;
                                     ICBFDamEvent.MilkAbility  := FieldByName('ICBFDamMilkAbility').AsInteger;
                                     ICBFDamEvent.Post;
                                     Inc(TotalCreated);
                                  except
                                     ICBFDamEvent.Cancel;
                                     MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                'Failed to create ICBF Dam event.',mtError,[mbOk],0);
                                  end;
                               end
                            else
                               begin
                                  EditEventSaved := False;
                                  if ( FieldByName('EventDate').AsDateTime > LastEventDate ) then
                                     if ( TempEvents.Locate('ID',LastEventID,[]) ) then
                                        try
                                           TempEvents.Edit;
                                           TempEvents.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                                           TempEvents.FieldByName('ICBFNotified').AsBoolean := False;
                                           TempEvents.Post;
                                           EditEventSaved := True;
                                           EventDateChanged := True;
                                        except
                                           TempEvents.Cancel;
                                        end;

                                  if ( TempICBFDamEvents.Locate('EventID',LastEventID,[]) ) then
                                     begin
                                        try
                                           if ( TempICBFDamEvents.FieldByName('Docility').AsInteger <> FieldByName('ICBFDamDocility').AsInteger ) then
                                              begin
                                                 TempICBFDamEvents.Edit;
                                                 TempICBFDamEvents.FieldByName('Docility').AsInteger := FieldByName('ICBFDamDocility').AsInteger;
                                                 TempICBFDamEvents.Post;
                                                 EditEventSaved := True;
                                              end;
                                           if ( TempICBFDamEvents.FieldByName('MilkAbility').AsInteger <> FieldByName('ICBFDamMilkAbility').AsInteger ) then
                                              begin
                                                 TempICBFDamEvents.Edit;
                                                 TempICBFDamEvents.FieldByName('MilkAbility').AsInteger := FieldByName('ICBFDamMilkAbility').AsInteger;
                                                 TempICBFDamEvents.Post;
                                                 EditEventSaved := True;
                                              end;
                                            if ( EditEventSaved ) then
                                               begin
                                                  // If event was edited then allow resend to ICBF.
                                                  if ( TempEvents.Locate('ID',LastEventID,[]) ) and ( not(EventDateChanged) ) then
                                                     try
                                                        TempEvents.Edit;
                                                        TempEvents.FieldByName('ICBFNotified').AsBoolean := False;
                                                        TempEvents.Post;
                                                     except
                                                        TempEvents.Cancel;
                                                     end;
                                                  Inc(TotalCreated);
                                               end;
                                        except
                                           WinData.ICBFDamEvent.Cancel;
                                           MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                      'Failed to edit ICBF Dam event.',mtError,[mbOk],0);
                                        end;
                                     end;
                               end;
                         end;
                      Next;
                   end;
             finally
                EventGridLevel.GridView.DataController.EndFullUpdate;
                EnableControls;
                FreeAndNil(ICBFDamEvent);
                MessageDlg(Format('"%d" ICBF Dam event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
             end;
          end;
   finally
      TempEvents.Free;
      TempICBFDamEvents.Close;
      TempICBFDamEvents.Free;
   end;
end;

procedure TfmAWEventsByGroup.CreateICBFStockBullEvents;
var
   ICBFStockBullEventRec : TICBFStockBullEventRec;
   TotalCreated : Integer;
   LastEventDate : TDateTime;
   LastEventID : Integer;
   TempEvents,
   TempICBFStockBullEvents : TTable;
   EventDateChanged,
   EditEventSaved : Boolean;
begin
   try
      //ValidateICBFStockBullSurveyEvents;

      TotalCreated := 0;
      TempEvents := TTable.Create(nil);
      TempEvents.DatabaseName := AliasName;
      TempEvents.TableName := 'Events';

      TempICBFStockBullEvents := TTable.Create(nil);
      TempICBFStockBullEvents.DatabaseName := AliasName;
      TempICBFStockBullEvents.TableName := 'ICBFStockBullEvent';
      TempICBFStockBullEvents.Open;

      with EventDataTable do
          begin
             if ( not(Active) ) then Exit;
             DisableControls;
             EventGridLevel.GridView.DataController.BeginFullUpdate;
             ICBFStockBullEventRec := TICBFStockBullEventRec.Create('ICBFSBE');
             try
                First;
                while not eof do
                   begin
                      if FieldByName('Selected').AsBoolean then
                         begin
                            // Don't do anything unless Docility and/or Funcionality fields have data.
                            if ( FieldByName('ICBFSBDocility').AsInteger = 0 ) and ( FieldByName('ICBFSBFunctionality').AsInteger = 0 ) then Exit;

                            TempEvents.Filtered := False;
                            TempEvents.Filter := '';
                            TempEvents.Filter := 'EventType = '+IntToStr(CICBFStockBullEvent)+'';
                            TempEvents.Filtered := True;
                            TempEvents.Open;

                            LastEventDate := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger,
                                                                                      FieldByName('LactNo').AsInteger,
                                                                                      CICBFStockBullEvent);

                            if TempEvents.Locate('AnimalID;AnimalLactNo;EventDate;EventType;HerdID',
                                                  VarArrayOf([FieldByName('ID').AsInteger,
                                                              FieldByName('LactNo').AsInteger,
                                                              LastEventDate,CICBFStockBullEvent,
                                                              FieldByName('HerdID').AsInteger]),[]) then
                               LastEventID := TempEvents.FieldByName('ID').AsInteger;

                            TempEvents.Filter := '';
                            TempEvents.Filtered := False;
                            TempEvents.Open;

                            if ( LastEventID = 0 ) then
                               begin
                                  ICBFStockBullEventRec.Append;
                                  try
                                     ICBFStockBullEventRec.AnimalID      := FieldByName('ID').AsInteger;
                                     ICBFStockBullEventRec.AnimalLactNo  := FieldByName('LactNo').AsInteger;
                                     ICBFStockBullEventRec.AnimalHerdID  := FieldByName('HerdID').AsInteger;
                                     ICBFStockBullEventRec.EventDate     := FieldByName('EventDate').AsDateTime;
                                     ICBFStockBullEventRec.EventComment  := FieldByName('EventDesc').AsString;
                                     ICBFStockBullEventRec.EventType     := TICBFStockBullEvent;
                                     ICBFStockBullEventRec.Docility      := FieldByName('ICBFSBDocility').AsInteger;
                                     ICBFStockBullEventRec.Functionality := FieldByName('ICBFSBFunctionality').AsInteger;
                                     ICBFStockBullEventRec.Post;
                                     Inc(TotalCreated);
                                  except
                                     ICBFStockBullEventRec.Cancel;
                                     MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                'Failed to create ICBF Stock Bull event.',mtError,[mbOk],0);
                                  end;
                               end
                            else
                               begin
                                  EditEventSaved := False;
                                  if ( FieldByName('EventDate').AsDateTime > LastEventDate ) then
                                     if ( TempEvents.Locate('ID',LastEventID,[]) ) then
                                        try
                                           TempEvents.Edit;
                                           TempEvents.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                                           TempEvents.FieldByName('ICBFNotified').AsBoolean := False;
                                           TempEvents.Post;
                                           EditEventSaved := True;
                                           EventDateChanged := True;
                                        except
                                           TempEvents.Cancel;
                                        end;

                                  if ( TempICBFStockBullEvents.Locate('EventID',LastEventID,[]) ) then
                                     begin
                                        try
                                           if ( TempICBFStockBullEvents.FieldByName('Docility').AsInteger <> FieldByName('ICBFSBDocility').AsInteger ) then
                                              begin
                                                 TempICBFStockBullEvents.Edit;
                                                 TempICBFStockBullEvents.FieldByName('Docility').AsInteger := FieldByName('ICBFSBDocility').AsInteger;
                                                 TempICBFStockBullEvents.Post;
                                                 EditEventSaved := True;
                                              end;
                                           if ( TempICBFStockBullEvents.FieldByName('Functionality').AsInteger <> FieldByName('ICBFSBFunctionality').AsInteger ) then
                                              begin
                                                 TempICBFStockBullEvents.Edit;
                                                 TempICBFStockBullEvents.FieldByName('Functionality').AsInteger := FieldByName('ICBFSBFunctionality').AsInteger;
                                                 TempICBFStockBullEvents.Post;
                                                 EditEventSaved := True;
                                              end;
                                            if ( EditEventSaved ) then
                                               begin
                                                  // If event was edited then allow resend to ICBF.
                                                  if ( TempEvents.Locate('ID',LastEventID,[]) ) and ( not(EventDateChanged) ) then
                                                     try
                                                        TempEvents.Edit;
                                                        TempEvents.FieldByName('ICBFNotified').AsBoolean := False;
                                                        TempEvents.Post;
                                                     except
                                                        TempEvents.Cancel;
                                                     end;
                                                  Inc(TotalCreated);
                                               end;
                                        except
                                           WinData.ICBFDamEvent.Cancel;
                                           MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                      'Failed to edit ICBF Stock Bull event.',mtError,[mbOk],0);
                                        end;
                                     end;
                               end;
                         end;
                      Next;
                   end;
             finally
                EventGridLevel.GridView.DataController.EndFullUpdate;
                EnableControls;
                FreeAndNil(ICBFStockBullEventRec);
                MessageDlg(Format('"%d" ICBF Stock Bull event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
             end;
          end;
   finally
      TempEvents.Free;
      TempICBFStockBullEvents.Close;
      TempICBFStockBullEvents.Free;
   end;
end;

procedure TfmAWEventsByGroup.CMDialogKey(var msg: TWMKey);
begin
  If (msg.CharCode = VK_TAB) Then
     begin
        // process event
     end;
  inherited;
end;

procedure TfmAWEventsByGroup.EventDataTableSelectedChange(Sender: TField);
var
   dDateOfBirth,
   dEventDate : TDateTime;
begin
   if Sender.Value = True then
      begin
         if EventDataTable.State = dsEdit then
            begin
               EventDataTable.FieldByName('EventDate').AsDateTime := deEventDate.Date;
               EventDataTable.FieldByName('EventDesc').AsString   := teComment.Text;

               case FEventType of
                  TDisbudding  :  begin
                                     if not VarIsNull(cmboVeterinarian.EditValue) then
                                        EventDataTable.FieldByName('Veterinarian').AsInteger := cmboVeterinarian.EditValue;
                                  end;
                  TWean        :  begin
                                     if ( not(VarIsNull(ceWeight.Value)) ) and (ceWeight.Value>0) then
                                        EventDataTable.FieldByName('CalfWeight').AsFloat := ceWeight.Value;
                                     if ( deWeightDate.Date > 0 ) then
                                        EventDataTable.FieldByName('WeightDate').AsDateTime := deWeightDate.Date;
                                  end;
                  TICBFDamEvent : begin
                                     if ( not(VarIsNull(cmboCowMilkAbility.EditValue)) ) then
                                        EventDataTable.FieldByName('ICBFDamMilkAbility').AsInteger := cmboCowMilkAbility.EditValue;
                                     if ( not(VarIsNull(cmboCowDocility.EditValue)) ) then
                                        EventDataTable.FieldByName('ICBFDamDocility').AsInteger := cmboCowDocility.EditValue;
                                  end;
                  TICBFStockBullEvent :
                                  begin
                                     if ( not(VarIsNull(cmboBullFunctionality.EditValue)) ) then
                                        EventDataTable.FieldByName('ICBFSBFunctionality').AsInteger := cmboBullFunctionality.EditValue;
                                     if ( not(VarIsNull(cmboBullDocility.EditValue)) ) then
                                        EventDataTable.FieldByName('ICBFSBDocility').AsInteger := cmboBullDocility.EditValue;
                                  end;
                  TICBFCalfSurveyEvent :
                                  begin
                                     dDateOfBirth := EventDataTable.FieldByName('DateOfBirth').AsDateTime;
                                     dEventDate := EventDataTable.FieldByName('EventDate').AsDateTime;
                                     if ( AnimalIsAtMinAge(dDateOfBirth,dEventDate,5) ) then
                                        begin
                                           if ( not(VarIsNull(cmboCalfDocility.EditValue)) ) then
                                              EventDataTable.FieldByName('CalfDocility').AsInteger := cmboCalfDocility.EditValue;
                                           if ( not(VarIsNull(cmboCalfQuality.EditValue)) ) then
                                              EventDataTable.FieldByName('CalfQuality').AsInteger := cmboCalfQuality.EditValue;
                                           if ( not(VarIsNull(cmboCalfScour.EditValue)) ) then
                                              EventDataTable.FieldByName('CalfScour').AsInteger := cmboCalfScour.EditValue;
                                           if ( not(VarIsNull(cmboCalfPneumonia.EditValue)) ) then
                                              EventDataTable.FieldByName('CalfPneumonia').AsInteger := cmboCalfPneumonia.EditValue;
                                        end;
                                     if ( EventDataTable.FieldByName('ExistingEventID').AsInteger = 0 ) then
                                        begin
                                           if ( not(VarIsNull(cmboCalfVitality.EditValue)) ) then
                                              EventDataTable.FieldByName('CalfVitality').AsInteger := cmboCalfVitality.EditValue;
                                           if ( not(VarIsNull(cmboCalfSize.EditValue)) ) then
                                              EventDataTable.FieldByName('CalfSize').AsInteger := cmboCalfSize.EditValue;
                                        end;
                                  end;
               end;
           end;
      end;

   if ( EventDataTable.State = dsEdit ) then
      EventDataTable.Post;
end;

function TfmAWEventsByGroup.SelectedCount: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := aliasName;
         SQL.Add('Select Count(ID) CID From tEventDataTable Where Selected=True');
         Open;
         try
            First;
            if FieldByName('CID').AsInteger > 0 then
               Result := FieldByName('CID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmAWEventsByGroup.EventDataTableAfterPost(
  DataSet: TDataSet);
begin
   StatusBar.Panels[0].Text := Format('Total: (%d)',[ EventDataTable.RecordCount]);
   StatusBar.Panels[1].Text := Format('Selected: (%d)',[SelectedCount]);
end;

procedure TfmAWEventsByGroup.dxBarLargeButton3Click(
  Sender: TObject);
begin
   SelectAll(False);
end;

procedure TfmAWEventsByGroup.CheckNoOfRecordedWeanings;
var
   NoOfWeanings,
   NoOfRecordedWeanings : Integer;
begin
   // Check on the no. of weanings re-introduced 11/08/2010 requested by GL.
   // Originally removed from program at request of unknown farmer.
   NoOfRecordedWeanings := WinData.QueryNoOfWeanings(deEventDate.Date);
   if SelectedCount + NoOfRecordedWeanings > 10 then
      begin
         MessageDlg('You cannot exceed the maximum number allowed (10) weanings per day.',mtWarning,[mbOK],0);
         Abort;
      end;
end;

procedure TfmAWEventsByGroup.tsWeaningShow(Sender: TObject);
begin
   CheckNoOfRecordedWeanings;
end;

procedure TfmAWEventsByGroup.EventPageControlChange(
  Sender: TObject);
begin
   if EventPageControl.ActivePage <> nil then
      GetAnimals(FEventType);
end;

procedure TfmAWEventsByGroup.btnNotApplicableClick(
  Sender: TObject);
const
   ConfirmMsg = 'Create "%s Not Applicable" event(s) for selected animal(s), are you sure?';
var
   DisbuddingNAEvent : TDisbuddingNAEvent;
   CastrationNAEvent : TCastrationNAEvent;
   TotalCreated : Integer;
begin
   if ( not(FEventType in [TDisbudding,TCastrate]) ) then Exit;

   DisbuddingNAEvent := nil;
   CastrationNAEvent := nil;

   TotalCreated := 0;
   try
      if ( FEventType = TDisbudding ) then
         begin
            if ( MessageDlg(Format(ConfirmMsg,['Disbudding']),mtConfirmation,[mbYes,mbNo],0) = idNo ) then Exit;
               DisbuddingNAEvent := TDisbuddingNAEvent.Create('tmpdisna');
         end
      else if ( FEventType = TCastrate ) then
         begin
            if ( MessageDlg(Format(ConfirmMsg,['Castration']),mtConfirmation,[mbYes,mbNo],0) = idNo ) then Exit;
               CastrationNAEvent := TCastrationNAEvent.Create('tmpcastna');
         end;

      with EventDataTable do
          begin
             if ( not(Active) ) then Exit;

             DisableControls;
             EventGridLevel.GridView.DataController.BeginFullUpdate;
             try
                First;
                while not eof do
                   begin
                      if FieldByName('Selected').AsBoolean then
                         begin
                            if (FEventType = TDisbudding) then
                               begin
                                  with DisbuddingNAEvent do
                                     try
                                        TSubEventTable := nil;
                                        Append;
                                        EventType := TDisbuddingNA;
                                        AnimalID := EventDataTableID.AsInteger;
                                        AnimalLactNo := EventDataTableLactNo.AsInteger;;
                                        EventDate := deEventDate.Date;
                                        EventComment := 'Disbudding N/A';
                                        AnimalHerdID := EventDataTableHerdID.AsInteger;
                                        EventSource := sINTERNAL;
                                        Post;
                                        Inc(TotalCreated);
                                     finally
                                     end;
                               end
                            else if (FEventType = TCastrate) then
                               begin
                                  with CastrationNAEvent do
                                     try
                                        TSubEventTable := nil;
                                        Append;
                                        EventType := TCastrationNA;
                                        AnimalID := EventDataTableID.AsInteger;
                                        AnimalLactNo := EventDataTableLactNo.AsInteger;;
                                        EventDate := deEventDate.Date;
                                        EventComment := 'Castration N/A';
                                        AnimalHerdID := EventDataTableHerdID.AsInteger;
                                        EventSource := sINTERNAL;
                                        Post;
                                        Inc(TotalCreated);
                                     finally
                                     end;
                               end;
                         end;
                      Next;
                   end;
             finally
                EventGridLevel.GridView.DataController.EndFullUpdate;
                EnableControls;
                MessageDlg(Format('"%d" event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
             end;
          end;
   finally
      if (FEventType = TDisbudding) then
         begin
            if DisbuddingNAEvent <> nil then
               begin
                  FreeAndNil(DisbuddingNAEvent);
                  GetAnimals(FEventType); // only reload animals when events have been created.
               end;
         end
      else if (FEventType = TCastrate) then
         begin
            if CastrationNAEvent <> nil then
               begin
                  FreeAndNil(CastrationNAEvent);
                  GetAnimals(FEventType); // only reload animals when events have been created.
               end;
         end;
   end;
end;

procedure TfmAWEventsByGroup.btnGrpWelfHelpClick(
  Sender: TObject);
begin
   WinData.HTMLHelp('groupwelfare.htm');
end;

procedure TfmAWEventsByGroup.blbReviewWelfareEventsClick(Sender: TObject);
begin
   TfmAWReviewEvents.Show(FHerdID);
end;

procedure TfmAWEventsByGroup.EventGridDBTableViewInitEdit(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
begin
end;

//   30/05/12 [V5.0 R6.0] /MK Bug Fix - New Procedure To Update Fields In TempAnimal Table On CloseUp.
procedure TfmAWEventsByGroup.UpdateEventCombo(AComboType: TcxLookupComboBox);
var
   vCalfDocility,
   vCalfQuality,
   vCalfVitality,
   vCalfSize,
   vCalfScour,
   vCalfPneumonia,
   vCowMilkAbility,
   vCowDocility,
   vStockBullFunctionality,
   vStockBullDocility,
   vVetID : Integer;
begin
   if ( AComboType.Name = 'cmboVeterinarian' ) then
      begin
         with cmboVeterinarian do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vVetID := EditValue;
                     if ( vVetID > 0 ) then
                        begin
                           UpdateRecord( 'Veterinarian', vVetID);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfVitality' ) then
      begin
         with cmboCalfVitality do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfVitality := EditValue;
                     if ( vCalfVitality > 0 ) then
                        begin
                           UpdateRecord( 'CalfVitality', vCalfVitality);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfSize' ) then
      begin
         with cmboCalfSize do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfSize := EditValue;
                     if ( vCalfSize > 0 ) then
                        begin
                           UpdateRecord( 'CalfSize', vCalfSize);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfDocility' ) then
      begin
         with cmboCalfDocility do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfDocility := EditValue;
                     if ( vCalfDocility > 0 ) then
                        begin
                           UpdateRecord( 'CalfDocility', vCalfDocility);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfQuality' ) then
      begin
         with cmboCalfQuality do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfQuality := EditValue;
                     if ( vCalfQuality > 0 ) then
                        begin
                           UpdateRecord( 'CalfQuality', vCalfQuality);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfSize' ) then
      begin
         with cmboCalfSize do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfSize := EditValue;
                     if ( vCalfSize > 0 ) then
                        begin
                           UpdateRecord( 'CalfSize', vCalfSize);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfScour' ) then
      begin
         with cmboCalfScour do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfScour := EditValue;
                     if ( vCalfScour > 0 ) then
                        begin
                           UpdateRecord( 'CalfScour', vCalfScour);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCalfPneumonia' ) then
      begin
         with cmboCalfPneumonia do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCalfPneumonia := EditValue;
                     if ( vCalfPneumonia > 0 ) then
                        begin
                           UpdateRecord( 'CalfPneumonia', vCalfPneumonia);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCowMilkAbility' ) then
      begin
         with cmboCowMilkAbility do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCowMilkAbility := EditValue;
                     if ( vCowMilkAbility > 0 ) then
                        begin
                           UpdateRecord( 'ICBFDamMilkAbility', vCowMilkAbility);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboCowDocility' ) then
      begin
         with cmboCowDocility do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vCowDocility := EditValue;
                     if ( vCowDocility > 0 ) then
                        begin
                           UpdateRecord( 'ICBFDamDocility', vCowDocility);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboBullFunctionality' ) then
      begin
         with cmboBullFunctionality do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vStockBullFunctionality := EditValue;
                     if ( vStockBullFunctionality > 0 ) then
                        begin
                           UpdateRecord( 'ICBFSBFunctionality', vStockBullFunctionality);
                        end;
                  end;
            end;
      end
   else if ( AComboType.Name = 'cmboBullDocility' ) then
      begin
         with cmboBullDocility do
            begin
               if not VarIsNull(EditValue) then
                  begin
                     vStockBullDocility := EditValue;
                     if ( vStockBullDocility > 0 ) then
                        begin
                           UpdateRecord( 'ICBFSBDocility', vStockBullDocility);
                        end;
                  end;
            end;
      end;
end;

procedure TfmAWEventsByGroup.deEventDatePropertiesCloseUp(Sender: TObject);
begin
   UpdateRecord( 'EventDate', (Sender as TcxDateEdit).EditValue);
end;

procedure TfmAWEventsByGroup.FilterList1PropertiesInitPopup(Sender: TObject);
begin
   HerdLookup.FilterICBFScoreList(1, Sender);
end;

procedure TfmAWEventsByGroup.FilterList2PropertiesInitPopup(Sender: TObject);
begin
   HerdLookup.FilterICBFScoreList(2, Sender);
end;

procedure TfmAWEventsByGroup.EventComboExitOrCloseUp(Sender: TObject);
begin
   if ( Sender is TcxLookupComboBox ) then
      UpdateEventCombo(Sender as TcxLookupComboBox);
end;

procedure TfmAWEventsByGroup.DBTableViewComboCloseUp(Sender: TObject);
begin
   if ( Sender is TcxLookupComboBox ) then
      UpdateEventCombo(Sender as TcxLookupComboBox);
end;

procedure TfmAWEventsByGroup.CreateICBFCalfSurveyEvents;
var
   ICBFCalfSurveyEvent : TICBFCalfSurveyEventRec;
   TotalCreated,
   iIncompleteCalfSurveyEventID : Integer;
   qUpdateCalfSurveyEvent : TQuery;
begin
   TotalCreated := 0;
   Screen.Cursor := crHourGlass;
   try
      ValidateICBFCalfSurveyEvents;
      with EventDataTable do
          begin
             if ( not(Active) ) then Exit;
             DisableControls;
             EventGridLevel.GridView.DataController.BeginFullUpdate;
             ICBFCalfSurveyEvent := TICBFCalfSurveyEventRec.Create('ICBFCALF');
             try
                if ( EventDataTable.RecordCount > 0 ) then
                   begin
                      qUpdateCalfSurveyEvent := TQuery.Create(nil);
                      qUpdateCalfSurveyEvent.DatabaseName := AliasName;
                      First;
                      while ( not(Eof) ) do
                         begin
                            if FieldByName('Selected').AsBoolean then
                               begin
                                  ICBFCalfSurveyEvent.Append;
                                  try
                                     ICBFCalfSurveyEvent.AnimalID     := FieldByName('ID').AsInteger;
                                     ICBFCalfSurveyEvent.AnimalLactNo := FieldByName('LactNo').AsInteger;
                                     ICBFCalfSurveyEvent.AnimalHerdID := FieldByName('HerdID').AsInteger;
                                     ICBFCalfSurveyEvent.EventDate    := FieldByName('EventDate').AsDateTime;
                                     ICBFCalfSurveyEvent.EventType    := TICBFCalfSurveyEvent;
                                     ICBFCalfSurveyEvent.EventComment := FieldByName('EventDesc').AsString;
                                     ICBFCalfSurveyEvent.Docility     := FieldByName('CalfDocility').AsInteger;
                                     ICBFCalfSurveyEvent.Quality      := FieldByName('CalfQuality').AsInteger;
                                     ICBFCalfSurveyEvent.Vitality     := FieldByName('CalfVitality').AsInteger;
                                     ICBFCalfSurveyEvent.Size         := FieldByName('CalfSize').AsInteger;
                                     ICBFCalfSurveyEvent.Scour        := FieldByName('CalfScour').AsInteger;
                                     ICBFCalfSurveyEvent.Pneumonia    := FieldByName('CalfPneumonia').AsInteger;
                                     ICBFCalfSurveyEvent.Post;
                                     Inc(TotalCreated);
                                  except
                                     ICBFCalfSurveyEvent.Cancel;
                                     MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+
                                                        'Failed to create Calf Survey event.',mtError,[mbOk],0);
                                  end;
                               end;
                            Next;
                         end;
                      qUpdateCalfSurveyEvent.Close;
                      FreeAndNil(qUpdateCalfSurveyEvent);
                   end;
             finally
                EventGridLevel.GridView.DataController.EndFullUpdate;
                EnableControls;
                FreeAndNil(ICBFCalfSurveyEvent);
                MessageDlg(Format('"%d" Calf Survey event(s) created',[TotalCreated]),mtInformation,[mbOK],0);
             end;
          end;
   finally
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmAWEventsByGroup.ValidateICBFCalfSurveyEvents;
var
   CastrationDate, MealFeedingDate : TDateTime;
   MinAge : TDateTime;
   RecordEvents : Boolean;
   ErrorMsg : string;
   dDateOfBirth,
   dEventDate : TDateTime;
begin
   RecordEvents := False;
   ErrorMsg := '';

   deEventDate.PostEditValue;

   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;
          if ( State = dsEdit ) then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                          // Calf must be at least 20 weeks (5 months) old at the time of Calf Survey Date.
                          //MinAge := FieldByName('DateOfBirth').AsDateTime + ( 20 {weeks} * 7 { days } ) ;
                          //   30/10/14 [V5.3 R8.8] /MK Bug Fix - Calf must be 5 months old (ICBF rule) not 20 weeks.

                          //   28/06/17 [V5.6 R8.9] /MK Change - No need to check for 5 months here because grid now shows all calves regardless of age but
                          //                                     stops the user from entering the Docility, Quality, Scour and Pneumonia for calves that are less than 5 months old.
                          {
                          MinAge := IncMonth(FieldByName('DateOfBirth').AsDateTime,5);
                          if EventDataTable.FieldByName('EventDate').AsDateTime < MinAge then
                             begin
                                //   30/10/14 [V5.3 R8.8] /MK Change - Changed warning to that of ICBF spec sheet "5 months old or older" instead of "at least 5 months old".
                                MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Animal must be 5 months of age or older before calf survey.',mtWarning,[mbOK],0);
                                SysUtils.Abort;
                             end;

                          //   28/06/17 [V5.6 R8.9] /MK Change - Remove calves that already have a complete calf survey event i.e. all parameters are added.
                          if WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CICBFCalfSurveyEvent) > 0 then
                             begin
                                MessageDlg('A Calf Survey event has already been recorded for this animal.',mtInformation,[mbOK],0);
                                SysUtils.Abort;
                             end;
                         }

                         dDateOfBirth := FieldByName('DateOfBirth').AsDateTime;
                         dEventDate := FieldByName('EventDate').AsDateTime;

                         if ( dEventDate > Date ) then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               SysUtils.Abort;
                            end;

                         if ( dEventDate < dDateOfBirth ) then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;

                          if ( FieldByName('CalfVitality').AsInteger <= 0 ) then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Calf Vitality has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if ( FieldByName('CalfSize').AsInteger <= 0 ) then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Calf Size has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if ( FieldByName('CalfDocility').AsInteger <= 0 ) and ( AnimalIsAtMinAge(dDateOfBirth,dEventDate,5) ) then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Docility has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if ( FieldByName('CalfQuality').AsInteger <= 0 ) and ( AnimalIsAtMinAge(dDateOfBirth,dEventDate,5) ) then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Calf Quality has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if ( FieldByName('CalfScour').AsInteger <= 0 ) and ( AnimalIsAtMinAge(dDateOfBirth,dEventDate,5) ) then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Calf Scour has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if ( FieldByName('CalfPneumonia').AsInteger <= 0 ) and ( AnimalIsAtMinAge(dDateOfBirth,dEventDate,5) ) then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Calf Pneumonia has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;
                      end;
                   Next;
                end;
                RecordEvents := True;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             if ( not(RecordEvents) ) then
                Abort;
          end;
       end;
end;

procedure TfmAWEventsByGroup.FilterOutAnimals(AEventType: TEventType);
var
   MinAge : Double;
   LastCalvingDate : TDateTime;
   TempQuery : TQuery;
   i,
   iLastCalfSurveyEvent : Integer;
begin
   if ( AEventType = TICBFCalfSurveyEvent ) then
      begin
         //   20/09/13 [V5.2 R1.5] /MK Additional Feature - Only show animals that are greater than 5 months old.
         {
         with EventDataTable do
            begin
               EventDataTable.First;
               while ( not(EventDataTable.Eof) ) do
                  begin
                     // Calf must be at least 20 weeks (5 months) old at the time of Calf Survey Date.
                     //MinAge := FieldByName('EventDate').AsDateTime - ( 20 (weeks) * 7 (days) ) ;
                     //   30/10/14 [V5.3 R8.8] /MK Bug Fix - Calf must be at least 5 months, ignore 20 weeks (ICBF notes say 5 months) old at the time of Calf Survey Date.
                     MinAge := IncMonth(FieldByName('EventDate').AsDateTime,-5);
                     if ( EventDataTable.FieldByName('DateOfBirth').AsDateTime > MinAge ) then
                        EventDataTable.Delete
                     else
                        EventDataTable.Next;
                  end;
            end;
         }
         TempQuery := TQuery.Create(nil);
         with TempQuery do
            begin
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE InHerd = True');
               SQL.Add('AND Breeding = True');
               SQL.Add('AND Upper(Sex) = "BULL"');
               SQL.Add('AND HerdID = '+IntToStr(FHerdID)+'');
               Open;
            end;

         EventDataTable.First;
         while ( not(EventDataTable.Eof) ) do
            begin
               // Remove stock bulls from list of Calf Survey.
               if ( TempQuery.Locate('ID',EventDataTable.FieldByName('ID').AsInteger,[]) ) then
                  EventDataTable.Delete
               else
                  EventDataTable.Next;
            end;

         TempQuery.Close;
         TempQuery.SQL.Clear;
         TempQuery.SQL.Add('SELECT ID, AnimalID');
         TempQuery.SQL.Add('FROM Events E');
         TempQuery.SQL.Add('LEFT JOIN '+EventDataTable.TableName+' TT ON (TT.ID = E.AnimalID)');
         TempQuery.SQL.Add('WHERE (E.EventType = '+IntToStr(CICBFCalfSurveyEvent)+')');
         TempQuery.SQL.Add('AND   (E.AnimalLactNo = TT.LactNo)');
         TempQuery.Open;
         while ( not(TempQuery.Eof) ) do
            begin
               if ( EventDataTable.Locate('ID',TempQuery.FieldByName('AnimalID').AsInteger,[]) ) then
                  if ( WinData.IsIncompleteCalfSurveyEvent(TempQuery.FieldByName('ID').AsInteger) ) then
                     begin
                        EventDataTable.Edit;
                        EventDataTable.FieldByName('ExistingEventID').AsInteger := TempQuery.FieldByName('ID').AsInteger;
                        EventDataTable.Post;
                     end;
               TempQuery.Next;
            end;

         TempQuery.Close;
         FreeAndNil(TempQuery);
      end
   else if ( AEventType = TICBFDamEvent ) then
      begin
         //   07/01/14 [V5.2 R7.5] /MK Bug Fix - New way to get the dams of this year and last year if calved on/after 01/01/2013.
         TempQuery := TQuery.Create(nil);
         TempQuery.DatabaseName := AliasName;
         TempQuery.SQL.Clear;
         TempQuery.SQL.Add('SELECT *');
         TempQuery.SQL.Add('FROM Animals');
         TempQuery.SQL.Add('WHERE ID In (SELECT ID FROM '+EventDataTable.TableName+')');
         try
            TempQuery.Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         TempQuery.First;
         while ( not(TempQuery.Eof) ) do
            begin
               if ( TempQuery.FieldByName('LactNo').AsInteger > 0 ) and ( EventDataTable.Locate('ID',TempQuery.FieldByName('ID').AsInteger,[]) ) then
                  begin
                     LastCalvingDate := WinData.EventDataHelper.GetLastEventDate(TempQuery.FieldByName('ID').AsInteger, TempQuery.FieldByName('LactNo').AsInteger, CCalvingEvent);
                     try
                        EventDataTable.Edit;
                        EventDataTable.FieldByName('LastCalvingDate').AsDateTime := LastCalvingDate;
                        EventDataTable.Post;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end;
               TempQuery.Next;
            end;

         EventDataTable.Close;
         EventDataTable.Open;

         TempQuery.SQL.Clear;
         TempQuery.SQL.Add('DELETE FROM '+EventDataTable.TableName+'');
         TempQuery.SQL.Add('WHERE (LastCalvingDate < "01/01/'+IntToStr(ExtractYear(Now)-1)+'")');
         try
           TempQuery.ExecSQL;
         except
           on e : Exception do
              ShowMessage(e.Message);
         end;
         TempQuery.Close;
         FreeAndNil(TempQuery);
      end;
end;

procedure TfmAWEventsByGroup.ValidateICBFDamSurveyEvents;
var
   RecordEvents : Boolean;
   ErrorMsg : string;
begin
   RecordEvents := False;
   ErrorMsg := '';

   deEventDate.PostEditValue;

   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;
          if ( State = dsEdit ) then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         if FieldByName('EventDate').AsDateTime > Date then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime < FieldByName('DateOfBirth').AsDateTime then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;

                          if FieldByName('ICBFDamMilkAbility').AsInteger <= 0 then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Milk Ability has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if FieldByName('ICBFDamDocility').AsInteger <= 0 then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Docility has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;
                      end;
                   Next;
                end;
                RecordEvents := True;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             if ( not(RecordEvents) ) then
                Abort;
          end;
       end;
end;

procedure TfmAWEventsByGroup.ValidateICBFStockBullSurveyEvents;
var
   RecordEvents : Boolean;
   ErrorMsg : string;
begin
   RecordEvents := False;
   ErrorMsg := '';

   deEventDate.PostEditValue;

   with EventDataTable do
       begin
          if ( not(Active) ) then Exit;
          if ( State = dsEdit ) then Post;

          DisableControls;
          EventGridLevel.GridView.DataController.BeginFullUpdate;
          try
             First;
             while not eof do
                begin
                   if FieldByName('Selected').AsBoolean then
                      begin
                         if FieldByName('EventDate').AsDateTime > Date then
                            begin
                               MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Event Date cannot be after today.',mtError,[mbOK],0);
                               Abort;
                            end;

                         if FieldByName('EventDate').AsDateTime < FieldByName('DateOfBirth').AsDateTime then
                            begin
                               MessageDlg(Format('Animal Tag: "%s"'+#13#10+#13#10+'Event date must be on or after Animal Date of Birth',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                               Abort;
                            end;

                          if FieldByName('ICBFSBFunctionality').AsInteger <= 0 then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Functionality has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;

                          if FieldByName('ICBFSBDocility').AsInteger <= 0 then
                             begin
                                if MessageDlg( Format('Animal Tag: "%s"',[FieldByName('NatIDNum').AsString])+#13#10+#13#10+'Docility has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                   SysUtils.Abort;
                             end;
                      end;
                   Next;
                end;
                RecordEvents := True;
          finally
             EventGridLevel.GridView.DataController.EndFullUpdate;
             EnableControls;
             if ( not(RecordEvents) ) then
                Abort;
          end;
       end;
end;

procedure TfmAWEventsByGroup.EventGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   vDateOfBirth,
   vEventDate,
   vExistingCalfSurveyID : Variant;
begin
   if ( not(EventPageControl.ActivePage = tsCalfSurveyEvent) ) then Exit;
   with EventGridDBTableView.DataController do
      begin
         vDateOfBirth := Values[FocusedRecordIndex, GetItemByFieldName('DateOfBirth').Index];
         vEventDate := Values[FocusedRecordIndex, GetItemByFieldName('EventDate').Index];
         vExistingCalfSurveyID := Values[FocusedRecordIndex, GetItemByFieldName('ExistingEventID').Index];
         if ( vDateOfBirth <> Null ) and ( vEventDate <> Null ) then
            begin
               EventGridDBTableViewCalfSize.Options.Editing := ( vExistingCalfSurveyID = Null );
               EventGridDBTableViewCalfVitality.Options.Editing  := ( vExistingCalfSurveyID = Null );
               EventGridDBTableViewCalfDocility.Options.Editing := AnimalIsAtMinAge(vDateOfBirth,vEventDate,5);
               EventGridDBTableViewCalfQuality.Options.Editing := AnimalIsAtMinAge(vDateOfBirth,vEventDate,5);
               EventGridDBTableViewCalfScour.Options.Editing := AnimalIsAtMinAge(vDateOfBirth,vEventDate,5);
               EventGridDBTableViewCalfPneumonia.Options.Editing := AnimalIsAtMinAge(vDateOfBirth,vEventDate,5);
            end;
      end;
end;

function TfmAWEventsByGroup.AnimalIsAtMinAge ( ADateOfBirth, AEventDate : TDateTime; AMinAgeInc : Integer ) : Boolean;
var
   MinAge : TDateTime;
begin
   Result := False;
   if ( ADateOfBirth = 0 ) or ( AEventDate = 0 ) then Exit;
   MinAge := IncMonth(ADateOfBirth,AMinAgeInc);
   Result := ( AEventDate > MinAge );
end;

end.
