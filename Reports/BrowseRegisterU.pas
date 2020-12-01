{
   16/11/11 [V5.0 R2.1] /MK Change - Do Not Allow Download Of Register If KInstaller Exists.

   09/02/12 [V5.0 R3.7] /MK Change - AnimalFileAdd - If Animal Found Update Name If Name Is Null.

   12/03/13 [V5.1 R5.2] /MK Bug Fix - AnimalFileAdd - Not updating Breeding or AnimalDeleted in AnimalFileByID.
                                                    - Not adding recording to BullSemenStk if not found.

   15/09/15 [V5.4 R8.5] /MK Additional Feature - Increased width of AICode field in grid to allow instant view of new 6 char length.

   24/05/16 [V5.5 R5.6] /MK Bug Fix - AnimalFileAdd - Source field was not in the Sire's table. Can't tell when this field was removed.

   12/02/18 [V5.7 R8.1] /MK Bug Fix - Changed the way the bull is added to the database, now using EventRecording unit and SQL instead of AnimalFileByID - SP/GL request.

   03/07/18 [V5.8 R0.6] /MK Bug Fix - When searching only by the Name the wrong bull was being picked up.
                                    - ResetSireQuery - New procedure added to change the Sires.SQL back to default text and clear the filter on Sires.
                            Additional Feature - If the user presses the enter key in the Code or Name box then search for the bull - John (Kingswood).

   04/07/18 [V5.8 R0.6] /MK Bug Fix - AddSire - Update the AnimalDeleted field to False if the SireID exists.

   04/12/18 [V5.8 R5.7] /MK Change - AddSire - When adding an animal bring down the Herd Book Number.
                                             - When updating an existing animal bring down the name and herd book number - Hugh Dwyer reported.
}

unit BrowseRegisterU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, DBIndex, Db, DBTables, ComCtrls, Buttons,
  ExtCtrls, Grids, DBGrids, RXLookup, RXDBCtrl, RXCtrls, ToolWin, RXSplit,
  kwDBNavigator, KRoutines, EventRecording;

type
  TBrowseSireRegister = class(TForm)
    BrowseTabs: TPageControl;
    tsIdentification: TTabSheet;
    tsProgeny: TTabSheet;
    tsLinear: TTabSheet;
    gbSireDetails: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    gbProgeny: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    gbGeneral: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label42: TLabel;
    gbProofs: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label50: TLabel;
    Label48: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    gbDimensions: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    gbUdder: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    Label19: TLabel;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Country: TTable;
    Source: TTable;
    LookUpBullExt: TTable;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    sbAdd: TRxSpeedButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    StatusBar: TStatusBar;
    gSearch: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    Label9: TLabel;
    sAICode: TEdit;
    Label18: TLabel;
    sName: TEdit;
    sbFilters: TSpeedButton;
    ToolButton2: TToolButton;
    Sires: TQuery;
    dsSires: TDataSource;
    sbClear: TSpeedButton;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit48: TDBEdit;
    Label5: TLabel;
    DBEdit49: TDBEdit;
    Label6: TLabel;
    DBEdit50: TDBEdit;
    Label7: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit53: TDBEdit;
    Label27: TLabel;
    DBEdit20: TDBEdit;
    Label28: TLabel;
    DBEdit33: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    Label32: TLabel;
    SireRegUpDDate: TLabel;
    qSireSearch: TQuery;
    qSearch: TQuery;
    RxSpeedButton1: TRxSpeedButton;
    QuerySireDetails: TQuery;
    Panel2: TPanel;
    DBNavigator2: TKwDBNavigator;
    ToolButton5: TToolButton;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure BrowseTabsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sFilterClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure gSearchTitleClick(Column: TColumn);
    procedure sbClearClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
  private
    function GetSortByField: String;
    procedure SetSortByField(const Value: String);
    procedure AddSire;
    procedure ResetSireQuery;
  private
    { Private declarations }
    OrderBy,
    LastOrderBy,
    LastSortByField : String;
    procedure AnimalFileAdd;
    function GetHolsteinBreed : Integer;
    procedure PartialSearch;
    property SortByField : String read GetSortByField write SetSortByField;
    procedure OpenSires(SortBy:String);
    function GetSireBreed : Integer;
  public
    { Public declarations }
    property HolsteinBreed : Integer read GetHolsteinBreed;
  end;

var
  BrowseSireRegister: TBrowseSireRegister;

implementation
uses
    DairyData, MenuUnit, uCallToExternalProgram, uHerdLookup, SQLHelper,
  GenTypesConst;
{$R *.DFM}

function TBrowseSireRegister.GetHolsteinBreed : Integer;
begin
    RESULT := 0;
    try
       if WinData.Breeds.Locate('Code','FR',[loCaseInsensitive] ) then
          RESULT := WinData.Breeds.FieldByName('ID').AsInteger
       else
          ShowMessage('Cannot find Holstein Breed');
    except
       ShowMessage('ERROR finding Holstein Breed');
    end;
end;

procedure TBrowseSireRegister.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TBrowseSireRegister.BrowseTabsChange(Sender: TObject);
begin
   if tsidentification.Visible Then
      StatusBar.Panels.Items[1].Text := 'Please Ensure Your Sire Register Is Kept Up To Date'
   else If tsProgeny.Visible Then
       StatusBar.Panels.Items[1].Text := 'Please Note That Calving Difficulty Indicators Are Approximate Only'
   else
       StatusBar.Panels.Items[1].Text := '';
end;

procedure TBrowseSireRegister.FormShow(Sender: TObject);
begin
   BrowseTabs.ActivePage := tsIdentification;
   StatusBar.Panels.Items[1].Text := 'Please Ensure Your Sire Register Is Kept Up To Date';
end;

procedure TBrowseSireRegister.AnimalFileAdd;
var
   AICode : String;
   DefaultHerd,
   ThisAnimalId : Integer;
   FilterChanged : Boolean;
   RBI : Double;
begin
   // Drop the Filter for the search
   try
     with WinData Do
      begin
         if ( AnimalFileById.Filtered ) then
            begin
               AnimalFileByID.Filtered := False;
               FilterChanged := True;
            end
         else
            FilterChanged := False;

         AICode := gSearch.DataSource.Dataset.FieldByName('AICode').AsString;

         QuerySireDetails.Close;
         QuerySireDetails.Params[0].AsString := UPPERCASE(AICode);
         QuerySireDetails.Open;
         if QuerySireDetails.RecordCount = 0 then
            raise Exception.CreateFmt('Cannot find AI Code "s%" in Sires.db table',[UPPERCASE(AICode)]);

         if WinData.LookUpDamSire.Locate('AnimalNo',AICode,[]) then
            begin
               if MessageDLG('Animal Already Added - Update',mtWarning,[mbYES,mbNo],0) = mrYES then
                  begin
                     if LookUpBullExt.Locate('AnimalId',WinData.LookUpDamSire.FieldByName('ID').AsInteger,[] ) then
                        LookUpBullExt.Edit
                     else
                        LookUpBullExt.Append;

                     with LookUpBullExt do
                        try
                           LookUpBullExt.FieldByName('AnimalID').Value := LookUpDamSire.FieldByName('ID').AsInteger;
                           LookUpBullExt.FieldByName('Country').Value := QuerySireDetails.FieldByName('Country').Value;

                           //   24/05/16 [V5.5 R5.6] /MK Bug Fix - Source field was not in the Sire's table. Can't tell when this field was removed.
                           //LookUpBullExt.FieldByName('Source').Value := QuerySireDetails.FieldByName('Source').Value;

                           LookUpBullExt.FieldByName('RBI').AsFloat := QuerySireDetails.FieldByName('RBI').AsFloat;
                           LookUpBullExt.FieldByName('MilkPredDiff').Value := QuerySireDetails.FieldByName('MilkPredDiff').Value;
                           LookUpBullExt.FieldByName('FatKgs').Value := QuerySireDetails.FieldByName('FatKgs').Value;
                           LookUpBullExt.FieldByName('FatPerc').Value := QuerySireDetails.FieldByName('FatPerc').Value;
                           LookUpBullExt.FieldByName('ProtKgs').Value := QuerySireDetails.FieldByName('ProtKgs').Value;
                           LookUpBullExt.FieldByName('ProtPerc').Value := QuerySireDetails.FieldByName('ProtPerc').Value;
                           LookUpBullExt.FieldByName('Reliability').Value := QuerySireDetails.FieldByName('Reliability').Value;
                           LookUpBullExt.FieldByName('CalvingDifficulty').Value := QuerySireDetails.FieldByName('CalvingDifficulty').Value;
                           Post;
                        except
                           on e : Exception do
                              ShowMessage(e.Message);
                        end;

                      with tBullSemen Do
                         begin
                            if Locate('AnimalID', LookUpDamSire.FieldByName('ID').AsInteger, []) then
                               Edit
                            else
                               Append;

                            try
                               //   12/03/13 [V5.1 R1.8] /MK Bug Fix - Not working if in Append mode.
                               if ( State = dsInsert ) then
                                  FieldByName('AnimalID').Value := LookUpDamSire.FieldByName('ID').AsInteger;
                               FieldByName('InUse').Value := True;
                               Post;
                            except
                               Cancel;
                            end;
                         end;
                    // 11/02/2009 /SP

                    //   12/03/13 [V5.1 R1.8] /MK Bug Fix - Update animal query did not include breeding or animal deleted.
                    with TQuery.Create(nil) do
                        try
                           DatabaseName := AliasName;
                           SQL.Add(InsertUPDATE('Animals', ['PrimaryBreed','Breeding','Name','AnimalDeleted'],
                                   [IntToStr(GetSireBreed),'True','"'+QuerySireDetails.FieldByName('Name').AsString+'"','False']));
                           SQL.Add(InsertWHERE(['ID'],[':ID']));
                           Params[0].AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                           ExecSQL;
                        finally
                          Close;
                          Free;
                        end;

                    {
                    WinData.LookUpDamSire.ReadOnly := False;
                    WinData.LookUpDamSire.Edit;
                    WinData.LookUpDamSire.FieldByName('').AsInteger := GetSireBreed;
                    WinData.LookUpDamSire.Post;
                    WinData.LookUpDamSire.ReadOnly := True;
                    }

                  end;
            end
         else
            begin
              // Locate the NONE HERD Owner Record
              DefaultHerd := WinData.NONEHerdID;
              With AnimalFileByID Do
                 begin
                    Append;
                    try
                       ThisAnimalID := AnimalFileByIDID.Value;
                       AnimalFileByIDAnimalNo.AsString := QuerySireDetails.FieldByName('AICODE').Value;
                       FieldByName('Name').Value := QuerySireDetails.FieldByName('Name').Value;
                       FieldByName('HerdBookNo').Value := QuerySireDetails.FieldByName('HerdBookNo').Value;
                       FieldByName('DateOfBirth').Value := QuerySireDetails.FieldByName('DOB').Value;
                       FieldByName('Sex').Value := 'Bull';
                       FieldByName('HerdID').Value := DefaultHerd;
                       FieldByName('InHerd').Value := False;
                       FieldByName('Breeding').Value := True;
                       FieldByName('PrimaryBreed').AsInteger := GetSireBreed;
                       Post;
                    except
                       Cancel;      // SP
                    end;
                 end;
              With tBullSemen Do
                 begin
                    Append;
                    try
                       FieldByName('AnimalID').Value := ThisAnimalID;
                       FieldByName('InUse').Value := True;
                    Post;
                    except
                       Cancel;
                    end;
                 end;
              With tBullExt Do
                 begin
                    Append;
                    try
                       FieldByName('AnimalID').Value := ThisAnimalID;
                       FieldByName('Country').Value := QuerySireDetails.FieldByName('Country').Value;

                       //   24/05/16 [V5.5 R5.6] /MK Bug Fix - Source field was not in the Sire's table. Can't tell when this field was removed.
                       //FieldByName('Source').Value := QuerySireDetails.FieldByName('Source').Value;

                       FieldByName('RBI').Value := QuerySireDetails.FieldByName('RBI').Value;
                       FieldByName('MilkPredDiff').Value := QuerySireDetails.FieldByName('MilkPredDiff').Value;
                       FieldByName('FatKgs').Value := QuerySireDetails.FieldByName('FatKgs').Value;
                       FieldByName('FatPerc').Value := QuerySireDetails.FieldByName('FatPerc').Value;
                       FieldByName('ProtKgs').Value := QuerySireDetails.FieldByName('ProtKgs').Value;
                       FieldByName('ProtPerc').Value := QuerySireDetails.FieldByName('ProtPerc').Value;
                       FieldByName('Reliability').Value := QuerySireDetails.FieldByName('Reliability').Value;
                       FieldByName('CalvingDifficulty').Value := QuerySireDetails.FieldByName('CalvingDifficulty').Value;
                       Post;
                    except
                       Cancel;
                    end;
                 end;
              MessageDLG('Selected Animal successfully added.',mtinformation,[mbok],0);
            end;
      end;
   finally
      if FilterChanged then
         WinData.AnimalFileByID.Filtered := True;
   end;
end;

procedure TBrowseSireRegister.AddBtnClick(Sender: TObject);
begin
   //AnimalFileAdd;
   AddSire;
end;

procedure TBrowseSireRegister.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     LookUpBullExt.Close;
     Country.Close;
     Source.Close;
     Sires.Close;         // added 3/4/00 - kr
     QuerySireDetails.Close;
end;

procedure TBrowseSireRegister.FormCreate(Sender: TObject);
begin
   OrderBy := 'Asc';
   LastSortByField := 'AICode';
   SortByField := '';
   Country.Open;
   Source.Open;
   Sires.open;          // added 3/4/00 - kr
end;

procedure TBrowseSireRegister.FormActivate(Sender: TObject);
begin
   //   16/11/11 [V5.0 R2.1] /MK Change - Do Not Allow Download Of Register If KInstaller Exists.
   RxSpeedButton1.Visible := not FileExists(ApplicationPath + cKInstallerProgram);
   ToolButton5.Visible := RxSpeedButton1.Visible;
   LookUpBullExt.Open;
   Sires.Filter := '';
   Sires.Filtered := False;
end;

procedure TBrowseSireRegister.sFilterClick(Sender: TObject);
var
   AICodesToLookFor : String;
begin
   ResetSireQuery;

   if ( Length(sAICode.Text) > 0 ) And ( Length(sName.Text) > 0 ) then
      begin
         Sires.Filter := 'NAME = '  + '''' + '*' + SName.Text + '*' + '''' ;
         Sires.Filter := 'AICODE = ' + '''' + SAICode.Text + '*' + '''' +
                                 'AND Name = ' + '''' + SName.Text + '*' + '''' ;
         Sires.FilterOptions := [foCaseInsensitive];
         Sires.Filtered := True;
      end
   else if Length(sAICode.Text) > 0 then
      begin
         Sires.Filter := 'AICODE = ' + '''' + SAICode.Text + '*' + '''';
         Sires.FilterOptions := [foCaseInsensitive];
         Sires.Filtered := True;
      end
   else if Length(sName.Text) > 0 then
      begin
          Sires.Close;
          Sires.SQL.Clear;
          Sires.SQL.Add('SELECT *');
          Sires.SQL.Add('FROM Sires');
          Sires.SQL.Add('WHERE Name LIKE "%'+sName.Text+'%"');
          Sires.SQL.Add('ORDER BY AICODE');
          Sires.Open;
      end
   else
      begin
         Sires.Filter := '';
         Sires.Filtered := False;
      end;
end;

procedure TBrowseSireRegister.PartialSearch;
Begin
end;


procedure TBrowseSireRegister.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('browsireregrpt.htm');
end;

procedure TBrowseSireRegister.gSearchTitleClick(Column: TColumn);
begin
   SortByField := Column.Field.FieldName;
end;

function TBrowseSireRegister.GetSortByField: String;
begin
    RESULT := LastSortByField;
end;

procedure TBrowseSireRegister.SetSortByField(const Value: String);
var i : Integer;
begin
    if Value <> LastSortByField then
       begin
          LastSortByField := Value;
          OpenSires ( LastSortByField );
       end
    else // Change the Sort Order
       begin
          if OrderBy = 'Asc' then
             OrderBy := 'Desc'
          else
             OrderBy := 'Asc';
          OpenSires ( LastSortByField );
       end;

    for i := 0 to gSearch.Columns.Count-1 do
       if ( LastSortByField = gSearch.Columns[i].Field.FieldName ) then
          begin
             gSearch.Columns[i].Title.Font.Color := clRed;
             gSearch.Columns[i].Title.Font.Style := [fsBold];
          end
       else
          begin
             gSearch.Columns[i].Title.Font.Color := clBlack;
             gSearch.Columns[i].Title.Font.Style := [];
          end;
end;

procedure TBrowseSireRegister.OpenSires(SortBy: String);
begin
   with Sires do
      begin
         SQL.Clear;
         SQL.Add('SELECT * FROM Sires');
         if SortBy = '' then
            SQL.Add('ORDER BY AICode ' + OrderBy)
         else
            SQL.Add('ORDER BY ' + SortBy + ' ' + OrderBy );
         Open;
     end;
end;

procedure TBrowseSireRegister.sbClearClick(Sender: TObject);
begin
   ResetSireQuery;
   sAICode.Text := '';
   sName.Text := '';
   gSearch.DataSource.DataSet := Sires;
end;

procedure TBrowseSireRegister.RxSpeedButton1Click(Sender: TObject);
begin
   Sires.Close;
   WinData.Sires.Close;
   try
      WinData.CallProg.Download(SiresDB);
   finally
      WinData.Sires.Open;
      Sires.Open;
   end;
end;

function TBrowseSireRegister.GetSireBreed: Integer;
var
   BreedCode : string;
   BreedID : Integer;
begin
   Result := HolsteinBreed;
   try
      BreedCode := QuerySireDetails.FieldByName('BreedCode').AsString; //
      if BreedCode <> '' then
         begin
            BreedID := HerdLookup.BreedIDByCode(BreedCode);
            if (BreedID > 0 ) then
               Result := BreedID;
         end;
   except
   end;
end;

procedure TBrowseSireRegister.AddSire;
var
   AISire : TAnimalRecord;
   bFound : Boolean;
   AnimalID : Integer;
   Name, HerdBookNo, AICode, Breed : String;
   SireQuery : TQuery;
   EBI, MilkPredDiff, FatKgs, FatPerc, ProtKgs, ProtPerc,
   Reliability, CalvingDifficulty : Double;

   function AnimalInUse(const AAICode, AName: String): Integer;
   begin
      Result := 0;
      if ( Length(AAICode) = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add( InsertSELECT(['ID']));
            SQL.Add( InsertFROM(['Animals']));
            SQL.Add( InsertWHERE(['AnimalNo'],[':AnimalNo']));
            SQL.Add( InsertOR(['UPPER(Name)'],[':Name']));
            Params[0].AsString := AAICode;
            Params[1].AsString := UPPERCASE(AName);
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

   function SireExtRecCreated ( ABullID : Integer; AEBI, AMilk, AFatKgs,
      AFatPerc, AProtKgs, AProtPerc, ARel, ACalvDif : Double) : Boolean;
   begin
      Result := False;
      if ( ABullID = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('INSERT INTO BullExt (AnimalID, RBI, MilkPredDiff, FatKgs, FatPerc, ProtKgs, ProtPerc, Reliability, CalvingDifficulty)');
            SQL.Add('VALUES (:AnimalID, :EBI, :MilkPredDiff, :FatKgs, :FatPerc, :ProtKgs, :ProtPerc, :Reliability, :CalvingDifficulty)');
            Params[0].AsInteger := ABullID;
            Params[1].AsFloat := AEBI;
            Params[2].AsFloat := AMilk;
            Params[3].AsFloat := AFatKgs;
            Params[4].AsFloat := AFatPerc;
            Params[5].AsFloat := AProtKgs;
            Params[6].AsFloat := AProtPerc;
            Params[7].AsFloat := ARel;
            Params[8].AsFloat := ACalvDif;
            ExecSQL;
            Result := True;
         finally
            Free;
         end;
   end;

begin
   inherited;
   // Add selected animal
   try
      SireQuery := TQuery.Create(nil);
      SireQuery.DatabaseName := AliasName;

      AICode := UpperCase(Sires.FieldByName('AICode').AsString);
      Name := Sires.FieldByName('Name').AsString;
      HerdBookNo := Sires.FieldByName('HerdBookNo').AsString;
      Breed := Sires.FieldByName('BreedCode').AsString;

      QuerySireDetails.Close;
      QuerySireDetails.Params[0].AsString := AICode;
      QuerySireDetails.Open;

      if ( QuerySireDetails.RecordCount = 0 ) then
         raise Exception.CreateFmt('Cannot find AI Code "s%" in Sires.db table',[AICode]);

      EBI := QuerySireDetails.FieldByName('RBI').AsFloat;
      MilkPredDiff := QuerySireDetails.FieldByName('MilkPredDiff').AsFloat;
      FatKgs := QuerySireDetails.FieldByName('FatKgs').AsFloat;
      FatPerc := QuerySireDetails.FieldByName('FatPerc').AsFloat;
      ProtKgs := QuerySireDetails.FieldByName('ProtKgs').AsFloat;
      ProtPerc := QuerySireDetails.FieldByName('ProtPerc').AsFloat;
      Reliability := QuerySireDetails.FieldByName('Reliability').AsFloat;
      CalvingDifficulty := QuerySireDetails.FieldByName('CalvingDifficulty').AsFloat;

      if MessageDlg( Format('Add Sire "%s" to your animal database?',[AICode]),mtConfirmation,[mbYes,mbNo],0) = idNo then Exit;

      AnimalID := AnimalInUse(AICode,Name);

      if ( AnimalID <= 0 ) then
         begin
            // Add animal to database
            AISire := TAnimalRecord.Create;
            AISire.CreateBullSemenStkRecord := True;
            try
               AISire.RaiseExceptions := False;

               AISire.AddToNoneHerd;
               AISire.AnimalNo := AICode;
               AISire.Name := Trim(Name);

               //   04/12/18 [V5.8 R5.7] /MK Change - When adding an animal bring down the Herd Book Number.
               AISire.HerdBookNo := Trim(HerdBookNo);

               AISire.Sex := cSex_Bull;
               AISire.LactNo := 0;
               AISire.InHerd := True;
               AISire.Breeding := True;
               AISire.DamID  := 0;
               AISire.SireID := 0;
               AISire.AnimalDeleted := False;

               // 08/01/2009 V3.9 R5.6 /SP Default Sire To Pedigree
               AISire.Pedigree := True;

               AISire.PrimaryBreedCode := Breed;
               if not AISire.Save then
                  AISire.Cancel
               else
                  begin
                     // Add BullSemenStk Record
                     if ( not(SireExtRecCreated(AISire.ID, EBI, MilkPredDiff, FatKgs, FatPerc, ProtKgs, ProtPerc, Reliability, CalvingDifficulty)) ) then
                        MessageDlg('Unable to create the sires extension table record. Contact Kingswood',mtInformation,[mbOK],0)
                     else
                        MessageDlg(cSireAddedToDB,mtInformation,[mbOK],0);
                  end;
            finally
               FreeAndNil(AISire);
            end;
         end
      else
         begin
            // update animal fields in database
            if ( MessageDlg(cSireAlreadyExists,mtConfirmation,[mbYes,mbNo],0) = idYes ) then
               begin
                  SireQuery.Close;
                  SireQuery.SQL.Clear;
                  SireQuery.SQL.Add('SELECT AnimalID FROM BullSemenStk');
                  SireQuery.SQL.Add('WHERE AnimalID = :AnimalID');
                  SireQuery.Params[0].AsInteger := AnimalID;
                  SireQuery.Open;
                  try
                     SireQuery.First;
                     bFound := SireQuery.Fields[0].AsInteger = AnimalID;
                  finally
                     SireQuery.Close;
                  end;

                  if ( not(bFound) ) then
                     begin
                        SireQuery.SQL.Clear;
                        SireQuery.SQL.Add('INSERT INTO BullSemenStk (AnimalID, InUse)');
                        SireQuery.SQL.Add('VALUES (:AnimalID, True)');
                        SireQuery.Params[0].AsInteger := AnimalID;
                        SireQuery.ExecSQL;
                     end
                  else
                     begin
                        SireQuery.SQL.Clear;
                        SireQuery.SQL.Add('UPDATE BullSemenStk');
                        SireQuery.SQL.Add('SET InUse = True');
                        SireQuery.SQL.Add('WHERE AnimalID = :AnimalID');
                        SireQuery.Params[0].AsInteger := AnimalID;
                        SireQuery.ExecSQL;
                     end;

                  SireQuery.Close;
                  SireQuery.SQL.Clear;
                  SireQuery.SQL.Add('SELECT AnimalID');
                  SireQuery.SQL.Add('FROM BullExt');
                  SireQuery.SQL.Add('WHERE AnimalID = :AnimalID');
                  SireQuery.Params[0].AsInteger := AnimalID;
                  SireQuery.Open;
                  try
                     SireQuery.First;
                     bFound := ( SireQuery.Fields[0].AsInteger = AnimalID );
                  finally
                     SireQuery.Close;
                  end;

                  if bFound then
                     begin
                        SireQuery.SQL.Clear;
                        SireQuery.SQL.Add('DELETE FROM BullExt');
                        SireQuery.SQL.Add('WHERE AnimalID = :AnimalID');
                        SireQuery.Params[0].AsInteger := AnimalID;
                        SireQuery.ExecSQL;
                     end;

                  //   04/07/18 [V5.8 R0.6] /MK Bug Fix - Update the AnimalDeleted field to False if the SireID exists.
                  //   04/12/18 [V5.8 R5.7] /MK Change - When updating an existing animal bring down the name and herd book number - Hugh Dwyer reported.
                  SireQuery.SQL.Clear;
                  SireQuery.SQL.Add('UPDATE Animals');
                  SireQuery.SQL.Add('SET AnimalDeleted = False,');
                  SireQuery.SQL.Add('    Name = :SireName,');
                  SireQuery.SQL.Add('    HerdBookNo = :HerdBook');
                  SireQuery.SQL.Add('WHERE ID = :AnimalID');
                  SireQuery.Params[0].AsString := Name;
                  SireQuery.Params[1].AsString := HerdBookNo;
                  SireQuery.Params[2].AsInteger := AnimalID;
                  SireQuery.ExecSQL;

                  if ( not(SireExtRecCreated(AnimalID, EBI, MilkPredDiff, FatKgs, FatPerc, ProtKgs, ProtPerc, Reliability, CalvingDifficulty)) ) then
                     MessageDlg('Unable to create the sires extension table record. Contact Kingswood',mtInformation,[mbOK],0);

                  MessageDlg(Format('AI Sire, %s, successfully updated.',[AICode]),mtInformation,[mbOK],0);
               end;
         end;
   finally
      if ( SireQuery <> nil ) then
         begin
            SireQuery.Close;
            FreeAndNil(SireQuery);
         end;
   end;
end;

procedure TBrowseSireRegister.ResetSireQuery;
begin
   Sires.Close;
   Sires.SQL.Clear;
   Sires.SQL.Add('SELECT *');
   Sires.SQL.Add('FROM Sires');
   Sires.SQL.Add('ORDER BY AICODE');
   Sires.Open;
   Sires.Filtered := False;
   Sires.Filter := '';
end;

end.
