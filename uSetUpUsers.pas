unit uSetUpUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, db, ComCtrls, Buttons,
  RXDBCtrl, RXCtrls, ToolWin, kwDBNavigator;

type
  TfSetUpUsers = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Name: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbSave: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    DBNavigator1: TkwDBNavigator;
    lPassword: TLabel;
    Password: TEdit;
    procedure bExitClick(Sender: TObject);
    procedure bDefaultClick(Sender: TObject);
    procedure PasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    PassAttempts : Byte;
    PasswordReq : Boolean;
  public
    { Public declarations }
    ReturnValue : String;
  end;


  procedure ShowTheForm(ShowSetup : Boolean);


const
   MaxPassAttempts = 3;

var
  fSetUpUsers: TfSetUpUsers;

implementation
uses
    DairyData, GenTypesConst, uWinOS;

{$R *.DFM}

  procedure ShowTheForm(ShowSetup : Boolean);
  begin
     try
        try
           WinData.tSysUser.Open;
           // Try and locate the Default
           WinData.tSysUser.Locate('ID',WinData.DefaultSysUser,[] );

           with TfSetUpUsers.Create(nil) do
              begin
                 WinData.LoadBtnImage(WinData.Images,sbSave.Glyph,cBtnImgSave);
                 if ShowSetup then
                    begin
                       sbSave.Caption := '&Start Program'
                    end
                 else
                    begin
                       sbSave.Caption := 'Default'
                    end;

                 if ShowSetup then
                    begin
                       PasswordReq := (WinData.HerdDBPassword <> '') and ( WindowsOS <> win95 ) and ( WindowsOS <> win98 );
                       if PasswordReq then
                          begin
                             lPassword.Show;
                             Password.Show;
                             PassAttempts := 0;
                          end;
                    end
                 else
                    PasswordReq := False;

                 ShowModal;
              end;

        except
           raise;
        end;
     finally
        WinData.tSysUser.Close;
        if fSetUpUsers <> nil then
           FreeAndNil(fSetUpUsers);
     end;
  end;

procedure TfSetUpUsers.bExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfSetUpUsers.bDefaultClick(Sender: TObject);
begin
    if WinData.tSysUser.IsEmpty then
       MessageDLG('You must have at least 1 system user',mtwarning,[mbOk],0)
    else
       begin
          if PasswordReq then
             begin
                if Password.Text <> WinData.HerdDBPassword then
                   begin
                      Inc(PassAttempts);
                      if PassAttempts = MaxPassAttempts then
                         begin
                            MessageDlg('Invalid password entered, program will now shut!', mtError, [mbOK],0);
                            WinData.KingData.CloseDataSets;
                            WinData.KingData.Close;
                            Halt(1);
                         end
                      else
                         begin
                            Password.Clear;
                            Password.SetFocus;
                            raise Exception.Create('Invalid password entered, please try again');
                         end;
                   end
             end;
          WinData.DefaultSysUser := WinData.tSysUser.FieldByName('ID').AsInteger;
          Close;
       end;
end;

procedure TfSetUpUsers.PasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_Return then
      bDefaultClick(self);
end;

end.
