unit uUK9RetagReconcile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TUK9NatReconcileRecord = record
  ID : Integer; NatID : string;
  end;
  TfmUK9RetagReconcile = class(TForm)
    gbSelectNatID: TcxGroupBox;
    cmboTagList: TcxComboBox;
    cxLabel1: TcxLabel;
    btnUpdateDatabase: TcxButton;
    btnIgnore: TcxButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Execute(AUK9NatReconcileRecord : TUK9NatReconcileRecord; ATagList : TStrings);
  end;

var
  fmUK9RetagReconcile: TfmUK9RetagReconcile;

implementation

{$R *.DFM}

class procedure TfmUK9RetagReconcile.Execute(AUK9NatReconcileRecord : TUK9NatReconcileRecord; ATagList : TStrings);
begin
   with TfmUK9RetagReconcile.Create(nil) do
      try
         AUK9NatReconcileRecord.ID := 0;
         AUK9NatReconcileRecord.NatID := '';

         cmboTagList.Clear;
         cmboTagList.Properties.Items.Assign(ATagList);
         if ShowModal = mrOK then
            begin
               AUK9NatReconcileRecord.ID := Integer(cmboTagList.ItemObject);
               AUK9NatReconcileRecord.NatID := cmboTagList.Text;
            end;
      finally
         Free;
      end;
end;

procedure TfmUK9RetagReconcile.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOK then
      begin
         if cmboTagList.ItemIndex <= -1 then
            CanClose := False;
      end;
end;

end.
