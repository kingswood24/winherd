unit uHerdSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, RXCtrls, ExtCtrls, db, dbtables;

type
  TfmHerdSelect = class(TForm)
    pHerd: TPanel;
    Label1: TLabel;
    sbSelect: TRxSpeedButton;
    HerdCombo: TDBComboBoxEh;
    procedure FormCreate(Sender: TObject);
    procedure sbSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHerdSelect: TfmHerdSelect;

implementation
uses
   DairyData, GenTypesConst, KRoutines;

{$R *.DFM}

procedure TfmHerdSelect.FormCreate(Sender: TObject);
var
   Dir : String;
   AParams,
   DataDirList : TStrings;
   i  : SmallInt;

begin
   WinData.LoadBtnImage(WinData.Images,sbSelect.Glyph,cBtnImgSave);

   Dir := '';
   AParams := TStringList.Create;
   DataDirList := TStringList.Create;
   HerdCombo.Items.BeginUpdate;
   DataDirList := GetHerdDatabases;
   HerdCombo.Items := DataDirList;
   DataDirList.Free;
   HerdCombo.Items.EndUpdate;
   try
      if HerdCombo.Items.Count > 1 then
         begin
            Session.GetAliasParams(AliasName, AParams );
            Dir := ExtractDirFromPath(Copy(AParams.Strings[0],6,255));
            HerdCombo.ItemIndex := HerdCombo.Items.IndexOf(Dir);
         end
   finally
      AParams.Free;
      DataDirList.Free;
   end;
end;

procedure TfmHerdSelect.sbSelectClick(Sender: TObject);
var
  AParams: TStringList;
begin
   AParams := TStringList.Create;
   try
      AParams.Clear;
      AParams.Add('PATH=' + ExtractFilePath(ParamStr(0))+'\'+ HerdCombo.Text);
      Session.Close;
      Session.ModifyAlias(AliasName,AParams);
      Session.SaveConfigFile;
      Session.Open;
   finally
     AParams.Free;
   end;
end;

end.
