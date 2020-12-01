unit uPopupAnimalEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxLabel, db, dbTables, GenTypesConst,
  uApplicationLog;

type
  TfmPopupAnimalEdit = class(TForm)
    btnSave: TcxButton;
    btnCancel: TcxButton;
    ActionList: TActionList;
    actSave: TAction;
    actCancel: TAction;
    lA1A2: TcxLabel;
    cmboA1A2: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDNAResults : TTable;
    FAnimalID : Integer;
    FResultSaved : Boolean;
  public
    { Public declarations }
    class procedure ShowTheForm (AAnimalID : Integer; var AResultSaved : Boolean);
  end;

var
  fmPopupAnimalEdit: TfmPopupAnimalEdit;

implementation

uses uImageStore;

{$R *.DFM}

procedure TfmPopupAnimalEdit.FormCreate(Sender: TObject);
begin
   FDNAResults := TTable.Create(nil);
   FDNAResults.DatabaseName := AliasName;
   FDNAResults.TableName := 'DNAResults';
   FDNAResults.Open;

   cmboA1A2.Properties.Items.Clear;
   cmboA1A2.Properties.Items.Add('A1/A1');
   cmboA1A2.Properties.Items.Add('A1/A2');
   cmboA1A2.Properties.Items.Add('A2/A2');
end;

class procedure TfmPopupAnimalEdit.ShowTheForm (AAnimalID : Integer; var AResultSaved : Boolean);
begin
   with TfmPopupAnimalEdit.Create(nil) do
      try
         FResultSaved := False;
         if ( AAnimalID > 0 ) then
            begin
               FAnimalID := AAnimalID;
               ShowModal;
            end;
         AResultSaved := FResultSaved;
      finally
         Free;
      end;
end;

procedure TfmPopupAnimalEdit.FormActivate(Sender: TObject);
begin
   OnActivate := nil;
   if ( FDNAResults.Locate('AnimalID',FAnimalID,[]) ) then
      if ( Length(FDNAResults.FieldByName('A1A2').AsString) > 0 ) then
         cmboA1A2.Text := FDNAResults.FieldByName('A1A2').AsString;
end;

procedure TfmPopupAnimalEdit.actSaveExecute(Sender: TObject);
begin
   if ( Length(cmboA1A2.Text) = 0 ) then
      begin
         MessageDlg('Please select an A1A2 Result',mtError,[mbOK],0);
         Exit;
      end;

   try
      if ( FDNAResults.Locate('AnimalID',FAnimalID,[]) ) then
         FDNAResults.Edit
      else
         FDNAResults.Append;
      FDNAResults.FieldByName('AnimalID').AsInteger := FAnimalID;
      FDNAResults.FieldByName('A1A2').AsString := cmboA1A2.Text;
      FDNAResults.Post;

      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Animals');
            SQL.Add('SET IsSynchronized = False');
            SQL.Add('WHERE ID = :FAID');
            Params[0].AsInteger := FAnimalID;
            ExecSQL;
         finally
            Free;
         end;

      Close;

      FResultSaved := True;
   except
      on e : Exception do
         begin
            ApplicationLog.LogException(e);
            ApplicationLog.LogError(e.Message);
            FDNAResults.Cancel;
            FResultSaved := False;
         end;
   end;
end;

procedure TfmPopupAnimalEdit.actCancelExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmPopupAnimalEdit.FormDestroy(Sender: TObject);
begin
   if ( FDNAResults <> nil ) then
      begin
         FDNAResults.Close;
         FreeAndNil(FDNAResults);
      end;
end;

end.
