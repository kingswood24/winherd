unit uTempMovements;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, RXLookup, ToolEdit,
  RXDBCtrl, Buttons, DBTables, RXCtrls, uListAnimals, CurrEdit, ComCtrls,
  ToolWin, kwDBNavigator;

type
  TAddOrAmendMovement = (AddMovement, AmendMovement);
  TfTempMovements = class(TkwEventForm)
    KillDied: TPanel;
    dsMovements: TDataSource;
    dsMovedTo: TDataSource;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    dbnMovements: TkwDBNavigator;
    Label3: TLabel;
    Label1: TLabel;
    lNo: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    lRemark: TLabel;
    dblMoveTo: TRxDBLookupCombo;
    dbdMoved: TDBDateEdit;
    dbeComment: TDBEdit;
    SearchForAnimal: TComboEdit;
    dbdMovedBack: TDBDateEdit;
    dbeRemark: TDBEdit;
    procedure oldExitButtonClick(Sender: TObject);
    procedure dblMoveToCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbnMovementsBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure SearchForAnimalButtonClick(Sender: TObject);
    procedure SearchForAnimalChange(Sender: TObject);
    procedure SearchForAnimalExit(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure dbdMovedBackExit(Sender: TObject);
    procedure dbdMovedBackEnter(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure dbeRemarkEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblMoveToChange(Sender: TObject);
    procedure dbdMovedChange(Sender: TObject);
    procedure dbeCommentChange(Sender: TObject);
    procedure dbdMovedBackChange(Sender: TObject);
    procedure dbeRemarkChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

{
var
  fSalesDeaths: TfSalesDeaths;
}
  procedure ShowMovement(AddorAmend : TAddOrAmendMovement );

implementation
Uses
    Dialogs,
    GenTypesConst,
    DairyData,
    uMovedBy;

{$R *.DFM}

procedure ShowMovement(AddorAmend : TAddOrAmendMovement );
begin
     with TfTempMovements.Create(nil) do
        try
           lRemark.Hide;
           dbeRemark.Hide;
           WinData.tMovedTo.Open;
           WinData.EventType := TMovement;
           ThisCombo := SearchForAnimal;
           ThisNav := dbnMovements;
           ThisComment := dbeComment;
           pSexToList := '';

           dbnMovements.VisibleButtons := [kwnbPost,kwnbCancel];
           if ( AddorAmend = AddMovement ) then
              AddEvent;

           // Set the Animal Number to the one on the Grid
           SetSearchField ( SearchForAnimal );
           ShowModal;
        finally
           WinData.tMovedTo.Close;
           Free;
        end;
end;

procedure TfTempMovements.oldExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfTempMovements.dblMoveToCloseUp(Sender: TObject);
begin
     if ( dblMoveTo.Value = '0' ) then
//        WinData.CreateAndShowForm(TfMovedBy);                  // changed 1/00 to show
        uMovedBy.ShowTheForm(TRUE);                              // blank record on open
end;

procedure TfTempMovements.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(Windata.Events, ModalResult = mrOK, FModified );
end;

procedure TfTempMovements.dbnMovementsBeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
var
   RecordOk : Boolean;
begin
     Close;
end;

procedure TfTempMovements.SearchForAnimalButtonClick(Sender: TObject);
begin
     SearchButtonClick(Sender, lNo);
     SetSearchField(SearchForAnimal);
end;

procedure TfTempMovements.SearchForAnimalChange(Sender: TObject);
begin
   SetModifiedFlag;
     SearchAnimalChange(Sender);
end;

procedure TfTempMovements.SearchForAnimalExit(Sender: TObject);
begin
    // If the User presses the Exit Button don;t set the Dataset into Edit Mode
    if NOT ( Screen.ActiveControl is TBitBtn ) then
       WinData.SetEventsToEdit;
end;

procedure TfTempMovements.ExitButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfTempMovements.dbdMovedBackExit(Sender: TObject);
begin
    if dbdMovedBack.Field.IsNull then
        begin
           lRemark.Hide;
           dbeRemark.Hide;
        end
    else
        begin
           lRemark.Show;
           dbeRemark.Show;
        end;
end;

procedure TfTempMovements.dbdMovedBackEnter(Sender: TObject);
begin
    WinData.SetEventsToEdit;
    lRemark.Show;
    dbeRemark.Show;
end;

procedure TfTempMovements.sbHelpClick(Sender: TObject);
begin
    WinData.HTMLHelp('tempmovement.htm');
end;

procedure TfTempMovements.dbeRemarkEnter(Sender: TObject);
begin
    WinData.SetEventsToEdit;
end;

procedure TfTempMovements.FormActivate(Sender: TObject);
begin
   inherited FormActivate(Sender);
end;

procedure TfTempMovements.dblMoveToChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfTempMovements.dbdMovedChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfTempMovements.dbeCommentChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfTempMovements.dbdMovedBackChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

procedure TfTempMovements.dbeRemarkChange(Sender: TObject);
begin
   SetModifiedFlag;

end;

end.
