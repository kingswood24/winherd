{
 26/02/2009 [Dev 3.9 6.3] /SP Program Change - Show DOB field before Event date field (easy viewing) John Joe Murphy

 06/09/11 [V5.0 R0.5] /MK Additional Feature - Added New Milk Temperament Event & Panel To This Screen.

 20/12/11 [V5.0 R2.9] /MK Additional Feature - New EventType For Tesco Johnes Result Introduced.

 09/01/12 [V5.0 R3.2] /MK Change - Removed Tesco HerdScoring Fields No Need For New EventType - Treat As Condition Score - GL.

 10/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Updating CondtionScore Event in English Herd.

 13/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Adding/Updating CondtionScore Event in English Herd.

 31/05/12 [V5.0 R6.0] /MK Change - Changed illnessCode.LookupDisplay To Only Show Description As Null LookupCodes Were Appearing.
}

unit uMPEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, kwDBNavigator, RXCtrls, ComCtrls, ToolWin, ToolEdit, RXDBCtrl,
  StdCtrls, Mask, GenTypesConst, RxLookup, uListAnimals, Spin, DBCtrls, Db,
  DBTables, RXSpin, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxFilter, cxLabel, cxCheckBox, cxCurrencyEdit;

type
  TAddOrAmendAWE = (AddAWE, AmendAWE);
  TMPEvents = class(TkwEventForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    pAnimal: TPanel;
    lNo: TLabel;
    Label3: TLabel;
    MPEDate: TDBDateEdit;
    lComment: TLabel;
    dbComment: TDBEdit;
    pDiagProb: TPanel;
    Label2: TLabel;
    illnessCode: TRxDBLookupCombo;
    pConScore: TPanel;
    Label1: TLabel;
    pEmbryo: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ET1Number: TDBEdit;
    DonorDamCombo: TRxDBLookupCombo;
    SireCombo: TRxDBLookupCombo;
    EmbryoType: TRxDBLookupCombo;
    SearchForAnimal: TComboEdit;
    qDam: TQuery;
    qSire: TQuery;
    dsDam: TDataSource;
    dsSire: TDataSource;
    qLookupEmbryo: TQuery;
    dsLookupEmbryo: TDataSource;
    qIllnessCode: TQuery;
    dsIllnessCode: TDataSource;
    Score: TDBEdit;
    MPENav: TKwDBNavigator;
    pIntExam: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cbExamReason: TRxDBLookupCombo;
    cbMainResult: TRxDBLookupCombo;
    cbResult2: TRxDBLookupCombo;
    cbResult3: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    pBullInOut: TPanel;
    BullInOut: TRxDBLookupCombo;
    lBull: TLabel;
    qBullInOut: TQuery;
    dsBullInOut: TDataSource;
    pVet: TPanel;
    Label8: TLabel;
    Vet: TRxDBLookupCombo;
    pWeanings: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Docility: TcxDBLookupComboBox;
    Quality: TcxDBLookupComboBox;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    Label17: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label18: TLabel;
    lDOB: TcxLabel;
    DBDateEdit2: TDBDateEdit;
    Label19: TLabel;
    Label20: TLabel;
    cmboAssociatedEventType: TRxDBLookupCombo;
    pMilkTemperament: TPanel;
    dbcbMilkTempScore: TcxDBLookupComboBox;
    lMilkTempScore: TcxLabel;
    pJohnesEvent: TPanel;
    dbcbJohnesResult: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    lMobility: TcxLabel;
    lCleanliness: TcxLabel;
    lAbrasions: TcxLabel;
    dbcbAbrasions: TcxDBCheckBox;
    dbceMobility: TcxDBCurrencyEdit;
    dbceCleanliness: TcxDBCurrencyEdit;
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure DonorDamComboChange(Sender: TObject);
    procedure MPENavClick(Sender: TObject; Button: TKNavigateBtn);
    procedure MPENavBeforeAction(Sender: TObject; Button: TKNavigateBtn);
    procedure cbMainResultCloseUp(Sender: TObject);
    procedure cbExamReasonCloseUp(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MPEDateChange(Sender: TObject);
    procedure BullInOutChange(Sender: TObject);
    procedure dbCommentChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure DocilityPropertiesInitPopup(Sender: TObject);
    procedure QualityPropertiesInitPopup(Sender: TObject);
    procedure VetChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VetCloseUp(Sender: TObject);
    procedure dbcbJohnesResultPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    WhichEvent : TAnimalWelfareType;
    DefCountry : TCountry;
    procedure SetVisiblePanels( EventType : TAnimalWelfareType );
    function ApplicationClaimed(PremType : TPremType) : Boolean;
    //   10/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Updating CondtionScore Event in English Herd.
    procedure SetTescoFieldsVisible(AVisible: Boolean);
  public
    { Public declarations }
  end;

  procedure ShowTheForm(EventType : TAnimalWelfareType; AddOrAmend : TAddOrAmendAWE; FCaption : String);

var
  MPEvents: TMPEvents;

implementation
uses
   DairyData, uGenLookSetUp, cxLookupDBGrid, uHerdLookup, uMediAdminSetUp, kRoutines;

{$R *.DFM}

procedure ShowTheForm(EventType : TAnimalWelfareType; AddOrAmend : TAddOrAmendAWE; FCaption : String);
begin

   with TMPEvents.Create(nil) do
      try
         DefCountry := WinData.DefCountry(WinData.UserDefaultHerdID);

         pAnimal.Hide;

         Delete(FCaption,Pos('&',FCaption),1);
         Caption := FCaption;

         SetVisiblePanels(EventType);
         WhichEvent := EventType;

         ThisCombo := SearchForAnimal;
         ThisNav := MPENav;
         ThisComment := dbComment;

         // First set Nav buttons.
         if AddOrAmend = AddAWE then
            begin
               MPENav.VisibleButtons := [kwnbPost,kwnbCancel];
               WinData.ModifyingEvent := False;
               AddEvent;
            end
         else
            begin
               WinData.SetEventsToEdit;
               WinData.ModifyingEvent := True;

               MPENav.VisibleButtons := [kwnbDelete,kwnbPost,kwnbCancel];
            end;

         //   10/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Updating CondtionScore Event in English Herd.
         //   13/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Adding/Updating CondtionScore Event in English Herd.
         {
         if ( ( EventType = ECON ) and ( DefCountry = England ) ) then
            begin
               SetTescoFieldsVisible(True);
            end;
         }

         PAnimal.Show;
         SetSearchField(SearchForAnimal);
         ShowModal;
      finally
         case EventType of
            EDNP : begin
                      qIllnessCode.Close;
                      qIllnessCode.Free;
                   end;
            EIMP : begin
                      qDam.Close;
                      qDam.Free;
                      qSire.Close;
                      qSire.Free;
                      qLookupEmbryo.Close;
                      qLookupEmbryo.Free;
                   end;
            EINT : begin
                      WinData.qExamMethod.Close;
                      WinData.qResCodes.Close;
                      WinData.qExamReason.Close;
                   end;
            ERBI,
            ERBO : begin
                      qBullInOut.Close;
                      qBullInOut.Free;
                   end;
            EDBU : begin
                      WinData.LookupMediAdmin.Active := False;
                   end;
            EWNC,
            ECQU : begin
                      WinData.WeaningScores.Active := False;
                   end;
            EMTS : begin
                      WinData.mdMilkTemperamentScores.Active := False;
                   end;
            //   20/12/11 [V5.0 R2.9] /MK Additional Feature - New EventType For Tesco Johnes Result Introduced.
            EJOH : begin
                      HerdLookup.LookupJohnesResult.Active := False;
                   end;
         end;
         Free;
      end;
end;

{ TMPEvents }
//   20/12/11 [V5.0 R2.9] /MK Additional Feature - New EventType For Tesco Johnes Result Introduced.
procedure TMPEvents.SetVisiblePanels( EventType : TAnimalWelfareType );
begin
   Case EventType of
      EABR : begin
                {Abortion}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                Height         := 261;
                pAnimal.Height := 137;
                lComment.Top   := 94;
                dbComment.Top  := 91;

                pSexToList := 'Female';

                WinData.EventType := TAbortion;
             end;
      ECST : begin
                {Castrate}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                Height         := 261;
                pAnimal.Height := 137;
                lComment.Top   := 94;
                dbComment.Top  := 91;

                pSexToList := 'Bull';

                WinData.EventType := TCastrate;
             end;
      ECON : begin
                {Condition Score}

                Height         := 300;
                pVet.Visible := False;
                pEmbryo.Visible   := False;
                pDiagProb.Visible := False;
                pConScore.Visible := True;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pConScore.Top  := 85;
                pConScore.Left := 2;
                pConScore.Height := 82;

                pAnimal.Height := 178;

                lComment.Top   := 187;
                dbComment.Top  := 191;

                HerdLookup.mdConditionScoreAssociatedEvents.Active := True;
                Score.DataSource := WinData.dsConditionScore;
                cmboAssociatedEventType.DataSource := WinData.dsConditionScore;
                cmboAssociatedEventType.LookupSource := HerdLookup.dsmdConditionScoreAssociatedEvents;
                pSexToList := '';

                //   13/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Adding/Updating CondtionScore Event in English Herd.
                //SetTescoFieldsVisible(False);

                SetTescoFieldsVisible( DefCountry = England );

                WinData.EventType := TConditionScore;
             end;
      EDNP : begin
                {Diagnose Problem}
                Height         := 304;

                pEmbryo.Visible   := False;
                pConScore.Visible := False;
                pDiagProb.Visible := True;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pDiagProb.Top  := 85;
                pDiagProb.Left := 2;

                pAnimal.Height := 178;

                lComment.Top   := 127;
                dbComment.Top  := 124;

                illnessCode.DataSource := WinData.dsDiagnoseProblem;

                pSexToList := '';
                WinData.EventType := TDiagnoseProblem;

                qIllnessCode.Open;
             end;
      EIMP : begin
                {Embryo Implant/Transfer}
                Height            := 402;

                pDiagProb.Visible := False;
                pConScore.Visible := False;
                pEmbryo.Visible   := True;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pEmbryo.Top       := 85;
                pEmbryo.Left      := 2;

                pAnimal.Height    := 271;

                lComment.Top      := 227;
                dbComment.Top     := 224;

                ET1Number.DataSource := WinData.dsEmbryoTransfer;
                DonorDamCombo.DataSource := WinData.dsEmbryoTransfer;
                SireCombo.DataSource := WinData.dsEmbryoTransfer;
                EmbryoType.DataSource := WinData.dsEmbryoTransfer;

                pSexToList := 'Female';
                WinData.EventType := TEmbryoTransfer;

                // Open Lookup refs.
                qDam.ParamByName('ID').AsInteger := WinData.AnimalFileByIDID.AsInteger;
                qDam.Open;
                qSire.Open;
                qLookupEmbryo.Open;
             end;
      EMST : begin
                {Mastitis}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                Height         := 261;
                pAnimal.Height := 137;
                lComment.Top   := 94;
                dbComment.Top  := 91;

                pSexToList := '';
                WinData.EventType := TMastitis;
             end;
      ETBC : begin
                {To be Cull}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                Height         := 261;
                pAnimal.Height := 137;
                lComment.Top   := 94;
                dbComment.Top  := 91;

                pSexToList := '';
                WinData.EventType := TToBeCulled;
             end;
      EWNC,
      ECQU : begin
                {Wean}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := True;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pWeanings.Left := 3;

                Height         := 360;
                pAnimal.Height := 225;
                lComment.Top   := 188;
                dbComment.Top  := 189;

                pSexToList := 'Female';
                WinData.EventType := TWean;
                WinData.WeaningScores.Active := True;

             end;
      EINT : begin
                {Wean}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := True;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                Height         := 421;
                pAnimal.Height := 304;
                lComment.Top   := 253;
                dbComment.Top  := 254;

                WinData.qExamMethod.Open;
                WinData.qResCodes.Open;
                WinData.qExamReason.Open;

                pSexToList := '';

                WinData.EventType := TInternalExam;
             end;
      ERBI,
      ERBO : begin
                Height            := 304;
                pBullInOut.Visible:= True;
                pEmbryo.Visible   := False;
                pDiagProb.Visible := False;
                pConScore.Visible := False;
                pIntExam.Visible  := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pBullInOut.Top  := 85;
                pBullInOut.Left := 2;

                pAnimal.Height := 178;

                lComment.Top   := 127;
                dbComment.Top  := 124;

                case EventType of
                   ERBI : lBull.Caption := 'Bull In';
                   ERBO : lBull.Caption := 'Bull Out';
                end;

                case EventType of
                   ERBI : begin
                             WinData.EventType := TRunBullIn;
                          end;
                   ERBO : begin
                             WinData.EventType := TRunBullOut;
                          end;
                end;

                qBullInOut.ParamByName('NoneHerdID').AsInteger := WinData.NONEHerdID;
                qBullInOut.Open;

                pSexToList := 'Female';
             end;
//      TDisbudding  : begin
                        //
//                     end;
      EMLF : begin
                {Meal Feeding}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                Height         := 261;
                pAnimal.Height := 137;
                lComment.Top   := 94;
                dbComment.Top  := 91;

                pSexToList := '';
                WinData.EventType := TMealFeeding;
             end;
      EDBU : begin
                Height         := 395;
                pVet.Top := 52;
                pVet.Visible := True;
                MPEDate.Visible := False;
                Label3.Visible := False;

                pEmbryo.Visible   := False;
                pDiagProb.Visible := False;
                pConScore.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

               // pVet.Top  := 88;
                pVet.Left := 5;

                lDOB.Caption := FormatDate(WinData.AnimalFileByIDDateOfBirth.AsDateTime, dsIrish);

                pAnimal.Height := 205;

                lComment.Top   := pVet.Top+pVet.Height+5;
                dbComment.Top  := lComment.Top-2;

                //Score.DataSource := WinData.dsConditionScore;
                WinData.LookupMediAdmin.Active := True;

                pSexToList := '';
                WinData.EventType := TDisbudding;
             end;
      EMTS : begin
                pEmbryo.Visible   := False;
                pDiagProb.Visible := False;
                pConScore.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pJohnesEvent.Visible := False;

                pMilkTemperament.Visible := True;

                Height := 275;
                pAnimal.Height := 161;

                lComment.Top := pMilkTemperament.Top + pMilkTemperament.Height + 9;
                dbComment.Top := lComment.Top-2;

                WinData.EventType := TMilkTemperament;
                WinData.mdMilkTemperamentScores.Active := True;
             end;
      EJOH : begin
                pEmbryo.Visible   := False;
                pDiagProb.Visible := False;
                pConScore.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;

                pJohnesEvent.Visible := True;
                pJohnesEvent.Top := 87;
                pJohnesEvent.Left := 2;

                dbcbJohnesResult.Properties.KeyFieldNames := 'ID';
                dbcbJohnesResult.Properties.ListSource := HerdLookup.dsLookupJohnesResult;
                dbcbJohnesResult.Properties.ListFieldNames := 'Description';
                dbcbJohnesResult.DataBinding.DataSource := WinData.dsJohnesResult;
                dbcbJohnesResult.DataBinding.DataField := 'Result';
                dbcbJohnesResult.Properties.DropDownAutoSize := True;
                dbcbJohnesResult.Properties.DropDownWidth := 140;
                HerdLookup.LookupJohnesResult.Active := True;

                Height := 280;
                pAnimal.Height := 165;

                lComment.Top := pJohnesEvent.Top + pJohnesEvent.Height + 9;
                dbComment.Top := lComment.Top-2;

                WinData.EventType := TJohnesResult;
             end;
      {
      ETSC : begin
                pEmbryo.Visible   := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := False;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pConScore.Visible := True;
                pConScore.Top  := 85;
                pConScore.Left := 2;
                pConScore.Height := 133;

                SetTescoFieldsVisible(True);
                Label20.Visible := False;
                cmboAssociatedEventType.Visible := False;

                lComment.Top := pConScore.Top + pConScore.Height + 6;
                dbComment.Top := lComment.Top-2;

                pAnimal.Height := 259;
                Height := 386;

                dbceMobility.DataBinding.DataSource := WinData.dsHerdScoring;
                dbceMobility.DataBinding.DataField := 'Mobility';
                dbceCleanliness.DataBinding.DataSource := WinData.dsHerdScoring;
                dbceCleanliness.DataBinding.DataField := 'Cleanliness';
                dbcbAbrasions.DataBinding.DataSource := WinData.dsHerdScoring;
                dbcbAbrasions.DataBinding.DataField := 'Abrasions';
                Score.DataSource := WinData.dsHerdScoring;
                Score.DataField := 'Score';
                pSexToList := '';

                WinData.EventType := TTescoScoring;
             end;
      }

      EDSU : begin
                {Dam Survey}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := True;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pWeanings.Left := 5;

                Height         := 360;
                pAnimal.Height := 225;
                lComment.Top   := 188;
                dbComment.Top  := 189;

                pSexToList := 'Female';
                WinData.EventType := TICBFDamEvent;
                WinData.DamAndBullICBFScores.Active := True;

             end;

      EBSU : begin
                {Stock Bull Survey}
                pEmbryo.Visible := False;
                pConScore.Visible := False;
                pDiagProb.Visible := False;
                pIntExam.Visible := False;
                pBullInOut.Visible := False;
                pWeanings.Visible := True;
                pMilkTemperament.Visible := False;
                pJohnesEvent.Visible := False;

                pWeanings.Left := 5;

                Height         := 360;
                pAnimal.Height := 225;
                lComment.Top   := 188;
                dbComment.Top  := 189;

                pSexToList := 'Female';
                WinData.EventType := TICBFStockBullEvent;
                WinData.DamAndBullICBFScores.Active := True;

             end;
   end;
end;

procedure TMPEvents.SearchForAnimalButtonClick(Sender: TObject);
begin
   SearchButtonClick(Sender, lNo);
   SetSearchField(SearchForAnimal);
end;

procedure TMPEvents.SearchForAnimalChange(Sender: TObject);
begin
   SearchAnimalChange(Sender);
   SetModifiedFlag;
end;

procedure TMPEvents.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TMPEvents.DonorDamComboChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TMPEvents.MPENavClick(Sender: TObject; Button: TKNavigateBtn);
begin
   {if (Button = kwnbPost) then
      begin
         if MessageDLG('Record Saved - Record Another',mtInformation,[mbYes,mbNo],0) = mrYes then
            begin
               SetVisiblePanels(WhichEvent);
               AddEvent;
               MPEDate.SetFocus;
            end
         else
            Close;
      end
   else  }
   Close;
end;

function TMPEvents.ApplicationClaimed(PremType: TPremType): Boolean;
var
   LookupBeefSubsidy : TTable;
   PremStr : String[1];
begin
   case PremType of
      B : PremStr := 'B';
      F : PremStr := 'F';
      S : PremStr := 'S';
   end;
   try
      LookupBeefSubsidy := TTable.Create(nil);
      LookupBeefSubsidy.DatabaseName := WinData.KingData.DatabaseName;
      LookupBeefSubsidy.TableName := WinData.BeefSubsidy.TableName;

      LookupBeefSubsidy.Open;
      LookupBeefSubsidy.RecordCount;
      if LookupBeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([WinData.AnimalFileByIDID.Value,PremStr]),[] ) then
         Result := LookupBeefSubsidy.FieldByName('ApplicationDate').AsDateTime > 0;
   finally
      LookupBeefSubsidy.Close;
      LookupBeefSubsidy.Free;
   end;

end;

procedure TMPEvents.MPENavBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( not(Button in ([kwnbPost, kwnbDelete])) ) then Exit;

   case WhichEvent of
      ECST : case Button of
                  kwnbPost : if ApplicationClaimed(B) then
                                raise ErrorMsg.CreateFmt('Animal No %s Nat. ID %s Sex cannot be changed - Special Beef Application has been made',[WinData.AnimalFileByIDAnimalNo.AsString,WinData.AnimalFileByIDNatIdNum.AsString]);
                  kwnbDelete : if ApplicationClaimed(F) OR ApplicationClaimed(S) then
                                raise ErrorMsg.CreateFmt('Animal No %s Nat. ID %s Sex cannot be changed - Special Beef Application has been made',[WinData.AnimalFileByIDAnimalNo.AsString,WinData.AnimalFileByIDNatIdNum.AsString]);
             end;
   end;
end;

procedure TMPEvents.cbMainResultCloseUp(Sender: TObject);
begin
   if (Sender As TRxDBLookupCombo).Value = '0' Then
      begin
         GenLookUpType := TIntExamRes;
         uGenLookSetUp.ShowTheForm(TRUE);
      end;
end;

procedure TMPEvents.cbExamReasonCloseUp(Sender: TObject);
begin
   if (Sender As TRxDBLookupCombo).Value = '0' Then
      begin
         GenLookUpType := TIntExamRea;
         uGenLookSetUp.ShowTheForm(TRUE);
      end;
end;

procedure TMPEvents.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
   if (Sender As TRxDBLookupCombo).Value = '0' Then
      begin
         GenLookUpType := TIntExamMet;
         uGenLookSetUp.ShowTheForm(TRUE);
      end;
end;

procedure TMPEvents.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);
end;

procedure TMPEvents.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TMPEvents.MPEDateChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TMPEvents.BullInOutChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TMPEvents.dbCommentChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TMPEvents.FormActivate(Sender: TObject);
begin
   inherited FormActivate(Sender);
end;

procedure TMPEvents.sbHelpClick(Sender: TObject);
begin
   if (WhichEvent = ECST) then
      WinData.HTMLHelp('castrate.htm')
   else if (WhichEvent = EWNC) then
      WinData.HTMLHelp('weaning.htm')
   else if (WhichEvent = EMLF) then
      WinData.HTMLHelp('startmealfeed.htm')
   else if (WhichEvent = EDBU) then
      WinData.HTMLHelp('disbudding.htm')
   else
      WinData.HTMLHelp('othereventsdrop.htm');
end;

procedure TMPEvents.DocilityPropertiesInitPopup(Sender: TObject);
begin
   inherited;
   HerdLookup.FilterICBFScoreList(1,Sender);
end;

procedure TMPEvents.QualityPropertiesInitPopup(Sender: TObject);
begin
   HerdLookup.FilterICBFScoreList(2,Sender);
end;

procedure TMPEvents.VetChange(Sender: TObject);
begin
   If Vet.Value = '0' Then
      uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
end;

procedure TMPEvents.FormDestroy(Sender: TObject);
begin
   if HerdLookup.mdConditionScoreAssociatedEvents.Active then
      HerdLookup.mdConditionScoreAssociatedEvents.Active := False;
end;

//   10/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Updating CondtionScore Event in English Herd.
//   13/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Adding/Updating CondtionScore Event in English Herd.
procedure TMPEvents.SetTescoFieldsVisible ( AVisible : Boolean );
begin
   lMobility.Visible := AVisible;
   dbceMobility.Visible := AVisible;
   lCleanliness.Visible := AVisible;
   dbceCleanliness.Visible := AVisible;
   lAbrasions.Visible := AVisible;
   dbcbAbrasions.Visible := AVisible;

   if AVisible then
      begin
         lMobility.Top := 79;
         dbceMobility.Top := 76;
         dbceMobility.DataBinding.DataSource := WinData.dsConditionScore;
         dbceMobility.DataBinding.DataField := 'Mobility';
         lCleanliness.Top := 111;
         dbceCleanliness.Top := 111;
         dbceCleanliness.DataBinding.DataSource := WinData.dsConditionScore;
         dbceCleanliness.DataBinding.DataField := 'Cleanliness';
         lAbrasions.Top := 142;
         dbcbAbrasions.Top := 142;
         dbcbAbrasions.DataBinding.DataSource := WinData.dsConditionScore;
         dbcbAbrasions.DataBinding.DataField := 'Abrasions';
         pConScore.Height := 172;
         lComment.Top := pConScore.Top + pConScore.Height + 4;
         dbComment.Top := lComment.Top - 2;
         pAnimal.Height := dbComment.Top + dbComment.Height + 18;
         Height := 418;
      end;

end;

procedure TMPEvents.VetCloseUp(Sender: TObject);
begin
   if Vet.Value = '0' then
      uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
end;

procedure TMPEvents.dbcbJohnesResultPropertiesChange(Sender: TObject);
begin
   dbComment.Text := dbcbJohnesResult.Text+ ' Risk';
end;

end.


