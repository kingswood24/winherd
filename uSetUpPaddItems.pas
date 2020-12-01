unit uSetUpPaddItems;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, RXCtrls, ComCtrls, ToolWin, StdCtrls, Mask, DB, Grids,
  DBGrids, RXDBCtrl, kwDBNavigator;

type
  TfSetUpPaddItems = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    navPaddItems: TkwDBNavigator;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    Description: TDBEdit;
    dbgAllRecords: TRxDBGrid;
    lGridHeading: TLabel;
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTheFrom(WhichDataSource : TDataSource);

implementation

const
  cLandFormName = 'Land Forms';
  cPaddCondName = 'Paddock Conditions';
  cSoilName     = 'Soil Types';
  cSwardName    = 'Sward Types';

var
  fSetUpPaddItems: TfSetUpPaddItems;

{$R *.DFM}

procedure ShowTheFrom(WhichDataSource : TDataSource);
begin
   try
      if ( fSetUpPaddItems = nil ) then
         Application.CreateForm(TfSetUpPaddItems, fSetUpPaddItems );
      // Set the Data Sources
      with fSetUpPaddItems do
         begin
            navPaddItems.DataSource := WhichDataSource;
            Description.DataSource := WhichDataSource;
            dbgAllRecords.DataSource := WhichDataSource;
            // Set Up the Caption based on the Datasoure
            Caption := 'Set Up ';
            if WhichDataSource.DataSet.Name = 'PaddCond' then
               begin
                  Caption := Caption + cPaddCondName;
                  lGridHeading.Caption := 'Existing ' + cPaddCondName;
               end
            else if WhichDataSource.DataSet.Name = 'SoilTypes' then
               begin
                  Caption := Caption + cSoilName;
                  lGridHeading.Caption := 'Existing ' + cSoilName;
               end
            else if WhichDataSource.DataSet.Name = 'SwardTypes' then
               begin
                  Caption := Caption + cSwardName;
                  lGridHeading.Caption := 'Existing ' + cSwardName;
               end
            else if WhichDataSource.DataSet.Name = 'LandForm' then
               begin
                  Caption := Caption + cLandFormName;
                  lGridHeading.Caption := 'Existing ' + cLandFormName;
               end;
         end;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
   fSetUpPaddItems.ShowModal;
end;

procedure TfSetUpPaddItems.sbExitClick(Sender: TObject);
begin
    Close;
end;

end.
