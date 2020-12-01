{
   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
}

unit uActiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, StdCtrls, Mask, ToolEdit, RxLookup, ExtCtrls, RXCtrls,
  ComCtrls, ToolWin, Db, DBTables, RXDBCtrl, QRExport, cxControls,
  cxContainer, cxEdit, cxCheckBox, KRoutines;

type
  TfActiv = class(TForm)
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
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    pActiv: TPanel;
    LDOBTo: TLabel;
    LDOBFrom: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    rgSortBy: TRadioGroup;
    rgSortOrder: TRadioGroup;
    qActiv: TQuery;
    qSales: TQuery;
    dsqActiv: TDataSource;
    qCalvings: TQuery;
    qService: TQuery;
    qDryingOff: TQuery;
    qPurchases: TQuery;
    ActivScr: TQuickRep;
    PageFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    VerLabel: TQRLabel;
    TitleBand1: TQRBand;
    Title1: TQRLabel;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel8: TQRLabel;
    QRGServices: TQRGroup;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRSubServices: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText41: TQRDBText;
    QRGCalving: TQRGroup;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRSubDryingOff: TQRSubDetail;
    QRDBText16: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText17: TQRDBText;
    QRSubSalesDeaths: TQRSubDetail;
    QRDBText24: TQRDBText;
    LSaleOrDeath: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRGPurchases: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel41: TQRLabel;
    QRSubPurchases: TQRSubDetail;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText15: TQRDBText;
    QRGSalesDeaths: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel32: TQRLabel;
    QRFootService: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel20: TQRLabel;
    QRFootDryingOff: TQRBand;
    QRExpr4: TQRExpr;
    QRLabel29: TQRLabel;
    QRFootSales: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel36: TQRLabel;
    QRFootPurchases: TQRBand;
    QRExpr6: TQRExpr;
    QRLabel38: TQRLabel;
    QRGDryingOff: TQRGroup;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel40: TQRLabel;
    QRSubCalving: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    EventLabel: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRFootCalving: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel42: TQRLabel;
    QRShape9: TQRShape;
    Title5: TQRLabel;
    QRShape8: TQRShape;
    Title2: TQRLabel;
    QRShape7: TQRShape;
    Title6: TQRLabel;
    QRShape6: TQRShape;
    Title4: TQRLabel;
    QRShape3: TQRShape;
    ServiceDate: TQRLabel;
    NoServes: TQRLabel;
    ServiceInt: TQRLabel;
    BullCode: TQRLabel;
    BullName: TQRLabel;
    ServiceDateRange: TQRLabel;
    DryingOffDateRange: TQRLabel;
    SaleDeathDateRange: TQRLabel;
    PurchasesDateRange: TQRLabel;
    CalvingDateRange: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qLastMilkDate: TQuery;
    C1sex: TQRDBText;
    QRDBText8: TQRDBText;
    C3sex: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    cbServiceRpt: TCheckBox;
    cbIncludeBulls: TCheckBox;
    Button1: TButton;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbFavourite: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActivScrBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure LSaleOrDeathPrint(sender: TObject; var Value: String);
    procedure QRSubServicesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    MyTable : TTable;
    RecordTypeNo :integer;
    procedure CreateActivTable;//
    procedure Calvings;
    procedure Services;
    procedure DryingOff;
    procedure SalesDeaths;
    procedure Purchases;
    procedure AddSort(QueryToAddTo : TQuery);
    procedure SetDateRanges;
  public
    { Public declarations }
  end;

procedure ShowForm;

implementation
uses GenTypesConst,
     DairyData,
     uCowEnrolFilt;

var
  fActiv: TfActiv;

{$R *.DFM}

procedure ShowForm;
begin
     try
        if ( fActiv = nil ) then
           Application.CreateForm(TfActiv,fActiv);

        fActiv.ShowModal;
     except
          ShowMessage('Cannot create form - Close program and re-boot');
     end;
End;

procedure TfActiv.FormCreate(Sender: TObject);
begin
   ActivScr.Hide;
   WinData.CanShowStandardReportHint := True;
end;

procedure TfActiv.CreateActivTable;//
begin
     // Table creation etc.
     with MyTable do
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'tActiv';

           // Comman Details to all Rpts
           FieldDefs.Clear;
           FieldDefs.Add('RecordType',ftInteger,0,FALSE);
           FieldDefs.Add('EventID',ftInteger,0,FALSE);

           FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
           FieldDefs.Add('HerdID',ftInteger,0,FALSE);
           FieldDefs.Add('AnimalNo',ftString,20,FALSE);
           FieldDefs.Add('LactNo',ftInteger,0,FALSE);
           FieldDefs.Add('AnimalName',ftString,40,FALSE);

           FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
           FieldDefs.Add('SortNatID',ftString,20,FALSE);
           FieldDefs.Add('NatID',ftString,20,FALSE);
           FieldDefs.Add('Sex',ftString,10,FALSE);

           // Event Details
           FieldDefs.Add('EventDate',ftDate,0,FALSE);
           FieldDefs.Add('EventDesc',ftString,30,FALSE);

           // Calving
           FieldDefs.Add('C1Sex',ftString,10,False);
           FieldDefs.Add('C2Sex',ftString,10,False);
           FieldDefs.Add('C3Sex',ftString,10,False);
           FieldDefs.Add('CalcSex1',ftString,10,False);
           FieldDefs.Add('CalcSex2',ftString,10,False);
           FieldDefs.Add('CalcSex3',ftString,10,False);
           FieldDefs.Add('CalfID1',ftString,20,FALSE);
           FieldDefs.Add('CalfID2',ftString,20,FALSE);
           FieldDefs.Add('CalfID3',ftString,20,FALSE);
           FieldDefs.Add('CalfNatID1',ftString,20,FALSE);
           FieldDefs.Add('CalfNatID2',ftString,20,FALSE);
           FieldDefs.Add('CalfNatID3',ftString,20,FALSE);
//           FieldDefs.Add('CalfID4',ftString,20,FALSE);
           FieldDefs.Add('CalfType',ftString,6,FALSE);

           // Service
           FieldDefs.Add('NoServes',ftString,3,FALSE);
           FieldDefs.Add('ServeInterval',ftString,8,FALSE);
           FieldDefs.Add('BullCode',ftString,20,FALSE);
           FieldDefs.Add('BullName',ftString,40,FALSE);

           // Drying Off

           // Sales/Deaths
           FieldDefs.Add('SaleOrDeath',ftBoolean,0,FALSE);
           FieldDefs.Add('ReasonForDeath',ftString,30,FALSE);

           //Purchases - Nothing New Needed.

           try
              CreateTable;
              Open;
           except
              Messagedlg('Table already in use, please exit the program and try again', mterror, [mbok],0);
           end;
        end;
end;

procedure TfActiv.Calvings;
var
   FormattedStr, HerdIdentifier : string;
   nPos, xCalf : Integer;
begin
     qActiv.sql.Clear;
     qActiv.sql.Add('INSERT INTO tActiv (AnimalID, HerdID, AnimalNo, LactNo, AnimalName, SortAnimalNo, NatID, SortNatId, C1Sex, C2Sex, C3Sex, EventDate, EventDesc, CalfID1, CalfID2, CalfID3, CalfNatID1, CalfNatID2, CalfNatID3, RecordType )');
     // qActiv.sql.Add('SELECT distinct A.ID, A.HerdID, A.AnimalNo, A.LactNo, A.Name, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.Sex, E.EventDate, E.Eventdesc, C.ID1, C.ID2, C.ID3, C.ID4, CAST(' + IntToStr(CCalvingEvent) + ' AS INTEGER) FROM');
     qActiv.sql.Add('SELECT distinct A.ID, A.HerdID, A.AnimalNo, A.LactNo, A.Name, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
     qActiv.sql.Add('       C1.Sex, C2.Sex, C3.Sex, E.EventDate, E.Eventdesc, C1.AnimalNo, C2.AnimalNo, C3.AnimalNo, C1.NatIDNum,');
     qActiv.sql.Add('       C2.NatIDNum, C3.NatIDNum, CAST(' + IntToStr(CCalvingEvent) + ' AS INTEGER)');
     qActiv.sql.Add('FROM Animals A, Events E');
     qActiv.sql.Add('LEFT JOIN Calvings C ON ( C.EventID=Events.ID)');
     qActiv.sql.Add('LEFT JOIN Animals C1 ON ( C1.ID=C.ID1)');
     qActiv.sql.Add('LEFT JOIN Animals C2 ON ( C2.ID=C.ID2)');
     qActiv.sql.Add('LEFT JOIN Animals C3 ON ( C3.ID=C.ID3)');
//     qActiv.sql.Add('LEFT JOIN Animals C4 ON ( C4.ID=C.ID4)');
     qActiv.sql.Add('WHERE (A.ID=E.AnimalID)');
     qActiv.sql.Add(' AND (A.LactNo=E.AnimalLactNo)');
     qActiv.sql.Add(' AND (E.EventType=' + IntToStr(CCalvingEvent) + ')');
     qActiv.sql.Add(' AND (A.AnimalDeleted=FALSE)');
     if ( FromDate.Date > 0 ) AND ( ToDate.Date > 0 ) then
        qActiv.SQL.Add(' AND (E.EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
     if ( Length(ComboHerd.Value) > 0 ) then
        qActiv.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ');
     qActiv.ExecSQL;
     qCalvings.SQL.Add('Select * from tActiv where (RecordType= ' + IntToStr(CCalvingEvent) + ')');
     AddSort(qCalvings);
     MyTable.Open;

     with MyTable do
        begin
           First;
           while NOT EOF do
              begin
                 Edit;
                 if WinData.OwnerFile.Locate('Id', FieldByName('HerdID').AsInteger, []) then
                    begin

                       for xCalf := 1 to 3 do
                          begin
                             if MyTable.FieldByName(Format('C%dSex',[xCalf])).AsString <> cSex_Female then
                                MyTable.FieldByName(Format('CalcSex%d',[xCalf])).AsString := 'M'
                             else
                                MyTable.FieldByName(Format('CalcSex%d',[xCalf])).AsString := 'F';

                             if IsNINatID( MyTable.FieldByName(Format('CalfNatID%d',[xCalf])).AsString) then
                                begin
                                   // if NI tag, copy the animalno\check digit from natid and post into CalfID field
                                   FormattedStr := WinData.StripAllSpaces(MyTable.FieldByName(Format('CalfNatID%d',[xCalf])).AsString);
                                   HerdIdentifier := WinData.OwnerFileHerdIdentifier.AsString;
                                   if HerdIdentifier <> '' then
                                      begin
                                         nPos := Pos(HerdIdentifier,FormattedStr);
                                         if (nPos > 0) then
                                            begin
                                               FormattedStr := Copy(FormattedStr, nPos+Length(HerdIdentifier), MaxInt);
                                               if FormattedStr <> '' then
                                                  begin
                                                     // insert space to differentiate animalno from check digit
                                                     System.Insert(' ',FormattedStr, Length(FormattedStr));
                                                     MyTable.FieldByName(Format('CalfID%d',[xCalf])).AsString := FormattedStr;
                                                  end;
                                            end;
                                      end;
                                end;
                         end;
                    end;
                 post;
                 Next;
              end;
        end
end;

procedure TfActiv.Services;
begin
     qActiv.sql.Clear;
     qActiv.sql.Add('INSERT INTO tActiv (AnimalID, HerdID, AnimalNo, LactNo, AnimalName, SortAnimalNo, NatID, SortNatId, RecordType, EventID )');
     qActiv.sql.Add('SELECT Distinct A.ID, A.HerdID, A.AnimalNo, A.LactNo, A.Name, A.SortAnimalNo, A.NatIDNum, A.SortNatID, CAST(' + IntToStr(CServiceEvent) + ' AS INTEGER), E.ID FROM');
     qActiv.sql.Add('Animals A, Events E');
     // qActiv.sql.Add('LEFT JOIN Services C ON ( C.EventID=Events.ID)');
     qActiv.sql.Add('WHERE (A.ID=E.AnimalID)');
     qActiv.sql.Add('AND (A.LactNo=E.AnimalLactNo)');
     qActiv.sql.Add('AND (A.AnimalDeleted=FALSE)');
     qActiv.sql.Add('AND (E.EventType=' + IntToStr(CServiceEvent) + ')');
     qActiv.sql.Add('AND (A.InHerd=TRUE)');
     If ( FromDate.Date > 0 ) AND ( ToDate.Date > 0 ) then
        qActiv.SQL.Add(' AND (E.EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
     if ( Length(ComboHerd.Value) > 0 ) then
        qActiv.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ');
     qActiv.ExecSQL;
     qService.SQL.Add('SELECT * FROM tActiv WHERE (RecordType= ' + IntToStr(CServiceEvent) + ')');
     AddSort(qService);
end;

procedure TfActiv.DryingOff;
begin
     qActiv.sql.Clear;
     qActiv.sql.Add('INSERT INTO tActiv (AnimalID, HerdID, AnimalNo, LactNo, AnimalName, SortAnimalNo, NatID, SortNatId, EventDate, EventDesc, RecordType )');
     qActiv.sql.Add('SELECT A.ID, A.HerdID, A.AnimalNo, A.LactNo, A.Name, A.SortAnimalNo, A.NatIDNum, A.SortNatID, E.EventDate, E.Eventdesc, CAST(' + IntToStr(CDryoffEvent) + ' AS INTEGER) FROM');
     qActiv.sql.Add('Animals A, Events E');
     qActiv.sql.Add('WHERE (A.ID=E.AnimalID)');
     qActiv.sql.Add('AND (A.AnimalDeleted=FALSE)');
     qActiv.sql.Add('AND (A.LactNo=E.AnimalLactNo)');
     qActiv.sql.Add('AND (A.InHerd=TRUE)');
     qActiv.sql.Add('AND (E.EventType=' + IntToStr(CDryOffEvent) + ')');
     If ( FromDate.Date > 0 ) AND ( ToDate.Date > 0 ) then
        qActiv.SQL.Add(' AND (E.EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
     if ( Length(ComboHerd.Value) > 0 ) then
        qActiv.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ');
     qActiv.ExecSQL;
     qDryingOff.SQL.Add('select * from tActiv where (RecordType= ' + IntToStr(CDryOffEvent) + ')');
     AddSort(qDryingOff);
end;

procedure TfActiv.SalesDeaths;
begin
     qActiv.sql.Clear;
     qActiv.sql.Add('INSERT INTO tActiv (AnimalID, HerdID, AnimalNo, LactNo, AnimalName, SortAnimalNo, NatID, SortNatID, EventDate, EventDesc, SaleOrDeath, RecordType  )');
     qActiv.sql.Add('SELECT A.ID, A.HerdID, A.AnimalNo, A.LactNo, A.Name, A.SortAnimalNo, A.NatIDNum, A.SortNatID, E.EventDate, E.Eventdesc, C.Sold, CAST(' + IntToStr(CSaleDeathEvent) + ' AS INTEGER) FROM');
     qActiv.sql.Add('Animals A, Events E');
     qActiv.sql.Add('LEFT JOIN SalesDeaths C ON ( C.EventID=E.ID)');
     qActiv.sql.Add('WHERE (A.ID = E.AnimalID)');
     if NOT cbIncludeBulls.Checked then
        begin
            qActiv.sql.Add('AND (A.Sex="Female")'); //SP 04/12/00 To exclude bull calves
            qActiv.sql.Add('AND (A.LactNo>0)');
        end;
     qActiv.sql.Add('AND (A.LactNo=E.AnimalLactNo)');
     qActiv.sql.Add('AND (A.AnimalDeleted=FALSE)');
     qActiv.sql.Add('AND (A.InHerd=FALSE)');
     qActiv.sql.Add('AND (E.EventType=' + IntToStr(CSaleDeathEvent) + ')');
     If ( FromDate.Date > 0 ) AND ( ToDate.Date > 0 ) then
        qActiv.SQL.Add(' AND (E.EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
     if ( Length(ComboHerd.Value) > 0 ) then
        qActiv.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ');
     qActiv.ExecSQL;
     qSales.SQL.Add('Select * from tActiv where (RecordType= ' + IntToStr(CSaleDeathEvent) + ')');
     AddSort(qSales);
end;

procedure TfActiv.Purchases;
begin
     qActiv.sql.Clear;
     qActiv.sql.Add('INSERT INTO tActiv (AnimalID, HerdId, AnimalNo, LactNo, AnimalName, SortAnimalNo, NatID, SortNatID, EventDate, EventDesc, RecordType )');
     qActiv.sql.Add('SELECT A.ID, A.HerdID, A.AnimalNo, A.LactNo, A.Name, A.SortAnimalNo, A.NatIDNum, A.SortNatID, E.EventDate, E.Eventdesc, CAST(' + IntToStr(CPurchaseEvent) + ' AS INTEGER) FROM');
     qActiv.sql.Add('Animals A, Events E');
     qActiv.sql.Add('LEFT JOIN Purchases C ON ( C.EventID=Events.ID)');
     qActiv.sql.Add('WHERE (A.ID=E.AnimalID)');
     qActiv.sql.Add(' AND (A.Sex="Female")');
     qActiv.sql.Add(' AND (A.AnimalDeleted=FALSE)');
     qActiv.sql.Add(' AND (A.LactNo=E.AnimalLactNo)');
     qActiv.sql.Add(' AND (A.InHerd=TRUE)');
     qActiv.sql.Add(' AND (E.EventType=' + IntToStr(CPurchaseEvent) + ')');
     if ( FromDate.Date > 0 ) AND ( ToDate.Date > 0 ) then
        qActiv.SQL.Add(' AND (E.EventDate Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
     if ( Length(ComboHerd.Value) > 0 ) then
        qActiv.SQL.ADD(' AND ( A.HerdID = "' + ComboHerd.Value + '" ) ');
     qActiv.ExecSQL;
     qPurchases.SQL.Add('SELECT * FROM tActiv WHERE (RecordType= ' + IntToStr(CPurchaseEvent) + ')');
     AddSort(qPurchases);
end;

procedure TfActiv.AddSort(QueryToAddTo : TQuery);
begin
   // Add the Sort by to the relevant Query
   case rgSortBy.ItemIndex of
      0 : begin // Sort By Animal No
             QueryToAddTo.SQL.ADD('ORDER BY SortAnimalNo');       //, SortAnimalNo
             SortLabel.Caption := 'Ordered By Animal Number';
          end;
      1 : begin //Sort By national ID
             QueryToAddTo.SQL.ADD('ORDER BY SortNatID');
             SortLabel.Caption := 'Ordered By National ID Number';
          end;
      2 : begin // Sort By Purchase Date
             QueryToAddTo.SQL.ADD('ORDER BY EventDate');
             SortLabel.Caption := 'Ordered By Event Date';
          end;
      3 : begin // Sort By Purchase Date
             QueryToAddTo.SQL.ADD('ORDER BY LactNo');
             SortLabel.Caption := 'Ordered By Lactation Number';
          end;
   end;
   // Add the Sort Order to the relevant Query
   case rgSortOrder.ItemIndex of
      0 : begin
             QueryToAddTo.SQL.Add('Asc');
             OrderLabel.Caption := 'In Ascending Order';
          end;
      1 : begin
             QueryToAddTo.SQL.Add('Desc');//desceding
             OrderLabel.Caption := 'In Descending Order';
          end;
   end;
end;

procedure TfActiv.SetDateRanges;
begin
    if ( FromDate.Date > 0 ) and ( ToDate.Date > 0 ) then
       begin
          ServiceDateRange.Caption := 'Date From : ' + FormatDateTime(cIrishDateStyle,FromDate.Date) +
                                ' To : ' + FormatDateTime(cIrishDateStyle,ToDate.Date);
          CalvingDateRange.Caption := 'Date From : ' + FormatDateTime(cIrishDateStyle,FromDate.Date) +
                                ' To : ' + FormatDateTime(cIrishDateStyle,ToDate.Date);
          PurchasesDateRange.Caption := 'Date From : ' + FormatDateTime(cIrishDateStyle,FromDate.Date) +
                                ' To : ' + FormatDateTime(cIrishDateStyle,ToDate.Date);
          SaleDeathDateRange.Caption := 'Date From : ' + FormatDateTime(cIrishDateStyle,FromDate.Date) +
                                ' To : ' + FormatDateTime(cIrishDateStyle,ToDate.Date);
          DryingOffDateRange.Caption := 'Date From : ' + FormatDateTime(cIrishDateStyle,FromDate.Date) +
                                ' To : ' + FormatDateTime(cIrishDateStyle,ToDate.Date);
       end;
end;

procedure TfActiv.sbViewClick(Sender: TObject);
begin
   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;
   sbView.Enabled := False;
   sbPrint.Enabled := False;

   try
      MyTable := TTable.Create(nil);
      CreateActivTable;// call the table create

      VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK


      qCalvings.SQL.Clear;
      qService.SQL.Clear;
      qDryingOff.SQL.Clear;
      qSales.SQL.Clear;
      qPurchases.SQL.Clear;

      qCalvings.Close;
      qService.Close;
      qDryingOff.Close;
      qSales.Close;
      qPurchases.Close;

      // Gets all other data to be associated with an animal
      // Insert Relevant records
      if cbServiceRpt.Checked then
         begin
           Calvings;
           Services;
           DryingOff;
           SalesDeaths;
           Purchases;
         end
      else
         begin
           Calvings;
           DryingOff;
           SalesDeaths;
           Purchases;
         end;
      // Report Control Query
      with qActiv do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT HERDID FROM tActiv');
            Open;
         end;
      if cbServiceRpt.Checked then
         begin
            qCalvings.Open;  // Open All the Queries if Service Cb is checked
            qService.Open;
            qDryingOff.Open;
            qSales.Open;
            qPurchases.Open;
         end
      else
         begin
           // Open All the Queries
           qCalvings.Open;
           qDryingOff.Open;
           qSales.Open;
           qPurchases.Open;
         end;

      // Set the Date ranges into heading
      SetDateRanges;

      if ( Sender as TRxSpeedButton ).Name = 'sbView' then
         begin
              QRSubCalving.Font.color := clNavy;
              QRSubServices.Font.color := clNavy;
              QRSubDryingOff.Font.color := clNavy;
              QRSubSalesDeaths.Font.color := clNavy;
              QRSubPurchases.Font.color := clNavy;
              ActivScr.Preview;
         End
      else
          begin
               QRSubCalving.Font.color := ClBlack;
               QRSubServices.Font.color := ClBlack;
               QRSubDryingOff.Font.color := ClBlack;
               QRSubSalesDeaths.Font.color := ClBlack;
               QRSubPurchases.Font.color := ClBlack;
               Windata.CallPrintDialog(ActivScr);
          End;
   finally
      MyTable.Close;
      MyTable.DeleteTable;
      MyTable.Free;
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;
end;

procedure TfActiv.sbExitClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

procedure TfActiv.FormShow(Sender: TObject);
var Today : Shortstring;
begin
   with qLastMilkDate do
      begin
         Open;
         if RecordCount > 0 then
            FromDate.Date := FieldByName('LastRec').AsDateTime
         else
            FromDate.Date := Now();
         Close;
      end;

    Today := DateToStr(Date);
    ToDate.Text := FormatDateTime(cIrishDateStyle,StrToDate(Today));
    ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);

    //   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
    cbFavourite.Checked := WinData.IsReportFavourite(cRecentActListRep);
    WinData.UpdateRecentReportUsage(cRecentActListRep);
end;

procedure TfActiv.ActivScrBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
     RecordTypeNo := -1;
end;

procedure TfActiv.LSaleOrDeathPrint(sender: TObject; var Value: String);
begin
    if ( Value = 'True' ) then
       Value := 'Sale'
    else
       Value := 'Death';
end;

procedure TfActiv.QRSubServicesBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   LastService,
   PriorService : TDateTime;
   ServInt      : Double;
begin
    LastService  := 0;
    PriorService := 0;
    ServInt      := 0;
    BullCode.Caption := '';
    BullName.Caption := '';
    // Before printing you need to get the Last Service Date and
    // All relevant service info for this Animal.
    WinData.CheckEvents.Filter := '(ID =  ' + IntToStr(qService.FieldByName('EventID').AsInteger) + ') And (AnimalLactNo = ' + IntToStr(qService.FieldByName('LactNo').AsInteger) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
    WinData.CheckEvents.Filtered := True;
    WinData.CheckEvents.Last;  // go to Last Record
    if NOT WinData.CheckEvents.BOF then
       begin
           LastService := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
           Windata.CheckEvents.Prior;
           if NOT WinData.CheckEvents.BOF then
              begin
                 PriorService := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                 ServInt := (LastService-PriorService);
              end;
       end;

    NoServes.Caption := IntToStr(WinData.CheckEvents.RecordCount);
    ServiceInt.Caption := FloatToStr(ServInt);
    if LastService > 0 then
       ServiceDate.Caption := FormatDateTime('dd/mm/yy',LastService)
    else
       ServiceDate.Caption := '';

    WinData.CheckEvents.First;
    while not WinData.CheckEvents.Eof do
       begin
          if WinData.CheckEvents.FieldByName('ID').AsInteger = qService.FieldByName('EventID').AsInteger then
             begin
                // get the bull used for this service.
                if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                   if WinData.LookUpDamSire.Locate('ID',WinData.LookUpServices.FieldByName('ServiceBull').AsInteger,[] ) then
                      begin
                         BullCode.Caption := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                         BullName.Caption := WinData.LookUpDamSire.FieldByName('Name').AsString;
                      end;
             end;
          WinData.CheckEvents.Next;
       end;

    WinData.CheckEvents.Filter := '';
    WinData.CheckEvents.Filtered := FALSE;
end;

procedure TfActiv.Button1Click(Sender: TObject);
begin
   uCowEnrolFilt.ShowForm;
end;

procedure TfActiv.FormActivate(Sender: TObject);
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

procedure TfActiv.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TfActiv.FormDestroy(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   14/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfActiv.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cRecentActListRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cRecentActListRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
