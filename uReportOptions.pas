{
   30/07/18 [V5.8 R2.0] /MK Change - Replaced single tick box for Temp Movements/B&B with radio group which defaults to first item.

   13/08/18 [V5.8 R2.3] /MK Additional Feature - Added new Options Type for differnt weighing report types.

   11/11/20 [V5.9 R7.2] /MK Change - I removed the Include Target Weighing Report and Target Weights option from this screen as its moved to uWeighingFilt - GL request. 
}

unit uReportOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxPC, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxTextEdit, cxCheckBox, StdCtrls, cxButtons,
  ActnList, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Mask, ToolEdit, GenTypesConst,
  uHerdLookup, ExtCtrls, uWeightTargets;

type
   TOptionsType = ( otPurchSales, otWeightGain, otWeightMulti, otWeightTargets );

   TfmReportOptions = class(TForm)
    pgOptions: TcxPageControl;
    tsPurchSalesOptions: TcxTabSheet;
    rgLiveOrDeadWeight: TcxRadioGroup;
    gbComment: TcxGroupBox;
    teNewReportTitle: TcxTextEdit;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    rgPurchaseDetails: TcxRadioGroup;
    tsWeighRepOptions: TcxTabSheet;
    btnClear: TcxButton;
    rgWeighGainDOB_Age: TcxRadioGroup;
    gbWeighRepMultiWeighOpt: TcxGroupBox;
    lBlockWeighDateFrom: TcxLabel;
    deBlockWeighStartDate: TDateEdit;
    gbWeighRepStandOptions: TcxGroupBox;
    lSupplier: TLabel;
    cmboSupplier: TcxLookupComboBox;
    lReportTitle: TcxLabel;
    teReportTitle: TcxTextEdit;
    cbSummaryReportOnly: TcxCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure teNewReportTitleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnClearClick(Sender: TObject);
    procedure tsWeighRepOptionsShow(Sender: TObject);
    procedure btnTargetWeighingClick(Sender: TObject);
   private
     { Private declarations }
     FPurchSalesOptions : TPurchSalesOptions;
     FWeighRepOptions : TWeighRepOptions;
     FOptionsType : TOptionsType;
     procedure SetAllTabsNotVisible;
     procedure AssignPurchSalesOptions;
     procedure AssignWeighRepOptions;
   public
     { Public declarations }
     class procedure ShowPurchSalesOptions(var APurchSalesOptions : TPurchSalesOptions; AOptionsType : TOptionsType);
     class procedure ShowWeighRepOptions(var AWeighRepOptions : TWeighRepOptions; AOptionsType : TOptionsType);
   end;

var
  fmReportOptions: TfmReportOptions;

implementation

{$R *.DFM}

{ TfmPurchSalesOptions }

class procedure TfmReportOptions.ShowPurchSalesOptions(var APurchSalesOptions: TPurchSalesOptions; AOptionsType: TOptionsType);
begin
   with TfmReportOptions.Create(nil) do
      try
         FOptionsType := AOptionsType;
         FPurchSalesOptions := APurchSalesOptions;
         ShowModal;
         APurchSalesOptions := FPurchSalesOptions;
      finally
         Free;
      end;
end;

class procedure TfmReportOptions.ShowWeighRepOptions(var AWeighRepOptions: TWeighRepOptions; AOptionsType: TOptionsType);
begin
   with TfmReportOptions.Create(nil) do
      try
         FOptionsType := AOptionsType;
         FWeighRepOptions := AWeighRepOptions;
         ShowModal;
         AWeighRepOptions := FWeighRepOptions;
      finally
         Free;
      end;
end;

procedure TfmReportOptions.FormActivate(Sender: TObject);
begin
   SetAllTabsNotVisible;
   if ( FOptionsType = otPurchSales ) then
      begin
         pgOptions.ActivePageIndex := tsPurchSalesOptions.PageIndex;
         AssignPurchSalesOptions;
         Height := 332;
         Width := 324;
      end;
   if ( FOptionsType in [otWeightGain, otWeightMulti, otWeightTargets] ) then
      begin
         pgOptions.ActivePageIndex := tsWeighRepOptions.PageIndex;
         AssignWeighRepOptions;
         Width := 363;
         if ( FOptionsType = otWeightGain ) then
            Height := 240
         else
            Height := 184
      end;
   OnActivate := nil;
end;

procedure TfmReportOptions.SetAllTabsNotVisible;
var
   i : Integer;
begin
   pgOptions.HideTabs := True;
   for i := 0 to pgOptions.PageCount-1 do
      pgOptions.Pages[i].TabVisible := False;
end;

procedure TfmReportOptions.AssignPurchSalesOptions;
begin
   tsWeighRepOptions.TabVisible := False;
   tsPurchSalesOptions.TabVisible := True;
   if ( FPurchSalesOptions.IncludeLiveWeight ) then
      rgLiveOrDeadWeight.ItemIndex := 0
   else if ( FPurchSalesOptions.IncludeDeadWeight ) then
      rgLiveOrDeadWeight.ItemIndex := 1;
   if ( FPurchSalesOptions.IncludeLastPurchaseDetails ) then
      rgPurchaseDetails.ItemIndex := 0
   else if ( FPurchSalesOptions.IncludeAllPurchaseDetails ) then
      rgPurchaseDetails.ItemIndex := 1;
   teNewReportTitle.Text := FPurchSalesOptions.ReportTitle;
end;

procedure TfmReportOptions.AssignWeighRepOptions;
begin
   tsPurchSalesOptions.TabVisible := False;
   tsWeighRepOptions.TabVisible := True;
   if ( FWeighRepOptions.SupplierID > 0 ) then
      cmboSupplier.EditValue := FWeighRepOptions.SupplierID;
   if ( Length(FWeighRepOptions.ReportTitle) > 0 ) then
      teReportTitle.Text := FWeighRepOptions.ReportTitle;
   if ( FOptionsType = otWeightGain ) then
      begin
         if ( FWeighRepOptions.WeighGainShowDOB ) then
            rgWeighGainDOB_Age.ItemIndex := 0
         else if ( FWeighRepOptions.WeighGainShowAge ) then
            rgWeighGainDOB_Age.ItemIndex := 1;
      end;
   if ( FOptionsType = otWeightMulti ) then
      begin
         if ( FWeighRepOptions.BlockWeightStartDate > 0 ) then
            deBlockWeighStartDate.Date := FWeighRepOptions.BlockWeightStartDate;
         cbSummaryReportOnly.Checked := FWeighRepOptions.SummaryReportOnly;
      end;
end;

procedure TfmReportOptions.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if ( ModalResult = mrOK ) then
      begin
         if ( FOptionsType = otPurchSales ) then
            begin
               FPurchSalesOptions.IncludeLiveWeight := ( rgLiveOrDeadWeight.ItemIndex = 0 );
               FPurchSalesOptions.IncludeDeadWeight := ( rgLiveOrDeadWeight.ItemIndex = 1 );
               FPurchSalesOptions.IncludeLastPurchaseDetails := ( rgPurchaseDetails.ItemIndex = 0 );
               FPurchSalesOptions.IncludeAllPurchaseDetails := ( rgPurchaseDetails.ItemIndex = 1 );
               FPurchSalesOptions.ReportTitle := teNewReportTitle.Text;
            end;
         if ( FOptionsType in [otWeightGain, otWeightMulti, otWeightTargets] ) then
            begin
               if ( cmboSupplier.EditValue = Null ) then
                  FWeighRepOptions.SupplierID := 0
               else
                  FWeighRepOptions.SupplierID := cmboSupplier.EditValue;
               FWeighRepOptions.ReportTitle := teReportTitle.Text;
               if ( FOptionsType = otWeightGain ) then
                  begin
                     FWeighRepOptions.WeighGainShowDOB := ( rgWeighGainDOB_Age.ItemIndex = 0 );
                     FWeighRepOptions.WeighGainShowAge := ( rgWeighGainDOB_Age.ItemIndex = 1 );
                  end;
               if ( FOptionsType = otWeightMulti ) then
                  begin
                     FWeighRepOptions.BlockWeightStartDate := deBlockWeighStartDate.Date;
                     FWeighRepOptions.SummaryReportOnly := cbSummaryReportOnly.Checked;
                  end;
            end;
      end;
end;

procedure TfmReportOptions.teNewReportTitleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_RETURN ) then
      ModalResult := mrOk;
end;

procedure TfmReportOptions.btnClearClick(Sender: TObject);
begin
   if ( FOptionsType = otPurchSales ) then
      begin
         teNewReportTitle.Text := '';
         FPurchSalesOptions.ReportTitle := teNewReportTitle.Text;
      end;
   if ( FOptionsType in [otWeightGain, otWeightMulti, otWeightTargets] ) then
      begin
         cmboSupplier.EditValue := 0;
         FWeighRepOptions.SupplierID := cmboSupplier.EditValue;
         teReportTitle.Text := '';
         FWeighRepOptions.ReportTitle := teReportTitle.Text;
         if ( FOptionsType = otWeightGain ) then
            begin
               rgWeighGainDOB_Age.ItemIndex := 0;
               FWeighRepOptions.WeighGainShowDOB := True;
               FWeighRepOptions.WeighGainShowDOB := False;
            end;
         if ( FOptionsType = otWeightMulti ) then
            begin
               deBlockWeighStartDate.Date := -1;
               FWeighRepOptions.BlockWeightStartDate := 0;
               cbSummaryReportOnly.Checked := False;
               FWeighRepOptions.SummaryReportOnly := False;
            end;
      end;
end;

procedure TfmReportOptions.tsWeighRepOptionsShow(Sender: TObject);
begin
   rgWeighGainDOB_Age.Visible := ( FOptionsType = otWeightGain );
   gbWeighRepMultiWeighOpt.Visible := ( FOptionsType = otWeightMulti );
end;

procedure TfmReportOptions.btnTargetWeighingClick(Sender: TObject);
begin
   TfmWeightTargets.ShowTheForm;
end;

end.
