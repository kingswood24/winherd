{
   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
}

unit uPedUpgradeReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, ExtCtrls, RXCtrls, ComCtrls, ToolWin, QRCtrls,
  QuickRpt, db, dbTables, uHerdLookup, KDBRoutines, QRExport, cxControls,
  cxContainer, cxEdit, cxCheckBox;

type
  TfmPedUpgradeReport = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    CowFamilyRep: TQuickRep;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel9: TQRLabel;
    PageFooterBand1: TQRBand;
    cbUseFilter: TCheckBox;
    rgSortBy: TRadioGroup;
    rgSortOrder: TRadioGroup;
    rgInclude: TRadioGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    Bevel1: TBevel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    lHerdId: TQRLabel;
    lSortBy: TQRLabel;
    lSortOrder: TQRLabel;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    VerLabel: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel22: TQRLabel;
    Stars: TQRLabel;
    lUsingFilter: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbFavourite: TcxCheckBox;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure HerdComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    StrHerdID : String;
    MyQuery,
    GenQuery : TQuery;
    HerdType : THerdType;
    NoOfDisplayedRecords : Integer;
    procedure OutputReport;
    procedure AssignDataSetToDbControls(FAssign : Boolean);
    procedure GetDaughters(AnimalID : Integer; out DList : TStringList);
  public
    { Public declarations }
  end;

const
   iSortFields : array [0..5] of String = ('AnimalNo', 'NatIDNum', 'Name', 'DateOfBirth', 'Sires.AnimalNo', 'Dams.AnimalNo');
   iSortOrder : array [0..1] of String = ('ASC', 'DESC');

var
  fmPedUpgradeReport: TfmPedUpgradeReport;

implementation
uses
   DairyData, GenTypesConst;

{$R *.DFM}

procedure TfmPedUpgradeReport.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TfmPedUpgradeReport.sbViewClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;
   sbView.Enabled := False;
   sbPrint.Enabled := False;
   try
      NoOfDisplayedRecords := 0;
      OutputReport;
      if GenQuery.RecordCount > 0 then
         begin
            Screen.Cursor := crHandPoint;

            lSortBy.Caption := rgSortBy.Items[rgSortBy.ItemIndex];
            lSortOrder.Caption := rgSortOrder.Items[rgSortOrder.ItemIndex];
            lHerdId.Caption := HerdCombo.Text;
            if cbUseFilter.Checked then
               lUsingFilter.Caption := 'Applying '+ Copy(cbUseFilter.Caption, 7, Length(cbUseFilter.Caption))
            else
               lUsingFilter.Caption := '';


            if (Sender as TRxSpeedButton).Tag = 0 then
               CowFamilyRep.Preview
            else
               CowFamilyRep.Print;
         end
      else
         MessageDlg('There are no records to be found',mtInformation,[mbOk],0);
   finally
      Screen.Cursor := crDefault;
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TfmPedUpgradeReport.HerdComboChange(Sender: TObject);
begin
   StrHerdID := HerdCombo.Value;
   SetLength(StrHerdID, Length(StrHerdID));
end;

procedure TfmPedUpgradeReport.FormCreate(Sender: TObject);
begin

   WinData.CanShowStandardReportHint := True;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);

   CowFamilyRep.Hide;
   HerdCombo.LookupSource := WinData.dsHerdDefaults;
   HerdCombo.KeyValue := WinData.UserDefaultHerdID;
   cbUseFilter.Checked := WinData.ActiveFilter;
{   if cbUseFilter.Visible then
      cbUseFilter.Checked := True
   else
      cbUseFilter.Hide;
}
   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := Aliasname;

   MyQuery := TQuery.Create(nil);
   MyQuery.DatabaseName := Aliasname;
   MyQuery.SQL.Text := 'Select ID From Animals Where DamID = :DID';

   AssignDataSetToDbControls(True);
   VerLabel.Caption := 'Herd Management ' + HerdVerNo;


end;

procedure TfmPedUpgradeReport.OutputReport;
begin
   CowFamilyRep.DataSet := GenQuery;
   HerdType := HerdLookup.GetHerdType(StrToInt(StrHerdID));
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.NatIDNum, A.Name, A.DateOfBirth,');
         SQL.Add('                A.DamID, A.SireID, Dams.AnimalNo DamNo, Dams.NatIDNum DamNatIDNum, Dams.Name DamName, ');
         SQL.Add('                Dams.DateOfBirth DamDateOfBirth, Sires.AnimalNo SireNo, Sires.Name SireName, Sires.HerdBookNo SireHBN, Sires.PrimaryBreed SireBreed');
         SQL.Add('FROM Animals A ');
         SQL.Add('LEFT JOIN Animals Dams ON (Dams.ID=A.DamID) ');
         SQL.Add('LEFT JOIN Animals Sires ON (Sires.ID=A.SireID) ');
         if cbUseFilter.Checked then
            SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
         SQL.Add('WHERE ( A.InHerd = True )');
         if StrHerdID <> '0' then
            SQL.Add('AND ( A.HerdID = '+StrHerdID+')')
         else
            SQL.Add('AND ( A.HerdID <> '+IntToStr(WinData.NONEHerdID)+')');
         SQL.Add('AND ( A.AnimalDeleted = False )');
         SQL.Add('ORDER BY '+ iSortFields[rgSortBy.ItemIndex]+ ' '+iSortOrder[rgSortOrder.ItemIndex] + '');
         Prepare;
         Open;
      end;
end;

procedure TfmPedUpgradeReport.AssignDataSetToDbControls(FAssign: Boolean);
begin
   if FAssign then
      begin
         QRDBText1.DataSet := GenQuery;
         QRDBText2.DataSet := GenQuery;
         QRDBText3.DataSet := GenQuery;
         QRDBText4.DataSet := GenQuery;
         QRDBText5.DataSet := GenQuery;
         QRDBText6.DataSet := GenQuery;
         QRDBText8.DataSet := GenQuery;
         QRDBText9.DataSet := GenQuery;
         QRDBText10.DataSet := GenQuery;
         QRDBText11.DataSet := GenQuery;
         QRDBText12.DataSet := GenQuery;
      end
   else
      begin
         QRDBText1.DataSet := nil;
         QRDBText2.DataSet := nil;
         QRDBText3.DataSet := nil;
         QRDBText4.DataSet := nil;
         QRDBText5.DataSet := nil;
         QRDBText6.DataSet := nil;
         QRDBText8.DataSet := nil;
         QRDBText9.DataSet := nil;
         QRDBText10.DataSet := nil;
         QRDBText11.DataSet := nil;
         QRDBText12.DataSet := nil;
      end;
end;

procedure TfmPedUpgradeReport.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   
   if GenQuery <> nil then
      begin
         AssignDataSetToDbControls(False);
         GenQuery.Close;
         GenQuery.Free;
      end;
end;

procedure TfmPedUpgradeReport.QRDBText1Print(sender: TObject;
  var Value: String);
var
   GDamID : Integer;
begin
   Stars.Caption:= '';
   if GenQuery.FieldByName('DamID').AsInteger > 0 then
      begin
         if WinData.LookUpDamSire.Locate('ID', GenQuery.FieldByName('DamID').AsInteger, []) then
            if ( WinData.LookUpDamSire.FieldByName('DamID').AsInteger > 0 ) and ( WinData.LookUpDamSire.FieldByName('InHerd').AsBoolean ) then
               begin
                  GDamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger;
                  Stars.Caption := '* ';

                  if WinData.LookUpDamSire.Locate('ID', GDamID, [] ) then
                     if ( WinData.LookUpDamSire.FieldByName('DamID').AsInteger > 0 ) and ( WinData.LookUpDamSire.FieldByName('InHerd').AsBoolean ) then
                        Stars.Caption := '**';
               end;
      end
end;

procedure TfmPedUpgradeReport.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   { If HerdType = htSuckler or htNone just leave as is with no filtering }
   { Animal must have Sire Breed to do check below }
   if GenQuery.FieldByName('SireBreed').AsInteger > 0 then
      begin
         if HerdType = htDairy then
            { Do not allow Animals with a Beef Sire into report }  { Beef = (B.EligibleforPremium = True) }
            PrintBand := IsDairyAnimal(GenQuery.FieldByName('SireBreed').AsInteger)
         else if HerdType = htBeef then
            { Only allow Animals with a Beef Sire into report }
            PrintBand := not IsDairyAnimal(GenQuery.FieldByName('SireBreed').AsInteger);
      end;

   if PrintBand then
      Inc(NoOfDisplayedRecords);

//   if GenQuery.RecNo mod 5 = 0 then
   if NoOfDisplayedRecords mod 5 = 0 then
      TQrband(Sender).Height := 34  // allow twice normal height for visual seperator
   else
      TQrband(Sender).Height := 17
end;

procedure TfmPedUpgradeReport.GetDaughters(AnimalID : Integer; out DList : TStringList);
begin
end;


procedure TfmPedUpgradeReport.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Font.Color := clBlue;
      end
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TfmPedUpgradeReport.FormActivate(Sender: TObject);
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

procedure TfmPedUpgradeReport.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmPedUpgradeReport.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cIHFAUpgRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cIHFAUpgRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmPedUpgradeReport.FormShow(Sender: TObject);
begin
   cbFavourite.Checked := WinData.IsReportFavourite(cIHFAUpgRep);
   WinData.UpdateRecentReportUsage(cIHFAUpgRep);
end;

end.

