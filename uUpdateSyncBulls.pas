unit uUpdateSyncBulls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, dbTables, StdCtrls, cxButtons, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxGroupBox;

type
  TfmUpdateSyncBulls = class(TForm)
    gbUpdateSyncBulls: TcxGroupBox;
    seNoBulls: TcxSpinEdit;
    lInfo: TcxLabel;
    btnUpdate: TcxButton;
    btnClose: TcxButton;
    procedure btnUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure ShowTheForm;
    { Public declarations }
  end;

const
   AliasName = 'Kingswd';

var
  fmUpdateSyncBulls: TfmUpdateSyncBulls;

implementation

{$R *.DFM}

class procedure TfmUpdateSyncBulls.ShowTheForm;
begin
   with TfmUpdateSyncBulls.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmUpdateSyncBulls.FormCreate(Sender: TObject);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MaxInUseBullCount');
         SQL.Add('FROM SyncDefaults');
         try
            Open;
            seNoBulls.Value := Fields[0].AsVariant;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;

   btnUpdate.Enabled := True;
end;

procedure TfmUpdateSyncBulls.btnUpdateClick(Sender: TObject);
begin
   if seNoBulls.Value = 0 then
      begin
         MessageDlg('Max number of bulls must be greater than zero (0).',mtError,[mbOK],0);
         Exit;
      end;

   if seNoBulls.Value > 50 then
      begin
         MessageDlg('Max number of bulls cannot be greater than 50.'+#13#10+
                    'Please change to another value less or equal than 50.',mtError,[mbOK],0);
         Exit;
      end;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE SyncDefaults');
         SQL.Add('SET MaxInUseBullCount = '+VarToStr(seNoBulls.Value)+'');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;

   btnUpdate.Enabled := False;
end;

procedure TfmUpdateSyncBulls.btnCloseClick(Sender: TObject);
begin
   Close;
end;

end.
