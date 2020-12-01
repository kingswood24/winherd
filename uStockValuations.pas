{
   29/11/10 [V4.0 R6.0] /MK Additional Feature - If Filter Applied on Main Grid, Show Animals In Filter.

   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

   07/08/18 [V5.8 R2.2] /MK Change - Moved cbFilter to the top of the form like other forms.
                                   - Don't exclude animals that were not purchased, instead show them in red on the report and show indicator
                                     at the top of the report to clarify what the red means.

   08/08/18 [V5.8 R2.2] /MK Change - GetAnimals - If cbFilter.Visible and Checked then only show report based on animals in the filter.
                                   - If cbFilter.Visble and Checked then grey out lPurchDateFilter and ToDate.
                                   - Changed lPurchDateFilter.Caption/qrlValueStockOnDate.Caption from "Include Animals Purchased on or before" to
                                     "Value stock as on date:".
                                   - If animals on the report do not have purchase details then, on view/print of the report,
                                     change sort to Purchase Date in Ascending order so that these animals appear first on the report.

   13/08/18 [V5.8 R2.3] /MK Bug Fix - GetAnimals - Don't use animals current gain per day, instead use its lifetime gain per day - GL.
                            Change - Changed all price per kg columns from Avg Per Kg. to Sale Price/KG - GL.
                                   - Changed around headings on grid and report so that it reads DLWG | Kill Out % | Sale Price/Kg.
                                   - CalcParams - If AvgSalesPricePerKg <= 0 then default to 4. This value should never be zero or blank - GL.

                                   
}

unit uStockValuations;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uReportsBaseForm, Db, DBTables, QRExport, QRCtrls, QuickRpt, StdCtrls,
  ComCtrls, ExtCtrls, Mask, ToolEdit, RxLookup, RXCtrls, ToolWin, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxmdaset, cxStyles, cxCheckBox, DairyData,
  GenTypesConst, uHerdLookup, uSQLFilters, kDBRoutines, KRoutines, uHelp;

type
  TfmStockValuationReport = class(TReportsBaseForm)
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
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
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    Bevel1: TBevel;
    lPurchDateFilter: TcxLabel;
    qrdbNetRelValue: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    qrlDLWG: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRShape25: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRExpr6: TQRExpr;
    Bevel2: TBevel;
    cxLabel3: TcxLabel;
    cmboSex: TcxComboBox;
    cxLabel4: TcxLabel;
    cmboAge: TcxComboBox;
    seMonths: TcxSpinEdit;
    cxLabel5: TcxLabel;
    ParamGridDBTableView: TcxGridDBTableView;
    ParamGridLevel: TcxGridLevel;
    ParamGrid: TcxGrid;
    MemData: TdxMemData;
    MemDataSex: TStringField;
    MemDataDLWGUM: TFloatField;
    MemDataDLWGOM: TFloatField;
    MemDataAVGPKGUM: TFloatField;
    MemDataAVGPKGOM: TFloatField;
    dsMemData: TDataSource;
    ParamGridDBTableViewRecId: TcxGridDBColumn;
    ParamGridDBTableViewSex: TcxGridDBColumn;
    ParamGridDBTableViewDLWGUM: TcxGridDBColumn;
    ParamGridDBTableViewDLWGOM: TcxGridDBColumn;
    ParamGridDBTableViewAVGPKGUM: TcxGridDBColumn;
    ParamGridDBTableViewAVGPKGOM: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleDisabled: TcxStyle;
    MemDataDLWG: TFloatField;
    MemDataAVGPKG: TFloatField;
    ParamGridDBTableViewDLWG: TcxGridDBColumn;
    ParamGridDBTableViewAVGPKG: TcxGridDBColumn;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText23: TQRDBText;
    qrlValueStockOnDate: TQRLabel;
    qrlPurchDate: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRShape6: TQRShape;
    MemDataKILLOUTPERC: TFloatField;
    ParamGridDBTableViewKILLOUTPERC: TcxGridDBColumn;
    cbFavourite: TcxCheckBox;
    cbFilter: TcxCheckBox;
    qrlNonPurchasedAnimals: TQRLabel;
    QRShape7: TQRShape;
    qrlNotes1: TQRLabel;
    qrlNotes2: TQRLabel;
    qrlNotes3: TQRLabel;
    qrlNotes4: TQRLabel;
    qrlNote5: TQRLabel;
    qrlNote6: TQRLabel;
    qrpLivestockValSummary: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrlLivestockValSumTitle: TQRLabel;
    QRLabel30: TQRLabel;
    qrlPurchDateSummary: TQRLabel;
    QRLabel33: TQRLabel;
    qrlHerdIdentitySummary: TQRLabel;
    ToolButton4: TToolButton;
    QRShape8: TQRShape;
    qrCostsBand: TQRBand;
    qrlCostsTitle: TQRLabel;
    qrlPurchasePrice: TQRLabel;
    qrlPurchaseCosts: TQRLabel;
    qrlVetCosts: TQRLabel;
    qrlFeedCosts: TQRLabel;
    qrlFarmCosts: TQRLabel;
    qrlTotalCostsHead: TQRLabel;
    qrlAverageCostsHead: TQRLabel;
    qrlTotalCostsSum: TQRLabel;
    qrRealValBand: TQRBand;
    qrlRelValTitle: TQRLabel;
    qrlRelPurchWeight: TQRLabel;
    qrlRelValDaysOnFarm: TQRLabel;
    qrlRelValEstWeighGain: TQRLabel;
    qrlNetRelValue: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel44: TQRLabel;
    btnSummary: TRxSpeedButton;
    QRShape9: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    btnHelp: TRxSpeedButton;
    qrlTotalAnimalsHead: TQRLabel;
    qrlTotalAnimalsDetail: TQRLabel;
    lNotes: TQRLabel;
    qrdbTotPurchPrice: TQRDBText;
    qrdbTotPurchCosts: TQRDBText;
    qrdbTotVetCosts: TQRDBText;
    qrdbTotFeedCosts: TQRDBText;
    qrdbTotFarmCosts: TQRDBText;
    qrdbTotTotalCosts: TQRDBText;
    qrdbAvgPurchPrice: TQRDBText;
    qrdbAvgPurchCosts: TQRDBText;
    qrdbAvgVetCosts: TQRDBText;
    qrdbAvgFeedCosts: TQRDBText;
    qrdbAvgFarmCosts: TQRDBText;
    qrdbAvgTotalCosts: TQRDBText;
    qrdbTotNetRelValue: TQRDBText;
    qrdbAvgPurchWeight: TQRDBText;
    qrdbAvgDaysOnFarm: TQRDBText;
    qrdbAvgEstWeighGain: TQRDBText;
    qrdbAvgNetRelValue: TQRDBText;
    qrlLastWeight: TQRLabel;
    qrdbLastWeight: TQRDBText;
    qrlDaysSinceLastWeight: TQRLabel;
    qrdbDaysSinceLastWeight: TQRDBText;
    QRLabel36: TQRLabel;
    qrlEstPricePerKg: TQRLabel;
    qrdbEstPricePerKg: TQRDBText;
    qrlEstKillOut: TQRLabel;
    qrdbEstKillOut: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrdbAvgDailyLiveWeigh: TQRDBText;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure ToDateChange(Sender: TObject);
    procedure cbHerdIdentityChange(Sender: TObject);
    procedure seMonthsPropertiesChange(Sender: TObject);
    procedure cmboAgePropertiesChange(Sender: TObject);
    procedure cmboSexPropertiesChange(Sender: TObject);
    procedure ParamGridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SubDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure cbFilterPropertiesChange(Sender: TObject);
    procedure BaseReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btnSummaryClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure qrpLivestockValSummaryBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormatQRDBFloatValue(sender: TObject; var Value: String);
  private
    function GetHasNonPurchasedAnimals: Boolean;
    procedure CheckComboSelection;
  private
    { Private declarations }
    DLWG : Double;
    FStockValuation : TTable;
    FAvgSalesPricePerKg : Double;
    FTotEstWeighGain,
    FAvgDaysOnFarm,
    FAvgPurchWeight : Double;
    FSummaryTable : TTable;
    FSummaryDataSource : TDataSource;
    procedure CreateTempTable;
    procedure GetAnimals;
    procedure CalcDefaultReportParams;
    property HasNonPurchasedAnimals : Boolean read GetHasNonPurchasedAnimals;
  public
    { Public declarations }
     class procedure ShowStockValuationReport;
  end;

var
  fmStockValuationReport: TfmStockValuationReport;

implementation

{$R *.DFM}

{ TReportsBaseForm1 }

procedure TfmStockValuationReport.CreateTempTable;
begin
   FStockValuation := TTable.Create(nil);
   with FStockValuation do
      begin
         DatabaseName := AliasName;
         TableName := 'tStockValuation';
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);

               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString,20);
               Add('DateOfBirth', ftDate);
               Add('SortNatID', ftString,20);
               Add('AnimalNo', ftString,10);
               Add('LactNo', ftInteger);
               Add('SortAnimalNo', ftString,10);
               Add('Sex', ftString,6);
               Add('BreedCode', ftString,6);
               Add('ColourCode', ftString,6);

               Add('PurchDate', ftDate);
               Add('PurchWeight', ftFloat);
               Add('PurchPrice', ftFloat);
               Add('SupplierCosts', ftFloat);
               Add('BuyerCosts', ftFloat);
               Add('PurchHaulage', ftFloat);
               Add('PurchCommission', ftFloat);

               Add('PurchCosts', ftFloat);
               Add('TotalCosts', ftFloat);

               Add('SaleDate', ftDate);
               Add('SaleWeight', ftFloat);
               Add('SalePrice', ftFloat);
               Add('SaleCosts', ftFloat);

               Add('HealthCosts', ftFloat);
               Add('FeedCosts', ftFloat);
               Add('FixedCosts', ftFloat);

               Add('DaysOnFarm', ftInteger);
               Add('CurrentWeight', ftFloat);
               Add('KillOutPerc', ftFloat);

               Add('NETREALISABLEVALUE', ftFloat);

               Add('KilledOff', ftBoolean);

               Add('DLWG', ftFloat);
               Add('AvgPricePerKg', ftFloat);

               Add('LastWeight',ftFloat);
               Add('DaysSinceLastWeight',ftInteger);

            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               Add('iAnimalID', 'AnimalID', [ixCaseInsensitive]);
               Add('iPurchDate', 'PurchDate', [ixCaseInsensitive]);
               Add('iSaleDate', 'SaleDate', [ixCaseInsensitive]);
            end;
         CreateTable;
         Active := True;
      end;
end;

procedure TfmStockValuationReport.GetAnimals;
var
   FirstDate, DateOfBirth, PurchDate, SaleDate : TDateTime;
   PurchWeight, SaleWeight, LastWeight : Double;
   DaysOnFarm : Integer;
   EventDetailsArray : TEventDetailsArray;
   SQLFilter : TSQLFilter;
   vEventDate, vDouble, vSold : Variant;
   i : Integer;
   FeedCosts, HealthCosts : Double;
   AnimalWeightGained, NetRealisableValue : Double;
   DateOfBirthFilter,
   LastWeighDate : TDateTime;
begin
  inherited;
  SQLFilter := TSQLFilter.Create;

  Screen.Cursor := crHourGlass;
  try
     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;

           SQL.Clear;
           SQL.Add('Delete From '+SQLFilter.TableName+' ');
           ExecSQL;

           SQL.Clear;
           SQL.Add('Delete From '+FStockValuation.TableName +' ');
           ExecSQL;

           SQLFilter.HerdID := HerdID;

           //   08/08/18 [V5.8 R2.2] /MK Change - If cbFilter.Checked then only show report based on animals in the filter.
           if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
              begin
                 SQL.Clear;
                 SQL.Add('INSERT INTO '+SQLFilter.TableName+' (AnimalID, BirthDate, LactNo)');
                 SQL.Add('SELECT DISTINCT A.ID, DateOfBirth, Max(A.LactNo) CurrLactNo');
                 SQL.Add('FROM Animals A');
                 SQL.Add('WHERE (A.AnimalDeleted=False)');
                 SQL.Add('AND   (A.ID IN (SELECT AF.AID FROM AFILTERS AF))');
                 SQL.Add('GROUP BY A.ID, DateOfBirth ');
                 ExecSQL;
              end
           else
              // If cbFilter is not checked then get stock on hand for the date selected.
              SQLFilter.GetAnimalsOnHerd('',ToDate.Date, ToDate.Date) ;

           //   07/08/18 [V5.8 R2.2] /MK Change - Don't exclude animals that were not purchased, instead show them in red on the report.
           {
           // remove all non-purchased animals
           SQL.Clear;
           SQL.Add('Delete From '+SQLFilter.TableName +' ');
           SQL.Add('WHERE NOT ( AnimalID IN (');
           SQL.Add(' SELECT AnimalID FROM events');
           SQL.Add(' WHERE   ( EventType = ' + IntToStr(CPurchaseEvent) + ')))');
           ExecSQL;
           }

           SQL.Clear;
           SQL.Add('Select S.*, A.PrimaryBreed, A.Colour, A.Sex, A.NatIDNum,');
           SQL.Add('A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth');
           SQL.Add('From '+SQLFilter.TableName +' S');
           SQL.Add('LEFT JOIN Animals A ON(A.ID=S.AnimalID)');
           SQL.Add('WHERE A.ID>0');
           case cmboSex.ItemIndex of
              1 : SQL.Add('AND A.Sex ="Female"');
              2 : SQL.Add('AND A.Sex ="Bull"');
              3 : SQL.Add('AND A.Sex ="Steer"');
              4 : SQL.Add('AND A.Sex <>"Female"');
           end;

           if (cmboAge.ItemIndex>0) and (seMonths.Value > 0) then
              begin
                 DateOfBirthFilter := IncMonth(Date, - seMonths.Value);
                 if cmboAge.ItemIndex = 1 then
                    SQL.Add('AND A.DateOfBirth > '''+FormatDate(DateOfBirthFilter, dsUS)+'''')
                 else
                    SQL.Add('AND A.DateOfBirth <= '''+FormatDate(DateOfBirthFilter, dsUS)+'''');
              end;

           Open;

           First;
           ProgBar.Position := 0;
           ProgBar.Max := RecordCount;
           ProgBar.Visible := True;
           lWaitCaption.Visible := True;
           Update;

           qrlDLWG.Caption := Format( '%s Kgs', [FloatToStrF(DLWG, ffFixed, 8, 2)]);
           MemData.DisableControls;
           while not eof do
              begin
                 FirstDate := 0;
                 PurchDate := 0;
                 SaleDate := 0;
                 PurchWeight := 0;
                 DaysOnFarm := 0;
                 FeedCosts := 0;
                 HealthCosts := 0;
                 FStockValuation.Append;
                 FStockValuation.FieldByName('AnimalID').AsInteger := FieldByName('AnimalID').AsInteger;
                 FStockValuation.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                 FStockValuation.FieldByName('SortNatID').AsString := FieldByName('SortNatID').AsString;
                 FStockValuation.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                 FStockValuation.FieldByName('SortAnimalNo').AsString := FieldByName('SortAnimalNo').AsString;
                 FStockValuation.FieldByName('DateOfBirth').AsDateTime := FieldByName('BirthDate').AsDateTime;
                 FStockValuation.FieldByName('LactNo').AsInteger := FieldByName('LactNo').AsInteger;
                 FStockValuation.FieldByName('PurchDate').AsVariant := Null;
                 FStockValuation.FieldByName('KilledOff').Value := False;
                 FStockValuation.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                 FStockValuation.FieldByName('BreedCode').Value := HerdLookup.BreedDetailsByID(FieldByName('PrimaryBreed').AsInteger,Breeds_Code);
                 FStockValuation.FieldByName('ColourCode').Value := HerdLookup.ColourDetailsByID(FieldByName('Colour').AsInteger,Colours_Code);

                 EventDetailsArray := HerdLookup.GetEventDetails(FieldByName('AnimalID').AsInteger,cPurchaseEvent);
                 for i := Low(EventDetailsArray) to High(EventDetailsArray) do
                    begin
                       vEventDate := EventDetailsArray[i].Event[3];
                       if not VarIsNull(vEventDate) then
                          begin
                             PurchDate := vEventDate;
                             FStockValuation.FieldByName('PurchDate').Value := PurchDate;

                             vDouble := EventDetailsArray[i].SubEvent[2];
                             if not VarIsNull(vDouble) then
                                FStockValuation.FieldByName('PurchPrice').Value := vDouble;

                             vDouble := EventDetailsArray[i].SubEvent[3];
                             if not VarIsNull(vDouble) then
                                begin
                                   PurchWeight := vDouble;
                                   FStockValuation.FieldByName('PurchWeight').Value := PurchWeight;
                                end;

                             vDouble := EventDetailsArray[i].SubEvent[6];
                             if not VarIsNull(vDouble) then
                                FStockValuation.FieldByName('SupplierCosts').Value := vDouble;

                             vDouble := EventDetailsArray[i].SubEvent[7];
                             if not VarIsNull(vDouble) then
                                FStockValuation.FieldByName('BuyerCosts').Value := vDouble;

                             FStockValuation.FieldByName('PurchCosts').Value := ( FStockValuation.FieldByName('SupplierCosts').Value +
                                                                                  FStockValuation.FieldByName('BuyerCosts').Value );
                          end;
                    end;

                 DateOfBirth := FieldByName('BirthDate').AsDateTime;
                 SaleDate := WinData.EventDataHelper.GetFirstEventDate(FStockValuation.FieldByName('AnimalID').AsInteger, cSaleDeathEvent);

                 // calculate the remaining values

                 if ( PurchDate > 0 ) and ( PurchWeight > 0 ) then
                    FirstDate := PurchDate
                 else
                    FirstDate := DateOfBirth;

                 if ( SaleDate = 0 ) then
                    DaysOnFarm := Trunc(ToDate.Date - FirstDate)
                 else
                    begin
                       if ( SaleDate > ToDate.Date ) then
                          DaysOnFarm := Trunc(ToDate.Date - FirstDate)
                       else
                          DaysOnFarm := Trunc(SaleDate - FirstDate);
                    end;

                 if ( DaysOnFarm < 0 ) then
                    DaysOnFarm := 0;

                 FStockValuation.FieldByName('DaysOnFarm').AsInteger := DaysOnFarm;
                 FStockValuation.FieldByName('FeedCosts').AsFloat := HerdLookup.CalcFeedCosts(FStockValuation.FieldByName('AnimalID').AsInteger);
                 FStockValuation.FieldByName('HealthCosts').AsFloat := HerdLookup.CalcHealthCosts(FStockValuation.FieldByName('AnimalID').AsInteger);
                 FStockValuation.FieldByName('FixedCosts').AsFloat := HerdLookup.CalcFixedCost(FStockValuation.FieldByName('AnimalID').AsInteger,DaysOnFarm);
                 FStockValuation.FieldByName('TotalCosts').AsFloat := FStockValuation.FieldByName('PurchPrice').AsFloat+FStockValuation.FieldByName('PurchCosts').AsFloat+
                                                                      FStockValuation.FieldByName('FeedCosts').AsFloat+FStockValuation.FieldByName('HealthCosts').AsFloat+
                                                                      FStockValuation.FieldByName('FixedCosts').AsFloat;

                 //   13/08/18 [V5.8 R2.3] /MK Bug Fix - Don't use animals current gain per day, instead use its lifetime gain per day - GL.
                 {
                 FStockValuation.FieldByName('CurrentWeight').AsFloat := HerdLookup.GetLastRecordedWeight(FStockValuation.FieldByName('AnimalID').AsInteger);
                 if ( FStockValuation.FieldByName('CurrentWeight').AsFloat <= 0 ) then
                    FStockValuation.FieldByName('CurrentWeight').AsFloat := FStockValuation.FieldByName('PurchWeight').AsFloat;
                 }
                 FStockValuation.FieldByName('CurrentWeight').AsFloat := FStockValuation.FieldByName('PurchWeight').AsFloat;

                 LastWeighDate := WinData.EventDataHelper.GetEventDateBetweenDates(FStockValuation.FieldByName('AnimalID').AsInteger,
                                                                                   CWeightEvent,FirstDate,ToDate.Date);
                 LastWeight := WinData.EventDataHelper.GetWeighDateWeight(FStockValuation.FieldByName('AnimalID').AsInteger,LastWeighDate);

                 if ( LastWeighDate > 0 ) and ( LastWeight > 0 ) then
                    begin
                       FStockValuation.FieldByName('DaysSinceLastWeight').AsInteger := Trunc(ToDate.Date-LastWeighDate);
                       FStockValuation.FieldByName('LastWeight').AsFloat := LastWeight;
                    end
                 else
                    begin
                       FStockValuation.FieldByName('DaysSinceLastWeight').AsInteger := Trunc(ToDate.Date-FirstDate);
                       FStockValuation.FieldByName('LastWeight').AsFloat := FStockValuation.FieldByName('CurrentWeight').AsFloat;
                    end;

                 AnimalWeightGained := 0;
                 try
                    if cmboSex.Text = '' then
                       begin
                          if FieldByName('Sex').AsString = cSex_Female then
                             begin
                                if not MemData.Locate('Sex', cSex_Female,[]) then
                                   raise Exception.Create('');
                             end
                          else if FieldByName('Sex').AsString = cSex_Bull then
                             begin
                                if not MemData.Locate('Sex', cSex_Bull,[]) then
                                   raise Exception.Create('');
                             end
                          else if FieldByName('Sex').AsString = cSex_Steer then
                             begin
                                if not MemData.Locate('Sex', cSex_Steer,[]) then
                                   raise Exception.Create('');
                             end;
                       end
                    else if cmboSex.Text = cSex_Female then
                       begin
                          if not MemData.Locate('Sex', cSex_Female,[]) then
                             raise Exception.Create('');
                       end
                    else if cmboSex.Text = cSex_Bull then
                       begin
                          if not MemData.Locate('Sex', cSex_Bull,[]) then
                             raise Exception.Create('');
                       end
                    else if cmboSex.Text = cSex_Steer then
                        begin
                           if not MemData.Locate('Sex', cSex_Steer,[]) then
                              raise Exception.Create('');
                        end
                    else if cmboSex.Text = 'Male' then
                        begin
                           if not MemData.Locate('Sex', 'Male',[]) then
                              raise Exception.Create('');
                        end;

                    try
                       FStockValuation.FieldByName('KillOutPerc').Value := ( MemDataKILLOUTPERC.AsFloat / 100 );
                    except
                       MessageDlg('Cannot calculate Kill Out Percentage',mtError,[mbOK],0);
                       Abort;
                    end;

                    AnimalWeightGained := FStockValuation.FieldByName('CurrentWeight').AsFloat;
                    if cmboAge.Text = '' then
                       begin
                          AnimalWeightGained := AnimalWeightGained + ( MemDataDLWG.Value * DaysOnFarm );
                          FStockValuation.FieldByName('DLWG').Value := MemDataDLWG.Value;
                       end
                    else if cmboAge.Text = 'Under' then
                       begin
                          AnimalWeightGained := AnimalWeightGained + ( MemDataDLWGUM.Value * DaysOnFarm );
                          FStockValuation.FieldByName('DLWG').Value := MemDataDLWGUM.Value;
                       end
                    else if cmboAge.Text = 'Over' then
                       begin
                          AnimalWeightGained := AnimalWeightGained + ( MemDataDLWGOM.Value * DaysOnFarm );
                          FStockValuation.FieldByName('DLWG').Value := MemDataDLWGOM.Value;
                       end;

                    if cmboAge.Text = '' then
                       begin
                          NetRealisableValue := (AnimalWeightGained * (FStockValuation.FieldByName('KillOutPerc').Value)) * MemDataAVGPKG.Value;
                          FStockValuation.FieldByName('AvgPricePerKg').Value := MemDataAVGPKG.Value;
                       end
                    else if cmboAge.Text = 'Under' then
                       begin
                          NetRealisableValue := (AnimalWeightGained * (FStockValuation.FieldByName('KillOutPerc').Value)) * MemDataAVGPKGUM.Value;
                          FStockValuation.FieldByName('AvgPricePerKg').Value := MemDataAVGPKGUM.Value;
                       end
                    else if cmboAge.Text = 'Over' then
                       begin
                          NetRealisableValue := (AnimalWeightGained * (FStockValuation.FieldByName('KillOutPerc').Value)) * MemDataAVGPKGOM.Value;
                          FStockValuation.FieldByName('AvgPricePerKg').Value := MemDataAVGPKGOM.Value;
                       end;
                 except
                 end;

                 FStockValuation.FieldByName('NetRealisableValue').AsFloat := NetRealisableValue;

{
   Net Realisable Value calculation = ((Purchase weight + (Days on herd * DLWG per day))*Kill out %)* average sales price.
}
                 FStockValuation.Post;
                 ProgBar.Position := ProgBar.Position+1;
                 Application.ProcessMessages;
                 Next;
              end;
        finally
           MemData.EnableControls;
           Free;
        end;
  finally
     ProgBar.Visible := False;
     lWaitCaption.Visible := False;
     Update;
     SafeFreeAndNil(SQLFilter);
     Screen.Cursor := crDefault;
  end;

end;

procedure TfmStockValuationReport.FormDestroy(Sender: TObject);
begin
  inherited;
  if ( FStockValuation <> nil ) then
     begin
        MemData.Active := False;
        FStockValuation.Close;
        FStockValuation.DeleteTable;
        FreeAndNil(FStockValuation);
     end;
end;

procedure TfmStockValuationReport.FormCreate(Sender: TObject);
begin
   if WinData.UserDefaultHerdID > 0 then
      cbHerdIdentity.Value := IntToStr(WinData.UserDefaultHerdID);
   CreateTempTable;
   cbUseFilter.Visible := False;
   seMonths.Enabled := False;
   qrdbNetRelValue.Mask := CurrencyString + '0.00;-0.00';
   cbFilter.Visible := WinData.ActiveFilter;
   cbFilter.Checked := cbFilter.Visible;
   qrpLivestockValSummary.Hide;
   inherited;
end;

procedure TfmStockValuationReport.sbViewClick(Sender: TObject);
begin
   inherited;
   CheckComboSelection;
   GetAnimals;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT * From tStockValuation ');
         SQL.Add('WHERE PurchDate <= :PurchToDate ');

         if HasNonPurchasedAnimals then
            begin
               SQL.Add('OR PurchDate IS NULL');
               rgSortBy.ItemIndex := 2;
               rgSortOrder.ItemIndex := 0;
               qrlSortBy.Caption := 'Purchase Date';
               qrlSortOrder.Caption := 'Ascending';
            end;

         case rgSortBy.ItemIndex of
            0 : SQL.Add('Order By SortAnimalNo');
            1 : SQL.Add('Order By SortNatId');
            2 : SQL.Add('Order By PurchDate');
         end;

         if (rgSortOrder.ItemIndex = 1) then
            SQL.Add('Order By DESC');

         Params[0].AsDateTime := ToDate.Date;
         Open;
         try
            qrlPurchDate.Caption := FormatDate( ToDate.Date, dsIrish );
            BaseReport.Preview;
         finally
            Close;
            EnableViewPrintButtons(True);
         end;
      end;
end;

class procedure TfmStockValuationReport.ShowStockValuationReport;
begin
   with TfmStockValuationReport.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmStockValuationReport.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if GenQuery.FieldByName( TQRDBText(Sender).DataField ).AsDateTime <= 0 then
     Value := '';
end;

procedure TfmStockValuationReport.ToDateChange(Sender: TObject);
begin
   inherited;
   CalcDefaultReportParams;
end;

procedure TfmStockValuationReport.cbHerdIdentityChange(Sender: TObject);
begin
  inherited;
  CalcDefaultReportParams;
end;

procedure TfmStockValuationReport.CalcDefaultReportParams;
var
  AgeCategoryRecord : TAgeCategoryRecord;
  i : Integer;

  procedure CalcParams(ASex : String);
  begin
     if not MemData.Locate('Sex', ASex,[]) then
        begin
           MemData.Append;
           MemDataSex.Value := ASex;
        end
     else
        MemData.Edit;

     if MemDataSex.Value = cSex_Female then
        MemDataKILLOUTPERC.AsFloat := 54
     else if MemDataSex.Value = cSex_Bull then
        MemDataKILLOUTPERC.AsFloat := 58
     else if MemDataSex.Value = cSex_Steer then
        MemDataKILLOUTPERC.AsFloat := 54;

     try
        if cmboAge.Text = '' then
           begin
              AgeCategoryRecord.AgeMthCategory := AgeNone;

              // Avg Price Per Kg.
              FAvgSalesPricePerKg := HerdLookup.GetAvgSalesPricePerKg(HerdID, ToDate.Date-30, ToDate.Date, AgeCategoryRecord, ASex);
              if ( FAvgSalesPricePerKg <= 0 ) then
                 FAvgSalesPricePerKg := 4;
              MemDataAVGPKG.Value := FAvgSalesPricePerKg;

              // Daily Live Weight Gain.
              DLWG := HerdLookup.AvgDailyLiveWeightGain(HerdID, ToDate.Date-30, ToDate.Date, AgeCategoryRecord, ASex);
              if DLWG<= 0 then
                 DLWG := 1;
              MemDataDLWG.Value := DLWG;

              ParamGridDBTableViewDLWGUM.Visible := False;
              ParamGridDBTableViewAVGPKGUM.Visible := False;
              ParamGridDBTableViewDLWGOM.Visible := False;
              ParamGridDBTableViewAVGPKGOM.Visible := False;
              ParamGridDBTableViewDLWG.Visible := True;
              ParamGridDBTableViewAVGPKG.Visible := True;
           end
        else if cmboAge.Text = 'Under' then
           begin
              AgeCategoryRecord.AgeMthCategory := AgeUnder;

              // Avg Price Per Kg.
              FAvgSalesPricePerKg := HerdLookup.GetAvgSalesPricePerKg(HerdID, ToDate.Date-30, ToDate.Date, AgeCategoryRecord, ASex);
              if ( FAvgSalesPricePerKg <= 0 ) then
                 FAvgSalesPricePerKg := 4;
              MemDataAVGPKGUM.Value := FAvgSalesPricePerKg;

              // Daily Live Weight Gain.
              DLWG := HerdLookup.AvgDailyLiveWeightGain(HerdID, ToDate.Date-30, ToDate.Date, AgeCategoryRecord, ASex);
              if DLWG<= 0 then
                 DLWG := 1;
              MemDataDLWGUM.Value := DLWG;

              ParamGridDBTableViewDLWG.Visible := False;
              ParamGridDBTableViewAVGPKG.Visible := False;
              ParamGridDBTableViewDLWGOM.Visible := False;
              ParamGridDBTableViewAVGPKGOM.Visible := False;
              ParamGridDBTableViewDLWGUM.Visible := True;
              ParamGridDBTableViewAVGPKGUM.Visible := True;

           end
        else if cmboAge.Text = 'Over' then
           begin
              AgeCategoryRecord.AgeMthCategory := AgeAndOver;

              // Avg Price Per Kg.
              FAvgSalesPricePerKg := HerdLookup.GetAvgSalesPricePerKg(HerdID, ToDate.Date-30, ToDate.Date, AgeCategoryRecord, ASex);
              if ( FAvgSalesPricePerKg <= 0 ) then
                 FAvgSalesPricePerKg := 4;
              MemDataAVGPKGOM.Value := FAvgSalesPricePerKg;

              // Daily Live Weight Gain.
              DLWG := HerdLookup.AvgDailyLiveWeightGain(HerdID, ToDate.Date-30, ToDate.Date, AgeCategoryRecord, ASex);
              if DLWG<= 0 then
                 DLWG := 1;
              MemDataDLWGOM.Value := DLWG;

              ParamGridDBTableViewDLWG.Visible := False;
              ParamGridDBTableViewAVGPKG.Visible := False;
              ParamGridDBTableViewDLWGUM.Visible := False;
              ParamGridDBTableViewAVGPKGUM.Visible := False;
              ParamGridDBTableViewDLWGOM.Visible := True;
              ParamGridDBTableViewAVGPKGOM.Visible := True;

           end;
        MemData.Post;
     except
        raise Exception.Create('Failed to get sale details');
     end;
  end;
  
begin
  inherited;
  if ToDate.Date > 0 then
    begin
       Screen.Cursor := crHourGlass;
       try
          AgeCategoryRecord.NoOfMonths := seMonths.Value;
          ParamGridDBTableView.DataController.BeginUpdate;
          try
             if not MemData.Active then
                MemData.Active := True;

             if (cmboSex.Text = '') then
                begin
                   for i := 1 to 4 do
                      CalcParams(HerdLookup.erSexCombo.Properties.Items[i]);
                end
             else
                begin
                   CalcParams(cmboSex.Text);
                end;

             finally
                ParamGridDBTableView.DataController.EndUpdate;
             end;
       finally
          Screen.Cursor := crDefault;
       end;
    end;
end;

procedure TfmStockValuationReport.seMonthsPropertiesChange(
  Sender: TObject);
begin
  inherited;
  CalcDefaultReportParams;
  ParamGridDBTableView.LayoutChanged;
end;

procedure TfmStockValuationReport.cmboAgePropertiesChange(Sender: TObject);
begin
  inherited;
  seMonths.Enabled := (cmboAge.Text <> '');
  CalcDefaultReportParams;
  ParamGridDBTableView.LayoutChanged;
end;

procedure TfmStockValuationReport.cmboSexPropertiesChange(Sender: TObject);
begin
  inherited;
  CalcDefaultReportParams;
  ParamGridDBTableView.LayoutChanged;
end;

procedure TfmStockValuationReport.ParamGridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  ASex : string;
begin
  inherited;
  ASex := cmboSex.Text;
  AStyle := nil;
  if ASex <> '' then
     begin
        if ARecord.Values[1] <> ASex then
           AStyle := cxStyleDisabled;
     end
  else if ARecord.Values[1] = 'Male' then
     AStyle := cxStyleDisabled;
end;

procedure TfmStockValuationReport.QRDBText23Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if Value = cSex_Female then
     Value := 'F'
  else if Value = cSex_Bull then
     Value := 'B'
  else if Value = cSex_Steer then
     Value := 'S';
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmStockValuationReport.cbFavouritePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cLivestockValRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cLivestockValRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfmStockValuationReport.FormShow(Sender: TObject);
begin
   inherited;
   cbFavourite.Checked := WinData.IsReportFavourite(cLivestockValRep);
   WinData.UpdateRecentReportUsage(cLivestockValRep);
end;

procedure TfmStockValuationReport.SubDetailBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   inherited;
   SubDetailBand.Font.Color := clNavy;
   if ( GenQuery.FieldByName('PurchDate').AsVariant = Null ) then
      SubDetailBand.Font.Color := clRed;
   qrdbNetRelValue.Font.Color := clNavy;
   if ( GenQuery.FieldByName('PurchWeight').AsVariant = Null ) then
      qrdbNetRelValue.Font.Color := clRed;
end;

function TfmStockValuationReport.GetHasNonPurchasedAnimals: Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM '+FStockValuation.TableName);
         SQL.Add('WHERE (PurchDate IS NULL)');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

procedure TfmStockValuationReport.cbFilterPropertiesChange(
  Sender: TObject);
begin
   inherited;
   lPurchDateFilter.Enabled := ( not(cbFilter.Checked) );
   ToDate.Enabled := ( not(cbFilter.Checked) );
end;

procedure TfmStockValuationReport.BaseReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   qrlNonPurchasedAnimals.Enabled := HasNonPurchasedAnimals;
   if ( cbFilter.Checked ) then
      qrlValueStockOnDate.Caption := 'Filter Applied'
   else
      qrlValueStockOnDate.Caption := 'Value stock as on Date';
   qrlPurchDate.Enabled := ( not(cbFilter.Checked) );
end;

procedure TfmStockValuationReport.CheckComboSelection;
begin
  if ( cmboAge.ItemIndex > 0 ) and ( seMonths.Value <= 0 ) then
     begin
        MessageDlg('You must specify the number of months',mtWarning,[mbOK],0);
        seMonths.SetFocus;
     end;
end;

procedure TfmStockValuationReport.btnSummaryClick(Sender: TObject);

   function ReturnQRLCapFromFloat (AFloatVal : Double ) : String;
   begin
      Result := '0.00';
      if ( AFloatVal > 0 ) then
         Result := FormatFloat('0.00',AFloatVal);
   end;

var
   qSumData : TQuery;
   iTotalAnimals : Integer;
begin
   inherited;
   FSummaryTable := TTable.Create(nil);
   FSummaryDataSource := TDataSource.Create(nil);
   try
      CheckComboSelection;
      FTotEstWeighGain := 0;
      GetAnimals;

      FSummaryTable.DatabaseName := AliasName;
      FSummaryTable.TableName := 'tmpStockValSum';
      FSummaryTable.FieldDefs.Clear;
      FSummaryTable.FieldDefs.Add('ID',ftAutoInc);
      FSummaryTable.FieldDefs.Add('SumPurchPrice',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgPurchPrice',ftFloat);
      FSummaryTable.FieldDefs.Add('SumPurchCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgPurchCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('SumVetCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgVetCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('SumFeedCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgFeedCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('SumFarmCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgFarmCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('SumTotalCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgTotalCosts',ftFloat);
      FSummaryTable.FieldDefs.Add('SumPurchWeight',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgPurchWeight',ftFloat);
      FSummaryTable.FieldDefs.Add('SumDaysOnFarm',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgDaysOnFarm',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgLastWeight',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgDaysSinceLastWeight',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgEstWeightGain',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgEstPriceKg',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgKillOut',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgDLWG',ftFloat);
      FSummaryTable.FieldDefs.Add('SumNetRelVal',ftFloat);
      FSummaryTable.FieldDefs.Add('AvgNetRelVal',ftFloat);
      FSummaryTable.IndexDefs.Clear;
      FSummaryTable.IndexDefs.Add('iID','ID',[ixPrimary, ixUnique]);
      FSummaryTable.CreateTable;
      FSummaryTable.Open;

      FSummaryDataSource.DataSet := FSummaryTable;

      qrlPurchDateSummary.Caption := FormatDate( ToDate.Date, dsIrish );
      qrlHerdIdentitySummary.Caption := cbHerdIdentity.Text;
      qSumData := TQuery.Create(nil);
      with qSumData do
         try
            DatabaseName := AliasName;

            SQL.Clear;
            SQL.Add('SELECT COUNT(AnimalID)');
            SQL.Add('FROM '+FStockValuation.TableName);
            SQL.Add('WHERE PurchDate <= :PurchToDate ');
            if HasNonPurchasedAnimals then
               SQL.Add('OR PurchDate IS NULL');
            Params[0].AsDateTime := ToDate.Date;
            Open;

            iTotalAnimals := Fields[0].AsInteger;
            qrlTotalAnimalsDetail.Caption := IntToStr(iTotalAnimals);

            Close;
            SQL.Clear;
            SQL.Add('SELECT SUM(PurchPrice) SumPurchPrice,');
            SQL.Add('       SUM(PurchCosts) SumPurchCosts,');
            SQL.Add('       SUM(HealthCosts) SumVetCosts,');
            SQL.Add('       SUM(FeedCosts) SumFeedCosts,');
            SQL.Add('       SUM(FixedCosts) SumFarmCosts,');
            SQL.Add('       SUM(TotalCosts) SumTotalCosts,');
            SQL.Add('       SUM(PurchWeight) SumPurchWeight,');
            SQL.Add('       SUM(DaysOnFarm) SumDaysOnFarm,');
            SQL.Add('       SUM(LastWeight) SumLastWeight,');
            SQL.Add('       SUM(DaysSinceLastWeight) SumDaysSinceLastWeight,');
            SQL.Add('       SUM(DLWG) SumDLWG,');
            SQL.Add('       SUM(AvgPricePerKg) SumPricePerKg,');
            SQL.Add('       SUM(KillOutPerc) SumAvgKillOut,');
            SQL.Add('       SUM(NETREALISABLEVALUE) SumNetRelVal');
            SQL.Add('FROM '+FStockValuation.TableName);
            SQL.Add('WHERE PurchDate <= :PurchToDate ');
            if HasNonPurchasedAnimals then
               SQL.Add('OR PurchDate IS NULL');
            Params[0].AsDateTime := ToDate.Date;
            Open;

            if ( RecordCount > 0 ) then
               begin
                  if ( not(FSummaryTable.State in dsEditModes) ) then
                     FSummaryTable.Append;

                  FSummaryTable.FieldByName('SumPurchPrice').AsFloat := FieldByName('SumPurchPrice').AsFloat;
                  FSummaryTable.FieldByName('AvgPurchPrice').AsFloat := ( FieldByName('SumPurchPrice').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumPurchCosts').AsFloat := FieldByName('SumPurchCosts').AsFloat;
                  FSummaryTable.FieldByName('AvgPurchCosts').AsFloat := ( FieldByName('SumPurchCosts').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumVetCosts').AsFloat := FieldByName('SumVetCosts').AsFloat;
                  FSummaryTable.FieldByName('AvgVetCosts').AsFloat := ( FieldByName('SumVetCosts').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumFeedCosts').AsFloat := FieldByName('SumFeedCosts').AsFloat;
                  FSummaryTable.FieldByName('AvgFeedCosts').AsFloat := ( FieldByName('SumFeedCosts').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumFarmCosts').AsFloat := FieldByName('SumFarmCosts').AsFloat;
                  FSummaryTable.FieldByName('AvgFarmCosts').AsFloat := ( FieldByName('SumFarmCosts').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumTotalCosts').AsFloat := FieldByName('SumTotalCosts').AsFloat;
                  FSummaryTable.FieldByName('AvgTotalCosts').AsFloat := ( FieldByName('SumTotalCosts').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumPurchWeight').AsFloat := FieldByName('SumPurchWeight').AsFloat;
                  FSummaryTable.FieldByName('AvgPurchWeight').AsFloat := ( FieldByName('SumPurchWeight').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumDaysOnFarm').AsFloat := FieldByName('SumDaysOnFarm').AsFloat;
                  FSummaryTable.FieldByName('AvgDaysOnFarm').AsFloat := ( FieldByName('SumDaysOnFarm').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('AvgLastWeight').AsFloat := ( FieldByName('SumLastWeight').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('AvgDaysSinceLastWeight').AsFloat := ( FieldByName('SumDaysSinceLastWeight').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('AvgEstWeightGain').AsFloat := ( FieldByName('SumDLWG').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('AvgDLWG').AsFloat := ( FSummaryTable.FieldByName('AvgDaysSinceLastWeight').AsFloat * ( FieldByName('SumDLWG').AsFloat / iTotalAnimals ) );
                  FSummaryTable.FieldByName('AvgEstPriceKg').AsFloat := ( FieldByName('SumPricePerKg').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('AvgKillOut').AsFloat := ( FieldByName('SumAvgKillOut').AsFloat / iTotalAnimals );
                  FSummaryTable.FieldByName('SumNetRelVal').AsFloat := FieldByName('SumNetRelVal').AsFloat;
                  FSummaryTable.FieldByName('AvgNetRelVal').AsFloat := ( FieldByName('SumNetRelVal').AsFloat / iTotalAnimals );

                  FSummaryTable.Post;

                  FSummaryTable.Close;
                  FSummaryTable.Open;

                  qrpLivestockValSummary.DataSet := FSummaryTable;
                  qrpLivestockValSummary.Preview;
               end;
         finally
            Free;
         end;
   finally
      if ( FSummaryTable <> nil ) then
         begin
            FSummaryTable.Close;
            FSummaryTable.DeleteTable;
         end;
   end;
end;

procedure TfmStockValuationReport.btnHelpClick(Sender: TObject);
begin
   inherited;
   TfmHelp.ShowTheForm(htStockValuation);
end;

procedure TfmStockValuationReport.qrpLivestockValSummaryBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   inherited;
   qrdbTotPurchPrice.DataSet := FSummaryTable;
   qrdbAvgPurchPrice.DataSet := FSummaryTable;
   qrdbTotPurchCosts.DataSet := FSummaryTable;
   qrdbAvgPurchCosts.DataSet := FSummaryTable;
   qrdbTotVetCosts.DataSet := FSummaryTable;
   qrdbAvgVetCosts.DataSet := FSummaryTable;
   qrdbTotFeedCosts.DataSet := FSummaryTable;
   qrdbAvgFeedCosts.DataSet := FSummaryTable;
   qrdbTotFarmCosts.DataSet := FSummaryTable;
   qrdbAvgFarmCosts.DataSet := FSummaryTable;
   qrdbTotTotalCosts.DataSet := FSummaryTable;
   qrdbAvgTotalCosts.DataSet := FSummaryTable;
   qrdbAvgPurchWeight.DataSet := FSummaryTable;
   qrdbAvgDaysOnFarm.DataSet := FSummaryTable;
   qrdbAvgEstWeighGain.DataSet := FSummaryTable;
   qrdbTotNetRelValue.DataSet := FSummaryTable;
   qrdbAvgNetRelValue.DataSet := FSummaryTable;
   qrdbLastWeight.DataSet := FSummaryTable;
   qrdbDaysSinceLastWeight.DataSet := FSummaryTable;
   qrdbEstPricePerKg.DataSet := FSummaryTable;
   qrdbEstKillOut.DataSet := FSummaryTable;
   qrdbAvgDailyLiveWeigh.DataSet := FSummaryTable;
end;

procedure TfmStockValuationReport.FormatQRDBFloatValue(sender: TObject; var Value: String);
var
   fFloatValue : Double;
begin
   fFloatValue := StrToFloat(Value);
   Value := FormatFloat('0.00',fFloatValue);
end;

end.
