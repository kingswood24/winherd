unit uPhoneLinkReviewRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, ExtCtrls, Db;

type
  TForm4 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRSubDetail4: TQRSubDetail;
    QRSubDetail5: TQRSubDetail;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    GroupHeaderBand1: TQRBand;
    GroupHeaderBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    DataSource1: TDataSource;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    Pregnant: TQRDBText;
    QRDBText12: TQRDBText;
    GroupHeaderBand4: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    lDryOff: TQRLabel;
    QRLabel16: TQRLabel;
    GroupHeaderBand3: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText26: TQRDBText;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PregnantPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses
   uPhoneLinkEventsReview;

{$R *.DFM}

procedure TForm4.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail1.Dataset.FieldByName('EventType').ASInteger in [1,2] );
end;

procedure TForm4.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail1.Dataset.FieldByName('EventType').ASInteger = 4 );
end;

procedure TForm4.QRSubDetail4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail1.Dataset.FieldByName('EventType').ASInteger in [4,6] );
   lDryOff.Enabled := ( QRSubDetail1.Dataset.FieldByName('EventType').ASInteger = 4 );
end;

procedure TForm4.QRSubDetail5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail1.Dataset.FieldByName('EventType').ASInteger = 5 );
end;

procedure TForm4.PregnantPrint(sender: TObject; var Value: String);
begin
   if UPPERCASE(Value) = 'TRUE' then
     Value := 'Yes'
   else
     Value := 'No';
end;

end.
