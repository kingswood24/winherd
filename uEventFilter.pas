{
   17/01/12 [V5.0 R3.5] /MK Change - New Procedure - ShowTheForm - To Allow ForceBlockDelete From Another Form.

   18/01/12 [V5.0 R3.5] /MK Change - Moved Old cbEventTypes. Changed to cmboEventTypeFilter.

   19/01/12 [V5.0 R3.6] /MK Bug - FilterDiaryGrid - Not Filtering Properly.

   08/01/13 [V5.1 R3.7] /MK Bug Fix - EventGridDoubleClick - Not able to edit Milk Temperament events.

   20/06/13 [V5.1 R7.5] /MK Changed - Change btnFilterByDate Caption to Apply Date Filter and removed icon.

   14/07/15 [V5.4 R7.0] /MK Change - EventGridTableViewDblClick - If country is Ireland then show new calving event screen.

   12/09/17 [V5.7 R3.0] /MK Change - Removed the Feed Event Diary from this screen as it was added to the main screen.
                                   - When editing a calving event always show new Calving screen regardless of country.
                                   - Show uMessageScr if filter is not applied on the main screen or show all animals is not ticked.
                                     to explain to the user that only events for current animals in the herd are showing.

   24/07/18 [V5.8 R1.3] /MK Additional Feature - Replaced CXLookupCombo with RXDBLookupCombo for HerdCombo to allow for a DisplayEmpty value of AllHerds.

   25/07/18 [V5.8 R1.3] /MK Change - EventsQueryBeforeOpen - If MultiHerd (more than 1 herd in same database) then don't apply animals from AFilters.db
                                                             Instead if no filter applied or ShowAllAnimals is unticked then only show animals in herd for all herds except None herd.
                                                             If filter or ShowAllAnimals is applied then only show events for animals that are not in None Herd and are not deleted.

   27/07/18 [V5.8 R1.4] /MK Change - FormCreate - Grey out HerdCombo if Multi herd like main grid.
}

unit uEventFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDockControl, dxDockPanel, ActnList, dxBar, dxBarExtItems, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Db, DBTables, cxLabel,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls,
  cxCheckComboBox, dxPSCore, dxPScxCommon, dxPScxGridLnk, cxStyles,
  cxGraphics, StdCtrls, cxCalendar, cxButtons, Menus, cxCheckBox,
  dxStatusBar, cxFilter, GenTypesConst, cxCustomData, uEventForm,
  uFertilityCheckEdit, uCalvingEvent, uMessageScr, RxLookup;

type
  TEventFilter = class(TForm)
    EventGridTableView: TcxGridDBTableView;
    EventGridLevel: TcxGridLevel;
    EventGrid: TcxGrid;
    BarManager: TdxBarManager;
    ActionList1: TActionList;
    actExit: TAction;
    blbExit: TdxBarLargeButton;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    EventsQuery: TQuery;
    EventsQuerySource: TDataSource;
    EventGridTableViewAnimalLactNo: TcxGridDBColumn;
    EventGridTableViewEventDate: TcxGridDBColumn;
    EventGridTableViewEventDesc: TcxGridDBColumn;
    EventGridTableViewEventType: TcxGridDBColumn;
    pHerdId: TPanel;
    cxLabel1: TcxLabel;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    pEventTypes: TPanel;
    cbEventTypes: TcxCheckComboBox;
    cxLabel2: TcxLabel;
    dxBarLargeButton1: TdxBarLargeButton;
    ComponentPrinter: TdxComponentPrinter;
    EventGridPrinterLink: TdxGridReportLink;
    actPrintGrid: TAction;
    EventGridTableViewAnimalNo: TcxGridDBColumn;
    EventGridTableViewNatIDNum: TcxGridDBColumn;
    EventGridTableViewHiddenAnimalNo: TcxGridDBColumn;
    EventGridTableViewHiddenNatIDNum: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    EventsQueryID: TIntegerField;
    EventsQueryEventType: TSmallintField;
    EventsQueryEventDate: TDateField;
    EventsQueryEventDesc: TStringField;
    EventsQueryAnimalLactNo: TSmallintField;
    EventsQueryAnimalNo: TStringField;
    EventsQueryNatIDNum: TStringField;
    EventsQuerySortAnimalNo: TStringField;
    EventsQuerySortNatID: TStringField;
    EventsQueryEventTypeDesc: TStringField;
    EventsQueryAnimalID: TIntegerField;
    pDateFilter: TPanel;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    deDateFrom: TcxDateEdit;
    deDateTo: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnFilterByDate: TcxButton;
    blbExport: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    actExportToExcelFile: TAction;
    bbExportToExcelFile: TdxBarButton;
    SaveDialog: TSaveDialog;
    pMultipleEventDeletion: TPanel;
    btnDeleteAllDiaryEvents: TcxButton;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    deEventDate: TcxDateEdit;
    lbMulitpleDeleteInstruction: TcxLabel;
    cbAllowGroupDeletion: TcxCheckBox;
    btnResetDiaryFilter: TcxButton;
    actDeleteDiaryEvents: TAction;
    pEventActions: TPanel;
    btnDeleteSelectedEvents: TcxButton;
    cxLabel34: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    actDeleteEvents: TAction;
    EventGridTableViewID: TcxGridDBColumn;
    cmboDeletableEventTypes: TcxComboBox;
    EventGridTableViewHerdId: TcxGridDBColumn;
    EventsQueryHerdID: TIntegerField;
    dxBarLargeButton2: TdxBarLargeButton;
    //   18/01/12 [V5.0 R3.5] /MK Change - Moved Old cbEventTypes. Changed to cmboEventTypeFilter.
    cmboEventTypeFilter: TcxComboBox;
    HerdCombo: TRxDBLookupCombo;
    procedure actExitExecute(Sender: TObject);
    procedure EventsQueryBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbEventTypesPropertiesCloseUp(Sender: TObject);
    procedure actPrintGridExecute(Sender: TObject);
    procedure EventsQuerySortNatIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure EventsQuerySortAnimalNoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure EventGridTableViewDblClick(Sender: TObject);
    procedure btnFilterByDateClick(Sender: TObject);
    procedure actExportToExcelFileExecute(Sender: TObject);
    procedure cbAllowGroupDeletionPropertiesChange(Sender: TObject);
    procedure btnResetDiaryFilterClick(Sender: TObject);
    procedure btnDeleteAllDiaryEventsClick(Sender: TObject);
    procedure actDeleteEventsExecute(Sender: TObject);
    procedure btnDeleteSelectedEventsClick(Sender: TObject);
    procedure deEventDatePropertiesChange(Sender: TObject);
    procedure cmboDeletableEventTypesPropertiesChange(Sender: TObject);
    procedure cmboEventTypeFilterPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure HerdComboChange(Sender: TObject);
  private
    { Private declarations }
    //   18/01/12 [V5.0 R3.5] /MK Change - New Array For cmboEventTypeFilter Items.
    FFilteredEventTypes,
    FDeletableEventTypes : array of Integer;
    FNoOfRecordsDeleted : Integer;
    FDiaryDeleteType : TDiaryDeleteType;
    FCountry : TCountry;
    procedure SetupEventTypes;
    function GetEventTypes : String;
    procedure FilterDiaryGrid();
    procedure DeleteEvent(ARowIndex: Integer; ARowInfo: TcxRowInfo);
  public
    { Public declarations }
  end;

  //   17/01/12 [V5.0 R3.5] /MK Change - New Procedure To Allow ForceBlockDelete From Another Form.
  procedure ShowTheForm(AForceBlockDelete : Boolean);

implementation

uses uImageStore, DairyData, uHerdLookup, MenuUnit, KRoutines,
     Bullings, Services, PregDiag, UHealth, uCalvings, Weighing,
     uSalesDeaths, uPurchases, uTempMovements, uMPEvents,  cxExport,  cxExportGrid4Link,
     uDataBackup;

var
  EventFilter: TEventFilter;

{$R *.DFM}

//   17/01/12 [V5.0 R3.5] /MK Change - New Procedure To Allow ForceBlockDelete From Another Form.
procedure ShowTheForm (AForceBlockDelete : Boolean) ;
begin
   Application.CreateForm(TEventFilter, EventFilter);
   with EventFilter do
      try
         cbAllowGroupDeletion.Checked := AForceBlockDelete;
         pEventTypes.Visible := not(AForceBlockDelete);
         pDateFilter.Visible := pEventTypes.Visible;
         FCountry := HerdLookup.CountryByHerdID(WinData.UserDefaultHerdID);
         ShowModal;
      finally
         FreeAndNil(EventFilter)
      end;
end;

procedure TEventFilter.FormCreate(Sender: TObject);
begin
   ImageStore := TImageStore.Create(nil);
   SetupEventTypes;
   EventGridTableViewEventType.RepositoryItem := MenuForm.riEventTypes;
   pHerdId.Visible := False; // hide the herd, it is not needed
   cbAllowGroupDeletion.Checked := False;
   //   18/01/12 [V5.0 R3.5] /MK Change - Set cmboEventTypeFilter.ItemIndex to 0 i.e. All On FormCreate.
   cmboEventTypeFilter.ItemIndex := 0;
   //   18/01/12 [V5.0 R3.5] /MK Change - No Need For FilterDiaryGrid Here As cmboEventTypeFilter.ItemIndex.Change.
   //FilterDiaryGrid();
   pEventActions.Visible := False;
   //   27/07/18 [V5.8 R2.0] /MK Change - Grey out HerdCombo if Multi herd like main grid.
   HerdCombo.Enabled := WinData.MultiHerd;
   HerdCombo.DisplayEmpty := 'All Herds';
   HerdCombo.LookupSource := WinData.dsHerdDefaults;
   if ( WinData.ShowAllAnimals ) then
      HerdCombo.KeyValue := 0
   else
      HerdCombo.KeyValue := WinData.UserDefaultHerdID;
end;

procedure TEventFilter.FormActivate(Sender: TObject);
begin
   if ( not(WinData.ShowAllAnimals) ) and ( not(WinData.ActiveFilter) ) then
      TfmMessageScr.ShowTheForm(mtEventDiary);
   OnActivate := nil;
end;

procedure TEventFilter.EventsQueryBeforeOpen(DataSet: TDataSet);
begin
   try
      EventsQuery.SQL.Clear;
      EventsQuery.SQL.Add('SELECT E.ID, E.AnimalID, E.EventType, E.EventDate, E.EventDesc, E.AnimalLactNo, E.HerdID,');
      EventsQuery.SQL.Add('       A.AnimalNo, A.NatIDNum, A.SortAnimalNo, A.SortNatID');
      EventsQuery.SQL.Add('FROM Events E');
      EventsQuery.SQL.Add('LEFT JOIN Animals A ON (A.ID = E.AnimalID)');

      if ( WinData.UserDefaultHerdID > 0 ) then
         EventsQuery.SQL.Add('WHERE E.HerdID = '+IntToStr(WinData.UserDefaultHerdID)+'')
      else
         EventsQuery.SQL.Add('WHERE ((E.HerdID > 0) AND (E.HerdID <> '+IntToStr(WinData.NONEHerdID)+'))');

      EventsQuery.SQL.Add('AND   EventType in '+GetEventTypes+'');

      if ( deDateFrom.Date > 0 ) and ( deDateTo.Date > 0 ) then
         EventsQuery.SQL.Add('AND   ( EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,deDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,deDateTo.Date) + '''' + ')')
      else if ( deDateFrom.Date > 0 ) and ( deDateTo.Date <= 0 ) then
         EventsQuery.SQL.Add('AND   ( EventDate >= ' + '''' + FormatDateTime(cUSDateStyle,deDateFrom.Date) + ''')')
      else if ( deDateFrom.Date <= 0 ) and ( deDateTo.Date > 0 ) then
         EventsQuery.SQL.Add('AND   ( EventDate <= ' + '''' + FormatDateTime(cUSDateStyle,deDateTo.Date) + ''')' );

      //   25/07/18 [V5.8 R1.3] /MK Change - If MultiHerd (more than 1 herd in same database) then don't apply animals from AFilters.db
      //                                     Instead if no filter applied or ShowAllAnimals is unticked then only show animals in herd for all herds except None herd.
      //                                     If filter or ShowAllAnimals is applied then only show events for animals that are not in None Herd and are not deleted. 
      if ( WinData.MultiHerd ) then
         begin
            if ( not(WinData.ShowAllAnimals) ) and ( not(WinData.ActiveFilter) ) then
               begin
                  EventsQuery.SQL.Add('AND   (A.InHerd = True)');
                  EventsQuery.SQL.Add('AND   (A.AnimalDeleted = False)');
                  EventsQuery.SQL.Add('AND   ((A.HerdID > 0) AND (A.HerdID <> '+IntToStr(WinData.NONEHerdID)+'))');
               end
            else
               begin
                  EventsQuery.SQL.Add('AND   (A.AnimalDeleted = False)');
                  EventsQuery.SQL.Add('AND   ((A.HerdID > 0) AND (A.HerdID <> '+IntToStr(WinData.NONEHerdID)+'))');
               end;
         end
      else
         EventsQuery.SQL.Add('AND   E.AnimalID IN (SELECT AF.AID FROM AFilters AF)');

      EventsQuery.SQL.Add('ORDER BY E.ID DESC');
   finally
   end;
end;

procedure TEventFilter.HerdComboChange(Sender: TObject);
begin
   if ( HerdCombo.KeyValue = Null ) then
      WinData.UserDefaultHerdID := 0
   else
      WinData.UserDefaultHerdID := HerdCombo.KeyValue;
   EventsQuery.Close;
   Screen.Cursor := crHourGlass;
   EventGridTableView.DataController.BeginFullUpdate;
   try
      EventsQuery.Open;
   finally
      EventGridTableView.DataController.EndFullUpdate;
      Screen.Cursor := crDefault;
   end;
end;

//   18/01/12 [V5.0 R3.5] /MK Change - Setup cmboEventTypeFilter Items From HerdLookup.mdEventTypes.
procedure TEventFilter.SetupEventTypes;
var
   i : Integer;
begin
   { Set Up constants to control the Events - Used to set EventType }
   cmboDeletableEventTypes.Properties.Items.Clear;
   cmboDeletableEventTypes.Properties.Items.AddObject('<Select Event Type>', pointer(-1));

   cmboEventTypeFilter.Properties.Items.Clear;
   cmboEventTypeFilter.Properties.Items.AddObject('<All>', pointer(-1));

   SetLength(FDeletableEventTypes, 0);
   SetLength(FFilteredEventTypes, 0);

   with HerdLookup.mdEventTypes do
      begin
         First;
         while not Eof do
            begin
               if FieldByName('UserVisible').AsBoolean then
                  begin
                     cmboEventTypeFilter.Properties.Items.AddObject(FieldByName('Description').AsString, Pointer(FieldByName('EventType').AsInteger));
                     SetLength(FFilteredEventTypes, Length(FFilteredEventTypes) +1);
                     FFilteredEventTypes[Length(FFilteredEventTypes)-1] := FieldByName('EventType').AsInteger;

                     if FieldByName('AllowBlockDeletion').AsBoolean then
                        begin
                           cmboDeletableEventTypes.Properties.Items.AddObject(FieldByName('Description').AsString, Pointer(FieldByName('EventType').AsInteger));
                           SetLength(FDeletableEventTypes, Length(FDeletableEventTypes) +1);
                           FDeletableEventTypes[Length(FDeletableEventTypes)-1] := FieldByName('EventType').AsInteger;
                        end;
                  end;
               Next;
            end;
      end;

end;

function TEventFilter.GetEventTypes: String;
var
   i, j : Integer;
   intArray : Array of Integer;
begin
   Result := '()';

   if not cbAllowGroupDeletion.Checked then
      //   18/01/12 [V5.0 R3.5] /MK Change - GetEventTypes From FFilteredEventTypes i.e. cmboEventTypeFilter.Items.
      Result := IntArrayToSQLInString(FFilteredEventTypes)
   else
      Result := IntArrayToSQLInString(FDeletableEventTypes);
end;

procedure TEventFilter.cbEventTypesPropertiesCloseUp(Sender: TObject);
begin
   cbEventTypes.Text := 'Select Events';
   EventsQuery.Close;
   EventsQuery.Open;
end;

procedure TEventFilter.actPrintGridExecute(Sender: TObject);
begin
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   EventGridPrinterLink.Preview;
end;

procedure TEventFilter.EventsQuerySortNatIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   Text := Sender.DataSet.FieldByName('NatIDNum').AsString;
end;

procedure TEventFilter.EventsQuerySortAnimalNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   Text := Sender.DataSet.FieldByName('AnimalNo').AsString;
end;

procedure TEventFilter.EventGridTableViewDblClick(Sender: TObject);
var
  P: TPoint;
  AHitTest: TcxCustomGridHitTest;
  bChangedCalving : Boolean;
  iShowCalfID, iNoCalvesSaved : Integer;
begin
   GetCursorPos(P);
   P := TcxGridSite(Sender).ScreenToClient(P);
   AHitTest := EventGridTableView.ViewInfo.GetHitTest(P);
   if ( AHitTest.HitTestCode = htNavigator ) then  //check if a navigator button has been clicked
      Exit;

   if WinData.AnimalFileByID.Locate('ID', EventsQueryAnimalID.AsInteger, []) then
      begin
         if WinData.Events.Locate('ID', EventsQueryID.AsInteger, []) then
            begin
               case WinData.EventsEventType.AsInteger of
                  cBullingEvent : Bullings.ShowBulling(AmendBulling); // Display the Bulling  Form
                  cServiceEvent : Services.ShowService(AmendService);
                  cPregDiagEvent : PregDiag.ShowPD(AmendPD);
                  cDryOffEvent : uHealth.ShowHealth( AmendDryingOff );
                  cCalvingEvent : TfmCalvingEvent.ShowForm(bChangedCalving, iShowCalfID, ctAmendCalving, WinData.AnimalFileByIDID.AsInteger, WinData.Events.FieldByName('ID').AsInteger);
                  cHealthEvent : uHealth.ShowHealth( AmendHealth );
                  CWeightEvent : Weighing.ShowWeight(AmendWeight);
                  CSaleDeathEvent : uSalesDeaths.ShowSalesDeaths(AmendSaleDeath,WinData.AnimalFileByIDInHerd.AsBoolean);
                  CPurchaseEvent : uPurchases.ShowForm;
                  CMovementEvent : uTempMovements.ShowMovement(AmendMovement);
                  CAbortionEvent : uMPEvents.ShowTheForm(EABR, AmendAWE, 'Abortion');
                  CCastrateEvent : uMPEvents.ShowTheForm(ECST, AmendAWE, 'Castration');
                  CCondScoreEvent : uMPEvents.ShowTheForm(ECON, AmendAWE, 'Condition Score');
                  CDiagProblemEvent: uMPEvents.ShowTheForm(EDNP, AmendAWE, 'Diagnose Problem');
                  CEmbryoTransEvent: uMPEvents.ShowTheForm(EIMP, AmendAWE, 'Embryo Implant Transfer');
                  CMastitisEvent : uMPEvents.ShowTheForm(EMST, AmendAWE, 'Mastitis');
                  CToBeCulledEvent : uMPEvents.ShowTheForm(ETBC, AmendAWE, 'To be Culled');
                  CWeaningEvent : uMPEvents.ShowTheForm(EWNC, AmendAWE, 'Wean');
                  CIntExamEvent : uMPEvents.ShowTheForm(EINT, AmendAWE, 'Internal Exam');
                  CStockBullIn : uMPEvents.ShowTheForm(ERBI, AmendAWE, 'Bull In');
                  CStockBullOut : uMPEvents.ShowTheForm(ERBO, AmendAWE, 'Bull Out');
                  CHerdVaccination : uHealth.ShowHealth( AmendVaccination );
                  CFertilityCheck : TfmEventForm.LoadEvent(WinData.AnimalFileByIDID.AsInteger,
                                                           WinData.EventID.AsInteger, WinData.AnimalFileByIDLactNo.AsInteger, 0, false,
                                                           TfmFertilityCheckEdit);
                  //   08/01/13 [V5.1 R3.7] /MK Bug Fix - Not able to edit Milk Temperament events.
                  CMilkTemperament : uMPEvents.ShowTheForm(EMTS, AmendAWE, 'Milk Temperament');
                  //   12/12/13 [V5.2 R6.8] /MK Additional Feature - Added code to edit the Johnes event.
                  CJohnesResult : uMPEvents.ShowTheForm(EJOH, AmendAWE, 'Johnes Result');
               end;
            end;
      end;
end;

procedure TEventFilter.btnFilterByDateClick(Sender: TObject);
begin
   deDateFrom.PostEditValue;
   deDateTo.PostEditValue;
   EventsQuery.Close;
   EventsQuery.Open;
end;

procedure TEventFilter.actExportToExcelFileExecute(Sender: TObject);
begin
   SaveDialog.InitialDir := ApplicationPath;
   if SaveDialog.Execute then
      begin
         if FileExists(SaveDialog.FileName) then
            if MessageDlg(cFileOverwrite,mtConfirmation,[mbYes,mbNo],0) = idNo then
               exit;

         ExportGrid4ToExcel(SaveDialog.FileName,EventGrid);
         if FileExists(SaveDialog.FileName) then
            MessageDlg(Format(cFileCreated,[SaveDialog.FileName]),mtInformation,[mbOK],0)
         else
            MessageDlg(cFileCreateError,mtError,[mbOK],0);
      end;
end;

procedure TEventFilter.FilterDiaryGrid;
var
   FilterByCol : Boolean;
   cxFilterCriteriaItemList : TcxFilterCriteriaItemList;
   EventType : Integer;

   procedure FilterGrid;
   begin
      EventGridTableView.DataController.Filter.Active := True;
      EventGridTableView.Controller.FocusedRowIndex := 0;
   end;

begin
   btnDeleteAllDiaryEvents.Enabled := ( deEventDate.Date > 0 ) or (cmboDeletableEventTypes.ItemIndex > 0);

   EventGridTableView.DataController.Filter.Root.Clear;
   EventGridTableView.DataController.Filter.Active := False;
   EventGridTableView.Controller.FocusedRowIndex := 0;

   BarManager.Bars[1].Visible := not cbAllowGroupDeletion.Checked;
   pEventActions.Visible := cbAllowGroupDeletion.Checked;

   EventGridTableView.OptionsCustomize.ColumnGrouping := not cbAllowGroupDeletion.Checked;
   EventGridTableView.OptionsView.GroupByBox := not cbAllowGroupDeletion.Checked;

   if cbAllowGroupDeletion.Checked then
      EventGridTableView.DataController.Groups.ClearGrouping;

   if not cbAllowGroupDeletion.Checked then
      begin
         pMultipleEventDeletion.Height := 28;
         Update;
      end
   else
      begin
         pMultipleEventDeletion.Height := 122;
         Update;
      end;

   //   19/01/12 [V5.0 R3.6] /MK Bug - Not Filtering Properly.
   if ( cbAllowGroupDeletion.Checked ) then
      begin
         if ( deEventDate.Date > 0 ) then
            begin
               EventGridTableView.DataController.Filter.AddItem(nil, EventGridTableViewEventDate, foEqual, deEventDate.Date, '');
               FilterGrid;
            end;

         if (cmboDeletableEventTypes.ItemIndex > 0) then
            begin
               if ( cmboDeletableEventTypes.Properties.Items.Objects[cmboDeletableEventTypes.ItemIndex] <> nil ) then
                  begin
                     EventType := Integer(cmboDeletableEventTypes.Properties.Items.Objects[cmboDeletableEventTypes.ItemIndex]);
                     EventGridTableView.DataController.Filter.AddItem(nil, EventGridTableViewEventType, foEqual, EventType, '');
                     FilterGrid;
                  end
               else
                  begin
                     EventGridTableView.DataController.Filter.Root.Clear;
                     EventGridTableView.DataController.Filter.Active := False;
                     MessageDlg('Invalid event type has been selected',mtError,[mbOk],0);
                     Exit;
                  end;
            end;
      end
   //   18/01/12 [V5.0 R3.5] /MK Change - New cmbo Box - cmboEventTypeFilter - Now Allowed For Within Procedure.
   else
      begin
         if ( cmboEventTypeFilter.ItemIndex > 0 ) then
            begin
               if ( cmboEventTypeFilter.Properties.Items.Objects[cmboEventTypeFilter.ItemIndex] <> nil ) then
                  begin
                     EventType := Integer(cmboEventTypeFilter.Properties.Items.Objects[cmboEventTypeFilter.ItemIndex]);
                     EventGridTableView.DataController.Filter.AddItem(nil, EventGridTableViewEventType, foEqual, EventType, '');
                     FilterGrid;
                  end
               else
                  begin
                     EventGridTableView.DataController.Filter.Root.Clear;
                     EventGridTableView.DataController.Filter.Active := False;
                     MessageDlg('Invalid event type has been selected',mtError,[mbOk],0);
                     Exit;
                  end;
            end
         //   18/01/12 [V5.0 R3.5] /MK Change - If cmboEventTypeFilter.ItemIndex = 0 i.e. All Then Clear Grid Filter.
         else if ( cmboEventTypeFilter.ItemIndex = 0 ) then
            begin
               EventGridTableView.DataController.Filter.Root.Clear;
               EventGridTableView.DataController.Filter.Active := False;
            end;
      end;
end;

procedure TEventFilter.cbAllowGroupDeletionPropertiesChange(
  Sender: TObject);
begin
   if cbAllowGroupDeletion.Checked then
      begin
         //deEventDate.SetFocus;
         if ( MessageDLG('Before using the block deletion a backup of your data'+cCRLF+
                         'is advised in case a mistake is made while deleting events.'+cCRLFx2+
                         'Do you want to backup your data now?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
          TfmDataBackup.execute(daBackup);
      end;

   Update;
   // re-open query - displaying appropriate event types (deletable , All)
   // if cbAllowGroupDeletion.checked = true - only deletable events will be displayed
   // if cbAllowGroupDeletion.checked = false - all events can be shown
   EventsQuery.Active := False;
   EventsQuery.Active := True;
   FilterDiaryGrid();

end;

procedure TEventFilter.btnResetDiaryFilterClick(Sender: TObject);
begin
   deEventDate.Clear;
   cmboDeletableEventTypes.ItemIndex := -1;
end;

procedure TEventFilter.btnDeleteAllDiaryEventsClick(Sender: TObject);
begin
   FDiaryDeleteType := dtFilteredRows;
   actDeleteEvents.Execute;
end;

procedure TEventFilter.actDeleteEventsExecute(Sender: TObject);
var
   MsgCaption : string;
   FNoOfRecordsToDelete : Integer;
begin
   FNoOfRecordsDeleted := 0;
   FNoOfRecordsToDelete := 0;

   if FDiaryDeleteType = dtNone then Exit;

   if FDiaryDeleteType = dtSelectedRows then
      FNoOfRecordsToDelete := EventGridTableView.DataController.GetSelectedCount
   else if ( FDiaryDeleteType = dtFilteredRows) then
      FNoOfRecordsToDelete := EventGridTableView.DataController.FilteredRecordCount;

   if ( FNoOfRecordsToDelete <= 0 ) then
       begin
          MessageDlg('There are no events to delete.',mtInformation,[mbOK],0);
          Exit;
       end;

   Update;
   MsgCaption := Format('"%d" events will be deleted.'+ cCRLFx2 + 'Are you sure you want to delete these events?',[FNoOfRecordsToDelete]);
   if Application.MessageBox(PChar(MsgCaption), 'Confirm Deletion', MB_YESNO + MB_DEFBUTTON2 + MB_ICONWARNING) = IDNO then
      begin
         Exit;
      end;

   Update;

   Screen.Cursor := crHourGlass;
   EventGridTableView.BeginUpdate;
   try
      EventGridTableView.DataController.ForEachRow((FDiaryDeleteType = dtSelectedRows), DeleteEvent);
   finally

      EventGridTableView.DataController.DataSource := nil;

      EventsQuery.Active := False;
      EventsQuery.Active := True;

      // It seems the only way to get the grid data to refresh without deleted events
      // is to set the datasource to nil and assign it again to dmFarmDiary.EventDiaryDataSource!
      EventGridTableView.DataController.DataSource := EventsQuerySource;

      EventGridTableView.EndUpdate;

      EventGridTableView.Controller.FocusedRowIndex := 0;

      if (FDiaryDeleteType = dtFilteredRows) then
         begin
            // clear any filter, restoring the orginal view
            EventGridTableView.DataController.Filter.Root.Clear;
            EventGridTableView.DataController.Filter.Active := False;
            EventGridTableView.Controller.FocusedRowIndex := 0;
         end;

      MessageDlg(Format('"%d" event(s) deleted.',[FNoOfRecordsDeleted]),mtInformation,[mbOK],0);

      FDiaryDeleteType := dtNone;
      Screen.Cursor := crDefault;
   end;
end;

procedure TEventFilter.DeleteEvent(ARowIndex: Integer;
  ARowInfo: TcxRowInfo);
var
   EventType, EventID, HerdId, EventDate : Variant;
begin
   with EventGridTableView.DataController do
      begin
          EventID := Values[ ARowInfo.RecordIndex, EventGridTableViewID.Index ];
          EventType := Values[ ARowInfo.RecordIndex, EventGridTableViewEventType.Index ];
          HerdId := Values[ ARowInfo.RecordIndex, EventGridTableViewHerdId.Index ];
          EventDate := Values[ ARowInfo.RecordIndex, EventGridTableViewEventDate.Index ];

          if ( VarIsNull(EventID) ) or (  VarIsNull(EventType) ) or
             ( VarIsNull(HerdId) ) or (  VarIsNull(EventDate) ) then Exit;
          if WinData.DeleteEvent(EventID, EventDate, HerdId, EventType) then
             Inc(FNoOfRecordsDeleted);
      end;
end;

procedure TEventFilter.btnDeleteSelectedEventsClick(Sender: TObject);
begin
   FDiaryDeleteType := dtSelectedRows;
   actDeleteEvents.Execute;
end;

procedure TEventFilter.deEventDatePropertiesChange(Sender: TObject);
begin
   FilterDiaryGrid();
end;

procedure TEventFilter.cmboDeletableEventTypesPropertiesChange(
  Sender: TObject);
begin
   FilterDiaryGrid();
end;

procedure TEventFilter.cmboEventTypeFilterPropertiesChange(
  Sender: TObject);
begin
   FilterDiaryGrid();
end;

procedure TEventFilter.FormDestroy(Sender: TObject);
begin
   EventsQuery.Active := False;
   FreeAndNil(ImageStore);
end;

procedure TEventFilter.actExitExecute(Sender: TObject);
begin
   Close;
end;

end.
