unit uTagReconcile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxTextEdit, cxCurrencyEdit, cxContainer, cxEdit, cxLabel,
  ExtCtrls, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  db, dbTables, uHerdLookup, KRoutines, GenTypesConst, dxPSCore,
  dxPScxCommon, dxPScxGridLnk;

type
  TfmTagReconcile = class(TfmBaseForm)
    btnReset: TcxButton;
    TagGridDBTableViewMissingTags: TcxGridDBColumn;
    blbPrint: TdxBarLargeButton;
    actPrint: TAction;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterLink: TdxGridReportLink;
    procedure btnResetClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  published
    pHeader: TPanel;
    lStartTag: TcxLabel;
    ceStartTag: TcxCurrencyEdit;
    lStartTagInfo: TcxLabel;
    btnBeginCheck: TcxButton;
    TagGridDBTableView: TcxGridDBTableView;
    TagGridLevel: TcxGridLevel;
    TagGrid: TcxGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ceStartTagPropertiesChange(Sender: TObject);
    procedure btnBeginCheckClick(Sender: TObject);
  private
     FAnimalTags : TTable;
     FDSAnimalTags : TDataSource;
    function MaxAnimalTagNo : Integer;
    procedure AddAnimals;
    procedure ClearTable;
     { Private declarations }
  public
     class procedure ShowTheForm;
     { Public declarations }
  end;

var
  fmTagReconcile: TfmTagReconcile;

implementation

{$R *.DFM}

{ TfmCattleTagOmmissions }

class procedure TfmTagReconcile.ShowTheForm;
begin
   with TfmTagReconcile.Create(nil) do
      try
         ceStartTag.EditValue := Null;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTagReconcile.FormCreate(Sender: TObject);
begin
   inherited;
   FAnimalTags := TTable.Create(nil);
   with FAnimalTags do
      try
         DatabaseName := AliasName;
         TableName := 'tmpTagReconcile';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('Tag',ftString,20);
         FieldDefs.Add('SearchTag',ftString,20);
         FieldDefs.Add('SortTag',ftString,20);
         FieldDefs.Add('TagInt',ftInteger);
         CreateTable;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;
   FDSAnimalTags := TDataSource.Create(nil);
   FDSAnimalTags.DataSet := FAnimalTags;
   AddAnimals;
end;

procedure TfmTagReconcile.ceStartTagPropertiesChange(
  Sender: TObject);
begin
   inherited;
   ceStartTag.PostEditValue;
   btnBeginCheck.Enabled := ( ceStartTag.EditValue <> Null );
   btnReset.Enabled := btnBeginCheck.Enabled;
   if ( ceStartTag.EditValue <> Null ) then
      if ( Length(ceStartTag.EditValue) > 4 ) then
         ceStartTag.EditValue := Copy(ceStartTag.EditValue,0,4);
end;

procedure TfmTagReconcile.btnBeginCheckClick(Sender: TObject);
var
   i, j, CheckDigit,
   iMaxTag : Integer;
   iaTagsNotInHerd : array of Integer;
   NewID : String;
begin
   inherited;
   if ( ceStartTag.EditValue = Null ) then Exit;

   Screen.Cursor := crHourGlass;
   TagGridDBTableView.DataController.DataSource := nil;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM '+FAnimalTags.TableName+'');
         SQL.Add('WHERE TagInt < '+VarToStr(ceStartTag.EditValue)+'');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;

   iMaxTag := MaxAnimalTagNo;
   if ( iMaxTag = 0 ) then
      begin
         MessageDlg('Start tag exceeds maximum tag number in the database.'+cCRLF+
                    'Check aborted.',mtError,[mbOK],0);
         btnBeginCheck.Enabled := False;
         btnReset.Enabled := btnBeginCheck.Enabled;
         AddAnimals;
         Exit;
      end;

   SetLength(iaTagsNotInHerd,0);
   for i := ceStartTag.EditValue to iMaxTag do
      if ( not(FAnimalTags.Locate('TagInt',i,[])) ) then
         begin
            SetLength(iaTagsNotInHerd,Length(iaTagsNotInHerd)+1);
            iaTagsNotInHerd[Length(iaTagsNotInHerd)-1] := i;
         end;

   ClearTable;
   for i := 0 to Length(iaTagsNotInHerd)-1 do
      begin
         for j := 1 to 10 do
            begin
               CheckDigit := 1;
               while ((not CheckNatID('IE ' + HerdLookup.HerdOwnerData.HerdIdentifier +' '+ IntToStr(CheckDigit) +' '+ PadLeft(IntToStr(iaTagsNotInHerd[i]),'0',4), NewID, True)) and (CheckDigit<=9)) do
                  Inc(CheckDigit);
            end;
         FAnimalTags.Append;
         FAnimalTags.FieldByName('TagInt').AsInteger := iaTagsNotInHerd[i];
         FAnimalTags.FieldByName('Tag').AsString := NewID;
         FAnimalTags.FieldByName('SortTag').AsString := CreateSortNatIDString(NewID, HerdLookup.HerdOwnerData.HerdID, HerdLookup.HerdOwnerData.RegisteredCountry);
         FAnimalTags.Post;
      end;
   FAnimalTags.Close;
   FAnimalTags.Open;
   TagGridDBTableView.DataController.DataSource := FDSAnimalTags;
   Screen.Cursor := crDefault;
end;

procedure TfmTagReconcile.AddAnimals;
begin
   Screen.Cursor := crHourGlass;
   btnBeginCheck.Enabled := False;
   btnReset.Enabled := btnBeginCheck.Enabled;
   ceStartTag.EditValue := Null;
   TagGridDBTableView.DataController.DataSource := nil;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('INSERT INTO '+FAnimalTags.TableName+' (Tag, SearchTag, SortTag)');
         SQL.Add('SELECT NatIDNum, SearchNatID, SortNatID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE SearchNatID LIKE "%'+StripAllSpaces(HerdLookup.HerdOwnerData.HerdIdentifier)+'%"');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;

   FAnimalTags.Close;
   FAnimalTags.Open;
   if ( FAnimalTags.RecordCount = 0 ) then
      begin
         MessageDlg(Format('No animals found with this herd identifier (%s).',[HerdLookup.HerdOwnerData.HerdIdentifier]),mtError,[mbOK],0);
         Exit;
      end;

   FAnimalTags.First;
   while ( not(FAnimalTags.Eof) ) do
      begin
         if ( Pos('ABOR',UpperCase(FAnimalTags.FieldByName('SearchTag').AsString)) > 0 ) then
            FAnimalTags.Delete
         else
            begin
               FAnimalTags.Edit;
               FAnimalTags.FieldByName('TagInt').AsInteger := StrToInt(Copy(FAnimalTags.FieldByName('SearchTag').AsString,
                                                                            Length(FAnimalTags.FieldByName('SearchTag').AsString)-3,4));
               FAnimalTags.Post;
               FAnimalTags.Next;
            end;
      end;
   Screen.Cursor := crDefault;
end;

function TfmTagReconcile.MaxAnimalTagNo: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MAX(TagInt)');
         SQL.Add('FROM '+FAnimalTags.TableName+'');
         try
            Open;
            if ( RecordCount > 0 ) then
               if ( Length(Fields[0].AsString) > 0 ) then
                  Result := StrToInt(Fields[0].AsString);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmTagReconcile.btnResetClick(Sender: TObject);
begin
   inherited;
   ClearTable;
   AddAnimals;
end;

procedure TfmTagReconcile.ClearTable;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM '+FAnimalTags.TableName+'');
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

procedure TfmTagReconcile.actPrintExecute(Sender: TObject);
begin
   inherited;
   if ( FAnimalTags.RecordCount = 0 ) then
      begin
         MessageDlg('No data to print.',mtError,[mbOK],0);
         Exit;
      end;
   ComponentPrinterLink.Preview;
end;

procedure TfmTagReconcile.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   inherited;
   if ( FAnimalTags.RecordCount > 0 ) then
      CanClose := ( MessageDlg('Are you sure you want to exit?',mtConfirmation,[mbYes,mbNo],0) = mrYes );
end;

procedure TfmTagReconcile.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FAnimalTags <> nil ) then
      begin
         if ( FAnimalTags.Active ) then
            FAnimalTags.Active := False;
         FAnimalTags.DeleteTable;
         FreeAndNil(FAnimalTags);
      end;
   if ( FDSAnimalTags <> nil ) then
      FreeAndNil(FDSAnimalTags);
end;

end.
