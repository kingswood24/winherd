{
  25/11/11 [V5.0 R2.2] /MK Change - Added Remove Option To Remove Animal From Dispatch Header Selected.
                                  - Sort The Dispatch Print By AnimalNo.
                                  - Added Last Weight To the Dispatch Print.
                       /MK Bug Fix - Fixed Problems With BtnClick On HeaderGrid.
                                   - On Get Active Header Count On Look For Animals In Herd.

  29/11/11 [V5.0 R2.3] /MK Change - Split The Count In HeaderGrid To Females And Males.
                                  - Print Option Now Shows Sex.
                                  - Print Footer Shows Sum Of Total Weight.

  30/11/11 [V5.0 R2.3] /MK Additional Feature - SaveAnimal - Create Pre Sale Weighing Event For Factory Sales.

  05/12/11 [V5.0 R2.4] /MK Additional Feature - On Print Filter Grid By Females First And Then Males.
                                              - Moved Print Before Save On HeaderGrid.

  15/12/11 [V5.0 R2.8] /MK Bug Fix - LoadHeaders Was Not Setting The FCount And SCount To Zero Before Each Group Was Loaded.

  15/12/11 [V5.0 R2.8] /MK Additional Feature - Also Remove Weighing And PreSale Events For Animal.

  08/10/12 [V5.1 R0.2] /MK Additional Feature - Changed HeaderGrid Save button from Image to word "Finish".
                                              - Only allow header to be finished if header has been printed.
                                              - Allow header to be removed from Add Header screen.
                       /MK Bug Fix - Remove animal was not deleteing the event record for weighing or pre-sale event.
                                   - Add Animal - after type of tag number program was not showing tick image.

  15/01/13 [V5.1 R3.8] /MK Bug Fix - actShowAllHeadersExecute - Second SQL to bring to only show non-completed loads did not contain GroupID field. 

  16/01/13 [V5.1 R3.8] /MK Additional Feature - Add Report Title of Group Name on print of Active Headers.

  28/03/13 [V5.1 R5.4] /MK Change - Changed Factory combo LookupSource to new WinData.QueryCustomers.

  28/04/13 [V5.2 R9.6] /MK Bug Fix - Program was not checking if there were no sales groups and producing an "Invalid variant Type" error
                                     on creating of the new group.

  21/05/14 [V5.3 R1.4] /MK Change - Changed the width of the form and the width of the NationalID field
                                    as requested by IAD. NationalID field needs to be longer to take account of the "IE"
                                    in front of the tag number which IAD started using recently.

  03/06/14 [V5.3 R1.6] /MK Bug Fix - SaveHeader - Need better way to find if SalesGroupCode already exists.

  26/04/16 [V5.5 R5.1] /MK Change - SaveHeader - Function created to create group description with # at the end where user wants to
                                                 create two sales groups to the same customer on the same day.

  11/10/16 [V5.6 R0.9] /MK Change- Added FarmName to the top of the report - IAD.
}

unit uCrushSalesGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxContainer, cxEdit, cxTextEdit, cxPC, cxControls, cxImage,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxStyles, Db, DBTables, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, ActnList, dxmdaset, EventRecording, cxDBEdit,
  uRemarks, GenTypesConst, kRoutines, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DateUtil, dxPSCore, dxPScxCommon, dxPScxGridLnk,
  cxCheckBox, cxFilter, ExtCtrls, Def, uCrushXML, KDBRoutines;

type
  TfmCrushSalesGroup = class(TForm)
    pcCrushSalesGroup: TcxPageControl;
    tsHeader: TcxTabSheet;
    tsDispatch: TcxTabSheet;
    btnCancelAnimal: TcxButton;
    btnClose: TcxButton;
    cxLabel8: TcxLabel;
    btnSaveAnimal: TcxButton;
    AnimalTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    btnFind: TcxButton;
    btnClear: TcxButton;
    teSearchAnimalTag: TcxTextEdit;
    btnUpdate: TcxButton;
    cxButton6: TcxButton;
    QueryAnimals: TQuery;
    dsQueryAnimals: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AnimalTableViewID: TcxGridDBColumn;
    AnimalTableViewNatIdNum: TcxGridDBColumn;
    AnimalTableViewAnimalNo: TcxGridDBColumn;
    ceWeight: TcxCurrencyEdit;
    SelectedRecord: TcxStyle;
    ActionList: TActionList;
    actSaveHeader: TAction;
    actClearHeader: TAction;
    actClose: TAction;
    cxStyle2: TcxStyle;
    bUpdateClose: TcxButton;
    lFactory: TcxLabel;
    lSlaughterDate: TcxLabel;
    cxHeaderGrid: TcxGrid;
    cxHeaderGridDBTableView: TcxGridDBTableView;
    cxGridDBFactory: TcxGridDBColumn;
    cxGridDBEventDate: TcxGridDBColumn;
    cxHeaderGridLevel: TcxGridLevel;
    dsHeader: TDataSource;
    qHeader: TQuery;
    cmboFactory: TcxLookupComboBox;
    deSlaughterDate: TcxDateEdit;
    cxLabel10: TcxLabel;
    cbSearchOn: TcxComboBox;
    cxLabel1: TcxLabel;
    AnimalTableViewAgeInMonths: TcxGridDBColumn;
    AnimalTableViewBreed: TcxGridDBColumn;
    AnimalTableViewDaysToTest: TcxGridDBColumn;
    AnimalTableViewOutsideWithdrawal: TcxGridDBColumn;
    lDispatchHeader: TcxLabel;
    cmboHeader: TcxLookupComboBox;
    actSaveAnimal: TAction;
    actClearAnimal: TAction;
    HeaderGrid: TcxGrid;
    HeaderGridDBTableView: TcxGridDBTableView;
    HeaderGridLevel: TcxGridLevel;
    HeaderGridDBTableViewName: TcxGridDBColumn;
    HeaderGridDBTableViewFCount: TcxGridDBColumn;
    HeaderGridDBTableViewSaveLoad: TcxGridDBColumn;
    HeaderGridDBTableViewPrintLoad: TcxGridDBColumn;
    HeaderGridDBTableViewGroupID: TcxGridDBColumn;
    SelectedHeaderRecord: TcxStyle;
    DeSelectedHeaderRecord: TcxStyle;
    cxLabel2: TcxLabel;
    HeaderGridtPrinterLinkComponent: TdxComponentPrinter;
    cxGridDBActive: TcxGridDBColumn;
    qHeaderDescription: TStringField;
    qHeaderEventDate: TDateField;
    qHeaderCrushLoadComplete: TBooleanField;
    qHeaderActive: TStringField;
    cbShowAllHeaders: TcxCheckBox;
    actShowAllHeaders: TAction;
    AnimalGridPrinterLink: TdxGridReportLink;
    btnRemoveAnimal: TcxButton;
    actRemoveAnimal: TAction;
    actSearchAnimal: TAction;
    AnimalTableViewWeight: TcxGridDBColumn;
    HeaderGridDBTableViewSCount: TcxGridDBColumn;
    AnimalTableViewSex: TcxGridDBColumn;
    Timer: TTimer;
    btnRemoveHeader: TcxButton;
    actRemoveHeader: TAction;
    cxGridDBGroupID: TcxGridDBColumn;
    qHeaderGroupID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tsDispatchShow(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure AnimalTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure teSearchAnimalTagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actSaveHeaderExecute(Sender: TObject);
    procedure pcCrushSalesGroupDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure actCloseExecute(Sender: TObject);
    procedure actClearHeaderExecute(Sender: TObject);
    procedure cmboHeaderPropertiesCloseUp(Sender: TObject);
    procedure actSaveAnimalExecute(Sender: TObject);
    procedure actClearAnimalExecute(Sender: TObject);
    procedure cbSearchOnPropertiesCloseUp(Sender: TObject);
    procedure HeaderGridDBTableViewSaveLoadPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure tsHeaderShow(Sender: TObject);
    procedure qHeaderCalcFields(DataSet: TDataSet);
    procedure actShowAllHeadersExecute(Sender: TObject);
    procedure HeaderGridDBTableViewPrintLoadPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure actRemoveAnimalExecute(Sender: TObject);
    procedure actSearchAnimalExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure actRemoveHeaderExecute(Sender: TObject);
    procedure cxHeaderGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    function GetFAnimalWeight: Double;
    procedure LoadAnimalsToPrint;
    procedure PrintLoad;
    procedure RemoveHeader(AGroupID: Integer);
    procedure GetHeaderCount(GroupID: Integer);
  private
    { Private declarations }
     FHeaders : TdxMemdata;
     dsFHeaders : TDataSource;
     FAnimals : TdxMemData;
     dsFAnimals : TDataSource;
     AnimalRecord : TAnimalRecord;
     WeighingEvent : TWeighingEvent;
     PreSaleEvent : TSaleDeathEvent;
     qWeighingEvent : TQuery;
     qPreSaleWeighing : TQuery;
     AnimalInSaleGroup : Boolean;
     CurrPreSaleWeighingID,
     CurrWeighingID,
     CurrAnimalID,
     CurrSaleGroupID : Integer;
     FSCount,
     FFCount : Integer;
     procedure SaveAnimal;
     procedure ClearAnimal;
     procedure RemoveAnimal(AAnimalID, AGroupID, AWeighingID, APreSaleID : Integer);
     procedure SaveHeader;
     procedure ClearHeader;
     procedure SearchForAnimal;
     procedure LoadHeaders;
     function CalcDaysLeftInTest(ACurrTestDate, ASalesDate : TDateTime) : Integer;
     function IsOKtoSave : Boolean;
     procedure CompleteCrushLoad(AGroupID : Integer);
     procedure CreateAnimalGrid( AShowWeightField : Boolean );
     property FAnimalWeight : Double read GetFAnimalWeight;
  public
    { Public declarations }
    class procedure Show;
  end;

  function GetCharFromVirtualKey(Key: Word): string;

var
  fmCrushSalesGroup: TfmCrushSalesGroup;

implementation

uses DairyData, cxUtils;

{$R *.DFM}

{ TfmCrushSalesGroup }

procedure TfmCrushSalesGroup.FormCreate(Sender: TObject);
begin
   if not(WinData.Groups.Active) then
      WinData.Groups.Active := True;

   if not(WinData.GroupLinks.Active) then
      WinData.GroupLinks.Active := True;

   WinData.QueryCustomers.Close;
   WinData.QueryCustomers.Open;

   deSlaughterDate.Date := Date;
   cmboFactory.Properties.ListSource := WinData.dsQueryCustomers;
   cmboFactory.Properties.ListFieldNames := 'Name';
   cmboFactory.Properties.KeyFieldNames := 'ID';

   if not(qHeader.Active) then
      begin
         qHeader.SQL.Add('AND G.CrushLoadComplete = False');
         qHeader.Active := True;
      end;

   FAnimals := TdxMemData.Create(nil);
   CreateMemDataFieldDef(FAnimals, 'AnimalId', ftInteger);
   CreateMemDataFieldDef(FAnimals, 'NatIDNum', ftString, 20);
   CreateMemDataFieldDef(FAnimals, 'DateOfBirth', ftDateTime);
   CreateMemDataFieldDef(FAnimals, 'AgeInMonths', ftInteger);
   CreateMemDataFieldDef(FAnimals, 'Sex', ftString, 1);
   CreateMemDataFieldDef(FAnimals, 'Breed', ftString, 5);
   CreateMemDataFieldDef(FAnimals, 'DaysToTest', ftInteger);
   CreateMemDataFieldDef(FAnimals, 'OutsideWithdrawal', ftBoolean);
   CreateMemDataFieldDef(FAnimals, 'AnimalNo', ftString, 10);
   CreateMemDataFieldDef(FAnimals, 'HerdId', ftInteger);
   CreateMemDataFieldDef(FAnimals, 'Weight', ftFloat);
   FAnimals.Active := True;

   dsFAnimals := TDataSource.Create(nil);
   dsFAnimals.DataSet := FAnimals;

   FHeaders := TdxMemData.Create(nil);
   CreateMemDataFieldDef(FHeaders, 'GroupID', ftInteger);
   CreateMemDataFieldDef(FHeaders, 'GroupName', ftString, 30);
   CreateMemDataFieldDef(FHeaders, 'GroupSCount', ftInteger);
   CreateMemDataFieldDef(FHeaders, 'GroupFCount', ftInteger);
   CreateMemDataFieldDef(FHeaders, 'Printed', ftBoolean);

   dsFHeaders := TDataSource.Create(nil);
   dsFHeaders.DataSet := FHeaders;

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

   qPreSaleWeighing := TQuery.Create(nil);
   qPreSaleWeighing.DatabaseName := AliasName;

   btnRemoveAnimal.Visible := False;

   PreSaleEvent := TSaleDeathEvent.Create('CrushPreSaleWgts');

   AnimalGridPrinterLink.Component := AnimalGrid;
   Timer.Enabled := False;
end;

procedure TfmCrushSalesGroup.cxButton4Click(Sender: TObject);
begin
   Close;
end;

function GetCharFromVirtualKey(Key: Word): string;
begin
    Result := Chr(Key);
end;

procedure TfmCrushSalesGroup.btnCancelClick(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to clear details?',mtWarning, [mbYes,mbNo],0) = idNo then Exit;
      btnClear.Click;
end;

function TfmCrushSalesGroup.IsOKtoSave: Boolean;
begin
   Result := True;
   if not( (deSlaughterDate.Date >= 0) or (cmboFactory.Text > '') ) then
      Result := False;
end;

procedure TfmCrushSalesGroup.tsHeaderShow(Sender: TObject);
begin
   qHeader.Active := False;
   qHeader.SQL.Add('AND G.CrushLoadComplete = False');
   qHeader.Active := True;
   qHeader.First;
end;

procedure TfmCrushSalesGroup.qHeaderCalcFields(DataSet: TDataSet);
begin
   if not(qHeaderCrushLoadComplete.AsBoolean) then
      qHeaderActive.AsString := 'Yes'
   else
      qHeaderActive.AsString := 'No';
end;

procedure TfmCrushSalesGroup.actShowAllHeadersExecute(Sender: TObject);
begin
   cxHeaderGridDBTableView.DataController.BeginFullUpdate;
   qHeader.Active := False;
   if ( cbShowAllHeaders.Checked ) then
      begin
         with qHeader do
            try
               SQL.Clear;
               SQL.Add('SELECT G.ID GroupID, G.Description, G.EventDate, G.CrushLoadComplete');
               SQL.Add('FROM Grps G');
               SQL.Add('WHERE G.GroupType = "Sales"');
               SQL.Add('AND G.EventDate Is Not Null');
               Open;
            finally

            end;
      end
   else
      begin
         with qHeader do
            try
               SQL.Clear;
               SQL.Add('SELECT G.ID GroupID, G.Description, G.EventDate, G.CrushLoadComplete');
               SQL.Add('FROM Grps G');
               SQL.Add('WHERE G.GroupType = "Sales"');
               SQL.Add('AND G.EventDate Is Not Null');
               SQL.Add('AND G.CrushLoadComplete = False');
               Open;
            finally

            end;
      end;

   cxHeaderGridDBTableView.DataController.EndFullUpdate;
end;

procedure TfmCrushSalesGroup.actSaveHeaderExecute(Sender: TObject);
begin
   if not IsOKtoSave then
      begin
         MessageDlg('Please Check Data Fields',mtError,[mbok],0);
         Exit;
      end
   else
      begin
         SaveHeader;
         actClearHeader.Execute;
      end;
end;

procedure TfmCrushSalesGroup.SaveHeader;
var
   sCrushSalesGroupCode : String;
   iCrushSalesGroupCode : Integer;
   qMaxSalesGroupCode : TQuery;

   function GroupCodeExists ( AGroupCode : String ) : Boolean;
   begin
      Result := False;
      with GetQuery do
         try
            SQL.Add('SELECT *');
            SQL.Add('FROM Grps');
            SQL.Add('WHERE Code = :AGroupCode');
            Params[0].AsString := AGroupCode;
            try
               Open;
               Result := ( RecordCount > 0 );
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

   procedure CreateGroupCode (GroupCode : String);
   begin
       iCrushSalesGroupCode := StrToInt( WinData.StripAllAlphaButNum(GroupCode) );
       sCrushSalesGroupCode := 'S' + IntToStr(iCrushSalesGroupCode);
       //   03/06/14 [V5.3 R1.6] /MK Bug Fix - Need better way to find if SalesGroupCode already exists.
       while GroupCodeExists(sCrushSalesGroupCode) do
          begin
             Inc(iCrushSalesGroupCode);
             sCrushSalesGroupCode := 'S' + IntToStr(iCrushSalesGroupCode);
          end;
   end;

   function CreateCrushSalesGroupName ( AGroupDescription : String ) : String;
   var
      i : Integer;
   begin
      Result := AGroupDescription;
      for i := 1 to 999 do
         if ( WinData.LookupGroups.Locate('Description',AGroupDescription,[loCaseInsensitive]) ) then
            if ( not(WinData.LookupGroups.Locate('Description',AGroupDescription+'#'+IntToStr(i),[loCaseInsensitive])) ) then
               begin
                  Result := AGroupDescription+'#'+IntToStr(i);
                  Break;
               end;
   end;

begin
   iCrushSalesGroupCode := 0;
   sCrushSalesGroupCode := '';

   qHeader.Active := False;

   qMaxSalesGroupCode := TQuery.Create(nil);
   with qMaxSalesGroupCode do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Max(Code) FROM Grps');
         SQL.Add('WHERE SubString(Code From 1 For 1) Like "%S%" ');
         SQL.Add('AND GroupType = "Sales" ');
         Open;
         try
            First;
            if ( Fields[0].AsString <> '' ) then
               CreateGroupCode(Fields[0].AsString)
            else
               sCrushSalesGroupCode := 'S1';
         finally
            Close;
         end;
      finally
         Free;
      end;

   if ( sCrushSalesGroupCode <> '' ) then
      begin
         with WinData.Groups do
            begin
               Append;
               FieldByName('GroupType').AsString := 'Sales';
               FieldByName('Code').AsString := sCrushSalesGroupCode;
               //   26/04/16 [V5.5 R5.1] /MK Change - Function created to create group description with # at the end where user wants to
               //                                     create two sales groups to the same customer on the same day.
               FieldByName('Description').AsString := CreateCrushSalesGroupName(cmboFactory.Text + ' ' + DateToStr(deSlaughterDate.Date));
               FieldByName('Selected').AsBoolean := False;
               FieldByName('EventDate').AsDateTime := deSlaughterDate.Date;
               FieldByName('DestSource').AsInteger := cmboFactory.EditValue;
               FieldByName('CrushLoadComplete').AsBoolean := False;
               Post;
            end;

         if Def.Definition.dUseCrush then
            begin
               with TCrushXMLExport.Create do
                  try
                     FCrushGroup.Code := WinData.GroupsCode.AsString;
                     FCrushGroup.Description := WinData.GroupsDescription.AsString;
                     FCrushGroup.GroupType := WinData.GroupsGroupType.AsString;
                     FCrushGroup.GroupDate := deSlaughterDate.Date;
                     FCrushGroup.DestSource := cmboFactory.EditValue;
                     FCrushGroup.CrushLoadComplete := WinData.Groups.FieldByName('CrushLoadComplete').AsBoolean;
                     CreateorOpenXMLFile(etPurchase);
                     AddLookupItemToXML;
                  finally
                     Free;
                  end;
            end;

      end;

   qHeader.SQL.Add('AND G.CrushLoadComplete = False');
   qHeader.Active := True;
end;

procedure TfmCrushSalesGroup.actClearHeaderExecute(Sender: TObject);
begin
   ClearHeader;
end;

procedure TfmCrushSalesGroup.ClearHeader;
begin
   deSlaughterDate.Date := Date;
   cmboFactory.Text := '';
end;

procedure TfmCrushSalesGroup.tsDispatchShow(Sender: TObject);
begin
   try
     with cbSearchOn.Properties.Items do
        begin
           Clear;
           BeginUpdate;
           Add('Jumbo');
           Add('Part Nat ID');
           EndUpdate;
        end;
     cbSearchOn.ItemIndex := 0;

     HeaderGrid.Visible := False;
     LoadHeaders;

     HeaderGridDBTableView.DataController.DataSource := nil;

     if FHeaders.RecordCount > 0 then
        begin
           HeaderGridDBTableViewGroupID.DataBinding.FieldName := 'GroupID';
           HeaderGridDBTableViewName.DataBinding.FieldName := 'GroupName';
           HeaderGridDBTableViewSCount.DataBinding.FieldName := 'GroupSCount';
           HeaderGridDBTableViewFCount.DataBinding.FieldName := 'GroupFCount';
           HeaderGridDBTableViewPrintLoad.DataBinding.FieldName := 'Printed';
           HeaderGridDBTableViewSaveLoad.DataBinding.FieldName := 'GroupName';

           HeaderGridDBTableView.DataController.DataSource := dsFHeaders;
           HeaderGridDBTableView.DataController.KeyFieldNames := 'GroupID';
           HeaderGridDBTableView.DataController.RefreshExternalData;
           HeaderGrid.Visible := True;
           FHeaders.First;
        end;

     with cmboHeader do
        begin
           Enabled := False;
           Properties.KeyFieldNames := 'GroupID';
           Properties.ListSource := dsHeader;
           Properties.ListFieldNames := 'Description';
        end;

     AnimalTableView.DataController.DataSource := nil;
     //CreateAnimalGrid(False);
     ceWeight.Enabled := False;
     ceWeight.EditValue := Null;
     AnimalInSaleGroup := False;
     CurrWeighingID := 0;
     CurrPreSaleWeighingID := 0;
     teSearchAnimalTag.SetFocus;
     btnRemoveAnimal.Visible := False;

   except
   end;
end;

procedure TfmCrushSalesGroup.actSearchAnimalExecute(Sender: TObject);
begin
   if not(FAnimals.Active) then
      FAnimals.Active := True;

   if ( FAnimals.Active ) then
      begin
         AnimalTableView.DataController.BeginFullUpdate;
         FAnimals.Active := False;
         SearchForAnimal;
         AnimalTableView.DataController.EndFullUpdate;
      end;
end;

procedure TfmCrushSalesGroup.SearchForAnimal;
var
   ExpectedTBDate : TDateTime;
   NoMonths : Integer;
begin
   NoMonths := 0;
   if Trim(teSearchAnimalTag.Text) = '' then
      begin
         ShowMessage('No search criteria has been entered!');
         Exit;
      end;

   if Trim(teSearchAnimalTag.Text) = '' then Exit;

   if not(FAnimals.Active) then
      FAnimals.Active := True;

   with QueryAnimals do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT A.ID, A.NatIdNum, A.SearchNatId, A.AnimalNo, A.HerdId,');
         SQL.Add('       A.DateOfBirth, A.Sex, A.TBTestDate, A.Brucellosis, B.Code');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)');
         SQL.Add('WHERE (A.InHerd=True)');
         SQL.Add('AND   (A.AnimalDeleted=False)');
         case cbSearchOn.ItemIndex of
            0 : begin
                   SQL.Add('AND A.AnimalNo = :SearchText');
                   Params[0].AsString := teSearchAnimalTag.Text;
                end;
            1 : begin
                   SQL.Add('AND SUBSTRING(A.SearchNatId FROM 8) Like :SearchText');
                   Params[0].AsString := '%'+ teSearchAnimalTag.Text +'%';
                end;
         end;
         Open;
         First;
         while not EOF do
            begin
               FAnimals.Append;
               FAnimals.FieldByName('AnimalId').AsInteger := FieldByName('ID').AsInteger;
               FAnimals.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
               FAnimals.FieldByName('Breed').AsString := FieldByName('Code').AsString;

               NoMonths := KRoutines.GetNoOfMonths(Date,FieldByName('DateOfBirth').AsDateTime);
               FAnimals.FieldByName('AgeInMonths').AsInteger := NoMonths;

               if ( UpperCase(FieldByName('Sex').AsString) = 'FEMALE' ) then
                  FAnimals.FieldByName('Sex').AsString := 'F'
               else if ( UpperCase(FieldByName('Sex').AsString) = 'BULL' ) then
                  FAnimals.FieldByName('Sex').AsString := 'B'
               else if ( UpperCase(FieldByName('Sex').AsString) = 'STEER' ) then
                  FAnimals.FieldByName('Sex').AsString := 'S';

               if ( (FieldByName('TBTestDate').AsDateTime > 0) or (FieldByName('Brucellosis').AsDateTime > 0) ) then
                  if ( FieldByName('TBTestDate').AsDateTime > FieldByName('Brucellosis').AsDateTime ) then
                     FAnimals.FieldByName('DaysToTest').AsInteger := CalcDaysLeftInTest(FieldByName('TBTestDate').AsDateTime,Date)
                  else if ( FieldByName('Brucellosis').AsDateTime > FieldByName('TBTestDate').AsDateTime ) then
                     FAnimals.FieldByName('DaysToTest').AsInteger := CalcDaysLeftInTest(FieldByName('Brucellosis').AsDateTime,Date);

               FAnimals.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
               FAnimals.FieldByName('HerdId').AsInteger := FieldByName('HerdId').AsInteger;
               FAnimals.Post;
               Next;
            end;
      end;

   if FAnimals.RecordCount > 0 then
      begin
         CreateAnimalGrid(False);
         AnimalGrid.SetFocus;
      end
   else
      MessageDlg('Search did not return any results',mtError,[mbOK],0);
end;

procedure TfmCrushSalesGroup.cbSearchOnPropertiesCloseUp(Sender: TObject);
begin
   btnClear.Click;
   teSearchAnimalTag.SetFocus;
end;

procedure TfmCrushSalesGroup.AnimalTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);

  function LocateActiveGroup (AnimalId : Integer) : String;
  begin
     Result := '';
     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;
           SQL.Clear;
           SQL.Add('SELECT G.ID, G.Description FROM Grps G');
           SQL.Add('LEFT JOIN Grplinks GL ON (GL.GroupID = G.ID)');
           SQL.Add('WHERE GL.AnimalID = :AnimalID');
           SQL.Add('AND G.GroupType = "Sales" ');
           SQL.Add('AND G.CrushLoadComplete = False');
           Params[0].AsInteger := AnimalId;
           Open;
           try
              First;
              CurrSaleGroupID := Fields[0].AsInteger;
              Result := Fields[1].AsString;
              AnimalInSaleGroup := Result <> '';
              if AnimalInSaleGroup then
                 begin
                    ceWeight.Value := FAnimalWeight;
                    btnRemoveAnimal.Visible := True
                 end
              else
                 ceWeight.EditValue := Null;
           finally
              Close;
           end;
        finally
           Free;
        end;
  end;

begin
   if (AFocusedRecord <> nil) then
      begin
         CurrAnimalID := AFocusedRecord.Values[AnimalTableViewID.Index];
         cmboHeader.Text := LocateActiveGroup(CurrAnimalID);
         cmboHeader.Enabled := True;
         ceWeight.Enabled := True;
      end
   else
      begin
         cmboHeader.Text := '';
         cmboHeader.Enabled := False;
         ceWeight.EditValue := Null;
         ceWeight.Enabled := False;
      end;
end;

procedure TfmCrushSalesGroup.teSearchAnimalTagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) then
       btnFind.Click;
end;

procedure TfmCrushSalesGroup.pcCrushSalesGroupDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if ATab.Index = pcCrushSalesGroup.ActivePageIndex then
      begin
         Font.Color := WinData.TouchScreenSelectedTab.TextColor;
      end
   else
      begin
         Font.Color := WinData.TouchScreenTab.TextColor;
      end;
end;

function TfmCrushSalesGroup.CalcDaysLeftInTest(ACurrTestDate, ASalesDate : TDateTime) : Integer;
var
   ExpectedTBDate : TDateTime;
   DaysToTest : Integer;
begin
   Result := 0;
   if ( ACurrTestDate > 0 ) and ( ASalesDate > 0 ) then
      begin
         ExpectedTBDate := IncMonth(ACurrTestDate,12);
         if ExpectedTBDate > ASalesDate then
            begin
               DaysToTest := Trunc(ExpectedTBDate - ASalesDate);
               Result := DaysToTest;
            end;
      end;
end;

procedure TfmCrushSalesGroup.cmboHeaderPropertiesCloseUp(Sender: TObject);
begin
   ceWeight.SetFocus;
end;

procedure TfmCrushSalesGroup.actSaveAnimalExecute(Sender: TObject);
begin
   if ( cmboHeader.Text > '' ) then
      begin
         SaveAnimal;
         actClearAnimal.Execute;
      end;
end;

procedure TfmCrushSalesGroup.SaveAnimal;

   procedure AddAnimalToXMLFile(AAnimalID, AGroupID : Integer; ADateJoined : TDateTime);
   begin
      if Def.Definition.dUseCrush then
         begin
            with TCrushXMLExport.Create do
               try
                  FAnimalGroup.GroupID := AGroupID;
                  FAnimalGroup.AnimalID := AAnimalID;
                  FAnimalGroup.DateJoined := ADateJoined;
                  CreateorOpenXMLFile(etPurchase);
                  AddLookupItemToXML;
               finally
                  Free;
               end;
         end;
   end;

   procedure UpdateGroup (NewGroupID, OldGroupID, AAnimalID : Integer; ADateJoined : TDateTime);
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE '+WinData.GroupLinks.TableName+' ');
            SQL.Add('SET GroupID = :NGroupID');
            SQL.Add('WHERE GroupID = :OGroupID');
            SQL.Add('AND AnimalId = :AnimalID');
            Params[0].AsInteger := NewGroupID;
            Params[1].AsInteger := OldGroupID;
            Params[2].AsInteger := AAnimalID;
            ExecSQL;

            AddAnimalToXMLFile(AAnimalID,NewGroupID,ADateJoined);
         finally
            Free;
         end;
   end;

begin
   if not( WinData.GroupLinks.Locate('AnimalId', CurrAnimalID,[]) and AnimalInSaleGroup ) then
      begin
         with WinData.GroupLinks do
            begin
               Append;
               FieldByName('GroupId').AsInteger := cmboHeader.EditValue;
               FieldByName('AnimalId').AsInteger := CurrAnimalID;
               FieldByName('DateJoined').AsDateTime := Date;
               Post;
            end;

         AddAnimalToXMLFile(CurrAnimalID,cmboHeader.EditValue,Date);

         if ( ceWeight.EditValue > 0 ) then
            begin
                WeighingEvent := TWeighingEvent.Create('CrushSaleWgts');

                WeighingEvent.Append;
                try
                   WeighingEvent.AnimalID := CurrAnimalID;
                   WeighingEvent.AnimalLactNo := 0;
                   WeighingEvent.AnimalHerdID := FAnimals.FieldByName('HerdId').AsInteger;
                   WeighingEvent.EventDate := Date;
                   WeighingEvent.Weight := ceWeight.Value;
                   WeighingEvent.Post;
                except
                   WeighingEvent.Cancel;
                   MessageDlg('Could not create weighing event!',mtError,[mbOK],0);
                end;

                //   30/11/11 [V5.0 R2.3] /MK Additional Feature - Create Pre Sale Weighing Event For Factory Sales.
                try
                   PreSaleEvent.Append;
                   PreSaleEvent.EventType := TSaleDeath;
                   PreSaleEvent.AnimalID  := CurrAnimalID;
                   PreSaleEvent.AnimalLactNo := 0;
                   PreSaleEvent.AnimalHerdID := FAnimals.FieldByName('HerdId').AsInteger;
                   PreSaleEvent.EventDate    := Date;
                   PreSaleEvent.Weight := ceWeight.Value;
                   PreSaleEvent.EventComment := 'Pre-Sale Weighing';
                   PreSaleEvent.Sold := FALSE;
                   PreSaleEvent.Customer := cmboHeader.EditValue;
                   PreSaleEvent.Notified := FALSE;
                   PreSaleEvent.PreSale  := TRUE;
                   PreSaleEvent.Slaughter := FALSE;
                   PreSaleEvent.EventSource := sInternal;
                   PreSaleEvent.Post;
                except
                   PreSaleEvent.Cancel;
                   MessageDlg('Could not create pre-sale weighing event!',mtError,[mbOK],0);
                end;
            end;
      end
   else if AnimalInSaleGroup then
      UpdateGroup(cmboHeader.EditValue,CurrSaleGroupID,CurrAnimalID,Date);

   if WeighingEvent <> nil then
      WeighingEvent.Free;

   LoadHeaders;
end;

procedure TfmCrushSalesGroup.actRemoveAnimalExecute(Sender: TObject);
var
   Value : Variant;
begin
   Value := AnimalTableView.DataController.Values[AnimalTableView.DataController.FocusedRecordIndex,
                                                  AnimalTableViewID.Index];
   if ( cmboHeader.EditValue > 0 ) and ( Value > 0 ) then
      if ( MessageDlg('Do you want to remove this animal from the header selected',mtWarning,[mbYes,mbNo],0) = mrYes ) then
         begin
            RemoveAnimal(Value,cmboHeader.EditValue,CurrWeighingID,CurrPreSaleWeighingID);
            LoadHeaders;
            ClearAnimal;
            btnRemoveAnimal.Visible := False;
         end;
end;

//   15/12/11 [V5.0 R2.8] /MK Additional Feature - Also Remove Weighing And PreSale Events For Animal.
procedure TfmCrushSalesGroup.RemoveAnimal(AAnimalID, AGroupID, AWeighingID, APreSaleID : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM '+WinData.GroupLinks.TableName+' ');
         SQL.Add('WHERE GroupID = :AGroupID');
         SQL.Add('AND AnimalID = :AAnimalID');
         Params[0].AsInteger := AGroupID;
         Params[1].AsInteger := AAnimalID;
         ExecSQL;

         SQL.Clear;
         SQL.Add('DELETE FROM '+WinData.Weighings.TableName+' ');
         SQL.Add('WHERE EventID = :AWeighingID');
         Params[0].AsInteger := AWeighingID;
         ExecSQL;

         SQL.Clear;
         SQL.Add('DELETE FROM '+WinData.SaleDeath.TableName+' ');
         SQL.Add('WHERE EventID = :APreSaleID');
         Params[0].AsInteger := APreSaleID;
         ExecSQL;

         SQL.Clear;
         SQL.Add('DELETE FROM Events');
         SQL.Add('WHERE ID IN ('+IntToStr(AWeighingID)+','+IntToStr(APreSaleID)+')');
         SQL.Add('AND AnimalID = :AAnimalID');
         Params[0].AsInteger := AAnimalID;
         ExecSQL;

      except
         on e : Exception do
            ShowMessage(e.Message);
      end;
end;

procedure TfmCrushSalesGroup.btnClearClick(Sender: TObject);
begin
   AnimalTableView.DataController.DataSource := nil;
   btnRemoveAnimal.Visible := False;
   teSearchAnimalTag.Text := '';
   try
      teSearchAnimalTag.SetFocus;
   except
   end;
end;

procedure TfmCrushSalesGroup.actClearAnimalExecute(Sender: TObject);
begin
   ClearAnimal;
end;

procedure TfmCrushSalesGroup.ClearAnimal;
begin
   cmboHeader.Text := '';
   ceWeight.EditValue := Null;
   AnimalTableView.DataController.DataSource := Nil;
   teSearchAnimalTag.Text := '';
   btnRemoveAnimal.Visible := False;
   teSearchAnimalTag.SetFocus;
end;

procedure TfmCrushSalesGroup.LoadHeaders;
begin
   with FHeaders do
      begin
         if ( qHeader.Active ) then
            begin
               qHeader.Active := False;
               qHeader.SQL.Add('AND G.CrushLoadComplete = False');
               qHeader.Active := True;
            end
         else if ( not(qHeader.Active) ) then
            begin
               qHeader.SQL.Add('AND G.CrushLoadComplete = False');
               qHeader.Active := True;
            end;

         FHeaders.Active := False;
         FHeaders.Active := True;
         qHeader.First;
         while not qHeader.EOF do
            begin
               //   15/12/11 [V5.0 R2.8] /MK Bug Fix - LoadHeaders Was Not Setting The FCount And SCount To Zero Before Each Group Was Loaded.
               FHeaders.Append;
               FHeaders.FieldByName('GroupId').AsInteger := qHeader.FieldByName('GroupID').AsInteger;
               FHeaders.FieldByName('GroupName').AsString := qHeader.FieldByName('Description').AsString;
               GetHeaderCount(FHeaders.FieldByName('GroupId').AsInteger);
               FHeaders.FieldByName('GroupSCount').AsInteger := FSCount;
               FHeaders.FieldByName('GroupFCount').AsInteger := FFCount;
               FHeaders.FieldByName('Printed').AsBoolean := False;
               FHeaders.Post;
               qHeader.Next;
            end;
         FHeaders.First;
      end;
end;

procedure TfmCrushSalesGroup.CompleteCrushLoad(AGroupID : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Grps');
         SQL.Add('SET CrushLoadComplete = True');
         SQL.Add('WHERE ID = :AGroupID');
         Params[0].AsInteger := AGroupID;
         ExecSQL;
      finally
         Free;
      end;
end;

procedure TfmCrushSalesGroup.HeaderGridDBTableViewSaveLoadPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   SValue,
   FValue,
   CurrGroupID,
   HeaderPrinted : Variant;
begin
   CurrGroupID := HeaderGridDBTableView.DataController.Values[HeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                              HeaderGridDBTableViewGroupID.Index];
   SValue := HeaderGridDBTableView.DataController.Values[HeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                         HeaderGridDBTableViewSCount.Index];
   FValue := HeaderGridDBTableView.DataController.Values[HeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                         HeaderGridDBTableViewFCount.Index];
   HeaderPrinted := HeaderGridDBTableView.DataController.Values[HeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                                HeaderGridDBTableViewPrintLoad.Index];

   // Only allow user to save header if the header is printed.
   if ( HeaderPrinted ) then
      begin
         if ( (SValue > 0) or (FValue > 0) ) then
            begin
               if ( MessageDlg('Are you sure you want to complete this load',mtWarning,[mbYes,mbNo],0) = mrYes ) then
                  CompleteCrushLoad(CurrGroupID);
            end
         else
           MessageDlg('There are no animals in this header',mtError,[mbOK],0);
      end
   else
      MessageDlg('Header has not been printed'+cCRLF+
                 'Please print header before pressing finish.',mtError,[mbOK],0);
end;

procedure TfmCrushSalesGroup.HeaderGridDBTableViewPrintLoadPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   if ( AnimalTableView.DataController.RecordCount > 0 ) then
      MessageDlg('You must finish adding the animal to header before printing',mtError,[mbOK],0)
   else
      LoadAnimalsToPrint;
end;

procedure TfmCrushSalesGroup.CreateAnimalGrid( AShowWeightField : Boolean );
begin
   AnimalTableViewID.DataBinding.FieldName := 'AnimalId';
   AnimalTableViewNatIdNum.DataBinding.FieldName := 'NatIdNum';
   AnimalTableViewNatIdNum.Width := 145;
   AnimalTableViewNatIdNum.MinWidth := 145;
   AnimalTableViewAgeInMonths.DataBinding.FieldName := 'AgeInMonths';
   AnimalTableViewAgeInMonths.Width := 70;
   AnimalTableViewAgeInMonths.MinWidth := 70;
   AnimalTableViewBreed.DataBinding.FieldName := 'Breed';
   AnimalTableViewBreed.Width := 70;
   AnimalTableViewBreed.MinWidth := 70;
   AnimalTableViewSex.DataBinding.FieldName := 'Sex';
   AnimalTableViewSex.Width := 60;
   AnimalTableViewSex.MinWidth := 60;
   AnimalTableViewDaysToTest.DataBinding.FieldName := 'DaysToTest';
   AnimalTableViewDaysToTest.Width := 79;
   AnimalTableViewDaysToTest.MinWidth := 79;
   AnimalTableViewOutsideWithdrawal.DataBinding.FieldName := 'OutsideWithdrawal';
   AnimalTableViewOutsideWithdrawal.Width := 94;
   AnimalTableViewOutsideWithdrawal.MinWidth := 94;
   AnimalTableViewAnimalNo.DataBinding.FieldName := 'AnimalNo';
   AnimalTableViewAnimalNo.Width := 90;
   AnimalTableViewAnimalNo.MinWidth := 90;
   AnimalTableView.DataController.DataSource := dsFAnimals;
   AnimalTableView.DataController.KeyFieldNames := 'AnimalID';

   AnimalTableView.OptionsView.Footer := AShowWeightField;
   AnimalTableViewWeight.Visible := AShowWeightField;

   AnimalTableView.DataController.RefreshExternalData;
end;

function TfmCrushSalesGroup.GetFAnimalWeight: Double;
var
   WeighingDate : TDateTime;
begin

   WinData.Events.Active := False;
   WinData.Events.Active := True;

   WeighingDate := WinData.EventDataHelper.GetLastEventDate(FAnimals.FieldByName('AnimalId').AsInteger, CWeightEvent);
   if ( WeighingDate > 0 ) then
       begin
          qWeighingEvent.SQL.Clear;
          qWeighingEvent.SQL.Add('SELECT E.ID, W.Weight FROM Events E');
          qWeighingEvent.SQL.Add('LEFT JOIN Weights W ON (W.EventId=E.ID)');
          qWeighingEvent.SQL.Add('WHERE E.AnimalID = :AID');
          qWeighingEvent.SQL.Add('AND E.EventDate = :WeighingDate');
          qWeighingEvent.SQL.Add('AND E.EventType = :EventType');
          qWeighingEvent.Params[0].Value := FAnimals.FieldByName('AnimalId').AsInteger;
          qWeighingEvent.Params[1].Value := WeighingDate;
          qWeighingEvent.Params[2].Value := CWeightEvent;
          qWeighingEvent.Open;
          qWeighingEvent.First;

          if qWeighingEvent.RecordCount > 0 then
             begin
                CurrWeighingID := qWeighingEvent.Fields[0].AsInteger;
                Result := qWeighingEvent.Fields[1].AsInteger;
             end;

          qPreSaleWeighing.SQL.Clear;
          qPreSaleWeighing.SQL.Add('SELECT E.ID FROM Events E');
          qPreSaleWeighing.SQL.Add('WHERE E.EventDate = :WeighingDate');
          qPreSaleWeighing.SQL.Add('AND E.AnimalID = :AnimalID');
          qPreSaleWeighing.SQL.Add('AND E.EventType = :PreSaleWeighingType');
          qPreSaleWeighing.Params[0].AsDateTime := WeighingDate;
          qPreSaleWeighing.Params[1].AsInteger := FAnimals.FieldByName('AnimalId').AsInteger;
          qPreSaleWeighing.Params[2].AsInteger := CSaleDeathEvent;
          qPreSaleWeighing.Open;
          qPreSaleWeighing.First;

          if qPreSaleWeighing.RecordCount > 0 then
             begin
                CurrPreSaleWeighingID := qPreSaleWeighing.Fields[0].AsInteger;
             end;
       end;
end;

procedure TfmCrushSalesGroup.LoadAnimalsToPrint;
var
   NoMonths : Integer;
   Value : Variant;
begin
   Value := HeaderGridDBTableView.DataController.Values[HeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                        HeaderGridDBTableViewGroupID.Index];

   FAnimals.Active := False;
   FAnimals.Active := True;

   if ( Value > 0 ) then
      begin
         with QueryAnimals do
             begin
                SQL.Clear;
                SQL.Add('SELECT A.ID, A.NatIdNum, A.SearchNatId, A.AnimalNo, A.HerdId,');
                SQL.Add('       A.DateOfBirth, A.Sex, A.TBTestDate, A.Brucellosis, A.SortAnimalNo, B.Code');
                SQL.Add('FROM Animals A');
                SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)');
                SQL.Add('WHERE (A.InHerd=True)');
                SQL.Add('AND   (A.AnimalDeleted=False)');
                SQl.Add('AND   (A.ID In (SELECT GL.AnimalID FROM GrpLinks GL ');
                SQl.Add('			 WHERE GL.GroupID = :GroupID) )');
                Params[0].AsInteger := Value;
                SQL.Add('ORDER BY A.SortAnimalNo');
                Open;
                First;
                while not EOF do
                   begin
                      FAnimals.Append;
                      FAnimals.FieldByName('AnimalId').AsInteger := FieldByName('ID').AsInteger;
                      FAnimals.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                      FAnimals.FieldByName('Breed').AsString := FieldByName('Code').AsString;

                      NoMonths := KRoutines.GetNoOfMonths(Date,FieldByName('DateOfBirth').AsDateTime);
                      FAnimals.FieldByName('AgeInMonths').AsInteger := NoMonths;

                      if ( UpperCase(FieldByName('Sex').AsString) = 'FEMALE' ) then
                         FAnimals.FieldByName('Sex').AsString := 'F'
                      else if ( UpperCase(FieldByName('Sex').AsString) = 'BULL' ) or ( UpperCase(FieldByName('Sex').AsString) = 'STEER' ) then
                         FAnimals.FieldByName('Sex').AsString := 'M';

                      if ( (FieldByName('TBTestDate').AsDateTime > 0) or (FieldByName('Brucellosis').AsDateTime > 0) ) then
                         if ( FieldByName('TBTestDate').AsDateTime > FieldByName('Brucellosis').AsDateTime ) then
                            FAnimals.FieldByName('DaysToTest').AsInteger := CalcDaysLeftInTest(FieldByName('TBTestDate').AsDateTime,Date)
                         else if ( FieldByName('Brucellosis').AsDateTime > FieldByName('TBTestDate').AsDateTime ) then
                            FAnimals.FieldByName('DaysToTest').AsInteger := CalcDaysLeftInTest(FieldByName('Brucellosis').AsDateTime,Date);

                      FAnimals.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                      FAnimals.FieldByName('HerdId').AsInteger := FieldByName('HerdId').AsInteger;
                      FAnimals.FieldByName('Weight').AsFloat := FAnimalWeight;
                      FAnimals.Post;
                      Next;
                   end;
            end;
      end;

   if FAnimals.RecordCount > 0 then
      PrintLoad;
end;

procedure TfmCrushSalesGroup.PrintLoad;

   procedure FilterAnimalGridPrint ( AAnimalSex : String) ;
   begin
      AnimalTableView.DataController.Filter.Root.Clear;
      AnimalTableView.DataController.Filter.Active := False;
      AnimalTableView.DataController.Filter.AddItem(nil, AnimalTableViewSex, foEqual, AAnimalSex, '');
      AnimalTableView.DataController.Filter.Active := True;
      if ( AnimalTableView.DataController.FilteredRecordCount > 0 ) then
         begin
            //   16/01/13 [V5.1 R3.8] /MK Additional Feature - Add Report Title of Group Name.
            if ( Length(FHeaders.FieldByName('GroupName').AsString) > 0 ) then
               AnimalGridPrinterLink.ReportTitle.Text := FHeaders.FieldByName('GroupName').AsString + ' ' + WinData.UserDefaultHerdName
            else
               HeaderGridtPrinterLinkComponent.PrintTitle := WinData.UserDefaultHerdName;
            AnimalGridPrinterLink.Preview;
         end;
      AnimalGridPrinterLink.ReportTitle.Text := '';
   end;

begin
   CreateAnimalGrid(True);
   if ( not(AnimalGridPrinterLink.PreviewExists) ) then
      begin
         FilterAnimalGridPrint('F');
         FilterAnimalGridPrint('M');
      end;

   Timer.Enabled := True;

   AnimalTableView.DataController.Filter.Root.Clear;
   AnimalTableView.DataController.Filter.Active := False;
   AnimalTableView.OptionsView.Footer := False;
   btnRemoveAnimal.Visible := False;
   AnimalTableViewWeight.Visible := False;
   FAnimals.Active := False;
   AnimalTableView.DataController.DataSource := nil;
end;

procedure TfmCrushSalesGroup.TimerTimer(Sender: TObject);
begin
   // Set new Printed field to true after print. This will allow user to save header.
   Timer.Enabled := False;
   FHeaders.Edit;
   FHeaders.FieldByName('Printed').AsBoolean := True;
   FHeaders.Post;
end;

class procedure TfmCrushSalesGroup.Show;
begin
   with TfmCrushSalesGroup.Create(nil) do
      try
         pcCrushSalesGroup.ActivePageIndex := 0;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCrushSalesGroup.FormDestroy(Sender: TObject);
begin
   if qHeader.Active then
      qHeader.Active := False;

   if (QueryAnimals.Active) then
      QueryAnimals.Active := False;

   if AnimalRecord <> nil then
      AnimalRecord.Free;

   if PreSaleEvent <> nil then
      PreSaleEvent.Free;

   Application.OnMessage := nil;

   FAnimals.Close;
   FreeAndNil(FAnimals);
end;

procedure TfmCrushSalesGroup.actCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmCrushSalesGroup.actRemoveHeaderExecute(Sender: TObject);
var
   Value : Variant;
begin
   Value := cxHeaderGridDBTableView.DataController.Values[cxHeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                          cxGridDBGroupID.Index];
   if ( Value > 0 ) then
      RemoveHeader(Value);
end;

procedure TfmCrushSalesGroup.RemoveHeader(AGroupID : Integer);
var
   qDeleteHeader : TQuery;
begin
   cxHeaderGridDBTableView.DataController.BeginFullUpdate;
   qHeader.Active := False;
   qDeleteHeader := TQuery.Create(nil);
   with qDeleteHeader do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM Grps');
         SQL.Add('WHERE ID = '+IntToStr(AGroupID)+' ');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
   qHeader.Active := True;
   cxHeaderGridDBTableView.DataController.EndFullUpdate;
end;

procedure TfmCrushSalesGroup.cxHeaderGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
   Value : Variant;
begin
   Value := cxHeaderGridDBTableView.DataController.Values[cxHeaderGridDBTableView.DataController.FocusedRecordIndex,
                                                          cxGridDBGroupID.Index];
   if ( not(Value = null) ) then
      begin
         GetHeaderCount(Value);
         if ( FSCount = 0 ) and ( FFCount = 0 ) then
            btnRemoveHeader.Visible := True
         else if ( FSCount > 0 ) or ( FFCount > 0 ) then
            btnRemoveHeader.Visible := False;
      end;
end;

procedure TfmCrushSalesGroup.GetHeaderCount(GroupID : Integer);
begin
   FSCount := 0;
   FFCount := 0;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT G.AnimalID, A.Sex');
         SQL.Add('FROM GrpLinks G');
         SQL.Add('LEFT JOIN Animals A On (A.ID = G.AnimalID)');
         SQL.Add('WHERE GroupID = :GroupID');
         SQL.Add('AND A.Inherd = True');
         SQL.Add('AND A.AnimalDeleted = False');
         Params[0].AsInteger := GroupID;
         Open;
         try
            First;
            while not EOF do
               begin
                  if ( UpperCase(Fields[1].AsString) = 'FEMALE' ) then
                     FFCount := FFCount + 1
                  else if ( (UpperCase(Fields[1].AsString) = 'BULL') or (UpperCase(Fields[1].AsString) = 'STEER') ) then
                     FSCount := FSCount + 1;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

end.
