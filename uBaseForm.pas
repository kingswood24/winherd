unit uBaseForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar, db, dbTables;

type
  TBaseFormClass = class of TfmBaseForm;
  TfmBaseForm = class(TForm)
    ActionList: TActionList;
    actClose: TAction;
    actHelp: TAction;
    StatusBar: TdxStatusBar;
    BarManager: TdxBarManager;
    bClose: TdxBarLargeButton;
    bHelp: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     FHerdID : Integer;
     function GetNoneHerdID: Integer;
     function GetUserDefaultHerdID: Integer;
    function GetUserDefaultHerdIdentifier: string;
  protected
     FFormShowing : Boolean;
     FBooleanResult : Boolean;
     FIntegerResult : Integer;
     procedure SetScreenLookAndFeel;
     property NoneHerdID : Integer read GetNoneHerdID;
     property UserDefaultHerdID : Integer read GetUserDefaultHerdID;
     property UserDefaultHerdIdentifier : string read GetUserDefaultHerdIdentifier;
  public
     { Public declarations }
     class procedure execute(ABaseFormClass : TBaseFormClass);overload;
     class procedure execute(ABaseFormClass : TBaseFormClass; var ABoolResult : Boolean);overload;
     class procedure execute(ABaseFormClass : TBaseFormClass; var AIntResult : Integer);overload;
  end;

const
   cQuoteStr = '"';
   cAliasName = 'Kingswd';

var
  fmBaseForm: TfmBaseForm;

implementation

uses
   uImageStore, uWinOS;

{$R *.DFM}

{ TfmBaseForm }

procedure TfmBaseForm.SetScreenLookAndFeel;
begin
   if uWinOS.WindowsOS = winXP then
      begin
      end;
end;

procedure TfmBaseForm.FormCreate(Sender: TObject);
begin
   FFormShowing := False;
   SetScreenLookAndFeel;
   ImageStore := TImageStore.Create(nil);
   FBooleanResult := False;
   FIntegerResult := 0;
   FHerdID := 0;
end;

procedure TfmBaseForm.actCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmBaseForm.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ImageStore);
end;

class procedure TfmBaseForm.execute(ABaseFormClass: TBaseFormClass);
begin
   with ABaseFormClass.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

function TfmBaseForm.GetNoneHerdID: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := cAliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE Upper(HerdIdentity) = "NONE"');
         try
            Open;
            Result := Fields[0].AsInteger;
            if ( Result = 0 ) then
               begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO Owners (HerdIdentity, UserCanDelete)');
                  SQL.Add('VALUES "NONE", False');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

class procedure TfmBaseForm.execute(ABaseFormClass : TBaseFormClass;
   var ABoolResult : Boolean);
begin
   with ABaseFormClass.Create(nil) do
      try
         ShowModal;
      finally
         ABoolResult := FBooleanResult;
         Free;
      end;
end;

class procedure TfmBaseForm.execute(ABaseFormClass: TBaseFormClass;
  var AIntResult: Integer);
begin
   with ABaseFormClass.Create(nil) do
      try
         ShowModal;
      finally
         AIntResult := FIntegerResult;
         Free;
      end;
end;

function TfmBaseForm.GetUserDefaultHerdID: Integer;
begin
   if ( FHerdID > 0 ) then
      begin
         Result := FHerdID;
         Exit;
      end;
      
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := cAliasName;
         SQL.Clear;
         SQL.Add('SELECT DefaultHerdID');
         SQL.Add('FROM Defaults');
         Open;
         Result := Fields[0].AsInteger;
         if ( Result = 0 ) then
            begin
               SQL.Clear;
               SQL.Add('SELECT ID');
               SQL.Add('FROM Owners');
               SQL.Add('WHERE ID <> '+IntToStr(NoneHerdID)+'');
               Open;
               First;
               if ( Fields[0].AsInteger > 0 ) then
                  Result := Fields[0].AsInteger;
            end;
      finally
         Close;
         Free;
         FHerdID := Result;
      end;
end;

function TfmBaseForm.GetUserDefaultHerdIdentifier: string;
begin
   if ( UserDefaultHerdID = 0 ) or ( UserDefaultHerdID = NoneHerdID ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := cAliasName;
         SQL.Clear;
         SQL.Add('SELECT HerdIdentifier');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE ID = '+IntToStr(UserDefaultHerdID)+'');
         try
            Open;
            if ( Length(Fields[0].AsString) > 0 ) then
               Result := Fields[0].AsString;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmBaseForm.FormShow(Sender: TObject);
begin
   FFormShowing := True;
end;

end.
