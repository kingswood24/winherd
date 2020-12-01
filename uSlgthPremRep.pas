unit uSlgthPremRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, RxLookup, ComCtrls, RXCtrls, ToolWin,
  Db, DBTables, QuickRpt, Qrctrls;

type
  TfSlgthPremRep = class(TForm)
    ToolBar1: TToolBar;
    sbExit: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    Panel1: TPanel;
    HerdCombo: TRxDBLookupCombo;
    ToolButton3: TToolButton;
    Label1: TLabel;
    DateTo: TDateEdit;
    DateFrom: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rgSortOptions: TRadioGroup;
    rgSortOrder: TRadioGroup;
    Bevel1: TBevel;
    MyTable: TTable;
    MyQuery: TQuery;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    procedure FormShow(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

  procedure ShowTheForm;
var
  fSlgthPremRep: TfSlgthPremRep;

implementation
uses
   DairyData,
   GenTypesConst;

{$R *.DFM}

   procedure ShowTheForm;
   begin
      try
         if (TfSlgthPremRep = nil) then
            Application.CreateForm(TfSlgthPremRep, fSlgthPremRep);
         fSlgthPremRep.ShowModal;
      except
         MessageDlg('Cannot create form, close program and reboot',mtError,[mbOK],0);
      end;
   end;

procedure TfSlgthPremRep.FormShow(Sender: TObject);
begin
   with MyTable do
      begin
         MyTable := TTable.Create(nil);
         MyTable.TableType := ttParadox;
         MyTable.TableName := 'TmpSlgthRep.db';
         MyTable.DatabaseName := WinData.KingData.DatabaseName;

         FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
         FieldDefs.Add('AnimalNo',ftString,10,FALSE);
         FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
         FieldDefs.Add('NatIDNum',ftString,20,FALSE);
         FieldDefs.Add('SortNatIDNum',ftString,20,FALSE);
         FieldDefs.Add('DOB',ftDate,0,FALSE);
         FieldDefs.Add('SaleDate',ftDate,0,FALSE);
         FieldDefs.Add('KillNum',ftFloat,0,FALSE);

         CreateTable;
         Open;
      end;
end;

procedure TfSlgthPremRep.sbViewClick(Sender: TObject);
begin
{   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO ' + MyTable.TableName + ' ( AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatIDNum, DOB, SaleDate, KillNum )');
         SQL.Add('SELECT DISTINCT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID, A.DateOfBirth, E.EventDate, S.KillNumber');
         SQL.Add('FROM Animals A, Events E, SalesDeaths S, Customers C');
         if Length(HerdCombo.Value) > 0 then
            SQL.Add('WHERE (A.HerdID= ' + HerdCombo.Value + ')')
         else
            SQL.Add('WHERE (A.HerdID<> '+IntToStr(WinData.NONEHerdID)+')');
         SQL.Add('AND (A.AnimalDeleted=FALSE)');
         SQL.Add('AND (A.InHerd=False)');
         SQL.Add('AND (A.ID=E.AnimalID)');
         SQL.Add('AND (E.EventType = ' + IntToStr(CSaleDeathEvent) + ')');
         SQL.Add('AND (S.Customer = C.ID)');   // Enables Customer Licensed Field to be obtained
         SQL.Add('AND (C.Licensed = TRUE)');   // Licensed Meat Exporters only
         // Make sure that the animal has not already had it's Slaughter Premium applied for
         SQL.Add('AND (A.ID (NOT IN (SELECT DISTINCT AnimalID FROM SlghtAppliedFor)))');
         // Make sure that the animal has not been claimed for under Bull Premium
         SQL.Add('AND (A.ID (NOT IN (SELECT DISTINCT AnimalID FROM BeefSub');
         SQL.Add('                   WHERE (AnimalID = A.ID)');
         SQL.Add('                   AND (((PremiumType = "B") AND (ApplicationID > -1))))))');

         ExecSQL;
       end; }
end;

end.
