unit uCrushSaveAnimal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, DBTables, GenTypesConst, DairyData;

type
  TfmCrushSaveAnimal = class(TForm)
  procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    qSaveCrushAnimal : TUpdateSQL;
  end;

var
   fmCrushSaveAnimal: TfmCrushSaveAnimal;

implementation

{$R *.DFM}

procedure TfmCrushSaveAnimal.FormCreate(Sender: TObject);
begin
//
end;

end.
