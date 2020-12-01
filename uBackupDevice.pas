unit uBackupDevice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons;

type
  TBackupDevice = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Execute : string;
  function VolumeID(DriveChar: Char): string;

var
  BackupDevice: TBackupDevice;

implementation

  function Execute : string;
  begin
     Result := '';
     with TBackupDevice.Create(nil) do
     try

        if ShowModal = mrOK then
           begin
              //if ListView1.Selected.Caption <>  -1 then
              Result := ListView1.Selected.Caption;
               //  Result := ListBox1.Items[ ListBox1.ItemIndex ];
           end;
     finally
        Free;
     end;
  end;

function VolumeID(DriveChar: Char): string;
var
  OldErrorMode: Integer;
  NotUsed, VolFlags: Cardinal;
  Buf: array [0 .. MAX_PATH] of Char; 
begin 
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    if GetVolumeInformation(PChar(DriveChar + ':\'), Buf, sizeof(Buf),
      nil, NotUsed, VolFlags, nil, 0) then
      SetString(Result, Buf, StrLen(Buf))
    else
      Result := '';
    if DriveChar < 'a' Then
      Result := AnsiUpperCaseFileName(Result)
    else
      Result := AnsiLowerCaseFileName(Result);
    Result := Format('%s',[Result]);
  finally
    SetErrorMode(OldErrorMode);
  end;
end;


{$R *.DFM}

procedure TBackupDevice.FormCreate(Sender: TObject);
var
  Drive: Char;
  DriveLetter: String[4];
  NewItem : TListItem;
  sVolID : string;
begin
  for Drive := 'B' to 'Z' do
     begin
        DriveLetter := Drive + ':\';
        if ( GetDriveType(PChar(Drive + ':\')) = DRIVE_REMOVABLE ) then
           begin
              NewItem := ListView1.Items.Add;
              NewItem.Caption := DriveLetter;
              sVolID := VolumeID(Drive);
              NewItem.SubItems.Add( sVolID );
           end;
     end;
end;

procedure TBackupDevice.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ModalResult = mrOK then
      begin
         if (ListView1.Selected=nil) then
            begin
               CanClose := False;
               MessageDlg('You must select a backup drive.',mtError,[mbOK],0);
            end;
      end;

end;

end.
