unit SrchDlg;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const
  ListCalveTypes = '7';
  ListBirthTypes = '6';

type
// TListType indicates the type of Listing being displayed
  TListType = (Breeds, Owners, Sires, Dams, BirthTypes, CalveTypes );

  TSearchDlg = class(TForm)
    DataSource: TDataSource;
    SearchGrid: TDBGrid;
    OKBtn: TButton;
    CancelBtn: TButton;
    SearchEd: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SearchButton: TSpeedButton;
    AddRecord: TBitBtn;
    qList: TQuery;
    // Search the current Table
    procedure SearchGridDblClick(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure OrderComboChange(Sender: TObject);
    procedure SearchEdKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEdChange(Sender: TObject);
    // Button to add records to the Table
    procedure AddRecordClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    WhichList : TListType;
    SrchFld: TField;
    function  GetHerdCode: Integer;
    procedure SetHerdCode(NewHerdCode: Integer);
    function  GetBirthCode: String;
    procedure SetBirthCode(NewBirthCode: String);
    function  GetCalveCode: String;
    procedure SetCalveCode(NewCalveCode: String);
    function  GetBreedCode: String;
    procedure SetBreedCode(NewBreedCode: String);
    function  GetDamCode: LongInt;
    procedure SetDamCode(NewDamCode: LongInt);
    function  GetSireCode: LongInt;
    procedure SetSireCode(NewSireCode: LongInt);

    procedure SetAddButton(NewValue: Boolean);
  public
    // Check if the Add Buttonshould be visible
    property AddButton: Boolean write SetAddButton default False;
    property BreedCode: String read GetBreedCode write SetBreedCode;
    property HerdCode: Integer read GetHerdCode write SetHerdCode;
    property DamCode: LongInt read GetDamCode write SetDamCode;
    property SireCode: LongInt read GetSireCode write SetSireCode;
    property BirthCode: String read GetBirthCode write SetBirthCode;
    property CalveCode: String read GetCalveCode write SetCalveCode;

    // All these functions return mrOK if the user dlbclicks or presses OK
    function ShowModalHerds: Integer;
    function ShowModalBreeds: Integer;
    function ShowModalDams: Integer;
    function ShowModalSires: Integer;
    function ShowBirthTypes: Integer;
    function ShowCalveTypes: Integer;
  end;

var
  SearchDlg: TSearchDlg;

implementation

uses SetUpBreeds,
     DairyData;

{$R *.DFM}

procedure TSearchDlg.SetAddButton(NewValue: Boolean);
begin
  AddRecord.Visible := NewValue;
end;

function TSearchDlg.GetHerdCode: Integer;
begin
  Result := WinData.OwnerFile.Fields[0].Value;
end;

procedure TSearchDlg.SetHerdCode(NewHerdCode: Integer);
begin
  WinData.OwnerFile.Locate('ID', NewHerdCode, []);
end;

function TSearchDlg.GetBirthCode: String;
begin
  Result := qList.Fields[0].Value;
end;

procedure TSearchDlg.SetBirthCode(NewBirthCode: String);
begin
  qList.Locate('Code', NewBirthCode, []);
end;

function TSearchDlg.GetCalveCode: String;
begin
  Result := qList.Fields[0].Value;
end;

procedure TSearchDlg.SetCalveCode(NewCalveCode: String);
begin
  qList.Locate('Code', NewCalveCode, []);
end;

function TSearchDlg.GetBreedCode: String;
begin
  Result := WinData.BreedsCode.Value;
end;

procedure TSearchDlg.SetBreedCode(NewBreedCode: String);
begin
  WinData.Breeds.Locate('Code', NewBreedCode, []);
end;

function TSearchDlg.GetDamCode: LongInt;
begin
  Result := WinData.DamQuery.Fields[0].AsInteger;
end;

procedure TSearchDlg.SetDamCode(NewDamCode: LongInt);
begin
  WinData.DamQuery.Locate('ID', NewDamCode, []);
end;

function TSearchDlg.GetSireCode: LongInt;
begin
  Result := WinData.SireQuery.Fields[0].AsInteger;
end;

procedure TSearchDlg.SetSireCode(NewSireCode: LongInt);
begin
  WinData.SireQuery.Locate('ID', NewSireCode, []);
end;

function TSearchDlg.ShowModalHerds: Integer;
begin
  WhichList := Owners;
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('ID');
  OrderCombo.Items.Add('Name');
  OrderCombo.ItemIndex := 0;
  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'ID';
  SearchGrid.Columns.Add.FieldName := 'Name';
  Datasource.Dataset := WinData.OwnerFile;
  OrderComboChange(nil);
  Caption := 'Select a Herd';
  Result := ShowModal;
end;

function TSearchDlg.ShowModalBreeds: Integer;
begin
  WhichList := Breeds;
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('Code');
  OrderCombo.Items.Add('Name');
  OrderCombo.ItemIndex := 0;
  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'Code';
  SearchGrid.Columns.Add.FieldName := 'Name';
  Datasource.Dataset := WinData.Breeds;
  OrderComboChange(nil);
  Caption := 'Select a Breed';
  Result := ShowModal;
end;

function TSearchDlg.ShowModalDams: Integer;
begin
// add the SQL info to the DAM Query
  WinData.DamQuery.Close;
  WinData.DamQuery.SQL.Clear;
  WinData.DamQuery.SQL.Add('Select ID, AnimalNo, NatIDNum From Animals where ( Sex = ' + '''Female''' + ') And ( ID <> ' + WinData.AnimalFileByIDID.AsString + ')');
  WinData.DamQuery.Open;

  WhichList := Dams;
  OrderCombo.Items.Clear;

  OrderCombo.Items.Add('AnimalNo');
  OrderCombo.Items.Add('NatIDNum');
  OrderCombo.ItemIndex := 0;

  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'AnimalNo';
  SearchGrid.Columns.Add.FieldName := 'NatIDNum';
  Datasource.Dataset := WinData.DamQuery;
  OrderComboChange(nil);
  Caption := 'Select a Dam';
  Result := ShowModal;
end;

function TSearchDlg.ShowModalSires: Integer;
begin
// add the SQL info to the SIRE Query
  WinData.SireQuery.Close;
  WinData.SireQuery.SQL.Clear;
  WinData.SireQuery.SQL.Add('Select ID, AnimalNo, NatIDNum From Animals where ( Sex <> ' + '''Female''' + ') And ( ID <> ' + WinData.AnimalFileByIDID.AsString + ')');
  WinData.SireQuery.Open;

  WhichList := Sires;
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('AnimalNo');
  OrderCombo.Items.Add('NatIDNum');
  OrderCombo.ItemIndex := 0;
  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'AnimalNo';
  SearchGrid.Columns.Add.FieldName := 'NatIDNum';
  Datasource.Dataset := WinData.SireQuery;
  OrderComboChange(nil);
  Caption := 'Select a Sire';
  Result := ShowModal;
end;

function TSearchDlg.ShowBirthTypes: Integer;
begin
  qList.Close;
  qList.SQL.Clear;
  qList.SQL.Add('Select Code, Description From GenLook where ( ListType = ' + ListBirthTypes + ')');
  qList.Open;

  WhichList := BirthTypes;
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('Code');
  OrderCombo.Items.Add('Description');
  OrderCombo.ItemIndex := 0;
  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'Code';
  SearchGrid.Columns.Add.FieldName := 'Description';
  Datasource.Dataset := qList;
  OrderComboChange(nil);
  Caption := 'Select a Birth Type';
  Result := ShowModal;
end;

function TSearchDlg.ShowCalveTypes: Integer;
begin
  qList.Close;
  qList.SQL.Clear;
  qList.SQL.Add('Select Code, Description From GenLook where ( ListType = ' + ListCalveTypes + ')');
  qList.Open;

  WhichList := CalveTypes;
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('Code');
  OrderCombo.Items.Add('Description');
  OrderCombo.ItemIndex := 0;
  SearchGrid.Columns.Clear;
  SearchGrid.Columns.Add.FieldName := 'Code';
  SearchGrid.Columns.Add.FieldName := 'Description';
  Datasource.Dataset := qList;
  OrderComboChange(nil);
  Caption := 'Select a Calve Type';
  Result := ShowModal;
end;

procedure TSearchDlg.SearchGridDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TSearchDlg.SearchButtonClick(Sender: TObject);
begin
  if not Datasource.Dataset.Locate(OrderCombo.Text, SearchEd.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No matching record found.', mtInformation, [mbOK], 0);
end;

procedure TSearchDlg.OrderComboChange(Sender: TObject);
begin
  SrchFld := Datasource.Dataset.FieldByName(OrderCombo.Text);
  SearchEd.Text := '';
end;

procedure TSearchDlg.SearchEdKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(SrchFld) and (Key > ' ') and not (SrchFld.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TSearchDlg.SearchEdChange(Sender: TObject);
begin
  SearchButton.Enabled := SearchEd.Text <> '';
  SearchButtonClick(Sender);
end;

procedure TSearchDlg.AddRecordClick(Sender: TObject);
begin
     Case WhichList Of
   	Breeds : SetUpBreeds.ShowTheForm(TRUE);
     End;
end;

procedure TSearchDlg.FormActivate(Sender: TObject);
begin
     // Check the AddButton property
     AddButton := ( WhichList In [Breeds,Owners] );
end;

end.
