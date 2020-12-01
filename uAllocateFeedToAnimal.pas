{
   22/09/17 [V5.7 R3.0] /MK Additional Feature - Added new Feeds unit along with FeedManager object.

   22/09/17 [V5.7 R3.0] /MK Change - If Allocation Date entered is before the feed regime allocation date then give error on OK.

   21/11/17 [V5.7 R4.6] /MK Change - Made changes to allow this screen to be used to specify and end date for the feed.

   29/11/18 [V5.8 R5.5] /MK Change - GetStart_EndAllocationDate - If IsStartDate and EndDate is greater than the Earliest Regime Start Date then start date should be end date.
}

unit uAllocateFeedToAnimal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uAnimal, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxLabel, ActnList,
  uHerdLookup, GenTypesConst, Groups, Feeds;

type
  TfmAllocateFeedToAnimal = class(TForm)
    lAnimalNoHeader: TcxLabel;
    lTagNoHeader: TcxLabel;
    lAnimalNoDetail: TcxLabel;
    lTagNoDetail: TcxLabel;
    lAllocationDate: TcxLabel;
    deStart_EndAllocDate: TcxDateEdit;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    lInfo: TcxLabel;
    ActionList: TActionList;
    actOK: TAction;
    actCancel: TAction;
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FAnimal : TAnimal;
    GroupManager : TGroupManager;
    FeedManager : TFeedManager;
    FEarliestRegimeStartDate : TDateTime;
    FFeedEndDate : TDateTime;
    FIsStartDate : Boolean;
  public
    { Public declarations }
    class function GetStart_EndAllocationDate ( AAnimalGroupID : Integer; const AAnimal : TAnimal = nil;
       const AAllAnimals : Boolean = False; const AIsStartDate : Boolean = True;
       const AFeedEndDate : TDateTime = 0 ) : TDateTime;
  end;

var
  fmAllocateFeedToAnimal: TfmAllocateFeedToAnimal;

const
  lInfoStartSingleAnimalTxt = 'Select a Feed Allocation Start Date for this animal and'+cCRLF+
                              'and click OK to start feeding the animal on this date.'+cCRLF+
                              'Click Cancel to leave animal out of group.';

  lInfoStartAllAnimalTxt = 'Select a Feed Allocation Start Date for all selected animals'+cCRLF+
                           'and click OK to start feeding these animals on this date.'+cCRLF+
                           'Click Cancel to leave animals out of group.';

  lInfoEndSingleAnimalTxt = 'Select a Feed Allocation End Date for this animal and'+cCRLF+
                            'and click OK to end feeding the animal on this date.'+cCRLF+
                            'Click Cancel to exit without ending the feed.';

  lInfoEndAllAnimalTxt = 'Select a Feed Allocation End Date for all selected animals'+cCRLF+
                         'and click OK to end feeding these animals on this date.'+cCRLF+
                         'Click Cancel to exit without ending the feed.';

  btnOKAllAnimalLeft = 77;
  btnCancelAllAnimalLeft = 201;
  lAnimalNoTagDetailAllAnimalWidth = 155;
  lInfoSingleAnimalWidth = 323;
  AllAnimalFormWidth = 370;

implementation

{$R *.DFM}

{ TfmAllocateFeedToAnimal }

class function TfmAllocateFeedToAnimal.GetStart_EndAllocationDate(AAnimalGroupID : Integer; const AAnimal: TAnimal = nil;
   const AAllAnimals : Boolean = False; const AIsStartDate : Boolean = True;
   const AFeedEndDate : TDateTime = 0 ) : TDateTime;
begin
   Result := 0;
   with TfmAllocateFeedToAnimal.Create(nil) do
      try
         FEarliestRegimeStartDate := FeedManager.EarliestRegimeStartDate(AAnimalGroupID);
         FFeedEndDate := AFeedEndDate;
         FIsStartDate := AIsStartDate;
         if ( FIsStartDate ) then
            begin
               //   29/11/18 [V5.8 R5.5] /MK Change - If IsStartDate and EndDate is greater than the Earliest Regime Start Date then start date should be end date.
               if ( AFeedEndDate > 0 ) and ( FEarliestRegimeStartDate > AFeedEndDate ) then
                  deStart_EndAllocDate.Date := FEarliestRegimeStartDate
               else
                  deStart_EndAllocDate.Date := FFeedEndDate;
            end
         else
            begin
               if ( FFeedEndDate > 0 ) then
                  deStart_EndAllocDate.Date := FFeedEndDate
               else
                  deStart_EndAllocDate.Date := Date;
            end;
         lAnimalNoDetail.Caption := '';
         lTagNoDetail.Caption := '';

         if ( AIsStartDate ) then
            begin
               if AAllAnimals then
                  Caption := 'Allocate Feed To Animals'
               else
                  Caption := 'Allocate Feed To Animal';
               lAllocationDate.Caption := 'Feed Allocation Start Date:'
            end
         else
            begin
               if AAllAnimals then
                  Caption := 'End Feed For Animals'
               else
                  Caption := 'End Feed For Animal';
               lAllocationDate.Caption := 'Feed Allocation End Date:';
            end;

         if ( AAnimal <> nil ) then
            begin
               FAnimal := AAnimal;
               lAnimalNoDetail.Caption := AAnimal.AnimalNo;
               lTagNoDetail.Caption := AAnimal.NatIdNum;
               if ( AIsStartDate ) then
                  lInfo.Caption := lInfoStartSingleAnimalTxt
               else
                  lInfo.Caption := lInfoEndSingleAnimalTxt;
               btnOK.Left := 77;
               btnCancel.Left := 201;
               lAnimalNoDetail.Width := 155;
               lTagNoDetail.Width := 155;
               lInfo.Width := 323;
               Width := 370;
            end;
         if ( AAllAnimals ) then
            begin
               lAnimalNoDetail.Caption := 'All Selected Animals';
               lTagNoDetail.Caption := lAnimalNoDetail.Caption;
               if ( AIsStartDate ) then
                  lInfo.Caption := lInfoStartAllAnimalTxt
               else
                  lInfo.Caption := lInfoEndAllAnimalTxt;
               btnOK.Left := 93;
               btnCancel.Left := 217;
               lAnimalNoDetail.Width := 175;
               lTagNoDetail.Width := 175;
               lInfo.Width := 344;
               Width := 389;
            end;
         if ( Length(lAnimalNoDetail.Caption) > 0 ) or ( Length(lTagNoDetail.Caption) > 0 ) then
            begin
               ShowModal;
               if ( ModalResult = mrOK ) then
                  Result := deStart_EndAllocDate.Date;
            end;
      finally
         Free;
      end;
end;

procedure TfmAllocateFeedToAnimal.FormCreate(Sender: TObject);
begin
   GroupManager := TGroupManager.create;
   FeedManager := TFeedManager.Create;
end;

procedure TfmAllocateFeedToAnimal.actOKExecute(Sender: TObject);
begin
   if ( deStart_EndAllocDate.Date <= 0 ) then
      begin
         MessageDlg('You must select a start feed allocation date.',mtError,[mbOK],0);
         SysUtils.Abort;
      end;
   if ( deStart_EndAllocDate.Date > Date ) then
      begin
         MessageDlg('Start feed allocation date cannot be after todays date.',mtError,[mbOK],0);
         deStart_EndAllocDate.Clear;
         SysUtils.Abort;
      end;
   if ( deStart_EndAllocDate.Date < FEarliestRegimeStartDate ) then
      begin
         if ( FIsStartDate ) then
            MessageDlg(cAllocDateLessThanRegimeStartDateMsg,mtError,[mbOK],0)
         else
            MessageDlg(cAllocDateLessThanRegimeEndDateMsg,mtError,[mbOK],0);
         deStart_EndAllocDate.Date := FEarliestRegimeStartDate;
         SysUtils.Abort;
      end;
   ModalResult := mrOK;
end;

procedure TfmAllocateFeedToAnimal.actOKUpdate(Sender: TObject);
begin
   actOK.Enabled := ( deStart_EndAllocDate.Date > 0 );
end;

procedure TfmAllocateFeedToAnimal.actCancelExecute(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfmAllocateFeedToAnimal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( ModalResult = mrOK ) then Exit;
   ModalResult := mrCancel;
end;

procedure TfmAllocateFeedToAnimal.FormDestroy(Sender: TObject);
begin
   FreeAndNil(GroupManager);
   FreeAndNil(FeedManager);
end;

end.
