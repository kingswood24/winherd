unit uLiveStockUnitProj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, TeeProcs, Chart, DBChart, QrTee, Qrctrls, QuickRpt,
  ExtCtrls;

type
  TfmLiveStockUnitProj = class(TForm)
    ProjectionRep: TQuickRep;
    QRBand11: TQRBand;
    QRLabel62: TQRLabel;
    ProjVerLabel: TQRLabel;
    QRBand12: TQRBand;
    QRLabel67: TQRLabel;
    QRSysData7: TQRSysData;
    QRSysData8: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel20: TQRLabel;
    lProjHerdID: TQRLabel;
    lProjEndDate: TQRLabel;
    SummaryBand2: TQRBand;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLiveStockUnitProj: TfmLiveStockUnitProj;

implementation

{$R *.DFM}

end.
