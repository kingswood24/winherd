unit uManufacturers;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, RXCtrls, ComCtrls, ToolWin, kwDBNavigator;

type
  TfManufacturers = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditName: TDBEdit;
    EditAddress: TDBEdit;
    EditAddress2: TDBEdit;
    EditAddress3: TDBEdit;
    EditAddress4: TDBEdit;
    EditAddress5: TDBEdit;
    EditPhone: TDBEdit;
    EditFax: TDBEdit;
    EditEmail: TDBEdit;
    dbgManufacturer: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator: TkwDBNavigator;
    DBMemo1: TDBMemo;
    procedure bExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure dbgManufacturerExit(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
  private
    { private declarations }
    procedure CheckForReadOnly;
  public
    { public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean);

implementation
uses
   DairyData,
   Dialogs;

var
  fManufacturers: TfManufacturers;

{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean );
begin
   try
      if ( fManufacturers = nil ) then
         Application.CreateForm(TfManufacturers, fManufacturers);
      if AddingRecord then
         WinData.Manufacturers.Append;
      fManufacturers.CheckForReadOnly;
      fManufacturers.ShowModal;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
end;

procedure TfManufacturers.CheckForReadOnly;
begin
   if WinData.Manufacturers.Active then
      begin
         if WinData.ManuFacturers.State = dsInsert then
            EditName.ReadOnly := FALSE
         else
            EditName.ReadOnly := TRUE;
      end;
end;

procedure TfManufacturers.bExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfManufacturers.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   // Make sure to cancel any pending record
   if WinData.Manufacturers.Active then
      WinData.Manufacturers.Cancel;
end;

procedure TfManufacturers.DBNavigatorClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   CheckForReadOnly;
end;

procedure TfManufacturers.dbgManufacturerExit(Sender: TObject);
begin
   CheckForReadOnly;
end;

procedure TfManufacturers.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('manufacturers.htm');
end;

end.
