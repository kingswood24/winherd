unit uSetupWasteProdRates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, ExtCtrls, kwDBNavigator, RXCtrls, ComCtrls,
  ToolWin, GenTypesConst;

type
  TfmSetupWasteProdRates = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    nbScroll: TKwDBNavigator;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    pMainDetails: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    NPDairyCow: TDBEdit;
    NPSucklerCow: TDBEdit;
    NPCattle2YrsPlus: TDBEdit;
    DataSource1: TDataSource;
    Label1: TLabel;
    NPCattle1to2Yrs: TDBEdit;
    Label5: TLabel;
    NPCattle6to12Mths: TDBEdit;
    Label8: TLabel;
    Label10: TLabel;
    NPMTEweLamb: TDBEdit;
    Label11: TLabel;
    NPLowEweLamb: TDBEdit;
    Label12: TLabel;
    NPMTHogget: TDBEdit;
    Label13: TLabel;
    NPLowHogget: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    PPDairyCow: TDBEdit;
    PPSucklerCow: TDBEdit;
    PPCattle2YrsPlus: TDBEdit;
    PPCattle1to2Yrs: TDBEdit;
    PPCattle6to12Mths: TDBEdit;
    PPMTEweLamb: TDBEdit;
    PPLowEweLamb: TDBEdit;
    PPMTHogget: TDBEdit;
    PPLowHogget: TDBEdit;
    pNIMainDetails: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    procedure sbExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowForm(ACountry : TCountry);
  end;

var
  fmSetupWasteProdRates: TfmSetupWasteProdRates;

implementation

uses DairyData;

{$R *.DFM}

procedure TfmSetupWasteProdRates.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfmSetupWasteProdRates.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if WinData.pDefs.State in dsEditModes then
      if WinData.pDefs.Modified then
         WinData.pDefs.Post
      else
         WinData.pDefs.Cancel;
end;

procedure TfmSetupWasteProdRates.FormShow(Sender: TObject);
begin
   if WinData.pDefs.RecordCount = 0 then
      WinData.pDefs.Insert
   else
      WinData.pDefs.Edit;
end;

class procedure TfmSetupWasteProdRates.ShowForm(ACountry : TCountry);
begin
   with TfmSetupWasteProdRates.Create(nil) do
      try
         if ACountry = Ireland then
            begin
               pMainDetails.Visible := True;
               pNIMainDetails.Visible := False;
            end
         else
            begin
               pMainDetails.Visible := False;
               pNIMainDetails.Visible := True;
            end;
         ShowModal;
      finally
         WinData.pDefs.Refresh;
         Free;
      end;
end;

end.
