unit uCalfRegCardPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, EanQr, QuickRpt, ExtCtrls, KRoutines;

type
  TfmCalfRegCardPrint = class(TForm)
    CalfCertScr: TQuickRep;
    DetailBand1: TQRBand;
    QRShape23: TQRShape;
    QRShape42: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel23: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    S2: TQRImage;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape9: TQRShape;
    QRShape5: TQRShape;
    QRLabel46: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    E1: TQRLabel;
    E2: TQRLabel;
    E8: TQRLabel;
    E9: TQRLabel;
    E7: TQRLabel;
    E10: TQRLabel;
    E5: TQRLabel;
    E4: TQRLabel;
    E3: TQRLabel;
    E6: TQRLabel;
    E11: TQRLabel;
    E12: TQRLabel;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    B4: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRLabel31: TQRLabel;
    A1: TQRLabel;
    A2: TQRLabel;
    A3: TQRLabel;
    A4: TQRLabel;
    QRShape22: TQRShape;
    QRShape3: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape24: TQRShape;
    QRShape26: TQRShape;
    QRShape30: TQRShape;
    D1: TQRLabel;
    D3: TQRLabel;
    D5: TQRLabel;
    S1: TQRImage;
    QRImage1: TQRImage;
    QRLabel40: TQRLabel;
    lDate: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    TestPic: TQRImage;
    B1: TQRLabel;
    B2: TQRLabel;
    B3: TQRLabel;
    Barcode: TQrEanMemo;
    QRLabel18: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel48: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText16Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCalfRegCardPrint: TfmCalfRegCardPrint;

implementation

uses DairyData, GenTypesConst, uCalfRegFlt;

{$R *.DFM}

procedure TfmCalfRegCardPrint.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   TmpSt, NewSt, st :string;
   NewPlastic : Boolean;
begin
   // initial for each record.
   st := '';
   TestPic.Height := 0; // NEVER DELETE TEST PIC - DELPHI RPT WRITER BUG - DOESNT PRINT 1ST PIC
   s1.Height := 0;//  Hides MALE pic;
   s2.Height := 0;//  Hides FEMALE pic;
   Barcode.BarCode := st;
   // Strip all Spaces from NatId before creating BarCode
   NewSt := WinData.StripAllNomNumAlpha(CalfCertScr.Dataset.FieldByName('NatIDNum').AsString);
   if Copy(NewSt,1,2) = 'IE' then
      TmpSt := Copy (NewSt,3,Length(NewSt))
   else
      TmpSt := NewSt;
   BarCode.BarCode := TmpSt;
   lDate.Caption := FormatDateTime(cIrishDateStyle,Date);
   if CalfCertScr.Dataset.FieldByName('Sex').AsString <> 'Female' Then
      begin
         S1.Height := 21;//  shows MALE pic;
         s2.Height := 0;//  Hides FEMALE pic;
         S1.Refresh;
      end
   Else
      begin
         s1.Height := 0;//  Hides MALE pic;
         S2.Height := 21;//  shows FEMALE pic;
         s2.BringToFront;
         S2.Refresh;
      end;
   D1.Caption := ''; // INITIALISE DOB LABLES
   D3.Caption := '';
   D5.Caption := '';
   st := FormatDateTime(cIrishDateStyle,CalfCertScr.Dataset.FieldByName('DateOfBirth').AsDateTime);
   D1.Caption := Copy(st, 1, 2);
   D3.Caption := Copy(st, 4, 2);
   D5.Caption := Copy(st, 7, 4);
   A1.Caption := '';
   A2.Caption := '';
   A3.Caption := '';
   A4.Caption := '';
//   If MyQuery.FieldByName('SireInHerd').Asboolean = False Then  ....Inherd Boolean removed, just check the bull is in none herd, which is done on line 547
//      begin // only fills AI field if animal is not in herd - therefore AI
   st := CalfCertScr.Dataset.FieldByName('sCode').AsString;
   A1.Caption := Copy(st, 1, 1);
   A2.Caption := Copy(st, 2, 1);
   A3.Caption := Copy(st, 3, 1);
   A4.Caption := Copy(st, 4, 1);
//      end;
   E1.Caption := ''; // INITIALISE DAM NAT ID LABELS
   E2.Caption := '';
   E3.Caption := '';
   E4.Caption := '';
   E5.Caption := '';
   E6.Caption := '';
   E7.Caption := '';
   E8.Caption := '';
   E9.Caption := '';
   E10.Caption := '';
   E11.Caption := '';
   E12.Caption := '';
   NewSt := CalfCertScr.Dataset.FieldByName('DamNatID').AsString;
   St:= Windata.StripAllSpaces(NewSt);     // send to strip spaces function
   TmpSt := Copy(st, 1, 2); // IE
   NewPlastic := WhatStyleNatID( St, False ) in [Style1996,Style1999];
   if ( NewPlastic ) And ( TmpSt='IE' ) then
      Delete(St,1,2); // Remove the IE
   E1.Caption := Copy(st, 1, 1);
   E2.Caption := Copy(st, 2, 1);
   E3.Caption := Copy(st, 3, 1);
   E4.Caption := Copy(st, 4, 1);
   E5.Caption := Copy(st, 5, 1);
   E6.Caption := Copy(st, 6, 1);
   E7.Caption := Copy(st, 7, 1);
   E8.Caption := Copy(st, 8, 1);
   E9.Caption := Copy(st, 9, 1);
   E10.Caption := Copy(st, 10, 1);
   E11.Caption := Copy(st, 11, 1);
   E12.Caption := Copy(st, 12, 1);
   B1.Caption := ''; // INITIALISE BREED LABELS.
   B2.Caption := '';
   B2.Caption := '';
   B2.Caption := '';
   st := CalfCertScr.Dataset.FieldByName('DBreedCode').AsString;
   B1.Caption := Copy(st, 1, 2); // COPIES FIRST 2 LETTERS FROM BREED
   B2.Caption := Copy(st, 3, 1); // IF CROSS, COPIES LETTER INTO 3RD FIELD ON FORM
   st := CalfCertScr.Dataset.FieldByName('SBreedCode').AsString;
   B3.Caption := Copy(st, 1, 2); // COPIES FIRST 2 LETTERS FROM BREED
   B4.Caption := Copy(st, 3, 1); // IF CROSS, COPIES LETTER INTO 3RD FIELD ON FORM
end;

procedure TfmCalfRegCardPrint.QRDBText16Print(sender: TObject; var Value: String);
var
   TempStr : String;
begin
   // Strip leading and Trailing Spaces and replace non alpha and Numbers with Space
   TempStr := WinData.ReplaceAllNomNumAlphaWithSpace(CalfCertScr.Dataset.FieldByName('NatIDNum').AsString);
   // Check for and Remove IE
   if Copy(TempStr,1,2) = 'IE' then
      TempStr := Copy (TempStr,3,Length(TempStr));
   // Strip it again to remove the space after IE if one existed
   Value := WinData.StripSpaces(TempStr);

end;

end.
