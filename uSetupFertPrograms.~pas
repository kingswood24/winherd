{

  11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Added Save button, Changed button captions, Autosave when entering the Treatment grid.
                                                  Prompt before delete programs/treatments


}


unit uSetupFertPrograms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, ActnList, dxBar, dxBarExtItems, cxControls, dxStatusBar, Db,
  DBTables, ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, cxStyles, dxBarDBNav, cxMaskEdit, cxSpinEdit, cxDBEdit,
  cxLabel, cxContainer, cxEdit, cxTextEdit, cxButtons;

type
  TfmSetupFertPrograms = class(TfmBaseForm)
    GridProgramsDBTableView: TcxGridDBTableView;
    GridProgramsLevel: TcxGridLevel;
    GridPrograms: TcxGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GridTreatments: TcxGrid;
    GridTreatmentsDBTableView: TcxGridDBTableView;
    GridTreatmentsLevel: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    GridProgramsDBTableViewID: TcxGridDBColumn;
    GridProgramsDBTableViewCode: TcxGridDBColumn;
    GridProgramsDBTableViewDescription: TcxGridDBColumn;
    GridProgramsDBTableViewStartDay: TcxGridDBColumn;
    GridTreatmentsDBTableViewID: TcxGridDBColumn;
    GridTreatmentsDBTableViewParentProgram: TcxGridDBColumn;
    GridTreatmentsDBTableViewCode: TcxGridDBColumn;
    GridTreatmentsDBTableViewDescription: TcxGridDBColumn;
    GridTreatmentsDBTableViewStartDay: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    NewRowStyle: TcxStyle;
    RowActiveStyle: TcxStyle;
    dxBarColorCombo1: TdxBarColorCombo;
    dxBarLargeButton1: TdxBarLargeButton;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    dxBarStatic1: TdxBarStatic;
    dxBarDockControl1: TdxBarDockControl;
    btnRemoveProgram: TcxButton;
    btnRemoveTreatment: TcxButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actSave: TAction;
    procedure FertProgramsAfterDelete(DataSet: TDataSet);
    procedure FertProgramsAfterPost(DataSet: TDataSet);
    procedure GridProgramsDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRemoveProgramClick(Sender: TObject);
    procedure btnRemoveTreatmentClick(Sender: TObject);
    procedure GridProgramsEnter(Sender: TObject);
    procedure GridProgramsExit(Sender: TObject);
    procedure GridTreatmentsEnter(Sender: TObject);
    procedure GridTreatmentsExit(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
  private
    { Private declarations }
    dsTreatDesc : TDataSource;
    qTreatDesc : TQuery;
  public
    { Public declarations }
    class function Execute : Boolean;
  end;

var
  fmSetupFertPrograms: TfmSetupFertPrograms;

implementation
uses
   BDE, DairyData, GenTypesConst, uHerdLookup, uFertTreatmentsReview;

{$R *.DFM}

{ TfmSetupFertPrograms }

class function TfmSetupFertPrograms.Execute: Boolean;
begin
   Result := True;
   with TfmSetupFertPrograms.Create(nil) do
      try
         WinData.FertPrograms.Active := True;
         WinData.FertTreatments.Active := True;
         HerdLookup.QueryFertTreatments.Active := True;
         ShowModal;
      finally
         WinData.FertPrograms.Active := False;
         WinData.FertTreatments.Active := False;
         HerdLookup.QueryFertTreatments.Active := False;
         Free;
      end;
end;

procedure TfmSetupFertPrograms.FertProgramsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DbiSaveChanges(WinData.FertPrograms.Handle);

end;

procedure TfmSetupFertPrograms.FertProgramsAfterPost(DataSet: TDataSet);
begin
  inherited;
  DbiSaveChanges(WinData.FertPrograms.Handle);

end;

procedure TfmSetupFertPrograms.GridProgramsDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   s : string;
   PanelIndex : Integer;
begin
   inherited;
   if Sender.Name = 'GridProgramsDBTableView' then
      begin
         PanelIndex := 0;
         s := 'Programs';
      end
   else
      begin
         PanelIndex := 1;
         s := 'Treatments';
      end;
   if TcxGridDBTableView(Sender).DataController.DataSet.State = dsBrowse then
      if TcxGridDBTableView(Sender).DataController.Filter.FilterText = '' then
         StatusBar.Panels[PanelIndex].Text := IntToStr(TcxGridDBTableView(Sender).DataController.GetFocusedRowIndex + 1) +' of '+ IntToStr(TcxGridDBTableView(Sender).DataController.DataSet.RecordCount) + ' ' + s
      else
         StatusBar.Panels[PanelIndex].Text := IntToStr(TcxGridDBTableView(Sender).DataController.GetFocusedRowIndex + 1) +' of '+ IntToStr(TcxGridDBTableView(Sender).DataController.RecordCount) + ' ' + s;
end;

procedure TfmSetupFertPrograms.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  TfmFertTreatmentsReview.Execute
end;

procedure TfmSetupFertPrograms.FormDestroy(Sender: TObject);
begin
  inherited;
  if WinData.FertTreatments.state in dsEditModes then
     WinData.FertTreatments.Post;
  if WinData.FertPrograms.state in dsEditModes then
     WinData.FertPrograms.Post;

end;

procedure TfmSetupFertPrograms.btnRemoveProgramClick(Sender: TObject);
begin
  inherited;
  if Windata.FertPrograms.RecordCount>0 then
     begin
        if not (Windata.FertPrograms.State in dsEditModes) then
           begin

              if WinData.FertTreatments.RecordCount>0 then
                  begin
                     MessageDlg('All associated treatments must be removed before removing program.',mtInformation,[mbOK],0);
                  end
              else
                 begin
                    if MessageDlg('Are you sure you want to delete this Program?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                       Windata.FertPrograms.Delete;
                 end;
           end
        else
           MessageDlg('Program must be saved before removing.',mtInformation,[mbOK],0);
     end;

end;

procedure TfmSetupFertPrograms.btnRemoveTreatmentClick(Sender: TObject);
begin
  inherited;
  if Windata.FertTreatments.RecordCount>0 then
     begin
        if not (Windata.FertTreatments.State in dsEditModes) then
           begin
              if MessageDlg('Are you sure you want to delete this Treatment?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                 Windata.FertTreatments.Delete;
           end
        else
           MessageDlg('Treatment must be saved before removing.',mtInformation,[mbOK],0);
     end;

end;

procedure TfmSetupFertPrograms.GridProgramsEnter(Sender: TObject);
begin
  inherited;
  GridProgramsDBTableView.OptionsSelection.CellSelect := True;
end;

procedure TfmSetupFertPrograms.GridProgramsExit(Sender: TObject);
begin
  inherited;
  GridProgramsDBTableView.OptionsSelection.CellSelect := False;
end;

procedure TfmSetupFertPrograms.GridTreatmentsEnter(Sender: TObject);
begin
  inherited;
  actSave.Execute;
  GridTreatmentsDBTableView.OptionsSelection.CellSelect := True;

end;

procedure TfmSetupFertPrograms.GridTreatmentsExit(Sender: TObject);
begin
  inherited;
  GridTreatmentsDBTableView.OptionsSelection.CellSelect := False;

end;

procedure TfmSetupFertPrograms.actHelpExecute(Sender: TObject);
begin
  inherited;
  WinData.HTMLHelp('ferttreatrep.htm');
end;

procedure TfmSetupFertPrograms.actSaveExecute(Sender: TObject);
begin
  inherited;
  if (Windata.FertTreatments.State in dsEditModes) then
     Windata.FertTreatments.Post;

  if (Windata.FertPrograms.State in dsEditModes) then
     Windata.FertPrograms.Post;
end;

procedure TfmSetupFertPrograms.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := ((Windata.FertTreatments.State in dsEditModes) or (Windata.FertPrograms.State in dsEditModes));
end;

end.
