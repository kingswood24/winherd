unit uSetUpPlots;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, RXLookup, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  RxDBComb, Db, Grids, DBGrids, RXDBCtrl, kwDBNavigator;

type
  TfSetUpPlots = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    nbScroll: TkwDBNavigator;
    ToolButton6: TToolButton;
    sbHelp: TRxSpeedButton;
    pMainDetails: TPanel;
    lName: TLabel;
    lArea: TLabel;
    cbFarm: TRxDBLookupCombo;
    Name: TDBEdit;
    Area: TDBEdit;
    Label2: TLabel;
    dsActive: TDataSource;
    dbgPlotFieldAreaAid: TRxDBGrid;
    procedure sbExitClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbFarmCloseUp(Sender: TObject);
    procedure nbScrollClick(Sender: TObject; Button: TKNavigateBtn);
  private
    { Private declarations }
    ActiveTableName : String;
  public
    { Public declarations }
  end;

procedure ShowTheForm(ActiveDataSource : TDataSource; ActiveTName : String);

implementation
uses
   uSetUpFarms,
   GenTypesConst,
   DairyData,
   DiaryDataModule;

var
  fSetUpPlots: TfSetUpPlots;

{$R *.DFM}

procedure ShowTheForm(ActiveDataSource : TDataSource; ActiveTName : String);
begin
   try
      if ( fSetUpPlots = nil ) then
         Application.CreateForm(TfSetUpPlots, fSetUpPlots );
      with fSetUpPlots do
         begin
            dsActive.DataSet := ActiveDataSource.DataSet;
            ActiveTableName := ActiveTName;
            if ActiveTableName = dmFarmDiary.AreaAid.TableName then
               begin
                  Caption := 'Set Up Land Parcel No';
                  lName.Caption := 'Land Parcel No.';
               end
            else if ActiveTableName = dmFarmDiary.Plots.TableName then
               begin
                  Caption := 'Set Up REPS Plot No.';
                  lName.Caption := 'REPS Plot No.';
               end
            else if ActiveTableName = dmFarmDiary.DiaryFields.TableName then
               begin
                  Caption := 'Set Up Fields';
                  lName.Caption := 'Field Name';
               end;
            if dmFarmDiary.DefaultAreaMultTo = 1 then
               lArea.Caption := 'Area (Ha.)'
            else
               lArea.Caption := 'Area (Acres)';
            dbgPlotFieldAreaAid.Columns[0].Title.Caption := lName.Caption;
            dbgPlotFieldAreaAid.Columns[1].Title.Caption := lArea.Caption;
         end;
      fSetUpPlots.ShowModal;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
end;

procedure TfSetUpPlots.sbExitClick(Sender: TObject);
begin
    Close;  // Close the Form
end;

procedure TfSetUpPlots.sbSaveClick(Sender: TObject);
begin
    if dsActive.DataSet.State in dsEditmodes then
       dsActive.DataSet.Post;
end;

procedure TfSetUpPlots.FormCreate(Sender: TObject);
begin
    // as the Form is being created Open all the Paddock File
    dmFarmDiary.OpenDiaryTables;
end;

procedure TfSetUpPlots.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(dmFarmDiary.Plots, ModalResult = mrOK );
end;

procedure TfSetUpPlots.cbFarmCloseUp(Sender: TObject);
begin
     if cbFarm.Text = '<Add>' then
        begin
           dmFarmDiary.Farms.Append;
           uSetUpFarms.ShowTheForm;
        end;
end;

procedure TfSetUpPlots.nbScrollClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( Button = kwnbPost ) then
      begin
         if dsActive.DataSet.State in dsEditmodes then
            dsActive.DataSet.Post;
      end
end;

end.
