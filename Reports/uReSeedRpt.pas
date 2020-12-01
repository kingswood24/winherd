unit uReSeedRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, ExtCtrls, RXCtrls, ToolWin, ComCtrls, Qrctrls,
  quickrpt;

type
  TfReSeedRpt = class(TForm)
    ToolBar1: TToolBar;
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel1: TPanel;
    Query1: TQuery;
    PopupMenu1: TPopupMenu;
    ReSeedingScr: TQuickRep;
    QRBand13: TQRBand;
    QRSysData9: TQRSysData;
    QRSysData10: TQRSysData;
    QRLabel36: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape5: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel64: TQRLabel;
    QRBand14: TQRBand;
    QRDBText30: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRBand15: TQRBand;
    QRLabel71: TQRLabel;
    VerLabel5: TQRLabel;
    QRBand16: TQRBand;
    QRLabel74: TQRLabel;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReSeedRpt: TfReSeedRpt;

implementation

{$R *.DFM}

end.
