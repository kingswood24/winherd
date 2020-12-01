unit uSetUpFerts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, RXLookup, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  RxDBComb, Db, Grids, DBGrids, RXDBCtrl, kwDBNavigator;

type
  TfSetUpFerts = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    nbScroll: TkwDBNavigator;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    pMainDetails: TPanel;
    Label8: TLabel;
    Label4: TLabel;
    Name: TDBEdit;
    Area: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    ActiveTableName : String;
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation
uses
   GenTypesConst,
   DiaryDataModule, DairyData;

var
  fSetUpFerts: TfSetUpFerts;

{$R *.DFM}

procedure ShowTheForm;
begin
   try
      if ( fSetUpFerts = nil ) then
         Application.CreateForm(TfSetUpFerts, fSetUpFerts );
      fSetUpFerts.ShowModal;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
end;

procedure TfSetUpFerts.sbExitClick(Sender: TObject);
begin
    Close;  // Close the Form
end;

procedure TfSetUpFerts.FormCreate(Sender: TObject);
begin
    // as the Form is being created Open all the Paddock File
    dmFarmDiary.OpenDiaryTables;
end;

procedure TfSetUpFerts.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(dmFarmDiary.Fertilizers, ModalResult = mrOK );
end;

end.
