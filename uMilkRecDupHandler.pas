unit uMilkRecDupHandler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Grids;

type
  TfmMilkRecDupHandler = class(TForm)
    StringGrid1: TStringGrid;
    btnSelect: TButton;
    QAnimal: TQuery;
    qDeleteDup: TQuery;
    Label1: TLabel;
    procedure btnSelectClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FAnimals : String;
    FAnimalArray :  array of Integer;
    FDelete : Integer;
    FResult : Integer;
    procedure SetupParams;
    procedure SetupForm;
    procedure LoadAnimals;
  public
    { Public declarations }
  end;

  function ShowForm(const Animals : array of Integer) : Integer;

var
  fmMilkRecDupHandler: TfmMilkRecDupHandler;

implementation

{$R *.DFM}

  function ShowForm(const Animals : array of Integer) : Integer;
  var
   i : Integer;
  begin
     try
        Application.CreateForm(TfmMilkRecDupHandler, fmMilkRecDupHandler);
        SetLength(fmMilkRecDupHandler.FAnimalArray, Length(Animals));

        for i := Low(Animals) to High(Animals) do
           fmMilkRecDupHandler.FAnimalArray[i] := Animals[i];
        fmMilkRecDupHandler.SetupParams;
        fmMilkRecDupHandler.SetupForm;
        fmMilkRecDupHandler.ShowModal;
        Result := fmMilkRecDupHandler.FResult;
     finally
        fmMilkRecDupHandler.Free;
     end;
  end;

procedure TfmMilkRecDupHandler.SetupForm;
begin

   StringGrid1.ColWidths[0] := 90;
   StringGrid1.ColWidths[1] := 180;
   StringGrid1.ColWidths[2] := 100;
   StringGrid1.ColWidths[3] := 40;
   StringGrid1.Cells[0, 0] := 'AnimalNo';
   StringGrid1.Cells[1, 0] := 'Nat ID Num';
   StringGrid1.Cells[2, 0] := 'Date Of Birth';
   StringGrid1.Cells[3, 0] := 'Lact No';
end;

procedure TfmMilkRecDupHandler.SetupParams;
var
   i : Integer;
   FirstID : Boolean;
begin
   FirstID := True;
   for i := low(FAnimalArray) to high(FAnimalArray) do
      begin
         if FirstID then
            begin
               FirstID := False;
               FAnimals := '(' + IntToStr(FAnimalArray[i]);
            end
         else
            FAnimals := FAnimals + ',' + IntToStr(FAnimalArray[i]);
      end;
   FAnimals := FAnimals + ')';
   LoadAnimals;
end;

procedure TfmMilkRecDupHandler.btnSelectClick(Sender: TObject);
var
  gRow : Integer;
begin
   gRow := StringGrid1.Selection.Top;
   if StringGrid1.Objects[0, gRow] <> nil then
      FResult := Integer(StringGrid1.Objects[0, gRow]);
end;

procedure TfmMilkRecDupHandler.LoadAnimals;
begin
//   Session.AddPassword('copper');
   QAnimal.SQl.Add('Select ID, NatIDNum, AnimalNo, DateofBirth, LactNo from Animals where ID IN '+ FAnimals );
   QAnimal.Open;
   if not QAnimal.IsEmpty then
      begin
         QAnimal.First;
         while not QAnimal.Eof do
            begin
               with StringGrid1 do
                  begin
                     Cells[0, RowCount-1] := QAnimal.FieldByName('AnimalNo').AsString;
                     Cells[1, RowCount-1] := QAnimal.FieldByName('NatIDNum').AsString;
                     Cells[2, RowCount-1] := DateToStr(QAnimal.FieldByName('DateofBirth').AsDateTime);
                     Cells[3, RowCount-1] := IntToStr(QAnimal.FieldByName('LactNo').AsInteger);
                     Objects[0, RowCount-1] := Pointer(QAnimal.FieldByName('ID').AsInteger);
                     RowCount := RowCount + 1;
                  end;
               QAnimal.Next;
            end;
         QAnimal.Close;
         StringGrid1.RowCount := StringGrid1.RowCount-1;
      end;
end;

procedure TfmMilkRecDupHandler.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := ( ModalResult = mrOK );
end;

end.
