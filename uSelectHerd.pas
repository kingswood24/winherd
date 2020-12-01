unit uSelectHerd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup;

type
  TfmSelectHerd = class(TForm)
    HerdCombo: TRxDBLookupCombo;
    Button1: TButton;
    Button2: TButton;
    procedure HerdComboCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    UserHerdID : Integer;
  public
    { Public declarations }

  end;

  function CreateAndShow : Integer;

var
  fmSelectHerd: TfmSelectHerd;

implementation
uses
   DairyData, uCreateEvents;

{$R *.DFM}

   function CreateAndShow : Integer;
   begin
      try
         Application.CreateForm(TfmSelectHerd, fmSelectHerd);
         with fmSelectHerd do
            begin
               UserHerdID := 0;
               ShowModal;
               Result := UserHerdID;
            end;
      finally
         fmSelectHerd.Free;
      end;
   end;

procedure TfmSelectHerd.HerdComboCloseUp(Sender: TObject);
begin
   try
      UserHerdID := StrToInt(HerdCombo.Value);
   except
      UserHerdID := 0;
   end;

end;

procedure TfmSelectHerd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := (((ModalResult = mrok) and ( UserHerdID > 0)) or (ModalResult = mrCancel))
end;

end.
