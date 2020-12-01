unit uCTSWSBirthReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Db,
  DBTables, dxStatusBar, cxPC, ActnList, Menus, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxGridDBBandedTableView, StdCtrls, cxButtons;

type
  TfmCTSWSBirthReg = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ActionList1: TActionList;
    actExit: TAction;
    actLogin: TAction;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    dxStatusBar1: TdxStatusBar;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    RegBirthGridLevel: TcxGridLevel;
    RegBirthGrid: TcxGrid;
    tmpCTSBirths: TTable;
    dstmpCTSBirths: TDataSource;
    QueryDamSire: TQuery;
    GenQuery: TQuery;
    tmpCTSBirthsID: TAutoIncField;
    tmpCTSBirthsEventID: TIntegerField;
    tmpCTSBirthsAnimalID: TIntegerField;
    tmpCTSBirthsNatIDNum: TStringField;
    tmpCTSBirthsOutputNatIDNum: TStringField;
    tmpCTSBirthsSortNatIDNum: TStringField;
    tmpCTSBirthsSex: TStringField;
    tmpCTSBirthsDateOfBirth: TDateField;
    tmpCTSBirthsBreed: TStringField;
    tmpCTSBirthsEID: TStringField;
    tmpCTSBirthsOutputDamNatIDNum: TStringField;
    tmpCTSBirthsDamNatIDNum: TStringField;
    tmpCTSBirthsDamSortNatIDNum: TStringField;
    tmpCTSBirthsOutputSurrogateNatIDNum: TStringField;
    tmpCTSBirthsSurrogateNatIDNum: TStringField;
    tmpCTSBirthsSurrogateSortNatIDNum: TStringField;
    tmpCTSBirthsOutputSireNatIDNum: TStringField;
    tmpCTSBirthsSireNatIDNum: TStringField;
    tmpCTSBirthsSireSortNatIDNum: TStringField;
    tmpCTSBirthsBLoc: TStringField;
    tmpCTSBirthsBSLoc: TStringField;
    tmpCTSBirthsPLoc: TStringField;
    tmpCTSBirthsPSLoc: TStringField;
    tmpCTSBirthsIgnoreWarnings: TBooleanField;
    RegBirthGridDBBandedTableView: TcxGridDBBandedTableView;
    RegBirthGridDBBandedTableViewID: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewEventID: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewAnimalID: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewOutputNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewSortNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewSex: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewDateOfBirth: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewBreed: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewEID: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewOutputDamNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewDamNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewDamSortNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewOutputSurrogateNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewSurrogateNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewSurrogateSortNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewOutputSireNatID: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewSireNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewSireSortNatIDNum: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewBLoc: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewBSLoc: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewPLoc: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewPSLoc: TcxGridDBBandedColumn;
    RegBirthGridDBBandedTableViewIgnoreWarnings: TcxGridDBBandedColumn;
    cxButton1: TcxButton;
    RegBirthGridDBBandedTableViewSelected: TcxGridDBBandedColumn;
    tmpCTSBirthsSelected: TBooleanField;
    RegBirthGridDBBandedTableViewColumn1: TcxGridDBBandedColumn;
    QueryResults: TQuery;
    tmpCTSBirthsCTSBatchID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure RegBirthGridDBBandedTableViewColumn1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
    ThisHerdID : Integer;
    PostalLocationCode,
    BirthLocationCode : string;
    CTSBatchID : Integer;
    procedure LoadBirthsToBeRegistered();
    procedure Call_Register_Births_Request;
    procedure Test_Call_Register_Births_Request;
    procedure DisplayResults;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  fmCTSWSBirthReg: TfmCTSWSBirthReg;

implementation

uses uImageStore, DairyData, KRoutines, KDBRoutines, uCTSLoginInfo,
  GenTypesConst, uCTSRegResults, uCTSHelper;

{$R *.DFM}

{ TForm1 }

class procedure TfmCTSWSBirthReg.Execute;
begin
   with TfmCTSWSBirthReg.Create(nil) do
      try
         LoadBirthsToBeRegistered;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCTSWSBirthReg.LoadBirthsToBeRegistered;


   procedure LoadBirths;
   var
      i : byte;
   begin
      //BirthTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      tmpCTSBirths.DisableControls;

      with GenQuery do
         begin

            for i := 1 to 4 do
               begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO tmpCTSBirths ( EventID, AnimalID )');
                  case i of
                     1 : SQL.Add('SELECT EventID, ID1');
                     2 : SQL.Add('SELECT EventID, ID2');
                     3 : SQL.Add('SELECT EventID, ID3');
                     4 : SQL.Add('SELECT EventID, ID4');
                  end;
                  SQL.Add('FROM "Calvings.DB"');
                  case i of
                     1 : begin
                            SQL.Add('WHERE(ID1CTSReg=FALSE)');
                            SQL.Add('AND(ID1>0)');
                            SQL.Add('AND (CalfDead1=FALSE)');
                         end;
                     2 : begin
                            SQL.Add('WHERE(ID2CTSReg=FALSE)');
                            SQL.Add('AND(ID2>0)');
                            SQL.Add('AND (CalfDead2=FALSE)');
                         end;
                     3 : begin
                            SQL.Add('WHERE(ID3CTSReg=FALSE)');
                            SQL.Add('AND(ID3>0)');
                            SQL.Add('AND (CalfDead3=FALSE)');
                         end;
                     4 : begin
                            SQL.Add('WHERE(ID4CTSReg=FALSE)');
                            SQL.Add('AND(ID4>0)');
                            SQL.Add('AND (CalfDead4=FALSE)');
                         end;
                  end;
                  ExecSQL;

               end;

            SQL.Clear;
            SQL.Add('DELETE FROM tmpCTSBirths');
            SQL.Add('WHERE AnimalID NOT IN (SELECT ID FROM Animals WHERE (HerdID = :AHerdID))');
            Params[0].AsInteger := ThisHerdID;
            ExecSQL;

            tmpCTSBirths.Refresh;
            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortNatId, Colour, PrimaryBreed, Sex, DateOfBirth, DamID, DonorDamID, SireID, HerdID ');
            SQL.Add('FROM Animals A, tmpCTSBirths T');
            SQL.Add('WHERE (T.AnimalID=A.ID)');
            SQL.Add('ORDER BY ID ');
            Open;

            try
               First;
               while not eof do
                  begin
                     if tmpCTSBirths.Locate('AnimalID', FieldByName('ID').Value,[] ) then
                        begin
                           tmpCTSBirths.Edit;
                           try
//                              tmpCTSBirths.FieldByName('CTSBatchID').AsInteger := CTSBatchID;
                              tmpCTSBirths.FieldByName('Selected').AsBoolean := True;
                              tmpCTSBirths.FieldByName('IgnoreWarnings').AsBoolean := False;
                              tmpCTSBirths.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                              tmpCTSBirths.FieldByName('OutputNatIDNum').AsString := StripAllNomNumAlpha(FieldByName('NatIDNum').AsString);
                              tmpCTSBirths.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                              tmpCTSBirths.FieldByName('BLoc').AsString := BirthLocationCode;
                              tmpCTSBirths.FieldByName('PLoc').AsString := PostalLocationCode;
                              if FieldByName('Sex').AsString = cSex_Female then
                                 tmpCTSBirths.FieldByName('Sex').AsString := 'F'
                              else
                                 tmpCTSBirths.FieldByName('Sex').AsString := 'M';

                              tmpCTSBirths.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                              // Now try locate the calf's breed and breed code
                              if WinData.Breeds.Locate('ID',FieldByName('PrimaryBreed').Value,[] ) then
                                 tmpCTSBirths.FieldByName('Breed').AsString := UPPERCASE(WinData.Breeds.FieldByName('Code').AsString);

                              if FieldByName('DonorDamID').AsInteger > 0 then
                                 begin
                                    // Get the Gen Dam Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('DonorDamID').Value;
                                    QueryDamSire.Open;

                                    tmpCTSBirths.FieldByName('OutputDamNatIDNum').AsString := StripAllNomNumAlpha(QueryDamSire.FieldByName('NatIDNum').AsString);
                                    tmpCTSBirths.FieldByName('DamNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('DamSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;

                                    // Get the Surrogate Dam Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('DamID').Value;
                                    QueryDamSire.Open;

                                    tmpCTSBirths.FieldByName('OutputSurrogateNatIDNum').AsString := StripAllNomNumAlpha(QueryDamSire.FieldByName('NatIDNum').AsString);
                                    tmpCTSBirths.FieldByName('SurrogateNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('SurrogateSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                 end
                              else
                                 begin
                                    // Get the Gen Dam Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('DamID').Value;
                                    QueryDamSire.Open;

                                    tmpCTSBirths.FieldByName('OutputDamNatIDNum').AsString := StripAllNomNumAlpha(QueryDamSire.FieldByName('NatIDNum').AsString);
                                    tmpCTSBirths.FieldByName('DamNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('DamSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                 end;

                              if FieldByName('SireID').AsInteger > 0 then
                                 begin
                                    // Get the Sire Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('SireID').Value;
                                    QueryDamSire.Open;

                                    tmpCTSBirths.FieldByName('OutputSireNatIDNum').AsString := StripAllNomNumAlpha(QueryDamSire.FieldByName('NatIDNum').AsString);
                                    tmpCTSBirths.FieldByName('SireNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('SireSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                 end;

                              tmpCTSBirths.Post;
                           except
                              on E : EDatabaseError do
                                  begin
                                     tmpCTSBirths.Cancel;
                                     MessageDlg(Format('Failed to create animal birth record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                                  end;
                           end;
                        end;
                     Next;
                  end;
            finally
               Close;
               tmpCTSBirths.Refresh;
               tmpCTSBirths.First;
               tmpCTSBirths.EnableControls;
            end;
         end;
   end;

begin

   with tmpCTSBirths do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('CTSBatchID', ftInteger);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('OutputNatIDNum', ftString, 14);
               Add('SortNatIDNum', ftString, 20);
               Add('Sex', ftString, 6);
               Add('DateOfBirth', ftDate);
               Add('Breed', ftString, 6);
               Add('EID', ftString, 20);
               Add('OutputDamNatIDNum', ftString, 14);
               Add('DamNatIDNum', ftString, 20);
               Add('DamSortNatIDNum', ftString, 20);
               Add('OutputSurrogateNatIDNum', ftString, 14);
               Add('SurrogateNatIDNum', ftString, 20);
               Add('SurrogateSortNatIDNum', ftString, 20);
               Add('OutputSireNatIDNum', ftString, 14);
               Add('SireNatIDNum', ftString, 20);
               Add('SireSortNatIDNum', ftString, 20);
               Add('BLoc', ftString, 20);
               Add('BSLoc', ftString, 20);
               Add('PLoc', ftString, 20);
               Add('PSLoc', ftString, 20);
               Add('IgnoreWarnings', ftBoolean);
               Add('Selected', ftBoolean);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
            end;

         CreateTable;
         Open;
         LoadBirths;
      end;


end;


procedure TfmCTSWSBirthReg.FormCreate(Sender: TObject);
var
   vPostalLocationCode,
   vBirthLocationCode : Variant;
begin
   ThisHerdID := WinData.UserDefaultHerdID;
   vPostalLocationCode := Windata.OwnerFile.Lookup('ID', ThisHerdID, 'PostalLocationCode');
   if not VarIsNull(vPostalLocationCode) then
      PostalLocationCode := vPostalLocationCode;
   vBirthLocationCode := Windata.OwnerFile.Lookup('ID', ThisHerdID, 'BirthLocationCode');
   if not VarIsNull(vBirthLocationCode) then
      BirthLocationCode := vBirthLocationCode;
   ImageStore := TImageStore.Create(nil);
end;

procedure TfmCTSWSBirthReg.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmCTSWSBirthReg.actLoginExecute(Sender: TObject);
begin
   TfmCTSLoginInfo.Execute;
end;

procedure TfmCTSWSBirthReg.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ImageStore);
end;

type
   TRegister_Births_Request = function : Boolean; stdcall;
   TSetURLType = procedure(AURLTypeIndex : Integer); stdcall;

procedure TfmCTSWSBirthReg.Call_Register_Births_Request;
var
  DLLHandle : THandle;
  Register_Births_Request :TRegister_Births_Request;
  SetURLType : TSetURLType;
  CallResult : Boolean;
begin
   SetCurrentDir(ApplicationPath);
   if FileExists( IncludeTrailingBackslash(ApplicationPath)+ CTSWSDLL) then
      begin
         DLLHandle := LoadLibrary(CTSWSDLL);
         if DLLHandle <> 0 then
            begin
               try
                 @SetURLType := GetProcAddress(DLLHandle, 'SetURLType');
                 if @SetURLType <> nil then
                    SetURLType(0);
                 @Register_Births_Request := GetProcAddress(DLLHandle, 'Register_Births_Request');
                 if @Register_Births_Request <> nil then
                    CallResult := Register_Births_Request()
                 else
                    MessageDlg('Call to function '+CTSWSDLL+'.Register_Births_Request in DLL failed!',mtError,[mbOk],0);
               finally
                  FreeLibrary(DLLHandle);
               end;
            end
         else
            MessageDlg('Unable to load DLL '+CTSWSDLL,mtError,[mbOk],0);
      end
   else
      MessageDlg('DLL '+CTSWSDLL+' not found - contact Kingswood Computing',mtError,[mbOk],0);
end;

procedure TfmCTSWSBirthReg.cxButton1Click(Sender: TObject);
begin
   CTSBatchID := GetCTSBatchID(ThisHerdID);
   if CTSBatchID = 0 then
      begin
         raise Exception.Create('Invalid CTSbatchID found');
      end;
   // populate outgoing request with batchid .
   with tmpCTSBirths do
      begin
         DisableControls;
         try
            First;
            while not eof do
               begin
                  if FieldByName('Selected').AsBoolean then
                     begin
                        Edit;
                        FieldByName('CTSBatchID').AsInteger := CTSBatchID;
                        Post;
                     end;
                  Next;
               end;
         finally
            EnableControls;
         end;
      end;
  // Call_Register_Births_Request;
   Test_Call_Register_Births_Request;
end;

procedure TfmCTSWSBirthReg.Test_Call_Register_Births_Request;
var
  DLLHandle : THandle;
  Register_Births_Request :TRegister_Births_Request;
  SetURLType : TSetURLType;
  CallResult : Boolean;
begin
   SetCurrentDir(ApplicationPath);
   if FileExists( IncludeTrailingBackslash(ApplicationPath)+ CTSWSDLL) then
      begin
         DLLHandle := LoadLibrary(CTSWSDLL);
         if DLLHandle <> 0 then
            begin
               try
                 @SetURLType := GetProcAddress(DLLHandle, 'SetURLType');
                 if @SetURLType <> nil then
                    SetURLType(0);
                 @Register_Births_Request := GetProcAddress(DLLHandle, 'test_Register_Births_Request');
                 if @Register_Births_Request <> nil then
                    CallResult := Register_Births_Request()
                 else
                    MessageDlg('Call to function '+CTSWSDLL+'.Register_Births_Request in DLL failed!',mtError,[mbOk],0);

                 if CallResult then
                    begin

                       DisplayResults;



                    end
                 else
                    begin
                       //
                    end;

               finally
                  FreeLibrary(DLLHandle);
               end;
            end
         else
            MessageDlg('Unable to load DLL '+CTSWSDLL,mtError,[mbOk],0);
      end
   else
      MessageDlg('DLL '+CTSWSDLL+' not found - contact Kingswood Computing',mtError,[mbOk],0);
end;

procedure TfmCTSWSBirthReg.RegBirthGridDBBandedTableViewColumn1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   TfmCTSRegResults.DisplayBirthRejectionResults(rtBirth, tmpCTSBirths.FieldByName('AnimalID').AsInteger, CTSBatchID);
end;

procedure TfmCTSWSBirthReg.DisplayResults;
begin
    {
   with QueryResults do
      begin
         Close;
         Params[0].AsInteger := CTSBatchID;
         Open;
         try
         finally
         end;
      end;
   }
end;

end.
