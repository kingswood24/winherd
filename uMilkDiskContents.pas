unit uMilkDiskContents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl,DBTables,DB;

type
  TfMilkDiskContents = class(TForm)
    DiskContents: TRxDBGrid;
  private
    { Private declarations }
    DiskLine : String;
    MyTable : TTable;
    MySource : TDataSource;
  public
    { Public declarations }
  end;

{
var
  fMilkDiskContents: TfMilkDiskContents;
}

  procedure CreateAndShow ( MyFile : TextFile );

implementation
uses
    DairyData;

{$R *.DFM}

procedure CreateAndShow ( Myfile : ^TextFile );
begin
     with TfMilkDiskContents.Create(Application) Do
        try
           MyTable := TTable.Create(nil);
           MyTable.DatabaseName := WinData.KingData.DatabaseName;
           MyTable.TableName := 'TempMilk';
           MyTable.FieldDefs := WinData.MilkDiskTrans.FieldDefs;
           MyTable.CreateTable;
           MyTable.Open;

           MySource := TDataSource.Create(nil);
           MySource.DataSet := MyTable;

           DiskContents.DataSource := MySource;

           // process the Milk Disk
           While NOT ^MyFile.EOF do
              begin
              end;   


           ShowModal;
        finally
           MyTable.Close;
           MyTable.DeleteTable;
           MyTable.Free;
           MySource.Free;
           Free;
        end;
end;

end.
