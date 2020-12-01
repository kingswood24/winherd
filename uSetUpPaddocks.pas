unit uSetUpPaddocks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, RXLookup, ExtCtrls, RXCtrls, ComCtrls, ToolWin,
  Grids, DBGrids, RXDBCtrl, kwDBNavigator;

type
  TfSetUpPaddocks = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    nbScroll: TkwDBNavigator;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    pMainDetails: TPanel;
    Label8: TLabel;
    lArea: TLabel;
    luField: TRxDBLookupCombo;
    luPlot: TRxDBLookupCombo;
    SoilTypeLookUp: TRxDBLookupCombo;
    Name: TDBEdit;
    Area: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    cbFarm: TRxDBLookupCombo;
    Label1: TLabel;
    luAreaAid: TRxDBLookupCombo;
    procedure sbExitClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SoilTypeLookUpCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure luPlotChange(Sender: TObject);
    procedure luFieldChange(Sender: TObject);
    procedure luAreaAidChange(Sender: TObject);
    procedure luPlotCloseUp(Sender: TObject);
    procedure luFieldCloseUp(Sender: TObject);
    procedure luAreaAidCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure nbScrollClick(Sender: TObject; Button: TKNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation
uses
   DB,
   GenTypesConst,
   uSetUpPlots,
   uSetUpFarms,
   uSetUpPaddItems,
   DairyData,
   DiaryDataModule;

var
  fSetUpPaddocks: TfSetUpPaddocks;

{$R *.DFM}

procedure ShowTheForm;
begin
   try
      if ( fSetUpPaddocks = nil ) then
         Application.CreateForm(TfSetUpPaddocks, fSetUpPaddocks );
      fSetUpPaddocks.ShowModal;
   except
      ShowMessage('Cannot create form - close program and re-boot');
   end;
end;

procedure TfSetUpPaddocks.sbExitClick(Sender: TObject);
begin
    Close;  // Close the Form
end;

procedure TfSetUpPaddocks.sbSaveClick(Sender: TObject);
begin
   if dmFarmDiary.Paddocks.State in dsEditModes then
      dmFarmDiary.Paddocks.Post;
end;

procedure TfSetUpPaddocks.FormCreate(Sender: TObject);
begin
    // as the Form is being created Open all the Paddock File
    dmFarmDiary.OpenDiaryTables;
end;

procedure TfSetUpPaddocks.SoilTypeLookUpCloseUp(Sender: TObject);
begin
     if SoilTypeLookUp.Text = '<Add>' then
        begin
           dmFarmDiary.SoilTypes.Append;
           uSetUpPaddItems.ShowTheFrom(dmFarmDiary.dsSoilTypes);
        end
end;

procedure TfSetUpPaddocks.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     CanClose := WinData.DataSetApplyUpdates(dmFarmDiary.Paddocks, ModalResult = mrOK );
end;

procedure TfSetUpPaddocks.luPlotChange(Sender: TObject);
begin
     // Change so set the Paddock into Edit Mode
     if NOT ( dmFarmDiary.Paddocks.State in dsEditmodes ) then
        dmFarmDiary.Paddocks.Edit;
     dmFarmDiary.PlotID := luPlot.LookupSource.DataSet.FieldByName('ID').AsInteger;
end;

procedure TfSetUpPaddocks.luFieldChange(Sender: TObject);
begin
     if NOT ( dmFarmDiary.Paddocks.State in dsEditmodes ) then
        dmFarmDiary.Paddocks.Edit;
     dmFarmDiary.FieldID := luField.LookupSource.DataSet.FieldByName('ID').AsInteger;
end;

procedure TfSetUpPaddocks.luAreaAidChange(Sender: TObject);
begin
     if NOT ( dmFarmDiary.Paddocks.State in dsEditmodes ) then
        dmFarmDiary.Paddocks.Edit;
     dmFarmDiary.AreaAidID := luAreaAid.LookupSource.DataSet.FieldByName('ID').AsInteger;
end;

procedure TfSetUpPaddocks.luPlotCloseUp(Sender: TObject);
begin
    if luPlot.Value = '0' then
       begin
           dmFarmDiary.Plots.Append;
           uSetUpPlots.ShowTheForm(dmFarmDiary.dsPlots, dmFarmDiary.Plots.TableName);
       end;
end;

procedure TfSetUpPaddocks.luFieldCloseUp(Sender: TObject);
begin
    if luField.Value = '0' then
       begin
           dmFarmDiary.DiaryFields.Append;
           uSetUpPlots.ShowTheForm(dmFarmDiary.dsFields, dmFarmDiary.DiaryFields.TableName);
       end;
end;

procedure TfSetUpPaddocks.luAreaAidCloseUp(Sender: TObject);
begin
    if luAreaAid.Value = '0' then
       begin
           dmFarmDiary.AreaAid.Append;
           uSetUpPlots.ShowTheForm(dmFarmDiary.dsAreaAid, dmFarmDiary.AreaAid.TableName);
       end;
end;

procedure TfSetUpPaddocks.FormActivate(Sender: TObject);
var
   ResultStr : Variant;
begin
    // When Activating the Form you need to display Acres/Ha
    ResultStr := dmFarmDiary.Farms.Lookup('ID',dmFarmDiary.DefaultFarmID,'DefaultUnit');
    if ResultStr = cMetric then
       lArea.Caption := 'Area Ha'
    else if ResultStr = cImperial then
       lArea.Caption := 'Area Acres';
end;

procedure TfSetUpPaddocks.nbScrollClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   if ( Button = kwnbPost ) then
      begin
         if dmFarmDiary.Paddocks.State in dsEditModes then
            dmFarmDiary.Paddocks.Post;
      end
end;

end.
