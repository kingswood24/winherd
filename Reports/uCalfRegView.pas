unit uCalfRegView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, QRExport;

type
  TfmCalfRegView = class(TForm)
    rCalfReg: TQuickRep;
    QRBand1: TQRBand;
    RptTitle: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    bDetails: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRBand3: TQRBand;
    L1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCalfRegView: TfmCalfRegView;

implementation
uses
   uCalfRegFlt;

{$R *.DFM}

end.
