{
   05/03/09 [Dev 3.9 6.5] / SP - Program Addition - Include link to gmail.

   05/01/11 [V4.0 R7.4] /MK Additional Feature - Changed Health Event to Group Events - requested by GL.

   12/01/11 [V4.0 R7.5] /MK Change - Changed Hotmail back to Gmail.
                                   - Changed order of Calving and Other Events.
                                   - Changed Caption of Group Events to Other Events.
                                   - Changed Caption of cxLabel11 to On-farm Events.

   11/04/12 [V5.0 R4.8] /MK Bug Fix - btnReportsClick - No Need For SendMassage - Just Show Report Screen - Access Violation On Exit Of Reports.
}

unit uGettingStarted;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Db,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, dxmdaset,
  StdCtrls, cxButtons, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxSplitter, ExtCtrls, cxStyles, cxCheckBox, cxHyperLinkEdit,
  GenTypesConst, cxMemo, uEventsByGroup, uReports;

type
  TfmGettingStarted = class(TForm)
    dsQueryAnimal: TDataSource;
    QueryAnimal: TQuery;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Timer1: TTimer;
    Panel2: TPanel;
    pIrishHerdLinks: TPanel;
    Panel6: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnRegistration1: TcxButton;
    btnSaleOrDeath: TcxButton;
    btnRegistration2: TcxButton;
    btnCalving: TcxButton;
    btnReports: TcxButton;
    btnPurchaseAddAnimal: TcxButton;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    btnBlockEvents: TcxButton;
    cxLabel13: TcxLabel;
    lNBAS10Form: TcxLabel;
    lCMMSMovementFiles: TcxLabel;
    btnBackup: TcxButton;
    cxLabel15: TcxLabel;
    lStockBulls: TcxLabel;
    lProvenAISire: TcxLabel;
    lTestBeefAISires: TcxLabel;
    Panel3: TPanel;
    cxLabel8: TcxLabel;
    btnClose: TcxButton;
    Panel1: TPanel;
    teSearchAnimalTag: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    btnFind: TcxButton;
    btnClear: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1TagNo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    lTagNo: TcxLabel;
    lAnimalNo: TcxLabel;
    lDOB: TcxLabel;
    llactNo: TcxLabel;
    lRecNo: TcxLabel;
    cxLabel10: TcxLabel;
    lSex: TcxLabel;
    btnViewAnimal: TcxButton;
    Panel4: TPanel;
    Image1: TImage;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    cbDisplayAgain: TcxCheckBox;
    cxLabel16: TcxLabel;
    lSucklerCowEvents: TcxLabel;
    btnHelp: TcxButton;
    pOtherCountries: TPanel;
    lOtherCountriesTestBeefAISires: TcxLabel;
    lOtherCountriesStockBulls: TcxLabel;
    label45: TcxLabel;
    cxMemo1: TcxMemo;
    lgmail: TcxLabel;
    cxLabel14: TcxLabel;
    procedure btnFindClick(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnCalvingMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSaleOrDeathMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnFindMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnRegistration1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnRegistration2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnReportsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnClearMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxGrid1DBTableView1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPurchaseAddAnimalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbDisplayAgainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnPurchaseAddAnimalClick(Sender: TObject);
    procedure btnCalvingClick(Sender: TObject);
    procedure btnSaleOrDeathClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnViewAnimalClick(Sender: TObject);
    procedure btnViewAnimalMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lTagNoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lAnimalNoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lSexMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lDOBMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure llactNoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure teSearchAnimalTagMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure btnBlockEventsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnBlockEventsClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxLabel8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxHyperLinkEdit2Editing(Sender: TObject;
      var CanEdit: Boolean);
    procedure lNBAS10FormClick(Sender: TObject);
    procedure lCMMSMovementFilesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lNBAS10FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lCMMSMovementFilesClick(Sender: TObject);
    procedure btnBackupMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnBackupClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lStockBullsClick(Sender: TObject);
    procedure lProvenAISireClick(Sender: TObject);
    procedure lTestBeefAISiresClick(Sender: TObject);
    procedure lStockBullsMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lTestBeefAISiresMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure lProvenAISireMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lSucklerCowEventsClick(Sender: TObject);
    procedure lSucklerCowEventsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnRegistration1IrelandClick(Sender: TObject);
    procedure btnRegistration1NIrelandClick(Sender: TObject);
    procedure btnRegistration1EnglandClick(Sender: TObject);
    procedure btnRegistration2IrelandClick(Sender: TObject);
    procedure btnRegistration2NIrelandClick(Sender: TObject);
    procedure btnRegistration2EnglandClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure lOtherCountriesTestBeefAISiresMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure lOtherCountriesStockBullsMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure pOtherCountriesMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure pIrishHerdLinksMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lgmailClick(Sender: TObject);
    procedure lgmailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxMemo1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel15MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel16MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure label45MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxLabel14Click(Sender: TObject);

  private
    { Private declarations }
    FCountry : TCountry;
    FShowStartupCheckBox : Boolean;
    procedure ResetDisplayCaptions;
    function HasActiveMovement : Boolean;
    procedure CheckAnimalSelected;
    procedure SetupScreen;
    procedure LabelMouseMove(Sender: TObject);
    procedure PanelMouseMove(Sender: TObject);
  public
    { Public declarations }
    class function Run(AShowStartupCheckBox : Boolean; const ACountry : TCountry = Ireland) : Boolean;
  end;

var
  fmGettingStarted: TfmGettingStarted;

implementation
uses
   DairyData, SetupAnimals, uCalvings, uSalesDeaths, uCalfRegFlt,
   uICBFEventExport, uHealth, MenuUnit, uNBAS10Print,
   uCMMSFileImport, uDatabackup, BrowseRegisterU, uCTSBirthReg,
   uAPHISRegistration, uCTSMovementReg, uMartImport, uMartImportTypes,
   kRoutines, uMailBoxHelper;

{$R *.DFM}

procedure TfmGettingStarted.btnFindClick(Sender: TObject);
begin
   if Trim(teSearchAnimalTag.Text) = '' then
      begin
         ShowMessage('No search text has been entered');
         Abort;
      end;
   try
      with QueryAnimal do
         begin
            DisableControls;
            try
               Close;
               SQL.Clear;
               SQL.Add('Select ID, NatIdNum, animalNo, DateOfBirth, breeding, LactNo,');
               SQL.Add('Sex, PrimaryBreed,HerdId,InHerd from Animals where');
               SQL.Add('SearchNatId Like "%'+teSearchAnimalTag.Text+'%" And InHerd=True and AnimalDeleted=False');
               if WinData.UserDefaultHerdID > 0 then
                  SQL.Add('and HerdID = '+IntToStr(WinData.UserDefaultHerdID));
               Open;
            finally
               EnableControls;
            end;
            lRecNo.Caption := Format('%d animal(s) found',[RecordCount]);
         end;
   finally
      cxGrid1.Visible := True;
   end;
end;

procedure TfmGettingStarted.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   if AFocusedRecord <> nil then
      begin
         lTagNo.Caption := QueryAnimal.FieldByName('NatIdNum').Asstring;
         lSex.Caption := QueryAnimal.FieldByName('Sex').Asstring;
         lDOB.Caption := FormatDateTime('dd/mm/yyyy',QueryAnimal.FieldByName('DateOfBirth').asDatetime);
         lAnimalNo.Caption := QueryAnimal.FieldByName('AnimalNo').asString;
         lLactNo.Caption := QueryAnimal.FieldByName('LactNo').asString;
         if not WinData.AnimalFileByID.Locate('ID', QueryAnimal.FieldByName('ID').AsInteger, []) then
            raise Exception.Create('Animal record not found');
      end;
end;

procedure TfmGettingStarted.btnCalvingMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Clicking the "Calving" button will allow the recording of a calving event for the selected dam';

end;

procedure TfmGettingStarted.btnSaleOrDeathMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Clicking the "Sales/Death" button will allow the recording of a sale or death for the selected animal';

end;

procedure TfmGettingStarted.btnFindMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Clicking the "Find" button will search the animal database for all tag numbers that contain the search text entered';
end;

procedure TfmGettingStarted.btnRegistration1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   SubString : string;
begin
   Timer1.Enabled := True;
   if FCountry = Ireland then
      SubString := ' "Calf Registration" '
   else if FCountry = NIreland then
      SubString := ' "APHIS Registration" '
   else if FCountry = England then
      SubString := ' "CTS Birth Registration" ';
   if FCountry = NIreland then
      cxLabel7.Caption := Format('Clicking the%sbutton will allow you to register new/still born calves and deaths.',[SubString])
   else
      cxLabel7.Caption := Format('Clicking the%sbutton will allow you to register new born calves',[SubString])
end;

procedure TfmGettingStarted.btnRegistration2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   if FCountry = Ireland then
      cxLabel7.Caption := 'Clicking the "ICBF Event Registration" button will allow you to register breeding/culling events and pedigree calf registrations.'
   else if FCountry = NIreland then
      cxLabel7.Caption := 'Clicking the "APHIS Movement" button will allow you to record movement on/off information downloaded from APHIS website.'
   else if FCountry = England then
      cxLabel7.Caption := 'Clicking the "CTS Movement Registration" button will allow you to register movements on/off your herd.';
end;

procedure TfmGettingStarted.btnReportsMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'This button will allow access to the Report Section';
end;

procedure TfmGettingStarted.btnClearMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
    cxLabel7.Caption := 'Clicking the "Clear" button will reset the animal search';
end;

procedure TfmGettingStarted.cxGrid1DBTableView1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   if not QueryAnimal.Active then
      cxLabel7.Caption := 'Enter part of Nat. Id. No. to begin animal search'
   else
      cxLabel7.Caption := 'Click the Nat. Id. No. to begin recording events';
end;

procedure TfmGettingStarted.btnPurchaseAddAnimalMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Clicking the "Purchase/Add Animal" will add a new new animal into the herd';
end;

procedure TfmGettingStarted.cbDisplayAgainMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Tick this box if you do not want ''Getting Started'' to be shown at startup again';
end;

procedure TfmGettingStarted.btnCloseMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Click to close Getting Started';
end;

class function TfmGettingStarted.Run(AShowStartupCheckBox : Boolean; const ACountry : TCountry = Ireland) : Boolean;
begin
   Result := True;
   fmGettingStarted := TfmGettingStarted.Create(nil);
   with fmGettingStarted do
      try
         FCountry := ACountry;
         FShowStartupCheckBox := AShowStartupCheckBox;
         SetupScreen;
         ShowModal;
         Result := cbDisplayAgain.Checked;
      finally
         FreeAndNil(fmGettingStarted);
      end;
end;

procedure TfmGettingStarted.FormCreate(Sender: TObject);
begin
   ResetDisplayCaptions;
end;

procedure TfmGettingStarted.ResetDisplayCaptions;
begin
   lTagNo.Caption := '';
   lAnimalNo.Caption := '';
//   teSearchAnimalTag.Text := '';
   lSex.Caption := '';
   lDOB.Caption := '';
   llactNo.Caption := '';
   lRecNo.Caption := '';
end;

procedure TfmGettingStarted.btnClearClick(Sender: TObject);
begin
   ResetDisplayCaptions;
   with QueryAnimal do
      begin
         Close;
         teSearchAnimalTag.Text := '';
      end;
end;

procedure TfmGettingStarted.btnPurchaseAddAnimalClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      fSetUpAnimals.ImmediateCloseAfterSave := True;
      WinData.AnimalFileByID.Append;
      fSetUpAnimals.ShowForm(True);
      if ( QueryAnimal.Active ) and ( QueryAnimal.RecordCount > 0 ) then
      if not WinData.AnimalFileByID.Locate('ID', QueryAnimal.FieldByName('ID').AsInteger, []) then
         raise Exception.Create('Animal record not found');
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnCalvingClick(Sender: TObject);
begin
   CheckAnimalSelected;
   if QueryAnimal.FieldByName('Sex').AsString = cSex_Female then
      begin
         if QueryAnimal.FieldByName('Breeding').AsBoolean then
            begin
               if not HasActiveMovement then
                  begin
                     if WinData.HerdSpecies = cSpecies_Goats then
                        begin
                           { Check GOAT under 9 months }
                           if (QueryAnimal.FieldByName('DateOfBirth').AsDateTime > IncMonth(Date, -9)) then
                              raise errormsg.CreateFmt('Dam is less than 9 Months old',[nil])

                             { V3.8 R0.5 }
                           else if (QueryAnimal.FieldByName('DateOfBirth').AsDateTime > IncMonth(Date, -18)) then
                           { Check GOAT under 18 months, if so warn user }
                              if MessageDlg('Dam is less than 18 months old, continue anyway?',mtWarning,[mbYes,mbNo],0) = mrNo then
                                 Abort;
                             { #V3.8 R0.5 }
                        end
                     else
                        begin
                           if (Now() - QueryAnimal.FieldByName('DateOfBirth').AsDateTime) < 366 then
                              raise errormsg.CreateFmt('Dam is less than one year old',[nil])
                           else
                             { Check if animal is under 18 months old, if so warn user }
                             { V3.8 R0.5 }

                             if (QueryAnimal.FieldByName('DateOfBirth').AsDateTime > IncMonth(Date, -18)) then
                              //if (Now() - WinData.AnimalFileByIdDateOfBirth.AsDateTime) < 425 then
                              if MessageDlg('Dam is less than 18 months old, continue anyway?',mtWarning,[mbYes,mbNo],0) = mrNo then
                                 Abort;
                             { # V3.8 R0.5 }
                        end;

                     if ( QueryAnimal.FieldByName('LactNo').AsInteger > 0 ) then
                        begin
                           // Non-ICBF Registered animals do not require Dry Off Event.
                           if ( WinData.CheckEventExists(QueryAnimal.FieldByName('ID').AsInteger, QueryAnimal.FieldByName('LactNo').AsInteger, CDryOffEvent) ) then
                              begin
                                 Enabled := False;
                                 try
                                 ShowCalvings(Add);
                                 finally
                                    Enabled := True;
                                 end;
                              end
                           else if ( WinData.GlobalSettings.MandatoryBreedingEvents ) or ( WinData.GlobalSettings.MandatoryDryOffEvent ) then
                              Messagedlg('This Cow has no Drying Off Record',mtinformation,[mbok],0)
                           else
                              begin
                                 Enabled := False;
                                 try
                                    Update;
                                    ShowCalvings(Add);
                                 finally
                                    Enabled := True;
                                 end;
                              end;
                        end
                     else
                        begin
                           Enabled := False;
                           try
                              Update;
                              ShowCalvings(Add);
                           finally
                              Enabled := True;
                           end;
                        end;
                  end;
            end
         else
            ShowMessage('Animal is marked as NOT used for Breeding')
      end
   else
      ShowMessage('This is not a female animal');
end;

procedure TfmGettingStarted.btnSaleOrDeathClick(Sender: TObject);
begin
   CheckAnimalSelected;
   If QueryAnimal.FieldByName('PrimaryBreed').AsInteger <= 0 then
      begin
         MessageDLG('Animal Breed must be entered before entering Sale/Death Event',mtWarning,[mbOK],0);
         Abort;
      end;

   if NOT WinData.HasSaleDeath(QueryAnimal.FieldByName('ID').AsInteger,
                                  QueryAnimal.FieldByName('HerdID').AsInteger) then
      begin
         if not HasActiveMovement then
            begin
               // Need to locate a Sales Record for an animal if it exists.
               if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant, cSaleDeathEvent]),[] ) then
                  begin
                     Enabled := False;
                     try
                        Update;
                        ShowSalesDeaths(AmendSaleDeath, False);
                     finally
                        Enabled := True;
                     end;
                  end
               else   // Create a new Sales record
                  begin
                     Enabled := False;
                     try
                        Update;
                        ShowSalesDeaths(AddSale, False);
                     finally
                        Enabled := True;
                     end;
                  end;
            end;
      end
   else
      MessageDlg('Sale/Death event already exists',mtInformation,[mbOK],0);
end;

procedure TfmGettingStarted.btnCloseClick(Sender: TObject);
begin
   Close;
end;

function TfmGettingStarted.HasActiveMovement: Boolean;
begin
   Result :=  WinData.ActiveMovements(QueryAnimal.FieldByName('ID').AsInteger,
                                      QueryAnimal.FieldByName('HerdID').AsInteger,
                                      QueryAnimal.FieldByName('AnimalNo').AsString,
                                      QueryAnimal.FieldByName('NatIDNum').AsString,FALSE);
end;

procedure TfmGettingStarted.btnViewAnimalClick(Sender: TObject);
begin
   CheckAnimalSelected;
   Enabled := False;
   try
      fSetUpAnimals.ImmediateCloseAfterSave := True;
      fSetUpAnimals.ShowForm(False);
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnViewAnimalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Click the "View/Change Animal Details" button to change the details of the selected animal';
end;

procedure TfmGettingStarted.Timer1Timer(Sender: TObject);
begin
   Image1.Visible := not Image1.Visible;
//   Update;
end;

procedure TfmGettingStarted.Panel2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
//   cxLabel7.Caption := lAnimalEventsReports.Caption;
   Timer1.Enabled := False;
   Image1.Visible := False;
   cxLabel7.Caption := '';
   Update;

   FormMouseMove(Sender, Shift, x, y);
end;

procedure TfmGettingStarted.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   cxLabel7.Caption := '';
   Timer1.Enabled := False;
   Image1.Visible := False;
   FormMouseMove(Sender, Shift, x, y);
   Update;
end;

procedure TfmGettingStarted.CheckAnimalSelected;
const NoAnimalSelected = 'No animal has been selected';
begin
   if (QueryAnimal.Active) then
     begin
        if QueryAnimal.RecordCount = 0 then
           begin
              Showmessage(NoAnimalSelected);
              Abort;
           end;
     end
   else
      begin
         Showmessage(NoAnimalSelected);
         Abort;
      end;
end;

procedure TfmGettingStarted.lTagNoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Displays the "Nat. Id. No." of the selected animal';
end;

procedure TfmGettingStarted.lAnimalNoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Displays the "Animal Number" of the selected animal';
end;

procedure TfmGettingStarted.lSexMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Displays the "Sex" of the selected animal';
end;

procedure TfmGettingStarted.lDOBMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Displays the "Date of Birth" of the selected animal';
end;

procedure TfmGettingStarted.llactNoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Displays the "Lactation Number" of the selected animal';
end;

procedure TfmGettingStarted.teSearchAnimalTagMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := cxLabel1.Caption ;
end;

procedure TfmGettingStarted.Panel4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Move the mouse over each control to view its description';
   FormMouseMove(Sender, Shift, x, y);
end;

procedure TfmGettingStarted.FormDestroy(Sender: TObject);
begin
   QueryAnimal.Close;
end;

procedure TfmGettingStarted.btnBlockEventsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Click this button to record a variety of on-farm events using a block-event (multiple animal) method';
end;

procedure TfmGettingStarted.btnBlockEventsClick(Sender: TObject);
begin
   Update;
   uEventsByGroup.ShowTheForm(TNoEvent,True,True);
end;

procedure TfmGettingStarted.btnReportsClick(Sender: TObject);
begin
   if fmGettingStarted <> nil then
      //SendMessage(MenuForm.Handle, WM_ShowReportsScreen, integer(fmGettingStarted), 0);
      //   11/04/12 [V5.0 R4.8] /MK Bug Fix - No Need For SendMassage - Just Show Report Screen - Access Violation On Exit Of Reports.
      TfmReports.ShowReports(WinData.UserDefaultHerdID);
end;

procedure TfmGettingStarted.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   btnViewAnimal.Click;
end;

procedure TfmGettingStarted.cxLabel8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'The ''Getting Started'' menu provides easy access to the key functions of Kingswood Herd. '+
                       'It will continue to appear at program startup until you tick the box on the bottom right of panel. '+
                       'You can also temporarily ''Close'' it, if you wish to access the full program. To get back into'+
                       '''Getting Started'', click on the button at top left of main screen (beside Exit button).';

   FormMouseMove(Sender, Shift, x, y);
end;

procedure TfmGettingStarted.cxHyperLinkEdit2Editing(Sender: TObject;
  var CanEdit: Boolean);
begin
   Canedit := false;
end;

procedure TfmGettingStarted.lNBAS10FormClick(Sender: TObject);
begin
   if MessageDlg('Do you want to print the NBAS 10 form?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         TNBAS10Print.PrintNBAS10(WinData.UserDefaultHerdID);
      end;
end;

procedure TfmGettingStarted.lCMMSMovementFilesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   LabelMouseMove(Sender);
{   lCMMSMovementFiles.Style.Font.Color := clRed;
   lCMMSMovementFiles.Style.Font.Style := [fsUnderline];

   lStockBulls.Style.Font.Color := clblue;
   lStockBulls.Style.Font.Style := [];

   lProvenAISire.Style.Font.Color := clblue;
   lProvenAISire.Style.Font.Style := [];

   lTestBeefAISires.Style.Font.Color := clblue;
   lTestBeefAISires.Style.Font.Style := [];

   lNBAS10Form.Style.Font.Color := clblue;
   lNBAS10Form.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clblue;
   lSucklerCowEvents.Style.Font.Style := [];
}
end;

procedure TfmGettingStarted.lNBAS10FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   LabelMouseMove(Sender);
   {
   lCMMSMovementFiles.Style.Font.Color := clblue;
   lCMMSMovementFiles.Style.Font.Style := [];

   lStockBulls.Style.Font.Color := clblue;
   lStockBulls.Style.Font.Style := [];

   lProvenAISire.Style.Font.Color := clblue;
   lProvenAISire.Style.Font.Style := [];

   lTestBeefAISires.Style.Font.Color := clblue;
   lTestBeefAISires.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clblue;
   lSucklerCowEvents.Style.Font.Style := [];

   lNBAS10Form.Style.Font.Color := clRed;
   lNBAS10Form.Style.Font.Style := [fsUnderline];
   }
end;

procedure TfmGettingStarted.lCMMSMovementFilesClick(Sender: TObject);
begin
   if WinData.OwnerFile.Locate('ID',WinData.UserDefaultHerdID,[]) then
      begin
         TfmCMMSFileImport.ShowForm;
      end;
end;

procedure TfmGettingStarted.btnBackupMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   Timer1.Enabled := True;
   cxLabel7.Caption := 'Take a backup of the herd database.';
end;

procedure TfmGettingStarted.btnBackupClick(Sender: TObject);
begin
   TfmDataBackup.execute(daBackup);
end;

procedure TfmGettingStarted.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
   i : Integer;
begin
         for i := 0 to ControlCount-1 do
            begin
               if (Controls[i] is TcxLabel) then
                  begin
                     if (Controls[i] as TcxLabel).Tag = 1 then
                        begin
                           (Controls[i] as TcxLabel).Style.Font.Color := clblue;
                           (Controls[i] as TcxLabel).Style.Font.Style := [fsUnderLine];
                        end;
                  end;
            end;
   {lCMMSMovementFiles.Style.Font.Color := clblue;
   lCMMSMovementFiles.Style.Font.Style := [];

   lStockBulls.Style.Font.Color := clblue;
   lStockBulls.Style.Font.Style := [];

   lProvenAISire.Style.Font.Color := clblue;
   lProvenAISire.Style.Font.Style := [];

   lTestBeefAISires.Style.Font.Color := clblue;
   lTestBeefAISires.Style.Font.Style := [];

   lNBAS10Form.Style.Font.Color := clblue;
   lNBAS10Form.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clblue;
   lSucklerCowEvents.Style.Font.Style := [];
   }

end;

procedure TfmGettingStarted.lStockBullsClick(Sender: TObject);
begin
   //
   try
      with QueryAnimal do
         begin
            DisableControls;
            try
               Close;
               SQL.Clear;
               SQL.Add('Select ID, NatIdNum, animalNo, DateOfBirth, breeding, LactNo,');
               SQL.Add('Sex, PrimaryBreed,HerdId,InHerd from Animals where');
               SQL.Add('Sex = ''Steer'' And InHerd=True and AnimalDeleted=False');
               if WinData.UserDefaultHerdID > 0 then
                  SQL.Add('And HerdID = '+IntToStr(WinData.UserDefaultHerdID));
               Open;
            finally
               EnableControls;
            end;
            lRecNo.Caption := Format('%d Animal(s) Found',[RecordCount]);
         end;
   finally

   end;

   MessageDlg('Select a steer from the list and click View\Change Animal details.'+cCRLF+
              'This will allow you to change the Animal Sex from Steer to Bull.',mtInformation,[mbOK],0);
end;

procedure TfmGettingStarted.lProvenAISireClick(Sender: TObject);
begin
   MenuForm.BrowseSireRegister1Click(MenuForm.BrowseSireRegister1);
end;

procedure TfmGettingStarted.lTestBeefAISiresClick(Sender: TObject);
begin
   fSetUpAnimals.ImmediateCloseAfterSave := True;
   fSetUpAnimals.DefaultAnimalType := atAIBullTestBeef;
   MenuForm.AddAnimal;
end;

procedure TfmGettingStarted.lStockBullsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
{   lCMMSMovementFiles.Style.Font.Color := clblue;
   lCMMSMovementFiles.Style.Font.Style := [];

   lStockBulls.Style.Font.Color := clRed;
   lStockBulls.Style.Font.Style := [fsUnderline];

   lProvenAISire.Style.Font.Color := clblue;
   lProvenAISire.Style.Font.Style := [];

   lTestBeefAISires.Style.Font.Color := clblue;
   lTestBeefAISires.Style.Font.Style := [];

   lNBAS10Form.Style.Font.Color := clblue;
   lNBAS10Form.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clblue;
   lSucklerCowEvents.Style.Font.Style := [];
}
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.lTestBeefAISiresMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
{   lCMMSMovementFiles.Style.Font.Color := clblue;
   lCMMSMovementFiles.Style.Font.Style := [];

   lStockBulls.Style.Font.Color := clblue;
   lStockBulls.Style.Font.Style := [];

   lProvenAISire.Style.Font.Color := clblue;
   lProvenAISire.Style.Font.Style := [];

   lTestBeefAISires.Style.Font.Color := clRed;
   lTestBeefAISires.Style.Font.Style := [fsUnderline];

   lNBAS10Form.Style.Font.Color := clblue;
   lNBAS10Form.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clblue;
   lSucklerCowEvents.Style.Font.Style := [];}
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.lProvenAISireMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
{   lCMMSMovementFiles.Style.Font.Color := clblue;
   lCMMSMovementFiles.Style.Font.Style := [];

   lStockBulls.Style.Font.Color := clblue;
   lStockBulls.Style.Font.Style := [];

   lProvenAISire.Style.Font.Color := clRed;
   lProvenAISire.Style.Font.Style := [fsUnderline];

   lTestBeefAISires.Style.Font.Color := clblue;
   lTestBeefAISires.Style.Font.Style := [];

   lNBAS10Form.Style.Font.Color := clblue;
   lNBAS10Form.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clblue;
   lSucklerCowEvents.Style.Font.Style := [];
   }
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.lSucklerCowEventsClick(Sender: TObject);
begin
   if fmGettingStarted <> nil then
      SendMessage(MenuForm.Handle, WM_ShowSucklerCowEvents, integer(fmGettingStarted), 0);
   //


end;

procedure TfmGettingStarted.lSucklerCowEventsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
{   lCMMSMovementFiles.Style.Font.Color := clblue;
   lCMMSMovementFiles.Style.Font.Style := [];

   lStockBulls.Style.Font.Color := clblue;
   lStockBulls.Style.Font.Style := [];

   lProvenAISire.Style.Font.Color := clblue;
   lProvenAISire.Style.Font.Style := [];

   lTestBeefAISires.Style.Font.Color := clblue;
   lTestBeefAISires.Style.Font.Style := [];

   lNBAS10Form.Style.Font.Color := clblue;
   lNBAS10Form.Style.Font.Style := [];

   lSucklerCowEvents.Style.Font.Color := clRed;
   lSucklerCowEvents.Style.Font.Style := [fsUnderline];
   }
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.SetupScreen;
begin
   cbDisplayAgain.Visible := FShowStartupCheckBox;
   if FCountry = Ireland then
      begin
         pIrishHerdLinks.Visible := True;
         pOtherCountries.Visible := False;
         btnRegistration1.Caption := 'Calf Registration';
         btnRegistration1.OnClick := btnRegistration1IrelandClick;

         btnRegistration2.Caption := 'ICBF Event Registration';
         btnRegistration2.OnClick := btnRegistration2IrelandClick;
      end
   else if FCountry = NIreland then
      begin
         pIrishHerdLinks.Visible := False;
         pOtherCountries.Visible := True;
         btnRegistration1.Caption := 'APHIS Registration';
         btnRegistration1.OnClick := btnRegistration1NIrelandClick;

         btnRegistration2.Caption := 'APHIS Movement';
         btnRegistration2.OnClick := btnRegistration2NIrelandClick;
      end
   else if FCountry = England then
      begin
         pIrishHerdLinks.Visible := False;
         pOtherCountries.Visible := True;
         btnRegistration1.Caption := 'CTS Birth Reg.';
         btnRegistration1.OnClick := btnRegistration1EnglandClick;

         btnRegistration2.Caption := 'CTS Movement Reg.';
         btnRegistration2.OnClick := btnRegistration2EnglandClick;
      end;
end;

procedure TfmGettingStarted.btnRegistration1EnglandClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      TfmCTSWSBirthReg.Execute;
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnRegistration1IrelandClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      uCalfRegFlt.ShowForm;
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnRegistration1NIrelandClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      uAPHISRegistration.ShowForm(APHISBirths);
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnRegistration2EnglandClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      TfmCTSWSMovementReg.Execute;
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnRegistration2IrelandClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      uICBFEventExport.ShowTheForm;
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnRegistration2NIrelandClick(Sender: TObject);
begin
   Enabled := False;
   try
      Update;
      TfmMartImport.open(mftAHPIS, WinData.userDefaultHerdID);
   finally
      Enabled := True;
   end;
end;

procedure TfmGettingStarted.btnHelpClick(Sender: TObject);
begin
   if FCountry = Ireland then
      begin
         WinData.HTMLHelp('gettingstarted.htm');
      end
   else if FCountry = NIreland then
      begin
         WinData.HTMLHelp('gettingstartedNI.htm');
      end
   else if FCountry = England then
      begin
         WinData.HTMLHelp('gettingstartedGB.htm');
      end;
end;

procedure TfmGettingStarted.LabelMouseMove(Sender: TObject);
var
   i : Integer;
   ControlParent : TWinControl;
begin
   if not (Sender is TcxLabel) then exit;
   ControlParent := (Sender as TcxLabel).Parent;

   if (ControlParent is TPanel) then
      begin
         for i := 0 to (ControlParent as TPanel).ControlCount-1 do
            begin
               if ((ControlParent as TPanel).Controls[i] is TcxLabel) then
                  begin
                     if ((ControlParent as TPanel).Controls[i] as TcxLabel).Tag = 1 then
                        begin

                           if ((ControlParent as TPanel).Controls[i] as TcxLabel) = Sender then
                              begin
                                 ((ControlParent as TPanel).Controls[i] as TcxLabel).Style.Font.Color := clRed;
                                 ((ControlParent as TPanel).Controls[i] as TcxLabel).Style.Font.Style := [fsUnderline];
                              end
                           else
                              begin
                                 ((ControlParent as TPanel).Controls[i] as TcxLabel).Style.Font.Color := clblue;
                                 ((ControlParent as TPanel).Controls[i] as TcxLabel).Style.Font.Style := [fsUnderLine];
                              end;
                        end;
                  end;
            end;
      end;
end;

procedure TfmGettingStarted.lOtherCountriesTestBeefAISiresMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.lOtherCountriesStockBullsMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.pOtherCountriesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   PanelMouseMove(Sender);
end;

procedure TfmGettingStarted.PanelMouseMove(Sender: TObject);
var
   i : Integer;
begin
   if (Sender is TPanel) then
      begin
         for i := 0 to (Sender as TPanel).ControlCount-1 do
            begin
               if ((Sender as TPanel).Controls[i] is TcxLabel) then
                  begin
                     if ((Sender as TPanel).Controls[i] as TcxLabel).Tag = 1 then
                        begin
                           ((Sender as TPanel).Controls[i] as TcxLabel).Style.Font.Color := clblue;
                           ((Sender as TPanel).Controls[i] as TcxLabel).Style.Font.Style := [fsUnderLine];
                        end;
                  end;
            end;
      end;
end;

procedure TfmGettingStarted.pIrishHerdLinksMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   PanelMouseMove(Sender);
end;

procedure TfmGettingStarted.lgmailClick(Sender: TObject);
begin
   OpenUrl(cGmailAddress);

end;

procedure TfmGettingStarted.lgmailMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   LabelMouseMove(Sender);
end;

procedure TfmGettingStarted.cxMemo1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   PanelMouseMove(pIrishHerdLinks);

end;

procedure TfmGettingStarted.cxLabel15MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   PanelMouseMove(pIrishHerdLinks);
end;

procedure TfmGettingStarted.cxLabel16MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   PanelMouseMove(pIrishHerdLinks);

end;

procedure TfmGettingStarted.label45MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   PanelMouseMove(pOtherCountries);

end;

procedure TfmGettingStarted.cxLabel14Click(Sender: TObject);
begin
   WinData.EditMailboxSettings;
end;

end.
