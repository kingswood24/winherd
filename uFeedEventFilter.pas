{
   23/11/12 [V5.1 R3.2] /MK Bug Fix - Code put in place to delete Feed Regime aswell as events but code was never implemented.

   30/11/13 [V5.2 R6.5] /MK Change - FeedEventsQuery - Change to SQL to only show animals that exists in a FeedRegimeID.

   07/05/15 [V5.4 R5.5] /MK Additional Feature - Added calculated field for NoDays to FeedEventsQuery and Grid.
                                               - Added Average footer for Cost/Day and Total footer for NoDays.
                            Change - Removed LactNo field - not useful for targeted clients - GL/L.Clerkin request.

   12/09/17 [V5.7 R3.0] /MK Change - Created Class Procedure for ShowTheForm.
                                   - Use animal filter in FeedEventsQuery.
                                   - Show uMessageScr if filter is not applied on the main screen or show all animals is not ticked.
                                     to explain to the user that only events for current animals in the herd are showing.
                                   - Changed SQL to show FeedGroupName.
                                   - Added calculated field for BatchGroupName which is then set by new function to return the batch group name of animal.
                                     Tried to use WinData.GroupManager.GetGroupData(WinData.GroupManager.GetGroupID) but it was too slow to gather the data.  
                                   - Changed pDateFilter to pDiaryFilter.
                                   - Added filters for feed and batch group to pDiaryFilter.
                                   - Created actions for Apply and Clear Filter.
                                   - Created a label to show that the filter was being applied or cleared as screen.cursor was not showing with begin/end full update.

   13/09/17 [V5.7 R3.0] /MK Bug Fix - DeleteEvent - No point adding the FeedRegimeID to the FeedRegimeArray if there is no FeedRegimeID.

   27/09/17 [V5.7 R3.1] /MK Change - FormActivate - Created a FilterInfo panel on the main screen that shows the current filter status.
                                   - Removed Batch Group column, filter and field from query to speed up the screen - GL/Sean Tynan request.
}

unit uFeedEventFilter;

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
  dxStatusBar, cxFilter, GenTypesConst, cxCustomData,
  Groups, uMessageScr;

type
  TfmFeedEventFilter = class(TForm)
    FeedEventGridTableView: TcxGridDBTableView;
    FeedEventGridLevel: TcxGridLevel;
    FeedEventGrid: TcxGrid;
    BarManager: TdxBarManager;
    ActionList1: TActionList;
    actExit: TAction;
    blbExit: TdxBarLargeButton;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    FeedEventsQuery: TQuery;
    FeedEventsQuerySource: TDataSource;
    FeedEventGridTableViewAllocDate: TcxGridDBColumn;
    FeedEventGridTableViewEventDesc: TcxGridDBColumn;
    pHerdId: TPanel;
    HerdCombo: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarLargeButton1: TdxBarLargeButton;
    ComponentPrinter: TdxComponentPrinter;
    FeedEventsGridPrinterLink: TdxGridReportLink;
    actPrintGrid: TAction;
    FeedEventGridTableViewAnimalNo: TcxGridDBColumn;
    FeedEventGridTableViewNatIDNum: TcxGridDBColumn;
    FeedEventGridTableViewHiddenAnimalNo: TcxGridDBColumn;
    FeedEventGridTableViewHiddenNatIDNum: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    pDiaryFilter: TPanel;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    deDateFrom: TcxDateEdit;
    deDateTo: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnFilterGrid: TcxButton;
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
    FeedEventGridTableViewID: TcxGridDBColumn;
    cmboDeletableFeedTypes: TcxComboBox;
    FeedEventGridTableViewHerdId: TcxGridDBColumn;
    FeedEventGridTableViewCostDay: TcxGridDBColumn;
    FeedEventGridTableViewQuantDay: TcxGridDBColumn;
    FeedEventGridTableViewEndDate: TcxGridDBColumn;
    FeedEventGridTableViewFeedRegimeID: TcxGridDBColumn;
    FeedEventGridTableViewFeedGroupID: TcxGridDBColumn;
    FeedEventGridTableViewNoDays: TcxGridDBColumn;
    FeedEventGridTableViewFeedGroupName: TcxGridDBColumn;
    FeedEventsQueryID: TIntegerField;
    FeedEventsQueryAllocDate: TDateField;
    FeedEventsQueryQuantDay: TFloatField;
    FeedEventsQueryCostDay: TFloatField;
    FeedEventsQueryEndDate: TDateField;
    FeedEventsQueryFeedRegimeID: TIntegerField;
    FeedEventsQueryFeedName: TStringField;
    FeedEventsQueryFeedGroupID: TIntegerField;
    FeedEventsQueryFeedGroupName: TStringField;
    FeedEventsQueryAnimalNo: TStringField;
    FeedEventsQuerySortAnimalNo: TStringField;
    FeedEventsQueryNatIDNum: TStringField;
    FeedEventsQuerySortNatID: TStringField;
    FeedEventsQueryAnimalID: TIntegerField;
    FeedEventsQueryHerdID: TIntegerField;
    FeedEventsQueryNoDays: TIntegerField;
    cmboFeedGroup: TcxComboBox;
    cxLabel2: TcxLabel;
    btnClearFilter: TcxButton;
    actApplyFilter: TAction;
    actClearFilter: TAction;
    lFilterApplying: TcxLabel;
    pFilterInfo: TPanel;
    lFilterInfo: TcxLabel;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    procedure actExitExecute(Sender: TObject);
    procedure FeedEventsQueryBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HerdComboPropertiesChange(Sender: TObject);
    procedure cbEventTypesPropertiesCloseUp(Sender: TObject);
    procedure actPrintGridExecute(Sender: TObject);
    procedure FeedEventsQuerySortNatIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FeedEventsQuerySortAnimalNoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure actExportToExcelFileExecute(Sender: TObject);
    procedure cbAllowGroupDeletionPropertiesChange(Sender: TObject);
    procedure btnResetDiaryFilterClick(Sender: TObject);
    procedure btnDeleteAllDiaryEventsClick(Sender: TObject);
    procedure actDeleteEventsExecute(Sender: TObject);
    procedure btnDeleteSelectedEventsClick(Sender: TObject);
    procedure deEventDatePropertiesChange(Sender: TObject);
    procedure cmboDeletableFeedTypesPropertiesChange(Sender: TObject);
    procedure FeedEventsQueryCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure actClearFilterExecute(Sender: TObject);
    procedure actApplyFilterExecute(Sender: TObject);
    procedure actClearFilterUpdate(Sender: TObject);
  private
    { Private declarations }
    FFeedGroups,
    FBatchGroups : array of Integer;
    FLastEventID,
    FNoOfRecordsDeleted : Integer;
    FDiaryDeleteType : TDiaryDeleteType;
    FFeedRegimeIDs : array of Integer;
    FFilterActive : Boolean;
    procedure FilterDiaryGrid();
    procedure DeleteEvent(ARowIndex: Integer; ARowInfo: TcxRowInfo);
    procedure AddToFeedRegimeArray(AFeedRegimeID: Integer);
    procedure DeleteFeedRegimes;
    procedure SetupGroupCombos;
    procedure GetFilterInfoCaption;
    function GetBatchGroupDescForAnimal (AAnimalID : Integer) : String;
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmFeedEventFilter: TfmFeedEventFilter;

const
  cApplyingFilterTxt = 'Applying Filter .......';
  cClearingFilterTxt = 'Clearing Filter .......';

implementation

uses uImageStore, DairyData, uHerdLookup, MenuUnit, KRoutines,
     Bullings, Services, PregDiag, UHealth, uCalvings, Weighing,
     uSalesDeaths, uPurchases, uTempMovements, uMPEvents, cxExport,
     cxExportGrid4Link, uDataBackup;

{$R *.DFM}

class procedure TfmFeedEventFilter.ShowTheForm;
begin
   with TfmFeedEventFilter.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmFeedEventFilter.FormCreate(Sender: TObject);
begin
   try
      lFilterApplying.Caption := '';
      Screen.Cursor := crHourGlass;
      ImageStore := TImageStore.Create(nil);
      SetupGroupCombos;
      HerdCombo.RepositoryItem := MenuForm.riHerdCombo;
      HerdCombo.EditValue := WinData.UserDefaultHerdID;
      pHerdId.Visible := False;
      cbAllowGroupDeletion.Checked := False;
      FilterDiaryGrid();
      pEventActions.Visible := False;
      lFilterApplying.Caption := cApplyingFilterTxt;
      FeedEventsQuery.Open;
      FFilterActive := False;
      Update;
   finally
      Screen.Cursor := crDefault;
      lFilterApplying.Caption := '';
   end;
end;

procedure TfmFeedEventFilter.FormActivate(Sender: TObject);
begin
   //   27/09/17 [V5.7 R3.1] /MK Change - Created a FilterInfo panel on the main screen that shows the current filter status.
   GetFilterInfoCaption;
   if ( not(WinData.ActiveFilter) ) and ( not(WinData.ShowAllAnimals) ) then
      TfmMessageScr.ShowTheForm(mtFeedEventDiary);
   OnActivate := nil;
end;

procedure TfmFeedEventFilter.FeedEventsQueryBeforeOpen(DataSet: TDataSet);
var
   iFeedGroup,
   iBatchGroup : Integer;
begin
   iFeedGroup := 0;
   iBatchGroup := 0;

   if ( cmboFeedGroup.ItemIndex > 0 ) then
      if ( cmboFeedGroup.Properties.Items.Objects[cmboFeedGroup.ItemIndex] <> nil ) then
          iFeedGroup := Integer(cmboFeedGroup.Properties.Items.Objects[cmboFeedGroup.ItemIndex]);

   Screen.Cursor := crHourGlass;
   FeedEventGridTableView.DataController.BeginFullUpdate;
   try
      FeedEventsQuery.OnCalcFields := nil;
      FeedEventsQuery.SQL.Clear;
      FeedEventsQuery.SQL.Add('SELECT FE.ID, FE.AllocDate, FE.QuantDay, FE.CostDay, FE.EndDate, FE.FeedRegimeID,');
      FeedEventsQuery.SQL.Add('       FT.Description FeedName,');
      FeedEventsQuery.SQL.Add('       FR.GroupID FeedGroupID,');
      FeedEventsQuery.SQL.Add('       FG.Description FeedGroupName,');
      FeedEventsQuery.SQL.Add('       A.ID AnimalID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.HerdID');
      FeedEventsQuery.SQL.Add('FROM FeedEvents FE');
      FeedEventsQuery.SQL.Add('RIGHT JOIN Animals A ON (A.ID = FE.AnimalID)');
      FeedEventsQuery.SQL.Add('RIGHT JOIN FeedTypes FT ON (FT.ID = FE.FeedType)');
      FeedEventsQuery.SQL.Add('LEFT JOIN FeedRegime FR ON (FR.ID = FE.FeedRegimeID)');
      FeedEventsQuery.SQL.Add('LEFT JOIN Grps FG ON ((FR.GroupID = FG.ID) AND (Upper(FG.GroupType) = "FEED"))');
      FeedEventsQuery.SQL.Add('WHERE (A.HerdID = :HerdID)');
      FeedEventsQuery.SQL.Add('AND   (FE.AnimalID IN (SELECT AF.AID FROM AFilters AF))');
      if ( deDateFrom.Date > 0 ) and ( deDateTo.Date > 0 ) then
         FeedEventsQuery.SQL.Add('AND   (FE.AllocDate Between ' + '''' + FormatDateTime(cUSDateStyle,deDateFrom.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,deDateTo.Date) + '''' + ')')
      else if ( deDateFrom.Date > 0 ) and ( deDateTo.Date <= 0 ) then
         FeedEventsQuery.SQL.Add('AND   (FE.AllocDate >= ' + '''' + FormatDateTime(cUSDateStyle,deDateFrom.Date) + ''')')
      else if ( deDateFrom.Date <= 0 ) and ( deDateTo.Date > 0 ) then
         FeedEventsQuery.SQL.Add('AND   (FE.AllocDate <= ' + '''' + FormatDateTime(cUSDateStyle,deDateTo.Date) + ''')' );
      if ( iFeedGroup > 0 ) then
         FeedEventsQuery.SQL.Add('AND   (FR.GroupID = '+IntToStr(iFeedGroup)+')');
      if ( iBatchGroup > 0 ) then
         FeedEventsQuery.SQL.Add('AND   (FE.AnimalID IN (SELECT GL.AnimalID FROM GrpLinks GL WHERE GL.GroupID = '+IntToStr(iBatchGroup)+'))');
      FeedEventsQuery.SQL.Add('ORDER BY FE.ID Desc');
      FeedEventsQuery.OnCalcFields := FeedEventsQueryCalcFields;
      FeedEventsQuery.Params[0].AsInteger := WinData.UserDefaultHerdID;
   finally
      FeedEventGridTableView.DataController.EndFullUpdate;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmFeedEventFilter.HerdComboPropertiesChange(Sender: TObject);
begin
   WinData.UserDefaultHerdID := HerdCombo.EditValue;
end;

procedure TfmFeedEventFilter.SetupGroupCombos;
var
   i : Integer;
begin
   cmboFeedGroup.Properties.Items.Clear;
   cmboFeedGroup.Properties.Items.AddObject('<Select Feed Group>', pointer(-1));
   cmboDeletableFeedTypes.Properties.Items.Clear;
   cmboDeletableFeedTypes.Properties.Items.AddObject('<Select Feed Group>', pointer(-1));

   SetLength(FFeedGroups, 0);

   if not (WinData.Groups.Active) then
      WinData.Groups.Active := True;

   with WinData.Groups do
      begin
         First;
         while not Eof do
            begin
               if ( UpperCase(FieldByName('GroupType').AsString) = 'FEED' ) then
                  cmboFeedGroup.Properties.Items.AddObject(FieldByName('Description').AsString, Pointer(FieldByName('ID').AsInteger));
               Next;
            end;
      end;

   cmboDeletableFeedTypes.Properties.Items.Clear;
   cmboDeletableFeedTypes.Properties.Items.AddObject('<Select Feed Group>', pointer(-1));
   for i := 0 to cmboFeedGroup.Properties.Items.Count-1 do
      cmboDeletableFeedTypes.Properties.Items.AddObject(cmboFeedGroup.Properties.Items[i], Pointer(cmboFeedGroup.Properties.Items[i]));
end;

procedure TfmFeedEventFilter.cbEventTypesPropertiesCloseUp(Sender: TObject);
begin
   FeedEventsQuery.Close;
   FeedEventsQuery.Open;
end;

procedure TfmFeedEventFilter.actPrintGridExecute(Sender: TObject);
begin
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   FeedEventsGridPrinterLink.Preview;
end;

procedure TfmFeedEventFilter.FeedEventsQuerySortNatIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   Text := Sender.DataSet.FieldByName('NatIDNum').AsString;
end;

procedure TfmFeedEventFilter.FeedEventsQuerySortAnimalNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   Text := Sender.DataSet.FieldByName('AnimalNo').AsString;
end;

procedure TfmFeedEventFilter.actExportToExcelFileExecute(Sender: TObject);
begin
   SaveDialog.InitialDir := ApplicationPath;
   if SaveDialog.Execute then
      begin
         if FileExists(SaveDialog.FileName) then
            if MessageDlg(cFileOverwrite,mtConfirmation,[mbYes,mbNo],0) = idNo then
               exit;

         ExportGrid4ToExcel(SaveDialog.FileName,FeedEventGrid);
         if FileExists(SaveDialog.FileName) then
            MessageDlg(Format(cFileCreated,[SaveDialog.FileName]),mtInformation,[mbOK],0)
         else
            MessageDlg(cFileCreateError,mtError,[mbOK],0);
      end;
end;

procedure TfmFeedEventFilter.FilterDiaryGrid;
var
   FilterByCol : Boolean;
   cxFilterCriteriaItemList : TcxFilterCriteriaItemList;
   FeedGroupID : Integer;
begin
   btnDeleteAllDiaryEvents.Enabled := ( deEventDate.Date > 0 ) or (cmboDeletableFeedTypes.ItemIndex > 0);

   FeedEventGridTableView.DataController.Filter.Root.Clear;
   FeedEventGridTableView.DataController.Filter.Active := False;
   FeedEventGridTableView.Controller.FocusedRowIndex := 0;

   BarManager.Bars[1].Visible := not cbAllowGroupDeletion.Checked;
   pEventActions.Visible := cbAllowGroupDeletion.Checked;

   FeedEventGridTableView.OptionsCustomize.ColumnGrouping := not cbAllowGroupDeletion.Checked;
   FeedEventGridTableView.OptionsView.GroupByBox := not cbAllowGroupDeletion.Checked;
   if cbAllowGroupDeletion.Checked then
      FeedEventGridTableView.DataController.Groups.ClearGrouping;

   if not cbAllowGroupDeletion.Checked then
      begin
         pMultipleEventDeletion.Height := 28;
         Update;
      end
   else
      begin
         pMultipleEventDeletion.Height := 122;
         Update;
         if ( deEventDate.Date > 0 ) then
            FeedEventGridTableView.DataController.Filter.AddItem(nil, FeedEventGridTableViewAllocDate, foEqual, deEventDate.Date, '');
         if ( cmboDeletableFeedTypes.ItemIndex > 0 ) then
            begin
               if ( cmboDeletableFeedTypes.Properties.Items.Objects[cmboDeletableFeedTypes.ItemIndex] <> nil ) then
                  begin
                     FeedGroupID := Integer(cmboDeletableFeedTypes.Properties.Items.Objects[cmboDeletableFeedTypes.ItemIndex]);
                     FeedEventGridTableView.DataController.Filter.AddItem(nil, FeedEventGridTableViewFeedGroupID, foEqual, FeedGroupID, '');
                  end
               else
                  begin
                     FeedEventGridTableView.DataController.Filter.Root.Clear;
                     FeedEventGridTableView.DataController.Filter.Active := False;
                     MessageDlg('Invalid feed group has been selected',mtError,[mbOk],0);
                     Exit;
                  end;
            end;
         FeedEventGridTableView.DataController.Filter.Active := True;
         FeedEventGridTableView.Controller.FocusedRowIndex := 0;
      end;
end;

procedure TfmFeedEventFilter.cbAllowGroupDeletionPropertiesChange(
  Sender: TObject);
begin
   if cbAllowGroupDeletion.Checked then
      begin
         deEventDate.SetFocus;
         if ( MessageDLG('Before using the block deletion a backup of your data'+cCRLF+
                         'is advised in case a mistake is made while deleting events.'+cCRLFx2+
                         'Do you want to backup your data now?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
          TfmDataBackup.execute(daBackup);
      end;

   Update;
   // re-open query - displaying appropriate event types (deletable , All)
   // if cbAllowGroupDeletion.checked = true - only deletable events will be displayed
   // if cbAllowGroupDeletion.checked = false - all events can be shown
   FeedEventsQuery.Active := False;
   FeedEventsQuery.Active := True;
   FilterDiaryGrid();

end;

procedure TfmFeedEventFilter.btnResetDiaryFilterClick(Sender: TObject);
begin
   deEventDate.Clear;
   cmboDeletableFeedTypes.ItemIndex := -1;
end;

procedure TfmFeedEventFilter.btnDeleteAllDiaryEventsClick(Sender: TObject);
begin
   FDiaryDeleteType := dtFilteredRows;
   actDeleteEvents.Execute;
end;

procedure TfmFeedEventFilter.actDeleteEventsExecute(Sender: TObject);
var
   MsgCaption : string;
   FNoOfRecordsToDelete : Integer;
begin
   FNoOfRecordsDeleted := 0;
   FNoOfRecordsToDelete := 0;

   if FDiaryDeleteType = dtNone then
      Exit;

   if FDiaryDeleteType = dtSelectedRows then
      FNoOfRecordsToDelete := FeedEventGridTableView.DataController.GetSelectedCount
   else if ( FDiaryDeleteType = dtFilteredRows) then
      FNoOfRecordsToDelete := FeedEventGridTableView.DataController.FilteredRecordCount;

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
   FeedEventGridTableView.BeginUpdate;
   try
      FeedEventGridTableView.DataController.ForEachRow((FDiaryDeleteType = dtSelectedRows), DeleteEvent);
      DeleteFeedRegimes;
   finally

      FeedEventGridTableView.DataController.DataSource := nil;

      FeedEventsQuery.Active := False;
      FeedEventsQuery.Active := True;

      // It seems the only way to get the grid data to refresh without deleted events
      // is to set the datasource to nil and assign it again to dmFarmDiary.EventDiaryDataSource!
      FeedEventGridTableView.DataController.DataSource := FeedEventsQuerySource;

      FeedEventGridTableView.EndUpdate;

      FeedEventGridTableView.Controller.FocusedRowIndex := 0;

      if ( FDiaryDeleteType = dtFilteredRows ) then
         begin
            // clear any filter, restoring the orginal view
            FeedEventGridTableView.DataController.Filter.Root.Clear;
            FeedEventGridTableView.DataController.Filter.Active := False;
            FeedEventGridTableView.Controller.FocusedRowIndex := 0;
         end;

      MessageDlg(Format('"%d" event(s) deleted.',[FNoOfRecordsDeleted]),mtInformation,[mbOK],0);

      FDiaryDeleteType := dtNone;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmFeedEventFilter.DeleteEvent(ARowIndex: Integer;
  ARowInfo: TcxRowInfo);
var
   EventType, EventID, HerdId, EventDate, FeedRegimeID : Variant;
begin
   with FeedEventGridTableView.DataController do
      begin
          EventID := Values[ ARowInfo.RecordIndex, FeedEventGridTableViewID.Index ];
          HerdId := Values[ ARowInfo.RecordIndex, FeedEventGridTableViewHerdId.Index ];
          EventDate := Values[ ARowInfo.RecordIndex, FeedEventGridTableViewAllocDate.Index ];
          FeedRegimeID := Values[ ARowInfo.RecordIndex, FeedEventGridTableViewFeedRegimeID.Index ];

          if ( VarIsNull(EventID) ) or ( VarIsNull(HerdId) ) or (  VarIsNull(EventDate) ) then Exit;
          if ( WinData.DeleteFeedEvent(EventID, EventDate, HerdId) ) then
             Inc(FNoOfRecordsDeleted);

          //   13/09/17 [V5.7 R3.0] /MK Bug Fix - No point adding the FeedRegimeID to the FeedRegimeArray if there is no FeedRegimeID.
          if ( VarIsNull(FeedRegimeID) ) then Exit;
          AddToFeedRegimeArray(FeedRegimeID);
      end;
end;

procedure TfmFeedEventFilter.btnDeleteSelectedEventsClick(Sender: TObject);
begin
   FDiaryDeleteType := dtSelectedRows;
   actDeleteEvents.Execute;
end;

procedure TfmFeedEventFilter.deEventDatePropertiesChange(Sender: TObject);
begin
   FilterDiaryGrid();
end;

procedure TfmFeedEventFilter.AddToFeedRegimeArray(AFeedRegimeID: Integer);
var
   i : Integer;
begin
   if ( AFeedRegimeID = 0 ) then Exit;
   if ( not(InArray(AFeedRegimeID,FFeedRegimeIDs)) ) then
      begin
         SetLength(FFeedRegimeIDs, Length(FFeedRegimeIDs) +1);
         FFeedRegimeIDs[Length(FFeedRegimeIDs)-1] := AFeedRegimeID;
      end;
end;

procedure TfmFeedEventFilter.DeleteFeedRegimes;
var
   qDeleteFeedEvent : TQuery;
   i : Integer;
begin
   if Length(FFeedRegimeIDs) = 0 then Exit;

   for i := Low(FFeedRegimeIDs) to High(FFeedRegimeIDs) do
      begin
         qDeleteFeedEvent := TQuery.Create(nil);

         with qDeleteFeedEvent do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT COUNT(ID) FROM FeedEvents WHERE FeedRegimeID = :FeedRegimeID');
               Params[0].AsInteger := FFeedRegimeIDs[i];
               Open;
               First;
               try
                  if ( Fields[0].AsInteger = 0 ) then
                      begin
                         SQL.Clear;
                         SQL.Add('DELETE FROM FeedRegime WHERE ID = :FeedRegimeID');
                         Params[0].AsInteger := FFeedRegimeIDs[i];
                         ExecSQL;
                      end;
               finally
               end;
            finally
               Free;
            end;
      end;
end;

procedure TfmFeedEventFilter.cmboDeletableFeedTypesPropertiesChange(
  Sender: TObject);
begin
   FilterDiaryGrid();
end;

procedure TfmFeedEventFilter.actApplyFilterExecute(Sender: TObject);
begin
   lFilterApplying.Caption := cApplyingFilterTxt;
   Application.ProcessMessages;
   Update;

   FeedEventGridTableView.DataController.BeginFullUpdate;
   Screen.Cursor := crHourGlass;

   deDateFrom.PostEditValue;
   deDateTo.PostEditValue;
   cmboFeedGroup.PostEditValue;
   FeedEventsQuery.Close;
   FeedEventsQuery.Open;
   FFilterActive := True;

   Screen.Cursor := crDefault;
   FeedEventGridTableView.DataController.EndFullUpdate;

   lFilterApplying.Caption := '';
   Application.ProcessMessages;
   Update;
end;

procedure TfmFeedEventFilter.actClearFilterExecute(Sender: TObject);
begin
   lFilterApplying.Caption := cClearingFilterTxt;
   Application.ProcessMessages;
   Update;

   FeedEventGridTableView.DataController.BeginFullUpdate;
   Screen.Cursor := crHourGlass;

   deDateFrom.Clear;
   deDateTo.Clear;
   cmboFeedGroup.ItemIndex := -1;
   FeedEventsQuery.Close;
   FeedEventsQuery.Open;
   FFilterActive := False;

   Screen.Cursor := crDefault;
   FeedEventGridTableView.DataController.EndFullUpdate;
   lFilterApplying.Caption := '';
   Application.ProcessMessages;
   Update;
end;

procedure TfmFeedEventFilter.actClearFilterUpdate(Sender: TObject);
begin
   actClearFilter.Enabled := FFilterActive;
end;

procedure TfmFeedEventFilter.FeedEventsQueryCalcFields(DataSet: TDataSet);
begin
   try
      if ( FeedEventsQueryEndDate.AsDateTime > 0 ) then
         if ( FeedEventsQueryEndDate.AsDateTime > FeedEventsQueryAllocDate.AsDateTime ) then
            FeedEventsQueryNoDays.AsInteger := Trunc(FeedEventsQueryEndDate.AsDateTime - FeedEventsQueryAllocDate.AsDateTime);
   except
   end;
end;

function TfmFeedEventFilter.GetBatchGroupDescForAnimal (AAnimalID : Integer) : String;
begin
   Result := '';
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT G.Description');
         SQL.Add('FROM Grps G');
         SQL.Add('WHERE Upper(G.GroupType) = "BATCH"');
         SQL.Add('AND   G.ID IN (SELECT GL.GroupID');
         SQL.Add('             FROM GrpLinks GL');
         SQL.Add('             WHERE GL.AnimalID = :AnimalID)');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) and ( Length(Fields[0].AsString) > 0 ) then
               Result := Fields[0].AsString;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmFeedEventFilter.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmFeedEventFilter.FormDestroy(Sender: TObject);
begin
   FeedEventsQuery.Active := False;
   FreeAndNil(ImageStore);
end;

procedure TfmFeedEventFilter.GetFilterInfoCaption;

   function GetExternalFilterString : String;
   begin
      // Get Group Filter only for now.
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Description');
            SQL.Add('FROM Grps');
            SQL.Add('WHERE Selected = True');
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               // Get first group selected.
               First;
               Result := 'Group Selected : '+Fields[0].AsString;
               // Add ... if there are more than one group selected.
               if ( RecordCount > 1 ) then
                  Result := Result + '...';
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   lFilterInfo.Caption := '';
   if ( not(WinData.ActiveFilter) ) and ( not(WinData.ShowAllAnimals) ) then
      lFilterInfo.Caption := 'Current Herd';
   if ( WinData.ShowAllAnimals ) then
      lFilterInfo.Caption := 'All Animals';
   if ( WinData.ActiveFilter ) and ( not(WinData.ShowAllAnimals) ) then
      lFilterInfo.Caption := GetExternalFilterString;
end;

end.
