{
  Important: Do not change the name of this form, it is used to identify if phonelink
             events are begin edited.

  WinData - property ActivePDAEvents : Boolean read GetActivePDAEvents;

  22/04/09 [Rel V3.9 R7.0] /SP Program Change - only show event tabs for record events, hide non relevant tabs.
  22/04/09 [Rel V3.9 R7.0] /SP Additional Events - Animal Welfare Disbudding, Castration, Meal Feeding and Weaning.

  10/02/12 [V5.0 R3.7] /MK Additional Feature - ReviewEvent - Health/DryOff 0 Update BatchNo From WinData.HealthDrugBatchNo.

  06/03/15 [V5.4 R1.8] /MK Bug Fix - Changed code to check to see if Purchase event exists.

  10/03/15 [V5.4 R3.2] /MK Change - ReviewEvent - if EventType = cCalvingEvent and ParlourLinkEvent then only pass in the EventDate into WinData.CalvingRecords.
                                  - EventTabsChange - CalvingEvent - Sort by EventDate.

  06/03/17 [V5.6 R6.5] /MK Additional Feature - ReviewEvent - If editing a PDA/Parlour calving and country is Ireland or NIreland then show new calving screen - requested by Johnny O'Hanlon.
}

unit uPhoneLinkEventsReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, Tabnotbk, ExtCtrls, ActiveX, ComObj,
  RXCtrls, TB97, TB97Tlbr, Menus, StdCtrls, Parser, OleServer,
  db, dbTables, DBGrids, RXDBCtrl, DBGridEh, IniFiles, uCreateEvents,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, GenTypesConst, uCalvingEvent;

type
  TPhoneLinkEventsReview = class(TForm)
    dsTempEvents: TDataSource;
    TempEvents: TTable;
    EventTabs: TPageControl;
    tsHeatBulling: TTabSheet;
    dbgBullings: TDBGridEh;
    tsService: TTabSheet;
    dbgServices: TDBGridEh;
    tsPD: TTabSheet;
    dbgPregDiag: TDBGridEh;
    tsDryOff: TTabSheet;
    dbgDryOff: TDBGridEh;
    tsHealth: TTabSheet;
    dbgHealth: TDBGridEh;
    tsCalvings: TTabSheet;
    dbgCalvings: TDBGridEh;
    TabSheet5: TTabSheet;
    mErrors: TMemo;
    StatusBar: TStatusBar;
    PopupMenu1: TPopupMenu;
    DefaultTab1: TMenuItem;
    N1: TMenuItem;
    EditEventsConsectitively1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Removeuncompletedcalviing1: TMenuItem;
    BatchMove1: TBatchMove;
    Removeeventoncompletion1: TMenuItem;
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    sbExit: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    sbOptions: TRxSpeedButton;
    sbEvent: TRxSpeedButton;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    sbPreview: TRxSpeedButton;
    ToolbarSep974: TToolbarSep97;
    GenQuery: TQuery;
    tsSalesDeaths: TTabSheet;
    dbgSaleDeath: TDBGridEh;
    tsWeighings: TTabSheet;
    dbgWeighing: TDBGridEh;
    qMultipleCalves: TQuery;
    qDeleteCalvings: TQuery;
    tsGroup: TTabSheet;
    DBGridEh1: TDBGridEh;
    QueryCalvingDates: TQuery;
    tsPurchases: TTabSheet;
    dbgPurchases: TDBGridEh;
    TabSheet12: TTabSheet;
    DBGridEh3: TDBGridEh;
    PDAPurchases: TTable;
    dsPDAPurchases: TDataSource;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu4: TPopupMenu;
    DeleteSaleDeathEvent1: TMenuItem;
    tsConditionScore: TTabSheet;
    dbgConditionScore: TDBGridEh;
    sbDelete: TRxSpeedButton;
    tsDelete: TToolbarSep97;
    tsDisbudding: TTabSheet;
    tsCastration: TTabSheet;
    tsMealFeeding: TTabSheet;
    tsWeaning: TTabSheet;
    EventsGridDBTableView: TcxGridDBTableView;
    EventsGridLevel: TcxGridLevel;
    EventsGrid: TcxGrid;
    EventsGridDBTableViewAnimalNo: TcxGridDBColumn;
    EventsGridDBTableViewNatIDNum: TcxGridDBColumn;
    EventsGridDBTableViewLactNo: TcxGridDBColumn;
    EventsGridDBTableViewEventDate: TcxGridDBColumn;
    EventsGridDBTableViewComment: TcxGridDBColumn;
    EventsGridDBTableViewDBVet: TcxGridDBColumn;
    EventsGridDBTableViewWNCalfDocility: TcxGridDBColumn;
    EventsGridDBTableViewWNCalfQuality: TcxGridDBColumn;
    EventsGridDBTableViewWNWeight: TcxGridDBColumn;
    EventsGridDBTableViewWNWeighingOnDate: TcxGridDBColumn;
    procedure EventTabsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgBullingsDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure EditEventsConsectitively1Click(Sender: TObject);
    procedure sbEventClick(Sender: TObject);
    procedure Removeuncompletedcalviing1Click(Sender: TObject);
    procedure Removeeventoncompletion1Click(Sender: TObject);
    procedure sbPreviewClick(Sender: TObject);
    procedure dbgPurchasesDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DeleteSaleDeathEvent1Click(Sender: TObject);
    procedure dbgPregDiagTitleClick(Column: TColumnEh);
    procedure sbDeleteClick(Sender: TObject);
    procedure EventsGridDBTableViewDblClick(Sender: TObject);
  private
    { Private declarations }
    IniFile : TIniFile;
    FslNotFound,
    FslEventList : TStringList;
    FLinkType: TEventFileSource;
    DataFolderName : String;
    procedure CreateTable(DataSet : TDBDataset);
    procedure ReviewEvent(EventType : Integer);
    procedure MenuClick(Sender : TObject);
    procedure SetupMenu;
    function CheckCalvings : Boolean; // returns true if calvings exist
    function CheckMovements : Boolean; // returns true if movements exist
    procedure DeleteEvent(grid : TDBGridEh);
    procedure DeleteCalving;
    procedure DeleteCalvings(const Dam : Integer);
    function EventDeleted : Boolean;
    function CheckMultipleCalves(dam : Integer) : integer;
    function CheckValidHerdIdMask : Boolean;
    procedure SortEventTable(IndexName : String);

    procedure ShowEventGridItems(AEventType : Integer);
    procedure ShowEventTabs;
  public
    { Public declarations }
  end;

  procedure ShowTheForm(var DataSet : TDBDataSet; slNotFound, slEventList : TStringList;
     ALinkType : TEventFileSource);

const
   cPDAEventFilter = 'EventType = %d';
var
  PhoneLinkEventsReview  : TPhoneLinkEventsReview;

implementation
uses
  DairyData,
  Bullings,
  Services,
  PregDiag,
  UHealth,
  uCalvings,
  KRoutines,
  uPhoneLinkEventsRpt,
  Weighing,
  uSalesDeaths,
  uDefaults,
  uPDAAnimalPurch,
  uMPEvents,
  KDBRoutines, SQLHelper, Math, uHerdLookup, uPreferences;
{$R *.DFM}

  procedure ShowTheForm(var DataSet : TDBDataSet; slNotFound, slEventList : TStringList;
     ALinkType : TEventFileSource);
  begin
     Application.CreateForm(TPhoneLinkEventsReview, PhoneLinkEventsReview);
     with PhoneLinkEventsReview do
        try
           FLinkType := ALinkType;
           FslNotFound := slNotFound;
           FslEventList := slEventList;
           Caption := 'Kingswood Herd';
           if FLinkType in [ esPDA, esNokiaLink, esSiemensLink,esParlourLink ] then
              Caption := Caption + ' - '+ iEventDesc[FLinkType];
           CreateTable(Dataset);
           mErrors.Lines.Assign(slNotFound);
           if FLinkType = esPDA then PDAPurchases.Active := True;
           ShowEventTabs;
           ShowModal;
        finally
           if Screen.ActiveForm <> nil then
              Screen.ActiveForm.Update;
           PDAPurchases.Active := False;
           with TempEvents do
              begin
                 // do not delete the data from tempevents, it is needed
                 // to retain any events [5,11,12] that have not been saved..
                 // eg user accidentally exits from review screen.
                 Close;

              end;
           FreeAndNil(PhoneLinkEventsReview);
        end;
  end;

{ TPhoneLinkEventsReview }
procedure TPhoneLinkEventsReview.EventTabsChange(Sender: TObject);
var
   Column: TColumnEh;
begin
   TempEvents.Filter := '';
   TempEvents.Filtered := False;
   StatusBar.Panels[1].Text := 'Double click grid to edit event';
   if EventTabs.ActivePageIndex in [0..4] then
      begin
         sbEvent.Caption := 'Edit';
         sbEvent.Show;
         ToolbarSep972.Show;
         ToolbarSep974.Show;
      end
   else if EventTabs.ActivePageIndex = 5 then
      begin
         sbEvent.Caption := 'Create';
         sbEvent.Show;
         ToolbarSep972.Show;
         ToolbarSep974.Show;
      end
   else
      begin
         sbEvent.Hide;
         ToolbarSep972.Hide;
         ToolbarSep974.Hide;
      end;

   case EventTabs.ActivePageIndex of
      0 : begin
             TempEvents.Filter := 'EventType = 1';
             TempEvents.Filtered := True;
          end;
      1 : begin
             TempEvents.Filter := 'EventType = 2';
             TempEvents.Filtered := True;
          end;
      2 : begin
             TempEvents.Filter := 'EventType = 3';
             TempEvents.Filtered := True;
          end;
      3 : begin
             TempEvents.Filter := 'EventType = 4';
             TempEvents.Filtered := True;
          end;
      4 : begin
             TempEvents.Filter := 'EventType = 6';
             TempEvents.Filtered := True;
          end;
      5 : begin
             StatusBar.Panels[1].Text := 'Double click grid to create calving event';
             TempEvents.Filter := 'EventType = 5';
             TempEvents.Filtered := True;
             //   10/03/15 [V5.4 R3.2] /MK Change - Sort by EventDate.
             Column := TColumnEh.Create(nil);
             Column := dbgCalvings.FieldColumns['EventDate'];
             dbgPregDiagTitleClick(Column);
             dbgCalvings.SelectedIndex := 0;
          end;
      6 : begin
             StatusBar.Panels[1].Text := 'Double click grid to create Sale/Death event';
             TempEvents.Filter := 'EventType = 11';
             TempEvents.Filtered := True;
          end;
      7 : begin
             TempEvents.Filter := 'EventType = 7';
             TempEvents.Filtered := True;
          end;
      8 : begin
             TempEvents.Filter := 'EventType = 29';
             TempEvents.Filtered := True;
          end;
      10 : begin
             TempEvents.Filter := 'EventType = 12';
             TempEvents.Filtered := True;
          end;
      11 : begin
             TempEvents.Filter := 'EventType = 20';
             TempEvents.Filtered := True;
          end;
      12 : begin
             TempEvents.Filter := Format(cPDAEventFilter,[CDisbuddingEvent]);;
             TempEvents.Filtered := True;
             ShowEventGridItems(CDisbuddingEvent);
          end;
      13 : begin
             TempEvents.Filter := Format(cPDAEventFilter,[CCastrateEvent]);;
             TempEvents.Filtered := True;
             ShowEventGridItems(CCastrateEvent);
          end;
      14 : begin
             TempEvents.Filter := Format(cPDAEventFilter,[CMealFeedingEvent]);;
             TempEvents.Filtered := True;
             ShowEventGridItems(CMealFeedingEvent);
          end;
      15 : begin
             TempEvents.Filter := Format(cPDAEventFilter,[CWeaningEvent]);;
             TempEvents.Filtered := True;
             ShowEventGridItems(CWeaningEvent);
          end;
      16 : StatusBar.Panels[1].Text := '';
   end;

   if EventTabs.ActivePageIndex <> 16 then
      StatusBar.Panels[0].Text := EventTabs.Pages[EventTabs.ActivePageIndex].Caption + ' Record Count:'+IntToStr(TempEvents.RecordCount)
   else
      StatusBar.Panels[0].Text := '';
   sbDelete.Visible := ( EventTabs.ActivePage = tsPurchases ) or ( EventTabs.ActivePage = tsSalesDeaths ) or ( EventTabs.ActivePage = tsCalvings );
   tsDelete.Visible := sbDelete.Visible;
end;

procedure TPhoneLinkEventsReview.CreateTable(DataSet : TDBDataset);
var
   i : Integer;
begin
   try
      TempEvents.FieldDefs.Assign(TDBDataset(DataSet).FieldDefs);
      if TempEvents.Exists then
         TempEvents.DeleteTable;// possible crash!
      TempEvents.IndexDefs.Clear;
      TempEvents.IndexDefs.Add('iID','ID',[ixPrimary]);
      TempEvents.IndexDefs.Add('iSortAnimalNo','SortAnimalNo',[ixCaseInsensitive]);
      TempEvents.IndexDefs.Add('idSortAnimalNo','SortAnimalNo',[ixCaseInsensitive,ixDescending]);
      TempEvents.IndexDefs.Add('iSortNatID','SortNatID',[ixCaseInsensitive]);
      TempEvents.IndexDefs.Add('idSortNatID','SortNatID',[ixCaseInsensitive,ixDescending]);
      TempEvents.IndexDefs.Add('iEventDate','EventDate',[ixCaseInsensitive]);
      TempEvents.IndexDefs.Add('idEventDate','EventDate',[ixCaseInsensitive,ixDescending]);
      TempEvents.IndexDefs.Add('iLactNo','LactNo',[ixCaseInsensitive]);
      TempEvents.IndexDefs.Add('idLactNo','LactNo',[ixCaseInsensitive,ixDescending]);
      TempEvents.CreateTable;

      try
         TempEvents.BatchMove(DataSet, batAppend);
      except

      end;

      with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'AnimalID';
             DataSet   := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'EventID';
             DataSet   := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'AnimalNo';
             DataSet   := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'NatIDNum';
             DataSet   := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'LactNo';
             DataSet   := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'EventType';
             DataSet   := TempEvents;
          end;
       with TDateField.Create(TempEvents) do
          begin
             FieldName := 'EventDate';
             DataSet   := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'BullID';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'BullNo';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'Comment';
             DataSet := TempEvents;
          end;
       with TBooleanField.Create(TempEvents) do
          begin
             FieldName := 'Pregnant';
             DataSet := TempEvents;
          end;
       with TBooleanField.Create(TempEvents) do
          begin
             FieldName := 'DryOffEvent';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'DrugUsed';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'HealthCode';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents)  do
          begin
             FieldName := 'Medicine';
             LookUpDataSet := WinData.Medicine;
             LookUpKeyFields := 'ID';
             LookUpResultField := 'Name';
             KeyFields := 'DrugUsed';
             LookUp    := TRUE;
             DataSet   := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'HealthDesc';
             LookUpDataSet := WinData.qHealthCodes;
             LookUpKeyFields := 'ID';
             LookUpResultField := 'Description';
             KeyFields := 'HealthCode';
             LookUp := TRUE;
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'CalfNo';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'CalfSex';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'CalfName';
             DataSet := TempEvents;
             Size := 30;
          end;
       with TBooleanField.Create(TempEvents) do
          begin
             FieldName := 'CalfRecorded';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'DrugPurchID';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'BatchNo';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'CalfBreed';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'CalfColour';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'CalfBreedID';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'CalfColourID';
             DataSet := TempEvents;
          end;
       with TFloatField.Create(TempEvents) do
          begin
             FieldName := 'Weight';
             DataSet := TempEvents;
          end;
       with TFloatField.Create(TempEvents) do
          begin
             FieldName := 'Price';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'Grade';
             DataSet := TempEvents;
             Size := 15;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'MedAdmin';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'ApplicMethod';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents)  do
          begin
             FieldName := 'sMedAdmin';
             LookUpDataSet := WinData.MediAdmin;
             LookUpKeyFields := 'ID';
             LookUpResultField := 'Name';
             KeyFields := 'MedAdmin';
             LookUp    := TRUE;
             DataSet   := TempEvents;
          end;
       with TStringField.Create(TempEvents)  do
          begin
             FieldName := 'sApplicMethod';
             LookUpDataSet := WinData.GenLookUp;
             LookUpKeyFields := 'ID';
             LookUpResultField := 'Description';
             KeyFields := 'ApplicMethod';
             LookUp    := TRUE;
             DataSet   := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'NewGroupID';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'NewGroup';
             DataSet := TempEvents;
             Size := 30;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'NoDays';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'NoTimes';
             DataSet := TempEvents;
          end;
       with TFloatField.Create(TempEvents) do
          begin
             FieldName := 'Quantity';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'DaysInCalf';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'NoOfCalves';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'CustomerID';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'DisposalPlace';
             DataSet := TempEvents;
          end;
       with TBooleanField.Create(TempEvents) do
          begin
             FieldName := 'Sold';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'SireID';
             DataSet := TempEvents;
          end;
       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'BirthType';
             DataSet := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'SupplierID';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents)  do
          begin
             FieldName := 'sSupplierName';
             LookUpDataSet := WinData.Suppliers;
             LookUpKeyFields := 'ID';
             LookUpResultField := 'Name';
             KeyFields := 'SupplierID';
             LookUp    := TRUE;
             DataSet   := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'BuyerID';
             DataSet := TempEvents;
          end;
       with TStringField.Create(TempEvents)  do
          begin
             FieldName := 'sBuyerName';
             LookUpDataSet := WinData.Buyers;
             LookUpKeyFields := 'ID';
             LookUpResultField := 'Name';
             KeyFields := 'BuyerID';
             LookUp    := TRUE;
             DataSet   := TempEvents;
          end;
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'CalfAnimalNo';
             DataSet := TempEvents;
             Size := 10;
          end;

       with TBooleanField.Create(TempEvents) do
          begin
             FieldName := 'CalfBreeding';
             DataSet := TempEvents;
          end;

       with TBooleanField.Create(TempEvents) do
          begin
             FieldName := 'CalfDead';
             DataSet := TempEvents;
          end;


       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'CalfMortality';
             DataSet := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'CauseOfDeath';
             DataSet := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'DisposalPlaceID';
             DataSet := TempEvents;
          end;

       with TFloatField.Create(TempEvents) do
          begin
             FieldName := 'Score';
             DataSet := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'DBVet';
             DataSet := TempEvents;
          end;

       with TFloatField.Create(TempEvents) do
          begin
             FieldName := 'WNWeight';
             DataSet := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'WNDocility';
             DataSet := TempEvents;
          end;

       with TIntegerField.Create(TempEvents) do
          begin
             FieldName := 'WNQuality';
             DataSet := TempEvents;
          end;

       with TDateTimeField.Create(TempEvents) do
          begin
             FieldName := 'WNWeighingOnDate';
             DataSet := TempEvents;
          end;

       //   27/09/12 [V5.0 R8.9] /MK Change - Add ElectronicID from PDAEvents tables.
       with TStringField.Create(TempEvents) do
          begin
             FieldName := 'ElectronicID';
             DataSet := TempEvents;
          end;

      dsTempEvents.DataSet := TempEvents;
      //TempEvents.IndexName := 'idSortAnimalNo';
      TempEvents.Active    := True;
{
      with Dataset do
         begin
            Dataset.Active := True;
            try

               Dataset.First;
               while not Dataset.eof do
                  begin

                     TempEvents.Append;
                     try
                        for i := 0 to DataSet.Fields.Count-1 do
                           begin
                              if TempEvents.Fields.FindField( Dataset.Fields[i].FieldName ) <> nil then
                                 TempEvents.Fields[i].Value := Dataset.Fields[i].Value;
                           end;
                        TempEvents.Post;
                     except
                        TempEvents.Cancel;
                     end;

                     DataSet.Next;
                  end;
            finally
               Dataset.Active := False;
            end;

         end;
}
   except
      on E : Exception do
         raise Exception.Create(E.message+ #13#10+'Cannot create Temporary Table, contact Kingswood');
   end
end;

procedure TPhoneLinkEventsReview.FormCreate(Sender: TObject);
begin
   WinData.Events.Refresh;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit );
   WinData.LoadBtnImage(WinData.Images,sbOptions.Glyph,cBtnImgOptions );
   WinData.LoadBtnImage(WinData.Images,sbEvent.Glyph,cBtnImgEdit);
   WinData.LoadBtnImage(WinData.Images,sbPreview.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbDelete.Glyph,cBtnImgDelete);
   IniFile := TIniFile.Create(IniDir + cPhoneEventsIniFile);
   DataFolderName := DataDir;
   PDAPurchases.Filter := '((Code=''A'') AND (DataDir='''+UPPERCASE(DataFolderName)+'''))';
   PDAPurchases.Filtered := True;
   SetupMenu;
end;

procedure TPhoneLinkEventsReview.dbgBullingsDblClick(Sender: TObject);
begin
   if (Sender is TDBGridEh) then
   if (Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0 then
   sbEventClick(nil);
end;

procedure TPhoneLinkEventsReview.ReviewEvent(EventType: Integer);
var
   CalfNo : string;
   NatIDMask : string;
   i, CalfCount,
   DamID,
   iShowCalfID : Integer;
   bChangedCalving : Boolean;
begin
   if Windata.AnimalFileByID.Locate('ID', TempEvents.FieldByName('AnimalID').AsInteger, [] ) then
      begin
         if ( EventType = cCalvingEvent ) then
            begin
               if not Preferences.ValueAsBoolean[cGSCalving_AutoCompletePDA] then
                  begin
                     DamID := Windata.AnimalFileByIDID.AsInteger;
                     if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
                        if not CheckValidHerdIdMask then
                           begin
                              MessageDlg('You must enter your correct Herd Identifier.',mtInformation,[mbOK],0);
                              WinData.CreateAndShowForm(TfDefaults);
                              Abort;
                           end;

                     QueryCalvingDates.Params[0].AsDateTime := TempEvents.FieldByName('EventDate').AsDateTime;
                     QueryCalvingDates.Open;
                     try
                        if QueryCalvingDates.RecordCount > 0 then
                           begin
                              MessageDlg('You must complete calving records by date order.',mtWarning,[mbOK],0);
                              Exit;
                           end;
                     finally
                        QueryCalvingDates.Close;
                     end;

                     // before we proceed with calving check if Dry Off event is required,
                     // if so invoke dry off event.
                     if ( Windata.AnimalFileByIDLactNo.AsInteger > 0 ) and ( WinData.GlobalSettings.MandatoryDryOffEvent) then
                        begin
                           if WinData.EventDataHelper.GetLastEventDate( Windata.AnimalFileByIDID.AsInteger, Windata.AnimalFileByIDLactNo.AsInteger, cDryOffEvent) <= 0 then
                              begin
                                 MessageDlg('No Dry Off event for this animal can be found.'+ccrlf+
                                            'Calving event cannot be completed until Dry Off event is recorded.'+ccrlf+ccrlf+
                                            'Click OK to proceed with Dry Off event',mtConfirmation,[mbOK],0);
                                 uHealth.ShowHealth( AddDryingOff );
                              end;
                        end;

                     try
                        CalfCount := 0;
                        CalfCount := CheckMultipleCalves(Windata.AnimalFileByIDID.AsInteger);
                        if CalfCount > 1 then
                           try
                              i := 1;
                              qMultipleCalves.First;
                              while not qMultipleCalves.Eof do
                                 begin
                                    New(WinData.CalvingRecords[i]);
                                    FillChar(WinData.CalvingRecords[i]^, SizeOf(TCalvingsRecord), #0);

                                    CalfNo := qMultipleCalves.FieldByName('CalfNo').AsString;
                                    if ( CalfNo <> '' ) then
                                       begin
                                          if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
                                             begin
                                                if ( WhatStyleNatID(CalfNo, False) = StyleUnKnown ) and ( Length(CalfNo) = 5 ) then
                                                   begin
                                                      // OK what seems to be passed through is the Check Digit + Animal No e.g 12345
                                                      // amalgamate the CalfNo onto the existing HerdNumber to create a valid tag.
                                                      // ShowMessage(ExtractNatIDHerdNo(WinData.DefaultNatIDMask) + CalfNo);
                                                      CheckNatID( ExtractNatIDHerdNo(WinData.DefaultNatIDMask) + CalfNo, CalfNo, False );
                                                   end
                                                else
                                                   CheckNatID( qMultipleCalves.FieldByName('CalfNo').AsString, CalfNo, False );
                                             end
                                          else if WinData.DefCountry(Windata.AnimalFileByIDHerdID.AsInteger) = NIreland then
                                             begin
                                                if ( Length(CalfNo) <= 5 ) then
                                                   begin
                                                      WinData.CalvingRecords[i]^.AnimalNo := Copy(CalfNo, 1, Length(CalfNo)-1);
                                                      NatIDMask := ExtractNatIDHerdNo(WinData.DefaultNatIDMask);
                                                      if not WinData.CheckNINatID( Copy( NatIDMask, 1, 3) + ' ' + Copy( NatIDMask, 4, MaxInt) + ' ' + Copy(CalfNo, 1, Length(CalfNo)-1) + ' ' + CalfNo[Length(CalfNo)], CalfNo ) then
                                                         MessageDlg('Invalid National Identity Number',mtError,[mbOK],0)
                                                   end
                                                else
                                                   begin
                                                      if ( IsNINatID(qMultipleCalves.FieldByName('CalfNo').AsString)) then
                                                         if not WinData.CheckNINatID(qMultipleCalves.FieldByName('CalfNo').AsString, CalfNo) then
                                                            MessageDlg('Invalid National Identity Number',mtError,[mbOK],0)
                                                   end;
                                             end;

                                       end;

                                    WinData.CalvingRecords[i]^.CalfNo := CalfNo;
                                    WinData.CalvingRecords[i]^.CalfAnimalNo := qMultipleCalves.FieldByName('CalfAnimalNo').AsString;
                                    WinData.CalvingRecords[i]^.CalfSex := qMultipleCalves.FieldByName('CalfSex').AsString;
                                    WinData.CalvingRecords[i]^.CalfBreedID := qMultipleCalves.FieldByName('CalfBreedID').AsInteger;
                                    WinData.CalvingRecords[i]^.CalfColourID := qMultipleCalves.FieldByName('CalfColourID').AsInteger;
                                    WinData.CalvingRecords[i]^.CalfWeight := qMultipleCalves.FieldByName('Weight').AsFloat;
                                    if WinData.CalvingRecords[i]^.CalfWeight <= 0 then
                                       WinData.CalvingRecords[i]^.CalfWeight := cDefaultCalfWeight;
                                    WinData.CalvingRecords[i]^.EventDate := qMultipleCalves.FieldByName('EventDate').AsDateTime;
                                    WinData.CalvingRecords[i]^.CalfBreeding := qMultipleCalves.FieldByName('CalfBreeding').AsBoolean;
                                    WinData.CalvingRecords[i]^.CalfDead := qMultipleCalves.FieldByName('CalfDead').AsBoolean;
                                    WinData.CalvingRecords[i]^.CalfMortality := qMultipleCalves.FieldByName('CalfMortality').AsInteger;
                                    WinData.CalvingRecords[i]^.CalfDisposalPlace := qMultipleCalves.FieldByName('DisposalPlaceID').AsInteger;
                                    WinData.CalvingRecords[i]^.CalfName := TempEvents.FieldByName('CalfName').AsString;
                                    if WinData.LookUpDamSire.Locate('ID;Sex', VarArrayOf([TempEvents.FieldByName('SireID').AsInteger, 'Bull']), []) then
                                       WinData.LastBull := TempEvents.FieldByName('SireID').AsInteger;
                                    WinData.CalvingBirthType := TempEvents.FieldByName('BirthType').AsInteger;
                                    //   27/09/12 [V5.0 R8.9] /MK Change - Add ElectronicID from PDAEvents tables.
                                    WinData.CalvingRecords[i]^.CalfEID := qMultipleCalves.FieldByName('ElectronicID').AsString;
                                    qMultipleCalves.Next;
                                    Inc(i);
                                 end;

                                 //   06/03/17 [V5.6 R6.5] /MK Additional Feature - If editing a PDA/Parlour calving and country is Ireland or NIreland then show new calving screen.
                                 {
                                 if ( WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) in [Ireland, NIreland] ) then
                                    TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAddCalving, WinData.AnimalFileByIDID.AsInteger, 0, TempEvents.FieldByName('EventDate').AsDateTime)
                                 else
                                 }
                                    uCalvings.ShowCalvings(Add);

                                 DeleteCalvings(DamID);
                           finally
                              for i := 1 to CalfCount do
                                 begin
                                    Dispose(WinData.CalvingRecords[i]);
                                    WinData.CalvingRecords[i] := nil;
                                 end;
                           end
                        else if CalfCount = 1 then
                           try
                              New(WinData.CalvingRecords[1]);
                              CalfNo := TempEvents.FieldByName('CalfNo').AsString;
                              if CalfNo <> '' then
                                 begin
                                    if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
                                       begin
                                          if ( WhatStyleNatID(CalfNo, False) = StyleUnKnown ) and ( Length(CalfNo) = 5 ) then
                                             begin
                                                // OK what seems to be passed through is the Check Digit + Animal No e.g 12345
                                                // amalgamate the CalfNo onto the existing HerdNumber to create a valid tag.
                                                // ShowMessage(ExtractNatIDHerdNo(WinData.DefaultNatIDMask) + CalfNo);
                                                CheckNatID( ExtractNatIDHerdNo(WinData.DefaultNatIDMask) + CalfNo, CalfNo, False );
                                             end
                                          else
                                             CheckNatID( TempEvents.FieldByName('CalfNo').AsString, CalfNo, False );
                                       end
                                    else if WinData.DefCountry(Windata.AnimalFileByIDHerdID.AsInteger) = NIreland then
                                       begin
                                          if ( Length(CalfNo) <= 5 ) then
                                             begin
                                                WinData.CalvingRecords[1]^.AnimalNo := Copy(CalfNo, 1, Length(CalfNo)-1);
                                                NatIDMask := ExtractNatIDHerdNo(WinData.DefaultNatIDMask);
                                                if not WinData.CheckNINatID( Copy( NatIDMask, 1, 3) + ' ' + Copy( NatIDMask, 4, MaxInt) + ' ' + Copy(CalfNo, 1, Length(CalfNo)-1) + ' ' + CalfNo[Length(CalfNo)], CalfNo ) then
                                                   MessageDlg('Invalid National Identity Number',mtError,[mbOK],0)
                                             end
                                          else
                                             begin
                                                if ( IsNINatID(TempEvents.FieldByName('CalfNo').AsString)) then
                                                   if not WinData.CheckNINatID(TempEvents.FieldByName('CalfNo').AsString, CalfNo) then
                                                      MessageDlg('Invalid National Identity Number',mtError,[mbOK],0)
                                             end;
                                       end;
                                 end;

                              //   10/03/15 [V5.4 R3.2] /MK Change - If ParlourLink then only pass in the EventDate into WinData.CalvingRecords.
                              if ( FLinkType <> esParlourLink ) and ( CalfNo <> '' )then
                                 begin
                                    WinData.CalvingRecords[1]^.CalfNo := CalfNo;

                                    if ( TempEvents.FieldByName('EventDate').AsDateTime > 0 ) then
                                       WinData.CalvingRecords[1]^.EventDate := TempEvents.FieldByName('EventDate').AsDateTime
                                    else
                                       WinData.CalvingRecords[1]^.EventDate := Date;

                                    WinData.CalvingRecords[1]^.CalfAnimalNo := TempEvents.FieldByName('CalfAnimalNo').AsString;
                                    WinData.CalvingRecords[1]^.CalfSex := TempEvents.FieldByName('CalfSex').AsString;
                                    WinData.CalvingRecords[1]^.CalfWeight := TempEvents.FieldByName('Weight').AsFloat;
                                    if WinData.CalvingRecords[1]^.CalfWeight <= 0 then
                                       WinData.CalvingRecords[1]^.CalfWeight := cDefaultCalfWeight;
                                    WinData.CalvingRecords[1]^.CalfBreedID := TempEvents.FieldByName('CalfBreedID').AsInteger;
                                    WinData.CalvingRecords[1]^.CalfColourID := TempEvents.FieldByName('CalfColourID').AsInteger;
                                    WinData.CalvingRecords[1]^.CalfBreeding := qMultipleCalves.FieldByName('CalfBreeding').AsBoolean;
                                    WinData.CalvingRecords[1]^.CalfDead := TempEvents.FieldByName('CalfDead').AsBoolean;
                                    WinData.CalvingRecords[1]^.CalfMortality := TempEvents.FieldByName('CalfMortality').AsInteger;
                                    WinData.CalvingRecords[1]^.CalfDisposalPlace := TempEvents.FieldByName('DisposalPlaceID').AsInteger;
                                    WinData.CalvingRecords[1]^.CalfName := TempEvents.FieldByName('CalfName').AsString;
                                    if WinData.LookUpDamSire.Locate('ID;Sex', VarArrayOf([TempEvents.FieldByName('SireID').AsInteger, 'Bull']), []) then
                                       WinData.LastBull := TempEvents.FieldByName('SireID').AsInteger;
                                    WinData.CalvingBirthType := TempEvents.FieldByName('BirthType').AsInteger;
                                    //   27/09/12 [V5.0 R8.9] /MK Change - Add ElectronicID from PDAEvents tables.
                                    WinData.CalvingRecords[1]^.CalfEID := TempEvents.FieldByName('ElectronicID').AsString;
                                 end
                              else if ( FLinkType = esParlourLink ) and ( CalfNo = '' ) then
                                 begin
                                    if ( TempEvents.FieldByName('EventDate').AsDateTime > 0 ) then
                                       WinData.CalvingRecords[1]^.EventDate := TempEvents.FieldByName('EventDate').AsDateTime
                                    else
                                       WinData.CalvingRecords[1]^.EventDate := Date;
                                 end;

                              //   06/03/17 [V5.6 R6.5] /MK Additional Feature - If editing a PDA/Parlour calving and country is Ireland or NIreland then show new calving screen.
                              {
                              if ( WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) in [Ireland, NIreland] ) then
                                 TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAddCalving, WinData.AnimalFileByIDID.AsInteger,0,TempEvents.FieldByName('EventDate').AsDateTime)
                              else
                              }
                                 uCalvings.ShowCalvings(Add);

                              DeleteCalving;
                           finally
                              Dispose(WinData.CalvingRecords[1]);
                              WinData.CalvingRecords[1] := nil;
                           end;
                     finally
                     end;
                  end;
            end
         else if ( EventType = cSaleDeathEvent ) then
            begin
               New(WinData.SaleDeathRecord);
               try
                  FillChar(WinData.SaleDeathRecord^, SizeOf(TSaleDeathRecord), #0);
                  WinData.SaleDeathRecord^.AnimalID := WinData.AnimalFileByIDID.AsInteger;
                  WinData.SaleDeathRecord^.EventDate := TempEvents.FieldByName('EventDate').AsDateTime;
                  WinData.SaleDeathRecord^.Price := TempEvents.FieldByName('Price').AsFloat;
                  WinData.SaleDeathRecord^.Weight := TempEvents.FieldByName('Weight').AsFloat;
                  WinData.SaleDeathRecord^.Grade := TempEvents.FieldByName('Grade').AsString;
                  WinData.SaleDeathRecord^.CustID := TempEvents.FieldByName('CustomerID').AsInteger;
                  WinData.SaleDeathRecord^.Sold := TempEvents.FieldByName('Sold').AsBoolean;
                  WinData.SaleDeathRecord^.Comment := TempEvents.FieldByName('Comment').AsString;
                  if not WinData.SaleDeathRecord^.Sold then
                     begin
                        WinData.SaleDeathRecord^.DisposalPlace := TempEvents.FieldByName('DisposalPlace').AsInteger;
                        WinData.SaleDeathRecord^.CauseOfDeath := TempEvents.FieldByName('CauseOfDeath').AsInteger;
                     end;
                  ShowSalesDeaths(AddSale, False);   //Changed Procedure call to include PreSale Boolean
                  DeleteEvent(dbgSaleDeath);
               finally
                  Dispose(WinData.SaleDeathRecord);
               end;
            end
         else if WinData.Events.Locate('ID', TempEvents.FieldByName('EventID').AsInteger, [] ) then
            case EventType of
               1 : begin
                      Bullings.ShowBulling(AmendBulling); // Display the Bulling  Form
                      if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then
                         DeleteEvent(dbgBullings)
                      else
                         begin
                            TempEvents.Edit;
                            try
                              if TempEvents.FieldByName('EventDate').AsDateTime <> WinData.EventsEventDate.AsDateTime then
                                 TempEvents.FieldByName('EventDate').AsDateTime := WinData.EventsEventDate.AsDateTime;
                              if TempEvents.FieldByName('Comment').AsString <> WinData.EventsEventDesc.AsString then
                                 TempEvents.FieldByName('Comment').AsString := WinData.EventsEventDesc.AsString;
                              if TempEvents.FieldByName('BullNo').AsInteger <> WinData.BullingsPlannedBull.AsInteger then
                                 TempEvents.FieldByName('BullNo').AsInteger := WinData.BullingsPlannedBull.AsInteger;
                              TempEvents.Post;
                            except
                              TempEvents.Cancel;
                            end;
                         end;
                   end;
               2 : begin
                      Services.ShowService(AmendService);
                      if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then
                         DeleteEvent(dbgServices)
                      else
                         begin
                            TempEvents.Edit;
                            try
                              if TempEvents.FieldByName('EventDate').AsDateTime <> WinData.EventsEventDate.AsDateTime then
                                 TempEvents.FieldByName('EventDate').AsDateTime := WinData.EventsEventDate.AsDateTime;
                              if TempEvents.FieldByName('Comment').AsString <> WinData.EventsEventDesc.AsString then
                                 TempEvents.FieldByName('Comment').AsString := WinData.EventsEventDesc.AsString;
                              if TempEvents.FieldByName('BullNo').AsInteger <> WinData.BullingsPlannedBull.AsInteger then
                                 TempEvents.FieldByName('BullNo').AsInteger := WinData.BullingsPlannedBull.AsInteger;
                              TempEvents.Post;
                            except
                              TempEvents.Cancel;
                            end;
                         end;

                   end;
               3 : begin
                      PregDiag.ShowPD(AmendPD);
                      if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then
                         DeleteEvent(dbgPregDiag)
                      else
                         begin
                            TempEvents.Edit;
                            try
                              if TempEvents.FieldByName('EventDate').AsDateTime <> WinData.EventsEventDate.AsDateTime then
                                 TempEvents.FieldByName('EventDate').AsDateTime := WinData.EventsEventDate.AsDateTime;
                              if TempEvents.FieldByName('Comment').AsString <> WinData.EventsEventDesc.AsString then
                                 TempEvents.FieldByName('Comment').AsString := WinData.EventsEventDesc.AsString;
                              if TempEvents.FieldByName('Pregnant').AsBoolean <> WinData.PregDiagPregnancyStatus.AsBoolean then
                                 TempEvents.FieldByName('Pregnant').AsBoolean := WinData.PregDiagPregnancyStatus.AsBoolean;
                              TempEvents.Post;
                            except
                              TempEvents.Cancel;
                            end;
                         end;
                   end;
               4,6 : begin
                        if EventType = cHealthEvent then
                           begin
                              uHealth.ShowHealth( AmendHealth );
                              if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then DeleteEvent(dbgHealth)
                           end
                        else
                           begin
                              uHealth.ShowHealth( AmendDryingOff );
                              if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then DeleteEvent(dbgDryoff);
                           end;

                      if (not ( Removeeventoncompletion1.Checked )) and (not ( EventDeleted )) then
                         begin
                            TempEvents.Edit;
                            try
                              if TempEvents.FieldByName('EventDate').AsDateTime <> WinData.EventsEventDate.AsDateTime then
                                 TempEvents.FieldByName('EventDate').AsDateTime := WinData.EventsEventDate.AsDateTime;
                              if TempEvents.FieldByName('Comment').AsString <> WinData.EventsEventDesc.AsString then
                                 TempEvents.FieldByName('Comment').AsString := WinData.EventsEventDesc.AsString;
                              if TempEvents.FieldByName('Medicine').AsInteger <> WinData.HealthDrugUsed.AsInteger then
                                 TempEvents.FieldByName('Medicine').AsInteger := WinData.HealthDrugUsed.AsInteger;
                              if TempEvents.FieldByName('HealthDesc').AsInteger <> WinData.HealthHealthCode.AsInteger then
                                 TempEvents.FieldByName('HealthDesc').AsInteger := WinData.HealthHealthCode.AsInteger;
                              if TempEvents.FieldByName('ApplicMethod').AsInteger <> WinData.HealthApplicMethod.AsInteger then
                                 TempEvents.FieldByName('ApplicMethod').AsInteger := WinData.HealthApplicMethod.AsInteger;
                              if TempEvents.FieldByName('MedAdmin').AsInteger <> WinData.HealthAdminBy.AsInteger then
                                 TempEvents.FieldByName('MedAdmin').AsInteger := WinData.HealthAdminBy.AsInteger;
                              if TempEvents.FieldByName('NoDays').AsInteger <> WinData.HealthNoDays.AsInteger then
                                 TempEvents.FieldByName('NoDays').AsInteger := WinData.HealthNoDays.AsInteger;
                              if TempEvents.FieldByName('NoTimes').AsInteger <> WinData.HealthNoTimes.AsInteger then
                                 TempEvents.FieldByName('NoTimes').AsInteger := WinData.HealthNoTimes.AsInteger;
                              if TempEvents.FieldByName('Quantity').AsFloat <> WinData.HealthRateApplic.AsFloat then
                                 TempEvents.FieldByName('Quantity').AsFloat := WinData.HealthRateApplic.AsFloat;

                              //   10/02/12 [V5.0 R3.7] /MK Additional Feature - Update BatchNo From WinData.HealthDrugBatchNo.
                              if TempEvents.FieldByName('BatchNo').AsString <> WinData.HealthDrugBatchNo.AsString then
                                 TempEvents.FieldByName('BatchNo').AsString := WinData.HealthDrugBatchNo.AsString;

                              TempEvents.Post;
                            except
                              TempEvents.Cancel;
                            end;
                         end;

                   end;
               7 : begin
                      Weighing.ShowWeight(AmendWeight);
                      if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then
                         DeleteEvent(dbgWeighing)
                      else
                         begin
                            TempEvents.Edit;
                            try
                              if TempEvents.FieldByName('EventDate').AsDateTime <> WinData.EventsEventDate.AsDateTime then
                                 TempEvents.FieldByName('EventDate').AsDateTime := WinData.EventsEventDate.AsDateTime;
                              if TempEvents.FieldByName('Comment').AsString <> WinData.EventsEventDesc.AsString then
                                 TempEvents.FieldByName('Comment').AsString := WinData.EventsEventDesc.AsString;
                              if TempEvents.FieldByName('Weight').AsFloat <> WinData.WeighingsWeight.AsFloat then
                                 TempEvents.FieldByName('Weight').AsFloat := WinData.WeighingsWeight.AsFloat;
                              TempEvents.Post;
                            except
                              TempEvents.Cancel;
                            end;
                         end;

                   end;
               20 : begin
                       uMPEvents.ShowTheForm(ECON, AmendAWE, 'Condition Score');
                      if ( Removeeventoncompletion1.Checked ) or ( EventDeleted ) then
                         DeleteEvent(dbgConditionScore)
                      else
                         begin
                            TempEvents.Edit;
                            try
                              if TempEvents.FieldByName('EventDate').AsDateTime <> WinData.EventsEventDate.AsDateTime then
                                 TempEvents.FieldByName('EventDate').AsDateTime := WinData.EventsEventDate.AsDateTime;
                              if TempEvents.FieldByName('Comment').AsString <> WinData.EventsEventDesc.AsString then
                                 TempEvents.FieldByName('Comment').AsString := WinData.EventsEventDesc.AsString;
                              if TempEvents.FieldByName('Score').AsFloat <> WinData.ConditionScoreScore.AsFloat then
                                 TempEvents.FieldByName('Score').AsFloat := WinData.ConditionScoreScore.AsFloat;
                              TempEvents.Post;
                            except
                              TempEvents.Cancel;
                            end;
                         end;
                   end;
               CDisbuddingEvent :
                   begin
                      uMPEvents.ShowTheForm(EDBU, AmendAWE, 'Disbudding');
                   end;
               CCastrateEvent :
                   begin
                      uMPEvents.ShowTheForm(ECST, AmendAWE, 'Castration');
                   end;
               CMealFeedingEvent :
                   begin
                      uMPEvents.ShowTheForm(EMLF, AmendAWE, 'Meal Feeding');
                   end;
               CWeaningEvent :
                   begin
                      uMPEvents.ShowTheForm(EWNC, AmendAWE, 'Weaning');
                   end;
            end
         else
            MessageDlg('Cannot locate event. This event may have been deleted',mtWarning,[mbOK],0);
      end
   else
      MessageDlg('Unable to locate Animal.',mtError,[mbok],0);
end;

procedure TPhoneLinkEventsReview.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := (not CheckCalvings) and ( not CheckMovements) ;
   if CanClose then
      begin
         // check if events exist, if so prompt user to exit.
         GenQuery.Open;
         try
            if ( GenQuery.RecordCount > 0 ) then
                CanClose := ( MessageDlg('Exit '+iEventDesc[FLinkType]+', are you sure?',mtConfirmation,[mbYes,mbNo],0) = IdYes );
         finally
           GenQuery.Close;
         end;
      end
   else
      begin
          // As of V3.8 R5.5, GL
         CanClose := MessageDlg('Un-completed Calving\Movement events exist. '+ cCRLFx2 +
                                'Are you sure you want to exit '+iEventDesc[FLinkType]+' ?',mtConfirmation,[mbyes,mbNo],0) = idYes;
      end;
end;

procedure TPhoneLinkEventsReview.SetupMenu;
var
   i : Integer;
   mi : TMenuItem;
   Default : Integer;
begin
   Editeventsconsectitively1.Checked := IniFile.ReadBool('ReadEvents', 'All', False);
   Removeeventoncompletion1.Checked := IniFile.ReadBool('RemoveEventOnComplete', 'All', False);
   Default := IniFile.ReadInteger('EventTab', 'TabIndex', 0);
   for i := 0 to EventTabs.PageCount-1 do
      begin
         if EventTabs.Pages[i].TabVisible then
            begin
               mi := TMenuItem.Create(self);
               mi.Caption := EventTabs.Pages[i].Caption;
               mi.Tag := i;
               mi.GroupIndex := 1;
               mi.RadioItem := True;
               mi.OnClick := MenuClick;
               if i = Default then
                  begin
                     mi.Checked := True;
                     EventTabs.ActivePageIndex := Default;
                  end;
               DefaultTab1.Add( mi);
            end;
      end;
end;

procedure TPhoneLinkEventsReview.FormDestroy(Sender: TObject);
var
   i : Integer;
begin
   if WinData.WeaningScores.Active then
      WinData.WeaningScores.Active := False;

   if WinData.LookupMediAdmin.Active then
      WinData.LookupMediAdmin.Active := False;

   for i := DefaultTab1.Count-1 downto 0 do
      DefaultTab1.Items[i].Free;
   FreeAndNil(IniFile);
end;

procedure TPhoneLinkEventsReview.MenuClick(Sender: TObject);
var
   i : Integer;
begin
   for i := DefaultTab1.Count-1 downto 0 do
      DefaultTab1.Items[i].Checked := False;
   if ( Sender is TMenuItem ) then
      begin
        (Sender as TMenuItem).Checked := True;
        IniFile.WriteInteger('EventTab', 'TabIndex', (Sender as TMenuItem).Tag);
      end;
end;

procedure TPhoneLinkEventsReview.EditEventsConsectitively1Click(
  Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      begin
         (Sender as TMenuItem).Checked := not(Sender as TMenuItem).Checked;
         IniFile.WriteBool('ReadEvents', 'All', (Sender as TMenuItem).Checked);
      end;
end;

procedure TPhoneLinkEventsReview.sbEventClick(Sender: TObject);
begin
   if ( Editeventsconsectitively1.Checked ) then
      begin
         while not TempEvents.eof do
            begin
               ReviewEvent(TempEvents.FieldByName('EventType').AsInteger);
               TempEvents.Next;
            end;
      end
   else
      ReviewEvent(TempEvents.FieldByName('EventType').AsInteger);
end;

function TPhoneLinkEventsReview.CheckCalvings: Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := 'kingswd';
         SQL.Add('Select Distinct(AnimalID) From tSmsEvents Where ( EventType = 5 ) ');
         Open;
         try
            First;
            Result := ( RecordCount > 0 );
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TPhoneLinkEventsReview.Removeuncompletedcalviing1Click(
  Sender: TObject);
begin
   DeleteCalving;
   EventTabsChange(EventTabs);
end;

procedure TPhoneLinkEventsReview.DeleteCalving;
begin
   DeleteEvent(dbgCalvings);
end;

procedure TPhoneLinkEventsReview.DeleteEvent(grid: TDBGridEh);
begin
   try
{      if TempEvents.Locate('id',grid.DataSource.DataSet.FieldbyName('id').AsInteger,[]) then
         begin
         TempEvents1.Edit;
         TempEvents1['Deleted'] := True;
         TempEvents1.Post;
         TempEvents.Refresh;
         end;}
      grid.DataSource.DataSet.Delete;
   except
   end;
end;

function TPhoneLinkEventsReview.EventDeleted : Boolean;
begin
   Result := not ( WinData.Events.Locate('ID', TempEvents.FieldByName('EventID').AsInteger, [] ) );
end;

procedure TPhoneLinkEventsReview.Removeeventoncompletion1Click(
  Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      begin
         (Sender as TMenuItem).Checked := not(Sender as TMenuItem).Checked;
         IniFile.WriteBool('RemoveEventOnComplete', 'All', (Sender as TMenuItem).Checked);
      end;
end;

procedure TPhoneLinkEventsReview.sbPreviewClick(Sender: TObject);
begin
   sbPreview.Enabled  := False;
   try
      PrintForm(FslEventList, FslNotFound, FALSE);
   finally
     sbPreview.Enabled  := True;
   end;
end;

function TPhoneLinkEventsReview.CheckMultipleCalves(dam: Integer): Integer;
begin
   qMultipleCalves.Close;
   qMultipleCalves.Params[0].Value := dam;
   qMultipleCalves.Prepared := True;
   qMultipleCalves.Active := True;
   Result := qMultipleCalves.RecordCount;
end;

procedure TPhoneLinkEventsReview.DeleteCalvings(const Dam: Integer);
begin
   with qDeleteCalvings do
      begin
         Params[0].Value := Dam;
         ExecSQL;
         dbgCalvings.DataSource.DataSet.Refresh;
         EventTabsChange(EventTabs);
      end;
end;

function TPhoneLinkEventsReview.CheckMovements: Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := 'kingswd';
         SQL.Add('Select Distinct(AnimalID) From tSmsEvents Where ( EventType = 11 ) ');
         Open;
         try
            First;
            Result := ( RecordCount > 0 );
         finally
            Close;
         end;
      finally
         Free;
      end;
   if ( FLinkType = esPDA ) and  ( not Result ) then
      begin
         Result := PDAPurchases.RecordCount > 0;
      end;
end;

function TPhoneLinkEventsReview.CheckValidHerdIdMask: Boolean;
var
   NatIDHerdID : String;
   i : Integer;
begin
   Result := True;
   NatIDHerdID := ExtractNatIDHerdNo(WinData.DefaultNatIDMask);
   if Length(NatIDHerdID) <= 0 then
      Result := False
   else
      if Copy(NatIDHerdID, 1, 2 ) = 'IE' then
         for i := 3 to 9 do
             if not ( NatIDHerdID[i] in ['0'..'9']) then
                  begin
                     Result := False;
                     Break;
                  end;
end;

procedure TPhoneLinkEventsReview.dbgPurchasesDblClick(Sender: TObject);
begin
   if TfmPDAAnimalPurch.ShowForm( dsPDAPurchases ) then
      DeleteEvent(dbgPurchases);
end;

procedure TPhoneLinkEventsReview.MenuItem1Click(Sender: TObject);
begin
   if MessageDlg('Delete Purchase Event, are you sure?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      DeleteEvent(dbgPurchases);
end;

procedure TPhoneLinkEventsReview.DeleteSaleDeathEvent1Click(
  Sender: TObject);
begin
   if MessageDlg('Delete Sale/Death Event, are you sure?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      DeleteEvent(dbgSaleDeath);

end;

procedure TPhoneLinkEventsReview.SortEventTable(IndexName: String);
begin
   //TempEvents.IndexName := IndexName;
end;

procedure TPhoneLinkEventsReview.dbgPregDiagTitleClick(Column: TColumnEh);
begin
   if Column.Field.FieldName = 'AnimalNo' then
      begin
         if TempEvents.IndexName = 'idSortAnimalNo' then
            TempEvents.IndexName := 'iSortAnimalNo'
         else
            TempEvents.IndexName := 'idSortAnimalNo';
      end
   else if Column.Field.FieldName = 'NatIDNum' then
      begin
         if TempEvents.IndexName = 'iSortAnimalNo' then
            TempEvents.IndexName := 'idSortNatID'
         else
            TempEvents.IndexName := 'iSortNatID';
      end
   else if  Column.Field.FieldName = 'EventDate' then
      begin
         if TempEvents.IndexName = 'iEventDate' then
            TempEvents.IndexName := 'idEventDate'
         else
            TempEvents.IndexName := 'iEventDate';
      end
   else if  Column.Field.FieldName = 'LactNo' then
      begin
         if TempEvents.IndexName = 'iLactNo' then
            TempEvents.IndexName := 'diLactNo'
         else
            TempEvents.IndexName := 'idLactNo';
      end;
end;

procedure TPhoneLinkEventsReview.sbDeleteClick(Sender: TObject);
begin
   //
   if EventTabs.ActivePage = tsSalesDeaths then
      begin
         if MessageDlg('Delete Sale/Death event, are you sure?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            DeleteEvent(dbgSaleDeath);
      end
   else if EventTabs.ActivePage = tsSalesDeaths then
      begin
         if MessageDlg('Delete Purchase event, are you sure?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            DeleteEvent(dbgPurchases);
      end
   else if EventTabs.ActivePage = tsCalvings then
      begin
         DeleteCalving;
         EventTabsChange(EventTabs);
      end;
end;

procedure TPhoneLinkEventsReview.ShowEventGridItems(AEventType: Integer);
var
   GridCol : TcxGridDBColumn;
   GridColIndex : Integer;
begin
   for GridColIndex := 0 to EventsGridDBTableView.ColumnCount-1 do
      begin

         if GridColIndex <= 4 then // show default cols... AnimalNo, NatIDNum, LactNo, EventDate, EventComment
            begin
               EventsGridDBTableView.Columns[GridColIndex].Visible := True;
               EventsGridDBTableView.Columns[GridColIndex].Hidden  := False;
            end
         else
            begin
               EventsGridDBTableView.Columns[GridColIndex].Visible := False;
               EventsGridDBTableView.Columns[GridColIndex].Hidden  := True;
            end;
      end;

   if ( AEventType = CDisbuddingEvent ) then
      begin
         EventsGrid.Parent := tsDisbudding;
         EventsGridDBTableViewDBVet.Visible := True;
         EventsGridDBTableViewDBVet.Hidden  := False;
         EventsGridDBTableViewDBVet.RepositoryItem := HerdLookup.erAdminByVet;

         if not WinData.LookupMediAdmin.Active then
            WinData.LookupMediAdmin.Active := True;
      end
   else if ( AEventType = CCastrateEvent ) then
      begin
         EventsGrid.Parent := tsCastration;

      end
   else if ( AEventType = CMealFeedingEvent ) then
      begin
         EventsGrid.Parent := tsMealFeeding;

      end
   else if ( AEventType = CWeaningEvent ) then
      begin
         EventsGrid.Parent := tsWeaning;

         EventsGridDBTableViewWNCalfDocility.Visible := True;
         EventsGridDBTableViewWNCalfDocility.Hidden  := False;
         EventsGridDBTableViewWNCalfDocility.RepositoryItem := HerdLookup.erCalfDocilityLookup;

         EventsGridDBTableViewWNCalfQuality.Visible := True;
         EventsGridDBTableViewWNCalfQuality.Hidden  := False;
         EventsGridDBTableViewWNCalfQuality.RepositoryItem := HerdLookup.erCalfQualityLookup;

         EventsGridDBTableViewWNWeight.Visible := True;
         EventsGridDBTableViewWNWeight.Hidden  := False;

         EventsGridDBTableViewWNWeighingOnDate.Visible := True;
         EventsGridDBTableViewWNWeighingOnDate.Hidden  := False;

         if not WinData.WeaningScores.Active then
            WinData.WeaningScores.Active := True;
      end;
end;

procedure TPhoneLinkEventsReview.ShowEventTabs;
var
   GenQuery : TQuery;
   TabIndex,i : Integer;
begin
   GenQuery := TQuery.Create(nil);
   try
      with GenQuery do
         begin
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add( InsertSELECT(['COUNT(EventType) ECount']));
            SQL.Add( InsertFROM([TempEvents.TableName]));
            SQL.Add( InsertWHERE(['EventType'], [':EType']));

            Params[0].AsInteger := CBullingEvent;
            try
               Open;
               tsHeatBulling.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CServiceEvent;
            try
               Open;
               tsService.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CPregDiagEvent;
            try
               Open;
               tsPD.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CDryOffEvent;
            try
               Open;
               tsDryOff.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CHealthEvent;
            try
               Open;
               tsHealth.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CCalvingEvent;
            try
               Open;
               tsCalvings.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CSaleDeathEvent;
            try
               Open;
               tsSalesDeaths.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CWeightEvent;
            try
               Open;
               tsWeighings.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CPurchaseEvent;
            try
               Open;
               tsPurchases.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CCondScoreEvent;
            try
               Open;
               tsConditionScore.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CDisbuddingEvent;
            try
               Open;
               tsDisbudding.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CCastrateEvent;
            try
               Open;
               tsCastration.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CMealFeedingEvent;
            try
               Open;
               tsMealFeeding.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            Params[0].AsInteger := CWeaningEvent;
            try
               Open;
               tsWeaning.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;

            SQL.Clear;
            SQL.Add( InsertSELECT(['COUNT(EventType) ECount']));
            SQL.Add( InsertFROM([TempEvents.TableName]));
            SQL.Add( InsertWHERE(['NewGroupID'], ['NULL'],opIsNOT));
            try
               Open;
               tsGroup.TabVisible := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;
         end;

      TabIndex := -1;
      for i := 0 to EventTabs.PageCount-1 do
         begin
            if EventTabs.Pages[i].TabVisible then
               begin
                  if TabIndex = -1 then
                     TabIndex := EventTabs.Pages[i].PageIndex;

                  TabIndex := Min(TabIndex, EventTabs.Pages[i].PageIndex);
               end
         end;
         EventTabs.ActivePageIndex := TabIndex;

      EventTabsChange(nil);
   finally
      FreeAndNil(GenQuery);
   end;
end;

procedure TPhoneLinkEventsReview.EventsGridDBTableViewDblClick(
  Sender: TObject);
begin
   if EventsGridDBTableView.DataController.DataSource.DataSet.RecordCount > 0 then
      sbEventClick(nil);
end;

end.



