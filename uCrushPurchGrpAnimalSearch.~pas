{
   04/10/11 [V5.0 R1.0] /MK Additional Feature - New Unit Used If Crush System In uBBPPurchScr

   25/10/11 [V5.0 R2.2] /MK Change - Find on teSearchAnimalTagKeyDown Is Enter. 
}

unit uCrushPurchGrpAnimalSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxContainer, cxEdit, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, Db, DBTables, StdCtrls,
  cxButtons;

type
  TfmCrushGrpPurchAnimalSearch = class(TForm)
    pCrushPurchGrpAnimalSearch: TPanel;
    AnimalGrid: TcxGrid;
    AnimalTableView: TcxGridDBTableView;
    AnimalTableViewID: TcxGridDBColumn;
    AnimalTableViewNatIdNum: TcxGridDBColumn;
    AnimalTableViewDateOfBirth: TcxGridDBColumn;
    AnimalTableViewSex: TcxGridDBColumn;
    AnimalTableViewCode: TcxGridDBColumn;
    AnimalTableViewAnimalNo: TcxGridDBColumn;
    AnimalGridLevel: TcxGridLevel;
    cxLabel10: TcxLabel;
    btnFind: TcxButton;
    btnClear: TcxButton;
    btnSelect: TcxButton;
    QueryAnimals: TQuery;
    dsQueryAnimals: TDataSource;
    cxButton1: TcxButton;
    teSearchAnimalTag: TcxTextEdit;
    procedure btnFindClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnFindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSelectClick(Sender: TObject);
    procedure teSearchAnimalTagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    FAnimalID : Integer;
    SearchTag : String;
    procedure SearchForAnimal;
    procedure ShowTheForm;
    function GetAnimalId : Integer;
    { Public declarations }
  end;

var
  fmCrushGrpPurchAnimalSearch: TfmCrushGrpPurchAnimalSearch;

implementation

{$R *.DFM}

procedure TfmCrushGrpPurchAnimalSearch.btnFindClick(Sender: TObject);
begin
   SearchForAnimal;
end;

procedure TfmCrushGrpPurchAnimalSearch.btnClearClick(Sender: TObject);
begin
   QueryAnimals.Active := False;
   teSearchAnimalTag.Text := '';
   try
      teSearchAnimalTag.SetFocus;
   except
   end;
end;

procedure TfmCrushGrpPurchAnimalSearch.btnFindKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then
       btnFind.Click;
end;

procedure TfmCrushGrpPurchAnimalSearch.SearchForAnimal;
begin
   if Trim(teSearchAnimalTag.Text) = '' then
      begin
         ShowMessage('No search criteria has been entered!');
         Exit;
      end;

   QueryAnimals.Active := False;
   QueryAnimals.Params[0].AsString := '%'+ teSearchAnimalTag.Text +'%';
   QueryAnimals.Active := True;
end;

function TfmCrushGrpPurchAnimalSearch.GetAnimalId : Integer;
begin
   ShowModal;
   Result := FAnimalID;
end;

procedure TfmCrushGrpPurchAnimalSearch.FormShow(Sender: TObject);
begin
   teSearchAnimalTag.SetFocus;
end;

procedure TfmCrushGrpPurchAnimalSearch.ShowTheForm;
begin
   ShowModal;
end;

procedure TfmCrushGrpPurchAnimalSearch.cxButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TfmCrushGrpPurchAnimalSearch.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   FAnimalID := 0;
   if (ModalResult = mrOK) then
      begin
         if QueryAnimals.FieldByName('ID').AsInteger > 0 then
            FAnimalID := QueryAnimals.FieldByName('ID').AsInteger
         else
            MessageDlg('No animal is selected',mtError,[mbOK],0);
      end
end;

procedure TfmCrushGrpPurchAnimalSearch.btnSelectClick(Sender: TObject);
begin
   if not(QueryAnimals.Active) then
      begin
         MessageDlg('No animal has been found',mtError,[mbOK],0);
         Exit;
      end;
end;

procedure TfmCrushGrpPurchAnimalSearch.teSearchAnimalTagKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then
       btnFind.Click;
end;

end.
