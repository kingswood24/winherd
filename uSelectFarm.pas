unit uSelectFarm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup, Db, DBTables;

type
  TfmSelectFarm = class(TForm)
    FarmCombo: TRxDBLookupCombo;
    Button1: TButton;
    Button2: TButton;
    QueryFarms: TQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    procedure FarmComboCloseUp(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    UserFarmID : Integer;
  public
    { Public declarations }

  end;

  function CreateAndShow : Integer;

var
  fmSelectFarm: TfmSelectFarm;

implementation
uses
   DairyData;

{$R *.DFM}

   function CreateAndShow : Integer;
   begin
      try
         Application.CreateForm(TfmSelectFarm, fmSelectFarm);
         with fmSelectFarm do
            begin
               UserFarmID := 0;
               if ShowModal = mrOK then
                  Result := UserFarmID
               else
                  Result := -1;
            end;
      finally
         FreeAndNil(fmSelectFarm);
      end;
   end;

procedure TfmSelectFarm.FarmComboCloseUp(Sender: TObject);
begin
   try
      UserFarmID := StrToInt(FarmCombo.Value);
   except
      UserFarmID := 0;
   end;

end;

procedure TfmSelectFarm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := (((ModalResult = mrok) and ( UserFarmID > -1)) or (ModalResult = mrCancel))
end;

procedure TfmSelectFarm.FormCreate(Sender: TObject);
begin
   QueryFarms.Active := True;
end;

procedure TfmSelectFarm.FormDestroy(Sender: TObject);
begin
   QueryFarms.Active := False;

end;

end.
