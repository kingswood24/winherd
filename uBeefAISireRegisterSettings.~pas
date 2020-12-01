{
   02/12/15 [V5.5 R1.4] /MK Additional Feature - CheckDBSaved - Added Maternal Index field.

   08/01/18 [V5.7 R7.4] /MK Change - When MemData was saving DB file, SaveToBinaryFile, this DB kept appearing in Table Repair as corrupted.
                                     The reason for this, I assume, was that the file size was 1MB version a 4MB standard file size. 
}

unit uBeefAISireRegisterSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxContainer, cxEdit, cxGroupBox, dxBar, dxBarExtItems,
  ActnList, cxControls, dxStatusBar, cxStyles, cxGridCustomTableView,
  cxGridTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, Db,
  cxGridDBTableView, dxmdaset, dbTables, GenTypesConst;

type
  TfmBeefAISireRegisterSettings = class(TfmBaseForm)
    cxGroupBox1: TcxGroupBox;
    BeefAISireXYValueGridLevel: TcxGridLevel;
    BeefAISireXYValueGrid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    MemData: TdxMemData;
    MemDataItem: TStringField;
    MemDataData: TIntegerField;
    BeefAISireXYValueGridDBTableView: TcxGridDBTableView;
    BeefAISireXYValueGridDBTableViewItem: TcxGridDBColumn;
    dsMemData: TDataSource;
    BeefAISireXYValueGridDBTableViewData: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDBFileName : string;
    SettingsTable : TTable;
    procedure CheckDBSaved;
  public
    { Public declarations }
    class procedure Load;
  end;

var
  fmBeefAISireRegisterSettings: TfmBeefAISireRegisterSettings;

implementation

uses
  KRoutines, uImageStore;

{$R *.DFM}

class procedure TfmBeefAISireRegisterSettings.Load;
begin
   with TfmBeefAISireRegisterSettings.Create(nil) do
      try
         ShowHint := True;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmBeefAISireRegisterSettings.CheckDBSaved;
begin
   SettingsTable.Close;
   SettingsTable.Open;

   MemData.Close;
   MemData.LoadFromDataSet(SettingsTable);
   MemData.Open;
end;

procedure TfmBeefAISireRegisterSettings.FormCreate(Sender: TObject);
begin
   inherited;
   FDBFileName := IncludeTrailingBackslash( DataPath ) + 'BeefAISireSettings.db';
   SettingsTable := TTable.Create(nil);
   SettingsTable.DatabaseName := AliasName;
   SettingsTable.TableName := 'BeefAISireSettings';
   if ( not(SettingsTable.Exists) ) then
      CreateBeefAISireSettingsDB;
   CheckDBSaved;
end;

procedure TfmBeefAISireRegisterSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   if MemData.State in dsEditModes then
      MemData.Post;

   MemData.First;
   while ( not(MemData.Eof) ) do
      begin
         if ( SettingsTable.Locate('Item',MemData.FieldByName('Item').AsString,[loCaseInsensitive]) ) then
            if ( MemData.Fields[2].AsInteger <> SettingsTable.Fields[2].AsInteger ) then
               begin
                  SettingsTable.Edit;
                  SettingsTable.Fields[2].AsInteger := MemData.Fields[2].AsInteger;
                  SettingsTable.Post;
               end;

         MemData.Next;
      end;
end;

procedure TfmBeefAISireRegisterSettings.FormDestroy(Sender: TObject);
begin
   inherited;
   SettingsTable.Close;
   FreeAndNil(SettingsTable);

   MemData.Active := False;
end;

end.
