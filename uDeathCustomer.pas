unit uDeathCustomer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup, DBCtrls, Mask, DBCtrlsEh, DBLookupEh;

type
  TfDeathCustomer = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    CustomerD: TRxDBLookupCombo;
    Button2: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure GetCustomer(var id : Integer);

var
  fDeathCustomer: TfDeathCustomer;

implementation

uses DairyData, uCustomers;

{$R *.DFM}

  procedure GetCustomer(var id : Integer);
  begin
     ID := 0;
     Application.CreateForm(TfDeathCustomer, fDeathCustomer);
     try
        fDeathCustomer.ShowModal;
        if fDeathCustomer.ModalResult = mrOK then
           ID := fDeathCustomer.CustomerD.KeyValue; // DataSource.DataSet.Fieldbyname('ID').AsInteger;
     finally
        fDeathCustomer.Free;
     end;
  end;

procedure TfDeathCustomer.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if Modalresult = mrok then
    if CustomerD.Value = '0' then
        begin
           MessageDlg('You must enter a customer',mtInformation,[mbOK],0);
           Canclose := False;
        end;
end;

end.
