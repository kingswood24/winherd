{

  08/01/2009 V3.9 R5.6 /SP Additional Feature : Proc AddSire - Default Sire To Pedigree

  28/01/2009 V3.9 R5.8 /SP Additional Feature : Allow user to enter AICode when saving new sire.

  22/06/11 [V4.1 R2.1] /MK Additional Feature - Added Montbeliarde and Brown Swiss Count to StatusBar.

 }
unit uUKSireRegister;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBeefSalesCatalogue, cxStyles, Db, dxmdaset, ActnList, dxBar,
  dxBarExtItems, cxCheckBox, StdCtrls, cxButtons, cxTextEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxContainer, cxEdit, cxGroupBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar,
  uBaseFormAnimalCatalogue, DBTables;

type
  TfmUKSireRegister = class(TfmBaseFormAnimalCatalogue)
    actAddSire: TAction;
    QuerySires: TQuery;
    QuerySiresID: TIntegerField;
    QuerySiresBreedCode: TStringField;
    QuerySiresName: TStringField;
    QuerySiresPedigreeBreed: TStringField;
    QuerySiresHerdBookNo: TStringField;
    QuerySiresDTRS: TIntegerField;
    QuerySiresHRDS: TStringField;
    QuerySiresPercDTRTop: TFloatField;
    QuerySiresPercDTR2: TFloatField;
    QuerySiresLacts: TStringField;
    QuerySiresPercREL: TFloatField;
    QuerySiresMilkKG: TFloatField;
    QuerySiresFatKG: TFloatField;
    QuerySiresProtKG: TFloatField;
    QuerySiresPercFAT: TFloatField;
    QuerySiresPercProt: TFloatField;
    QuerySiresPin: TStringField;
    QuerySiresSCCREL: TStringField;
    QuerySiresSCC: TStringField;
    QuerySiresLSREL: TStringField;
    QuerySiresLS: TFloatField;
    QuerySiresFIREL: TStringField;
    QuerySiresFI: TFloatField;
    QuerySiresPERS: TStringField;
    QuerySiresType: TFloatField;
    QuerySiresRESIND: TStringField;
    QuerySiresTYPEREL: TStringField;
    QuerySiresLegs: TFloatField;
    QuerySiresUdder: TFloatField;
    dsQuerySires: TDataSource;
    dxBarLargeButton1: TdxBarLargeButton;
    GridCatalogueAnimalsDBTableViewBreedCode: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewDTRS: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewFatKG: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewFI: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewFIREL: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewHRDS: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewLacts: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewLegs: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewLS: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewLSREL: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPedigreeBreed: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPercDTR2: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPercDTRTop: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPercFAT: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPercProt: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPercREL: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPERS: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewPin: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewProtKG: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewRESIND: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewSCC: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewSCCREL: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewType: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewTYPEREL: TcxGridDBColumn;
    GridCatalogueAnimalsDBTableViewUdder: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure actAddSireExecute(Sender: TObject);
    procedure actClearSearchExecute(Sender: TObject);
  private
    { Private declarations }
     function AnimalInUse(const AHerdBookNo : String): Integer;
     function CountOfSires(const ABreedCode : string) : Integer;
     function GetMatchForBreedCode(ABreedCode : string) : Integer;
     procedure AddSire;
  public
    { Public declarations }
     procedure BuildSearchColumnList;override;
  end;

var
  fmUKSireRegister: TfmUKSireRegister;

implementation
uses
   DairyData, GenTypesConst, EventRecording, BDE, uHerdLookup, kRoutines;
{$R *.DFM}

{ TfmBeefSalesCatalogue1 }

procedure TfmUKSireRegister.AddSire;
var
   UKSire : TAnimalRecord;
   HerdBookNo : string;
   bFound : Boolean;
   AnimalID : Integer;

   AnimalNo : string;
begin
  inherited;
  // Add selected animal
  HerdBookNo := QuerySiresHerdBookNo.AsString;
  AnimalID := AnimalInUse(HerdBookNo);
  AnimalNo := '';
  if (AnimalID<=0) then
     begin
        // Add animal to database
        if InputQuery('Enter AI Code (Max 10 Chars)', 'Code:', AnimalNo) then // 28/01/2009 V3.9 R5.8
           begin
              if (Trim(AnimalNo) <> '') then
                 begin
                    AnimalNo := UPPERCASE(Copy(AnimalNo,1,10));
                    if CheckForAnimal(AnimalNo,0,WinData.NoneHerdID,'N',False) = Entered then
                       raise ErrorMsg.CreateFmt('AI Code "%s" is already in use.',[AnimalNo]);
                 end;
           end;

        UKSire := TAnimalRecord.Create;
        try
           UKSire.RaiseExceptions := False;

           UKSire.AddToNoneHerd;
           UKSire.HerdBookNo := HerdBookNo;
           UKSire.AnimalNo := AnimalNo;
           UKSire.Name := Trim(QuerySiresName.AsString);
           UKSire.Sex := cSex_Bull;
           UKSire.LactNo := 0;
           UKSire.InHerd := True;
           UKSire.Breeding := True;
           UKSire.DamID  := 0;
           UKSire.SireID := 0;
           UKSire.AnimalDeleted := False;

           // 08/01/2009 V3.9 R5.6 /SP Default Sire To Pedigree
           UKSire.Pedigree := True;

           UKSire.PrimaryBreed := GetMatchForBreedCode(Trim(QuerySiresBreedCode.AsString));
           if not UKSire.Save then
              UKSire.Cancel
           else
              begin
                 // Add BullSemenStk Record
                 with TQuery.Create(nil) do
                    try
                       DatabaseName := AliasName;
                       SQL.Clear;
                       SQL.Add('INSERT INTO BullExt (AnimalID)');
                       SQL.Add('VALUES (:AnimalID)');
                       Params[0].AsInteger := UKSire.ID;
                       ExecSQL;
                    finally
                       Free;
                    end;

                 FBooleanResult := True;
                 MessageDlg(cSireAddedToDB,mtInformation,[mbOK],0);
              end;
        finally
           FreeAndNil(UKSire);
        end;
     end
  else
     begin
        // update animal fields in database
        if MessageDlg(cSireAlreadyExists,mtConfirmation,[mbYes,mbNo],0) = idYes then
           begin
              with TQuery.Create(nil) do
                 try
                    DatabaseName := AliasName;
                    SQL.Clear;
                    SQL.Add('SELECT AnimalID FROM BullSemenStk');
                    SQL.Add('WHERE AnimalID = :AnimalID');
                    Params[0].AsInteger := AnimalID;
                    Open;
                    try
                       First;
                       bFound := Fields[0].AsInteger = AnimalID;
                    finally
                       Close;
                    end;
                    if not (bFound) then
                       begin
                          SQL.Clear;
                          SQL.Add('INSERT INTO BullSemenStk (AnimalID)');
                          SQL.Add('VALUES (:AnimalID)');
                          Params[0].AsInteger := AnimalID;
                          ExecSQL;
                       end
                    else
                       begin
                          SQL.Clear;
                          SQL.Add('UPDATE BullSemenStk SET InUse=True');
                          SQL.Add('WHERE AnimalID = :AnimalID');
                          Params[0].AsInteger := AnimalID;
                          ExecSQL;
                       end
                 finally
                    Free;
                 end;

              with TQuery.Create(nil) do
                 try
                    DatabaseName := AliasName;
                    SQL.Clear;
                    SQL.Add('SELECT AnimalID FROM BullExt');
                    SQL.Add('WHERE AnimalID = :AnimalID');
                    Params[0].AsInteger := AnimalID;
                    Open;
                    try
                       First;
                       bFound := Fields[0].AsInteger = AnimalID;
                    finally
                       Close;
                    end;
                    if not (bFound) then
                       begin
                          SQL.Clear;
                          SQL.Add('INSERT INTO BullExt (AnimalID)');
                          SQL.Add('VALUES (:AnimalID)');
                          Params[0].AsInteger := AnimalID;
                          ExecSQL;
                       end;
                 finally
                    Free;
                 end;
           end;
     end;

end;

function TfmUKSireRegister.AnimalInUse(
  const AHerdBookNo: String): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select ID From Animals Where HerdBookNo=:AHerdBookNo');
         Params[0].AsString := AHerdBookNo;

         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmUKSireRegister.BuildSearchColumnList;
begin
  inherited;
  //
end;

function TfmUKSireRegister.CountOfSires(
  const ABreedCode: string): Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(Name) CName FROM UKSires');
         SQL.Add('WHERE BreedCode = :BCode');
         Params[0].AsString := ABreedCode;
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmUKSireRegister.FormCreate(Sender: TObject);
var
  nCount : Integer;
begin
  inherited;
  QuerySires.Active := True;

  nCount := CountOfSires('HOL');
  StatusBar.Panels[1].Text := Format('Holsteins: %d',[nCount]);

  nCount := CountOfSires('FR');
  StatusBar.Panels[2].Text := Format('Fresians: %d',[nCount]);

  nCount := CountOfSires('AYR');
  StatusBar.Panels[3].Text := Format('Ayrshires: %d',[nCount]);

  nCount := CountOfSires('JER');
  StatusBar.Panels[4].Text := Format('Jerseys: %d',[nCount]);

  nCount := CountOfSires('GU');
  StatusBar.Panels[5].Text := Format('Guernseys: %d',[nCount]);

  nCount := CountOfSires('SIH');
  StatusBar.Panels[6].Text := Format('Shorthorns: %d',[nCount]);

  nCount := CountOfSires('MO');
  StatusBar.Panels[7].Text := Format('Montbeliarde: %d',[nCount]);

  nCount := CountOfSires('BS');
  StatusBar.Panels[8].Text := Format('Brown Swiss: %d',[nCount]);
end;

procedure TfmUKSireRegister.actAddSireExecute(Sender: TObject);
begin
  inherited;
  AddSire;
end;

procedure TfmUKSireRegister.actClearSearchExecute(Sender: TObject);
begin
  inherited;
  //
end;

function TfmUKSireRegister.GetMatchForBreedCode(
  ABreedCode: string): integer;
begin
   Result := 0;
   // HOL
   if ABreedCode = 'HOL' then
      begin
         Result := HerdLookup.BreedIDByCode('HOL');
         if ( Result = 0 ) then
            Result := HerdLookup.BreedIDByCode('HO');
      end
   else if ABreedCode = 'FR' then
      begin
         Result := HerdLookup.BreedIDByCode('FR');
         if ( Result = 0 ) then
            Result := HerdLookup.BreedIDByCode('BF'); // British Friesian
      end
   else if ABreedCode = 'AYR' then
      begin
         Result := HerdLookup.BreedIDByCode('AYR');
         if ( Result = 0 ) then
            Result := HerdLookup.BreedIDByCode('AY');
      end
   else if ABreedCode = 'JER' then
      begin
         Result := HerdLookup.BreedIDByCode('JER');
         if ( Result = 0 ) then
            Result := HerdLookup.BreedIDByCode('JE');
      end
   else if ABreedCode = 'GU' then
      begin
         Result := HerdLookup.BreedIDByCode('GU');
         //if ( Result = 0 ) then
            //Result := BreedIDByCode('JE');
      end
   else if ABreedCode = 'SIH' then
      begin
         Result := HerdLookup.BreedIDByCode('SIH');
         if ( Result = 0 ) then
            Result := HerdLookup.BreedIDByCode('SH');
         if ( Result = 0 ) then
            Result := HerdLookup.BreedIDByCode('SHO');
      end
   else if ABreedCode = 'MO' then
      begin
         Result := HerdLookup.BreedIDByCode('MO');
      end
   else if ABreedCode = 'BS' then
      begin
         Result := HerdLookup.BreedIDByCode('BS');
      end;
end;

end.
