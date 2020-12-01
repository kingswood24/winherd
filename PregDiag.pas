{
   This form is used to PD a Female Animal. Only 1 record per Lactation is to be allowed

   12/11/10 [V4.0 R5.6] /MK Additional Feature - Use New Variable CommentSaved To Check To See If Comment Was Saved.
                                                 Check CommentSaved On DaysInCalf Exit, If Not CommentSaved Then Comment := Pregnant \ DaysInCalf.
                                                 CommentSaved On ShowPD Where Adding := False. If Editing On FormShow Then CommentSaved = False..

   18/10/11 [V5.0 R1.5] /MK Additional Feature -  New Field CalfType.
                                               -  If NoOfCalves = 0 Then Calf Sex Is Disabled.
                                               -  If NoOfCalves = 1 Then Calf Sex Is M or F. If NoOfCalves > 1 Then Calf Sex Is M/M, F/F or M/F.

   12/01/12 [V5.0 R3.3] /MK Change - Changed Confirmation Box Message For Customers To Be Able To Understand Better
                                     If Animal Marked Pregnant With No PD Days In Calf Entered.

   07/09/12 [V5.0 R9.8] /MK Change - NoCalvesOnChange - Changed from adding items in code to switching RepositoryItems.

   17/10/12 [V5.1 R0.4] /MK Additional Feature - Added new Panel, pServeBull, only show if no last Service Date found and Adding PD.
                                               - Create Service Event from Bull Used and Days In Calf.

   01/11/12 [V5.1 R0.7] /MK Bug Fix - Only set dServiceDate if BullUsed and DaysInCalf values exist.

   14/11/12 [V5.1 R1.0] /MK Additional Feature - DaysInCalfOnChange - If DiffDaysInCalf > 21 then show Service Bull option.

   22/11/12 [V5.1 R1.2] /MK Bug Fix - Forgot to move Cull Cow button after adding the pServeBull panel.

   11/12/12 [V5.1 R3.5] /MK Bug Fix - dbceDaysInCalfPropertiesChange - Error if no Service Days In Calf found.

   18/02/13 [V5.1 R4.3] /MK Bug Fix - PDNAvBeforeAction - Wrongly only posting to PregDiag if Service Bull was entered.

   17/09/13 [V5.2 R1.3] /MK Bug Fix - dbceDaysInCalfChange - Only show pServeBull if PDDaysInCalf > ServDaysInCalf - GL/HC.

   03/12/13 [V5.2 R6.0] /MK Bug Fix - Only show pServeBull if PDDaysInCalf < ServDaysInCalf - GL.
                                      Program was incorrectly saving a service event prior to the last
                                      service event instead of after the last service date.

   30/06/14 /MK Additional Feature - Added dbRecheck check box for new recheck field.

   21/08/14 [V5.3 R4.7] /MK Bug Fix - dbceDaysInCalfPropertiesChange - After save the program was still going into this procedure and crashing on dbceDaysInCalf.PostEditValue.
                                      so check PregDiag state to see whether record has been saved or not.

   30/10/14 [V5.3 R8.8] /MK Change - dbceDaysInCalfPropertiesChange - If Scanning DIC (Days In Calf) is greater than Service DIC by 21 days or more then show warning below.

   04/12/14 [V5.4 R0.3] /MK Additional Feature - Set WinData.FPregStatusChanged boolean depending on whether the pregnant check
                                                 box is ticked or unticked or whether event was deleted or saved.
}

unit PregDiag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls, ToolEdit, RXDBCtrl,
  RXSpin,uListAnimals, ToolWin, RXCtrls, kwDBNavigator, CurrEdit, ActnList,
  db, dbtables, cxButtons, KRxSpeedButton, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit, uHerdLookup,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, EventRecording,
  cxCurrencyEdit, uBreedingDataHelper;

type
  TAddOrAmendPD = (AddPD, AmendPD);
  TfPregdiag = class(TkwEventForm)
    Panel2: TPanel;
    DaysInCalf: TDBEdit;
    NoOfCalves: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbComment: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    cbPregStatus: TDBCheckBox;
    DBDate: TDBDateEdit;
    lNo: TLabel;
    SearchForAnimal: TComboEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton1: TToolButton;
    PDNAv: TkwDBNavigator;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ePregProjCalveDate: TEdit;
    eServiceProjCalveDate: TEdit;
    eProjCalveDiff: TEdit;
    Label9: TLabel;
    eDaysToCalve: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    eDaysInCalf: TEdit;
    btnUseCalcDaysIncalf: TButton;
    ActionList1: TActionList;
    actStartFertilityProgram: TAction;
    btnStartFertilityProgram: TKRxSpeedButton;
    btnCullCow: TKRxSpeedButton;
    dbcbCalfType: TcxDBComboBox;
    lCalfType: TLabel;
    pServeBull: TPanel;
    lServeBull: TcxLabel;
    lkcbBullUsed: TcxLookupComboBox;
    dbceDaysInCalf: TcxDBCurrencyEdit;
    dbRecheck: TDBCheckBox;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NoOfCalvesChange(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure DaysInCalfChange(Sender: TObject);
    procedure cbPregStatusEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PDNAvBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure DBDateChange(Sender: TObject);
    procedure NoOfCalvesExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbPregStatusClick(Sender: TObject);
    procedure DaysInCalfKeyPress(Sender: TObject; var Key: Char);
    procedure DBDateEnter(Sender: TObject);
    procedure btnUseCalcDaysIncalfClick(Sender: TObject);
    procedure actStartFertilityProgramExecute(Sender: TObject);
    procedure actStartFertilityProgramUpdate(Sender: TObject);
    procedure cbCullCowClick(Sender: TObject);
    procedure btnCullCowClick(Sender: TObject);
    procedure dbcbCalfTypePropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DaysInCalfExit(Sender: TObject);
    procedure dbceDaysInCalfPropertiesChange(Sender: TObject);
    procedure dbceDaysInCalfExit(Sender: TObject);
  private
    { Private declarations }
    FormShowing, CommentSaved : Boolean;
//    AutoCalcDaysInCalf : Boolean;
    FLastServiceDate : TDateTime;
    FLastServiceBull : Integer;
    FAddOrAmendPD : TAddOrAmendPD;
    FBreedingDataHelper : TBreedingDataHelper;
    procedure CalcProjCalvingDates;
    procedure DBFieldOnExit;
  public
    { Public declarations }
  end;

  procedure ShowPD(AddorAmend: TAddOrAmendPD);

implementation
uses

    GenTypesConst,
    DairyData, uFertProgramAdmin,
    kRoutines, KDBRoutines;

{$R *.DFM}

procedure ShowPD(AddorAmend: TAddOrAmendPD);
   procedure CheckCulling;
   begin
      if (AddorAmend = AddPD) and (WinData.EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.AsInteger, cToBeCulledEvent)>0) then
         begin
            MessageDlg('A Culling event has been recorded for this animal.'+cCRLF+
                       'You must delete the Culling event before entering a Pregnancy Diagnosis event.',mtInformation,[mbOK],0);
                       Abort;
         end;
   end;
var
   EventBookmark : TBookmark;
begin
   CheckCulling;
   with TfPregdiag.Create(nil) do
      try
         WinData.EventType := TPregDiag;

         ThisCombo := SearchForAnimal;
         ThisNav := PDNav;
         ThisComment := dbComment;
         pSexToList := 'Female';

         FAddorAmendPD := AddorAmend;

         if (FAddorAmendPD = AddPD) then
            begin
               CommentSaved := False;
               PDNav.VisibleButtons := [kwnbPost,kwnbCancel];
               WinData.ModifyingEvent := False;
               with lkcbBullUsed.Properties do
                  begin
                     ListSource := HerdLookup.dsServiceBullUsed;
                     KeyFieldNames := 'ID';
                     ListFieldNames := 'AnimalNo';
                  end;
               HerdLookup.dsServiceBullUsed.DataSet := HerdLookup.qServiceBullUsed;
               if ( not(HerdLookup.qServiceBullUsed.Active) ) then
                  HerdLookup.qServiceBullUsed.Active := True;
               AddEvent;
            end
         else
            begin
               CommentSaved := True;
               PDNav.VisibleButtons := [kwnbDelete,kwnbPost,kwnbCancel];
               WinData.ModifyingEvent := True;
               EditEvent;
            end;

         // Set the Animal Number to the one on the Grid
         SetSearchField(SearchForAnimal);

         ShowModal;
      finally
         Free;
      end;
end;

procedure TfPregdiag.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfPregdiag.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Events,ModalResult = mrOK, FModified);
end;

procedure TfPregdiag.NoOfCalvesChange(Sender: TObject);
begin
   SetModifiedFlag;

   //   18/10/11 [V5.0 R1.5] /MK Additional Feature - Added Change Of CalfType Dependant On NoOfCalves.
   if NoOfCalves.EditText > '0' then
      begin
         lCalfType.Enabled := True;
         dbcbCalfType.Enabled := True;

         //   07/09/12 [V5.0 R9.8] /MK Change - Changed from adding items in code to switching RepositoryItems.
         if NoOfCalves.EditText = '1' then
            {
            with dbcbCalfType.Properties.Items do
               begin
                  BeginUpdate;
                  Clear;
                  Insert(0,'M');
                  Insert(1,'F');
                  EndUpdate;
               end
            }
            dbcbCalfType.RepositoryItem := HerdLookup.erSingleCalfTypeCombo
         else if NoOfCalves.EditText > '1' then
            {
            with dbcbCalfType.Properties.Items do
               begin
                  BeginUpdate;
                  Clear;
                  Insert(0,'M/M');
                  Insert(1,'F/F');
                  Insert(2,'M/F');
                  EndUpdate;
               end;
            }
            dbcbCalfType.RepositoryItem := HerdLookup.erMultipleCalfTypeCombo;
      end;

{   if (NoOfCalves.Modified) then
      if NOT (WinData.Events.State in [dsInsert,dsEdit]) then
         WinData.Events.Edit;
}
end;

procedure TfPregdiag.DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
begin
   WinData.FPregStatusChanged := ( Button in [kwnbPost, kwnbDelete] );
   Close;
end;

procedure TfPregdiag.DaysInCalfChange(Sender: TObject);
begin
   SetModifiedFlag;
   {   if (DaysInCalf.Modified) then
      if NOT (WinData.Events.State in [dsInsert,dsEdit]) then
         WinData.Events.Edit;
}
end;

procedure TfPregdiag.cbPregStatusEnter(Sender: TObject);
begin
   if NOT (WinData.Events.State in [dsInsert,dsEdit]) then
      WinData.Events.Edit;
end;

procedure TfPregdiag.FormActivate(Sender: TObject);
begin
   inherited FormActivate(Sender);
   lNo.Caption := NoLabel;
   FormShowing := TRUE;
   WinData.PregDiag.Edit;
   CalcProjCalvingDates;
   pServeBull.Visible := ( FLastServiceBull = 0 ) and ( FAddorAmendPD = AddPD );
end;

procedure TfPregdiag.PDNAvBeforeAction(Sender: TObject; Button: TKNavigateBtn);
var
   ServiceEvent : TServiceEvent;
   dServiceDate : TDateTime;
begin
   if (Button = kwnbPost) then
      begin
         if WinData.Events.State in dsEditModes then
            if not CommentSaved then
               if ( dbComment.Text <> '' ) and ( dbceDaysInCalf.EditValue > 0 ) then
                  dbComment.Text := dbComment.Text + ' / ' + IntToStr(dbceDaysInCalf.EditValue);

         //if (((Trim(DaysInCalf.Text) <> '') and ( StrToInt(DaysInCalf.Text) <= 0 )) or (DaysInCalf.Text = '')) and ( cbPregStatus.Checked = True ) then
         if ( dbceDaysInCalf.EditValue <= 0 ) and ( cbPregStatus.Checked ) then
            {
            //   12/01/12 [V5.0 R3.3] /MK Change - Changed Confirmation Box Message For Customers To Be Able To Understand Better.
            if MessageDlg('Animal has been marked as Pregnant and Days In Calf value is "0"'+#10#13+
                          'Are you sure you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
            }
            begin
               if ( lkcbBullUsed.EditValue > 0 ) then
                  begin
                     MessageDlg('Bull Used selected but Days In Calf is blank.'+#10#13+
                                'Service Event can only be created if Days In Calf is entered.',
                                mtConfirmation,[mbOK],0);
                     Abort;
                  end;

               if MessageDlg('Animal marked as Pregnant but Days In Calf is blank.'+#10#13+
                             'Service Days in Calf will be used to predict Calving Date.'+#10#13+
                             'Do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                             Abort;
            end;

         if (WinData.PregDiag.State in dsEditModes) then
            begin
               if ( lkcbBullUsed.EditValue > 0 ) and ( dbceDaysInCalf.EditValue > 0 ) then
                  begin
                     //   01/11/12 [V5.1 R0.7] /MK Bug Fix - Only set dServiceDate if BullUsed and DaysInCalf values exist.
                     //   17/10/12 [V5.1 R0.4] /MK Additional Feature - Create Service Event from Bull Used and Days In Calf.
                     dServiceDate := ( DBDate.Date - dbceDaysInCalf.EditValue );
                     if ( dServiceDate > FBreedingDataHelper.GetLastEventDate(WinData.AnimalFileByIDId.AsInteger,
                                                                              WinData.AnimalFileByIDLactNo.AsInteger,
                                                                              CCalvingEvent) ) then
                        begin
                           try
                              ServiceEvent := TServiceEvent.Create('tPDService');
                              with ServiceEvent do
                                 try
                                    Append;
                                    EventType := TService;
                                    AnimalID := WinData.AnimalFileByIDId.AsInteger;
                                    AnimalLactNo := WinData.AnimalFileByIDLactNo.AsInteger;
                                    AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                    EventDate := ( DBDate.Date - dbceDaysInCalf.EditValue );
                                    EventComment := 'Service 1 '+lkcbBullUsed.Text;
                                    ServiceBull := lkcbBullUsed.EditValue;
                                    ServiceType := GenLookRecord.Locate('',cServiceType_Naturual,1);
                                    Post;
                                 except
                                    Cancel;
                                 end;
                           finally
                              ServiceEvent.Free;
                           end;
                        end
                     else
                        begin
                           MessageDlg('Cannot save Bull Used as Service Date is before last calving date',mtError,[mbOK],0);
                           SysUtils.Abort;
                        end;
                  end;
                //   18/02/13 [V5.1 R4.3] /MK Bug Fix - Wrongly only posting to PregDiag if Service Bull was entered.
                WinData.PregDiag.Post;
            end;
      end
   else if (Button = kwnbDelete) then
      FormShowing := False;
end;

procedure TfPregdiag.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender,lNo);
   SetSearchField(SearchForAnimal);
   CalcProjCalvingDates;
end;

procedure TfPregdiag.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
   SearchAnimalChange(Sender);
end;

procedure TfPregdiag.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('pd.htm');
end;

procedure TfPregdiag.CalcProjCalvingDates;
var
   ProjDate   : TDateTime;
   CalvIndex, Gestation : Integer;
   ServeType, NoStraws, GDam : Integer;
   DaysDiffBetween,nDaysInCalf : Integer;
begin
   FLastServiceDate := 0;
   FLastServiceBull := 0;

   if not ( FormShowing ) then
      Exit;

   ePregProjCalveDate.Text := '';
   eServiceProjCalveDate.Text := '';
   eProjCalveDiff.Text := '0';
   eDaysToCalve.Text := '0';
   DaysDiffBetween := 0;

   WinData.LastServiceDetails(WinData.AnimalFileByIDID.AsInteger,
                              WinData.AnimalFileByIDLactNo.AsInteger,
                              FLastServiceDate, FLastServiceBull, ServeType, NoStraws, GDam);

   if ( FLastServiceDate > 0 ) then
      begin
         WinData.CalcCalvingDate(WinData.AnimalFileByIDID.AsInteger, WinData.AnimalFileByIDLactNo.AsInteger,
                                 FLastServiceBull, FLastServiceDate, ProjDate, CalvIndex);
         if ( ProjDate > 0 ) then
            eServiceProjCalveDate.Text := FormatDateTime(cIrishDateStyle,ProjDate);

         if ( FLastServiceDate > 0 ) and ( WinData.EventsEventDate.AsDateTime > 0 ) and ( WinData.EventsEventDate.AsDateTime > FLastServiceDate ) then
            begin
               nDaysInCalf := Trunc(WinData.EventsEventDate.AsDateTime - FLastServiceDate);
               eDaysInCalf.Text := IntToStr(nDaysInCalf);
            end;
      end;

   if ( cbPregStatus.Checked ) then
      begin
         ProjDate := 0;
         Gestation := FBreedingDataHelper.GetGestation( FLastServiceBull );
         if ( NoOfCalves.Field.Value > 0 ) and ( dbceDaysInCalf.EditValue > 0 ) then
            begin
               if ( dbceDaysInCalf.EditValue <= Gestation ) then
                  ProjDate := DBDate.Field.AsDateTime + (Gestation - dbceDaysInCalf.EditValue ) // Projected Date
               else
                  ProjDate := DBDate.Field.AsDateTime + Gestation;
            end;

         if ( ProjDate > 0 ) then
            begin
               ePregProjCalveDate.Text := FormatDateTime(cIrishDateStyle,ProjDate);
               if ( eServiceProjCalveDate.Text <> '' ) then
                  begin
                     DaysDiffBetween := Trunc( ProjDate - StrToDate(eServiceProjCalveDate.Text));
                     if ( DaysDiffBetween >= 21 ) then

                        eProjCalveDiff.Font.Color := clRed
                     else
                        eProjCalveDiff.Font.Color := clGray;
                     eProjCalveDiff.Text := IntToStr(DaysDiffBetween);
                  end;

               eDaysToCalve.Text := IntToStr(Round( ProjDate - Now()));
            end;
      end;
end;

procedure TfPregdiag.DBDateChange(Sender: TObject);
begin
   SetModifiedFlag;
   CalcProjCalvingDates;
end;

procedure TfPregdiag.NoOfCalvesExit(Sender: TObject);
begin
   SetModifiedFlag;
   DBFieldOnExit;
end;

procedure TfPregdiag.FormShow(Sender: TObject);
begin
   CalcProjCalvingDates;
end;

procedure TfPregdiag.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPregdiag.FormCreate(Sender: TObject);
begin
   // sets the flag to ensure days in calf from service is retrieved.
   // This should only be done once, allowing the user to overwrite/change
   // the number of days in calf from service date.
//   AutoCalcDaysInCalf := True;
   FBreedingDataHelper := TBreedingDataHelper.Create();

   FLastServiceDate := 0;

   if dbcbCalfType.EditText = '0' then
      begin
         lCalfType.Enabled := False;
         with dbcbCalfType do
            begin
               Enabled := False;
               Properties.Items.Clear;
            end;
      end;
end;

procedure TfPregdiag.cbPregStatusClick(Sender: TObject);
var
   vDaysInCalf, vPregnant : Variant;
begin
   if FormShowing then
      begin
//         AutoCalcDaysInCalf := False;
         SetModifiedFlag;

         WinData.FPregStatusChanged := True;

         if {( WinData.Events.State = dsInsert ) and} ( dbceDaysInCalf.DataBinding.DataSource.Dataset.State in dsEditModes ) then
            begin
               btnStartFertilityProgram.Visible := not(cbPregStatus.Checked);

               btnCullCow.Visible := (btnStartFertilityProgram.Visible) and (WinData.EventDataHelper.GetLastEventDate(Windata.ANimalFileByIDID.AsInteger,CToBeCulledEvent)<=0);
               if cbPregStatus.Checked then
                  begin
                  //   WinData.GetDefaultPDDataFromLastService( vDaysInCalf, vPregnant);
//                     WinData.PregDiag.FieldByName('DaysInCalf').Value := vDaysInCalf;
                     WinData.PregDiag.FieldByName('NoCalves').Value := 1;
                     WinData.EventsEventDesc.AsString := 'Pregnant';
                  end
               else
                  begin
                     WinData.PregDiag.FieldByName('DaysInCalf').Clear;
                     WinData.PregDiag.FieldByName('NoCalves').Value := 0;
                     WinData.EventsEventDesc.AsString := 'Not Pregnant';
                  end;

               if dbRecheck.Checked then
                  WinData.EventsEventDesc.AsString := WinData.EventsEventDesc.AsString + ' / Recheck';
            end;
         CalcProjCalvingDates;
      end;

end;

procedure TfPregdiag.DaysInCalfKeyPress(Sender: TObject; var Key: Char);
begin
//   if Key in (['0'..'9']) then
//      AutoCalcDaysInCalf := False;
end;

procedure TfPregdiag.DBDateEnter(Sender: TObject);
begin
//   AutoCalcDaysInCalf := True;
end;

procedure TfPregdiag.btnUseCalcDaysIncalfClick(Sender: TObject);
begin
   EditEvent;
   try
     WinData.PregDiag.FieldByName('DaysInCalf').AsInteger := StrToInt(eDaysInCalf.Text);
   except
      on e : exception do Showmessage(e.message);
   end;
end;

procedure TfPregdiag.actStartFertilityProgramExecute(Sender: TObject);
begin
   SetModifiedFlag;
   if WinData.Events.State in dsEditModes then
      WinData.EventsEventDesc.AsString := 'PD/Fertility Treatment';

   TfmFertProgramAdmin.Execute(WinData.AnimalFileByIDID.AsInteger, WinData.AnimalFileByIDLactNo.AsInteger,WinData.EventID.AsInteger, WinData.EventsEventDate.AsDateTime);
end;

procedure TfPregdiag.actStartFertilityProgramUpdate(Sender: TObject);
begin
   btnStartFertilityProgram.Visible := not(cbPregStatus.Checked);
   btnCullCow.Visible := ( btnStartFertilityProgram.Visible ) and (WinData.EventDataHelper.GetLastEventDate(Windata.ANimalFileByIDID.AsInteger,CToBeCulledEvent)<=0);
end;

procedure TfPregdiag.cbCullCowClick(Sender: TObject);
begin
   EditEvent;
end;

procedure TfPregdiag.btnCullCowClick(Sender: TObject);
begin
   SetModifiedFlag;
   try
      WinData.UpdateCowFertilityCulledStatus
      (
         WinData.AnimalFileByIDID.AsInteger,
         WinData.AnimalFileByIDLactNo.AsInteger,
         WinData.AnimalFileByIDHerdID.AsInteger,
         True,
         DBDate.Date
      );

      if WinData.Events.State in dsEditModes then
         WinData.EventsEventDesc.AsString := 'PD/Cull Cow';
      MessageDlg('Culling Event has been created.',mtInformation,[mbOK],0);
   except
   end;
end;

procedure TfPregdiag.dbcbCalfTypePropertiesChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfPregdiag.FormDestroy(Sender: TObject);
begin
   if ( FBreedingDataHelper <> nil ) then
      FreeAndNil(FBreedingDataHelper);
   if ( HerdLookup.qServiceBullUsed.Active ) then
      HerdLookup.qServiceBullUsed.Active := False;
   if ( HerdLookup.qServiceHistBullUsed.Active ) then
      HerdLookup.qServiceHistBullUsed.Active := False;
end;

procedure TfPregDiag.DBFieldOnExit;
begin
   CalcProjCalvingDates;
   if not CommentSaved then
      if ( dbComment.Text <> '' ) and ( dbceDaysInCalf.EditValue > 0 ) then
         begin
            dbComment.Text := dbComment.Text + ' / ' + IntToStr(dbceDaysInCalf.EditValue);
            CommentSaved := True;
         end;
end;

procedure TfPregdiag.DaysInCalfExit(Sender: TObject);
begin
   SetModifiedFlag;
   DBFieldOnExit;
end;

procedure TfPregdiag.dbceDaysInCalfPropertiesChange(Sender: TObject);
var
   PDDaysInCalf, ServDaysInCalf,
   DiffDaysInCalf : Integer;
begin
   //   21/08/14 [V5.3 R4.7] /MK Bug Fix - After save the program was still going into this procedure and crashing on dbceDaysInCalf.PostEditValue.
   //                                      so check PregDiag state to see whether record has been saved or not.
   if ( (WinData.PregDiag.State in dsEditModes) ) then
      begin
         // dbceDaysInCalf.PostEditValue required to make sure that pServeBull shows on entry or deletion of value in days in calf.
         dbceDaysInCalf.PostEditValue;
         pServeBull.Visible := False;
         if ( FAddOrAmendPD = AddPD ) then
            begin
               if ( not(VarIsNull(dbceDaysInCalf.EditValue)) and ( Length(dbceDaysInCalf.EditValue) > 1) ) then
                  begin
                     PDDaysInCalf := dbceDaysInCalf.EditValue;
                     //   11/12/12 [V5.1 R3.5] /MK Bug Fix - Error if no Service Days In Calf found.
                     if ( not(eDaysInCalf.Text = '') ) then
                        begin
                           ServDaysInCalf := StrToInt(eDaysInCalf.Text);
                           if ( PDDaysInCalf > 0 ) and ( ServDaysInCalf > 0 ) then
                              begin
                                 //   17/09/13 [V5.2 R0.4] /MK Bug Fix - Only show pServeBull if PDDaysInCalf > ServDaysInCalf - GL/HC.
                                 //   03/12/13 [V5.2 R6.0] /MK Bug Fix - Only show pServeBull if PDDaysInCalf < ServDaysInCalf - GL/HC.
                                 //                                      Program was incorrectly saving a service event prior to the last
                                 //                                      service event instead of after the last service date.
                                 if ( PDDaysInCalf < ServDaysInCalf ) then
                                    begin
                                       DiffDaysInCalf := ( ServDaysInCalf - PDDaysInCalf );
                                       //   14/11/12 [V5.1 R1.0] /MK Additional Feature - If DiffDaysInCalf > 21 then show Service Bull option.
                                       if ( DiffDaysInCalf > 0 ) then
                                          pServeBull.Visible := ( DiffDaysInCalf > 21 );
                                    end
                                 //   30/10/14 [V5.3 R8.8] /MK Change - If Scanning DIC (Days In Calf) is greater than Service DIC by 21 days or more then show warning below.
                                 else if ( PDDaysInCalf > ServDaysInCalf ) then
                                    begin
                                       DiffDaysInCalf := ( PDDaysInCalf - ServDaysInCalf );
                                       if ( DiffDaysInCalf > 0 ) and ( DiffDaysInCalf > 21 ) then
                                          MessageDlg('Scanning Days in Calf figure indicates that the cow was pregnant prior to the last recorded service.'+cCRLF+
                                                     'You may need to delete this service.',mtWarning,[mbOK],0);
                                    end;
                              end
                           else
                              pServeBull.Visible := ( PDDaysInCalf = 0 ) or ( ServDaysInCalf = 0 );
                        end
                     else
                        pServeBull.Visible := True;
                  end
               else
                  if ( VarIsNull(dbceDaysInCalf.EditValue) ) then
                    pServeBull.Visible := False;
            end;
   end;
end;

procedure TfPregdiag.dbceDaysInCalfExit(Sender: TObject);
begin
   DBFieldOnExit;
end;

end.
