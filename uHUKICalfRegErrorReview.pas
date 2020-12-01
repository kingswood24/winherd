unit uHUKICalfRegErrorReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, StdCtrls, cxButtons,
  ExtCtrls, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Db,
  dxmdaset, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfmHUKICalfRegErrorReview = class(TForm)
    cxButton1: TcxButton;
    ListBox1: TListBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    mdHUKIErrors: TdxMemData;
    mdHUKIErrorsErrorMessage: TStringField;
    dsmdHUKIErrors: TDataSource;
    mdHUKIErrorsErrorCode: TIntegerField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1ErrorCode: TcxGridDBColumn;
    cxGrid1DBTableView1ErrorMessage: TcxGridDBColumn;
    lAnimalNo: TLabel;
    lTagNo: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FDamID, FSireID : Integer;
  public
    { Public declarations }
    procedure AddAnimalID(AnimalNo, AnimalTag : String; ADamID, ASireID : Integer);
    procedure AddError(Code : Integer; ErrorMessage : String);
  end;

var
  fmHUKICalfRegErrorReview: TfmHUKICalfRegErrorReview;

implementation

uses uHUKISireDamListing;

{$R *.DFM}

procedure TfmHUKICalfRegErrorReview.AddError(Code : Integer; ErrorMessage : String);
begin
   mdHUKIErrors.Append;
   mdHUKIErrorsErrorCode.AsInteger := Code;
   mdHUKIErrorsErrorMessage.AsString := ErrorMessage;
   mdHUKIErrors.Post;
end;

procedure TfmHUKICalfRegErrorReview.FormCreate(Sender: TObject);
begin
   mdHUKIErrors.Close;
   mdHUKIErrors.Open;
end;

procedure TfmHUKICalfRegErrorReview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfmHUKICalfRegErrorReview.AddAnimalID(AnimalNo,
   AnimalTag : String; ADamID, ASireID : Integer);
begin
   lAnimalNo.Caption := AnimalNo;
   lTagNo.Caption := AnimalTag;
   FDamID := ADamID;
   FSireID := ASireID;
end;

procedure TfmHUKICalfRegErrorReview.Button1Click(Sender: TObject);
begin
   TfmHUKISireDamListing.ShowAsSireListing(FSireID);
end;

procedure TfmHUKICalfRegErrorReview.Button2Click(Sender: TObject);
begin
   TfmHUKISireDamListing.ShowAsDamListing(FDamID);
end;

end.
