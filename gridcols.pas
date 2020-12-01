unit gridcols;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, FileCtrl, dbgrids, DBGridEh;

type
  ColumnIndex = 0..49;
  TRequiredCols = set of ColumnIndex;
  TGridColType = (VCLDbGridCols, RxDbGridCols, EhDbGridCols);
  TfmGridCols = class(TForm)
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
  private
    { Private declarations }
    fCols : TCollection;
    fPath : String;
    fOutputName : string;
    fGridColType : TGridColType;
    fReqCols : TRequiredCols;
    procedure LoadCols;
    procedure StoreCols;
    function RequiredCol(Index : Integer) : Boolean;
  public
    class procedure ShowForm(ACols : TCollection; ReqCols : TRequiredCols;
         const GridType : TGridColType; const Path, outputname : string);
    { Public declarations }
  end;

var
  fmGridCols: TfmGridCols;

implementation
uses
   KRoutines, GenTypesConst;

{$R *.DFM}

procedure TfmGridCols.LoadCols;
var
   i, ThisCol : Integer;
begin
   with CheckListBox1 do
      begin
         Items.Clear;
         for i := 0 to FCols.Count-1 do
            begin
               if fGridColType <> EhDbGridCols then
                  ThisCol := Items.Add(TColumn(FCols.Items[i]).Field.DisplayName)
               else
                  ThisCol := Items.Add(TColumnEh(FCols.Items[i]).Field.DisplayName);

               if RequiredCol(ThisCol) then // these are required cols, do not allow to change visible state, "6" LactNo not a required columnm
                  begin
                     Checked[ThisCol] := True;
                     ItemEnabled[ThisCol] := False;
                  end
               else
                  begin
                     if fGridColType <> EhDbGridCols then
                        Checked[ThisCol] := TColumn(FCols.Items[i]).Visible
                     else
                        Checked[ThisCol] := TColumnEh(FCols.Items[i]).Visible;
                  end;
            end;
      end;
end;

function TfmGridCols.RequiredCol(Index: Integer): Boolean;
begin
   Result := ( Index in fReqCols );
end;

class procedure TfmGridCols.ShowForm(ACols: TCollection;
  ReqCols: TRequiredCols; const GridType: TGridColType; const Path,
  outputname: string);
begin
   with TfmGridCols.Create(nil) do
      try
         fGridColType := GridType;
         fCols := ACols;
         fPath := Path;
         fOutputName := outputname;
         fReqCols := ReqCols;
         LoadCols;
         if ShowModal = mrOK then
            StoreCols;
      finally
         Free;
      end;
end;

procedure TfmGridCols.StoreCols;
var
   i : integer;
begin
   for i := 0 to CheckListBox1.Items.Count-1 do
      begin
         if fGridColType <> EhDbGridCols then
            TColumn(FCols.Items[i]).Visible := CheckListBox1.Checked[i]
         else
            TColumnEh(FCols.Items[i]).Visible := CheckListBox1.Checked[i]
      end;

   if fGridColType <> EhDbGridCols then
      TDBGridColumnsEh(FCols).SaveToFile( IncludeTrailingBackslash( FPath ) + fOutputName)
   else
      TDBGridColumns(FCols).SaveToFile( IncludeTrailingBackslash( FPath ) + fOutputName)
end;

end.
