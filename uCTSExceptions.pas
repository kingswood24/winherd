unit uCTSExceptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, cxMemo, cxDBEdit, cxLabel, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxButtons, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, Db, DBTables, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfmCTSExceptions = class(TForm)
    ExceptionsGrid: TcxGrid;
    ExceptionsGridTableView: TcxGridDBTableView;
    ExceptionsGridLevel: TcxGridLevel;
    ExceptionsQuery: TQuery;
    dsExceptionsQuery: TDataSource;
    ExceptionsGridTableViewXMLType: TcxGridDBColumn;
    ExceptionsGridTableViewExDate: TcxGridDBColumn;
    ExceptionsGridTableViewExNum: TcxGridDBColumn;
    ExceptionsGridTableViewExMsg: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel4: TcxLabel;
    Bevel1: TBevel;
    ExceptionsGridTableViewTxnId: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ViewCTSExceptions;
  end;

var
  fmCTSExceptions: TfmCTSExceptions;

implementation

{$R *.DFM}

{ TfmCTSExceptions }

class procedure TfmCTSExceptions.ViewCTSExceptions;
begin
   with TfmCTSExceptions.Create(nil) do
      try
         ExceptionsQuery.Active := True;
         if ( ExceptionsQuery.RecordCount > 0 )then
            ShowModal
         else
            MessageDlg('No CTS exceptions have been recorded',mtInformation,[mbOK],0);
      finally
         Free;
      end;
end;

procedure TfmCTSExceptions.FormDestroy(Sender: TObject);
begin
   ExceptionsQuery.Active := False;
end;

end.
