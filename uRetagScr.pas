unit uRetagScr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, RXCtrls, ComCtrls, ToolWin, Mask, DBCtrlsEh;

type
  TTagOption = (Retag, TempTag);
  TfRetagScr = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    qRetag: TQuery;
    Label3: TLabel;
    Label4: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    AnimalNo: TDBEditEh;
    NewTag: TDBEditEh;
    OldTag: TDBEditEh;
    Label2: TLabel;
    Remark: TDBEditEh;
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TagOptions : TTagOption;
  public
    { Public declarations }
  end;

   procedure ShowTheForm(TagOption : TTagOption);

var
  fRetagScr: TfRetagScr;

const
  cTempTagRemark     = 10;
  cNewTagRemark      = 11;

implementation
uses DairyData;

{$R *.DFM}

procedure ShowTheForm(TagOption : TTagOption);
begin
   try
      try
         Application.CreateForm(TfRetagScr, fRetagScr);
         fRetagScr.TagOptions := TagOption;
         if TagOption = Retag then
            fRetagScr.Caption := 'Re-tagging'
         else
            fRetagScr.Caption := 'Temporary Tag';
         fRetagScr.ShowModal;
      except
         ShowMessage('Cannot create form - close program and re-boot');
      end;
   finally
      fRetagScr.qRetag.Close;
   end;
end;

procedure TfRetagScr.FormShow(Sender: TObject);
begin
   qRetag.Close;
   qRetag.ParamByName('ID').AsInteger := WinData.AnimalFileByIDID.AsInteger;
   if TagOptions = Retag then
      qRetag.ParamByName('Item').AsInteger := cNewTagRemark
   else
      qRetag.ParamByName('Item').AsInteger := cTempTagRemark;
   qRetag.Open;
   AnimalNo.Text := WinData.AnimalFileByIDAnimalNo.AsString;
   NewTag.Text := WinData.AnimalFileByIDNatIDNum.AsString;
   OldTag.Text := qRetag.FieldByName('OldItem').AsString;
   Remark.Text := qRetag.FieldByName('Remark').AsString;
   if TagOptions = TempTag then
      begin
         Label3.Caption := 'Existing Tag:';
         Label4.Caption := 'Temporary Tag:';
      end;
end;

procedure TfRetagScr.RxSpeedButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TfRetagScr.FormCreate(Sender: TObject);
begin
   AnimalNo.Text := '';
   NewTag.Text := '';
   OldTag.Text := '';
   Remark.Text := '';
end;

end.
