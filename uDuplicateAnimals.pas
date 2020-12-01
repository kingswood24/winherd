{
   11/05/15 [V5.4 R5.6] /MK Bug Fix - FormCreate code moved to FormActivate as FTargetAnimals was not assiged yet.
                                      FTargetAnimals tells the form when to show PopupMenu1 for right-click on grid.

   13/05/19 [V5.8 R9.2] /MK Change - Added HerdBookNo and Name fields to the grid that are not visible currently.
                                     I used this to see if the user had added any extra detail to one version of the AI - Fletchers.
}

unit uDuplicateAnimals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridLevel, cxGrid, StdCtrls, cxButtons, db, dbtables,
  cxContainer, cxEdit, cxLabel, Menus, KRoutines;

type
  TTargetAnimals = (taAllAnimals, taAIBulls);

  TfmDuplicateAnimals = class(TForm)
    AnimalGridLevel1: TcxGridLevel;
    AnimalGrid: TcxGrid;
    AnimalGridTableView: TcxGridTableView;
    btnUpdate: TcxButton;
    btnClose: TcxButton;
    AnimalGridTableViewAnimalNo: TcxGridColumn;
    AnimalGridTableViewNatIdNo: TcxGridColumn;
    AnimalGridTableViewDateOfBirth: TcxGridColumn;
    AnimalGridTableViewSex: TcxGridColumn;
    AnimalGridTableViewNewNumber: TcxGridColumn;
    AnimalGridTableViewId: TcxGridColumn;
    AnimalGridTableViewLeftHerd: TcxGridColumn;
    cxLabel1: TcxLabel;
    btnAutoFix: TcxButton;
    PopupMenu1: TPopupMenu;
    Removeallotherinstancesofthisanimal1: TMenuItem;
    AnimalGridTableViewHerdId: TcxGridColumn;
    AnimalGridTableViewHerdBookNo: TcxGridColumn;
    AnimalGridTableViewName: TcxGridColumn;
    procedure btnUpdateClick(Sender: TObject);
    procedure AnimalGridTableViewDateOfBirthGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btnAutoFixClick(Sender: TObject);
    procedure Removeallotherinstancesofthisanimal1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FTargetAnimals : TTargetAnimals;
    FNoneHerdId : Integer;
    { Private declarations }
    procedure LoadDuplicateAnimals();
    //function GetDuplicatesFound: Boolean;
    procedure UpdateAnimals();
    procedure UpdateAnimal(AAnimalId : Integer; ANewAnimalNo : string = '');
  public
    { Public declarations }
    //property DuplicatesFound : Boolean read GetDuplicatesFound;
    class function DuplicatesFound(const ATargetAnimals : TTargetAnimals = taAllAnimals) : Boolean;
    class procedure ShowForm(const ATargetAnimals : TTargetAnimals = taAllAnimals);
  end;

var
  fmDuplicateAnimals: TfmDuplicateAnimals;

implementation
uses
   GenTypesConst, DairyData;

{$R *.DFM}

{ TfmDuplicateAnimals }

procedure TfmDuplicateAnimals.LoadDuplicateAnimals;
var
   RecordIndex : Integer;
begin
   try
      RecordIndex := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT A.Id, A.AnimalNo, A.NatIdNum, A.DateOfBirth, A.Sex, A.InHerd, A.SortAnimalNo, A.HerdId, A.HerdBookNo, A.Name');
            SQL.Add('FROM Animals A');
            SQL.Add('WHERE A.AnimalDeleted = FALSE');
            SQL.Add('AND A.AnimalNo IN ( SELECT A.AnimalNo');
            SQL.Add('                    FROM Animals A');
            if (FTargetAnimals = taAIBulls) then
               begin
                  SQL.Add('              WHERE (A.HerdId = '+IntToStr(WinData.NoneHerdId)+')');
                  SQL.Add('              AND   (A.Sex = "Bull")');
                  SQL.Add('              AND   (A.AnimalDeleted = FALSE)');
               end;
            SQL.Add('                    GROUP BY A.AnimalNo');
            SQL.Add('                    HAVING COUNT(A.AnimalNo)>1 )');
            if (FTargetAnimals = taAIBulls) then
               begin
                  SQL.Add('AND (A.HerdId = '+IntToStr(WinData.NoneHerdId)+')');
                  SQL.Add('AND (A.Sex = "Bull")');
                  SQL.Add('ORDER BY A.AnimalNo, A.Id ASC'); // its important to sort by ID as we want the first instance of a duplicate to appear first in the grid.
               end;
            Open;
            try
               First;
               AnimalGridTableView.DataController.RecordCount := RecordCount;
               while not eof do
                  begin
                     AnimalGridTableView.DataController.Values[RecordIndex, 0] := Fields[0].AsInteger;
                     AnimalGridTableView.DataController.Values[RecordIndex, 1] := Fields[1].AsString;
                     AnimalGridTableView.DataController.Values[RecordIndex, 2] := Fields[2].AsString;
                     AnimalGridTableView.DataController.Values[RecordIndex, 3] := Fields[3].AsDateTime;
                     AnimalGridTableView.DataController.Values[RecordIndex, 4] := Fields[4].AsString;
                     AnimalGridTableView.DataController.Values[RecordIndex, 5] := not(Fields[5].AsBoolean);
                     AnimalGridTableView.DataController.Values[RecordIndex, 7] := Fields[7].AsInteger;
                     AnimalGridTableView.DataController.Values[RecordIndex, 8] := Fields[8].AsString;
                     AnimalGridTableView.DataController.Values[RecordIndex, 9] := Fields[9].AsString;
                     Inc(RecordIndex);
                     Next;
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   except
   end;
end;

{function TfmDuplicateAnimals.GetDuplicatesFound: Boolean;
begin
   Result := AnimalGridTableView.DataController.RecordCount>0;
end;}

procedure TfmDuplicateAnimals.btnUpdateClick(Sender: TObject);
begin
   UpdateAnimals();
end;

procedure TfmDuplicateAnimals.UpdateAnimals;
var
   AnimalsUpdated : Integer;
   RecordIndex : Integer;
begin
   for RecordIndex := 0 to AnimalGridTableView.DataController.RecordCount-1 do
      begin
         if not VarIsNull(AnimalGridTableView.DataController.Values[RecordIndex, 6]) then
            begin
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add('UPDATE Animals SET AnimalNo =:AnimalNo');
                     SQL.Add('WHERE ID=:ID');
                     Params[0].AsString := AnimalGridTableView.DataController.Values[RecordIndex, 6];
                     Params[1].AsInteger := AnimalGridTableView.DataController.Values[RecordIndex, 0];
                     ExecSQL;

                     Inc(AnimalsUpdated);
                  finally
                     Free;
                  end;
            end;
      end;
   MessageDlg(Format('%d / %d animal(s) updated',[AnimalsUpdated,AnimalGridTableView.DataController.RecordCount]),mtInformation,[mbOK],0);
   Close;
end;

procedure TfmDuplicateAnimals.AnimalGridTableViewDateOfBirthGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ( ARecord.Values[3] <= 0 ) then
      AText := '';
end;

procedure TfmDuplicateAnimals.btnAutoFixClick(Sender: TObject);
var
   i : Integer;
begin
   AnimalGridTableView.DataController.BeginFullUpdate;
   try
      for i := 0 to AnimalGridTableView.DataController.RecordCount-1 do
         begin
            // if animal has "left the herd" OR is a "None Herd animal" then proceed with update 
            if ( AnimalGridTableView.DataController.Values[i, 5] = True ) or
               ( AnimalGridTableView.DataController.Values[i, 7] = FNoneHerdId ) then
               UpdateAnimal(AnimalGridTableView.DataController.Values[i, 0]);
         end;
      LoadDuplicateAnimals();
   finally
      AnimalGridTableView.DataController.EndFullUpdate;
   end;
end;

procedure TfmDuplicateAnimals.UpdateAnimal(AAnimalId : Integer; ANewAnimalNo : string = '');
var
   sSortAnimalNo : String;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Animals');
         SQL.Add('SET AnimalNo =:AnimalNo,');
         SQL.Add('    SortAnimalNo = :SortAnimalNo');
         SQL.Add('WHERE ID=:ID');
         Params[0].AsString := ANewAnimalNo;
         if ( Length(ANewAnimalNo) > 0 ) then
            Params[1].AsString := PadRight(ANewAnimalNo,'0',10)
         else
            Params[1].AsString := ANewAnimalNo;
         Params[2].AsInteger := AAnimalId;
         ExecSQL;
      finally
         Free;
      end;
end;

class procedure TfmDuplicateAnimals.ShowForm(const ATargetAnimals : TTargetAnimals);
begin
   fmDuplicateAnimals := TfmDuplicateAnimals.Create(nil);
   try
      fmDuplicateAnimals.FTargetAnimals := ATargetAnimals;
      fmDuplicateAnimals.ShowModal;
   finally
      FreeAndNil(fmDuplicateAnimals);
   end;
end;

class function TfmDuplicateAnimals.DuplicatesFound(const ATargetAnimals : TTargetAnimals): Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT A.AnimalNo');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE A.AnimalDeleted = FALSE');
         if (ATargetAnimals = taAIBulls) then
            begin
               SQL.Add('AND (A.HerdId = '+IntToStr(WinData.NoneHerdId)+')');
               SQL.Add('AND (A.Sex = "Bull")');
            end;
         SQL.Add('GROUP BY A.AnimalNo');
         SQL.Add('HAVING COUNT(A.AnimalNo)>1');
         Open;
         try
            Result := RecordCount>0;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmDuplicateAnimals.Removeallotherinstancesofthisanimal1Click(
  Sender: TObject);
var
   i : Integer;
   IdToKeep : Integer;
   AnimalNo : string;
   IdsToDelete : TIntArray;
   ArrayLength : Integer;
begin
   AnimalGrid.Enabled := False;
   try
      SetLength(IdsToDelete,0);

      IdToKeep := AnimalGridTableView.DataController.Values[AnimalGridTableView.DataController.FocusedRowIndex, 0];
      AnimalNo := AnimalGridTableView.DataController.Values[AnimalGridTableView.DataController.FocusedRowIndex, 1];
      for i := 0 to AnimalGridTableView.DataController.RecordCount-1 do
         begin
            if (AnimalGridTableView.DataController.Values[i, 1] =  AnimalNo) and
               (AnimalGridTableView.DataController.Values[i, 0] <> IdToKeep )then
               begin
                  ArrayLength := Length(IdsToDelete)+1;
                  SetLength(IdsToDelete,ArrayLength);
                  IdsToDelete[ArrayLength-1] := AnimalGridTableView.DataController.Values[i, 0];
               end;
         end;

      if ( Length(IdsToDelete) <= 0) then
         begin
            MessageDlg('There are no animals to remove.',mtInformation,[mbOK],0);
         end
      else
         begin
            WinData.RemoveDuplicateAIBulls(IdToKeep,IdsToDelete);
            LoadDuplicateAnimals();
         end;

   finally
      AnimalGrid.Enabled := True;
   end;
end;

procedure TfmDuplicateAnimals.FormShow(Sender: TObject);
begin
   if (FTargetAnimals = taAIBulls) then
      begin
         btnAutoFix.Hide;
         btnUpdate.Hide;
         cxLabel1.Caption := 'To remove duplicate bulls, right click on the first instance of each duplicate ' + cCRLF +
                             'and click the ''Remove all other instances of this animal''';
      end;
   LoadDuplicateAnimals();
end;

procedure TfmDuplicateAnimals.FormActivate(Sender: TObject);
begin
   //   11/05/15 [V5.4 R5.6] /MK Bug Fix - Popup Menu was assigned on FormCreate which was too early as FTargetAnimals was not assiged yet.
   if ( FTargetAnimals = taAIBulls ) then
      fmDuplicateAnimals.AnimalGridTableView.PopupMenu := fmDuplicateAnimals.PopupMenu1;
end;

procedure TfmDuplicateAnimals.FormCreate(Sender: TObject);
begin
   FNoneHerdId := WinData.NONEHerdID;
end;

end.
