unit uAccDefComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, RXCtrls, TB97, StdCtrls, RxLookup, DB, ExtCtrls, DBCtrls,
  DBTables, kwDBNavigator, Grids, DBGrids, RXDBCtrl;

type
  TAccDefComp = class(TForm)
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    RxSpeedButton2: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    Label2: TLabel;
    AliasListing: TListBox;
    Bevel1: TBevel;
    Owners: TTable;
    KwDBNavigator1: TKwDBNavigator;
    ToolbarSep972: TToolbarSep97;
    dsOwners: TDataSource;
    RxDBGrid1: TRxDBGrid;
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OwnersAfterScroll(DataSet: TDataSet);
    procedure AliasListingClick(Sender: TObject);
    procedure KwDBNavigator1BeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  Path = 'C:\Kingsacc\';

var
  AccDefComp: TAccDefComp;
  Company : String[30];

implementation
uses
   DairyData;
{$R *.DFM}

procedure TAccDefComp.FormShow(Sender: TObject);
var
   i : SmallInt;
   AccsDirs : TStringList;
   SR : TSearchRec;
   Comp : String;
begin
   try
      AccsDirs := TStringList.Create;

      if (FindFirst(Path+'*.*', faDirectory, sr) = 0) AND ((Sr.Attr and faDirectory) = 0) then
         AccsDirs.Add(sr.Name);

      while FindNext(sr) = 0 do
          AccsDirs.Add(sr.Name);

      if AccsDirs.Count > 1 then
         for i := 0 to AccsDirs.Count-1 do
            begin
               if FindFirst(Path+AccsDirs.Strings[i]+'\Cashbook.def', faAnyFile, SR) = 0 then
                  AliasListing.Items.Add(AccsDirs.Strings[i]);
            end;

   finally
      AccsDirs.Free;
      FindClose(SR);
   end;
end;

procedure TAccDefComp.RxSpeedButton2Click(Sender: TObject);
begin
   Close;
end;

procedure TAccDefComp.FormDestroy(Sender: TObject);
begin
   Owners.Filter :=  '';
   Owners.Filtered := False;
   Owners.Close;
end;

procedure TAccDefComp.FormCreate(Sender: TObject);
begin
   Owners.Filter :=  'HerdIdentity <> ''NONE''';
   Owners.Filtered := True;
   Owners.Open;
end;

procedure TAccDefComp.OwnersAfterScroll(DataSet: TDataSet);
begin
   AliasListing.ItemIndex := -1;
   AliasListing.ItemIndex := AliasListing.Items.IndexOf(Owners.FieldByName('DefAccComp').AsString);
end;

procedure TAccDefComp.AliasListingClick(Sender: TObject);
begin
   Owners.Edit;
end;

procedure TAccDefComp.KwDBNavigator1BeforeAction(Sender: TObject;
  Button: TKNavigateBtn);
var
   i : Byte;
begin
   for i := 0 to AliasListing.Items.Count-1 do
      begin
         if AliasListing.Selected[i] then
            begin
               Company := AliasListing.Items[i];
               Break;
            end;
      end;
   Owners.FieldByName('DefAccComp').AsString := Company;
end;

end.
