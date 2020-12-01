{
   23/11/12 [V5.1 R1.2] /MK Bug Fix - StopFeedForAnimal - When code was added to update FeedStockQuantity the end date of the FeedEvent was never updated.

   19/09/17 [V5.7 R3.0] /MK Change - Moved the creation of TAnimalFeed table from ShowTheForm to FormCreate.
                                   - Moved GetAnimals to dbeAllocDateChange as when GetGroupRegime and dbcGroupPropertiesChange all set
                                     dbeAllocDate.Date to today so GetAnimals will be called anyway.
                                   - GetAnimals - Removed SQLText from qGroups and removed the Insert line.
                                                - SQL now gets animals from the group and adds them to TAnimalFeed if their not sold
                                                  or have a sale date less than the dbeAllocDate.Date.
                                   - Used consts for Status to be more description of what the integer value represents.
                                   - Removed TAnimalFeedBeforeInsert as GetAnimals now inserts records without SQL.
                                   - AllocateFeed - Feed Added - If animal is left herd after allocation date then give user information that it will be ended on left herd date.
                                                  - Feed Modified - Only get animals that are in TAnimalFeeds not GrpLinks table so that sold animals will not be fed or updated.

   22/09/17 [V5.7 R3.0] /MK Change - Changed FeedGroup component to a LookupComboBox instead of normal combo box.
                                   - FormCloseQuery - When the user closes the screen and there are added feeds that were not allocated, tell the user that these
                                                      added feeds need to be allocated or they will be deleted on close.
                            Additional Feature - New private form variable for FSelectedFeedGroup that is set when the user selects a feed group.

   25/09/17 [V5.7 R3.0] /MK Change - RemoveFeed, sbFeedAlloc - Do preliminary checks for selected group, empty feed regime and added feeds to a feed regime.
                                   - RemoveFeed - Do check that feed regime is allocated and that EndDate is on/after Allocation Date.

   27/09/17 [V5.7 R3.1] /MK Bug Fix - FeedTypeCloseUp - Need to refresh WinData.FeedTypes and QueryFeedTypes after uFeedTypes closes.

   10/10/17 [V5.7 R3.8] /MK Bug Fix - AllocateFeed - Extra check for existing feeds in a regime that are not already allocated but there is no need for this extra check.

   23/11/17 [V5.7 R5.7] /MK Additional Feature - Added ActionList and actions for Allocate and Remove feeds so that both buttons can be disabled if no feeds for group.    
}

unit uFeedAlloc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, RXCtrls, ComCtrls, ToolWin, ExtCtrls, DBCtrls,
  DBTables, Db, StdCtrls, Mask, DBCGrids, kwDBNavigator,
  ToolEdit, RXLookup, RxDBComb, CurrEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, DairyData, uHerdLookup,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList;

type
  TfFeedAlloc = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    DBGGroups: TRxDBGrid;
    Panel4: TPanel;
    DBGAnimals: TRxDBGrid;
    qRegime: TQuery;
    qGroups: TQuery;
    GenQuery: TQuery;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    TAnimalFeed: TTable;
    dsAnimalFeed: TDataSource;
    TAnimalFeedAnimalID: TIntegerField;
    TAnimalFeedAnimalNo: TStringField;
    TAnimalFeedNatID: TStringField;
    TAnimalFeedDateOfBirth: TDateField;
    TAnimalFeedSex: TStringField;
    TAnimalFeedQuantDay: TFloatField;
    TAnimalFeedCostDay: TFloatField;
    TAnimalFeedLact: TIntegerField;
    Label4: TLabel;
    Label2: TLabel;
    FeedRegime: TTable;
    FeedRegimeQuantDay: TFloatField;
    FeedRegimeCostDay: TFloatField;
    FeedRegimeStatus: TIntegerField;
    dsFeedRegime: TDataSource;
    FeedRegimeID: TAutoIncField;
    FeedRegimeGroupID: TIntegerField;
    FeedRegimeFeedType: TIntegerField;
    FeedRegimeAllocDate: TDateField;
    FeedRegimeCategory: TStringField;
    FeedRegimeDescription: TStringField;
    QueryFeedCategories: TQuery;
    FeedRegimeFeedTypeDesc: TStringField;
    QueryFeedTypes: TQuery;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    FeedRegimeNew: TBooleanField;
    Panel5: TPanel;
    Label8: TLabel;
    Label3: TLabel;
    dbeAllocDate: TDateEdit;
    Label1: TLabel;
    FeedType: TRxDBLookupCombo;
    RemoveFeed: TRxSpeedButton;
    sbFeedAlloc: TRxSpeedButton;
    FeedGroup: TcxLookupComboBox;
    FeedAllocActionList: TActionList;
    actRemoveFeed: TAction;
    actAllocateFeed: TAction;
    procedure FormShow(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FeedTypeCloseUp(Sender: TObject);
    procedure GetGroupRegime(Sender: TObject);
    procedure FeedTypeChange(Sender: TObject);
    procedure dbeAllocDateChange(Sender: TObject);
    procedure GetAnimals;
    procedure FeedUpdate(New : boolean);
    procedure DBGGroupsCellClick(Column: TColumn);
    procedure DBGGroupsKeyPress(Sender: TObject; var Key: Char);
    procedure FeedRegimeAfterDelete(DataSet: TDataSet);
    procedure FeedRegimeAfterPost(DataSet: TDataSet);
    procedure FeedRegimeQuantDayOnChange(Field: TField);
    procedure FeedRegimeCostDayOnChange(Field: TField);
    procedure sbFeedAllocClick(Sender: TObject);
    procedure dbeAllocDateAcceptDate(Sender: TObject; var ADate: TDateTime;
      var Action: Boolean);
    procedure RemoveFeedClick(Sender: TObject);
    procedure DBGGroupsGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbcGroupPropertiesChange(Sender: TObject);
    procedure FeedGroupPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbExitClick(Sender: TObject);
    procedure actRemoveFeedExecute(Sender: TObject);
    procedure actAllocateFeedExecute(Sender: TObject);
    procedure actRemoveFeedUpdate(Sender: TObject);
    procedure actAllocateFeedUpdate(Sender: TObject);
  private
    { Private declarations }
    MyDataSource : TDataSource;
    RegimeChange : Boolean;
    FSelectedFeedGroup : Integer;
    procedure AllocateFeed;
    function FeedAllocatedInRegime(const GroupID, FeedType : Integer;
      const AllocDate : TDateTime; const FeedRegimeID : Integer) : Boolean;
    procedure EndFeedFromRegime(const GroupID, FeedType : Integer;
      const AllocDate, EndDate : TDateTime; const FeedRegimeID : Integer);
    procedure StopFeedForAnimal(const AAnimalId : Integer; const AStopDate : TDateTime;
        const AFeedRegimeId : Integer);
    procedure DeleteAllAddedFeedsFromRegime;
    procedure AddToFeedRegime;
    procedure AmendFeedRegimeAddedStartDate;
  public
    { Public declarations }
  end;

procedure ShowTheForm(Ind : Integer);

implementation
uses
    uFilters,
    GenTypesConst,
    uFeedTypes,
    KRoutines;

var
  fFeedAlloc: TfFeedAlloc;

const
  cAdded = 0;
  cCurrentlyAllocated = 1;
  cModified = 2;

{$R *.DFM}

procedure TfFeedAlloc.FormCreate(Sender: TObject);
begin
   // assign fields to temporary animal/feed table
   with TAnimalFeed do
      begin
         Close;
         TableName := 'TAnimalFeed';
         with FieldDefs do
            begin
               Clear;
               Add('AnimalID',ftInteger,0,False);
               Add('Lact',ftInteger,0,False);
               Add('AnimalNo',ftString,10,False);
               Add('NatID',ftString,20,False);
               Add('DateOfBirth',ftDate,0,False);
               Add('Sex',ftString,10,False);
               Add('QuantDay',ftFloat,0,False);
               Add('CostDay',ftFloat,0,False);
               Add('Batch',ftInteger,0,False);
            end;
         CreateTable;
         Open;
      end;
   WinData.Groups.Cancel;
   QueryFeedCategories.Active := True;
   QueryFeedTypes.Active := True;

   FeedGroup.Properties.ListSource := HerdLookup.dsFeedGroups;
   FeedGroup.Properties.ListFieldNames := 'Description';
   FeedGroup.Properties.KeyFieldNames := 'ID';
   FeedGroup.Properties.ListColumns[0].Caption := 'Name';
   FeedGroup.Properties.ListOptions.ShowHeader := False;

   HerdLookup.qFeedGroups.Close;
   HerdLookup.qFeedGroups.Open;

   FSelectedFeedGroup := 0;
end;

procedure ShowTheForm(Ind : Integer);
begin
   try
      // create temporary feed regime table
      with TfFeedAlloc.Create(nil) do
         try
            FeedRegime.Open;
            FeedRegime.Filter := Format('GroupID = %d',[-1]);
            FeedRegime.Filtered := True;
            RegimeChange := False;
            ShowModal;
         finally
            TAnimalFeed.Close;
            TAnimalFeed.EmptyTable;
            TAnimalFeed.DeleteTable;
            TAnimalFeed.Free;
            FeedRegime.Close;
            Free;
         end;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
end;

procedure TfFeedAlloc.FormShow(Sender: TObject);
begin
   RegimeChange := False;
end;

procedure TfFeedAlloc.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('FeedAlloc.htm');
end;

procedure TfFeedAlloc.FeedTypeCloseUp(Sender: TObject);
begin
   // blank record on open
   if ( FeedType.Value = '0' ) then
      begin
         uFeedTypes.ShowTheForm(0,TRUE);
         //   27/09/17 [V5.7 R3.1] /MK Bug Fix - Need to refresh WinData.FeedTypes and QueryFeedTypes after uFeedTypes closes.
         WinData.FeedTypes.Close;
         WinData.FeedTypes.Open;
         QueryFeedTypes.Close;
         QueryFeedTypes.Open;
      end;
   FeedType.Value := '0';
end;

procedure TfFeedAlloc.GetGroupRegime(Sender: TObject);
begin
   FeedRegime.Filter := Format('GroupID = %d',[WinData.Groups.fieldbyname('ID').AsInteger]);
   FeedRegime.Filtered := True;
   FeedRegime.Refresh;
   // display existing date
   dbgGroups.Refresh;
   // default allocation date to today
   dbeAllocDate.Date := Date;
   // reset boolean
   Regimechange := false;
   // get feed quantity/cost per animal
   FeedUpdate(True);
end;

procedure TfFeedAlloc.GetAnimals;
var
   dAnimalLeftHerdDate : TDateTime;
begin
   // Empty table first
   TAnimalFeed.Close;
   TAnimalFeed.EmptyTable;
   TAnimalFeed.Open;
   TAnimalFeed.Refresh;
   dbgAnimals.Refresh;

   //   19/09/17 [V5.7 R3.0] /MK Change - Removed SQLText from qGroups and removed the Insert line.
   //                                   - SQL now gets animals from the group and adds them to TAnimalFeed if their not sold
   //                                     or have a sale date less than the dbeAllocDate.Date.

   // fill animal table from group
   qGroups.Close;
   qGroups.SQL.Clear;
   qGroups.SQL.Add('SELECT A.ID, A.LactNo, A.AnimalNo, A.NatIDNum, A.DateOfBirth, A.Sex');
   qGroups.SQL.Add('FROM GrpLinks GL');
   qGroups.SQL.Add('LEFT JOIN Animals A ON (A.ID = GL.AnimalID)');
   qGroups.SQL.Add('WHERE GL.GroupID = :GroupID');
   qGroups.Params[0].AsInteger := FSelectedFeedGroup;
   qGroups.Open;
   qGroups.First;
   while ( not(qGroups.Eof) ) do
      begin
         // Make sure that the animals on the grid are in the herd prior to the date selected.
         dAnimalLeftHerdDate := WinData.EventDataHelper.GetAnimalSaleEventDate(qGroups.FieldByName('ID').AsInteger);
         if ( dAnimalLeftHerdDate = 0 ) then
            dAnimalLeftHerdDate := WinData.EventDataHelper.GetAnimalDeathEventDate(qGroups.FieldByName('ID').AsInteger);
         if ( dAnimalLeftHerdDate = 0 ) or ( (dAnimalLeftHerdDate > 0) and (dbeAllocDate.Date < dAnimalLeftHerdDate) ) then
            begin
               TAnimalFeed.Append;
               TAnimalFeed.FieldByName('AnimalID').AsInteger := qGroups.FieldByName('ID').AsInteger;
               TAnimalFeed.FieldByName('Lact').AsInteger := qGroups.FieldByName('LactNo').AsInteger;
               TAnimalFeed.FieldByName('AnimalNo').AsString := qGroups.FieldByName('AnimalNo').AsString;
               TAnimalFeed.FieldByName('NatID').AsString := qGroups.FieldByName('NatIDNum').AsString;
               TAnimalFeed.FieldByName('DateOfBirth').AsDateTime := qGroups.FieldByName('DateOfBirth').AsDateTime;
               TAnimalFeed.FieldByName('Sex').AsString := qGroups.FieldByName('Sex').AsString;
            end;
         qGroups.Next;
      end;

   TAnimalFeed.Refresh;
   dbgAnimals.refresh;
end;

procedure TfFeedAlloc.FeedUpdate(New : boolean);
var
   FeedType : integer;
begin
   // get current feed type
   FeedType := 0;
   if ( FeedRegime.FieldByName('FeedType').AsInteger > 0 ) then
      begin
         // stop grid scrolling
         dsAnimalFeed.DataSet.DisableControls;
         if (WinData.FeedTypes.Locate('ID',FeedRegime.FieldByName('FeedType').AsInteger,[])) then
            begin
               FeedType := WinData.FeedTypes.FieldByName('ID').AsInteger;
               // only do this on group change
               // get existing animal feed events info for feed type
               with GenQuery do
                  begin
                     close;
                     SQL.Clear;
                     SQL.Add('SELECT T.AnimalNo AnimalNo, F.QuantDay, F.CostDay');
                     SQL.Add('FROM   TAnimalFeed T, FeedEvents F');
                     SQL.Add('WHERE  T.AnimalID = F.AnimalID');
                     SQL.Add('AND    F.FeedType = ' + IntToStr(FeedType) + ' ');
                     SQL.Add('AND    F.EndDate IS NULL');
                     open;
                  end;
               // update table
               GenQuery.First;
               // if no records, or amending existing, use defaults from regime table
               if (GenQuery.EOF OR NOT New) then
                  begin
                     TAnimalFeed.First;
                     while NOT TAnimalFeed.EOF do
                        begin
                           TAnimalFeed.Edit;
                           TAnimalFeed.FieldByName('QuantDay').Value := FeedRegime.FieldByName('QuantDay').Value;
                           TAnimalFeed.FieldByName('CostDay').Value  := FeedRegime.FieldByName('CostDay').Value;
                           TAnimalFeed.Post;
                           TAnimalFeed.Next;
                        end;
                  end
               // else insert data
               else
                  begin
                     while NOT GenQuery.EOF do
                        begin
                           // assign existing feed data
                           if (TAnimalFeed.Locate('AnimalNo',GenQuery.FieldByName('AnimalNo').AsString,[])) then
                              begin
                                 TAnimalFeed.Edit;
                                 TAnimalFeed.FieldByName('QuantDay').Value := GenQuery.FieldByName('QuantDay').Value;
                                 TAnimalFeed.FieldByName('CostDay').Value  := GenQuery.FieldByName('CostDay').Value;
                                 TAnimalFeed.Post;
                              end;
                           GenQuery.Next;
                        end;
                  end;
            end;
         dsAnimalFeed.DataSet.EnableControls;
      end
   else
      // blank calc fields
      begin
         dsAnimalFeed.DataSet.DisableControls;
         TAnimalFeed.First;
         while NOT TAnimalFeed.EOF do
            begin
               TAnimalFeed.Edit;
               TAnimalFeed.FieldByName('QuantDay').Value := 0;
               TAnimalFeed.FieldByName('CostDay').Value  := 0;
               TAnimalFeed.Post;
               TAnimalFeed.Next;
            end;
         dsAnimalFeed.DataSet.EnableControls;
      end;
   TAnimalFeed.Refresh;
   dbgAnimals.refresh;
end;

procedure TfFeedAlloc.FeedTypeChange(Sender: TObject);
var
   GroupID : Integer;
begin
   if ( FeedType.Value = '0' ) then Exit;

   if ( FSelectedFeedGroup = 0 ) then
      begin
         MessageDlg('No feed group selected.'+cCRLF+
                    'Please select a feed group.',mtError,[mbOK],0);
         FeedType.Value := '0';
         SysUtils.Abort;
      end;

   if ( dbeAllocDate.Date <= 0 ) then
      MessageDlg('Allocation date is required',mtError,[mbok],0);

   AddToFeedRegime;

   // set focus to regime grid
   DeFocusControl(FeedType,True);
   dbgGroups.SetFocus;
end;

procedure TfFeedAlloc.dbeAllocDateChange(Sender: TObject);
begin
   //AmendFeedRegimeAddedStartDate;
   GetAnimals;
   if ( FeedRegime.Filtered ) and ( FeedRegime.RecordCount > 0 ) then
      FeedUpdate(False);
end;

procedure TfFeedAlloc.DBGGroupsCellClick(Column: TColumn);
begin
   // update animal grid feed details on feed type change
   FeedUpdate(False);
end;

procedure TfFeedAlloc.DBGGroupsKeyPress(Sender: TObject; var Key: Char);
begin
   // update animal grid feed details on feed type change
   FeedUpdate(False);
end;

procedure TfFeedAlloc.FeedRegimeAfterDelete(DataSet: TDataSet);
begin
   // update animal grid feed details on feed type delete
   FeedUpDate(False);
end;

procedure TfFeedAlloc.FeedRegimeAfterPost(DataSet: TDataSet);
begin
   RegimeChange := True;
   // update animal grid feed details
   FeedUpdate(False);

end;

procedure TfFeedAlloc.FeedRegimeQuantDayOnChange(Field: TField);
begin
   // recalculate cost per day
   if WinData.FeedTypes.Fieldbyname('DefCostTon').AsFloat > 0 then
      FeedRegime.fieldbyname('CostDay').AsFloat := ( (WinData.FeedTypes.Fieldbyname('DefCostTon').AsFloat/1000) *
                                                     (FeedRegime.fieldbyname('QuantDay').AsFloat) );
   // stop scrolling
   dsAnimalFeed.DataSet.DisableControls;
   // update animal grid
   TAnimalFeed.First;
   while NOT TAnimalFeed.EOF do
      begin
         TAnimalFeed.Edit;
         TAnimalFeed.FieldByName('QuantDay').Value := FeedRegime.FieldByName('QuantDay').Value;
         TAnimalFeed.FieldByName('CostDay').Value  := FeedRegime.FieldByName('CostDay').Value;
         TAnimalFeed.Post;
         TAnimalFeed.Next;
      end;
   dsAnimalFeed.DataSet.EnableControls;
   TAnimalFeed.Refresh;
   dbgAnimals.refresh;
   if ( FeedRegime.FieldByName('Status').AsInteger = cCurrentlyAllocated ) then
      FeedRegime.FieldByName('Status').AsInteger := cModified;
end;

procedure TfFeedAlloc.FeedRegimeCostDayOnChange(Field: TField);
begin
   // stop scrolling
   dsAnimalFeed.DataSet.DisableControls;
   // update animal grid
   TAnimalFeed.First;
   while NOT TAnimalFeed.EOF do
      begin
         TAnimalFeed.Edit;
         TAnimalFeed.FieldByName('QuantDay').Value := FeedRegime.FieldByName('QuantDay').Value;
         TAnimalFeed.FieldByName('CostDay').Value  := FeedRegime.FieldByName('CostDay').Value;
         TAnimalFeed.Post;
         TAnimalFeed.Next;
      end;
   dsAnimalFeed.DataSet.EnableControls;
   TAnimalFeed.Refresh;
   dbgAnimals.refresh;
   if ( FeedRegime.FieldByName('Status').AsInteger = cCurrentlyAllocated ) then
      FeedRegime.FieldByName('Status').AsInteger := cModified;
end;

procedure TfFeedAlloc.AllocateFeed;

   function AnimalLeftHerdDate (AAnimalID : Integer) : TDateTime;
   begin
      Result := 0;
      Result := WinData.EventDataHelper.GetAnimalSaleEventDate(AAnimalID);
      if ( Result = 0 ) then
         Result := WinData.EventDataHelper.GetAnimalDeathEventDate(AAnimalID);
   end;

var
   dAnimalLeftHerdDate : TDateTime;

begin
   if ( FSelectedFeedGroup = 0 ) then
      begin
         MessageDlg('No feed group selected.'+cCRLF+
                    'Please select a feed group.',mtError,[mbOK],0);
         Exit;
      end;

   if ( FeedRegime.RecordCount = 0 ) then
      begin
         MessageDlg('There are no feeds in the Current Feed Regime.',mtError,[mbOK],0);
         Exit;
      end;

   // check details are correct
   if ( MessageDlg('Are all the feed details correct?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
      begin
         // save temp regime details to tables
         FeedRegime.First;
         while ( not(FeedRegime.Eof) ) do
            begin
               if ( FeedRegimeStatus.AsInteger = cModified ) then
                  begin
                     // Update the current regime details
                     with GenQuery do
                        begin
                           Close;
                           SQL.Clear;
                           SQL.Add('SELECT ID, AnimalID, AllocDate');
                           SQL.Add('FROM FeedEvents');
                           SQL.Add('WHERE (FeedType = :AFeedType)');
                           SQL.Add('AND   (AllocDate = :AAllocDate)');
                           SQL.Add('AND   (EndDate IS NULL)');
                           //   19/09/17 [V5.7 R3.0] /MK Change - Only get animals that are in TAnimalFeeds not GrpLinks table so that sold animals will not be fed or updated.
                           SQL.Add('AND   (AnimalID IN ');
                           SQL.Add('                  (SELECT AnimalID ');
                           SQL.Add('                   FROM TAnimalFeed))');
                           Params[0].AsInteger := FeedRegimeFeedType.AsInteger;
                           Params[1].AsDateTime := FeedRegimeAllocDate.AsDateTime;
                           Open;
                           try
                              First;
                              while ( not(Eof) ) do
                                 begin
                                    if WinData.FeedEvents.Locate('ID', GenQuery.FieldByName('ID').AsInteger, []) then
                                       begin
                                          WinData.FeedEvents.Edit;
                                          WinData.FeedEvents.FieldByName('QuantDay').AsFloat := FeedRegime.FieldByName('QuantDay').AsFloat;
                                          WinData.FeedEvents.FieldByName('CostDay').AsFloat := FeedRegime.FieldByName('CostDay').AsFloat;
                                          WinData.FeedEvents.Post;
                                       end;
                                    Next;
                                 end;
                           finally
                              Close;
                           end
                        end;
                  end
               else if ( FeedRegimeStatus.AsInteger = cAdded ) then
                  begin
                     // save feedevent per feed per animal
                     with TAnimalFeed do
                        begin
                           First;
                           // loop for each animal
                           while ( not(Eof) ) do
                              begin
                                 // new feed events
                                 if (WinData.LookUpDamSire.Locate('ID',TAnimalFeed.FieldByName('AnimalID').AsInteger,[])) then
                                    begin
                                       WinData.FeedEvents.Append;
                                       WinData.FeedEvents.FieldByName('AnimalID').AsInteger := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                       WinData.FeedEvents.FieldByName('Lact').AsInteger := WinData.LookUpDamSire.FieldByName('LactNo').AsInteger;
                                       if ( WinData.FeedTypes.Locate('ID',FeedRegime.FieldByName('FeedType').AsInteger,[]) ) then
                                          WinData.FeedEvents.FieldByName('FeedType').AsInteger := WinData.FeedTypes.FieldByName('ID').AsInteger;

                                       // fix for feed event b4 purchase date/date of birth - 27/11/00 - kr
                                       if ( WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([TAnimalFeed.FieldByName('AnimalID').AsInteger,cPurchaseEvent]),[]) ) then
                                          begin
                                             if ( WinData.CheckEvents.FieldByName('EventDate').AsDateTime > FeedRegime.FieldByName('AllocDate').AsDateTime ) then
                                                WinData.FeedEvents.FieldByName('AllocDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
                                             else
                                                WinData.FeedEvents.FieldByName('AllocDate').AsDateTime := FeedRegime.FieldByName('AllocDate').AsDateTime;
                                          end
                                       else if ( WinData.LookUpDamSire.FieldByName('DateOfBirth').AsDateTime > FeedRegime.FieldByName('AllocDate').AsDateTime ) then
                                          WinData.FeedEvents.FieldByName('AllocDate').AsDateTime := WinData.LookUpDamSire.FieldByName('DateOfBirth').AsDateTime
                                       else
                                          WinData.FeedEvents.FieldByName('AllocDate').AsDateTime := FeedRegime.FieldByName('AllocDate').AsDateTime;

                                       WinData.FeedEvents.FieldByName('QuantDay').AsFloat := FeedRegime.FieldByName('QuantDay').AsFloat;
                                       WinData.FeedEvents.FieldByName('CostDay').AsFloat := FeedRegime.FieldByName('CostDay').AsFloat;
                                       WinData.FeedEvents.FieldByName('FeedRegimeID').AsInteger := FeedRegime.FieldByName('ID').AsInteger;

                                       //   19/09/17 [V5.7 R3.0] /MK Change - If animal is left herd after allocation date then give user information that it will be ended on left herd date.
                                       dAnimalLeftHerdDate := AnimalLeftHerdDate(TAnimalFeed.FieldByName('AnimalID').AsInteger);
                                       if ( dAnimalLeftHerdDate > 0 ) and
                                          ( dAnimalLeftHerdDate > FeedRegime.FieldByName('AllocDate').AsDateTime ) then
                                          begin
                                             MessageDlg('This animal has left the herd after the allocation date.'+cCRLF+
                                                        'The program will use the animals left herd date as the end feed date.',mtInformation,[mbOK],0);
                                             WinData.FeedEvents.FieldByName('EndDate').AsDateTime := dAnimalLeftHerdDate;
                                          end;
                                       WinData.FeedEvents.Post;
                                    end;
                                 TAnimalFeed.Next;
                              end;
                        end;
                  end;
               FeedRegime.Edit;
               FeedRegime.FieldByName('Status').AsInteger := cCurrentlyAllocated;
               FeedRegimeNew.AsBoolean := False;
               FeedRegime.Post;

               FeedRegime.Next;
            end;
      end;
   // reset boolean
   RegimeChange := False;
end;

procedure TfFeedAlloc.sbFeedAllocClick(Sender: TObject);
begin
   AllocateFeed;
end;

procedure TfFeedAlloc.dbeAllocDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
   if ADate <= 0 then
      ADate := Date;
end;

function TfFeedAlloc.FeedAllocatedInRegime(const GroupID, FeedType : Integer;
   const AllocDate : TDateTime; const FeedRegimeID : Integer) : Boolean;
begin
   // To Delete feed from the current regime,
   // make sure its not used in another regime
   Result := False;

   if ( GroupID <= 0 ) or (FeedType <= 0 ) or (AllocDate <= 0 ) then
      begin
         Exit;
      end;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Count(ID) CID From FeedEvents Where FeedRegimeID=:FID');
         Params[0].AsInteger := FeedRegimeID;
         Open;
         Result := (Fields[0].AsInteger>0);
      finally
         Free;
      end;

   if not Result then
      begin
         GenQuery.Sql.Clear;
         GenQuery.Sql.Add('Select AnimalID');
         GenQuery.Sql.Add('From FeedEvents');
         GenQuery.Sql.Add('Where (FeedType = :AFeedType)');
         GenQuery.Sql.Add('And   (AllocDate = :AAllocDate)');
         GenQuery.Sql.Add('And   (EndDate IS NULL)');
         GenQuery.Sql.Add('And AnimalID IN ');
         GenQuery.Sql.Add('    (Select AnimalID From GrpLinks Where (GroupID = :AGroupID))');
         GenQuery.Params[0].AsInteger := FeedType;
         GenQuery.Params[1].AsDateTime := AllocDate;
         GenQuery.Params[2].AsInteger := GroupID;
         GenQuery.Open;
         try
            GenQuery.First;
            Result := GenQuery.RecordCount > 0;
         finally
            GenQuery.Close;
         end;
      end;
end;

procedure TfFeedAlloc.RemoveFeedClick(Sender: TObject);
var
   AllocDate, EndDate : TDateTime;
   GroupID, FeedType, FeedStatus : Integer;
   FeedRegimeID : Integer;
begin
   if ( FSelectedFeedGroup = 0 ) then
      begin
         MessageDlg('No feed group selected.'+cCRLF+
                    'Please select a feed group.',mtError,[mbOK],0);
         Exit;
      end;

   if ( FeedRegime.RecordCount = 0 ) then
      begin
         MessageDlg('There are no feeds in the Current Feed Regime.',mtError,[mbOK],0);
         Exit;
      end;

   EndDate := dbeAllocDate.Date; // Store the current date as the end/stop date of the feed in regime.

   GroupID := FeedRegime.FieldByName('GroupID').AsInteger;
   FeedType := FeedRegime.FieldByName('FeedType').AsInteger;
   AllocDate := FeedRegime.FieldByName('AllocDate').AsDateTime;
   FeedRegimeID := FeedRegime.FieldByName('ID').AsInteger;
   FeedStatus := FeedRegime.FieldByName('Status').AsInteger;

   //   25/09/17 [V5.7 R3.0] /MK Change - Do check that feed regime is allocated and that EndDate is on/after Allocation Date.
   if ( FeedStatus <> cAdded ) and ( EndDate < AllocDate ) then
      begin
         MessageDlg(Format('Feed end date must be on/after feed allocation date %s',[FormatDate(AllocDate,dsIrish)]),mtError,[mbOk],0);
         Exit;
      end;

   if ( FeedAllocatedInRegime(GroupID, FeedType, AllocDate, FeedRegimeID) ) then
      begin
         if ( MessageDlg('This feed is part of the current regime. Do you want to stop feeding it?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            EndFeedFromRegime( GroupID, FeedType, AllocDate, dbeAllocDate.Date, FeedRegimeID);
      end
   else if ( MessageDlg('This will delete feed from current regime, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
      FeedRegime.Delete;
end;

procedure TfFeedAlloc.EndFeedFromRegime(const GroupID, FeedType : Integer;
  const AllocDate, EndDate : TDateTime; const FeedRegimeID : Integer);
var
   EndRegimeUsingRegimeID : Boolean;
begin

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Count(ID) CID From FeedEvents Where FeedRegimeID=:FID');
         Params[0].AsInteger := FeedRegimeID;
         Open;
         EndRegimeUsingRegimeID := (Fields[0].AsInteger>0);
      finally
         Free;
      end;

   if ( EndRegimeUsingRegimeID ) then
      begin
         with GenQuery do
            begin
               SQL.Clear;
               //GenQuery.Sql.Add('Update FeedEvents F Set F.EndDate =:AEndDate ');
               SQL.Add('SELECT F.AnimalID');
               SQL.Add('FROM FeedEvents F');
               SQL.Add('WHERE F.AnimalID IN ');
               SQL.Add('    (SELECT G.AnimalID FROM GrpLinks G WHERE G.GroupID =:AGroupID )');
               SQL.Add('AND ( F.EndDate IS NULL) ');
               SQL.Add('AND ( F.FeedRegimeID=:FID) ');
               Params[0].AsInteger := GroupID;
               Params[1].AsInteger := FeedRegimeID;
               Open;
               try
                  First;
                  while not EOF do
                     begin
                        StopFeedForAnimal(Fields[0].AsInteger,EndDate,FeedRegimeID);
                        Next;
                     end;
               finally
                  Close;
               end;
            end;
      end
   else
      begin
         GenQuery.Sql.Clear;
         GenQuery.Sql.Add('Update FeedEvents F Set F.EndDate =:AEndDate ');
         GenQuery.Sql.Add('Where F.AnimalID IN ');
         GenQuery.Sql.Add('    (Select G.AnimalID From GrpLinks G Where G.GroupID =:AGroupID )');
         GenQuery.Sql.Add('And ( F.AllocDate =:AAllocDate) ');
         GenQuery.Sql.Add('And ( F.FeedType =:AFeedType) ');
         GenQuery.Params[0].AsDateTime := EndDate;
         GenQuery.Params[1].AsInteger := GroupID;
         GenQuery.Params[2].AsDateTime := AllocDate;
         GenQuery.Params[3].AsInteger := FeedType;
         GenQuery.ExecSQL;
      end;

   GenQuery.Sql.Clear;
   GenQuery.Sql.Add('Delete From FeedRegime F ');
   GenQuery.Sql.Add('Where F.ID =:FID');
   GenQuery.Params[0].AsInteger := FeedRegimeID;
   GenQuery.ExecSQL;

   DBGGroups.DataSource.DataSet.Refresh;
end;

procedure TfFeedAlloc.DBGGroupsGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
   if ( DBGGroups.Datasource.DataSet.FieldByName('Status').AsInteger = cAdded ) then
      AFont.Color := clRed
   else if ( DBGGroups.Datasource.DataSet.FieldByName('Status').AsInteger = cCurrentlyAllocated ) then
      AFont.Color := clGreen
   else if ( DBGGroups.Datasource.DataSet.FieldByName('Status').AsInteger = cModified ) then
      AFont.Color := clBlue;
end;

procedure TfFeedAlloc.dbcGroupPropertiesChange(Sender: TObject);
begin
   FeedRegime.Filter := Format('GroupID = %d',[FSelectedFeedGroup]);
   FeedRegime.Filtered := True;
   FeedRegime.Refresh;

   // display existing date
   dbgGroups.Refresh;
   // default allocation date to today
   dbeAllocDate.Date := Date;
   // reset boolean
   RegimeChange := false;
   // get feed quantity/cost per animal
   FeedUpdate(True);
end;

procedure TfFeedAlloc.StopFeedForAnimal(const AAnimalId: Integer;
  const AStopDate: TDateTime; const AFeedRegimeId: Integer);
var
   FeedType : Integer;
   FeedQuantPerDay,
   FeedStockQuantity : Double;
   FeedAllocDate : TDateTime;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT FE.FeedType, FE.QuantDay, FE.AllocDate');
         SQL.Add('FROM FeedEvents FE');
         SQL.Add('WHERE (FE.AnimalID = :AAnimalID)');
         SQL.Add('AND   (FE.FeedRegimeID = :AFeedRegimeID)');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := AFeedRegimeID;
         Open;
         FeedType := Fields[0].AsInteger;
         FeedQuantPerDay := Fields[1].AsFloat;
         FeedAllocDate := Fields[2].AsDateTime;
         try
            First;
            while not EOF do
               begin
                  if WinData.FeedTypes.Locate('ID',FeedType,[]) then
                     with WinData.FeedTypes do
                        begin
                           FeedStockQuantity := FieldByName('Stock').AsFloat * 1000;
                           Open;
                           Edit;
                           FeedStockQuantity := (FeedStockQuantity -
                                                ((FeedQuantPerDay) *
                                                 (AStopDate -
                                                  FeedAllocDate)));
                           FieldByName('Stock').AsFloat := FeedStockQuantity / 1000;
                           Post;
                        end;
                  Next;
               end;

            //   23/11/12 [V5.1 R3.2] /MK Bug Fix - When above code was added to update FeedStockQuantity
            //                                      the end date of the FeedEvent was never updated.
            SQL.Clear;
            SQL.Add('UPDATE FeedEvents');
            SQL.Add('SET EndDate = "'+FormatDateTime(cUSDateStyle,AStopDate)+'"');
            SQL.Add('WHERE (AnimalID = :AAnimalID)');
            SQL.Add('AND   (FeedRegimeID = :AFeedRegimeID)');
            Params[0].AsInteger := AAnimalID;
            Params[1].AsInteger := AFeedRegimeID;
            ExecSQL;

         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfFeedAlloc.DeleteAllAddedFeedsFromRegime;
begin
   FeedRegime.First;
   while ( not(FeedRegime.Eof) ) do
      begin
         if ( FeedRegime.FieldByName('Status').AsInteger = cAdded ) then
            FeedRegime.Delete
         else
            FeedRegime.Next;
      end;
end;

procedure TfFeedAlloc.FeedGroupPropertiesChange(Sender: TObject);
begin
   if ( FeedGroup.EditValue = Null ) then Exit;

   FSelectedFeedGroup := FeedGroup.EditValue;

   FeedRegime.Filter := Format('GroupID = %d',[FSelectedFeedGroup]);
   FeedRegime.Filtered := True;
   FeedRegime.Refresh;

   // display existing date
   dbgGroups.Refresh;
   // default allocation date to today
   dbeAllocDate.Date := Date;
   // reset boolean
   Regimechange := false;
   // get feed quantity/cost per animal
   FeedUpdate(True);
end;

procedure TfFeedAlloc.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfFeedAlloc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := ( FeedRegime.RecordCount = 0 );
   // only save regime on exit, not animal allocation
   if ( not(CanClose) ) then
      CanClose := ( not(RegimeChange) );
   if ( not(CanClose) ) then
      begin
         if ( MessageDlg('You have changed the Feed Regime for this group,'+#13+
                         'but have not allocated the feed to the animals yet.'+#13+
                         'Do you want to allocate it now?',mtWarning,[mbYes,mbNo],0) = mrNo ) then
            begin
               DeleteAllAddedFeedsFromRegime;
               CanClose := True;
            end
         else
            begin
               sbFeedAllocClick(Sender);
               FeedRegime.Filter := '';
               FeedRegime.Filtered := False;
               FeedRegime.Filter := 'GroupID = '+IntToStr(FSelectedFeedGroup)+' AND Status = '+IntToStr(cAdded);
               FeedRegime.Filtered := True;
               RegimeChange := ( FeedRegime.RecordCount > 0 );
               CanClose := ( not(RegimeChange) );
            end;
      end;
end;

procedure TfFeedAlloc.FormDestroy(Sender: TObject);
begin
   QueryFeedCategories.Active := False;
   QueryFeedTypes.Active := False;
   HerdLookup.qFeedGroups.Close;
   FSelectedFeedGroup := 0;
end;

procedure TfFeedAlloc.AddToFeedRegime;
begin
   if ( FSelectedFeedGroup <= 0 ) or ( dbeAllocDate.Date <= 0 ) then Exit;

   // add feed to regime
   with FeedRegime do
      begin
         Append;
         FieldByName('GroupID').AsInteger := FSelectedFeedGroup;
         FieldByName('FeedType').AsInteger := WinData.FeedTypes.FieldByName('ID').AsInteger;
         FieldByName('AllocDate').AsDateTime := dbeAllocDate.Date;
         FieldByName('QuantDay').AsFloat := WinData.FeedTypes.fieldbyname('DefQuantDay').AsFloat;
         if ( FieldByName('QuantDay').AsFloat <> 0 ) then
            FieldByName('CostDay').AsFloat := ( (WinData.FeedTypes.FieldByName('DefCostTon').AsFloat/1000)*(FieldByName('QuantDay').AsFloat) );
         FieldByName('Status').AsInteger := cAdded;
         FeedRegimeNew.AsBoolean := True;
         FeedRegimeFeedTypeDesc.RefreshLookupList;
         Post;
      end;
end;

procedure TfFeedAlloc.AmendFeedRegimeAddedStartDate;
var
   i : Integer;
begin
   if ( FSelectedFeedGroup <= 0 ) then Exit;

   // If there are added feeds in the feed regime then change the start date to dbeAllocDate.Date.
   for i := 1 to FeedRegime.RecordCount do
      begin
         FeedRegime.RecNo := i;
         if ( FeedRegime.FieldByName('Status').AsInteger = cAdded ) and
            ( FeedRegime.FieldByName('AllocDate').AsDateTime <> dbeAllocDate.Date ) then
            begin
               FeedRegime.Edit;
               FeedRegime.FieldByName('AllocDate').AsDateTime := dbeAllocDate.Date;
               FeedRegime.Post;
            end;
      end
end;

procedure TfFeedAlloc.actRemoveFeedExecute(Sender: TObject);
begin
   RemoveFeedClick(Sender);
end;

procedure TfFeedAlloc.actAllocateFeedExecute(Sender: TObject);
begin
   AllocateFeed;
end;

procedure TfFeedAlloc.actRemoveFeedUpdate(Sender: TObject);
begin
   actRemoveFeed.Enabled := ( DBGGroups.DataSource.DataSet.RecordCount > 0 );
end;

procedure TfFeedAlloc.actAllocateFeedUpdate(Sender: TObject);
begin
   actAllocateFeed.Enabled := ( DBGGroups.DataSource.DataSet.RecordCount > 0 );
end;

end.
