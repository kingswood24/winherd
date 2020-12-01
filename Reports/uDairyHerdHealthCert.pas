{
   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   12/12/14 [V5.3 R9.3] /MK Additional Feature - Only show animals that are breeding - GL/Liam Phelan(2158) request.

   30/01/18 [V5.7 R7.7] /MK Bug Fix - If Apply Animal Grid Filter is ticked then don't apply a filter for InHerd animals only - GL/John Merrick.
                            Change - If the user has applied the StockInHerd filter then change the date on the report to the StockInHerd date selected - GL/John Merrick.
}

unit uDairyHerdHealthCert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, QRExport, ComCtrls, ExtCtrls, StdCtrls, Mask, ToolEdit,
  RxLookup, RXCtrls, ToolWin, Db, DBTables, QRCtrls, QuickRpt, cxControls,
  cxContainer, cxEdit, cxCheckBox, GenTypesConst;

type
  TDairyHerdHealthCert = class(TReportsBaseForm)
    QRLabel13: TQRLabel;
    lOwnerName: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    cbFavourite: TcxCheckBox;
    qrlFilteredDate: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     procedure Preview(const ToScreeen : Boolean = True);
  public
    { Public declarations }
  end;

const
   cSQLText = 'SELECT Distinct(A.ID), A.NatIDNum, A.SortNatID, A.AnimalNo,'+#13#10+
              '       A.SortAnimalNo, A.DateOfBirth'+#13#10+
              'FROM Animals A'+#13#10+
              'LEFT JOIN Breeds B ON (A.PrimaryBreed=B.ID)'+#13#10+
              //   12/12/14 [V5.3 R9.3] /MK Additional Feature - Only show animals that are breeding - GL/Liam Phelan(2158) request.
              'WHERE (A.Sex = "Female") AND (A.LactNo>0) AND (A.Breeding=True)'+#13#10+
              'AND   (A.AnimalDeleted=FALSE) AND (A.HerdID = :AHerdID)'+#13#10+
              'AND   (B.EligibleForPremium = FALSE)'+#13#10+
              'ORDER By %s %s';

var
  DairyHerdHealthCert: TDairyHerdHealthCert;

implementation

uses DairyData;

{$R *.DFM}

procedure TDairyHerdHealthCert.FormCreate(Sender: TObject);
begin
  inherited;
  LFromDate.Hide;
  LToDate.Hide;
  FromDate.Hide;
  ToDate.Hide;
  ProgBar.Hide;
  lWaitCaption.Hide;
  QRDBText3.OnPrint := QRDateLabelHandler;
  lOwnerName.Caption := '';
  qrlHerdIdentity.Caption := '';
  qrlSortBy.Caption := '';
  qrlSortOrder.Caption := '';
  WinData.CanShowStandardReportHint := True;
end;

procedure TDairyHerdHealthCert.Preview(const ToScreeen : Boolean = True);
var
   sSortBy : string;
   sOrderBy : string;
   sqlText : TStringList;
   StockInHerdDate : TDateTime;

   function ShowStockFilterDate : TDateTime;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ShowStock, StockDate');
            SQL.Add('FROM Flt');
            try
               Open;
               if ( RecordCount > 0 ) and ( Fields[0].AsBoolean ) then
                  Result := Fields[1].AsDateTime;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   StockInHerdDate := ShowStockFilterDate;

   lOwnerName.Caption := OwnerName;
   qrlHerdIdentity.Caption := HerdIdentity;
   qrlSortBy.Caption := SortByField;
   qrlSortOrder.Caption := SortByOrder;

   case rgSortBy.ItemIndex of
      0 : sSortBy := 'SortAnimalNo';
      1 : sSortBy := 'SortNatID';
      2 : sSortBy := 'DateOfBirth';
   end;

   if rgSortORder.ItemIndex = cAscending then
      sOrderBy := 'ASC'
   else
      sOrderBy := 'DESC';

   sqlText := TStringList.Create;
   try
      sqlText.Text := cSQLText;
      DateTimeLabel.Enabled := True;
      qrlFilteredDate.Enabled := False;
      if ( cbUseFilter.Checked ) then
         begin
            sqlText.Insert( sqlText.Count-1, 'AND (ID IN (SELECT AID FROM AFILTERS ))');
            if ( StockInHerdDate > 0 ) then
               begin
                  DateTimeLabel.Enabled := False;
                  qrlFilteredDate.Enabled := True;
                  qrlFilteredDate.Caption := 'Date/Time: '+DateTimeToStr(StockInHerdDate+Time);
               end;
         end
      else
         sqlText.Insert( sqlText.Count-1, 'AND (A.InHerd = TRUE)');

      sqlText.Strings[ sqlText.Count-1 ] := Format(sqlText.Strings[ sqlText.Count-1 ], [sSortBy, sOrderBy]);
      GenQuery.SQL.Text := sqlText.Text;
   finally
      FreeAndNil(sqlText);
   end;
   GenQuery.Params[0].AsInteger := HerdID;
   GenQuery.Prepare;
   GenQuery.Active := True;

   try
      if ToScreeen then
         BaseReport.Preview
      else
         BaseReport.Print;
   finally
      GenQuery.Active := False;
   end;
end;

procedure TDairyHerdHealthCert.sbViewClick(Sender: TObject);
begin
  inherited;
  WinData.cxHint.HideHint;
  WinData.CanShowStandardReportHint := False;

  EnableViewPrintButtons(False);
  try
     Preview;
  finally
     inherited;
     EnableViewPrintButtons(True);
  end;
end;

procedure TDairyHerdHealthCert.sbPrintClick(Sender: TObject);
begin
  inherited;
  try
     Preview(false);
  finally
     inherited;
  end;
end;

procedure TDairyHerdHealthCert.cbUseFilterClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TDairyHerdHealthCert.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if WinData.CanShowStandardReportHint then
      begin
         WinData.CallHintStyle;
         pt.x := 0;
         pt.y := 0;
         pt := sbView.ClientToScreen(pt);
         WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
      end;
end;

procedure TDairyHerdHealthCert.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TDairyHerdHealthCert.FormDestroy(Sender: TObject);
begin
  inherited;
  WinData.cxHint.HideHint;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TDairyHerdHealthCert.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cDairyHerdHealthCertRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cDairyHerdHealthCertRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TDairyHerdHealthCert.FormShow(Sender: TObject);
begin
   inherited;
   cbFavourite.Checked := WinData.IsReportFavourite(cDairyHerdHealthCertRep);
   WinData.UpdateRecentReportUsage(cDairyHerdHealthCertRep);
end;

end.
