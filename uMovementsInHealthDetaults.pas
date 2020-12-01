unit uMovementsInHealthDetaults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxDBEdit, cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxContainer, cxEdit, cxGroupBox, ActnList, dxBar, dxBarExtItems,
  cxControls, dxStatusBar;

type
  TfmMovementsInHealth = class(TfmBaseForm)
    cxGroupBox1: TcxGroupBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Drug: TcxLabel;
    cxLabel1: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    lDoseUnit: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actCancel: TAction;
    actSave: TAction;
    actDelete: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    cxLabel3: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMovementsInHealth: TfmMovementsInHealth;

implementation

uses uImageStore;

{$R *.DFM}

end.
