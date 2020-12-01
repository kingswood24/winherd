unit uAimAnimalMovementSummary;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uAIMAnimalMovements, ExtCtrls, cxLabel, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxGroupBox, cxTextEdit, cxMemo, cxListBox;

type
  TfmAimAnimalMovementSummary = class(TForm)
    btnClose: TcxButton;
    Bevel1: TBevel;
    ListBox: TcxListBox;
    Memo: TcxMemo;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    procedure ListBoxClick(Sender: TObject);
  private
    { Private declarations }
     procedure LoadSummary();
  public
    { Public declarations }
    class procedure OutputMovementSummary(AList : TList);
  end;

var
  fmAimAnimalMovementSummary: TfmAimAnimalMovementSummary;

implementation

{$R *.DFM}

{ TfmAimAnimalMovementSummary }

class procedure TfmAimAnimalMovementSummary.OutputMovementSummary(
  AList : TList);
var
   i : Integer;
   Summary : TMovementSummary;
begin
   if (AList = nil) or (AList.Count <= 0) then
      raise Exception.Create('Invalid argument');

   with TfmAimAnimalMovementSummary.Create(nil) do
      try
         for i := 0 to AList.Count-1 do
            begin
               Summary := TMovementSummary(AList[i]);
               if (Summary.MovementType = mtOn) then
                  ListBox.AddItem('AIM Movements On', Summary)
               else
                  ListBox.AddItem('AIM Movements Off', Summary);
            end;
         ListBox.ItemIndex := 0;
         LoadSummary();
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAimAnimalMovementSummary.LoadSummary;
var
   i : Integer;
   Summary : TMovementSummary;
begin
   Memo.Clear;
   if (ListBox.ItemIndex = -1) or (ListBox.ItemObject = nil) then Exit;

   Summary := TMovementSummary(ListBox.ItemObject);
   if (Summary = nil) then
       begin
          MessageDlg('Unable to load summary',mtError,[mbOK],0);
          Exit;
       end;

   Memo.Lines.Add('*** Import Details ***');
   Memo.Lines.Add('');

   Memo.Lines.Add(Format('Movements on file: %d',[Summary.NoOfMovementsToProcess]));
   Memo.Lines.Add(Format('Movements successfully imported: %d',[Summary.NoOfMovementsSucceeded]));
   Memo.Lines.Add(Format('Movements in error: %d',[Summary.NoOfMovementsToProcess - Summary.NoOfMovementsSucceeded]));

   if (Summary.MovementsCreated.Count>0) then
      begin
         Memo.Lines.Add('');
         Memo.Lines.Add('');
         Memo.Lines.Add('*** Movements successfully imported for the following tag numbers ***');
         for i := 0 to Summary.MovementsCreated.Count-1 do
            Memo.Lines.Add('> '+Summary.MovementsCreated[i]);
      end;

   if (Summary.MovementsInError.Count>0) then
      begin
         Memo.Lines.Add('');
         Memo.Lines.Add('');
         Memo.Lines.Add('*** Import Errors ***');
         for i := 0 to Summary.MovementsInError.Count-1 do
            Memo.Lines.Add('> '+Summary.MovementsInError[i]);
      end;
end;

{
procedure TfmGettingStarted.LabelMouseMove(Sender: TObject);
var
   i : Integer;
   ControlParent : TWinControl;
   MyGroupBox : TcxGroupBox;
   MyLabel : TcxLabel;
begin
   if not (Sender is TcxLabel) then exit;
   ControlParent := (Sender as TcxLabel).Parent;

   if (ControlParent is TcxGroupBox) then
      begin
         GroupBox := (ControlParent as TcxGroupBox);
         for i := 0 to GroupBox.ControlCount-1 do
            begin
               if (GroupBox.Controls[i] is TcxLabel) then
                  begin
                     MyLabel := (GroupBox.Controls[i] as TcxLabel);

                     if (MyLabel.Tag <> 1) then continue;
                     if (MyLabel = Sender) then
                        begin
                           MyLabel.Style.Font.Color := clRed;
                           MyLabel.Style.Font.Style := [fsUnderline];
                        end
                     else
                        begin
                           MyLabel.Style.Font.Color := clblue;
                           MyLabel.Style.Font.Style := [fsUnderLine];
                        end;
                  end;
            end;
      end;
end;
 }


procedure TfmAimAnimalMovementSummary.ListBoxClick(Sender: TObject);
begin
   LoadSummary();
end;


end.
