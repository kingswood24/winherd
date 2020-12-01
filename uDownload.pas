unit uDownload;

interface

uses
  Windows, SysUtils, Classes, Forms, Dialogs,
  urlmon, StdCtrls, wininet, IniFiles, DynaZip, DynaLibU,
  ComCtrls, FileCtrl, ExtCtrls, Psock, NMsmtp, NMURL, NMMSG, RXCtrls,
  Controls, LMDWebBase, LMDWebConfig, LMDWebHTTPGet, LMDDownload,
  IEDownload, EmailAccountInfo;

type
  TDownloadFile = (dfSerialNoFile, dfWebUpdate, dfKHMRelease, dfFieldsReps, dfXPCDBackup, dfExternalDownload, dfNone);
  TDownload = class(TForm)
    memo1: TMemo;
    Unzip: TUnzipFile;
    ProgressBar: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lTranferRate: TLabel;
    lFileSize: TLabel;
    lEstTime: TLabel;
    Label4: TLabel;
    lElapsedTime: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel1: TBevel;
    sbCancel: TRxSpeedButton;
    Start: TTimer;
    MailSender: TNMSMTP;
    Memo2: TMemo;
    HTTPGet: TLMDWebHTTPGet;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure StartTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MailSenderHeaderIncomplete(var handled: Boolean;
      hiType: Integer);
    procedure MailSenderAuthenticationFailed(var Handled: Boolean);
    procedure MailSenderInvalidHost(var Handled: Boolean);
    procedure HTTPGetProgress(Sender: TLMDWebHTTPGet;
      Item: TLMDDownloadItem);
    procedure HTTPGetProcessed(Sender: TObject);
  private
    { Private declarations }
    CheckForSize : Byte;
    FileDownloaded : Boolean;
    HWebFile : TIniFile;
    FRVerNo,
    NewVerNo : Integer;
    CurrentDownload : TDownloadFile;
    CancelDownload : Boolean;
    RemoveHerdFromTemp : Boolean;
    FileSize : ShortString;
    procedure DownloadSerno;
    function IsUserValid : Boolean; { This checks serial num and Maintenence boolean }
    procedure DownloadWebUpdateIni;
    function CheckNewVersion(WhichProg : TDownloadFile) : Boolean;
    procedure DownloadFields;
    procedure DownloadWinHerd;
    procedure DownloadXPBackup;
    procedure CloseDataSets_Restart;
    function ExtractNewExe(WhichProg : TDownloadFile) : Boolean;
    procedure DeleteAndOpenNew;
    function InsertZeros(SerialNo : Integer) : String;
    procedure TidyUp;
    procedure DeleteIECache;
    function DownloadCancelled : Boolean;
    procedure DeleteDownloadFile(FFileName : String);
    procedure DialUpConnect;
    procedure DialUpDisconnect;
    procedure SendInfoToKingswood;
    function GetHerdDirDOSName : String;
    procedure DeleteDownloadFiles;
    procedure DownloadExternalDownloadProg;
  public
    { Public declarations }
    procedure StartDownload;
  end;

const

   { Contains existing update Number} // NOTE: Do check on start up of herd program for this file, create it if needs be.
   LocalDir      = 'C:\Kingswood Herd Management\Web\';
   { Location of stored files }
   HttpLocation  = 'http://www.kingswood.ie/';
   { Contains Valid Serial Nos of all Customers, also and Boolean indicating wether maintenence is paid }
   SerNoFileName = 'serno.snv';
   { Contains Latest Update Number}
   WebUpdFileName   = 'webupdate.ini';
   { Winherd File Name }
   ExeFileName = 'khmrelease.exe';
   { Download progress string }
   ProgressStr   = 'Download in progress';
   { Remote Herd Address }
   ExeAddress = 'http://www.kingswood.ie/download/winherd/khmrelease.exe';
   { Remote WebUpdate.Ini }
   WebUpdateAddress = 'http://www.kingswood.ie/webupdate.ini';
   { Serial Number Check File }
   SerNoFileAddress = 'http://www.kingswood.ie/serno.snv';
   { Remote FieldsReps }
   FieldsRepsPath = 'http://www.kingswood.ie/download/winherd/paddocks.exe';
   { FieldsReps file name }
   FieldsRepsExeName = 'Paddocks.exe';
   { Remote XPCDBackup  }
   CDBackupRemotePath = 'http://www.kingswood.ie/download/winherd/cdbackup.zip';
   { XP CD Backup Program }
   CDBackupName = 'cdbackup.zip';
   { External Download Program }
   ExtDownloadProgAddress = 'http://www.kingswood.ie/download/winherd/downloader.zip';
   { External Download File Name }
   ExtDownloadProgFileName = 'kDownload.zip';

var
  Download: TDownload;

implementation
uses
   uFileSize,
   Def,
   DairyData,
   GenTypesConst,
   KRoutines,
   uWinOS, UserMsgConst;

{$R *.DFM}

function TDownload.CheckNewVersion(WhichProg : TDownloadFile) : Boolean;
begin
   Result := False;
//   Memo1.Lines.Add('Checking for new version...'); { Update progress status }
   if not DownloadCancelled then
      try
         HWebFile := TIniFile.Create(LocalDir+WebUpdFileName);

         if WhichProg = dfKHMRelease then
            NewVerNo := HWebFile.ReadInteger('VerNo', 'Rel', 0)
         else if WhichProg = dfFieldsReps then
            NewVerNo := HWebFile.ReadInteger('VerNo', 'Fields', 0);

         if WhichProg = dfKHMRelease then
            Result := NewVerNo > iHerdVerNo
         else if WhichProg = dfFieldsReps then
            begin
               FRVerNo := 0;
               if ( NewVerNo > WinData.FieldsRepsVerNo ) or not(FileExists('C:\Kingswood Herd Management\'+FieldsRepsExeName)) then
                  begin
                     FRVerNo := NewVerNo;
                     Result  := True;
                  end;
            end
         else if WhichProg = dfXPCDbackup then
            Result := not FileExists('C:\Kingswood Herd Management\CDBackup.exe');
      finally
         if HWebFile <> nil then
            HWebFile.Free;
      end;
   Application.ProcessMessages;
end;

function TDownload.IsUserValid: Boolean;
var
   StrList  : TStringList;
   i : Integer;
   Str : String;
begin
   CurrentDownload := dfSerialNoFile;
   Application.ProcessMessages;
   StrList := TStringList.Create;
   try
      StrList.LoadFromFile(LocalDir+SerNoFileName);
      Str := InsertZeros(Def.Definition.dSerialNo) + ' True';
      i := StrList.IndexOf(Str);
      Result := i > -1;
      if not Result then
         Memo1.Lines.Add('Unable to retrieve file'); { Update progress status }
   finally
      if StrList <> nil then
         StrList.Free;
      DeleteDownloadFile(LocalDir+SerNoFileName);
   end;
   Application.ProcessMessages;
end;

procedure TDownload.DownloadSerno;
begin
   CurrentDownload := dfSerialNoFile;

//   IEDownload1.go(SerNoFileAddress, LocalDir+SerNoFileName);
   FileDownloaded := False;
   HTTPGet.DestinationName := SerNoFileName;
   HTTPGet.URL := SerNoFileAddress;
   HTTPGet.Process(False, True);

   while not FileDownloaded do
      Application.Processmessages;

   if not IsUserValid then
      begin
         MessageDlg(cSupportExpired,mtInformation,[mbOk],0);
         TidyUp;
         ModalResult := mrCancel;
         Abort;
      end;
   Application.ProcessMessages;

end;

procedure TDownload.DownloadWebUpdateIni;
begin
   CurrentDownload := dfWebUpdate;
//   IEDownload1.go(WebUpdateAddress, LocalDir+WebUpdFileName);
   FileDownloaded := False;
   HTTPGet.DestinationName := WebUpdFileName;
   HTTPGet.URL := WebUpdateAddress;
   HTTPGet.Process(False, True);
   while not FileDownloaded do
      Application.Processmessages;
   Application.ProcessMessages;
end;

procedure TDownload.DownloadWinHerd;
begin
   CurrentDownload := dfKHMRelease;
   if not CheckNewVersion(CurrentDownload) then
      begin
         Memo1.Lines.Add('No new Herd version detected!');
         ShowMessage('No new Herd version detected!');
         Application.ProcessMessages;
         TidyUp;
         ModalResult := mrCancel;
         Abort;
      end
   else
      begin
         Memo1.Lines.Add('Starting Herd download, please wait...');
         ProgressBar.Visible := True;
//         IEDownload1.go(ExeAddress, LocalDir+ExeFileName);

         FileDownloaded := False;
         HTTPGet.DestinationName := ExeFileName;
         HTTPGet.URL := ExeAddress;
         HTTPGet.Process(False, True);

         while not FileDownloaded do
            Application.Processmessages;

         ProgressBar.Visible := False;
         if FileExists(LocalDir + ExeFileName) and (FileDownloaded) then
            begin
               SendInfoToKingswood;
               CloseDataSets_Restart;
            end
         else
            begin
               if not CancelDownload then
                  begin
                     Memo1.Lines.Add('Unable to download the latest version, please try again.');
                     MessageDlg('Unable to download the latest Herd version.'+#13#10+
                                'Please try again later, if problem persists contact Kingswood.',mtError,[mbOk],0);
                     Close;
                  end;
            end;
       end;
   Application.ProcessMessages;
end;

procedure TDownload.DownloadFields;
begin
   CurrentDownload := dfFieldsReps;
   if not CheckNewVersion(CurrentDownload) then
      begin
         Memo1.Lines.Add('No new Fields/REPS version detected!');
         ShowMessage('No new Fields/REPS version detected!');
         Application.ProcessMessages;
      end
   else
      begin
         Memo1.Lines.Add('Starting Fields/REPS download, please wait...');
         ProgressBar.Visible := True;
//         IEDownload1.Go(FieldsRepsPath, LocalDir+FieldsRepsExeName);

   FileDownloaded := False;
   HTTPGet.DestinationName := FieldsRepsExeName;
   HTTPGet.URL := FieldsRepsPath;
   HTTPGet.Process(False, True);

   while not FileDownloaded do
      Application.Processmessages;

         ProgressBar.Visible := False;
         Application.ProcessMessages;
         if FileExists(LocalDir+FieldsRepsExeName) and (FileDownloaded) then
            begin
               if not ExtractNewExe(CurrentDownload) then
                  MessageDlg('Failure to extract new Fields/REPS version, contact Kingswood',mtError,[mbOk],0)
               else
                  Memo1.lines.Add('Fields/REPS download installed.')
            end
         else if not CancelDownload then
            begin
               MessageDlg('Unable to download the latest version Fields/REPS'+ #13#10 +
                          'Please try again later. If problem persists contact Kingswood.',mtError,[mbOk],0);
            end;
      end;
   Application.ProcessMessages;
end;

procedure TDownload.DownloadXPBackup;
begin
   CurrentDownload := dfXPCDBackup;
   if CheckNewVersion(CurrentDownload) then
      begin
         Memo1.Lines.Add('Starting CDBackup download, please wait...');
         ProgressBar.Visible := True;
//         IEDownload1.go(CDBackupRemotePath, LocalDir+CDBackupName);

   FileDownloaded := False;
   HTTPGet.DestinationName := CDBackupName;
   HTTPGet.URL := CDBackupRemotePath;
   HTTPGet.Process(False, True);

   while not FileDownloaded do
      Application.Processmessages;


         ProgressBar.Visible := False;
         if FileExists(LocalDir + CDBackupName) and (FileDownloaded) then
            begin
               if not ExtractNewExe(CurrentDownload) then
                  MessageDlg('Installation CD Backup program failed, contact Kingswood',mtError,[mbOk],0)
               else
                  Memo1.lines.Add('CD Backup program installed.')
            end
         else if not CancelDownload then
            begin
               MessageDlg('Unable to download CD Backup program.'+#13#10+
                          'Please try again later, if problem persists contact Kingswood.',mtError,[mbOk],0);
            end;
      end;
   Application.ProcessMessages;
end;

procedure TDownload.CloseDataSets_Restart;
begin
   if not DownloadCancelled then
      begin
         if not ExtractNewExe(dfKHMRelease) then
            begin
               RemoveHerdFromTemp := False;
               Memo1.Lines.Add('Installation of HERD failed');
               MessageDlg('Installation of HERD failed, contact Kingswood',mtError,[mbOk],0);
               Abort; // Cancel restart if file does not exist
            end;

         Memo1.Lines.Add('Closing program...');
         Application.ProcessMessages;
         WinData.KingData.CloseDataSets;
         WinData.KingData.Close;
         try
            TidyUp;
            DeleteAndOpenNew;
         except
            MessageDlg('Installation has failed, contact Kingswood',mtError,[mbOK],0)
         end;
      end;
end;

function TDownload.ExtractNewExe(WhichProg : TDownloadFile) : Boolean;
var
   P : array[0..50] of char;
begin
   Result := False;
   try
      { Set Extraction Params }
      if WhichProg = dfKHMRelease then
         begin
            StrPCopy(P, 'C:\Kingswood Herd Management\Web');
            Unzip.lpszDestination.SetText(P);
            Unzip.lpszZipFile.SetText('C:\Kingswood Herd Management\Web\khmrelease.exe' + #0);
            { Extract New Executable }
            Unzip.Execute(UNZIP_EXTRACT);
            if FileExists('C:\Kingswood Herd Management\Web\Winherd.exe') then
               Result := True;
         end
      else if WhichProg = dfFieldsReps then
         begin
            StrPCopy(P, 'C:\Kingswood Herd Management'); // Extract to Herd Directory, paddocks program should not be in use.
            Unzip.lpszDestination.SetText(P);
            Unzip.lpszZipFile.SetText('C:\Kingswood Herd Management\Web\Paddocks.exe' + #0);
            { Extract New Executable }
            Unzip.Execute(UNZIP_EXTRACT);
            if FileExists('C:\Kingswood Herd Management\Paddocks.exe') then
               Result := True;
         end
      else if WhichProg = dfXPCDBackup then
         begin
            StrPCopy(P, 'C:\Kingswood Herd Management'); // Extract to Herd Directory
            Unzip.lpszDestination.SetText(P);
            Unzip.lpszZipFile.SetText('C:\Kingswood Herd Management\Web\cdbackup.zip' + #0);
            { Extract New Executable }
            Unzip.Execute(UNZIP_EXTRACT);
            if FileExists('C:\Kingswood Herd Management\CDbackup.exe') then
               Result := True;
         end
      else if WhichProg = dfExternalDownload then
         begin
            StrPCopy(P, 'C:\Kingswood Herd Management'); // Extract to Herd Directory
            Unzip.lpszDestination.SetText(P);
            Unzip.lpszZipFile.SetText('C:\Kingswood Herd Management\Web\kDownload.zip' + #0);
            { Extract New Executable }
            Unzip.Execute( UNZIP_EXTRACT );
            if FileExists('C:\Kingswood Herd Management\kDownload.exe') then
               Result := True;
         end;
   except
     on E : Exception do
        Raise E.CreateFmt('FAILURE: Unable to extract %s',[ExeFileName]);
   end;
   Application.ProcessMessages;
end;

procedure TDownload.DeleteAndOpenNew;

  function GetTmpDir: string;
  var
    PC : PChar;
  begin
    PC := StrAlloc(MAX_PATH + 1);
    GetTempPath(MAX_PATH, PC);
    Result := string(PC);
    StrDispose(PC);
  end;

  function GetTmpFileName(ext: string): string;
  var
    PC: PChar;
  begin
    PC := StrAlloc(MAX_PATH + 1);
    GetTempFileName(PChar(GetTmpDir), 'uis', 0, PC);
    Result := string(PC);
    Result := ChangeFileExt(Result, ext);
    StrDispose(PC);
  end;

var
   BatchFile: TStringList;
   BatchFileName: string;
   HerdDirDOSName : String;
begin
   Memo1.Lines.Add('Attempting restart...');
   BatchFileName := GetTmpFileName('.bat');
   FileSetAttr(ParamStr(0), 0);
   BatchFile := TStringList.Create;
   HerdDirDOSName := GetHerdDirDOSName;
   with BatchFile do
      begin
         try
            { Add Strings }
            Add(':Label1');
            Add('del "'+HerdDirDOSName+'\Winherd.exe"');
            Add('if Exist "'+HerdDirDOSName+'\Winherd.exe" goto Label1');
            Add('rmdir "' + ExtractFilePath(ParamStr(0)) + '"');
            Add('Move '+HerdDirDOSName+'\Web\WinHerd.exe '+HerdDirDOSName+'\WinHerd.exe');
            Add(''+HerdDirDOSName+'\WinHerd.exe');
            Add('Del '+BatchFileName);
            { Save Strings to BatchFile }
            SaveToFile(BatchFileName);
            { Set Dir }
            ChDir(GetTmpDir);
            { Inform User }
            MessageDlg('Kingswood Herd will now close and restart with the new downloaded version.'+#13+
                       '                                                                          '+#13+
                       '                          Click OK to restart                             ',mtInformation,[mbOK],0);
            Application.ProcessMessages;
            { Run batch file, this will delete temps and restart with new version }
            WinExec(PChar(BatchFileName), SW_HIDE);
         finally
            { Free BatchFile }
            if BatchFile <> nil then
               BatchFile.Free;
         end;
         Application.Terminate;
         Application.ProcessMessages;
      end;
end;

function TDownload.InsertZeros(SerialNo: Integer): String;
var
   tmp : String;
begin
   Tmp := IntToStr(SerialNo);
   while Length(tmp) < 4 do
      Tmp := '0'+tmp;
   Result := tmp;
end;

procedure TDownload.StartDownload;
begin
   DownloadSerno;
   DownloadWebUpdateIni;
   if not DownloadCancelled then
      DownloadExternalDownloadProg;
   if not DownloadCancelled then
      if WinData.GlobalSettings.NewVersionFieldsReps then
         begin
            DownloadFields;
            WinData.FieldsRepsVerNo := NewVerNo;
         end;

   if not DownloadCancelled then
      if WindowsOS = winXP then
         DownloadXPBackup;
   if not DownloadCancelled then
      DownloadWinHerd;
end;

procedure TDownload.TidyUp;
begin
//   IEDownload1.Cancel;
   ProgressBar.Hide;
   { Delete IE Cache if successful download, assume user is using IE }
   DeleteIECache;
   DeleteDownloadFiles;
   {$IFDEF Win32}
     { Hangup }
      DialUpDisconnect;
   {$ELSE}
      MessageDlg('Active Internet connection cannot be closed',mtInformation,[mbOk],0);
   {$ENDIF}

end;

procedure TDownload.FormCreate(Sender: TObject);
var
   WebDownloadDir : String;
begin
   RemoveHerdFromTemp := True;
   FileDownloaded := False;
   Memo1.Clear;
   WebDownloadDir := ExcludeTrailingBackslash(LocalDir);
   DeleteDownloadFiles;
   if not DirectoryExists(WebDownloadDir) then
      if not CreateDir(WebDownloadDir) then
         raise Exception.CreateFmt('Unable to create directory %s, contact Kingswood', [WebDownloadDir]);
end;

function TDownload.DownloadCancelled: Boolean;
begin
   Result := CancelDownload;
end;

procedure TDownload.sbCancelClick(Sender: TObject);
begin
   if sbCancel.Caption = 'Close' then
      Close
   else if MessageDlg('Are you sure you want to cancel download?',mtConfirmation,[mbYes,mbNo],0) = idyes then
      begin
         HTTPGet.Stop;
         FileDownloaded := True;
         Memo1.Lines.Add('Download being cancelled, please wait...');
         CancelDownload := True;
         TidyUp;
         Close;
      end;
end;

procedure TDownload.StartTimer(Sender: TObject);
begin
   Start.Enabled := False;
   DialUpConnect;
   StartDownload;
end;

procedure TDownload.FormShow(Sender: TObject);
begin
   Start.Enabled := True;
end;

procedure TDownload.DeleteDownloadFile(FFileName: String);
begin
   try
      DeleteFile(FFileName);
   except
   end;
end;

procedure TDownload.DeleteDownloadFiles;
begin
   DeleteDownloadFile(LocalDir+SerNoFileName);
   DeleteDownloadFile(LocalDir+WebUpdFileName);
   if RemoveHerdFromTemp then
      DeleteDownloadFile(LocalDir+ExeFileName);
   DeleteDownloadFile(LocalDir+CDBackupName );
   DeleteDownloadFile(LocalDir+FieldsRepsExeName);
   DeleteDownloadFile(LocalDir+ExtDownloadProgFileName);
end;

procedure TDownload.SendInfoToKingswood;
var
   FEmailInfo : TEmailInfo;
   VerNo : String;
begin
   with MailSender do
      try
         try
            with TEmailAccountInfo.Create do
               begin
                  FEmailInfo := EmailInfo;
                  Free;
               end;

               Host   := FEmailInfo.SMTPHost;
               UserID := FEmailInfo.SMTPID;

               if (NOT Connected) then
                  try
                     Connect;
                  except
                  end;

                 if Connected then
                    begin
                       ClearParams := True;
                       SubType     := mtPlain;
                       with PostMessage do
                          begin

                             if WinData.IrishSystem then
                                begin
                                   ToAddress.Clear;
                                   ToAddress.Add(KingswoodEmailAddress); // send on notification to Kingswood
                                end
                             else
                                begin
                                   ToAddress.Clear;
                                   ToAddress.Add(TGMEmailAddress); // send on notification to TGM
                                   ToBlindCarbonCopy.Clear;
                                   ToBlindCarbonCopy.Add(KingswoodEmailAddress); // also send to Kingswood
                                end;

                             FromAddress := FEmailInfo.UserAddress;
                             FromName    := FEmailInfo.UserName;
                             ReplyTo     := FEmailInfo.UserAddress;
                             VerNo := Format(' KHM V%s.%s R%s.%s ', [Copy(IntToStr(NewVerNo), 1, 1),
                                                                     Copy(IntToStr(NewVerNo), 2, 1),
                                                                     Copy(IntToStr(NewVerNo), 3, 1),
                                                                     Copy(IntToStr(NewVerNo), 4, 1)]);
                             Body.Clear;
                             Body.Add(Def.Definition.dRegOwner + 'Serial No: ' +IntTostr(Def.Definition.dSerialNo) + ' '+ VerNo + #13#10);
                             if FRVerNo > 0 then
                                begin
                                   VerNo := Format(' FRRS V%s.%s R%s.%s ', [Copy(IntToStr(NewVerNo), 1, 1),
                                                                            Copy(IntToStr(NewVerNo), 2, 1),
                                                                            Copy(IntToStr(NewVerNo), 3, 1),
                                                                            Copy(IntToStr(NewVerNo), 4, 1)]);
                                    Body.Add('Customer upgrade Fields/Reps to '+VerNo);
                                end;
                             Subject     := 'Kingswood Herd Upgrade Download';
                             Date        := FormatDateTime('dd/mm/yyyy', SysUtils.Date);
                          end;
                       SendMail;
                    end;
            except
            end;
      finally
         if Connected then
            Disconnect;
      end;
end;

{procedure TDownload.IEDownload1Progress(Sender: TBSCB; ulProgress,
  ulProgressMax, ulStatusCode: Cardinal; szStatusText: PWideChar;
  ElapsedTime, Speed, EstimatedTime: string);
begin
   if ulStatusCode = BINDSTATUS_DOWNLOADINGDATA then
      if (CurrentDownload in [dfKHMRelease, dfFieldsReps, dfXPCDBackup]) then
         begin
            ProgressBar.Max := ulProgressMax;
            ProgressBar.Position := ulProgress;
            lTranferRate.Caption := Speed;
            try
               lFileSize.Caption    := FormatFileSizeValue(ulProgress) + ' of ' + FormatFileSizeValue(ulProgressMax);
            except
            end;
            lElapsedTime.Caption := ElapsedTime;
            lEstTime.Caption     := EstimatedTime;
            Application.ProcessMessages;
         end;
end;
}

{procedure TDownload.IEDownload1Complete(Sender: TBSCB; Stream: TStream;
  Result: HRESULT);
begin
  FileDownloaded := False;
  if (Result = S_OK) then
      begin
         FileDownloaded := True;
         if CurrentDownload = dfKHMRelease then
            Memo1.lines.add('Herd Download complete.')
         else if CurrentDownload = dfFieldsREPS then
            Memo1.lines.Add('Fields/REPS download complete.')
         else if CurrentDownload = dfXPCDBackup then
            Memo1.lines.Add('CD Backup download complete.');
      end;
end;
}
procedure TDownload.MailSenderHeaderIncomplete(var handled: Boolean;
  hiType: Integer);
begin
   Handled := True;
end;

procedure TDownload.MailSenderAuthenticationFailed(var Handled: Boolean);
begin
   Handled := True;
end;

procedure TDownload.MailSenderInvalidHost(var Handled: Boolean);
begin
   Handled := True;
end;

procedure TDownload.DeleteIECache;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin

   { Ensure that kingswood download files are removed from Temporary Internet Files dir }
   try
      dwEntrySize := 0;
      FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);

      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
         hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);

      if hCacheDir <> 0 then
         repeat
            if (lpEntryInfo^.lpszSourceUrlName = ExeAddress) OR
               (lpEntryInfo^.lpszSourceUrlName = WebUpdateAddress) OR
               (lpEntryInfo^.lpszSourceUrlName = SerNoFileAddress) OR
               (lpEntryInfo^.lpszSourceUrlName = FieldsRepsPath) OR
               (lpEntryInfo^.lpszSourceUrlName = ExtDownloadProgAddress) then
                DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
            FreeMem(lpEntryInfo, dwEntrySize);

            dwEntrySize := 0;
            FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
            GetMem(lpEntryInfo, dwEntrySize);
            if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
         until
            not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize);

      FreeMem(lpEntryInfo, dwEntrySize);
      FindCloseUrlCache(hCacheDir);
   except
   end;

end;

procedure TDownload.DialUpConnect;
var
  dwConnectionTypes: DWORD;
  Mr : Byte;
begin

   dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
   if not InternetGetConnectedState(@dwConnectionTypes, 0) then // if not already connected try connect.
       begin
          repeat
             Memo1.Clear;
             Memo1.Lines.Add('Establishing a connection...');
             InternetAttemptConnect(0);
             if not InternetGetConnectedState(@dwConnectionTypes, 0) then
                begin
                   Memo1.Lines.Add('A connection to the internet could not be established!');
                   Mr := MessageDlg('A connection to the internet could not be established',mtError,[mbRetry, mbCancel],0);
                   if Mr = mrCancel then
                      begin
                         sbCancel.Caption := 'Close';
                         Abort;
                      end
                end
             else
                begin
                   Memo1.Lines.Add('Connection established...');
                   Memo1.Lines.Add('Checking customer status...'); { Update progress status }
                end;
          until
             (Mr = MrCancel) or (InternetGetConnectedState(@dwConnectionTypes, 0));
       end
    else
       Memo1.Lines.Add('Connection established ...');

   Application.ProcessMessages;
end;

procedure TDownload.DialUpDisconnect;
var
  dwConnectionTypes: DWORD;
begin
   Memo1.Lines.Add('Disconnecting.');
   try
      dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
      if InternetGetConnectedState(@dwConnectionTypes, 0) then
         if not InternetAutodialHangup(0) then
            MessageDlg('Unable to close the Internet connection',mtWarning, [mbOk],0);
   except
      Memo1.Lines.Add('Unable to disconnect.');
   end;
   Application.ProcessMessages;
end;

function TDownload.GetHerdDirDOSName: String;
var
   SearchRec : TSearchRec;
begin
   Result := 'C:\Kingsw~1';
   if FindFirst('C:\Kingswood Herd Management', faDirectory, SearchRec) = 0 then
      begin
         Result := 'C:\'+ SearchRec.FindData.cAlternateFileName;
         FindClose(SearchRec);
      end;
end;


procedure TDownload.HTTPGetProgress(Sender: TLMDWebHTTPGet;
  Item: TLMDDownloadItem);
begin
   if (Item.State = DS_PROCESSING) then
      begin
         if (CurrentDownload in [dfKHMRelease, dfFieldsReps, dfXPCDBackup, dfExternalDownload]) then
            begin
               if CheckForSize < 4 then
                  Inc(CheckForSize);
               ProgressBar.Position := Item.Progress;
               if CheckForSize = 2 then
                  FileSize := FormatFileSizeValue(Item.DataSize)
               else
                  lFileSize.Caption := FormatFileSizeValue(Item.DataSize) + ' of ' + FileSize;
            end;
         if not Item.FreeOnProcessed then
            Item.FreeOnProcessed := True;
      end
   else if (Item.State = DS_ERROR ) then
      MessageDlg('An unexpected error has occurred. Contact Kingswood.',mtError,[mbOk],0);

//   ProgressBar.position := Item.Progress;
end;

procedure TDownload.HTTPGetProcessed(Sender: TObject);
begin
   FileDownloaded := True;
   CheckForSize := 0;
{  if (Result = S_OK) then
      begin
         FileDownloaded := True;
         if CurrentDownload = dfKHMRelease then
            Memo1.lines.add('Herd Download complete.')
         else if CurrentDownload = dfFieldsREPS then
            Memo1.lines.Add('Fields/REPS download complete.')
         else if CurrentDownload = dfXPCDBackup then
            Memo1.lines.Add('CD Backup download complete.');
      end;

   if FileExists(WebUpdate.Files[0].FileName) then
      begin
         FileDownloaded := True;
         ShowMessage('File is downloaded');
      end;
   }
end;

procedure TDownload.DownloadExternalDownloadProg;
begin

   if FileExists( LocalDir + ExtDownloadProgFileName ) then Exit; //

   Memo1.lines.Add('Downloading External Download Program...');
   CurrentDownload := dfExternalDownload;
   FileDownloaded := False;
   HTTPGet.DestinationName := ExtDownloadProgFileName;
   HTTPGet.URL := ExtDownloadProgAddress;
   ProgressBar.Visible := True;
   HTTPGet.Process(False, True);

   while not FileDownloaded do
      Application.Processmessages;

   ProgressBar.Visible := False;
   Application.ProcessMessages;
   if FileExists( LocalDir + ExtDownloadProgFileName ) and (FileDownloaded) then
      begin
         if not ExtractNewExe(CurrentDownload) then
            MessageDlg('Failure to extract new External Download Program, contact Kingswood',mtError,[mbOk],0)
         else
            Memo1.lines.Add('External Download Program installed.')
      end
   else if not CancelDownload then
      begin
         MessageDlg('An unexpected error has ocurred.'+ #13#10 +
                    'Please try again later. If problem persists contact Kingswood.',mtError,[mbOk],0);
      end;
   Application.ProcessMessages;

end;

end.

