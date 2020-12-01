{ NN 26/09/02
  Livestock Inventory date coming through on to the Profit and Loss Report
  Included was change of report title


 }


unit uBalanceSheet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRExport;

type
  TfmBalanceSheet = class(TForm)
    qrBalSheet: TQuickRep;
    QRBand1: TQRBand;
    GroupFooterBand1: TQRBand;
    GroupHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    GroupFooterBand2: TQRBand;
    GroupFooterBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    Name: TQRDBText;
    Balance: TQRDBText;
    qCA: TQuery;
    QRLabel11: TQRLabel;
    lCAdjust: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qFA: TQuery;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qLI: TQuery;
    QRLabel12: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape16: TQRShape;
    qrexp2: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    lNetWorth: TQRLabel;
    LTotalAssets: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qFAId: TIntegerField;
    qFAName: TStringField;
    qFABalance: TFloatField;
    qLIId: TIntegerField;
    qLIName: TStringField;
    qLIBalance: TFloatField;
    qCAId: TIntegerField;
    qCAName: TStringField;
    qCABalance: TFloatField;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    lFromDate: TQRLabel;
    QRLabel14: TQRLabel;
    lToDate: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure FormCreate(Sender: TObject);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure qrexp2Print(sender: TObject; var Value: String);
    procedure GroupFooterBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure lNetWorthPrint(sender: TObject; var Value: String);
    procedure qrBalSheetStartPage(Sender: TCustomQuickRep);

  private
    { Private declarations }
    CAdjust,
    CADepreciation,
    FADepreciation,
    FABalance,
    CABalance,
    TotalAssets,
    LIBalance : Double;
    MyTable : TTable;
    DBPath : String;
    function GetFADepreciation : Double;
    function GetCADepreciation : Double;
    //qSum : TQuery;
  public
    { Public declarations }
  end;

var
  fmBalanceSheet: TfmBalanceSheet;

implementation

uses DairyData;

{$R *.DFM}

procedure TfmBalanceSheet.FormCreate(Sender: TObject);
begin
   try
      DBPath := '';
      DBPath := 'C:\Kingsacc\'+WinData.GetAccsCompany(WinData.UserDefaultHerdID);
      CADepreciation := GetCADepreciation; // CA
      FADepreciation := GetFADepreciation; // FA
      qCA.DataBaseName := DBPath;
      qFA.DataBaseName := DBPath;
      qLI.DataBaseName := DBPath;
      qCA.Open;
      qFA.Open;
      qLI.Open;
   finally
      qrBalSheet.Preview;
      qCA.Close;
      qFA.Close;
      qLI.Close;
   end;
end;

procedure TfmBalanceSheet.QRExpr1Print(sender: TObject; var Value: String);
begin
   CABalance := CADepreciation + CAdjust + StrToFloat(Value);
   Value := CurrToStrF(CABalance, ffCurrency, 2);
   TotalAssets := (CABalance + FABalance);
   LTotalAssets.Caption := CurrToStrF(TotalAssets, ffCurrency, 2);
end;

procedure TfmBalanceSheet.qrexp2Print(sender: TObject; var Value: String);
begin
   FABalance := FADepreciation + StrToFloat(Value);
   Value := CurrToStrF(FABalance, ffCurrency, 2);
end;

procedure TfmBalanceSheet.GroupFooterBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   LTotalAssets.Caption := CurrToStrF(CABalance + FABalance, ffCurrency, 2);
end;

function TfmBalanceSheet.GetFADepreciation: Double;
begin
   with MyTable do
      try
         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := 'Accs';
         MyTable.TableName := 'nlaccs';

         MyTable.Open;
         MyTable.First;
         FADepreciation := 0;

         while not MyTable.eof do
            begin
               if (MyTable.FieldByName('Category').AsString = 'FA') then
                  if MyTable.FieldByName('DepRate').AsFloat > 0 then
                     FADepreciation := FADepreciation + ((MyTable.FieldByName('DepRate').AsFloat / 100)
                                                      * MyTable.FieldByName('Balance').AsFloat)
                  else if MyTable.FieldByName('DepAmount').AsFloat > 0 then
                     FADepreciation := FADepreciation + MyTable.FieldByName('DepAmount').AsFloat;
                 MyTable.Next;
            end;
         Result := FADepreciation;
      finally
         MyTable.Close;
         MyTable.Free;
      end;
end;

function TfmBalanceSheet.GetCADepreciation: Double;
begin
   with MyTable do
      try
         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := 'Accs';
         MyTable.TableName := 'nlaccs';

         MyTable.Open;
         MyTable.First;
         CADepreciation := 0;

         while not MyTable.eof do
            begin
               if (MyTable.FieldByName('Category').AsString = 'CA') then
                  if MyTable.FieldByName('DepRate').AsFloat > 0 then
                     FADepreciation := FADepreciation + ((MyTable.FieldByName('DepRate').AsFloat / 100)
                                                      * MyTable.FieldByName('Balance').AsFloat)
                  else if MyTable.FieldByName('DepAmount').AsFloat > 0 then
                     FADepreciation := FADepreciation + MyTable.FieldByName('DepAmount').AsFloat;
               MyTable.Next;
            end;
         Result := CADepreciation;
      finally
         MyTable.Close;
         MyTable.Free;
      end;

end;

procedure TfmBalanceSheet.QRExpr2Print(sender: TObject; var Value: String);
begin
   LIBalance := StrToFloat(Value);
   Value := CurrToStrF(LIBalance, ffCurrency, 2);
end;

procedure TfmBalanceSheet.lNetWorthPrint(sender: TObject;
  var Value: String);
begin
   Value := CurrToStrF(((CABalance + FABalance) - LIBalance), ffCurrency, 2);
end;

procedure TfmBalanceSheet.qrBalSheetStartPage(Sender: TCustomQuickRep);
begin
   try
      WinData.LiveStockValues.Open;
      if ((WinData.UserDefaultHerdID <> WinData.NONEHerdID) and (WinData.LiveStockValues.Locate('HerdID', WinData.UserDefaultHerdID, []))) then
         begin
            CAdjust           := WinData.LiveStockValues.FieldByName('ClosingValue').AsFloat;
            lCAdjust.Caption  := CurrToStrF(CAdjust, ffCurrency, 2);
            if WinData.LiveStockValues.FieldByName('FromDate').AsDateTime > 0 then
               lFromDate.Caption := FormatDateTime('dd/mm/yyyy', WinData.LiveStockValues.FieldByName('FromDate').AsDateTime)
            else
               lFromDate.Caption := '';
            if WinData.LiveStockValues.FieldByName('ToDate').AsDateTime > 0 then
               lToDate.Caption   := FormatDateTime('dd/mm/yyyy', WinData.LiveStockValues.FieldByName('ToDate').AsDateTime)
            else
               lToDate.Caption   := '';
         end
     else
        begin
            CAdjust           := 0;
            lCAdjust.Caption  := '0.00';
            lFromDate.Caption := '';
            lToDate.Caption := '';
        end;
   finally
      WinData.LiveStockValues.Close;
   end;

end;

end.
