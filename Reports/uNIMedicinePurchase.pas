(*
 **************************************

  This report was created 21/11/2002
        by Shane Pilkington
           Niall Nolan.

 **************************************
*)
unit uNIMedicinePurchase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables, QRExport;

type
  TNIMedicinePurchaseScr = class(TForm)
    qrNIMedicinePurchase: TQuickRep;
    RptTitle: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape28: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape29: TQRShape;
    QRLabel22: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    VerLabel: TQRLabel;
    QRLabel2: TQRLabel;
    Detail: TQRSubDetail;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRDBText7: TQRDBText;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NIMedicinePurchaseScr: TNIMedicinePurchaseScr;

implementation
uses
   HealthFilterU;
{$R *.DFM}

procedure TNIMedicinePurchaseScr.QRDBText4Print(sender: TObject;
  var Value: String);
var
   DT : TDateTime;
begin
   if (Sender is TQRDBText) then
      begin
         DT := (Sender as TQRDBText).DataSet.FieldByName( (Sender as TQRDBText).DataField ).AsDateTime;
         if DT > 0 then
            Value := FormatDateTime('dd/mm/yy', DT)
         else
            Value := '';
      end;
end;

procedure TNIMedicinePurchaseScr.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  { if Value <> '' then
      Value := '('+Value+')';
  }
end;

procedure TNIMedicinePurchaseScr.QRDBText9Print(sender: TObject;
  var Value: String);
begin
//
end;

procedure TNIMedicinePurchaseScr.QRDBText10Print(sender: TObject;
  var Value: String);
begin
//
end;

procedure TNIMedicinePurchaseScr.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   //
end;

procedure TNIMedicinePurchaseScr.QRDBText5Print(sender: TObject;
  var Value: String);
begin
   Value := Trim(Value);
   while ( Length(Value) > 0 ) and ( Value[Length(Value)] = ',' ) do
      begin
         Value[Length(Value)] := ' ';
         Value := Trim(value);
      end;
end;

end.
