{
   16/11/10 [V4.0 R5.6] /MK Additional Feature - Added PlannedBull to Comment on PlanedBull.CloseUp.

   11/05/12 [V5.0 R5.5] /MK Bug Fix - Changes For New HerdLookup Querys. Old Query Was Showing Old Bulls That Are InActive.

   03/10/12 [V5.1 R0.1] /MK Change - If AmendPlannedBull then save EventDesc as "Bull : BullCode".

   27/08/15 [V5.4 R7.4] /MK Change - Colour SearchForAnimal & dbDate clTeal / font white to show these are required fields - GL request.
                                   - Move DateOfService after SearchForAnimal - GL request.

   11/04/17 [V5.6 R5.7] /MK Bug Fix - When screen opens and date changes then check to see if there is a planned bull before the event date.

   28/09/18 [V5.8 R3.0] /MK Change - Removed the qPlanned component as it was replaced in the past by HerdLookup.qPlannedBull.   
}

unit Bullings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, DBCGrids, RXLookup,
  ToolEdit, RXDBCtrl, Db, DBTables, uListAnimals, ToolWin, RXCtrls,
  kwDBNavigator, ActnList, Menus, uHerdLookup;

type
  TAddOrAmendBulling = (AddBulling, AmendBulling, AmendPlannedBull);
  TfBullings = class(TkwEventForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbComment: TDBEdit;
    Label4: TLabel;
    PlannedBull: TRxDBLookupCombo;
    DataSource1: TDataSource;
    ObservedBy: TRxDBLookupCombo;
    dbDate: TDBDateEdit;
    lNo: TLabel;
    SearchForAnimal: TComboEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    BullNav: TkwDBNavigator;
    dbDefaults: TRxSpeedButton;
    ToolButton4: TToolButton;
    PopupMenu1: TPopupMenu;
    EventDate1: TMenuItem;
    Comment1: TMenuItem;
    N1: TMenuItem;
    SelectAll1: TMenuItem;
    DeselectAll1: TMenuItem;
    N2: TMenuItem;
    DefaultTo1: TMenuItem;
    AnimalNo1: TMenuItem;
    PlannedBull2: TMenuItem;
    PlannedBull1: TMenuItem;
    ObservedBy1: TMenuItem;
    actDefaults: TActionList;
    Action1: TAction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure ObservedByCloseUp(Sender: TObject);
    procedure BullNavClick(Sender: TObject; Button: TKNavigateBtn);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure PlannedBullChange(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure BullNavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure PlannedBull1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeselectAll1Click(Sender: TObject);
    procedure dbDateChange(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure PlannedBullCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FAddorAmend : TAddOrAmendBulling;
    procedure LoadDefaults;
    procedure AssignPlannedBull;
  public
    { Public declarations }
  end;

procedure ShowBulling(AddorAmend: TAddOrAmendBulling);

implementation
uses
    GenTypesConst,
    DairyData,
    uSrchdlg,
    uGenLookSetUp, EventDefaults;

{$R *.DFM}

procedure ShowBulling(AddorAmend: TAddOrAmendBulling );
var
   EventBookmark : TBookmark;
begin
   with TfBullings.Create(nil) do
      try
         LoadDefaults;
         WinData.EventType := TBulling;
         ThisCombo := SearchForAnimal;
         ThisNav := BullNav;
         ThisComment := dbComment;
         pSexToList := 'Female';
         FAddorAmend := AddorAmend;

         Label2.Visible := ( FAddorAmend <> AmendPlannedBull );
         ObservedBy.Visible := Label2.Visible;
         if ( not(Label2.Visible) ) then
            begin
               Label4.Top := 110;
               dbComment.Top := 106;
            end;

         if (FAddorAmend = AddBulling) then
            begin
               BullNav.VisibleButtons := [kwnbPost,kwnbCancel];
               WinData.ModifyingEvent := False;
               //   11/05/12 [V5.0 R5.5] /MK Bug Fix - Set DataSource.DataSet To New HerdLookup Query.
               DataSource1.DataSet := HerdLookup.qPlannedBull;
               AddEvent;
            end
         else
            begin
               if ( FAddorAmend = AmendPlannedBull ) then
                  Caption := 'Planned Bull';

               BullNav.VisibleButtons := [kwnbDelete,kwnbPost,kwnbCancel];
               //   11/05/12 [V5.0 R5.5] /MK Bug Fix - Set DataSource.DataSet To New HerdLookup Query.
               DataSource1.DataSet := HerdLookup.qHistPlannedBull;
               WinData.ModifyingEvent := True;
            end;
         // Set the Animal Number to the one on the Grid
         SetSearchField(SearchForAnimal);
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfBullings.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfBullings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TfBullings.FormActivate(Sender: TObject);
begin
   lNo.Caption := NoLabel;

   //   11/05/12 [V5.0 R5.5] /MK Bug Fix - Removed This Code & Activated New HerdLookup Querys.
   {
   DataSource1.DataSet := qPlanned;
   qPlanned.Close;
   qPlanned.Open;
   }
   if ( not(HerdLookup.qPlannedBull.Active) ) then
      HerdLookup.qPlannedBull.Active := True;
   if ( not(HerdLookup.qHistPlannedBull.Active) ) then
      HerdLookup.qHistPlannedBull.Active := True;

   AssignPlannedBull;

   WinData.qObservedBy.Open;
   inherited FormActivate(Sender);
end;

procedure TfBullings.ObservedByCloseUp(Sender: TObject);
begin
   SetModifiedFlag;

   If ObservedBy.Value = '0' Then
      begin
         GenLookUpType := TObservedBy;
//         WinData.CreateAndShowForm(TfGenLookSetUp);   // Changed 12.99 to call new
         uGenLookSetUp.ShowTheForm(TRUE);               // blank entry on dbl-clk
      end
   else
      WinData.SetEventsToEdit;
end;

procedure TfBullings.BullNavClick(Sender: TObject; Button: TKNavigateBtn);
begin
   if Button = kwnbPost then                  // Record has been Written
      begin
         if MessageDLG('Bulling Saved - Record Another',mtInformation,[mbYes,mbNo],0) = mrYes then
            begin
               AddEvent;
               if BullingDefaults <> nil then
                  begin
                     if BullingDefaults.BullingTabDefault = btdAnimalNo then
                        SearchForAnimal.SetFocus
                     else
                        PlannedBull.SetFocus
                  end
               else
                  PlannedBull.SetFocus;
            end
         else
            Close;
      end
   else
      Close;
end;

procedure TfBullings.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   SearchAnimalChange(Sender);
end;

procedure TfBullings.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender, lNo);
   SetSearchField(SearchForAnimal);
end;

procedure TfBullings.PlannedBullChange(Sender: TObject);
Var
  Msg : string;
begin
   SetModifiedFlag;

   if ( (PlannedBull.Text <> '<None>') and (not(VarIsNull(PlannedBull.KeyValue))) ) then
      WinData.CheckInBreeding(SearchForAnimal.Text,PlannedBull.KeyValue,WinData.AnimalFileByIDDamID.AsInteger,WinData.AnimalFileByIDSireID.AsInteger);
   WinData.SetEventsToEdit;
end;

procedure TfBullings.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('bulling.htm');
end;

procedure TfBullings.BullNavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
begin
   if Button = kwnbCancel then
      Windata.Bullings.CancelUpdates;
end;

procedure TfBullings.PlannedBull1Click(Sender: TObject);
begin
   if BullingDefaults <> nil then
      begin
         if ( Sender is TMenuItem ) then
            begin
               if TMenuItem(Sender).Checked then
                  TMenuItem(Sender).Checked := False
               else
                  TMenuItem(Sender).Checked := True;

               if ( Sender as TMenuItem ).GroupIndex = 0 then
                  case TMenuItem(Sender).Tag of
                     0 : BullingDefaults.StorePlannedBull := TMenuItem(Sender).Checked;
                     1 : BullingDefaults.StoreObservedBy := TMenuItem(Sender).Checked;
                     2 : BullingDefaults.StoreEventDate := TMenuItem(Sender).Checked;
                     3 : BullingDefaults.StoreComment := TMenuItem(Sender).Checked;
                  end
               else if ( Sender as TMenuItem ).GroupIndex = 1 then
                  begin
                     if TMenuItem(Sender).Tag = 0 then
                        BullingDefaults.BullingTabDefault := btdAnimalNo
                     else
                        BullingDefaults.BullingTabDefault := btdPlannedBull;
                  end;
            end;
      end;
end;

procedure TfBullings.SelectAll1Click(Sender: TObject);
var
  i : Byte;
begin
   if BullingDefaults <> nil then
      BullingDefaults.StoreAll;
   for i := 0 to 3 do
      begin
         if PopupMenu1.Items[i].GroupIndex = 0 then
            PopupMenu1.Items[i].Checked := TRUE;
      end;
end;

procedure TfBullings.DeselectAll1Click(Sender: TObject);
var
  i : Byte;
begin
   if BullingDefaults <> nil then
      BullingDefaults.StoreNone;
   for i := 0 to 3 do
      begin
         if PopupMenu1.Items[i].GroupIndex = 0 then
            PopupMenu1.Items[i].Checked := FALSE;
      end;
end;

procedure TfBullings.LoadDefaults;
begin
   if BullingDefaults <> nil then
      begin
         PlannedBull1.Checked := BullingDefaults.StorePlannedBull;
         ObservedBy1.Checked := BullingDefaults.StoreObservedBy;
         EventDate1.Checked := BullingDefaults.StoreEventDate;
         Comment1.Checked := BullingDefaults.StoreComment;
         AnimalNo1.Checked := BullingDefaults.BullingTabDefault = btdAnimalNo;
         PlannedBull2.Checked := not AnimalNo1.Checked;
      end;
end;

procedure TfBullings.dbDateChange(Sender: TObject);
begin
   SetModifiedFlag;
   AssignPlannedBull;
end;

procedure TfBullings.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfBullings.PlannedBullCloseUp(Sender: TObject);
begin
   if PlannedBull.Text <> '' then
      begin
         //   03/10/12 [V5.1 R0.1] /MK Change - If AmendPlannedBull then save EventDesc as "Bull : BullCode".
         //                                     else save EventDesc as "BullCode".
         if ( FAddorAmend = AmendPlannedBull ) then
            begin
               WinData.Events.Edit;
               WinData.Events.FieldByName('EventDesc').AsString := 'Bull : ' + PlannedBull.Text;
            end
         else
            begin
               WinData.Events.Edit;
               WinData.Events.FieldByName('EventDesc').AsString := PlannedBull.Text;
            end;
      end;
end;

//   11/05/12 [V5.0 R5.5] /MK Bug Fix - Set DataSource.DataSet To Nil To Free For New Querys.
procedure TfBullings.FormCreate(Sender: TObject);
begin
   DataSource1.DataSet := nil;
end;

//   11/05/12 [V5.0 R5.5] /MK Bug Fix - Set New HerdLookup Querys.Active To False.
procedure TfBullings.FormDestroy(Sender: TObject);
begin
   if ( HerdLookup.qPlannedBull.Active ) then
      HerdLookup.qPlannedBull.Active := False;
   if ( HerdLookup.qHistPlannedBull.Active ) then
      HerdLookup.qHistPlannedBull.Active := False;
end;

procedure TfBullings.AssignPlannedBull;
var
   iPlannedBull : Integer;
begin
   if ( WinData.Events.State = dsInsert ) then
       begin
          iPlannedBull := WinData.FEventDataHelper.GetPlannedBull(WinData.AnimalFileByIDID.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger,dbDate.Date);
          if ( not(DataSource1.DataSet.Active) ) then
             DataSource1.DataSet.Open;
          if ( DataSource1.DataSet.Locate('ID',iPlannedBull,[]) ) or ( iPlannedBull = 0 ) then
             begin
                WinData.Bullings.Edit;
                WinData.Bullings.FieldByName('PlannedBull').AsInteger := iPlannedBull;
                WinData.Bullings.Post;
             end;
       end;
end;

end.