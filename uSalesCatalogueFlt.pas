{
* SP 05/07/2001 for some Peculiar reason, haven't quiet figured it out yet, the locate of cowExt will not work correctly
   So to get the class scores for each animal i'm using an SQL passing the tablename and animal id into it.
   **Do not change the form height, then grid moves up when in runtime.**
 ----------------------------------------------------------------------------

 SP 13/01/2003:-

 NatIDNum caption displayed in report.
 Also small bug, Yields for Animal caption was incorrectly displayed.

 SP 13/01/2003.

 ----------------------------------------------------------------------------

 15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.

 25/03/19 [V5.8 R8.3] /MK Additional Feature - Added the Apply Animal Grid Filter button to this report which filters adds the animals
                                               from the filter on the main grid to the grid. Don't allow the user to switch to Select By Cow No
                                               off if the filter is on - Johnny O'Hanlon.
}

unit uSalesCatalogueFlt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DBTables, Db, Qrctrls,
  quickrpt, RXLookup, RXSpin, DBCtrls, Grids, DBGrids, RXCtrls, ComCtrls,
  ToolWin, RXDBCtrl, QRExport, cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TfSalesCatalogueFlt = class(TForm)
    AnimalInfo: TTable;
    RepSalesCatalogue : TQuickRep;
    MainQuery: TQuery;
    SSire: TQuery;
    dsMain: TDataSource;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    MilkTable: TTable;
    Dams: TTable;
    Sires: TTable;
    GetAnimals: TQuery;
    GetMilk: TQuery;
    Sire: TQuery;
    SDam: TQuery;
    qDams3: TQuery;
    QSire3: TQuery;
    qMilk3: TQuery;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    dsDam3: TDataSource;
    GroupHeaderBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    GroupHeaderBand2: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qDams4: TQuery;
    qSires4: TQuery;
    qMilk4: TQuery;
    dsDams4: TDataSource;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    GHDam3: TQRBand;
    QRLabel9: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    GHDam6: TQRBand;
    QRLabel11: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    GHDam5: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    GHDam4: TQRBand;
    QRLabel15: TQRLabel;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    qDam5: TQuery;
    qSire5: TQuery;
    dsDam5: TDataSource;
    qMilk5: TQuery;
    qDams6: TQuery;
    qSires6: TQuery;
    dsDams6: TDataSource;
    qMilk6: TQuery;
    qDams7: TQuery;
    dsDams7: TDataSource;
    qMilk7: TQuery;
    qSires7: TQuery;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    qDams8: TQuery;
    qSires8: TQuery;
    dsDams8: TDataSource;
    qMilk8: TQuery;
    qMainCowMilk: TQuery;
    qAnimals: TQuery;
    dsAnimals: TDataSource;
    SelectedAnimals: TPanel;
    TmpTable: TTable;
    RangeAnimals: TPanel;
    MonthToLabel: TLabel;
    LactLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    FromLact: TRxSpinEdit;
    ToLact: TRxSpinEdit;
    AnimalsFrom: TRxDBLookupCombo;
    AnimalsTo: TRxDBLookupCombo;
    cbIncludeLeft: TCheckBox;
    cbSelectAnimals: TCheckBox;
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton5: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label7: TLabel;
    HerdCombo: TRxDBLookupCombo;
    ToolButton2: TToolButton;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    GenImage: TImage;
    cbImages: TCheckBox;
    QRImDAnimal: TQRImage;
    QRImGDAnimal: TQRImage;
    QRIm3DAnimal: TQRImage;
    QRIm4DAnimal: TQRImage;
    qGenBlob: TQuery;
    QRRichTextDam: TQRRichText;
    qrRichTextGDam: TQRRichText;
    qrRichText3Dam: TQRRichText;
    qrRichText4Dam: TQRRichText;
    pGrid: TPanel;
    dsAnimalGrid: TDataSource;
    AnimalGrid: TTable;
    AnimalGridID: TIntegerField;
    AnimalGridSelected: TBooleanField;
    AnimalGridAnimalNo: TStringField;
    AnimalGridSortAnimalNo: TStringField;
    AnimalGridName: TStringField;
    AnimalGridDOB: TDateField;
    qClassScore: TQuery;
    Label3: TLabel;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    AnimalNo: TQRDBText;
    QRImAnimal: TQRImage;
    QRRichTextCurrAnimal: TQRRichText;
    Yield: TQRLabel;
    GroupFooterBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRImSAnimal: TQRImage;
    QRRichTextSire: TQRRichText;
    NatIDNum: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    rgYieldOptions: TRadioGroup;
    Panel2: TPanel;
    sbSearch: TRxSpeedButton;
    rgSearch: TRadioGroup;
    Searchdlg: TEdit;
    gAGrid: TRxDBGrid;
    rgEBI: TRadioGroup;
    dbEBI: TQRDBText;
    lEBI: TQRLabel;
    cbFavourite: TcxCheckBox;
    cbFilter: TcxCheckBox;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure cbSelectAnimalsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbIncludeLeftClick(Sender: TObject);
    procedure HerdComboChange(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GroupHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GroupHeaderBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GHDam3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure GHDam4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure gAGridCellClick(Column: TColumn);
    procedure gAGridTitleClick(Column: TColumn);
    procedure sbSearchClick(Sender: TObject);
    procedure SearchdlgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchdlgChange(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbFilterPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    OrderByString : String;
    SortAsc   : Boolean;
    procedure CreateSalesTable;
    procedure FillTables;
    procedure InsertMilk ( AnimalID : Integer; LactNo : Integer; IsDam : Boolean = False );
    procedure SetUpAnimalListing;
    procedure SortGrid;
    Procedure GetClassScores(Table : TTable; AID : Integer);
    Procedure Continue;
  public
    { Public declarations }
    ContinueProcess : Boolean;
  end;

procedure ShowForm;

implementation
uses
    GenTypesConst,
    DairyData;

{$R *.DFM}

procedure ShowForm;
begin
     with TfSalesCatalogueFlt.Create(nil) do
        try
           MilkTable.TableName := 'SCMilkTable.db';
           Dams.TableName := 'SCDams.db';
           Sires.TableName := 'SCSires.db';
           AnimalInfo.TableName := 'SCAnimals.db';
           CreateSalesTable;
           RepSalesCatalogue.Hide;
           HerdCombo.Value := IntToStr(WinData.UserDefaultHerdID);
           ShowModal;
        finally
           AnimalInfo.Close;
           AnimalInfo.DeleteTable;
           AnimalInfo.Free;
           Application.ProcessMessages;
           MilkTable.Close;
           MilkTable.DeleteTable;
           MilkTable.Free;
           Application.ProcessMessages;
           Dams.Close;
           Dams.DeleteTable;
           Dams.Free;
           Application.ProcessMessages;
           Sires.Close;
           Sires.DeleteTable;
           Sire.Free;
           Application.ProcessMessages;
           AnimalGrid.Close;
           AnimalGrid.EmptyTable;
           AnimalGrid.Free;
           Application.ProcessMessages;
           Free;
        end;
end;

procedure TfSalesCatalogueFlt.SetUpAnimalListing;
begin
    with qAnimals do
       begin
          SQL.Clear;
          SQL.Add('Delete From ' + AnimalGrid.TableName + '');
          ExecSQL;

          SQL.Clear;
          SQL.Add('INSERT INTO ' + AnimalGrid.TableName + '(ID, AnimalNo, SortAnimalNo, Name, DOB)');
          SQL.Add('SELECT ID, AnimalNo, SortAnimalNo, Name, DateOfBirth');
          SQL.Add('FROM Animals');
          SQL.Add('WHERE (UPPER(Sex)<>"STEER")');
          SQL.Add('AND (Breeding=TRUE) ');
          SQL.Add('AND NOT (HerdID = ' + IntToStr(WinData.NONEHerdID) + ')');
          if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
             SQL.Add('AND ID IN (SELECT AF.AID FROM AFILTERS AF)')
          else
             begin
                if NOT cbSelectAnimals.Checked then
                   if NOT cbIncludeLeft.Checked then
                      SQL.Add('AND (InHerd=TRUE)');
                if HerdCombo.Value > '0' then
                   SQL.Add('AND (HerdID = ' + HerdCombo.Value + ')');
             end;
          SQL.Add('AND (AnimalDeleted=FALSE)');
          ExecSQL;

          if ( cbFilter.Checked ) and ( WinData.FilteredAnimals.RecordCount > 0 ) then
             begin
                SQL.Clear;
                SQL.Add('UPDATE '+AnimalGrid.TableName);
                SQL.Add('SET Selected = True');
                ExecSQL;
             end;
       end;
       SortGrid;
end;

procedure TfSalesCatalogueFlt.SortGrid;
begin
   AnimalGrid.IndexName := OrderByString;
   SortAsc := TRUE;
   if NOT(AnimalGrid.Active) then
      AnimalGrid.Active := TRUE;
   AnimalGrid.Open;
   AnimalGrid.First;
end;

procedure TfSalesCatalogueFlt.CreateSalesTable;
begin
    with MilkTable do
       begin
          FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
          FieldDefs.Add('Yield',ftFloat,0,FALSE);
          FieldDefs.Add('Prot',ftFloat,0,FALSE);
          FieldDefs.Add('BFat',ftFloat,0,FALSE);
          FieldDefs.Add('DaysInMilk',ftInteger,0,FALSE);
          FieldDefs.Add('LactNo',ftInteger,0,FALSE);
          FieldDefs.Add('CalvingDate',ftDate,0,FALSE);
          CreateTable;
       end;
    with Dams do
       begin
          FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
          // Dam Info
          FieldDefs.Add('Relation',ftInteger,0,FALSE); // 1 Dam 2 DDam 3 DDDam e.t.c.
          FieldDefs.Add('ID',ftInteger,0,FALSE);
          FieldDefs.Add('AnimalNo',ftString,10,FALSE);
          FieldDefs.Add('LactNo',ftInteger,0,FALSE);
          FieldDefs.Add('Name',ftString,40,FALSE);
          FieldDefs.Add('HBookNo',ftString,20,FALSE);
          FieldDefs.Add('Class',ftString,2,FALSE);
          FieldDefs.Add('Score',ftInteger,0,FALSE);
          FieldDefs.Add('EBI',ftFloat);
          CreateTable;
       end;
    with Sires do
       begin
          FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
          // Sire Info
          FieldDefs.Add('Relation',ftInteger,0,FALSE); // 1 Sire 2 SSire NO MORE
          FieldDefs.Add('ID',ftInteger,0,FALSE);
          FieldDefs.Add('AnimalNo',ftString,10,FALSE);
          FieldDefs.Add('Name',ftString,40,FALSE);
          FieldDefs.Add('HBookNo',ftString,20,FALSE);
          FieldDefs.Add('Class',ftString,2,FALSE);
          FieldDefs.Add('Score',ftInteger,0,FALSE);
          FieldDefs.Add('EBI',ftFloat);
          CreateTable;
       end;

    with AnimalInfo do
       begin
          FieldDefs.Clear;
          FieldDefs.Add('ID',ftInteger,0,FALSE);
          FieldDefs.Add('AnimalNo',ftString,10,FALSE);
          FieldDefs.Add('NatIDNum',ftString,20,FALSE); // SP 13/01/2003
          FieldDefs.Add('Name',ftString,40,FALSE);
          FieldDefs.Add('DOB',ftDate,0,FALSE);
          FieldDefs.Add('HBookNo',ftString,20,FALSE);
          FieldDefs.Add('Class',ftString,2,FALSE);
          FieldDefs.Add('Score',ftInteger,0,FALSE);
          FieldDefs.Add('AnimalPedDetails',ftString,180,FALSE);  //KVB
          // Sires Info
          FieldDefs.Add('SireID',ftInteger,0,FALSE);
          // Dams Info
          FieldDefs.Add('DamID',ftInteger,0,FALSE);
          // Sires Sire Info
          FieldDefs.Add('SSireID',ftInteger,0,FALSE);
          FieldDefs.Add('SSireNo',ftString,10,FALSE);
          FieldDefs.Add('SSireName',ftString,40,FALSE);
          FieldDefs.Add('SSireHBookNo',ftString,20,FALSE);
          FieldDefs.Add('SSClass',ftString,2,FALSE);
          FieldDefs.Add('SSScore',ftInteger,0,FALSE);
          // Sires Dam Info
          FieldDefs.Add('SDamID',ftInteger,0,FALSE);
          FieldDefs.Add('SDamNo',ftString,10,FALSE);
          FieldDefs.Add('SDamName',ftString,40,FALSE);
          FieldDefs.Add('SDamHBookNo',ftString,20,FALSE);
          FieldDefs.Add('SDClass',ftString,2,FALSE);
          FieldDefs.Add('SDScore',ftInteger,0,FALSE);


          FieldDefs.Add('EBI',ftFloat);
          CreateTable;
       end;
end;

procedure TfSalesCatalogueFlt.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TfSalesCatalogueFlt.InsertMilk ( AnimalID : Integer; LactNo : Integer; IsDam : Boolean = False );
var
   NoAdded : Integer;
begin
    if NOT MilkTable.Locate('AnimalID',AnimalID,[] ) then
       with MilkTable do
          begin
             NoAdded := 0;
             GetMilk.SQL.Clear;
             GetMilk.SQL.Add('SELECT * FROM MilkDisk');
             GetMilk.SQL.Add('WHERE (AnimalID = ' + IntToStr(AnimalID) + ')');
             GetMilk.Open;
             GetMilk.First;
             while NOT GetMilk.EOF do
                begin
                   Append;
                   FieldByName('AnimalID').AsInteger := AnimalID;
                   if rgYieldOptions.ItemIndex = 0 then
                      FieldByName('Yield').AsFloat := GetMilk.FieldBYName('Yield305').ASFloat
                   else
                      FieldByName('Yield').AsFloat := GetMilk.FieldBYName('CumYield').ASFloat;
                   FieldByName('Prot').AsFloat := GetMilk.FieldBYName('ProtPerc305').ASFloat;
                   FieldByName('BFat').AsFloat := GetMilk.FieldBYName('BFatPerc305').ASFloat;
                   if GetMilk.FieldBYName('DaysInMilk').AsInteger > 305 then
                      FieldByName('DaysInMilk').AsInteger := 305
                   else // SP 04/07/2001 don't let days in milk go over 305!!
                      FieldByName('DaysInMilk').AsInteger := GetMilk.FieldBYName('DaysInMilk').AsInteger;
                   FieldByName('LactNo').AsInteger := GetMilk.FieldBYName('LactNo').AsInteger;
                   if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                                                  VarArrayOf([AnimalID,
                                                  GetMilk.FieldByName('LactNo').AsInteger,
                                                  CCalvingEvent]), [] ) then
                      FieldByName('CalvingDate').AsDateTime := WinData.CheckEvents.FieldBYName('EventDate').AsDateTime;
                   Post;
                   GetMilk.Next;
                   Inc(NoAdded);
                end;

             if IsDam then
                begin
                   if not Locate('LactNo', LactNo, []) then
                      begin
                         Append;
                         FieldByName('AnimalID').AsInteger := AnimalID;
                         FieldByName('Yield').AsFloat := 0;
                         FieldByName('Prot').AsFloat := 0;
                         FieldByName('BFat').AsFloat := 0;
                         FieldByName('DaysInMilk').AsInteger := 0;
                         FieldByName('LactNo').AsInteger := LactNo;
                         if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',
                                                        VarArrayOf([AnimalID,LactNo,CCalvingEvent]), [] ) then
                            FieldByName('CalvingDate').AsDateTime := WinData.CheckEvents.FieldBYName('EventDate').AsDateTime;
                         Post;
                         Inc(NoAdded);
                      end;
                end;

             if NoAdded = 0 then // No Milk Record for that Animals add a Blank one
                begin
                   Append;
                   FieldByName('AnimalID').AsInteger := AnimalID;
                   FieldByName('Yield').AsFloat := 0;
                   FieldByName('Prot').AsFloat := 0;
                   FieldByName('BFat').AsFloat := 0;
                   FieldByName('DaysInMilk').AsInteger := 0;
                   FieldByName('LactNo').AsInteger := 0;
                   Post;
                end;
          end;
end;

procedure TfSalesCatalogueFlt.FillTables;
var
   DamID,
   SireID,
   DamToUse,
   DID : Integer; //DamID to locate in CowExt.db

begin
    GetAnimals.First;
    AnimalInfo.Open;
    Sires.Open;
    Dams.Open;
    MilkTable.Open;

    while NOT GetAnimals.EOF do
       begin
         // Insert Main Animal Record
         with AnimalInfo do
            begin
               Append;
               FieldByName('ID').AsInteger      := GetAnimals.FieldByName('ID').AsInteger;
               FieldByName('AnimalNo').AsString := GetAnimals.FieldByName('AnimalNo').AsString;
               FieldByName('NatIDNum').AsString := GetAnimals.FieldByName('NatIDNum').AsString;
               FieldByName('Name').AsString     := GetAnimals.FieldByName('Name').AsString;
               if NOT GetAnimals.FieldByName('DateOfBirth').IsNull then
                  FieldByName('DOB').ASDateTime := GetAnimals.FieldByName('DateOfBirth').AsDateTime;
               FieldByName('HBookNo').AsString  := GetAnimals.FieldByName('HerdBookNo').AsString;
               FieldByName('SireID').AsInteger  := GetAnimals.FieldByName('SireID').AsInteger;
               if GetAnimals.FieldByName('DonorDamID').AsInteger <= 0 then
                  begin
                     FieldByName('DamID').AsInteger   := GetAnimals.FieldByName('DamID').AsInteger;
                     DamToUse := (GetAnimals.FieldByName('DamId').AsInteger);
                  end
               else
                  begin
                     FieldByName('DamID').AsInteger   := GetAnimals.FieldByName('DonorDamID').AsInteger;
                     DamToUse := (GetAnimals.FieldByName('DonorDamId').AsInteger);
                  end;
               FieldByName('Class').AsString    := GetAnimals.FieldByName('LatestClass').AsString;
               FieldByName('Score').AsInteger   := GetAnimals.FieldByName('LatestClassScore').AsInteger;
               if GetAnimals.FieldByName('Sex').AsString = 'Female' then
                  FieldByName('EBI').AsFloat   := GetAnimals.FieldByName('EBI').AsFloat
               else
                  FieldByName('EBI').AsFloat   := GetAnimals.FieldByName('RBI').AsFloat;
               Post;
               if GetAnimals.FieldByName('Sex').AsString = 'Female' then
                  InsertMilk ( GetAnimals.FieldByName('ID').AsInteger, GetAnimals.FieldByName('LactNo').AsInteger, False );
            end;

            // Insert Dam Info
            if (DamToUse > 0) and (WinData.LookUpDamSire.Locate('ID',DamToUse,[])) then
               with Dams do
               begin
                  Append;
                  FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                  FieldByName('Relation').AsInteger    := 1;
                  FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                  FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                  FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                  FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                  GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
{                  if WinData.dsCowExt.DataSet.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger;,[]) then
                      begin
                         WinData.CowExt.FieldByName('LatestClass').AsString;
                         WinData.CowExt.FieldByName('LatestClassScore').AsInteger;
                     end; }
                  FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                  FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                  FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;
                  SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                  if ( WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 ) then
                     DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                  else
                     DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                  Post;
                  InsertMilk (WinData.LookUpDamSire.FieldByName('ID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, True );

                  // Dam's Sire Info
                  if (SireID > 0) And
                     (WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                     begin
                        Sires.Append;
                        Sires.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                        Sires.FieldByName('Relation').AsInteger    := 3;
                        Sires.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                        Sires.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        Sires.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                        Sires.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                        if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                           begin
                              Sires.FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                              Sires.FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                              Sires.FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                           end;
                        Sires.Post;
                     end;

                  // Dam's Dam (G Dam) Info
                  if (DamID > 0) And
                     (WinData.LookUpDamSire.Locate('ID',DamID,[])) then
                     begin
                        Append;
                        FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                        FieldByName('Relation').AsInteger    := 3;
                        FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                        FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                        FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                        // SP 06/07/2001
                        GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
                        FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                        FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                        FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;
                        SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                        if ( WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 ) then
                           DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                        else
                           DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                        Post;
                        InsertMilk (WinData.LookUpDamSire.FieldByName('ID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, False );
                        // GDam's Sire
                        if (SireID > 0) And
                           (WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                           begin
                              Sires.Append;
                              Sires.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                              Sires.FieldByName('Relation').AsInteger    := 4;
                              Sires.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                              Sires.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                              Sires.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                              Sires.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                              if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                                 begin
                                    Sires.FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                                    Sires.FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                                    Sires.FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                                 end;
                              Sires.Post;
                           end;


                        // G Dam's Dam (3rd Dam)
                        if (DamID > 0) And
                           (WinData.LookUpDamSire.Locate('ID',DamID,[])) then
                           begin
                              Append;
                              FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                              FieldByName('Relation').AsInteger    := 4;
                              FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                              FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                              FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                              FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                              // SP 06/07/2001
                              GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
                              FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                              FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                              FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;
                              SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                              if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 then
                                 DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                              else
                                 DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                              Post;
                              InsertMilk (WinData.LookUpDamSire.FieldByName('ID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, False );
                              // 3rd Dam's Sire
                              if (SireID > 0) And
                                 (WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                                 begin
                                    Sires.Append;
                                    Sires.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                    Sires.FieldByName('Relation').AsInteger    := 5;
                                    Sires.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                    Sires.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    Sires.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                    Sires.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                    if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                                       begin
                                          Sires.FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                                          Sires.FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                                          Sires.FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                                       end;
                                    Sires.Post;
                                 end;


                              // 3rd Dam's Dam (4th Dam)
                              if (DamID > 0) And
                                 (WinData.LookUpDamSire.Locate('ID',DamID,[])) then
                                 begin
                                    Append;
                                    FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                    FieldByName('Relation').AsInteger    := 5;
                                    FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                    FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                    FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                    FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                    // SP 06/07/2001
                                    GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
                                    FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                                    FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                                    FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;
                                    SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                    if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 then
                                       DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                                    else
                                       DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                                    Post;
                                    InsertMilk (WinData.LookUpDamSire.FieldByName('ID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, False );
                                    // 4th Dam's Sire
                                    if (SireID > 0) And
                                       (WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                                       begin
                                          Sires.Append;
                                          Sires.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                          Sires.FieldByName('Relation').AsInteger    := 6;
                                          Sires.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                          Sires.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                          Sires.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                          Sires.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                          if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                                             begin
                                                Sires.FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                                                Sires.FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                                                Sires.FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                                             end;
                                          Sires.Post;
                                       end;


                                    // 4th Dam's Dam (5th Dam)
                                    if (DamID > 0) And
                                       (WinData.LookUpDamSire.Locate('ID',DamID,[])) then
                                       begin
                                          Append;
                                          FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                          FieldByName('Relation').AsInteger    := 6;
                                          FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                          FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                          FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                          FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                         // SP 06/07/2001
                                          GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
                                          FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                                          FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                                          FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;
                                          SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                          if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 then
                                             DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                                          else
                                             DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                                          Post;
                                          InsertMilk (WinData.LookUpDamSire.FieldByName('ID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, False );
                                          // 5th Dam's Sire
                                          if (SireID > 0) And
                                             (WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                                             begin
                                                Sires.Append;
                                                Sires.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                                Sires.FieldByName('Relation').AsInteger    := 7;
                                                Sires.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                                Sires.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                Sires.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                                Sires.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                                if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                                                   begin
                                                      Sires.FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                                                      Sires.FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                                                      Sires.FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                                                   end;
                                                Sires.Post;
                                             end;

                                          // 5th Dam's Dam (6th Dam)
                                          if (DamID > 0) And
                                             (WinData.LookUpDamSire.Locate('ID',DamID,[])) then
                                             begin
                                                Append;
                                                FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                                FieldByName('Relation').AsInteger    := 7;
                                                FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                                FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                                FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                                // SP 06/07/2001
                                                GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
                                                FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                                                FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                                                FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;
                                                SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                                if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 then
                                                   DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                                                else
                                                   DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                                                Post;
                                                InsertMilk (WinData.LookUpDamSire.FieldByName('ID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, False );
                                                // 6th Dam's Sire
                                                if ( SireID > 0 ) And
                                                   ( WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                                                   begin
                                                      Sires.Append;
                                                      Sires.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                                                      Sires.FieldByName('Relation').AsInteger    := 8;
                                                      Sires.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                                      Sires.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                                                      Sires.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                                      Sires.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                                                      if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                                                         begin
                                                            Sires.FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                                                            Sires.FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                                                            Sires.FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                                                         end;
                                                      Sires.Post;
                                                   end;
                                             end;
                                       end;
                                 end;
                           end;
                     end;

               end;
         // Insert Sire Info
         if (GetAnimals.FieldByName('SireID').AsInteger > 0) And
            (WinData.LookUpDamSire.Locate('ID',GetAnimals.FieldByName('SireID').AsInteger,[])) then
            with Sires do
               begin
                  Append;
                  FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                  FieldByName('Relation').AsInteger    := 1;
                  FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                  FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                  FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                  FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                  if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                     begin
                        FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                        FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                        FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                     end;
                  SireID := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                  if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger <= 0 then
                     DamID := WinData.LookUpDamSire.FieldByName('DamID').AsInteger
                  else
                     DamID := WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger;
                  Post;
                  // Sires Sire Info
                  if (SireID > 0) And
                     (WinData.LookUpDamSire.Locate('ID',SireID,[])) then
                     begin
                        Append;
                        FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                        FieldByName('Relation').AsInteger    := 2;
                        FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                        FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                        FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                        if WinData.BullExt.Locate('AnimalID',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[]) then
                           begin
                              FieldByName('Class').AsString  := WinData.BullExt.FieldByName('LatestClass').AsString;
                              FieldByName('Score').AsInteger := WinData.BullExt.FieldByName('LatestClassScore').AsInteger;
                              FieldByName('EBI').AsFloat := WinData.BullExt.FieldByName('RBI').AsFloat;
                           end;
                        Post;
                     end;
                  // Dams Dam Info
                  if (DamID > 0) And
                     (WinData.LookUpDamSire.Locate('ID',DamID,[])) then
                     begin
                        Dams.Append;
                        Dams.FieldByName('AnimalID').AsInteger    := GetAnimals.FieldByName('ID').AsInteger;
                        Dams.FieldByName('Relation').AsInteger    := 2;
                        Dams.FieldByName('ID').AsInteger          := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                        Dams.FieldByName('AnimalNo').AsString     := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
                        Dams.FieldByName('Name').AsString         := WinData.LookUpDamSire.FieldByName('Name').AsString;
                        Dams.FieldByName('HBookNo').AsString      := WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString;
                        GetClassScores(WinData.CowExt,WinData.LookUpDamSire.FieldByName('ID').AsInteger);
                        Dams.FieldByName('Class').AsString  := qClassScore.FieldByName('LatestClass').AsString;
                        Dams.FieldByName('Score').AsInteger := qClassScore.FieldByName('LatestClassScore').AsInteger;
                        Dams.FieldByName('EBI').AsFloat := qClassScore.FieldByName('EBI').AsFloat;

                        Dams.Post;
                        InsertMilk (WinData.LookUpDamSire.FieldByName('DamID').AsInteger, WinData.LookUpDamSire.FieldByName('LactNo').AsInteger, False );
                     end;
               end;
         GetAnimals.Next;
       end;
end;

procedure TfSalesCatalogueFlt.Continue;
begin
   ContinueProcess := FALSE;
   if NOT(cbSelectAnimals.Checked) AND (AnimalsFrom.Text = '<All>') AND (AnimalsTo.Text = '<All>')then
      begin
         if MessageDlg('You have choosen to view all animals,'#13+
                       'this process could take could take a few minutes to complete.',mtConfirmation,[mbYes,mbNo],0) = mrYes then
            ContinueProcess := TRUE;
      end
   else if NOT(cbSelectAnimals.Checked) AND (AnimalsFrom.Text <> '<All>') OR (AnimalsTo.Text <> '<All>')then
      ContinueProcess := TRUE
   else if (cbSelectAnimals.Checked) then
      ContinueProcess := TRUE;
end;

procedure TfSalesCatalogueFlt.ViewBtnClick(Sender: TObject);
Var
   CurrRec : TBookmark;
begin
  try
     Continue;
     if ContinueProcess then
        begin
            if cbSelectAnimals.Checked then
               begin
                  TmpTable.TableName := 'TmpSalesCatalogue.db';
                  TmpTable.FieldDefs.Clear;
                  TmpTable.FieldDefs.Add('ID', ftInteger, 0, FALSE);
                  TmpTable.CreateTable;
                  TmpTable.Open;

                  with AnimalGrid do             // SP 04/07/2001
                     begin
                        CurrRec := gAGrid.DataSource.DataSet.GetBookMark;
                        First;
                        while NOT AnimalGrid.EOF do
                           begin
                              if FieldByName('Selected').AsBoolean then
                                 begin
                                    TmpTable.Append;
                                    TmpTable.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
                                    TmpTable.Post;
                                 end;
                              Next;
                           end;
                        gAgrid.DataSource.DataSet.GotoBookmark(CurrRec);
                        gAgrid.DataSource.DataSet.FreeBookmark(CurrRec);
                     end;
               end;

            with GetAnimals do
               begin
                  SQL.Clear;
                  SQL.Add('DELETE FROM ' + AnimalInfo.TableName );
                  ExecSQL;
                  // changed to include HUKI classifications - kr 12/7/00
                  SQL.Clear;
                  SQL.Add('SELECT DISTINCT A.ID, A.LactNo, A.AnimalNo, A.NatIDNum, A.Sex, A.HerdBookNo, A.Name,');
                  SQL.Add('                A.DateOfBirth, A.SireID, A.DamID, A.DonorDamID, C.EBI, C.LatestClass,');
                  SQL.Add('                C.LatestClassScore, B.RBI, B.LatestClass, B.LatestClassScore');
                  SQL.Add('FROM "Animals.DB" A');
                  SQL.Add('LEFT JOIN "CowExt.db" C ON (A.ID=C.AnimalID)');
                  SQL.Add('LEFT JOIN "BullExt.db" B ON (A.ID=B.AnimalID)');
                  SQL.Add('WHERE (UPPER(Sex)<>"STEER")');
                  // SQL.Add('AND   (InHerd=TRUE)');
                  SQL.Add('AND NOT  (HerdID = ' + IntToStr(WinData.NONEHerdID) + ')');
                  if HerdCombo.Value > '0' then
                     SQL.Add('AND (HerdID = ' + HerdCombo.Value + ')');

                  if NOT cbSelectAnimals.Checked then
                     begin
                        SQL.Add('AND (LactNo BETWEEN ' + IntToStr(FromLact.AsInteger) + ' AND ' +
                                               IntToStr(ToLact.AsInteger) + ')');
                        if ( AnimalsFrom.Value > '0' ) then
                           SQL.Add('AND (AnimalNo >= ''' + AnimalsFrom.Text + ''')');
                        if ( AnimalsTo.Value > '0' ) then
                           SQL.Add('AND (AnimalNo <= ''' + AnimalsTo.Text + ''')');
                        if ( NOT cbIncludeLeft.Checked ) then
                           SQL.Add('AND (InHerd = TRUE)');
                     end
                  else
                     begin
                        SQL.Add('AND ID IN ');
                        SQL.Add('(SELECT ID FROM ' + TmpTable.TableName + ') ');
                     end;
                  SQL.Add('AND (AnimalDeleted = False)');

                  Open;
                  FillTables;

                  MainQuery.Close;
                  MainQuery.Open;
                  Sire.Open;
                  qMainCowMilk.Open;
                  SSire.Open;
                  SDam.Open;
                  QSire3.Open;
                  qDams3.Open;
                  qMilk3.Open;
                  qDams4.Open;
                  qSires4.Open;
                  qMilk4.Open;
                  qDam5.Open;
                  qSire5.Open;
                  qMilk5.Open;
                  qDams6.Open;
                  qSires6.Open;
                  qMilk6.Open;
                  qDams7.Open;
                  qSires7.Open;
                  qMilk7.Open;
                  qDams8.Open;
                  qSires8.Open;
                  qMilk8.Open;
               end;

            if ( Sender as TRxSpeedButton ).Name = 'sbView' then
               RepSalesCatalogue.Preview
            else
               RepSalesCatalogue.Print;
        end;
   finally
      if cbSelectAnimals.Checked then
         begin
            TmpTable.Close;
            TmpTable.DeleteTable;
         end;
   end;
end;

procedure TfSalesCatalogueFlt.cbSelectAnimalsClick(Sender: TObject);
begin
   if cbSelectAnimals.Checked then
      begin
         pGrid.Show;
         RangeAnimals.Hide;
         SelectedAnimals.Height := 86;
         pGrid.Top := 105;
      end
   else
      begin
         RangeAnimals.Show;
         pGrid.Hide;
         SelectedAnimals.Height := 185;
         pGrid.Top := 212;
         SetUpAnimalListing;
      end;
end;

procedure TfSalesCatalogueFlt.FormShow(Sender: TObject);
begin
   OrderByString := 'iSortAnimalNo';
   rgSearch.ItemIndex := 0;
   SearchDlg.SelectAll;
   SetUpAnimalListing;
   cbSelectAnimalsClick(Sender);

   //   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
   cbFavourite.Checked := WinData.IsReportFavourite(cSalesCatRep);
   WinData.UpdateRecentReportUsage(cSalesCatRep);
end;

procedure TfSalesCatalogueFlt.cbIncludeLeftClick(Sender: TObject);
begin
    SetUpAnimalListing;
end;

procedure TfSalesCatalogueFlt.HerdComboChange(Sender: TObject);
begin
    SetUpAnimalListing;
end;

procedure TfSalesCatalogueFlt.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
   //FileAddress : String;     //KVB - FileSearch does not return the FileType
   FileHeight : Integer;
   FileWidth : Integer;
begin
     //Note: Class and Score come from CowExt.db table, fields LatestClass and LatestClassScore respectively, OR
     //      from the BullExt.db table, fields LatestClass and LatestClassScore respectively.
     //Note: SCAnimals, SCDams and SCSires come from GetAnimals


     if MainQuery.FieldByName('ID').AsInteger > 0 then
        begin
           //Animal Detail Band
           FileHeight := 0;
           FileWidth := 0;
           //Need to reposition fields depending on whether an Image exists
           AID := MainQuery.FieldByName('ID').AsString;

           //Now get any Blob information for the animal
           qGenBlob.SQL.Clear;
           qGenBlob.SQL.Add('Select AnimalPedDetails FROM PedDetails');
           qGenBlob.SQL.Add('Where (AnimalID = ' + AID + ')');
           qGenBlob.Open;
           qrRichTextCurrAnimal.Lines.Text := qGenBlob.FieldByName('AnimalPedDetails').AsString;

           //Need some code to locate the File Name of the current image
           FileName := '1';
           //FileExt := '.*';
           FileExt := '.jpg';
           FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName;  //Animal Image
           //FileAddress := FileSearch(FileName, 'C:\Kingswood Herd Management\Images\' + AID + '\');
           If (( cbImages.Checked ) AND ( FileExists(FileToPrint + FileExt))) then   //Looks for file of any extension
              Begin
                    //Image Exists Settings

                    //Need some code below to get the File Extension to allow different
                    //File types to be used
                    //FileExt := ExtractFileExt(FileToPrint);   //Gets extension eg ".jpg"

                    //Load Image into GenImage to get image size
                    GenImage.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                    FileHeight := GenImage.Height;
                    FileWidth := GenImage.Width;
                    //Set Default size for Report Image
                    QRImAnimal.Stretch := False;   //Turns off Stretching
                    QRImAnimal.Width := 300;
                    QRImAnimal.Height := 160;
                    //Now to adjust the Width of the Report Image to the ratio of GenImage
                    //keeping the Height limited to 160.
                    QRImAnimal.Width := Round(( FileWidth * QRImAnimal.Height ) / FileHeight );
                    //Need to check that the File Type is compatible with the Image Object
                    QRImAnimal.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                    QRImAnimal.Stretch := True;   //Now to Stretch Image to fit

                    //Now to set remaining values
                    If ( qrRichTextCurrAnimal.Lines.Count < 5 ) then
                        Sender.Height := 200   //GroupBand
                    Else
                        Sender.Height := ( 200 + (( qrRichTextCurrAnimal.Lines.Count - 4 ) * 18 ));

                    QRRichTextCurrAnimal.Left := 4;     //Comment
                    QRRichTextCurrAnimal.Top := 96;
                    QRRichTextCurrAnimal.Width := 420;
                    //QRRichTextCurrAnimal.Height := 55;
                    qrRichTextCurrAnimal.Height := ( 18 *  qrRichTextCurrAnimal.Lines.Count );

                    Yield.Top := qrRichTextCurrAnimal.Top + ( 18 *  qrRichTextCurrAnimal.Lines.Count ) + 2;
                    if qrRichTextCurrAnimal.Lines.Count > 2 then
                       Sender.Height := Yield.Top + Yield.Height + 2
                    else
                       Sender.Height := QRImAnimal.Top + QRImAnimal.Height+2;

//                    Yield.Top := 160;
                    Yield.Left := 4;
                    QRDBText6.Left := 4;   //Name Field
                    QRDBText6.Top := 1;
                    QRDBText76.Left := 327;  //Class
                    QRDBText76.Top := 3;
                    QRDBText77.Left := 346;    //Score
                    QRDBText77.Top := 3;
                    QRDBText1.Left := 4;    //HBookNo
                    QRDBText1.Top := 25;
                    QRLabel2.Left := 4;    //Label: "Born"
                    QRLabel2.Top := 50;
                    QRDBText8.Left := 40;    //DOB
                    QRDBText8.Top := 50;

                    AnimalNo.Left := 4;    //AnimalNo
                    AnimalNo.Top := 75;

                    NatIDNum.Left := 90;    //AnimalNo
                    NatIDNum.Top := 75;

                    lEBI.Left := 378;
                    lEBI.Top  := 3;
                    dbEBI.Left := 403;
                    dbEBI.Top := 3;
              End
           Else
               Begin
                    //No Image Settings
                    If Length( qrRichTextCurrAnimal.Lines.Text ) > 0 then
                       Begin
                          NatIDNum.Left := 4;
                          NatIDNum.Top := 24;
                          QRRichTextCurrAnimal.Left :=4;
                          QRRichTextCurrAnimal.Top := 44;
                          QRRichTextCurrAnimal.Width := 420;
                          qrRichTextCurrAnimal.Height := ( 18 *  qrRichTextCurrAnimal.Lines.Count ) + 2;
                          Yield.Top := qrRichTextCurrAnimal.Top + ( 18 *  qrRichTextCurrAnimal.Lines.Count ) + 2;
                          Sender.Height := Yield.Top + Yield.Height+2;
                       End
                    Else
                       begin
                          Sender.Height := 80;   //GroupBand
                          Yield.Top := 56;
                       end;

                    NatIDNum.Left := 4;
                    NatIDNum.Top := 24;

                    QRDBText76.Left := NatIDNum.Left + NatIDNum.Width + 100;
                    QRDBText76.Top := 24;
                    QRDBText77.Left := QRDBText76.Left + 20;
                    QRDBText77.Top := 24;

                    lEBI.Left := QRDBText77.Left + 20 + 50;
                    lEBI.Top  := 24;
                    dbEBI.Left := lEBI.Left + lEBI.Width + 5;
                    dbEBI.Top := 24;

                    Yield.Left := 4;

                    QRDBText6.Left := 4;   //Name Field
                    QRDBText6.Top := 1;
                    QRDBText1.Left := 391;    //HBookNo
                    QRDBText1.Top := 3;
                    QRLabel2.Left := 482;    //Label: "Born"
                    QRLabel2.Top := 3;
                    QRDBText8.Left := 518;    //DOB
                    QRDBText8.Top := 3;
                    AnimalNo.Left := 614;    //AnimalNo
                    AnimalNo.Top := 3;
                    //Now to hide Report Image
                    QRImAnimal.Width := 0  ;   //Animal Image
               End;
     end;

   if rgEBI.ItemIndex = 1 then
      begin
         lEBI.Enabled := False;
         lEBI.Visible := False;
         dbEBI.Enabled := False;
         dbEBI.Visible := False;
      end
   else
      begin
         lEBI.Enabled := True;
         lEBI.Visible := True;
         dbEBI.Enabled := True;
         dbEBI.Visible := True;
      end
end;

procedure TfSalesCatalogueFlt.QRGroup2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
   FileHeight : Integer;
   FileWidth : Integer;
begin
   if Sire.FieldByName('ID').AsInteger > 0 then
      begin
         //Sire Detail Band
         FileHeight := 0;
         FileWidth := 0;
         //Need to reposition fields depending on whether an Image exists
         AID := Sire.FieldByName('ID').AsString;

         //Now get any Blob information for the animal
         qGenBlob.SQL.Clear;
         qGenBlob.SQL.Add('Select AnimalPedDetails FROM PedDetails');
         qGenBlob.SQL.Add('Where (AnimalID = ' + AID + ')');
         qGenBlob.Open;
         qrRichTextSire.Lines.Text := qGenBlob.FieldByName('AnimalPedDetails').AsString;

         //Need some code to locate the File Name of the current image
         FileName := '1';
         //FileExt := '.*';
         FileExt := '.jpg';
         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName;  //Animal Image
         If (( cbImages.Checked ) AND ( FileExists(FileToPrint + FileExt))) then   //Looks for file of any extension
            Begin
                  //Image Exists Settings

                  //Need some code below to get the File Extension to allow different
                  //File types to be used
                  //FileExt := ExtractFileExt(FileToPrint);   //Gets extension eg ".jpg"

                  //Load Image into GenImage to get image size
                  GenImage.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  FileHeight := GenImage.Height;
                  FileWidth := GenImage.Width;
                  //Set Default size for Report Image
                  QRImSAnimal.Stretch := False;   //Turns off Stretching
                  QRImSAnimal.Width := 300;
                  QRImSAnimal.Height := 160;
                  //Now to adjust the Width of the Report Image to the ratio of GenImage
                  //keeping the Height limited to 160.
                  QRImSAnimal.Width := Round(( FileWidth * QRImSAnimal.Height ) / FileHeight );
                  //Need to check that the File Type is compatible with the Image Object
                  QRImSAnimal.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  QRImSAnimal.Stretch := True;   //Now to Stretch Image to fit

                  //Now to set remaining values
                  If ( qrRichTextSire.Lines.Count < 4 ) then
                     Sender.Height := 192   //GroupBand
                  Else
                      Sender.Height := ( 192 + (( qrRichTextSire.Lines.Count - 3 ) * 18 ));
                  QRRichTextSire.Left := 4;     //Comment
                  QRRichTextSire.Top := 142;
                  QRRichTextSire.Width := 420;
                  qrRichTextSire.Height := ( 18 *  qrRichTextSire.Lines.Count );

                  QRLabel1.Left := 4;   //Label: "Sire - "
                  QRLabel1.Top := 12;
                  QRDBText7.Left := 48;  //Name
                  QRDBText7.Top := 14;
                  QRDBText78.Left := 300;  //Class
                  QRDBText78.Top := 14;
                  QRDBText79.Left := 319;    //Score
                  QRDBText79.Top := 14;
                  QRDBText9.Left := 48;    //HBookNo
                  QRDBText9.Top := 35;
                  QRLabel3.Left := 30;    //Label: "ss -"
                  QRLabel3.Top := 55;
                  QRDBText10.Left := 60;  //ssName
                  QRDBText10.Top := 58;
                  QRDBText106.Left := 300; //ssClass
                  QRDBText106.Top := 57;
                  QRDBText107.Left := 319; //ssScore
                  QRDBText107.Top := 57;
                  QRDBText13.Left := 60; //ssHBookNo
                  QRDBText13.Top := 82;
                  QRLabel4.Left := 30;    //Label: "sd -"
                  QRLabel4.Top := 100;
                  QRDBText11.Left := 60;  //sdName
                  QRDBText11.Top := 102;
                  QRDBText104.Left := 300; //sdClass
                  QRDBText104.Top := 101;
                  QRDBText105.Left := 319; //sdScore
                  QRDBText105.Top := 101;
                  QRDBText12.Left := 60; //sdHBookNo
                  QRDBText12.Top := 122;

            End
         Else
             Begin
                  //No Image Settings
                  If Length( qrRichTextSire.Lines.Text ) > 0 then
                     Begin
                        Sender.Height := ( 96 + ( qrRichTextSire.Lines.Count * 18 ));    //GroupBand

                        QRRichTextSire.Left := 4;     //Comment
                        QRRichTextSire.Top := 96;
                        QRRichTextSire.Width := 420;
                        qrRichTextSire.Height := ( 18 *  qrRichTextSire.Lines.Count );
                     End
                  Else
                     Sender.Height := 96;   //GroupBand

                  QRLabel1.Left := 4;   //Label: "Sire - "
                  QRLabel1.Top := 12;
                  QRDBText7.Left := 4;  //Name
                  QRDBText7.Top := 32;
                  QRDBText78.Left := 256;  //Class
                  QRDBText78.Top := 32;
                  QRDBText79.Left := 275;    //Score
                  QRDBText79.Top := 32;
                  QRDBText9.Left := 4;    //HBookNo
                  QRDBText9.Top := 52;
                  QRLabel3.Left := 390;    //Label: "ss -"
                  QRLabel3.Top := 9;
                  QRDBText10.Left := 420;  //ssName
                  QRDBText10.Top := 12;
                  QRDBText106.Left := 660; //ssClass
                  QRDBText106.Top := 11;
                  QRDBText107.Left := 679; //ssScore
                  QRDBText107.Top := 11;
                  QRDBText13.Left := 420; //ssHBookNo
                  QRDBText13.Top := 36;
                  QRLabel4.Left := 390;    //Label: "sd -"
                  QRLabel4.Top := 54;
                  QRDBText11.Left := 420;  //sdName
                  QRDBText11.Top := 56;
                  QRDBText104.Left := 660; //sdClass
                  QRDBText104.Top := 55;
                  QRDBText105.Left := 679; //sdScore
                  QRDBText105.Top := 55;
                  QRDBText12.Left := 420; //sdHBookNo
                  QRDBText12.Top := 76;
                  //Now to hide Report Image
                  QRImSAnimal.Width := 0  ;   //Animal Image
             End;
      end;
end;

procedure TfSalesCatalogueFlt.GroupHeaderBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
   FileHeight : Integer;
   FileWidth : Integer;
begin
   if qDams3.FieldByName('ID').AsInteger > 0 then
      begin
         //Dam Detail Band
         FileHeight := 0;
         FileWidth := 0;
         //Need to reposition fields depending on whether an Image exists
         AID := qDams3.FieldByName('ID').AsString;

         //Now get any Blob information for the animal
         qGenBlob.SQL.Clear;
         qGenBlob.SQL.Add('Select AnimalPedDetails FROM PedDetails');
         qGenBlob.SQL.Add('Where (AnimalID = ' + AID + ')');
         qGenBlob.Open;
         qrRichTextDam.Lines.Text := qGenBlob.FieldByName('AnimalPedDetails').AsString;

         //Need some code to locate the File Name of the current image
         FileName := '1';
         //FileExt := '.*';
         FileExt := '.jpg';
         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName;  //Animal Image
         If (( cbImages.Checked ) AND ( FileExists(FileToPrint + FileExt))) then   //Looks for file of any extension
            Begin
                  //Image Exists Settings

                  //Need some code below to get the File Extension to allow different
                  //File types to be used
                  //FileExt := ExtractFileExt(FileToPrint);   //Gets extension eg ".jpg"

                  //Load Image into GenImage to get image size
                  GenImage.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  FileHeight := GenImage.Height;
                  FileWidth := GenImage.Width;
                  //Set Default size for Report Image
                  QRImDAnimal.Stretch := False;   //Turns off Stretching
                  QRImDAnimal.Width := 300;
                  QRImDAnimal.Height := 160;
                  //Now to adjust the Width of the Report Image to the ratio of GenImage
                  //keeping the Height limited to 160.
                  QRImDAnimal.Width := Round(( FileWidth * QRImDAnimal.Height ) / FileHeight );
                  //Need to check that the File Type is compatible with the Image Object
                  QRImDAnimal.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  QRImDAnimal.Stretch := True;   //Now to Stretch Image to fit

                  //Now to set remaining values
                  If ( qrRichTextDam.Lines.Count < 5 ) then
                     Sender.Height := 166   //GroupBand
                  Else
                      Sender.Height := ( 166 + (( qrRichTextDam.Lines.Count - 4 ) * 18 ));
                  QRRichTextDam.Left := 4;     //Comment
                  QRRichTextDam.Top := 100;
                  QRRichTextDam.Width := 420;
                  qrRichTextDam.Height := ( 18 *  qrRichTextDam.Lines.Count );

                  QRLabel7.Left := 4;   //Label: "Dam - "
                  QRLabel7.Top := 12;
                  QRDBText20.Left := 52;  //Name
                  QRDBText20.Top := 14;
                  QRDBText80.Left := 300;  //Class
                  QRDBText80.Top := 14;
                  QRDBText81.Left := 319;    //Score
                  QRDBText81.Top := 14;
                  QRDBText21.Left := 52;    //HBookNo
                  QRDBText21.Top := 35;
                  QRLabel8.Left := 24;    //Label: "by -"
                  QRLabel8.Top := 58;
                  QRDBText22.Left := 52;  //dsName
                  QRDBText22.Top := 58;
                  QRDBText102.Left := 300; //dsClass
                  QRDBText102.Top := 58;
                  QRDBText103.Left := 319; //dsScore
                  QRDBText103.Top := 58;
                  QRDBText23.Left := 52; //dsHBookNo
                  QRDBText23.Top := 78;

            End
         Else
             Begin
                  //No Image Settings
                  If Length( qrRichTextDam.Lines.Text ) > 0 then
                     Begin
                        Sender.Height := ( 72 + ( qrRichTextDam.Lines.Count * 18 ));    //GroupBand

                        QRRichTextDam.Left := 4;     //Comment
                        QRRichTextDam.Top := 72;
                        QRRichTextDam.Width := 420;
                        qrRichTextDam.Height := ( 18 *  qrRichTextDam.Lines.Count );
                     End
                  Else
                     Sender.Height := 80;   //GroupBand

                  QRLabel7.Left := 4;   //Label: "Dam - "
                  QRLabel7.Top := 12;
                  QRDBText20.Left := 4;  //Name
                  QRDBText20.Top := 32;
                  QRDBText80.Left := 256;  //Class
                  QRDBText80.Top := 32;
                  QRDBText81.Left := 275;    //Score
                  QRDBText81.Top := 32;
                  QRDBText21.Left := 4;    //HBookNo
                  QRDBText21.Top := 52;
                  QRLabel8.Left := 392;    //Label: "by -"
                  QRLabel8.Top := 32;
                  QRDBText22.Left := 420;  //dsName
                  QRDBText22.Top := 32;
                  QRDBText102.Left := 660; //dsClass
                  QRDBText102.Top := 32;
                  QRDBText103.Left := 679; //dsScore
                  QRDBText103.Top := 32;
                  QRDBText23.Left := 420; //dsHBookNo
                  QRDBText23.Top := 52;

                  //Now to hide Report Image
                  QRImDAnimal.Width := 0  ;   //Animal Image
             End;
      end;
end;

procedure TfSalesCatalogueFlt.GroupHeaderBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
   FileHeight : Integer;
   FileWidth : Integer;
begin
   if qDams4.FieldByName('ID').AsInteger > 0 then
      begin
         //G - Dam Detail Band   (Grand Dam)
         FileHeight := 0;
         FileWidth := 0;
         //Need to reposition fields depending on whether an Image exists
         AID := qDams4.FieldByName('ID').AsString;

         //Now get any Blob information for the animal
         qGenBlob.SQL.Clear;
         qGenBlob.SQL.Add('Select AnimalPedDetails FROM PedDetails');
         qGenBlob.SQL.Add('Where (AnimalID = ' + AID + ')');
         qGenBlob.Open;
         qrRichTextGDam.Lines.Text := qGenBlob.FieldByName('AnimalPedDetails').AsString;

         //Need some code to locate the File Name of the current image
         FileName := '1';
         //FileExt := '.*';
         FileExt := '.jpg';
         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName;  //Animal Image
         If (( cbImages.Checked ) AND ( FileExists(FileToPrint + FileExt))) then   //Looks for file of any extension
            Begin
                  //Image Exists Settings

                  //Need some code below to get the File Extension to allow different
                  //File types to be used
                  //FileExt := ExtractFileExt(FileToPrint);   //Gets extension eg ".jpg"

                  //Load Image into GenImage to get image size
                  GenImage.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  FileHeight := GenImage.Height;
                  FileWidth := GenImage.Width;
                  //Set Default size for Report Image
                  QRImGDAnimal.Stretch := False;   //Turns off Stretching
                  QRImGDAnimal.Width := 300;
                  QRImGDAnimal.Height := 160;
                  //Now to adjust the Width of the Report Image to the ratio of GenImage
                  //keeping the Height limited to 160.
                  QRImGDAnimal.Width := Round(( FileWidth * QRImGDAnimal.Height ) / FileHeight );
                  //Need to check that the File Type is compatible with the Image Object
                  QRImGDAnimal.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  QRImGDAnimal.Stretch := True;   //Now to Stretch Image to fit

                  //Now to set remaining values
                  If ( qrRichTextGDam.Lines.Count < 5 ) then
                     Sender.Height := 166   //GroupBand
                  Else
                      Sender.Height := ( 166 + (( qrRichTextGDam.Lines.Count - 4 ) * 18 ));
                  QRRichTextGDam.Left := 4;     //Comment
                  QRRichTextGDam.Top := 100;
                  QRRichTextGDam.Width := 420;
                  qrRichTextGDam.Height := ( 18 *  qrRichTextGDam.Lines.Count );

                  QRLabel5.Left := 4;   //Label: "G Dam - "
                  QRLabel5.Top := 12;
                  QRDBText2.Left := 68;  //Name
                  QRDBText2.Top := 14;
                  QRDBText82.Left := 300;  //Class
                  QRDBText82.Top := 14;
                  QRDBText83.Left := 319;    //Score
                  QRDBText83.Top := 14;
                  QRDBText3.Left := 68;    //HBookNo
                  QRDBText3.Top := 35;
                  QRLabel6.Left := 24;    //Label: "by -"
                  QRLabel6.Top := 58;
                  QRDBText14.Left := 52;  //GdsName
                  QRDBText14.Top := 58;
                  QRDBText100.Left := 300; //GdsClass
                  QRDBText100.Top := 58;
                  QRDBText101.Left := 319; //GdsScore
                  QRDBText101.Top := 58;
                  QRDBText15.Left := 52; //dsHBookNo
                  QRDBText15.Top := 78;

            End
         Else
             Begin
                  //No Image Settings
                  If Length( qrRichTextGDam.Lines.Text ) > 0 then
                     Begin
                        Sender.Height := ( 72 + ( qrRichTextGDam.Lines.Count * 18 ));    //GroupBand

                        QRRichTextGDam.Left := 4;     //Comment
                        QRRichTextGDam.Top := 72;
                        QRRichTextGDam.Width := 420;
                        qrRichTextGDam.Height := ( 18 *  qrRichTextGDam.Lines.Count );
                     End
                  Else
                     Sender.Height := 72;   //GroupBand

                  QRLabel5.Left := 4;   //Label: "G Dam - "
                  QRLabel5.Top := 12;
                  QRDBText2.Left := 4;  //Name
                  QRDBText2.Top := 32;
                  QRDBText82.Left := 256;  //Class
                  QRDBText82.Top := 32;
                  QRDBText83.Left := 275;    //Score
                  QRDBText83.Top := 32;
                  QRDBText3.Left := 4;    //HBookNo
                  QRDBText3.Top := 52;
                  QRLabel6.Left := 392;    //Label: "by -"
                  QRLabel6.Top := 32;
                  QRDBText14.Left := 420;  //GdsName
                  QRDBText14.Top := 32;
                  QRDBText100.Left := 660; //GdsClass
                  QRDBText100.Top := 32;
                  QRDBText101.Left := 679; //GdsScore
                  QRDBText101.Top := 32;
                  QRDBText15.Left := 420; //dsHBookNo
                  QRDBText15.Top := 52;

                  //Now to hide Report Image
                  QRImGDAnimal.Width := 0  ;   //Animal Image
             End;
      end;
end;

procedure TfSalesCatalogueFlt.GHDam3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
   FileHeight : Integer;
   FileWidth : Integer;
begin
   if qDam5.FieldByName('ID').AsInteger > 0 then
      begin
         //3rd - Dam Detail Band
         FileHeight := 0;
         FileWidth := 0;
         //Need to reposition fields depending on whether an Image exists
         AID := qDam5.FieldByName('ID').AsString;

         //Now get any Blob information for the animal
         qGenBlob.SQL.Clear;
         qGenBlob.SQL.Add('Select AnimalPedDetails FROM PedDetails');
         qGenBlob.SQL.Add('Where (AnimalID = ' + AID + ')');
         qGenBlob.Open;
         qrRichText3Dam.Lines.Text := qGenBlob.FieldByName('AnimalPedDetails').AsString;

         //Need some code to locate the File Name of the current image
         FileName := '1';
         //FileExt := '.*';
         FileExt := '.jpg';
         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName;  //Animal Image
         If (( cbImages.Checked ) AND ( FileExists(FileToPrint + FileExt))) then   //Looks for file of any extension
            Begin
                  //Image Exists Settings

                  //Need some code below to get the File Extension to allow different
                  //File types to be used
                  //FileExt := ExtractFileExt(FileToPrint);   //Gets extension eg ".jpg"

                  //Load Image into GenImage to get image size
                  GenImage.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  FileHeight := GenImage.Height;
                  FileWidth := GenImage.Width;
                  //Set Default size for Report Image
                  QRIm3DAnimal.Stretch := False;   //Turns off Stretching
                  QRIm3DAnimal.Width := 300;
                  QRIm3DAnimal.Height := 160;
                  //Now to adjust the Width of the Report Image to the ratio of GenImage
                  //keeping the Height limited to 160.
                  QRIm3DAnimal.Width := Round(( FileWidth * QRIm3DAnimal.Height ) / FileHeight );
                  //Need to check that the File Type is compatible with the Image Object
                  QRIm3DAnimal.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  QRIm3DAnimal.Stretch := True;   //Now to Stretch Image to fit

                  //Now to set remaining values
                  If ( qrRichText3Dam.Lines.Count < 5 ) then
                     Sender.Height := 166   //GroupBand
                  Else
                      Sender.Height := ( 166 + (( qrRichText3Dam.Lines.Count - 4 ) * 18 ));
                  QRRichText3Dam.Left := 4;     //Comment
                  QRRichText3Dam.Top := 100;
                  QRRichText3Dam.Width := 420;
                  qrRichText3Dam.Height := ( 18 *  qrRichText3Dam.Lines.Count );

                  QRLabel9.Left := 4;   //Label: "3rd Dam - "
                  QRLabel9.Top := 12;
                  QRDBText30.Left := 82;  //Name
                  QRDBText30.Top := 14;
                  QRDBText84.Left := 300;  //Class
                  QRDBText84.Top := 14;
                  QRDBText85.Left := 319;    //Score
                  QRDBText85.Top := 14;
                  QRDBText31.Left := 82;    //HBookNo
                  QRDBText31.Top := 35;
                  QRLabel10.Left := 24;    //Label: "by -"
                  QRLabel10.Top := 58;
                  QRDBText32.Left := 52;  //3dsName
                  QRDBText32.Top := 58;
                  QRDBText98.Left := 300; //3dsClass
                  QRDBText98.Top := 58;
                  QRDBText99.Left := 319; //3dsScore
                  QRDBText99.Top := 58;
                  QRDBText33.Left := 52; //3dsHBookNo
                  QRDBText33.Top := 78;

            End
         Else
             Begin
                  //No Image Settings
                  If Length( qrRichText3Dam.Lines.Text ) > 0 then
                     Begin
                        Sender.Height := ( 72 + ( qrRichText3Dam.Lines.Count * 18 ));    //GroupBand

                        QRRichText3Dam.Left := 4;     //Comment
                        QRRichText3Dam.Top := 72;
                        QRRichText3Dam.Width := 420;
                        qrRichText3Dam.Height := ( 18 *  qrRichText3Dam.Lines.Count );
                     End
                  Else
                     Sender.Height := 72;   //GroupBand

                  QRLabel9.Left := 4;   //Label: "3rd Dam - "
                  QRLabel9.Top := 12;
                  QRDBText30.Left := 4;  //Name
                  QRDBText30.Top := 32;
                  QRDBText84.Left := 256;  //Class
                  QRDBText84.Top := 32;
                  QRDBText85.Left := 275;    //Score
                  QRDBText85.Top := 32;
                  QRDBText31.Left := 4;    //HBookNo
                  QRDBText31.Top := 52;
                  QRLabel10.Left := 392;    //Label: "by -"
                  QRLabel10.Top := 32;
                  QRDBText32.Left := 420;  //3dsName
                  QRDBText32.Top := 32;
                  QRDBText98.Left := 660; //3dsClass
                  QRDBText98.Top := 32;
                  QRDBText99.Left := 679; //3dsScore
                  QRDBText99.Top := 32;
                  QRDBText33.Left := 420; //3dsHBookNo
                  QRDBText33.Top := 52;

                  //Now to hide Report Image
                  QRIm3DAnimal.Width := 0  ;   //Animal Image
             End;
     end;
end;

procedure TfSalesCatalogueFlt.GHDam4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
Var
   AID : String;
   FileName : String;
   FileExt : String;
   FileToPrint : String;
   FileHeight : Integer;
   FileWidth : Integer;
begin
   if qDams6.FieldByName('ID').AsInteger > 0 then
      begin
         //4th - Dam Detail Band
         FileHeight := 0;
         FileWidth := 0;
         //Need to reposition fields depending on whether an Image exists
         AID := qDams6.FieldByName('ID').AsString;

         //Now get any Blob information for the animal
         qGenBlob.SQL.Clear;
         qGenBlob.SQL.Add('Select AnimalPedDetails FROM PedDetails');
         qGenBlob.SQL.Add('Where (AnimalID = ' + AID + ')');
         qGenBlob.Open;
         qrRichText4Dam.Lines.Text := qGenBlob.FieldByName('AnimalPedDetails').AsString;

         //Need some code to locate the File Name of the current image
         FileName := '1';
         //FileExt := '.*';
         FileExt := '.jpg';
         FileToPrint := 'C:\Kingswood Herd Management\Images\' + AID + '\' + FileName;  //Animal Image
         If (( cbImages.Checked ) AND ( FileExists(FileToPrint + FileExt))) then   //Looks for file of any extension
            Begin
                  //Image Exists Settings

                  //Need some code below to get the File Extension to allow different
                  //File types to be used
                  //FileExt := ExtractFileExt(FileToPrint);   //Gets extension eg ".jpg"

                  //Load Image into GenImage to get image size
                  GenImage.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  FileHeight := GenImage.Height;
                  FileWidth := GenImage.Width;
                  //Set Default size for Report Image
                  QRIm4DAnimal.Stretch := False;   //Turns off Stretching
                  QRIm4DAnimal.Width := 300;
                  QRIm4DAnimal.Height := 160;
                  //Now to adjust the Width of the Report Image to the ratio of GenImage
                  //keeping the Height limited to 160.
                  QRIm4DAnimal.Width := Round(( FileWidth * QRIm4DAnimal.Height ) / FileHeight );
                  //Need to check that the File Type is compatible with the Image Object
                  QRIm4DAnimal.Picture.LoadFromFile(FileToPrint + FileExt);   //Animal Image
                  QRIm4DAnimal.Stretch := True;   //Now to Stretch Image to fit

                  //Now to set remaining values
                  If ( qrRichText4Dam.Lines.Count < 5 ) then
                     Sender.Height := 166   //GroupBand
                  Else
                      Sender.Height := ( 166 + (( qrRichText4Dam.Lines.Count - 4 ) * 18 ));
                  QRRichText4Dam.Left := 4;     //Comment
                  QRRichText4Dam.Top := 100;
                  QRRichText4Dam.Width := 420;
                  qrRichText4Dam.Height := ( 18 *  qrRichText4Dam.Lines.Count );

                  QRLabel15.Left := 4;   //Label: "4th Dam - "
                  QRLabel15.Top := 12;
                  QRDBText48.Left := 82;  //Name
                  QRDBText48.Top := 14;
                  QRDBText86.Left := 300;  //Class
                  QRDBText86.Top := 14;
                  QRDBText87.Left := 319;    //Score
                  QRDBText87.Top := 14;
                  QRDBText49.Left := 82;    //HBookNo
                  QRDBText49.Top := 35;
                  QRLabel16.Left := 24;    //Label: "by -"
                  QRLabel16.Top := 58;
                  QRDBText50.Left := 52;  //4dsName
                  QRDBText50.Top := 58;
                  QRDBText96.Left := 300; //4dsClass
                  QRDBText96.Top := 58;
                  QRDBText97.Left := 319; //4dsScore
                  QRDBText97.Top := 58;
                  QRDBText51.Left := 52; //4dsHBookNo
                  QRDBText51.Top := 78;

            End
         Else
             Begin
                  //No Image Settings
                  If Length( qrRichText4Dam.Lines.Text ) > 0 then
                     Begin
                        Sender.Height := ( 72 + ( qrRichText4Dam.Lines.Count * 18 ));    //GroupBand

                        QRRichText4Dam.Left := 4;     //Comment
                        QRRichText4Dam.Top := 72;
                        QRRichText4Dam.Width := 420;
                        qrRichText4Dam.Height := ( 18 *  qrRichText4Dam.Lines.Count );
                     End
                  Else
                     Sender.Height := 72;   //GroupBand

                  QRLabel15.Left := 4;   //Label: "4th Dam - "
                  QRLabel15.Top := 12;
                  QRDBText48.Left := 4;  //Name
                  QRDBText48.Top := 32;
                  QRDBText86.Left := 256;  //Class
                  QRDBText86.Top := 32;
                  QRDBText87.Left := 275;    //Score
                  QRDBText87.Top := 32;
                  QRDBText49.Left := 4;    //HBookNo
                  QRDBText49.Top := 52;
                  QRLabel16.Left := 392;    //Label: "by -"
                  QRLabel16.Top := 32;
                  QRDBText50.Left := 420;  //4dsName
                  QRDBText50.Top := 32;
                  QRDBText96.Left := 660; //4dsClass
                  QRDBText96.Top := 32;
                  QRDBText97.Left := 679; //4dsScore
                  QRDBText97.Top := 32;
                  QRDBText51.Left := 420; //4dsHBookNo
                  QRDBText51.Top := 52;

                  //Now to hide Report Image
                  QRIm4DAnimal.Width := 0  ;   //Animal Image
             End;
      end;
end;

procedure TfSalesCatalogueFlt.gAGridCellClick(Column: TColumn);
begin
   AnimalGrid.edit;                 //set to edit mode, change
   if AnimalGrid.FieldByName('Selected').AsBoolean then
      AnimalGrid.FieldByName('Selected').AsBoolean := FALSE
   else                                                      //'selected' field (boolean)
      AnimalGrid.FieldByName('Selected').AsBoolean := TRUE;
   AnimalGrid.Post;
   AnimalGrid.Refresh;              // refresh grid upon exit
end;

procedure TfSalesCatalogueFlt.gAGridTitleClick(Column: TColumn);
var
   CurrRec : TBookMark;
begin
   CurrRec := gAGrid.DataSource.DataSet.GetBookMark;
   if NOT(Column.Field.FieldName = 'Selected') then
      if (Column.Field.FieldName = 'AnimalNo') then
         begin
            if SortAsc then
               begin
                  OrderByString := 'iSortAnimalNod';
                  SortAsc := False;
               end
            else
               begin
                  OrderByString := 'iSortAnimalNo';
                  SortAsc := True;
               end;
         end
      else if (Column.Field.FieldName = 'Name') then
         begin
            if SortAsc then
               begin
                  OrderByString := 'iNamed';
                  SortAsc := False;
               end
            else
               begin
                  OrderByString := 'iName';
                  SortAsc := True;
               end
         end
      else if (Column.Field.FieldName = 'DOB') then
         begin
            if SortAsc then
               begin
                  OrderByString := 'iDOBd';
                  SortAsc := False;
               end
            else
               begin
                  OrderByString := 'iDOB';
                  SortAsc := True;
               end;
         end;
   AnimalGrid.IndexName := OrderByString;
   try
      gAGrid.DataSource.DataSet.GoToBookMark(CurrRec);
      gAGrid.DataSource.DataSet.FreeBookMark(CurrRec);
   except
      gAGrid.DataSource.DataSet.FreeBookMark(CurrRec);
   end
end;

procedure TfSalesCatalogueFlt.GetClassScores(Table: TTable;
  AID: Integer);
begin
   with qClassScore do
      begin
         SQL.Clear;
         SQL.Add('SELECT EBI, LatestClass, LatestClassScore ');
         SQL.Add('FROM ' + Table.TableName + '');
         SQL.Add('WHERE AnimalID = ' + IntToStr(AID) + '');
         Open;
      end;
end;

procedure TfSalesCatalogueFlt.sbSearchClick(Sender: TObject);
begin
   if Length(SearchDlg.Text) > 0 then
      begin
         if rgSearch.ItemIndex = 0 then
            begin
               if NOT(Animalgrid.Locate('AnimalNo',(UPPERCASE(SearchDlg.Text)),[loPartialKey,loCaseInsensitive])) then
                  MessageDlg('Cannot find AnimalNo ' + SearchDlg.Text,mtInformation,[mbOk],0)
            end
         else
            begin
               if NOT(Animalgrid.Locate('Name',(UPPERCASE(SearchDlg.Text)),[loPartialKey,loCaseInSensitive])) then
                  MessageDlg('Cannot find Name ' + SearchDlg.Text,mtInformation,[mbOk],0);
            end;
      end
end;

procedure TfSalesCatalogueFlt.SearchdlgKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = vk_return) then
      sbSearchClick(Sender);
end;

procedure TfSalesCatalogueFlt.SearchdlgChange(Sender: TObject);
begin
   sbSearchClick(Sender);
end;

//   15/04/12 [V5.0 R4.9] /MK Additional Feature - Favourite Button Added.
procedure TfSalesCatalogueFlt.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         WinData.SetReportAsFavourite(cSalesCatRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         WinData.SetReportAsFavourite(cSalesCatRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TfSalesCatalogueFlt.FormCreate(Sender: TObject);
begin
   cbFilter.Enabled := WinData.ActiveFilter;
   if WinData.ActiveFilter then
      begin
         cbFilter.Visible := True;
         cbFilter.Checked := True;
         cbFilter.Style.Font.Color := clBlue;
      end
   else
      begin
         cbFilter.Visible := False;
         cbFilter.Checked := False;
         cbFilter.Style.Font.Color := clBlack;
      end;
end;

procedure TfSalesCatalogueFlt.cbFilterPropertiesChange(Sender: TObject);
begin
   cbSelectAnimals.Visible := ( not(cbFilter.Checked) );
   if cbFilter.Checked then
      cbSelectAnimals.Checked := True;
   SetUpAnimalListing;
end;

end.