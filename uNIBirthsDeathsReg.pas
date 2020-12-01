unit uNIBirthsDeathsReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ComCtrls, RXCtrls, ToolWin, db, dbTables, ExtCtrls,
  Menus, DBCtrls, StdCtrls, DBGrids, RXDBCtrl;

type
  TAPHISRegistrationKind = (APHISBirths, APHISDeaths, APHISStillBirths);
  TNIBirthsDeathsReg = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbCreateXMLFile: TRxSpeedButton;
    StatusBar: TStatusBar;
    RegistrationPages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    sbRemove: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    LoadAnimalTimer: TTimer;
    mRemove: TPopupMenu;
    Remove1: TMenuItem;
    sbReload: TRxSpeedButton;
    ToolButton5: TToolButton;
    dsBatchRegAnimals: TDataSource;
    pControls: TPanel;
    AnimalGrid: TDBGridEh;
    pErrors: TPanel;
    DBNavigator1: TDBNavigator;
    N1: TMenuItem;
    RemovePermanently1: TMenuItem;
    Splitter: TSplitter;
    ErrorGrid: TDBGridEh;
    Image1: TImage;
    Label1: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    sbOptions: TRxSpeedButton;
    ToolButton6: TToolButton;
    mOptions: TPopupMenu;
    GotoAPHISOnline1: TMenuItem;
    N2: TMenuItem;
    ShowXMLFiles1: TMenuItem;
    ImageTimer: TTimer;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RegistrationPagesChange(Sender: TObject);
    procedure LoadAnimalTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure AnimalGridDblClick(Sender: TObject);
    procedure sbReloadClick(Sender: TObject);
    procedure RemovePermanently1Click(Sender: TObject);
    procedure sbCreateXMLFileClick(Sender: TObject);
    procedure AnimalGridTitleClick(Column: TColumnEh);
    procedure GotoAPHISOnline1Click(Sender: TObject);
    procedure ShowXMLFiles1Click(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure ImageTimerTimer(Sender: TObject);
  private
    { Private declarations }
    BirthTable,
    DeathTable,
    StillBirthTable,
    RegErrorTable,
    RegistrationTable,
    LookupCalvings,
    LookupSalesDeaths : TTable;
    GenQuery : TQuery;
    ProgressBar : TProgressBar;
    HerdIdentity : string;
    ThisHerdID,
    TotalAnimals : Integer;
    NextFileID : Integer;
    LastRegCreation : TDateTime;
//    FRegistrationKind : TAPHISRegistrationKind;
    procedure Initialize;
    procedure Finalize;
    procedure LoadAll;
    procedure UpdateStatus;
    procedure UpdateRegInfo(RegType : Integer);
    procedure UpdateGridColumns;
    procedure LoadAnimals(RegType : Integer);
    procedure CreateFileAndReg(RegType : Integer);
    procedure GetRegDetails(RegType : Integer);
    procedure InsertErrorRecord(const AnimalID : Integer; const ErrorStr : string);
    procedure RegTableAfterScroll(DataSet: TDataSet);
    procedure RegTableAfterDelete(DataSet : TDataSet);
    function FileAnimalCount(TableName : String) : Integer;
    function RegisterBirths(const RegisterAll, StillBirth : Boolean) : Boolean;
    function RegisterDeaths(const RegisterAll : Boolean) : Boolean;
  public
    { Public declarations }
  end;

  procedure ShowForm(APHISRegistrationKind : TAPHISRegistrationKind);

var
  NIBirthsDeathsReg: TNIBirthsDeathsReg;
  ThisDataSource : TDataSource;

implementation
uses
   DairyData, FileCtrl, KDBRoutines, GenTypesConst, uNIBirthsDeathsRegError, xml_generator,
   ShellAPI;
{$R *.DFM}

  procedure ShowForm(APHISRegistrationKind : TAPHISRegistrationKind);
  begin
     try
        Application.CreateForm(TNIBirthsDeathsReg, NIBirthsDeathsReg);
        try
           NIBirthsDeathsReg.RegistrationPages.ActivePageIndex := Ord(APHISRegistrationKind);
           NIBirthsDeathsReg.ShowModal;
        except
           MessageDlg(cFormCreateError, mtError, [mbOK], 0);
        end;
     finally
        FreeAndNil(NIBirthsDeathsReg);
     end;
  end;

{ TNIBirthsDeathsReg }

procedure TNIBirthsDeathsReg.FormCreate(Sender: TObject);
begin
   Initialize;
end;

procedure TNIBirthsDeathsReg.FormDestroy(Sender: TObject);
begin
   Finalize;
end;

procedure TNIBirthsDeathsReg.RegistrationPagesChange(Sender: TObject);
begin
   LoadAll;
end;

procedure TNIBirthsDeathsReg.LoadAnimalTimerTimer(Sender: TObject);
begin
   LoadAnimalTimer.Enabled := False;
   LoadAll;
end;

procedure TNIBirthsDeathsReg.FormShow(Sender: TObject);
begin
   LoadAnimalTimer.Enabled := True;
end;

procedure TNIBirthsDeathsReg.Initialize;
var
   RegFileDir : string;
   Ico : TIcon;
begin
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbRemove.Glyph, cBtnImgCancel);
   WinData.LoadBtnImage(sbCreateXMLFile.Glyph, cBtnImgExecute);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(sbReload.Glyph, cBtnImgLoad);
   WinData.LoadBtnImage(sbOptions.Glyph, cBtnImgOptions);


   Ico := Ticon.Create;
   try
      Ico.Handle := LoadIcon(0,IDI_EXCLAMATION);
      Image1.Picture.Graphic := Ico;
   finally
      Ico.Free;
   end;

   ThisHerdID := WinData.UserDefaultHerdID;

   RegFileDir := ExtractFilePath(ParamStr(0)) + sRegFileDir;
   if not DirectoryExists(RegFileDir) then
      if not CreateDir(RegFileDir) then
         raise Exception.CreateFmt(sDirCreateError, [RegFileDir]);

   ProgressBar := TProgressBar.Create(Self);

   WinData.CreateTTable(BirthTable, nil, '','tNIBirthReg');
   WinData.CreateTTable(DeathTable, nil, '','tNIDeathReg');
   WinData.CreateTTable(StillBirthTable, nil, '', 'tNIStillBirthReg');
   WinData.CreateTTable(RegistrationTable, nil, '', 'BatchRegistrations');
   WinData.CreateTTable(RegErrorTable, nil, '', 'tBatchRegAnimals');
   WinData.CreateTTable(LookupCalvings, nil, '', 'Calvings');
   WinData.CreateTTable(LookupSalesDeaths, nil, '', 'SalesDeaths');
   WinData.CreateTQuery(GenQuery, nil, 'Kingswd');

   LookupCalvings.CachedUpdates := True;
   LookupCalvings.Active := True;

   LookupSalesDeaths.CachedUpdates := True;
   LookupSalesDeaths.Active := True;

   RegistrationTable.Active := True;
   ThisDataSource := TDataSource.Create(nil);
   AnimalGrid.DataSource := ThisDataSource;

   with BirthTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('SortNatIDNum', ftString, 20);
               Add('Sex', ftString, 6);
               Add('DateOfBirth', ftDate);
               Add('Colour', ftString, 6);
               Add('Breed', ftString, 6);
               Add('DamNatIDNum', ftString, 20);
               Add('DamSortNatIDNum', ftString, 20);
               Add('RegisterOnFile', ftBoolean);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixUnique]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
               Add('iNatIDNum', 'NatIDNum',[ixCaseInsensitive]);
               Add('iSex', 'Sex', [ixCaseInsensitive]);
               Add('iDateOfBirth', 'DateOfBirth', [ixCaseInsensitive]);
               Add('iColour', 'Colour', [ixCaseInsensitive]);
               Add('iBreed', 'Breed', [ixCaseInsensitive]);
               Add('iDamSortNatIDNum', 'DamSortNatIDNum', [ixCaseInsensitive]);

               { Descending }
               Add('dNatIDNum', 'NatIDNum',[ixCaseInsensitive, ixDescending]);
               Add('dSex', 'Sex', [ixCaseInsensitive, ixDescending]);
               Add('dDateOfBirth', 'DateOfBirth',[ixCaseInsensitive, ixDescending]);
               Add('dColour', 'Colour', [ixCaseInsensitive, ixDescending]);
               Add('dBreed', 'Breed', [ixCaseInsensitive, ixDescending]);
               Add('dDamSortNatIDNum', 'DamSortNatIDNum', [ixCaseInsensitive, ixDescending]);
            end;

         AfterDelete := RegTableAfterDelete;
         AfterScroll := RegTableAfterScroll;
         CreateTable;
         IndexName := 'iNatIDNum';
         Open;
      end;

   with DeathTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('SortNatIDNum', ftString, 20);
               Add('DateOfDeath', ftDate);
               Add('MannerOfDisposal', ftString, 30);
               Add('PlaceOfDisposal', ftString, 30);
               Add('RegisterOnFile', ftBoolean);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixUnique]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
               Add('iNatIDNum', 'NatIDNum',[ixCaseInsensitive]);
               Add('iDateOfDeath', 'DateOfDeath',[ixCaseInsensitive]);
               Add('iMannerOfDisposal', 'MannerOfDisposal',[ixCaseInsensitive]);
               Add('iPlaceOfDisposal', 'PlaceOfDisposal',[ixCaseInsensitive]);
               { Descending }
               Add('dNatIDNum', 'NatIDNum',[ixCaseInsensitive, ixDescending]);
               Add('dDateOfDeath', 'DateOfDeath',[ixCaseInsensitive, ixDescending]);
               Add('dMannerOfDisposal', 'MannerOfDisposal',[ixCaseInsensitive, ixDescending]);
               Add('dPlaceOfDisposal', 'PlaceOfDisposal',[ixCaseInsensitive, ixDescending]);
            end;
         AfterDelete := RegTableAfterDelete;
         AfterScroll := RegTableAfterScroll;
         CreateTable;
         IndexName := 'iNatIDNum';
         Open;
      end;

   with StillBirthTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('SortNatIDNum', ftString, 20);
               Add('CalvingDate', ftDate);
               Add('Comment', ftString, 30);
               Add('RegisterOnFile', ftBoolean);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixUnique]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
               Add('iNatIDNum', 'NatIDNum',[ixCaseInsensitive]);
               Add('iCalvingDate', 'CalvingDate',[ixCaseInsensitive]);
               Add('iComment', 'Comment',[ixCaseInsensitive]);
               { Descending }
               Add('dNatIDNum', 'NatIDNum',[ixCaseInsensitive, ixDescending]);
               Add('dCalvingDateh', 'CalvingDate',[ixCaseInsensitive, ixDescending]);
               Add('dComment', 'Comment',[ixCaseInsensitive, ixDescending]);
            end;
         AfterDelete := RegTableAfterDelete;
         AfterScroll := RegTableAfterScroll;
         CreateTable;
         IndexName := 'iNatIDNum';
         Open;
      end;

   with RegErrorTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('AnimalID', ftInteger);
               Add('ErrorDesc', ftString, 50);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
            end;

         CreateTable;
         IndexName := 'iAnimalID';
         MasterFields := 'AnimalID';
         MasterSource := ThisDataSource;
         Open;
      end;
   dsBatchRegAnimals.Dataset := RegErrorTable;
   if WinData.OwnerFile.Locate('ID', ThisHerdID, []) then
      begin
         HerdIdentity := UPPERCASE( WinData.OwnerFile.FieldByName('HerdIdentity').AsString );
      end
   else
      raise Exception.Create('Herd Identity could not be found - contact Kingswood');
end;

procedure TNIBirthsDeathsReg.Finalize;
begin
   if ( BirthTable <> nil ) then
      begin
         BirthTable.Close;
         BirthTable.DeleteTable;
         FreeAndNil(BirthTable);
      end;

   if ( DeathTable <> nil ) then
      begin
         DeathTable.Close;
         DeathTable.DeleteTable;
         FreeAndNil(DeathTable);
      end;

   if ( StillBirthTable <> nil ) then
      begin
         StillBirthTable.Close;
         StillBirthTable.DeleteTable;
         FreeAndNil(StillBirthTable);
      end;

   if ( RegErrorTable <> nil ) then
      begin
         RegErrorTable.Close;
         RegErrorTable.DeleteTable;
         FreeAndNil(RegErrorTable);
      end;

   if ( RegistrationTable <> nil ) then
      begin
         RegistrationTable.Close;
         FreeAndNil(RegistrationTable);
      end;

   if ( LookupCalvings <> nil ) then
      begin
         LookupCalvings.Close;
         FreeAndNil(LookupCalvings);
      end;

   if ( LookupSalesDeaths <> nil ) then
      begin
         LookupSalesDeaths.Close;
         FreeAndNil(LookupSalesDeaths);
      end;

   if ( GenQuery <> nil ) then
      begin
         GenQuery.Close;
         GenQuery.Free;
      end;

   if ( ThisDataSource <> nil ) then
      FreeAndNil(ThisDataSource);

   if ( ProgressBar <> nil ) then
      begin
         FreeAndNil(ProgressBar);
      end;
end;

procedure TNIBirthsDeathsReg.LoadAll;
begin
   pErrors.Visible := False;
   Splitter.Visible := False;
   UpdateGridColumns;
   pControls.Parent := RegistrationPages.ActivePage;
   case RegistrationPages.ActivePageIndex of
      cRegTypeBirths : ThisDataSource.DataSet := BirthTable;
      cRegTypeDeaths : ThisDataSource.DataSet := DeathTable;
      cRegTypeStillBirth : ThisDataSource.DataSet := StillBirthTable;
   end;
   Update;
   LoadAnimals(RegistrationPages.ActivePageIndex);
   UpdateStatus;
end;

procedure TNIBirthsDeathsReg.UpdateStatus;
begin
   GetRegDetails(RegistrationPages.ActivePageIndex);
   with StatusBar do
      begin
         Panels[0].Text := Format('Animal Count: %d', [TotalAnimals]);
         Panels[1].Text := Format('File ID: %d', [NextFileID]);
         if ( LastRegCreation > 0 ) then
            Panels[2].Text := Format('Last Registration: %s', [FormatDateTime('dd/mm/yyyy',LastRegCreation)])
         else
            Panels[2].Text := Format('Last Registration: %s', ['']);
      end;
end;

procedure TNIBirthsDeathsReg.GetRegDetails(RegType: Integer);
begin
   case RegType of
      cRegTypeBirths : begin
                          TotalAnimals := BirthTable.RecordCount;
                          NextFileID := RegistrationTable.FieldByName('BirthRegCount').AsInteger + 1;
                          LastRegCreation := RegistrationTable.FieldByName('LastBirthRegDate').AsDateTime;
                       end;
      cRegTypeDeaths : begin
                          TotalAnimals := DeathTable.RecordCount;
                          NextFileID := RegistrationTable.FieldByName('DeathRegCount').AsInteger + 1;
                          LastRegCreation := RegistrationTable.FieldByName('LastDeathRegDate').AsDateTime;
                       end;
      cRegTypeStillBirth : begin
                              TotalAnimals := StillBirthTable.RecordCount;
                              NextFileID := RegistrationTable.FieldByName('StillBirthRegCount').AsInteger + 1;
                              LastRegCreation := RegistrationTable.FieldByName('LastStillBirthRegDate').AsDateTime;
                           end;
   end;
end;


procedure TNIBirthsDeathsReg.UpdateGridColumns;
var
   ThisCol : TColumnEh;
begin
   AnimalGrid.Columns.Clear;
   with AnimalGrid.Columns do
   begin
      BeginUpdate;
      Clear;
      if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
         begin
            ThisCol := Add;
            ThisCol.FieldName := 'NatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'National Id Number.';
            ThisCol.Title.SortMarker := smDowneh;

            ThisCol := Add;
            ThisCol.FieldName := 'Sex';
            ThisCol.Width := 80;
            ThisCol.Title.Caption := 'Sex';

            ThisCol := Add;
            ThisCol.FieldName := 'DateOfBirth';
            ThisCol.Width := 95;
            ThisCol.Title.Caption := 'Date Of Birth';

            ThisCol := Add;
            ThisCol.FieldName := 'Colour';
            ThisCol.Width := 60;
            ThisCol.Title.Caption := 'Colour';

            ThisCol := Add;
            ThisCol.FieldName := 'Breed';
            ThisCol.Width := 60;
            ThisCol.Title.Caption := 'Breed';

            ThisCol := Add;
            ThisCol.FieldName := 'DamNatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'Dam National ID.';
         end
      else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
         begin
            ThisCol := Add;
            ThisCol.FieldName := 'NatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'National Id Number.';
            ThisCol.Title.SortMarker := smDowneh;

            ThisCol := Add;
            ThisCol.FieldName := 'DateOfDeath';
            ThisCol.Width := 100;
            ThisCol.Title.Caption := 'Date Of Death';

            ThisCol := Add;
            ThisCol.FieldName := 'MannerOfDisposal';
            ThisCol.Width := 200;
            ThisCol.Title.Caption := 'Manner Of Disposal';

            ThisCol := Add;
            ThisCol.FieldName := 'PlaceOfDisposal';
            ThisCol.Width := 200;
            ThisCol.Title.Caption := 'Place Of Disposal';
         end
      else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBirth ) then
         begin
            ThisCol := Add;
            ThisCol.FieldName := 'NatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'Dam National Id.';
            ThisCol.Title.SortMarker := smDowneh;

            ThisCol := Add;
            ThisCol.FieldName := 'CalvingDate';
            ThisCol.Width := 95;
            ThisCol.Title.Caption := 'Date Of Birth';

            ThisCol := Add;
            ThisCol.FieldName := 'Comment';
            ThisCol.Width := 150;
            ThisCol.Title.Caption := 'Comment';
         end;
      EndUpdate;
   end;
end;

procedure TNIBirthsDeathsReg.LoadAnimals(RegType: Integer);

   procedure LoadBirths;
   var
      i : byte;
   begin
      BirthTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      SQLEmptyTable(BirthTable.TableName);
      BirthTable.DisableControls;

      with GenQuery do
         begin

            for i := 1 to 4 do
               begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO tNIBirthReg ( EventID, AnimalID )');
                  case i of
                     1 : SQL.Add('SELECT EventID, ID1');
                     2 : SQL.Add('SELECT EventID, ID2');
                     3 : SQL.Add('SELECT EventID, ID3');
                     4 : SQL.Add('SELECT EventID, ID4');
                  end;
                  SQL.Add('FROM "Calvings.DB"');
                  case i of
                     1 : begin
                            SQL.Add('WHERE(ID1Notified=FALSE)');
                            SQL.Add('AND(ID1>0)');
                            SQL.Add('AND (CalfDead1=FALSE)');
                         end;
                     2 : begin
                            SQL.Add('WHERE(ID2Notified=FALSE)');
                            SQL.Add('AND(ID2>0)');
                            SQL.Add('AND (CalfDead2=FALSE)');
                         end;
                     3 : begin
                            SQL.Add('WHERE(ID3Notified=FALSE)');
                            SQL.Add('AND(ID3>0)');
                            SQL.Add('AND (CalfDead3=FALSE)');
                         end;
                     4 : begin
                            SQL.Add('WHERE(ID4Notified=FALSE)');
                            SQL.Add('AND(ID4>0)');
                            SQL.Add('AND (CalfDead4=FALSE)');
                         end;
                  end;
                  ExecSQL;

               end;

            SQL.Clear;
            SQL.Add('DELETE FROM tNIBirthReg');
            SQL.Add('WHERE AnimalID NOT IN (SELECT ID FROM Animals WHERE (HerdID = :AHerdID))');
            Params[0].AsInteger := ThisHerdID;
            ExecSQL;

            BirthTable.Refresh;
            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortNatId, Colour, PrimaryBreed, Sex, DateOfBirth, DamID, SireID, HerdID ');
            SQL.Add('FROM Animals A, tNIBirthReg T');
            SQL.Add('WHERE (T.AnimalID=A.ID)');
            SQL.Add('ORDER BY ID ');
            Open;

            try
               First;
               while not eof do
                  begin
                     if BirthTable.Locate('AnimalID', FieldByName('ID').Value,[] ) then
                        begin
                           BirthTable.Edit;
                           try
                              BirthTable.FieldByName('RegisterOnFile').AsBoolean := TRUE;
                              BirthTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                              if not ( BirthTable.FieldByName('NatIDNum').IsNull ) then
                                 begin
                                    if not WinData.ValidNITagNo(BirthTable.FieldByName('NatIdNum').AsString) then
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Invalid National Identity Number');
                                          BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Blank National Identity Number');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                              BirthTable.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                              BirthTable.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                              BirthTable.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                              if ( BirthTable.FieldByName('DateOfBirth').AsDateTime > 0 ) then
                                 begin
                                    if ( BirthTable.FieldByName('DateOfBirth').AsDateTime <= Date ) then
                                       begin
                                          if ( BirthTable.FieldByName('DateOfBirth').AsDateTime < ( Date() - 21 ) ) then
                                             begin
                                                InsertErrorRecord(FieldByName('ID').Value, '21 Day Limit Exceeded');
                                                BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                             end;
                                       end
                                    else
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Invalid Date of Birth');
                                          BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Date of Birth Not Found');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              // Now try locate the calf's colour and colour code
                              if WinData.GenLookUp.Locate('ID',FieldByName('Colour').Value,[] ) then
                                 BirthTable.FieldByName('Colour').AsString := WinData.GenLookUp.FieldByName('LookUpCode').AsString
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Colour Code Not Found');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              // Now try locate the calf's breed and breed code
                              if WinData.Breeds.Locate('ID',FieldByName('PrimaryBreed').Value,[] ) then
                                 BirthTable.FieldByName('Breed').AsString := WinData.Breeds.FieldByName('Code').AsString
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Breed Code Not Found');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              // Get the Dam Nat ID.
                              if WinData.LookUpDamSire.Locate('ID',FieldByName('DamID').Value, [] ) then
                                 begin
                                    if not ( WinData.LookUpDamSire.FieldByName('NatIDNum').IsNull ) then
                                       BirthTable.FieldByName('DamNatIDNum').AsString := WinData.LookUpDamSire.FieldByName('NatIdNum').AsString
                                    else
                                       begin
                                          BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                          InsertErrorRecord(FieldByName('ID').Value, 'Dam National Identity Number Missing');
                                       end
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Missing Dam Record');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                              BirthTable.Post;
                           except
                              on E : EDatabaseError do
                                  begin
                                     BirthTable.Cancel;
                                     MessageDlg(Format('Failed to create animal birth record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                                  end;
                           end;
                        end;
                     Next;
                  end;
            finally
               Close;
               BirthTable.Refresh;
               BirthTable.First;
               BirthTable.EnableControls;
               DeathTable.AfterScroll := RegTableAfterScroll;
               RegTableAfterScroll(BirthTable);
            end;
         end;
   end;

   procedure LoadDeaths;
   begin
      DeathTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      SQLEmptyTable(DeathTable.TableName);
      Update;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT (A.ID), A.NatIDNum, A.SortNatID, E.ID EID, E.EventDate, S.Disposal, S.Customer');
            SQL.Add('FROM Animals A');
            SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
            SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
            SQL.Add('WHERE (E.EventType = :AEventType )');
            SQL.Add('AND (A.HerdID = :AHerdID )');
            SQL.Add('AND (E.HerdID = A.HerdID )');
            SQL.Add('AND (A.InHerd=FALSE)');
            SQL.Add('AND (S.Sold=FALSE)');
            SQL.Add('AND (S.NIDeathNotify=FALSE)');
            SQL.Add('ORDER BY A.ID');
            Params[0].AsInteger := CSaleDeathEvent;
            Params[1].AsInteger := ThisHerdID;
            Prepare;
            Open;

            DeathTable.DisableControls;
            try
               First;
               while not eof do
                  begin
                     DeathTable.Append;
                     try
                        DeathTable.FieldByName('RegisterOnFile').AsBoolean := TRUE;
                        DeathTable.FieldByName('AnimalID').AsInteger := FieldByName('ID').AsInteger;
                        DeathTable.FieldByName('EventID').AsInteger := FieldByName('EID').AsInteger;
                        DeathTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;

                        if ( DeathTable.FieldByName('NatIDNum').IsNull ) then
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Blank National Identity Number');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;

                        DeathTable.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                        DeathTable.FieldByName('DateOfDeath').AsDateTime := FieldByName('EventDate').AsDateTime;

                        if ( DeathTable.FieldByName('DateOfDeath').AsDateTime > 0 ) then
                           begin
                              if ( DeathTable.FieldByName('DateOfDeath').AsDateTime <= Date ) then
                                 begin
                                    if ( DeathTable.FieldByName('DateOfDeath').AsDateTime < ( Date() - 21 ) ) then
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, '21 Day Limit Exceeded');
                                          DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Date Of Death After Today');
                                    DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                           end
                        else
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Date Of Death Missing');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;

                        if not ( FieldByName('Disposal').IsNull ) then
                           begin
                              if WinData.GenLookUp.Locate('ID', FieldByName('Disposal').AsInteger, []) then
                                 begin
                                    DeathTable.FieldByName('MannerOfDisposal').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Unknown Disposal Type');
                                    DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                           end
                        else
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Unknown Disposal Type');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;

                        if not ( FieldByName('Customer').IsNull ) then
                           begin
                              if WinData.Customers.Locate('ID', FieldByName('Customer').AsInteger, []) then
                                 begin
                                    DeathTable.FieldByName('PlaceOfDisposal').AsString := WinData.Customers.FieldByName('Name').AsString;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Unknown Disposal Place');
                                    DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                           end
                        else
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Disposal Place Missing');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;
                        DeathTable.Post;
                     except
                        on E : EDatabaseError do
                           begin
                              DeathTable.Cancel;
                              MessageDlg(Format('Failed to create animal death record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                           end;
                     end;
                     Next; // GenQuery
                  end;
            finally
               Close;  // GenQuery
               DeathTable.Refresh;
               DeathTable.First;
               DeathTable.EnableControls;
               DeathTable.AfterScroll := RegTableAfterScroll;
               RegTableAfterScroll(DeathTable);
            end;
         end;
   end;

   procedure LoadStillBirths;
   begin
      StillBirthTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      SQLEmptyTable(StillBirthTable.TableName);
      StillBirthTable.DisableControls;

      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO tNIStillBirthReg ( EventID )');
            SQL.Add('SELECT EventID');
            SQL.Add('FROM Calvings');
            SQL.Add('WHERE ((ID1Notified=FALSE)');
            SQL.Add('AND (CalfDead1=TRUE))');
            SQL.Add('OR ((ID2Notified=FALSE)');
            SQL.Add('AND (CalfDead2=TRUE))');
            SQL.Add('OR ((ID3Notified=FALSE)');
            SQL.Add('AND (CalfDead3=TRUE))');
            SQL.Add('OR ((ID4Notified=FALSE)');
            SQL.Add('AND (CalfDead4=TRUE))');
            ExecSQL;

            SQL.Clear;
            SQL.Add('SELECT A.ID, A.NatIDNum, A.SortNatId, E.ID EID, E.EventDate, E.EventDesc');
            SQL.Add('FROM Animals A, Events E, tNIStillBirthReg T');
            SQL.Add('Where  ((E.ID=T.EventID) AND (E.AnimalID=A.ID))');
            SQL.Add('ORDER BY A.ID');
            Open;

            try
               First;
               while not eof do
                  begin
                     if StillBirthTable.Locate('EventID', GenQuery.FieldByName('EID').Value,[] ) then
                        begin
                           StillBirthTable.Edit;
                           try
                              StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := TRUE;
                              StillBirthTable.FieldByName('AnimalID').AsInteger := GenQuery.FieldByName('ID').AsInteger;
                              StillBirthTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                              if ( StillBirthTable.FieldByName('NatIDNum').IsNull ) then
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Blank National Identity Number');
                                    StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              StillBirthTable.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                              StillBirthTable.FieldByName('CalvingDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                              if ( StillBirthTable.FieldByName('CalvingDate').AsDateTime > 0 ) then
                                 begin
                                    if ( StillBirthTable.FieldByName('CalvingDate').AsDateTime <= Date ) then
                                       begin
                                          if ( StillBirthTable.FieldByName('CalvingDate').AsDateTime < ( Date() - 21 ) ) then
                                             begin
                                                InsertErrorRecord(FieldByName('ID').Value, '21 Day Limit Exceeded');
                                                StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                             end;
                                       end
                                    else
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Calving Date After Today');
                                          StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Invalid Calving Date');
                                    StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                              StillBirthTable.FieldByName('Comment').AsString := FieldByName('EventDesc').AsString;
                              StillBirthTable.Post;
                           except
                              on E : EDatabaseError do
                                 begin
                                    StillBirthTable.Cancel;
                                    MessageDlg(Format('Failed to create animal birth record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                                 end;
                           end;
                        end;
                     Next;
                  end;
            finally
               Close;
               StillBirthTable.Refresh;
               StillBirthTable.First;
               StillBirthTable.EnableControls;
               StillBirthTable.AfterScroll := RegTableAfterScroll;
               RegTableAfterScroll(StillBirthTable);
            end;
         end;
   end;
begin
   Screen.Cursor := crHourGlass;
   SQLEmptyTable(RegErrorTable.TableName);
   try
      case RegType of
         cRegTypeBirths : LoadBirths;
         cRegTypeDeaths : LoadDeaths;
         cRegTypeStillBirth : LoadStillBirths;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TNIBirthsDeathsReg.CreateFileAndReg(RegType: Integer);
var
   XMLWriter : TXMLGenerator;
   FileRecCount : Integer;
   sFileName : string;
   sRegType : Char;
   RegSuccess : Boolean;
begin
   FileRecCount := 0;
   sRegType := #0;
   RegSuccess := False;
   if ( RegType = cRegTypeBirths ) then
      begin
         FileRecCount := FileAnimalCount(BirthTable.TableName);
         sFileName := 'BatchBirth';
         sRegType := cRegType_Births;
      end
   else if ( RegType = cRegTypeDeaths ) then
      begin
         FileRecCount := FileAnimalCount(DeathTable.TableName);
         sFileName := 'BatchDeath';
         sRegType := cRegType_Deaths;
      end
   else if ( RegType = cRegTypeStillBirth ) then
      begin
         FileRecCount := FileAnimalCount(StillBirthTable.TableName);
         sFileName := 'BatchStillBirth';
         sRegType := cRegType_StillBirths;
      end;

  if ( sRegType = #0 ) then
     begin
        MessageDlg('Unrecognized FileType Code',mtError,[mbOK],0);
        Abort;
     end;

  if ( FileRecCount <= 0 ) then
     begin
        MessageDlg('There are no records to be registered',mtInformation,[mbOK],0);
        Abort;
     end;

  Screen.Cursor := crHourGlass;
  sFileName := ExtractFilePath(ParamStr(0)) + IncludeTrailingBackslash(sRegFileDir) +
               Format(sFileName+'%s%s', [FormatDateTime('ddmmyy', Date), '_k.xml']);
  XMLWriter := TXMLGenerator.CreateFragment(1024);
  try
     XMLWriter.StartTag(cxml_FileNameTag);
     XMLWriter.AddData(ExtractFileName(sFileName));
     XMLWriter.StopTag;

     XMLWriter.StartTag(cxml_RegTypeTag);
     XMLWriter.AddData(sRegType);
     XMLWriter.StopTag;

     XMLWriter.StartTag(cxml_FileIdTag);
     XMLWriter.AddData(IntToStr(NextFileID));
     XMLWriter.StopTag;

     XMLWriter.StartTag(cxml_NoOfAnimalsTag);
     XMLWriter.AddData(IntToStr(FileRecCount));
     XMLWriter.StopTag;

     if ( RegType = cRegTypeBirths ) then
        begin
           with BirthTable do
              begin
                 First;

                 while not eof do
                    begin

                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_NewAnimalRegInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_ColourTag);
                                 XMLWriter.AddData(FieldByName('Colour').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cmxl_SexTag);
                                 if UPPERCASE(FieldByName('Sex').AsString) = 'FEMALE' then
                                    XMLWriter.AddData('F')
                                 else if UPPERCASE(FieldByName('Sex').AsString) = 'STEER' then
                                    XMLWriter.AddData('M')
                                 else if UPPERCASE(FieldByName('Sex').AsString) = 'BULL' then
                                    XMLWriter.AddData('B');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cmxl_BreedTag);
                                 XMLWriter.AddData(FieldByName('Breed').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cmxl_DOBTag);
                                 XMLWriter.AddData(FormatDateTime('dd/mm/yyyy', FieldByName('DateOfBirth').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cmxl_DamTag);
                                 XMLWriter.AddData(FieldByName('DamNatIDNum').AsString);
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;
                       Next;
                    end;
              end;
        end
     else if ( RegType = cRegTypeDeaths ) then
        begin
           with DeathTable do
              begin
                 First;

                 while not eof do
                    begin

                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_DeadAnimalInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DateOfDeathTag);
                                 XMLWriter.AddData(FormatDateTime('dd/mm/yyyy', FieldByName('DateOfDeath').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_MannerDisposalTag);
                                 XMLWriter.AddData(FieldByName('MannerOfDisposal').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_PlaceDisposalTag);
                                 XMLWriter.AddData(FieldByName('PlaceOfDisposal').AsString);
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;

                       Next;
                    end;
              end;
        end
     else if ( RegType = cRegTypeStillBirth ) then
        begin
           with StillBirthTable do
              begin
                 First;

                 while not eof do
                    begin

                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_AnimalInfo);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cmxl_DOBTag);
                                 XMLWriter.AddData(FormatDateTime('dd/mm/yyyy', FieldByName('CalvingDate').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_CommentTag);
                                 XMLWriter.AddData(FieldByName('Comment').AsString);
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;

                       Next;
                    end;
              end;
        end;

      if XMLWriter.AsString <> '' then
         begin
            XMLWriter.SaveToFile(sFileName);
            if ( RegType = cRegTypeBirths ) then
               RegSuccess := RegisterBirths(True, False)
            else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
               RegSuccess := RegisterDeaths(True)
            else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBirth ) then
               RegSuccess := RegisterBirths(True, True);
            if ( RegSuccess ) then
               begin
                  UpdateRegInfo(RegType);
                  MessageDlg(Format('File created successfully.'+cCRLF+cCRLF+'%s', [sFileName]),mtInformation,[mbOK],0);
               end
            else
               MessageDlg('Registration failed - contact Kingswood',mtError,[mbOK],0);
         end;
  finally
     FreeAndNil(XMLWriter);
     Screen.Cursor := crDefault;
  end;
end;

procedure TNIBirthsDeathsReg.UpdateRegInfo(RegType : Integer);
begin
   RegistrationTable.First;
   RegistrationTable.Edit;
   try
      if ( RegType = cRegTypeBirths ) then
         begin
            RegistrationTable.FieldByName('BirthRegCount').AsInteger := NextFileID;
            RegistrationTable.FieldByName('LastBirthRegDate').AsDateTime := Date;
         end
      else if ( RegType = cRegTypeDeaths ) then
         begin
            RegistrationTable.FieldByName('DeathRegCount').AsInteger := NextFileID;
            RegistrationTable.FieldByName('LastDeathRegDate').AsDateTime := Date;
         end
      else if ( RegType = cRegTypeStillBirth ) then
         begin
            RegistrationTable.FieldByName('StillBirthRegCount').AsInteger := NextFileID;
            RegistrationTable.FieldByName('LastStillBirthRegDate').AsDateTime := Date;
         end;
      RegistrationTable.Post;
   except
      RegistrationTable.Cancel;
      MessageDlg('Failed to update batch registration details - contact Kingswood',mtError,[mbOK],0);
   end;
end;

procedure TNIBirthsDeathsReg.InsertErrorRecord(const AnimalID: Integer;
  const ErrorStr: string);
begin
   with RegErrorTable do
      begin
         Append;
         try
            FieldByName('AnimalID').AsInteger := AnimalID;
            FieldByName('ErrorDesc').AsString := ErrorStr;
            Post;
         except
            Cancel;
         end;
      end;
end;

procedure TNIBirthsDeathsReg.AnimalGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if ( AnimalGrid.DataSource.Dataset.FindField('RegisterOnFile') <> nil ) then
      begin
         if not ( AnimalGrid.DataSource.Dataset.FieldByName('RegisterOnFile').AsBoolean ) then
            AFont.Color := clRed;
      end;

   if AnimalGrid.DataSource.DataSet.RecNo mod 2 = 1 then
      Background := $00FFDDDD
   else
      Background := clwindow;
end;

procedure TNIBirthsDeathsReg.AnimalGridDblClick(Sender: TObject);
var
   ShowErrorForm : Boolean;
begin
   if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
       ShowErrorForm := RegErrorTable.Locate('AnimalID', BirthTable.FieldByName('AnimalID').AsInteger,[])
   else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
       ShowErrorForm := RegErrorTable.Locate('AnimalID', DeathTable.FieldByName('AnimalID').AsInteger,[])
   else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBirth ) then
       ShowErrorForm := RegErrorTable.Locate('AnimalID', StillBirthTable.FieldByName('AnimalID').AsInteger,[])
   else
      Exit;

   if ShowErrorForm then
      with TNIBirthsDeathsRegError.Create(nil) do
         try
            ShowModal;
         finally
            Free;
         end;

end;

procedure TNIBirthsDeathsReg.RegTableAfterScroll(DataSet: TDataSet);
begin
   if Dataset.RecordCount > 0 then
      begin
         if ( Dataset.FindField('RegisterOnFile') <> nil ) then
            begin
               pErrors.Visible := not(Dataset.FindField('RegisterOnFile').AsBoolean);
               Splitter.Visible := pErrors.Visible;
               ImageTimer.Enabled := pErrors.Visible;
               ErrorGrid.DataSource.DataSet.First;
            end
         else
            begin
               pErrors.Visible := False;
               Splitter.Visible := False;
            end;
         Update;
      end;
end;

procedure TNIBirthsDeathsReg.sbReloadClick(Sender: TObject);
begin
   if MessageDlg('Load all animals, are you sure?', mtConfirmation, [mbYes,mbNo],0) = idYes then
      LoadAll;
end;

procedure TNIBirthsDeathsReg.RemovePermanently1Click(Sender: TObject);
begin
   if MessageDlg('Are you sure?', mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
             RegisterBirths(False, False)
         else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
             RegisterDeaths(False)
         else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBirth ) then
             RegisterBirths(False, True);
      end;
end;

function TNIBirthsDeathsReg.FileAnimalCount(TableName: String): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := 'kingswd';
         SQL.Clear;
         SQL.Add(Format('SELECT COUNT(ID) RecCount FROM %s WHERE RegisterOnFile = TRUE', [TableName]));
         Open;
         try
            First;
            Result := FieldByName('RecCount').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TNIBirthsDeathsReg.sbCreateXMLFileClick(Sender: TObject);
begin
   CreateFileAndReg( RegistrationPages.ActivePageIndex );
end;

function TNIBirthsDeathsReg.RegisterBirths(const RegisterAll, StillBirth : Boolean) : Boolean;
var
   ThisTable : TTable;

  procedure RegisterCalf;
  var
     FieldToModify : string;
  begin
     FieldToModify := '';
     with LookupCalvings do
        begin
           if Locate('EventID', ThisTable.FieldByName('EventID').AsInteger, []) then
              begin
                 if ( FieldByName('ID1').AsInteger = ThisTable.FieldByName('AnimalID').AsInteger ) then
                    FieldToModify := 'ID1Notified'
                 else if ( FieldByName('ID2').AsInteger = ThisTable.FieldByName('AnimalID').AsInteger ) then
                    FieldToModify := 'ID2Notified'
                 else if ( FieldByName('ID3').AsInteger = ThisTable.FieldByName('AnimalID').AsInteger ) then
                    FieldToModify := 'ID1Notified'
                 else if ( FieldByName('ID4').AsInteger = ThisTable.FieldByName('AnimalID').AsInteger ) then
                    FieldToModify := 'ID1Notified';

                 if ( FieldToModify <> '' ) then
                    begin
                       Edit;
                       try
                          FieldByName(FieldToModify).AsBoolean := TRUE;
                          Post;
                       except
                          Cancel;
                       end;
                    end;
              end;
           ThisTable.Delete;
        end;
  end;
var
  i : integer;
begin
   Result := False;
   LookupCalvings.Database.StartTransaction;
   try
      if StillBirth then
         ThisTable := StillBirthTable
      else
         ThisTable := BirthTable;
      ThisTable.DisableControls;
      try
          if not ( RegisterAll ) then
             begin
                if AnimalGrid.SelectedRows.Count > 0 then    // register all selected records.
                   begin
                      for i := 0 to AnimalGrid.SelectedRows.Count -1 do
                         begin
                           if AnimalGrid.SelectedRows[I] <> '' then
                              begin
                                 if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                                    begin
                                       AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                                       RegisterCalf;
                                    end;
                              end;
                         end;
                   end
                else
                   RegisterCalf; // register current record.
             end
          else
             begin
                ThisTable.First;
                while not ThisTable.eof do
                   begin
                      if ( ThisTable.FieldByName('RegisterOnFile').AsBoolean ) then
                         RegisterCalf;
                      ThisTable.Next;
                   end;
             end
      finally
         ThisTable.Refresh;
         ThisTable.EnableControls;
      end;

      if LookupCalvings.UpdatesPending then
         begin
            LookupCalvings.ApplyUpdates;
            LookupCalvings.Database.Commit;
            LookupCalvings.CommitUpdates;
            Result := True;
         end
      else
         begin
            MessageDlg('No records have been updated',mtInformation,[mbOk],0);
            Abort;
         end;
   except
      on E : Exception do
         begin
            LookupCalvings.Database.RollBack;
            raise Exception.Create(E.Message);
         end;
   end;
end;

function TNIBirthsDeathsReg.RegisterDeaths(const RegisterAll: Boolean) : Boolean;

  procedure RegisterDeath;
  begin
     with LookupSalesDeaths do
        begin
           if Locate('EventID', DeathTable.FieldByName('EventID').AsInteger, []) then
              begin
                 Edit;
                 try
                    FieldByName('NIDeathNotify').AsBoolean := TRUE;
                    Post;
                 except
                    Cancel;
                 end;
                 DeathTable.Delete;
              end;
        end;
  end;
var
   i : Integer;
begin
   Result := False;
   WinData.KingData.StartTransaction;
   try
      DeathTable.DisableControls;
      try
          if not ( RegisterAll ) then
             begin
                if AnimalGrid.SelectedRows.Count > 0 then    // register all selected records.
                   begin
                      for i := 0 to AnimalGrid.SelectedRows.Count -1 do
                         begin
                           if AnimalGrid.SelectedRows[I] <> '' then
                              begin
                                 if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                                    begin
                                       AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                                       RegisterDeath;
                                    end;
                              end;
                         end;
                   end
                else
                   RegisterDeath; // register current record.
             end
          else
             begin
                DeathTable.First;
                while not DeathTable.eof do
                   begin
                      if ( DeathTable.FieldByName('RegisterOnFile').AsBoolean ) then
                         RegisterDeath;
                      DeathTable.Next;
                   end;
             end;
      finally
         DeathTable.Refresh;
         DeathTable.EnableControls;
      end;

      if LookupSalesDeaths.UpdatesPending then
         begin
            LookupSalesDeaths.ApplyUpdates;
            LookupSalesDeaths.Database.Commit;
            LookupSalesDeaths.CommitUpdates;
            Result := True;
         end
      else
         begin
            MessageDlg('No records have been updated',mtInformation,[mbOk],0);
            Abort;
         end;
   except
      on E : Exception do
         begin
            LookupSalesDeaths.Database.RollBack;
            raise Exception.Create(E.Message);
         end;
   end;
end;

procedure TNIBirthsDeathsReg.AnimalGridTitleClick(Column: TColumnEh);
var
   SortDirection : Char;
begin
   if Column.Title.SortMarker = smDownEh then
      SortDirection := 'd'
   else
      SortDirection := 'i';

   if ( TTable(AnimalGrid.DataSource.DataSet).IndexDefs.IndexOf(SortDirection + Column.Field.FieldName) > -1 ) then
      TTable(AnimalGrid.DataSource.DataSet).IndexName := SortDirection + Column.Field.FieldName;

   if Column.Title.SortMarker = smDownEh then
      Column.Title.SortMarker := smUpEh
   else
      Column.Title.SortMarker := smDownEh;
end;

procedure TNIBirthsDeathsReg.GotoAPHISOnline1Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open', 'https://www.ruralni.gov.uk/profile/login.asp', nil, nil, SW_SHOWNORMAL);
end;

procedure TNIBirthsDeathsReg.ShowXMLFiles1Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open', nil, nil, PChar(ExtractFilePath(ParamStr(0)) + sRegFileDir), SW_SHOWNORMAL);
end;

procedure TNIBirthsDeathsReg.sbRemoveClick(Sender: TObject);
var
  i : integer;
begin
   if AnimalGrid.SelectedRows.Count <= 0 then
      MessageDlg('No Animals are selected.',mtInformation,[mbOK],0)
   else
      for i := 0 to AnimalGrid.SelectedRows.Count -1 do
         begin
           if AnimalGrid.SelectedRows[I] <> '' then
              begin
                 if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                    begin
                       AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                       AnimalGrid.DataSource.DataSet.Delete;
                    end;
              end;
         end;
end;

procedure TNIBirthsDeathsReg.Remove1Click(Sender: TObject);
begin
   sbRemoveClick(nil);
end;

procedure TNIBirthsDeathsReg.ImageTimerTimer(Sender: TObject);
begin
   Image1.Visible := not Image1.Visible;
end;

procedure TNIBirthsDeathsReg.RegTableAfterDelete(DataSet: TDataSet);
begin
   UpdateStatus;
end;

end.