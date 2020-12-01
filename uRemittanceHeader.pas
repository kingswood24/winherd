{
   19/03/14 [V5.2 R9.0] /MK Additional Feature - Default Herd Owner to DefaultHerdID.
                                               - Changed caption of Label2 & Label3 for better understanding for user - GL.

   21/03/14 [V5.2 R9.0] /MK Additional Feature - Enable OK button after Herd Owner is defaulted
}

unit uRemittanceHeader;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, db, dbtables;

type
  TfRemittanceHeader = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Query1: TQuery;
    Button1: TButton;
    bOk: TButton;
    bCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    //SupplierName : String;
    CustomerName : String;   //KVB
    ProducerName : String;
  public
    //function Execute(SupplierName,ProducerName : String;var SupplierID, ProducerID : integer) : boolean;
    function Execute(CustomerName,ProducerName : String;var CustomerID, ProducerID : integer) : boolean;     //KVB
  end;

var
  fRemittanceHeader: TfRemittanceHeader;

implementation

{$R *.DFM}
uses
    uAddSupplier;    //Note this really adds a new Customer - KVB

//function TfRemittanceHeader.Execute(SupplierName,ProducerName : String;var SupplierID, ProducerID : integer) : boolean;
function TfRemittanceHeader.Execute(CustomerName,ProducerName : String;var CustomerID, ProducerID : integer) : boolean;    //KVB
begin
 //Self.SupplierName:=SupplierName;
 Self.CustomerName:=CustomerName;    //KVB
 Self.ProducerName:=ProducerName;
 Result:=ShowModal = mrOK;
 if Result then
  begin
   //SupplierID:=integer(ComboBox1.items.Objects[ComboBox1.ItemIndex]);
   CustomerID:=integer(ComboBox1.items.Objects[ComboBox1.ItemIndex]);   //KVB
   ProducerID:=integer(ComboBox2.items.Objects[ComboBox2.ItemIndex]);
  end;
end;

procedure TfRemittanceHeader.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfRemittanceHeader.FormShow(Sender: TObject);
var
   bFound : Boolean;
   nIndex : integer;
begin
   with query1 do
      begin
         //sql.text:='select Name,ID from SuppliersBreeders order by Name';
         sql.text:='select Name,ID from Customers order by Name';       //KVB
         open;
         while not eof do
          begin
             nIndex:=ComboBox1.Items.AddObject(fields[0].asString,Pointer(fields[1].asInteger));
             //if Uppercase(fields[0].asString) = Uppercase(SupplierName) then
             if Uppercase(fields[0].asString) = Uppercase(CustomerName) then     //KVB
                begin
                   ComboBox1.ItemIndex:=nIndex;
                   Label4.Visible:=False;
                end;
             Next;
          end;
         close;

         //sql.text:='select Name,ID from SysUsers order by Name';
         //sql.text:='select Name,ID from Owners order by Name';     //KVB

         //   19/03/14 [V5.2 R9.0] /MK Additional Feature - Default Herd Owner to DefaultHerdID.
         SQL.Text := 'SELECT Name, ID'+#13#10+
                     'FROM OWNERS'+#13#10+
                     'WHERE ID IN (SELECT DefaultHerdID FROM Defaults)';
         open;
         while ( not(Eof) ) do
            begin
               nIndex := ComboBox2.Items.AddObject(fields[0].asString,Pointer(fields[1].asInteger));
               //if Uppercase(fields[0].asString) = Uppercase(ProducerName) then
                //begin
               ComboBox2.ItemIndex:=nIndex;
               Label5.Visible:=False;
                //end;
               Next;
            end;
         close;

         //sql.text:='select ID from SuppliersBreeders where Upper(Name) = :Name';
         sql.text:='select ID from Customers where Upper(Name) = :Name';   //KVB
         //params[0].asString:=Uppercase(SupplierName);
         params[0].asString:=Uppercase(CustomerName);     //KVB
         open;
         if (eof and bof) then
            ComboBox1.ItemIndex:=0
         else
            ComboBox1.ItemIndex:=ComboBox1.Items.IndexOfObject(pointer(fields[0].asInteger));

         //sql.text:='select ID from SysUsers where Upper(Name) = :Name';
         sql.text:='select ID from Owners where Upper(Name) = :Name';    //KVB
         params[0].asString:=Uppercase(ProducerName);
         open;
         if (eof and bof) then
            ComboBox1.ItemIndex:=0
         else
            ComboBox1.ItemIndex:=ComboBox1.Items.IndexOfObject(pointer(fields[0].asInteger));
      end;

   bOk.Enabled:=(ComboBox1.ItemIndex<>-1) and (ComboBox2.ItemIndex<>-1);
end;

procedure TfRemittanceHeader.Button1Click(Sender: TObject);
var
   //nSupplierID : integer;
   nCustomerID : integer;   //KVB

begin
 //nSupplierID:=tfAddSupplier.Create(Self).Execute(True);
 //if nSupplierID<>-1 then
 nCustomerID:=tfAddSupplier.Create(Self).Execute(True);    //KVB
 if nCustomerID<>-1 then
  begin
   with query1 do
    begin
     ComboBox1.Clear;
     //sql.text:='select Name,ID from SuppliersBreeders order by Name';
     sql.text:='select Name,ID from Customers order by Name';      //KVB
     open;
     while not eof do
      begin
       ComboBox1.Items.AddObject(fields[0].asString,Pointer(fields[1].asInteger));
       Next;
      end;
     close;
     //ComboBox1.ItemIndex:=ComboBox1.Items.IndexOfObject(pointer(nSupplierID));
     ComboBox1.ItemIndex:=ComboBox1.Items.IndexOfObject(pointer(nCustomerID));  //KVB
    end;
  end;
end;

procedure TfRemittanceHeader.ComboBox1Change(Sender: TObject);
begin
   bOk.Enabled:=(ComboBox1.ItemIndex<>-1) and (ComboBox2.ItemIndex<>-1);
end;

end.
