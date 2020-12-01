unit uNBASVenNoUpdate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, GenTypesConst;

type

  TfmNBASVenNoUpdate = class(TForm)
    ePermitType: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    eVenNoRange: TEdit;
    eSerialNoAllocs: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    sPermitType : Char;
    SerialNo : Integer;
    function CheckDigit(Code : String):Integer;
  public
    { Public declarations }
    class procedure ShowNBASUpdateForm(APermitType : TNBASPermits);
  end;


var
  fmNBASVenNoUpdate: TfmNBASVenNoUpdate;

implementation

uses Def, DairyData;

{$R *.DFM}

{ TfmNBASVenNoUpdate }

class procedure TfmNBASVenNoUpdate.ShowNBASUpdateForm(APermitType: TNBASPermits);
begin
   with TfmNBASVenNoUpdate.Create(nil) do
      try
         case APermitType of
            NBAS31G : sPermitType := 'G';
         end;
         SerialNo := Def.Definition.dSerialNo;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmNBASVenNoUpdate.Button1Click(Sender: TObject);
var
   CalcSerialNo, CalcAllocs : integer;
   CalcVenNo, StartVenNo : Integer;
   AllocNo : Integer;
   NoDays : Integer;
   Pass : string;
begin
   if Trim( eVenNoRange.Text ) = '' then
      raise Exception.Create('Please enter the code correctly')
   else if Trim( eSerialNoAllocs.Text ) = '' then
      raise Exception.Create('Please enter the code correctly')
   else if Trim( ePermitType.Text ) = '' then
      raise Exception.Create('Please enter the code correctly');

   try
      Pass := Trim(eVenNoRange.Text);
      CalcVenNo := StrToInt(Copy(Pass,1,length(Pass)-1));
   except
      raise Exception.Create('Please enter the code correctly');
   end;

   try
      AllocNo := StrToInt(eSerialNoAllocs.Text);
   except
      raise Exception.Create('Please enter the code correctly');
   end;

   if ePermitType.Text[1] <> sPermitType then
      raise Exception.Create('Invalid permit type, please re-enter code correctly');

   NoDays := Trunc( Date );

   if CheckDigit(Pass) = StrtoInt( Pass[Length(Pass)] ) then
      begin
         CalcAllocs := NoDays xor AllocNo;
         CalcAllocs := CalcAllocs - SerialNo;
         if not (CalcAllocs in [40,50,80,100,130,150,180,210]) then
            raise Exception.Create('Invalid registration number');

         StartVenNo := ((serialNo * CalcAllocs xor NoDays * 10 ) xor CalcVenNo);

         if not ( ( StartVenNo >= 8460000 ) and ( StartVenNo < 9460000 )) then
            raise Exception.Create('Invalid registration number');


         with Windata.CMMSPermits do
            try
               Append;
               FieldByName('PermitType').AsString   := sPermitType;
               FieldByName('StartVenNo').AsInteger  := StartVenNo;
               FieldByName('Allocation').AsInteger := CalcAllocs;
               FieldByName('Remaining').AsInteger := CalcAllocs;
               FieldByName('CurrentVenNo').AsInteger := StartVenNo;
               Post;

               MessageDlg('Update completed',mtInformation,[mbOK],0);
            except
               Cancel;
               raise Exception.Create('Error posting data');
            end;
      end
   else
      raise Exception.Create('Invalid registration number');
end;

function TfmNBASVenNoUpdate.CheckDigit(Code: String): Integer;
var
  i, PreResult : Integer;
begin
   Code := Copy(Code,1,length(Code)-1);
   PreResult := 0;
   for i := 1 to length(Code) do
      PreResult := PreResult + StrToInt(Code[i]);
   while Length(IntToStr(PreResult)) > 1 do
      begin
         PreResult := ((StrToInt(Copy(IntToStr(PreResult),1,1)))+
                       (StrToInt(Copy(IntToStr(PreResult),2,1))));
      end;
   RESULT := PreResult;
end;

procedure TfmNBASVenNoUpdate.Button2Click(Sender: TObject);
begin
   Close;
end;

end.
