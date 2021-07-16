program WinHerd;

{%ToDo 'WinHerd.todo'}
{%File 'Changes.txt'}


uses
  Windows,
  Forms,
  Splash,
  Dialogs,
  Sysutils,
  Classes,
  Printers,
  MenuUnit in 'MenuUnit.pas' {MenuForm},
  SetUpAnimals in 'SetUpAnimals.pas' {fSetUpAnimals},
  uSetUpUsers in 'uSetUpUsers.pas' {fSetUpUsers},
  uSrchdlg in 'uSrchdlg.pas' {fSearchDlg},
  Weighing in 'Weighing.pas' {WeightForm},
  BovineHerdReg in 'Reports\BovineHerdReg.pas' {BovineReport: TQuickRep},
  BullReportsFilt in 'Reports\BullReportsFilt.pas' {fBullReportsFilter},
  BullReport in 'Reports\BullReport.pas' {BullRptscr: TQuickRep},
  SireSelection in 'Reports\SireSelection.pas' {SireSelectionScr: TQuickRep},
  BreedingAnalysisFilt in 'Reports\BreedingAnalysisFilt.pas' {BreedingAnalysisFilter},
  uCowEnrolFilt in 'Reports\uCowEnrolFilt.pas' {fCowEnrolFilt},
  CowEnrolment in 'Reports\CowEnrolment.pas' {CowEnrolmentScr: TQuickRep},
  ActionReminderFilt in 'Reports\ActionReminderFilt.pas' {ActionReminderFilter},
  DueToCalve in 'Reports\DueToCalve.pas' {DueToCalveScr: TQuickRep},
  DueFirstService in 'Reports\DueFirstService.pas' {DueFirstServiceScr: TQuickRep},
  uCalvings in 'uCalvings.pas' {fCalving},
  Services in 'Services.pas' {fServices},
  PregDiag in 'PregDiag.pas' {fPregdiag},
  uSalePurchDelete in 'uSalePurchDelete.pas' {fSalePurchDelete},
  uHealth in 'uHealth.pas' {fHealth},
  BrowseRegisterU in 'Reports\BrowseRegisterU.pas' {BrowseSireRegister},
  HealthFilterU in 'Reports\HealthFilterU.pas' {HeatlthFilter},
  uMediPurch in 'uMediPurch.pas' {fMediPurch},
  uUnitsSetUp in 'uUnitsSetUp.pas' {fUnitsSetup},
  uMedicineSetUp in 'uMedicineSetUp.pas' {fMedicineSetUp},
  uGenLookSetUp in 'uGenLookSetUp.pas' {fGenLookSetUp},
  uHerdSetUp in 'uHerdSetUp.pas' {fHerdSetUp},
  MedicalPurchases in 'Reports\MedicalPurchases.pas' {MedicalPurchasesScr: TQuickRep},
  uCustomers in 'uCustomers.pas' {fCustomers},
  uDefaults in 'uDefaults.pas' {fDefaults},
  uMilkRec in 'uMilkRec.pas' {fMilkRec},
  uSetUpMilkDisk in 'uSetUpMilkDisk.pas' {fSetupMilkDisk},
  uMilkDiskReview in 'uMilkDiskReview.pas' {fMilkDiskReview},
  uSalesCatalogueFlt in 'uSalesCatalogueFlt.pas' {fSalesCatalogueFlt},
  uDailyYieldGraph in 'uDailyYieldGraph.pas' {fDailyYieldGraph},
  uSystem in 'uSystem.pas' {fSystem},
  StockInHerdFilt in 'Reports\StockInHerdFilt.pas' {StockInHerdFilter},
  uQuotaSummary in 'Reports\uQuotaSummary.pas' {fQuotaSummary},
  uCalfRegFlt in 'uCalfRegFlt.pas' {fCalfRegFlt},
  uIndexes in 'uIndexes.pas',
  uListAnimals in 'uListAnimals.pas',
  uMilkRecDate in 'uMilkRecDate.pas' {DateDLG},
  uHerdBrochureFlt in 'uHerdBrochureFlt.pas' {fHerdBrochureFlt},
  uInterHerd in 'uInterHerd.pas' {fInterHerd},
  uSuppliers in 'uSuppliers.pas' {fSuppliers},
  uRemarks in 'uRemarks.pas' {fRemarks},
  uMovedBy in 'uMovedBy.pas' {fMovedBy},
  uBuyers in 'uBuyers.pas' {fBuyers},
  uSalesDeaths in 'uSalesDeaths.pas' {fSalesDeaths},
  Bullings in 'Bullings.pas' {fBullings},
  uTBTestDtRep in 'Reports\uTBTestDtRep.pas' {fTBTestDtRep},
  CowRepFilt in 'Reports\CowRepFilt.pas' {CowRepFilter},
  BestCowsInHerd in 'Reports\BestCowsInHerd.pas' {s: TQuickRep},
  uReTag in 'uReTag.pas' {fReTag},
  uGeneralRemark in 'uGeneralRemark.pas' {fGeneralRemark},
  SetUpBreeds in 'SetUpBreeds.pas' {fSetUpBreeds},
  uTempMovements in 'uTempMovements.pas' {fTempMovements},
  uHeatServiceFilt in 'Reports\uHeatServiceFilt.pas' {fHeatServiceFilt},
  uUnDelete in 'uUnDelete.pas' {fUnDelete},
  uSalesReport in 'Reports\uSalesReport.pas' {fSalesRep},
  uMovPerRep in 'Reports\uMovPerRep.pas' {fMovPerRep},
  uWeighingFilt in 'Reports\uWeighingFilt.pas' {fWeighingFilt},
  uFilters in 'uFilters.pas' {fFilters},
  uEventsByGroup in 'uEventsByGroup.pas' {fEventsByGroup},
  uLivestockSum in 'Reports\uLivestockSum.pas' {fLivestockSum},
  uMediAdminSetUp in 'uMediAdminSetUp.pas' {fMediAdminSetUp},
  uPurchases in 'uPurchases.pas' {fPurchases},
  uActiv in 'Reports\uActiv.pas' {fActiv},
  uGroupSetUp in 'uGroupSetUp.pas' {fGroupSetUp},
  uBBPPurchScr in 'uBBPPurchScr.pas' {fBBPPurchScr},
  uPurchGrpRep in 'Reports\uPurchGrpRep.pas' {fPurchGrpRep},
  uCControl in 'uCControl.pas',
  uFertIndicesRpt in 'uFertIndicesRpt.pas' {fFertIndicesRpt},
  HerdPassword in 'HerdPassword.pas' {fHerdPassword},
  uICBFEventExport in 'uICBFEventExport.pas' {fICBFEventExport},
  BeefRemit in 'BeefRemit.pas',
  BeefRemitLine in 'BeefRemitLine.pas',
  DaZMisc in 'DaZMisc.pas',
  uAddSupplier in 'uAddSupplier.pas' {fAddSupplier},
  uRemittance in 'uRemittance.pas' {fRemittance},
  uRemittanceAnimal in 'uRemittanceAnimal.pas' {fAnimalRemittanceProp},
  uRemittanceHeader in 'uRemittanceHeader.pas' {fRemittanceHeader},
  uRemittanceLoad in 'uRemittanceLoad.pas' {fRemittanceLoad},
  uRemittanceRecord in 'uRemittanceRecord.pas' {fRemittanceRecord},
  uRemittanceReview in 'uRemittanceReview.pas' {fRemittanceReview},
  uManufacturers in 'uManufacturers.pas' {fManufacturers},
  uFeedAlloc in 'uFeedAlloc.pas' {fFeedAlloc},
  uFeedPurch in 'uFeedPurch.pas' {fFeedPurch},
  uFeedTypes in 'uFeedTypes.pas' {fFeedTypes},
  uPedName in 'uPedName.pas' {fPedName},
  uElecWeigh in 'uElecWeigh.pas' {fElecWeigh},
  uMilkPricing in 'Reports\uMilkPricing.pas' {fMilkPricing},
  ExtSiresFilt in 'ExtSiresFilt.pas' {fExtSiresFilt},
  uPedAddAmend in 'uPedAddAmend.pas' {fPedAddAmend},
  AncestryTree in 'Reports\AncestryTree.pas' {fAncestryTree},
  uRetagScr in 'uRetagScr.pas' {fRetagScr},
  uMilkRecSysScr in 'uMilkRecSysScr.pas' {fMilkRecSysScr},
  uMilkRep in 'uMilkRep.pas' {fMilkRep},
  uGridPrint in 'uGridPrint.pas' {fGridPrint},
  DateRoutines in 'DateRoutines.pas',
  uPrintHUKICalfReg in 'Reports\uPrintHUKICalfReg.pas' {fPrintHUKICalfReg},
  uHFSCalfReg in 'uHFSCalfReg.pas' {fHFSCalfReg},
  uAccDefComp in 'uAccDefComp.pas' {AccDefComp},
  uMPEvents in 'uMPEvents.pas' {MPEvents},
  AnimalPrint in 'Reports\AnimalPrint.pas' {da},
  MooreParkExport in 'MooreParkExport.pas',
  uEditInfo in 'uEditInfo.pas' {fEditInfo},
  FeedPurchaseRep in 'Reports\FeedPurchaseRep.pas' {fmFeedPurch},
  uPedNamePrint in 'Reports\uPedNamePrint.pas' {PedNamePrintRep},
  uRestrictAnimals in 'Reports\uRestrictAnimals.pas' {fRestrictAnimals},
  FertAnalysisRpt in 'Reports\FertAnalysisRpt.pas' {fmFertAnalysisRpt},
  uLiveStockUnitProj in 'Reports\uLiveStockUnitProj.pas' {fmLiveStockUnitProj},
  SaleEligibility in 'Reports\SaleEligibility.pas' {EligibilityRep},
  uCreateEvents in 'uCreateEvents.pas',
  uAccsReps in 'Reports\uAccsReps.pas' {fmAccsReps},
  uBalanceSheet in 'Reports\uBalanceSheet.pas' {fmBalanceSheet},
  uDairyProfit in 'Reports\uDairyProfit.pas' {fmProfitMonitor},
  uProfitLoss in 'Reports\uProfitLoss.pas' {fmProfitLoss},
  uLiveStockValues in 'uLiveStockValues.pas' {fmLiveStockValues},
  uLiveStockInvent in 'Reports\uLiveStockInvent.pas' {fmLiveStockInvent},
  uPhoneLinkEventsReview in 'uPhoneLinkEventsReview.pas' {PhoneLinkEventsReview},
  uDownload in 'uDownload.pas' {Download},
  uFileSize in 'uFileSize.pas',
  uNIVetTreatments in 'Reports\uNIVetTreatments.pas' {NIVetTreatmentsScr: TQuickRep},
  uNIMedicinePurchase in 'Reports\uNIMedicinePurchase.pas' {NIMedicinePurchaseScr: TQuickRep},
  LiveStkClass in 'Reports\LiveStkClass.pas' {fmLiveStkClass},
  uSelectFarm in 'uSelectFarm.pas' {fmSelectFarm},
  uQuotaMan in 'Reports\uQuotaMan.pas' {fQuotaMan},
  DairyData in 'DairyData.pas' {WinData: TDataModule},
  uUpdateTables in 'uUpdateTables.pas',
  uHerdRec in 'uHerdRec.pas' {HerdRec},
  uPurchSalesReport in 'Reports\uPurchSalesReport.pas' {fmPurchSalesReport},
  uStockOnHandReport in 'Reports\uStockOnHandReport.pas' {fmStockOnHandReport},
  uGlobalSettings in 'uGlobalSettings.pas' {fmGlobalSettings},
  uFeedAllocEdit in 'uFeedAllocEdit.pas' {fmFeedAllocEdit},
  SuckPremReport in 'Reports\SuckPremReport.pas' {fSuckPremReport},
  uKingsCC in 'uKingsCC.pas',
  RegisterForm in 'RegisterForm.pas' {Register},
  uCalfRegView in 'Reports\uCalfRegView.pas' {fmCalfRegView},
  uPedUpgradeReport in 'Reports\uPedUpgradeReport.pas' {fmPedUpgradeReport},
  uHerdSelect in 'uHerdSelect.pas' {fmHerdSelect},
  uCrushDataLoad in 'uCrushDataLoad.pas' {fmCrushDataLoad},
  uCrushDiskWeigh in 'uCrushDiskWeigh.pas' {fmCrushDiskWeigh},
  uCrushDiskEdit in 'uCrushDiskEdit.pas' {fmCrushDiskEdit},
  uMilkTankRead in 'uMilkTankRead.pas' {fmMilkTankRead},
  uPreSale in 'uPreSale.pas' {fmPreSale},
  uCMMSPermits in 'Reports\uCMMSPermits.pas' {fmCMMSPermits},
  uNBASRep31B in 'Reports\uNBASRep31B.pas' {NBASRep31B},
  uNBASRep31A in 'Reports\uNBASRep31A.pas' {NBASRep31A},
  uBladeFileUpdate in 'uBladeFileUpdate.pas',
  uFileDownload in 'uFileDownload.pas',
  uBlade in 'uBlade.pas' {fmBlade},
  uCalfRegReview in 'uCalfRegReview.pas' {fmCalfRegReview},
  uMilkRecDupHandler in 'uMilkRecDupHandler.pas' {fmMilkRecDupHandler},
  uVersionHistory in 'uVersionHistory.pas' {fmVersionHistory},
  uSWSReport in 'Reports\uSWSReport.pas' {fmSWSReport},
  uReportsBaseForm in 'uReportsBaseForm.pas' {ReportsBaseForm},
  uRationPerformMonitor in 'uRationPerformMonitor.pas' {RationPerformMonitor},
  uUpdateAnimalNo in 'uUpdateAnimalNo.pas' {UpdateAnimalNo},
  uHerdHelp in 'uHerdHelp.pas' {Form2},
  uGroupReport in 'uGroupReport.pas' {GroupReport},
  uAPHISRegistration in 'uAPHISRegistration.pas' {APHISRegistration},
  uHerdLookup in 'uHerdLookup.pas' {HerdLookup: TDataModule},
  uActionReminderDefaults in 'uActionReminderDefaults.pas' {ActionReminderDefaults},
  KActionList in 'KActionList.pas',
  uDairyHerdHealthCert in 'Reports\uDairyHerdHealthCert.pas' {DairyHerdHealthCert},
  uMilkRecErrors in 'Reports\uMilkRecErrors.pas' {MilkRecErrors},
  uBackupDevice in 'uBackupDevice.pas' {BackupDevice},
  EventDefaults in 'EventDefaults.pas',
  EmailAccountInfo in 'EmailAccountInfo.pas',
  uEventDesc in 'uEventDesc.pas' {EventDesc},
  SCCAnalysis in 'Reports\SCCAnalysis.pas' {SCCAnalysisForm},
  uPDAReportDefaults in 'uPDAReportDefaults.pas' {Form3},
  uPhoneLinkEventsRpt in 'Reports\uPhoneLinkEventsRpt.pas' {PhoneLinkEventsRpt},
  uPDAExportSynch in 'uPDAExportSynch.pas' {PDAExportSynch},
  ReportDefaults in 'ReportDefaults.pas',
  PDALink in 'PDALink.pas',
  LivestockInventory in 'LivestockInventory.pas',
  uREPs in 'Reports\uREPs.pas' {fmREPs},
  CowMilkHistory in 'Reports\CowMilkHistory.pas' {fmCowMilkHistory},
  ClearHerdPassword in 'ClearHerdPassword.pas' {fmClearHerdPassword},
  gridcols in 'gridcols.pas' {fmGridCols},
  uFertilityBenchmarking in 'uFertilityBenchmarking.pas' {fmFertilityBenchmarking},
  uImageStore in 'uImageStore.pas' {ImageStore},
  uNBASRep31G in 'Reports\uNBASRep31G.pas' {NBASRep31G},
  uNBASVenNoUpdate in 'uNBASVenNoUpdate.pas' {fmNBASVenNoUpdate},
  Groups in 'Groups.pas',
  uGroupUpdate in 'uGroupUpdate.pas' {fmGroupUpdate},
  uDBBaseForm in 'uDBBaseForm.pas' {fmDBBaseForm},
  uPDAAnimalPurch in 'uPDAAnimalPurch.pas' {fmPDAAnimalPurch},
  uDrugWithdrawalMsgDlg in 'uDrugWithdrawalMsgDlg.pas' {DrugWithdrawalMsgDlg},
  uReproductiveSummaryInterface in 'uReproductiveSummaryInterface.pas' {fmReproductiveSummaryInterface},
  uReproductiveSummary in 'uReproductiveSummary.pas',
  uReproductiveSummaryHelper in 'uReproductiveSummaryHelper.pas',
  uPremiumReport in 'Reports\uPremiumReport.pas' {fmPremiumReport},
  uCrush in 'uCrush.pas',
  uCrushAnimalReview in 'uCrushAnimalReview.pas' {fmCrushAnimalReview},
  uCrushHelper in 'uCrushHelper.pas',
  uRemittanceMarts in 'uRemittanceMarts.pas' {fmRemittanceMarts},
  CaprineTag in 'CaprineTag.pas',
  uActionWarningReminders in 'uActionWarningReminders.pas',
  uCAFREFertListData in 'uCAFREFertListData.pas' {fmCAFREFertListData},
  uDueToBeCulled in 'Reports\uDueToBeCulled.pas' {fmDueToBeCulled},
  uHUKIRegistrationXMLHTTP in 'uHUKIRegistrationXMLHTTP.pas',
  uHUKIRegistrationLogin in 'uHUKIRegistrationLogin.pas' {HUKIRegistrationLogin},
  uHUKICalfRegErrorReview in 'uHUKICalfRegErrorReview.pas' {fmHUKICalfRegErrorReview},
  uHUKIFarmEvents in 'uHUKIFarmEvents.pas' {fmHUKIFarmEvents},
  uHUKINameSerialNoViewer in 'uHUKINameSerialNoViewer.pas' {fmHUKINameSerialNoViewer},
  uActionWarningReminderParams in 'uActionWarningReminderParams.pas' {fmActionWarningReminderParams},
  uNINutrientProductionProjectionRpt in 'uNINutrientProductionProjectionRpt.pas' {fmNINutrientProductionProjectionRpt},
  uNutrientProductionProjectionRptScr in 'uNutrientProductionProjectionRptScr.pas' {fmNutrientProductionProjectionRptScr},
  uSetupWasteProdRates in 'uSetupWasteProdRates.pas' {fmSetupWasteProdRates},
  AnimalWaste in 'Reports\AnimalWaste.pas' {LivestockWaste},
  uICBFEventExportStatus in 'uICBFEventExportStatus.pas' {fmICBFEventExportStatus},
  uMartImportByFile in 'uMartImportByFile.pas',
  uMartImport in 'uMartImport.pas' {fmMartImport},
  uHUKISireDamListing in 'uHUKISireDamListing.pas' {fmHUKISireDamListing},
  uMartCustomerSupplierLookup in 'uMartCustomerSupplierLookup.pas' {fmMartCustomerSupplierLookup},
  uGettingStarted in 'uGettingStarted.pas' {fmGettingStarted},
  uNBAS10Print in 'uNBAS10Print.pas' {NBAS10Print},
  uCalfRegCardPrint in 'uCalfRegCardPrint.pas' {fmCalfRegCardPrint},
  uCalfRegNIBirthsDeaths in 'uCalfRegNIBirthsDeaths.pas' {fmCalfRegNIBirthsDeaths},
  uNINutrientProductionProjectionRptScr in 'uNINutrientProductionProjectionRptScr.pas' {fmNINutrientProductionProjectionRptScr},
  uCMMSFileImport in 'uCMMSFileImport.pas' {fmCMMSFileImport},
  uMartImportByFileReview in 'uMartImportByFileReview.pas' {fmMartImportByFileReview},
  uMartImportTypes in 'uMartImportTypes.pas',
  uCalvingHistoryEntry in 'uCalvingHistoryEntry.pas' {fmCalvingHistoryEntry},
  uICBFMilkDataSelect in 'uICBFMilkDataSelect.pas' {ICBFMilkDataSelect},
  uAWEventsByGroup in 'uAWEventsByGroup.pas' {fmAWEventsByGroup},
  uAWReviewEvents in 'uAWReviewEvents.pas' {fmAWReviewEvents},
  uFertilityTreatmentsReport in 'Reports\uFertilityTreatmentsReport.pas' {fmFertilityTreatmentsReport},
  MedicalTreatments in 'Reports\MedicalTreatments.pas' {MedicalTreatmentsScr: TQuickRep},
  uSetupFertPrograms in 'uSetupFertPrograms.pas' {fmSetupFertPrograms},
  uFertTreatmentsReview in 'uFertTreatmentsReview.pas' {fmFertTreatmentsReview},
  uFertProgramAdmin in 'uFertProgramAdmin.pas' {fmFertProgramAdmin},
  uTagReplacementForm in 'uTagReplacementForm.pas' {fmTagReplacementForm},
  uTagReplacements in 'uTagReplacements.pas',
  uAnimalCart in 'uAnimalCart.pas',
  uCTSBirthReg in 'uCTSBirthReg.pas' {fmCTSWSBirthReg},
  uCTSLoginInfo in 'uCTSLoginInfo.pas' {fmCTSLoginInfo},
  uCTSMovementReg in 'uCTSMovementReg.pas' {fmCTSWSMovementReg},
  uCTSRegResults in 'uCTSRegResults.pas' {fmCTSRegResults},
  uCTSHelper in 'uCTSHelper.pas',
  uCTSCattleOnHolding in 'uCTSCattleOnHolding.pas' {fmCTSCattleOnHolding},
  uCTSExceptions in 'uCTSExceptions.pas' {fmCTSExceptions},
  uCTSCattleOnHoldingNatIDReconcile in 'uCTSCattleOnHoldingNatIDReconcile.pas' {fmCTSCattleOnHoldingNatIDReconcile},
  uGridColourSelection in 'uGridColourSelection.pas' {fmGridColourSelection},
  uHerdStatistics in 'uHerdStatistics.pas' {fmHerdStatistics},
  HealthData in 'HealthData.pas',
  uMovementsInHealthDefaults in 'uMovementsInHealthDefaults.pas' {fmMovementsInHealthDefaults},
  uMovementsInHealthDefaultsGrid in 'uMovementsInHealthDefaultsGrid.pas' {fmMovementsInHealthDefaultsGrid},
  uMovementsInHealth in 'uMovementsInHealth.pas' {fmMovementsInHealth},
  uStockValuations in 'uStockValuations.pas' {fmStockValuationReport},
  uEmailClient in 'uEmailClient.pas' {fmEmailClient},
  uMartEmailRequest in 'uMartEmailRequest.pas' {fmMartEmailRequest},
  uAnimalCartView in 'uAnimalCartView.pas' {fmAnimalCartView},
  uSelectDamID in 'uSelectDamID.pas' {fmSelectDamID},
  uDataBackup in 'uDataBackup.pas' {fmDataBackup},
  uNutrientProductionProjectionRpt in 'uNutrientProductionProjectionRpt.pas' {fmNutrientProductionProjectionRpt},
  uNationalID in 'uNationalID.pas',
  uFileAttachmentImport in 'uFileAttachmentImport.pas' {fmFileAttachmentImport},
  uMilkData in 'uMilkData.pas',
  uUK9RetagReconcile in 'uUK9RetagReconcile.pas' {fmUK9RetagReconcile},
  uBaseFormAnimalCatalogue in 'uBaseFormAnimalCatalogue.pas' {fmBaseFormAnimalCatalogue},
  uBeefSalesCatalogue in 'uBeefSalesCatalogue.pas' {fmBeefSalesCatalogue},
  uUKSireRegister in 'uUKSireRegister.pas' {fmUKSireRegister},
  uReports in 'uReports.pas' {fmReports},
  uICBFEmailReview in 'uICBFEmailReview.pas' {fmICBFEmailReview},
  uAWReviewCalves in 'uAWReviewCalves.pas' {fmAWReviewCalves},
  uBeefProfitMonitor in 'uBeefProfitMonitor.pas' {fmBeefProfitMonitor},
  uFrameHerdIDPanel in 'uFrameHerdIDPanel.pas' {frmHerdIDPanel: TFrame},
  uEventForm in 'uEventForm.pas' {fmEventForm},
  uConditionScoreEventForm in 'uConditionScoreEventForm.pas' {fmConditionScoreEvent},
  uHealthEventForm in 'uHealthEventForm.pas' {fmHealthEvent},
  uBeefAISireRegister in 'uBeefAISireRegister.pas' {fmBeefAISireRegister},
  uBeefAISireRegisterSettings in 'uBeefAISireRegisterSettings.pas' {fmBeefAISireRegisterSettings},
  uRemittanceConvert in 'uRemittanceConvert.pas' {fmRemittanceConvert},
  ElectronicRemittanceConverter in 'ElectronicRemittanceConverter.pas',
  uAnimalEventTransfer in 'uAnimalEventTransfer.pas' {fmAnimalEventTransfer},
  uEventDataTransfer in 'uEventDataTransfer.pas',
  uConformationGradeAnalysis in 'uConformationGradeAnalysis.pas' {fmConformationGradeAnalysis},
  KCcxGridDBTableView in 'KCcxGridDBTableView.pas',
  uMovementsEventReview in 'uMovementsEventReview.pas' {fmMovementsEventReview},
  uMovementsImportOptions in 'uMovementsImportOptions.pas' {fmMovementsImportOptions},
  uDataDownload in 'uDataDownload.pas' {fmDataDownload},
  uAPHISWSCredentials in 'uAPHISWSCredentials.pas' {fmAPHISWSCredentials},
  uAPHISLoginData in 'uAPHISLoginData.pas',
  uDataRestoreConfirm in 'uDataRestoreConfirm.pas' {fmDataRestoreConfirm},
  uFertilityPrograms in 'uFertilityPrograms.pas',
  uFertilityCheckReport in 'Reports\uFertilityCheckReport.pas' {fmFertilityCheckReport},
  uFertilityCheckEdit in 'Reports\uFertilityCheckEdit.pas' {fmFertilityCheckEdit},
  uAWWeaningEventValidator in 'uAWWeaningEventValidator.pas',
  uHerd in 'Classes\uHerd.pas',
  uCTSHerdReconcileOptions in 'uCTSHerdReconcileOptions.pas' {fmCTSHerdReconcileOptions},
  uConditionScoreReport in 'uConditionScoreReport.pas' {fmConditionScoreReport},
  uFertilityAnalysis in 'uFertilityAnalysis.pas' {fmFertilityAnalysis},
  uCalvingSurveyForm in 'uCalvingSurveyForm.pas' {fmCalvingSurveyForm},
  uCalvingSurvey in 'uCalvingSurvey.pas',
  uSalesKillOutPercs in 'uSalesKillOutPercs.pas' {fmSalesKillOutPercs},
  uCTSRegInfo in 'uCTSRegInfo.pas' {fmCTSRegInfo},
  uLactationConsistencyChecker in 'uLactationConsistencyChecker.pas' {fmLactationConsistencyChecker},
  uProcessBarcodeScan in 'uProcessBarcodeScan.pas',
  uCrushBarcode in 'uCrushBarcode.pas' {fmCrushBarCode},
  uCrushPurchGrpAnimalSearch in 'uCrushPurchGrpAnimalSearch.pas' {fmCrushGrpPurchAnimalSearch},
  uAnimalBrowser in 'uAnimalBrowser.pas' {fmAnimalBrowser},
  uAnimalBrowserEventBase in 'uAnimalBrowserEventBase.pas' {fmAnimalBrowserEventBase},
  uNewUIHealthEvent in 'uNewUIHealthEvent.pas' {fmNewUIHealthEvent},
  uNewUIBullingEvent in 'uNewUIBullingEvent.pas' {fmNewUIBullingEvent},
  uCrushSalesGroup in 'uCrushSalesGroup.pas' {fmCrushSalesGroup},
  uNewFeedAllocEdit in 'uNewFeedAllocEdit.pas' {fmNewFeedAllocEdit},
  uEventFilter in 'uEventFilter.pas' {EventFilter},
  uFeedEventFilter in 'uFeedEventFilter.pas' {fmFeedEventFilter},
  uBaseForm in 'uBaseForm.pas' {fmBaseForm},
  uTescoExport in 'uTescoExport.pas' {fmTescoExport},
  DueForDryingOff in 'Reports\DueForDryingOff.pas' {DueForDryingOffScr: TQuickRep},
  uNewUIServiceEvent in 'uNewUIServiceEvent.pas' {fmNewUIServiceEvent},
  uHerdResources in 'uHerdResources.pas',
  uCrushAnimalFilter in 'uCrushAnimalFilter.pas' {fmCrushAnimalFilter},
  uAccsDairyParams in 'uAccsDairyParams.pas' {fmAccsDairyParams},
  uReportFilters in 'uReportFilters.pas' {fmReportFilters},
  uHerdSync in 'uHerdSync.pas',
  uGroups in 'uGroups.pas' {fmGroups},
  uAimAnimalRegistration in 'uAimAnimalRegistration.pas',
  uElectronicWeighingSettings in 'uElectronicWeighingSettings.pas' {fmElectronicWeighingSettings},
  uSelectBuyer in 'uSelectBuyer.pas' {fmSelectBuyer},
  uDanRyanImport in 'uDanRyanImport.pas' {fmDanRyanImport},
  uDeptLinkAdvert in 'uDeptLinkAdvert.pas' {fmDeptLinkAdvert},
  uTempMovementsIn in 'uTempMovementsIn.pas' {fmTempMovementsIn},
  uVaccineDueOn in 'uVaccineDueOn.pas' {fmVaccineDueOn},
  uKingswoodRepository in 'uKingswoodRepository.pas',
  uMedicinePurchaseRepository in 'uMedicinePurchaseRepository.pas',
  uMedicineRepository in 'uMedicineRepository.pas',
  uStartupReminders in 'uStartupReminders.pas' {fmStartupReminders},
  uCrushXML in 'uCrushXML.pas',
  uWeightTargets in 'uWeightTargets.pas' {fmWeightTargets},
  uDrugsRegisterImport in 'uDrugsRegisterImport.pas' {fmDrugsRegisterImport},
  uHeatServiceScr in 'Reports\uHeatServiceScr.pas' {fHeatServiceScr: TQuickRep},
  uDrugPurchTagDetails in 'uDrugPurchTagDetails.pas' {fmDrugPurchTagDetails},
  uAIMAnimalMovements in 'uAIMAnimalMovements.pas',
  uXMLDOMHelper in 'uXMLDOMHelper.pas',
  uCustomerRepository in 'uCustomerRepository.pas',
  uSupplierRepository in 'uSupplierRepository.pas',
  uAimAnimalMovementSummary in 'uAimAnimalMovementSummary.pas' {fmAimAnimalMovementSummary},
  uBordBiaPrint in 'uBordBiaPrint.pas' {fmBordBiaPrint},
  uDrugRegImportWithdrawal in 'uDrugRegImportWithdrawal.pas' {fmDrugRegImportWithdrawal},
  AnimalRemedyMedicineFixer in 'AnimalRemedyMedicineFixer.pas' {fmAnimalRemedyMedicineFixer},
  uUpdateHealthUnits in 'uUpdateHealthUnits.pas' {fmUpdateHealthUnits},
  uDuplicateAnimals in 'uDuplicateAnimals.pas' {fmDuplicateAnimals},
  uSyncWarning in 'uSyncWarning.pas' {fmSyncWarning},
  uCowsServedAfterPD in 'uCowsServedAfterPD.pas' {fmCowsServedAfterPD},
  uAnimalRemedyData in 'uAnimalRemedyData.pas',
  uTreatmentSummary in 'uTreatmentSummary.pas' {fmTreatmentSummary},
  uMedicinesNullGroup in 'uMedicinesNullGroup.pas' {fmMedicinesNullGroup},
  uCalvesWithNoSires in 'uCalvesWithNoSires.pas' {fmCalvesNoSires},
  uMovementInHealthBatchNo in 'uMovementInHealthBatchNo.pas' {fmMovementInHealthBatchNo},
  uRedTractorTreatSum in 'uRedTractorTreatSum.pas' {fmRedTractorHealthCodeSummary},
  uRedTractor in 'uRedTractor.pas' {fmRedTractor},
  uVetLinkDrugSelect in 'uVetLinkDrugSelect.pas' {fmVetLinkSelect},
  uMovementDataHelper in 'uMovementDataHelper.pas',
  uDrugRegImportGroupSelect in 'uDrugRegImportGroupSelect.pas' {fmDrugRegImportGroupSelect},
  uVetLinkPurchaseCompleteMsg in 'uVetLinkPurchaseCompleteMsg.pas' {fmVetLinkPurchaseCompleteMsg},
  uCalvingsFix in 'uCalvingsFix.pas',
  uSireBreedDifferToCalfBreed in 'uSireBreedDifferToCalfBreed.pas' {fmSireBreedDifferToCalfBreed},
  uTestHealth in 'uTestHealth.pas' {fmTestHealth},
  uDownloadExternalProgram in 'uDownloadExternalProgram.pas' {fmDownloadExternalProgram},
  uMedNullGroupVetRegWarning in 'uMedNullGroupVetRegWarning.pas' {fmMedNullGroupVetRegWarning},
  uChangeCustomerSupplierNames in 'uChangeCustomerSupplierNames.pas' {fmChangeCustomerSupplierNames},
  uCalvingEvent in 'uCalvingEvent.pas' {fmCalvingEvent},
  uHerdSyncDataSettings in 'uHerdSyncDataSettings.pas' {fmHerdSyncDataSettings},
  uAnimalSearch in 'uAnimalSearch.pas' {fmAnimalSearch},
  uTestCreateCalvings in 'uTestCreateCalvings.pas' {fmTestCreateCalvings},
  GenTypesConst in 'GenTypesConst.pas',
  uKingswoodAppInfo in 'uKingswoodAppInfo.pas' {fmKingswoodAppInfo},
  uAIMAnimalMovementEdit in 'uAIMAnimalMovementEdit.pas' {fmAIMAnimalMovementEdit},
  uKImport in 'uKImport.pas' {fKImport},
  uStockBullEvent in 'uStockBullEvent.pas' {fmStockBullEvent},
  uCalvingXML in 'uCalvingXML.pas',
  uTagIdentifierSelection in 'uTagIdentifierSelection.pas' {fmTagIdentifierSelection},
  uAIMHerdRecImport in 'uAIMHerdRecImport.pas' {fmAIMHerdRecImport},
  uICBFPCDownloadImporter in 'uICBFPCDownloadImporter.pas' {fmICBFPCDownloadImporter},
  uEventDataHelper in 'uEventDataHelper.pas',
  uDrugFinder in 'uDrugFinder.pas' {fmDrugFinder},
  uShowMeEventInfo in 'uShowMeEventInfo.pas' {fmShowMeEventInfo},
  uVetLinkFileImport in 'uVetLinkFileImport.pas',
  uVetLinkFileImportSummary in 'uVetLinkFileImportSummary.pas' {fmVetLinkFileImportSummary},
  uVetLinkDrugMatcher in 'uVetLinkDrugMatcher.pas' {fmVetLinkDrugMatcher},
  uMessageScr in 'uMessageScr.pas' {fmMessageScr},
  uMedicineClearUp in 'uMedicineClearUp.pas',
  uDeleteBlockSingleAnimalEvents in 'uDeleteBlockSingleAnimalEvents.pas' {fmDeleteBlockSingleAnimalEvents},
  uAllocateFeedToAnimal in 'uAllocateFeedToAnimal.pas' {fmAllocateFeedToAnimal},
  Feeds in 'Feeds.pas',
  uMedBatchNoTreatments in 'uMedBatchNoTreatments.pas' {fmMedBatchNoTreatments},
  uBlockEventEdit in 'uBlockEventEdit.pas' {fmBlockEventEdit},
  uRedTractorDrugCollation in 'uRedTractorDrugCollation.pas' {fmRedTractorDrugCollation},
  uGeneralReview in 'uGeneralReview.pas' {fmGeneralReview},
  uSireAnalysisFilter in 'uSireAnalysisFilter.pas' {fmSireAnalysisFilter},
  uSireAnalysis in 'uSireAnalysis.pas' {fmSireAnalysis},
  uAnimalSelectByDate in 'uAnimalSelectByDate.pas' {fmAnimalSelectByDate},
  uReportOptions in 'uReportOptions.pas' {fmReportOptions},
  uDrugFinderWithdMsg in 'uDrugFinderWithdMsg.pas' {fmDrugFinderWithdMsg},
  uHelp in 'uHelp.pas' {fmHelp},
  uEditAnimalDBByGrid in 'uEditAnimalDBByGrid.pas' {fmEditAnimalsByGrid},
  uModuleDefUpdate in 'uModuleDefUpdate.pas' {fmModuleDefUpdate},
  uHerdNewFeatures in 'uHerdNewFeatures.pas' {fmHerdNewFeatures},
  uClearDiseaseTestDate in 'uClearDiseaseTestDate.pas' {fmClearDiseaseTestDate},
  uGroupsNotUsed in 'uGroupsNotUsed.pas' {fmGroupsNotUsed},
  uImportFileMemo in 'uImportFileMemo.pas' {fmImportFileMemo},
  uAddSire in 'uAddSire.pas' {fmAddSire},
  uTransferAnimalInfo in 'uTransferAnimalInfo.pas',
  uAIMHeifTempTransfers in 'uAIMHeifTempTransfers.pas' {fmAIMHeifTempTransfers},
  uAHDBImport in 'uAHDBImport.pas' {fmAHDBImport},
  uMediDisposal in 'uMediDisposal.pas' {fmMediDiposal},
  uMedicineDisposalRepository in 'uMedicineDisposalRepository.pas',
  uTestGridWithDataSet in 'uTestGridWithDataSet.pas' {fmTestGridWithDataSet},
  uProjectedCalvingData in 'uProjectedCalvingData.pas',
  uLookupDrugBatchNos in 'uLookupDrugBatchNos.pas' {fmLookupDrugBatchNo},
  uCreateAnimalDataXMLFile in 'uCreateAnimalDataXMLFile.pas',
  uTestForm in 'uTestForm.pas' {fmTestForm},
  uCreateAnimalXMLIHMFileProgress in 'uCreateAnimalXMLIHMFileProgress.pas' {fmCreateAnimalXMLIHMFileProgress},
  KRoutines in '..\..\..\..\Common\KRoutines.pas',
  Password in '..\..\..\..\Common\Password.pas',
  uWinOS in '..\..\..\..\Common\uWinOS.pas',
  uConnect in '..\..\..\..\Common\uConnect.pas' {fmDialupConnect},
  PDAConst in '..\..\..\..\Common\PDAConst.pas',
  cxSSHelper in '..\..\..\..\Common\cxSSHelper.pas',
  uCTSLoginData in '..\..\..\..\Common\uCTSLoginData.pas',
  kGetStringValue in '..\..\..\..\Common\kGetStringValue.pas' {fmkGetStringValue},
  kGetDateTime in '..\..\..\..\Common\kGetDateTime.pas' {fmkGetDateTime},
  uDownloadValidation in '..\..\..\..\Common\uDownloadValidation.pas',
  UserMsgConst in '..\..\..\..\Common\UserMsgConst.pas',
  uAdvisorHelper in '..\..\..\..\Common\uAdvisorHelper.pas',
  DynaZipUtils in '..\..\..\..\Common\DynaZipUtils.pas',
  DCPCryptManagement in '..\..\..\..\Common\DCPCryptManagement.pas',
  uAnimal in '..\..\..\..\Common\uAnimal.pas',
  uSemenStockControl in '..\..\..\..\Common\uSemenStockControl.pas',
  uFarmSyncSettings in '..\..\..\..\Common\uFarmSyncSettings.pas',
  Drawing in '..\..\..\..\Common\Drawing.pas',
  uPreferences in '..\..\..\..\Common\uPreferences.pas',
  uSQLFilters in '..\..\..\..\Common\uSQLFilters.pas',
  KDBRoutines in '..\..\..\..\Common\KDBRoutines.pas',
  uHerdOwner in '..\..\..\..\Common\uHerdOwner.pas',
  uBreedingDataHelper in '..\..\..\..\Common\uBreedingDataHelper.pas',
  EventRecording in '..\..\..\..\Common\EventRecording.pas',
  uAIMClient in '..\..\..\..\Common\uAIMClient.pas',
  uAimSession in '..\..\..\..\Common\uAIMSession.pas',
  uLivestockData in '..\..\..\..\Common\uLivestockData.pas',
  ICBFPCDownload in '..\..\..\..\Common\ICBFPCDownload.pas',
  uMailBoxHelper in '..\..\..\..\Common\uMailBoxHelper.pas',
  uKillOutCalculator in '..\..\..\..\Common\uKillOutCalculator.pas',
  Def in '..\..\..\..\Common\Def.pas',
  Win7 in '..\..\..\..\Common\Win7.pas',
  cxUtils in '..\..\..\..\Common\cxUtils.pas',
  SampleAccounts in '..\..\..\..\Common\SampleAccounts.pas',
  db_bde in '..\..\..\..\Common\db_bde.pas',
  CSVUtils in '..\..\..\..\Common\CSVUtils.pas',
  uProgressIndicator in '..\..\..\..\Common\uProgressIndicator.pas' {ProgressIndicator},
  uCallToExternalProgram in '..\..\..\..\Common\uCallToExternalProgram.pas',
  uKingswoodController in '..\..\..\..\Common\uKingswoodController.pas',
  SQLHelper in '..\..\..\..\Common\SQLHelper.pas',
  uDeptFactories in '..\..\..\..\Common\uDeptFactories.pas',
  uDeptMarts in '..\..\..\..\Common\uDeptMarts.pas',
  ChkDebug in '..\..\..\..\Common\ChkDebug.pas',
  uIntList in '..\..\..\..\Common\uIntList.pas',
  BDEConfig in '..\..\..\..\..\Common\BDEConfig.pas',
  uBDE in '..\..\..\..\..\Common\uBDE.pas',
  uPopupAnimalEdit in 'uPopupAnimalEdit.pas' {fmPopupAnimalEdit},
  uCalculateGridColSelect in 'uCalculateGridColSelect.pas' {fmCalculateGridColSelect},
  uGeneralMemo in 'uGeneralMemo.pas' {fmGeneralMemo},
  uApplicationLog in 'uApplicationLog.pas',
  uSalesRepCattleCostings in 'uSalesRepCattleCostings.pas' {fmSalesRepCattleCostings},
  uSalesRepNoFeedCosts in 'uSalesRepNoFeedCosts.pas' {fmSalesRepNoFeedCosts},
  uSalesRepNoFarmCosts in 'uSalesRepNoFarmCosts.pas' {fmSalesRepNoFarmCosts};

{$R *.RES}
{ 08/03/12 [V5.0 R4.1] - Program has dependancy on qrpdflib.dll. }
{$R qrpdflib.RES}
{$R winherd.REC}

function CallerIsFarmSync() : Boolean;
begin
   Result := ((ParamCount() > 1) and ((ParamStr(1) = '-o') or (ParamStr(1) = '-i')));
end;

procedure StartProgram;
var
   i : Integer;
   Params : TStringList;
begin
   Application.Initialize;
   CheckWin7;

   if ((ParamCount() > 1) and ((ParamStr(1) = '-o') or (ParamStr(1) = '-i') or (ParamStr(1) = '-m'))) then
      begin
         //{-o = output data for sync purposes
         Params := TStringList.Create();
         for i := 0 to ParamCount do
            Params.Add(ParamStr(i));
         Sync(Params);
      end
   else
     begin
        Application.Title := 'Kingswood Herd Management';
        ShowWindow(Application.Handle, SW_RESTORE);
        InitializeBDE;

        ExtractResourceFiles;

        //Application.Title := 'Kingswood Herd Management';

        { Check for another instance is done from splash unit. }
        { SP 03/10/2002 }
        { Herd Select incorporated into splash screen. }
        SplashForm := TSplashForm.Create(nil);
        splashmessage := true;
        SplashForm.Show;
        { I'm not sure, but I think that the reason you have to do Update here is because the
          application isn't in the message loop yet}
        SplashForm.Update;

        while not SplashForm.HerdSelected do { Set to True on SelectHerd click }
           Application.ProcessMessages; { Wait for User Input. }

        Application.HelpFile := 'HerdHelp.chm';
        Application.CreateForm(TWinData, WinData);
  Application.CreateForm(THerdLookup, HerdLookup);
  Application.CreateForm(TMenuForm, MenuForm);
  Application.CreateForm(TfSetUpAnimals, fSetUpAnimals);
  Application.CreateForm(TfSearchDlg, fSearchDlg);
  Application.CreateForm(TfRemarks, fRemarks);
  Application.CreateForm(TfFilters, fFilters);
  MenuForm.Update;
        MenuForm.Show;
        Application.Run;
     end;
end;

begin
  if UseKCC then
      begin
         // KCC execution countdown display's a message dialog which blocks the program from returning control back to farmsync
         // So... if the program is being called by the FarmSync program just bypass any KCC checks
         if (not CallerIsFarmSync) then
            begin
               AddRegistrationCode;
               CheckKCC;
            end;
         Startprogram;
      end
   else if uCControl.CheckProtection(TRUE) then
     begin
        Startprogram;
     end;
end.



