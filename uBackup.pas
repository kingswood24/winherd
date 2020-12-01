{
 ==============================================================================
 SP 16/09/02 :-

 Fix : function TestBackup: Word;
       DeleteDirectory wasn't working.
       Local variable DirSize assigned 0

 SP 16/09/02

 -----------------------------------------------------------------------------

 SP 04/10/2002:-

 Get Free Disk Space removed.
 This wasn't working properly with Win XP
 Backup HTest folder. Herd Select allowed users to enter data into HTest Data
 folder. Revert back to data, store hTest as zip and delete hTest Folder.

 SP 04/10/2002. V 3.5 R 9.1 / V 3.6 R 0.1

 ==============================================================================

 SP 07/02/2003:-

 Change in the HerdBackup name.

 The backup name will now consist of the actual Data folder that BDE alias Kingswd
 is currently pointing too.

 Archiving :

    Create a subfolder in the Archive folder.
    Name it folder that Kingswd is pointing too.

    All archived backups to be stored in this folder.


 SP 07/02/2003.  v3.6 r4.0

 ==============================================================================

 SP 16/12/2004 Complete rewrite / USB/Zip backup compatibility.

}


unit uBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DynaLibZ, DynaZip, DynaLibU, Mask,
  Gauges, ComCtrls, Menus, RXCtrls, ToolWin, FileCtrl;

type
  TZipDestType = (zdFloppy, zdCDR, zdExternalDevice);
  TZipOperation = (zoZip, zoUnzip);
  TfBackup = class(TForm)
    Zip: TZipFile;
    Unzip: TUnzipFile;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    BackupBtn: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    Panel1: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Gauge2: TGauge;
    Gauge1: TGauge;
    LPass: TLabel;
    rBackup: TRadioButton;
    rRestore: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Pass: TMaskEdit;
    Image1: TImage;
    cbSpan: TCheckBox;
    ToolButton4: TToolButton;
    sbFormat: TRxSpeedButton;
    ADriveList: TFileListBox;
    Label3: TLabel;
    cbReport: TCheckBox;
    ListBox1: TListBox;
    cbFormat: TCheckBox;
    cbUZLog: TCheckBox;
    Label6: TLabel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Bevel2: TBevel;
    Bevel1: TBevel;
    cbArchive: TCheckBox;
    Bevel3: TBevel;
    cbTestData: TCheckBox;
    StatusBar2: TStatusBar;
    sbExternalDevice: TRxSpeedButton;
    ToolButton5: TToolButton;
    rRestoreCD: TRadioButton;
    odCDDrive: TOpenDialog;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    BackuptoCDWindowsXPOnly: TMenuItem;
    RemoveableDevices1: TMenuItem;
    sbStoreFiles: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    StorePedigreeImages1: TMenuItem;
    StoreCalfICBFRegistrationFiles1: TMenuItem;
    ToolButton7: TToolButton;
    procedure bExitClick(Sender: TObject);
    procedure UnzipMinorCallback(szItem: PChar; Percent: Integer; var DoCancel: Boolean);
    procedure UnzipMajorCallback(szItem: PChar; Percent: Integer; var DoCancel: Boolean);
    procedure PassChange(Sender: TObject);
    procedure BackupbtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure rBackupClick(Sender: TObject);
    procedure rRestoreClick(Sender: TObject);
    procedure sbFormatClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure cbSpanClick(Sender: TObject);
    procedure rRestoreCDClick(Sender: TObject);
    procedure RemoveableDevices1Click(Sender: TObject);
    procedure BackuptoCDWindowsXPOnlyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StorePedigreeImages1Click(Sender: TObject);
    procedure StoreCalfICBFRegistrationFiles1Click(Sender: TObject);
  private
    { Private declarations }
    ExitNow : Boolean;
    ProcessLog : TStringList;
    BackupSuccess : Boolean;
    BackupFileName : String;
    DataDirectory : String;
    ZipArray   : array[0..70] of char;
    UnZipArray : array[0..70] of char;
    function TestBackup(AFileName : string) : Boolean;
    procedure FloppyFilesToList;
    procedure CloseDataConnections;
    procedure BackupToCD;
    procedure BackupToRemovable;
    function CheckFloppyDisk : Boolean;
    function ZipData(SourcePath, DestPath : string; const CloseDB,
                     SetBackupDate : Boolean;
                     ZipOp : TZipOperation = zoZip) : Boolean;
    procedure UpdateStatus( Text : string);
    procedure ArchiveData;
    procedure ZipRegFiles(Drive : String);
    procedure ZipImageFiles(Dest : TZipDestType);
  public
    { Public declarations }
  end;

  function LoadBackUpForm : Boolean;
  function SHFormatDrive(Wnd: HWnd; Drive, FormatID, Options: Word): DWord; StdCall;
  function DiskChange(drive: byte): boolean; Assembler;

var
   FBackup : TFBackup;

const
   TestDir = 'C:\Kingswood Herd Management\Archive\Temp';
   OldTestDir = 'C:\Kingswood Herd Management\hTest';
   cBackupComplete = 'Data Backup Successfully Completed';
   cBackupFailed = 'ERROR: Data backup has failed - Please note any error messages and contact Kingswood.';
   cZipExt = '.zip';
   cNoDiskFound = 'No Floppy Disk Detected!';

implementation
uses
   ShellAPI, uIndexes, Def, DairyData,
   KRoutines, GenTypesConst, ActiveX,
   uBackupDevice, uWinOS;

{$R *.DFM}

function LoadBackUpForm : Boolean;
begin
   with TFBackUp.Create(nil) do
      try
         ExitNow := False;
         Processlog := TStringList.Create;
         ShowModal;
         Result := BackupSuccess;
      finally
         Processlog.Free;
         Free;
      end;
end;

procedure TfBackup.bExitClick(Sender: TObject);
begin
   Application.ProcessMessages;
   if ListBox1.Showing then
      begin
         ListBox1.SendToBack;
         ListBox1.Hide;
      end
   else
      Close;
end;

procedure TfBackup.UnzipMinorCallback(szItem: PChar; Percent: Integer; var DoCancel: Boolean);
begin
   if (szItem <> '') then
      ProcessLog.Add(szItem+' - Added');
   Gauge1.Progress := Percent;
   Application.ProcessMessages;
end;

procedure TfBackup.UnzipMajorCallback(szItem: PChar; Percent: Integer; var DoCancel: Boolean);
begin
   Gauge2.Progress := Percent;
   Application.ProcessMessages;
end;

procedure TfBackup.PassChange(Sender: TObject);
begin
   BackupBtn.Enabled := (Pass.text = 'RESTORE');
end;

procedure TfBackup.BackupbtnClick(Sender: TObject);
var
   OKToBackUp : Boolean;                      
   FileName : String;
begin

   if not ( rRestoreCD.Checked ) then
      if not CheckFloppyDisk then Exit;

   { If Backup/Restore with floppy, ensure RequestFloppy is true }

   ListBox1.SendToBack;
   ListBox1.Hide;
   ADriveList.Show;

   // reset file info display
   FloppyFilesToList;
   OKToBackUp := TRUE;

   // check for enough memory
   if ((DiskFree(1)/1000000) < 0.2) and (rBackUp.Checked) and NOT(cbFormat.Checked)then
      begin
         messagedlg(FloatToStrF((DiskFree(1)/1000),ffFixed,2,1)+'Kb memory left!'+#13+
                    'Either insert a new disk, or format current one.',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end;


   // check for existing backup
//   if FileExists('a:\HerdBackUp.zip')  and (rBackUp.Checked) then
   if FileExists('A:\'+ BackupFileName + cZipExt) and (rBackUp.Checked) then
      if (messagedlg('A Backup already exists, continuing will replace it,'+#13+
                     ' do you wish to continue?.',mtWarning,[mbNo,mbYes],0)=mrNo) then
         SysUtils.Abort
      else
         begin
            Update;
            DeleteFile('A:\'+ BackupFileName + cZipExt);
         end;

   // delete previous log file
   DeleteFile('C:\Windows\DZIPLOG.TXT');
   // close database
   try
      WinData.KingData.CloseDataSets; // Close the Dataset
      WinData.KingData.Close;         // Close the Database
   except
      OKToBackUp := FALSE;
      ShowMessage('Error occured Closing Database - ReStart Program and try again' +
                   #13#13 + 'BACKUP/RESTORE has failed Contact Kingwood');
   end;

   // close definition
   if OKToBackUp then
      try
        CloseFile(Def.DefFile);
        DefOpenOK := False;
      except
        OKToBackUp := FALSE;
        ShowMessage('Error occured Closing definition - ReStart Program and try again' +
                     #13#13 + 'BACKUP/RESTORE has failed Contact Kingwood');
      end;

   // zip files
   if (rBackup.Checked) and (OKToBackUp) then
      begin
         if DirectoryExists(OldTestDir) then  { SP 04/10/2002 }
            try
               ZipData('C:\Kingswood Herd Management\hTest', 'C:\Kingswood Herd Management\Archive\HTest.zip', TRUE, FALSE);
            except
            end;

         UpdateStatus('Attempting Backup of Data, please wait...');

         ArchiveData;

         Zip.wMultiVolControl := [];

         if (cbSpan.Checked) then
            Zip.wMultiVolControl := Zip.wMultiVolControl + [MV_UseMulti];

         // auto format?
         if (cbFormat.Checked) then
            Zip.wMultiVolControl := Zip.wMultiVolControl + [MV_FORMAT];

         // create zip log file?
         if (cbReport.checked) then
            Zip.wZipSubOptions := [ZSO_LOGZIPRESULTS]
         else
            Zip.wZipSubOptions := [];

         // create unzip log file?
         if (cbUZLog.checked) then
            UnZip.wUnZipSubOptions := [USO_LOGZIPRESULTS]
         else
            UnZip.wUnZipSubOptions := [];

         if ZipData(DataDirectory, Format('A:\%s%s',[BackupFileName,cZipExt]), TRUE, TRUE) then
            begin

               if StoreCalfICBFRegistrationFiles1.Checked then
                  ZipRegFiles('A:\');
               if StorePedigreeImages1.Checked then begin end;

               if not cbTestData.Checked then
                  begin
                     MessageDLG(cBackupComplete,mtInformation,[mbOK],0);
                     BackupSuccess := True;
                  end
               else
                  begin
                     UpdateStatus('Attempting Backup of Data, please wait...');

                     Application.ProcessMessages;

                     if TestBackup(Format('A:\%s%s',[BackupFileName, cZipExt])) then
                        begin
                           MessageDLG('Backup taken and backup test successfully completed!',mtInformation,[mbOK],0);
                           Update;
                        end
                     else
                        begin
                           MessageDLG('ERROR: Backup test has failed!',mtError,[mbOK],0);
                           MessageDLG('A FORMAT of the Floppy Disk is advised, please ensure that there are no '+#13+
                                      'bad sectors on disk before proceeding with backup. If the disk format reports '+#13+
                                      'errors a NEW formatted floppy disk should be used for the backup procedure. ',mtWarning,[mbOK],0);

                           if MessageDlg('Do you want to format disk now?',mtConfirmation,[mbyes,mbNo],0) = idYes then
                              sbFormatClick(Sender);
                           Update;
                        end;
                  end;
               UpdateStatus('Complete!');
            end
         else
            begin
               MessageDLG(cBackupFailed,mtError,[mbOK],0);
               UpdateStatus(cBackupFailed);
            end;
      end
   // unzip files
   else if ((rRestore.Checked) or (rRestoreCD.Checked)) and (OkToBackUp) then //joanne tighe
      begin
         Pass.Text := '';
         if (rRestore.Checked) then   //joanne tighe restore cd backup
            FileName := 'A:\'+BackupFileName+'.zip'
         else if (rRestoreCD.Checked) then //joanne tighe restore cd backup
            begin
               odCDDrive.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);
               odCDDrive.Execute;
               FileName := odCDDrive.FileName;
            end;

         if not FileExists(FileName) then
            begin
               MessageDlg(Format('Unable to proceed with data restore.'+#13#10+
                                 'File : "%s" does not exist',[FileName]),mtWarning,[mbOK],0);
               Application.ProcessMessages;
               WinData.OpenAndCheckTables;
            end
         else if MessageDLG('WARNING !! This will replace all existing data. Do you wish to continue ?',mtWarning,[mbYes,mbNo],0) = mrYes Then
            begin
               UpdateStatus('Attempting Restore of Data, please wait...');

               if ZipData(FileName, DataDirectory, TRUE, FALSE, zoUnzip) then
                  MessageDLG('Restore Successfully Completed.',mtInformation,[mbOK],0)
               else
                  MessageDLG('This Restore has Failed - Please note any error messages and contact Kingswood Computing',mtWarning,[mbOK],0);
            end
         else
            begin
               UpdateStatus('Restore cancelled.');
               Application.ProcessMessages;
               WinData.OpenAndCheckTables;
            end;
      end;

   Application.ProcessMessages;
   UpdateStatus('Opening Data, please wait...');
   FloppyFilesToList;
end;

procedure TfBackup.FormCreate(Sender: TObject);
Var
   Ico : TIcon;
begin
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(BackupBtn.Glyph, cBtnImgFloppy2);
   WinData.LoadBtnImage(sbFormat.Glyph, cBtnImgFormat);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(sbExternalDevice.Glyph, cBtnImgExternalDevice);

   cbSpan.Checked := WinData.GlobalSettings.BackupSpanDisks;
   cbTestData.Checked := WinData.GlobalSettings.BackupTestFile;
   cbArchive.Checked := WinData.GlobalSettings.BackupArchiveFile;
   StorePedigreeImages1.Checked := WinData.GlobalSettings.BackupStorePedigreeImages;
   StoreCalfICBFRegistrationFiles1.Checked := WinData.GlobalSettings.BackupStoreRegFiles;

   BackupFileName := '';
   DataDirectory := '';

   BackuptoCDWindowsXPOnly.Enabled := uWinOS.WindowsOS = winXP; // ([ winXP, WinVista]);
   RemoveableDevices1.Enabled := ( RemovableDriveCount > 0 );

   // Hide the Archive button, we want to make sure a backup is on the HardDrive incase
   // of any mishaps during the conversion process.
   cbArchive.Visible := not WinData.UpdatingToEuro;

   ADriveList.Hide;
   Gauge1.Progress := 0;
   Gauge2.Progress := 0;
   rBackup.OnClick(sender);
   Unzip.lpszDestination.Clear;
   Unzip.lpszFileSpec.Clear;
   Unzip.lpszZipFile.Clear;
   Zip.lpszZipFile.Clear;
   Zip.lpszItemList.Clear;
   ListBox1.SendToBack;
   ListBox1.Hide;
   Ico := Ticon.Create;
   try
      Ico.Handle := LoadIcon(0,IDI_EXCLAMATION);
      with Image1.Picture Do
         begin
            Ico.Height;
            Ico.Width;
            Image1.Picture.Graphic := Ico;
         end;
   finally
      Ico.Free;
   end;
end;

procedure TfBackup.HelpBtnClick(Sender: TObject);
begin
   WinData.HTMLHelp('backup.htm');
end;

procedure TfBackup.rBackupClick(Sender: TObject);
begin
   BackupBtn.Enabled := True;
   LPass.Visible     := False;
   Pass.Visible      := False;
end;

procedure TfBackup.rRestoreClick(Sender: TObject);
begin
   BackupBtn.Enabled := False;
   LPass.Visible     := True;
   Pass.Visible      := True;
   Pass.Text         := '';
   Pass.Setfocus;
end;

function SHFormatDrive; external 'SHELL32.dll' name 'SHFormatDrive';

// disk formatting option added 12/12/00 - kr
procedure TfBackup.sbFormatClick(Sender: TObject);
var
   FormatReturn,
   OldErrorMode : Integer;
begin
   ListBox1.SendToBack;
   ListBox1.Hide;
   ADriveList.Clear;
   ADriveList.Directory := 'C:\'; // Seems to be a bug in WinXP, if ADriveList.directory isnt set to another existing directory
                                  // XP throws an exception when formatting. even setting ADriveList.directory to nothing ''
                                  // will not work.
   ADriveList.Enabled := False;
   ADriveList.Hide;

   // format a:\drive
   if messagedlg('Are you sure you want to format the disk?'+#13+
                 '(This will erase all information on it)',mtwarning,[mbYes,mbNo],0) = mrYes then
      begin
         // check if drive is ready
         try
            // this turns off errors
            Application.Processmessages;
            OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
            try
               while (not DirectoryExists('A:\')) do
                   begin
                      Application.Processmessages;
                      if MessageDlg('Drive A: is not ready...',mtError,[mbRetry,mbAbort],0) <> idRetry then
                         SysUtils.Abort;
                   end;
            finally
               // turn errors on
               SetErrorMode(OldErrorMode);
            end;
         except
            on E:EInOutError do
               if E.ErrorCode = 21 then
                  begin
                     ShowMessage('Drive A: is not ready...');
                     SysUtils.Abort;
                  end;
         end;
         // format with result returned
         FormatReturn := (SHFormatDrive(Handle,0,$FFFF,0));
         // 6=OK, -1=Error/No Disk, -2=Cancelled
         if (FormatReturn = -1) then
            messagedlg('An error occurred during formatting. Please retry.'+#13+
                       'If this persists, contact Kingswood.',mtError,[mbOk],0)
         else if (FormatReturn = -2) then
            messagedlg('Formatting Cancelled.',mtError,[mbOk],0)
         else
            messagedlg('Formatting Successful!',mtConfirmation,[mbOk],0);
      end;
   // reset file info display
   FloppyFilesToList;
end;

procedure TfBackup.FormShow(Sender: TObject);
begin
   DataDirectory := WinData.KingData.Directory;
   SetLength(DataDirectory, Length(DataDirectory));

   BackupFileName := ExtractDirFromPath(ExcludeTrailingBackslash(WinData.KingData.Directory));
   SetLength(BackupFileName, Length(BackupFileName));

   if not CheckBackupFileName(BackupFileName) then
      begin
         MessageDlg(Format('Unable to continue with backup.'+#13#10+
                           'The current data folder "%s"'+#13#10+
                           'contains illegal characters, contact Kingswood',[BackupFileName]),mtError,[mbOK],0);
         ExitNow := True;
         Abort;
      end;

   FloppyFilesToList;
end;

procedure TfBackup.FormPaint(Sender: TObject);
begin
   // calls close if cancelled
   if ExitNow then bExitclick(Sender);
end;

// this doesn't work properly, do not use!
function DiskChange(drive: byte): boolean; Assembler;
asm
   Mov AH,16h;
   mov DL, Byte Ptr Drive;
   Int 13h;
   Mov AL, AH;
   {Mov AH, $16
   Mov DL, drive
   Int $13
   Mov AL,AH;}
end;

procedure TfBackup.cbSpanClick(Sender: TObject);
begin
   cbFormat.Checked := cbSpan.Checked;
end;

function TfBackup.TestBackup(AFileName : string) : Boolean;

   function DeleteDirectory : Boolean;
   var
     DirInfo: TSearchRec;
     i : SmallInt;
   begin
      Result := True;
      try
         i := FindFirst(TestDir+'\*.*', FaAnyfile, DirInfo);
         while i = 0 do
            begin
               if ((DirInfo.Attr and FaDirectory <> FaDirectory) and
                   (DirInfo.Attr and FaVolumeId <> FaVolumeID)) then
                   DeleteFile(pChar(TestDir+'\'+DirInfo.Name));
              i := FindNext(DirInfo);
            end;
         SysUtils.FindClose(DirInfo);
         RemoveDirectory(TestDir);
      except
         Result := False;
      end;

   end;
begin
   Result := False;
   try
      UpdateStatus(Format('Testing %s, please wait...',[AFileName]));
      CreateDirectory(TestDir);
      if ZipData(AFileName, TestDir, TRUE, FALSE, zoUnzip) then
         Result := True;
      RemoveDir(TestDir);
   finally
      DeleteDirectory;
   end;
end;

procedure TfBackup.rRestoreCDClick(Sender: TObject);
begin
   BackupBtn.Enabled := False;
   LPass.Visible     := True;
   Pass.Visible      := True;
   Pass.Text         := '';
   Pass.Setfocus;

end;

procedure TfBackup.CloseDataConnections;
begin
   try
      WinData.KingData.CloseDataSets; // Close the Dataset
      WinData.KingData.Close;         // Close the Database
   except
      on E : Exception do
         raise Exception.Create('BACKUP/RESTORE Failed: Error occured while disconnecting from database.' + cCRLF +
                                'Restart program and try again. If problem persists contact Kingwood');
   end;
end;

procedure TfBackup.BackupToCD;
var
   RunCmd, DestinationPath : string;
   AccCompanies : TStringList;
   i : Integer;
begin
   ArchiveData;

   if not FileExists(ApplicationPath + cCDBackupExeName) then
      begin
         MessageDlg('Cannot write backup to CD. Program not found, contact Kingswood',mtError,[mbOK],0);
         Exit;
      end;

   DestinationPath := TestDir + '\' + BackupFileName + cZipExt;
   // if previous temp backup exists delete.
   if FileExists(DestinationPath) then
      DeleteFile(DestinationPath);

   // Zip Data
   if ZipData( DataDirectory, DestinationPath, TRUE, TRUE ) then
      begin
         RunCmd := cCDBackupExeName + ' ' + '"' + DestinationPath + '"';
         if Definition.dUseKingsAccs then
            begin
               AccCompanies := TStringList.Create;
               GetAccsDatabasesInUse(AccCompanies);
               try
                  if ( AccCompanies.Count > 0 ) then
                     begin
                        for i := 0 to AccCompanies.Count-1 do
                           begin
                              DestinationPath := TestDir + '\' + AccCompanies.Strings[i] + cZipExt;
                              // if previous temp backup exists delete.
                              if FileExists(DestinationPath) then
                                 DeleteFile(DestinationPath);
                              if ZipData( WinAccsFolder+AccCompanies.Strings[i], DestinationPath, TRUE, TRUE ) then
                                 RunCmd := RunCmd + ' ' + '"' + DestinationPath + '"' ;
                           end;
                     end;

               finally
                  FreeAndNil(AccCompanies);
               end;
            end;
        if StoreCalfICBFRegistrationFiles1.Checked then
           begin
              ZipRegFiles(TestDir);
              if FileExists( TestDir+'\ERegFiles.zip' ) then
                 RunCmd := RunCmd + ' ' + '"' + TestDir+'\'+'ERegFiles.zip' + '"' ;
              if FileExists( TestDir+'\ICBFFiles.zip' ) then
                 RunCmd := RunCmd + ' ' + '"' + TestDir+'\'+'ICBFFiles.zip' + '"' ;
           end;

         WinExec(PChar(RunCmd), SW_SHOWNORMAL);
         BackupSuccess := True;
      end
   else
      MessageDLG(cBackupFailed,mtWarning,[mbOK],0);

end;

procedure TfBackup.BackupToRemovable;
var
   Drive : string;
   AccCompanies : TStringList;
   i : Integer;
   DestinationPath : string;
begin
   if RemovableDriveCount > 1 then
      begin
         Drive := uBackupDevice.Execute;
         Update;
      end
   else
      Drive := RemovableDrive;

   if Drive <> '' then
      begin
         if FileExists(Drive + BackupFileName) then
            begin
               if MessageDlg('Backup already exists on external device, overwrite backup?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                  DeleteFile( Drive + BackupFileName)
               else
                  Abort;
            end;
         ArchiveData;
         if ZipData(DataDirectory, Drive + BackupFileName + cZipExt, TRUE, TRUE) then
            begin
               if Definition.dUseKingsAccs then
                  begin
                     AccCompanies := TStringList.Create;
                     GetAccsDatabasesInUse(AccCompanies);
                     try
                        if ( AccCompanies.Count > 0 ) then
                           begin
                              for i := 0 to AccCompanies.Count-1 do
                                 begin
                                    DestinationPath := Drive + AccCompanies.Strings[i] + cZipExt;
                                    // if previous temp backup exists delete.
                                    if FileExists(DestinationPath) then
                                       DeleteFile(DestinationPath);
                                    ZipData( WinAccsFolder+AccCompanies.Strings[i], DestinationPath, TRUE, TRUE );
                                 end;
                           end;
                     finally
                        FreeAndNil(AccCompanies);
                     end;
                  end;

               if StoreCalfICBFRegistrationFiles1.Checked then
                  ZipRegFiles(Drive);

               MessageDLG(cBackupComplete,mtInformation,[mbOK],0);
               BackupSuccess := True;
            end
         else
            MessageDLG(cBackupFailed, mtWarning,[mbOK],0);
      end
   else
      MessageDlg('Unable to continue with data backup, no valid drive selected',mtwarning,[mbOK],0);
end;

procedure TfBackup.RemoveableDevices1Click(Sender: TObject);
begin
   BackupToRemovable;
end;

procedure TfBackup.BackuptoCDWindowsXPOnlyClick(Sender: TObject);
begin
   BackupToCD;
end;

function TfBackup.CheckFloppyDisk : Boolean;
var
   MsgReply : Word;
begin
   Result := (DiskSize(1) >= 0);
   if not Result then
      begin
         MsgReply := MessageDlg( cNoDiskFound , mtError , [ mbRetry, mbCancel ], 0 );
         while MsgReply = mrRetry do
            begin
               Result := (DiskSize(1) >= 0);
               if not Result then
                  MsgReply := MessageDlg( cNoDiskFound , mtError , [ mbRetry, mbCancel ], 0 );
            end;
      end;
end;

procedure TfBackup.FloppyFilesToList;
begin
   if (DiskSize(1) >= 0) then
      begin
         ADriveList.Directory := '';
         // update disk information
         with StatusBar1 do
            begin
               Panels[1].Text := 'Floppy Disk Capacity';
               Panels[2].Text := FloatToStrF((DiskSize(1)/1000000),ffFixed,4,3)+' Mb';
               Panels[4].Text := 'Free Space';
               Panels[5].Text := FloatToStrF((DiskFree(1)/1000000),ffFixed,4,3)+' Mb';

               try
                  ADriveList.Directory := 'A:\';
                  ADriveList.Enabled := True;
                  ADriveList.Refresh;
                  ADriveList.Show;
               except
               end;
            end
      end;
end;

function TfBackup.ZipData(SourcePath, DestPath : string; const CloseDB,
  SetBackupDate : Boolean;  ZipOp : TZipOperation = zoZip) : Boolean;
begin
   Result := False;
   if CloseDB then
      CloseDataConnections;
   try
      try
         if ZipOp = zoZip then
            begin
               FillChar( ZipArray, SizeOf(ZipArray), NullTerminator); // Set Array contents to null
               SourcePath := IncludeTrailingBackSlash(SourcePath); // include back slash in source path
               StrPCopy(ZipArray, PChar('"'+ SourcePath +'*.*"' + NullTerminator));
               Zip.lpszZipFile.SetText(PChar('"'+ DestPath + '"' + NullTerminator));
               Zip.lpszItemList.SetText(ZipArray);
               Result := Zip.Execute(ZIP_ADD);
            end
         else
            begin
               FillChar( UnZipArray, SizeOf(UnZipArray), NullTerminator); // Set Array contents to null
               StrPCopy( UnZipArray, DestPath  + NullTerminator);
               Unzip.lpszDestination.SetText(UnZipArray);
               Unzip.lpszZipFile.SetText(PChar(SourcePath + NullTerminator));
               Unzip.lpszFileSpec.SetText('*.*' + NullTerminator);
               Result := Unzip.Execute(UNZIP_EXTRACT);
            end;
      except
         raise Exception.Create('An Error has occured in backup/restore process. Close program and retry.' + cCRLF +
                                cErrorContact);
      end;
   finally
      if CloseDB then
         WinData.OpenAndCheckTables;
      if ( ZipOp = zoZip ) and ( SetBackupDate ) and ( Result ) then
         WinData.LastBackupDate := Date;
   end;
end;


procedure TfBackup.UpdateStatus(Text: string);
begin
   StatusBar2.Panels[1].Text := Text;
   StatusBar2.Refresh;
end;

procedure TfBackup.ArchiveData;
var
   ArchiveDestFile : String;
begin
   if cbArchive.Checked then
      begin
         if WinData.UpdatingToEuro then
            ArchiveDestFile := 'C:\Kingswood Herd Management\Archive\EConvert\HerdBackUp.zip'
         else
            ArchiveDestFile := 'C:\Kingswood Herd Management\Archive\'+ BackupFileName +'\'+BackupFileName+'.zip';
           if not ZipData(DataDirectory, ArchiveDestFile, TRUE, FALSE) then
              MessageDlg('Data Archive failed - contact Kingswood',mtError,[mbOK],0);
        end;
   Update;
end;

procedure TfBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   WinData.GlobalSettings.BackupSpanDisks := cbSpan.Checked;
   WinData.GlobalSettings.BackupTestFile := cbTestData.Checked;
   WinData.GlobalSettings.BackupArchiveFile := cbArchive.Checked;
   WinData.GlobalSettings.BackupStorePedigreeImages := StorePedigreeImages1.Checked;
   WinData.GlobalSettings.BackupStoreRegFiles := StoreCalfICBFRegistrationFiles1.Checked;
   WinData.SavePreferences;
end;

procedure TfBackup.StorePedigreeImages1Click(Sender: TObject);
begin
   StorePedigreeImages1.Checked := not StorePedigreeImages1.Checked;
end;

procedure TfBackup.StoreCalfICBFRegistrationFiles1Click(Sender: TObject);
begin
   StoreCalfICBFRegistrationFiles1.Checked := not StoreCalfICBFRegistrationFiles1.Checked;
end;

procedure TfBackup.ZipRegFiles(Drive : String);
var
  ZipRes : Boolean;
begin
   UpdateStatus('Backing up Registration files, please wait...');
   Drive := IncludeTrailingBackslash(Drive);
   if Drive = 'A:\' then
      CheckFloppyDisk;

   ZipRes := True;
   if DirectoryExists(ApplicationPath+'Calf Registration EMails') then
      ZipRes := ( ZipData(ApplicationPath+'Calf Registration EMails', Drive+'ERegFiles', False, False, zoZip) );

   if ZipRes then
      begin
         if DirectoryExists(ApplicationPath+'ICBF Events Files') then
            ZipRes := ZipData(ApplicationPath+'ICBF Events Files', Drive+'ICBFFiles', False, False, zoZip)
         else
            ZipRes := True;
      end;
end;

procedure TfBackup.ZipImageFiles(Dest: TZipDestType);
begin

end;

end.

