unit uPhoneLinkEventsRpt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, ExtCtrls, Db, dbTables, StdCtrls;

type
  TPhoneLinkEventsRpt = class(TForm)
    QuickRep2: TQuickRep;
    QRBand9: TQRBand;
    QRBand10: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel75: TQRLabel;
    QRSubDetail9: TQRSubDetail;
    GroupHeaderBand9: TQRBand;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    lBulling: TQRLabel;
    QRSubDetail10: TQRSubDetail;
    GroupHeaderBand10: TQRBand;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRSubDetail3: TQRSubDetail;
    GroupHeaderBand6: TQRBand;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    lDryOff: TQRLabel;
    QRSubDetail7: TQRSubDetail;
    GroupHeaderBand11: TQRBand;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRBand11: TQRBand;
    QRLabel103: TQRLabel;
    QRBand12: TQRBand;
    QRLabel104: TQRLabel;
    Verlabel: TQRLabel;
    SMSEvents: TQuery;
    GroupFooterBand1: TQRBand;
    GroupFooterBand2: TQRBand;
    GroupFooterBand3: TQRBand;
    GroupFooterBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    GroupFooterBand5: TQRBand;
    GroupHeaderBand1: TQRBand;
    QRSubDetail2: TQRSubDetail;
    GroupHeaderBand2: TQRBand;
    GroupFooterBand6: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText12: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRSubDetail9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupHeaderBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText32Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    qPrintBand : TQuery;
    function CheckPrintBand(const AEventType : Integer) : Boolean;
    procedure ProcessListData(OutputBand : TQRCustomBand; AList : TStringList);
  public
    { Public declarations }
  end;

  procedure PrintForm(var MessageList, ErroneousList : TStringList; Print : Boolean);

var
  PhoneLinkEventsRpt: TPhoneLinkEventsRpt;

implementation
uses
   GenTypesConst, DairyData;

{$R *.DFM}

  procedure PrintForm(var MessageList, ErroneousList : TStringList; Print : Boolean);
  begin
     Application.CreateForm(TPhoneLinkEventsRpt, PhoneLinkEventsRpt);
     try
        PhoneLinkEventsRpt.ProcessListData(PhoneLinkEventsRpt.QRBand10, MessageList);
        PhoneLinkEventsRpt.ProcessListData(PhoneLinkEventsRpt.QRBand11, ErroneousList);
        PhoneLinkEventsRpt.SMSEvents.Open;
        try
           if Print then
              PhoneLinkEventsRpt.QuickRep2.Print
           else
              PhoneLinkEventsRpt.QuickRep2.Preview;
        finally
           PhoneLinkEventsRpt.SMSEvents.Close;
        end;
     finally
        FreeAndNil(PhoneLinkEventsRpt);
     end;
  end;

procedure TPhoneLinkEventsRpt.FormCreate(Sender: TObject);
begin
   qPrintBand := TQuery.Create(nil);
   qPrintBand.DataBasename := AliasName;
   qPrintBand.SQL.Add('Select Count(AnimalID) CountOfID From tSMSEvents');
   qPrintBand.SQL.Add('Where ( EventType = :AEventType )');
end;

function TPhoneLinkEventsRpt.CheckPrintBand(
  const AEventType: Integer): Boolean;
begin
   qPrintBand.Params[0].Value := AEventType;
   qPrintBand.Prepare;
   qPrintBand.Open;
   try
      qPrintBand.First;
      Result := ( qPrintBand.FieldByName('CountOfID').AsInteger > 0 );
   finally
      qPrintBand.Close;
   end;
end;

procedure TPhoneLinkEventsRpt.FormDestroy(Sender: TObject);
begin
   if qPrintBand <> nil then
      qPrintBand.Free;
end;

procedure TPhoneLinkEventsRpt.ProcessListData(OutputBand: TQRCustomBand;
  AList: TStringList);
  function CheckValidDate( const str : string) : string;
  var
   tstr : string;
  begin
     tstr := StringReplace ( Str, '30/12/1899', FormatDateTime('dd/mm/yyyy', Date), []);
     Result := tStr;
  end;
var
   i, LastTop : Integer;
begin
   if AList <> nil then
      begin
         if AList.Count > 0 then
            begin
               LastTop := 35;
               for i := 0 to AList.Count-1 do
                  begin
                     with TQRLabel.Create(PhoneLinkEventsRpt) do
                        begin
                           Parent := OutputBand;
                           Top := LastTop;
                           Left := 25;
                           Font.Name := 'Verdana';
                           Font.Size := 8;
                           Caption := IntToStr( i + 1 ) + ' ' + CheckValidDate(AList.Strings[i]);
                           Inc(LastTop, 25);
                           OutputBand.Height := OutputBand.Height + 25;
                        end;
                  end;
            end;
      end;

end;

procedure TPhoneLinkEventsRpt.QuickRep1Preview(Sender: TObject);
begin
   Verlabel.Caption := 'Kingswood Herd Management ' + HerdVerNo;
end;

procedure TPhoneLinkEventsRpt.QRSubDetail9BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail9.Dataset.FieldByName('EventType').ASInteger in [1,2] );
   lBulling.Enabled := ( QRSubDetail9.Dataset.FieldByName('EventType').ASInteger = 1 );
end;

procedure TPhoneLinkEventsRpt.QRSubDetail10BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail10.Dataset.FieldByName('EventType').ASInteger = 3 );
end;

procedure TPhoneLinkEventsRpt.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail3.Dataset.FieldByName('EventType').ASInteger in [4,6] );
   lDryOff.Enabled := ( QRSubDetail3.Dataset.FieldByName('EventType').ASInteger = 4 );
end;

procedure TPhoneLinkEventsRpt.QRSubDetail7BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail7.Dataset.FieldByName('EventType').ASInteger = 5 );
end;

procedure TPhoneLinkEventsRpt.GroupHeaderBand11BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := CheckPrintBand(5);
end;

procedure TPhoneLinkEventsRpt.GroupHeaderBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := CheckPrintBand(4) or CheckPrintBand(6);
end;

procedure TPhoneLinkEventsRpt.QRBand10BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := (Sender as TQRCustomBand).Height <> 48; // 48 = default band height
end;

procedure TPhoneLinkEventsRpt.GroupHeaderBand10BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := CheckPrintBand(3);
end;

procedure TPhoneLinkEventsRpt.GroupHeaderBand9BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := CheckPrintBand(1) or CheckPrintBand(2);
end;

procedure TPhoneLinkEventsRpt.QRDBText31Print(sender: TObject;
  var Value: String);
begin
   if Value <> '' then
      try
         if WinData.Medicine.Locate('ID', StrToInt(Value), []) then
            Value := WinData.Medicine.FieldByName('Name').AsString;
      except
         Value := '';
      end
end;

procedure TPhoneLinkEventsRpt.QRDBText32Print(sender: TObject;
  var Value: String);
begin
   if Value <> '' then
      try
         if WinData.qHealthCodes.Locate('ID', StrToInt(Value), []) then
            Value := WinData.qHealthCodes.FieldByName('Description').AsString;
      except
         Value := '';
      end
end;

procedure TPhoneLinkEventsRpt.QRDBText37Print(sender: TObject;
  var Value: String);
begin
   if UPPERCASE(Value) = 'TRUE' then
     Value := 'Yes'
   else
     Value := 'No';
end;

procedure TPhoneLinkEventsRpt.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail7.Dataset.FieldByName('EventType').ASInteger = 7 );
end;

procedure TPhoneLinkEventsRpt.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   PrintBand := ( QRSubDetail7.Dataset.FieldByName('EventType').ASInteger = 11 );
end;

end.
