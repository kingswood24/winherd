unit uAddSupplier;

//
//  This unit really adds new CUSTOMERS and NOT suppliers. Darren made a mistake throughout the Kepak Remittance Programming.
//

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TfAddSupplier = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    bOk: TButton;
    bCancel: TButton;
    DataSource1: TDataSource;
    taCustomer: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Change(Sender: TObject);

    procedure ControlKeyPress(Sender : TObject; var Key : Char);
  private
    bNew : boolean;
  public
    function Execute(bNew : boolean) : integer;
  end;

var
  fAddSupplier: TfAddSupplier;

implementation

{$R *.DFM}

function TfAddSupplier.Execute(bNew : boolean) : integer;
begin
 Self.bNew:=bNew;
 Result:=-1;
 try
  try
   //taSupplier.Open;
   taCustomer.Open;       //KVB
   if bNew then
    //taSupplier.Insert
    taCustomer.Insert    //KVB
   else
    //taSupplier.Edit;
    taCustomer.Edit;     //KVB
   if ShowModal = mrOK then
    begin
     //taSupplier.Post;
     taCustomer.Post;      //KVB
     //Result:=taSupplier.Fieldbyname('Id').asInteger;
     Result:=taCustomer.Fieldbyname('Id').asInteger;     //KVB
    end;
  finally
   //taSupplier.Cancel;
   //taSupplier.Close;
   taCustomer.Cancel;    //KVB
   taCustomer.Close;
  end;
 except
  //raise Exception.Create('tfAddSupplier.Execute() failed');
  raise Exception.Create('tfAddCustomer.Execute() failed');   //KVB
 end;
end;

procedure TfAddSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfAddSupplier.DBEdit1Change(Sender: TObject);
begin
 bOk.Enabled:=DbEdit1.Text<>'';
end;

procedure TfAddSupplier.ControlKeyPress(Sender : TObject; var Key : Char);
begin
 if key = #13 then
  begin
   key:=#0;
   postmessage(handle,WM_NEXTDLGCTL,0,0);
  end;
end;

end.
