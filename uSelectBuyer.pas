unit uSelectBuyer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DairyData,
  StdCtrls, cxButtons;

type
  TfmSelectBuyer = class(TForm)
    lcboBuyers: TcxLookupComboBox;
    lSelectBuyer: TcxLabel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    procedure btnOKClick(Sender: TObject);
    procedure lcboBuyersPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function SelectBuyer : Integer;
  end;

var
  fmSelectBuyer: TfmSelectBuyer;

implementation

{$R *.DFM}

{ TfmSelectBuyer }

class function TfmSelectBuyer.SelectBuyer: Integer;
begin
   with TfmSelectBuyer.Create(nil) do
      try
         Result := 0;
         lcboBuyers.Properties.ListSource := WinData.dsBuyers;
         lcboBuyers.Properties.ListFieldNames := 'Name';
         lcboBuyers.Properties.KeyFieldNames := 'ID';
         ShowModal;
         if lcboBuyers.EditValue > 0 then
            Result := lcboBuyers.EditValue;
      finally
         Free;
      end;
end;

procedure TfmSelectBuyer.btnOKClick(Sender: TObject);
begin
   Close;
end;

procedure TfmSelectBuyer.lcboBuyersPropertiesChange(Sender: TObject);
begin
   lcboBuyers.PostEditValue;
end;

end.
