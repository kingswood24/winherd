unit uHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxContainer, cxEdit, cxLabel, cxPC, cxControls;

type
  THelpType = (htStockValuation);
  TfmHelp = class(TForm)
    pcHelp: TcxPageControl;
    tsStockValuation: TcxTabSheet;
    lStockValHelp: TcxLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FHelpType : THelpType;
  public
    { Public declarations }
    class procedure ShowTheForm ( AHelpType : THelpType );
  end;

var
  fmHelp: TfmHelp;

implementation

{$R *.DFM}

{ TfmHelp }

{ TfmHelp }

class procedure TfmHelp.ShowTheForm(AHelpType: THelpType);
begin
   with TfmHelp.Create(nil) do
      try
         FHelpType := AHelpType;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmHelp.FormActivate(Sender: TObject);
begin
   case FHelpType of
      htStockValuation : begin
                            pcHelp.ActivePageIndex := tsStockValuation.PageIndex;
                            Height := 190;
                            Width :=  740;
                         end;
   end;
   Caption := pcHelp.ActivePage.Caption + ' Help';
end;

end.
