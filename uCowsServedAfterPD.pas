//   06/06/19 [V5.8 R9.3] /MK Bug Fix - Grid never had datasource assigned to it so it was blank.

unit uCowsServedAfterPD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxLabel, cxContainer, cxEdit,
  cxGroupBox, dxPSCore, dxPScxCommon, dxPScxGridLnk, ExtCtrls,
  db, dbTables, GenTypesConst;

type
  TfmCowsServedAfterPD = class(TfmBaseForm)
    AnimalGridDBTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    AnimalGridDBTableViewAnimalNo: TcxGridDBColumn;
    AnimalGridDBTableViewNatIDNum: TcxGridDBColumn;
    AnimalGridDBTableViewPregDiagDate: TcxGridDBColumn;
    AnimalGridDBTableViewServiceDate: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    actPrint: TAction;
    AnimalGridPrint: TdxComponentPrinter;
    AnimalGridPrintLink: TdxGridReportLink;
    pInfo: TPanel;
    lInfo: TcxLabel;
    procedure actPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCowsServedAfterPDTable : TTable;
    FCowsServedAfterPDDataSource : TDataSource;
    procedure CheckForCowsServedAfterPD;
    { Private declarations }
  public
    procedure ShowTheForm ;
    { Public declarations }
  end;

var
  fmCowsServedAfterPD: TfmCowsServedAfterPD;

implementation

{$R *.DFM}

{ TfmCowsServedAfterPD }

procedure TfmCowsServedAfterPD.ShowTheForm;
begin
   with TfmCowsServedAfterPD.Create(nil) do
      try
         CheckForCowsServedAfterPD;
         if ( FCowsServedAfterPDTable.RecordCount > 0 ) then
            ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCowsServedAfterPD.FormCreate(Sender: TObject);
begin
   inherited;
   FCowsServedAfterPDTable := TTable.Create(nil);
   FCowsServedAfterPDDataSource := TDataSource.Create(nil);
   FCowsServedAfterPDTable.DatabaseName := AliasName;
   FCowsServedAfterPDTable.TableName := 'tmpCowsServedAfterPD';
   FCowsServedAfterPDTable.FieldDefs.Add('ID',ftAutoInc);
   FCowsServedAfterPDTable.FieldDefs.Add('AnimalNo',ftString,10);
   FCowsServedAfterPDTable.FieldDefs.Add('SortAnimalNo',ftString,10);
   FCowsServedAfterPDTable.FieldDefs.Add('NatIDNum',ftString,20);
   FCowsServedAfterPDTable.FieldDefs.Add('SortNatID',ftString,20);
   FCowsServedAfterPDTable.FieldDefs.Add('PregDiagID',ftInteger);
   FCowsServedAfterPDTable.FieldDefs.Add('PDDate',ftDateTime);
   FCowsServedAfterPDTable.FieldDefs.Add('ServiceID',ftInteger);
   FCowsServedAfterPDTable.FieldDefs.Add('ServiceDate',ftDateTime);
   FCowsServedAfterPDTable.CreateTable;
   FCowsServedAfterPDTable.Open;
end;

procedure TfmCowsServedAfterPD.CheckForCowsServedAfterPD;
var
   qCowsServedAfterPD : TQuery;

   procedure UpdatePDStatus (APDEventID : Integer);
   var
      qUpdatePDStatus : TQuery;
   begin
      qUpdatePDStatus := TQuery.Create(nil);
      with qUpdatePDStatus do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE PregnancyDiag');
            SQL.Add('SET PregnancyStatus = False');
            SQL.Add('WHERE EventID = :APDEventID');
            Params[0].AsInteger := APDEventID;
            try
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   qCowsServedAfterPD := TQuery.Create(nil);
   try
      qCowsServedAfterPD.DatabaseName := AliasName;
      qCowsServedAfterPD.SQL.Clear;
      qCowsServedAfterPD.SQL.Add('INSERT INTO '+FCowsServedAfterPDTable.TableName+' (AnimalNo, SortAnimalNo,');
      qCowsServedAfterPD.SQL.Add('                                                   NatIDNum, SortNatID,');
      qCowsServedAfterPD.SQL.Add('                                                   ServiceDate, PregDiagID, PDDate)');
      qCowsServedAfterPD.SQL.Add('SELECT A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
      qCowsServedAfterPD.SQL.Add('       S.EventDate ServiceDate,');
      qCowsServedAfterPD.SQL.Add('       P.ID PregDiagID, P.EventDate PregDiagDate');
      qCowsServedAfterPD.SQL.Add('FROM Animals A');
      qCowsServedAfterPD.SQL.Add('LEFT JOIN Events S ON (S.AnimalID = A.ID) and (S.AnimalLactNo = A.LactNo)');
      qCowsServedAfterPD.SQL.Add('LEFT JOIN Events P ON (P.AnimalID = A.ID) and (P.AnimalLactNo = A.LactNo)');
      qCowsServedAfterPD.SQL.Add('LEFT JOIN PregnancyDiag PD ON (PD.EventID = P.ID)');
      qCowsServedAfterPD.SQL.Add('WHERE (S.EventType = 2)');
      qCowsServedAfterPD.SQL.Add('AND   (P.EventType = 3)');
      qCowsServedAfterPD.SQL.Add('AND   (A.AnimalDeleted = False)');
      qCowsServedAfterPD.SQL.Add('AND   (A.InHerd = True)');
      qCowsServedAfterPD.SQL.Add('AND   (S.EventDate > P.EventDate)');
      qCowsServedAfterPD.SQL.Add('AND   (PD.PregnancyStatus = True)');
      try
         qCowsServedAfterPD.ExecSQL;
      except
      end;

      FCowsServedAfterPDTable.Close;
      FCowsServedAfterPDTable.Open;
      if ( FCowsServedAfterPDTable.RecordCount = 0 ) then Exit;

      FCowsServedAfterPDTable.First;
      while ( not(FCowsServedAfterPDTable.Eof) ) do
         begin
            UpdatePDStatus(FCowsServedAfterPDTable.FieldByName('PregDiagID').AsInteger);
            FCowsServedAfterPDTable.Next;
         end;

      FCowsServedAfterPDTable.Close;
      FCowsServedAfterPDTable.Open;

      FCowsServedAfterPDDataSource.DataSet := FCowsServedAfterPDTable;

      //   06/06/19 [V5.8 R9.3] /MK Bug Fix - Grid never had datasource assigned to it so it was blank.
      AnimalGridDBTableView.DataController.DataSource := FCowsServedAfterPDDataSource;
   finally
      if ( qCowsServedAfterPD <> nil ) then
         begin
            qCowsServedAfterPD.Close;
            FreeAndNil(qCowsServedAfterPD);
         end;
   end;
end;

procedure TfmCowsServedAfterPD.actPrintExecute(Sender: TObject);
begin
   inherited;
   if Length(AnimalGridPrint.PrintTitle) = 0 then
      AnimalGridPrint.PrintTitle := 'Kingswood Grid Print';
   AnimalGridPrintLink.Preview;
end;

procedure TfmCowsServedAfterPD.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FCowsServedAfterPDTable <> nil ) then
      begin
         FCowsServedAfterPDTable.Close;
         FCowsServedAfterPDTable.DeleteTable;
         FreeAndNil(FCowsServedAfterPDTable);
      end;
   if ( FCowsServedAfterPDDataSource <> nil ) then
      FreeAndNil(FCowsServedAfterPDDataSource);
end;

end.
