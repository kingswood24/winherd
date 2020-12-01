unit uExtenCensus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, uLivestockSum, QRExport;

type
  TfmExtenCensus = class(TForm)
    ExtensificationRep: TQuickRep;
    ExtensDetail: TQRBand;
    QRLabel35: TQRLabel;
    l0to6mths1: TQRLabel;
    l0to6mths2: TQRLabel;
    l0to6mths3: TQRLabel;
    l0to6mths4: TQRLabel;
    l0to6mths5: TQRLabel;
    QRLabel75: TQRLabel;
    l6to12mths1: TQRLabel;
    l6to12mths2: TQRLabel;
    l6to12mths3: TQRLabel;
    l6to12mths4: TQRLabel;
    l6to12mths5: TQRLabel;
    QRLabel97: TQRLabel;
    l1to2yrs1: TQRLabel;
    l1to2yrs2: TQRLabel;
    l1to2yrs3: TQRLabel;
    l1to2yrs4: TQRLabel;
    l1to2yrs5: TQRLabel;
    qrLine1: TQRShape;
    qrLine2: TQRShape;
    qrLine3: TQRShape;
    qrLine4: TQRShape;
    qrLine5: TQRShape;
    qrline6: TQRShape;
    l1to2yrs6: TQRLabel;
    l6to12mths6: TQRLabel;
    l0to6mths6: TQRLabel;
    QRBand6: TQRBand;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    lTotNum1: TQRLabel;
    lTotNum2: TQRLabel;
    lTotNum3: TQRLabel;
    lTotNum4: TQRLabel;
    lTotNum5: TQRLabel;
    TotLuAF1: TQRLabel;
    TotLuAF2: TQRLabel;
    TotLuAF3: TQRLabel;
    TotLuAF4: TQRLabel;
    TotLuAF5: TQRLabel;
    QRLabel37: TQRLabel;
    lAvLU: TQRLabel;
    QRLabel40: TQRLabel;
    lStockDens: TQRLabel;
    qrlCensus4a: TQRLabel;
    qrlCensus4b: TQRLabel;
    qrlCensus4c: TQRLabel;
    qrlCensus5a: TQRLabel;
    qrlCensus5c: TQRLabel;
    qrlCensus5d: TQRLabel;
    qrlCensus5b: TQRLabel;
    qrlCensus6: TQRLabel;
    QRLabel43: TQRLabel;
    lStockRate1: TQRLabel;
    lStockRate2: TQRLabel;
    lStockRate3: TQRLabel;
    lStockRate4: TQRLabel;
    lStockRate5: TQRLabel;
    qrlCensus7: TQRLabel;
    qrlCensus8: TQRLabel;
    TotLuAF6: TQRLabel;
    lStockRate6: TQRLabel;
    lTotNum6: TQRLabel;
    QRLabel111: TQRLabel;
    l2plusyrs1: TQRLabel;
    l2plusyrs2: TQRLabel;
    l2plusyrs3: TQRLabel;
    l2plusyrs4: TQRLabel;
    l2plusyrs5: TQRLabel;
    l2plusyrs6: TQRLabel;
    QRLabel49: TQRLabel;
    lTotLU1: TQRLabel;
    lTotLU2: TQRLabel;
    lTotLU3: TQRLabel;
    lTotLU4: TQRLabel;
    lTotLU5: TQRLabel;
    lTotLU6: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    ALU1: TQRLabel;
    ALU2: TQRLabel;
    ALU3: TQRLabel;
    ALU4: TQRLabel;
    ALU5: TQRLabel;
    ALU6: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel76: TQRLabel;
    BS1: TQRLabel;
    BS2: TQRLabel;
    BS3: TQRLabel;
    BS4: TQRLabel;
    BS5: TQRLabel;
    BS6: TQRLabel;
    QRLabel92: TQRLabel;
    QRBand7: TQRBand;
    QRLabel41: TQRLabel;
    lExtRepVer: TQRLabel;
    QRBand8: TQRBand;
    ExtRepTitle: TQRLabel;
    QRShape3: TQRShape;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    lExtRepDt1: TQRLabel;
    QRLabel48: TQRLabel;
    lExtRepDt2: TQRLabel;
    lExtRepDt3: TQRLabel;
    lExtRepDt4: TQRLabel;
    lExtRepDt5: TQRLabel;
    QRLabel47: TQRLabel;
    lHerdID: TQRLabel;
    QRLabel42: TQRLabel;
    qrlHectares: TQRLabel;
    lExtRepDt6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    TFBLUS1: TQRLabel;
    TFBLUS2: TQRLabel;
    TFBLUS3: TQRLabel;
    TFBLUS4: TQRLabel;
    TFBLUS5: TQRLabel;
    TFBLUS6: TQRLabel;
    lAvgLUNoRound: TQRLabel;
    lStockDenNoRound: TQRLabel;
    Formula: TQRMemo;
    QRLabel3: TQRLabel;
    lCoeff1: TQRLabel;
    lCoeff2: TQRLabel;
    lCoeff6: TQRLabel;
    lCoeff5: TQRLabel;
    lCoeff3: TQRLabel;
    lCoeff4: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure ExtensDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure lAvgLUNoRoundPrint(sender: TObject; var Value: String);
    procedure lStockDenNoRoundPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    Date1,
    Date2,
    Date3,
    Date4,
    Date5,
    Date6 : TDateTime;
  end;

  procedure SetupReport( FDate1, FDate2, FDate3, FDate4, FDate5, FDate6 : TDateTime);

var
  fmExtenCensus: TfmExtenCensus;

implementation


{$R *.DFM}

procedure SetupReport( FDate1, FDate2, FDate3, FDate4, FDate5, FDate6 : TDateTime); // SP
begin
   Application.CreateForm(TfmExtenCensus, fmExtenCensus);
   fmExtenCensus.Date1 := FDate1;
   fmExtenCensus.Date2 := FDate2;
   fmExtenCensus.Date3 := FDate3;
   fmExtenCensus.Date4 := FDate4;
   fmExtenCensus.Date5 := FDate5;
   fmExtenCensus.Date6 := FDate6;
end;

procedure TfmExtenCensus.ExtensDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  NumDates : Integer;
begin

   with fmExtenCensus do
      begin
         if Date2 = 0 then
            NumDates := 1
         else if Date3 = 0 then
            NumDates := 2
         else if Date4 = 0 then
            NumDates := 3
         else if Date5 = 0 then
            NumDates := 4
         else if Date6 = 0 then
            NumDates := 5
         else
            NumDates := 6;

         if NumDates = 1 then
            begin
               if (Date1 < (Now)) then
                  Begin
                     l6to12mths3.Font.Color := clRed;
                     l1to2yrs3.Font.Color := clRed;
                  end;
            end
         else if (NumDates = 2) then
            begin
               if (Date1 < (Now)) then
                  begin
                     l6to12mths2.Font.Color := clRed;
                     l1to2yrs2.Font.Color := clRed;
                  end;
               if (Date2 < (Now)) then
                  begin
                     l6to12mths4.Font.Color := clRed;
                     l1to2yrs4.Font.Color := clRed;
                  end;
            end
         else if (NumDates = 3) then
            begin
               if (Date1 < (Now)) then
                  begin
                     l6to12mths1.Font.Color := clRed;
                     l1to2yrs1.Font.Color := clRed;
                  end;
               if (Date2 < (Now)) then
                  begin
                     l6to12mths3.Font.Color := clRed;
                     l1to2yrs3.Font.Color := clRed;
                  end;
               if (Date3 < (Now)) then
                  begin
                     l6to12mths5.Font.Color := clRed;
                     l1to2yrs5.Font.Color := clRed;
                  end;
            end
         else if (NumDates = 4) then
            begin
               if (Date1 < (Now)) then
                  begin
                     l6to12mths2.Font.Color := clRed;
                     l1to2yrs2.Font.Color := clRed;
                  end;
               if (Date2 < (Now)) then
                  begin
                     l6to12mths3.Font.Color := clRed;
                     l1to2yrs3.Font.Color := clRed;
                  end;
               if (Date3 < (Now)) then
                  begin
                     l6to12mths4.Font.Color := clRed;
                     l1to2yrs4.Font.Color := clRed;
                  end;
               if (Date4 < (Now)) then
                  begin
                     l6to12mths5.Font.Color := clRed;
                     l1to2yrs5.Font.Color := clRed;
                  end;
            end
         else if (NumDates = 5) then
            begin
               if (Date1 < (Now)) then
                  begin
                     l6to12mths1.Font.Color := clRed;
                     l1to2yrs1.Font.Color := clRed;
                  end;
               if (Date2 < (Now)) then
                  begin
                     l6to12mths2.Font.Color := clRed;
                     l1to2yrs2.Font.Color := clRed;
                  end;
               if (Date3 < (Now)) then
                  begin
                     l6to12mths3.Font.Color := clRed;
                     l1to2yrs3.Font.Color := clRed;
                  end;
               if (Date4 < (Now)) then
                  begin
                     l6to12mths4.Font.Color := clRed;
                     l1to2yrs4.Font.Color := clRed;
                  end;
               if (Date5 < (Now)) then
                  begin
                     l6to12mths5.Font.Color := clRed;
                     l1to2yrs5.Font.Color := clRed;
                  end;
            end
         else if (NumDates = 5) then
            begin
               if (Date1 < (Now)) then
                  begin
                     l6to12mths1.Font.Color := clRed;
                     l1to2yrs1.Font.Color := clRed;
                  end;
               if (Date2 < (Now)) then
                  begin
                     l6to12mths2.Font.Color := clRed;
                     l1to2yrs2.Font.Color := clRed;
                  end;
               if (Date3 < (Now)) then
                  begin
                     l6to12mths3.Font.Color := clRed;
                     l1to2yrs3.Font.Color := clRed;
                  end;
               if (Date4 < (Now)) then
                  begin
                     l6to12mths4.Font.Color := clRed;
                     l1to2yrs4.Font.Color := clRed;
                  end;
               if (Date5 < (Now)) then
                  begin
                     l6to12mths5.Font.Color := clRed;
                     l1to2yrs5.Font.Color := clRed;
                  end;
               if (Date6 < (Now)) then
                  begin
                     l6to12mths6.Font.Color := clRed;
                     l1to2yrs6.Font.Color := clRed;
                  end;
            end;
      end;
end;


procedure TfmExtenCensus.lAvgLUNoRoundPrint(sender: TObject;
  var Value: String);
begin
   Value := '('+Value+')';
end;

procedure TfmExtenCensus.lStockDenNoRoundPrint(sender: TObject;
  var Value: String);
begin
   Value := '('+Value+')';
end;

end.
