{
   24/02/12 [V5.0 R4.0] /MK Additional Feature - New Feature For Service Event.

   14/06/12 [V5.0 R7.2] /MK Bug Fix - SetupTabSheet - New Procedure To Setup Tab Sheets Depending On Sex.

   02/07/12 [V5.0 R7.4] /MK Change - FromCreate - Changed From Defaults.SearchOn To WinData.SearchField i.e. Owners.SearchField.

   18/07/18 [V5.8 R1.1] /MK Change - Added in a var for the Herd Type so that if the Herd Type is Beef then only show Health tab.
                                   - Added in the Search By drop-down-list to allow the user to change between AnimalNo and PartNatID.
                                     The Search By used to depend on the search type selection on the main grid.
                                     Search By drop-down-list will default to main grid search type.
                                   - Always show animal grid.
                                   - Only show LactNo if HerdType is NOT beef.
                                   - All changes done on request of Bellingham Farms.
}

unit uAnimalBrowser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxPC, Db, DBTables, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, cxTextEdit, cxContainer, cxEdit, cxLabel, ExtCtrls,
  ActnList, dxmdaset, cxUtils, cxDBLookupComboBox, cxCalendar, cxSpinEdit,
  uNewUIHealthEvent, uNewUIBullingEvent, cxStyles, GenTypesConst, uHerdLookup,
  cxGroupBox, cxMaskEdit, cxDropDownEdit;

type
  tSearchOn = (stAnimalNo, stPartNatID);
  TfmAnimalBrowser = class(TForm)
    pSearchAnimal: TPanel;
    teSearchAnimalTag: TcxTextEdit;
    btnFind: TcxButton;
    btnClear: TcxButton;
    QueryAnimals: TQuery;
    pcAnimalEvents: TcxPageControl;
    tsVeterinary: TcxTabSheet;
    tsHeats: TcxTabSheet;
    tsDryOff: TcxTabSheet;
    ActionList: TActionList;
    actFindAnimal: TAction;
    actClearAnimalSearch: TAction;
    actAddEvent: TAction;
    actDeleteEvent: TAction;
    VeterinaryGrid: TcxGrid;
    VeterinaryGridDBTableView: TcxGridDBTableView;
    VeterinaryGridLevel: TcxGridLevel;
    HeatBullingGrid: TcxGrid;
    HeatBullingGridDBTableView: TcxGridDBTableView;
    HeatBullingGridLevel: TcxGridLevel;
    DryOffGrid: TcxGrid;
    DryOffGridDBTableView: TcxGridDBTableView;
    DryOffGridLevel: TcxGridLevel;
    pEventOptions: TPanel;
    btnClose: TcxButton;
    actClose: TAction;
    dsQueryAnimals: TDataSource;
    btnAddEvent: TcxButton;
    btnDeleteEvent: TcxButton;
    cxButton1: TcxButton;
    actViewHistory: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    SelectedRecord: TcxStyle;
    cxStyle2: TcxStyle;
    AnimalGrid: TcxGrid;
    AnimalTableView: TcxGridDBTableView;
    AnimalTableViewID: TcxGridDBColumn;
    AnimalTableViewNatIdNum: TcxGridDBColumn;
    AnimalTableViewDateOfBirth: TcxGridDBColumn;
    AnimalTableViewSex: TcxGridDBColumn;
    AnimalTableViewCode: TcxGridDBColumn;
    AnimalTableViewAnimalNo: TcxGridDBColumn;
    AnimalGridLevel: TcxGridLevel;
    gbAnimalDetail: TcxGroupBox;
    lHAnimalNo: TcxLabel;
    lHNatIDNum: TcxLabel;
    lHDateOfBirth: TcxLabel;
    lHBreed: TcxLabel;
    lHLactNoSex: TcxLabel;
    lAnimalNo: TcxLabel;
    lNatIDNum: TcxLabel;
    lDateOfBirth: TcxLabel;
    lBreed: TcxLabel;
    lLactNoSex: TcxLabel;
    lSearchWarning: TcxLabel;
    tsService: TcxTabSheet;
    ServiceGrid: TcxGrid;
    ServiceGridDBTableView: TcxGridDBTableView;
    ServiceGridLevel: TcxGridLevel;
    cxLabel10: TcxLabel;
    cbSearchOn: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure actClearAnimalSearchExecute(Sender: TObject);
    procedure actFindAnimalExecute(Sender: TObject);
    procedure actDeleteEventExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pcAnimalEventsPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure teSearchAnimalTagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcAnimalEventsDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure actViewHistoryExecute(Sender: TObject);
    procedure actAddEventExecute(Sender: TObject);
    procedure AnimalTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure actDeleteEventUpdate(Sender: TObject);
    procedure teSearchAnimalTagPropertiesChange(Sender: TObject);
    procedure QueryAnimalsAfterOpen(DataSet: TDataSet);
    procedure QueryAnimalsAfterScroll(DataSet: TDataSet);
    procedure cbSearchOnPropertiesChange(Sender: TObject);
    procedure AnimalTableViewSexGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
    { Private declarations }
    dsAnimalEvents : TDataSource;
    MDAnimalEvents : TdxMemData;

    SearchOn : tSearchOn;

    FHerdType : THerdType;

    procedure SearchForAnimal;
    procedure ClearAnimalSearch;
    procedure ShowAnimalDetails(const AShow : Boolean);
    procedure CreateDefaultMDFields;
    procedure CreateHealthDryOffTable(AAnimalID, ALactNo, AEventType : Integer);
    procedure CreateHealthDryOffGrid(AGridDBTableView: TcxGridDBTableView);
    procedure CreateHeatTable(AAnimalID, ALactNo, AEventType : Integer);
    procedure CreateHeatBullingGrid;
    procedure CreateServiceTable(AAnimalID, ALactNo, AEventType : Integer);
    procedure CreateServiceGrid;
    procedure RefreshGrids(AEventType : TEventType);
    procedure SetupTabSheet;
  public
    FOpenFromAnimalBrowser : Boolean;
    class procedure ShowTheForm;
    { Public declarations }
  end;

var
  fmAnimalBrowser: TfmAnimalBrowser;

implementation

uses DairyData, SetupAnimals, uNewUIServiceEvent;

{$R *.DFM}

{ TfmCrushBreeding }

class procedure TfmAnimalBrowser.ShowTheForm;
begin
   with TfmAnimalBrowser.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAnimalBrowser.FormCreate(Sender: TObject);
begin
   pSearchAnimal.Height := 198;
   gbAnimalDetail.Visible := False;

   FHerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
   if ( FHerdType = htBeef ) then
      begin
         Width := 846;
         Caption := 'Crush Veterinary';
      end
   else
      begin
         Width := 958;
         Caption := 'Parlour Events';
      end;

   tsHeats.TabVisible := ( FHerdType = htDairy );
   tsService.TabVisible := tsHeats.TabVisible;
   tsDryOff.TabVisible := tsHeats.TabVisible;
   pcAnimalEvents.HideTabs := ( FHerdType = htBeef );

   cbSearchOn.ItemIndex := 0;

   if MDAnimalEvents = nil then
      MDAnimalEvents := TdxMemData.Create(nil)
   else
      MDAnimalEvents.Close;

   MDAnimalEvents.Active := True;

   dsAnimalEvents := TDataSource.Create(nil);
   dsAnimalEvents.DataSet := MDAnimalEvents;

   if ( not(HerdLookup.qPlannedBull.Active) ) then
      HerdLookup.qPlannedBull.Active := True;

   if ( not(HerdLookup.qServiceHistBullUsed.Active) ) then
      HerdLookup.qServiceHistBullUsed.Active := True;

   if ( not(WinData.LookupMediAdmin.Active) ) then
      WinData.LookupMediAdmin.Open;

   //   02/07/12 [V5.0 R7.4] /MK Change - Changed From Defaults.SearchOn To WinData.SearchField i.e. Owners.SearchField.
   if ( WinData.SearchField = 'AnimalNo' ) then
      SearchOn := stAnimalNo
   else
      SearchOn := stPartNatID;
end;

procedure TfmAnimalBrowser.FormActivate(Sender: TObject);
begin
   pcAnimalEvents.ActivePageIndex := 0;
   pcAnimalEvents.ActivePageIndex := tsVeterinary.PageIndex;
end;

procedure TfmAnimalBrowser.actFindAnimalExecute(Sender: TObject);
begin
   SearchForAnimal;
end;

procedure TfmAnimalBrowser.teSearchAnimalTagKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_RETURN) then
      SearchForAnimal;
end;

procedure TfmAnimalBrowser.SearchForAnimal;
begin
   gbAnimalDetail.Visible := False;

   if Trim(teSearchAnimalTag.Text) = '' then
      begin
         ShowMessage('No search criteria has been entered!');
         Exit;
      end;

   if Trim(teSearchAnimalTag.Text) = '' then Exit;

   with QueryAnimals do
      begin
         Close;

         SQL.Clear;
         SQL.Add('SELECT A.ID, A.NatIdNum, A.SearchNatId, A.AnimalNo,');
         SQL.Add('       A.DateOfBirth, A.Sex, A.LactNo, B.Code, A.HerdID');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)');
         SQL.Add('WHERE (A.InHerd=True)');
         SQL.Add('AND   (A.AnimalDeleted=False)');

         if ( SearchOn = stAnimalNo ) then
            begin
               SQL.Add('AND A.AnimalNo = :SearchNo');
               Params[0].AsString := teSearchAnimalTag.Text;
            end
         else if ( SearchOn = stPartNatID ) then
            begin
               SQL.Add('AND SUBSTRING(A.SearchNatId FROM 7) Like :SearchNo');
               Params[0].AsString := '%'+ teSearchAnimalTag.Text +'%';
            end;

         Open;

         lSearchWarning.Visible := ( RecordCount = 0 );

         gbAnimalDetail.Visible := ( RecordCount > 0 );
         if ( gbAnimalDetail.Visible ) then
            begin
               lAnimalNo.Caption := FieldByName('AnimalNo').AsString;
               lNatIDNum.Caption := FieldByName('NatIDNum').AsString;
               if ( FieldByName('DateOfBirth').AsDateTime > 0 ) then
                  lDateOfBirth.Caption := DateToStr(FieldByName('DateOfBirth').AsDateTime);
               lBreed.Caption := FieldByName('Code').AsString;
               if ( FHerdType = htBeef ) then
                  begin
                     lHLactNoSex.Caption := 'Sex';
                     lLactNoSex.Caption := FieldByName('Sex').AsString;
                  end
               else
                  begin
                     lHLactNoSex.Caption := 'Lact No.';
                     if ( FieldByName('LactNo').AsInteger > 0 ) then
                        lLactNoSex.Caption := IntToStr(FieldByName('LactNo').AsInteger);
                  end;
               ShowAnimalDetails(True);

               if pcAnimalEvents.ActivePage <> nil then
                  try
                     pcAnimalEvents.ActivePage.SetFocus;
                  except
                  end;
            end;
      end;
end;

procedure TfmAnimalBrowser.actClearAnimalSearchExecute(Sender: TObject);
begin
   ClearAnimalSearch;
   pSearchAnimal.Height := 198;
end;

procedure TfmAnimalBrowser.ClearAnimalSearch;
begin
   QueryAnimals.Active := False;
   teSearchAnimalTag.Text := '';
   ShowAnimalDetails(false);
   try
      teSearchAnimalTag.SetFocus;
   except
   end;
end;

procedure TfmAnimalBrowser.CreateDefaultMDFields;
begin
   CreateMemDataFieldDef(MDAnimalEvents,'EventID',ftInteger);
   CreateMemDataFieldDef(MDAnimalEvents,'AnimalID',ftInteger);
   CreateMemDataFieldDef(MDAnimalEvents,'LactNo',ftInteger);
   CreateMemDataFieldDef(MDAnimalEvents,'EventDate',ftDateTime);
end;

procedure TfmAnimalBrowser.CreateHealthDryOffGrid(AGridDBTableView : TcxGridDBTableView);
begin
   with AGridDBTableView do
      begin
         ClearItems;

         DataController.DataSource := dsAnimalEvents;
         DataController.KeyFieldNames := 'EventId';
         DataController.CreateAllItems;

         with GetColumnByFieldName('EventID') do
            begin
               Visible := False;
            end;

         with GetColumnByFieldName('AnimalID') do
            begin
               Visible := False;
            end;

         with GetColumnByFieldName('LactNo') do
            begin
               Visible := ( FHerdType <> htBeef );
               Caption := 'Lact No';
               Width := 75;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxSpinEditProperties;
               with TcxSpinEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ValueType := vtFloat;
                     Buttons.Items[0].Visible := False;
                     Buttons.Items[1].Visible := False;
                     UseMouseWheel := False;
                  end;
            end;

         with GetColumnByFieldName('EventDate') do
            begin
               Caption := 'Event Date';
               Width := 100;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               Options.Editing := True;
               Options.Focusing := True;
               PropertiesClass := TcxDateEditProperties;
               with TcxDateEditProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                  end;
            end;

         with GetColumnByFieldName('DrugUsed') do
            begin
               Caption := 'Drug Used';
               Width := 170;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsMedicine;
                     ListFieldNames := 'Name';
                     KeyFieldNames := 'ID';
                  end;
            end;

         with GetColumnByFieldName('AdminBy') do
            begin
               Caption := 'Admin By';
               Width := 175;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               Options.Editing := True;
               Options.Focusing := True;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsLookupMediAdmin;
                     ListFieldNames := 'Name';
                     KeyFieldNames := 'ID';
                  end;
            end;

         with GetColumnByFieldName('ApplicRate') do
            begin
               Caption := 'Applic. Rate';
               Width := 100;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxSpinEditProperties;
               Options.Editing := True;
               Options.Focusing := True;
               with TcxSpinEditProperties(Properties) do
                  begin
                     Alignment.Horz := taRightJustify;
                     Alignment.Vert := taVCenter;
                     ValueType := vtFloat;
                     Buttons.Items[0].Visible := False;
                     Buttons.Items[1].Visible := False;
                     UseMouseWheel := False;
                  end;
            end;

         with GetColumnByFieldName('HealthDays') do
            begin
               Caption := 'No. Days';
               Width := 85;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxSpinEditProperties;
               with TcxSpinEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ValueType := vtFloat;
                     Buttons.Items[0].Visible := False;
                     Buttons.Items[1].Visible := False;
                     UseMouseWheel := False;
                  end;
            end;

         with GetColumnByFieldName('HealthPerDay') do
            begin
               Caption := 'Times/Day';
               Width := 105;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxSpinEditProperties;
               with TcxSpinEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ValueType := vtFloat;
                     Buttons.Items[0].Visible := False;
                     Buttons.Items[1].Visible := False;
                     UseMouseWheel := False;
                  end;
            end;

      end;
end;

procedure TfmAnimalBrowser.CreateHealthDryOffTable(AAnimalID, ALactNo, AEventType : Integer);
var
   qHealthDryOffEvents : TQuery;
begin
   ClearMemDataFieldDefs(MDAnimalEvents);

   CreateDefaultMDFields;

   CreateMemDataFieldDef(MDAnimalEvents,'DrugUsed',ftInteger);
   CreateMemDataFieldDef(MDAnimalEvents,'AdminBy',ftInteger);
   CreateMemDataFieldDef(MDAnimalEvents,'ApplicRate',ftFloat);
   CreateMemDataFieldDef(MDAnimalEvents,'HealthDays',ftFloat);
   CreateMemDataFieldDef(MDAnimalEvents,'HealthPerDay',ftFloat);

   qHealthDryOffEvents := TQuery.Create(nil);
   with qHealthDryOffEvents do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT A.ID AID, A.AnimalNo, A.NatIDNum,');
         SQL.Add('       E.ID EventId, E.EventDate, E.EventType, E.AnimalLactNo,');
         SQL.Add('       H.DrugUsed, H.AdminBy, H.RateApplic,');
         SQL.Add('       H.NoDays, H.NoTimes');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Events E On (E.AnimalID = A.ID)');
         SQL.Add('LEFT JOIN Health H On (H.EventID = E.ID)');
         SQL.Add('WHERE A.ID = :AAnimalID');
         SQL.Add('AND E.AnimalLactNo = :ALactNo');
         SQL.Add('AND E.EventType = :AEventType');

         Close;
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := ALactNo;
         Params[2].AsInteger := AEventType;

         Open;
         First;
         while not EOF do
            begin
               MDAnimalEvents.Open;
               MDAnimalEvents.Append;
               MDAnimalEvents.FieldByName('EventID').AsInteger := FieldByName('EventId').AsInteger;
               MDAnimalEvents.FieldByName('AnimalID').AsInteger := FieldByName('AID').AsInteger;
               MDAnimalEvents.FieldByName('LactNo').AsInteger := FieldByName('AnimalLactNo').AsInteger;
               MDAnimalEvents.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;

               if ( FieldByName('DrugUsed').AsInteger > 0 ) then
                  if ( WinData.Medicine.Locate('ID',FieldByName('DrugUsed').AsInteger,[]) ) then
                     MDAnimalEvents.FieldByName('DrugUsed').AsInteger := FieldByName('DrugUsed').AsInteger;

               if ( FieldByName('AdminBy').AsInteger > 0 ) then
                  if ( WinData.LookupMediAdmin.Locate('ID',FieldByName('AdminBy').AsInteger,[]) ) then
                     MDAnimalEvents.FieldByName('AdminBy').AsInteger := FieldByName('AdminBy').AsInteger;

               MDAnimalEvents.FieldByName('ApplicRate').AsInteger := FieldByName('RateApplic').AsInteger;
               MDAnimalEvents.FieldByName('HealthDays').AsInteger := FieldByName('NoDays').AsInteger;
               MDAnimalEvents.FieldByName('HealthPerDay').AsInteger := FieldByName('NoTimes').AsInteger;
               MDAnimalEvents.Post;
               Next;
            end;
      finally
         if ( MDAnimalEvents.RecordCount > 0 ) then
            MDAnimalEvents.First;
         Free;
      end;
end;

procedure TfmAnimalBrowser.CreateHeatBullingGrid;
begin
   with HeatBullingGridDBTableView do
      begin
         ClearItems;

         DataController.DataSource := dsAnimalEvents;
         DataController.KeyFieldNames := 'EventId';
         DataController.CreateAllItems;

         with GetColumnByFieldName('EventID') do
            begin
               Visible := False;
            end;

         with GetColumnByFieldName('AnimalID') do
            begin
               Visible := False;
            end;

         with GetColumnByFieldName('LactNo') do
            begin
               Caption := 'Lact No';
               Width := 75;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxSpinEditProperties;
               with TcxSpinEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ValueType := vtFloat;
                     Buttons.Items[0].Visible := False;
                     Buttons.Items[1].Visible := False;
                     UseMouseWheel := False;
                  end;
            end;

         with GetColumnByFieldName('EventDate') do
            begin
               Caption := 'Event Date';
               Width := 125;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               Options.Editing := True;
               Options.Focusing := True;
               PropertiesClass := TcxDateEditProperties;
               with TcxDateEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                  end;
            end;

         with GetColumnByFieldName('PlannedBull') do
            begin
               Caption := 'Bull Used';
               Width := 180;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ListSource := HerdLookup.dsPlannedBull;
                     ListFieldNames := 'Code';
                     KeyFieldNames := 'Code';
                  end;
            end;

         with GetColumnByFieldName('ObservedBy') do
            begin
               Caption := 'Observed By';
               Width := 185;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsObservedBy;
                     ListFieldNames := 'Description';
                     KeyFieldNames := 'ID';
                  end;
            end;
      end;
end;

procedure TfmAnimalBrowser.CreateHeatTable(AAnimalID, ALactNo, AEventType: Integer);
var
   qHeatBullingEvents : TQuery;
begin
   ClearMemDataFieldDefs(MDAnimalEvents);

   CreateDefaultMDFields;

   CreateMemDataFieldDef(MDAnimalEvents,'PlannedBull',ftString,10);
   CreateMemDataFieldDef(MDAnimalEvents,'ObservedBy',ftString,30);

   qHeatBullingEvents := TQuery.Create(nil);
   with qHeatBullingEvents do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT A.ID AID, A.AnimalNo, A.NatIDNum,');
         SQL.Add('       E.ID EventId, E.EventDate, E.AnimalLactNo,');
         SQL.Add('       B.PlannedBull, B.ObservedBy,');
         SQL.Add('       AB.AnimalNo BullCode');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Events E On (E.AnimalID = A.ID)');
         SQL.Add('LEFT JOIN Bullings B On (B.EventID = E.ID)');
         SQL.Add('LEFT JOIN Animals AB On (AB.ID = B.PlannedBull)');
         SQL.Add('WHERE A.ID = :AAnimalID');
         SQL.Add('AND E.AnimalLactNo = :ALactNo');
         SQL.Add('AND E.EventType = :AEventType');

         Close;
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := ALactNo;
         Params[2].AsInteger := AEventType;

         Open;
         First;
         while not EOF do
            begin
               MDAnimalEvents.Open;
               MDAnimalEvents.Append;
               MDAnimalEvents.FieldByName('EventID').AsInteger := FieldByName('EventId').AsInteger;
               MDAnimalEvents.FieldByName('AnimalID').AsInteger := FieldByName('AID').AsInteger;
               MDAnimalEvents.FieldByName('LactNo').AsInteger := FieldByName('AnimalLactNo').AsInteger;
               MDAnimalEvents.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;
               MDAnimalEvents.FieldByName('PlannedBull').AsString := FieldByName('BullCode').AsString;

               if ( FieldByName('ObservedBy').AsInteger > 0 ) then
                  if ( WinData.GenLookUp.Locate('ID',qHeatBullingEvents.FieldByName('ObservedBy').AsInteger,[]) ) then
                     MDAnimalEvents.FieldByName('ObservedBy').AsInteger := WinData.GenLookUp.FieldByName('ID').AsInteger;

               MDAnimalEvents.Post;
               Next;
            end;
      finally
         if ( MDAnimalEvents.RecordCount > 0 ) then
            MDAnimalEvents.First;
         Free;
      end;
end;

procedure TfmAnimalBrowser.pcAnimalEventsPageChanging(Sender: TObject;
   NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   if ( QueryAnimals.Active ) then
      begin
         if NewPage = tsVeterinary then
            RefreshGrids(THealth)
         else if NewPage = tsHeats then
            RefreshGrids(TBulling)
         else if NewPage = tsDryOff then
            RefreshGrids(TDryOff)
         else if NewPage = tsService then
            RefreshGrids(TService);
      end;
end;

procedure TfmAnimalBrowser.pcAnimalEventsDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if ATab.Index = pcAnimalEvents.ActivePageIndex then
      begin
         Font.Color := WinData.TouchScreenSelectedTab.TextColor;
//         ATab.Color := $00606060;
      end
   else
      begin
         Font.Color := WinData.TouchScreenTab.TextColor;
      end;
end;

procedure TfmAnimalBrowser.actAddEventExecute(Sender: TObject);
begin
   if ( QueryAnimals.Active ) then
      begin
         if ( tsVeterinary.Showing ) then
            begin
               if TfmNewUIHealthEvent.ShowForm(QueryAnimals.FieldByName('ID').AsInteger,
                                               QueryAnimals.FieldByName('LactNo').AsInteger,
                                               QueryAnimals.FieldByName('HerdID').AsInteger,
                                               THealth,
                                               QueryAnimals.FieldByName('NatIDNum').AsString,
                                               QueryAnimals.FieldByName('AnimalNo').AsString) then
               RefreshGrids(THealth);
            end
         else if ( tsHeats.Showing ) then
            begin
               if TfmNewUIBullingEvent.ShowForm(QueryAnimals.FieldByName('ID').AsInteger,
                                                QueryAnimals.FieldByName('LactNo').AsInteger,
                                                QueryAnimals.FieldByName('HerdID').AsInteger,
                                                QueryAnimals.FieldByName('NatIDNum').AsString,
                                                QueryAnimals.FieldByName('AnimalNo').AsString) then
               RefreshGrids(TBulling);
            end
         else if ( tsDryOff.Showing ) then
            begin
               if ( not(MDAnimalEvents.RecordCount > 0) ) then
                  begin
                     if TfmNewUIHealthEvent.ShowForm(QueryAnimals.FieldByName('ID').AsInteger,
                                                     QueryAnimals.FieldByName('LactNo').AsInteger,
                                                     QueryAnimals.FieldByName('HerdID').AsInteger,
                                                     TDryOff,
                                                     QueryAnimals.FieldByName('NatIDNum').AsString,
                                                     QueryAnimals.FieldByName('AnimalNo').AsString) then
                     RefreshGrids(TDryOff);
                  end
               else
                  MessageDlg('This Cow has a Drying Off Record',mtInformation,[mbok],0);
            end
         else if ( tsService.Showing ) then
            begin
               if TfmNewUIServiceEvent.ShowForm(QueryAnimals.FieldByName('ID').AsInteger,
                                                QueryAnimals.FieldByName('LactNo').AsInteger,
                                                QueryAnimals.FieldByName('HerdID').AsInteger,
                                                QueryAnimals.FieldByName('NatIDNum').AsString,
                                                QueryAnimals.FieldByName('AnimalNo').AsString) then
               RefreshGrids(TService);
            end;
      end
   else
      begin
         MessageDlg('No animal selected.',mtError,[mbOK],0);
         Exit;
      end;
end;

procedure TfmAnimalBrowser.RefreshGrids(AEventType : TEventType);
begin
   if ( AEventType = THealth ) then
      begin
         CreateHealthDryOffTable(QueryAnimals.FieldByName('ID').AsInteger,
                                 QueryAnimals.FieldByName('LactNo').AsInteger,
                                 CHealthEvent);
         CreateHealthDryOffGrid(VeterinaryGridDBTableView);
      end
   else if ( AEventType = TBulling ) then
      begin
         CreateHeatTable(QueryAnimals.FieldByName('ID').AsInteger,
                         QueryAnimals.FieldByName('LactNo').AsInteger,
                         CBullingEvent);
         CreateHeatBullingGrid;
      end
   else if ( AEventType = TDryOff ) then
      begin
         CreateHealthDryOffTable(QueryAnimals.FieldByName('ID').AsInteger,
                                 QueryAnimals.FieldByName('LactNo').AsInteger,
                                 CDryOffEvent);
         CreateHealthDryOffGrid(DryOffGridDBTableView);
      end
   else if ( AEventType = TService ) then
      begin
         CreateServiceTable(QueryAnimals.FieldByName('ID').AsInteger,
                            QueryAnimals.FieldByName('LactNo').AsInteger,
                            CServiceEvent);
         CreateServiceGrid;
      end;
end;

procedure TfmAnimalBrowser.actDeleteEventExecute(Sender: TObject);

   procedure DeleteEvent(AEventId : Integer; ATableName : String);
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('DELETE FROM '+ATableName+'');
            SQL.Add('WHERE EventId = '+IntToStr(AEventId)+'');
            ExecSQL;

            SQL.Clear;
            SQL.Add('DELETE FROM '+WinData.Events.TableName+'');
            SQL.Add('WHERE Id = '+IntToStr(AEventId)+'');
            ExecSQL;
         finally
            Free;
         end;
   end;

begin
   if (MDAnimalEvents.FieldByName('EventId').AsInteger <= 0) then
      begin
         Exit;
      end;

   if Application.MessageBox('Are you sure you want to delete this event?', 'Confirm Deletion', MB_YESNO + MB_DEFBUTTON2 + MB_ICONWARNING) = IDNO then
      begin
         Exit;
      end;

   if ( tsVeterinary.Showing ) then
      begin
         DeleteEvent(MDAnimalEvents.FieldByName('EventId').AsInteger, WinData.Health.TableName);
         RefreshGrids(THealth);
      end
   else if ( tsHeats.Showing ) then
      begin
         DeleteEvent(MDAnimalEvents.FieldByName('EventId').AsInteger, WinData.Bullings.TableName);
         RefreshGrids(TBulling)
      end
   else if ( tsDryOff.Showing ) then
      begin
         DeleteEvent(MDAnimalEvents.FieldByName('EventId').AsInteger, WinData.Health.TableName);
         RefreshGrids(TDryOff);
      end
   else if ( tsService.Showing ) then
      begin
         DeleteEvent(MDAnimalEvents.FieldByName('EventId').AsInteger, WinData.Services.TableName);
         RefreshGrids(TService);
      end;
end;

procedure TfmAnimalBrowser.actViewHistoryExecute(Sender: TObject);
begin
   WinData.AnimalFileByID.Locate('ID',QueryAnimals.FieldByName('ID').AsInteger,[]);
   fSetupAnimals.FOpenFromAnimalBrowser := ( QueryAnimals.FieldByName('ID').AsInteger > 0 );
   fSetUpAnimals.ShowForm(True);
end;

procedure TfmAnimalBrowser.AnimalTableViewFocusedRecordChanged(
   Sender: TcxCustomGridTableView; APrevFocusedRecord,
   AFocusedRecord: TcxCustomGridRecord;
   ANewItemRecordFocusingChanged: Boolean);
begin
   if ( tsVeterinary.Showing ) then
      RefreshGrids(THealth)
   else if ( tsHeats.Showing ) then
      RefreshGrids(TBulling)
   else if ( tsDryOff.Showing ) then
      RefreshGrids(TDryOff)
   else if ( tsService.Showing ) then
      RefreshGrids(TService);
end;

procedure TfmAnimalBrowser.actCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmAnimalBrowser.FormDestroy(Sender: TObject);
begin
   if MDAnimalEvents.Active then
      FreeAndNil(MDAnimalEvents);
end;

procedure TfmAnimalBrowser.actDeleteEventUpdate(Sender: TObject);
begin
  // actDeleteEvent.Enabled := ( MDAnimalEvents.Active ) and (MDAnimalEvents.FieldByName('EventId').AsInteger >0);
end;

procedure TfmAnimalBrowser.ShowAnimalDetails(const AShow : Boolean);
begin
   lAnimalNo.Visible := AShow;
   lHAnimalNo.Visible := AShow;
   lNatIDNum.Visible := AShow;
   lHNatIDNum.Visible := AShow;
   lDateOfBirth.Visible := AShow;
   lHDateOfBirth.Visible := AShow;
   lHBreed.Visible := AShow;
   lBreed.Visible := AShow;
   lHLactNoSex.Visible := AShow;
   lLactNoSex.Visible := AShow;

   if (not AShow ) then
      begin
         lAnimalNo.Caption := '';
         lNatIDNum.Caption := '';
         lDateOfBirth.Caption := '';
         lBreed.Caption := '';
         lLactNoSex.Caption := '';
      end;

end;

procedure TfmAnimalBrowser.teSearchAnimalTagPropertiesChange(
  Sender: TObject);
begin
   ShowAnimalDetails(false);
end;

procedure TfmAnimalBrowser.CreateServiceTable(AAnimalID, ALactNo,
  AEventType: Integer);
var
   qServiceEvents : TQuery;
begin
   ClearMemDataFieldDefs(MDAnimalEvents);

   CreateDefaultMDFields;

   CreateMemDataFieldDef(MDAnimalEvents,'ServiceBull',ftString,10);
   CreateMemDataFieldDef(MDAnimalEvents,'Technician',ftString,30);
   CreateMemDataFieldDef(MDAnimalEvents,'ServiceType',ftString,30);

   qServiceEvents := TQuery.Create(nil);
   with qServiceEvents do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT A.ID AID, A.AnimalNo, A.NatIDNum,');
         SQL.Add('       E.ID EventId, E.EventDate, E.AnimalLactNo,');
         SQL.Add('       S.ServiceBull, S.Technician, S.ServiceType');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Events E On (E.AnimalID = A.ID)');
         SQL.Add('LEFT JOIN Services  S On (S.EventID = E.ID)');
         SQL.Add('LEFT JOIN Animals AB On (AB.ID = S.ServiceBull)');
         SQL.Add('WHERE A.ID = :AAnimalID');
         SQL.Add('AND E.AnimalLactNo = :ALactNo');
         SQL.Add('AND E.EventType = :AEventType');

         Close;
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := ALactNo;
         Params[2].AsInteger := AEventType;

         Open;
         First;
         while not EOF do
            begin
               MDAnimalEvents.Open;
               MDAnimalEvents.Append;
               MDAnimalEvents.FieldByName('EventID').AsInteger := FieldByName('EventId').AsInteger;
               MDAnimalEvents.FieldByName('AnimalID').AsInteger := FieldByName('AID').AsInteger;
               MDAnimalEvents.FieldByName('LactNo').AsInteger := FieldByName('AnimalLactNo').AsInteger;
               MDAnimalEvents.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;
               MDAnimalEvents.FieldByName('ServiceBull').AsInteger := FieldByName('ServiceBull').AsInteger;

               if ( FieldByName('Technician').AsInteger > 0 ) then
                  if ( WinData.GenLookUp.Locate('ID',qServiceEvents.FieldByName('Technician').AsInteger,[]) ) then
                     MDAnimalEvents.FieldByName('Technician').AsInteger := WinData.GenLookUp.FieldByName('ID').AsInteger;

               if ( FieldByName('ServiceType').AsInteger > 0 ) then
                  if ( WinData.GenLookUp.Locate('ID',qServiceEvents.FieldByName('ServiceType').AsInteger,[]) ) then
                     MDAnimalEvents.FieldByName('ServiceType').AsInteger := WinData.GenLookUp.FieldByName('ID').AsInteger;

               MDAnimalEvents.Post;
               Next;
            end;
      finally
         if ( MDAnimalEvents.RecordCount > 0 ) then
            MDAnimalEvents.First;
         Free;
      end;
end;

procedure TfmAnimalBrowser.CreateServiceGrid;
begin
   with ServiceGridDBTableView do
      begin
         ClearItems;

         DataController.DataSource := dsAnimalEvents;
         DataController.KeyFieldNames := 'EventId';
         DataController.CreateAllItems;

         with GetColumnByFieldName('EventID') do
            begin
               Visible := False;
            end;

         with GetColumnByFieldName('AnimalID') do
            begin
               Visible := False;
            end;

         with GetColumnByFieldName('LactNo') do
            begin
               Caption := 'Lact No';
               Width := 75;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxSpinEditProperties;
               with TcxSpinEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ValueType := vtFloat;
                     Buttons.Items[0].Visible := False;
                     Buttons.Items[1].Visible := False;
                     UseMouseWheel := False;
                  end;
            end;

         with GetColumnByFieldName('EventDate') do
            begin
               Caption := 'Event Date';
               Width := 125;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               Options.Editing := True;
               Options.Focusing := True;
               PropertiesClass := TcxDateEditProperties;
               with TcxDateEditProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                  end;
            end;

         with GetColumnByFieldName('ServiceBull') do
            begin
               Caption := 'Bull Used';
               Width := 180;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     Herdlookup.dsServiceBullUsed.DataSet := HerdLookup.qServiceHistBullUsed;
                     ListSource := HerdLookup.dsServiceBullUsed;
                     KeyFieldNames := 'ID';
                     ListFieldNames := 'AnimalNo';
                  end;
            end;

         with GetColumnByFieldName('Technician') do
            begin
               Caption := 'Technician';
               Width := 185;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsObservedBy;
                     ListFieldNames := 'Description';
                     KeyFieldNames := 'ID';
                  end;
            end;

         with GetColumnByFieldName('ServiceType') do
            begin
               Caption := 'Service Type';
               Width := 185;
               HeaderAlignmentHorz := taCenter;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taCenter;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsServiceType;
                     ListFieldNames := 'Description';
                     KeyFieldNames := 'ID';
                  end;
            end;
      end;
end;

procedure TfmAnimalBrowser.SetupTabSheet;
var
   AnimalSex : String;
begin
   AnimalSex := UpperCase(QueryAnimals.FieldByName('Sex').AsString);

   tsHeats.TabVisible := ( AnimalSex = UpperCase(cSex_Female) );
   tsService.TabVisible := ( AnimalSex = UpperCase(cSex_Female) );
   tsDryOff.TabVisible := ( AnimalSex = UpperCase(cSex_Female) );
end;

procedure TfmAnimalBrowser.QueryAnimalsAfterOpen(DataSet: TDataSet);
begin
   SetupTabSheet;
end;

procedure TfmAnimalBrowser.QueryAnimalsAfterScroll(DataSet: TDataSet);
begin
   SetupTabSheet;
end;

procedure TfmAnimalBrowser.cbSearchOnPropertiesChange(Sender: TObject);
begin
   if ( cbSearchOn.ItemIndex = 0 ) then
      begin
         SearchOn := stAnimalNo;
         teSearchAnimalTag.Properties.MaxLength := 0;
      end
   else
      begin
         SearchOn := stPartNatID;
         teSearchAnimalTag.Properties.MaxLength := 5;
      end;
end;

procedure TfmAnimalBrowser.AnimalTableViewSexGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ( UpperCase(AText) = 'FEMALE' ) then
      AText := 'F'
   else if ( UpperCase(AText) = 'BULL' ) then
      AText := 'B'
   else if ( UpperCase(AText) = 'STEER' ) then
      AText := 'S';
end;

end.
