unit uPhoneLinkDownload;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Grids, DBGridEh, db, dbTables, SMSComp;

type
  TBreedingRecord = record
     AnimalID : Integer;
     AnimalNo : string[20];
     AnimalLact : byte;
     WithDrawal_Meat,
     WithDrawal_Milk,
     WithDrawal_Other,
     LastCalving,
     LastBulling,
     LastService,
     LastDryOff : TDateTime;
     DaysInMilk : Word;
  end;

  TfmPhoneLinkDownload = class(TForm)
    StatusBar: TStatusBar;
    AnimalGrid: TDBGridEh;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ProgressBar: TProgressBar;
    eNatIDSearch: TEdit;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    OxygenSMS1: TOxygenSMS;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure AnimalGridDblClick(Sender: TObject);
    procedure eNatIDSearchChange(Sender: TObject);
  private
    { Private declarations }
    ThisTable : TTable;
    ThisDataSource : TDataSource;
    ThisQuery : TQuery;
    ThisHerdID : Integer;
    procedure CreateTempTable;
    procedure DeleteTempTable;
    procedure InsertAnimals;
    procedure UpdateStatusBar(const StatusText : string);
    function GetBreedingInfo(const AID : Integer) : TBreedingRecord;
  public
    { Public declarations }
  end;

  procedure ShowTheForm(AHerdID : Integer);

var
  fmPhoneLinkDownload: TfmPhoneLinkDownload;

implementation
uses
   DairyData, GenTypesConst;

{$R *.DFM}

  procedure ShowTheForm(AHerdID : Integer);
  begin

     if AHerdID <= 0 then
        raise Exception.Create('You must select a herd before continuing');

     Application.CreateForm(TfmPhoneLinkDownload, fmPhoneLinkDownload);
     try
        fmPhoneLinkDownload.ThisHerdID := AHerdID;
        fmPhoneLinkDownload.ShowModal;
     finally
        FreeAndNil(fmPhoneLinkDownload);
     end;
  end;

{ TfmPhoneLinkDownload }

procedure TfmPhoneLinkDownload.UpdateStatusBar(const StatusText: string);
begin
   StatusBar.SimpleText := StatusText;
   StatusBar.Update;
end;

procedure TfmPhoneLinkDownload.FormCreate(Sender: TObject);
begin
   ThisTable := TTable.Create(nil);
   ThisTable.DatabaseName := AliasName;
   ThisDataSource := TDataSource.Create(nil);
   AnimalGrid.DataSource := ThisDataSource;
   ThisQuery := TQuery.Create(nil);
   ThisQuery.DatabaseName := AliasName;
   ProgressBar.Hide;
   CreateTempTable;
end;

procedure TfmPhoneLinkDownload.CreateTempTable;
begin
   Screen.Cursor := crHourGlass;
   try
      ThisDataSource.DataSet := nil;
      DeleteTempTable; // Delete if already exists.
      with ThisTable do
         begin
            TableType := ttParadox;
            TableName := 'plinkIDs';

            with FieldDefs do
               begin
                  Clear;
                  Add('ID', ftAutoInc);
                  Add('AID', ftInteger);
                  Add('NatIDNum', ftString, 20);
                  Add('SearchNatIDNum', ftString, 20);
                  Add('Selected', ftBoolean);
               end;

            with IndexDefs do
               begin
                  Clear;
                  Add('iID', 'ID', [ixPrimary]);
                  Add('iAID', 'AID', [ixUnique]);
                  Add('iNatIDNum', 'NatIDNum', [ixCaseInsensitive]);
                  Add('idNatIDNum', 'NatIDNum', [ixDescending]);
               end;
            CreateTable;
            Open;
            TBooleanField( ThisTable.FieldByName('Selected')).DisplayValues :='ü;';
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmPhoneLinkDownload.FormDestroy(Sender: TObject);
begin
   DeleteTempTable;
   if ThisQuery <> nil then
      FreeAndNil(ThisQuery);
   if ThisTable <> nil then
      FreeAndNil(ThisTable);
   if ThisDataSource <> nil then
      FreeAndNil(ThisDataSource);
end;

procedure TfmPhoneLinkDownload.DeleteTempTable;
begin
   if ThisTable.Exists then
      begin
         ThisTable.Close;
         ThisTable.DeleteTable;
      end;
end;

procedure TfmPhoneLinkDownload.InsertAnimals;
begin
  UpdateStatusBar('Loading animals...');
   with ThisQuery do
      begin
         try
            SQL.Clear;
            SQL.Add('INSERT INTO ' + ThisTable.TableName + ' (AID, NATIDNUM, SELECTED)');
            SQL.Add('SELECT DISTINCT(A.ID), A.NATIDNUM, FALSE');
            SQL.Add('FROM ANIMALS A');
            SQL.Add('WHERE (UPPER(A.SEX)="FEMALE")');
            SQL.Add('AND (A.INHERD=TRUE)');
            SQL.Add('AND (A.HERDID=:AHERDID)');
            SQL.Add('AND (A.ANIMALDELETED=FALSE)');
            ParamByName('AHERDID').AsInteger := ThisHerdID;
            ExecSQL;

            ThisTable.DisableControls;
            try
               ThisTable.First;
               while not ThisTable.Eof do
                  begin
                     if Length(Trim(ThisTable.FieldByName('NatIDNum').AsString)) > 0 then
                        begin
                           ThisTable.Edit;
                           ThisTable.FieldByName('SearchNatIDNum').AsString := WinData.StripAllNomNumAlpha(ThisTable.FieldByName('NatIDNum').AsString);
                           ThisTable.Post;
                        end;
                     ThisTable.Next;
                  end;
            finally
               ThisTable.EnableControls;
            end;

         finally
            ThisDataSource.DataSet := ThisTable;
            ThisTable.Refresh;
            ThisTable.First;
            UpdateStatusBar('');
         end;
      end;
end;

procedure TfmPhoneLinkDownload.Button1Click(Sender: TObject);
begin
   ProgressBar.Position := 0;
   ProgressBar.Show;
   try

   finally
      ProgressBar.Hide;
      ProgressBar.Position := 0;
   end;
end;

procedure TfmPhoneLinkDownload.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure TfmPhoneLinkDownload.FormShow(Sender: TObject);
begin
   InsertAnimals;
end;

procedure TfmPhoneLinkDownload.Button4Click(Sender: TObject);
{   with ThisQuery do
      begin
         try
            SQL.Clear;
            SQL.Add('UPDATE '+ ThisTable.TableName + ' SET SELECTED = FALSE');
            ExecSQL;
         finally
            ThisTable.Refresh;
            ThisTable.First;
         end;
      end;
}
var
   Buffer : String;
begin
//   FillChar(Result, SizeOf(Result), #0);
   if OxygenSMS1.Open then
      begin
         Buffer := eNatIDSearch.Text;
         OxygenSMS1.SendSMSMessage('',Buffer,0,False,False,nil);
         OxygenSMS1.SendSMSMessage('0023',Buffer,0,False,False,nil);
         OxygenSMS1.Close;
      end;

end;

procedure TfmPhoneLinkDownload.AnimalGridDblClick(Sender: TObject);
begin
   ThisTable.Edit;
   ThisTable.FieldByName('Selected').AsBoolean := not(ThisTable.FieldByName('Selected').AsBoolean);
   ThisTable.Post;
   ThisTable.Refresh;
end;

procedure TfmPhoneLinkDownload.eNatIDSearchChange(Sender: TObject);
var
   SearchStr : String;
begin
   SearchStr := Trim(eNatIDSearch.Text);
   if ( SearchStr <> '' ) then
      begin
         if not ThisTable.Locate('SearchNatIDNum', SearchStr, [loCaseInsensitive, loPartialKey]) then
            MessageDlg(Format('National Identity Number s% not found',[SearchStr]),mtInformation,[mbOK],0);
      end;
end;

function TfmPhoneLinkDownload.GetBreedingInfo(
  const AID: Integer): TBreedingRecord;

var
   Buffer : String;
begin
   FillChar(Result, SizeOf(Result), #0);
//   OxygenSMS1.SendSMSMessage('',Buffer,0,False,False,nil);


end;

end.
