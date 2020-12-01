unit udatafix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, Db, DBTables;

type
  TfmDatafix = class(TForm)
    Query: TQuery;
    cxButton1: TcxButton;
    Memo1: TMemo;
    Query2: TQuery;
    DeleteQuery: TQuery;
    Services: TTable;
    Events: TTable;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDatafix: TfmDatafix;

implementation

uses GenTypesConst,KRoutines, uBeefProfitMonitor, DairyData,
  uConditionScoreEventForm, uBeefAISireRegister;

{$R *.DFM}

procedure TfmDatafix.cxButton1Click(Sender: TObject);
var
   i : TIntegerArray;
   s : TStringArray;
   t : Integer;
   sa : string;
begin
   // Bill Carroll 30/01/2009
   with Query do
      begin
         active := True;
         SetLength(s, 0);
         SetLength(i, 0);
         while not eof do
            begin
               if (Length(Trim(FieldByName('AnimalNo').AsString)) = 3 ) and (StrToInt(FieldByName('AnimalNo').AsString)>141) then
                  begin
                     Memo1.Lines.Add(Query.FieldByName('AnimalNo').AsString+',');
                     SetLength(s, length(s)+1);
                     SetLength(i, length(i)+1);
                     s[length(s)-1] := Query.FieldByName('AnimalNo').AsString;
                     i[length(i)-1] := Query.FieldByName('ID').AsInteger;
                     inc(t);
                  end;
               Next;
            end;
         active := False;
         ShowMessage(IntToStr(t));

         sa := IntArrayToSQLInString(i);
         Memo1.Text := sa;


         SQl.Text := 'Update Events Set AnimalLactNo = 1 Where AnimalID in ' + sa;
         ExecSQL;


         Query2.Active := True;
         Query2.First;
         while not Query2.eof do
            begin
               DeleteQuery.Params[0].AsInteger := Query2.FieldByName('AnimalID').AsInteger;
               DeleteQuery.Params[1].AsDateTime := Query2.FieldByName('EventDate').AsDateTime;
               DeleteQuery.Params[2].AsInteger := Query2.FieldByName('ID').AsInteger;
               DeleteQuery.ExecSQL;

               Query2.Next;
            end;
      end;
end;

procedure TfmDatafix.cxButton2Click(Sender: TObject);
begin
  TfmBeefProfitMonitor.Execute(WinData.UserDefaultHerdID);
end;

procedure TfmDatafix.cxButton3Click(Sender: TObject);
begin
//   TfmConditionScoreEvent.LoadEvent(WinData.AnimalFileByIDID.AsInteger,0,20, TfmConditionScoreEvent);
end;

procedure TfmDatafix.cxButton4Click(Sender: TObject);
var
   ReloadDB : Boolean;
begin
   TfmBeefAISireRegister.execute(TfmBeefAISireRegister,ReloadDB);
end;

end.
