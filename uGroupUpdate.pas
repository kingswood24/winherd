{
   11/05/11 [V4.1 R1.1] /MK Additional Feature - Added AnimalNumber/TagNo + Group Name And Group Type To actSaveExecute Successful Message.

   16/03/16 [V5.5 R5.4] /MK - Checked out this form for sorting as per Anne Ryan's suggested. The drop-down-lists in this screen
                              are order by code already and the user has the option to sort the drop-down-lists by Description by
                              clicking on the Description column heading.

   14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date.

   22/09/17 [V5.7 R3.0] /MK Change - Added the required changes for new Feeds unit.

   13/12/19 [V5.9 R1.5] /MK Additional Feature - Show orange indicator box over batch group controls if an animal is in more than one batch group becuase of the App.   
}

unit uGroupUpdate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, ActnList, dxBar, dxBarExtItems, cxControls, dxStatusBar,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLabel, StdCtrls, cxButtons, cxContainer, cxEdit,
  cxGroupBox, Db, DBTables, ImgList, cxCalendar, ExtCtrls, uApplicationLog;

type
  TfmGroupUpdate = class(TfmBaseForm)
    actSave: TAction;
    bSave: TdxBarLargeButton;
    dsBGroups: TDataSource;
    dsPGroups: TDataSource;
    qPGroups: TQuery;
    qPGroupsID: TIntegerField;
    qPGroupsCode: TStringField;
    qPGroupsDescription: TStringField;
    qPGroupsGroupType: TStringField;
    qPGroupsSelected: TBooleanField;
    qPGroupsAdditionalData: TBooleanField;
    qSGroups: TQuery;
    IntegerField3: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    BooleanField5: TBooleanField;
    BooleanField6: TBooleanField;
    dsSGroups: TDataSource;
    dsFGroups: TDataSource;
    qFGroups: TQuery;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    BooleanField3: TBooleanField;
    BooleanField4: TBooleanField;
    qBGroups: TQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    BooleanField1: TBooleanField;
    BooleanField2: TBooleanField;
    cxGroupBox1: TcxGroupBox;
    lIdentCaption: TcxLabel;
    cmbAnimals: TcxLookupComboBox;
    cxGroupBox2: TcxGroupBox;
    cmbLookupPGroups: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cmbLookupBGroups: TcxLookupComboBox;
    cmbLookupFGroups: TcxLookupComboBox;
    cmbLookupSGroups: TcxLookupComboBox;
    ImageList16x16: TImageList;
    deFeedStartDate: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    deBatchMoveDate: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    actNext: TAction;
    actPrior: TAction;
    blbGroupSetup: TdxBarLargeButton;
    actGroupSetup: TAction;
    pDupBatchGroupForAnimal: TPanel;
    lDupBatchGroupForAnimal: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbAnimalsPropertiesChange(Sender: TObject);
    procedure cmbAnimalsPropertiesCloseUp(Sender: TObject);
    procedure cmbLookupFGroupsPropertiesChange(Sender: TObject);
    procedure cmbLookupBGroupsPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actGroupSetupExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
  private
    { Private declarations }
    FDefaultDate : TDateTime;
    PGroup, FGroup, BGroup, SGroup, DGroup : Integer;
    FeedRegime : TTable;
    FeedRegimeStartDate : TDateTime;
    FormShowing : Boolean;
    FDupGrpsPerAnimals : TQuery;
    procedure SetGroupControls;
    function SelectedAnimalID : Integer;
    procedure GetFeedRegimeInfo;
    procedure GetBatchGroupInfo;
    function CheckMovementDate(ADate : TDateTime) : Boolean;
  public
    { Public declarations }
    class procedure ShowForm(const AID : Integer; const ADefaultDate : TDateTime = 0;
                             ACaption : string = 'Group Movements'); overload;
  end;

var
  fmGroupUpdate: TfmGroupUpdate;
  AnimalID : Integer;

implementation

uses uImageStore, DairyData, Groups, GenTypesConst, uGroupSetUp, KDBRoutines;
{$R *.DFM}

{ TfmGroupUpdate }

function TfmGroupUpdate.SelectedAnimalID: Integer;
begin
   Result := 0;
   if cmbAnimals.EditValue <> Null then
      Result := cmbAnimals.EditValue;
end;

procedure TfmGroupUpdate.SetGroupControls;
begin
   if ( SelectedAnimalID > 0 ) then
      begin
         WinData.GroupManager.Getgroups(SelectedAnimalID,PGroup,BGroup,FGroup,SGroup,DGroup);
         if ( PGroup > 0 ) then
            cmbLookupPGroups.EditValue := PGroup
         else
            cmbLookupPGroups.EditValue := Null;

         if ( FGroup > 0 ) then
            begin
               cmbLookupFGroups.EditValue := FGroup;

               if ( FDefaultDate > 0 ) then
                  begin
                 //    if MessageDlg(Format('Default start date of feed in current regime to %s',
                   //                [FormatDateTime(cIrishDateStyle,FDefaultDate)]),mtInformation,[mbYes,mbNo],0) = idYes then
                     //   begin
                           deFeedStartDate.Date := FDefaultDate;
                       // end;
                  end;
            end
         else
            begin
               cmbLookupFGroups.EditValue := Null;
            end;

         GetFeedRegimeInfo;

         if ( BGroup > 0 ) then
            begin
               cmbLookupBGroups.EditValue := BGroup;
            end
         else
            begin
               cmbLookupBGroups.EditValue := Null;
            end;

         GetBatchGroupInfo;

         if ( SGroup > 0 ) then
            cmbLookupSGroups.EditValue := SGroup
         else
            cmbLookupSGroups.EditValue := Null;

      end;
end;

procedure TfmGroupUpdate.FormCreate(Sender: TObject);
begin
  inherited;
  qPGroups.Active := True;
  qFGroups.Active := True;
  qBGroups.Active := True;
  qSGroups.Active := True;
  WinData.qFilterAnimals.Close;
  WinData.qFilterAnimals.Open;
  FeedRegime := TTable.Create(nil);
  FeedRegime.Databasename := AliasName;
  FeedRegime.TableName := 'FeedRegime';
  FeedRegime.Active := True;

  if not WinData.qFilterAnimals.Locate('ID',AnimalID,[]) then
     begin
        raise Exception.Create('Cannot find animal ID');
     end
  else
     begin
        cmbAnimals.EditValue := AnimalID;
        if WinData.SearchField = 'AnimalNo' then
           begin
              lIdentCaption.Caption := 'Animal No';
              cmbAnimals.Properties.ListFieldIndex := 0;
           end
        else
           begin
              lIdentCaption.Caption := 'Nat. Id. No.';
              cmbAnimals.Properties.ListFieldIndex := 1;
           end;
        SetGroupControls;
     end;
  cmbAnimals.Properties.ListSource := WinData.dsqFilterAnimals;

  FDupGrpsPerAnimals := TQuery.Create(nil);
  with FDupGrpsPerAnimals do
     try
        DatabaseName := AliasName;
        SQL.Clear;
        SQL.Add('SELECT Count(GL.AnimalID) CountAID, GL.AnimalID AnimalID');
        SQL.Add('FROM grps G, grplinks GL');
        SQL.Add('WHERE ((G.Id= GL.GroupID) AND (UPPER(G.GroupType)= ' + UPPERCASE(QuotedStr(GroupTypesArray[gtBatch])) + '))');
        SQL.Add('GROUP BY GL.AnimalID');
        SQL.Add('HAVING COUNT(GL.AnimalID) > 1');
        Open;
     except
        on e : Exception do
           begin
              ApplicationLog.LogException(e);
              ApplicationLog.LogError(e.Message);
           end;
     end;

  FormShowing := False;
end;

procedure TfmGroupUpdate.actSaveExecute(Sender: TObject);
var
   sGroupType, sGroupName : String;
   InputRegimeStartDate : TDateTime;
begin
   try
      if ( cmbLookupPGroups.EditValue <> null ) then
         begin
            if ( cmbLookupPGroups.EditValue <> PGroup ) then
               begin
                  sGroupType := 'Purchase Group';
                  sGroupName := cmbLookupPGroups.Text;
                  WinData.GroupManager.AddToGroup(SelectedAnimalID, cmbLookupPGroups.EditValue, True, Date, cmbAnimals.Text);
               end;
         end;

      if ( cmbLookupFGroups.EditValue <> null ) then
         begin
            InputRegimeStartDate := deFeedStartDate.Date;
            sGroupType := 'Feed Group';
            sGroupName := cmbLookupFGroups.Text;

            if ( cmbLookupFGroups.EditValue <> FGroup ) then
               if ( InputRegimeStartDate > 0 ) then
                  begin
                     FeedRegimeStartDate := WinData.GroupManager.EarliestRegimeStartDate( cmbLookupFGroups.EditValue );

                     if ( not(CheckMovementDate(InputRegimeStartDate)) ) then Exit;

                     //   19/09/17 [V5.7 R3.0] /MK Change - If the InputRegimeStartDate < FeedRegimeStartDate then use InputRegimeStartDate - GL request.
                     if ( InputRegimeStartDate < FeedRegimeStartDate ) then
                        begin
                           MessageDlg(cAllocDateLessThanRegimeStartDateMsg,mtError,[mbOK],0);
                           Exit;
                        end;

                     WinData.GroupManager.AddToGroup(SelectedAnimalID, cmbLookupFGroups.EditValue, True, InputRegimeStartDate, cmbAnimals.Text);
                     WinData.FeedManager.CreateFeedsForAnimal(SelectedAnimalID, cmbLookupFGroups.EditValue, InputRegimeStartDate);
                     WinData.RemoveFromEventLookupData(SelectedAnimalID, cFeedingEvent); // Remove old feed grp to update grid display
                     WinData.AddToEventLookupData(SelectedAnimalID, cFeedingEvent);  // Add any new feed grp to update grid display
                  end
               else
                  begin
                     WinData.GroupManager.AddToGroup(SelectedAnimalID, cmbLookupFGroups.EditValue, True, Date, cmbAnimals.Text);
                     WinData.FeedManager.CreateFeedsForAnimal(SelectedAnimalID, cmbLookupFGroups.EditValue, Date);
                  end;
         end;

      if ( cmbLookupBGroups.EditValue <> null ) then
         begin
            if not CheckMovementDate(deBatchMoveDate.Date) then
               Exit;

            if ( cmbLookupBGroups.EditValue <> BGroup ) then
               begin
                  sGroupType := 'Batch Group';
                  sGroupName := cmbLookupBGroups.Text;
                  WinData.GroupManager.AddToGroup(SelectedAnimalID, cmbLookupBGroups.EditValue, True, deBatchMoveDate.Date, cmbAnimals.Text);
               end;
         end;

      if ( cmbLookupSGroups.EditValue <> null ) then
         begin
            if ( cmbLookupSGroups.EditValue <> SGroup ) then
               begin
                  sGroupType := 'Batch Group';
                  sGroupName := cmbLookupBGroups.Text;
                  WinData.GroupManager.AddToGroup(SelectedAnimalID, cmbLookupSGroups.EditValue, True, Date, cmbAnimals.Text);
               end;
         end;

      //   11/05/11 [V4.1 R1.1] /MK Additional Feature - Added AnimalNumber/TagNo + Group Name And Group Type To Successful Message.
      MessageDlg('Animal '+ cmbAnimals.Text +' Added To '+ sGroupType +' '+ sGroupName +' successfully.',mtInformation,[mbOK],0);
      Close;

   except
      on E : EDatabaseError do
         MessageDlg('Error saving animal to groups.',mtError,[mbOK],0);
   end;
end;

procedure TfmGroupUpdate.FormDestroy(Sender: TObject);
begin
   inherited;
   qPGroups.Active := False;
   qFGroups.Active := False;
   qBGroups.Active := False;
   qSGroups.Active := False;
   FeedRegime.Active := False;
   FreeAndNil(FeedRegime);
   if ( FDupGrpsPerAnimals <> nil ) then
      FreeAndNil(FDupGrpsPerAnimals);
end;

procedure TfmGroupUpdate.cmbAnimalsPropertiesChange(Sender: TObject);
begin
  inherited;
  if FormShowing then
     SetGroupControls;
end;

procedure TfmGroupUpdate.cmbAnimalsPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  if FormShowing then
     SetGroupControls;
end;

class procedure TfmGroupUpdate.ShowForm(const AID : Integer;
   const ADefaultDate : TDateTime; ACaption : string);
begin
  if ( AID <= 0 ) then
     raise Exception.Create('Invalid animal selection. No animal selected');

   AnimalID := AID;

   with TfmGroupUpdate.Create(nil) do
      try
         FDefaultDate := ADefaultDate;
         Caption := ACaption;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmGroupUpdate.GetFeedRegimeInfo;
var
  GroupID : Integer;
begin
   if ( cmbLookupFGroups.EditValue <> Null ) then
      begin
         GroupID := cmbLookupFGroups.EditValue;
         if ( GroupID > 0 ) then
            begin
               FeedRegimeStartDate := WinData.GroupManager.EarliestRegimeStartDate(GroupID);
               if FeedRegimeStartDate > 0 then
                  deFeedStartDate.Date := FeedRegimeStartDate
               else
                  deFeedStartDate.Date := Date;

               (*deFeedStartDate.Enabled := ( FeedRegimeStartDate > 0 );
               if deFeedStartDate.Enabled then
                  begin
                     // if animal no present in group, default move date to today
                     {if not WinData.GroupUpdate.AnimalInGrp(SelectedAnimalID,GroupID) then
                        deFeedStartDate.Date := Date
                     else
                        deFeedStartDate.Date := FeedRegimeStartDate;
                     }
                     if ( FDefaultDate > 0 ) then
                        deFeedStartDate.Date := FDefaultDate
                     else
                        deFeedStartDate.Date := Date;
                  end
               else
                  deFeedStartDate.Clear;
               *)
            end
         else
            begin
               deFeedStartDate.Clear;
               deFeedStartDate.Enabled := False;
               cmbLookupFGroups.EditValue := Null;
            end;
      end
   else
      deFeedStartDate.Clear;
end;

procedure TfmGroupUpdate.cmbLookupFGroupsPropertiesChange(Sender: TObject);
begin
  inherited;
  if FormShowing then
     GetFeedRegimeInfo;
end;

procedure TfmGroupUpdate.GetBatchGroupInfo;
var
  GroupID : Integer;
begin
   if ( cmbLookupBGroups.EditValue <> Null ) then
      begin
         GroupID := cmbLookupBGroups.EditValue;
         if ( GroupID > 0 ) then
            begin
               deBatchMoveDate.Date := WinData.GroupManager.DateJoinedGroup(SelectedAnimalID, GroupID);
               if deBatchMoveDate.Date <= 0 then
                  begin
                     // if the animal is joining the group default to JoinDate today.
                     deBatchMoveDate.Date := Date;
                  end;
            end
         else
            cmbLookupBGroups.EditValue := Null;
      end
   else
      deBatchMoveDate.Clear;
end;

procedure TfmGroupUpdate.cmbLookupBGroupsPropertiesChange(Sender: TObject);
begin
  inherited;
  if FormShowing then
     GetBatchGroupInfo;
end;

function TfmGroupUpdate.CheckMovementDate(ADate: TDateTime): Boolean;
var
   PurchDate : TDateTime;
begin
   Result := True;
   if WinData.qFilterAnimals.Locate('ID', SelectedAnimalID, []) then
      begin
         if ( WinData.qFilterAnimals.FieldByName('DateOfBirth').AsDateTime > ADate ) then
            begin
               Result := False;
               MessageDlg('Cannot start animal on feed regime. '+cCRLF+
                          'The input start date is before animal date of birth.',mtError,[mbOK],0);
            end
         else
            begin
               PurchDate := WinData.EventDataHelper.GetLastEventDate(SelectedAnimalID,-1,cPurchaseEvent);
               if ( PurchDate > 0 ) and ( PurchDate > ADate ) then
                  begin
                     Result := False;
                     MessageDlg('Cannot start animal on feed regime. '+cCRLF+
                                'The input start date is before animal purchase date.',mtError,[mbOK],0);
                  end;
            end;
      end;
end;

procedure TfmGroupUpdate.FormShow(Sender: TObject);
begin
  inherited;
  FormShowing := True;
  pDupBatchGroupForAnimal.SendToBack;
  if ( FDupGrpsPerAnimals.RecordCount > 0 ) then
     if ( FDupGrpsPerAnimals.Locate('AnimalID',cmbAnimals.EditValue,[]) ) then
        begin
           pDupBatchGroupForAnimal.BringToFront;
           lDupBatchGroupForAnimal.Caption := Format('This animal is in %d batch groups.',[FDupGrpsPerAnimals.FieldByName('CountAID').AsInteger]);
        end;
end;

procedure TfmGroupUpdate.actPriorExecute(Sender: TObject);
begin
  inherited;
  //
  if cmbAnimals.Properties.DataController.FocusedRecordIndex-1 > 0 then
     begin
        cmbAnimals.Properties.DataController.FocusedRecordIndex := cmbAnimals.Properties.DataController.FocusedRecordIndex-1;
        cmbAnimals.ItemIndex := cmbAnimals.Properties.DataController.FocusedRecordIndex;
     end;
end;

procedure TfmGroupUpdate.actNextExecute(Sender: TObject);
begin
  inherited;
  //
  if cmbAnimals.Properties.DataController.FocusedRecordIndex+1 < cmbAnimals.Properties.DataController.RecordCount then
     begin
        cmbAnimals.Properties.DataController.FocusedRecordIndex := cmbAnimals.Properties.DataController.FocusedRecordIndex+1;
        cmbAnimals.ItemIndex := cmbAnimals.Properties.DataController.FocusedRecordIndex;
     end;
end;

procedure TfmGroupUpdate.actGroupSetupExecute(Sender: TObject);
begin
  inherited;
  uGroupSetUp.ShowTheForm(0);  //Ind = 0 shows standard form
end;

procedure TfmGroupUpdate.actHelpExecute(Sender: TObject);
begin
  inherited;
//
  WinData.HTMLHelp('groupmovements.htm');
end;

end.
