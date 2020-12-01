unit DueToCalve;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TDueToCalveScr = class(TQuickRep)
    PageFooterBand1: TQRBand;
    MainHeader: TQRBand;
    qDueToCalve: TQuery;
    FBTitle1: TQRLabel;
    L1: TQRLabel;
    L3: TQRLabel;
    L6: TQRLabel;
    L5: TQRLabel;
    L2: TQRLabel;
    L7: TQRLabel;
    L9: TQRLabel;
    L10: TQRLabel;
    L4: TQRLabel;
    QRLabel13: TQRLabel;
    L11: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    Period: TQRLabel;
    Details: TQRBand;
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
    DataHeader: TQRBand;
    FBTitle2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel3: TQRLabel;
    BlankFormDate: TQRLabel;
    FormDate: TQRLabel;
    FormUnderline: TQRLabel;
    VerLabel: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    procedure DueToCalveScrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
  private

  public
     PrintOutBlank : Boolean;
  end;

var
  DueToCalveScr: TDueToCalveScr;

implementation
uses
    DairyData, ActionReminderFilt;

{$R *.DFM}

procedure TDueToCalveScr.DueToCalveScrBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     If PrintOutBlank Then
        Begin
           DueToCalveScr.MainHeader.Enabled := False;    // Data Entry
           FormDate.Enabled := True;
           FormDate.Show;
           FormUnderline.Enabled := True;
           FormUnderline.Show;
           DueToCalveScr.DataHeader.Enabled := True;
        end
     else
        begin
           DueToCalveScr.MainHeader.Enabled := True;     // Main Rpt
           FormDate.Enabled := False;
           FormDate.Hide;
           FormUnderline.Enabled := False;
           FormUnderline.Hide;
           DueToCalveScr.DataHeader.Enabled := False;
        end;
end;

procedure TDueToCalveScr.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0  then
      Value := '';
end;

procedure TDueToCalveScr.QRDBText11Print(sender: TObject;
  var Value: String);
begin
   if Value = '.0' then Value := '';
end;

procedure TDueToCalveScr.QRDBText12Print(sender: TObject;
  var Value: String);
begin
   if ( qDueToCalve.FieldByName('HealthDate').AsDateTime > 0 ) and ( qDueToCalve.FieldByName('WithdrawalDate').AsDateTime > 0 ) then
      Value := FormatDateTime('dd/mm/yy',qDueToCalve.FieldByName('WithdrawalDate').AsDateTime) + ' ('+FormatDateTime('dd/mm/yy',qDueToCalve.FieldByName('HealthDate').AsDateTime)+')'
   else if ( qDueToCalve.FieldByName('HealthDate').AsDateTime <= 0 ) and  ( qDueToCalve.FieldByName('WithdrawalDate').AsDateTime > 0 ) then
      Value := FormatDateTime('dd/mm/yy',qDueToCalve.FieldByName('WithdrawalDate').AsDateTime)
   else if ( qDueToCalve.FieldByName('HealthDate').AsDateTime > 0 ) and ( qDueToCalve.FieldByName('WithdrawalDate').AsDateTime <= 0 ) then
      Value := '('+FormatDateTime('dd/mm/yy',qDueToCalve.FieldByName('HealthDate').AsDateTime)+')'
   else
      Value := '';
end;

end.
