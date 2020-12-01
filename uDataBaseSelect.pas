unit uDataBaseSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, DBIndex, DBLists, DBFilter, RXCtrls, ComCtrls,
  ExtCtrls, Adgrad;

type
  TfDataBaseSelect = class(TForm)
    RxSpeedButton1: TRxSpeedButton;
    RxSpeedButton2: TRxSpeedButton;
    AliasListing: TTextListBox;
    DBDEMOS: TDatabase;
    AdrockGradientFill1: TAdrockGradientFill;
    Image4: TImage;
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
     NewPath : String;
  public
    { Public declarations }
  end;

var
  fDataBaseSelect: TfDataBaseSelect;
  st : TStringList;
  sr : TSearchRec;
  Path : String;

implementation
{$R *.DFM}


procedure TfDataBaseSelect.FormShow(Sender: TObject);
var
   n,
   x,
   i,
   j : Integer;
   g,
   p,
   DBName : String;
   s : TStringList;
   H : String;
begin
   Path := 'C:\Kingswd\';// ExtractFilePath(ParamStr(0));
   st := TStringList.Create;
   s := TStringList.Create;
   if FindFirst(Path+'*.*', faDirectory, sr) = 0 then
      if Pos('.', sr.Name) <= 0 then
         st.Add(sr.Name);
   while FindNext(sr) = 0 do
      if Pos('.', sr.Name) <= 0 then
         st.Add(sr.Name);
   if St.Count > 1 then
      for i := 0 to st.Count-1 do
         begin                               // search for animals.db will indicate comewhat that a data folder exists!
            if FindFirst(Path+St.Strings[i]+'\Animals.db', faAnyFile, sr) = 0 then
               AliasListing.Items.Add(St.Strings[i]);
         end;
   St.Sort;
   FindClose(sr);
   Session.GetAliasParams('Kingswd', S);
   for j := 0 to S.Count-1 do
      if POS('PATH', S.Strings[j]) > 0 then
         begin
            g := S.Strings[j];
            n := Length(S.Strings[j]);
            for x := 0 to n do
              if Copy(G, n-x, 1) <> '\' then
                 DBName := DBName+Copy(G, n-x, 1)
              else
                 Break;
            G := '';
            for i := Length(DBName) Downto 1 do
               G := G+DBName[i];
         end;
   for i := 0 to AliasListing.Items.Count-1 do
      begin
         if AliasListing.Items.Strings[i] = G then
            AliasListing.Selected[i] := True;
      end;
end;

procedure TfDataBaseSelect.RxSpeedButton1Click(Sender: TObject);
var
  AParams: TStringList;
  Dir: string;
   i : Integer;
begin
   for i := 0 to AliasListing.Items.Count-1 do
     if AliasListing.Selected[I] then
        NewPath := Path+AliasListing.Items.Strings[i];

  if NewPath = '' then
     Exit;

  AParams := TStringList.Create;
  try
     AParams.Clear;
     AParams.Add('PATH=' + NewPath);
     Session.ModifyAlias('Kingswd',AParams);
     Session.SaveConfigFile;
  finally
    AParams.Free;
  end;
  Close;
end;

procedure TfDataBaseSelect.RxSpeedButton2Click(Sender: TObject);
begin
   close;
end;

end.
