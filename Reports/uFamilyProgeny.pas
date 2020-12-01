unit uFamilyProgeny;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, ComCtrls, RXCtrls, TB97, TB97Tlbr, Mask,
  DBCtrlsEh, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    RxSpeedButton1: TRxSpeedButton;
    Label2: TLabel;
    TreeView1: TTreeView;
    qMain: TQuery;
    dsMain: TDataSource;
    CheckBox1: TCheckBox;
    qDecendants: TQuery;
    dsDecendant: TDataSource;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
