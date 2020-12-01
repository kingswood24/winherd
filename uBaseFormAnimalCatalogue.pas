unit uBaseFormAnimalCatalogue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, StdCtrls, cxButtons, cxTextEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxEdit, cxGroupBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, Db, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxmdaset, ActnList, dxBar,
  dxBarExtItems, dxStatusBar, dbtables, cxCustomData, GenTypesConst,
  cxCheckBox, cxStyles;

type
  TSexFilter = (sfBull, sfFemale, sfSteer);
  TSexFilterOptions = set of TSexFilter;

  TfmBaseFormAnimalCatalogue = class(TfmBaseForm)
    mdCatalogueAnimals: TdxMemData;
    mdCatalogueAnimalsSelected: TBooleanField;
    mdCatalogueAnimalsAnimalNo: TStringField;
    mdCatalogueAnimalsNatIdNum: TStringField;
    mdCatalogueAnimalsName: TStringField;
    mdCatalogueAnimalsHerdBookNo: TStringField;
    mdCatalogueAnimalsSex: TStringField;
    GridCatalogueAnimalsDBTableView: TcxGridDBTableView;
    GridCatalogueAnimalsLevel: TcxGridLevel;
    GridCatalogueAnimals: TcxGrid;
    dsCatalogueAnimals: TDataSource;
    mdCatalogueAnimalsID: TIntegerField;
    GridCatalogueAnimalsDBTableViewRecId: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewID: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewSelected: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewSortAnimalNo: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewSortNatID: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewSex: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewName: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewHerdBookNo: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cmboSearchColumns: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teSearchText: TcxTextEdit;
    btnSearchAssist: TcxButton;
    actClearSearch: TAction;
    mdCatalogueAnimalsSortNatID: TStringField;
    mdCatalogueAnimalsSortAnimalNo: TStringField;
    GridCatalogueAnimalsDBTableViewDateOfBirth: TcxGridDBColumn;
    actView: TAction;
    GridCatalogueAnimalsDBTableViewAnimalNo: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewNatIdNum: TcxGridDBColumn;
    mdCatalogueAnimalsDateOfBirth: TDateField;
    cxGroupBox2: TcxGroupBox;
    cbIncludeAnimalsLeftHerd: TcxCheckBox;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleContentOdd: TcxStyle;
    cxStyleContentEven: TcxStyle;
    actContinueSearch: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cmboSearchColumnsPropertiesEditValueChanged(Sender: TObject);
    procedure GridCatalogueAnimalsDBTableViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridCatalogueAnimalsDBTableViewSortAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure teSearchTextPropertiesChange(Sender: TObject);
    procedure actClearSearchExecute(Sender: TObject);
    procedure mdCatalogueAnimalsNewRecord(DataSet: TDataSet);
    procedure GridCatalogueAnimalsDBTableViewDblClick(Sender: TObject);
    procedure cbIncludeLeftHerdPropertiesChange(Sender: TObject);
    procedure actContinueSearchExecute(Sender: TObject);
  private
    { Private declarations }
    FIncludeAnimalsLeftHerd : Boolean;
    FGridStyleContentEvenOdd: Boolean;
    procedure SearchForAnimal(AStartIndex : Integer);
    procedure SetGridStyleContentEvenOdd(const Value: Boolean);
  protected
    FSexFilterOptions : TSexFilterOptions;
    FSearchColumn : TcxGridDBColumn;
    function GetSelectedAnimals: PIntegerArray;
    procedure LoadAnimals;
    procedure BuildSearchColumnList;dynamic;
    property SelectedAnimals : PIntegerArray read GetSelectedAnimals;
    property GridStyleContentEvenOdd : Boolean read FGridStyleContentEvenOdd write SetGridStyleContentEvenOdd;
  public
    { Public declarations }
  end;

var
  fmBaseFormAnimalCatalogue: TfmBaseFormAnimalCatalogue;

implementation

{$R *.DFM}

{ TfmBaseForm1 }

procedure TfmBaseFormAnimalCatalogue.BuildSearchColumnList;
var
   i : Integer;
begin
   cmboSearchColumns.Properties.Items.Clear;
   for i := 0 to GridCatalogueAnimalsDBTableView.ColumnCount-1 do
      begin
         if GridCatalogueAnimalsDBTableView.Columns[i].Tag = 1 then
            begin
               if (not GridCatalogueAnimalsDBTableView.Columns[i].Hidden) and (GridCatalogueAnimalsDBTableView.Columns[i].Visible) then
                   cmboSearchColumns.Properties.Items.AddObject(GridCatalogueAnimalsDBTableView.Columns[i].Caption, GridCatalogueAnimalsDBTableView.Columns[i]);
            end;
      end;
   cmboSearchColumns.ItemIndex := 0;
end;

procedure TfmBaseFormAnimalCatalogue.FormCreate(Sender: TObject);
begin
  inherited;
  FGridStyleContentEvenOdd := False;
  FSearchColumn := nil;
  BuildSearchColumnList;
  FSexFilterOptions := [sfBull,sfFemale,sfSteer];
  //LoadAnimals;
  teSearchText.Text := '';
end;

procedure TfmBaseFormAnimalCatalogue.cmboSearchColumnsPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  FSearchColumn := nil;
  if ( cmboSearchColumns.ItemIndex > -1 ) then
     begin
        FSearchColumn := TcxGridDBColumn(cmboSearchColumns.ItemObject);
        if FSearchColumn.Caption = 'Name' then
           btnSearchAssist.Action := actContinueSearch
        else
           btnSearchAssist.Action := actClearSearch;
     end;
end;

procedure TfmBaseFormAnimalCatalogue.LoadAnimals;
var
   QueryAnimals : TQuery;
   SQLSexString : string;
begin
   SQLSexString := '';
   if sfBull in FSexFilterOptions then
      SQLSexString :=  AnsiQuotedStr(cSex_Bull,cQuoteStr);
   if sfFemale in FSexFilterOptions then
      begin
         if SQLSexString <> '' then
            SQLSexString := SQLSexString + ','+AnsiQuotedStr(cSex_Female,cQuoteStr)
         else
            SQLSexString := AnsiQuotedStr(cSex_Female,cQuoteStr);
      end;
   if sfSteer in FSexFilterOptions then
      begin
         if SQLSexString <> '' then
            SQLSexString := SQLSexString + ','+AnsiQuotedStr(cSex_Steer,cQuoteStr)
         else
            SQLSexString := AnsiQuotedStr(cSex_Steer,cQuoteStr);
      end;

   if SQLSexString <> '' then
      begin
         SQLSexString := '(' + SQLSexString + ')';
      end;

   QueryAnimals := TQuery.Create(nil);
   with QueryAnimals do
      try
         DatabaseName := 'kingswd';
         SQL.Clear;
         SQL.Add('Select ID, NatIDNum, SortNatID, AnimalNo, SortAnimalNo, Name, Sex, DateOfBirth, HerdBookNo ');
         SQL.Add('From Animals');
         SQL.Add('Where HerdID <> :NoneHerdID');
         SQL.Add('And Breeding=True');
         if SQLSexString <> '' then
            SQL.Add('And Sex in '+SQLSexString+'');
         if not FIncludeAnimalsLeftHerd then
            SQL.Add('And InHerd=True');
         Params[0].AsInteger := NoneHerdID;
         Open;
         try
            mdCatalogueAnimals.Close;
            mdCatalogueAnimals.LoadFromDataSet(QueryAnimals);
            mdCatalogueAnimals.Open;
            mdCatalogueAnimals.First;

            with GridCatalogueAnimalsDBTableView do
               begin
                  if DataController.RecordCount > 0 then
                     begin
                        Controller.FocusedRowIndex := 0;
                     end;
               end;
         finally
            Close;
         end;
         mdCatalogueAnimals.First;
         StatusBar.Panels[0].Text := Format('Total Animals: %d',[mdCatalogueAnimals.RecordCount]);
      finally
         FreeAndNil(QueryAnimals);
      end;
end;

procedure TfmBaseFormAnimalCatalogue.GridCatalogueAnimalsDBTableViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
   if ARecord <> nil then

      if ARecord.Values[GridCatalogueAnimalsDBTableViewNatIdNum.Index] <> Null then
         AText := ARecord.Values[GridCatalogueAnimalsDBTableViewNatIdNum.Index]
      else
         AText := '';
end;

procedure TfmBaseFormAnimalCatalogue.GridCatalogueAnimalsDBTableViewSortAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
   if ARecord <> nil then
      if ARecord.Values[GridCatalogueAnimalsDBTableViewAnimalNo.Index] <> Null then
         AText := ARecord.Values[GridCatalogueAnimalsDBTableViewAnimalNo.Index]
      else
         AText := '';
end;

procedure TfmBaseFormAnimalCatalogue.teSearchTextPropertiesChange(
  Sender: TObject);
begin
  inherited;
  SearchForAnimal(0);
end;

procedure TfmBaseFormAnimalCatalogue.SearchForAnimal(AStartIndex : Integer);
var
   SearchText, SearchField, FieldValue : string;
   SearchFieldIndex : Integer;
   Success : Boolean;
   i : Integer;
   s : string;
begin
  inherited;
  if FSearchColumn <> nil then
     begin
        with GridCatalogueAnimalsDBTableView do
           begin
              DataController.BeginLocate;
              try
                 SearchText := Trim(teSearchText.Text);
                 if SearchText <> '' then
                    begin
                       SearchText := UPPERCASE(teSearchText.Text);

                       actClearSearch.Enabled := True;
                       Screen.Cursor := crHourGlass;
                       Success := False;

                       DataController.DataSet.First;
                       try
{                          SearchField := FSearchColumn.DataBinding.FieldName;
                          if UPPERCASE(SearchField) = 'SORTNATID' then
                             SearchField := GridCatalogueAnimalsDBTableViewAnimalNo
                          else if UPPERCASE(SearchField) = 'SORTANIMALNO' then
                             SearchField := GridCatalogueAnimalsDBTableViewAnimalNo;
}

                          SearchFieldIndex := FSearchColumn.Index;
                          if UPPERCASE(SearchField) = 'SORTNATID' then
                             SearchFieldIndex := GridCatalogueAnimalsDBTableViewNatIdNum.Index
                          else if UPPERCASE(SearchField) = 'SORTANIMALNO' then
                             SearchFieldIndex := GridCatalogueAnimalsDBTableViewAnimalNo.Index;


{                          if not DataController.DataSet.Locate(SearchField, SearchText, [loCaseInsensitive, loPartialKey]) then
                             begin
                                MessageDlg('Search on ' + FSearchColumn.Caption + ' "' + SearchText +'" has found no results.', mtWarning,[mbOK],0);
                             end;
}

                          with DataController do
                             begin
                                Success := False;
                                for i := AStartIndex to RecordCount - 1 do
                                   begin
                                      FieldValue := VarToStr(Values[ i, SearchFieldIndex]);

                                      if not VarIsNull(FieldValue) then
                                         begin
                                            FieldValue := UPPERCASE(FieldValue);
                                            if (cmboSearchColumns.Text = 'Animal No.') then
                                               begin
                                                  if (SearchText = Copy(FieldValue, 1, Length(SearchText))) then
                                                     begin
                                                        DataController.FocusedRecordIndex := i;
                                                        Success := True;
                                                        Break;
                                                     end;
                                               end
                                            else
                                               begin
                                                  if Pos( SearchText, FieldValue) > 0 then
                                                     begin
                                                        DataController.FocusedRecordIndex := i;
                                                        Success := True;
                                                        Break;
                                                     end;
                                               end;
                                         end;
                                   end;
                             end;

                             if not Success then
                                begin
                                   Controller.FocusedRowIndex := 0;
                                   s := '';
                                   if AStartIndex > 0 then
                                      s := 'further ';
                                   MessageDlg(Format('The search for "%s" did not return any %sresults.',[teSearchText.Text,s]),mtInformation,[mbOK],0)
                                end;
                       finally
                          Screen.Cursor := crDefault;
                       end;
                    end
                 else
                    begin
                       DataController.DataSet.First;
                       actClearSearch.Enabled := False;
                    end;
              finally
                 DataController.EndLocate;
              end;
           end;
     end;

end;

procedure TfmBaseFormAnimalCatalogue.actClearSearchExecute(Sender: TObject);
begin
  inherited;
  teSearchText.Text := '';
end;

procedure TfmBaseFormAnimalCatalogue.mdCatalogueAnimalsNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  mdCatalogueAnimalsSelected.AsBoolean := False;
end;

function TfmBaseFormAnimalCatalogue.GetSelectedAnimals: PIntegerArray;
var
   BK : TBookmark;
begin
   SetLength(Result, 0);
   with mdCatalogueAnimals do
      begin
         DisableControls;
         try
            BK := GridCatalogueAnimalsDBTableView.DataController.DataSet.GetBookmark;
            try
               First;
               while not eof do
                  begin
                     if mdCatalogueAnimalsSelected.AsBoolean then
                        begin
                           SetLength(Result,Length(Result)+1);
                           Result[Length(Result)-1] := mdCatalogueAnimalsID.AsInteger;
                        end;
                     Next;
                  end;
            finally
               GridCatalogueAnimalsDBTableView.DataController.DataSet.GoToBookmark(BK);
               GridCatalogueAnimalsDBTableView.DataController.DataSet.FreeBookmark(BK);
            end;
         finally
             EnableControls;
         end;
      end;
end;

procedure TfmBaseFormAnimalCatalogue.GridCatalogueAnimalsDBTableViewDblClick(
  Sender: TObject);
begin
  inherited;
  mdCatalogueAnimals.Edit;
  mdCatalogueAnimalsSelected.AsBoolean := not(mdCatalogueAnimalsSelected.AsBoolean);
  mdCatalogueAnimals.Post;
end;

procedure TfmBaseFormAnimalCatalogue.cbIncludeLeftHerdPropertiesChange(
  Sender: TObject);
begin
  inherited;
  FIncludeAnimalsLeftHerd := cbIncludeAnimalsLeftHerd.Checked;
  LoadAnimals;
end;

procedure TfmBaseFormAnimalCatalogue.SetGridStyleContentEvenOdd(
  const Value: Boolean);
begin
   FGridStyleContentEvenOdd := Value;

   GridCatalogueAnimalsDBTableView.Styles.ContentOdd := cxStyleContentEven;
   if FGridStyleContentEvenOdd then
      GridCatalogueAnimalsDBTableView.Styles.ContentOdd := cxStyleContentOdd
   else
      GridCatalogueAnimalsDBTableView.Styles.ContentEven := cxStyleContentEven;
end;

procedure TfmBaseFormAnimalCatalogue.actContinueSearchExecute(
  Sender: TObject);
begin
  inherited;
   SearchForAnimal(GridCatalogueAnimalsDBTableView.DataController.FocusedRecordIndex+1);
end;

end.
