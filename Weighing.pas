{
   06/10/10 [V4.0 R5.0] /MK Change - Removed Glyph from sbElectronic To Fit "Link To Weighing Scale" Caption.
                                   - Change the Height of Toolbar and sbElectronic to fit new caption.

   16/11/10 [V4.0 R5.6] /MK Additional Feature - New Event, NavBeforeAction, Which, If CommentSaved Is False Then Comment = Weight.
                                                 On Weight.Exit If Weight.Value Exist And CommentSaved Is false Then Comment = Weight
                                                 Else Comment = Weighing.

   04/04/13 [V5.1 R6.1] /MK Bug Fix - EditWeight.OnExit caused "Invalid Variant Type" error if blank weight.
                                    - Do not allow weighing to be saved if blank weight.
}

unit Weighing;              

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, ComCtrls,
  ToolEdit, RXDBCtrl, uListAnimals, RXCtrls, ToolWin, kwDBNavigator,
  WinTypes, WinProcs;

type
  TAddOrAmendWeight = (AddWeight, AmendWeight);
//  TCommEvent
  TWeightForm = class(TkwEventForm)
    Panel2: TPanel;
    Label2: TLabel;
    EditWeight: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    dbComment: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    lNo: TLabel;
    SearchForAnimal: TComboEdit;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    WeightNav: TkwDBNavigator;
    ToolButton4: TToolButton;
    sbElectronic: TRxSpeedButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ExitButtonClick(Sender: TObject);
    procedure EditWeightChange(Sender: TObject);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure WeightNavClick(Sender: TObject; Button: TKNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure sbElectronicClick(Sender: TObject);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure EditWeightExit(Sender: TObject);
    procedure WeightNavBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
  private
    DontCallCloseMessage,
    CommentSaved : Boolean;
    { private declarations }
  public
    { public declarations }
  end;

procedure ShowWeight(AddorAmend: TAddOrAmendWeight );

implementation
Uses
    Def,
    Dialogs,
    GenTypesConst,
    DairyData,
    uElecWeigh;

{$R *.DFM}

procedure ShowWeight(AddorAmend: TAddOrAmendWeight);
var
   EventBookmark : TBookmark;
begin
   with TWeightForm.Create(nil) do
      try
         WinData.EventType := TWeight;
         WinData.ModifyingEvent := False;
         ThisCombo := SearchForAnimal;
         ThisNav := WeightNav;
         ThisComment := dbComment;
         pSexToList := '';
         if (Def.Definition.dUseBeefMan) then
            sbElectronic.Enabled := True;
         if (AddorAmend = AddWeight) then
            begin
               WeightNav.VisibleButtons := [kwnbPost,kwnbCancel];
               WinData.ModifyingEvent := False;
               CommentSaved := False;
               AddEvent;
            end
         else
            begin
               WeightNav.VisibleButtons := [kwnbDelete,kwnbPost,kwnbCancel];
               sbElectronic.Enabled := False;
               CommentSaved := True;
               {If WinData.EventsICBFNotified.AsBoolean = True then
                  Begin
                     EventBookMark := WinData.Events.GetBookmark;
                     WinData.Events.Edit;
                     WinData.EventsICBFNotified.AsBoolean := False;
                     WinData.EventsICBFAction.AsString    := 'M';
                     WinData.Events.Post;
                     WinData.Events.GotoBookmark(EventBookmark);
                     WinData.Events.FreeBookmark(EventBookmark);
                  End;
               }
               WinData.ModifyingEvent := True;
               EditEvent;
            end;
         // Set the Animal Number to the one on the Grid
         SetSearchField(SearchForAnimal);
         DontCallCloseMessage := False;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TWeightForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if NOT DontCallCloseMessage then
      CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified);
end;

procedure TWeightForm.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TWeightForm.EditWeightChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TWeightForm.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender,lNo);
   SetSearchField(SearchForAnimal);
end;

procedure TWeightForm.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   SearchAnimalChange(Sender);
end;

procedure TWeightForm.WeightNavClick(Sender: TObject; Button: TKNavigateBtn);
begin
   if (Button = kwnbPost) and (WinData.EventType = TWeight) then
      begin
         if MessageDLG('Record Saved - Record Another',mtInformation,[mbYes,mbNo],0) = mrYes then
            begin

               if WinData.GlobalSettings.WeighingEventChangeAnimalFocusAfterSave then
                  begin
                     if not WinData.AnimalFileById.Eof then
                        begin
                           WinData.AnimalFileById.Next;
      {
                           if (WinData.SearchField = 'AnimalNo') then
                              begin
                                 if (not WinData.AnimalFileByIDAnimalNo.IsNull) then
                                    SearchForAnimal.Text := WinData.AnimalFileByIDAnimalNo.AsString
                                 else
                                    SearchForAnimal.Text := WinData.AnimalFileByIDNatIDNum.AsString;
                              end
                           else if (not WinData.AnimalFileByIDNatIDNum.IsNull) then
                              SearchForAnimal.Text := WinData.AnimalFileByIDNatIDNum.AsString
                           else
                              Close; // User cant know what animal to record weighing for, so just exit. Shouldnt really happen.
      }

                           SetSearchField(SearchForAnimal);
                           AddEvent; // <<< this class needs to be rewrote
                           EditWeight.SetFocus;
                        end
                     else
                        Close;
                  end
               else
                  begin
                     AddEvent; // <<< this class needs to be rewrote
                     EditWeight.SetFocus;
                  end;

            end
         else
            Close;
      end
   else
      Close;
end;

procedure TWeightForm.FormActivate(Sender: TObject);
begin
  lNo.Caption := NoLabel;
  inherited FormActivate(Sender);
end;

procedure TWeightForm.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('weighings.htm');
end;

procedure TWeightForm.sbElectronicClick(Sender: TObject);
begin
   {
   uElecWeigh.ShowTheForm;
   WinData.Weighings.Cancel;
   WinData.Events.Cancel;
   DontCallCloseMessage := True;
   Close;
   }
end;

procedure TWeightForm.DBDateEdit1Change(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TWeightForm.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TWeightForm.EditWeightExit(Sender: TObject);
begin
   if ( EditWeight.DataSource.DataSet.FieldByName(EditWeight.DataField).AsFloat > 0 ) then
      begin
         dbComment.Text := FloatToStr(EditWeight.DataSource.DataSet.FieldByName(EditWeight.DataField).AsFloat);
         CommentSaved := True;
      end
   else
      begin
         dbComment.Text := 'Weighing';
         CommentSaved := False
      end;
end;

procedure TWeightForm.WeightNavBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( EditWeight.Text = '0' ) or ( EditWeight.Text = null ) or ( EditWeight.Text = '' ) then
      begin
         MessageDlg('No weight entered',mtError,[mbOK],0);
         SysUtils.Abort;
      end;

   if ( not(CommentSaved) ) then
      if ( not(EditWeight.Text = '0') ) or ( not(EditWeight.Text = null) ) or ( not(EditWeight.Text = '') ) then
         begin
            if (WinData.Events.State in dsEditModes) then
               WinData.EventsEventDesc.Value := EditWeight.Text;
         end
      else
         dbComment.Text := 'Weighing';
      CommentSaved := True;
end;

end.
