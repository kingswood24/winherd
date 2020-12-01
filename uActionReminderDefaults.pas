{
   03/06/11 [V4.1 R1.8] /MK Additional Feature - Changed Caption On Form, GroupBox1 & GroupBox2 ProActive. 
}

unit uActionReminderDefaults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXCtrls, Mask, ToolEdit, KActionList;

type
  TActionReminderDefaults = class(TForm)
    GroupBox1: TGroupBox;
    cbActive: TCheckBox;
    pActionDefaults: TGroupBox;
    cbActivateReport: TCheckBox;
    lDescText: TLabel;
    GroupBox2: TGroupBox;
    sbDueService: TRxSpeedButton;
    sbDuePD: TRxSpeedButton;
    sbDueDryOff: TRxSpeedButton;
    sbDueCalve: TRxSpeedButton;
    sbSave: TRxSpeedButton;
    sbCancel: TRxSpeedButton;
    IntervalDays: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbDueServiceClick(Sender: TObject);
    procedure cbActivateReportClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
    procedure IntervalDaysChange(Sender: TObject);
  private
    { Private declarations }
    ActionList : TKActionList;
    procedure LoadDefaultSettings;
  public
    { Public declarations }
  end;

var
  ActionReminderDefaults: TActionReminderDefaults;

implementation
uses
   DairyData, GenTypesConst;

{$R *.DFM}

procedure TActionReminderDefaults.FormCreate(Sender: TObject);
begin
   WinData.LoadBtnImage(WinData.Images,sbSave.Glyph,cBtnImgSave);
   WinData.LoadBtnImage(WinData.Images,sbCancel.Glyph,cBtnImgCancel);
   lDescText.Caption := Format(lDescText.Caption, [FormatDateTime('dd/mm/yyyy', Date)]);
   ActionList := TKActionList.Create;
   LoadDefaultSettings;
end;

procedure TActionReminderDefaults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if ( ModalResult = mrCancel ) then
      begin
         if ActionList.Updated then
            ActionList.CancelUpdates;
      end;
   Action := caFree;
end;

procedure TActionReminderDefaults.LoadDefaultSettings;
begin
   cbActive.Checked := ActionList.Enabled;
   while ( IntervalDays.Items.Count <= 99 ) do
      IntervalDays.Items.Add(IntToStr(IntervalDays.Items.Count+1));
   sbDueService.Click;
end;

procedure TActionReminderDefaults.sbDueServiceClick(Sender: TObject);
begin
   pActionDefaults.Caption := (Sender as TRXSpeedButton).Caption;
   cbActivateReport.Tag := (Sender as TRXSpeedButton).Tag;
   case (Sender as TRXSpeedButton).Tag of
      0 : Begin
             cbActivateReport.Checked := ActionList.ServiceEnabled;
             IntervalDays.ItemIndex := ActionList.ServiceInterval-1;
          end;
      1 : Begin
             cbActivateReport.Checked := ActionList.PregDiagEnabled;
             IntervalDays.ItemIndex := ActionList.PregDiagInterval-1;
          end;
      2 : Begin
             cbActivateReport.Checked := ActionList.DryOffEnabled;
             IntervalDays.ItemIndex := ActionList.DryOffInterval-1;
          end;
      3 : Begin
             cbActivateReport.Checked := ActionList.CalveEnabled;
             IntervalDays.ItemIndex := ActionList.CalveInterval-1;
          end;
   end;
end;

procedure TActionReminderDefaults.cbActivateReportClick(Sender: TObject);
begin
   case (Sender as TCheckBox).Tag of
      0 : ActionList.ServiceEnabled := cbActivateReport.Checked;
      1 : ActionList.PregDiagEnabled := cbActivateReport.Checked;
      2 : ActionList.DryOffEnabled := cbActivateReport.Checked;
      3 : ActionList.CalveEnabled :=  cbActivateReport.Checked;
   end;
end;

procedure TActionReminderDefaults.FormDestroy(Sender: TObject);
begin
   if ActionList <> nil then
      FreeAndNil(ActionList);
end;

procedure TActionReminderDefaults.cbActiveClick(Sender: TObject);
begin
   ActionList.Enabled := cbActive.Checked;
   if ActionList.Enabled and ( not((ActionList.ServiceEnabled) or (ActionList.CalveEnabled) or
      (ActionList.DryOffEnabled) or (ActionList.PregDiagEnabled)) ) then
         begin
            ActionList.ServiceEnabled := True;
            ActionList.CalveEnabled := True;
            ActionList.DryOffEnabled := True;
            ActionList.PregDiagEnabled := True;
            sbDueService.Click;
         end
end;

procedure TActionReminderDefaults.IntervalDaysChange(Sender: TObject);
begin
   if sbDueService.Down then
      ActionList.ServiceInterval := IntervalDays.ItemIndex + 1
   else if sbDuePD.Down then
      ActionList.PregDiagInterval := IntervalDays.ItemIndex + 1
   else if sbDueDryOff.Down then
      ActionList.DryOffInterval := IntervalDays.ItemIndex + 1
   else if sbDueCalve.Down then
      ActionList.CalveInterval := IntervalDays.ItemIndex + 1
end;

end.
