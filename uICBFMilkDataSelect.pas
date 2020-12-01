unit uICBFMilkDataSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup;

type
  TImportType = (itAll, itMilkOnly, itLactOnly, itNothing);
  TICBFMilkDataSelect = class(TForm)
    rgImportType: TcxRadioGroup;
    cxButton1: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute : TImportType;
  end;

var
  ICBFMilkDataSelect: TICBFMilkDataSelect;

implementation

{$R *.DFM}

{ TICBFMilkDataSelect }

class function TICBFMilkDataSelect.Execute: TImportType;
begin
   result := itNothing;
   with TICBFMilkDataSelect.Create(nil) do
      try
         ShowModal;
      finally
         Result := TImportType(rgImportType.ItemIndex);
      end;
end;

end.
