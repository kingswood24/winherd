{
   09/04/09 [Dev 3.9 6.8] / SP - APHIS now creating files with .csv extension, include the .csv filter
                                  in the opendialog filter property.

   11/04/10 [Dev 4.0 3.3 / MK - Changed the Help button to visible all the time and not depending on MartImportTypes.
                                Changed Help button to martfiles or aphismovements depending on MartImportTypes.

   07/12/10 [V4.0 R7.0] /MK Bug Fix - Fixed Issue With Total Weight Showing As Total Price and Total Price Showing As Total Weight in Review.

   17/05/11 [V4.1 R0.2] /MK Bug Fix - Changed Caption of rbPurchase and rbSales From AHPIS To APHIS.

   13/12/19 [V5.9 R1.5] /MK Change - ImportFile - If there are no animals to import then don't show the Results screen - John Milliken.
}

unit uMartImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, StdCtrls,
  cxButtons, cxLabel, cxTextEdit, cxMemo, uMartImportByFile, GenTypesConst,
  Menus, LMDWebBase, LMDMapi, db, dbTables,uMartImportTypes,Printers,
  ShellAPI, FileCtrl;

type

  TfmMartImport = class(TForm)
    btnCancel: TcxButton;
    OpenDialog: TOpenDialog;
    gbMartFileTypeSelect: TcxGroupBox;
    rbPurchase: TcxRadioButton;
    rbSales: TcxRadioButton;
    mResults: TcxMemo;
    gbBrowseFile: TcxGroupBox;
    btnBrowse: TcxButton;
    lMartFilename: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    gbReviewResults: TcxGroupBox;
    cxLabel4: TcxLabel;
    btnReviewResults: TcxButton;
    btnRequestMartEFile: TcxButton;
    MAPIMail: TLMDMapiSendMail;
    btnPrint: TcxButton;
    btnConnectToAPHIS: TcxButton;
    btnHelp: TcxButton;
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbPurchaseClick(Sender: TObject);
    procedure btnReviewResultsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miCarnarossMartClick(Sender: TObject);
    procedure miClareMartsClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnConnectToAPHISClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnRequestMartEFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
    mi : MartImport;
    FHerdID : byte;
    FMartFileKind : TMartFileKind;
    SaveOutputResults : Boolean;
    FFileName : string;
    procedure UpdateScreen(var msg: TMessage); message WM_UpdateMartImportScreen;
    procedure ShowResults(AShow : Boolean = False);
    procedure SendEmail(AMartName: String);
    procedure OutputResults;
    procedure ImportFile(AFileName : string);
  public
    { Public declarations }
    class function open(AMartFileKind:TMartFileKind; AHerdID : byte;
         const AFileName : string=''):string;
  end;

var
  fmMartImport: TfmMartImport;

implementation

uses uGlobalSettings, DairyData, uHerdSetUp, kRoutines, uMartEmailRequest, uFileAttachmentImport;

{$R *.DFM}

class function TfmMartImport.open(AMartFileKind:TMartFileKind;
   AHerdID : byte;const AFileName : string=''):string;
begin
   with TfmMartImport.Create(nil) do
      try
         FHerdID := AHerdID;
         FMartFileKind := AMartFileKind;
         if FMartFileKind = mftMART then
            begin
               Caption := 'Mart Movements';
               rbPurchase.Caption := '&Purchase File From Mart';
               rbSales.Caption := '&Sales File From Mart';
               btnRequestMartEFile.Visible := True;
               btnConnectToAPHIS.Visible := False;
               btnBrowse.Left := 185;
               btnBrowse.Caption := '&Browse';
            end
         else if FMartFileKind = mftAHPIS then
            begin
               Caption := 'APHIS Movements';
               rbPurchase.Caption := '&APHIS Movements In File';
               rbSales.Caption := '&APHIS Movements Out File';
               btnRequestMartEFile.Visible := False;
               btnConnectToAPHIS.Visible := True;
               btnBrowse.Left := 274;
               btnBrowse.Caption := '(b) &Browse';
            end;
         FFileName := AFileName;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmMartImport.btnBrowseClick(Sender: TObject);
begin
   gbReviewResults.Visible := False;
   if ( not rbPurchase.Checked ) and ( not rbSales.Checked ) then
      Exit;

   OpenDialog.InitialDir := GetSpecialFolder(CSIDL_DESKTOP);

   if OpenDialog.Execute then
      begin
         ImportFile(OpenDialog.FileName);
      end;
end;

procedure TfmMartImport.FormCreate(Sender: TObject);
begin
   lMartFilename.Caption := '';
   SaveOutputResults := False;
end;

procedure TfmMartImport.ShowResults(AShow: Boolean);
begin
   gbMartFileTypeSelect.Visible := not AShow;
   gbBrowseFile.Visible := not AShow;
   gbReviewResults.Visible := not AShow;
   mResults.Visible := AShow;
   btnPrint.Visible := AShow;
   SaveOutputResults := AShow;
end;

procedure TfmMartImport.rbPurchaseClick(Sender: TObject);
begin
   gbBrowseFile.Visible := ( rbPurchase.Checked ) or ( rbSales.Checked );
end;

procedure TfmMartImport.btnReviewResultsClick(Sender: TObject);
const
  cTotalWgtOnFile = 'Total weight on file: %f';
  cTotalPriceOnFile = 'Total price on file: %f';
  cTotalWgtSaved = 'Total weight saved: %f';
  cTotalPriceSaved = 'Total price saved: %f';
  cNoOnFile = 'Number of %s on file: %d';
  cNoSaved = 'Number of %s saved: %d';
var
   i : Integer;
   s : string;
begin
   if mi = nil then Exit;

   mResults.Clear;
   mResults.Lines.Add('');
   for i := 0 to mi.OutputErrors.Count-1 do
      begin
         mResults.Lines.Add(mi.OutputErrors.Strings[i]);
      end;
   mResults.Lines.Add('');

   if mi.MartImportType = mitSale then
     begin
        s := 'Sales';
        mResults.Lines.Add(Format(cNoOnFile,[s, mi.OutputResult.NoOfSales]));
        mResults.Lines.Add(Format(cNoSaved,[s, mi.OutputResult.NoOfSalesSaved]));

        if mi.FileType = mftNIMovementOut then
           begin
              s := 'Deaths';
              mResults.Lines.Add(Format(cNoOnFile,[s, mi.OutputResult.NoOfDeaths]));
              mResults.Lines.Add(Format(cNoSaved,[s, mi.OutputResult.NoOfDeathsSaved]));
           end;
        mResults.Lines.Add(Format(cTotalWgtOnFile,[mi.OutputResult.TotalWeightRead]));
        mResults.Lines.Add(Format(cTotalWgtSaved,[mi.OutputResult.TotalWeightSaved]));
        mResults.Lines.Add(Format(cTotalPriceOnFile,[mi.OutputResult.TotalPriceRead]));
        mResults.Lines.Add(Format(cTotalPriceSaved,[mi.OutputResult.TotalPriceSaved]));
     end
   else if mi.MartImportType = mitPurchase then
     begin
        s := 'Purchases';
        mResults.Lines.Add(Format(cNoOnFile,[s, mi.OutputResult.NoOfPurchased]));
        mResults.Lines.Add(Format(cNoSaved,[s, mi.OutputResult.NoOfPurchasedSaved]));
        if mi.FileType = mftNIMovementIn then
           begin
              s := 'Calves';
              mResults.Lines.Add(Format(cNoOnFile,[s, mi.OutputResult.NoOfCalves]));
              mResults.Lines.Add(Format(cNoSaved,[s, mi.OutputResult.NoOfCalvesSaved]));
           end;
        mResults.Lines.Add(Format(cTotalWgtOnFile,[mi.OutputResult.TotalWeightRead]));
        mResults.Lines.Add(Format(cTotalWgtSaved,[mi.OutputResult.TotalWeightSaved]));
        mResults.Lines.Add(Format(cTotalPriceOnFile,[mi.OutputResult.TotalPriceRead]));
        mResults.Lines.Add(Format(cTotalPriceSaved,[mi.OutputResult.TotalPriceSaved]));
     end;

   mResults.Lines.Add('');
   if mi.OutputResult.NoReturned > 0 then
      begin
         mResults.Lines.Add('');
         mResults.Lines.Add(Format('Number of animals returned: %d',[mi.OutputResult.NoReturned]));
      end;

   ShowResults(True);
   if FileExists(OpenDialog.FileName) then
      kRoutines.DeleteFile(OpenDialog.FileName,True);
end;

procedure TfmMartImport.FormDestroy(Sender: TObject);
begin
   if mi <> nil then
      mi.Free;
end;

procedure TfmMartImport.UpdateScreen(var msg: TMessage);
begin
   if msg.Msg = WM_UpdateMartImportScreen then
      begin
         if fmMartImport <> nil then
           fmMartImport.Update;
      end;
end;

procedure TfmMartImport.SendEmail(AMartName: String);
const
   LineBreak = #13#10;
   DoubleLineBreak = LineBreak + LineBreak;
var
   HerdIdentity,
   EmailName,
   EmailAddress,
   PostalAddress,
   HerdIdentifier : String;
   iAddress : packed array [1..4] of string;
   i : Integer;
   Result : Boolean;
   SlaughterPlant : string;
   MyQuery : TQuery;
begin
   Result := false;
   MyQuery := TQuery.Create(nil);
   try
      MyQuery.DatabaseName := AliasName;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('SELECT O.Name, O.HerdIdentity, O.HerdIdentifier, O.Address1, O.Address2, O.Address3, O.Address4, O."E-Mail" FROM Owners O ');
      MyQuery.SQL.Add('Where (ID = ' + IntToStr(WinData.UserDefaultHerdID)+ ')' );
      MyQuery.Open;
      MyQuery.First;

      HerdIdentifier := (MyQuery.FieldByName('HerdIdentifier').AsString);
      HerdIdentity:= (MyQuery.FieldByName('HerdIdentity').AsString);
      EmailName := (MyQuery.FieldByName('Name').AsString);
      EmailAddress:= (MyQuery.FieldByName('E-Mail').AsString);
      iAddress[1] := (Trim(MyQuery.FieldByName('Address1').AsString));
      iAddress[2] := (Trim(MyQuery.FieldByName('Address2').AsString));
      iAddress[3] := (Trim(MyQuery.FieldByName('Address3').AsString));
      iAddress[4] := (Trim(MyQuery.FieldByName('Address4').AsString));

      while Pos(',', iAddress[1]) > 0 do
         Delete( iAddress[1], Pos(',', iAddress[1]), 1);
      while Pos(',', iAddress[2]) > 0 do
         Delete( iAddress[2], Pos(',', iAddress[2]), 1);
      while Pos(',', iAddress[3]) > 0 do
         Delete( iAddress[3], Pos(',', iAddress[3]), 1);
      while Pos(',', iAddress[4]) > 0 do
         Delete( iAddress[4], Pos(',', iAddress[4]), 1);

   finally
      MyQuery.Close;
   end;

   if Length(HerdIdentifier) <> 7 then
      begin
         MessageDlg('Your Herd Identifier '+HerdIdentifier+' is not valid. '+#13+
                    'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
      end
   else
      begin
         Result := True;
         for i := 1 to Length(HerdIdentifier) do
            begin
               if NOT (HerdIdentifier[i] IN (['0'..'9'])) then
                  begin
                     Result := False;
                     MessageDlg('Your Herd Identifier '+HerdIdentifier+' is not valid. '+#13+
                                'Please use a 7 digit number without spaces or separators',mtError,[mbOK],0);
                     uHerdSetUp.ShowTheForm( False, '' );
                  end;
            end;
      end;

   if Result then
      begin

         if iAddress[4] <> '' then
            PostalAddress := iAddress[1] + ', ' + iAddress[2]  + ', ' + iAddress[3]  + ', ' + iAddress[4] + DoubleLineBreak
         else if iAddress[3] <> '' then
            PostalAddress := iAddress[1] + ', ' + iAddress[2]  + ', ' + iAddress[3] + DoubleLineBreak
         else if iAddress[2] <> '' then
            PostalAddress := iAddress[1] + ', ' + iAddress[2] + DoubleLineBreak
         else if iAddress[1] <> '' then
            PostalAddress := iAddress[1]
         else
            begin
               MessageDlg('No postal address has been found.'+cCRLF+cCRLF+
                          'Please save the postal address in Herd Setup before continuing',mtWarning,[mbOK],0);
               uHerdSetUp.ShowTheForm( False, '');
               Exit;
            end;

{
         SlaughterPlant := TfmRemittanceMarts.SelectMart(AMartName);

         if Trim(SlaughterPlant) = '' then
            begin
               MessageDlg('Cannot proceed with registration until slaughter plant name is entered.',mtInformation,[mbOK],0);
               Exit;
            end;
}

         with MAPIMail do
            begin
               Reset;

               if AMartName = iMarts[0] then
                  begin
                     ToRecipient.Text := 'carnarossmart@eircom.net';
                  end
               else if AMartName = iMarts[1] then
                  begin
                     ToRecipient.Text := 'info@claremarts.ie';
                  end;

               Subject := 'Request Mart Movement Files';
               CcRecipient.Text := 'info@kingswood.ie';
               MessageBody.Text := 'Name: ' + EmailName + LineBreak + LineBreak +
                                   'Herd Number (BTE): ' + HerdIdentity + DoubleLineBreak +
                                   'Address: ' + PostalAddress +
                                   'E-Mail Address: ' + EmailAddress + DoubleLineBreak;
               SendMail;
            end;
      end;
end;

procedure TfmMartImport.miCarnarossMartClick(Sender: TObject);
begin
//   SendEmail(iMarts[miCarnarossMart.Tag]);
end;

procedure TfmMartImport.miClareMartsClick(Sender: TObject);
begin
//   SendEmail(iMarts[miClareMarts.Tag]);
end;

procedure TfmMartImport.btnPrintClick(Sender: TObject);
Var
    x, y, i: Integer;
begin
       with Printer do
        begin;
            BeginDoc;
            x := 100;
            y := 100;
            canvas.Font := mResults.Style.Font;
            with canvas do
            begin
                for i := 0 to mResults.lines.count - 1 do
                begin
                    textout(x, y, mResults.lines[i]);
                    inc(y, 100);
                    if y > 2900 then
                    begin
                        Newpage;
                        y := 100;
                    end;
                end;
            end;
            EndDoc;
        end;

end;

procedure TfmMartImport.btnConnectToAPHISClick(Sender: TObject);
begin
   // ShellExecute(Handle, 'open', 'https://eservices.ruralni.gov.uk/profile/login.asp', nil, nil, SW_SHOWNORMAL);
   // 23/02/12 [V5.0 R4.0] /MK Change - Link Request Change By TGM.
   ShellExecute(Handle, 'open', 'https://www2.dardni.gov.uk/gatewayweb/internet', nil, nil, SW_SHOWNORMAL);
end;

procedure TfmMartImport.OutputResults;
var
   fName : string;
begin
   if FMartFileKind = mftAHPIS then
      begin
         ForceDirectories(APHISMovementsDir);
         fName := ExtractFileName( OpenDialog.FileName );
         Delete(fName, Pos(ExtractFileExt( OpenDialog.FileName ),fName), MaxInt);
         fName := fName + ' ' + FormatDateTime('ddmmyy', Date) +' Result' + ExtractFileExt( OpenDialog.FileName );
         mResults.Lines.SaveToFile( APHISMovementsDir + fName );
         MessageDlg(Format('The APHIS file import results have been saved to '+cCRLF+cCRLF+
                    '"%s"',[APHISMovementsDir + fName]),mtInformation,[mbOK],0);
      end;
end;

procedure TfmMartImport.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if SaveOutputResults then
      OutputResults;
end;

procedure TfmMartImport.btnRequestMartEFileClick(Sender: TObject);
begin
   TfmMartEmailRequest.Execute(True);
end;

procedure TfmMartImport.ImportFile(AFileName: string);
var
  fext : string;
  AnimalCount : Integer;
begin
   if not FileExists(AFileName) then
      begin
         MessageDlg(Format('File "%s" could not be found.',[AFileName]),mtError,[mbOK],0);
         exit
      end;

   Screen.Cursor := crHourGlass;
   try
      rbPurchase.Enabled := False;
      rbSales.Enabled := False;
      gbMartFileTypeSelect.Enabled := False;
      gbBrowseFile.Enabled := False;
      btnBrowse.Enabled := False;
      lMartFilename.Enabled := False;
      lMartFilename.Caption := OpenDialog.FileName;
      Update;
      Application.ProcessMessages;
      if mi <> nil then
         mi.Free;

      mi := MartImport.Create(FHerdID);
      fext := Lowercase(ExtractFileExt(AFileName));
      if FMartFileKind = mftMART then
         begin
            if fext = '.xml' then
               mi.FileType := mftXML;
         end
      else if FMartFileKind = mftAHPIS then
         begin
            if ( fext = '.txt' ) or ( fext = '.csv' )  then
               begin
                  if rbPurchase.Checked then
                     mi.FileType := mftNIMovementIn
                  else if rbSales.Checked then
                     mi.FileType := mftNIMovementOut;
               end;
         end;
      mi.AllowDuplicateTags := WinData.GlobalSettings.AllowDuplicateTags;
      mi.Import(AFileName,AnimalCount);
      TfmFileAttachmentImport.MarkAttachmentAsRead(AFileName);
      //   13/12/19 [V5.9 R1.5] /MK Change - If there are no animals to import then don't show the Results screen - John Milliken.
      gbReviewResults.Visible := ( AnimalCount > 0 );
      btnCancel.Caption := 'Close';
      if ( gbReviewResults.Visible ) then
         btnReviewResults.Click
   finally
      Screen.Cursor := crDefault;
      update;
   end;
end;

procedure TfmMartImport.FormShow(Sender: TObject);
var
   FileName : string;
begin
   OnShow := nil;
   if ( FFileName <> '' ) then
      ImportFile(FFileName);

end;

procedure TfmMartImport.btnHelpClick(Sender: TObject);
begin
   if FMartFileKind = mftMART then
     WinData.HTMLHelp('martfiles.htm')
   else if FMartFileKind = mftAHPIS then
     WinData.HTMLHelp('aphismovements.htm');
end;

end.
