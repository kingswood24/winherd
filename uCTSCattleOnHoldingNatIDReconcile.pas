unit uCTSCattleOnHoldingNatIDReconcile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, dxmdaset, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dbtables, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, StdCtrls,
  cxButtons, cxLabel, ActnList;

type
  TfmCTSCattleOnHoldingNatIDReconcile = class(TForm)
    NatIdGridDBTableView: TcxGridDBTableView;
    NatIdGridLevel: TcxGridLevel;
    NatIdGrid: TcxGrid;
    mdNatIdInfo: TdxMemData;
    mdNatIdInfoID: TIntegerField;
    mdNatIdInfoNatIDNum: TStringField;
    mdNatIdInfoMatchNatIDNum: TStringField;
    mdNatIdInfoSex: TStringField;
    mdNatIdInfoDateOfBirth: TDateTimeField;
    dsmdNatIdInfo: TDataSource;
    NatIdGridDBTableViewRecId: TcxGridDBColumn;
    NatIdGridDBTableViewID: TcxGridDBColumn;
    NatIdGridDBTableViewNatIDNum: TcxGridDBColumn;
    NatIdGridDBTableViewMatchNatIDNum: TcxGridDBColumn;
    NatIdGridDBTableViewSex: TcxGridDBColumn;
    NatIdGridDBTableViewDateOfBirth: TcxGridDBColumn;
    rgDisplayMode: TcxRadioGroup;
    btnSelect: TcxButton;
    btnCancel: TcxButton;
    cxLabel1: TcxLabel;
    ActionList1: TActionList;
    actSelect: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure rgDisplayModeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSelectExecute(Sender: TObject);
    procedure actSelectUpdate(Sender: TObject);
  private
    { Private declarations }
    FResult : Boolean;
    FNatIDNum : string;
    FMatchNatIDNum : string;
    FHerdID : Integer;
    procedure AddFilter(Field, value : Variant);
    procedure ClearFilter;
  public
    { Public declarations }
    class function GetNatIDMatch(ANatIDNum : String; AHerdID : Integer) : Boolean;
  end;

var
  fmCTSCattleOnHoldingNatIDReconcile: TfmCTSCattleOnHoldingNatIDReconcile;

implementation

uses KRoutines, GenTypesConst;

{$R *.DFM}

procedure TfmCTSCattleOnHoldingNatIDReconcile.AddFilter(Field,
  value: Variant);
begin
   ClearFilter;
  with mdNatIdInfo do
  begin
    ProgrammedFilter := True;
    First;
    FilterList.Clear;
    while not Eof do
    begin
      if Pos(value,FieldByName(Field).value) >0 then
        FilterList.Add(Pointer(mdNatIdInfo.CurRec + 1));
      Next;
    end;
    Filtered := True;
  end;
end;

procedure TfmCTSCattleOnHoldingNatIDReconcile.ClearFilter;
begin
  with mdNatIdInfo do
  begin
    ProgrammedFilter := False;
    FilterList.Clear;
    Filtered := False;
  end;
end;

class function TfmCTSCattleOnHoldingNatIDReconcile.GetNatIDMatch(ANatIDNum : String;
  AHerdID : Integer) : Boolean;
begin

   with  TfmCTSCattleOnHoldingNatIDReconcile.Create(nil) do
      try
         FResult := False;
         FHerdID := AHerdID;
         FNatIDNum := ANatIDNum;

         FMatchNatIDNum := StripSpaces(FNatIDNum);
         NatIdGridDBTableView.DataController.BeginFullUpdate;
         try
            mdNatIdInfo.Active := True;


            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Add('SELECT ID, NatIDNum, Sex, DateOfBirth FROM Animals');
                  SQL.Add('WHERE InHerd=True AND AnimalDeleted=False AND HerdID=:HerdID');
                  Params[0].AsInteger := FHerdID;
                  Open;
                  First;
                  while not eof do
                     begin
                        mdNatIdInfo.Append;
                        mdNatIdInfoID.Value := FieldByName('ID').Value;
                        mdNatIdInfoNatIDNum.Value := FieldByName('NatIDNum').Value;
                        mdNatIdInfoMatchNatIDNum.Value := StripAllSpaces(FieldByName('NatIDNum').Value);
                        mdNatIdInfoSex.Value := FieldByName('Sex').Value;
                        mdNatIdInfoDateOfBirth.Value := FieldByName('DateOfBirth').Value;
                        mdNatIdInfo.Post;
                        Next;
                     end;
               finally
                  Close;
               end;

            // copy last 7 digits of tag, use a matching string
            FMatchNatIDNum := Copy(FNatIDNum, Length( FNatIDNum) -6, Maxint);

            AddFilter('MatchNatIDNum',FMatchNatIDNum);
         finally
            NatIdGridDBTableView.DataController.EndFullUpdate;
         end;
         ShowModal;
      finally
         Result := FResult;
         Free;
      end;
end;

procedure TfmCTSCattleOnHoldingNatIDReconcile.FormDestroy(Sender: TObject);
begin
   mdNatIdInfo.Active := False;
end;

procedure TfmCTSCattleOnHoldingNatIDReconcile.rgDisplayModeClick(
  Sender: TObject);
begin
   ClearFilter;
end;

procedure TfmCTSCattleOnHoldingNatIDReconcile.FormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
var
   SortNatID : string;
begin
   if ModalResult = mrOK then
      begin
         if mdNatIdInfoID.AsInteger > 0 then
            begin

               if MessageDlg('Do you want to replace the tag number found in the Herd database '+cCRLF+
                             'with the tag number found on CTS Cattle On Holding data?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                  begin
                     with TQuery.Create(nil) do
                        try
                           DatabaseName := AliasName;
                           SQL.Clear;
                           SQL.Add('UPDATE Animals SET NatIDNum=:NatIDNum, SortNatID=:SortNatID WHERE ID=:ID');
                           Params[0].AsString := FNatIDNum;
                           Params[1].AsString := PadLeft(StripAllSpaces(FNatIDNum),'0',20);
                           Params[2].AsInteger := mdNatIdInfoID.AsInteger;
                           ExecSQL;
                           FResult := True;
                        finally
                           Free;
                        end;
                  end
               else
                  CanClose := False;
            end;
      end;
end;

procedure TfmCTSCattleOnHoldingNatIDReconcile.actSelectExecute(
  Sender: TObject);
begin
   ModalResult := mrOK;
end;

procedure TfmCTSCattleOnHoldingNatIDReconcile.actSelectUpdate(
  Sender: TObject);
begin
   actSelect.Enabled := (mdNatIdInfoID.AsInteger > 0);
end;

end.
