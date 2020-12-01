unit uSetUpFarms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, RXLookup, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  Grids, DBGrids, RxDBComb, kwDBNavigator;

type
  TfSetUpFarms = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    nbScroll: TkwDBNavigator;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    pMainDetails: TPanel;
    Label4: TLabel;
    Area: TDBEdit;
    Label8: TLabel;
    Name: TDBEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    cbUnits: TRxDBComboBox;
    procedure sbExitClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure nbScrollClick(Sender: TObject; Button: TKNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation
uses
   GenTypesConst,
   uSetUpPaddItems,
   DB,
   DairyData,
   DiaryDataModule;

var
  fSetUpFarms: TfSetUpFarms;

{$R *.DFM}

procedure ShowTheForm;
begin
   try
      if ( fSetUpFarms = nil ) then
         Application.CreateForm(TfSetUpFarms, fSetUpFarms );
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
   fSetUpFarms.ShowModal;
end;

procedure TfSetUpFarms.sbExitClick(Sender: TObject);
begin
    Close;  // Close the Form
end;

procedure TfSetUpFarms.sbSaveClick(Sender: TObject);
begin
    if dmFarmDiary.Farms.State in dsEditModes then
       dmFarmDiary.Farms.Post;
end;

procedure TfSetUpFarms.FormCreate(Sender: TObject);
begin
    // as the Form is being created Open all the Paddock File
    dmFarmDiary.OpenDiaryTables;
    // Fill the Drop down with the Unit Defaults
    cbUnits.Items.Clear;
    cbUnits.Values.Clear;
    cbUnits.Values.Add(cMetric);
    cbUnits.Values.Add(cImperial);
    cbUnits.Items := cbUnits.Values;
end;

procedure TfSetUpFarms.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(dmFarmDiary.Farms, ModalResult = mrOK );
end;

procedure TfSetUpFarms.nbScrollClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( Button = kwnbpost )then
      begin
         if dmFarmDiary.Farms.State in dsEditModes then
            dmFarmDiary.Farms.Post;
      end
end;

end.
