{
   05/09/11 [V5.0 R0.5] /MK Additional Feature - Added Feature To Remember Last AnimalNo For Male And Female.

   05/09/11 [V5.0 R0.5] /SP Bug Fix - Added Code To Check IsAllNums For BarcodeString.
                        /MK Bug Fix - On AnimalSave Make Sure that AnimalRecord.BreedID Exists
                                                 If Not Then Search WinData.Breeds For AnimalRecord.Breed Or teBreed.Text.

   30/11/11 [V5.0 R2.3] /MK Bug Fix - Moved WeighingEvent.Free To After WeighingEvent.Post So Events Table Is Posted Straight Away.

   08/10/12 [V5.1 R0.2] /MK Bug Fix - Added OnExit event for teNatIdNo so imgOK appears if tag typed.

   03/04/13 [V5.1 R6.1] /MK Additional Feature - Added Quality Assured Yes/No combo for IAD.

   11/09/13 [V5.2 R1.2] /MK Change - SaveAnimal - NewAnimal - Format tag of irish animals to have an IE to match with AIM Reconcile.

   27/08/14 [V5.3 R5.7] /MK Additional Feature - New button added to check AIM movements for an animal.
                                               - Created a QA combobox in the Add screen.
                            Change - Changed QA combobox in View screen to a read only text box to tell crush user QA status.

   28/08/14 [V5.3 R5.7] /MK Additional Feature - UpdateAnimal - Added the ability to save Crush Default Health events saving in Update screen - GL/IAD request.

   22/08/17 [V5.7 R2.0] /MK Bug Fix - UpdateAnimal - SaveDefaultHealthEvent - Default the comment to name of the drug with application rate and unit code.

   25/10/17 [V5.7 R4.1] /MK Change - ProcessBarcodeScan - Check to see if barcode entered is IE or 372 and add IE or 372 depending.

   18/07/18 [V5.8 R1.1] /MK Additional Feature - Added the Pen number as a drop down list - Bellingham.

   10/06/20 [V5.9 R4.9] /MK Change - UpdateAnimal - If the update of animal number field should fail, give error, close out and store in Application Log file.

   01/10/20 [V5.9 R6.2] /MK Additional Feature - When saving an update of the animal store the Animal Number and AnimalId in a new DataDir\CrushSavedAnimalNos.txt.    
}

unit uCrushBarcode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxContainer, cxEdit, cxTextEdit, cxPC, cxControls, cxImage,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxStyles, Db, DBTables, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, ActnList, dxmdaset, EventRecording, cxDBEdit,
  uRemarks, GenTypesConst, kRoutines, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uHerdLookup, uApplicationLog;

type
  TCrushAnimal = class
  private
    FSex: string;
    FNatIdNo: string;
    FDOB: TDateTime;
    FAnimalNo: string;
    FBreed: string;
    FAnimalId: Integer;
    FWeight: double;
    FWeighingId : Integer;
    BreedID : Integer;
    OldBreed : string;
    FBordBiaQAStatus: Boolean;
    procedure SetNatIdNo(const Value: string);
    procedure SetBreed(const Value: string);
  public
     procedure Clear;
     property Sex : string read FSex write FSex;
     property DOB : TDateTime read FDOB write FDOB;
     property Breed : string read FBreed write SetBreed;
     property NatIdNo : string read FNatIdNo write SetNatIdNo;
     property AnimalNo : string read FAnimalNo write FAnimalNo;
     property AnimalId : Integer read FAnimalId write FAnimalId;
     property Weight : double read FWeight write FWeight;
     property WeighingId : Integer read FWeighingId write FWeighingId;
     property BordBiaQAStatus : Boolean read FBordBiaQAStatus write FBordBiaQAStatus;
  end;

  TfmCrushBarCode = class(TForm)
    pcCrushBarcode: TcxPageControl;
    tsAddAnimal: TcxTabSheet;
    tsUpdateAnimal: TcxTabSheet;
    teNatIdNo: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    deDateOfBirth: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    btnPriorAnimal: TcxButton;
    btnNextAnimal: TcxButton;
    btnCancelAnimal: TcxButton;
    cxLabel5: TcxLabel;
    teNoSaved: TcxTextEdit;
    btnClose: TcxButton;
    lAnimalNo: TcxLabel;
    teAnimalNo: TcxTextEdit;
    lWeightKg: TcxLabel;
    btnSaveAnimal: TcxButton;
    imgError2: TcxImage;
    imgError3: TcxImage;
    imgError4: TcxImage;
    imgOK2: TcxImage;
    imgOK3: TcxImage;
    imgOK4: TcxImage;
    cmboSex: TcxComboBox;
    AnimalTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    btnFind: TcxButton;
    btnClearSearch: TcxButton;
    lSearchNatID: TcxLabel;
    teSearchAnimalTag: TcxTextEdit;
    btnUpdate: TcxButton;
    btnClearAnimal: TcxButton;
    imgError5: TcxImage;
    imgOK5: TcxImage;
    QueryAnimals: TQuery;
    dsQueryAnimals: TDataSource;
    imgError6: TcxImage;
    imgOK6: TcxImage;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AnimalTableViewID: TcxGridDBColumn;
    AnimalTableViewNatIdNum: TcxGridDBColumn;
    AnimalTableViewAnimalNo: TcxGridDBColumn;
    AnimalTableViewDateOfBirth: TcxGridDBColumn;
    AnimalTableViewSex: TcxGridDBColumn;
    AnimalTableViewCode: TcxGridDBColumn;
    ceWeight: TcxCurrencyEdit;
    SelectedRecord: TcxStyle;
    ActionList: TActionList;
    actSaveAnimal: TAction;
    actCancelAnimal: TAction;
    actClose: TAction;
    teBreed: TcxTextEdit;
    cxStyle2: TcxStyle;
    bUpdateClose: TcxButton;
    cxLabel6: TcxLabel;
    cmboQualityAssured: TcxComboBox;
    lQA: TcxLabel;
    ceQAStatus: TcxCurrencyEdit;
    btnCheckAIM: TcxButton;
    actCheckAIM: TAction;
    imgError1: TcxImage;
    lPenNo: TcxLabel;
    cmboPen: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure tsUpdateAnimalShow(Sender: TObject);
    procedure btnClearSearchClick(Sender: TObject);
    procedure AnimalTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure AnimalTableViewSexGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormDestroy(Sender: TObject);
    procedure teSearchAnimalTagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSaveAnimalExecute(Sender: TObject);
    procedure teNatIdNoPropertiesChange(Sender: TObject);
    procedure btnPriorAnimalClick(Sender: TObject);
    procedure btnNextAnimalClick(Sender: TObject);
    procedure pcCrushBarcodePageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure btnUpdateClick(Sender: TObject);
    procedure cmboSexPropertiesChange(Sender: TObject);
    procedure teBreedPropertiesChange(Sender: TObject);
    procedure deDateOfBirthPropertiesChange(Sender: TObject);
    procedure teBreedExit(Sender: TObject);
    procedure pcCrushBarcodeDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure deDateOfBirthExit(Sender: TObject);
    procedure cmboSexExit(Sender: TObject);
    procedure cmboSexKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelAnimalClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure teNatIdNoExit(Sender: TObject);
    procedure actCheckAIMExecute(Sender: TObject);
    procedure tsAddAnimalShow(Sender: TObject);
  private
    { Private declarations }
     FCurrentAnimal : TCrushAnimal;
     BarCodeScanString : string;
     FNoSaved : Integer;
     FHerdID : Integer;
     FAnimals : TdxMemData;
     AnimalRecord : TAnimalRecord;
     WeighingEvent : TWeighingEvent;
     qWeighingEvent : TQuery;
     FValidTagIDScanned : Boolean;
     FSavedCrushAnimalNos : TStringList;
     procedure SaveAnimal;
     procedure NotifyOk;
     procedure NotifyError;
     procedure Clear;
     procedure ShowImage(IsOK : Boolean; Index : Integer);
     procedure HideImages;
     procedure ProcessBarcodeScan(FScanCode : String);
     procedure SearchForAnimal;
     function IsOKtoSave : Boolean;
     function isAllNums(BarCodeScanString : string) : boolean;
     procedure ApplicationMessage(var Msg: TMsg;var Handled: Boolean);
     procedure AddToAnimalHistory(const AId : Integer);
     procedure GoToPrevious;
     procedure GoToNext;
     procedure LoadAnimalToScreen;
     procedure LoadWeighing;
     procedure UpdateAnimal;
     procedure LoadQualityAssured;

     procedure EnableControls(const AEnable : Boolean);
     procedure WriteRemark( AOldValue : Variant;
          const AAnimalID : Integer; ARemarkType : Integer );
     function UpdateAnimalField(const AID : Integer; AFieldName, AValue : Variant) : Boolean;
     function IsUniqueAnimalNo(const AID : Integer; const AAnimalNo : string) : Boolean;
     function UpdateDefaultsAnimalNoField(const AID : Integer; AFieldName, AValue : Variant) : Boolean;

  public
    { Public declarations }
    class procedure Show(AAdding : Boolean);
  end;

  function GetCharFromVirtualKey(Key: Word): string;

var
  fmCrushBarCode: TfmCrushBarCode;

implementation

uses
   DairyData, cxUtils, kDBRoutines;

{$R *.DFM}

procedure TfmCrushBarCode.ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
var
  ShiftState : TShiftState;
  KeyState : TKeyboardState;
  key : word;
  LastKey: Char;
  KeyboardLayout: HKL;

   var
   c : string;
begin
   case Msg.Message of
    WM_CHAR:
    begin
       c := GetCharFromVirtualKey(Msg.wParam);
       if (length(c) = 1) and (c[1] in ['A'..'Z', 'a'..'z', '0'..'9']) then
          BarCodeScanString := BarCodeScanString + c;
    end;
    WM_KEYDOWN, WM_KEYUP:
    case Msg.wParam of
    VK_RETURN:
      begin
          ProcessBarcodeScan(BarCodeScanString);
          if tsAddAnimal.Showing then
             begin
                // no further processing of enter key needs to happen.
                // assign 0 to message cancelling the key press.
                // only do this if the active tab is AddAnimal
                Msg.Message := 0;
             end;

      end;
     end;
    end;
end;

procedure TfmCrushBarCode.FormCreate(Sender: TObject);
begin
   if not(WinData.Defaults.Active) then
      WinData.Defaults.Active := True;

   Application.OnMessage := ApplicationMessage;
   FCurrentAnimal := TCrushAnimal.Create;
   FNoSaved := 0;
   teNoSaved.Text := IntTostr(FNoSaved);
   HideImages;
   FHerdID := WinData.DefaultHerdID;
   FAnimals := TdxMemData.Create(nil);
   CreateMemDataFieldDef(FAnimals, 'AnimalId', ftInteger);
   CreateMemDataFieldDef(FAnimals, 'DateOfBirth', ftDateTime);
   CreateMemDataFieldDef(FAnimals, 'Sex', ftString);
   CreateMemDataFieldDef(FAnimals, 'Breed', ftString);
   FAnimals.Active := True;

   QueryAnimals.Active := False;

   AnimalRecord := TAnimalRecord.Create;
   AnimalRecord.RaiseExceptions := False;
   AnimalRecord.ValidateBreed := False;
   AnimalRecord.AllowDuplicateTags := False;
   AnimalRecord.ValidateColour := False;
   AnimalRecord.ValidateDOB := False;
   AnimalRecord.ValidateIdTags := False;

   qWeighingEvent := TQuery.Create(nil);
   qWeighingEvent.DatabaseName := AliasName;

   FValidTagIDScanned := False;

   btnCheckAIM.Visible := False;

   if ( not(HerdLookup.qBatchGroups.Active) ) then
       HerdLookup.qBatchGroups.Open;
   cmboPen.RepositoryItem := HerdLookup.erLookupBatchGroups;

   FSavedCrushAnimalNos := TStringList.Create();
   if ( FileExists(DataDir+'\CrushSavedAnimalNos.txt') ) then
      FSavedCrushAnimalNos.LoadFromFile(DataDir+'\CrushSavedAnimalNos.txt')
   else
      FSavedCrushAnimalNos.Add('AnimalId,AnimalNo,Weight,SaveDateTime');
end;

procedure TfmCrushBarCode.cxButton4Click(Sender: TObject);
begin
   Close;
end;

function GetCharFromVirtualKey(Key: Word): string;
begin
    Result := Chr(Key);
end;

procedure TfmCrushBarCode.btnCancelClick(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to clear details?',mtWarning, [mbYes,mbNo],0) = idNo then Exit;
      btnClearSearch.Click;
end;

procedure TfmCrushBarCode.SaveAnimal;
var
   AnimalFound : Boolean;
   HasErrors : Boolean;
   WeightExists : Boolean;
   FOriginalWeighingEvent : Integer;
   tmpStr,
   BreedCode : string;
begin
   if not (tsAddAnimal.Showing) then Exit;

   try
      if FCurrentAnimal.AnimalId > 0 then // possibly updating all details
         begin
            if teNatIdNo.Text <> FCurrentAnimal.NatIdNo then
               begin
                  if UpdateAnimalField(FCurrentAnimal.AnimalId, 'NatIdNum', teNatIdNo.Text) then
                     begin
                        WriteRemark(FCurrentAnimal.NatIdNo, FCurrentAnimal.FAnimalId, uRemarks.cNatIDRemark );
                        tmpStr := FCurrentAnimal.NatIdNo;
                        tmpStr := WinData.InsertZeros(WinData.StripAllNomNumAlpha(tmpStr), 20);
                        UpdateAnimalField(FCurrentAnimal.AnimalId, 'SortNatId', tmpStr);

                     end;
               end
            else if cmboSex.Text <> FCurrentAnimal.Sex then
               begin
                  if UpdateAnimalField(FCurrentAnimal.AnimalId, 'Sex', cmboSex.Text) then
                     WriteRemark(FCurrentAnimal.Sex, FCurrentAnimal.AnimalId, uRemarks.cSexRemark );
               end
            else if (FCurrentAnimal.OldBreed <> '') and (FCurrentAnimal.OldBreed <> FCurrentAnimal.Breed) then
               begin
                  if UpdateAnimalField(FCurrentAnimal.AnimalId, 'PrimaryBreed', FCurrentAnimal.BreedId) then
                     WriteRemark(FCurrentAnimal.OldBreed, FCurrentAnimal.AnimalId, uRemarks.cBreedRemark );
               end
            else if deDateOfBirth.Date <> FCurrentAnimal.DOB then
               begin
                  if UpdateAnimalField(FCurrentAnimal.AnimalId, 'DateOfBirth', deDateOfBirth.Date) then
                     WriteRemark(FCurrentAnimal.DOb, FCurrentAnimal.FAnimalId, uRemarks.cDOBRemark );
               end
            else
               begin
                  if ( cmboQualityAssured.Text = 'Yes' ) and ( not(FCurrentAnimal.BordBiaQAStatus) ) then
                     UpdateAnimalField(FCurrentAnimal.AnimalId,'QualityAssured',True)
                  else if ( cmboQualityAssured.Text = 'No' ) and ( FCurrentAnimal.BordBiaQAStatus ) then
                     UpdateAnimalField(FCurrentAnimal.AnimalId,'QualityAssured',False);
               end;
            Clear;
            FAnimals.Last;
         end
      else
         begin // creating New animal
            AnimalRecord.Add;
            try
               AnimalRecord.HerdID := FHerdID;

               //   11/09/13 [V5.2 R1.2] /MK Change - Format tag of irish animals to have an IE to match with AIM Reconcile.
               if ( Length(StripAllSpaces(teNatIdNo.Text)) = 12 ) and ( WinData.DefCountry(FHerdID) = Ireland ) then
                  AnimalRecord.NatIDNum := 'IE '+teNatIdNo.Text
               else
                  AnimalRecord.NatIDNum := teNatIdNo.Text;

               AnimalRecord.AnimalNo := '';
               AnimalRecord.LactNo := 0;

               AnimalRecord.DateOfBirth := FCurrentAnimal.DOB;
               AnimalRecord.Sex := FCurrentAnimal.Sex;

               //BreedCode := FCurrentAnimal.Breed

               {if FCurrentAnimal.BreedID = 0 then
                  begin
                     if FCurrentAnimal.Breed <> '' then
                        begin
                           if WinData.Breeds.Locate('Code',FCurrentAnimal.Breed,[]) then
                              AnimalRecord.PrimaryBreed := WinData.BreedsID.AsInteger;
                        end
                     else
                        begin
                           if WinData.Breeds.Locate('Code',teBreed.Text,[]);
                           AnimalRecord.PrimaryBreed := WinData.BreedsID.AsInteger;
                        end;
                  end
               else
                  begin}
                     AnimalRecord.PrimaryBreed := FCurrentAnimal.BreedID;
               //   end;

               AnimalRecord.InHerd := True;
               AnimalRecord.Breeding := False;
               AnimalRecord.AnimalDeleted := False;

               if ( UpperCase(cmboQualityAssured.Text) = 'YES' ) then
                  AnimalRecord.BordBiaQAStatus := True
               else if ( UpperCase(cmboQualityAssured.Text) = 'NO' ) then
                  AnimalRecord.BordBiaQAStatus := False;

               AnimalRecord.Save;

               AnimalFound := True;

               AddToAnimalHistory(AnimalRecord.ID);

               Clear;
               Inc(FNoSaved);
               teNoSaved.Text := IntTostr(FNoSaved);

            except
               HasErrors := True;
               AnimalRecord.Cancel;
               MessageDlg('Could not save animal details - contact Kingswood (01-4599491).',mtError,[mbOk],0);
            end;
         end;
   finally
      if (HasErrors = False) then
         begin
            BarCodeScanString := '';
         end;
   end;
end;

procedure TfmCrushBarCode.NotifyError;
begin
   Windows.Beep(1000,750);
end;

procedure TfmCrushBarCode.NotifyOk;
begin
   WinDows.Beep(1750,150);
end;

procedure TfmCrushBarCode.ProcessBarcodeScan(FScanCode: String);
var
   HasErrors : Boolean;
   sBreed : String;
begin
//   if actSaveAnimal.Enabled then
  //    actSaveAnimal.Enabled := False;
   teNatIdNo.Properties.OnChange := nil;
   deDateOfBirth.Properties.OnChange := nil;
   cmboSex.Properties.OnChange := nil;
   teBreed.Properties.OnChange := nil;

   try
      HasErrors := False;
      if (Length(BarCodeScanString) = 12) and ( isAllNums(BarCodeScanString) ) then
         try
            FCurrentAnimal.FAnimalId := 0;

            //   25/10/17 [V5.7 R4.1] /MK Change - Check to see if barcode entered is IE or 372 and add IE or 372 depending.
            if ( IsIETag(BarCodeScanString) ) then
               BarCodeScanString := 'IE'+BarCodeScanString
            else if ( Is372Tag(BarCodeScanString) ) then
               BarCodeScanString := '372'+BarCodeScanString;

            FCurrentAnimal.NatIdNo := BarCodeScanString;
            teNatIdNo.Text := FCurrentAnimal.NatIdNo;
            ShowImage(True,1);
            FValidTagIDScanned := True;
            NotifyOk;

            cmboQualityAssured.Enabled := True;

         except
            ShowImage(False,1);
            NotifyError;
         end
      else if ( Length(FScanCode) >=11 ) and ( not(isAllNums(FScanCode)) ) then
         begin
            FCurrentAnimal.FAnimalId := 0;

            HasErrors := False;
            try
               FCurrentAnimal.DOB := StrToDate(Copy(FScanCode, 1, 2) + '/' + Copy(FScanCode, 3, 2)+ '/' + Copy(FScanCode, 5, 4));
               deDateOfBirth.Date := FCurrentAnimal.DOB;
               ShowImage(True,2);
            except
               HasErrors := True;
               ShowImage(False,2);
            end;

            try
               If (UPPERCASE(Copy(FScanCode, 9, 1)) = 'F') then
                  FCurrentAnimal.Sex := 'Female'
               else
                  FCurrentAnimal.Sex := 'Steer' ;
               cmboSex.ItemIndex := cmboSex.Properties.Items.IndexOf(FCurrentAnimal.Sex);
               ShowImage(True,3);
            except
               HasErrors := True;
               ShowImage(False,3);
            end;

            try
               sBreed := (UPPERCASE(Copy(FScanCode, 10, (Strlen(PChar(FScanCode)) - 9))));
               FCurrentAnimal.Breed := sBreed;
               teBreed.Text := FCurrentAnimal.Breed;
               ShowImage(True,4);
            except
               HasErrors := True;
               ShowImage(False,4);
            end;

            if HasErrors then
               NotifyError
            else
               begin
                  //actSaveAnimal.Enabled := True;
                  NotifyOk;
                  //cmboQualityAssured.Left := 316;
                  //cmboQualityAssured.Enabled := True;
               end;
         end
      else if (Length(BarCodeScanString) < 12) and ( isAllNums(BarCodeScanString) ) then
         ShowImage(False,1);


   finally
      teNatIdNo.Properties.OnChange := teNatIdNoPropertiesChange;
      deDateOfBirth.Properties.OnChange := deDateOfBirthPropertiesChange;
      cmboSex.Properties.OnChange := cmboSexPropertiesChange;
      teBreed.Properties.OnChange := teBreedPropertiesChange;
      BarCodeScanString := '';
   end;
end;

{ TCrushAnimal }

procedure TCrushAnimal.Clear;
begin
   AnimalId := 0;
   NatIdNo := '';
   Sex := '';
   DOB := 0;
   Breed := '';
   AnimalNo := '';
   BreedID := 0;
   OldBreed := '';
   Weight := 0;
   WeighingId := 0;
   BordBiaQAStatus := False;
end;

function TfmCrushBarCode.isAllNums(BarCodeScanString: string): boolean;
var
   i : Integer;
begin
   Result := True;

   BarCodeScanString := StripAllSpaces(BarCodeScanString);
   if Length(BarCodeScanString) <= 0 then
      begin
         Result := False;
         Exit;
      end;

   for i := 1 to Length(BarCodeScanString) do
      begin
         if not (BarCodeScanString[i] in ['0'..'9']) then
            begin
               Result := False;
               Break;
            end;
      end;
end;

procedure TfmCrushBarCode.btnUpdateClick(Sender: TObject);
begin
   UpdateAnimal;
end;

procedure TfmCrushBarCode.Clear;
begin
   BarCodeScanString := '';
   FCurrentAnimal.Clear;
   imgError1.Hide;
   imgError2.Hide;
   imgError3.Hide;
   imgError4.Hide;
   imgError5.Hide;
   imgError6.Hide;
   //imgOK1.Hide;
   btnCheckAIM.Hide;
   imgOK2.Hide;
   imgOK3.Hide;
   imgOK4.Hide;
   imgOK5.Hide;
   imgOK6.Hide;
   HideImages;

   teNatIdNo.Properties.OnChange := nil;
   deDateOfBirth.Properties.OnChange := nil;
   cmboSex.Properties.OnChange := nil;
   teBreed.Properties.OnChange := nil;

   try
      teNatIdNo.Text := '';
      deDateOfBirth.Clear;
      cmboSex.ItemIndex := -1;
      teBreed.Text := '';
   finally
      teNatIdNo.Properties.OnChange := teNatIdNoPropertiesChange;
      deDateOfBirth.Properties.OnChange := deDateOfBirthPropertiesChange;
      cmboSex.Properties.OnChange := cmboSexPropertiesChange;
      teBreed.Properties.OnChange := teBreedPropertiesChange;
   end;

end;

procedure TfmCrushBarCode.ShowImage(IsOK: Boolean; Index: Integer);
begin
   case Index of
      1 : begin
             imgError1.Visible := not IsOK;
             btnCheckAIM.Visible := IsOK;
             //imgOK1.Visible := IsOK;
          end;
      2 : begin
             imgError2.Visible := not IsOK;
             imgOK2.Visible := IsOK;
          end;
      3 : begin
             imgError3.Visible := not IsOK;
             imgOK3.Visible := IsOK;
          end;
      4 : begin
             imgError4.Visible := not IsOK;
             imgOK4.Visible := IsOK;
          end;
   end;
end;

procedure TfmCrushBarCode.HideImages;
begin
   imgError1.Visible := False;
   //imgOK1.Visible := False;
   btnCheckAIM.Visible := False;
   imgError2.Visible := False;
   imgOK2.Visible := False;
   imgError3.Visible := False;
   imgOK3.Visible := False;
   imgError4.Visible := False;
   imgOK4.Visible := False;
   imgError5.Visible := False;
   imgOK5.Visible := False;
   imgError6.Visible := False;
   imgOK6.Visible := False;
end;

procedure TfmCrushBarCode.btnFindClick(Sender: TObject);
begin
   SearchForAnimal;
end;

procedure TfmCrushBarCode.SearchForAnimal;
begin
   if Trim(teSearchAnimalTag.Text) = '' then
      begin
         ShowMessage('No search criteria has been entered!');
         Exit;
      end;

   if Trim(teSearchAnimalTag.Text) = '' then Exit;

   try
      QueryAnimals.Active := False;
      QueryAnimals.SQL.Clear;
      QueryAnimals.SQL.Add('SELECT A.ID, A.NatIdNum, A.SearchNatId, A.AnimalNo,');
      QueryAnimals.SQL.Add('       A.DateOfBirth, A.Sex, A.QualityAssured, B.Code');
      QueryAnimals.SQL.Add('FROM Animals A');
      QueryAnimals.SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)');
      QueryAnimals.SQL.Add('WHERE SUBSTRING(A.SearchNatId FROM 8) LIKE "'+'%'+teSearchAnimalTag.Text+'%'+'"');
      QueryAnimals.SQL.Add('AND (A.InHerd=True)');
      QueryAnimals.SQL.Add('AND (A.AnimalDeleted=False)');
      QueryAnimals.Active := True;
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;

   ceQAStatus.Style.Font.Color := clBlack;
   if ( not(QueryAnimals.FieldByName('QualityAssured').AsBoolean) ) then
      ceQAStatus.Style.Font.Color := clRed;
end;

procedure TfmCrushBarCode.tsUpdateAnimalShow(Sender: TObject);
begin
   try
     teSearchAnimalTag.SetFocus;
     teAnimalNo.Enabled := False;
     ceWeight.Enabled := False;
     ceQAStatus.Enabled := False;
     cmboPen.Enabled := False;
     ceQAStatus.Text := '';
   except
   end;
end;

procedure TfmCrushBarCode.btnClearSearchClick(Sender: TObject);
begin
   QueryAnimals.Active := False;
   teSearchAnimalTag.Text := '';
   try
      teSearchAnimalTag.SetFocus;
   except
   end;
end;

procedure TfmCrushBarCode.AnimalTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   AnimalNo  : Variant;
   AnimalSex : String;
   iCurCrushAnimalNo,
   iNextCrushAnimalNo : Integer;
   DefaultCrushFemaleNo,
   DefaultCrushMaleNo : Variant;
begin
   WinData.Defaults.Refresh;

   DefaultCrushFemaleNo := Trim(WinData.DefaultsCrushFemaleAnimalNo.AsString);
   DefaultCrushMaleNo := Trim(WinData.DefaultsCrushMaleAnimalNo.AsString);

   if (AFocusedRecord <> nil) then
      begin
         teAnimalNo.Enabled := True;
         ceWeight.Enabled := True;
         cmboPen.Enabled := True;

         FCurrentAnimal.AnimalId := AFocusedRecord.Values[AnimalTableViewID.Index];

         AnimalNo := AFocusedRecord.Values[AnimalTableViewAnimalNo.Index];
         AnimalSex := UpperCase(AFocusedRecord.Values[AnimalTableViewSex.Index]);
         FCurrentAnimal.Sex := AnimalSex;

         if ( not(VarIsNull(AnimalNo)) ) then
            FCurrentAnimal.AnimalNo := AnimalNo
         else
            begin
               if AnimalSex = 'FEMALE' then
                  begin
                     if ( DefaultCrushFemaleNo <> '' ) then
                        begin
                           iCurCrushAnimalNo := StrToInt( DefaultCrushFemaleNo );
                           iNextCrushAnimalNo := iCurCrushAnimalNo + 1;
                           FCurrentAnimal.AnimalNo := '';
                        end
                     else
                        FCurrentAnimal.AnimalNo := '';
                  end
               else if ( AnimalSex = 'BULL' )
                    or ( AnimalSex = 'STEER' ) then
                       begin
                          if ( DefaultCrushMaleNo <> '' ) then
                             begin
                                iCurCrushAnimalNo := StrToInt(DefaultCrushMaleNo);
                                iNextCrushAnimalNo := iCurCrushAnimalNo + 1;
                                FCurrentAnimal.AnimalNo := '';
                             end
                          else
                             FCurrentAnimal.AnimalNo := '';
                       end
            end;

         if iNextCrushAnimalNo > 0 then
            teAnimalNo.EditValue := Trim(IntToStr(iNextCrushAnimalNo))
         else
            teAnimalNo.EditValue := FCurrentAnimal.AnimalNo;

         teAnimalNo.SetFocus;
         LoadWeighing();
         LoadQualityAssured;

         ceQAStatus.Enabled := True;
      end
   else
      begin
         teAnimalNo.EditValue := Null;
         ceWeight.EditValue := Null;
         teAnimalNo.Enabled := False;
         ceWeight.Enabled := False;
         ceQAStatus.Enabled := False;
         ceQAStatus.Text := '';
         cmboPen.Enabled := False;
         cmboPen.EditValue := Null;
      end;
end;

procedure TfmCrushBarCode.AnimalTableViewSexGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if (AText = 'Steer') then
      AText := 'S'
   else if (AText = 'Bull') then
      AText := 'B'
   else if (AText = 'Female') then
      AText := 'F'
   else
      AText := ''
end;

procedure TfmCrushBarCode.FormDestroy(Sender: TObject);
begin
   if (QueryAnimals.Active) then
      QueryAnimals.Active := False;

   if (FCurrentAnimal <> nil) then
      FreeAndNil(FCurrentAnimal);

   if AnimalRecord <> nil then
      AnimalRecord.Free;

   if WinData.Defaults.Active then
      WinData.Defaults.Active := False;

   if ( FSavedCrushAnimalNos <> nil ) then
      FreeAndNil(FSavedCrushAnimalNos);

   Application.OnMessage := nil;

   FAnimals.Close;
end;

procedure TfmCrushBarCode.teSearchAnimalTagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) then
       btnFind.Click;
end;

procedure TfmCrushBarCode.actSaveAnimalExecute(Sender: TObject);
begin
   if not IsOKtoSave then
      begin
         MessageDlg('Please Check Data Fields',mtError,[mbok],0);
         Exit;
      end;
   SaveAnimal;
end;

function TfmCrushBarCode.IsOKtoSave: Boolean;
var
   NatIDNo : String;
begin
   Result := True;
   if ( not(CheckNatID(FCurrentAnimal.NatIDNo,NatIDNo,False)) ) or
      (FCurrentAnimal.DOB <= 0) or
      ((FCurrentAnimal.Sex <> 'Female') and (FCurrentAnimal.Sex <> 'Steer')
      and (FCurrentAnimal.Sex <> 'Bull')) or
      (FCurrentAnimal.Breed = '') then
      Result := False;
end;

procedure TfmCrushBarCode.teNatIdNoPropertiesChange(Sender: TObject);
begin
   FCurrentAnimal.NatIdNo := teNatIdNo.Text;
end;

procedure TfmCrushBarCode.AddToAnimalHistory(const AId: Integer);
begin
   FAnimals.Append;
   FAnimals.FieldByName('AnimalId').AsInteger := Aid;
   FAnimals.Post;
end;

procedure TfmCrushBarCode.btnPriorAnimalClick(Sender: TObject);
begin
   GoToPrevious;
end;

procedure TfmCrushBarCode.EnableControls(const AEnable: Boolean);
begin
    btnPriorAnimal.Enabled := AEnable;
    btnNextAnimal.Enabled := AEnable;
end;

procedure TfmCrushBarCode.GoToNext;
begin
   try
      EnableControls(False);
      if not FAnimals.Eof then
         FAnimals.Next;
      LoadAnimalToScreen();
   finally
      EnableControls(True)
   end;
end;

procedure TfmCrushBarCode.GoToPrevious;
begin
   try
      EnableControls(False);
      if not FAnimals.bof then
         FAnimals.Prior;
      LoadAnimalToScreen();
   finally
      EnableControls(True)
   end;
end;

procedure TfmCrushBarCode.LoadAnimalToScreen;
begin
   teNatIdNo.Properties.OnChange := nil;
   deDateOfBirth.Properties.OnChange := nil;
   cmboSex.Properties.OnChange := nil;
   teBreed.Properties.OnChange := nil;
   try

     if FAnimals.FieldByName('AnimalId').AsInteger <= 0 then Exit;

     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;
           SQL.Add('SELECT A.Id, A.NatIdNum, A.AnimalNo, A.DateOfBirth, A.Sex, B.Code, B.Id');
           SQL.Add('FROM Animals A');
           SQL.Add('LEFT JOIN Breeds B On (A.PrimaryBreed=B.Id)');
           SQL.Add('WHERE A.Id=:Id');
           Params[0].AsInteger := FAnimals.FieldByName('AnimalId').AsInteger;
           try
               Open;
               if (FieldByName('id').AsInteger>0) then
                  begin
                     FCurrentAnimal.Clear;
                     FCurrentAnimal.AnimalId := Fields[0].AsInteger;
                     FCurrentAnimal.NatIdNo := Fields[1].AsString;
                     FCurrentAnimal.AnimalNo := Fields[2].AsString;
                     FCurrentAnimal.DOB := Fields[3].AsDateTime;
                     FCurrentAnimal.Sex := Fields[4].AsString;
                     FCurrentAnimal.Breed := Fields[5].AsString;
                     FCurrentAnimal.BreedId := Fields[6].AsInteger;

                     teNatIdNo.Text := FCurrentAnimal.NatIdNo;
                     deDateOfBirth.Date := FCurrentAnimal.DOB;
                     cmboSex.ItemIndex := cmboSex.Properties.Items.IndexOf(FCurrentAnimal.Sex);
                     teBreed.Text := FCurrentAnimal.Breed;
                  end;
           finally
               Close;
           end;
        finally
           Free;
        end;
   finally
      teNatIdNo.Properties.OnChange := teNatIdNoPropertiesChange;
      deDateOfBirth.Properties.OnChange := deDateOfBirthPropertiesChange;
      cmboSex.Properties.OnChange := cmboSexPropertiesChange;
      teBreed.Properties.OnChange := teBreedPropertiesChange;
   end;
end;

procedure TfmCrushBarCode.btnNextAnimalClick(Sender: TObject);
begin
   GoToNext;
end;

procedure TfmCrushBarCode.pcCrushBarcodePageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   FCurrentAnimal := FCurrentAnimal.Create;
end;

procedure TfmCrushBarCode.WriteRemark(AOldValue : Variant;
          const AAnimalID : Integer; ARemarkType : Integer );
var
   i : Integer;
   TimeNow : TTime;
   DateNow : TDate;
begin
   try
      with WinData, tRemarks do
         begin
            tSysUser.Open;
            tRemarks.Open;
            tRemarks.CachedUpdates := False;
            TimeNow := SysUtils.Time();
            DateNow := SysUtils.Date();
            Append;
            try
               // Use the Animal ID Stored before posting
               FieldByName('AID').AsInteger := AAnimalID;
               FieldByName('DateChanged').AsDateTime := DateNow;
               FieldByName('TimeChanged').AsDateTime := TimeNow;
               FieldByName('UserDate').AsDateTime := Date;
               case ARemarkType of
                  uRemarks.cNatIDRemark  : begin
                                              FieldByName('OldItem').Value := AOldValue;
                                              FieldByName('ItemChanged').AsInteger := cNatIdRemark;
                                              FieldByName('Remark').Value :=  'National ID Number Changed'
                                           end;
                  uRemarks.cDOBRemark  : begin
                                              FieldByName('OldItem').Value := AOldValue;
                                              FieldByName('ItemChanged').AsInteger := cDOBRemark;
                                              FieldByName('Remark').Value :=  'Date Of Birth Changed'
                                         end;
                  uRemarks.cBreedRemark : begin
                                             FieldByName('ItemChanged').AsInteger := cBreedRemark;
                                             if Breeds.Locate('ID',AnimalFileByIDPrimaryBreed.OldValue,[] ) then
                                                FieldByName('OldItem').Value := Breeds.FieldByName('Code').AsString
                                             else
                                                FieldByName('OldItem').AsString := 'UnAssigned Breed';
                                             FieldByName('Remark').Value :=  'Breed Changed'
                                          end;
                  uRemarks.cSexRemark : begin
                                           FieldByName('ItemChanged').AsInteger := cSexRemark;
                                           FieldByName('OldItem').Value := AnimalFileByIDSex.OldValue;
                                           FieldByName('Remark').Value :=  'Sex Changed'
                                        end;
               end;

               // Get the Current User Name
               if tSysUser.Locate('ID',DefaultSysUser,[] ) then
                  FieldByName('ChangedBy').AsString := tSysUser.FieldByName('Name').AsString
               else
                  raise EInvalidOp.CreateFmt('SetUp a Default User Name - Changes NOT saved',[0]);
               Post;
            except
               Cancel;
            end;
            DBIForceWrite(tRemarks);
            tRemarks.Close;
            tRemarks.CachedUpdates := True;
         end;
   finally
      // Clear the Remarks Array to Blank
      WinData.tSysUser.Close;
   end;
end;

function TfmCrushBarCode.UpdateAnimalField(const AID: Integer; AFieldName,
  AValue: Variant) : Boolean;
begin
   Result := True;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE ANIMALS SET '+AFieldName+'=:Value');
         SQL.Add('WHERE (ID=:AID)');
         Params[0].Value := AValue;
         Params[1].Value := AID;
         try
            ExecSQL;
         except
            Result := False;
         end;
      finally
         Free;
      end;
end;

function TfmCrushBarCode.UpdateDefaultsAnimalNoField(const AID: Integer;
  AFieldName, AValue: Variant): Boolean;
begin
   Result := True;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE DEFAULTS SET '+AFieldName+'=:Value');
         Params[0].Value := AValue;
         try
            ExecSQL;
         except
            Result := False;
         end;
      finally
         Free;
      end;
end;

procedure TfmCrushBarCode.cmboSexPropertiesChange(Sender: TObject);
begin
    FCurrentAnimal.Sex := cmboSex.Text;
end;


procedure TfmCrushBarCode.teBreedPropertiesChange(Sender: TObject);
begin
    //FCurrentAnimal.Breed := teBreed.Text;
end;

procedure TfmCrushBarCode.deDateOfBirthPropertiesChange(Sender: TObject);
begin
    FCurrentAnimal.DOB := deDateOfBirth.Date;
end;

procedure TfmCrushBarCode.teBreedExit(Sender: TObject);
begin
   FCurrentAnimal.Breed := teBreed.Text;
   if (FCurrentAnimal.BreedId <= 0) then
      ShowImage(False,4)
   else
      ShowImage(True,4);
end;

procedure TfmCrushBarCode.UpdateAnimal;
var
   WeighingDate : TDateTime;
   tmpStr : string;
   i, StrLen : Integer;
   ValidCrushAnimal : Boolean;

   procedure SaveDefaultHealthEvent;
   var
      qGetDefaultHealthEvents : TQuery;
      HealthEvent : THealthEvent;
      sDrugCode, sDrugUnit : String;
   begin
      if ( ceWeight.Value = 0 ) then Exit;
      qGetDefaultHealthEvents := TQuery.Create(nil);
      with qGetDefaultHealthEvents do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM DefaultHealthEvents');
            SQL.Add('WHERE CrushTreatment = TRUE');
            try
               Open;
               First;
               while ( not(Eof) ) do
                  begin
                     HealthEvent := THealthEvent.Create('tCrushHealth');
                     with HealthEvent do
                        try
                           Append;
                           try
                              AnimalID := FCurrentAnimal.AnimalId;
                              AnimalLactNo := 0;
                              AnimalHerdID := FHerdID;
                              EventDate := Date;
                              DrugUsed := FieldByName('DrugID').AsInteger;
                              RateApplic := FieldByName('ApplicRate').AsFloat;
                              //   22/08/17 [V5.7 R2.0] /MK Bug Fix - Default the comment to name of the drug with application rate and unit code.
                              EventComment := GetHealthCommentByName_Unit_ApplicRate(FieldByName('DrugID').AsInteger,FieldByName('ApplicRate').AsFloat,THealth);
                              Post;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;
                        finally
                           FreeAndNil(HealthEvent);
                        end;
                     Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   if not (tsUpdateAnimal.Showing) then // updating animalno / weight.
      Exit;

   if teAnimalNo.Text <> FCurrentAnimal.AnimalNo then
     begin
        if not IsUniqueAnimalNo(FCurrentAnimal.AnimalId, teAnimalNo.Text) then
           begin
              MessageDlg(Format('Animal no %s already exists in this herd.',[teAnimalNo.Text]),mtError,[mbOK],0);
              Exit;
           end;

        //   10/06/20 [V5.9 R4.9] /MK Change - If the update of animal number field should fail, give error, don't save weighing or  and store in Application Log file.
        if ( not(UpdateAnimalField(FCurrentAnimal.AnimalId, 'AnimalNo', teAnimalNo.Text)) ) then
           begin
              tmpStr := Format('Error updating tag "%s" with animal number "%s".',[QueryAnimals.FieldByName('NatIdNum').AsString,teAnimalNo.Text]);
              MessageDlg(tmpStr,mtError,[mbOK],0);
              ApplicationLog.LogError(tmpStr);
           end;

        StrLen := Length(teAnimalNo.Text);

        for i := -1 to StrLen do
           begin
              if teAnimalNo.Text[i] in ['A'..'Z'] then
                 begin
                    ValidCrushAnimal := False;
                 end;
           end;

        if ValidCrushAnimal then
           begin
              if UpperCase(FCurrentAnimal.Sex) = 'FEMALE' then
                 UpdateDefaultsAnimalNoField(FCurrentAnimal.AnimalID, 'CrushFemaleAnimalNo', Trim(teAnimalNo.Text))
              else if ( UpperCase(FCurrentAnimal.Sex) = 'BULL' )
                   or ( UpperCase(FCurrentAnimal.Sex) = 'STEER' ) then
                      UpdateDefaultsAnimalNoField(FCurrentAnimal.AnimalID, 'CrushMaleAnimalNo', Trim(teAnimalNo.Text));
           end;

        tmpStr := teAnimalNo.Text;
        if ( tmpStr <> '' ) then
           begin
              tmpStr := WinData.InsertZeros(WinData.StripAllNomNumAlpha(tmpStr), 10);
              UpdateAnimalField(FCurrentAnimal.AnimalId, 'SortAnimalNo', tmpStr);
           end;
     end;

   if ( FCurrentAnimal.WeighingId > 0) and ( FCurrentAnimal.Weight <> ceWeight.Value ) then
      begin
         if not VarIsNull(ceWeight.EditValue) then
             begin
                qWeighingEvent.SQL.Clear;
                qWeighingEvent.SQL.Add('UPDATE Weights Set Weight =:Weight');
                qWeighingEvent.SQL.Add('WHERE EventID = :EId');
                qWeighingEvent.Params[0].Value := ceWeight.Value;
                qWeighingEvent.Params[1].Value := FCurrentAnimal.WeighingId ;
                qWeighingEvent.ExecSQL;

                FCurrentAnimal.Weight := ceWeight.Value;
             end
          else
             begin
                qWeighingEvent.SQL.Clear;
                qWeighingEvent.SQL.Add('DELETE FROM Weights ');
                qWeighingEvent.SQL.Add('WHERE EventID = :EId');
                qWeighingEvent.Params[0].Value := FCurrentAnimal.WeighingId ;
                qWeighingEvent.ExecSQL;

                qWeighingEvent.SQL.Clear;
                qWeighingEvent.SQL.Add('DELETE FROM Events ');
                qWeighingEvent.SQL.Add('WHERE ID = :EId');
                qWeighingEvent.Params[0].Value := FCurrentAnimal.WeighingId ;
                qWeighingEvent.ExecSQL;
                FCurrentAnimal.WeighingId := 0;
                FCurrentAnimal.Weight := 0;
             end;
       end
   else if ( FCurrentAnimal.WeighingId <= 0) then
      begin
          WeighingEvent := TWeighingEvent.Create('CrushWgts');

          WeighingEvent.Append;
          try
             WeighingEvent.AnimalID := FCurrentAnimal.AnimalId;
             WeighingEvent.AnimalLactNo := 0;
             WeighingEvent.AnimalHerdID := FHerdID;
             WeighingEvent.EventDate := Date;
             WeighingEvent.Weight := ceWeight.Value;
             WeighingEvent.Post;

             FCurrentAnimal.WeighingId := WeighingEvent.EventId;
             FCurrentAnimal.Weight := ceWeight.Value;
          except
             WeighingEvent.Cancel;
             MessageDlg('Could not create weighing event!',mtError,[mbOK],0);
          end;

          if WeighingEvent <> nil then
             WeighingEvent.Free;
       end;

   //   28/08/14 [V5.3 R5.7] /MK Additional Feature - Added the ability to save Crush Default Health events saving in Update screen - GL/IAD request.
   SaveDefaultHealthEvent;

   if ( cmboPen.EditValue <> Null ) then
      WinData.GroupManager.AddToGroup(FCurrentAnimal.AnimalId,cmboPen.EditValue,True,Date);

   FSavedCrushAnimalNos.Add(IntToStr(FCurrentAnimal.AnimalId)+','+teAnimalNo.Text+','+FloatToStr(ceWeight.Value)+','+FormatDateTime('dd/MM/yyyy hh:nn:ss',Now));
   FSavedCrushAnimalNos.SaveToFile(DataDir+'\CrushSavedAnimalNos.txt');

   btnClearSearch.Click;
end;

procedure TfmCrushBarCode.LoadWeighing;
var
   WeighingDate : TDateTime;
begin
   ceWeight.EditValue := Null;
   FCurrentAnimal.WeighingId := 0;
   FCurrentAnimal.Weight := 0;

   WeighingDate := WinData.EventDataHelper.GetLastEventDate(FCurrentAnimal.AnimalId, CWeightEvent);
   if ( WeighingDate > 0 ) then
       begin
          qWeighingEvent.SQL.Clear;
          qWeighingEvent.SQL.Add('SELECT E.ID, W.Weight FROM Events E');
          qWeighingEvent.SQL.Add('LEFT JOIN Weights W ON (W.EventId=E.ID)');
          qWeighingEvent.SQL.Add('WHERE E.AnimalID = :AID');
          qWeighingEvent.SQL.Add('AND E.EventDate = :WeighingDate');
          qWeighingEvent.SQL.Add('AND E.EventType = :EventType');
          qWeighingEvent.Params[0].Value := FCurrentAnimal.AnimalId;
          qWeighingEvent.Params[1].Value := WeighingDate;
          qWeighingEvent.Params[2].Value := CWeightEvent;
          qWeighingEvent.Open;
          qWeighingEvent.First;

          if qWeighingEvent.RecordCount > 0 then
             begin
                FCurrentAnimal.WeighingId := qWeighingEvent.Fields[0].AsInteger;
                FCurrentAnimal.Weight := qWeighingEvent.Fields[1].AsFloat;
                ceWeight.Value := FCurrentAnimal.Weight;
             end;
       end;
end;

procedure TfmCrushBarCode.pcCrushBarcodeDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if ATab.Index = pcCrushBarcode.ActivePageIndex then
      begin
         Font.Color := WinData.TouchScreenSelectedTab.TextColor;
      end
   else
      begin
         Font.Color := WinData.TouchScreenTab.TextColor;
      end;
end;

procedure TCrushAnimal.SetBreed(const Value: string);
begin
   BreedID := 0;
   if (Trim(Value) = '') then Exit;

   if WinData.Breeds.Locate('Code', Value, []) then
      begin
         if ( AnimalId > 0 ) then
            OldBreed := FBreed;
         FBreed := Value;
         BreedID := WinData.Breeds.FieldByName('ID').AsInteger;
      end
   else
      begin
         MessageDlg(Format('Breed "%s" could not be found in database - contact Kingswood (01-4599491)',[FBreed]),mtError,[mbOK],0);
      end;
end;

procedure TCrushAnimal.SetNatIdNo(const Value: string);
var
   NatIDNo : String;
begin
   if ( CheckNatID(Value,NatIDNo,False) ) then
      FNatIdNo := NatIDNo
   else
      FNatIdNo := Value;
end;

class procedure TfmCrushBarCode.Show(AAdding: Boolean);
begin
   with TfmCrushBarCode.Create(nil) do
      try
         if AAdding then
            pcCrushBarcode.ActivePageIndex := 0
         else
            pcCrushBarcode.ActivePageIndex := 1;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCrushBarCode.deDateOfBirthExit(Sender: TObject);
begin
   if (deDateOfBirth.Date <= 0) then
      ShowImage(False,2)
   else
      ShowImage(True,2);
end;

procedure TfmCrushBarCode.cmboSexExit(Sender: TObject);
begin
   if (cmboSex.ItemIndex <= -1) then
      ShowImage(False,3)
   else
      ShowImage(True,3);
end;

procedure TfmCrushBarCode.cmboSexKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = vk_Escape) then
      cmboSex.ItemIndex := -1;
end;

procedure TfmCrushBarCode.btnCancelAnimalClick(Sender: TObject);
begin
   Clear;
   cmboQualityAssured.Enabled := False;
   FValidTagIDScanned := False;
end;

function TfmCrushBarCode.IsUniqueAnimalNo(const AID: Integer;
  const AAnimalNo: string): Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT A.ID From Animals A');
         SQL.Add('WHERE (A.AnimalNo=:AnimalNo)');
         SQL.Add('AND (A.Id<>:AID)');
         SQL.Add('AND (A.HerdId=:AHerdId)');

         Params[0].AsString := AAnimalNo;
         Params[1].AsInteger := AID;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            Result := (RecordCount = 0);
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmCrushBarCode.actCloseExecute(Sender: TObject);
begin
   Close;
end;

//   08/10/12 [V5.1 R0.2] /MK Bug Fix - Added OnExit event for teNatIdNo so imgOK appears if tag typed.
procedure TfmCrushBarCode.teNatIdNoExit(Sender: TObject);
begin
   if ( not(FValidTagIDScanned) ) then
      if BarCodeScanString <> '' then
         ProcessBarcodeScan(BarCodeScanString);
end;

procedure TfmCrushBarCode.LoadQualityAssured;
begin
   if ( FCurrentAnimal.AnimalID > 0 )then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT QualityAssured');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE ID = :AnimalID');
            Params[0].AsInteger := FCurrentAnimal.AnimalID;
            Open;
            try
               First;
               if ( not(Fields[0].AsVariant = Null) ) then
                  begin
                     if ( Fields[0].AsBoolean ) then
                        ceQAStatus.Text := 'Yes'
                     else if ( not(Fields[0].AsBoolean) ) then
                        ceQAStatus.Text := 'No';
                  end
               else
                  begin
                     ceQAStatus.Enabled := False;
                     ceQAStatus.Text := '';
                  end;
            finally
               Close;
            end;
         finally
            Free;
         end;
end;

procedure TfmCrushBarCode.actCheckAIMExecute(Sender: TObject);
begin
   if ( teNatIdNo.Text <> '' ) then
      begin
         WinData.FCrushAIMRecord.NatIDNum := teNatIdNo.Text;
         if ( deDateOfBirth.Date > 0 ) then
            WinData.FCrushAIMRecord.DateOfBirth := deDateOfBirth.Date;
         if ( cmboSex.Text <> '' ) then
            WinData.FCrushAIMRecord.Sex := cmboSex.Text;
         if ( teBreed.Text <> '' ) then
            WinData.FCrushAIMRecord.BreedCode := teBreed.Text;

         WinData.GoToAimAnimalDetails(WinData.UserDefaultHerdID, afCrush);

         // Download movement history to database table once XML file is created by Shane.
      end;
end;

procedure TfmCrushBarCode.tsAddAnimalShow(Sender: TObject);
begin
   btnCheckAIM.Visible := False;
   cmboQualityAssured.Enabled := False;
end;

end.
