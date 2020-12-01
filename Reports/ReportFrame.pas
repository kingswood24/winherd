unit ReportFrame;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, ExtCtrls, RXCtrls, ComCtrls, ToolWin, QuickRpt;

type
  TReportFrame = class(TFrame)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure HerdComboChange(Sender: TObject);
  private
    FQuickReport : TQuickRep;
    StrHerdID : String;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TReportFrame.sbExitClick(Sender: TObject);
begin
   //Close;
end;

procedure TReportFrame.sbViewClick(Sender: TObject);
begin
   if not Assigned(FQuickReport) then
      raise Exception.Create('Error: unable to create report');

   if (Sender as TRxSpeedButton).Tag = 0 then
      FQuickReport.Preview
   else
      FQuickReport.Print;

end;

procedure TReportFrame.HerdComboChange(Sender: TObject);
begin
   StrHerdID := HerdCombo.Value;
end;

end.
