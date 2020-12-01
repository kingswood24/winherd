{ Unit Created : 15/12/2008 V3.8 R 5.5 /SP }

unit uICBFEmailReview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer,
  cxEdit, cxGroupBox, Db, dxmdaset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMemo, cxPC, StdCtrls, cxButtons, ExtCtrls;

type
  TICBFFileRecord = class
    filedate : TDateTime;
    filename : string;
    constructor create(AFileName : string; AFileDate : TDateTime); 
  end;

  TfmICBFEmailReview = class(TForm)
    gbRegistrationDateReview: TcxGroupBox;
    cmboICBFFiles: TcxComboBox;
    cxLabel1: TcxLabel;
    gbRegistrationDetails: TcxGroupBox;
    pcEventData: TcxPageControl;
    tsEvents: TcxTabSheet;
    tsSFile: TcxTabSheet;
    mSFile: TcxMemo;
    GridEventDataDBTableView: TcxGridDBTableView;
    GridEventDataLevel: TcxGridLevel;
    GridEventData: TcxGrid;
    dsmdSFile: TDataSource;
    mdSFile: TdxMemData;
    mdSFileID: TAutoIncField;
    mdSFileEventDate: TDateTimeField;
    mdSFileNatIdNo: TStringField;
    mdSFileSortNatIDNo: TStringField;
    mdSFileEventType: TStringField;
    GridEventDataDBTableViewNatIdNo: TcxGridDBColumn;
    GridEventDataDBTableViewSortNatIDNo: TcxGridDBColumn;
    GridEventDataDBTableViewEventDate: TcxGridDBColumn;
    GridEventDataDBTableViewEventType: TcxGridDBColumn;
    lFileName: TcxLabel;
    mdSFileEventDesc: TStringField;
    GridEventDataDBTableViewEventDesc: TcxGridDBColumn;
    Bevel1: TBevel;
    Panel1: TPanel;
    btnClose: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cmboICBFFilesPropertiesEditValueChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GridEventDataDBTableViewSortNatIDNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FHerdID : Integer;
    ICBFFileRecord : TICBFFileRecord;
    procedure LoadFileNames;
    procedure LoadFile;
    procedure BuildGridFromFile(AFileName : string);
  public
    { Public declarations }
    class procedure Execute(AHerdID : Integer);

  end;

var
  fmICBFEmailReview: TfmICBFEmailReview;

implementation
uses
   kRoutines, uICBFEventExport, DairyData;

{$R *.DFM}

{ TForm1 }

class procedure TfmICBFEmailReview.Execute(AHerdID : Integer);
begin

   with TfmICBFEmailReview.Create(nil) do
      try
         FHerdID := AHerdID;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmICBFEmailReview.LoadFileNames;
var
   ICBFSFileList : TStringList;
   ICBFDir : string;
   i : Integer;
   FileName : string;
   FileDate : string;
begin
   cmboICBFFiles.Clear;
   ICBFDir := ApplicationPath + 'ICBF Events Files';
   ICBFSFileList := TStringList.Create;
   try
      GetDirectoryFiles( ICBFDir, ICBFSFileList, '*.ERS');

      // load the combo list with S files found.

      for i := 0 to ICBFSFileList.Count-1 do
         begin
            FileName := ExtractFileName(ICBFSFileList.Strings[i]);
            if (FileName <> '') and (FileName[1] = 'S') then
               begin
                  FileDate := Copy(FileName, Length(FileName)-11,8);
                  Insert('/', FileDate, 3);
                  Insert('/', FileDate, 6);
                  cmboICBFFiles.Properties.Items.AddObject(FileDate, TICBFFileRecord.create(ICBFSFileList.Strings[i],StrToDate(FileDate)));
               end;
         end;
   finally
      FreeAndNil(ICBFSFileList);
   end;
end;

procedure TfmICBFEmailReview.FormShow(Sender: TObject);
begin
    LoadFileNames;
end;

procedure TfmICBFEmailReview.cmboICBFFilesPropertiesEditValueChanged(
  Sender: TObject);
begin
   LoadFile;
end;

procedure TfmICBFEmailReview.LoadFile;
var
   FileName : string;
begin
   lFileName.Caption := '';
   if cmboICBFFiles.ItemIndex > -1 then
      begin
         ICBFFileRecord := TICBFFileRecord(cmboICBFFiles.ItemObject);
         if FileExists(ICBFFileRecord.FileName) then
            begin
               lFileName.Caption := 'Filename: ' +ExtractFileName(ICBFFileRecord.FileName);

               mSFile.Lines.LoadFromFile(ICBFFileRecord.FileName);
               BuildGridFromFile(ICBFFileRecord.FileName);
            end;
      end;
end;

{ TICBFRecord }

constructor TICBFFileRecord.create(AFileName: string; AFileDate: TDateTime);
begin
   filedate := AFileDate;
   filename := AFileName;
end;

procedure TfmICBFEmailReview.FormDestroy(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to cmboICBFFiles.Properties.Items.Count-1 do
      begin
         if cmboICBFFiles.Properties.Items.Objects[i] <> nil then
            TICBFFileRecord(cmboICBFFiles.Properties.Items.Objects[i]).Free;
      end;
end;

procedure TfmICBFEmailReview.BuildGridFromFile(AFileName : string);
var
  i : Integer;
  HealthCode : string;
  NatIdNo : string;
  EventDate : string;
  WeaningScore : Integer;
  TableWasActive : Boolean;
begin


   TableWasActive := WinData.WeaningScores.Active;
   if not TableWasActive then
      WinData.WeaningScores.Active := True;


   mdSFile.Active := False;
   mdSFile.Active := True;
   mdSFile.DisableControls;
   mSFile.Lines.BeginUpdate;
   try
      for i := 0 to mSFile.Lines.Count-1 do
         begin
            HealthCode := Copy(mSFile.Lines[i],53,2);
            if IsSucklerWelfareEvent( HealthCode ) then
               begin

                  EventDate := Copy(mSFile.Lines[i],1,8);
                  Insert('/', EventDate, 3);
                  Insert('/', EventDate, 6);

                  NatIdNo :=  Copy(mSFile.Lines[i],23,14);

                  mdSFile.Append;
                  mdSFileEventDate.AsDateTime := StrToDate(EventDate);
                  CheckNatID(NatIdNo,NatIdNo,True);// get formatted tagno returned.
                  mdSFileNatIdNo.AsString := NatIdNo;
                  mdSFileSortNatIDNo.AsString := CreateSortNatIDString(NatIdNo,0);
                  mdSFileEventType.AsString := HealthCode;

                  if HealthCode = 'DB' then
                     mdSFileEventDesc.AsString := 'Disbudding Event'
                  else if HealthCode = 'ND' then
                     mdSFileEventDesc.AsString := 'Non-Disbudding Event'
                  else if HealthCode = 'ML' then
                     mdSFileEventDesc.AsString := 'Meal Feeding Event'
                  else if HealthCode = 'WN' then
                     mdSFileEventDesc.AsString := 'Weaning Event'
                  else if HealthCode = 'CA' then
                     mdSFileEventDesc.AsString := 'Castration Event'
                  else if HealthCode = 'NC' then
                     mdSFileEventDesc.AsString := 'Non-Castration Event'
                  else if HealthCode[1] = 'D' then
                     begin
                        WeaningScore := StrToInt(HealthCode[2]);
                        if WinData.WeaningScores.Locate('Score;ListType',VarArrayOf([WeaningScore,1]),[]) then
                           mdSFileEventDesc.AsString := 'Weaning Docility - '+ WinData.WeaningScoresDescription.AsString;
                     end
                  else if HealthCode[1] = 'Q' then
                     begin
                        WeaningScore := StrToInt(HealthCode[2]);
                        if WinData.WeaningScores.Locate('Score;ListType',VarArrayOf([WeaningScore,2]),[]) then
                           mdSFileEventDesc.AsString := 'Weaning Quality - '+ WinData.WeaningScoresDescription.AsString;
                     end;
                  mdSFile.Post;
               end;
         end;
   finally
      mSFile.Lines.EndUpdate;
      mdSFile.EnableControls;
      if not TableWasActive then
         WinData.WeaningScores.Active := False;
      GridEventDataDBTableView.Controller.FocusedRowIndex := 0;
   end;
end;

procedure TfmICBFEmailReview.GridEventDataDBTableViewSortNatIDNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   AText := VarToStr(ARecord.Values[GridEventDataDBTableViewNatIdNo.Index]);
end;

procedure TfmICBFEmailReview.FormCreate(Sender: TObject);
begin
   lFileName.Caption := '';
end;

procedure TfmICBFEmailReview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   mdSFile.Active := False;
end;

end.
