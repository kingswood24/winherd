{
   03/06/11 [V4.1 R1.8] /MK Additional Feature - New CheckBox To Show Report On Program Startup - Read From Registry Item.
                                               - On ShowParams Check If ShowOnStartupCheckbox.
}

unit uActionWarningReminderParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxLabel, StdCtrls, cxButtons, ReportDefaults, cxCheckBox, uPreferences;

type
  TfmActionWarningReminderParams = class(TForm)
    GroupBox1: TGroupBox;
    lServiceWithin: TcxLabel;
    seActionWithinDays: TcxSpinEdit;
    cxLabel1: TcxLabel;
    seDaysforDryingOff: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel2: TcxLabel;
    seDaysForFirstService: TcxSpinEdit;
    cbShowOnStartup: TcxCheckBox;
    procedure cbShowOnStartupClick(Sender: TObject);
  private
    { Private declarations }
    DueServiceDefaults : TDueServiceDefaults;
    DuePregDiagDefaults : TDuePregDiagDefaults;
    DueDryOffDefaults : TDueDryOffDefaults;
    DueCalvingDefaults : TDueCalvingDefaults;
    procedure LoadParams;
    procedure SaveParams;
  public
    { Public declarations }
    class procedure ShowParams(const AShowOnStartupOption : Boolean = False);
  end;

var
  fmActionWarningReminderParams: TfmActionWarningReminderParams;
implementation

{$R *.DFM}

{ TfmActionWarningReminderParams }

procedure TfmActionWarningReminderParams.LoadParams;
begin
    DueServiceDefaults := TDueServiceDefaults.Create(cRD_DueService);
    try
       seDaysForFirstService.Value := DueServiceDefaults.NoDays;
       seActionWithinDays.Value := DueServiceDefaults.DueWithin;
    finally
       FreeAndNil(DueServiceDefaults);
    end;
    DueDryOffDefaults := TDueDryOffDefaults.Create(cRD_DueDryOff);
    try
       if DueDryOffDefaults.NoDays = 0 then
          seDaysforDryingOff.Value := 70
       else
          seDaysforDryingOff.Value := DueDryOffDefaults.NoDays;
    finally
       FreeAndNil(DueDryOffDefaults);
    end;
end;

procedure TfmActionWarningReminderParams.SaveParams;
begin
    DueServiceDefaults := TDueServiceDefaults.Create(cRD_DueService);
    try
       DueServiceDefaults.NoDays := seDaysForFirstService.Value;
       DueServiceDefaults.DueWithin := seActionWithinDays.Value;
    finally
       FreeAndNil(DueServiceDefaults);
    end;
    DueDryOffDefaults := TDueDryOffDefaults.Create(cRD_DueDryOff);
    try
       DueDryOffDefaults.NoDays := seDaysforDryingOff.Value;
    finally
       FreeAndNil(DueDryOffDefaults);
    end;
end;

class procedure TfmActionWarningReminderParams.ShowParams(const AShowOnStartupOption : Boolean = False);
begin
   with TfmActionWarningReminderParams.Create(nil) do
      try
         cbShowOnStartup.Visible := AShowOnStartupOption;

         if AShowOnStartupOption then
            cbShowOnStartup.Checked := Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup] = True;
         LoadParams;
         if ShowModal = mrOK then
            SaveParams;
      finally
         Free;
      end;
end;

procedure TfmActionWarningReminderParams.cbShowOnStartupClick(
  Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSShowActionWarningRemindersOnStartup] := cbShowOnStartup.Checked;
end;

end.
