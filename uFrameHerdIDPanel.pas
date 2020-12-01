unit uFrameHerdIDPanel;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ExtCtrls;

type
  TfrmHerdIDPanel = class(TFrame)
    pHerdId: TPanel;
    HerdCombo: TcxLookupComboBox;
    cxLabel1: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses DairyData;

{$R *.DFM}

end.
