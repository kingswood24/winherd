{
   16/12/10 [V4.0 R7.2] /MK Change - FormCreate - If Herd IS NI/GB Then Do Not Show Herd Designator.

   23/02/11 [V4.0 R8.4] /MK Additional Feature - Added New Milk Recorder Drop-Down-List For UK Herd.

   14/11/11 [V5.0 R2.1] /MK Bug Fix - No Need WinData.ValidateHerd Check As WinData.OwnerFileHerdIdentityChange Already Looks After This.

   27/06/12 [V5.0 R7.3] /MK Change - Hid SearchOn Label And ComboBox As SearchOn Now Being Set From MenuUnit.SearchColumnChange.

   24/08/16 [V5.6 R0.0] /MK Additional Feature - Added dbcmboTagPreFix component to let Irish customer change between the IE and 372 tag prefix's.

   28/10/16 [V5.6 R2.8] /MK Change - Added better validation for invalid BTE Herd Numbers and duplicate Herd Numbers.

   21/11/16 [V5.6 R3.3] /MK Bug Fix - Validation removed for None Herd.

   22/02/17 [V5.6 R5.5] /MK Change - Changed caption of LHerdPrefix to Pedigree Prefix - GL request.

   04/07/17 [V5.6 R9.1] /MK Bug Fix - DBNavigatorBeforeAction - WinData.SystemRegisteredCountry is not useful here because it hasn't been set yet by new value of EditHerdIdentity.

   06/10/17 [V5.7 R3.7] /MK Additional Feature - Added new checkbox for Rollover Herd that looks at new NIRolloverHerd field in the Owners table.

   13/10/17 [V5.7 R3.0] /MK Change - Give users that don't have the pedigree module the ability to enter in the Pedigree Name - GL/SP request.

   19/11/19 [V5.9 R1.3] /MK Change - GetIsEnglishHerd - If Owners.Country is Scotland, England, Wales then treat as England i.e. Britain.
                                   - ShowTheForm - SetHightLightField - Allow highlight of TRxDBLookupCombo components like UKMilkRecorder.

   20/11/19 [V5.9 R1.3] /MK Change - DBNavigatorBeforeAction - Change warning from "Country must be selected" to "Registered In must be selected".
                                   - Moved SetHightLightField out of ShowTheForm so that it can be used within other routines in the form.
}

Unit uHerdSetUp;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, RXLookup, RXCtrls,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, RxDBComb, DBTables, kwDBNavigator,
  ActnList, Menus, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDBEdit, cxDropDownEdit, uHerdLookup, KDBRoutines;

type
  TfHerdSetUp = class(TForm)
    Label1: TLabel;
    EditHerdIdentity: TDBEdit;
    dbcbAutumnCalving: TDBCheckBox;
    dbcbRestricted: TDBCheckBox;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton5: TToolButton;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton4: TToolButton;
    DBNavigator: TkwDBNavigator;
    cbSearchField: TRxDBComboBox;
    lSearchOn: TLabel;
    tOwners: TTable;
    cbVatReg: TDBCheckBox;
    lFixedCosts: TLabel;
    FixedCosts: TDBEdit;
    dbeVATRate: TDBEdit;
    pSuckQuota: TPanel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    pMilkQuota: TPanel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    pNIEntry: TPanel;
    EditAddress: TDBEdit;
    EditAddress2: TDBEdit;
    EditAddress3: TDBEdit;
    EditAddress4: TDBEdit;
    pIEntry: TPanel;
    EditTitle: TDBEdit;
    NIEditName: TDBEdit;
    NIEditSurname: TDBEdit;
    Surname: TLabel;
    Firstname: TLabel;
    Title: TLabel;
    Label26: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Name: TLabel;
    DBEditName: TDBEdit;
    Label27: TLabel;
    DBEdit7: TDBEdit;
    Label28: TLabel;
    DBEdit8: TDBEdit;
    Label29: TLabel;
    DBEdit9: TDBEdit;
    Label30: TLabel;
    gbPurchaseGroupSettings: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    Bevel2: TBevel;
    dbcbFQAS: TDBCheckBox;
    BladeFarmerID: TDBEdit;
    lBladeFarmerID: TLabel;
    btnForageAreaCalc: TButton;
    lHerdIdentifier: TLabel;
    HerdIdentifier: TDBEdit;
    lDesignator: TLabel;
    pTownlandInfo: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label10: TLabel;
    Label22: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel3: TBevel;
    EditPlaceForInspection: TDBEdit;
    EditPlaceForInspection2: TDBEdit;
    EditOwnedORCommage: TDBEdit;
    EditOwnedORCommage2: TDBEdit;
    EditDED2: TDBEdit;
    EditDED: TDBEdit;
    EditTownLand2: TDBEdit;
    EditTownLand: TDBEdit;
    pOther: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    LHerdPrefix: TLabel;
    LHFSPin: TLabel;
    Label25: TLabel;
    EditMilkRecordingID: TDBEdit;
    EditPhone: TDBEdit;
    EditFax: TDBEdit;
    EditEmail: TDBEdit;
    HerdType: TRxDBLookupCombo;
    HerdPreFix: TDBEdit;
    HFSPin: TDBEdit;
    cbRegisteredIn: TRxDBLookupCombo;
    cmboQuerySpecies: TRxDBLookupCombo;
    pGBLocationCodes: TPanel;
    BLoc: TcxDBMaskEdit;
    lBirthLocationCode: TLabel;
    PLoc: TcxDBMaskEdit;
    lPostalLocationCode: TLabel;
    BSLoc: TcxDBMaskEdit;
    Label33: TLabel;
    PSLoc: TcxDBMaskEdit;
    Label34: TLabel;
    Label35: TLabel;
    MHSLoc: TcxDBTextEdit;
    SLoc: TcxDBMaskEdit;
    Label36: TLabel;
    Label31: TLabel;
    Loc: TcxDBMaskEdit;
    dbcbOrganicHerd: TDBCheckBox;
    lUKNatIDPrefix: TLabel;
    pMilkRecorder: TPanel;
    cmboMilkRecorder: TRxDBLookupCombo;
    dbcmboTagPrefix: TcxDBComboBox;
    pForageArea: TPanel;
    Label5: TLabel;
    DBEdit10: TDBEdit;
    lMilkRecorder: TLabel;
    dbNIRollOverHerd: TDBCheckBox;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure EditHerdIdentityExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure HerdTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HerdTypeCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbRegisteredInCloseUp(Sender: TObject);
    procedure BladeFarmerIDExit(Sender: TObject);
    procedure EditHerdIdentityChange(Sender: TObject);
    procedure cmboQuerySpeciesChange(Sender: TObject);
    procedure DBNavigatorBeforeAction(Sender: TObject;
      Button: TKNavigateBtn);
    procedure btnForageAreaCalcClick(Sender: TObject);
    procedure DBNavigatorClick(Sender: TObject; Button: TKNavigateBtn);
    procedure HerdIdentifierKeyPress(Sender: TObject; var Key: Char);
  private
    function GetIsIrishHerd: Boolean;
    function GetIsNIHerd: Boolean;
    function GetIsEnglishHerd: Boolean;
  private
    FFormShowing : Boolean;
    FModified : Boolean;
    procedure SetModifiedFlag;
    function GetMilkQuota: Boolean;
    procedure SetMilkQuota(const Value: Boolean);
    procedure SetNIFields;
    procedure SetFQASVisible;
    procedure SetSpeciesInUse;
    procedure SetupHerdTypeVisible;
    procedure SetHightLightField(FieldToHighlight: String);
    property IsIrishHerd : Boolean read GetIsIrishHerd;
    property IsNIHerd : Boolean read GetIsNIHerd;
    property IsEnglishHerd : Boolean read GetIsEnglishHerd;
  private
    { private declarations }
      property MilkQuota : Boolean read GetMilkQuota write SetMilkQuota;
      procedure AlterHerdTypes(const Alter : Boolean);
      procedure ResetControlColour(Sender : TObject);
  public
    { public declarations }
  end;

procedure ShowTheForm ( AddingRecord : Boolean; HighLightField : String = '');                   // added 1/00

var                                                               // changed 1/00
  fHerdSetUp: TfHerdSetUp;

implementation
uses
    DEF,
    Dialogs,
    DairyData,
    GenTypesConst, uSelectFarm, KRoutines;
{
var                                                                 // changed 1/00
  fHerdSetUp: TfHerdSetUp;
            }
{$R *.DFM}

procedure ShowTheForm ( AddingRecord : Boolean; HighLightField : String = '');
begin
    Application.CreateForm(TfHerdSetUp, fHerdSetUp);
    try
       // show blank
       if AddingRecord then
          WinData.OwnerFile.Append;

       fHerdSetUp.SetHightLightField(HighLightField);

       // record upon
       fHerdSetUp.ShowModal;
    finally
       FreeAndNil(fHerdSetUp);
    end;
end;

procedure TfHerdSetUp.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfHerdSetUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Close the File
   tOwners.Close;
end;

procedure TfHerdSetUp.FormActivate(Sender: TObject);
begin
   // Open the file to check the HErd Identity
   try
      tOwners.Open;
   except
      ShowMessage('Cannot open file');
   end;

   SetNIFields;

   // Check for Pedigree Module
   LHFSPin.Visible := DEF.Definition.dUsePedigree;
   HFSPin.Visible := LHFSPin.Visible;

   if Def.Definition.dUsePremiums then
      pSuckQuota.Visible := True
   else
      pSuckQuota.Visible := False;

   FFormShowing := True;
   FModified := False;

end;

procedure TfHerdSetUp.HelpBtnClick(Sender: TObject);
begin
   WinData.HTMLHelp('herd.htm');
end;

procedure TfHerdSetUp.EditHerdIdentityExit(Sender: TObject);
var
   NewHerdID : String;
   Country : TCountry;
begin
   Country := HerdLookup.GetTCountryByText(cbRegisteredIn.Text);

   if ( not(HerdLookup.IsValidHerdNumber(Country,EditHerdIdentity.Text)) ) then
      begin
         MessageDlg(cInvalid_Irish_HerdNumber,mtError,[mbOK],0);
         if ( DBNavigator.DataSource.DataSet.State in dsEditModes ) then
            DBNavigator.DataSource.DataSet.Cancel;
      end;
   if ( HerdLookup.IsDuplicateHerdNumber(WinData.OwnerFileID.AsInteger, EditHerdIdentity.Text) ) then
      begin
         MessageDlg(cDuplicate_HerdNumber,mtError,[mbOK],0);
         if ( DBNavigator.DataSource.DataSet.State in dsEditModes ) then
            DBNavigator.DataSource.DataSet.Cancel;
      end;
end;

procedure TfHerdSetUp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := WinData.DataSetApplyUpdates(Windata.OwnerFile, ModalResult = mrOK, FModified );
end;

procedure TfHerdSetUp.RxDBGrid1CellClick(Column: TColumn);
begin
   SetNIFields;
   MilkQuota;
   SetFQASVisible;
   SetSpeciesInUse;
   SetupHerdTypeVisible;
   pGBLocationCodes.Visible := ( WinData.SystemRegisteredCountry = England );
   pMilkRecorder.Visible := ( not(WinData.SystemRegisteredCountry = Ireland) );
   cmboMilkRecorder.Visible := ( not(WinData.SystemRegisteredCountry = Ireland) );
   dbNIRollOverHerd.Visible := ( WinData.SystemRegisteredCountry = NIreland );
end;

function TfHerdSetUp.GetMilkQuota: Boolean;
begin
   if ((Def.Definition.dUseManCal) and (HerdType.Text = 'Dairy')) then
      MilkQuota := True
   else
      MilkQuota := False;
end;

procedure TfHerdSetUp.SetMilkQuota(const Value: Boolean);
begin
   pMilkQuota.Visible := Value;
end;

procedure TfHerdSetUp.HerdTypeChange(Sender: TObject);
begin
   MilkQuota;
   SetFQASVisible;
   SetSpeciesInUse;
   SetupHerdTypeVisible;
   EditHerdIdentityChange(Sender);
end;

procedure TfHerdSetUp.FormShow(Sender: TObject);
begin
   AlterHerdTypes(((Def.Definition.dUsePremiums) and
                  (not Def.Definition.dUseManCal  ) and
                  (not Def.Definition.dUseQuotaMan) and
                  (not Def.Definition.dUseMilkRec ) and
                  (not Def.Definition.dUsePedigree)) and not Def.Definition.dPDAStandalone );
   WinData.OwnerFile.First;
   WinData.OwnerFile.Next;
   MilkQuota;
   SetFQASVisible;
   SetSpeciesInUse;
   SetupHerdTypeVisible;
end;

procedure TfHerdSetUp.HerdTypeCloseUp(Sender: TObject);
begin
   MilkQuota;
   SetFQASVisible;
   SetSpeciesInUse;
   SetupHerdTypeVisible;
end;

procedure TfHerdSetUp.SetNIFields;
begin
   dbcmboTagPreFix.Visible := IsIrishHerd;
   pIEntry.Visible := IsIrishHerd;
   lDesignator.Visible := IsIrishHerd;
   HerdIdentifier.Visible := IsIrishHerd;
   lHerdIdentifier.Visible := IsIrishHerd;
   HerdIdentifier.Enabled := IsIrishHerd;
   RxDBGrid1.Columns[1].Visible := IsIrishHerd; // Name

   dbcbFQAS.Visible := IsNIHerd;

   lUKNatIDPrefix.Visible := ( IsNIHerd or IsEnglishHerd );
   pNIEntry.Visible := ( not(IsIrishHerd) );
   pMilkRecorder.Visible := ( not(IsIrishHerd) );
   cmboMilkRecorder.Visible := ( not(IsIrishHerd) );
   cmboMilkRecorder.Enabled := ( not(IsIrishHerd) );
   RxDBGrid1.Columns[2].Visible := ( not(IsIrishHerd) ); // Title
   RxDBGrid1.Columns[3].Visible := ( not(IsIrishHerd) ); // First Name

   pGBLocationCodes.Visible := IsEnglishHerd;

   dbNIRollOverHerd.Visible := IsNIHerd;

   if ( IsIrishHerd ) then
       begin
          pOther.Top := 270;
          pNIEntry.Top := 85;
          lHerdIdentifier.Caption := 'Number (BTE)';
          lDesignator.Caption := 'Designator';
          EditHerdIdentity.Left := 116;
          EditHerdIdentity.Width := 96;
       end
    else
       begin
          pOther.Top := 332;
          pNIEntry.Top := 99;
          if ( IsEnglishHerd ) then
             lUKNatIDPrefix.Caption := 'UK'
          else if ( IsNIHerd ) then
             lUKNatIDPrefix.Caption := 'UK 9';
          if ( IsEnglishHerd ) or ( IsNIHerd ) then
             EditHerdIdentity.Left := 152
          else
             EditHerdIdentity.Left := 116;
          EditHerdIdentity.Width := 176;
       end;
end;

procedure TfHerdSetUp.AlterHerdTypes(const Alter: Boolean);
begin
   with WinData.qHerdType do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT ID, Description    ');
         SQL.Add('FROM "GenLook.DB"                  ');
         if Alter then
            SQL.Add('WHERE ((ListType = '+ IntToStr(LHerdType) +') AND (Description = "Beef"))')
         else
            SQL.Add('WHERE (ListType = '+ IntToStr(LHerdType) +') ORDER BY Description ');
         Open;
      end;
end;

procedure TfHerdSetUp.FormCreate(Sender: TObject);
var
   x,
   y : LongInt;
begin
   pGBLocationCodes.Visible := not(WinData.SystemRegisteredCountry = Ireland);

   dbNIRollOverHerd.Visible := ( WinData.SystemRegisteredCountry = NIreland );

   pMilkRecorder.Visible := not(WinData.SystemRegisteredCountry = Ireland);
   cmboMilkRecorder.Visible := not(WinData.SystemRegisteredCountry = Ireland);

   if WinData.OwnerFile.RecordCount > 1 then
      DBNavigator.VisibleButtons := [kwnbPost, kwnbCancel,kwnbDelete,kwnbFirst,kwnbPrior,kwnbNext,kwnbLast]
   else
      DBNavigator.VisibleButtons := [kwnbPost,kwnbCancel,kwnbInsert,kwnbDelete,kwnbFirst,kwnbPrior,kwnbNext,kwnbLast];

   x := GetSystemMetrics(SM_CXSCREEN);
   y := GetSystemMetrics(SM_CYSCREEN);
   if (x=xPixels) and (y=yPixels) then
      WindowState := wsMaximized
   else
      Position := poDesktopCenter;

   pNIEntry.Visible := False;
   pIEntry.Visible  := False;

   { BLADE SP 27/02/04 }
   lBladeFarmerID.Visible := WinData.GlobalSettings.BladeRegistered;
   BladeFarmerID.Visible := lBladeFarmerID.Visible;

   dbcmboTagPreFix.Properties.Items.Clear;
   dbcmboTagPreFix.Properties.Items.Add(cTagPreFix_IE);
   dbcmboTagPreFix.Properties.Items.Add(cTagPreFix_372);
end;

procedure TfHerdSetUp.cbRegisteredInCloseUp(Sender: TObject);
begin
   SetNIFields;
   WinData.ValidateHerd;
end;

procedure TfHerdSetUp.SetFQASVisible;
begin
//   FQAS.Visible := HerdType.Text <> 'Ireland';
end;

procedure TfHerdSetUp.ResetControlColour(Sender : TObject);
begin
   if (Sender is TDBEdit) then
      if (Sender as TDBEdit).Color = $0080FF00 then
         (Sender as TDBEdit).Color := clWindow;
end;

procedure TfHerdSetUp.BladeFarmerIDExit(Sender: TObject);
begin
   ResetControlColour(sender);
end;

procedure TfHerdSetUp.EditHerdIdentityChange(Sender: TObject);
begin
   SetModifiedFlag;
end;

procedure TfHerdSetUp.SetModifiedFlag;
begin
   if FFormShowing then FModified := True;
end;

procedure TfHerdSetUp.SetSpeciesInUse;
begin
   cmboQuerySpecies.Enabled := not WinData.HerdInUse(WinData.OwnerFileID.AsInteger);
end;

procedure TfHerdSetUp.SetupHerdTypeVisible;
begin
   // Set Herd Type visible based field value in owner file.
   if cmboQuerySpecies.Text = cSpecies_Bovine then
      begin
         HerdType.Visible := True;
         Label4.Visible := True;
      end
   else
      begin
         HerdType.Visible := False;
         Label4.Visible := False;
      end;
end;

procedure TfHerdSetUp.cmboQuerySpeciesChange(Sender: TObject);
begin
   // Set Herd Type visible based on selection user has chosen from species
   if cmboQuerySpecies.Text = cSpecies_Bovine then
      begin
         HerdType.Visible := True;
         Label4.Visible := True;
      end
   else
      begin
         HerdType.Visible := False;
         Label4.Visible := False;
      end;
end;

procedure TfHerdSetUp.DBNavigatorBeforeAction(Sender: TObject; Button: TKNavigateBtn);
var
   IDOK : Boolean;
   Country : TCountry;
begin
   //   21/11/16 [V5.6 R3.3] /MK Bug Fix - Validation removed for None Herd.
   if ( WinData.OwnerFileID.AsInteger = WinData.NONEHerdID ) then Exit;

   Country := HerdLookup.GetTCountryByText(cbRegisteredIn.Text);

   if ( UpperCase(cmboQuerySpecies.Text) <> UPPERCASE(cSpecies_Bovine) ) then
      begin
         WinData.OwnerFileTypeOfHerd.Value := WinData.HerdType_DairyID;
         HerdType.Value := IntToStr(WinData.HerdType_DairyID);
      end;

   IDOK := True;
   if ( tOwners.Locate('HerdIdentity',WinData.OwnerFileHerdIdentity.AsString,[loCaseInsensitive]) ) then
      IDOK := ( tOwners.fieldByName('ID').AsInteger = WinData.OwnerFileID.AsInteger );

   if ( not(IDOK) ) then
      begin
         MessageDLG('Herd Identity already exists',mtWarning,[mbOK],0);
         EditHerdIdentity.SetFocus;
         Abort;
      end
   else if ( not(WinData.qCountries.Locate('ID',cbRegisteredIn.Value,[])) ) then
      begin
         //   20/11/19 [V5.9 R1.3] /MK Change - Change warning from "Country must be selected" to "Registered In must be selected".
         MessageDLG('Registered In must be selected before the Herd can be saved', mtInformation,[mbOK], 0);
         SetHightLightField('Country');
         Abort;
      end
   else if ( not(WinData.GenLookUp.Locate('ID',WinData.OwnerFileTypeOfHerd.Value,[])) ) then
      begin
         // only display warning message if Bovine Herd
         if ( WinData.SpeciesByID(cmboQuerySpecies.KeyValue) <> cSpecies_Bovine ) then
            begin
               MessageDLG('Type of Herd must be selected before the Herd can be saved', mtInformation,[mbOK],0);
               Abort;
            end;
      end;

   if ( Button = kwnbPost ) then
      begin
         if ( not(HerdLookup.IsValidHerdNumber(Country,EditHerdIdentity.Text)) ) then
            begin
               MessageDlg(cInvalid_Irish_HerdNumber,mtInformation,[mbOK],0);
               Abort;
            end;

         if ( HerdLookup.IsDuplicateHerdNumber(WinData.OwnerFileID.AsInteger, EditHerdIdentity.Text) ) then
            begin
               MessageDlg(cDuplicate_HerdNumber,mtError,[mbOK],0);
               Abort;
            end;

         //   04/07/17 [V5.6 R9.1] /MK Bug Fix - WinData.SystemRegisteredCountry is not useful here because it hasn't been set yet by new value of EditHerdIdentity.
         if ( Country <> Ireland ) then Exit;
         if ( dbcmboTagPreFix.Text = cTagPreFix_IE ) then Exit;
         if ( not(ValidEIDTagFormat(HerdIdentifier.Text)) ) then
            begin
               MessageDlg(cInvalid_Irish_BovineRange_HerdNo,mtError,[mbOK],0);
               Abort;
            end;
      end;

  //   14/11/11 [V5.0 R2.1] /MK Bug Fix - No Need For This Check As WinData.OwnerFileHerdIdentityChange Already Looks After This.
  //   WinData.ValidateHerd;
end;

procedure TfHerdSetUp.btnForageAreaCalcClick(Sender: TObject);
var
   FarmID : Integer;
begin
   FarmID := uSelectFarm.CreateAndShow;
   if (FarmID >-1) then
      begin
         if not ( WinData.OwnerFile.State in dsEditModes ) then
            WinData.OwnerFile.Edit;
         WinData.OwnerFile.FieldByName('ForageAreaHa').AsFloat := CalcPaddocksForageArea(FarmID);
      end;
end;

procedure TfHerdSetUp.DBNavigatorClick(Sender: TObject;
  Button: TKNavigateBtn);
begin
   pGBLocationCodes.Visible := not(WinData.SystemRegisteredCountry = Ireland);
   pMilkRecorder.Visible := not(WinData.SystemRegisteredCountry = Ireland);
   cmboMilkRecorder.Visible := not(WinData.SystemRegisteredCountry = Ireland);
   cmboMilkRecorder.Enabled := True;
   dbNIRollOverHerd.Visible := ( WinData.SystemRegisteredCountry = NIreland );
end;

procedure TfHerdSetUp.HerdIdentifierKeyPress(Sender: TObject; var Key: Char);
begin
   if ( not(Key in [#8, '0'..'9']) ) then
      Key := #0;
end;

function TfHerdSetUp.GetIsIrishHerd: Boolean;
begin
   Result := ( WinData.OwnerFile.FieldByName('Country').AsInteger = 1 );
end;

function TfHerdSetUp.GetIsNIHerd: Boolean;
begin
   Result := ( WinData.OwnerFile.FieldByName('Country').AsInteger = 12 );
end;

function TfHerdSetUp.GetIsEnglishHerd: Boolean;
begin
   Result := ( WinData.OwnerFile.FieldByName('Country').AsInteger in [7, 14, 15, 16] );
end;

procedure TfHerdSetUp.SetHightLightField(FieldToHighlight : String);
var
    i,x : integer;
    pt : TPoint;
    fName : string;
begin
   if ( Length(FieldToHighlight) = 0 ) then Exit;

   for i := 0 to ControlCount -1 do
     if ( Controls[i] is TDBEdit ) then
        begin
           fName := UPPERCASE(( Controls[i] as TDBEdit ).DataField);
           if fName = UPPERCASE(FieldToHighlight) then
              begin
                 ( Controls[i] as TDBEdit ).Color := $00FEEAD8;
                 ( Controls[i] as TDBEdit ).ShowHint := True;
                 try
                 ActiveControl := ( Controls[i] as TDBEdit );
                 except
                 end;
                 Break;
              end;
        end
     else if  ( Controls[i] is TPanel ) then
        begin
           for x := 0 to ( Controls[i] as TPanel ).ControlCount -1 do
              begin
                 if ( ( Controls[i] as TPanel ).Controls[x] is TDBEdit ) then
                    begin
                       fName := UPPERCASE(    ( ( Controls[i] as TPanel ).Controls[x] as TDBEdit ).DataField);
                       if fName = UPPERCASE(FieldToHighlight) then
                          begin
                             ( ( Controls[i] as TPanel ).Controls[x] as TDBEdit ).Color := $00FEEAD8;
                             ( ( Controls[i] as TPanel ).Controls[x] as TDBEdit ).ShowHint := True;
                             try
                             ActiveControl := ( ( Controls[i] as TPanel ).Controls[x] as TDBEdit );
                             except
                             end;
                             Break;
                          end;
                    end
                 else if ( ( Controls[i] as TPanel ).Controls[x] is TcxDBTextEdit ) then
                    begin
                       fName := UPPERCASE(    ( ( Controls[i] as TPanel ).Controls[x] as TcxDBTextEdit ).DataBinding.DataField);
                       if fName = UPPERCASE(FieldToHighlight) then
                          begin
                             ( ( Controls[i] as TPanel ).Controls[x] as TcxDBTextEdit ).Style.Color := $00FEEAD8;
                             ( ( Controls[i] as TPanel ).Controls[x] as TcxDBTextEdit ).ShowHint := True;
                             try
                                ActiveControl := ( ( Controls[i] as TPanel ).Controls[x] as TcxDBTextEdit );
                             except
                             end;
                             Break;
                          end;
                    end
                 //   19/11/19 [V5.9 R1.3] /MK Change - Allow highlight of TRxDBLookupCombo components like UKMilkRecorder.
                 else if ( ( Controls[i] as TPanel ).Controls[x] is TRxDBLookupCombo ) then
                    begin
                       fName := UPPERCASE(    ( ( Controls[i] as TPanel ).Controls[x] as TRxDBLookupCombo ).DataField);
                       if fName = UPPERCASE(FieldToHighlight) then
                          begin
                             ( ( Controls[i] as TPanel ).Controls[x] as TRxDBLookupCombo ).Color := $00FEEAD8;
                             try
                                ActiveControl := ( ( Controls[i] as TPanel ).Controls[x] as TRxDBLookupCombo );
                             except
                             end;
                             Break;
                          end;
                    end
              end;
        end;
end;

end.
