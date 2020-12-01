unit uSelectAnimalByNatID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls;

type
  TfSelectAnimalByNatID = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    Panel1: TPanel;
    bOk: TButton;
    bCancel: TButton;
    Timer1: TTimer;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    sSearchKey : string;
    { Private declarations }
  public
    function  Execute(var NatId : String) : boolean;
  end;

var
  fSelectAnimalByNatID: TfSelectAnimalByNatID;

implementation

{$R *.DFM}

procedure TfSelectAnimalByNatID.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

function  TfSelectAnimalByNatId.Execute(var NatId : String) : boolean;
begin
 Query1.Open;
 Query1.Locate('NatIdNum',NatId,[]);
 Result:=ShowModal = mrOK;
 if Result then
  NatId:=Query1.Fields[1].asString;
 Query1.Close;
end;

procedure TfSelectAnimalByNatID.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if Field = nil then
  with tDataSource(Sender) do
   if State = dsBrowse then
    bOk.Enabled:=not (DataSet.Eof and DataSet.Bof);
end;

procedure TfSelectAnimalByNatID.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 Timer1.Enabled:=False;
 if upcase(key) in ['0'..'9','A'..'Z',#32] then
  begin
   sSearchKey:=sSearchKey+key;
   Timer1.Enabled:=True;

   if not query1.locate('natidnum',sSearchKey,[loCaseInsensitive, loPartialKey]) then
    begin
     sSearchKey:='';
     beep;
    end;

  end
 else
 if key = #27 then
  sSearchKey:=''
 else
 if key = #13 then
  DBGrid1DblClick(Sender);
 StaticText1.Caption:=sSearchKey;
 StaticText1.Visible:=sSearchKey<>'';
end;

procedure TfSelectAnimalByNatID.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled:=False;
 sSearchKey:='';
 StaticText1.Visible:=False;
end;

procedure TfSelectAnimalByNatID.DBGrid1DblClick(Sender: TObject);
begin
 with query1 do
  if not (eof and bof) then
   begin
    self.close; {scope to form}
    ModalResult:=mrOK;
   end
  else
   beep;
end;

end.
