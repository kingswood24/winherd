unit uREPs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TfmREPs = class(TForm)
    REPSRep: TQuickRep;
    REPSDetail: TQRBand;
    lCattle0to6mths: TQRLabel;
    Jan1Tot: TQRLabel;
    Feb1Tot: TQRLabel;
    Mar1Tot: TQRLabel;
    Apr1Tot: TQRLabel;
    May1Tot: TQRLabel;
    Jun1Tot: TQRLabel;
    Jul1Tot: TQRLabel;
    Aug1Tot: TQRLabel;
    Sep1Tot: TQRLabel;
    Oct1Tot: TQRLabel;
    Nov1Tot: TQRLabel;
    Dec1Tot: TQRLabel;
    Year1Tot: TQRLabel;
    QRLabel85: TQRLabel;
    Jan2Tot: TQRLabel;
    Feb2Tot: TQRLabel;
    Mar2Tot: TQRLabel;
    Apr2Tot: TQRLabel;
    May2Tot: TQRLabel;
    Jun2Tot: TQRLabel;
    Jul2Tot: TQRLabel;
    Aug2Tot: TQRLabel;
    Sep2Tot: TQRLabel;
    Oct2Tot: TQRLabel;
    Nov2Tot: TQRLabel;
    Dec2Tot: TQRLabel;
    Year2Tot: TQRLabel;
    QRLabel99: TQRLabel;
    Jan3Tot: TQRLabel;
    Feb3Tot: TQRLabel;
    Mar3Tot: TQRLabel;
    Apr3Tot: TQRLabel;
    May3Tot: TQRLabel;
    Jun3Tot: TQRLabel;
    Jul3Tot: TQRLabel;
    Aug3Tot: TQRLabel;
    Sep3Tot: TQRLabel;
    Oct3Tot: TQRLabel;
    Nov3Tot: TQRLabel;
    Dec3Tot: TQRLabel;
    Year3Tot: TQRLabel;
    QRLabel113: TQRLabel;
    Jan4Tot: TQRLabel;
    Feb4Tot: TQRLabel;
    Mar4Tot: TQRLabel;
    Apr4Tot: TQRLabel;
    May4Tot: TQRLabel;
    Jun4Tot: TQRLabel;
    Jul4Tot: TQRLabel;
    Aug4Tot: TQRLabel;
    Sep4Tot: TQRLabel;
    Oct4Tot: TQRLabel;
    Nov4Tot: TQRLabel;
    Dec4Tot: TQRLabel;
    Year4Tot: TQRLabel;
    QRLabel36: TQRLabel;
    Jan5Tot: TQRLabel;
    Feb5Tot: TQRLabel;
    Mar5Tot: TQRLabel;
    Apr5Tot: TQRLabel;
    May5Tot: TQRLabel;
    Jun5Tot: TQRLabel;
    Jul5Tot: TQRLabel;
    Aug5Tot: TQRLabel;
    Sep5Tot: TQRLabel;
    Oct5Tot: TQRLabel;
    Nov5Tot: TQRLabel;
    Dec5Tot: TQRLabel;
    Year5Tot: TQRLabel;
    QRLabel55: TQRLabel;
    Jan6Tot: TQRLabel;
    Feb6Tot: TQRLabel;
    Mar6Tot: TQRLabel;
    Apr6Tot: TQRLabel;
    May6Tot: TQRLabel;
    Jun6Tot: TQRLabel;
    Jul6Tot: TQRLabel;
    Aug6Tot: TQRLabel;
    Sep6Tot: TQRLabel;
    Oct6Tot: TQRLabel;
    Nov6Tot: TQRLabel;
    Dec6Tot: TQRLabel;
    Year6Tot: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel8: TQRLabel;
    JanTot: TQRLabel;
    FebTot: TQRLabel;
    MarTot: TQRLabel;
    AprTot: TQRLabel;
    MayTot: TQRLabel;
    JunTot: TQRLabel;
    JulTot: TQRLabel;
    AugTot: TQRLabel;
    SepTot: TQRLabel;
    OctTot: TQRLabel;
    NovTot: TQRLabel;
    DecTot: TQRLabel;
    TotNum: TQRLabel;
    JanLU: TQRLabel;
    FebLU: TQRLabel;
    MarLU: TQRLabel;
    AprLU: TQRLabel;
    MayLU: TQRLabel;
    JunLU: TQRLabel;
    JulLU: TQRLabel;
    AugLU: TQRLabel;
    SepLU: TQRLabel;
    OctLU: TQRLabel;
    NovLU: TQRLabel;
    DecLU: TQRLabel;
    TotLU: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    VerLabel: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    RptTitle: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    HerdID: TQRLabel;
    RepEndDate: TQRLabel;
    JanYr1: TQRLabel;
    FebYr1: TQRLabel;
    MarYr1: TQRLabel;
    AprYr1: TQRLabel;
    MayYr1: TQRLabel;
    JunYr1: TQRLabel;
    JulYr1: TQRLabel;
    AugYr1: TQRLabel;
    SepYr1: TQRLabel;
    OctYr1: TQRLabel;
    NovYr1: TQRLabel;
    DecYr1: TQRLabel;
    JanYr2: TQRLabel;
    FebYr2: TQRLabel;
    MarYr2: TQRLabel;
    AprYr2: TQRLabel;
    MayYr2: TQRLabel;
    JunYr2: TQRLabel;
    JulYr2: TQRLabel;
    AugYr2: TQRLabel;
    SepYr2: TQRLabel;
    OctYr2: TQRLabel;
    NovYr2: TQRLabel;
    DecYr2: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel3: TQRLabel;
    Year1Avg: TQRLabel;
    Year2Avg: TQRLabel;
    Year3Avg: TQRLabel;
    Year4Avg: TQRLabel;
    Year5Avg: TQRLabel;
    Year6Avg: TQRLabel;
    AvgNum: TQRLabel;
    AvgLU: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmREPs: TfmREPs;

implementation

{$R *.DFM}

end.
