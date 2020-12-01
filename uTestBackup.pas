unit uTestBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DynaLibU, DynaZip, DynaLibZ, ComCtrls;

type
  TForm1 = class(TForm)
    Zip: TZipFile;
    Unzip: TUnzipFile;
    Button1: TButton;
    Button2: TButton;
    Path: TEdit;
    FileName: TEdit;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    UnzipPath: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    UnzipFile1: TUnzipFile;
    ZipFile1: TZipFile;
    procedure Button1Click(Sender: TObject);
    procedure ZipMajorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure ZipMinorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure UnzipFile1MajorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure ZipFile1MajorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure ZipFile1MinorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
    procedure UnzipFile1MinorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{uses
   DairyData;
 }
{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin

   {
   WinData.KingData.CloseDataSets;
   WinData.KingData.Close;
   }

   try
      ZipFile1.lpszItemList.SetText(PChar(Path.Text));
      ZipFile1.lpszZipFile.SetText(PChar(FileName.Text));
      ZipFile1.Execute(ZIP_ADD);
   finally
//      WinData.OpenAndCheckTables;
   end;

end;

procedure TForm1.ZipMajorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar2.Position := Percent;
   Label5.Caption := szItem;
   Application.ProcessMessages;
end;

procedure TForm1.ZipMinorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar1.Position := Percent;
   Label4.Caption := szItem;
   Application.ProcessMessages;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   UnzipFile1.lpszZipFile.SetText(PChar(FileName.Text));
   UnzipFile1.lpszDestination.SetText(PChar(UnzipPath.Text));
   UnzipFile1.lpszFileSpec.SetText(PChar('*.*'));
   UnzipFile1.Execute(UNZIP_EXTRACT);
   Label6.Caption := 'Error Code: '+ IntToStr(UnzipFile1.ExecuteResult);

end;

procedure TForm1.UnzipFile1MajorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar2.Position := Percent;
   Label5.Caption := szItem;
   Application.ProcessMessages;
end;

procedure TForm1.ZipFile1MajorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar2.Position := Percent;
   Label5.Caption := szItem;
   Application.ProcessMessages;
end;

procedure TForm1.ZipFile1MinorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar1.Position := Percent;
   Label4.Caption := szItem;
   Application.ProcessMessages;
end;

procedure TForm1.UnzipFile1MinorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar1.Position := Percent;
   Label4.Caption := szItem;
   Application.ProcessMessages;

end;

end.
