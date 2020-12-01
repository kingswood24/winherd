unit Medicine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons,
  ComCtrls;

type
  TfMedicine = class(TForm)
    MedCode: TDBEdit;
    Name: TDBEdit;
    Withdrawal: TDBEdit;
    QtytInStk: TDBEdit;
    DefaultPurchPrice: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DoseUnit: TRxDBLookupCombo;
    PurchUnit: TRxDBLookupCombo;
    LMedCode: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    ExitBtn: TBitBtn;
    StatusBar1: TStatusBar;
    HelpBtn: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ExitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMedicine: TfMedicine;

implementation
uses
    DairyData;
    
{$R *.DFM}

procedure TfMedicine.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(Windata.Medicine, ModalResult = mrOK );
end;

procedure TfMedicine.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

end.
