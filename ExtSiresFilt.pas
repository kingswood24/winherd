unit ExtSiresFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, ExtCtrls, RXCtrls, ComCtrls, ToolWin, BullReportsFilt;

type
  TfExtSiresFilt = class(TForm)
    extmain: TPanel;
    ext1: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Fromstat: TRxSpinEdit;
    ToStat: TRxSpinEdit;
    FromChestWidth: TRxSpinEdit;
    ToChestWidth: TRxSpinEdit;
    FromBodyDepth: TRxSpinEdit;
    ToBodyDepth: TRxSpinEdit;
    FromAngularity: TRxSpinEdit;
    ToAngularity: TRxSpinEdit;
    FromRumpAngle: TRxSpinEdit;
    ToRumpAngle: TRxSpinEdit;
    FromRumpWidth: TRxSpinEdit;
    ToRumpWidth: TRxSpinEdit;
    FromReliaConf: TRxSpinEdit;
    ToReliaConf: TRxSpinEdit;
    extp2: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    FromRearLegSet: TRxSpinEdit;
    ToRearLegSet: TRxSpinEdit;
    FromRearLegView: TRxSpinEdit;
    ToRearLegView: TRxSpinEdit;
    FromFootAngle: TRxSpinEdit;
    ToFootAngle: TRxSpinEdit;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    cbAllSires: TCheckBox;
    Panel1: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label3: TLabel;
    FromForeUdder: TRxSpinEdit;
    ToForeUdder: TRxSpinEdit;
    FromRearUdder: TRxSpinEdit;
    ToRearUdder: TRxSpinEdit;
    FromUdderSupp: TRxSpinEdit;
    ToUdderSupp: TRxSpinEdit;
    FromUdderDepth: TRxSpinEdit;
    ToUdderDepth: TRxSpinEdit;
    FromTeatPlace: TRxSpinEdit;
    ToTeatPlace: TRxSpinEdit;
    FromTeatlen: TRxSpinEdit;
    ToTeatlen: TRxSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure cbAllSiresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExtSiresFilt: TfExtSiresFilt;

implementation

uses SireSelection, DairyData, MenuUnit;

{$R *.DFM}

procedure TfExtSiresFilt.sbExitClick(Sender: TObject);
begin
   Close;
end;


procedure TfExtSiresFilt.sbViewClick(Sender: TObject);
begin
   try
      SireSelectionScr := TSireSelectionScr.Create(nil);
      with SireSelectionScr do
         begin
            WinData.qBull.SQL.Clear;
            WinData.qBull.Close;
           // VerLabel1.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
            WinData.qBull.SQL.Add('SELECT DISTINCT (D.AICode), D.Name, D.Stature, D.ChestWidth, D.BodyDepth, D.Angular, D.RumpAngle, D.RumpWidth, D.ReliabilityConf,');
            WinData.qBull.SQL.Add('                 D.RearLegSet, D.RearLegsRearView, D.FootAngle,');
            WinData.qBull.SQL.Add('                 D.ForeUdder, D.RearUdderHeight, D.UdderSupport, D.UdderDepth, D.TeatPlacement, D.TeatLenght'); // TeatLenght spelt that way in sires.db
            WinData.qBull.SQL.Add('FROM "Sires.DB" D');
            If (cbAllSires.Checked = False) then
               begin
                  SireSelectionScr.lUsingFilter2.Caption := 'Filtered Sire Selection';
                  WinData.qBull.SQL.Add('WHERE ( D.Stature Between ' + Fromstat.Text + ' And ' + ToStat.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.ChestWidth Between ' + FromChestWidth.Text + ' And ' + ToChestWidth.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.BodyDepth Between ' + FromBodyDepth.Text + ' And ' + ToBodyDepth.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.Angular Between ' + FromAngularity.Text + ' And ' + ToAngularity.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.RumpAngle Between ' + FromRumpAngle.Text + ' And ' + ToRumpAngle.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.RumpWidth Between ' + FromRumpWidth.Text + ' And ' + ToRumpWidth.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.ReliabilityConf Between ' + FromReliaConf.Text + ' And ' + ToReliaConf.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.RearLegSet Between ' + FromRearLegSet.Text + ' And ' + ToRearLegSet.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.RearLegsRearView Between ' + FromRearLegView.Text + ' And ' + ToRearLegView.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.FootAngle Between ' + FromFootAngle.Text + ' And ' + ToFootAngle.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.ForeUdder Between ' + FromForeUdder.Text + ' And ' + ToForeUdder.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.RearUdderHeight Between ' + FromRearUdder.Text + ' And ' + ToRearUdder.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.UdderSupport Between ' + FromUdderSupp.Text + ' And ' +  ToUdderSupp.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.UdderDepth Between ' + FromUdderDepth.Text + ' And ' + ToUdderDepth.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.TeatPlacement Between ' + FromTeatPlace.Text + ' And ' + ToTeatPlace.Text + ')');
                  WinData.qBull.SQL.Add('And ( D.TeatLenght Between ' + FromTeatlen.Text + ' And ' + ToTeatlen.Text + ')');
               end
            else
               SireSelectionScr.lUsingFilter2.Caption := 'All Sires Selected';

            WinData.qBull.SQL.Add('ORDER BY D.AICode, D.Name');
            Windata.qBull.Open;
            if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                   Begin
                      With WinData.qBull do
                           begin
                                SireSelectionScr.RptTitle2.Font.Color := ClRed;
                                SireSelectionScr.qrDetail.Font.Color := ClNavy;
                                SireSelectionScr.qrSum.Font.Color := ClNavy;
                                SireSelectionScr.tExtSireSelection.Preview;
                           End;
                   End
                else
                   Begin
                      With WinData.qBull do
                           begin
                                SireSelectionScr.RptTitle2.Font.Color := ClBlack;
                                SireSelectionScr.qrDetail.Font.Color := ClBlack;
                                SireSelectionScr.qrSum.Font.Color := ClBlack;
                                SireSelectionScr.tExtSireSelection.Print;
                           End;
                   End;
             end;
        finally
           SireSelectionScr.Free;
        end;

end;

procedure TfExtSiresFilt.cbAllSiresClick(Sender: TObject);
begin
   If (cbAllSires.Checked = True) then
      extmain.Enabled := False
   else
      extmain.Enabled := True;
end;

procedure TfExtSiresFilt.FormShow(Sender: TObject);
begin
  // MenuForm.Refresh;
  // fExtSiresFilt.Refresh;
end;

end.
