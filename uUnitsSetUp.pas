{
    26/09/13 [V5.2 R1.6] /MK Change - Show warning on after form create.
}

unit uUnitsSetUp;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, RXCtrls,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, kwDBNavigator;

type
  TfUnitsSetup = class(TForm)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator: TkwDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    UnitCode: TDBEdit;
    Name: TDBEdit;
    Multiplier: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    procedure bExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbHelpClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean );

implementation
uses
    Dialogs,
    DairyData;

var
  fUnitsSetup: TfUnitsSetup;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean );
begin
    try
       if ( fUnitsSetup = nil ) then                                 // added 1/00 to
          Application.CreateForm(TfUnitsSetup, fUnitsSetup);         //
       MessageDlg('WARNING: Please ensure all new units that are added have a Code, Name and Multiplier.',mtWarning,[mbOK],0);
       WinData.Units.Append;
       fUnitsSetup.ShowModal;
    except                                                           //
       ShowMessage('Cannot create form - close program and re-boot');// opening
    end;                                                             //
end;

procedure TfUnitsSetup.bExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfUnitsSetup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if ( WinData.Units.Active ) and ( WinData.Units.State in [dsInsert, dsEdit] ) then
       WinData.Units.Cancel;
end;

procedure TfUnitsSetup.sbHelpClick(Sender: TObject);
begin
    WinData.HTMLHelp('units.htm');
end;

end.
