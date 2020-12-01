{
 08/04/09 [V3.9 R6.5] /MK Additional Feature - Changed Fax No. on form.
}

unit uNBASRep31B;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls;

type
  TNBASRep31B = class(TForm)
    NBAS31B: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel30: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRLabel42: TQRLabel;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    lBuyerherdNo: TQRLabel;
    QRLabel13: TQRLabel;
    lBuyerName: TQRLabel;
    QRLabel14: TQRLabel;
    lBuyerAdd1: TQRLabel;
    lBuyerAdd2: TQRLabel;
    lBuyerTelNo: TQRLabel;
    QRLabel15: TQRLabel;
    lSellerHerdNo: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    lSellerName: TQRLabel;
    QRLabel8: TQRLabel;
    lSellerAdd1: TQRLabel;
    lSellerAdd2: TQRLabel;
    lSellerTelNo: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape8: TQRShape;
    QRLabel29: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRImage11: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel40: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape16: TQRShape;
    QRLabel41: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape18: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    procedure NBAS31BStartPage(Sender: TCustomQuickRep);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure lSellerHerdNoPrint(sender: TObject; var Value: String);
    procedure lBuyerTelNoPrint(sender: TObject; var Value: String);
    procedure QRLabel30Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NBASRep31B: TNBASRep31B;

implementation
uses
   uCMMSPermits;

{$R *.DFM}

procedure TNBASRep31B.NBAS31BStartPage(Sender: TCustomQuickRep);
begin
   DetailBand1.Tag := 1;
end;

procedure TNBASRep31B.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   if DetailBand1.Tag = 10 then
      Begin
         NBAS31B.DataSet.Next;
         if not NBAS31B.DataSet.eof then
            begin
               NBAS31B.DataSet.Prior;
               NBAS31B.NewPage;
            end;
      end
   else
      DetailBand1.Tag:= DetailBand1.Tag + 1;
end;

procedure TNBASRep31B.lSellerHerdNoPrint(sender: TObject;
  var Value: String);
var
   TempValue : String;
   Iterator : Integer;
begin
   if Value <> '' then
      begin
         for Iterator := 1 to Length(Value) do
            begin
               if Iterator <> Length(Value) then
                  TempValue := TempValue + Value[Iterator] + ' '
               else
                  TempValue := TempValue + Value[Iterator];

            end;
         Value := TempValue;
      end;
end;

procedure TNBASRep31B.lBuyerTelNoPrint(sender: TObject; var Value: String);
begin
   if Value <> '' then
      Value := '( ' + Value + ' )';
end;

procedure TNBASRep31B.QRLabel30Print(sender: TObject; var Value: String);
begin
   Value := InttoStr(DetailBand1.Tag);
end;

end.