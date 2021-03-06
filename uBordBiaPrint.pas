{
   16/09/13 [V5.2 R1.3] /MK Change - Added Deaths(Purchase/Sales Analysis Deaths only) and
                                     Sales Summary(Livestock Inventory) reports.

   26/06/17 [V5.6 R6.4] /MK Bug Fix - PrintAllReports - Using variable name i.e. fmTreatmentSummary instead of object name i.e. TfmTreatmentSummary.

   17/07/17 [V5.6 R9.2] /MK Additional Feature - New button added for Review Medicines that goes to old Review Medicine screen.
                                               - When screen opens check to see there are incomplete medicines.

   21/07/17 [V5.6 R9.3] /MK Change - Revamped screen as per GL's directions to allow user to use this for help with entering and printing data
                                     for the Bord Bia inspection.   
}

unit uBordBiaPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  StdCtrls, cxButtons, ExtCtrls, cxContainer, cxEdit, cxLabel, DairyData,
  GenTypesConst, CowRepFilt, HealthFilterU, uLivestockSum, StockInHerdFilt,
  uTreatmentSummary, uMedicinesNullGroup, uAnimalRemedyData, uHerdLookup,
  uMedicineSetup, cxGroupBox, uShowMeEventInfo, Menus, uSuppliers, uMediAdminSetUp;

type
  TfmBordBiaPrint = class(TfmBaseForm)
    lbPrintAll: TdxBarLargeButton;
    actPrintAll: TAction;
    actBovineHerdRegister: TAction;
    actVetPurchases: TAction;
    actVetTreatSummary: TAction;
    actFeedPurchases: TAction;
    actAnimalDeathsReport: TAction;
    actAnnualLivestock: TAction;
    actTreatmentSummary: TAction;
    actReviewMedicines: TAction;
    dlbSpecifyMedicineTypes: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarContainerItem1: TdxBarContainerItem;
    gbReports: TcxGroupBox;
    btnBovineHerdRegister: TcxButton;
    btnVetPurchase: TcxButton;
    btnVetTreatments: TcxButton;
    btnFeedPurchases: TcxButton;
    btnAnimalDeaths: TcxButton;
    btnAnnualLivestock: TcxButton;
    btnTreatmentSummary: TcxButton;
    pInfo1: TPanel;
    lInfo: TcxLabel;
    Image1: TImage;
    gbEvent: TcxGroupBox;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    btnIndividualHealthEvents: TcxButton;
    btnBlockHealthEvents: TcxButton;
    btnVetLink: TcxButton;
    actShowIndividualEvents: TAction;
    actShowBlockHealthDosing: TAction;
    actShowVetLink: TAction;
    pmReviewMedicines: TdxBarPopupMenu;
    pmiAddMedicine: TdxBarButton;
    pmiAddPrescriberAdmin: TdxBarButton;
    pmiAddSupplier: TdxBarButton;
    btnUsingPhoneApp: TcxButton;
    actUsingPhoneApp: TAction;
    procedure actPrintAllExecute(Sender: TObject);
    procedure actBovineHerdRegisterExecute(Sender: TObject);
    procedure actVetPurchasesExecute(Sender: TObject);
    procedure actVetTreatSummaryExecute(Sender: TObject);
    procedure actFeedPurchasesExecute(Sender: TObject);
    procedure actAnnualLivestockExecute(Sender: TObject);
    procedure actAnimalDeathsReportExecute(Sender: TObject);
    procedure actTreatmentSummaryExecute(Sender: TObject);
    procedure actReviewMedicinesExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actShowIndividualEventsExecute(Sender: TObject);
    procedure actShowBlockHealthDosingExecute(Sender: TObject);
    procedure actShowVetLinkExecute(Sender: TObject);
    procedure pmiAddMedicineClick(Sender: TObject);
    procedure pmiAddSupplierClick(Sender: TObject);
    procedure pmiAddPrescriberAdminClick(Sender: TObject);
    procedure actUsingPhoneAppExecute(Sender: TObject);
  private
    FAnimalRemedyData : TAnimalRemedyData;
    procedure PrintAllReports;
    procedure ShowEventInfoForm(AEventInfoType : TShowMeEventInfoType);
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTheForm;

implementation

{$R *.DFM}

var
  fmBordBiaPrint: TfmBordBiaPrint;

{ TfmBordBiaPrint }

procedure ShowTheForm;
begin
   with TfmBordBiaPrint.Create(nil) do
      try
         HerdLookup.FShowMeEventInfoType := setNone;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmBordBiaPrint.actPrintAllExecute(Sender: TObject);
begin
   inherited;
   if ( MessageDlg('Are you sure you want to proceed?'+cCRLF+
                   'This action will generate a lot of printed pages.'+cCRLF+
                   'Have your printer ready.',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
      PrintAllReports;
end;

procedure TfmBordBiaPrint.PrintAllReports;
begin
   Screen.Cursor := crHourGlass;

   WinData.FBordBiaBlockPrint := True;

   // Print Veterinary Treatment Summary.
   //   26/06/17 [V5.6 R6.4] /MK Bug Fix - Using variable name i.e. fmTreatmentSummary instead of object name i.e. TfmTreatmentSummary.
   TfmTreatmentSummary.ShowTheForm(WinData.UserDefaultHerdID);

   // Print Bovine Herd Register.
   TCowRepFilter.ShowTheForm;

   // Print Veterinary Purchases.
   THeatlthFilter.ShowTheForm(rtMediFeedPurch,ptVeterinary,True);

   // Print Veterinary Treatments.
   THeatlthFilter.ShowTheForm(rtMediTreat,ptVeterinary,True);

   // Print Feed Purchases.
   THeatlthFilter.ShowTheForm(rtMediFeedPurch,ptFeed,True);

   // Print Purchase Sales Analysis Deaths Only.
   StockInHerdFilt.ShowForm( PurchSales, True );

   // Print Livestock Inventory.
   uLivestockSum.ShowTheForm(rtLSInventory, nil, 'Annual Livestock Valuation', True );

   WinData.FBordBiaBlockPrint := False;

   Screen.Cursor := crDefault;
end;

procedure TfmBordBiaPrint.actBovineHerdRegisterExecute(Sender: TObject);
begin
   inherited;
   WinData.FBordBiaBlockPrint := False;
   TCowRepFilter.ShowTheForm;
end;

procedure TfmBordBiaPrint.actVetPurchasesExecute(Sender: TObject);
begin
   inherited;
   WinData.FBordBiaBlockPrint := False;
   THeatlthFilter.ShowTheForm(rtMediFeedPurch,ptVeterinary,True);
end;

procedure TfmBordBiaPrint.actVetTreatSummaryExecute(Sender: TObject);
begin
   inherited;
   WinData.FBordBiaBlockPrint := False;
   THeatlthFilter.ShowTheForm(rtMediTreat,ptVeterinary,True);
end;

procedure TfmBordBiaPrint.actFeedPurchasesExecute(Sender: TObject);
begin
   inherited;
   WinData.FBordBiaBlockPrint := False;
   THeatlthFilter.ShowTheForm(rtMediFeedPurch,ptFeed,True);
end;

procedure TfmBordBiaPrint.actAnnualLivestockExecute(Sender: TObject);
begin
   inherited;
   uLivestockSum.ShowTheForm(rtLSInventory, nil, 'Annual Livestock Valuation', True );
end;

procedure TfmBordBiaPrint.actAnimalDeathsReportExecute(Sender: TObject);
begin
   inherited;
   StockInHerdFilt.ShowForm( PurchSales, True );
end;

procedure TfmBordBiaPrint.actTreatmentSummaryExecute(Sender: TObject);
begin
   inherited;
   TfmTreatmentSummary.ShowTheForm(WinData.UserDefaultHerdID);
end;

procedure TfmBordBiaPrint.actReviewMedicinesExecute(Sender: TObject);
var
   iDrugID : Integer;
begin
   inherited;
   iDrugID := HerdLookup.FirstMedicineID;
   if ( iDrugID > 0 ) then
      uMedicineSetUp.ShowTheForm(iDrugID)
   else
      uMedicineSetUp.ShowTheForm();
end;

procedure TfmBordBiaPrint.FormActivate(Sender: TObject);
begin
   inherited;
   if ( FAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal > 0 ) and ( WinData.IsBordBiaRegistered ) then
      if ( MessageDlg('There are incomplete medicines that MAY affect your Bord Bia compliancy.'+cCRLF+
                      'Do you want to review these medicines?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
         TfmMedicinesNullGroup.ShowTheForm(False);
   FreeAndNil(FAnimalRemedyData);
end;

procedure TfmBordBiaPrint.FormCreate(Sender: TObject);
begin
   inherited;
   StatusBar.Visible := False;
end;

procedure TfmBordBiaPrint.actShowIndividualEventsExecute(Sender: TObject);
begin
   inherited;
   ShowEventInfoForm(setIndividualVetFeeds);
end;

procedure TfmBordBiaPrint.actShowBlockHealthDosingExecute(Sender: TObject);
begin
   inherited;
   ShowEventInfoForm(setBlockHealth);
end;

procedure TfmBordBiaPrint.actShowVetLinkExecute(Sender: TObject);
begin
   inherited;
   ShowEventInfoForm(setVetLink);
end;

procedure TfmBordBiaPrint.actUsingPhoneAppExecute(Sender: TObject);
begin
   inherited;
   ShowEventInfoForm(setPhoneApp);
end;

procedure TfmBordBiaPrint.ShowEventInfoForm(AEventInfoType : TShowMeEventInfoType);
begin
   HerdLookup.FShowMeEventInfoType := AEventInfoType;
   TfmShowMeEventInfo.ShowTheForm();
   if ( HerdLookup.FShowMeEventInfoType <> setNone ) then
      Close;
end;

procedure TfmBordBiaPrint.pmiAddMedicineClick(Sender: TObject);
begin
   inherited;
   uMedicineSetUp.ShowTheForm(0);
end;

procedure TfmBordBiaPrint.pmiAddSupplierClick(Sender: TObject);
var
   ID : Integer;
begin
   inherited;
   uSuppliers.ShowTheForm(TRUE, ID);
end;

procedure TfmBordBiaPrint.pmiAddPrescriberAdminClick(Sender: TObject);
begin
  inherited;
   uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
end;

end.
