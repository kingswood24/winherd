unit uRemittanceReview;

{-----------------------------------------------------
  List the available Remittance Files from the
  database for user selection
 -----------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, db, dbtables;

type
  TfRemittanceReview = class(TForm)
    lbFiles: TListBox;
    bOk: TButton;
    bCancel: TButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lbFilesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbFilesClick(Sender: TObject);
  private
    nSaleGrpsID : Integer;
  public
    function Execute : integer;
  end;

var
  fRemittanceReview: TfRemittanceReview;

implementation

{$R *.DFM}

function TfRemittanceReview.Execute : integer;
begin
 ShowModal;
 if ModalResult = mrOK then
  Result:=nSaleGrpsID
 else
  Result:=-1;
end;

procedure TfRemittanceReview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfRemittanceReview.FormShow(Sender: TObject);
var
   s : string;
begin
 LbFiles.clear;
 LbFiles.ItemHeight:=(Canvas.TextHeight('Wy')+2)*2;
 with tquery.create(Self) do
  try
   databasename:='Kingswd';
   sql.text:='select FileDate,FileType,PaymentAmt,salegrps_id from SaleGrps';
   open;

   while not eof do
    begin
     if LbFiles.Items.indexofname(fields[0].asString) = -1 then
      begin
       s:=fields[0].asString+'='+fields[2].asString+#255+fields[1].asString;
       LbFiles.items.addobject(s,pointer(fields[3].asInteger));
      end;
     next;
    end;

   close;
  finally
   free;
  end;
end;

procedure TfRemittanceReview.lbFilesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   s,s1 : string;
begin
 s:=tListBox(Control).Items[Index];
 with control as tListBox do
  begin
   s1:=copy(s,1,pos('=',s)-1);
   canvas.fillrect(rect);
   canvas.textout(rect.left+1,rect.top+1,s1);
   delete(s,1,pos('=',s));
   s1:='£'+copy(s,1,pos(#255,s)-1);
   canvas.textout(rect.right - (canvas.textwidth(s1)+10),rect.top+1,s1);
   delete(s,1,pos(#255,s));
   canvas.textout(rect.left+1,rect.top+16,s);
  end;
end;

procedure TfRemittanceReview.lbFilesClick(Sender: TObject);
begin
 with sender as tListBox do
  begin
   bOK.Enabled:=ItemIndex<>-1;
   if ItemIndex<>-1 then
    nSaleGrpsID:=integer(items.objects[ItemIndex]);
  end;
end;

end.
