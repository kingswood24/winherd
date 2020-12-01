{

  05/01/09 [V3.8 R5.6] /SP Bug Fix - First Heat Caption chopped by the First Heat Interval Caption

}


unit uHeatServiceScr;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TfHeatServiceScr = class(TQuickRep)
    Detail: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    RptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    qrShowIntOrBull: TQRLabel;
    TotalSolids: TQRLabel;
    AnimalNo: TQRDBText;
    LactNo: TQRDBText;
    CalveDate: TQRDBText;
    DaysInMilk: TQRDBText;
    kGS305: TQRDBText;
    kgsyIELD: TQRDBText;
    AvgBFat: TQRDBText;
    CalvingIndex: TQRDBText;
    Summary: TQRBand;
    QRLabel11: TQRLabel;
    AvgProt: TQRDBText;
    qHeatService: TQuery;
    Srtlbl: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    SortedByLabel: TQRLabel;
    OrderLabel: TQRLabel;
    BFat305Kgs: TQRDBText;
    BFatTotalKgs: TQRDBText;
    TotalSolids305Kgs: TQRDBText;
    VerLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRSysData3: TQRSysData;
    QRLabel7: TQRLabel;
    qrdbFirstBullInt: TQRDBText;
    qrdbSecondBullInt: TQRDBText;
    qrdbThirdBullInt: TQRDBText;
    qrdbFourthBullInt: TQRDBText;
    qrdbFirstHeatInt: TQRDBText;
    qrdbThirdHeatInt: TQRDBText;
    qrdbSecondHeatInt: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    qrDateText: TQRLabel;
    qrToDate: TQRLabel;
    qrFromDate: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrLactfrom: TQRLabel;
    qrLactTo: TQRLabel;
    qrShowWhat: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText2: TQRDBText;
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
  private

  public
     PrintingReport : Boolean;
     ShowWhat       : Integer;
     class procedure PrintBlank(const AHerdID : Integer );
  end;

var
  fHeatServiceScr: TfHeatServiceScr;

implementation
uses
   DairyData, kRoutines, GenTypesConst;

{$R *.DFM}

procedure TfHeatServiceScr.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    if ( qHeatService.FieldByName('IrregularService').AsBoolean ) And
       ( qHeatService.FieldByName('IrregularHeat').AsBoolean ) then
       begin
          if NOT PrintingReport then
             Detail.Font.Color := clMaroon;
          Detail.Font.Style := [fsItalic,fsBold];
       end
    else if qHeatService.FieldByName('IrregularService').AsBoolean then
       begin
          if NOT PrintingReport then
             Detail.Font.Color := clRed;
          Detail.Font.Style := [fsItalic,fsUnderline];
       end
    else if qHeatService.FieldByName('IrregularHeat').AsBoolean then
       begin
          if NOT PrintingReport then
             Detail.Font.Color := clPurple;
          Detail.Font.Style := [fsItalic];
       end
    else
       begin
          if NOT PrintingReport then
             Detail.Font.Color := clNavy;
          Detail.Font.Style := [];
       end;
    if ShowWhat = 1 then // Show Irregular Heats Only
       begin
          if NOT qHeatService.FieldByName('IrregularHeat').AsBoolean then
             PrintBand := FALSE;
       end
    else if ShowWhat = 2 then // Show Irregular Service Only
       begin
          if NOT qHeatService.FieldByName('IrregularService').AsBoolean then
             PrintBand := FALSE;
       end;
end;

class procedure TfHeatServiceScr.PrintBlank(const AHerdID : Integer );
var
   i : Integer;
   AnimalQuery : TQuery;
begin
   with TfHeatServiceScr.Create(nil) do
      try
         for i := 0 to Detail.ComponentCount-1 do
            begin
               if ( Detail.Components[i] is TQRDBText ) then
                  ( Detail.Components[i] as TQRDBText ).DataSet := nil;
            end;

         Detail.Height := Detail.Height * 2;
         Detail.BeforePrint := nil;

         QRShape2.Height := QRShape2.Height*2;
         QRShape4.Height := QRShape4.Height*2;
         QRShape6.Height := QRShape6.Height*2;

         AnimalQuery := TQuery.Create(nil);
         AnimalQuery.DatabaseName := AliasName;

         AnimalQuery.SQL.Add('SELECT ID, AnimalNo, SortAnimalNo, LactNo ');
         AnimalQuery.SQL.Add('FROM Animals');
         AnimalQuery.SQL.Add('WHERE (InHerd=True)');
         AnimalQuery.SQL.Add('AND (AnimalDeleted=False)');
         AnimalQuery.SQL.Add('AND (Breeding=True)');
         AnimalQuery.SQL.Add('AND (Sex=''Female'')');
         AnimalQuery.SQL.Add('AND ((LactNo>0) OR (DateOfBirth <= "'+ FormatDate( IncMonth(Date, -12), dsUS) +'"))'); // should include breeding heifers
         if AHerdID > 0 then
            begin
               AnimalQuery.SQL.Add('AND HerdID=:AHerdID');
               AnimalQuery.Params[0].AsInteger := AHerdID;
            end
         else
            begin
               AnimalQuery.SQL.Add('AND HerdID<>:AHerdID');
               AnimalQuery.Params[0].AsInteger := WinData.NONEHerdID;
            end;

         AnimalQuery.SQL.Add('ORDER BY SortAnimalNo');
         AnimalQuery.Open;

         DataSet := AnimalQuery;
         AnimalNo.DataSet := AnimalQuery;
         LactNo.DataSet := AnimalQuery;

         Preview;

      finally
         Free;
      end;

end;

procedure TfHeatServiceScr.QRDBText2Print(sender: TObject;
  var Value: String);
begin
   if Value = '.0' then Value := '';
end;

end.
