{
   14/05/14 [V5.3 R0.2] /MK Additional Feature - Added Show All option to show all medicine's and their types - GL Request.

   16/05/14 [V5.3 R0.4] /MK Change - GL Requested that when program opens show null and other types if null groups found.

   12/11/15 [V5.5 R0.5] /MK Additional Feature - Changes made to allow to check for medicines that do not have withdrawal information - Shane Maxwell/GL request.

   16/11/15 [V5.5 R0.6] /MK Bug Fix - SQL to insert animals to temp table should check if drugs are in health.db first.

   24/11/16 [V5.6 R3.5] /MK Change - Added the VPA Number to this screen - GL/Dan Norton/Martin O'Leary request.

   24/01/17 [V5.6 R4.2] /MK Change - Add primary check for InUse drugs - John Wynne request.

   17/01/17 [V5.6 R9.2] /MK Change - Removed primary check for InUse and added primary check for drugs used in the last 18 months - GL request.
                                   - Added check for VPA number to secondary check i.e cbIncludeMedicines is not ticked.
                                   - Changed caption of cbIncludeMedicines to Show all medicines used in last 18 months - GL request.
                                   - Added NOT Bord Bia registered tick box that stops this screen from appearing in Startup Reminders screen.
                                   - Changed caption of the form to Incomplete Medicines.

   21/08/17 [V5.7 R2.0] /MK Change - When adding the VPA Number to the drug from uDrugFinder then add the medicine group and dose/purchase unit as well.

   22/08/17 [V5.7 R2.0] /MK Change - If country is Ireland then show edit button in VPANumber else set column to text edit property.

   23/08/17 [V5.7 R2.0] /MK Change - actSaveExecute - If duplicate VPA Number found then format error to show what VPA Number it is.
                            Additional Feature - Added DoseUnit and PurchUnit to temp table so when drug is saved the dose and purch unit that came from DrugFinder
                                                 get saved into the Medicine table.

   28/08/17 [V5.7 R2.1] /MK Change - Default VPANo to uppercase like Review Medicines screen.
                            Additional Feature - New procedure, MergeDuplicateVPA, which is called when the user clicks save and the same VPA entered by the user
                                                 or selected from DrugFinder already exists in the database, keeping the first ID in the table.

   25/09/17 [V5.7 R2.7] /MK Bug Fix - OnChange of Milk, Meat and NA PostEditValue to make sure change is made before checking the field.
                                    - OnChange of Group then set MedicineChanged to True.
                                    - actSaveExecute - On set of meat or milk the NA was set to false even though it may have been set to true before this query.
                                                     - Update Medicine table regardless if MedicineNA is true or false.

   06/12/17 [V5.7 R5.9] /MK Bug Fix - Moved code from Milk and Meat Days from OnChange to OnEditValueChanged so user can type more than a single digit.

   16/08/18 [V5.8 R2.4] /MK Additional Feature - When bringing in drug from DrugFinder then bring down the withdrawal information as well.
                                               - Added new fields, boolean and date&time, to TempTable that store whether the withdrawal information was brought down from DrugFinder.
                                               - If the withdrawal information is brought down from DrugFinder then set the boolean/date&time fields.
                                               - actSaveExecute - Update the medicine table with these new boolean/date&time fields.
}

unit uMedicinesNullGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, ExtCtrls, dxBar,
  dxBarExtItems, ActnList, dxStatusBar, cxGridDBTableView,
  GenTypesConst, uHerdLookup, cxContainer, cxEdit, cxLabel, uAnimalRemedyData,
  db, dbTables, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, cxCurrencyEdit, cxTextEdit, KRoutines,
  uFarmSyncSettings, KDBRoutines, DairyData, uDrugFinder, cxButtonEdit,
  uMedicineClearUp, uDrugFinderWithdMsg;

type
  TfmMedicinesNullGroup = class(TfmBaseForm)
    InfoPanel: TPanel;
    MedicineGridLevel: TcxGridLevel;
    MedicineGrid: TcxGrid;
    lInfo: TcxLabel;
    actSave: TAction;
    blbSave: TdxBarLargeButton;
    pAllowAllDrugs: TPanel;
    cbIncludeMedicines: TcxCheckBox;
    MedicineGridDBBandedTableView: TcxGridDBBandedTableView;
    MedicineGridDBBandedTableViewMedicineName: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineGroupID: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineMeatDays: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineMilkDays: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineOrgMeatDays: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineOrgMilkDays: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineNA: TcxGridDBBandedColumn;
    MedicineGridDBBandedTableViewMedicineVPANo: TcxGridDBBandedColumn;
    cbNotBordBiaRegistered: TcxCheckBox;
    Image1: TImage;
    procedure actSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbIncludeMedicinesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MedicineGridDBBandedTableViewEditKeyPress(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
    procedure MedicineGridDBBandedTableViewMedicineNAPropertiesChange(
      Sender: TObject);
    procedure cbNotBordBiaRegisteredPropertiesChange(Sender: TObject);
    procedure MedicineGridDBBandedTableViewMedicineVPANoPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure MedicineGridDBBandedTableViewEditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure MedicineGridDBBandedTableViewMedicineVPANoPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MedicineGridDBBandedTableViewMedicineGroupIDPropertiesChange(
      Sender: TObject);
    procedure MedicineGridDBBandedTableViewMedicineMeatDaysPropertiesEditValueChanged(
      Sender: TObject);
    procedure MedicineGridDBBandedTableViewMedicineMilkDaysPropertiesEditValueChanged(
      Sender: TObject);
  private
    FAnimalRemedyData : TAnimalRemedyData;
    FMedicineDataSource : TDataSource;
    FMedicineTable : TTable;
    FMedicineQuery : TQuery;
    FMedicineGroupsData : TTable;
    FShowAllTypes : Boolean;
    FHerdType : THerdType;
    FMedicineNAField : TBooleanField;
    FOrganicHerd : Boolean;
    procedure CreateData;
    procedure AddDataToTable;
    procedure ApplyFilterToTable;
    procedure ClearFilterFromTable;
    procedure MergeDuplicateVPA(AVPAs : PStringArray);
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm (AShowAllTypes : Boolean);
  end;

var
  fmMedicinesNullGroup: TfmMedicinesNullGroup;

implementation

{$R *.DFM}

{ TfmMedicinesNullGroup }

class procedure TfmMedicinesNullGroup.ShowTheForm (AShowAllTypes : Boolean);
begin
   with TfmMedicinesNullGroup.Create(nil) do
      try
         if ( FAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal > 0 ) or ( AShowAllTypes ) then
            begin
               FShowAllTypes := AShowAllTypes;
               CreateData;
               MedicineGridDBBandedTableViewMedicineName.Width := 100;
               MedicineGridDBBandedTableViewMedicineGroupID.Width := 64;
               MedicineGridDBBandedTableViewMedicineMeatDays.Width := 64;
               MedicineGridDBBandedTableViewMedicineMilkDays.Width := 64;
               MedicineGridDBBandedTableViewMedicineOrgMeatDays.Width := 64;
               MedicineGridDBBandedTableViewMedicineOrgMilkDays.Width := 64;
               MedicineGridDBBandedTableViewMedicineNA.Width := 64;
               MedicineGridDBBandedTableViewMedicineVPANo.Width := 64;
               ShowModal;
            end;
      finally
         Free;
      end;
end;

procedure TfmMedicinesNullGroup.FormCreate(Sender: TObject);
var
  i : Integer;
  MediGroupArray : array of String;

  procedure AddToTable ( AID : Integer; ADescription : String );
  begin
     FMedicineGroupsData.Append;
     FMedicineGroupsData.FieldByName('ID').AsInteger := AID;
     FMedicineGroupsData.FieldByName('Description').AsString := ADescription;
     try
        FMedicineGroupsData.Post;
     except
        on e : Exception do
           ShowMessage(e.Message);
     end;
  end;

begin
   inherited;
   MedicineGridDBBandedTableViewMedicineGroupID.RepositoryItem := HerdLookup.erMedicineGroupLookup;

   SetLength(MediGroupArray,5);

   MediGroupArray[0] := 'Antibiotic';
   MediGroupArray[1] := 'Dose';
   MediGroupArray[2] := 'Vaccine';
   MediGroupArray[3] := 'Tube';
   MediGroupArray[4] := 'Other';

   FMedicineGroupsData := TTable.Create(nil);
   with FMedicineGroupsData do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpMedicineGroups';
         FieldDefs.Add('ID',ftInteger);
         FieldDefs.Add('Description',ftString,30);
         CreateTable;
         Open;

         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT ID, Description');
               SQL.Add('FROM GenLook');
               SQL.Add('WHERE ListType = '+IntToStr(LMedicineGroup)+'');
               try
                  Open;
                  First;
                  for i := 0 to Length(MediGroupArray)-1 do
                     begin
                        if ( Locate('Description',MediGroupArray[i],[]) ) then
                           AddToTable(FieldByName('ID').AsInteger,FieldByName('Description').AsString);
                     end;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Free;
            end;
      end;

   HerdLookup.dsQueryMedicineGroups.DataSet := FMedicineGroupsData;

   FHerdType := HerdLookup.GetHerdType(HerdLookup.HerdOwnerData.HerdID);
   MedicineGridDBBandedTableViewMedicineNA.Caption := 'N/A';
   if ( FHerdType = htDairy ) then
      MedicineGridDBBandedTableViewMedicineNA.Caption := 'Milk N/A'
   else
      MedicineGridDBBandedTableViewMedicineNA.Caption := 'Meat N/A';

   FOrganicHerd := HerdLookup.HerdOwnerData.OrganicHerd;
end;

procedure TfmMedicinesNullGroup.FormActivate(Sender: TObject);
var
   i : Integer;
begin
   inherited;
   cbIncludeMedicines.Checked := FShowAllTypes;
   with MedicineGridDBBandedTableView do
      begin
         for i := 0 to Bands.Count-1 do
            if ( UpperCase(Bands[i].Caption) = 'ORGANIC WITHDRAWALS DAYS' ) then
               Bands[i].Visible := FOrganicHerd;
      end;
   cbNotBordBiaRegistered.Properties.OnChange := nil;
   cbNotBordBiaRegistered.Checked := ( not(WinData.IsBordBiaRegistered) );
   cbNotBordBiaRegistered.Properties.OnChange := cbNotBordBiaRegisteredPropertiesChange;
   MedicineGridDBBandedTableView.DataController.FocusedRowIndex := 0;
   OnActivate := nil;
end;

procedure TfmMedicinesNullGroup.CreateData;
begin
   FMedicineTable := TTable.Create(nil);
   with FMedicineTable do
      begin
         DatabaseName := AliasName;
         TableName := 'TmpMedicinesNoGroup';
         FieldDefs.Add('MedicineID',ftInteger);
         FieldDefs.Add('MedicineName',ftString,30);
         FieldDefs.Add('MedicineGroupID',ftInteger);
         FieldDefs.Add('MedicineVPANo',ftString,20);
         FieldDefs.Add('MedicineMeatDays',ftFloat);
         FieldDefs.Add('MedicineMilkDays',ftInteger);
         FieldDefs.Add('MedicineNA',ftBoolean);
         FieldDefs.Add('MedicineOrgMeatDays',ftInteger);
         FieldDefs.Add('MedicineOrgMilkDays',ftInteger);
         FieldDefs.Add('DrugDoseUnit',ftInteger);
         FieldDefs.Add('DrugPurchUnit',ftInteger);
         FieldDefs.Add('IncompleteMedicine',ftBoolean);
         FieldDefs.Add('MedicineChanged',ftBoolean);
         FieldDefs.Add('DrugFindWithdAccepted',ftBoolean);
         FieldDefs.Add('DrugFindWithdAcceptDate',ftDateTime);
         FieldDefs.Add('MeatWithdBroughtDown',ftInteger);
         FieldDefs.Add('MilkWithdBroughtDown',ftInteger);
         FieldDefs.Add('OldMeatWithdrawal',ftInteger);
         FieldDefs.Add('OldMilkWithdrawal',ftInteger);
         with IndexDefs do
            begin
               Clear;
               Add('iMedicineID','MedicineID',[ixUnique, ixPrimary]);
               Add('iMedicineVPANo','MedicineVPANo',[ixCaseInsensitive]);
            end;
         try
            CreateTable;
         except
            on e : Exception do
              ShowMessage(e.Message);
         end;
         Open;
      end;

   FMedicineDataSource := TDataSource.Create(nil);
   FMedicineDataSource.DataSet := FMedicineTable;

   FMedicineQuery := TQuery.Create(nil);
   FMedicineQuery.DatabaseName := AliasName;

   AddDataToTable;

   FMedicineTable.Close;
   FMedicineTable.Open;

   MedicineGridDBBandedTableView.DataController.DataSource := FMedicineDataSource;
   if ( WinData.SystemRegisteredCountry = Ireland ) then
      begin
         MedicineGridDBBandedTableViewMedicineVPANo.PropertiesClass := TcxButtonEditProperties;
         MedicineGridDBBandedTableViewMedicineVPANo.Options.ShowEditButtons := isebAlways
      end
   else
      begin
         MedicineGridDBBandedTableViewMedicineVPANo.PropertiesClass := TcxTextEditProperties;
         MedicineGridDBBandedTableViewMedicineVPANo.Options.ShowEditButtons := isebNever;
      end;

   MedicineGridDBBandedTableViewMedicineVPANo.Options.CellMerging := False;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.Editing := True;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.Filtering := False;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.FilteringMRUItemsList := False;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.Focusing := True;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.Grouping := False;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.HorzSizing := True;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.IncSearch := False;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.Moving := False;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.Sorting:= True;
   MedicineGridDBBandedTableViewMedicineVPANo.Options.VertSizing:= True;
end;

procedure TfmMedicinesNullGroup.AddDataToTable;

   function GetValidVPANo (ADrugID : Integer) : String;
   begin
      Result := '';
      if ( ADrugID = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT VPANo');
            SQL.Add('FROM Medicine');
            SQL.Add('WHERE ID = '+IntToStr(ADrugID)+'');
            try
               Open;
               if ( RecordCount > 0 ) then
                  if ( Length(Fields[0].AsString) > 0 ) then
                     Result := FormatVPANumber(Fields[0].AsString);
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

var
   i : Integer;
   sInsertSQL,
   sSelectStandardSQL,
   sSelectIncompleteDrugSQL : String;
begin
   MedicineGridDBBandedTableView.DataController.BeginFullUpdate;
   FMedicineTable.Filter := '';
   FMedicineTable.Filtered := False;
   FMedicineTable.Close;
   with FMedicineQuery do
      try
         SQL.Clear;
         SQL.Add('DELETE FROM '+FMedicineTable.TableName+'');
         ExecSQL;

         SQL.Clear;
         SQL.Add('INSERT INTO '+FMedicineTable.TableName+' (MedicineID, MedicineName, MedicineGroupID,');
         SQL.Add('                                          MedicineMeatDays, MedicineMilkDays, MedicineNA, IncompleteMedicine');
         if ( FOrganicHerd ) then
            SQL.Add('                                          ,MedicineOrgMeatDays, MedicineOrgMilkDays');
         SQL.Add('                                         )');
         sInsertSQL := FMedicineQuery.SQL.Text;

         SQL.Clear;
         SQL.Add('SELECT ID, Upper(Name) Name, MediGroup, Withdrawal, MilkWithDrawal');
         if ( FHerdType = htDairy ) then
             SQL.Add('     , MilkN_A_Drug')
         else
             SQL.Add('     , MeatN_A_Drug');
         SQL.Add(', False');
         if ( FOrganicHerd ) then
            SQL.Add('      , OrganicMeatWithdrawal, OrganicMilkWithdrawal');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE (ID IN (SELECT DISTINCT(DrugUsed)');
         SQL.Add('              FROM Health');
         SQL.Add('              WHERE EventID IN (SELECT ID');
         SQL.Add('                                FROM Events');
         SQL.Add('                                WHERE EventType IN ('+IntToStr(CDryOffEvent)+', '+IntToStr(CHealthEvent)+', '+IntToStr(CHerdVaccination)+')');
         SQL.Add('                                AND   EventDate >= "'+FormatDateTime(cUSDateStyle,IncMonth(Date,-18))+'")))');
         sSelectStandardSQL := SQL.Text;

         SQL.Clear;
         SQL.Add('AND   ( ((VPANo = "") OR (VPANo IS NULL)) OR');
         SQL.Add('        ( (MediGroup IS NULL) OR ');
         SQL.Add('	   ((Withdrawal IS NULL) AND (MilkWithDrawal IS NULL))');
         if ( FOrganicHerd ) then
            SQL.Add('	 OR ((OrganicMeatWithdrawal IS NULL) AND (OrganicMilkWithdrawal IS NULL))');
         SQL.Add('))');
         sSelectIncompleteDrugSQL := SQL.Text;

         SQL.Clear;
         SQL.Text := sInsertSQL+sSelectStandardSQL;
         ExecSQL;

         FMedicineQuery.Close;
         FMedicineQuery.SQL.Clear;
         FMedicineQuery.SQL.Text := sSelectStandardSQL+sSelectIncompleteDrugSQL;
         FMedicineQuery.Open;
         if ( not(FMedicineTable.Active) ) then
            FMedicineTable.Open;
         if ( FMedicineQuery.RecordCount > 0 ) then
            begin
               FMedicineQuery.First;
               while ( not(FMedicineQuery.Eof) ) do
                  begin
                     if ( FMedicineTable.Locate('MedicineID',FMedicineQuery.FieldByName('ID').AsInteger,[]) ) then
                        begin
                           FMedicineTable.Edit;
                           FMedicineTable.FieldByName('IncompleteMedicine').AsBoolean := True;
                           FMedicineTable.Post;
                        end
                     else
                        begin
                           FMedicineTable.Append;
                           FMedicineTable.FieldByName('IncompleteMedicine').AsBoolean := True;
                           FMedicineTable.FieldByName('MedicineID').AsInteger := FMedicineQuery.FieldByName('ID').AsInteger;
                           FMedicineTable.FieldByName('MedicineName').AsString := FMedicineQuery.FieldByName('Name').AsString;
                           FMedicineTable.FieldByName('MedicineGroupID').AsInteger := FMedicineQuery.FieldByName('MediGroup').AsInteger;
                           FMedicineTable.FieldByName('MedicineMeatDays').AsInteger := FMedicineQuery.FieldByName('Withdrawal').AsInteger;
                           FMedicineTable.FieldByName('MedicineMilkDays').AsInteger := FMedicineQuery.FieldByName('MilkWithDrawal').AsInteger;
                           if ( FOrganicHerd ) then
                              begin
                                 FMedicineTable.FieldByName('MedicineOrgMeatDays').AsInteger := FMedicineQuery.FieldByName('OrganicMeatWithdrawal').AsInteger;
                                 FMedicineTable.FieldByName('MedicineOrgMilkDays').AsInteger := FMedicineQuery.FieldByName('OrganicMilkWithdrawal').AsInteger;
                              end;
                           if ( FHerdType = htDairy ) then
                               FMedicineTable.FieldByName('MedicineNA').AsBoolean := FMedicineQuery.FieldByName('MilkN_A_Drug').AsBoolean
                           else
                               FMedicineTable.FieldByName('MedicineNA').AsBoolean := FMedicineQuery.FieldByName('MeatN_A_Drug').AsBoolean;
                           FMedicineTable.Post;
                        end;
                     FMedicineQuery.Next;
                  end;
            end;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;

   FMedicineTable.Open;
   for i := 1 to FMedicineTable.RecordCount do
      begin
         FMedicineTable.RecNo := i;
         FMedicineTable.Edit;
         if ( FMedicineTable.FieldByName('MedicineMeatDays').AsInteger = 9999 ) then
            FMedicineTable.FieldByName('MedicineMeatDays').AsVariant := Null;
         if ( FMedicineTable.FieldByName('MedicineMilkDays').AsInteger = 9999 ) then
            FMedicineTable.FieldByName('MedicineMilkDays').AsVariant := Null;
         if ( FMedicineTable.FieldByName('MedicineOrgMeatDays').AsInteger = 9999 ) then
            FMedicineTable.FieldByName('MedicineOrgMeatDays').AsVariant := Null;
         if ( FMedicineTable.FieldByName('MedicineOrgMilkDays').AsInteger = 9999 ) then
            FMedicineTable.FieldByName('MedicineOrgMilkDays').AsVariant := Null;
         FMedicineTable.FieldByName('MedicineVPANo').AsString := GetValidVPANo(FMedicineTable.FieldByName('MedicineID').AsInteger);
         FMedicineTable.Post;
      end;

   ApplyFilterToTable;
   MedicineGridDBBandedTableView.DataController.EndFullUpdate;
end;

procedure TfmMedicinesNullGroup.actSaveExecute(Sender: TObject);
var
   i, j,
   iMedUpdateCount : Integer;
   qUpdateMeds : TQuery;
   saDuplicateVPAs : PStringArray;
begin
   inherited;
   if ( FMedicineTable.RecordCount = 0 ) then
      begin
         MessageDlg('No data to update.',mtError,[mbOK],0);
         Exit;
      end;

   if ( FMedicineTable.State in dsEditModes ) then
      FMedicineTable.Post;
   FMedicineTable.Close;
   FMedicineTable.Filter := '';
   FMedicineTable.Filtered := False;
   FMedicineTable.Open;

   iMedUpdateCount := 0;
   qUpdateMeds := TQuery.Create(nil);
   qUpdateMeds.DatabaseName := AliasName;
   SetLength(saDuplicateVPAs,0);
   for i := 1 to FMedicineTable.RecordCount do
      try
         FMedicineTable.RecNo := i;
         with qUpdateMeds do
            begin
               Close;
               if ( FMedicineTable.FieldByName('MedicineChanged').AsBoolean ) then
                  begin
                     if ( Length(FMedicineTable.FieldByName('MedicineVPANo').AsString) > 0 ) then
                        if ( HerdLookup.DuplicateVPAFound(FormatVPANumber(FMedicineTable.FieldByName('MedicineVPANo').AsString),
                                                          FMedicineTable.FieldByName('MedicineID').AsInteger) ) then
                           if ( not(InArray(FMedicineTable.FieldByName('MedicineVPANo').AsString,saDuplicateVPAs)) ) then
                              begin
                                 SetLength(saDuplicateVPAs,Length(saDuplicateVPAs)+1);
                                 saDuplicateVPAs[Length(saDuplicateVPAs)-1] := FMedicineTable.FieldByName('MedicineVPANo').AsString;
                              end;

                     SQL.Clear;
                     SQL.Add('UPDATE Medicine');
                     SQL.Add('SET VPANo = "'+FormatVPANumber(FMedicineTable.FieldByName('MedicineVPANo').AsString)+'"');
                     SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger)+'');
                     try
                        ExecSQL;
                     except
                     end;

                     if ( FMedicineTable.FieldByName('MedicineGroupID').AsInteger > 0 ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET MediGroup = '+IntToStr(FMedicineTable.FieldByName('MedicineGroupID').AsInteger)+'');
                           SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger)+'');
                           try
                              ExecSQL;
                           except
                           end;
                        end;

                     //    25/09/17 [V5.7 R3.0] /MK Bug Fix - Update Medicine table regardless if MedicineNA is true or false.
                     if ( FMedicineTable.FieldByName('MedicineNA').AsBoolean ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET ');
                           if ( FHerdType = htDairy ) then
                              SQL.Add('    MilkWithDrawal = 9999, MilkN_A_Drug = TRUE')
                           else
                              SQL.Add('    WithDrawal = 9999, MeatN_A_Drug = TRUE');
                           SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger)+'');
                           try
                              ExecSQL;
                           except
                           end;
                        end
                     else
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET ');
                           if ( FHerdType = htDairy ) then
                              SQL.Add('    MilkWithDrawal = 0, MilkN_A_Drug = FALSE')
                           else
                              SQL.Add('    WithDrawal = 0, MeatN_A_Drug = FALSE');
                           SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger)+'');
                           try
                              ExecSQL;
                           except
                           end;
                        end;

                     //    25/09/17 [V5.7 R3.0] /MK Bug Fix - On set of meat or milk the NA was set to false even though it may have been set to true before this query.
                     if ( FMedicineTable.FieldByName('MedicineMilkDays').AsInteger > 0 ) or
                        ( FMedicineTable.FieldByName('MedicineMeatDays').AsInteger > 0 ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET ');
                           if ( FMedicineTable.FieldByName('MedicineMilkDays').AsInteger > 0 ) and
                              ( FMedicineTable.FieldByName('MedicineMeatDays').AsInteger > 0 ) then
                              begin
                                 SQL.Add('    MilkWithDrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineMilkDays').AsInteger)+',');
                                 SQL.Add('    Withdrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineMeatDays').AsInteger));
                              end
                           else if ( FMedicineTable.FieldByName('MedicineMilkDays').AsInteger > 0 ) then
                              SQL.Add('    MilkWithDrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineMilkDays').AsInteger))
                           else if ( FMedicineTable.FieldByName('MedicineMeatDays').AsInteger > 0 ) then
                              SQL.Add('    Withdrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineMeatDays').AsInteger));
                           SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger));
                           try
                              ExecSQL;
                           except
                           end;
                        end;

                     if ( FMedicineTable.FieldByName('DrugDoseUnit').AsVariant <> Null ) or
                        ( FMedicineTable.FieldByName('DrugPurchUnit').AsVariant <> Null ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET DoseUnit = '+IntToStr(FMedicineTable.FieldByName('DrugDoseUnit').AsInteger)+',');
                           SQL.Add('    PurchUnit = '+IntToStr(FMedicineTable.FieldByName('DrugPurchUnit').AsInteger)+'');
                           SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger)+'');
                           try
                              ExecSQL;
                           except
                           end;
                        end;

                     if ( FOrganicHerd ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET ');
                           if ( FMedicineTable.FieldByName('MedicineOrgMeatDays').AsVariant <> Null ) and
                              ( FMedicineTable.FieldByName('MedicineOrgMilkDays').AsVariant <> Null ) then
                              begin
                                 SQL.Add('    OrganicMeatWithdrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineOrgMeatDays').AsInteger)+', ');
                                 SQL.Add('    OrganicMilkWithdrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineOrgMilkDays').AsInteger)+'');
                              end
                           else if ( FMedicineTable.FieldByName('MedicineOrgMeatDays').AsInteger >= 0 ) then
                              SQL.Add('    OrganicMeatWithdrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineOrgMeatDays').AsInteger)+'')
                           else if ( FMedicineTable.FieldByName('MedicineOrgMilkDays').AsInteger >= 0 ) then
                              SQL.Add('    OrganicMilkWithdrawal = '+IntToStr(FMedicineTable.FieldByName('MedicineOrgMilkDays').AsInteger)+'');
                           SQL.Add('WHERE ID = '+IntToStr(FMedicineTable.FieldByName('MedicineID').AsInteger)+'');
                           try
                              ExecSQL;
                           except
                           end;
                        end;

                     if ( FMedicineTable.FieldByName('DrugFindWithdAccepted').AsBoolean ) then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE Medicine');
                           SQL.Add('SET MeatWithdBroughtDown = :MeatBroughDown,');
                           SQL.Add('    MilkWithdBroughtDown = :MilkBroughDown,');
                           SQL.Add('    OldMeatWithdrawal = :OldMeatVal,');
                           SQL.Add('    OldMilkWithdrawal = :OldMilkVal,');
                           SQL.Add('    DrugFindWithdAccepted = True,');
                           SQL.Add('    DrugFindWithdAcceptDate = :Today');
                           SQL.Add('WHERE ID = :SelectedDrug');
                           Params[0].AsInteger := FMedicineTable.FieldByName('MeatWithdBroughtDown').AsInteger;
                           Params[1].AsInteger := FMedicineTable.FieldByName('MilkWithdBroughtDown').AsInteger;
                           Params[2].AsInteger := FMedicineTable.FieldByName('OldMeatWithdrawal').AsInteger;
                           Params[3].AsInteger := FMedicineTable.FieldByName('OldMilkWithdrawal').AsInteger;
                           Params[4].AsDateTime := Now;
                           Params[5].AsInteger := FMedicineTable.FieldByName('MedicineID').AsInteger;
                           ExecSQL;
                        end;


                     FMedicineTable.Edit;
                     FMedicineTable.FieldByName('MedicineChanged').AsBoolean := False;
                     FMedicineTable.FieldByName('IncompleteMedicine').AsBoolean := ( (FMedicineTable.FieldByName('MedicineVPANo').AsVariant = Null) or
                                                                                     (FMedicineTable.FieldByName('MedicineGroupID').AsInteger > 0) or
                                                                                     (FMedicineTable.FieldByName('MedicineMilkDays').AsInteger > 0) or
                                                                                     (FMedicineTable.FieldByName('MedicineMeatDays').AsInteger > 0) );
                     FMedicineTable.Post;

                     Inc(iMedUpdateCount);
                  end;
            end;
      except
         on e : Exception do
            begin
               ShowMessage(e.Message);
               Break;
            end;
      end;

   qUpdateMeds.Close;
   FreeAndNil(qUpdateMeds);

   if ( iMedUpdateCount > 0 ) then
      AddDataToTable;

   MergeDuplicateVPA(saDuplicateVPAs);

   MedicineGridDBBandedTableView.DataController.FocusedRowIndex := 0;

   if ( FMedicineTable.RecordCount = 0 ) then
      Close;
end;

procedure TfmMedicinesNullGroup.cbIncludeMedicinesClick(Sender: TObject);
begin
   inherited;
   FShowAllTypes := cbIncludeMedicines.Checked;
   actSave.Execute;
   ApplyFilterToTable;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewEditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
   inherited;
   if ( UpperCase(AItem.Caption) = 'MEAT' ) or ( UpperCase(AItem.Caption) = 'MILK' ) then
      if ( not(Key in [#8, '0'..'9']) ) then
         Key := #0;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewMedicineNAPropertiesChange(
  Sender: TObject);
begin
   inherited;
   TcxCustomCheckBox(Sender).PostEditValue;
   FMedicineTable.Edit;
   if ( FHerdType = htDairy ) then
      begin
         if ( FMedicineTable.FieldByName('MedicineNa').AsBoolean ) then
            FMedicineTable.FieldByName('MedicineMilkDays').AsInteger := 0
      end
   else
      begin
         if ( FMedicineTable.FieldByName('MedicineNa').AsBoolean ) then
            FMedicineTable.FieldByName('MedicineMeatDays').AsInteger := 0;
      end;
   FMedicineTable.FieldByName('MedicineChanged').AsBoolean := True;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewMedicineMeatDaysPropertiesEditValueChanged(
  Sender: TObject);
begin
   inherited;
   TcxTextEdit(Sender).PostEditValue;
   FMedicineTable.Edit;
   if ( FHerdType <> htDairy ) then
      if ( FMedicineTable.FieldByName('MedicineMeatDays').AsInteger > 0 ) then
         FMedicineTable.FieldByName('MedicineNa').AsBoolean := False;
   FMedicineTable.FieldByName('MedicineChanged').AsBoolean := True;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewMedicineMilkDaysPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
   TcxTextEdit(Sender).PostEditValue;
   FMedicineTable.Edit;
   if ( FHerdType = htDairy ) then
      if ( FMedicineTable.FieldByName('MedicineMilkDays').AsInteger > 0 ) then
         FMedicineTable.FieldByName('MedicineNa').AsBoolean := False;
   FMedicineTable.FieldByName('MedicineChanged').AsBoolean := True;
end;

procedure TfmMedicinesNullGroup.ApplyFilterToTable;
begin
   FMedicineTable.Filter := '';
   FMedicineTable.Filtered := False;
   if ( not(FShowAllTypes) ) then
      begin
         FMedicineTable.Filter := 'IncompleteMedicine = True';
         FMedicineTable.Filtered := True;
      end;
   StatusBar.Panels[0].Text := 'No of records : '+IntToStr(FMedicineTable.RecordCount);
end;

procedure TfmMedicinesNullGroup.cbNotBordBiaRegisteredPropertiesChange(Sender: TObject);
begin
   inherited;
   WinData.IsBordBiaRegistered := ( not(cbNotBordBiaRegistered.Checked) );
   if ( cbNotBordBiaRegistered.Checked ) then
      begin
         if ( MessageDlg('Ticking this box will stop this screen from appearing when the program opens.'+cCRLF+
                         'Do you wish to continue?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            Close
         else
            cbNotBordBiaRegistered.Checked := False;
      end;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewMedicineVPANoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   Item : TDrugItem;
   bWithdrawalConfirmed : Boolean;
begin
   inherited;
   Item := TfmDrugFinder.Find(FMedicineTable.FieldByName('MedicineName').AsString);
   if ( Item = nil ) then Exit;

   bWithdrawalConfirmed := TfmDrugFinderWithdMsg.WithdrawalConfirmed(Item);

   try
      FMedicineTable.Edit;
      FMedicineTable.FieldByName('MedicineName').AsString := Item.DrugName;
      FMedicineTable.FieldByName('MedicineVPANo').AsString := Item.VPANumber;
      FMedicineTable.FieldByName('MedicineChanged').AsBoolean := True;
      FMedicineTable.FieldByName('MedicineGroupID').AsInteger := Item.MedicineGroup;
      FMedicineTable.FieldByName('DrugDoseUnit').AsInteger := Item.UnitUsed;
      FMedicineTable.FieldByName('DrugPurchUnit').AsInteger := Item.UnitUsed;

      if bWithdrawalConfirmed then
         begin
            FMedicineTable.FieldByName('OldMeatWithdrawal').AsInteger := FMedicineTable.FieldByName('MedicineMeatDays').AsInteger;
            FMedicineTable.FieldByName('OldMilkWithdrawal').AsInteger := FMedicineTable.FieldByName('MedicineMilkDays').AsInteger;

            if ( Item.MeatWDDays > 0 ) or ( Item.MilkWDDays > 0 ) then
               begin
                  if ( Item.MeatWDDays > 0 ) then
                     begin
                        FMedicineTable.FieldByName('MedicineMeatDays').AsInteger := Item.MeatWDDays;
                        FMedicineTable.FieldByName('MeatWithdBroughtDown').AsInteger := Item.MeatWDDays;
                     end;
                  if ( Item.MilkWDDays > 0 ) then
                     begin
                        FMedicineTable.FieldByName('MedicineMilkDays').AsInteger := Item.MilkWDDays;
                        FMedicineTable.FieldByName('MilkWithdBroughtDown').AsInteger := Item.MilkWDDays;
                     end;
               end
            else if ( Item.MeatWDDays = 0 ) and ( Item.MilkWDDays = 0 ) then
               begin
                  FMedicineTable.FieldByName('MedicineNA').AsBoolean := True;
                  FMedicineTable.FieldByName('MeatWithdBroughtDown').AsInteger := 0;
                  FMedicineTable.FieldByName('MilkWithdBroughtDown').AsInteger := 0;
               end;

            FMedicineTable.FieldByName('DrugFindWithdAccepted').AsBoolean := True;
            FMedicineTable.FieldByName('DrugFindWithdAcceptDate').AsDateTime := Now;
         end;
   except
      FMedicineTable.Cancel;
   end;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if ( Key = VK_DELETE ) then
      Key := 0;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewMedicineVPANoPropertiesEditValueChanged(
  Sender: TObject);
begin
   inherited;
   TcxCustomTextEdit(Sender).PostEditValue;
   FMedicineTable.Edit;
   FMedicineTable.FieldByName('MedicineChanged').AsBoolean := True;
end;

procedure TfmMedicinesNullGroup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ( FMedicineTable.State in dsEditModes ) then
     FMedicineTable.Post;
  with TQuery.Create(nil) do
     try
        DatabaseName := AliasName;
        SQL.Clear;
        SQL.Add('SELECT *');
        SQL.Add('FROM '+FMedicineTable.TableName+'');
        SQL.Add('WHERE MedicineChanged = True');
        try
           Open;
           if ( RecordCount > 0 ) then
              CanClose := ( MessageDlg('Unsaved changes. Exit anyway?',mtConfirmation,[mbYes,mbNo],0) = mrYes );
        except
           on e : Exception do
              ShowMessage(e.Message);
        end;
     finally
        Free;
     end;
end;

procedure TfmMedicinesNullGroup.ClearFilterFromTable;
begin
   FMedicineTable.Close;
   FMedicineTable.Filter := '';
   FMedicineTable.Filtered := False;
   FMedicineTable.Open;
end;

procedure TfmMedicinesNullGroup.MergeDuplicateVPA(AVPAs : PStringArray);
var
   qDuplicates : TQuery;
   i, j : Integer;
   iaAllThisVPADuplicates : PIntegerArray;
begin
   if ( Length(AVPAs) = 0 ) then Exit;
   //   23/08/17 [V5.7 R2.0] /MK Change - If duplicate VPA Number found then format error to show what VPA Number it is.
   try
      qDuplicates := TQuery.Create(nil);
      qDuplicates.DatabaseName := AliasName;
      for i := 0 to Length(AVPAs)-1 do
         begin
            qDuplicates.SQL.Clear;
            qDuplicates.SQL.Add('SELECT MedicineID');
            qDuplicates.SQL.Add('FROM '+FMedicineTable.TableName+'');
            qDuplicates.SQL.Add('WHERE MedicineVPANo = "'+AVPAs[i]+'"');
            qDuplicates.SQL.Add('ORDER BY MedicineID');
            qDuplicates.Open;
            if ( qDuplicates.RecordCount = 0 ) then Continue;
            qDuplicates.First;
            iaAllThisVPADuplicates := GetSingleVPADuplicateArray(AVPAs[i],qDuplicates.FieldByName('MedicineID').AsInteger);
            if ( Length(iaAllThisVPADuplicates) > 0 ) then
               if ( MessageDlg(Format('This VPA number, %s, already exists with another %d medicine(s).'+cCRLF+
                                      'Do you want to merge these records?'+cCRLFx2+
                                      'NOTE : After this merge you should check and adjust your quantity in stock figures manually.',
                                      [AVPAs[i],Length(iaAllThisVPADuplicates)]),
                                      mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                  begin
                     for j := 0 to Length(iaAllThisVPADuplicates)-1 do
                        FixDuplicateDrugs(qDuplicates.FieldByName('MedicineID').AsInteger,iaAllThisVPADuplicates[j]);
                     qDuplicates.Close;
                     qDuplicates.SQL.Clear;
                     qDuplicates.SQL.Add('DELETE FROM '+FMedicineTable.TableName+'');
                     qDuplicates.SQL.Add('WHERE MedicineID IN '+IntArrayToSQLInString(iaAllThisVPADuplicates)+'');
                     qDuplicates.ExecSQL;
                     FMedicineTable.Close;
                     FMedicineTable.Open;
                  end
               else
                  begin
                     qDuplicates.SQL.Clear;
                     qDuplicates.SQL.Add('UPDATE Medicine');
                     qDuplicates.SQL.Add('SET VPANo = NULL');
                     qDuplicates.SQL.Add('WHERE VPANo = "'+AVPAs[i]+'"');
                     qDuplicates.SQL.Add('AND   ID IN '+IntArrayToSQLInString(iaAllThisVPADuplicates)+'');
                     qDuplicates.ExecSQL;
                  end;
         end;
   finally
       qDuplicates.Close;
       FreeAndNil(qDuplicates);
   end;
end;

procedure TfmMedicinesNullGroup.MedicineGridDBBandedTableViewMedicineGroupIDPropertiesChange(Sender: TObject);
begin
   inherited;
   FMedicineTable.Edit;
   FMedicineTable.FieldByName('MedicineChanged').AsBoolean := True;
end;

procedure TfmMedicinesNullGroup.FormDestroy(Sender: TObject);
begin
   inherited;
   if FMedicineTable <> nil then
      begin
         if ( FMedicineTable.Active ) then
            FMedicineTable.Active := False;
         FMedicineTable.DeleteTable;
         FreeAndNil(FMedicineTable);

         if ( FMedicineQuery.Active ) then
            FMedicineQuery.Active := False;
         FreeAndNil(FMedicineQuery);
      end;

   if ( FMedicineGroupsData.Active ) then
      FMedicineGroupsData.Active := False;
   FMedicineGroupsData.DeleteTable;
   FreeAndNil(FMedicineGroupsData);

   FreeAndNil(FMedicineNAField);

   FreeAndNil(FAnimalRemedyData);

   HerdLookup.dsQueryMedicineGroups.DataSet := HerdLookup.QueryMedicineGroups;
end;

end.
