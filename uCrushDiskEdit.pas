unit uCrushDiskEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, StdCtrls, DBCtrls, Mask, ExtCtrls, db, ToolEdit, RXDBCtrl,
  RxLookup, uCrushHelper;

type
  TfmCrushDiskEdit = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    cb: TDBCheckBox;
    Label1: TLabel;
    DBDateEdit1: TDBDateEdit;
    Pen: TRxDBLookupCombo;
    Label2: TLabel;
    sbsave: TRxSpeedButton;
    sbcancel: TRxSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbsaveClick(Sender: TObject);
    procedure sbcancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource : TDataSource;
    FRecordModified : Boolean;
  public
    { Public declarations }
     procedure ShowTheForm(cft : TCrushFileType; const ds : TDataSource; iFields : array of String; var RecordModified : Boolean);
  end;


var
  fmCrushDiskEdit: TfmCrushDiskEdit;

implementation
uses
    DairyData, GenTypesConst;

{$R *.DFM}


procedure TfmCrushDiskEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   FDataSource.Free;
   Action := caFree;
end;

procedure TfmCrushDiskEdit.ShowTheForm(cft : TCrushFileType; const ds : TDataSource; iFields : array of String; var RecordModified : Boolean);
begin
   FDataSource := TDataSource.Create(nil);
   FDataSource := ds;

   DBEdit3.DataField := iFields[0];
   DBEdit4.DataField := iFields[1];
   DBEdit5.DataField := iFields[2];
   DBDateEdit1.DataField := iFields[3];
   Pen.DataField := iFields[4];

   DBEdit3.DataSource := FDataSource;
   DBEdit4.DataSource := FDataSource;
   DBEdit5.DataSource := FDataSource;
   DBDateEdit1.DataSource := FDataSource;
   Pen.DataSource := FDataSource;
   if cft = cftpurchase then
      begin
         Caption := 'Crush Disk - Purchase Edit';
         cb.DataSource := FDataSource;
         cb.DataField := 'Hascard';
      end
   else
      begin
         Caption := 'Crush Disk - Weighing Edit';
         cb.Visible := False;
      end;
   ShowModal;
   RecordModified := FRecordModified;
end;

procedure TfmCrushDiskEdit.sbsaveClick(Sender: TObject);
begin
   if FDataSource.DataSet.State in dsEditmodes then
      begin
         FDataSource.DataSet.Post;
         FRecordModified := True;
      end;
end;

procedure TfmCrushDiskEdit.sbcancelClick(Sender: TObject);
begin
   if FDataSource.DataSet.State in dsEditmodes then
      FDataSource.DataSet.Cancel;
end;

procedure TfmCrushDiskEdit.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(WinData.Images,sbsave.Glyph,cBtnImgSave);
   WinData.LoadBtnImage(WinData.Images,sbCancel.Glyph,cBtnImgcancel);
end;

end.
