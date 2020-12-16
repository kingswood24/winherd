{
  ----------------------------------------------------------------------------
  SP 19/03/2003:-

  Get FQAS Retention Date, only if Herd is FQAS. (Only applicable to NI Herds)

  SP 19/03/2003:-
  ----------------------------------------------------------------------------
   29/11/10 [V4.0 R6.0] /MK Bug Fix - If Country Ireland Don't Print FQAS Retention.
  ----------------------------------------------------------------------------

  02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

  20/05/14 [V5.3 R1.4] /MK Change - Added cmboMonth to allow report to print new ages - Ivan Whitten/GL Request.

  21/05/14 [V5.3 R1.4] /MK Change - Form layout changed as requested by GL.

  03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.

  16/12/20 [V5.9 R7.8] /MK Bug Fix - Fixed problem where the Days To FQAS and Date of FQAS headings were appearing report but the data wasn't - TGM reported bug.
                                   - Fixed problem where "Show animals with Days To FQAS on or before" - TGM reported bug.
}

unit SaleEligibility;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, RxLookup, StdCtrls, RXCtrls, ComCtrls,
  ToolWin, Mask, ToolEdit, Db, DBTables, QRExport, ReportDefaults, RXSpin,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DateUtil, cxCalendar, cxCheckBox, cxGroupBox;

type
  TSalesPlannerReportType = (rtNone, rtSalesPlanner, rtFQAS, rtNonFQAS, rt30mth30Day, rt30mth10Day);
  TPurchSlght = array[0..1] of TDateTime;
  TPremArray = array[0..1] of TDateTime;
  TEligibilityRep = class(TForm)
    EligibilityScr: TQuickRep;
    ColumnHeaderBand3: TQRBand;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    RptTitle: TQRLabel;
    QRLabel12: TQRLabel;
    qrlMonthDate: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel89: TQRLabel;
    Detail: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    qrdbAgeDate: TQRDBText;
    QRDBText56: TQRDBText;
    PageFooterBand3: TQRBand;
    QRLabel44: TQRLabel;
    SummaryBand3: TQRBand;
    QRLabel39: TQRLabel;
    QRExpr5: TQRExpr;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    SortByRadio: TRadioGroup;
    OrderRadio: TRadioGroup;
    QRLabel2: TQRLabel;
    LSortOrder: TQRLabel;
    QRLabel4: TQRLabel;
    LSortOption: TQRLabel;
    VerLabel: TQRLabel;
    VerLable: TQRLabel;
    RptQuery: TQuery;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    sbExit: TRxSpeedButton;
    QRLabel3: TQRLabel;
    LHerd: TQRLabel;
    PBar: TProgressBar;
    QRLabel8: TQRLabel;
    LReportOn: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    qFQAS: TQuery;
    QRLabel9: TQRLabel;
    qrFQAS: TQRLabel;
    QRDBFQAS: TQRDBText;
    QRShape1: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    lUsingFilter: TQRLabel;
    lDate1: TQRLabel;
    lDate2: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    lFQASDays: TQRLabel;
    qrdbFQASDays: TQRDBText;
    cmboReportType: TcxComboBox;
    lReportType: TcxLabel;
    pSalesPlanner: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    RetentionDays1: TRxSpinEdit;
    RetentionDays2: TRxSpinEdit;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    ReportFilter: TRadioGroup;
    lDaysLeft: TQRLabel;
    qrdbDaysLeft: TQRDBText;
    qrlHerdIdentity: TQRLabel;
    qrdbHerdIdentity: TQRDBText;
    gbNoneFQASFilter: TcxGroupBox;
    cbFQAEligible: TcxCheckBox;
    deFQAEligilbleDate: TcxDateEdit;
    cbFavourite: TcxCheckBox;
    gbFilterBy: TcxGroupBox;
    LFromDate: TLabel;
    Label1: TLabel;
    lDateRange: TLabel;
    LToDate: TLabel;
    Label5: TLabel;
    FromPurchDate: TDateEdit;
    ToPurchDate: TDateEdit;
    FromBirthDate: TDateEdit;
    ToBirthDate: TDateEdit;
    FromMonths: TDateEdit;
    ToMonths: TDateEdit;
    lMonthSelect: TcxLabel;
    cmboSelectMonth: TcxComboBox;
    cxLabel1: TcxLabel;
    cbUseFilter: TcxCheckBox;
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteTableContents(TableName: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText23Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure FormShow(Sender: TObject);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure HerdComboChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QRDBFQASPrint(sender: TObject; var Value: String);
    procedure cbUseFilterClick(Sender: TObject);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure SetSalesPlannerReportType(
      const Value: TSalesPlannerReportType);
    procedure cmboReportTypePropertiesChange(Sender: TObject);
    procedure qrdbFQASDaysPrint(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure qrdbDaysLeftPrint(sender: TObject; var Value: String);
    procedure qrdbHerdIdentityPrint(sender: TObject; var Value: String);
    procedure cbFQAEligiblePropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouriteClick(Sender: TObject);
    procedure cmboSelectMonthPropertiesChange(Sender: TObject);
  private
    { Private declarations }
     PurchSlght : TPurchSlght;
     PremArray : TPremArray;
     FQASHerd : Boolean;
     CheckEventsAlreadyActive,
     BeefSubsidyAlreadyActive,
     LookUpPurchasesAlreadyActive : Boolean;
     SalesEligDefs : TSalesEligibilityDefaults;
     FSalesPlannerReportType : TSalesPlannerReportType;
     IncludeAllHerds : Boolean;
     PreventFQASPreview : Boolean;
     FDefaultSortByIndex : Integer;
     FMonthArray : Array Of Integer;
     procedure GetAnimals;
     function GetPurchSlght(AnimalID : Integer): TPurchSlght; {0 = Purchase, 1= SlaughterDate}
//     function CheckFirstPrem(AnimalID : Integer): TPremArray;
//     function CheckSecPrem(AnimalID : Integer): TPremArray;
//     function CheckBull(AnimalID : Integer): TPremArray;
     procedure CheckStatus(AnimalID: Integer); // SP 19/03/2003
     procedure GetHerdProps; // SP 19/03/2003
     procedure OpenTables; // SP 20/03/2003
     procedure CloseTables; // SP 20/03/2003
     procedure LoadScreenDefaults;
     procedure SaveScreenDefaults;
     property SalesPlannerReportType : TSalesPlannerReportType read FSalesPlannerReportType write SetSalesPlannerReportType;
  public
    { Public declarations }
  end;

  procedure CreateAndShow(ASalesPlannerReportType : TSalesPlannerReportType);

implementation
uses
   GenTypesConst,
   DairyData;

Const
   Fst = '(1st)';
   Sec = '(2nd)';
   Bull= '(Bull)';

var
  EligibilityRep: TEligibilityRep;
  TempBeefRep : TTable;
  SystemRegCountry : TCountry;

{$R *.DFM}

   procedure CreateAndShow(ASalesPlannerReportType : TSalesPlannerReportType);
   begin
      try
         try
            with TempBeefRep do
              begin
                 TempBeefRep := TTable.Create(nil);
                 DatabaseName := WinData.KingData.DatabaseName;
                 TableName := 'TempBeefRep';

                 FieldDefs.Add('AnimalID',ftInteger,0,False);
                 FieldDefs.Add('AnimalNo',ftString,10,False);
                 FieldDefs.Add('NatIdNum',ftString,20,False);
                 FieldDefs.Add('SortAnimalNo',ftString,10,False);
                 FieldDefs.Add('SortNatID',ftString,20,False);
                 FieldDefs.Add('DateOfBirth',ftDate,0,False);
                 FieldDefs.Add('Sex',ftString,10,False);
                 FieldDefs.Add('LookUpCode',ftString,6,False); //Colour Code
                 FieldDefs.Add('Code',ftString,6,False); //Breed Code
                 FieldDefs.Add('PurchaseDate',ftDate,0,False);
                 FieldDefs.Add('SixteenMthsDate',ftDate,0,False);
                 FieldDefs.Add('TwentyFourMthsDate',ftDate,0,False);
                 FieldDefs.Add('ThirtyMthsDate',ftDate,0,False);
                 FieldDefs.Add('QADate',ftDate,0,False);
                 FieldDefs.Add('FQAStatus',ftString,3,False);
                 FieldDefs.Add('RetentionDate1',ftDate,0,False);
                 FieldDefs.Add('RetentionDate2',ftDate,0,False);
                 FieldDefs.Add('FQASDays',ftInteger,0,False);
                 FieldDefs.Add('DaysOnFarm',ftInteger,0,False);
                 FieldDefs.Add('DaysToSixteenMthDate',ftInteger,0,False);
                 FieldDefs.Add('DaysToTwentyFourtMthDate',ftInteger,0,False);
                 FieldDefs.Add('DaysToThirtyMthDate',ftInteger,0,False);
                 FieldDefs.Add('HerdIdentity',ftString,20,False);
                 FieldDefs.Add('NatIDShort',ftString,20,False);
                 FieldDefs.Add('FQASRetentionDate',ftDate,0,False);

                 CreateTable;
                 Open;
              end;
              Application.CreateForm(TEligibilityRep, EligibilityRep);
              EligibilityRep.cbUseFilter.Checked := WinData.ActiveFilter;
              EligibilityRep.SalesPlannerReportType := ASalesPlannerReportType;

//              if EligibilityRep.cbUseFilter.Visible then
  //               EligibilityRep.cbUseFilter.Checked := True;

              if not WinData.ExportToPDA then
                 EligibilityRep.ShowModal
              else
                 begin
                    EligibilityRep.sbView.Click;
                 end;
         except
            ShowMessage('Cannot create form - close program and re-boot');
         end;
      finally
         with TempBeefRep do
           begin
              Close;
              DeleteTable;
              Free;
           end;
         EligibilityRep.Free;
      end;
   end;

procedure TEligibilityRep.sbViewClick(Sender: TObject);
begin
   {if HerdCombo.Value = '0' then
      begin
         Messagedlg('You must select a herd',mtInformation,[mbok],0);
         Exit;
      end;
   }

   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   IncludeAllHerds := (HerdCombo.Value = '0');

   if (FSalesPlannerReportType in [rtFQAS,rtNonFQAS]) then
      begin
         if PreventFQASPreview then
            begin
               MessageDlg('Cannot run FQAS report. Please check the FQAS setting in Herd Settings.',mtWarning,[mbOK],0);
               Abort;
            end;
      end;

   if VarIsNull(RetentionDays1.Value) then
      RetentionDays1.AsInteger := 1;

   if VarIsNull(RetentionDays2.Value) then
      RetentionDays2.AsInteger := 1;

   sbView.Enabled := False;
   sbPrint.Enabled := False;
   try
     GetAnimals;
   finally
     //
   end;

   case ReportFilter.ItemIndex of
      0 : LReportOn.Caption := 'All Males';
      1 : LReportOn.Caption := 'Bulls';
      2 : LReportOn.Caption := 'Steers';
      3 : LReportOn.Caption := 'All Females';
      4 : LReportOn.Caption := 'Females Breeding';
      5 : LReportOn.Caption := 'Females Non Breeding';
      6 : LReportOn.Caption := 'All Animals';
   end;

   if ( (WinData.SystemRegisteredCountry = NIreland) and (SalesPlannerReportType in [rtSalesPlanner, rtNonFQAS]) ) then
      begin
         QRDBFQAS.DataField := 'FQASRetentionDate';
         qrFQAS.Caption := 'FQAS Retention';
         qrdbFQASDays.DataField := 'FQAStatus';
         lFQASDays.Caption := 'FQA Status';
         QRDBText7.DataField := 'FQASDays'; 
         QRLabel1.Caption := 'FQAS Qualified Days';
      end
   else
      begin
         QRDBFQAS.DataField := '';
         qrFQAS.Caption := '';
         qrdbFQASDays.DataField := '';
         lFQASDays.Caption := '';
         QRDBText7.DataField := '';
         QRLabel1.Caption := '';
      end;

   lHerd.Caption:= HerdCombo.Text;
   if cbUseFilter.Checked then
      lUsingFilter.Caption := 'Applying '+ Copy(cbUseFilter.Caption, 7, Length(cbUseFilter.Caption))
   else
      lUsingFilter.Caption := '';

   lDate1.Caption := Format('%d Days',[RetentionDays1.AsInteger]);
   lDate2.Caption := Format('%d Days',[RetentionDays2.AsInteger]);

   case SalesPlannerReportType of
      rtSalesPlanner : RptTitle.Caption := 'Sales Planner Report';
      rtFQAS : RptTitle.Caption := 'FQAS Report';
      rtNonFQAS : RptTitle.Caption := 'Non-FQAS Report';
      rt30mth30Day : RptTitle.Caption := '30 Month/30 Day Report';
      rt30mth10Day : RptTitle.Caption := '30 Month/10 Day Report';
   end;

   qrdbHerdIdentity.Enabled := IncludeAllHerds;
   qrlHerdIdentity.Enabled := IncludeAllHerds;

   if (RptQuery.RecordCount >0) then
      begin
         if not WinData.ExportToPDA then
            begin
               if (Sender As TRxSpeedButton).Tag = 0 then
                  EligibilityScr.Preview
               else
                  EligibilityScr.Print;
            end
         else
            WinData.PDALinkExport.ExportReport( EligibilityScr );
      end
   else
      begin
         MessageDlg('No records have been found.',mtInformation,[mbOK],0);
      end;

   sbView.Enabled := True;
   sbPrint.Enabled := True;
end;

procedure TEligibilityRep.GetAnimals;

   procedure CreateSQLSort;
   begin
      {
      if cmboReportType.ItemIndex in [1,2] then
         begin
            if IncludeAllHerds then
               RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, FQASDays ')
            else
               RptQuery.SQL.ADD(SQL_ORDERBY + ' FQASDays ');
            LSortOrder.Caption := QRLabel1.Caption;
            LSortOption.Caption := 'Descending';
         end
      else
         begin
      }

      //   16/12/13 [V5.2 R7.0] /MK Change - Changed code to allow FQAS reports to be sorted by SortByRadio.ItemIndex.
      if ( FSalesPlannerReportType in [rtFQAS,rtNonFQAS] ) then
         begin
            case SortByRadio.ItemIndex of
               0 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, SortAnimalNo')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' SortAnimalNo');
                      LSortOrder.Caption := 'Animal Number';
                   end;
               1 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, SortNatID')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' SortNatID');
                      LSortOrder.Caption := 'National ID Number';
                   end;
               2 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, DateOfBirth')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' DateOfBirth');
                      LSortOrder.Caption := 'Date Of Birth';
                   end;
               3 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, PurchaseDate')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' PurchaseDate');
                      LSortOrder.Caption := 'Date Of Purchase';
                   end;
            end;
         end
      else
         begin
            case SortByRadio.ItemIndex of
               0 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, SortAnimalNo')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' SortAnimalNo');
                      LSortOrder.Caption := 'Animal Number';
                   end;
               1 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, SortNatID')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' SortNatID');
                      LSortOrder.Caption := 'National ID Number';
                   end;
               2 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, NatIDShort')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' NatIDShort');
                      LSortOrder.Caption := 'National ID Number (Last 4 Digits)';
                   end;
               3 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, DateOfBirth')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' DateOfBirth');
                      LSortOrder.Caption := 'Date Of Birth';
                   end;
               4 : begin
                      if IncludeAllHerds then
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' HerdIdentity, PurchaseDate')
                      else
                         RptQuery.SQL.ADD(SQL_ORDERBY + ' PurchaseDate');
                      LSortOrder.Caption := 'Date Of Purchase';
                   end;
            end;
         end;

      case OrderRadio.ItemIndex of
         0  : begin
                 RptQuery.SQL.Add('Asc');
                 LSortOption.Caption := 'Ascending';
              end;
         1  : begin
                 RptQuery.SQL.Add('Desc');
                 LSortOption.Caption := 'Descending';
              end;
      end;
   //end;
   end;

var
   Month30Date : TDateTime;
   DaystoFQASStatus : Integer;
begin
   with RptQuery do
      begin
         DeleteTableContents(TempBeefRep.TableName);
         VerLabel.Caption := 'Herd Management ' + HerdVerNo;
         SQL.Clear;
         SQL.Add('INSERT INTO TempBeefRep (AnimalID, AnimalNo, SortAnimalNo, NatIdNum, SortNatID, DateOfBirth, Sex, QADate, LookUpCode, Code');
         if IncludeAllHerds then
            SQL.Add(', HerdIdentity)')
         else
            SQL.Add(')');
         SQL.Add('Select  A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.DateOfBirth, A.Sex, A.QADate, G.LookUpCode, B.Code');
         if IncludeAllHerds then
            SQL.Add(', O.HerdIdentity');
         SQL.Add('From Animals A                             ');
         SQL.Add('LEFT JOIN GenLook G On (G.ID = A.Colour)');
         SQL.Add('LEFT JOIN Breeds B On (B.ID = A.PrimaryBreed)');
         if IncludeAllHerds then
            SQL.Add('LEFT JOIN Owners O On (O.ID = A.HerdID)');

         if (cmboReportType.ItemIndex = 0) then
            begin
               if ((FromPurchDate.Date > 0) OR (ToPurchDate.Date > 0)) then
                  SQL.Add('LEFT JOIN Events E On (E.AnimalID = A.ID) AND (E.EventType = '+ IntToStr(CPurchaseEvent) +')');
            end;

         if cbUseFilter.Checked then
            SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');

         SQL.Add('WHERE (A.ID>0)   ');
         if not IncludeAllHerds then
            SQL.Add('AND (A.HerdID = ' + HerdCombo.Value + ')   ');

         SQL.Add('AND (A.AnimalDeleted = False)            ');
         SQL.Add('AND (A.InHerd = True)                  ');

         case ReportFilter.ItemIndex of
            0 : SQL.Add('AND ((A.Sex="Bull" ) OR (A.Sex="Steer" ))                     ');
            1 : SQL.Add('AND (A.Sex="Bull" )                                           ');
            2 : SQL.Add('AND (A.Sex="Steer" )                                          ');
            3 : SQL.Add('AND (A.Sex="Female" )                                         ');
            4 : SQL.Add('AND ((A.Sex="Female" ) AND (A.Breeding="True" ))              ');
            5 : SQL.Add('AND ((A.Sex="Female" ) AND (A.Breeding="False" ))             ');
            6 : SQL.Add('AND ((A.Sex="Female" ) OR (A.Sex="Bull" ) OR (A.Sex="Steer" ))');
         end;

         if (cmboReportType.ItemIndex = 0) then
            begin
               if ((FromBirthDate.Date > 0) AND (ToBirthDate.Date > 0)) then
                  SQL.ADD('AND (A.DateOfBirth BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromBirthDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToBirthDate.Date) + '''' + ')')
               else if ((FromBirthDate.Date > 0) AND (ToBirthDate.Date <= 0)) then
                  SQL.Add('AND (A.DateOfBirth >= "' + FormatDateTime(cUSDateStyle,(FromBirthDate.Date)) + '" ) ')
               else if ((FromBirthDate.Date <= 0) AND (ToBirthDate.Date > 0)) then
                  SQL.Add('AND (A.DateOfBirth <= "' + FormatDateTime(cUSDateStyle,(ToBirthDate.Date)) + '" ) ');

               if ((FromPurchDate.Date > 0) AND (ToPurchDate.Date > 0)) then
                  SQL.ADD('AND (E.EventDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromPurchDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToPurchDate.Date) + '''' + ')')
               else if ((FromPurchDate.Date > 0) AND (ToPurchDate.Date <= 0)) then
                  SQL.Add('AND (E.EventDate >= "' + FormatDateTime(cUSDateStyle,(FromPurchDate.Date)) + '" ) ')
               else if ((FromPurchDate.Date <= 0) AND (ToPurchDate.Date > 0)) then
                  SQL.Add('AND (E.EventDate <= "' + FormatDateTime(cUSDateStyle,(ToPurchDate.Date)) + '" ) ');
            end;

         ExecSQL;

         with TempBeefRep do
            begin
               Open;
               First;
               PBar.Max := TempBeefRep.RecordCount;
               PBar.Show;
               while not eof do
                  begin

                     Edit;
                     FieldByName('NatIDShort').AsString := WinData.SortByNatIDByFarmNo(FieldByName('NatIdNum').AsString);
                     { Purchase Date / Slaughter Premium Eligibility }
                     FillChar(PurchSlght,SizeOf(PurchSlght),0);
                     PurchSlght := GetPurchSlght(FieldByName('AnimalID').AsInteger);
                     if PurchSlght[0] > 0 then
                        FieldByName('PurchaseDate').AsDateTime := PurchSlght[0]
                     else
                        FieldByName('PurchaseDate').AsDateTime := 0;

                     FieldByName('SixteenMthsDate').AsDateTime := IncMonth(FieldByName('DateOfBirth').AsDateTime,16);
                     FieldByName('DaysToSixteenMthDate').AsInteger := Trunc(FieldByName('SixteenMthsDate').AsDateTime-Date);
                     if FieldByName('DaysToSixteenMthDate').AsInteger < 0 then
                        FieldByName('DaysToSixteenMthDate').AsInteger := 0;

                     FieldByName('TwentyFourMthsDate').AsDateTime := IncMonth(FieldByName('DateOfBirth').AsDateTime,24);
                     FieldByName('DaysToTwentyFourtMthDate').AsInteger := Trunc(FieldByName('TwentyFourMthsDate').AsDateTime-Date);
                     if FieldByName('DaysToTwentyFourtMthDate').AsInteger < 0 then
                        FieldByName('DaysToTwentyFourtMthDate').AsInteger := 0;

                     FieldByName('ThirtyMthsDate').AsDateTime := IncMonth(FieldByName('DateOfBirth').AsDateTime,30);
                     FieldByName('DaysToThirtyMthDate').AsInteger := Trunc(FieldByName('ThirtyMthsDate').AsDateTime-Date);
                     if FieldByName('DaysToThirtyMthDate').AsInteger < 0 then
                        FieldByName('DaysToThirtyMthDate').AsInteger := 0;

                     { Purchase Date / Slaughter Premium Eligibility. }

                     if (cmboReportType.ItemIndex = 0) then
                        begin
                           if ( FieldByName('PurchaseDate').AsDateTime > 0 ) then
                              begin
                                 FieldByName('RetentionDate1').AsDateTime := FieldByName('PurchaseDate').AsDateTime + RetentionDays1.AsInteger;
                                 FieldByName('RetentionDate2').AsDateTime := FieldByName('PurchaseDate').AsDateTime + RetentionDays2.AsInteger;
                              end
                           else if ( FieldByName('DateOfBirth').AsDateTime > 0 ) then
                              begin
                                 FieldByName('RetentionDate1').AsDateTime := FieldByName('DateOfBirth').AsDateTime + RetentionDays1.AsInteger;
                                 FieldByName('RetentionDate2').AsDateTime := FieldByName('DateOfBirth').AsDateTime + RetentionDays2.AsInteger;
                              end;
                        end;

                     WinData.CheckEvents.Filter := '';
                     WinData.CheckEvents.Filtered := False;

                     { SP 19/03/2003 Get FQAS Retention Date, only if Herd is FQAS }
                     CheckStatus(FieldByName('AnimalID').AsInteger);
                     { SP 19/03/2003 }

                     Next;
                     Application.Processmessages;
                     PBar.Position := TempBeefRep.RecNo;
                  end;
                PBar.Hide;
            end;

            if (cmboReportType.ItemIndex = 0) then
               begin
                  with RptQuery do
                     begin
                        SQL.Clear;
                        SQL.Add('SELECT * FROM TempBeefRep');

                        if ( cmboSelectMonth.ItemIndex = 0 ) then
                           begin
                              if ((FromMonths.Date > 0) AND (ToMonths.Date > 0)) then
                                 begin
                                     RptQuery.SQL.ADD('WHERE (SixteenMthsDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromMonths.Date) + '''' + '');
                                     RptQuery.SQL.Text := RptQuery.SQL.Text +  'And ' + '''' + FormatDateTime(cUSDateStyle,ToMonths.Date) + '''' + ')';
                                 end
                              else if ((FromMonths.Date > 0) AND (ToMonths.Date <= 0)) then
                                 RptQuery.SQL.Add('WHERE (SixteenMthsDate >= "' + FormatDateTime(cUSDateStyle,(FromMonths.Date)) + '" ) ')
                              else if ((FromMonths.Date <= 0) AND (ToMonths.Date > 0)) then
                                 RptQuery.SQL.Add('WHERE (SixteenMthsDate <= "' + FormatDateTime(cUSDateStyle,(ToMonths.Date)) + '" ) ');
                           end
                        else if ( cmboSelectMonth.ItemIndex = 1 ) then
                           begin
                              if ((FromMonths.Date > 0) AND (ToMonths.Date > 0)) then
                                 begin
                                     RptQuery.SQL.ADD('WHERE (TwentyFourMthsDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromMonths.Date) + '''' + '');
                                     RptQuery.SQL.Text := RptQuery.SQL.Text +  'And ' + '''' + FormatDateTime(cUSDateStyle,ToMonths.Date) + '''' + ')';
                                 end
                              else if ((FromMonths.Date > 0) AND (ToMonths.Date <= 0)) then
                                 RptQuery.SQL.Add('WHERE (TwentyFourMthsDate >= "' + FormatDateTime(cUSDateStyle,(FromMonths.Date)) + '" ) ')
                              else if ((FromMonths.Date <= 0) AND (ToMonths.Date > 0)) then
                                 RptQuery.SQL.Add('WHERE (TwentyFourMthsDate <= "' + FormatDateTime(cUSDateStyle,(ToMonths.Date)) + '" ) ');
                           end
                        else if ( cmboSelectMonth.ItemIndex = 2 ) then
                           begin
                              if ((FromMonths.Date > 0) AND (ToMonths.Date > 0)) then
                                 begin
                                     RptQuery.SQL.ADD('WHERE (ThirtyMthsDate BETWEEN ' + '''' + FormatDateTime(cUSDateStyle,FromMonths.Date) + '''' + '');
                                     RptQuery.SQL.Text := RptQuery.SQL.Text +  'And ' + '''' + FormatDateTime(cUSDateStyle,ToMonths.Date) + '''' + ')';
                                 end
                              else if ((FromMonths.Date > 0) AND (ToMonths.Date <= 0)) then
                                 RptQuery.SQL.Add('WHERE (ThirtyMthsDate >= "' + FormatDateTime(cUSDateStyle,(FromMonths.Date)) + '" ) ')
                              else if ((FromMonths.Date <= 0) AND (ToMonths.Date > 0)) then
                                 RptQuery.SQL.Add('WHERE (ThirtyMthsDate <= "' + FormatDateTime(cUSDateStyle,(ToMonths.Date)) + '" ) ');
                           end;

                        CreateSQLSort;
                        Open;
                     end;
               end
            else if (cmboReportType.ItemIndex in [1,2]) then
               begin
                  with RptQuery do
                     begin
                        SQL.Clear;
                        SQL.Add('SELECT * FROM TempBeefRep');
                        if cmboReportType.ItemIndex = 1 then
                           SQL.ADD('Where FQAStatus=''Yes''')
                        else
                           begin
                              if ( (cbFQAEligible.Checked) and (deFQAEligilbleDate.Enabled) and (deFQAEligilbleDate.Date > 0)) then
                                 begin
                                    SQL.Add('WHERE ((FQAStatus=''No'') AND (FQASRetentionDate <= "'+FormatDateTime(cUSDateStyle,deFQAEligilbleDate.Date)+'"))');
                                    {
                                    DaystoFQASStatus := Trunc(deFQAEligilbleDate.Date - Date);
                                    if ( DaystoFQASStatus > 0 ) then
                                       SQL.ADD(Format('Where ((FQAStatus=''No'') AND (FQASDays + %d > 90))',[DaystoFQASStatus]))
                                    else
                                       SQL.ADD('Where FQAStatus=''No''');
                                    }
                                 end
                              else
                                 SQL.ADD('Where FQAStatus=''No''');
                           end;
                        CreateSQLSort;
                        Open;
                     end;
               end
            else if (cmboReportType.ItemIndex in [3,4]) then
               begin
                  with RptQuery do
                     begin
                        SQL.Clear;
                        SQL.Add('SELECT * FROM TempBeefRep');
                        if (cmboReportType.ItemIndex = 3) then
                           Month30Date := IncDay(Date, 30)
                        else if (cmboReportType.ItemIndex = 4) then
                           Month30Date := IncDay(Date, 10);
                        SQL.ADD('Where ThirtyMthsDate Between :AFromDate And :AToDate');
                        CreateSQLSort;
                        Params[0].AsDateTime := Date;
                        Params[1].AsDateTime := Month30Date;
                        Open;
                     end;
               end
      end;

end;

procedure TEligibilityRep.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;   
end;

{function TEligibilityRep.CheckFirstPrem(AnimalID : Integer): TPremArray;
begin
   Result[0]:= 0;
   Result[1]:= 0;
   with WinData.CheckEvents do
      begin
         // Get the Last Service Record
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (EventType = ' + IntToStr(CPremium10Event) + ')';
         WinData.CheckEvents.Filtered := True;
         if WinData.CheckEvents.FindLast then
            if WinData.BeefSubsidy.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
               begin
                  if WinData.BeefSubsidy.FieldByName('ApplicationID').AsInteger > -1 then
                     begin
                        Result[0]:= WinData.BeefSubsidy.FieldByName('ApplicationDate').AsDateTime;
                        Result[1]:= WinData.BeefSubsidy.FieldByName('RetensionDate').AsDateTime;
                     end
                  else
                     Result[0]:= WinData.BeefSubsidy.FieldByName('EligibilityDate').AsDateTime;
               end;
      end;
end;

function TEligibilityRep.CheckSecPrem(AnimalID: Integer): TPremArray;
begin
   Result[0]:= 0;
   Result[1]:= 0;
   with WinData.CheckEvents do
      begin
         // Get the Last Service Record
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (EventType = ' + IntToStr(CPremium22Event) + ')';
         WinData.CheckEvents.Filtered := True;
         if WinData.CheckEvents.FindLast then
            if WinData.BeefSubsidy.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
               begin
                  if WinData.BeefSubsidy.FieldByName('ApplicationID').AsInteger > -1 then
                     begin
                        Result[0]:= WinData.BeefSubsidy.FieldByName('ApplicationDate').AsDateTime;
                        Result[1]:= WinData.BeefSubsidy.FieldByName('RetensionDate').AsDateTime;
                     end
                  else
                     Result[0]:= WinData.BeefSubsidy.FieldByName('EligibilityDate').AsDateTime;
               end;
      end;
end;
}
procedure TEligibilityRep.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   SalesPlannerReportType := rtNone;
   HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
   EligibilityScr.Hide;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint);
  // QRDBFQAS.DataField := '';
  // qrFQAS.Caption := '';
   OpenTables;
   GetHerdProps;
   LoadScreenDefaults;
   cmboReportType.Visible := (WinData.SystemRegisteredCountry=NIreland);
   lReportType.Visible := cmboReportType.Visible;
   cmboSelectMonth.ItemIndex := 0;
end;

function TEligibilityRep.GetPurchSlght(AnimalID: Integer): TPurchSlght;
begin
   Result[0] := 0;
   Result[1] := 0;
   with WinData.CheckEvents do
      begin
         Open;
         // Get the Purchase Date, Calc Retention date
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (EventType = ' + IntToStr(cPurchaseEvent) + ')';
         WinData.CheckEvents.Filtered := True;
         if WinData.CheckEvents.FindLast then
            begin
               Result[0] := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               Result[1] := IncMonth(WinData.CheckEvents.FieldByName('EventDate').AsDateTime,2);
            end;
      end;
end;

{function TEligibilityRep.CheckBull(AnimalID: Integer): TPremArray;
begin
   Result[0]:= 0;
   Result[1]:= 0;
   with WinData.CheckEvents do
      begin
         // Get the Last Service Record
         WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (EventType = ' + IntToStr(CPremiumBullEvent) + ')';
         WinData.CheckEvents.Filtered := True;
         if WinData.CheckEvents.FindLast then
            if WinData.BeefSubsidy.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
               begin
                  if WinData.BeefSubsidy.FieldByName('ApplicationID').AsInteger > -1 then
                     begin
                        Result[0]:= WinData.BeefSubsidy.FieldByName('ApplicationDate').AsDateTime;
                        Result[1]:= WinData.BeefSubsidy.FieldByName('RetensionDate').AsDateTime;
                     end
                  else
                     Result[0]:= WinData.BeefSubsidy.FieldByName('EligibilityDate').AsDateTime;
               end;
      end;
end;}

procedure TEligibilityRep.DeleteTableContents(TableName: String);
begin
   with RptQuery do
      begin
         Close;
         SQL.Clear;
         SQL.Add('Delete From TempBeefRep');
         ExecSQL;
         Close;
      end;
end;

procedure TEligibilityRep.QRDBText11Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('FirstDate').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.QRDBText23Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('SecondDate').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.QRDBText13Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('RetensionDate').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.FormShow(Sender: TObject);
begin
   PBar.Hide;
end;

procedure TEligibilityRep.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('PurchaseDate').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.QRDBText22Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('SlaughterDate').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.CheckStatus(AnimalID: Integer);
var
   AnimalFQAS : Boolean;
   PurchFQASDays : Integer;
   DaysOnFarm : Integer;
begin
   AnimalFQAS := False;
   PurchFQASDays := 0;
   DaysOnFarm := 0;
   with WinData.CheckEvents do
      begin
         Open;
         // Get the Purchase Record
         if ( TempBeefRep.FieldByName('QADate').AsDateTime > 0 ) then
            begin
               if ( TempBeefRep.FieldByName('QADate').AsDateTime <= Date ) then
                  TempBeefRep.FieldByName('FQAStatus').AsString := 'Yes'
               else if ( TempBeefRep.FieldByName('QADate').AsDateTime > Date ) then
                  begin
                     TempBeefRep.FieldByName('FQAStatus').AsString := 'No';
                     TempBeefRep.FieldByName('FQASRetentionDate').AsDateTime := TempBeefRep.FieldByName('QADate').AsDateTime;
                     if ( TempBeefRep.FieldByName('FQASRetentionDate').AsDateTime > Date ) then
                        TempBeefRep.FieldByName('FQASDays').AsInteger := Trunc(TempBeefRep.FieldByName('FQASRetentionDate').AsDateTime-Date);
                  end;
            end
         else
            begin
               if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([AnimalID,cPurchaseEvent]), []) then
                  begin
                     if WinData.LookUpPurchases.Locate('EventID', WinData.CheckEvents.FieldByName('ID').AsInteger, []) then
                        begin
                           AnimalFQAS := WinData.LookUpPurchases.FieldByName('FQAS').AsBoolean;
                           // New 08/07/08
                           // PurchFQASDays := WinData.LookUpPurchases.FieldByName('FQASDays').AsInteger;
                        end;
                     { NOTE: If animal isn't FQAS when purchased into herd, then calculate then retention date based on purchdate + 3 months + 1 day. }
                     { ** Remember the Herd must be FQAS, this is dealth with before entering this procedure }
                     if not(AnimalFQAS) then
                        begin
                           TempBeefRep.FieldByName('QADate').AsDateTime := (IncMonth( WinData.CheckEvents.FieldByName('EventDate').AsDateTime, 3 )-PurchFQASDays) + 1;
                        end;

                     DaysOnFarm := Trunc(Date -  WinData.CheckEvents.FieldByName('EventDate').AsDateTime);
                  end
               else
                  begin
                     TempBeefRep.FieldByName('QADate').AsDateTime := IncMonth( TempBeefRep.FieldByName('DateOfBirth').AsDateTime, 3 ) + 1;
                     DaysOnFarm := Trunc(Date - TempBeefRep.FieldByName('DateOfBirth').AsDateTime);
                  end;

               TempBeefRep.FieldByName('DaysOnFarm').AsInteger := DaysOnFarm;
               TempBeefRep.FieldByName('FQASDays').AsInteger := DaysOnFarm;//+PurchFQASDays;

               if (TempBeefRep.FieldByName('FQASDays').AsInteger > 90) then
                  TempBeefRep.FieldByName('FQAStatus').AsString := 'Yes'
               else
                  TempBeefRep.FieldByName('FQAStatus').AsString := 'No';
            end;
      end;
end;

procedure TEligibilityRep.HerdComboChange(Sender: TObject);
begin
   IncludeAllHerds := (HerdCombo.Value = '0');

{   if HerdCombo.Value = '0' then
      begin
         Messagedlg('You must select a herd', mtInformation , [mbOK] , 0 );
         HerdCombo.SetFocus;
      end
   else}
   GetHerdProps;
end;

procedure TEligibilityRep.GetHerdProps;
begin
   SystemRegCountry := WinData.SystemRegisteredCountry;
   IncludeAllHerds := (HerdCombo.Value = '0');
   PreventFQASPreview := False;
   // Check what herds are FQA compliant.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add(SQL_SELECT + ' ID, FQAS '+ SQL_FROM + ' Owners ' + SQL_WHERE +' ' +SQL_UPPER+'(HerdIdentity) <> "NONE"');
         Open;
         try
            First;
            if IncludeAllHerds then
               begin
                  // Check all herd are FQA compliant.
                  while not eof do
                     begin
                        if not Fields[1].AsBoolean then
                           begin
                              PreventFQASPreview := True;
                              Break;
                           end;
                        next;
                     end;
               end
            else
               begin
                  // Only check if selected herd is FQA compliant.
                  if Locate('ID', StrToInt(HerdCombo.Value),[]) then
                     begin
                        if not Fields[1].AsBoolean then
                           PreventFQASPreview := True;
                     end;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;


{   with qFQAS do
      begin
         ParamByName('HerdID').AsInteger := StrToInt(HerdCombo.Value);
         Open;
         First;
         FQASHerd := FieldByName('FQAS').AsBoolean;
          := WinData.DefCountry(ParamByName('HerdID').AsInteger);
         Close;
      end;
}
end;

procedure TEligibilityRep.OpenTables;
begin
   if not WinData.CheckEvents.Active then
      begin
         WinData.CheckEvents.Active := True;
         CheckEventsAlreadyActive := False
      end
   else
      CheckEventsAlreadyActive := True;

   if not WinData.BeefSubsidy.Active then
      begin
         WinData.BeefSubsidy.Active := True;
         BeefSubsidyAlreadyActive := False
      end
   else
      BeefSubsidyAlreadyActive := True;

   if not WinData.LookUpPurchases.Active then
      begin
         WinData.LookUpPurchases.Active := True;
         LookUpPurchasesAlreadyActive := False
      end
   else
      LookUpPurchasesAlreadyActive := True;
end;

procedure TEligibilityRep.CloseTables;
begin
   if not CheckEventsAlreadyActive then
      WinData.CheckEvents.Active := False;

   if not BeefSubsidyAlreadyActive then
      WinData.BeefSubsidy.Active := False;

   if not LookUpPurchasesAlreadyActive then
      WinData.LookUpPurchases.Active := False;
end;

procedure TEligibilityRep.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   CloseTables;
   SaveScreenDefaults
end;

procedure TEligibilityRep.QRDBFQASPrint(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('FQASRetentionDate').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbsUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Style.Font.Color := clBlue;
      end
   else
      cbUseFilter.Style.Font.Color := clBlack;
end;

procedure TEligibilityRep.LoadScreenDefaults;
begin
   SalesEligDefs := TSalesEligibilityDefaults.Create(cRD_SalesAnalysis);
   try
      ReportFilter.ItemIndex := SalesEligDefs.ReportOn;
      SortByRadio.ItemIndex := SalesEligDefs.SortField;
      FDefaultSortByIndex := SortByRadio.ItemIndex;
      OrderRadio.ItemIndex   := SalesEligDefs.SortOrder;
      if SalesEligDefs.DOBInterval > 0 then
         begin
            ToBirthDate.Date := Date;
            FromBirthDate.Date := Trunc( Date - SalesEligDefs.DOBInterval);
         end;
      if SalesEligDefs.PurchaseInterval > 0 then
         begin
            ToPurchDate.Date := Date;
            FromPurchDate.Date := Trunc( Date - SalesEligDefs.PurchaseInterval);
         end;
      if SalesEligDefs.ThirtyMonthInterval > 0 then
         begin
            ToMonths.Date := Date;
            FromMonths.Date := Trunc( Date - SalesEligDefs.ThirtyMonthInterval);
         end;

      RetentionDays1.AsInteger := SalesEligDefs.RetentionDays.Days1;
      RetentionDays2.AsInteger := SalesEligDefs.RetentionDays.Days2;
   finally
      FreeAndNil(SalesEligDefs);
   end;
end;

procedure TEligibilityRep.SaveScreenDefaults;
var
   RetentionDays : TNoOfRetentionDays;
begin
   SalesEligDefs := TSalesEligibilityDefaults.Create(cRD_SalesAnalysis);
   try
      SalesEligDefs.ReportOn  := ReportFilter.ItemIndex;
      SalesEligDefs.SortField := SortByRadio.ItemIndex;
      SalesEligDefs.SortOrder := OrderRadio.ItemIndex;
      if ( FromBirthDate.Date > 0 ) and ( ToBirthDate.Date > 0 ) then
         SalesEligDefs.DOBInterval := Trunc( ToBirthDate.Date - FromBirthDate.Date)
      else
         SalesEligDefs.DOBInterval := 0;

      if ( FromPurchDate.Date > 0 ) and ( ToPurchDate.Date > 0 ) then
         SalesEligDefs.PurchaseInterval := Trunc( ToPurchDate.Date - FromPurchDate.Date)
      else
         SalesEligDefs.PurchaseInterval := 0;

      if ( FromMonths.Date > 0 ) and ( ToMonths.Date > 0 ) then
         SalesEligDefs.ThirtyMonthInterval := Trunc( ToMonths.Date - FromMonths.Date)
      else
         SalesEligDefs.ThirtyMonthInterval := 0;

      RetentionDays.Days1 := RetentionDays1.AsInteger;
      RetentionDays.Days2 := RetentionDays2.AsInteger;
      SalesEligDefs.RetentionDays := RetentionDays;
   finally
      FreeAndNil(SalesEligDefs);
   end;
end;

procedure TEligibilityRep.QRDBText6Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('RetentionDate2').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.QRDBText4Print(sender: TObject;
  var Value: String);
begin
   if RptQuery.FieldByName('RetentionDate1').AsDateTime <= 0 then
      Value := '';
end;

procedure TEligibilityRep.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   {
   if (cmboReportType.ItemIndex = 1) then
      PrintBand := TempBeefRep.FieldByName('FQAStatus').AsString='Yes';
   else if (cmboReportType.ItemIndex = 2) then
      PrintBand := TempBeefRep.FieldByName('FQAStatus').AsString='No';
   }
end;

procedure TEligibilityRep.QRLabel9Print(sender: TObject;
  var Value: String);
begin
   if not pSalesPlanner.Visible then
      Value := '';
end;

procedure TEligibilityRep.SetSalesPlannerReportType(const Value: TSalesPlannerReportType);
begin
   if Value <> FSalesPlannerReportType then
      begin
         FSalesPlannerReportType := Value;

         lDaysLeft.Caption := '';
         qrdbDaysLeft.DataField := '';

         if SystemRegCountry = Ireland then
            begin
               lFQASDays.Caption := '';
               qrdbFQASDays.DataField := '';
               qrFQAS.Caption := '';
               QRDBFQAS.DataField := '';
            end;

         if (FSalesPlannerReportType in [rtFQAS,rtNonFQAS]) then
            begin
               QRLabel1.Caption := 'FQA Qualified Days';
               QRDBText7.DataField := 'FQASDays';
               //QRLabel1.Left := 843;
               //QRDBText7.Left := 843;
            end
         else if (FSalesPlannerReportType in [rt30mth30Day, rt30mth10Day]) then
            begin
               gbNoneFQASFilter.Visible := False;

               QRLabel1.Caption := 'Days On Farm';
               QRDBText7.DataField := 'DaysOnFarm';

               //QRLabel1.Left := 675;
               //QRDBText7.Left := 675;
            end
         else
            begin
               QRLabel1.Caption := '';
               QRDBText7.DataField := '';
            end;

         pSalesPlanner.Visible := FSalesPlannerReportType = rtSalesPlanner;
         //SortByRadio.Visible := not(FSalesPlannerReportType in [rtFQAS,rtNonFQAS]);
         if ( FSalesPlannerReportType in [rtFQAS,rtNonFQAS] ) then
            begin
               SortByRadio.Items.Clear;
               SortByRadio.Items.Add('Animal Number');
               SortByRadio.Items.Add('National ID');
               SortByRadio.Items.Add('Date of Birth');
               SortByRadio.Items.Add('Purchase Date');
            end;
         //OrderRadio.Visible := not(FSalesPlannerReportType in [rtFQAS,rtNonFQAS]);
         gbNoneFQASFilter.Visible := FSalesPlannerReportType = rtNonFQAS;

         if FSalesPlannerReportType = rtSalesPlanner then
            begin
               if Height <> 505 then
               {
               if ReportFilter.Top <> 290 then
                  ReportFilter.Top := 290;
               if SortByRadio.Top <> 371 then
                  SortByRadio.Top := 371;
               if OrderRadio.Top <> 371 then
                  OrderRadio.Top := 371;
               if PBar.Top <> 447 then
                  PBar.Top := 447;
               }
               if ( not(lReportType.Visible) ) then
                  begin
                     Height := 480;
                     pSalesPlanner.Top := 81;
                     ReportFilter.Top := 261;
                     SortByRadio.Top := 342;
                     OrderRadio.Top := SortByRadio.Top;
                     PBar.Top := 418;
                  end
               else
                  begin
                     Height := 505;
                     pSalesPlanner.Top := 110;
                     ReportFilter.Top := 290;
                     SortByRadio.Top := 371;
                     OrderRadio.Top := SortByRadio.Top;
                     PBar.Top := 447;
                  end;
            end
         else
            begin
               if ( FSalesPlannerReportType <> rtNonFQAS ) then
                  begin
                     Height := 320;
                     ReportFilter.Top := 108;
                     SortByRadio.Top := 193;
                     OrderRadio.Top := 193;
                     PBar.Top := 268;
                  end
               else if ( FSalesPlannerReportType = rtNonFQAS ) then
                  begin
                     Height := 400;
                     gbNoneFQASFilter.Top := 108;
                     ReportFilter.Top := gbNoneFQASFilter.Top + gbNoneFQASFilter.Height + 10;
                     SortByRadio.Top := ReportFilter.Top + ReportFilter.Height + 10;
                     OrderRadio.Top := SortByRadio.Top;
                     PBar.Top := SortByRadio.Top + SortByRadio.Height + 8;
                  end;
            end;

         if (FSalesPlannerReportType in [rtFQAS,rtNonFQAS]) then
            begin
               // default sort to date of birth.
               SortByRadio.ItemIndex := FDefaultSortByIndex;
            end;

        cmboReportType.ItemIndex := Ord(FSalesPlannerReportType)-1;
     end;
end;

procedure TEligibilityRep.cmboReportTypePropertiesChange(Sender: TObject);
begin
   SalesPlannerReportType := TSalesPlannerReportType(cmboReportType.ItemIndex+1);

   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   if ( FSalesPlannerReportType = rtSalesPlanner ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cSalesPlannerRep);
         WinData.UpdateRecentReportUsage(cSalesPlannerRep);
      end
   else if ( FSalesPlannerReportType = rtFQAS ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cFQASRep);
         WinData.UpdateRecentReportUsage(cFQASRep);
      end
   else if ( FSalesPlannerReportType = rtNonFQAS ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(cNonFQASRep);
         WinData.UpdateRecentReportUsage(cNonFQASRep);
     end
   else if ( FSalesPlannerReportType = rt30mth10Day ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(c30Month10DayRep);
         WinData.UpdateRecentReportUsage(c30Month10DayRep);
      end
   else if ( FSalesPlannerReportType = rt30mth30Day ) then
      begin
         cbFavourite.Checked := WinData.IsReportFavourite(c30Month30DayRep);
         WinData.UpdateRecentReportUsage(c30Month30DayRep);
      end;
end;

procedure TEligibilityRep.qrdbFQASDaysPrint(sender: TObject;
  var Value: String);
begin
//
end;

procedure TEligibilityRep.QRDBText7Print(sender: TObject;
  var Value: String);
begin
//
end;

procedure TEligibilityRep.qrdbDaysLeftPrint(sender: TObject;
  var Value: String);
begin
//
end;

procedure TEligibilityRep.qrdbHerdIdentityPrint(sender: TObject;
  var Value: String);
begin
//
end;

procedure TEligibilityRep.cbFQAEligiblePropertiesChange(Sender: TObject);
begin
   deFQAEligilbleDate.Enabled := cbFQAEligible.Checked;
   if deFQAEligilbleDate.Enabled then
      deFQAEligilbleDate.Date := Date + 7
   else
      deFQAEligilbleDate.Clear;
end;

procedure TEligibilityRep.FormActivate(Sender: TObject);
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

procedure TEligibilityRep.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TEligibilityRep.cbFavouriteClick(Sender: TObject);

   procedure AddRemoveFavourite ( AAddRemove : Boolean; AReportConst : String );
   begin
      if AAddRemove then
         begin
            WinData.SetReportAsFavourite(AReportConst,True);
            cbFavourite.Style.TextColor := clBlue;
            cbFavourite.StyleHot.TextColor := clBlue;
         end
      else
         begin
            WinData.SetReportAsFavourite(AReportConst,False);
            cbFavourite.Style.TextColor := clBlack;
            cbFavourite.StyleHot.TextColor := clBlack;
         end;
      Application.ProcessMessages;
      Update;
   end;

begin
   if ( FSalesPlannerReportType = rtSalesPlanner ) then
      AddRemoveFavourite(cbFavourite.Checked, cSalesPlannerRep)
   else if ( FSalesPlannerReportType = rtFQAS ) then
      AddRemoveFavourite(cbFavourite.Checked, cFQASRep)
   else if ( FSalesPlannerReportType = rtNonFQAS ) then
      AddRemoveFavourite(cbFavourite.Checked, cNonFQASRep)
   else if ( FSalesPlannerReportType = rt30mth10Day ) then
      AddRemoveFavourite(cbFavourite.Checked, c30Month10DayRep)
   else if ( FSalesPlannerReportType = rt30mth30Day ) then
      AddRemoveFavourite(cbFavourite.Checked, c30Month30DayRep);
end;

procedure TEligibilityRep.cmboSelectMonthPropertiesChange(Sender: TObject);
const
   cMonthDate = ' Month Date';
begin
   qrlMonthDate.Caption := cmboSelectMonth.Text + cMonthDate;

   if ( cmboSelectMonth.ItemIndex = 0 ) then
      qrdbAgeDate.DataField := 'SixteenMthsDate'
   else if ( cmboSelectMonth.ItemIndex = 1 ) then
      qrdbAgeDate.DataField := 'TwentyFourMthsDate'
   else if ( cmboSelectMonth.ItemIndex = 2 ) then
      qrdbAgeDate.DataField := 'ThirtyMthsDate';
end;

end.
