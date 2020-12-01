unit uRemittanceAnimal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

const
   RMProp_Cancel = 0; {cancel - nochanges}
   RMProp_OK     = 1; {ok, there were changes, replace the line}
   RMProp_Delete = 2; {delete the line}

type
  TfAnimalRemittanceProp = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    bOk: TButton;
    bCancel: TButton;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    ComboBox1: TComboBox;
    lblBadIdNumber: TLabel;
    bChange: TButton;
    bRemove: TButton;
    Edit3: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Label12: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure NumericKeyPress(Sender : tObject;var Key : Char);
    procedure DecimalKeyPress(Sender : tObject;var Key : Char);
    procedure NumericSpacesKeyPress(Sender : tObject;var Key : Char);
    procedure bRemoveClick(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
    procedure bOkClick(Sender: TObject);
  private
    sLine : String;

    nModalResult : integer;
    procedure DecodeLine(s : string);
  public
    function  Execute(var sLine : String;bNatIdEdit : boolean) : integer;
  end;

var
  fAnimalRemittanceProp: TfAnimalRemittanceProp;

implementation

{$R *.DFM}
uses
    uRemittance,
    BeefRemit,
    BeefRemitLine,
    dazMisc,
    uSelectAnimalByNatId;


function tfAnimalRemittanceProp.Execute(var sLine : String;bNatIdEdit : boolean) : Integer;
const
   Colors : array [False..True] of tColor = (clBtnFace,clWindow);
begin
// Edit1.ReadOnly:=not bNatIdEdit;

 Edit1.Color:=Colors[bNatIdEdit];
 bOk.Enabled:=not bNatIdEdit;
 bChange.Visible:=bNatIdEdit;
 bRemove.Visible:=bNatIdEdit;
 lblBadIdNumber.Visible:=bNatIDEdit;

 self.sLine:=sLine;
 DecodeLine(sLine);
 ShowModal;
 case ModalResult of
  mrOK     : begin
              Result:=RMProp_OK;
              sLine:=self.sLine;
             end;
  mrCancel : Result:=RMProp_Cancel;
  mrYes    : Result:=RMProp_Delete;
 end;
end;

procedure TfAnimalRemittanceProp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TfAnimalRemittanceProp.DecodeLine(s : string);
begin
 with tBeefRemitCarcaseLine.Create(BeefRemitCarcaseLineType) do
  begin
   Load(s);
   Edit1.Text:=National;
   Edit2.Text:=Carcase;
   ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(Sex);
   Edit4.Text:=Grade;
   Edit5.Text:=FloattoStr(LWeight);
   Edit6.Text:=FloattoStr(RWeight);
   Edit7.Text:=Condemned;
   Edit8.Text:=FloatToStr(CWeight);
   Edit9.Text:=FloatToStr(PricePer);
   Edit10.Text:=FloatToStr(Value);
   Edit3.Text:=FloatToStr(LiveWeight);
   Edit11.Text:=FloatToStr(TotalDeductions);
  end;
end;

procedure tfAnimalRemittanceProp.NumericKeyPress(Sender : tObject;var Key : Char);
begin
 if not (key in ['0'..'9',#8]) then
  key:=#0;
end;

procedure tfAnimalRemittanceProp.DecimalKeyPress(Sender : tObject;var Key : Char);
begin
 if not (key in ['0'..'9','.',#8]) then
  key:=#0
 else
 if key='.' then
  if pos('.',tEdit(Sender).Text)>0 then
   key:=#0;
end;

procedure tfAnimalRemittanceProp.NumericSpacesKeyPress(Sender : tObject;var Key : Char);
begin
 if not (key in ['0'..'9',' ',#8]) then
  key:=#0;
end;

procedure TfAnimalRemittanceProp.bRemoveClick(Sender: TObject);
begin
 If  Application.MessageBox(pchar('Removing this item from the Remittance Docket will '+
                                  'result in an incorrect total and/or incorrect deductions.'+#10#13#10#13+
                                  'Are you sure ?'),
                                  'Delete Carcase from Sales Docket',
                            MB_ICONWARNING + MB_YESNO) = idYES then
  begin
   close;
   modalresult:=mrYes; // alias for delete line
  end;
end;

procedure TfAnimalRemittanceProp.bChangeClick(Sender: TObject);
var
   sNewNatId : string;
begin
 if tfSelectAnimalByNatId.Create(Self).Execute(sNewNatId) then
  begin
   Edit1.Text:=sNewNatId;
   bOk.Enabled:=CarcaseExists(sNewNatId)<>-1;
   lblBadIdNumber.Visible:=False;
  end;
end;

procedure TfAnimalRemittanceProp.bOkClick(Sender: TObject);
begin
 with tBeefRemitCarcaseLine.Create(BeefRemitCarcaseLineType) do
  try
   National:=Edit1.Text;
   Carcase:=Edit2.Text;
   Sex:=ComboBox1.Items[ComboBox1.ItemIndex];
   Grade:=Edit4.Text;

   try
    LWeight:=StrToFloat(Edit5.Text);
   except
    raise exception.create('Left Weight is invalid');
   end;

   try
    RWeight:=StrToFloat(Edit6.Text);
   except
    raise exception.create('Right Weight is invalid');
   end;

   Condemned:=Edit7.Text;

   try
    CWeight:=StrToFloat(Edit8.Text);
   except
    raise exception.create('Cold Weight is invalid');
   end;

   try
    PricePer:=StrToFloat(Edit9.Text);
   except
    raise exception.create('Price Per Kg is invalid');
   end;

   try
    Value:=StrToFloat(Edit10.Text);
   except
    raise exception.create('Value is invalid');
   end;

   try
    LiveWeight:=StrToFloat(Edit3.Text);
   except
    raise exception.create('Live Weight is invalid');
   end;

   try
    TotalDeductions:=StrToFloat(Edit11.Text);
   except
    raise exception.create('Total Deductions is invalid');
   end;

   sLine:=Save;
  finally
   free;
  end;


 close;
 ModalResult:=mrOK;
end;

end.
