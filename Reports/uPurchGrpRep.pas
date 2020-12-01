{
   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   16/03/16 [V5.5 R5.4] /MK Bug Fix - PurchGrpData Sex Field width was changed to 15 but the tData TTable Sex Field width was not changed
                                      so an error was appearing "Type mismatch in expression".
                                    - When printing Quick Reports check to see if date is null date i.e. 30/12/1899 and set value to blank instead.  
                            Change - Added Query/DataSource for LookupPurchGrpHeader to allow sort by Code of Group.
                                   - sbViewClick/sbPrintClick - Check to see if there is data to print, if not show error.
}

unit uPurchGrpRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXSpin, ExtCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin, Mask,
  ToolEdit, Qrctrls, quickrpt, Db, DBTables, QRExport, cxControls,
  cxContainer, cxEdit, cxCheckBox;

type
  TfPurchGrpRep = class(TForm)
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
    pStockOnHand: TPanel;
    PurchGrpRep: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    RptTitle: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    PurchGrpDataDetail: TQRBand;
    dbCostIntoPen: TQRDBText;
    dbSupplier: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    VerLabel: TQRLabel;
    lPurchGrpSel: TLabel;
    qPurchGrpHeader: TQuery;
    dbBuyer: TQRDBText;
    qPurchGrpData: TQuery;
    dblcPurchGrp: TRxDBLookupCombo;
    QRLabel1: TQRLabel;
    dbGrade: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    dbColour: TQRDBText;
    dbMartPrice: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    dbEventDate: TQRDBText;
    dbTBTestDate: TQRDBText;
    dbWeight: TQRDBText;
    dbEventDesc: TQRDBText;
    dbAnimalNum: TQRDBText;
    dbNatIDNum: TQRDBText;
    dbDateOfBirth: TQRDBText;
    dbPrimaryBreed: TQRDBText;
    dbBreeding: TQRDBText;
    dbSupplierCosts: TQRDBText;
    dbBuyerCosts: TQRDBText;
    dbSex: TQRDBText;
    dbBatch: TQRDBText;
    dbPen: TQRDBText;
    dbCurrLactNum: TQRDBText;
    lPurchGrpNum: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    lRecCount: TQRLabel;
    rgRepSel: TRadioGroup;
    AbrPurchGrpRep: TQuickRep;
    ColumnHeaderBand2: TQRBand;
    AbrPurchGrpDataDetail: TQRBand;
    PageFooterBand2: TQRBand;
    SummaryBand2: TQRBand;
    AbrRptTitle: TQRLabel;
    QRLabel28: TQRLabel;
    lAbrPurchGrpNum: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel30: TQRLabel;
    AbrVerLabel: TQRLabel;
    QRLabel32: TQRLabel;
    lAbrRecCount: TQRLabel;
    QRLabel34: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    lSex: TQRLabel;
    lNumber: TQRLabel;
    lShrinkage: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    dbAbrAnimalNum: TQRDBText;
    dbAbrNatIDNum: TQRDBText;
    dbAbrPriamryBreed: TQRDBText;
    dbAbrCostIntoPen: TQRDBText;
    dbAbrWeight: TQRDBText;
    lTotWeight: TQRLabel;
    lTotCostIntoPen: TQRLabel;
    tPurchGrpHeader: TTable;
    tPurchGrpData: TTable;
    dsPurchGrpData: TDataSource;
    dsPurchGrpHeader: TDataSource;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbFavourite: TcxCheckBox;
    procedure sbExitClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BeforePrintOfDate(sender: TObject; var Value: String);

  private
    { Private declarations }
    tData : TTable;
    FDSLookupPurchGrpHeader : TDataSource;
    FQLookupPurchGrpHeader : TQuery;

    procedure BuildData;
    procedure CreateTempTable;
    procedure LoadOtherData;

  public
    { Public declarations }
    class procedure ShowTheForm;

  end;

implementation
uses
    GenTypesConst,
    uBBPPurchScr,
    DairyData;
var
  fPurchGrpRep: TfPurchGrpRep;

{$R *.DFM}

class procedure TfPurchGrpRep.ShowTheForm;
begin
   with TfPurchGrpRep.Create(nil) do
      try
         try
            tPurchGrpData.Open;
            tPurchGrpHeader.Open;
            ShowModal;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         tPurchGrpData.Close;
         tPurchGrpHeader.Close;
         Free;
      end;
end;

procedure TfPurchGrpRep.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfPurchGrpRep.BuildData;
begin
   //Next run SQL to populate the table
   qPurchGrpData.SQL.Clear;
   qPurchGrpData.SQL.Add('INSERT INTO tData (ID, PurchGrpHeaderID, AnimalNo, NatIDNum,');
   qPurchGrpData.SQL.Add('                   DateOfBirth, TBTestDate, PrimaryBreedID, Weight, EventDesc,');
   qPurchGrpData.SQL.Add('                   Grade, ColourID, MartPrice, CostIntoPen, EventDate,');
   qPurchGrpData.SQL.Add('                   SupplierID, BuyerID, Sex, BatchID, PenID,');
   qPurchGrpData.SQL.Add('                   Breeding, CurrLactNum, SupplierCosts, BuyerCosts)');

   qPurchGrpData.SQL.Add('SELECT DISTINCT D.ID, D.PurchGrpHeaderID, D.AnimalNo, D.NatIDNum,');
   qPurchGrpData.SQL.Add('       D.DateOfBirth, D.TBTestDate, D.PrimaryBreed, D.Weight, D.EventDesc,');
   qPurchGrpData.SQL.Add('       D.Grade, D.Colour, D.MartPrice, D.CostIntoPen, D.EventDate,');
   qPurchGrpData.SQL.Add('       D.SupplierID, D.BuyerID, D.Sex, D.GroupID, D.PenID,');
   qPurchGrpData.SQL.Add('       D.Breeding, D.LactationNumber, D.SupplierCosts, D.BuyerCosts');

   qPurchGrpData.SQL.Add('FROM '+tPurchGrpData.TableName+' D');
   qPurchGrpData.SQL.Add('LEFT JOIN '+tPurchGrpHeader.TableName+' D1 ON (D1.ID = D.PurchGrpHeaderID)');
   qPurchGrpData.SQL.Add('LEFT JOIN '+WinData.Groups.TableName+' D2 ON (D2.ID = D1.PurchGroupID)');
   qPurchGrpData.SQL.Add('WHERE (D.PurchGrpHeaderID = '+VarToStr(dblcPurchGrp.Value)+')');

   qPurchGrpData.ExecSQL;

   //Now to add the remaining data
   LoadOtherData;
   //Now to select datafrom table for display
   qPurchGrpData.SQL.Clear;
   qPurchGrpData.SQL.Add('SELECT AnimalNo, NatIDNum, DateOfBirth,');
   qPurchGrpData.SQL.Add('TBTestDate, PrimaryBreed, Weight, EventDesc,');
   qPurchGrpData.SQL.Add('Grade, Colour, MartPrice, CostIntoPen, EventDate,');
   qPurchGrpData.SQL.Add('Supplier, Buyer, Sex, Batch, Pen,');
   qPurchGrpData.SQL.Add('Breeding, CurrLactNum, SupplierCosts, BuyerCosts');
   qPurchGrpData.SQL.Add('FROM tData');
   qPurchGrpData.Open;
end;

procedure TfPurchGrpRep.LoadOtherData;
var
   TotWeight : Double;
   TotCostIntoPen : Double;
begin
   // Loads up all other data required for the animals

   // First intialise variables
   TotWeight := 0;
   TotCostIntoPen := 0;
   // Now to step throught each record
   with tData do
      begin
         First;
         //Now to get Sex, Number In Group and Shrinkage and put into the Group Header
         if Not ( tData.EOF ) then
            begin
                 if tPurchGrpHeader.Locate('ID', tData.FieldByName('PurchGrpHeaderID').AsVariant,[]) then
                    begin
                         lSex.Caption := tPurchGrpHeader.FieldByName('Sex').AsString;
                         lNumber.Caption := tPurchGrpHeader.FieldByName('Number').AsString;
                         lShrinkage.Caption := FloatToStr( Round( tPurchGrpHeader.FieldByName('TagWtVsMartWtVar').AsFloat * 100 ) / 100 ) + '%';
                    end;
            end;
         //Now to get additional information for each record.
         while NOT ( tData.EOF ) do
            begin
               Edit;
               //Get Primary Breed information
               If WinData.Breeds.Locate('ID',tData.FieldByName('PrimaryBreedID').AsVariant,[]) then
                  Begin
                       tData.FieldByName('PrimaryBreed').AsString := WinData.Breeds.FieldByName('Name').AsString;
                  End;
               //Get Colour name
               If WinData.GenLookUp.Locate('ID',tData.FieldByName('ColourID').AsVariant,[]) then
                  Begin
                       tData.FieldByName('Colour').AsString := WinData.GenlookUp.FieldByName('Description').AsString;
                  End;
               //Get Supplier name
               If WinData.Suppliers.Locate('ID',tData.FieldByName('SupplierID').AsVariant,[]) then
                  Begin
                       tData.FieldByName('Supplier').AsString := WinData.Suppliers.FieldByName('Name').AsString;
                  End;
               //Get Buyer name
               If WinData.Buyers.Locate('ID',tData.FieldByName('BuyerID').AsVariant,[]) then
                  Begin
                       tData.FieldByName('Buyer').AsString := WinData.Buyers.FieldByName('Name').AsString;
                  End;
               //Get Batch Code
               If WinData.Groups.Locate('ID',tData.FieldByName('BatchID').AsVariant,[]) then
                  Begin
                       tData.FieldByName('Batch').AsString := WinData.Groups.FieldByName('Code').AsString;
                  End;
               //Get Pen Code
               If WinData.Groups.Locate('ID',tData.FieldByName('PenID').AsVariant,[]) then
                  Begin
                       tData.FieldByName('Pen').AsString := WinData.Groups.FieldByName('Code').AsString;
                  End;

               Post;
               //Total Weight and Cost Into Pen
               TotWeight := TotWeight + tData.FieldByName('Weight').AsFloat;
               TotCostIntoPen := TotCostIntoPen + tData.FieldByName('CostIntoPen').AsFloat;

               Next;
            end;    //EndWhile Not EOF
      end;       //EndWith
   // Now to record totals
   lTotWeight.Caption := FloatToStr(TotWeight) + 'kg';
   lTotCostIntoPen.Caption := 'IR�' + FloatToStr(TotCostIntoPen);
end;

procedure TfPurchGrpRep.sbViewClick(Sender: TObject);
begin
   try
      if ( tData.RecordCount > 0 ) then
         begin
            qPurchGrpData.SQL.Clear;
            qPurchGrpData.SQL.Add('DELETE FROM '+tData.TableName+'');
            qPurchGrpData.ExecSQL;
         end;

      if ( dblcPurchGrp.Value = '0' ) or ( Length(dblcPurchGrp.Value) = 0 ) then
         MessageDlg('Please select a Purchase Group',mtInformation,[mbOK],0)
      else
         with PurchGrpRep do
            begin
               lPurchGrpNum.Caption := dblcPurchGrp.Text;   //Writes selected Purchase Group Code on Report
               lAbrPurchGrpNum.Caption := dblcPurchGrp.Text;   //Writes selected Purchase Group Code on Report
               VerLabel.Caption := 'Herd Management ' + HerdVerNo;
               AbrVerLabel.Caption := 'Herd Management ' + HerdVerNo;
               BuildData;    // Calls Procedure to build both reports
               // Euro/Pound
               if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
                  with qPurchGrpData do
                     begin
                        SQL.Clear;
                        SQL.Add('UPDATE tData SET MartPrice      = (MartPrice*'+FloatToStr(cEuro)+'),     ');
                        SQL.Add('                 CostIntoPen    = (CostIntoPen*'+FloatToStr(cEuro)+'),   ');
                        SQL.Add('                 SupplierCosts  = (SupplierCosts*'+FloatToStr(cEuro)+'), ');
                        SQL.Add('                 BuyerCosts     = (BuyerCosts*'+FloatToStr(cEuro)+')     ');
                        ExecSQL;
                     end;

               if ( (Sender as TRxSpeedButton).Name = 'sbView' ) or ( (Sender as TRxSpeedButton).Name = 'sbPrint' ) then
                  if ( qPurchGrpData.RecordCount = 0 ) then
                     begin
                        MessageDlg('No data available to print.',mtInformation,[mbOK],0);
                        Exit;
                     end;

               if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                  case rgRepSel.ItemIndex of
                     0 : with AbrPurchGrpRep do     // View Detailed Report
                            begin
                               AbrPurchGrpDataDetail.Font.Color := clNavy;
                               AbrRptTitle.Font.Color := clRed;
                               AbrPurchGrpRep.Preview;
                            end;
                     1 : with PurchGrpRep do     // View Detailed Report
                            begin
                               PurchGrpDataDetail.Font.Color := clNavy;
                               RptTitle.Font.Color := clRed;
                               PurchGrpRep.Preview;
                            end
                  end   //EndCase
               else
                  case rgRepSel.ItemIndex of
                     0 : with AbrPurchGrpRep do     // Print Report
                            begin
                               AbrPurchGrpDataDetail.Font.Color := clBlack;
                               AbrRptTitle.Font.Color := clBlack;
                               Windata.CallPrintDialog(AbrPurchGrpRep);
                            end;  //EndWith
                     1 : with PurchGrpRep do     // Print Report
                            begin
                               PurchGrpDataDetail.Font.Color := clBlack;
                               RptTitle.Font.Color := clBlack;
                               Windata.CallPrintDialog(PurchGrpRep);
                            end;  //EndWith
                  end; //EndCase
            end;   //EndWith PurchGrpRep
      finally
      end
end;

procedure TfPurchGrpRep.FormCreate(Sender: TObject);
begin
   PurchGrpRep.Hide;   //Hides report from screen
   AbrPurchGrpRep.Hide;
   tData := TTable.Create(nil);  //Creates space for a table
   FQLookupPurchGrpHeader := TQuery.Create(nil);
   FQLookupPurchGrpHeader.DatabaseName := AliasName;
   FQLookupPurchGrpHeader.SQL.Clear;
   FQLookupPurchGrpHeader.SQL.Add('SELECT PurchGroupID, PurchGrpCode');
   FQLookupPurchGrpHeader.SQL.Add('FROM PurchGrpHeader');
   FQLookupPurchGrpHeader.SQL.Add('WHERE ( (PurchGroupID > 0) AND (PurchGroupID IS NOT NULL) )');
   FQLookupPurchGrpHeader.SQL.Add('AND   (PurchGroupID In (SELECT PurchGrpHeaderID FROM PurchGrpData))');
   FQLookupPurchGrpHeader.SQL.Add('ORDER BY PurchGrpCode');
   FQLookupPurchGrpHeader.Open;
   FDSLookupPurchGrpHeader := TDataSource.Create(nil);
   FDSLookupPurchGrpHeader.DataSet := FQLookupPurchGrpHeader;
   dblcPurchGrp.LookupField := '';
   dblcPurchGrp.LookupField := 'PurchGroupID';
   dblcPurchGrp.LookupSource := FDSLookupPurchGrpHeader;
   CreateTempTable;     //Procedure to create temp table
end;

procedure TfPurchGrpRep.CreateTempTable;
begin
   with tData do
      begin
         DatabaseName := WinData.KingData.DatabaseName;
         TableName := 'tData';
         FieldDefs.Add('ID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('PurchGrpHeaderID',ftInteger,0,FALSE);
         FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         FieldDefs.Add('NatIDNum',ftString,20,FALSE);
         FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
         FieldDefs.Add('TBTestDate',ftDate,0,FALSE);
         FieldDefs.Add('PrimaryBreedID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('PrimaryBreed',ftString,30,FALSE);
         FieldDefs.Add('Weight',ftFloat,0,FALSE);
         FieldDefs.Add('EventDesc',ftString,30,FALSE);
         FieldDefs.Add('Grade',ftString,15,FALSE);
         FieldDefs.Add('ColourID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('Colour',ftString,30,FALSE);
         FieldDefs.Add('MartPrice',ftFloat,0,FALSE);
         FieldDefs.Add('CostIntoPen',ftFloat,0,FALSE);
         FieldDefs.Add('EventDate',ftDate,0,FALSE);
         FieldDefs.Add('SupplierID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('Supplier',ftString,30,FALSE);
         FieldDefs.Add('BuyerID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('Buyer',ftString,30,FALSE);
         FieldDefs.Add('Sex',ftString,15,FALSE);
         FieldDefs.Add('BatchID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('Batch',ftString,6,FALSE);
         FieldDefs.Add('PenID',ftInteger,0,FALSE);  //ID
         FieldDefs.Add('Pen',ftString,6,FALSE);
         FieldDefs.Add('Breeding',ftBoolean,0,FALSE);
         FieldDefs.Add('CurrLactNum',ftSmallint,0,FALSE);
         FieldDefs.Add('SupplierCosts',ftFloat,0,FALSE);
         FieldDefs.Add('BuyerCosts',ftFloat,0,FALSE);
         CreateTable;
         Open;
      end;
end;

procedure TfPurchGrpRep.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lRecCount.Caption := IntToStr(tData.RecordCount);
end;

procedure TfPurchGrpRep.SummaryBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   lAbrRecCount.Caption := IntToStr(tData.RecordCount);
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfPurchGrpRep.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cBeefPurchGrpRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cBeefPurchGrpRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfPurchGrpRep.FormShow(Sender: TObject);
begin
   cbFavourite.Checked := WinData.IsReportFavourite(cBeefPurchGrpRep);
   WinData.UpdateRecentReportUsage(cBeefPurchGrpRep);
end;

procedure TfPurchGrpRep.BeforePrintOfDate(Sender: TObject; var Value: String);
begin
   if ( Value = '30/12/1899' ) then
      Value := '';
end;

procedure TfPurchGrpRep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if ( tData <> nil ) then
      begin
         if ( tData.Active ) then
            tData.Close;
         tData.DeleteTable;
         FreeAndNil(tData);
      end;
   if ( FQLookupPurchGrpHeader <> nil ) then
      begin
         if ( FQLookupPurchGrpHeader.Active ) then
            FQLookupPurchGrpHeader.Close;
         FreeAndNil(FQLookupPurchGrpHeader);
      end;
   if ( FDSLookupPurchGrpHeader <> nil ) then
      FreeAndNil(FDSLookupPurchGrpHeader);
end;

end.
