unit uMovementsEventReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, Db, DBTables, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, dxBar, dxBarExtItems, ActnList,
  dxStatusBar, cxLabel, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxSpinEdit, cxCurrencyEdit,
  cxCheckBox;

type
  TfmMovementsEventReview = class(TfmBaseForm)
    pcAnimalData: TcxPageControl;
    tsAncestry: TcxTabSheet;
    tsEvents: TcxTabSheet;
    tsLactations: TcxTabSheet;
    LactationGridDBTableView: TcxGridDBTableView;
    LactationGridLevel: TcxGridLevel;
    LactationGrid: TcxGrid;
    GridDataSource: TDataSource;
    blbRemove: TdxBarLargeButton;
    actRemove: TAction;
    AncestryGrid: TcxGrid;
    AncestryGridTableView: TcxGridDBTableView;
    AncestryGridTableViewID: TcxGridDBColumn;
    AncestryGridTableViewRefID: TcxGridDBColumn;
    AncestryGridTableViewAnimalNo: TcxGridDBColumn;
    AncestryGridTableViewNatIDNum: TcxGridDBColumn;
    AncestryGridTableViewSex: TcxGridDBColumn;
    AncestryGridTableViewDateOfBirth: TcxGridDBColumn;
    AncestryGridTableViewBreed: TcxGridDBColumn;
    AncestryGridTableViewLactNo: TcxGridDBColumn;
    AncestryGridTableViewColour: TcxGridDBColumn;
    AncestryGridTableViewName: TcxGridDBColumn;
    AncestryGridTableViewHerdBookNo: TcxGridDBColumn;
    AncestryGridTableViewSireID: TcxGridDBColumn;
    AncestryGridTableViewDamID: TcxGridDBColumn;
    AncestryGridLevel: TcxGridLevel;
    LactationGridDBTableViewID: TcxGridDBColumn;
    LactationGridDBTableViewRefID: TcxGridDBColumn;
    LactationGridDBTableViewLactNo: TcxGridDBColumn;
    LactationGridDBTableViewDY: TcxGridDBColumn;
    LactationGridDBTableViewDBPc: TcxGridDBColumn;
    LactationGridDBTableViewDPPc: TcxGridDBColumn;
    LactationGridDBTableViewDLPc: TcxGridDBColumn;
    LactationGridDBTableViewCY: TcxGridDBColumn;
    LactationGridDBTableViewCBPc: TcxGridDBColumn;
    LactationGridDBTableViewCPPc: TcxGridDBColumn;
    LactationGridDBTableViewCLPc: TcxGridDBColumn;
    LactationGridDBTableViewRecs: TcxGridDBColumn;
    LactationGridDBTableViewDIM: TcxGridDBColumn;
    LactationGridDBTableViewY305: TcxGridDBColumn;
    LactationGridDBTableViewBPc305: TcxGridDBColumn;
    LactationGridDBTableViewPPc305: TcxGridDBColumn;
    LactationGridDBTableViewLPc305: TcxGridDBColumn;
    EventGrid: TcxGrid;
    EventGridDBTableView: TcxGridDBTableView;
    EventGridGridLevel: TcxGridLevel;
    EventGridDBTableViewID: TcxGridDBColumn;
    EventGridDBTableViewRefID: TcxGridDBColumn;
    EventGridDBTableViewEventType: TcxGridDBColumn;
    EventGridDBTableViewEventDate: TcxGridDBColumn;
    EventGridDBTableViewEventDesc: TcxGridDBColumn;
    EventGridDBTableViewAnimalLactNo: TcxGridDBColumn;
    tsPurchDetails: TcxTabSheet;
    dePurchaseDate: TcxDBDateEdit;
    cxLabel1: TcxLabel;
    teEventComment: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cePrice: TcxDBCurrencyEdit;
    cxLabel3: TcxLabel;
    seWeight: TcxDBSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    teLotNo: TcxDBTextEdit;
    cbIgnorePurchaseEvent: TcxDBCheckBox;
    procedure pcAnimalDataPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure actRemoveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure EventReview(ACaption : string);
  end;

var
  fmMovementsEventReview: TfmMovementsEventReview;

implementation

uses uKImport, uHerdLookup;

{$R *.DFM}

procedure TfmMovementsEventReview.pcAnimalDataPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if fKImport <> nil then
     begin
        GridDataSource.Dataset.Refresh;
        BarManager.LockUpdate := True;
        try
           blbRemove.Visible := ivNever;
           if NewPage = tsAncestry then
              begin
                 GridDataSource.Dataset := fKImport.FAncestryTable;
                 AncestryGridTableView.Controller.FocusedRowIndex := 0;
                 blbRemove.Visible := ivAlways;
              end
           else if NewPage = tsEvents then
              begin
                 GridDataSource.Dataset := fKImport.FEventTable;
                 EventGridDBTableView.Controller.FocusedRowIndex := 0;
                 blbRemove.Visible := ivAlways;
              end
           else if NewPage = tsLactations then
              begin
                 GridDataSource.Dataset := fKImport.FLactationTable;
                 LactationGridDBTableView.Controller.FocusedRowIndex := 0;
                 blbRemove.Visible := ivAlways;
              end
           else if NewPage = nil then
              Close;
        finally
           BarManager.LockUpdate := False;
        end;
     end
  else
     Close;
end;

procedure TfmMovementsEventReview.actRemoveExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('This record will be removed from the import, are you sure?',mtConfirmation,[mbyes,mbNo],0) = idYes then
     GridDataSource.Dataset.Delete;
end;

procedure TfmMovementsEventReview.FormCreate(Sender: TObject);
begin
  inherited;
  if fKImport <> nil then
     begin
        GridDataSource.Dataset := fKImport.FAncestryTable;
        pcAnimalData.ActivePage := tsPurchDetails;
        blbRemove.Visible := ivNever;

        tsLactations.Visible := (fKImport.FLactationTable.RecordCount>0);

        dePurchaseDate.DataBinding.Datasource := fKImport.dsCurrTableData;
        teEventComment.DataBinding.Datasource := fKImport.dsCurrTableData;
        cePrice.DataBinding.Datasource := fKImport.dsCurrTableData;
        seWeight.DataBinding.Datasource := fKImport.dsCurrTableData;
        teLotNo.DataBinding.Datasource := fKImport.dsCurrTableData;
        cbIgnorePurchaseEvent.DataBinding.Datasource := fKImport.dsCurrTableData;

     end
  else
     GridDataSource.Dataset := nil;
end;

class procedure TfmMovementsEventReview.EventReview(ACaption: string);
begin
   with TfmMovementsEventReview.Create(nil) do
      try
         Caption := 'Animal data review - '+ACaption;
         ShowModal;
      finally
         Free;
      end;
end;

end.
