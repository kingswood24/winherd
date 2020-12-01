unit uEventDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxRichEd, DBRichEd, db, dbtables, DBCtrls;

type
  TEventDesc = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    lEventCommentDesc: TLabel;
    dsEventDesc: TDataSource;
    dbmEventDesc: TDBMemo;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  procedure ShowForm(ADataSource : TDataSource; AFieldName : String);

var
  EventDesc: TEventDesc;

implementation
uses
   GenTypesConst;

  procedure ShowForm(ADataSource : TDataSource; AFieldName : String);
  begin
     Application.CreateForm(TEventDesc, EventDesc);
     try

        if ( ADataSource.DataSet is TTable ) then
           begin

              if Assigned( TTable(ADataSource.DataSet).MasterSource ) then
              if Assigned( TTable(ADataSource.DataSet).MasterSource.DataSet) then
                 if (TTable(ADataSource.DataSet).MasterSource.DataSet is TTable ) then
                    case TTable(TTable(ADataSource.DataSet).MasterSource.DataSet).FieldByName('EventType').AsInteger of
                       cHealthEvent : EventDesc.lEventCommentDesc.Caption := 'Detailed Health Description';
                    end;
           end;

        EventDesc.dbmEventDesc.DataField := AFieldName;
        EventDesc.dbmEventDesc.DataSource := ADataSource;
        EventDesc.ShowModal;
     finally
        FreeAndNil(EventDesc);
     end;
  end;

{$R *.DFM}

procedure TEventDesc.Button3Click(Sender: TObject);
begin
   if MessageDlg('Clear Event Description, are you sure?',mtConfirmation,[mbYes,mbOK],0) = idYes then
      begin
         if (dbmEventDesc.Field.DataSet.State in dsEditModes) then
            dbmEventDesc.Field.Clear;
      end;
end;

end.
