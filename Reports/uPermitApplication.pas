unit uPermitApplication;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TPermitApplicationScr = class(TQuickRep)
    TitleBand1: TQRBand;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRImage11: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRShape13: TQRShape;
    QRLabel9: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRShape16: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape24: TQRShape;
    QRLabel14: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape17: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape36: TQRShape;
    QRLabel24: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape47: TQRShape;
    QRLabel35: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape1: TQRShape;
    lNatID1: TQRLabel;
    lNatID2: TQRLabel;
    lNatID3: TQRLabel;
    lNatID4: TQRLabel;
    lNatID5: TQRLabel;
    lNatID6: TQRLabel;
    lNatID7: TQRLabel;
    lNatID8: TQRLabel;
    lNatID9: TQRLabel;
    lNatID10: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  PermitApplicationScr: TPermitApplicationScr;

implementation

{$R *.DFM}

procedure TPermitApplicationScr.QuickRepStartPage(Sender: TCustomQuickRep);
begin
   lNatID1.Caption := '';
   lNatID2.Caption := '';
   lNatID3.Caption := '';
   lNatID4.Caption := '';
   lNatID5.Caption := '';
   lNatID6.Caption := '';
   lNatID7.Caption := '';
   lNatID8.Caption := '';
   lNatID9.Caption := '';
   lNatID10.Caption := '';
end;

end.
