{
   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

   16/08/13 [V5.2 R0.0] /MK Change - Added ShowTheForm procedure to run with uBordBiaPrint.
                                   - Added code to print report for uBordBiaPrint.PrintAllReports.

   30/10/13 [V5.2 R5.0] /MK Bug Fix - ScaleDown - re-tag info for N.Ireland -
                                      Assigning value to string was causing Invalid Variant Type error - TGM reported.

   03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.

   19/11/19 [V5.9 R1.3] /MK Change - Hide cbGuidanceNotes if the country is not Northern Ireland. 
}

unit CowRepFilt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DBLookup, ComCtrls, Db,
  DBTables, ToolEdit, RXLookup, RXDBCtrl, RXSpin, Menus, Qrctrls, quickrpt,
  RXCtrls, ToolWin, Grids, QRExport, cxControls, cxContainer, cxEdit,
  cxCheckBox, KRoutines;

type
  TCowRepFilter = class(TForm)
    pBovineHerdReg: TPanel;
    LFromDate: TLabel;
    LToDate: TLabel;
    FromDate: TDateEdit;
    ToDate: TDateEdit;
    TempQuery: TQuery;
    rgSex: TRadioGroup;
    rgSortby: TRadioGroup;
    rgSortOrder: TRadioGroup;
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
    HerdNum: TRxDBLookupCombo;
    TempIntHerd: TTable;
    rgReportTypes: TGroupBox;
    cbRegister: TRadioButton;
    cbAuditItems: TRadioButton;
    cbInvalid: TRadioButton;
    pInvalid: TPanel;
    Label1: TLabel;
    rgSortBy2: TRadioGroup;
    rgSortOrder2: TRadioGroup;
    ExAnimalsScr: TQuickRep;
    ColumnHeaderBand3: TQRBand;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    RptTitle: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel2: TQRLabel;
    ReportHerd: TQRLabel;
    Detail: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    LDOB: TQRDBText;
    LReason: TQRLabel;
    PageFooterBand3: TQRBand;
    QRLabel44: TQRLabel;
    InvalidVerLabel: TQRLabel;
    SummaryBand3: TQRBand;
    QRLabel39: TQRLabel;
    QRExpr5: TQRExpr;
    qExAnimals: TQuery;
    cbShowAudit: TCheckBox;
    AllSales: TTable;
    AllPurchases: TTable;
    tBovine: TTable;
    clbAuditFields: TRxCheckListBox;
    cbGuidanceNotes: TCheckBox;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    cbFavourite: TcxCheckBox;
    //cbAuditLimit: TCheckBox; SP 19/09/00 No longer needed
    procedure ViewBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure HerdNumCloseUp(Sender: TObject);
    procedure cbShowAuditClick(Sender: TObject);
    procedure cbAuditItemsClick(Sender: TObject);
    procedure cbRegisterClick(Sender: TObject);
    procedure cbInvalidClick(Sender: TObject);
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    //procedure cbAuditLimitClick(Sender: TObject);  SP 19/09/00 No longer needed
    procedure clbAuditFieldsClickCheck(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    OutSideHerd : Integer;
    MyTable : TTable;
    procedure ScaleDown;
    procedure CheckPrintAnimal;  // Check to see if you should display the Print cow no Option
    procedure InvalidAnimal(sender: TObject); // used to call code for invalid animal report.
    procedure SetUpSales;
    procedure IntHerdInfo;  // to update inter herd movement details
    procedure GetInterHerdAnimals;
    procedure SetupForm(HerdID : Integer);

  public
    class procedure ShowTheForm;
    { Public declarations }
  end;

var
  CowRepFilter: TCowRepFilter;
  Bovine : ShortString;

implementation
uses
    Bovineherdreg,
    GenTypesConst,
    uRemarks,
    DairyData,
    Printers,
    Def;

var
   WhichReg : TCountry;

{$R *.DFM}

class procedure TCowRepFilter.ShowTheForm;
begin
   with TCowRepFilter.Create(nil) do
      try
         if ( WinData.FBordBiaBlockPrint ) then
            begin
               try
                  HerdNum.Value := IntToStr(WinData.UserDefaultHerdID);
                  SetupForm(WinData.UserDefaultHerdID);
               except
                  //
               end;
               ViewBtnClick(nil);
            end
         else
            ShowModal;
      finally
         Free;
      end;
end;

procedure TCowRepFilter.SetUpSales;
Var
   MyQuery : TQuery;
   Counter,
   LastID     : Integer;
   KeepInSale,
   KeepInPurch,
   SaleIn,
   PurchaseIn : Boolean;
begin
   MyQuery := TQuery.Create(nil);
   try
      WinData.tIntHerd.Open;

      MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;
      MyQuery.SQL.Add('SELECT S.AID, S.PurchSaleDate, S.Place, S.Place1, S.SeqNo, S.MoveOntoFarm, S.HerdID, S.RealSalePurch');
      MyQuery.SQL.Add('FROM TempAnimals TA, ' + AllSales.TableName + ' S');
      MyQuery.SQL.Add('WHERE (TA.ID=S.AID)');
      MyQuery.SQL.Add('ORDER BY AID, PurchSaleDate, MoveOntoFarm');
      MyQuery.Open;
      MyQuery.First;

      MyTable.Open;
      LastID := -1;
      if NOT ( MyQuery.EOF ) then
         LastID := MyQuery.FieldByName('AID').AsInteger;
      Counter := 0;
      SaleIn := FALSE;
      PurchaseIn := FALSE;
      KeepInPurch := FALSE;
      KeepInSale  := FALSE;

      while NOT ( MyQuery.EOF ) do
         begin
            if MyTable.Locate('ID',MyQuery.FieldByName('AID').Value,[]) then
               begin
                  Inc(Counter);
                  MyTable.Edit;
                  MyTable.FieldByName('RemoveAnimal').AsBoolean := FALSE;
                  if ( MyQuery.FieldByName('MoveOnToFarm').AsBoolean ) then
                     begin
                        if ( NOT PurchaseIn ) then
                           begin
                              PurchaseIn := TRUE;
                              if NOT MyQuery.FieldByName('RealSalePurch').AsBoolean then
                                with TempIntHerd do
                                begin
                                 if TempIntHerd.State <> dsInsert then
                                    Append;
                                 FieldByName('AID').AsInteger := MyQuery.FieldByName('AID').AsInteger;
                                 FieldByName('OldSeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                                 MyTable.FieldByName('SeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                                 FieldByName('PurchDate').AsDateTime := MyQuery.FieldByName('PurchSaleDate').AsDateTime;
                                 FieldByName('PurchPlace').Value := MyQuery.FieldByName('Place').AsString;
                                 FieldByName('PurchPlace1').Value := MyQuery.FieldByName('Place1').AsString;
                                 if FieldByName('PurchDate').AsDateTime <= ToDate.Date then
                                    KeepInPurch := TRUE;
                                end
                              else
                                begin
                              MyTable.FieldByName('PurchDate').AsDateTime := MyQuery.FieldByName('PurchSaleDate').AsDateTime;
                              MyTable.FieldByName('PurchPlace').Value := MyQuery.FieldByName('Place').AsString;
                              MyTable.FieldByName('PurchPlace1').Value := MyQuery.FieldByName('Place1').AsString;
                              MyTable.FieldByName('HerdID').AsInteger := MyQuery.FieldByName('HerdID').AsInteger;
                              MyTable.FieldByName('SeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                              if MyTable.FieldByName('PurchDate').AsDateTime <= ToDate.Date then
                                 KeepInPurch := TRUE;
                                end;
                           end
                        else // Insert a NEW record to the TempIntHerdTrans
                           if PurchaseIn then
                           with TempIntHerd do
                              begin
                                 if TempIntHerd.State <> dsInsert then
                                    Append;
                                 FieldByName('AID').AsInteger := MyQuery.FieldByName('AID').AsInteger;
                                 FieldByName('OldSeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                                 MyTable.FieldByName('SeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                                 FieldByName('PurchDate').AsDateTime := MyQuery.FieldByName('PurchSaleDate').AsDateTime;
                                 FieldByName('PurchPlace').Value := MyQuery.FieldByName('Place').AsString;
                                 FieldByName('PurchPlace1').Value := MyQuery.FieldByName('Place1').AsString;
                                 if FieldByName('PurchDate').AsDateTime <= ToDate.Date then
                                    KeepInPurch := TRUE;
                              end;
                     end
                  else if ( NOT MyQuery.FieldByName('MoveOnToFarm').AsBoolean ) then
                     begin
                        if ( NOT SaleIn ) then
                           begin
                              SaleIn := TRUE;
                              MyTable.FieldByName('SaleDate').AsDateTime := MyQuery.FieldByName('PurchSaleDate').AsDateTime;
                              MyTable.FieldByName('SalePlace').Value := MyQuery.FieldByName('Place').AsString;
                              MyTable.FieldByName('SalePlace1').Value := MyQuery.FieldByName('Place1').AsString;
                              MyTable.FieldByName('HerdID').AsInteger := MyQuery.FieldByName('HerdID').AsInteger;
                              MyTable.FieldByName('SeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                              if MyTable.FieldByName('SaleDate').AsDateTime >= FromDate.Date then
                                 KeepInSale := TRUE;
                           end
                        else // Insert a NEW record to the TempIntHerdTrans
                           if SaleIn then
                           with TempIntHerd do
                              begin
                                 if TempIntHerd.State <> dsInsert then
                                    Append;
                                 FieldByName('AID').AsInteger := MyQuery.FieldByName('AID').AsInteger;
                                 FieldByName('OldSeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                                 MyTable.FieldByName('SeqNo').AsInteger := MyQuery.FieldByName('SeqNo').AsInteger;
                                 FieldByName('SaleDate').AsDateTime := MyQuery.FieldByName('PurchSaleDate').AsDateTime;
                                 FieldByName('SalePlace').Value := MyQuery.FieldByName('Place').AsString;
                                 FieldByName('SalePlace1').Value := MyQuery.FieldByName('Place1').AsString;
                                 if FieldByName('SaleDate').AsDateTime >= FromDate.Date then
                                    KeepInSale := TRUE;
                              end;
                     end;
                  end;

            if TempIntHerd.State = dsInsert then
               TempIntHerd.Post;

            MyQuery.Next;

            if NOT MyQuery.EOF then
               begin
                  if LastID <> MyQuery.FieldByName('AID').Value then
                     begin
                        MyTable.Post;
                        // No Sale or Purchase between the dates so remove from list
                        if (( NOT KeepInPurch ) and ( PurchaseIn )) or
                           (( NOT KeepInSale ) and ( SaleIn )) then
                           if MyTable.Locate('ID',LastId,[])then
                              begin
                                 MyTable.Edit;
                                 MyTable.FieldByName('RemoveAnimal').AsBoolean := TRUE;
                                 MyTable.Post;
                              end;
                        SaleIn := FALSE;
                        PurchaseIn := FALSE;
                        KeepInSale  := FALSE;
                        KeepInPurch := FALSE;
                        Counter     := 0;
                     end
                  else
                     begin
                        // Same ID Onto 2nd lot of Sales and Purchase
                        if ( Counter >= 2 ) then
                           begin
                              if (( NOT KeepInPurch ) and ( PurchaseIn )) or
                                 (( NOT KeepInSale ) and ( SaleIn )) then
                                 MyTable.FieldByName('RemoveAnimal').AsBoolean := TRUE;

                              Counter := 0;
                              // SaleIn := FALSE;
                              // PurchaseIn := FALSE;
                              KeepInSale  := FALSE;
                              KeepInPurch := FALSE;
                           end;
                        MyTable.Post;
                     end;
                  LastID := MyQuery.FieldByName('AID').Value;
               end
            else
               MyTable.Post;
         end;  // end While

      // No Sale or Purchase between the dates so remove from list
      if (( NOT KeepInPurch ) and ( PurchaseIn )) or
         (( NOT KeepInSale ) and ( SaleIn )) then
         if MyTable.Locate('ID',LastId,[])then
            begin
               MyTable.Edit;
               MyTable.FieldByName('RemoveAnimal').AsBoolean := TRUE;
               MyTable.Post;
            end;
   finally
      WinData.tIntHerd.Close;
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

Procedure TCowRepFilter.ScaleDown;
Var
   MyQuery : TQuery;
   AnimalSold,
   DoubleTransfer : Boolean; // transfer between 2 herds from e.g. a to b and b to a
   LastID     : Integer;
   ReplaceTag : String;
Begin
   // Find the NONE HERD
   if WinData.OwnerFile.Locate('HerdIdentity','NONE',[loCaseInsensitive] ) then
      OutSideHerd := WinData.OwnerFile.FieldByName('ID').Value
   else
      OutSideHerd := 0;
   MyTable := TTable.Create(nil);
   with MyTable Do
      Begin
         Close;
         TableType := ttParadox;
         TableName := 'TempAnimals';
         DataBaseName := WinData.AnimalFileById.DatabaseName;
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftInteger,0,False);
               Add('LactNo',ftSmallInt,0,False);
               Add('AnimalNo',ftString,10,False);
               Add('MilkCowNo',ftSmallInt,0,False);
               Add('NatIdNum',ftString,20,False);

               Add('SortNatId',ftString,20,False);
               Add('TransponderNo',ftString,20,False);
               Add('TattoNo',ftString,15,False);
               Add('HerdBookNo',ftString,20,False);
               Add('Name',ftString,40,False);

               Add('Sex',ftString,10,False);
               Add('Type',ftString,10,False);
               Add('PrimaryBreed',ftInteger,0,False);
               Add('PrimaryPerc',ftSmallInt,0,False);
               Add('SecondaryBreed',ftInteger,0,False);

               Add('SecondaryPerc',ftSmallInt,0,False);
               Add('Colour',ftInteger,0,False);
               Add('DateOfBirth',ftDate,0,False);
               Add('DamID',ftInteger,0,False);
               Add('SireID',ftInteger,0,False);

               Add('Breeder',ftInteger,0,False);
               Add('HerdID',ftInteger,0,False);
               Add('InHerd',ftBoolean,0,False);
               Add('OldTag',ftString,20,False);
               Add('OldTagTS',ftString,15,False); // Old Tag Time Stamp
               Add('Breed',ftString,20,False);

               Add('PurchDate',ftDate,0,False);
               Add('LotNumber',ftString,10,False);
               Add('SaleDate',ftDate,0,False);
               Add('DeathDate',ftDate,0,False);
               if WhichReg <> NIreland then                { SP 29/01/2003:- }
                  begin
                     Add('PurchPlace',ftString,30,False);
                     Add('PurchPlace1',ftString,30,False);
                  end
               else
                  begin
                     Add('PurchPlace',ftString,62,False);
                     Add('PurchPlace1',ftString,62,False); { SP 29/01/2003. }
                  end;

               Add('PurchFound',ftBoolean,0,False);

               if WhichReg <> NIreland then                { SP 29/01/2003:- }
                  begin
                     Add('SalePlace',ftString,30,False);
                     Add('SalePlace1',ftString,30,False);
                  end
               else
                  begin
                     Add('SalePlace',ftString,62,False);
                     Add('SalePlace1',ftString,62,False);  { SP 29/01/2003. }
                  end;

               Add('SaleComment',ftString,30,False);
               Add('SaleFound',ftBoolean,0,False);

               Add('ColourAsStr',ftString,6,False);
               Add('DamNatIDNum',ftString,20,False);
               Add('AnimalDeleted',ftBoolean,0,False);
               Add('RemoveAnimal',ftBoolean,0,False);
               Add('SeqNo',ftInteger,0,False);
            end;
         CreateTable;
      end;
   with TempIntHerd Do
      begin
         TableName := 'tihm';
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftInteger,0,False);
               Add('AID',ftInteger,0,False);
               Add('OldSeqNo',ftInteger,0,False);
               Add('NewSeqNo',ftInteger,0,False);

               Add('SaleID',ftInteger,0,False);
               Add('sLastHerdID',ftInteger,0,False);
               Add('sNewHerdID',ftInteger,0,False);
               Add('SaleDate',ftDate,0,False);
               if WhichReg <> NIreland then                { SP 29/01/2003:- }
                  begin
                     Add('SalePlace',ftString,30,False);
                     Add('SalePlace1',ftString,30,False);
                  end
               else
                  begin
                     Add('SalePlace',ftString,62,False);
                     Add('SalePlace1',ftString,62,False);  { SP 29/01/2003. }
                  end;
//               Add('SalePlace',ftString,30,False);
//               Add('SalePlace1',ftString,30,False);
               Add('SaleComment',ftString,30,False);

               Add('PurchID',ftInteger,0,False);
               Add('pLastHerdID',ftInteger,0,False);
               Add('pNewHerdID',ftInteger,0,False);
               Add('PurchDate',ftDate,0,False);
               if WhichReg <> NIreland then                { SP 29/01/2003:- }
                  begin
                     Add('PurchPlace',ftString,30,False);
                     Add('PurchPlace1',ftString,30,False);
                  end
               else
                  begin
                     Add('PurchPlace',ftString,62,False);
                     Add('PurchPlace1',ftString,62,False); { SP 29/01/2003. }
                  end;
//               Add('PurchPlace',ftString,30,False);
//               Add('PurchPlace1',ftString,30,False);

               Add('Remove',ftBoolean,0,False);
            end;
         CreateTable;
         Open;
      end;

   // new temp table to hold animal info pre-interherd query - 7/3/00 - kr
   with tBovine Do
      begin
         TableName := 'tBovine';
         with FieldDefs do
            begin
               Clear;
               Add('ID',ftInteger,0,False);
               Add('AnimalNo',ftString,10,False);
               Add('NatIdNum',ftString,20,False);
               Add('SortNatId',ftString,20,False);
               Add('Sex',ftString,10,False);

               Add('DateOfBirth',ftDate,0,False);
               Add('OldTag',ftString,20,False);
               Add('OldTagTS',ftString,15,False); // Old Tag Time Stamp
               Add('Breed',ftString,20,False);
               Add('PurchDate',ftDate,0,False);
               Add('LotNumber',ftString,10,False);
               Add('SaleDate',ftDate,0,False);

               Add('DeathDate',ftDate,0,False);

               if WhichReg <> NIreland then                { SP 29/01/2003:- }
                  begin
                     Add('PurchPlace',ftString,30,False);
                     Add('PurchPlace1',ftString,30,False);
                  end
               else
                  begin
                     Add('PurchPlace',ftString,62,False);
                     Add('PurchPlace1',ftString,62,False); { SP 29/01/2003. }
                  end;

//               Add('PurchPlace',ftString,30,False);
//               Add('PurchPlace1',ftString,30,False);

               if WhichReg <> NIreland then                { SP 29/01/2003:- }
                  begin
                     Add('SalePlace',ftString,30,False);
                     Add('SalePlace1',ftString,30,False);
                  end
               else
                  begin
                     Add('SalePlace',ftString,62,False);
                     Add('SalePlace1',ftString,62,False);  { SP 29/01/2003. }
                  end;


//               Add('SalePlace',ftString,30,False);
//               Add('SalePlace1',ftString,30,False);

               Add('SaleComment',ftString,30,False);
               Add('DamNatIDNum',ftString,20,False);
               Add('HerdID',ftInteger,0,False);
               Add('ColourAsStr',ftString,6,False);
               Add('SeqNo',ftInteger,0,False);

               Add('AnimalDeleted',ftBoolean,0,False);
               Add('NewHerdID',ftInteger,0,False);
               Add('LastHerdID',ftInteger,0,False);
               Add('DateMoved',ftDate,0,False);
               Add('OldSeqNo',ftInteger,0,False);
               Add('NewSeqNo',ftInteger,0,False);
               Add('Remove',ftBoolean,0,False);

            end;
         CreateTable;
         Open;
      end;

   GetInterHerdAnimals;
   try
      // insert animal details
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := WinData.KingData.DatabaseName;
      MyQuery.SQL.Add('INSERT INTO TempAnimals (ID, AnimalNo, NatIDNum, SortNatId,');
      MyQuery.SQL.Add('Sex, Breed, ColourAsStr, DateOfBirth, HerdID, DamNatIdNum,');
      MyQuery.SQL.Add('AnimalDeleted, RemoveAnimal, PurchFound, SaleFound, SeqNo )');
      MyQuery.SQL.Add('SELECT ID, AnimalNo, NatIdNum, SortNatId, Sex, B.Code,');
      MyQuery.SQL.Add('G.LookUpCode, DateOfBirth, HerdID, A.NatIdNum, AnimalDeleted,');
      MyQuery.SQL.Add('FALSE, FALSE, FALSE, SeqNo FROM Animals');
      MyQuery.SQL.Add('LEFT JOIN Breeds B ON ( B.ID=PrimaryBreed )');
      MyQuery.SQL.Add('LEFT JOIN GenLook G ON ( G.ID=Colour )');
      MyQuery.SQL.Add('LEFT JOIN Animals A ON ( A.ID=DamID )');
      MyQuery.SQL.Add('WHERE NOT (ID IN (Select AnimalID From IHM))');
      MyQuery.SQL.Add('AND NOT (Herdid = ' + IntToStr(OutSideHerd) +')');
      MyQuery.SQL.Add('AND (NatIDNum IS NOT NULL)');
      if rgSex.ItemIndex = 1 then      // Male Only
         MyQuery.SQL.Add('AND (Sex<>"Female")')
      else if rgSex.ItemIndex = 2 then // Female Only
         MyQuery.SQL.Add('AND (Sex="Female")');
      MyQuery.ExecSQL;
      MyQuery.Close;

      MyTable.Open;
      if ( MyTable.FieldDefs.IndexOf('OLDTAG') < 0 ) then
         begin
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE TempAnimals ADD OLDTAG CHAR(30), ADD Breed CHAR(20), ADD PURCHDATE DATE, ADD SALEDATE DATE, ADD DEATHDATE DATE, ADD PURCHPLACE CHAR(30)');
            MyQuery.ExecSQL;
         end;
      if ( MyTable.FieldDefs.IndexOf('SALEPLACE') < 0 ) then
         begin
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE TempAnimals ADD SALEPLACE CHAR(30), ADD SALECOMMENT CHAR(30)');
            MyQuery.ExecSQL;
         end;
   finally
      MyTable.Close;
      MyQuery.Close;
      MyQuery.Free;
   end;

   // Get the Sales Events for the Animals in TempTable
   try
      MyQuery := TQuery.Create(nil);
      MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;
      // Delete Animal if sold before from date
      if ( FromDate.Date <> 0 ) then
         with MyQuery do
            begin
               SQL.Add('DELETE FROM TempAnimals');
               SQL.Add('WHERE (TempAnimals.ID IN');
               SQL.Add('(SELECT AnimalID');
               SQL.Add(' FROM Events');
               SQL.Add(' WHERE (EventType = ' + IntToStr(CSaleDeathEvent) + ')');
               // Check its a Sale to this Herd
               SQL.Add(' AND   (HerdID = ' + HerdNum.Value + ')');
               SQL.Add(' AND   (EventDate < "' + FormatDateTime(cUSDateStyle,FromDate.Date) + '")))');
               ExecSQL;
            end;
      // Get Sales info for remaining animals
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('SELECT Events.ID EID, Events.EventType, Events.EventDate, Events.EventDesc, Events.AnimalID,');
      MyQuery.SQL.Add('TempAnimals.ID');
      MyQuery.SQL.Add('FROM TempAnimals T, Events E');
      MyQuery.SQL.Add('WHERE (T.ID=E.AnimalID)');
      MyQuery.SQL.Add('AND   (E.EventType = ' + IntToStr(CSaleDeathEvent) + ')');
      // Check its a Sales from this Herd
      MyQuery.SQL.Add('AND   (E.HerdID = ' + HerdNum.Value + ')');
      WinData.LookUpSaleDeath.Open;
      MyQuery.Open;
      MyQuery.First;
      MyTable.Open;
      while NOT ( MyQuery.EOF ) do
         begin
            if MyTable.Locate('ID',MyQuery.FieldByName('AnimalID').Value,[]) then
               begin
                  MyTable.Edit;
                  AnimalSold := FALSE;
                  // Found a Sales Record
                  MyTable.FieldByName('SaleFound').AsBoolean := TRUE;
                  if WinData.LookUpSaleDeath.Locate('EventID',MyQuery.FieldByName('EID').AsInteger,[] ) then
                     begin
                        AnimalSold := WinData.LookUpSaleDeath.FieldByName('Sold').AsBoolean;
                        if WinData.Customers.Locate('ID',Windata.LookUpSaleDeath.FieldByName('Customer').Value,[]) then
                           if WhichReg <> NIreland then                            { SP 29/01/2003:- }
                              begin
                                 MyTable.FieldByName('SALEPLACE').Value := WinData.Customers.FieldByName('Name').Value;
                                 MyTable.FieldByName('SALEPLACE1').Value := WinData.Customers.FieldByName('Address 1').Value;
                              end
                           else
                              begin
                                 if Trim(WinData.Customers.FieldByName('Address 1').AsString) <> '' then
                                    MyTable.FieldByName('SALEPLACE').AsString := Trim(WinData.Customers.FieldByName('Name').AsString) + ' , ' +
                                                                              Trim(WinData.Customers.FieldByName('Address 1').AsString)
                                 else
                                    MyTable.FieldByName('SALEPLACE').AsString := Trim(WinData.Customers.FieldByName('Name').AsString);

                                 if Trim(WinData.Customers.FieldByName('Address 3').AsString) <> '' then
                                    MyTable.FieldByName('SALEPLACE1').AsString := Trim(WinData.Customers.FieldByName('Address 2').AsString) + ' , ' +
                                                                               Trim(WinData.Customers.FieldByName('Address 3').AsString)
                                 else
                                    MyTable.FieldByName('SALEPLACE1').AsString := Trim(WinData.Customers.FieldByName('Address 2').AsString);
                              end;                                                 { SP 29/01/2003. }
                     end;
                  if WhichReg = NIreland then
                     begin
                        MyTable.FieldByName('SaleDate').Value := MyQuery.FieldByName('EventDate').Value;
                        MyTable.FieldByName('SaleComment').Value := MyQuery.FieldByName('EventDesc').Value
                     end
                  else
                     begin
                        if AnimalSold then
                           MyTable.FieldByName('SaleDate').AsDateTime := MyQuery.FieldByName('EventDate').AsDateTime
                        else
                           MyTable.FieldByName('SaleDate').AsDateTime := MyQuery.FieldByName('EventDate').AsDateTime;
                     end;
                  MyTable.Post;
               end;
            MyQuery.Next;
         end;
   finally
      WinData.LookUpSaleDeath.Close;
      MyQuery.Close;
      MyQuery.Free;
   end;

   // Get the Purchases Events for the Animals in TempTable
   try
      MyQuery := TQuery.Create(nil);
      MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;
      // Delete animal if purchased after to date
      if ( ToDate.Date <> 0 ) then
         with MyQuery do
            begin
               SQL.Add('DELETE FROM TempAnimals');
               SQL.Add('WHERE (TempAnimals.ID IN');
               SQL.Add('(SELECT AnimalID FROM Events');
               SQL.Add(' WHERE (EventType = ' + IntToStr(CPurchaseEvent) + ')');
               // Check its a Purchase to this Herd
               SQL.Add(' AND   (HerdID = ' + HerdNum.Value + ')');
               SQL.Add(' AND   (EventDate > "' + FormatDateTime(cUSDateStyle,ToDate.Date) + '")))');
               ExecSQL;
            end;

      // Get purchase info for remaining animals
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('SELECT Events.ID EID, Events.EventType, Events.EventDate, Events.AnimalID,');
      MyQuery.SQL.Add('TempAnimals.ID');
      MyQuery.SQL.Add('FROM TempAnimals T, Events E');
      MyQuery.SQL.Add('WHERE (T.ID=E.AnimalID)');
      MyQuery.SQL.Add('AND   (E.EventType = ' + IntToStr(CPurchaseEvent) + ')');
      // Check its a Purchase to this Herd
      MyQuery.SQL.Add('AND   (E.HerdID = ' + HerdNum.Value + ')');
      WinData.LookUpPurchases.Open;
      MyQuery.Open;
      MyQuery.First;
      MyTable.Open;
      while NOT ( MyQuery.EOF ) do
         begin
            if MyTable.Locate('ID',MyQuery.FieldByName('AnimalID').Value,[]) then
               begin
                  MyTable.Edit;
                  // Found a Purchase Record
                  MyTable.FieldByName('PurchFound').AsBoolean := TRUE;
                  MyTable.FieldByName('PurchDate').Value := MyQuery.FieldByName('EventDate').Value;
                  if WinData.LookUpPurchases.Locate('EventID',MyQuery.FieldByName('EID').AsInteger,[] ) then
                     begin
                        MyTable.FieldByName('LotNumber').AsString := WinData.LookUpPurchases.FieldByName('LotNumber').AsString;
                        if WinData.Suppliers.Locate('ID',WinData.LookUpPurchases.FieldByName('Supplier').Value,[]) then
                           begin
                              MyTable.FieldByName('PURCHPLACE').Value := WinData.Suppliers.FieldByName('Name').Value;
                              MyTable.FieldByName('PURCHPLACE1').Value := WinData.Suppliers.FieldByName('Address 1').Value;
                           end;
                     end;
                  MyTable.Post;
               end;
            MyQuery.Next;
         end;
   finally
      WinData.LookUpPurchases.Close;
      MyQuery.Close;
      MyQuery.Free;
   end;

   // insert re-tag info for N.Ireland
   if WhichReg = NIreland then
      try
         MyQuery := TQuery.Create(nil);
         MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;
         MyQuery.SQL.Clear;
         MyQuery.SQL.Add('SELECT A.AID AnimalID, A.DateChanged TagDate, A.OldItem OrigTag');
         MyQuery.SQL.Add('FROM TempAnimals T, Afdoa A');
         MyQuery.SQL.Add('WHERE (A.AID = T.ID)');
         MyQuery.SQL.Add('AND   (A.ItemChanged = '+ IntToStr(cNewTagRemark) +') ');   { SP }
//         MyQuery.SQL.Add('AND   ((A.ItemChanged = '+ IntToStr(cNewTagRemark) +') ');
//         MyQuery.SQL.Add(' OR    (A.ItemChanged = '+ IntToStr(cNatIdRemark) +')) '); SP only allow retags

         MyQuery.Open;
         MyQuery.First;
         MyTable.Open;
         while NOT ( MyQuery.EOF ) do
            begin
               if MyTable.Locate('ID',MyQuery.FieldByName('AnimalID').Value,[]) then
                  begin
                     MyTable.Edit;

                     { SP Display Orig tag in NatID field, and Retag Tag in OldTag field }
                     ReplaceTag := '';
                     ReplaceTag := MyTable.FieldByName('NatIDNum').AsString;

                     //   30/10/13 [V5.2 R5.0] /MK Bug Fix - Assigning value to string was causing Invalid Variant Type error - TGM reported.
                     MyTable.FieldByName('NatIDNum').AsString := MyQuery.FieldByName('OrigTag').AsString;
                     MyTable.FieldByName('OldTag').Value := ReplaceTag;
                     MyTable.FieldByName('OldTagTS').Value := MyQuery.FieldByName('TagDate').AsString;  // Old Tag Time Stamp
                     { SP }
                     MyTable.Post;

                  end;
               MyQuery.Next;
            end;
      finally
         MyQuery.Close;
         MyQuery.Free;
      end;

   // Remove All unwanted Animals
   try
      MyQuery := TQuery.Create(nil);
      MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;
      MyQuery.SQL.Add('DELETE FROM TempAnimals');
      MyQuery.SQL.Add('WHERE (TempAnimals.RemoveAnimal=TRUE)');
      MyQuery.ExecSQL;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

procedure TCowRepFilter.InvalidAnimal(sender: TObject);
begin
   qExAnimals.Close;
   qExAnimals.SQL.Clear;
   InvalidVerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
   ReportHerd.Caption := 'Herd Identity: ' + HerdNum.Text;
   // get data from animals table, dump into temp table
   qExAnimals.sql.Add('SELECT * from Animals');
   qExAnimals.SQL.Add('where ( NOT (HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
   qExAnimals.SQL.Add('AND ( AnimalDeleted = FALSE )');
   if ( Length(HerdNum.Value) > 0 ) then
      qExAnimals.SQL.ADD(' AND ( HerdID = "' + HerdNum.Value + '" )');
   case rgSortBy2.ItemIndex of
      0 : begin // Sort By Animal No
             qExAnimals.SQL.ADD(' ORDER BY SortAnimalNo');
             SortLabel.Caption := 'Ordered By Sort Number';
          end;
      1 : begin //Sort By national ID
             qExAnimals.SQL.ADD(' ORDER BY SortNatID');
             SortLabel.Caption := 'Ordered By National ID Number';
          end;
      2 : begin // Sort By Purchase Date
             qExAnimals.SQL.ADD(' ORDER BY DateOfBirth');
             SortLabel.Caption := 'Ordered By Date Of Birth';
          end;
   end;
   case rgSortOrder2.ItemIndex of
      0  : begin
              qExAnimals.SQL.Add(' Asc');
              OrderLabel.Caption := 'In Ascending Order';
           end;
      1  : begin
              qExAnimals.SQL.Add(' Desc');//desceding
              OrderLabel.Caption := 'In Descending Order';
           end;
   end;
   qExAnimals.Open;
   if ( Sender as TRxSpeedButton ).Name = 'sbView' then
      Begin
         RptTitle.Font.Color := ClRed;
         Detail.Font.color := clNavy;
         ExAnimalsScr.Preview;
      End
   else
      begin
         RptTitle.Font.Color := ClBlack;
         Detail.Font.color := clblack;
         Windata.CallPrintDialog(ExAnimalsScr);
      End;
End;

procedure TCowRepFilter.ViewBtnClick(Sender: TObject);
var
   i,
   NextYear : Smallint;
   AuditFields : String;
begin
   WinData.CanShowStandardReportHint := False;
   WinData.cxHint.HideHint;

   if ( FromDate.Date = 0 ) or ( ToDate.Date = 0 ) then
      begin
         ShowMessage('A Date range is required');
         Exit;
      end;
   if HerdNum.Value <> '0' then
      If cbInvalid.checked Then
         InvalidAnimal(sender)
      else
         try
            sbView.Enabled  := False; // SP 21/11/00 To stop clicking to View/Print twice
            sbPrint.Enabled := False; // which was causing access violations
            BovineReport := TBovineReport.Create(nil);
            Begin
               BovineReport.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
               BovineReport.NIVerLabel.Caption := 'Kingswood '+BovineReport.VerLabel.Caption;

               ScaleDown;  // Get the sale place pur place e.t.c

               BovineReport.qBovine.SQL.Clear;
               BovineReport.qBovine.Close;
               if WhichReg = NIreland then
                  begin
                     // new interherd 7/4/00 - kr
                     // adds animals in herd NOW
                     BovineReport.qBovine.SQL.Add('INSERT INTO tBovine (ID, AnimalNo, NatIDNum, SortNatId,');
                     BovineReport.qBovine.SQL.Add('Sex, DateOfBirth, OldTag, OldTagTS, Breed, PurchDate, LotNumber, SaleDate,');
                     BovineReport.qBovine.SQL.Add('DeathDate, PurchPlace, PurchPlace1, SalePlace,  SalePlace1, SaleComment, ');
                     BovineReport.qBovine.SQL.Add('DamNatIDNum, HerdID, ColourAsStr, SeqNo, AnimalDeleted)');
                     BovineReport.qBovine.SQL.Add('SELECT DISTINCT T.ID, T.AnimalNo, T.NatIDNum, T.SortNatId,');
                     BovineReport.qBovine.SQL.Add('T.Sex, T.DateOfBirth, T.OldTag, T.OldTagTS, T.Breed, T.PurchDate, T.LotNumber, T.SaleDate,');
                     BovineReport.qBovine.SQL.Add('T.DeathDate, T.PurchPlace, T.PurchPlace1, T.SalePlace, T.SalePlace1, T.SaleComment,');
                     BovineReport.qBovine.SQL.Add('T.DamNatIDNum, T.HerdID, T.ColourAsStr, T.SeqNo, T.AnimalDeleted');
                  end
               else
                  begin
                     // new interherd 7/4/00 - kr
                     // adds animals in herd NOW
                     BovineReport.qBovine.SQL.Add('INSERT INTO tBovine (ID, AnimalNo, NatIDNum, SortNatId, Sex,');
                     BovineReport.qBovine.SQL.Add('DateOfBirth, OldTag, Breed, PurchDate, SaleDate, DeathDate,');
                     BovineReport.qBovine.SQL.Add('PurchPlace, PurchPlace1, SalePlace, SalePlace1, HerdID, SeqNo, AnimalDeleted)');
                     BovineReport.qBovine.SQL.Add('SELECT DISTINCT T.ID, T.AnimalNo, T.NatIDNum, T.SortNatId, T.Sex,');
                     BovineReport.qBovine.SQL.Add('T.DateOfBirth, T.OldTag, T.Breed, T.PurchDate, T.SaleDate, T.DeathDate,');
                     BovineReport.qBovine.SQL.Add('T.PurchPlace, T.PurchPlace1, T.SalePlace, T.SalePlace1, T.HerdID, T.SeqNo, T.AnimalDeleted');
                  end;

               BovineReport.qBovine.SQL.Add(' FROM TempAnimals.DB T ');
               // Only check if the Animals DOB is after the ToDate
               if ( ToDate.Date <> 0 ) then
                  begin
                     BovineReport.qBovine.SQL.Add('WHERE ( T.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle, ToDate.Date ) + '''' + ')');
                     if not(cbShowAudit.Checked) and not(cbAuditItems.Checked) then
                        BovineReport.qBovine.SQL.Add('AND ( T.AnimalDeleted=FALSE)');
                  end;

               if Length(HerdNum.Value) > 0 then
                  begin
                     // check to see if you need a WHERE or AND clause
                     if ( ToDate.Date <> 0 ) then
                        BovineReport.qBovine.SQL.Add('AND (( T.HerdID = ' + HerdNum.Value + ') OR (T.ID IN (Select AID from TIHM)))')
                     else
                        begin
                           BovineReport.qBovine.SQL.Add('WHERE (( T.HerdID = ' + HerdNum.Value + ') OR (T.ID IN (Select AID from TIHM)))');
                           if not(cbShowAudit.Checked) and not(cbAuditItems.Checked) then
                              BovineReport.qBovine.SQL.Add('AND ( T.AnimalDeleted=FALSE)');
                        end;
                  end;
               BovineReport.qBovine.ExecSQL;
               // query records from new table
               with BovineReport.qBovine do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT DISTINCT T.ID, T.AnimalNo, T.NatIDNum, T.SortNatId, T.Sex,');
                     SQL.Add('T.DateOfBirth, T.OldTag, T.OldTagTS, T.Breed, T.PurchDate, T.LotNumber, T.SaleDate, T.DeathDate,');
                     SQL.Add('T.PurchPlace, T.PurchPlace1, T.SalePlace, T.SalePlace1, T.DamNatIDNum,');
                     SQL.Add('T.HerdID, T.ColourAsStr, T.SeqNo, T.AnimalDeleted');
                     SQL.Add('FROM tBovine T');
                     Open;
                  end;
               BovineReport.HerdID.Caption := HerdNum.Text;
               BovineReport.HerdID2.Caption := HerdNum.Text;
               if WinData.OwnerFile.Locate('ID',HerdNum.Value,[] ) then
                  begin
                     if WhichReg = Ireland then
                        begin
                           BovineReport.OwnerName.Caption := WinData.OwnerFile.FieldByName('Name').AsString;
                           BovineReport.LAddress1.Caption := WinData.OwnerFile.FieldByName('Address1').AsString;
                           BovineReport.Laddress2.Caption := WinData.OwnerFile.FieldByName('Address2').AsString;
                           BovineReport.LAddress3.Caption := WinData.OwnerFile.FieldByName('Address3').AsString;
                           BovineReport.Laddress4.Caption := WinData.OwnerFile.FieldByName('Address4').AsString;
                           BovineReport.LHerdIdentifier.Caption := WinData.OwnerFile.FieldByName('HerdIdentifier').AsString;
                        end
                     else if WhichReg = NIreland then
                        begin
                           BovineReport.Name.Caption := WinData.OwnerFile.FieldByName('FirstName').AsString + ' ' + WinData.OwnerFile.FieldByName('SurName').AsString;
                           BovineReport.L2Address1.Caption := WinData.OwnerFile.FieldByName('Address1').AsString;
                           BovineReport.L2address2.Caption := WinData.OwnerFile.FieldByName('Address2').AsString;
                           BovineReport.L2Address3.Caption := WinData.OwnerFile.FieldByName('Address3').AsString;
                           BovineReport.L2address4.Caption := WinData.OwnerFile.FieldByName('Address4').AsString;
                        end;
                  end
               else
                  begin
                     BovineReport.OwnerName.Caption := '';
                     BovineReport.LAddress1.Caption := '';
                     BovineReport.Laddress2.Caption := '';
                     BovineReport.LAddress3.Caption := '';
                     BovineReport.Laddress4.Caption := '';
                     BovineReport.LHerdIdentifier.Caption := '';
                  end;

               if rgSortBy.ItemIndex = 0 then // by Sequence Number
                  begin
                     if WhichReg = Ireland then
                        BovineReport.lSortBy.Caption := 'No Sort'
                     else
                        BovineReport.lSortBy2.Caption := 'Contemporaneous Register';
//                     BovineReport.qBovine.SQL.Add('ORDER BY T.SeqNo'); Removed by request of TGM 9/10/2003
                     BovineReport.qBovine.SQL.Add('ORDER BY T.ID'); // Use ID to sort instead.
                     BovineReport.DBAnimalNo.Enabled := False;
                     BovineReport.CowNoLabel.Caption := 'Official Use Only';
                  end
               else if rgSortBy.ItemIndex = 1 then // by Nat ID
                  begin
                     if WhichReg = Ireland then
                        BovineReport.lSortBy.Caption := 'National ID'
                     else
                        BovineReport.lSortBy2.Caption := 'National ID';
                     BovineReport.qBovine.SQL.Add('ORDER BY T.SortNatID');
                     BovineReport.DBAnimalNo.Enabled := False;
                     BovineReport.CowNoLabel.Caption := 'Official Use Only';
                  end
               else if rgSortBy.ItemIndex = 2 then // by DOB
                  begin
                     if WhichReg = Ireland then
                        BovineReport.lSortBy.Caption := 'Date of Birth'
                     else
                        BovineReport.lSortBy2.Caption := 'Date of Birth';
                     BovineReport.qBovine.SQL.Add('ORDER BY T.DateOfBirth');
                     BovineReport.DBAnimalNo.Enabled := False;
                     BovineReport.CowNoLabel.Caption := 'Official Use Only';
                  end
               else if rgSortBy.ItemIndex = 3 then // by Sex
                  begin
                     if WhichReg = Ireland then
                        BovineReport.lSortBy.Caption := 'Sex'
                     else
                        BovineReport.lSortBy2.Caption := 'Sex';
                     BovineReport.qBovine.SQL.Add('ORDER BY T.Sex');
                     BovineReport.DBAnimalNo.Enabled := False;
                     BovineReport.CowNoLabel.Caption := 'Official Use Only';
                  end;

               // Set the Date range used
               BovineReport.lDateFrom.Caption := FromDate.Text;
               BovineReport.lDateTo.Caption := ToDate.Text;
               if cbShowAudit.Checked then
                  begin
                     BovineReport.qrlShowingChanges.Caption := 'Showing Changes';
                     BovineReport.TotalAnimals.Caption := 'Number Of Records :';
                  end
               else
                  begin
                     BovineReport.qrlShowingChanges.Caption := 'NOT Showing Changes';
                     BovineReport.TotalAnimals.Caption := 'Number Of Animals :';
                  end;

               if rgSex.ItemIndex >= 0 then
                  begin
                     if WhichReg = Ireland then
                        BovineReport.lChosenSex.Caption := Copy(rgSex.Items.Strings[rgSex.ItemIndex], 2, MaxInt)
                     else
                        BovineReport.lChosenSex2.Caption := Copy(rgSex.Items.Strings[rgSex.ItemIndex], 2, MaxInt);
                  end
               else
                  begin
                     if WhichReg = Ireland then
                        BovineReport.lChosenSex.Caption := ''
                     else
                        BovineReport.lChosenSex2.Caption := '';
                  end;

               if rgSortOrder.ItemIndex = 0 then
                  begin
                     if rgSortBy.ItemIndex = 0 then
                        begin
                           if WhichReg = Ireland then
                              BovineReport.lSortDirection.Caption := ''
                           else
                              BovineReport.lSortDirection2.Caption := '';
                        end
                     else
                        if WhichReg = Ireland then
                           BovineReport.lSortDirection.Caption := 'Ascending'
                        else
                           BovineReport.lSortDirection2.Caption := 'Ascending';
                     BovineReport.qBovine.SQL.Add('ASC');
                  end
               else
                  begin
                     if rgSortBy.ItemIndex = 0 then
                        begin
                           if WhichReg = Ireland then
                              BovineReport.lSortDirection.Caption := ''
                           else
                              BovineReport.lSortDirection2.Caption := '';
                        end
                     else
                        if WhichReg = Ireland then
                           BovineReport.lSortDirection.Caption := 'Descending'
                        else
                           BovineReport.lSortDirection2.Caption := 'Descending';
                     BovineReport.qBovine.SQL.Add('DESC');
                  end;
               BovineReport.qBovine.Open;
               with BovineReport.qIHM do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT * FROM tihm');
                     SQL.Add('WHERE (AID=:ID)');
                     SQL.Add('AND ((SaleDate > "12/31/1899") OR (PurchDate > "12/31/1899"))');
                     Open;
                  end;
               // Only open the Remarks and Movements Queries if the User wants
               // to see the Audit (default)
               if cbShowAudit.Checked then
                  begin
                     // Fill the Movements SQL
                     with BovineReport.qMovements do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT EventDate, EventDesc, DateMovedBack,');
                           SQL.Add('Remark, Name || " " || HerdIdentity MoveName, Townland');
                           SQL.Add('FROM Events, Movements, MovedTo');
                           SQL.Add('WHERE (Events.AnimalID=:ID)');
                           SQL.Add('AND (Events.ID=Movements.EventId)');
                           SQL.Add('AND (Events.EventType= '+ IntToStr(CMovementEvent) + ')');
                           SQL.Add('AND (Movements.MovedTo=MovedTo.ID)');

                           SQL.Add('ORDER BY Events.EventDate');
                        end;
                     with BovineReport.qRemarks do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT * FROM afdoa');
                           SQL.Add('WHERE (AID=:ID)');
                           if WhichReg <> Ireland then
                              SQL.Add('AND ( DateChanged Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                           SQL.Add('ORDER BY DateChanged desc, TimeChanged desc');

                        end;
                     with BovineReport.qSaleDel do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT SaleDate, Remark, Name,');
                           SQL.Add('Customers."Address 1" Address, DateChanged, TimeChanged, ');
                           // SP 12/01/2004
                           SQL.Add('UserDate ');
                           SQL.Add('FROM shrd S');
                           SQL.Add('LEFT OUTER JOIN Customers C');
                           SQL.Add('ON (S.SalePlace=C.ID)');
                           SQL.Add('WHERE (S.AID=:ID)');
                           if WhichReg <> Ireland then
                              SQL.Add('AND ( DateChanged Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                           SQL.Add('ORDER BY DateChanged desc, TimeChanged desc');
                        end;
                     with BovineReport.qPurchDel do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT PurchDate, Remark, Name,');
                           SQL.Add('SuppliersBreeders."Address 1" Address, datechanged, timechanged');
                           // SP 12/01/2004
                           SQL.Add('UserDate ');
                           SQL.Add('FROM phrd P');
                           SQL.Add('LEFT OUTER JOIN SuppliersBreeders S');
                           SQL.Add('ON (P.PurchPlace=S.ID)');
                           SQL.Add('WHERE (P.AID=:ID)');
                           if WhichReg <> Ireland then
                              SQL.Add('AND ( DateChanged Between ' + '''' + FormatDateTime(cUSDateStyle,FromDate.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDate.Date) + '''' + ')');
                           SQL.Add('ORDER BY DateChanged desc, TimeChanged desc');
                        end;
                     BovineReport.qRemarks.Open;
                     BovineReport.qMovements.Open;
                     BovineReport.qSaleDel.Open;
                     BovineReport.qPurchDel.Open;
                  end;

               if NOT cbAuditItems.Checked then
                  // herd register report
                  begin
                     BovineReport.Page.Orientation := poLandscape;
                     //   16/08/13 [V5.2 R0.0] /MK Change - Added code to print report for Bord Bia Print All option.
                     if ( WinData.FBordBiaBlockPrint ) then
                        // Print Report for Bord Bia.
                        begin
                           with BovineReport.qBovine do
                              begin
                                 BovineReport.z.Font.Color := clBlack;
                                 BovineReport.PageFB.Font.Color := clBlack;
                                 BovineReport.qrsdNIREg.Font.Color := clBlack;
                                 BovineReport.Print;
                                 //BovineReport.Preview;
                              end;
                        end
                     else if (Sender as tRxSpeedButton).Name = 'sbView' Then
                        // view report
                        begin
                           with BovineReport.qBovine do
                              begin
                                 BovineReport.z.Font.Color := clNavy;
                                 BovineReport.PageFB.Font.Color := clRed;
                                 BovineReport.qrsdNIREg.Font.Color := clNavy;
                                 if WhichReg = Ireland then
                                    BovineReport.Preview
                                 else
                                    begin
                                       if cbGuidanceNotes.Checked then
                                          BovineReport.NotesForGuidance.Preview;
                                       BovineReport.NIHerdReg.Preview;
                                    end;
                              end
                        end
                     else if ( (Sender as tRxSpeedButton).Name = 'sbPrint' ) then
                        // print report
                        begin
                           with BovineReport.qBovine do
                              begin
                                 BovineReport.z.Font.Color := clBlack;
                                 BovineReport.PageFB.Font.Color := clBlack;
                                 BovineReport.qrsdNIREg.Font.Color := clBlack;
                                 if WhichReg = Ireland then
                                    Windata.CallPrintDialog(BovineReport)
                                 else
                                    begin
                                       Windata.CallPrintDialog(BovineReport.NotesForGuidance);
                                       Windata.CallPrintDialog(BovineReport.NIHerdReg);
                                    end;
                              end;
                        end;
                  end
               else
                  // audit report only
                  begin
                     AuditFields := '';
                     if (clbAuditFields.Checked[0]) or (clbAuditFields.Checked[14]) then
                        WinData.NoSales := False
                     else
                        WinData.NoSales := True;
                     if (clbAuditFields.Checked[0]) or (clbAuditFields.Checked[15]) then
                        WinData.NoPurch := False
                     else
                        WinData.NoPurch := True;
                     // get fields to be included - kr 9/8/00
                     if (NOT clbAuditFields.Checked[0]) then
                        begin
                           for i := 1 to (clbAuditFields.Items.Count - 1) do
                              begin
                                 if (clbAuditFields.Checked[i]) then
                                    begin
                                       if AuditFields = '' then
                                          AuditFields := IntToStr(i)
                                       else
                                          AuditFields := (AuditFields + ' ,' + IntToStr(i));
                                    end;
                              end;
                           if AuditFields = '' then
                              begin
                                 messagedlg('At least one audit field must'+#13+
                                            'be selected to report on.',mtError,[mbOK],0);
                                 exit;
                              end;
                        end;
                     // Fill the Remarks SQL
                     with BovineReport.qRemarks do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT AID, ItemChanged, ChangedBy, DateChanged,');
                           SQL.Add('OldItem, Remark, TimeChanged');
                           SQL.Add('FROM afdoa');
                           SQL.Add('WHERE (AID=:ID)');
                           // for selected items only - kr 9/8/00
                           if (NOT clbAuditFields.Checked[0]) and (AuditFields <> '') then
                              SQL.Add('AND (ItemChanged IN (' + AuditFields + '))');
                           SQL.Add('ORDER BY DateChanged desc, TimeChanged desc');
                           Open;
                        end;
                     // if 'all' or sales deletion selected - kr 9/8/00
                     if NOT WinData.NoSales then
                        with BovineReport.qSaleDel do
                           begin
                              SQL.Clear;
                              SQL.Add('SELECT Remark, ChangedBy,');
                              SQL.Add('DateChanged, TimeChanged');
                              SQL.Add('FROM shrd');
                              SQL.Add('WHERE (AID=:ID)');
                              SQL.Add('ORDER BY DateChanged desc, TimeChanged desc');
                              Open;
                           end;
                     // if 'all' or purchase deletion selected - kr 9/8/00
                     if NOT WinData.NoPurch then
                        with BovineReport.qPurchDel do
                           begin
                              SQL.Clear;
                              SQL.Add('SELECT Remark, ChangedBy,');
                              SQL.Add('DateChanged, TimeChanged');
                              SQL.Add('FROM phrd');
                              SQL.Add('WHERE (AID=:ID)');
                              SQL.Add('ORDER BY DateChanged desc, TimeChanged desc');
                              Open;
                           end;
                     if (Sender as tRxSpeedButton).Name = 'sbView' Then
                        BovineReport.qrAudits.Preview
                     else
                        Windata.CallPrintDialog(BovineReport.qrAudits);
                  end;
            End;
         finally
            // Free the Temporary Table
            MyTable.Close;
            MyTable.Free;
            TempIntHerd.Close;
            TempIntHerd.DeleteTable;
            // added 7/4/00 - kr
            tBovine.Close;
            tBovine.EmptyTable;
            tBovine.DeleteTable;
            BovineReport.Free;
            sbView.Enabled  := True; // SP 21/11/00 To stop clicking to View/Print twice
            sbPrint.Enabled := True; // which was causing access violations
         end
   else
      begin
         MessageDLG('You must select a Herd',mtinformation,[mbOK],0);
         HerdNum.DropDown;
         HerdNum.SetFocus;
      end;
End;

procedure TCowRepFilter.IntHerdInfo; // to update inter herd movement details - 10/4/00 - kr
var
   MyQuery : TQuery;
   MyTable : TTable;
begin
   try
      MyQuery := TQuery.Create(nil);
      MyTable := tBovine;
      MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;
      MyQuery.SQL.Add('SELECT I.AnimalId, I.LastHerdID, I.NewHerdID, I.DateMoved, I.Remark,');
      MyQuery.SQL.Add('I.OldSeqNo, I.NewSeqNo');
      MyQuery.SQL.Add('FROM tBovine T, IHM I');
      MyQuery.SQL.Add('WHERE (T.ID=I.AnimalID)');
      MyQuery.SQL.Add('AND  ((I.LastHerdID = ' + HerdNum.Value + ')');
      MyQuery.SQL.Add('   OR (I.NewHerdID = ' + HerdNum.Value + '))');
      MyQuery.SQL.Add('ORDER BY AnimalID, DateMoved');
      MyQuery.Open;
      MyQuery.First;
      MyTable.Open;
      while NOT ( MyQuery.EOF ) do
         begin
            if MyTable.Locate('ID',MyQuery.FieldByName('AnimalID').Value,[]) then
               begin
                  MyTable.Edit;
                  // if animal moved onto herd
                  if MyQuery.FieldByName('NewHerdID').AsInteger = StrToInt(HerdNum.Value) then
                     begin
                        if ( MyTable.FieldByName('PurchDate').AsDateTime <= 0 )  then
                           begin
                              if WinData.OwnerFile.Locate('ID',MyQuery.FieldByName('LastHerdID').AsInteger,[] ) then
                                 begin
                                    MyTable.FieldByName('PURCHPLACE').Value := WinData.OwnerFile.FieldByName('Name').AsString;
                                    MyTable.FieldByName('PURCHPLACE1').Value := WinData.OwnerFile.FieldByName('HerdIdentity').AsString;
                                 end;
                              MyTable.FieldByName('SeqNo').AsInteger := MyQuery.FieldByName('NewSeqNo').AsInteger;
                              MyTable.FieldByName('PurchDate').AsDateTime := MyQuery.FieldByName('DateMoved').AsDateTime;
                           end;
                     end;
               end;
            MyQuery.Next;
         end;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

procedure TCowRepFilter.ExitBtnClick(Sender: TObject);
begin
   Close;
   WinData.cxHint.HideHint;
end;

procedure TCowRepFilter.HerdNumCloseUp(Sender: TObject);
begin
   // Check the select Herd to see were its registered
{   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile,HerdNum.Value);
   CheckPrintAnimal;}
   try
      SetupForm(StrToInt(HerdNum.Value)); // Sp
   except
      SetupForm(WinData.UserDefaultHerdID); // Sp
   end;
end;

procedure TCowRepFilter.CheckPrintAnimal;
begin
end;

procedure TCowRepFilter.cbShowAuditClick(Sender: TObject);
begin
   if cbShowAudit.Checked then
      cbAuditItems.Checked := FALSE;
end;

procedure TCowRepFilter.cbAuditItemsClick(Sender: TObject);
begin
   pInvalid.Hide;
   LFromDate.Enabled := True;
   FromDate.Enabled := True;
   LToDate.Enabled := True;
   ToDate.Enabled := True;
   cbShowAudit.Checked := False;
   cbShowAudit.Enabled := False;
   clbAuditFields.Visible := True;
end;

procedure TCowRepFilter.cbRegisterClick(Sender: TObject);
begin
   pInvalid.Hide;
   LFromDate.Enabled := True;
   FromDate.Enabled := True;
   LToDate.Enabled := True;
   ToDate.Enabled := True;
   cbShowAudit.Enabled := True;
   cbShowAudit.Checked := True;
   //cbAuditLimit.Visible := False;  SP 19/09/00 No longer needed
   //cbAuditLimit.Checked := False;  SP 19/09/00 No longer needed
   clbAuditFields.Visible := False;
   clbAuditFields.ApplyState(cbUnChecked,True);
   clbAuditFields.State[0] := cbChecked;
end;

procedure TCowRepFilter.cbInvalidClick(Sender: TObject);
begin
   pInvalid.Show;
   cbShowAudit.Checked := FALSE;
   cbShowAudit.Enabled := FALSE;
   LFromDate.Enabled := False;
   FromDate.Enabled := False;
   LToDate.Enabled := False;
   ToDate.Enabled := False;
   //cbAuditLimit.Visible := False;  SP 19/09/00 No longer needed
   //cbAuditLimit.Checked := False;  SP 19/09/00 No longer needed
   clbAuditFields.Visible := False;
   clbAuditFields.ApplyState(cbUnChecked,True);
   clbAuditFields.State[0] := cbChecked;
end;

procedure TCowRepFilter.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var TestStr : String;
    InvalidTag: Boolean;
begin
   PrintBand := False;
   If qExAnimals.FieldByName('DateOfBirth').IsNull then
      begin
         PrintBand := True;
         LReason.Caption := 'Blank Date of Birth';
         if qExAnimals.FieldByName('NatIDNum').IsNull Then
            LReason.Caption := 'Blank National Identity Number and blank Date of Birth'
         Else if Length(qExAnimals.FieldByName('NatIDNum').AsString) < 9 Then
            LReason.Caption := 'Invalid National Identity Number and blank Date of Birth'
         Else IF NOT(CheckNatID(qExAnimals.FieldByName('NatIDNum').AsString , TestStr, True)) Then
            LReason.Caption := 'Invalid National Identity Number and blank Date of Birth';
      end
   Else if qExAnimals.FieldByName('NatIDNum').IsNull Then
      begin
         PrintBand := True;
         LReason.Caption := 'Blank National ID';
      end
   Else if Length(qExAnimals.FieldByName('NatIDNum').AsString) < 9 Then
      begin
         PrintBand := True;
         LReason.Caption := 'Invalid National Identity Number';
      end
   Else
      begin
         IF NOT(CheckNatID( qExAnimals.FieldByName('NatIDNum').AsString , TestStr, True)) Then
            PrintBand := True;
         LReason.Caption := 'Invalid National Identity Number';
      End;
end;

procedure TCowRepFilter.FormShow(Sender: TObject);
begin
   HerdNum.Value := IntToStr(WinData.UserDefaultHerdID);
   SetupForm(WinData.UserDefaultHerdID); // Sp
end;

{procedure TCowRepFilter.cbAuditLimitClick(Sender: TObject);
begin
   if cbAuditItems.Checked then
      clbAuditFields.Visible := True
   else
      begin
         clbAuditFields.Visible := False;
         clbAuditFields.ApplyState(cbUnChecked,True);
         clbAuditFields.State[0] := cbChecked;
      end;
end;}  // Check box no longer needed  SP 19/09/00

procedure TCowRepFilter.clbAuditFieldsClickCheck(Sender: TObject);
begin
   if clbAuditFields.Checked[0] then
      begin
         clbAuditFields.ApplyState(cbUnChecked,True);
         clbAuditFields.State[0] := cbChecked;
      end;
end;

procedure TCowRepFilter.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('rbovine.htm')
end;

procedure TCowRepFilter.GetInterHerdAnimals;
var
   MyQuery,
   GenQuery : TQuery;
   DoubleTransfer : Boolean;
   oHerdID : Integer; // old HerdID, this will overwrite the Animals Current HerdID
                      // with the old HerdID from the Inter herd transfer.
   IDNumbers : String;
   FirstPass : Boolean;
begin
   try
     MyQuery := TQuery.Create(nil);
     MyQuery.DataBaseName := WinData.AnimalFileById.DatabaseName;

     MyQuery.SQL.Clear;
     MyQuery.SQL.Add('SELECT AnimalId, LastHerdID, NewHerdID, DateMoved, Remark, OldSeqNo, NewSeqNo');
     MyQuery.SQL.Add('FROM IHM I');
     MyQuery.SQL.Add('WHERE NOT (AnimalID IN (Select AID From TIhm))');
     MyQuery.SQL.Add('AND ((I.LastHerdID = ' + HerdNum.Value + ')');
     MyQuery.SQL.Add('  OR (I.NewHerdID = ' + HerdNum.Value + '))');
     MyQuery.SQL.Add('ORDER BY AnimalID, DateMoved');
     MyQuery.Open;
     MyQuery.First;
     MyTable.Open;
     while NOT ( MyQuery.EOF ) do
        begin
           if TempIntHerd.Locate('AID',MyQuery.FieldByName('AnimalID').Value,[]) then
              TempIntHerd.Edit
           else
              TempIntHerd.Append;

           if MyQuery.FieldByName('LastHerdID').AsInteger = StrToInt(HerdNum.Value) then
              with TempIntHerd do
                 begin
                    FieldByName('AID').AsInteger := MyQuery.FieldByName('AnimalID').AsInteger;
                    FieldByName('OldSeqNo').AsInteger := MyQuery.FieldByName('OldSeqNo').AsInteger;
                    FieldByName('SaleDate').AsDateTime := MyQuery.FieldByName('DateMoved').AsDateTime;
                    FieldByName('sLastHerdID').AsInteger := MyQuery.FieldByName('LastHerdID').AsInteger;
                    FieldByName('sNewHerdID').AsInteger := MyQuery.FieldByName('NewHerdID').AsInteger;
                    if WinData.OwnerFile.Locate('ID',MyQuery.FieldByName('NewHerdID').AsInteger,[] ) then
                       begin
                          FieldByName('SALEPLACE').Value := WinData.OwnerFile.FieldByName('Name').AsString;
                          FieldByName('SALEPLACE1').Value := WinData.OwnerFile.FieldByName('HerdIdentity').AsString;
                       end;
                 end;
           if MyQuery.FieldByName('NewHerdID').AsInteger = StrToInt(HerdNum.Value) then
              with TempIntHerd do
                 begin
                    FieldByName('AID').AsInteger := MyQuery.FieldByName('AnimalID').AsInteger;
                    FieldByName('NewSeqNo').AsInteger := MyQuery.FieldByName('NewSeqNo').AsInteger;
                    FieldByName('PurchDate').AsDateTime := MyQuery.FieldByName('DateMoved').AsDateTime;
                    FieldByName('pLastHerdID').AsInteger := MyQuery.FieldByName('LastHerdID').AsInteger;
                    FieldByName('pNewHerdID').AsInteger := MyQuery.FieldByName('NewHerdID').AsInteger;
                    if WinData.OwnerFile.Locate('ID',MyQuery.FieldByName('LastHerdID').AsInteger,[] ) then
                       begin
                          FieldByName('PurchPLACE').Value := WinData.OwnerFile.FieldByName('Name').AsString;
                          FieldByName('PurchPLACE1').Value := WinData.OwnerFile.FieldByName('HerdIdentity').AsString;
                       end;
                    end;

           if TempIntHerd.State in ([dsInsert, dsEdit]) then
              TempIntHerd.Post;
           MyQuery.Next;
        end;

   with TempIntHerd do
      begin
         First;
         While Not EOF do
            begin
               Edit;
               if ((TempIntHerd.FieldByName('sNewHerdID').AsInteger > 0) AND (TempIntHerd.FieldByName('pLastHerdID').AsInteger > 0)) then
                  begin
                     // Animal was sold to Another herd then brought back to original herd.
                     DoubleTransfer := ((TempIntHerd.FieldByName('sLastHerdID').AsInteger = StrToInt(HerdNum.Value)) AND (TempIntHerd.FieldByName('pNewHerdID').AsInteger = StrToInt(HerdNum.Value)));
                     if DoubleTransfer then
                        begin
                           if TempIntHerd.FieldByName('SaleDate').AsDateTime > TempIntHerd.FieldByName('PurchDate').AsDateTime then
                              begin
                                if (FieldByName('PurchDate').AsDateTime <= ToDate.Date) then
                                   TempIntHerd.FieldByName('Remove').AsBoolean := False
                                else if TempIntHerd.FieldByName('PurchDate').AsDateTime > ToDate.Date then
                                   TempIntHerd.FieldByName('Remove').AsBoolean := True;

                                if NOT(TempIntHerd.FieldByName('Remove').AsBoolean) then
                                   begin
                                      if (TempIntHerd.FieldByName('SaleDate').AsDateTime < FromDate.Date) then
                                         TempIntHerd.FieldByName('Remove').AsBoolean := True
                                  //  else if ((FieldByName('SaleDate').AsDateTime < FromDate.Date)  then //AND (TempIntHerd.FieldByName('SaleDate').AsDateTime < ToDate.Date))
                                  //     TempIntHerd.FieldByName('Remove').AsBoolean := False
                                      else if (FieldByName('SaleDate').AsDateTime > FromDate.Date) then
                                         TempIntHerd.FieldByName('Remove').AsBoolean := False;
                                   end;
                              end
                           else
                              begin
                                 if (TempIntHerd.FieldByName('SaleDate').AsDateTime < FromDate.Date) then
                                    TempIntHerd.FieldByName('Remove').AsBoolean := True
//                               else if ((FieldByName('SaleDate').AsDateTime < FromDate.Date) AND (TempIntHerd.FieldByName('SaleDate').AsDateTime < ToDate.Date)) then
//                                  TempIntHerd.FieldByName('Remove').AsBoolean := False
                                 else if (FieldByName('SaleDate').AsDateTime > FromDate.Date) then
                                    TempIntHerd.FieldByName('Remove').AsBoolean := False;

                               if TempIntHerd.FieldByName('Remove').AsBoolean then
                                  begin
                                       if (FieldByName('PurchDate').AsDateTime <= ToDate.Date) then
                                          TempIntHerd.FieldByName('Remove').AsBoolean := False
                                       else if TempIntHerd.FieldByName('PurchDate').AsDateTime > ToDate.Date then
                                          TempIntHerd.FieldByName('Remove').AsBoolean := True;
                                  end;
                              end
                        end;

                        if NOT(TempInTHerd.FieldByName('Remove').AsBoolean) then
                           begin
                              if FieldByName('SaleDate').AsDateTime > ToDate.Date then
                                  begin
                                     FieldByName('SaleDate').AsDateTime := 0;
                                     FieldByName('SalePlace').AsString := '';
                                     FieldByName('SalePlace1').AsString := '';
                                     FieldByName('SaleComment').AsString := '';
                                  end;

                              if FieldByName('PurchDate').AsDateTime > ToDate.Date then
                                 begin
                                    FieldByName('PurchDate').AsDateTime := 0;
                                    FieldByName('PurchPlace').AsString := '';
                                    FieldByName('PurchPlace1').AsString := '';
                                 end
                           end;
                  end
               else if (TempIntHerd.FieldByName('sLastHerdID').AsInteger = StrToInt(HerdNum.Value)) then
                  begin
                     if TempIntHerd.FieldByName('SaleDate').AsDateTime > 0 then
                        begin
                           if (TempIntHerd.FieldByName('SaleDate').AsDateTime <= FromDate.Date) then
                              TempIntHerd.FieldByName('Remove').AsBoolean := True
                           else if (FieldByName('SaleDate').AsDateTime > FromDate.Date) then
                              TempIntHerd.FieldByName('Remove').AsBoolean := False
                        end
                  end
               else if (TempIntHerd.FieldByName('pNewHerdID').AsInteger = StrToInt(HerdNum.Value)) then
                  if TempIntHerd.FieldByName('PurchDate').AsDateTime > 0 then
                     begin
                        if TempIntHerd.FieldByName('PurchDate').AsDateTime > ToDate.Date then
                           TempIntHerd.FieldByName('Remove').AsBoolean := True
                        else if (FieldByName('PurchDate').AsDateTime <= ToDate.Date) then
                           TempIntHerd.FieldByName('Remove').AsBoolean := False;
                    end;
              Post;
              Next;
            end;
      end;

   MyQuery.SQL.Clear;
   MyQuery.SQL.Add('DELETE FROM tihm ');
   MyQuery.SQL.Add('WHERE (Remove=TRUE)');
   MyQuery.ExecSQL;

   with TempIntHerd do
      begin
         First;
         while NOT EOF do
            begin
               if NOT(FieldByName('Remove').AsBoolean) then
                  begin
                     MyQuery.SQL.Clear;
                     MyQuery.SQL.Add('INSERT INTO TempAnimals (ID, AnimalNo, NatIDNum, SortNatId,');
                     MyQuery.SQL.Add('Sex, Breed, ColourAsStr, DateOfBirth, HerdID, DamNatIdNum,');
                     MyQuery.SQL.Add('AnimalDeleted, RemoveAnimal, PurchFound, SaleFound, SeqNo )');
                     MyQuery.SQL.Add('SELECT ID, AnimalNo, NatIdNum, SortNatId, Sex, B.Code,');
                     MyQuery.SQL.Add('G.LookUpCode, DateOfBirth, HerdID, A.NatIdNum, AnimalDeleted,');
                     MyQuery.SQL.Add('FALSE, FALSE, FALSE, SeqNo FROM Animals');
                     MyQuery.SQL.Add('LEFT JOIN Breeds B  ON ( B.ID=PrimaryBreed )');
                     MyQuery.SQL.Add('LEFT JOIN GenLook G ON ( G.ID=Colour )');
                     MyQuery.SQL.Add('LEFT JOIN Animals A ON ( A.ID=DamID )');
                     MyQuery.SQL.Add('WHERE (ID='+IntToStr(FieldByName('AID').AsInteger)+')');
                     MyQuery.SQL.Add('AND (NatIDNum IS NOT NULL)');
                     if rgSex.ItemIndex = 1 then      // Male Only
                        MyQuery.SQL.Add('AND (Sex<>"Female")')
                     else if rgSex.ItemIndex = 2 then // Female Only
                        MyQuery.SQL.Add('AND (Sex="Female")');
                     MyQuery.ExecSQL;
                  end;
               Next;
            end;
      end;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

procedure TCowRepFilter.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbView.Glyph,cBtnImgPreview);
   WinData.LoadBtnImage(WinData.Images,sbPrint.Glyph,cBtnImgPrint);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);
   ExAnimalsScr.hide;

   WinData.UpdateRecentReportUsage(cBovineHerdRegRep);
   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cBovineHerdRegRep);
end;

procedure TCowRepFilter.SetupForm(HerdID : Integer);
begin
   sbView.Enabled  := True; // SP 21/11/00 To stop clicking to View/Print twice
   sbPrint.Enabled := True; // which was causing access violations
   WhichReg := WinData.GetHerdCountry(WinData.OwnerFile, HerdNum.Value);
   cbShowAudit.Checked := TRUE;
   rgSortby.Items.Clear;
   cbGuidanceNotes.Visible := ( WhichReg = NIreland );
   cbGuidanceNotes.Checked := ( WhichReg = NIreland );

   if WhichReg = Ireland then
      begin
         cbShowAudit.Visible := True;
         cbAuditItems.Top := 64;
         cbInvalid.Top := 84;
         rgSortby.Items.Add('No &Sort');
         rgSortby.Width := 199;
         rgSortOrder.Width := 195;
         rgSortOrder.Left := 214;
         cbInvalid.Visible := True;
         rgSex.Items[1] := '&Males';
      end
   else
      begin
         cbShowAudit.Visible := False;
         cbAuditItems.Top := 40;
         cbInvalid.Top := 60;
         rgSortby.Items.Add('&Contemporaneous Register');
         rgSortby.Width := 244;
         rgSortOrder.Width := 144;
         rgSortOrder.Left := 265;
         cbInvalid.Visible := False;
         rgSex.Items[1] := '&Bulls and Males';
      end;

   rgSortby.Items.Add('&National Identity Number');
   rgSortby.Items.Add('Date Of &Birth');
   rgSortby.Items.Add('S&ex');
   rgSortby.ItemIndex := 0; // No. Sort

   FromDate.Text := FormatDateTime(cIrishDateStyle, IncMonth(Date, -12));
   ToDate.Text := FormatDateTime(cIrishDateStyle, Date );

   CheckPrintAnimal;
end;

procedure TCowRepFilter.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

procedure TCowRepFilter.FormActivate(Sender: TObject);
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

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TCowRepFilter.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cBovineHerdRegRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cBovineHerdRegRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

end.
