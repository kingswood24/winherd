unit uCMMSAlloc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RXCtrls, ToolWin, Mask;

type
  TfCMMSAlloc = class(TForm)
    tbAllocation: TToolBar;
    sbUpdate: TRxSpeedButton;
    tbt1: TToolButton;
    sbExitAlloc: TRxSpeedButton;
    Label1: TLabel;
    lResult: TLabel;
    eOne: TMaskEdit;
    eThree: TMaskEdit;
    eTwo: TMaskEdit;
    eFour: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure sbExitAllocClick(Sender: TObject);
    procedure sbUpdateClick(Sender: TObject);
    procedure eOneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function CheckCode(Code, Serial : String): Boolean;
    function CheckDigit(Code : String):Integer;
    function PadLeft(Var St : String; Len : Integer): String;
  public
    { Public declarations }
  end;

var
  fCMMSAlloc: TfCMMSAlloc;

implementation
uses
   Def,
   DairyData;

{$R *.DFM}

procedure TfCMMSAlloc.FormShow(Sender: TObject);
begin
   lResult.Hide;
   eOne.Text   := '';
   eTwo.Text   := '';
   eThree.Text := '';
end;

procedure TfCMMSAlloc.sbExitAllocClick(Sender: TObject);
begin
   Close;
end;

procedure TfCMMSAlloc.sbUpdateClick(Sender: TObject);
var
   AllocCode,
   SerialNo : string;
begin
     //The format seems to be relatively simple to decipher, especially if the Farmer keeps a note of the code given to him,
     //the number appearing on the forms and his Serial Number (which at the very least remains constant every time he gets a
     //new code but is also shown on the Help/About Screen). This could lead to abuses by Farmers and possible Fraud. KVB 11/09/2000
//***************************************************************************************************************************************************
   // no shit sherlock! i suppose you would have preferred an enigma cipher matrix or perhaps a macro identifier!
   // how did you figure it out? was it perhaps the notes i've put all the way through the fuckin' unit? or is it your famous military intelligence skills?
   // well lets see you do better with two days to plan and execute the whole fuckin' unit and lynskey breathing down your neck!
   // coming from someone who can't code to save themselves (oh yes keith, i know you really don't have a fuckin' clue!) you wouldn't know where to start.
   // anyway, it's only designed to prevent the farmer from making a mistake, not as a preventative measure against james fuckin' bond.
   // and lets get the facts straight here. they are farmers. they don't even know anything about computers ... kinda like you ... - kr - 16/11/00
//***************************************************************************************************************************************************
   AllocCode := (eOne.Text + eTwo.Text + eThree.Text + eFour.Text);
   // use serial no as check for form no input
   SerialNo := IntToStr(Def.Definition.dSerialNo);
   SerialNo := PadLeft(SerialNo,5);
{  changed 16/11/00 to allow for all serial nos < 5 numbers long - kr
   if Length(IntToStr(Def.Definition.dSerialNo)) = 4 then
      SerialNo := ('0' + IntToStr(Def.Definition.dSerialNo))
   else
      SerialNo := IntToStr(Def.Definition.dSerialNo);
}
   if CheckCode(AllocCode,SerialNo) then
      begin
         lResult.Caption := 'Update OK!';
         lResult.Show;
         // update database
         with WinData.CMMS do
            begin
               Append;
               FieldByName('InitCMMSNo').AsInteger     := StrToInt(Copy(AllocCode,7,6));
               FieldByName('CMMSAllocation').AsInteger := StrToInt(Copy(AllocCode,6,1)+'0');
               FieldByName('CurrCMMSNo').AsInteger     := StrToInt(Copy(AllocCode,7,6)+'1');
               FieldByName('LastCMMSNo').AsInteger     := (StrToInt(Copy(AllocCode,7,6)+'0')+
                                                           StrToInt(Copy(AllocCode,6,1)+'0'));
               Post;
            end;
         eOne.Enabled   := False;
         eTwo.Enabled   := False;
         eThree.Enabled := False;
         eFour.Enabled  := False;
      end;
end;

function TfCMMSAlloc.CheckCode(Code, Serial : String):Boolean;
type
   TNumeric = set of Char;
var
   NonZeroNumeric : TNumeric;
begin
   NonZeroNumeric := ['1'..'9'];
   try
      RESULT := True;
      // check all spaces are filled
      if Length(Code) <> 13 then      //Code length is invariably always 13 - need to strip all spaces
         begin
            RESULT := False;
            Abort;
         end;
      // check first five characters equal customers serial no
      if ((StrToInt(Copy(Code,1,5))) <> StrToInt(Serial)) then
         begin
            RESULT := False;
            Abort;
         end;
      // check allocation digit is numeric & non-zero
      if NOT (Code[6] in NonZeroNumeric) then
         begin
            RESULT := False;
            Abort;
         end;
      // check allocation number is within range
      if (StrToInt(Copy(Code,7,6)) > 590000) or (StrToInt(Copy(Code,7,6)) < 560000) then
         begin
            RESULT := False;
            Abort;
         end;
      // check allocation number not already used
      WinData.CMMS.First;
      while (NOT WinData.CMMS.EOF) do
         begin
            if (IntToStr(WinData.CMMS.FieldByName('InitCMMSNo').AsInteger)) = (Copy(Code,7,6)) then
               begin
                  RESULT := False;
                  Abort;
               end;
            WinData.CMMS.Next;
         end;
      // check last 'check digit'
      if StrToInt(Copy(Code,13,1)) <> CheckDigit(Code) then
         begin
            RESULT := False;
            Abort;
         end;
   except
      RESULT := FALSE;   //KVB 11/09/2000
      //Need the above line in case StrToInt() finds a non integer within the brackets, etc.
      eOne.Text   := '';
      eTwo.Text   := '';
      eThree.Text := '';
      eFour.Text  := '';
      eOne.SetFocus;
      lResult.Caption := 'Incorrect Code! Please re-enter';
      lResult.Show;
   end;
end;

function TfCMMSAlloc.CheckDigit(Code : String):Integer;
var
   PreResult : Integer;
begin
   PreResult := (StrToInt(Copy(Code,1,1)) + StrToInt(Copy(Code,2,1)) +
                 StrToInt(Copy(Code,3,1)) + StrToInt(Copy(Code,4,1)) +
                 StrToInt(Copy(Code,5,1)) + StrToInt(Copy(Code,6,1)) +
                 StrToInt(Copy(Code,7,1)) + StrToInt(Copy(Code,8,1)) +
                 StrToInt(Copy(Code,9,1)) + StrToInt(Copy(Code,10,1))+
                 StrToInt(Copy(Code,11,1))+ StrToInt(Copy(Code,12,1)));
   while Length(IntToStr(PreResult)) > 1 do
      begin
         PreResult := ((StrToInt(Copy(IntToStr(PreResult),1,1)))+
                       (StrToInt(Copy(IntToStr(PreResult),2,1))));
      end;
   RESULT := PreResult;
end;

function TfCMMSAlloc.PadLeft(Var St : String; Len : Integer): String;
begin
   while Length(St) < Len Do
      St := '0' + St;
   RESULT := St;
end;

procedure TfCMMSAlloc.eOneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   lResult.Hide;
   if (key = vk_Return) then
      sbUpdateClick(Sender);
end;

end.
