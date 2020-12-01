unit uTescoEventExport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar;

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
  private
    { Private declarations }
     FHerdID : Integer;
     function GetNoneHerdID: Integer;
    function GetUserDefaultHerdID: Integer;
  protected
     FBooleanResult : Boolean;
     FIntegerResult : Integer;
     procedure SetScreenLookAndFeel;
     property NoneHerdID : Integer read GetNoneHerdID;
     property UserDefaultHerdID : Integer read GetUserDefaultHerdID;
  public
    { Public declarations }
    class procedure execute(ABaseFormClass : TBaseFormClass);overload;
    class procedure execute(ABaseFormClass : TBaseFormClass; var ABoolResult : Boolean);overload;
    class procedure execute(ABaseFormClass : TBaseFormClass; var AIntResult : Integer);overload;
  end;

const
   cQuoteStr = '"';
var
  fmTescoEventExport: TfmTescoEventExport;

implementation

uses DairyData, uImageStore, uWinOS;

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
   SetScreenLookAndFeel;
   ImageStore := TImageStore.Create(nil);
   FBooleanResult := False;
   FIntegerResult := 0;
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
   Result := WinData.NONEHerdID;
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
{
class function TfmBaseForm.create(AAnimalID: Integer;
  ABaseFormClass: TBaseFormClass): boolean;
begin

   with AEventFormClass.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;   }

function TfmBaseForm.GetUserDefaultHerdID: Integer;
begin
   Result := WinData.UserDefaultHerdID;
end;

end.
