unit uReviewSMSEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, Tabnotbk, ExtCtrls, ActiveX, ComObj,
  RXCtrls, TB97, TB97Tlbr, Menus, StdCtrls, Parser, OleServer,
  db, dbTables, DBGrids, RXDBCtrl, DBGridEh, IniFiles;

type
  TfmReviewSMSEvents = class(TForm)
    dsTempEvents: TDataSource;
    TempEvents: TTable;
    TempEventsAnimalID: TIntegerField;
    TempEventsAnimalNo: TStringField;
    TempEventsNatIDNum: TStringField;
    TempEventsLactNo: TIntegerField;
    TempEventsBullID: TIntegerField;
    TempEventsBullNo: TStringField;
    TempEventsPregnant: TBooleanField;
    TempEventsMedicineCode: TIntegerField;
    TempEventsHealthCode: TIntegerField;
    TempEventsEventType: TIntegerField;
    TempEventsDryOffEvent: TBooleanField;
    TempEventsEventDate: TDateField;
    TempEventsComment: TStringField;
    Dock971: TDock97;
    Toolbar971: TToolbar97;
    sbExit: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    EventTab: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    DBGridEh2: TDBGridEh;
    TabSheet3: TTabSheet;
    DBGridEh3: TDBGridEh;
    TabSheet6: TTabSheet;
    DBGridEh5: TDBGridEh;
    TabSheet4: TTabSheet;
    DBGridEh4: TDBGridEh;
    TabSheet7: TTabSheet;
    DBGridEh6: TDBGridEh;
    TabSheet5: TTabSheet;
    mErrors: TMemo;
    StatusBar: TStatusBar;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    DefaultTab1: TMenuItem;
    N1: TMenuItem;
    Editeventsconsectitively1: TMenuItem;
    procedure EventTabChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure Editeventsconsectitively1Click(Sender: TObject);
  private
    { Private declarations }
    IniFile : TIniFile;
    procedure CreateTable(DataSet : TDBDataset);
    procedure ReviewEvent(EventType : Integer);
    procedure SetupMenu;
    procedure MenuClick(Sender : TObject);
  public
    { Public declarations }
  end;

  procedure ShowTheForm(var DataSet : TDBDataSet; slNotFound : TStringList; fCap : String);

var
  fmReviewSMSEvents  : TfmReviewSMSEvents;

implementation
uses
  uCreateEvents,
  DairyData,
  GenTypesConst,
  Bullings,
  Services,
  PregDiag,
  UHealth,
  uCalvings,
  KRoutines;

{$R *.DFM}

  procedure ShowTheForm(var DataSet : TDBDataSet; slNotFound : TStringList; fCap : String);
  begin

     Application.CreateForm(TfmReviewSMSEvents, fmReviewSMSEvents);
     try
        fmReviewSMSEvents.Caption := fCap;
        fmReviewSMSEvents.CreateTable(Dataset);
        fmReviewSMSEvents.EventTabChange(nil);
        fmReviewSMSEvents.mErrors.Lines.Assign(slNotFound);
        fmReviewSMSEvents.ShowModal;
     finally
         with fmReviewSMSEvents.TempEvents do
            begin
               Close;
               DeleteTable;
               Free;
            end;
        FreeAndNil(fmReviewSMSEvents);
        Screen.ActiveForm.Update;
     end;
  end;

{ TSMS_Nokia }
procedure TfmReviewSMSEvents.EventTabChange(Sender: TObject);
var
   i : byte;
begin
   TempEvents.Filter := '';
   TempEvents.Filtered := False;
   StatusBar.Panels[1].Text := 'Double click grid to edit event';
   case EventTab.ActivePageIndex of
      0 : begin
             TempEvents.Filter := 'EventType = 1';
             TempEvents.Filtered := True;
          end;
      1 : begin
             TempEvents.Filter := 'EventType = 2';
             TempEvents.Filtered := True;
          end;
      2 : begin
             TempEvents.Filter := 'EventType = 3';
             TempEvents.Filtered := True;
          end;
      3 : begin
             TempEvents.Filter := 'EventType = 4';
             TempEvents.Filtered := True;
          end;
      4 : begin
             TempEvents.Filter := 'EventType = 6';
             TempEvents.Filtered := True;
          end;
      5 : begin
             StatusBar.Panels[1].Text := 'Double click grid to create calving event';
             TempEvents.Filter := 'EventType = 5';
             TempEvents.Filtered := True;
          end;
      6 : StatusBar.Panels[1].Text := '';
   end;

   if EventTab.ActivePageIndex <> 6 then
      StatusBar.Panels[0].Text := EventTab.Pages[EventTab.ActivePageIndex].Caption + ' Record Count:'+IntToStr(TempEvents.RecordCount)
   else
      StatusBar.Panels[0].Text := '';
end;

procedure TfmReviewSMSEvents.CreateTable(DataSet : TDBDataset);
begin
   try
      TempEvents := TTable.Create(nil);
      TempEvents.DatabaseName := 'kingswd';
      TempEvents.TableName := 'tSmsEvents';
      TempEvents.FieldDefs.Assign(TDBDataset(DataSet).FieldDefs);
      TempEvents.CreateTable;
      TempEvents.BatchMove(DataSet, batAppend);
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'AnimalID';
            DataSet   := TempEvents;
         end;
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'EventID';
            DataSet   := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'AnimalNo';
            DataSet   := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'NatIDNum';
            DataSet   := TempEvents;
         end;
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'LactNo';
            DataSet   := TempEvents;
         end;
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'EventType';
            DataSet   := TempEvents;
         end;
      with TDateField.Create(TempEvents) do
         begin
            FieldName := 'EventDate';
            DataSet   := TempEvents;
         end;
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'BullID';
            DataSet := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'BullNo';
            DataSet := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'Comment';
            DataSet := TempEvents;
         end;
      with TBooleanField.Create(TempEvents) do
         begin
            FieldName := 'Pregnant';
            DataSet := TempEvents;
         end;
      with TBooleanField.Create(TempEvents) do
         begin
            FieldName := 'DryOffEvent';
            DataSet := TempEvents;
         end;
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'MedicineCode';
            DataSet := TempEvents;
         end;
      with TIntegerField.Create(TempEvents) do
         begin
            FieldName := 'HealthCode';
            DataSet := TempEvents;
         end;
      with TStringField.Create(TempEvents)  do
         begin
            FieldName := 'Medicine';
            LookUpDataSet := WinData.Medicine;
            LookUpKeyFields := 'ID';
            LookUpResultField := 'Name';
            KeyFields := 'MedicineCode';
            LookUp    := TRUE;
            DataSet   := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'HealthDesc';
            LookUpDataSet := WinData.qHealthCodes;
            LookUpKeyFields := 'ID';
            LookUpResultField := 'Description';
            KeyFields := 'HealthCode';
            LookUp := TRUE;
            DataSet := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'CalfNo';
            DataSet := TempEvents;
         end;
      with TStringField.Create(TempEvents) do
         begin
            FieldName := 'CalfSex';
            DataSet := TempEvents;
         end;
      with TBooleanField.Create(TempEvents) do
         begin
            FieldName := 'CalfRecorded';
            DataSet := TempEvents;
         end;
      dsTempEvents.DataSet := TempEvents;
      TempEvents.Active    := True;
   except
      ShowMessage('Cannot create Temporary Table, contact Kingswood');
      Abort;
   end
end;

procedure TfmReviewSMSEvents.FormCreate(Sender: TObject);
begin
   WinData.Events.Refresh;
   WinData.LoadBtnImage( sbExit.Glyph, cBtnImgExit );
   IniFile := TIniFile.Create(IniDirectory + PhoneEventsIniFile);
   SetupMenu;
end;

procedure TfmReviewSMSEvents.DBGridEh1DblClick(Sender: TObject);
begin
   ReviewEvent(TempEvents.FieldByName('EventType').AsInteger);
end;

procedure TfmReviewSMSEvents.ReviewEvent(EventType: Integer);
var
   CalfNo : string;
begin
   if Windata.AnimalFileByID.Locate('ID', TempEvents.FieldByName('AnimalID').AsInteger, [] ) then
      begin
         if ( EventType = cCalvingEvent ) then
            begin
               WinData.PhoneLinkCalving := True;
               New(WinData.CalvingRecord);
               try
                  if WinData.DefCountry(Windata.AnimalFileByIDHerdID.AsInteger) = NIreland then
                     WinData.CheckNINatID(TempEvents.FieldByName('CalfNo').AsString,CalfNo)
                  else
                     WinData.CheckNatID(TempEvents.FieldByName('CalfNo').AsString,CalfNo,False);
                  WinData.CalvingRecord^.CalfNo := CalfNo;
                  WinData.CalvingRecord^.CalfSex := TempEvents.FieldByName('CalfSex').AsString;
                  uCalvings.ShowCalvings(Add);
               finally
                   WinData.PhoneLinkCalving := False;
                   Dispose(WinData.CalvingRecord);
               end;
            end
         else if WinData.Events.Locate('ID', TempEvents.FieldByName('EventID').AsInteger, [] ) then
            begin
               case EventType of
                  1 : begin
                         Bullings.ShowBulling(AmendBulling); // Display the Bulling  Form
                      end;
                  2 : begin
                         Services.ShowService(AmendService);
                      end;
                  3 : begin
                         PregDiag.ShowPD(AmendPD);
                      end;
                  4,6 : begin
                           uHealth.ShowHealth(AmendHealth);
                      end;
               end;
            end;
      end
   else
      MessageDlg('Unable to locate Animal.',mtError,[mbok],0);
end;

procedure TfmReviewSMSEvents.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := ( MessageDlg('Exit PhoneLink events, are you sure?',mtConfirmation,[mbYes,mbNo],0) = IdYes );
end;

procedure TfmReviewSMSEvents.SetupMenu;
var
   i : Integer;
   mi : TMenuItem;
   Default : Integer;
begin
   try
      Default := IniFile.ReadInteger('EventTab', 'TabIndex', 0);
      for i := 0 to EventTab.PageCount-1 do
         begin
            mi := TMenuItem.Create(self);
            mi.Caption := EventTab.Pages[i].Caption;
            mi.Tag := i;
            mi.GroupIndex := 1;
            mi.RadioItem := True;
            mi.OnClick := MenuClick;
            if i = Default then
               mi.Checked := True;
            DefaultTab1.Add( mi);
         end;
      Editeventsconsectitively1.Checked := IniFile.ReadBool('ReadEvents', 'All', False);
   finally

   end;
end;

procedure TfmReviewSMSEvents.FormDestroy(Sender: TObject);
var
   i : Integer;
begin
   for i := DefaultTab1.Count-1 downto 0 do
      DefaultTab1.Items[i].Free;
   FreeAndNil(IniFile);
end;

procedure TfmReviewSMSEvents.MenuClick(Sender: TObject);
var
   i : Integer;
begin
   for i := DefaultTab1.Count-1 downto 0 do
      DefaultTab1.Items[i].Checked := False;
   if ( Sender is TMenuItem ) then
      begin
        (Sender as TMenuItem).Checked := True;
        IniFile.WriteInteger('EventTab', 'TabIndex', (Sender as TMenuItem).Tag);
      end
end;

procedure TfmReviewSMSEvents.Editeventsconsectitively1Click(
  Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      begin
         (Sender as TMenuItem).Checked := not(Sender as TMenuItem).Checked;
         IniFile.WriteBool('ReadEvents', 'All', (Sender as TMenuItem).Checked);
      end;
end;

end.


