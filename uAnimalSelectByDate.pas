{
  14/05/18 [V5.8 R0.3] /MK Change - Pass in array of animals based on tag numbers entered by the vet on prescription.

  23/05/18 [V5.8 R0.3] /MK Change - Allow for animal's in group category.
}

unit uAnimalSelectByDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridCustomTableView, cxGridTableView, cxControls, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, ExtCtrls, cxGridDBTableView, cxContainer,
  cxEdit, cxLabel, cxCheckBox, cxTextEdit, cxGroupBox, cxRadioGroup,
  StdCtrls, cxButtons, ActnList, uImageStore, db, dbTables,
  GenTypesConst, cxLookupDBGrid, cxFilter, DateUtil;

type
  TfmAnimalSelectByDate = class(TForm)
    TopPanel: TPanel;
    BottomPanel: TPanel;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    AnimalGridDBTableView: TcxGridDBTableView;
    AnimalGridDBTableViewSelected: TcxGridDBColumn;
    AnimalGridDBTableViewAnimalNo: TcxGridDBColumn;
    AnimalGridDBTableViewSortAnimalNo: TcxGridDBColumn;
    AnimalGridDBTableViewNatIDNum: TcxGridDBColumn;
    AnimalGridDBTableViewSortNatID: TcxGridDBColumn;
    teSearchText: TcxTextEdit;
    btnDone: TcxButton;
    btnCancel: TcxButton;
    ActionList: TActionList;
    actConfirm: TAction;
    actCancel: TAction;
    lAnimalsInHerd: TcxLabel;
    AnimalGridDBTableViewSearchNatID: TcxGridDBColumn;
    lAnimalsSelected: TcxLabel;
    btnClearSearch: TcxButton;
    rgSearchBy: TcxRadioGroup;
    btnClearSelected: TcxButton;
    procedure FormDestroy(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure AnimalGridDBTableViewSortAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure AnimalGridDBTableViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure teSearchTextPropertiesChange(Sender: TObject);
    procedure AnimalGridDBTableViewSelectedPropertiesChange(Sender: TObject);
    procedure btnClearSearchClick(Sender: TObject);
    procedure btnClearSelectedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FQuery : TQuery;
    FAnimalsTable : TTable;
    FAnimalsDataSource : TDataSource;
    FDetailTxt : String;
    FStockAsOnDate : TDateTime;
    FCountSelected : Integer;
    FSelectedAnimalsArray : PIntegerArray;
    FCategoryType : TCategoryType;
    FAnimalsInHerdTxt : String;
    procedure ApplySelectedCategoryType;
  public
    { Public declarations }
    class procedure ShowTheForm (AStockAsOnDate : TDateTime; var ACategoryType : TCategoryType;
       var ASelectedAnimals : PIntegerArray);
  end;

var
  fmAnimalSelectByDate: TfmAnimalSelectByDate;

implementation

{$R *.DFM}

class procedure TfmAnimalSelectByDate.ShowTheForm (AStockAsOnDate : TDateTime; var ACategoryType : TCategoryType;
   var ASelectedAnimals : PIntegerArray);
begin
   with TfmAnimalSelectByDate.Create(nil) do
      try
         FStockAsOnDate := AStockAsOnDate;
         FSelectedAnimalsArray := ASelectedAnimals;
         FCategoryType := ACategoryType;
         ShowModal;
         ASelectedAnimals := FSelectedAnimalsArray;
         ACategoryType := FCategoryType;
      finally
         Free;
      end;
end;

procedure TfmAnimalSelectByDate.FormCreate(Sender: TObject);
begin
   FQuery := TQuery.Create(nil);
   FQuery.DatabaseName := AliasName;

   FAnimalsTable := TTable.Create(nil);
   FAnimalsTable.DatabaseName := AliasName;
   FAnimalsTable.TableName := 'tmpAnimalsByDate';
   FAnimalsTable.Open;

   FAnimalsDataSource := TDataSource.Create(nil);
   FAnimalsDataSource.DataSet := FAnimalsTable;
end;

procedure TfmAnimalSelectByDate.FormShow(Sender: TObject);
var
   i : Integer;
begin
   try
      Screen.Cursor := crHourGlass;

      FCountSelected := 0;

      FAnimalsInHerdTxt := 'All animals';

      ApplySelectedCategoryType;

      if ( Length(FSelectedAnimalsArray) > 0 ) then
         for i := 0 to Length(FSelectedAnimalsArray)-1 do
            begin
               FQuery.Close;
               FQuery.SQL.Clear;
               FQuery.SQL.Add('UPDATE '+FAnimalsTable.TableName);
               FQuery.SQL.Add('SET Selected = TRUE');
               FQuery.SQL.Add('WHERE AnimalID = '+IntToStr(FSelectedAnimalsArray[i]));
               FQuery.ExecSQL;
               Inc(FCountSelected);
            end;

      FQuery.Close;
      FQuery.SQL.Clear;
      FQuery.SQL.Add('SELECT *');
      FQuery.SQL.Add('FROM '+FAnimalsTable.TableName);
      FQuery.SQL.Add('WHERE Selected = True');
      FQuery.Open;
      lAnimalsSelected.Visible := ( FQuery.RecordCount > 0 );
      lAnimalsSelected.Caption := Format('%d animal(s) selected.',[FQuery.RecordCount]);
      btnClearSelected.Visible := lAnimalsSelected.Visible;

      FAnimalsTable.Close;
      FAnimalsTable.Open;

      FQuery.Close;
      FQuery.SQL.Clear;
      FQuery.SQL.Add('SELECT *');
      FQuery.SQL.Add('FROM '+FAnimalsTable.TableName);
      FQuery.SQL.Add('WHERE AnimalNo IS NOT NULL');
      FQuery.Open;
      if ( FQuery.RecordCount > 0 ) then
         rgSearchBy.ItemIndex := 0
      else
         rgSearchBy.ItemIndex := 1;

      teSearchText.Text := '';

      AnimalGridDBTableView.DataController.DataSource := FAnimalsDataSource;

      lAnimalsInHerd.Caption := FAnimalsInHerdTxt+' in herd as on '+DateToStr(FStockAsOnDate);

   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmAnimalSelectByDate.AnimalGridDBTableViewSortAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[AnimalGridDBTableViewAnimalNo.Index]
   else
      AText := '';
end;

procedure TfmAnimalSelectByDate.AnimalGridDBTableViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[AnimalGridDBTableViewNatIDNum.Index]
   else
      AText := '';
end;

procedure TfmAnimalSelectByDate.actConfirmExecute(Sender: TObject);
begin
   if ( FAnimalsTable.State in dsEditModes ) then
      FAnimalsTable.Post;

   if ( FAnimalsTable.RecordCount = 0 ) then Close;

   SetLength(FSelectedAnimalsArray,0);

   FAnimalsTable.Close;
   FAnimalsTable.Filter := '';
   FAnimalsTable.Filtered := False;
   FAnimalsTable.Filter := 'Selected = True';
   FAnimalsTable.Filtered := True;
   FAnimalsTable.Open;

   FAnimalsTable.First;
   while ( not(FAnimalsTable.Eof) ) do
      begin
         SetLength(FSelectedAnimalsArray,Length(FSelectedAnimalsArray)+1);
         FSelectedAnimalsArray[Length(FSelectedAnimalsArray)-1] := FAnimalsTable.FieldByName('AnimalID').AsInteger;
         FAnimalsTable.Next;
      end;

   if ( Length(FSelectedAnimalsArray) = 0 ) then
      begin
         if ( MessageDlg('There are no animals selected.'+cCRLF+
                         'Are you sure you want to exit without selecting animals?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            Close
         else
            begin
               FAnimalsTable.Close;
               FAnimalsTable.Filter := '';
               FAnimalsTable.Filtered := False;
               FAnimalsTable.Open;
            end;
      end
   else
      Close;
end;

procedure TfmAnimalSelectByDate.teSearchTextPropertiesChange(Sender: TObject);
begin
   with AnimalGridDBTableView.DataController.Filter do
      begin
         Active := False;
         if ( Length(teSearchText.Text) > 0 ) then
            begin
               if ( rgSearchBy.ItemIndex = 0 ) then
                  Root.AddItem(AnimalGridDBTableViewAnimalNo, foLike, '%'+teSearchText.Text+'%', '')
               else
                  Root.AddItem(AnimalGridDBTableViewSearchNatID, foLike, '%'+teSearchText.Text+'%', '');
               Active := True;
            end
         else
            AnimalGridDBTableView.DataController.Filter.Clear;
      end;
   btnClearSearch.Visible := ( Length(Trim(teSearchText.Text)) > 0 );
end;

procedure TfmAnimalSelectByDate.AnimalGridDBTableViewSelectedPropertiesChange(Sender: TObject);
begin
   if ( Sender is TcxCheckBox ) then
      begin
         if ( (Sender as TcxCheckBox).Checked ) then
            Inc(FCountSelected)
         else
            Dec(FCountSelected);
      end;
   lAnimalsSelected.Visible := ( FCountSelected > 0 );
   lAnimalsSelected.Caption := Format('%d animal(s) selected.',[FCountSelected]);
   btnClearSelected.Visible := lAnimalsSelected.Visible;
end;

procedure TfmAnimalSelectByDate.btnClearSearchClick(Sender: TObject);
begin
   teSearchText.Text := '';
   teSearchText.SetFocus;
end;

procedure TfmAnimalSelectByDate.btnClearSelectedClick(Sender: TObject);
begin
   if ( MessageDlg('Clear selected animals?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then Exit;
   SetLength(FSelectedAnimalsArray,0);
   FCountSelected := 0;
   FCategoryType := ctCurrentHerdAnimals;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE '+FAnimalsTable.TableName);
         SQL.Add('SET Selected = False');
         try
            ExecSQL;
            FAnimalsTable.Close;
            FAnimalsTable.Open;
         except
         end;
      finally
         Free;
      end;
   lAnimalsSelected.Visible := False;
   btnClearSelected.Visible := False;
end;

procedure TfmAnimalSelectByDate.ApplySelectedCategoryType;
begin
   if ( FCategoryType in [ctNoSelection] ) then Exit;

   if ( FCategoryType = ctGroupSelected ) then
      FAnimalsInHerdTxt := 'Animals in selected group(s)';

   if ( FCategoryType in [ctAllCows, ctInMilkCows, ctDryCows,
                          ctHeiferCalvesThisYear, ctHeiferCalvesLastYear, ctHeiferCalvesBothYears,
                          ctDairyHeiferCalvesThisYear, ctDairyHeiferCalvesLastYear, ctDairyHeiferCalvesBothYears,
                          ctBeefHeiferCalvesThisYear, ctBeefHeiferCalvesLastYear, ctBeefHeiferCalvesBothYears] ) then
      begin
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName);
         FQuery.SQL.Add('WHERE Upper(Sex) <> "FEMALE"');
         FQuery.ExecSQL;
      end;

   if ( FCategoryType in [ctAllCows, ctInMilkCows, ctDryCows] ) then
      begin
         // Remove non females and zero lactations.
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName);
         FQuery.SQL.Add('WHERE LactNo = 0');
         FQuery.ExecSQL;

         // Refresh animals table for locate.
         FAnimalsTable.Close;
         FAnimalsTable.Open;

         // Get the animals lactation number and calving date based on FStockAsOnDate.
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('SELECT DISTINCT E.AnimalID AID, MAX(E.EventDate) LastCalving, MAX(E.AnimalLactNo) LastLact');
         FQuery.SQL.Add('FROM Events E');
         FQuery.SQL.Add('WHERE (E.EventDate <= "'+FormatDateTime(cUSDateStyle,FStockAsOnDate)+'")');
         FQuery.SQL.Add('AND   (E.EventType = '+IntToStr(CCalvingEvent)+')');
         FQuery.SQL.Add('AND   (E.AnimalID IN (SELECT A.AnimalID');
         FQuery.SQL.Add('                      FROM '+FAnimalsTable.TableName+' A');
         FQuery.SQL.Add('                      WHERE (A.LactNo > 0)');
         FQuery.SQL.Add('                      AND   (Upper(A.Sex) = "FEMALE")))');
         FQuery.SQL.Add('GROUP BY E.AnimalID');
         FQuery.Open;
         if ( FQuery.RecordCount > 0 ) then
            begin
               FQuery.First;
               while ( not(FQuery.Eof) ) do
                  begin
                     if ( FAnimalsTable.Locate('AnimalID',FQuery.FieldByName('AID').AsInteger,[]) ) then
                        begin
                           FAnimalsTable.Edit;
                           FAnimalsTable.FieldByName('LactNo').AsInteger := FQuery.FieldByName('LastLact').AsInteger;
                           FAnimalsTable.FieldByName('LastCalvingDate').AsDateTime := FQuery.FieldByName('LastCalving').AsDateTime;
                           FAnimalsTable.Post;
                        end;
                     FQuery.Next;
                  end;
            end;
      end;

   if ( FCategoryType in [ctDairyHeiferCalvesThisYear, ctDairyHeiferCalvesLastYear, ctDairyHeiferCalvesBothYears] ) then
      begin
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
         FQuery.SQL.Add('WHERE AnimalID IN (SELECT AnimalID');
         FQuery.SQL.Add('                   FROM '+FAnimalsTable.TableName);
         FQuery.SQL.Add('                   LEFT JOIN Breeds B ON (B.ID = A.BreedID)');
         FQuery.SQL.Add('                   WHERE B.EligibleforPremium = FALSE)');
         FQuery.ExecSQL;
      end;

   if ( FCategoryType in [ctBeefHeiferCalvesThisYear, ctBeefHeiferCalvesLastYear, ctBeefHeiferCalvesBothYears] ) then
      begin
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
         FQuery.SQL.Add('WHERE AnimalID IN (SELECT AnimalID');
         FQuery.SQL.Add('                   FROM '+FAnimalsTable.TableName);
         FQuery.SQL.Add('                   LEFT JOIN Breeds B ON (B.ID = A.BreedID)');
         FQuery.SQL.Add('                   WHERE B.EligibleforPremium = TRUE)');
         FQuery.ExecSQL;
      end;

   if ( FCategoryType in [ctMaleCalvesThisYear, ctMaleCalvesLastYear, ctMaleCalvesBothYears] ) then
      begin
         FQuery.Close;
         FQuery.SQL.Clear;
         FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName);
         FQuery.SQL.Add('WHERE Upper(Sex) = "FEMALE"');
         FQuery.ExecSQL;
      end;

   try
      case FCategoryType of
         ctAllCows : begin
                        FQuery.Close;
                        FQuery.SQL.Clear;
                        FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName);
                        FQuery.SQL.Add('WHERE LastCalvingDate > "'+FormatDateTime(cUSDateStyle,FStockAsOnDate)+'"');
                        FQuery.ExecSQL;
                        FAnimalsInHerdTxt := 'All Cows';
                     end;
         ctInMilkCows : begin
                           FQuery.Close;
                           FQuery.SQL.Clear;
                           FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
                           FQuery.SQL.Add('WHERE ( A.AnimalID IN (');
                           FQuery.SQL.Add(' SELECT E.AnimalID');
                           FQuery.SQL.Add(' FROM Events E');
                           FQuery.SQL.Add(' WHERE (A.AnimalID = E.AnimalID)');
                           FQuery.SQL.Add(' AND   (A.LactNo = E.AnimalLactNo)');
                           FQuery.SQL.Add(' AND   (E.EventType = '+IntToStr(CDryOffEvent)+')');
                           FQuery.SQL.Add(' AND   (E.EventDate <= "'+FormatDateTime(cUSDateStyle,FStockAsOnDate)+'")))');
                           FQuery.ExecSQL;
                           FAnimalsInHerdTxt := 'All Cows In Milk';
                         end;
         ctDryCows : begin
                        FQuery.Close;
                        FQuery.SQL.Clear;
                        FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
                        FQuery.SQL.Add('WHERE NOT (A.AnimalID IN (');
                        FQuery.SQL.Add(' SELECT E.AnimalID');
                        FQuery.SQL.Add(' FROM Events E');
                        FQuery.SQL.Add(' WHERE (A.AnimalID = E.AnimalID)');
                        FQuery.SQL.Add(' AND   (A.LactNo = E.AnimalLactNo)');
                        FQuery.SQL.Add(' AND   (E.EventType = '+IntToStr(CDryOffEvent)+')');
                        FQuery.SQL.Add(' AND   (E.EventDate <= "'+FormatDateTime(cUSDateStyle,FStockAsOnDate)+'")))');
                        FQuery.ExecSQL;
                        FAnimalsInHerdTxt := 'All Cows Dry';
                     end;
         ctAllCalvesThisYear,
         ctHeiferCalvesThisYear,
         ctDairyHeiferCalvesThisYear,
         ctBeefHeiferCalvesThisYear,
         ctMaleCalvesThisYear : begin
                                   FQuery.Close;
                                   FQuery.SQL.Clear;
                                   FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
                                   FQuery.SQL.Add('WHERE DateOfBirth < "01/01/'+IntToStr(ExtractYear(FStockAsOnDate))+'"');
                                   FQuery.ExecSQL;

                                   if ( FCategoryType = ctAllCalvesThisYear ) then
                                      FAnimalsInHerdTxt := 'All Calves This Year'
                                   else if ( FCategoryType = ctAllCalvesThisYear ) then
                                      FAnimalsInHerdTxt := 'Heifer Calves This Year'
                                   else if ( FCategoryType = ctDairyHeiferCalvesThisYear ) then
                                      FAnimalsInHerdTxt := 'Dairy Heifer Calves This Year'
                                   else if ( FCategoryType = ctBeefHeiferCalvesThisYear ) then
                                      FAnimalsInHerdTxt := 'Beef Heifer Calves This Year'
                                   else if ( FCategoryType = ctDairyHeiferCalvesThisYear ) then
                                      FAnimalsInHerdTxt := 'Male Calves This Year';
                                end;
         ctAllCalvesLastYear,
         ctHeiferCalvesLastYear,
         ctDairyHeiferCalvesLastYear,
         ctBeefHeiferCalvesLastYear,
         ctMaleCalvesLastYear : begin
                                   FQuery.Close;
                                   FQuery.SQL.Clear;
                                   FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
                                   FQuery.SQL.Add('WHERE DateOfBirth < "01/01/'+IntToStr(ExtractYear(IncYear(FStockAsOnDate,-1)))+'"');
                                   FQuery.ExecSQL;

                                   FQuery.Close;
                                   FQuery.SQL.Clear;
                                   FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
                                   FQuery.SQL.Add('WHERE DateOfBirth > "12/31/'+IntToStr(ExtractYear(IncYear(FStockAsOnDate,-1)))+'"');
                                   FQuery.ExecSQL;

                                   if ( FCategoryType = ctAllCalvesLastYear ) then
                                      FAnimalsInHerdTxt := 'All Calves Last Year'
                                   else if ( FCategoryType = ctHeiferCalvesLastYear ) then
                                      FAnimalsInHerdTxt := 'Heifer Calves Last Year'
                                   else if ( FCategoryType = ctDairyHeiferCalvesLastYear ) then
                                      FAnimalsInHerdTxt := 'Dairy Heifer Calves Last Year'
                                   else if ( FCategoryType = ctBeefHeiferCalvesLastYear ) then
                                      FAnimalsInHerdTxt := 'Beef Heifer Calves Last Year'
                                   else if ( FCategoryType = ctMaleCalvesLastYear ) then
                                      FAnimalsInHerdTxt := 'Male Calves Last Year';
                                end;
         ctAllCalvesBothYears,
         ctHeiferCalvesBothYears,
         ctDairyHeiferCalvesBothYears,
         ctBeefHeiferCalvesBothYears,
         ctMaleCalvesBothYears : begin
                                    FQuery.Close;
                                    FQuery.SQL.Clear;
                                    FQuery.SQL.Add('DELETE FROM '+FAnimalsTable.TableName+' A');
                                    FQuery.SQL.Add('WHERE DateOfBirth < "01/01/'+IntToStr(ExtractYear(IncYear(FStockAsOnDate,-1)))+'"');
                                    FQuery.ExecSQL;

                                    if ( FCategoryType = ctAllCalvesBothYears ) then
                                       FAnimalsInHerdTxt := 'All Calves Both Years'
                                    else if ( FCategoryType = ctHeiferCalvesBothYears ) then
                                       FAnimalsInHerdTxt := 'Heifer Calves Both Years'
                                    else if ( FCategoryType = ctDairyHeiferCalvesBothYears ) then
                                       FAnimalsInHerdTxt := 'Dairy Heifer Calves Both Years'
                                    else if ( FCategoryType = ctBeefHeiferCalvesBothYears ) then
                                       FAnimalsInHerdTxt := 'Beef Heifer Calves Both Years'
                                    else if ( FCategoryType = ctMaleCalvesBothYears ) then
                                       FAnimalsInHerdTxt := 'Male Calves Both Years';
                                 end;
      end;
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;

   FQuery.Close;
   FQuery.SQL.Clear;
   FQuery.SQL.Add('UPDATE '+FAnimalsTable.TableName);
   FQuery.SQL.Add('SET Selected = True');
   FQuery.ExecSQL;
end;

procedure TfmAnimalSelectByDate.actCancelExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmAnimalSelectByDate.FormDestroy(Sender: TObject);
begin
   if ( FQuery <> nil ) then
       begin
          FQuery.Close;
          FreeAndNil(FQuery);
       end;
    if ( FAnimalsTable <> nil ) then
       begin
          FAnimalsTable.Close;
          FreeAndNil(FAnimalsTable);
       end;
    if ( FAnimalsDataSource <> nil ) then
       FreeAndNil(FAnimalsDataSource);
end;

end.
