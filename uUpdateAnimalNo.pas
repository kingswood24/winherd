unit uUpdateAnimalNo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, db, dbtables, ComCtrls, GenTypesConst, DairyData,
  KRoutines, uDataBackup;

type
  TUpdateAnimalNo = class(TForm)
    Label1: TLabel;
    lDigitFormatNote: TLabel;
    cbHerds: TComboBox;
    Button1: TButton;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    cmbFormatType: TComboBox;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cmbFormatTypeChange(Sender: TObject);
    procedure cbHerdsChange(Sender: TObject);
  private
    { Private declarations }
    HerdType : string;
    DatabaseUpdated : Boolean;
    FCountry : TCountry;
    FHerdID : Integer;
    function IsUKTag(const ANatIdNum : String) : Boolean;
  public
    { Public declarations }
    class function DoAnimalNoUpdate(const ACountry : TCountry) : Boolean;
  end;

var
  UpdateAnimalNo: TUpdateAnimalNo;

const
   AnimalNoFormatNote = 'Please note: update will only apply to plastic tags ( e.g  An animal with tag'+#10#13+
                        'number "%s 12 34567 8 9123" will have "%s" as its new animal number )';

implementation

{$R *.DFM}

class function TUpdateAnimalNo.DoAnimalNoUpdate(const ACountry : TCountry) : Boolean;
begin
   with  TUpdateAnimalNo.Create(nil) do
      try
         FCountry := ACountry;
         cmbFormatType.ItemIndex := -1;
         DatabaseUpdated := False;
         cbHerdsChange(cbHerds);
         ShowModal;
         Result := DatabaseUpdated;
      finally
         Free;
      end;
end;

procedure TUpdateAnimalNo.FormCreate(Sender: TObject);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT Distinct(ID), HerdIdentity');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE (UPPER(HerdIdentity) <> "NONE")');
         try
            Open;
            First;
            cbHerds.Items.BeginUpdate;
            while ( not(Eof) )do
               begin
                  cbHerds.Items.AddObject(UPPERCASE(Fields[1].AsString), pointer(Fields[0].AsInteger));
                  Next;
               end;
            cbHerds.Items.EndUpdate;
         finally
            Close;
         end;
      finally
         Free;
         if ( cbHerds.Items.Count > 0 ) then
            cbHerds.ItemIndex := 0;
      end;
end;

procedure TUpdateAnimalNo.Button1Click(Sender: TObject);
var
   OKToUpdate : Boolean;
   NoUpdated : Integer;
   AnimalNo : String;
   qAnimals : TQuery;

   function GenerateAnimalNo ( ANatIDNo : String ) : String;
   type
      AlphaType = set of 'A'..'Z';
   var
      Letters : AlphaType;
      MyAlpha : Char;
   begin
      Result := '';
      if ( Length(ANatIDNo) = 0 ) then Exit;
      if ( cmbFormatType.ItemIndex = 0 ) then
         Result := Copy(Trim(ANatIDNo),Length(ANatIDNo)-3, 4)
      else
         Result := StripAllSpaces(Copy(Trim(ANatIDNo),Length(ANatIDNo)-5, MaxInt));
      if ( Length(Result) > 0 ) and ( not(DuplicateAnimalNo(Result)) ) then Exit;
      for MyAlpha := 'A' to 'Z' do
         begin
            Result := Result+MyAlpha;
            if ( not(DuplicateAnimalNo(Result)) ) then
               Break;
         end;
   end;

   procedure UpdateAnimalNo ( AID : Integer; ANatIDNo : String );
   var
      sAnimalNo : String;
   begin
      if ( AID <=0 ) or ( Length(ANatIDNo) = 0 ) then Exit;
      sAnimalNo := GenerateAnimalNo(ANatIDNo);
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Animals');
            SQL.Add('SET AnimalNo = :AnimalNo,');
            SQL.Add('    SortAnimalNo = :SortAnimalNo');
            SQL.Add('WHERE ID = :AID');
            Params[0].AsString := sAnimalNo;
            Params[1].AsString := WinData.InsertZeros(StripAllSpaces(sAnimalNo),10);
            Params[2].AsInteger := AID;
            try
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   if ( MessageDlg('Before using this utility to update your data, a backup of your data'+cCRLF+
                   'is advised in case you want to reverse this update.'+cCRLFx2+
                   'Do you want to backup your data now?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
      TfmDataBackup.execute(daBackup);

   NoUpdated := 0;

   ProgressBar1.Visible := True;

   try
      qAnimals := TQuery.Create(nil);
      with qAnimals do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID, NatIDNum');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE (InHerd = True)');
            SQL.Add('AND   (AnimalDeleted = False)');
            SQL.Add('AND   (HerdID = '+IntToStr(FHerdID)+')');
            SQL.Add('AND   (AnimalNo IS NULL)'); 
            try
               Open;
               if ( RecordCount = 0 ) then
                  begin
                     MessageDlg('No animals to update.',mtError,[mbOK],0);
                     Exit;
                  end;
               First;
               while ( not(Eof) ) do
                  begin
                     if ( (WhatStyleNatID(Fields[1].AsString, False) in [StyleEID,Style1999]) or
                          (IsUKTag(Fields[1].AsString)) ) then
                        begin
                           UpdateAnimalNo(Fields[0].AsInteger,Fields[1].AsString);
                           Inc(NoUpdated);
                        end;
                     Next;
                     ProgressBar1.StepIt;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   finally
      ProgressBar1.Visible := False;
   end;

   DatabaseUpdated := ( NoUpdated > 0 );
   if ( DatabaseUpdated ) then
      MessageDlg(Format('Update Complete of animal numbers complete!'+cCRLF+
                        'Total Updated: %d',[NoUpdated]),mtInformation,[mbOk],0);
   Close;
end;

procedure TUpdateAnimalNo.cmbFormatTypeChange(Sender: TObject);
begin
   lDigitFormatNote.Caption := '';
   if ( FCountry = Ireland ) then
      begin
         if cmbFormatType.ItemIndex = 0 then
            lDigitFormatNote.Caption := Format(AnimalNoFormatNote,[Trim(GetTagPreFix(FHerdID)), '9123'])
         else
            lDigitFormatNote.Caption := Format(AnimalNoFormatNote,[Trim(GetTagPreFix(FHerdID)), '89123']);
      end;
end;

procedure TUpdateAnimalNo.cbHerdsChange(Sender: TObject);
begin
   HerdType := cBeefHerd;
   if ( cbHerds.Items.Objects[cbHerds.ItemIndex] <> nil ) then
      begin
         FHerdID := Integer( cbHerds.Items.Objects[cbHerds.ItemIndex]);
         if ( FHerdID <= 0 ) then
            raise Exception.Create('Invalid Herd Identity selected');

         if ( WinData.OwnerFile.Locate('ID', FHerdID,[]) ) then
            begin
               if WinData.GenLookUp.Locate('ID', WinData.OwnerFile.FieldByName('TypeOfHerd').AsInteger, [] ) then
                  HerdType := UPPERCASE(WinData.GenLookUp.FieldByName('Description').AsString);
            end;
      end;
   if ( HerdType <> cBeefHerd ) then
      cmbFormatType.ItemIndex := 0
   else
      cmbFormatType.ItemIndex := 1;
   cmbFormatTypeChange(cmbFormatType);
end;

function TUpdateAnimalNo.IsUKTag(const ANatIdNum: String): Boolean;
begin
   Result := UPPERCASE(Copy(ANatIdNum, 1, 2)) = 'UK';
end;

end.
