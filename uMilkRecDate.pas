unit uMilkRecDate;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, Mask, ToolEdit;

type
  TDateDLG = class(TForm)
    Label1: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DateEdit1: TDateEdit;
    procedure DateEdit1Exit(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    LocalLastDate : TDateTime;
    DateOK        : Boolean;
  public
    { Public declarations }
  end;

  function ShowDate ( var NewDate : TDateTime; LastDate : TDateTime ): Boolean;

implementation
uses
    Dialogs;

function ShowDate ( var NewDate : TDateTime; LastDate : TDateTime ): Boolean;
begin
     with TDateDLG.Create(nil) do
        try
           LocalLastDate := LastDate;
           DateOK := FALSE;
           ShowModal;
        finally
           if DateOK then
              begin
                 NewDate := DateEdit1.Date;
                 Result := TRUE;
              end
           else
              Result := FALSE; 
           Free;
        end;
end;

{$R *.DFM}

procedure TDateDLG.DateEdit1Exit(Sender: TObject);
begin
     if ( DateEdit1.Date <= LocalLastDate ) then
        begin
           MessageDLG('Date must be after Last Milk Recording Date',mtinformation,[mbOK],0);
           DateEdit1.SetFocus;
           DateOK := FALSE;
        end;
end;

procedure TDateDLG.OKBtnClick(Sender: TObject);
begin
     if ( DateEdit1.Date <= LocalLastDate ) then
        begin
           MessageDLG('Date must be after Last Milk Recording Date',mtinformation,[mbOK],0);
           DateEdit1.SetFocus;
           DateOK := FALSE;
        end
     else
         begin
            DateOK := TRUE;
            Close;
         end;
end;

procedure TDateDLG.CancelBtnClick(Sender: TObject);
begin
     DateEdit1.Clear;
     DateOK := FALSE;
     Close;
end;

end.

