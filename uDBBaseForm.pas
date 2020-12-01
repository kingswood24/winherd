unit uDBBaseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, dxBar, dxBarExtItems, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeels,
  cxGridChartView, cxGridDBChartView, cxGridCardView, cxGridDBCardView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGrid,
  cxStyles, dxStatusBar, db, dbTables;

type
  TfmDBBaseForm = class(TForm)
    BarManager: TdxBarManager;
    blbExit: TdxBarLargeButton;
    ActionList: TActionList;
    actExit: TAction;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    blbAdd: TdxBarLargeButton;
    blbDelete: TdxBarLargeButton;
    blbEdit: TdxBarLargeButton;
    blbSave: TdxBarLargeButton;
    blbCancel: TdxBarLargeButton;
    blbFirst: TdxBarLargeButton;
    blbNext: TdxBarLargeButton;
    blbPrior: TdxBarLargeButton;
    blbLast: TdxBarLargeButton;
    actAdd: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actSave: TAction;
    actCancel: TAction;
    actRefresh: TAction;
    actFirst: TAction;
    actNext: TAction;
    actPrevious: TAction;
    actLast: TAction;
    LookAndFeelController: TcxLookAndFeelController;
    EditStyleController: TcxEditStyleController;
    StatusBar: TdxStatusBar;
    StyleRepository: TcxStyleRepository;
    GridViewRepository: TcxGridViewRepository;
    DBBandedTableView: TcxGridDBBandedTableView;
    DBTableView: TcxGridDBTableView;
    DBCardView: TcxGridDBCardView;
    DBChartView: TcxGridDBChartView;
    LabelStyleController: TcxEditStyleController;
    procedure actExitExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actFirstUpdate(Sender: TObject);
    procedure actNextUpdate(Sender: TObject);
    procedure actPreviousUpdate(Sender: TObject);
    procedure actLastUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure SetFormDataSource(const Value: TDataSource);
    { Private declarations }
  protected
     FUpdateDBNavButtonStatus : Boolean;
     FDataSource : TDataSource;
     procedure SetupControls; virtual;
     function GetFormDataSource: TDataSource;
     procedure SetScreenLookAndFeel;
  public
     property FormDataSource : TDataSource read GetFormDataSource write SetFormDataSource;
    { Public declarations }
  end;

var
  fmDBBaseForm: TfmDBBaseForm;

implementation

uses uImageStore, uWinOS;

{$R *.DFM}

procedure TfmDBBaseForm.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmDBBaseForm.actHelpExecute(Sender: TObject);
begin
   // Call Help File
end;

procedure TfmDBBaseForm.SetScreenLookAndFeel;
begin
   if uWinOS.WindowsOS = winXP then
      begin
      end;
end;

procedure TfmDBBaseForm.actAddUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actAdd.Enabled := not ( FormDataSource.State in dsEditModes )
   else
      actAdd.Enabled := True;
end;

procedure TfmDBBaseForm.actDeleteUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actDelete.Enabled := ( FormDataSource.State <> dsInsert )
   else
      actDelete.Enabled := True;
end;

procedure TfmDBBaseForm.actEditUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actEdit.Enabled := ( FormDataSource.State = dsBrowse )
   else
      actEdit.Enabled := True;
end;

procedure TfmDBBaseForm.actSaveUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actSave.Enabled := ( FormDataSource.State in dsEditModes )
   else
      actSave.Enabled := True;
end;

procedure TfmDBBaseForm.actRefreshUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actRefresh.Enabled := not ( FormDataSource.State in dsEditModes )
   else
      actRefresh.Enabled := True;
end;

procedure TfmDBBaseForm.actFirstUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actFirst.Enabled := not ( FormDataSource.DataSet.Bof )
   else
      actFirst.Enabled := True;
end;

procedure TfmDBBaseForm.actNextUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actNext.Enabled := not ( FormDataSource.DataSet.Eof )
   else
      actNext.Enabled := True;
end;

procedure TfmDBBaseForm.actPreviousUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actPrevious.Enabled := not ( FormDataSource.DataSet.Bof )
   else
      actPrevious.Enabled := True;
end;

procedure TfmDBBaseForm.actLastUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actNext.Enabled := not ( FormDataSource.DataSet.Eof )
   else
      actNext.Enabled := True;
end;

function TfmDBBaseForm.GetFormDataSource: TDataSource;
begin
   if FDataSource = nil then
      raise Exception.Create('form datasource not assigned');
   Result := FDataSource;
end;

procedure TfmDBBaseForm.SetupControls;
begin
   SetScreenLookAndFeel;
end;

procedure TfmDBBaseForm.actSaveExecute(Sender: TObject);
begin
   FormDataSource.DataSet.Post;
end;

procedure TfmDBBaseForm.actCancelExecute(Sender: TObject);
begin
   FormDataSource.DataSet.Cancel;
end;

procedure TfmDBBaseForm.actCancelUpdate(Sender: TObject);
begin
   if FUpdateDBNavButtonStatus then
      actCancel.Enabled := ( FormDataSource.State <> dsBrowse )
   else
      actCancel.Enabled := True;
end;

procedure TfmDBBaseForm.SetFormDataSource(const Value: TDataSource);
begin
   if Value <> FDataSource then
      FDataSource := Value;
end;

procedure TfmDBBaseForm.FormCreate(Sender: TObject);
begin
   ImageStore := TImageStore.Create(nil);
   FUpdateDBNavButtonStatus := True;
end;

procedure TfmDBBaseForm.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ImageStore);
end;

end.
