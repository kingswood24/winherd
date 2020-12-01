unit uUIHealthEvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uAnimalBrowserEventBase, ActnList, StdCtrls, cxButtons;

type
  TfmAnimalBrowserEventBase1 = class(TfmAnimalBrowserEventBase)
  private
    { Private declarations }
    procedure SaveEvent; override;
    procedure CancelEvent; override;
  public
    { Public declarations }
  end;

var
  fmAnimalBrowserEventBase1: TfmAnimalBrowserEventBase1;

implementation

{$R *.DFM}

{ TfmAnimalBrowserEventBase1 }

procedure TfmAnimalBrowserEventBase1.CancelEvent;
begin
  inherited;

end;

procedure TfmAnimalBrowserEventBase1.SaveEvent;
begin
  inherited;

end;

end.
 