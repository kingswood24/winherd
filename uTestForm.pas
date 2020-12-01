unit uTestForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, db, dbTables, GenTypesConst, KRoutines,
  uCreateAnimalXMLIHMFileProgress;

type
  TfmTestForm = class(TForm)
    btnDoSomething: TcxButton;
    procedure btnDoSomethingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FQuery : TQuery ;
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmTestForm: TfmTestForm;

implementation

{$R *.DFM}

{ TfmTestForm }

class procedure TfmTestForm.ShowTheForm;
begin
   with TfmTestForm.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTestForm.btnDoSomethingClick(Sender: TObject);
begin
   FQuery.Close;
   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT A.ID AnimalID');
   FQuery.SQL.Add('FROM Animals A');
   FQuery.SQL.Add('WHERE A.InHerd = True');
   FQuery.SQL.Add('AND   A.AnimalDeleted = False');
   FQuery.SQL.Add('AND   Upper(A.Sex) = "FEMALE"');
   FQuery.SQL.Add('AND   A.HerdID IN (SELECT DefaultHerdID FROM Defaults)');
   FQuery.SQL.Add('AND   A.ID IN (2767, 2773, 2777)');
   FQuery.Open;

   TfmCreateAnimalXMLIHMFileProgress.ShowTheForm(FQuery);

   FQuery.Close;
end;

procedure TfmTestForm.FormCreate(Sender: TObject);
begin
   FQuery := TQuery.Create(nil);
   FQuery.DatabaseName := AliasName;
end;

procedure TfmTestForm.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FQuery);
end;

end.
