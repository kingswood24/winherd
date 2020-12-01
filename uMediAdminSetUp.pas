{
   09/11/15 [V5.5 R0.5] /MK Additional Feature - Added a Vet and InUse database checkbox to the screen.
                                               - I also added a grid to the screen.
   13/11/15 [V5.5 R0.5] /MK Change - Only show one form caption for Add Prescribers / Administrators.
                                   - Changed vet to Prescriber - GL/SP request.
                                   - Add label beside prescriber to indicate that this is normally the vet.

   19/09/18 [V5.8 R2.9] /MK Change - Don't allow an edit or delete of MedAdmin records - SP request for App users but apply to everyone.

   19/02/19 [V5.8 R8.0] /MK Change - Allow edit of InUse and IsVet controls - SP request.
                                   - Removed Position as it was only used in HerdSync to determine whether its a vet or not.

   05/08/20 [V5.9 R5.3] /MK Bug Fix - Moved the assiging of the data sources from FormActivate to before ShowModal so that the DataSet.Append before ShowModal would work.                                   
}

unit uMediAdminSetUp;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, RXCtrls, ComCtrls,
  ToolWin, kwDBNavigator, cxControls, cxContainer, cxEdit, cxCheckBox,
  cxDBEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxLabel;

type
  FAdminType = ( adAdministrator, adPrescribingVet);
  TfMediAdminSetUp = class(TForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    DBNavigator: TkwDBNavigator;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    AdminCode: TDBEdit;
    Name: TDBEdit;
    dbcbIsVet: TcxDBCheckBox;
    dbcbInUse: TcxDBCheckBox;
    pGrid: TPanel;
    MedAdminGridDBTableView: TcxGridDBTableView;
    MedAdminGridLevel: TcxGridLevel;
    MedAdminGrid: TcxGrid;
    MedAdminGridDBTableViewAdminCode: TcxGridDBColumn;
    MedAdminGridDBTableViewName: TcxGridDBColumn;
    lPrescriberInfo: TcxLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbExitClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdminCodeChange(Sender: TObject);
    procedure NameChange(Sender: TObject);
    procedure PositionChange(Sender: TObject);
    procedure MedAdminGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { private declarations }
    FFormShowing : Boolean;
    FModified : Boolean;
    procedure SetModifiedFlag;
    procedure EnableDisableDBControls(AEnable: Boolean);
  public
    { public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean; AAdminType : FAdminType );

implementation
Uses
    Dialogs,
    DairyData;

var
  fMediAdminSetUp: TfMediAdminSetUp;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean; AAdminType : FAdminType );
begin
    Application.CreateForm(TfMediAdminSetUp, fMediAdminSetUp);
    try
       try
          fMediAdminSetUp.DbNavigator.DataSource := WinData.dsMediAdmin;
          fMediAdminSetUp.AdminCode.DataSource := WinData.dsMediAdmin;
          fMediAdminSetUp.Name.DataSource := WinData.dsMediAdmin;
          fMediAdminSetUp.dbcbIsVet.DataBinding.DataSource := WinData.dsMediAdmin;
          fMediAdminSetUp.dbcbInUse.DataBinding.DataSource := WinData.dsMediAdmin;
          fMediAdminSetUp.MedAdminGridDBTableView.DataController.DataSource := WinData.dsMediAdmin;
          if ( AddingRecord ) then
             WinData.MediAdMin.Append;
          fMediAdminSetUp.Caption := 'Add Prescribers / Administrators';
          fMediAdminSetUp.ShowModal;
       except
          ShowMessage('Cannot create form - close program and re-boot');
       end;
   finally
      FreeAndNil(fMediAdminSetUp);
   end;
end;

procedure TfMediAdminSetUp.FormActivate(Sender: TObject);
begin
   FFormShowing := True;
end;

procedure TfMediAdminSetUp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.MediAdMin, ModalResult = mrOK, FModified );
end;

procedure TfMediAdminSetUp.sbExitClick(Sender: TObject);
begin
    Close;
end;

procedure TfMediAdminSetUp.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('medadmin.htm')
end;

procedure TfMediAdminSetUp.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfMediAdminSetUp.FormCreate(Sender: TObject);
begin
   FFormShowing := False;
   FModified := False;
end;

procedure TfMediAdminSetUp.AdminCodeChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediAdminSetUp.NameChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediAdminSetUp.PositionChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfMediAdminSetUp.EnableDisableDBControls (AEnable : Boolean);
begin
   AdminCode.Enabled := AEnable;
   Name.Enabled := AEnable;
end;

procedure TfMediAdminSetUp.MedAdminGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   EnableDisableDBControls(MedAdminGridDBTableView.DataController.DataSource.DataSet.State = dsInsert);
end;

end.