unit uMoveNotify;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXSpin, dbTables, quickrpt, Qrctrls, Db,
  Grids, DBGrids, RXDBCtrl, DBCtrls, RXLookup, RXCtrls, ComCtrls, ToolWin,
  EanDBQr, Menus, EanQr;

type
  TfMoveNotify = class(TForm)
    MyQuery: TQuery;
    AnimalGrid: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    Panel2: TPanel;
    Label7: TLabel;
    Herd: TRxDBLookupCombo;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    sbPrintForms: TRxSpeedButton;
    sbViewForms: TRxSpeedButton;
    HerdQuery: TQuery;
    dsHerdQuery: TDataSource;
    datasource1: TDataSource;
    qrMoveNotify: TQuickRep;
    HeadBox: TQRShape;
    lFormHead1: TQRLabel;
    lFormHead2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRImage1: TQRImage;
    QRImage3: TQRImage;
    QRLabel6: TQRLabel;
    lForm: TQRLabel;
    l11: TQRLabel;
    l12: TQRLabel;
    lFormID: TQRLabel;
    lBrass: TQRLabel;
    lPlastic: TQRLabel;
    l2a1: TQRLabel;
    l2a2: TQRLabel;
    l2b1: TQRLabel;
    l2b2: TQRLabel;
    lTick1: TQRLabel;
    QRLabel19: TQRLabel;
    lTick2: TQRLabel;
    QRLabel21: TQRLabel;
    lTick3: TQRLabel;
    lTick4: TQRLabel;
    lDateMove: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    Tick1: TQRImage;
    Tick2: TQRImage;
    Tick3: TQRImage;
    lSupplies: TQRLabel;
    Footnote1: TQRLabel;
    Footnote2: TQRLabel;
    Footnote3: TQRLabel;
    Footnote4: TQRLabel;
    Footnote5: TQRLabel;
    samplebox16: TQRShape;
    samplebox1: TQRShape;
    samplebox17: TQRShape;
    samplebox18: TQRShape;
    samplebox19: TQRShape;
    samplebox20: TQRShape;
    samplebox23: TQRShape;
    samplebox26: TQRShape;
    samplebox22: TQRShape;
    samplebox21: TQRShape;
    samplebox25: TQRShape;
    samplebox12: TQRShape;
    samplebox24: TQRShape;
    samplebox2: TQRShape;
    samplebox3: TQRShape;
    samplebox4: TQRShape;
    samplebox5: TQRShape;
    samplebox6: TQRShape;
    samplebox7: TQRShape;
    samplebox8: TQRShape;
    samplebox9: TQRShape;
    samplebox10: TQRShape;
    samplebox11: TQRShape;
    samplebox27: TQRShape;
    Sample1: TQRLabel;
    Sample2: TQRLabel;
    Sample3: TQRLabel;
    Sample4: TQRLabel;
    Sample5: TQRLabel;
    Sample6: TQRLabel;
    Sample7: TQRLabel;
    Sample8: TQRLabel;
    Sample9: TQRLabel;
    Sample13: TQRLabel;
    Sample14: TQRLabel;
    Sample15: TQRLabel;
    Sample16: TQRLabel;
    Sample17: TQRLabel;
    Sample18: TQRLabel;
    Sample19: TQRLabel;
    Sample20: TQRLabel;
    Sample21: TQRLabel;
    bSupplies: TQRShape;
    SampleBox13: TQRShape;
    samplebox14: TQRShape;
    samplebox28: TQRShape;
    samplebox29: TQRShape;
    samplebox15: TQRShape;
    Sample23: TQRImage;
    samplebox30: TQRShape;
    Sample24: TQRImage;
    sample10: TQRImage;
    QRShape72: TQRShape;
    QRShape75: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    lDeclaration1: TQRLabel;
    lDeclaration2: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    l4a: TQRLabel;
    l4b: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape61: TQRShape;
    QRShape70: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel40: TQRLabel;
    Sample12: TQRLabel;
    Sample22: TQRLabel;
    Sample11: TQRLabel;
    QRShape137: TQRShape;
    QRShape138: TQRShape;
    QRImage10: TQRImage;
    QRShape73: TQRShape;
    QRImage7: TQRImage;
    QRShape15: TQRShape;
    alMale: TQRLabel;
    alFemale: TQRLabel;
    alDead: TQRLabel;
    aMale: TQRImage;
    aFemale: TQRImage;
    aDead: TQRImage;
    aDeadBox: TQRShape;
    QRShape48: TQRShape;
    QRShape47: TQRShape;
    QRShape46: TQRShape;
    a14: TQRLabel;
    QRShape44: TQRShape;
    a13: TQRLabel;
    QRShape45: TQRShape;
    a12: TQRLabel;
    QRShape43: TQRShape;
    a11: TQRLabel;
    QRShape42: TQRShape;
    a10: TQRLabel;
    QRShape40: TQRShape;
    a9: TQRLabel;
    QRShape41: TQRShape;
    a8: TQRLabel;
    QRShape39: TQRShape;
    a7: TQRLabel;
    QRShape38: TQRShape;
    a6: TQRLabel;
    QRShape37: TQRShape;
    a5: TQRLabel;
    QRShape36: TQRShape;
    a4: TQRLabel;
    QRShape35: TQRShape;
    a3: TQRLabel;
    QRShape34: TQRShape;
    a2: TQRLabel;
    QRShape33: TQRShape;
    a1: TQRLabel;
    dy1: TQRLabel;
    dy2: TQRLabel;
    m1: TQRLabel;
    m2: TQRLabel;
    y1: TQRLabel;
    y2: TQRLabel;
    y3: TQRLabel;
    y4: TQRLabel;
    HerdNum: TQRLabel;
    QRShape103: TQRShape;
    QRShape102: TQRShape;
    b2: TQRLabel;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    b14: TQRLabel;
    b13: TQRLabel;
    b12: TQRLabel;
    b11: TQRLabel;
    b10: TQRLabel;
    b9: TQRLabel;
    b8: TQRLabel;
    b7: TQRLabel;
    b6: TQRLabel;
    b5: TQRLabel;
    b4: TQRLabel;
    b3: TQRLabel;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    bDeadBox: TQRShape;
    b1: TQRLabel;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    c14: TQRLabel;
    c13: TQRLabel;
    c12: TQRLabel;
    c11: TQRLabel;
    c10: TQRLabel;
    c9: TQRLabel;
    c8: TQRLabel;
    c7: TQRLabel;
    c6: TQRLabel;
    c5: TQRLabel;
    c4: TQRLabel;
    c3: TQRLabel;
    c2: TQRLabel;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    cDeadBox: TQRShape;
    c1: TQRLabel;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    d14: TQRLabel;
    d13: TQRLabel;
    d12: TQRLabel;
    d11: TQRLabel;
    d10: TQRLabel;
    d9: TQRLabel;
    d8: TQRLabel;
    d7: TQRLabel;
    d6: TQRLabel;
    d5: TQRLabel;
    d4: TQRLabel;
    d3: TQRLabel;
    d2: TQRLabel;
    d1: TQRLabel;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    dDeadBox: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape74: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    eDeadBox: TQRShape;
    e14: TQRLabel;
    e13: TQRLabel;
    e12: TQRLabel;
    e11: TQRLabel;
    e10: TQRLabel;
    e9: TQRLabel;
    e8: TQRLabel;
    e7: TQRLabel;
    e6: TQRLabel;
    e5: TQRLabel;
    e4: TQRLabel;
    e3: TQRLabel;
    e2: TQRLabel;
    e1: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    elDead: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    clDead: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    blDead: TQRLabel;
    eMale: TQRImage;
    eFemale: TQRImage;
    eDead: TQRImage;
    dMale: TQRImage;
    dFemale: TQRImage;
    dDead: TQRImage;
    cMale: TQRImage;
    cFemale: TQRImage;
    cDead: TQRImage;
    bMale: TQRImage;
    bFemale: TQRImage;
    bDead: TQRImage;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    dlDead: TQRLabel;
    QRImage11: TQRImage;
    lCopyLabel: TQRLabel;
    FootNote6: TQRLabel;
    FootNote7: TQRLabel;
    l13: TQRLabel;
    ToolButton6: TToolButton;
    sbGetAnimals: TRxSpeedButton;
    qrdbVenBarCode: TQrDBEan;
    ToolButton4: TToolButton;
    lSample: TQRLabel;
    ToolButton1: TToolButton;
    sbAllocation: TRxSpeedButton;
    QRLabel1: TQRLabel;
    QRBand1: TQRBand;
    procedure ExitBtnClick(Sender: TObject);
    procedure HerdChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbPrintFormsClick(Sender: TObject);
    procedure HerdCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrMoveNotifyBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure sbGetAnimalsClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure qrMoveNotifyStartPage(Sender: TCustomQuickRep);
    procedure MyTableBeforeDelete(DataSet: TDataSet);
    procedure sbAllocationClick(Sender: TObject);
  private
    { Private declarations }
    MyDataSource : TDataSource;
    MyTable : TTable;
    procedure BuildTable;
    procedure BuildForm(Print : Boolean);
  public
    { Public declarations }
  end;

Procedure ShowForm;

implementation
uses
    GenTypesConst,
    DairyData,
    uCMMSAlloc;

var
   WhichReg     : TCountry;
   saveposition : Tbookmark;
   MoreRecs,
   FormView     : Boolean;
   FormNo       : integer;

{$R *.DFM}

Procedure ShowForm;
begin
   with TfMoveNotify.Create(nil) do
      try
         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := WinData.KingData.DatabaseName;
         MyTable.TableType := ttParadox;
         MyTable.TableName := 'MoveNotify';
         MyTable.FieldDefs.Clear;

         MyTable.FieldDefs.Add('ID',ftAutoInc,0,FALSE);
         MyTable.FieldDefs.Add('EventID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('EventDate',ftDate,0,FALSE);
         MyTable.FieldDefs.Add('Sold',ftBoolean,0,FALSE);
         MyTable.FieldDefs.Add('CustomerID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('Customer',ftString,30,FALSE);  
         MyTable.FieldDefs.Add('AnimalID',ftInteger,0,FALSE);

         MyTable.FieldDefs.Add('HerdID',ftInteger,0,FALSE);
         MyTable.FieldDefs.Add('Notified',ftBoolean,0,FALSE);
         MyTable.FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         MyTable.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
         MyTable.FieldDefs.Add('SortNatID',ftString,20,FALSE);

         MyTable.FieldDefs.Add('SaleDeath',ftString,5,FALSE);
         MyTable.FieldDefs.Add('Sex',ftString,10,FALSE);
         MyTable.FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);

         MyTable.IndexDefs.Clear;
         MyTable.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
         MyTable.IndexDefs.Add('iEventDate','EventDate;CustomerID',[ixCaseInsensitive]);  //KVB  11/09/2000

         MyTable.CreateTable;
         MyTable.IndexName := 'iEventDate';

         MyTable.BeforeDelete := MyTableBeforeDelete;

         MyTable.CreateTable;
         MyTable.Open;

         MyDataSource := TDataSource.Create(nil);

         MyDataSource.DataSet := MyTable;
         AnimalGrid.DataSource := MyDataSource;
         Herd.Value := IntToStr(WinData.UserDefaultHerdID);
         ShowModal;
      finally
         MyTable.Close;
         MyTable.DeleteTable;
         MyTable.Free;

         MyDataSource.Free;
         Free;
      end;
end;

procedure TfMoveNotify.ExitBtnClick(Sender: TObject);
begin
   Close;
end;

procedure TfMoveNotify.BuildTable;
begin
   try
      MyTable.DisableControls;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('DELETE FROM MoveNotify');
      MyQuery.ExecSQL;
      with MyQuery do
         begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO MoveNotify ( EventID, EventDate, Sold, CustomerID, Customer, AnimalID )');   //KVB  11/09/2000
            SQL.Add('SELECT S.EventID, E.EventDate, S.Sold, S.Customer, C.Name, E.AnimalID');       //KVB  11/09/2000
            SQL.Add('FROM "SalesDeaths.DB" S, "Customers.DB" C');
            SQL.Add('LEFT JOIN "Events.db" E ON(E.ID = S.EventID)');
            SQL.Add('WHERE (S.Notified = False)');
            SQL.Add('AND (C.ID = S.Customer)');  
            ExecSQL;
            SQL.Clear;
            SQL.Add('DELETE FROM MoveNotify');
            SQL.Add('WHERE MoveNotify.AnimalID NOT In');
            SQL.Add('(SELECT ID FROM Animals)');
            ExecSQL;
            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortNatId, Sold, CustomerID, Customer, EventDate,');  //KVB  11/09/2000
            SQL.Add('       PrimaryBreed, Sex, DateOfBirth, HerdID');
            SQL.Add('FROM Animals A, MoveNotify M');
            SQL.Add('WHERE (M.AnimalID=A.ID)');
            //SQL.Add('ORDER BY EventDate ASC');     
            SQL.Add('ORDER BY EventDate,CustomerID ASC'); 
            Open;
            First;
            while NOT EOF do
               begin
                  if MyTable.Locate('AnimalID',FieldByName('ID').Value,[] ) then
                     begin
                        MyTable.Edit;
                        MyTable.FieldByName('NatIdNum').AsString := FieldByName('NatIDNum').AsString;
                        MyTable.FieldByName('SortNatId').AsString := FieldByName('SortNatID').AsString;
                        MyTable.FieldByName('HerdID').AsInteger := FieldByName('HerdID').AsInteger;
                        MyTable.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                        if FieldByName('Sold').AsBoolean then
                           MyTable.FieldByName('SaleDeath').AsString := 'Sale'
                        else
                           MyTable.FieldByName('SaleDeath').AsString := 'Death';
                        MyTable.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                        MyTable.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                        MyTable.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                        MyTable.Post;
                     end;
                  Next;
               end;
         end;
      // if herd chosen - delete non-herd animals
      if Herd.Value <> '0' then
         with MyQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM MoveNotify');
               SQL.Add('WHERE HerdID <> ' + Herd.Value );
               ExecSQL;
            end;
   finally
      MyTable.EnableControls;
      MyTable.Refresh;
      AnimalGrid.SelectedRows.Clear;
   end;
end;

procedure TfMoveNotify.HerdChange(Sender: TObject);
begin
   BuildTable;
end;

procedure TfMoveNotify.FormActivate(Sender: TObject);
begin
   Update;
   Refresh;
   if Herd.value = '' then
      Herd.Value := IntToStr(WinData.UserDefaultHerdID);
   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,Herd.Value);
//   BuildTable;
end;

procedure TfMoveNotify.sbPrintFormsClick(Sender: TObject);
var
   MoveDate : TdateTime;
   Cust : integer;  //KVB  11/09/2000
   i : integer;
   IDNum : Integer;  //KVB 11/09/2000
begin
   // check if enough forms
   Windata.CMMS.Last;
   if (WinData.CMMS.FieldByName('CMMSAllocation').AsInteger > 0) or
      ((Sender as TRxSpeedButton).Name = 'sbViewForms') then
      begin
         // first animal
         MyTable.First;
         MyQuery.Close;
         while NOT MyTable.EOF do
            begin
               // if query empty, get new set
               if ((MyQuery.EOF) or (NOT MyQuery.Active)) then
                  begin
                     MoveDate := MyTable.FieldByName('EventDate').AsDateTime;
                     Cust := MyTable.FieldByName('CustomerID').AsInteger;  //KVB  11/09/2000
                     with MyQuery do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT * FROM MoveNotify');
                           SQL.Add('WHERE (EventDate = "' + FormatDateTime('mm/dd/yyyy',MoveDate) + '")');
                           //KVB  Need to select only those animals sold on a specific day to a specific customer.
                           SQL.Add('AND (CustomerID = ' + IntToStr(Cust) + ')');   //KVB  11/09/2000
                           open;
                           First;
                        end;
                  end;
               MyTable.Locate('ID',MyQuery.FieldByName('ID').AsInteger,[]);
               // view form
               if ( Sender as TRxSpeedButton ).Name = 'sbViewForms' then
                  begin
                     FormView := True;
                     qrMoveNotify.Preview;
                  end
               // print form
               else
                  begin
                     FormView := False;
                     WinData.CMMS.Last;
                     IDNum := MyTable.FieldByName('ID').AsInteger;  //KVB 11/09/2000
                     for i := 1 to 4 do
                        begin      //KVB Need to go back to first animal on the form for each iteration after the first
                           FormNo := i;
                           qrMoveNotify.Print;
                           If i <> 4 then                      //KVB  11/09/2000
                              Begin                            //KVB  11/09/2000
                                   MyTable.Locate('ID',IDNum,[]);   //KVB   11/09/2000
                                   MyQuery.Locate('ID',IDNum,[]);   //KVB   11/09/2000
                              end;                                  //KVB   11/09/2000
                        end;
                     with WinData.CMMS do
                        begin
                           FindLast;
                           edit;
                           FieldByName('CMMSAllocation').AsInteger := FieldByName('CMMSAllocation').AsInteger - 1;
                           FieldByName('CurrCMMSNo').AsFloat       := FieldByName('CurrCMMSNo').AsFloat + 1;
                           post;
                        end;
                  end;
               // set table to next animal
               if MoreRecs then
                  MyQuery.gotobookmark(saveposition);
            end;
         if ( Sender as TRxSpeedButton ).Name = 'sbPrintForms' then
            if MessageDLG('Mark the Animals as Notified',mtWarning,[mbYes,MbNo],0) = mrYes then
               begin
                  with MyQuery do
                     begin
                        SQL.Clear;
                        SQL.Add('UPDATE SalesDeaths');
                        SQL.Add('SET Notified=TRUE');
                        SQL.Add('WHERE EventID IN (SELECT EventID FROM MoveNotify)');
                        ExecSQL;
                     end;
                  BuildTable;
               end;
      end
   else
      messagedlg('You currently have no allocation of CMMS forms -'+#13+
                 'Please contact Kingswood.',mtWarning,[mbOK],0);
end;

procedure TfMoveNotify.HerdCloseUp(Sender: TObject);
begin
   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,Herd.Value);
end;

procedure TfMoveNotify.FormShow(Sender: TObject);
begin
   qrMoveNotify.hide;
   WinData.CMMS.Last;
   if ((WinData.CMMS.FieldByName('CMMSAllocation').AsInteger < 4) and
       (WinData.CMMS.FieldByName('CMMSAllocation').AsInteger > 0)) then
      messagedlg('You only have '+IntToStr(WinData.CMMS.FieldByName('CMMSAllocation').AsInteger)+
                 ' forms left.',mtInformation,[mbOK],0)
   else
   if (WinData.CMMS.FieldByName('CMMSAllocation').AsInteger = 0) then
      messagedlg('You have NO form allocations left.',mtInformation,[mbOK],0);
end;

procedure TfMoveNotify.qrMoveNotifyBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TempDate : String;
begin
   if FormView then
      begin
         qrdbVenBarCode.Font.Size  := 24;
         qrdbVenBarCode.BarCode    := 'SAMPLE';
         lSample.Caption           := 'SAMPLE';
      end
   else
      begin
         qrdbVenBarCode.Font.Size  := 8;
         lSample.Caption           := '';
      end;
   // initialise nat id labels
   a1.Caption  := '';   a2.Caption  := '';   a3.Caption  := '';   a4.Caption  := '';
   a5.Caption  := '';   a6.Caption  := '';   a7.Caption  := '';   a8.Caption  := '';
   a9.Caption  := '';   a10.Caption := '';   a11.Caption := '';   a12.Caption := '';
   a13.Caption := '';   a14.Caption := '';
   b1.Caption  := '';   b2.Caption  := '';   b3.Caption  := '';   b4.Caption  := '';
   b5.Caption  := '';   b6.Caption  := '';   b7.Caption  := '';   b8.Caption  := '';
   b9.Caption  := '';   b10.Caption := '';   b11.Caption := '';   b12.Caption := '';
   b13.Caption := '';   b14.Caption := '';
   c1.Caption  := '';   c2.Caption  := '';   c3.Caption  := '';   c4.Caption  := '';
   c5.Caption  := '';   c6.Caption  := '';   c7.Caption  := '';   c8.Caption  := '';
   c9.Caption  := '';   c10.Caption := '';   c11.Caption := '';   c12.Caption := '';
   c13.Caption := '';   c14.Caption := '';
   d1.Caption  := '';   d2.Caption  := '';   d3.Caption  := '';   d4.Caption  := '';
   d5.Caption  := '';   d6.Caption  := '';   d7.Caption  := '';   d8.Caption  := '';
   d9.Caption  := '';   d10.Caption := '';   d11.Caption := '';   d12.Caption := '';
   d13.Caption := '';   d14.Caption := '';
   e1.Caption  := '';   e2.Caption  := '';   e3.Caption  := '';   e4.Caption  := '';
   e5.Caption  := '';   e6.Caption  := '';   e7.Caption  := '';   e8.Caption  := '';
   e9.Caption  := '';   e10.Caption := '';   e11.Caption := '';   e12.Caption := '';
   e13.Caption := '';   e14.Caption := '';
   // initialise tick labels
   aMale.width := 0;  aFemale.width := 0;  aDead.width := 0;
   bMale.width := 0;  bFemale.width := 0;  bDead.width := 0;
   cMale.width := 0;  cFemale.width := 0;  cDead.width := 0;
   dMale.width := 0;  dFemale.width := 0;  dDead.width := 0;
   eMale.width := 0;  eFemale.width := 0;  eDead.width := 0;
   // enter date
   { SP 04/02/2003 Change for Date of movement or death. Insert todays date.}
{  dy1.caption := copy(Animalgrid.Columns[0].Field.AsString,1,1);
   dy2.caption := copy(Animalgrid.Columns[0].Field.AsString,2,1);
   m1.caption  := copy(Animalgrid.Columns[0].Field.AsString,4,1);
   m2.caption  := copy(Animalgrid.Columns[0].Field.AsString,5,1);
   y1.caption  := '2';
   y2.caption  := '0';
   y3.caption  := copy(Animalgrid.Columns[0].Field.AsString,7,1);
   y4.caption  := copy(Animalgrid.Columns[0].Field.AsString,8,1);
}
   TempDate := FormatDateTime('ddmmyyyy',Date);

   dy1.caption := copy(TempDate,1,1);
   dy2.caption := copy(TempDate,2,1);
   m1.caption  := copy(TempDate,3,1);
   m2.caption  := copy(TempDate,4,1);
   y1.caption  := copy(TempDate,5,1);
   y2.caption  := copy(TempDate,6,1);
   y3.caption  := copy(TempDate,7,1);
   y4.caption  := copy(TempDate,8,1);

   { SP 04/02/2003 Change for Date of movement or death. Insert todays date.}


   // enter herd number
   HerdNum.Caption := Herd.DisplayValue;
   // add animal details
   BuildForm(True);
end;

procedure  TfMoveNotify.BuildForm(Print : Boolean);
Var
   NewSt,
   st :string;
begin
         // reset bookmark
         MoreRecs := False;  //KVB I do not think this should be here - consider next page of animals - control further up
         // ANIMAL 1
         // assign string to variable & strip spaces
         NewSt := MyTable.FieldByname('NatIDNum').AsString;
         St:= Windata.StripAllSpaces(NewSt);
         a1.Caption  := Copy(st, 1, 1);    a2.Caption  := Copy(st, 2, 1);
         a3.Caption  := Copy(st, 3, 1);    a4.Caption  := Copy(st, 4, 1);
         a5.Caption  := Copy(st, 5, 1);    a6.Caption  := Copy(st, 6, 1);
         a7.Caption  := Copy(st, 7, 1);    a8.Caption  := Copy(st, 8, 1);
         a9.Caption  := Copy(st, 9, 1);    a10.Caption := Copy(st, 10, 1);
         a11.Caption := Copy(st, 11, 1);   a12.Caption := Copy(st, 12, 1);
         a13.Caption := Copy(st, 13, 1);   a14.Caption := Copy(st, 14, 1);
         // check if sale or death
         if Animalgrid.Columns[5].Field.AsString = 'Sale' then
            begin
               aDead.width := 0;
               aDead.Left := 579;
            end
         else
            begin
               aDead.width := 34;
               aDead.Left := 579;
            end;
         // check if male/female
         if Animalgrid.Columns[3].Field.AsString = 'Female' then
            begin
               aMale.width := 0;
               aFemale.width := 17;
            end
         else
            begin
               aMale.width := 17;
               aFemale.width := 0;
            end;
         // next animal
         MyQuery.Next;
         MyTable.Next;
         // ANIMAL 2
         // next animal
         if NOT MyQuery.EOF then
            begin
               // assign string to variable & strip spaces
               NewSt := MyTable.FieldByname('NatIDNum').AsString;
               St:= Windata.StripAllSpaces(NewSt);
               b1.Caption  := Copy(st, 1, 1);    b2.Caption  := Copy(st, 2, 1);
               b3.Caption  := Copy(st, 3, 1);    b4.Caption  := Copy(st, 4, 1);
               b5.Caption  := Copy(st, 5, 1);    b6.Caption  := Copy(st, 6, 1);
               b7.Caption  := Copy(st, 7, 1);    b8.Caption  := Copy(st, 8, 1);
               b9.Caption  := Copy(st, 9, 1);    b10.Caption := Copy(st, 10, 1);
               b11.Caption := Copy(st, 11, 1);   b12.Caption := Copy(st, 12, 1);
               b13.Caption := Copy(st, 13, 1);   b14.Caption := Copy(st, 14, 1);
               // check if sale or death
               if Animalgrid.Columns[5].Field.AsString = 'Sale' then
                  begin
                     bDead.width := 0;
                     bDead.Left := 579;
                  end
               else
                  begin
                     bDead.width := 34;
                     bDead.Left := 579;
                  end;
               // check if male/female
               if Animalgrid.Columns[3].Field.AsString = 'Female' then
                  begin
                     bMale.width := 0;
                     bFemale.width := 17;
                  end
               else
                  begin
                     bMale.width := 17;
                     bFemale.width := 0;
                  end;
               // next animal
               MyQuery.Next;
               MyTable.Next;
               // ANIMAL 3
               // next animal
               if NOT MyQuery.EOF then
                  begin
                     // assign string to variable & strip spaces
                     NewSt := MyTable.FieldByname('NatIDNum').AsString;
                     St:= Windata.StripAllSpaces(NewSt);
                     c1.Caption  := Copy(st, 1, 1);    c2.Caption  := Copy(st, 2, 1);
                     c3.Caption  := Copy(st, 3, 1);    c4.Caption  := Copy(st, 4, 1);
                     c5.Caption  := Copy(st, 5, 1);    c6.Caption  := Copy(st, 6, 1);
                     c7.Caption  := Copy(st, 7, 1);    c8.Caption  := Copy(st, 8, 1);
                     c9.Caption  := Copy(st, 9, 1);    c10.Caption := Copy(st, 10, 1);
                     c11.Caption := Copy(st, 11, 1);   c12.Caption := Copy(st, 12, 1);
                     c13.Caption := Copy(st, 13, 1);   c14.Caption := Copy(st, 14, 1);
                     // check if sale or death
                     if Animalgrid.Columns[5].Field.AsString = 'Sale' then
                        begin
                           cDead.width := 0;
                           cDead.Left := 579;
                        end
                     else
                        begin
                           cDead.width := 34;
                           cDead.Left := 579;
                        end;
                     // check if male/female
                     if Animalgrid.Columns[3].Field.AsString = 'Female' then
                        begin
                           cMale.width := 0;
                           cFemale.width := 17;
                        end
                     else
                        begin
                           cMale.width := 17;
                           cFemale.width := 0;
                        end;
                     // next animal
                     MyQuery.Next;
                     MyTable.Next;
                     // ANIMAL 4
                     // next animal
                     if NOT MyQuery.EOF then
                        begin
                           // assign string to variable & strip spaces
                           NewSt := MyTable.FieldByname('NatIDNum').AsString;
                           St:= Windata.StripAllSpaces(NewSt);
                           d1.Caption  := Copy(st, 1, 1);    d2.Caption  := Copy(st, 2, 1);
                           d3.Caption  := Copy(st, 3, 1);    d4.Caption  := Copy(st, 4, 1);
                           d5.Caption  := Copy(st, 5, 1);    d6.Caption  := Copy(st, 6, 1);
                           d7.Caption  := Copy(st, 7, 1);    d8.Caption  := Copy(st, 8, 1);
                           d9.Caption  := Copy(st, 9, 1);    d10.Caption := Copy(st, 10, 1);
                           d11.Caption := Copy(st, 11, 1);   d12.Caption := Copy(st, 12, 1);
                           d13.Caption := Copy(st, 13, 1);   d14.Caption := Copy(st, 14, 1);
                           // check if sale or death
                           if Animalgrid.Columns[5].Field.AsString = 'Sale' then
                              begin
                                 dDead.width := 0;
                                 dDead.Left := 579;
                              end
                           else
                              begin
                                 dDead.width := 34;
                                 dDead.Left := 579;
                              end;
                           // check if male/female
                           if Animalgrid.Columns[3].Field.AsString = 'Female' then
                              begin
                                 dMale.width := 0;
                                 dFemale.width := 17;
                              end
                           else
                              begin
                                 dMale.width := 17;
                                 dFemale.width := 0;
                              end;
                           // next animal
                           MyQuery.Next;
                           MyTable.Next;
                           // ANIMAL 5
                           // next animal
                           if NOT MyQuery.EOF then
                              begin
                                 // assign string to variable & strip spaces
                                 NewSt := MyTable.FieldByname('NatIDNum').AsString;
                                 St:= Windata.StripAllSpaces(NewSt);
                                 e1.Caption  := Copy(st, 1, 1);    e2.Caption  := Copy(st, 2, 1);
                                 e3.Caption  := Copy(st, 3, 1);    e4.Caption  := Copy(st, 4, 1);
                                 e5.Caption  := Copy(st, 5, 1);    e6.Caption  := Copy(st, 6, 1);
                                 e7.Caption  := Copy(st, 7, 1);    e8.Caption  := Copy(st, 8, 1);
                                 e9.Caption  := Copy(st, 9, 1);    e10.Caption := Copy(st, 10, 1);
                                 e11.Caption := Copy(st, 11, 1);   e12.Caption := Copy(st, 12, 1);
                                 e13.Caption := Copy(st, 13, 1);   e14.Caption := Copy(st, 14, 1);
                                 // check if sale or death
                                 if Animalgrid.Columns[5].Field.AsString = 'Sale' then
                                    begin
                                       eDead.width := 0;
                                       eDead.Left := 579;
                                    end
                                 else
                                    begin
                                       eDead.width := 34;
                                       eDead.Left := 579;
                                    end;
                                 // check if male/female
                                 if Animalgrid.Columns[3].Field.AsString = 'Female' then
                                    begin
                                       eMale.width := 0;
                                       eFemale.width := 17;
                                    end
                                 else
                                    begin
                                       eMale.width := 17;
                                       eFemale.width := 0;
                                    end;
                                 // next animal
                                 MyQuery.Next;
                                 if NOT MyQuery.EOF then
                                    MoreRecs := True;
                                 MyTable.Next;
                                 SavePosition := MyQuery.GetBookmark;
                              end;
                        end;
                  end;
            end;
end;

procedure TfMoveNotify.sbGetAnimalsClick(Sender: TObject);
begin
   BuildTable;
end;

procedure TfMoveNotify.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('MoveNotify.htm');
end;

procedure TfMoveNotify.qrMoveNotifyStartPage(Sender: TCustomQuickRep);
begin
   if (FormView) or (FormNo = 1) then
      begin
         // remove text if previewing
         lCopyLabel.Caption := '';
         FootNote6.Caption  := '';
         FootNote7.Caption  := '';
         l13.Caption        := '';
         Footnote4 .Caption := '';
         //KVB Need to restore default values for when the set is printed out more than once.
         lForm.Caption      := 'OWNER''S/SELLER''S FORM';   //KVB 11/09/2000
         HeadBox.Width      := 261;       //KVB 11/09/2000
         lFormHead1.Caption := 'USE THIS FORM FOR:';  //KVB 11/09/2000
         lFormHead2.Caption := '(1) PRIVATE TRANSACTIONS 0R   (2) ON FARM DEATHS';  //KVB  11/09/2000
         l11.Caption := '1.  COMPLETE THIS FORM AND FORWARD WITHIN 7 DAYS OF MOVEMENT';  //KVB  11/09/2000
         l12.Caption        := 'DATE OR ON-FARM DEATH IN FREEPOST ENVELOPE PROVIDED.';  //KVB 11/09/2000
         l13.Caption        := '';  //KVB  11/09/2000
         lBrass.Caption     := 'SAMPLE BRASS TAG';  //KVB  11/09/2000
         lPlastic.Caption   := 'SAMPLE PLASTIC TAG';  //KVB  11/09/2000
         l2a1.Caption       := '2A. PLEASE ENTER THE EARTAG NUMBER OF EACH ANIMAL IN THE';  //KVB 11/09/2000
         l2a2.Caption       := 'SPACES PROVIDED USING THE SAMPLE FORMAT SHOWN ABOVE.';   //KVB  11/09/2000
         l2b1.Caption       := '2B. IF REPORTING ON FARM DEATH(S) PLEASE ENTER EARTAG';   //KVB 11/09/2000
         l2b2.Caption       := 'NUMBER(S) BELOW AND TICK THE ON FARM DEATH BOX.';   //KVB  11/09/2000
         Sample1.Caption    := 'A'; Sample2.Caption    := 'V';   //KVB  11/09/2000
         Sample3.Caption    := 'X'; Sample4.Caption    := '7';   //KVB  11/09/2000
         Sample5.Caption    := '6'; Sample6.Caption    := '5';   //KVB  11/09/2000
         Sample7.Caption    := '4'; Sample8.Caption    := '3';   //KVB  11/09/2000
         Sample9.Caption    := '2'; Sample10.Width     := 15;    //KVB  11/09/2000
         Sample11.Caption   := 'F'; Sample12.Caption   := 'DEAD';   //KVB  11/09/2000
         Sample13.Caption   := 'B'; Sample14.Caption   := 'W';   //KVB  11/09/2000
         Sample15.Caption   := 'C'; Sample16.Caption   := 'D';   //KVB  11/09/2000
         Sample17.Caption   := '7'; Sample18.Caption   := '6';   //KVB  11/09/2000
         Sample19.Caption   := '5'; Sample20.Caption   := '4';   //KVB  11/09/2000
         Sample21.Caption   := 'A'; Sample22.Caption   := 'M';   //KVB  11/09/2000
         Sample23.Width     := 15;  Sample24.Width     := 18;    //KVB  11/09/2000
         SampleBox1.Width  := 20; SampleBox2.Width  := 20;       //KVB  11/09/2000
         SampleBox3.Width  := 20; SampleBox4.Width  := 20;       //KVB  11/09/2000
         SampleBox5.Width  := 20; SampleBox6.Width  := 20;       //KVB  11/09/2000
         SampleBox7.Width  := 20; SampleBox8.Width  := 20;       //KVB  11/09/2000
         SampleBox9.Width  := 20; SampleBox10.Width := 20;;      //KVB  11/09/2000
         SampleBox11.Width := 20; SampleBox12.Width := 20;       //KVB  11/09/2000
         SampleBox13.Width := 20; SampleBox14.Width := 20;       //KVB  11/09/2000
         SampleBox15.Width := 27; SampleBox16.Width := 20;       //KVB  11/09/2000
         SampleBox17.Width := 20; SampleBox18.Width := 20;       //KVB  11/09/2000
         SampleBox19.Width := 20; SampleBox20.Width := 20;       //KVB  11/09/2000
         SampleBox21.Width := 20; SampleBox22.Width := 20;       //KVB  11/09/2000
         SampleBox23.Width := 20; SampleBox24.Width := 20;       //KVB  11/09/2000
         SampleBox25.Width := 20; SampleBox26.Width := 20;       //KVB  11/09/2000
         SampleBox27.Width := 20; SampleBox28.Width := 20;       //KVB  11/09/2000
         SampleBox29.Width := 20; SampleBox30.Width := 27;       //KVB  11/09/2000
         Tick1.Width        := 14;               //KVB  11/09/2000
         lTick1.Caption     := 'TICK';           //KVB  11/09/2000
         Tick2.Width        := 14;               //KVB  11/09/2000
         lTick2.Caption     := 'TICK';           //KVB  11/09/2000
         Tick3.Width        := 14;               //KVB  11/09/2000
         lTick3.Caption     := 'TICK ONLY IF';   //KVB  11/09/2000
         lTick4.Caption     := 'ON FARM DEATH';  //KVB  11/09/2000
         lSupplies.Caption := 'IF YOU REQUIRE ADDITIONAL SUPPLIES OF THIS FORM PLEASE TICK THIS BOX';  //KVB  11/09/2000
         bSupplies.Width    := 18;   //KVB  11/09/2000
         FootNote1.Caption := 'NOTE:';  //KVB  11/09/2000
         FootNote2.Caption := 'A. OWNER/SELLER - FORWARD THIS FORM WITHIN 7  DAYS IN FREEPOST ENVELOPE PROVIDED.';     //KVB  11/09/2000
         FootNote3.Caption := 'B. BOTH PARTIES ARE REQUIRED TO ENTER THIER HERD NUMBER AND SIGN THIS DOCUMENT';   //KVB  11/09/2000
         FootNote4.Caption := '';     //KVB  11/09/2000
         FootNote5.Caption := 'C. PLEASE ENSURE ALL DETAILS ARE WRITTEN CAREFULLY IN BLOCK LETTERS USING BLACK INK';      //KVB  11/09/2000
         lDateMove.Caption  := '3. ENTER DATE OF MOVEMENT OR ON FARM DEATH :';     //KVB  11/09/2000
         l4a.Caption  := '4. (a) ';     //KVB  11/09/2000
         l4b.Caption  := '4. (b) ';     //KVB  11/09/2000
      end
   else
      begin
         lSupplies.Caption  := '';
         bSupplies.Width    := 0;
         l2b1.Caption       := '';
         l2b2.Caption       := '';
         if (FormNo = 2) then
            begin
               lFormHead2.Caption := '(1) PRIVATE TRANSACTIONS';
               lForm.Caption      := 'NEW OWNER''S/BUYER''S FORM';
               HeadBox.Width      := 140;
               l11.Caption        := '1.  THIS FORM SHOULD BE FORWARDED IN FREEPOST ENVELOPE PROVIDED';
               l12.Caption        := 'WITHIN 7 DAYS OR IN ANY EVENT BEFORE A FURTHER MOVEMENT OF THE';
               l13.Caption        := 'ANIMAL(S).';
               l2a1.Caption       := '2.   THE EARTAG NUMBER OF EACH ANIMAL MUST APPEAR IN THE';
               lDateMove.Caption  := '3. DATE OF MOVEMENT :';
               FootNote2.Caption  := 'A. NEW OWNER/BUYER - FORWARD THIS FORM WITHIN 7 DAYS OR IN ANY EVENT BEFORE A';
               Footnote4.Caption  := 'FURTHER MOVEMENT OF THE ANIMAL(S).';
            end;
         if (FormNo = 2) or (FormNo = 3) then
            begin
               lFormID.Caption       := 'PUR';
               lDeclaration2.Caption := 'my holding on the date given.';
               Tick3.Width           :=  0;
               lTick3.Caption        := '';
               lTick4.Caption        := '';
               aDeadBox.Width        := 0; bDeadBox.Width        := 0;
               cDeadBox.Width        := 0; dDeadBox.Width        := 0;
               eDeadBox.Width        := 0;
               alDead.Caption        := ''; blDead.Caption        := '';
               clDead.Caption        := ''; dlDead.Caption        := '';
               elDead.Caption        := '';
               aDead.Width           := 0; bDead.Width           := 0;
               cDead.Width           := 0; dDead.Width           := 0;
               eDead.Width           := 0;
            end;
         if (FormNo = 3) then
            begin
               lForm.Caption      := 'NEW OWNER''S/BUYER''S COPY';
               FootNote6.Caption  := 'NOTE:  NEW OWNER/BUYER RETAIN THIS COPY FOR YOUR RECORDS AND UPDATE';
               FootNote7.Caption  := '      THE BLUE ANIMAL PASSPORT AND YOUR ON-FARM HERD REGISTER.';
               lCopyLabel.Caption := 'EARTAG NUMBER(S) OF ANIMALS MOVED INTO HOLDING.';
               lDateMove.Caption  := '   DATE OF MOVEMENT :';
               Tick1.Width        := 0;
               lTick1.Caption     := '';
               Tick2.Width        := 0;
               lTick2.Caption     := '';
            end;
         if (FormNo = 3) or (FormNo = 4) then
            begin
               lFormHead1.Caption := '';
               lFormHead2.Caption := '';
               HeadBox.Width      := 0;
               l11.Caption        := '';
               l12.Caption        := '';
               l13.Caption        := '';
               lBrass.Caption     := '';
               lPlastic.Caption   := '';
               l2a1.Caption       := ''; l2a2.Caption       := '';
               l2b1.Caption       := ''; l2b2.Caption       := '';
               Sample1.Caption    := ''; Sample2.Caption    := '';
               Sample3.Caption    := ''; Sample4.Caption    := '';
               Sample5.Caption    := ''; Sample6.Caption    := '';
               Sample7.Caption    := ''; Sample8.Caption    := '';
               Sample9.Caption    := ''; Sample10.Width     := 0;
               Sample11.Caption   := ''; Sample12.Caption   := '';
               Sample13.Caption   := ''; Sample14.Caption   := '';
               Sample15.Caption   := ''; Sample16.Caption   := '';
               Sample17.Caption   := ''; Sample18.Caption   := '';
               Sample19.Caption   := ''; Sample20.Caption   := '';
               Sample21.Caption   := ''; Sample22.Caption   := '';
               Sample23.Width     := 0;  Sample24.Width     := 0;
               SampleBox1.Width  := 0; SampleBox2.Width  := 0;
               SampleBox3.Width  := 0; SampleBox4.Width  := 0;
               SampleBox5.Width  := 0; SampleBox6.Width  := 0;
               SampleBox7.Width  := 0; SampleBox8.Width  := 0;
               SampleBox9.Width  := 0; SampleBox10.Width := 0;
               SampleBox11.Width := 0; SampleBox12.Width := 0;
               SampleBox13.Width := 0; SampleBox14.Width := 0;
               SampleBox15.Width := 0; SampleBox16.Width := 0;
               SampleBox17.Width := 0; SampleBox18.Width := 0;
               SampleBox19.Width := 0; SampleBox20.Width := 0;
               SampleBox21.Width := 0; SampleBox22.Width := 0;
               SampleBox23.Width := 0; SampleBox24.Width := 0;
               SampleBox25.Width := 0; SampleBox26.Width := 0;
               SampleBox27.Width := 0; SampleBox28.Width := 0;
               SampleBox29.Width := 0; SampleBox30.Width := 0;
               FootNote1.Caption := ''; FootNote2.Caption := '';
               FootNote3.Caption := ''; FootNote4.Caption := '';
               FootNote5.Caption := '';
               l4a.Caption  := '';
               l4b.Caption  := '';
            end;
         if (FormNo = 4) then
            begin
               lForm.Caption      := 'OWNER''S/SELLER''S COPY';
               lFormID.Caption    := 'VEN';
               FootNote6.Caption  := 'NOTE:  OWNER/SELLER RETAIN THIS COPY FOR YOUR RECORDS AND UPDATE';
               FootNote7.Caption  := '      YOUR ON-FARM HERD REGISTER.';
               lCopyLabel.Caption := 'EARTAG NUMBER(S) OF ANIMALS MOVED OUT OF HOLDING OR ANIMALS WHICH HAVE DIED ON FARM.';
               lDateMove.Caption  := '   DATE OF MOVEMENT OR ON FARM DEATH :';
               lDeclaration2.Caption := 'my holding/*died on the date given. (*Delete as appropriate.)';
               lTick4.Caption        := 'ON FARM DEATH';
               aDeadBox.Width        := 41; bDeadBox.Width        := 41;
               cDeadBox.Width        := 41; dDeadBox.Width        := 41;
               eDeadBox.Width        := 41;
               alDead.Caption        := 'DEAD'; blDead.Caption        := 'DEAD';
               clDead.Caption        := 'DEAD'; dlDead.Caption        := 'DEAD';
               elDead.Caption        := 'DEAD';
               //KVB 11/09/2000 Remove the following lines, the tick on the DEAD box
               //is handled in the previous procedure
               //if a1.Caption <> '' then               //KVB  11/09/2000
               //   aDead.Width           := 34;        //KVB  11/09/2000
               //if b1.Caption <> '' then               //KVB  11/09/2000
               //   bDead.Width           := 34;        //KVB  11/09/2000
               //if c1.Caption <> '' then               //KVB  11/09/2000
               //   cDead.Width           := 34;        //KVB  11/09/2000
               //if d1.Caption <> '' then               //KVB  11/09/2000
               //   dDead.Width           := 34;        //KVB  11/09/2000
               //if e1.Caption <> '' then               //KVB  11/09/2000
               //   eDead.Width           := 34;        //KVB  11/09/2000
            end;
      end;
end;

procedure TfMoveNotify.MyTableBeforeDelete(DataSet: TDataSet);
begin
   if messagedlg('This will permanently remove the animal(s)'+#13+
                 'from the movement notification list'+#13+
                 'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = mrYes then
      begin
         // update sales/deaths notified
         with MyQuery do
            begin
               SQL.Clear;
               SQL.Add('UPDATE SalesDeaths');
               SQL.Add('SET Notified=TRUE');
               SQL.Add('WHERE EventID = '+ IntToStr(MyTable.FieldByName('EventID').AsInteger) +' ');
               ExecSQL;
            end;
      end
   else
      Abort;
end;

procedure TfMoveNotify.sbAllocationClick(Sender: TObject);
begin
   // call CMMSAllocation screen
   WinData.CMMS.Last;
   if (WinData.CMMS.FieldByName('CMMSAllocation').AsInteger > 0) then
      messagedlg('You still have '+IntToStr(WinData.CMMS.FieldByName('CMMSAllocation').AsInteger)+
                 ' forms left of your previous allocation',mtInformation,[mbOK],0)
   else
      WinData.CreateAndShowForm(TfCMMSAlloc);
end;

end.
