unit uNBASRep31G;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, EanQr, EanDBQr;

type
  TNBASRep31G = class(TForm)
    NBAS31G: TQuickRep;
    DetailBand1: TQRBand;
    lNumberCaption: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRShape15: TQRShape;
    QRBand2: TQRBand;
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
    lSellerHerdNoSect1: TQRLabel;
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
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRImage11: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape5: TQRShape;
    QRLabel21: TQRLabel;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape17: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape18: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape19: TQRShape;
    QrEan: TQrEan;
    lDateOfMovement: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    lSellerHerdNoSect2: TQRLabel;
    lSellerHerdNoSect3: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lNumberCaptionPrint(sender: TObject; var Value: String);
    procedure NBAS31GStartPage(Sender: TCustomQuickRep);
    procedure NBAS31GBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QrEanBeforePrint(Sender: TObject);
  private
    { Private declarations }
    PrintCount : Integer;
    function GetVenNo : Int64;
  public
    { Public declarations }
    DateOfMovement : String;
  end;

const
   PrintVenNos = 2;
   cCRLF = #13#10;
   StartVenNo = 8460000;
   EndVenNo = 9460000;

var
  NBASRep31G: TNBASRep31G;

implementation
uses
   uCMMSPermits, DairyData, db, GenTypesConst;

{$R *.DFM}

procedure TNBASRep31G.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lDateOfMovement.Caption := DateOfMovement;
   if DetailBand1.Tag = 15 then
      begin
         if not NBAS31G.DataSet.eof then
            NBAS31G.NewPage;
      end
   else
      begin
         DetailBand1.Tag:= DetailBand1.Tag + 1;
      end;
end;

procedure TNBASRep31G.lNumberCaptionPrint(sender: TObject; var Value: String);
begin
   Value := InttoStr(DetailBand1.Tag);
end;

procedure TNBASRep31G.NBAS31GStartPage(Sender: TCustomQuickRep);

begin
   DetailBand1.Tag := 1;
   if DateOfMovement = '' then
      DateOfMovement := FormatDateTime('dd/mm/yyyy', Date );


end;

procedure TNBASRep31G.NBAS31GBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   Inc(PrintCount);
end;

function TNBASRep31G.GetVenNo : Int64;
begin
   Result := 0;
   with WinData.CMMSPermits do
      begin
         if ( WinData.CMMSPermits.FieldByName('Remaining').AsInteger > 0 ) then
            begin
               Edit;
               try
                  WinData.CMMSPermits.FieldByName('Remaining').AsInteger := WinData.CMMSPermits.FieldByName('Remaining').AsInteger - 1;
                  WinData.CMMSPermits.FieldByName('CurrentVenNo').AsInteger := WinData.CMMSPermits.FieldByName('CurrentVenNo').AsInteger + 1;
                  Result := WinData.CMMSPermits.FieldByName('CurrentVenNo').AsInteger;
                  Post;
               except
                  Cancel;
                  raise Exception.Create('Ven No error, cannot continue');
               end;
            end;
      end;
end;

procedure TNBASRep31G.FormCreate(Sender: TObject);
begin
   WinData.CMMSPermits.CachedUpdates := True;
   PrintCount := 0;
end;

procedure TNBASRep31G.FormDestroy(Sender: TObject);
begin
   try
      if ( PrintCount = PrintVenNos ) then// ven no was printed on forms, save info to database!
         begin
            with WinData.CMMSPermits do
               begin
                  if (State in [dsInsert, dsEdit]) then Post;
                   ApplyUpdates;
                  //if CachedUpdates and UpdatesPending then
                  //   case MessageDlg('CMMS Permits have been printed, save the details to the database?',
                   //         mtConfirmation,[mbYes,mbNo],0) of
                      //  idYes : ApplyUpdates;
                       // idNo : CancelUpdates;
                     //end;
               end;
         end;
   finally
      WinData.CMMSPermits.CachedUpdates := False;
   end;
end;

procedure TNBASRep31G.QrEanBeforePrint(Sender: TObject);
var
   VenNo : Int64;
begin
   if ( PrintCount >= PrintVenNos ) then
      begin
         // Output Ven No's in barcode form.
         VenNo := GetVenNo;

         if ( VenNo > 0 ) then
            begin
               if not (( VenNo > StartVenNo ) and ( VenNo <= EndVenNo )) then
                  raise Exception.Create('Ven No range error, cannot continue. '+cErrorContact);

               QrEan.BarCode := IntToStr( VenNo )
            end
         else
            begin
               MessageDlg('CMMS Permit allocation has been used.'+cCRLF+
                          cCRLF+'Please ring Kingswood Computing for your next allocation.',mtError,[mbOK],0);
               Abort;
            end;
      end
   else
      QrEan.BarCode := 'PERMIT PREVIEW'

end;

end.
