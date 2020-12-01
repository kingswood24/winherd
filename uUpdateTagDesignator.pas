unit uUpdateTagDesignator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  ExtCtrls, cxTextEdit, StdCtrls, cxButtons, cxContainer, cxEdit, cxLabel,
  uSPParser, db, dbTables, GenTypesConst, KRoutines, DairyData;

type
  TfmUpdateTagDesignator = class(TfmBaseForm)
    pMain: TPanel;
    actCancel: TAction;
    actUpdate: TAction;
    lInfo: TcxLabel;
    btnUpdate: TcxButton;
    btnCancel: TcxButton;
    teHerdDesignator: TcxTextEdit;
    lHerdDesignator: TcxLabel;
    procedure actCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure teHerdDesignatorKeyPress(Sender: TObject; var Key: Char);
  private
    FCountry : TCountry;
    FTagDesignatorUpdated : Boolean;
    { Private declarations }
  public
    { Public declarations }
    class function TagDesinatorUpdated : Boolean;
  end;

var
  fmUpdateTagDesignator: TfmUpdateTagDesignator;

implementation

{$R *.DFM}

{ TfmUpdateTagDesignator }

procedure TfmUpdateTagDesignator.FormCreate(Sender: TObject);
begin
   inherited;
   FTagDesignatorUpdated := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT HerdIdentifier');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE ID = '+IntToStr(WinData.UserDefaultHerdID)+'');
         try
            Open;
            if ( RecordCount > 0 ) then
               if ( Length(Fields[0].AsString) > 0 ) then
                  teHerdDesignator.Text := StripAllSpaces(Fields[0].AsString);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

class function TfmUpdateTagDesignator.TagDesinatorUpdated: Boolean;
begin
   with TfmUpdateTagDesignator.Create(nil) do
      try
         ShowModal;
         Result := FTagDesignatorUpdated;
      finally
         Free;
      end;
end;

procedure TfmUpdateTagDesignator.actCancelExecute(Sender: TObject);
begin
   inherited;
   FTagDesignatorUpdated := False;
   Close;
end;

procedure TfmUpdateTagDesignator.actUpdateExecute(Sender: TObject);
var
   slAnimalsToUpdate : TStringList;
   sOldNatID,
   sNewNatID,
   sSortNatID,
   sLine : String;
   i : Integer;
   Parser : TSPParser;
   qAnimals : TQuery;

   function TagOnlyHasNumericValues ( ATagNumber : String ) : Boolean;
   var
      j : Integer;
   begin
      Result := False;
      if ( Length(ATagNumber) = 0 ) then Exit;
      for j := 1 to Length(ATagNumber) do
         begin
            Result := ATagNumber[j] in ['0'..'9'];
            if ( not(Result) ) then
               Break;
         end;
   end;

begin
   inherited;
   try
      Screen.Cursor := crHourGlass;
      if ( FCountry = Other ) then
         begin
            MessageDlg('Unable to complete update of IE numbers.'+#13#10+
                       'Default Country in database is not Ireland',mtError,[mbOK],0);
            Exit;
         end;

      qAnimals := TQuery.Create(nil);
      with qAnimals do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID, NatIDNum');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE (SearchNatID LIKE "%IE'+teHerdDesignator.Text+'%")');
            try
               Open;
               if ( qAnimals.RecordCount = 0 ) then
                  begin
                     MessageDlg('No animals to update.',mtInformation,[mbOK],0);
                     Exit;
                  end;
               qAnimals.First;
               slAnimalsToUpdate := TStringList.Create();
               while ( not(qAnimals.Eof) ) do
                  begin
                     sOldNatID := '';
                     sOldNatID := StripAllSpaces(qAnimals.Fields[1].AsString);
                     sNewNatID := '';
                     sNewNatID := '372' + ' ' + Copy(sOldNatID,3,2) + ' ' + Copy(sOldNatID,5,5) + ' ' + Copy(sOldNatID,10,1) + ' ' + Copy(sOldNatID,11,4);
                     slAnimalsToUpdate.Add(IntToStr(qAnimals.Fields[0].AsInteger)+','+sNewNatID);
                     Next;
                  end;
               Close;
               if ( slAnimalsToUpdate.Count = 0 ) then
                  begin
                     MessageDlg('No animals to update.',mtInformation,[mbOK],0);
                     Exit;
                  end;

                Parser := TSPParser.Create(nil);
                Parser.SepChar := ',';
                try
                   Update;
                   for i := 0 to slAnimalsToUpdate.Count-1 do
                      begin
                         sLine := '';
                         sLine := slAnimalsToUpdate.Strings[i];
                         Parser.Parse(sLine);
                         sSortNatID := '';
                         sSortNatID := CreateSortNatIDString(StripAllSpaces(Parser.Fields[2]),WinData.UserDefaultHerdID);
                         SQL.Clear;
                         SQL.Add('UPDATE Animals');
                         SQL.Add('SET NatIDNum = "'+Parser.Fields[2]+'",');
                         SQL.Add('    SortNatID = "'+sSortNatID+'",');
                         SQL.Add('    IsSynchronized = FALSE');
                         SQL.Add('WHERE ID = '+Parser.Fields[1]+'');
                         ExecSQL;
                         Update;
                      end;
                finally
                   MessageDlg('Update of animal tag numbers complete.',mtInformation,[mbOK],0);
                   btnUpdate.Enabled := False;
                   btnCancel.Action := actClose;
                   FTagDesignatorUpdated := True;
                end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmUpdateTagDesignator.teHerdDesignatorKeyPress(Sender: TObject;
  var Key: Char);
begin
   inherited;
   if ( not(Key in [#8, '0'..'9']) ) then
      Key := #0;
end;

end.
