unit uEventsByGroup;

{
  ** NEED TO CHANGE AnimalGrid TO CXGRID - MK 20/02/18 **
  With the TDBGridEh component there is on OnRecordChanged Event which will tell
  us when the user has moved to another record, therefore the batch number
  list on drugs is not changed when the user changes the drug on the grid to two
  different drugs, the same list of batch numbers show for both - spoke with
  SP about this today.
}

{
  SP - 09/11/2010

  - Validation for Fert Check requires a fert program is selected if the
    action is set to Start Program
  - Hide the Fertility Program from the header part of event - GL / DOM

Changes to Add a New Mass Update Event
1. ShowTheForm
        A New Block in the Case Statement ( eType ) to add the TableName
        of the OTHER table. Also Set the Active Page.
2. FormActive
        Hide all TabSheets for the current Modules.
3. CreateTempTables
        Using AddFields add the Fields needed for the Current events other table
        i.e. Weighing needs a Weight Float field.
4. Use the Case Statement at the bottom of CreateTempTables to call a procedure
        you will create to add the new fields into the Animals Grid.  The Fields need
        to be declared in the private section of the TfEventsByGroup class.

  N.B. *****************
  If you add new Data Controls to these Tabsheets or this Form MAKE SURE you apply
  these changes to OnEnterControl and check all other AREAS.
  Also the OnEnter Events must call OnEnteringControl to set the CurrentField Name.

 ------------------------------------------------------------------------------

 SP 04/10/2002:-

 New Tab : Brucellosis Test.

 Modification : On form close, check if eventtype in TBTest, BruceTest, also close
 and open WinData.AnimalFileByID to reflect the changes to animal record.

 SP 04/10/2002.

 ------------------------------------------------------------------------------

 SP 04/10/2002:-

 New to Health/Dry Off Tabs.

 Drug Batch Number.

 SP 04/10/2002.

 ------------------------------------------------------------------------------

 SP 13/01/2003:-

 Bug Fix Exlude Steers from Bruce Date event

 SP 13/01/2003.

 ------------------------------------------------------------------------------

 SP 27/01/2003:-

   To allow TB/Brucellosis Test Dates before purhcase date.

 SP 27/01/2003.

 ------------------------------------------------------------------------------

 09/02/2009 [Dev 3.9 R6.0] /SP New Feature - Updated the Health/DryOff tabs. They now use the same input controls.
                                             A general tidy up of health / dry off controls + grid columns was done.
                                             New fields PrescribedBy and Feed/Batch Group (if EventType is DryOff then
                                             allow the user to change feed group, if the eventtype is Health then
                                             allow user to change the Batch groups

                                             Also backup prompt has been included allowing easy restore of data if case of user
                                             mistakes

 27/02/2009 [Dev 3.9 R6.5] /SP New Feature - Added new Event - Condition Score.
                             New Feature - Added new Event - Heat/Bulling.
                             Additional Feature - Breeding Info columns for both Bulling/Service Events
                             Cols include LactNo, LastCalvedDate, LastServedDate, NumOfServes and LastServedBull
                             General improvements to each event Tab Seq, Control Postitions, Error Checking etc.

 01/12/10 [V4.0 R6.0] /MK Bug Fix - On pgEventsChange Set AnimalGrid.FrozenCols To 6 Where EventType Is All EventTypes.

 01/12/10 [V4.0 R6.1] /MK Additional Feature - If ActviePage = Service Then If ServiceBull Is AIBull Then ServiceType Is AI.

 14/03/11 [V4.0 R8.7] /MK Additional Feature - Added AddToEventLookUpDate For Service Event On SaveClick.

 04/05/11 [V4.0 R9.9] /MK Bug Fix - OnEnteringControl Was Not Rembering New cxDateControl.
                                  - OnFormActive Now Setting OnActivate To nil So OnActivate Is Only Set Once.

 17/05/11 [V4.1 R1.2] /MK Additional Feature - Added Technician To Services.

 19/05/11 [V4.1 R1.5] /MK Additional Feature - Changed RateOfApplic Colour To clTeal And MultiDrugGridDBTableViewApplicRate.Styles.Content To Required.
                                             - Changed RateOfApplic Colour To clWindows.

 20/05/11 [V4.1 R1.5] /MK Additional Feature - Stock Control Changes To Veterinary Treatments And Services.
                                             - Added NoDays And NoTimes In Veterinary Treatments.
                                             - Added No Of Straws In Service Events.

 23/05/11 [V4.1 R1.5] /MK Change - Added Medicine Setup Button If EventType Is DryOff Or Health.

 07/06/11 [V4.1 R1.8] /MK Bug Fix - ChangedItem - Error If Not Locate Of AI LookupCode.

 24/06/11 [V4.1 R2.1] /MK Bug Fix - ChangedItem - If No Bulls In Table Integer Not Being Set.
                      /MK Additional Feature - Services - Replaced TextEdit With CurrencyEdit for NoStraws.

 02/11/11 [V5.0 R1.7] /MK Bug Fix - Set Querys.Active For Status & Action To True After Report Is Shown.

 12/11/11 [V5.0 R2.0] /MK Bug Fix - Do Not Allow Multi Drug For Drying Off.

 07/12/11 [V5.0 R2.6] /MK Additional Feature - Now Able To Record Days To Remind On Block Health/Dry Off Event.

 08/12/11 [V5.0 R2.6] /MK Change - Hide pSingleDrugCombo Boxes If Multi Drug Clicked.
                                 - Added All SingleDrugCombo Boxes And DaysToRemind To MultiDrug Grid.

 09/01/12 [V5.0 R3.3] /MK Bug Fix - uEventsByGroup - New Procedure To Activate/Deactivate Health Component DataSources.

 09/01/12 [V5.0 R3.3] /MK Additional Feature - New Fields For Tesco Scoring Event.

 10/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Entering CondtionScore Event in English Herd.

 12/01/12 [V5.0 R3.3] /MK Bug Fix - fConditionScore.OnChange Now Checks If Score Between 1 & 5 In English Herd.

 16/01/12 [V5.0 R3.4] /MK Bug Fix - Fix If Changing Between Tabs With New Condition Score Fields For UK Herds.

 17/01/12 [V5.0 R3.5] /MK Change - Allow Block Delete Which Links To EventDiary Only On NoSelection.

 13/03/12 [V5.0 R4.4] /MK Additional Feature - New Event For BVDTest.

 27/03/12 [V5.0 R4.5] /MK Change - UpdateAnimals - Added Check For Dry Off Event If LastCalvingDate > DryOff Date Entered.

 11/05/12 [V5.0 R5.5] /MK Bug Fix - Changed DataSet of dsPlannedBull To Respective HerdLookup Querys For Heats And Service.
                                  - MultiDrugGrid - ApplicMethod DataBinding Not Set.

 11/05/12 [V5.0 R5.5] /MK Bug Fix - Services - Straw Used Not Being Saved.

 31/05/12 [V5.0 R6.0] /MK Bug Fix - sbSave.Click - Check If AnimalSelected And PregnancyStatus Is Not Null.
                                                 - Remove Check For Pregnant.ItemIndex.
                                  - UpdateAnimals - Only Check If TempEvents PregnancyStatus Is Not Blank.

 03/07/12 [V5.0 R7.4] /MK Additional Feature - If EventType = Health Buttons Show For Veterinary Due To And Scc Current Lactation.
                                             - If EventType = Service Or Bull Button Appears For Breeding Statistics.

 05/08/12 [V5.0 R9.8] /MK Change - FormActivate - If Temp Movement Event then all other pages are not visible.

 07/09/12 [V5.0 R9.8] /MK Change - FormActivate - TConditionScore - Set Mobility, Cleanliness and Abrasion components not visible if Country <> England
                                 - Removed separate DataSource Procedures that I put in for ConditionScore and Health/DryOff.
                                 - Updated SetDataSource procedure to take account of ConditionScore and Health/DryOff components.
                      /MK Additional Feature - PregDiag - Added CalfType option.
                                             - Added MilkTemperament Event.

 10/09/12 [V5.0 R9.8] /MK Change - CreateTempTable - New procedure - LoadLastYearsMilkTempScore - to load last years Score's.

 12/09/12 [V5.0 R9.9] /MK Bug Fix - Set BVDTest and MilkTemperament TabVisible if FHerdType = Beef.

 17/09/12 [V5.0 R9.9] /MK Additional Feature - Removed BVD, TB and Brucellosis pages.
                                             - Added Herd Test and Vaccine pages.
                                             - BVD, TB and Brucellosis events now saved by the Herd Test event.
                                             - Vaccine page is a Health event but saved as a Vaccine EventType ID.
                      /MK Change - TfmFertilityTreatmentsReport - Added check for ReportType.

 20/09/12 [V5.0 R9.9] /MK Additional Feature - Added Report ID/Reminder Type do Health, DryOff and Herd Vaccination Events.

 25/09/12 [V5.1 R0.0] /MK Bug Fix - btnSelectAll - If HerdVaccination then check that disease is selected before Select All.

 27/09/12 [V5.1 R0.0] /MK Additional Feature - Added new report button for Health Events for Herd Dosage Report.

 02/10/12 [V5.1 R0.1] /MK Additional Feature - Added Planned Bull Event.

 02/10/12 [V5.1 R0.1] /MK Change - If Service Event and Planned Bull events exist for the animal then LoadPlannedBullsAsServiceBull.

 08/10/12 [V5.1 R0.2] /MK Change - Changed to MultiLine layout.
                                 - Moved No Selection to the end of the pages.   

 10/10/12 [V5.1 R0.3] /MK Bug Fix - Added Procedure UpdateGrid to update the grid if the user enters
                                    a value into the Animal Grid and then clicks Save - Weighings - Martin Brosnan.

 12/10/12 [V5.1 R0.3] /MK Additional Feature - User now has the ability to enter Batch Number manually.

 17/10/12 [V5.1 R0.4] /MK Additional Feature - pcEventsChange - Added check for active medicines if EventType is Health, DryOff or Vaccination.

 18/10/12 [V5.1 R0.4] /MK Change - dbcbCalfType - Added an OnCloseUpEvent to Update Animals.
                                 - PregDiag - Removed OnEnterEvent as this was causing the user to have to click into the Date box twice.

 31/10/12 [V5.1 R0.7] /MK Change - If Health/Dosing or DryOff then if Country is England then DaysToRemind is 7 else DaysToRemind is 0.

 23/11/12 [V5.1 R1.2] /MK Bug Fix - Vaccination Event - SelectAllOnClick rule changed. Now check Disease on Save not SelectAll.

 05/12/12 [V5.1 R3.5] /MK Bug Fix - btnMedicineSetupClick - Check if DrugUsed.KeyValue is ''. If so then uMedicineSetup.ShowForm on 0.
                          Change - Changed GroupListing LookupField to just Description instead of ID;Description.
                                 - Had to change LookupDisplayIndex to 0 to match new LookupField.
                                 - TempAnimalsValueChange - Default Health Event EventDesc to Health - DrugCode.

 18/12/12 [V5.1 R3.5] /MK Change - OnPageChange - set dbseDaysToRemind.Enabled to False.
                                 - FocusControl - new procedure to set focus in date box each page on PageShow.
                                 - Removed OnPageEnter procedure for all pages as this was causing focus to be set in date field
                                   when moving from grid back to page.

 09/01/13 [V5.1 R3.7] /MK Change - LoadLastYearsMilkTempScore - No need for date restriction - see full note in procedure.

 30/01/13 [V5.1 R4.0] /MK Additional Feature - sbSaveClick - If PregDiag Event then Allow update of PD Event.
                                             - CreateTempTable - If PregDiag then bring in animals that have no culling event
                                                                 or have a PD event in the current lact with a False result.
                                             - LoadBreedingData - Update TempAnimalsRepeatPregDiag to True if Negative PD Event found on current lact.

 31/01/13 [V5.1 R4.0] /MK Additional Feature - TempEventsPregnancyDaysInCalfOnChange - Change EventDesc if Pregnant and DaysInCalf > 0.

 28/03/13 [V5.1 R5.4] /MK Change - PregDiag - If Pregnant change EventDesc to Pregnant.
                                            - If Pregnant and no DaysInCalf > 0 then change EventDesc to Pregnant + DaysInCalf.
                                            - If Pregnant and no DaysInCalf changed to 0 then change EventDesc to Pregnant.
                                            - If Not Pregnant then change EventDesc to Not Pregnant.

 10/04/13 [V5.1 R6.2] /MK Change - WriteHealthEvent - If MultiDrug and EventType is DryOff then create Health Event for second drug.
                                 - pgEventsChange - If DryOff then enable btnMultiDrug.

 18/06/13 [V5.1 R7.4] /MK Additional Feature - dbcbDrugBatchNoPropertiesCloseUp - Show uDrugPurchTagDetails.

 19/06/13 [V5.1 R7.5] /MK Change - DrugUsedCloseUp - Change TempEventsEventDesc to Health + DrugCode.
                                 - Set new boolean FManualHealthComment if TempEventsEventDesc changed by user
                                   so program does not update TempEventsEventDesc with Health + DrugCode.

 17/07/13 [V5.1 R8.5] /MK Change - Vaccination - Changes made to allow disease to be selected in MultiDrug.

 23/08/13 [V5.2 R0.2] /MK Bug Fix - GetDrugExpiryDate - Search by DrugPurchID to locate correct Expiry Date.
                                                      - If DrugPurchID/ExpiryDate found then update TempAnimals with correct DrugPurchID.

 28/08/13 [V5.2 R0.2] /MK Change - Health - On change of Applic Rate change comment DrugCude + ApplicRate + ApplicType.

 03/09/13 [V5.2 R1.0] /MK Additional Feature - Change DrugUsed to cxDBLookupCombo and added Add/Edit button beside DrugUsed.

 05/09/13 [V5.2 R1.0] /MK Additional Feature - dbHealthBatchNoOnChange, TempAnimalsDrugBatchNoOnChange -
                                               - Check if quantity remaining of selected batch not is zero.
                                             - RateOfApplicOnChange, TempAnimalsRateofApplicOnChange -
                                               - Check whether calculated quantity of selected batch exceeds quantity remaining of batch.

 09/09/13 [V5.2 R1.0] /MK Additional Feature - Service Events - Show animals in yellow that have been previously diagnosed pregnant.
                                                                If saved then edit existing PD event with a False status.

  13/09/13 [V5.2 R1.2] /MK Bug Fix - WinData.CheckDrugBatchQtyRemaining - Check for null values before CheckDrugBatchQtyRemaining.

  17/09/13 [V5.2 R1.4] /MK Change - Health - Moved Applic Method so components are in the same order as single health event.
                                  - Changed colour of Administer By, Prescribed By (Vet), DrugUsed and EventDate to clTeal
                                    to show fields are important, the same as the single health screen.

  04/10/13 [V5.2 R1.9] /MK Additional Feature - Add WinData.CheckDrugBatchQtyRemaining to TempAnimalsSelectedOnChange.

  09/10/13 [V5.2 R2.0] /MK Bug Fix - UpdateAnimals - Only setting FManualHealthComment if EventDesc <> Health and DrugUsed selected.
                                                     Did not work if EventDesc was changed before selecting a drug.

  16/10/13 [V5.2 R2.3] /MK Change - DrugUsed - Changed columns in DrugUsed to show Name first and then Code.

  23/10/13 [V5.2 R3.8] /MK Bug Fix - AnimalGridDblClick - Only allow double-click on "Selected" field column.

  11/12/13 [V5.2 R6.8] /MK Additional Feature - Added the ability to save Johnes Event.

  13/12/13 [V5.2 R6.9] /MK Additional Feature - Give error if no result selected before saving Johnes Event.
                           Bug Fix - Unit seems to have lost all the list sources for LookupCombo components since move to Win8 PC.

  03/01/14 [V5.2 R7.4] /MK Bug Fix - Move validation of combo boxes depending on event type to before UpdateAnimals.
                                   - Add validation for HerdTest if no disease selected.

  17/02/14 [V5.2 R8.3] /MK Bug Fix - Moved CheckDrugBatchQtyRemaining for TempAnimals to TempAnimalsAfterPost instead of AfterSelectedChange or AfterApplicRateChange.
                                   - Created a new function GetTotalApplicRate to get the total applic rate of animals selected to pass into CheckDrugBatchQtyRemaining.

  21/02/14 [V5.2 R8.4] /MK Additional Feature - Added Sexed Semen Lookup Combo to Services.
                                              - Only show this combo if the Bull selected is an AI Bull.

  25/02/14 [V5.2 R8.5] /MK Bug Fix - HealthSetup/FormCreate - Code to set the LookupComboBox Lookup Source as this value was being blanked
                                     out after a Delphi crash.

  08/07/14 [V5.3 R3.1] /MK Additional Feature - sbSaveClick/IsValidatorSelected - If drug selected and no application rate then don't allow event to be saved - GL & Margaret Murphy request.

  23/07/14 [V5.3 R4.0] /MK Change - sbSave - If user has selected diease but has not tabbed from box then fill disease
                                             in TempAnimals from disease in dbcbTestDisease.Text.
                                           - After DeselectAll - If HerdTest event then clear disease in TempAnimals.TableName for next disease if any.

  18/08/14 [V5.3 R4.5] /MK Bug Fix - FormCreate - Lookup source for DrugID in MultiDrug was blanked out after Delphi crash.

  19/08/14 [V5.3 R4.6] /MK Bug Fix - sbSaveClick/IsValidatorSelected - Check MultiDrug grid for Drugs that have no application rate.

  03/09/14 [V5.3 R5.8] /MK Bug Fix - Made sure that all LookupComboBox components had the LookupSource hard coded into Event Setup code.
                                   - ChangedItem - ActiveAIBull was being assigned with no ServiceBull causing error.

  25/09/14 [V5.3 R6.4] /MK Change - Added code to the AdminBy and PrescribedBy fields for the Vaccination event.

  06/10/14 [V5.3 R7.4] /MK Additional Feature - New VetLinkDrugs option added to toolbar - allows user to select from VetLink drugs that were not saved.
                                              - SetupMultiDrugGrid - New procedure used in both MultiDrug and VetLinkDrugs to
                                                process the click of either button as both bring up the multi drug screen.

  27/11/14 [V5.4 R0.1] /MK Bug Fix - sbSaveClick - Better checking for drugs selected without an ApplicRate.

  16/01/15 [V5.4 R0.6] /MK Bug Fix - TempMovementSetup - Assign LookupSource in code as component property lost by Delphi crash

  10/02/15 [V5.4 R2.6] /MK Change - pgEventsChange - Changed term of Multi-Treatment - GL/TOK request.

  23/03/15 [V5.4 R3.4] /MK Additional Feature - sbSaveClick - Don't allow user to save treatment if drug entered and no admin/prescribed by - GL/TOK request.

  24/04/15 [V5.4 R4.0] /MK Bug Fix - Removed check for WinData.CheckDrugBatchQtyRemaining on TempAnimalsAfterPost and move it to TempAnimalsSelectedChange.

  27/04/15 [V5.4 R4.0] /MK Change - sbSaveClick - Health/DryOff/Vaccine - Added check for drug purchase quantity before events are saved instead of when animals are selected
                                                  or when the batch number is selected - SP request.

  30/04/15 [V5.4 R5.3] /MK Bug Fix - TempAnimals.DrugBatchNo.PickList/MultiDrugGridDBTableViewDrugBatchNo - Check if BatchNo/DrugPurchID Index already added and don't add again.

  01/05/15 [V5.4 R5.3] /MK Bug Fix - pgEventsChange - AdminBy was not showing where CountryOfReg <> Ireland - Andrew Smith reported.
                           Change - pgEventsChange - Applic Method should be after FarmCode like singe treatment screen.
                                  - sbSaveClick - Health/DryOff/Vaccine - Added same validation to MultiDrug as SingleDrug when saving events.

  07/05/15 [V5.4 R5.4] /MK Additional Feature - ValidateMultiDrugGridInput - Check MediPurch quantity of each drug in MultiDrug grid.
                           Bug Fix - pVaccDisease - Set to show on top as it was sent to back in previous version.

  17/08/15 [V5.4 R7.4] /MK Additional Feature - sbSaveClick - Health/DryOff/HerdVaccination - If the animal was sold check to see if the sale date falls
                                                              within the withdrawal period then show warning before saving event.

  18/08/15 [V5.4 R7.4] /MK Bug Fix - sbSaveClick - Check that sale event is before EventDate. If Service Event then give Yes/No confirmation message
                                                   else give strict error and abort.
                                                 - Move validation of combo boxes after UpdateAnimals as IsValidatorSelected looks at TempAnimals table
                                                   which is not updated until after UpdateAnimals.
                                   - TempEventsValueChange - For Health, DryOff & HerdVaccination events, if the TempEvents.EventDate was changed the
                                                             withdrawal dates were not changed.
                                   - TempAnimalsValueChange - For Health, DryOff & HerdVaccination events, included if TempAnimals.EventDate changes
                                                              and TempAnimals.DrugUsed > 0 then recalculate withdrawal dates.

   24/08/15 [V5.4 R7.4] /MK Bug Fix - Moved check for ApplicRate, AdminBy and PrescribedBy into IsValidatorSelected as Richard Tyrell (SN:3546) reported
                                      a bug if the drug was selected in TempEvents and the ApplicRate was entered in TempAnimals the program thought the
                                      ApplicRate was not entered.

   27/08/15 [V5.4 R7.4] /MK Change - sbSaveClick - Don't allow service to be saved without a bull being selected - GL request.
                                   - Services - Always show Sexed Semen - GL request.

   10/09/15 [V5.4 R8.5] /MK Bug Fix - sbSaveClick - Default IsSynchronized to False for all events.

   15/09/15 [V5.4 R8.5] /MK Bug Fix - sbSaveClick - Default Modified to False for all events.

   30/10/15 [V5.4 R9.8] /MK Change - sbSaveClick - Changes made to now update the EventType of the existing PregDiag events to a new EventType and then create a new PregDiag event.

   02/11/15 [V5.4 R9.9] /MK Change - btnVetLinkDrugsClick - Don't show VetLink button if user has deleted all items in VetLink data table.

   03/11/15 [V5.5 R0.1] /MK Change - Disable the use of VetLinkDrugs if MultiDrug grid is already showing and vice versa.
                            Bug Fix - mdMultiDrugNoDaysChange - Added on change event for mdMultiDrug to recalculate mdMultiDrug withdrawal dates.
                                    - Changes made so that FManualHealthComment applies on change of Comment regardless of whether event is Health, DryOff or Vaccination - reported by Milo.
                                    - Changes made so that FManualHealthComment applies to MultiDrug entries - reported by Milo.

   04/11/15 [V5.5 R0.1] /MK Bug Fix - WriteTheOtherEvent - Non multi drug vaccination was not saving disease to health table.

   09/11/15 [V5.5 R0.5] /MK Change - Changes made to LookupSource for AdminBy and PrescribedBy to look at new seperate HerdLookup DataSource and Queries
                                     that differentiate between AdminBy and PrescribedBy with the new IsVet boolean field in MedAdmin table.

   02/12/15 [V5.5 R1.4] /MK Change - Removed the requirement to enter the prescribed by - GL/SP/Peter Maguire.

   11/12/16 [V5.5 R3.1] /MK Additional Feature - Added feature that allows the user to calculate the application rate by the last weight recorded for an animal - Richard Tyrell request.
                                               - Added button to Toolbar for Weighing events only to bring the user into the Default Vet Treatments screen - Richard Tyrell request.

   13/01/16 [V5.5 R2.2] /MK Bug Fix - ApplicMethodCloseUp - Refresh query to get newly added applic methods.
                                    - AdMinByCloseUp, PrescribedByCloseUp - Refresh both AdminBy and Prescribed query's just in case user adds both types.

   22/01/16 [V5.5 R3.2] /MK Additional Feature - cbShowLastWeightColumnPropertiesChange/DrugUsedPropertiesCloseUp
                                               - If show animal weight is ticked then show "per kg" after application rate.

   18/03/16 [V5.5 R4.4] /MK Bug Fix - ChangedItem - pStockBull was being overwritten by gbSexedSemen when a StockBull and Natural Service were selected.

   08/04/16 [V5.5 R5.7] /MK Change - ChangedItem - If user selects a Stock Bull from Bull List then default Service Type to Natural Service.

   05/08/16 [V5.5 R8.7] /MK Additional Feature - Added new ToolbarBtn and RxButton for sorting the grid.
                                               - This then pops up a new pop up menu with two options, Sort By Animal No and Sort By Nat. Id. No.
                                               - When the user selects either item it will change the index on the grid to either iAnimalNo or iNatIDNum.
                                               - Added SortNatID field to TempAnimals and query to add animals to TempAnimals.

   30/08/16 [V5.5 R9.3] /MK Bug Fix - ChangedItem - Problems found with the defaulting of showing gbSexedSemen or pStockBull - Monika.

   29/11/16 [V5.6 R3.6] /MK Bug Fix - ValidateMultiDrugGridInput - Using AsInteger instead of AsFloat for ApplicRate.

   19/04/17 [V5.6 R5.7] /MK Change - WriteEventsAfterPost - If Bulling or PlannedBullEvent then set use SetIsSynchroizedFlag procedure so that
                                                            planned bull goes against the animal on the server. SP said using SetIsSynchroizedFlag is correct
                                                            procedure to use even though it updates the events and milk disk table for the animal - GL/SP request.

   27/04/17 [V5.6 R7.1] /MK Change - CreateTempTable - Allow the user to add more than one Planned Bull for the animal.
                                   - WriteTheOtherEvent - TPlannedBull - Set new indicator of the recommended (by ICBF) bull to next available indicator.
                                   - sbSaveClick - Set comment of Planned Bull event to include preferred bull (by ICBF ) indicator.

   07/07/17 [V5.6 R9.1] /MK Change - ShowTheForm - Only show in use administered by records - Eddie Jordan (UCD).
                                                 - Only show in use prescribed by records - Eddie Jordan (UCD).

   21/07/17 [V5.6 R9.3] /MK Change - Change Health/Dosing to Vet/Dosing - GL request.
                                   - Move Vet/Dosing, Vaccination and Herd Test to start of row of pgEvents - GL request.

   22/08/17 [V5.7 R2.0] /MK Bug Fix - Default the comment to name of the drug with application rate and unit code if WinData.EventType = THealth.
                            Change - Removed the drug code from the drug drop down list.

   14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date.

   22/09/17 [V5.7 R3.0] /MK Bug Fix - When an animal is added to a batch group after an animal remedy it was entering the group with todays date not treatment date.

   28/09/17 [V5.7 R3.3] /MK Change - sbSaveClick - SingleDrug/MultiDrug - If user has entered an application rate but hasn't selected a drug give error and stop saving of event.
                                                                        - If user has selected an administered by but hasn't selected a drug give error and stop saving of event.
                                                                        - If user has not selected a drug give warning and stop if user clicks No to warning.

   07/12/17 [V5.7 R6.0] /MK Bug Fix - sbSaveClick - Changed function SaleDateWithinWithdrawalPeriod to ThisTreatmentWithdrawalAfterSaleDate.

   08/12/17 [V5.7 R6.1] /MK Bug Fix - CreateTempTable - No need for HerdLookup.GetAnimalSelectionToArrayWideString when animals in filter are in AFilters table.

   20/12/17 [V5.7 R6.3] /MK Additional Feature - Thought it best to add the last weight, last weigh date, weight gain and gain per day columns to weighing event.

   20/02/18 [V5.7 R8.2] /MK Change - SetupMultiOrSingleDrugEntry - Remove other irrelevant fields when MultiDrug grid is enabled.

   01/03/18 [V5.7 R8.2] /MK Change - FarmCodeCloseUp - If user has enabled preference to default health comment to farm code and farm code has value then use farm code as EventDesc - Brendan Meade.
                                   - Moved the creation of Health, DryOff and Herd Vaccination to use new EventRecording class.

   09/03/18 [V5.7 R8.2] /MK Change - Add warning for drug selected and no reason and vice versa for Northern Ireland herds for Health event only.

   16/03/18 [V5.7 R8.4] /MK Additional Feature - For PregDiag event use EventRecording to save the events.
                                               - After events are saved call LoadBreedingData for TempAnimals to load PregDiag event info.

   20/03/18 [V5.7 R8.4] /MK Change - LoadBreedingData - Use new BreedingDataHelper procedure's to get preg diag and service info by SQL for speed purposes.
                            Additional Feature - CreateTempTable - Before LoadBreedingData - Added progress bar to show user what the program is doing instead of just egg timer.

   21/03/18 [V5.7 R8.4] /MK Change - Seperated the service and preg diag data of LoadBreedingData into seperate procedures so that they can be used when
                                     changing the EventDate on the AnimalGrid.
                                   - When loading in previous PregDiag results also check for the Recheck boolean in the PregDiag table.
                                   - sbSaveClick - Don't allow PregDiag event to be saved if PregStatus is True and there is no DaysInCalf or DaysSinceLastService.
                            Additional Feature - Added Recheck field to PregDiag event.

   23/03/18 [V5.7 R8.4] /MK Change - CreateTempTable - Remove from TempAnimals the animals that have calved less than the default no days since calving from DuePDDefaults.

   17/04/18 [V5.7 R8.8] /MK Bug Fix - sbSaveClick - WriteTheOtherEvent was removed when new TPregDiagEvent class was added.

   23/07/18 [V5.8 R1.3] /MK Additional Feature - Added ToBeCulledEvent - John Wynne/Hilton Dagge.
                                               - Only allow cows that don't have a ToBeCulled event in the current lactation should appear on animal grid.

   27/09/18 [V5.8 R3.0] /MK Change - CreateTempTable - If there are no animals in the TempAnimals table then give an error and exit this try/finally sequence.

   15/10/18 [V5.8 R3.1] /MK Additional Feature - pgEventsChange - Show new Clear Disease Test Dates button if Herd Test tab is active.
                                               - On Click of Clear Disease Test Dates button prompt for password and then show new uClearDiseaseTestDate screen.

   21/11/18 [V5.8 R4.7] /MK Change - PD Events - Hide the Days In Calf in the header section as some farmers were recording this with weird figures like 1 or 7 - Eddie O'Flynn.
                                               - If no days in calf specified then give warning, like single PD event, that service days will be used.

   27/11/18 [V5.8 R5.5] /MK Change - CreateTempTable - Only default to default herd if WinData.UserDefaultHerdID > 0 or not MultiHerd in same database system.

   28/11/18 [V5.8 R5.5] /MK Change - Fertility Check - Finished work on allowing the program to be selected in header section and applied to grid - Eddie Jordan UCD.
                            Bug Fix - HealthEventRecCreated - Regardless of event type, if the user enters a manual comment then save event description as this comment.

   29/11/18 [V5.8 R5.5] /MK Change - CopyDetails - Fertility Check - If action is not start program then clear the TempAnimals.FertProgram if it was previously set.

   03/01/19 [V5.8 R5.9] /MK Change - Made Health, Vaccination, DryOff and Weighing loading of animals quicker by adding temp tables and queries for weighing and purchase event info.
                                   - Health, Vaccination, DryOff - removed tick box to show last weight column, always show column if info is available - SP/GL.
                                   - PD - Bring back days in calf into the header section - GL/DOM/Michael Cavanagh.
                                        - Change label from "Days In Calf" to "Default Days In Calf".
                                        - Move yellow message below the Days In Calf box so that the new days in calf info box can appear to the right of days in calf - GL.
                                        - If Days in Calf in header is less than 20 then give error and set focus to Days in Calf again.

   04/01/19 [V5.8 R6.0] /MK Bug Fix - CreateTempTable - TempAnimals NoCalves value should be defaulting to 1.
                            Change - Order of Preg Diag header matches grid so Default Days in Calf is after Calf Type - GL.
                                   - Moved yellow message higher under No of Calves so that it appears in smaller monitors.

   24/01/19 [V5.8 R6.3] /MK Additional Feature - Added the Mastitis event - Scot (Martonhall Fletchers).
                            Change - Added AnimalGridCellClick and AnimalGridDrawColumnCell which allow for a single tick of a check box that links to boolean field.

   25/01/19 [V5.8 R6.4] /MK Bug Fix - If user said no to create application rate from weight, the application rate was still set to the last weight x application rate.
                                    - RateOfApplicPropertiesChange - Only create comment based on Application Rate if Application Rate.Text has a value - backspace caused "invalid variant type conversion error".

   31/01/19 [V5.8 R6.5] /MK Additional Feature - Added the Lameness event to allow user to record a treatment of Foot Pairing - Pat McLoughin.

   13/02/19 [V5.8 R6.9] /MK Bug Fix - Only show prompt to update application rate by last weight once per session - Nicole - Richard Bourns.

   15/03/19 [V5.8 R8.0] /MK Additional Feature - Created a new approach for Health events to allow the user to switch between application rate for animal or animals weight.
                            Bug Fix - When treating multiple animals, the SQL to produce warning for the purchase quantity was wrong so the warning would not appear
                                      if the sum of the application rate for all animals was more than the purchase quantity.
                                    - When switching Multiple Treatments On and moving to another event the Multiple Treatments button was still bold.
                                    - Tabbing sequence for the variants of the Health event page were all wrong.
                            Change - Remove the Add/Edit button beside the Drug Used and make sure that the Medicine Setup button always moves to the selected drug - GL request.
                                   - After a drug used is selected, if the user clicks Medicine Setup and changes the drugs dose unit, then update the application rate label - GL request.
                                   - Only highlight those boxes in the Health event page depending on WinData.EventType i.e. drug used not required for Mastitis or Lameness - Pat McLoughlin.

   21/03/19 [V5.8 R8.3] /MK Bug Fix - When moving between any of the health event screens i.e. vet/dosing, dry off etc, to another event a "field is missing error appeared".
                                      As I had added new containers to the health event screen for DaysToRemind and ApplicRate I had to add these containers to SetDataSource - SE reported.

   07/06/19 [V5.8 R9.3] /MK Change - LookupBatchNo - Filter out those drugs that have Quantity Remaining - this also helps where two batchs of same number, one has quantity and the other doesn't - Una Carter.

   17/06/19 [V5.8 R9.4] /MK Change - Added new search button beside the batch number that allows a customer to pick a particular purchase record to be used - Una Carter.

   23/09/19 [V5.9 R0.6] /MK Change - WriteEventsAfterPost - Add ToBeCulled to this array of events that need to update the IsSynchronized boolean for animal syncing - SP request.

   10/12/19 [V5.9 R1.5] /MK Change - CreateTempTable, pgEventsChange - If there are animals on the animal grid in multiple batch groups show orange warning box on Header section.

   09/01/20 [V5.9 R1.6] /MK Bug Fix - CloseAndFree - Need to close the FDupGrpsPerAnimal here as its tied to the Animal Grid - only caused issue for Fergal & Sylvia Daly.

   10/08/20 [V5.9 R5.3] /MK Additional Feature - Changed Full National ID search box to Part Nat ID search - GL request.
                                               - Added Search button beside Part Nat ID search box.
                                               - Added functionality to auto search for part nat id when the user presses enter in the Part Nat Id. box.
                                                 If the user presses enter again this will tick/select the found record.
                                               - Added a help/information indicator after Part Nat Id search to tell users how to use the enter key in Part Nat Id.

   25/08/20 [V5.9 R5.7] /MK Bug Fix - HealthEventRecCreated - Check if Multi Drug panel is not showing and rgUseWeightAsApplicRate.ItemIndex is 1 before using TotalApplicRate - James (Fletchers).

   26/08/20 [V5.9 R5.8] /MK Bug Fix - Seperate the KeyDown of Animal Number and Part NatID - George (TGM).   
                                    - sbSaveClick - Set FDrugBatchQty_EmptyCheck before UpdateAnimals/CopyDetails so not to check quantity remaining for batch in MultiDrug - George (TGM).

   28/10/20 [V5.9 R6.5] /MK Bug Fix - FormCreate - Breeding Data Temp Tables were being created but not being filled. This was separated from BreedingData.Create.

   07/07/21 [V6.0 R1.6] /MK Change - CreateTempTable - Moved the FWeighInfoQuery and FPurchInfoQuery GET to after the TempAnimals table is created.
                                   - btnLookupBatchQtys - Changed the icon from a magnifying glass to binocular as GL though the magnifying glass didn't represent a lookup. 
                            Additional Feature - CreateTempTable - If the animal doesn't have a previous weighing weight then use the purchase weight if any - Una Carter.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, StdCtrls, Mask, DBCtrls, Db, Grids, DBGrids, RXDBCtrl, ComCtrls,
  RXLookup, Buttons, ExtCtrls, ToolEdit, RXCtrls, ToolWin,
  GenTypesConst, PageMngr, DbPrgrss, Menus,
  DBGridEh, DBCtrlsEh, DBLookupEh, uActionWarningReminders, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxDBEdit, cxCalendar, cxButtons, cxLabel, dxmdaset, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, cxFilter, cxLookupDBGrid, MenuUnit,
  RXSpin, cxSpinEdit, DairyData, uHerdLookup, cxCurrencyEdit, uEventFilter,
  DateUtil, uRestrictAnimals, uTBTestDtRep, uVaccineDueOn, uDrugPurchTagDetails,
  RxDBComb, ActnList, uImageStore, EventRecording, cxGroupBox, uAnimalRemedyData,
  uVetLinkDrugSelect, cxStyles, uMovementsInHealthDefaultsGrid ,
  uBreedingDataHelper, uMediPurch, uApplicationLog, ReportDefaults, HerdPassword,
  cxRadioGroup, uMessageScr, uLookupDrugBatchNos, cxImage, cxHint;

type
  TMultiDrugButtonType = (mtbtMultiDrug, mtbtVetLink);
  THerdTestType = ( htTB, htBrucellosis, htBVD, htJohnes );
  TfEventsByGroup = class(TForm)
    pgEvents: TPageControl;
    Heats: TTabSheet;
    Health: TTabSheet;
    AnimalGrid: TDBGridEh;
    TempEvents: TTable;
    dsTempEvents: TDataSource;
    TempAnimals: TTable;
    dsTempAnimals: TDataSource;
    qPlanned: TQuery;
    dsPlannedBull: TDataSource;
    MoveSelectedAnimals: TBatchMove;
    Panel1: TPanel;
    Label5: TLabel;
    TempAnimalsAnimalID: TIntegerField;
    TempAnimalsAnimalNo: TStringField;
    TempAnimalsNatIdNum: TStringField;
    TempAnimalsDateOfBirth: TDateField;
    TempAnimalsSex: TStringField;
    TempAnimalsEventDate: TDateField;
    TempAnimalsEventDesc: TStringField;
    genQuery: TQuery;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    sbHelp: TRxSpeedButton;
    sbSave: TRxSpeedButton;
    CountSelected: TQuery;
    dsCount: TDataSource;
    Label6: TLabel;
    TempAnimalsLactNo: TIntegerField;
    TempAnimalsHerdID: TIntegerField;
    WriteEvents: TTable;
    WriteOther: TTable;
    Weighing: TTabSheet;
    Label14: TLabel;
    EditWeight: TDBEdit;
    Label15: TLabel;
    WeighingDate: TDBDateEdit;
    DBEdit2: TDBEdit;
    Label16: TLabel;
    PregDiag: TTabSheet;
    ToolButton4: TToolButton;
    Label17: TLabel;
    PDDate: TDBDateEdit;
    DBEdit3: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    NoOfCalves: TDBEdit;
    DaysInCalf: TDBEdit;
    Label20: TLabel;
    Pregnant: TDBRadioGroup;
    DryingOff: TTabSheet;
    Service: TTabSheet;
    Label28: TLabel;
    ServiceDate: TDBDateEdit;
    Label29: TLabel;
    DBEdit6: TDBEdit;
    Label30: TLabel;
    dbcServBull: TRxDBLookupCombo;
    Label31: TLabel;
    ServiceTypes: TRxDBLookupCombo;
    qTestUpdate: TQuery;
    dsLookUpDamSire: TDataSource;
    TempAnimalsSelected: TBooleanField;
    TempAnimalsPdate: TDateField;
    NoSelection: TTabSheet;
    ToolButton6: TToolButton;
    sbMessage: TStatusBar;
    Label33: TLabel;
    tAnimals: TTable;
    pStockBull: TGroupBox;
    lStockBull: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    dbdBullIn: TDateEdit;
    dbdBullOut: TDateEdit;
    Label36: TLabel;
    tsHerdTest: TTabSheet;
    Label37: TLabel;
    deTestDate: TDBDateEdit;
    pInfo: TPanel;
    pbInfo: TProgressBar;
    Label38: TLabel;
    TotalSelected: TDBEditEh;
    sbDeSelectAll: TRxSpeedButton;
    tsTempMovement: TTabSheet;
    dblMoveTo: TRxDBLookupCombo;
    dbdMoved: TDBDateEdit;
    dbeComment: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lSelectedGridFilter: TLabel;
    lGridFilter: TLabel;
    LCartFilterReminder: TLabel;
    pHealthDryoff: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DateHealth: TDBDateEdit;
    DBEdit1: TDBEdit;
    tsConditionScore: TTabSheet;
    Label9: TLabel;
    Label13: TLabel;
    Label21: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBEdit4: TDBEdit;
    cmboConditionScoreAssociatedEvent: TRxDBLookupCombo;
    DBEdit5: TDBEdit;
    teAnimalNo: TcxTextEdit;
    teNatIDNum: TcxTextEdit;
    lPressEnterKeyTxt: TLabel;
    lPartNatIDTxt: TLabel;
    Image1: TImage;
    btnSelectAll: TRxSpeedButton;
    tsFertilityCheck: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    deFertilityCheckEventDate: TcxDBDateEdit;
    teFertilityCheckComment: TcxDBTextEdit;
    cmboFertilityCheckFertilityProgram: TcxDBLookupComboBox;
    cmboFertilityCheckStatus: TcxDBLookupComboBox;
    Label39: TLabel;
    cmboFertilityCheckAction: TcxDBLookupComboBox;
    Label40: TLabel;
    lFertProgram: TLabel;
    btnSetupFertilityPrograms: TcxButton;
    pReports: TPanel;
    btnReport1: TcxButton;
    Image2: TImage;
    btnReport2: TcxButton;
    cxLabel1: TcxLabel;
    pSingleDrugEntry: TPanel;
    lBatchNo: TLabel;
    lDrugExpires: TLabel;
    pMultiDrug: TPanel;
    MultiDrugGridDBTableView: TcxGridDBTableView;
    MultiDrugGridLevel: TcxGridLevel;
    MultiDrugGrid: TcxGrid;
    mdMultiDrug: TdxMemData;
    mdMultiDrugDrugUsed: TIntegerField;
    mdMultiDrugRateOfApplic: TFloatField;
    lDrugUsed: TLabel;
    mdMultiDrugBatchNoExpiryDate: TDateField;
    dsmdMultiDrug: TDataSource;
    MultiDrugGridDBTableViewRecId: TcxGridDBColumn;
    MultiDrugGridDBTableViewDrugId: TcxGridDBColumn;
    MultiDrugGridDBTableViewApplicRate: TcxGridDBColumn;
    MultiDrugGridDBTableViewBatchNoExpiryDate: TcxGridDBColumn;
    btnAddMultiDrug: TcxButton;
    btnRemoveMultiDrug: TcxButton;
    mdMultiDrugDrugPurchID: TIntegerField;
    mdMultiDrugBatchNo: TStringField;
    MultiDrugGridDBTableViewDrugBatchNo: TcxGridDBColumn;
    MultiDrugGridDBTableViewMeatWithdrawal: TcxGridDBColumn;
    MultiDrugGridDBTableViewMilkWithdrawal: TcxGridDBColumn;
    mdMultiDrugMilkWithdrawal: TDateTimeField;
    mdMultiDrugMeatWithdrawal: TDateTimeField;
    mdMultiDrugOrganicMeatWithdrawal: TDateTimeField;
    mdMultiDrugOrganicMilkWithdrawal: TDateTimeField;
    MultiDrugGridDBTableViewOrganicMeatWithdrawal: TcxGridDBColumn;
    MultiDrugGridDBTableViewOrganicMilkWithdrawal: TcxGridDBColumn;
    lInseminator: TLabel;
    Inseminator: TRxDBLookupCombo;
    lNoDaysBy: TLabel;
    cxdbseNoDays: TcxDBSpinEdit;
    MultiDrugGridDBTableViewNoDays: TcxGridDBColumn;
    MultiDrugGridDBTableViewNoTimes: TcxGridDBColumn;
    mdMultiDrugNoTimes: TFloatField;
    mdMultiDrugNoDays: TFloatField;
    lPerDayBy: TLabel;
    cxdbseNoTimes: TcxDBSpinEdit;
    lNoDays: TLabel;
    lNoPerDay: TLabel;
    ToolButton7: TToolButton;
    btnShowMultiTreat: TRxSpeedButton;
    lNoStraws: TLabel;
    ToolButton8: TToolButton;
    btnMedicineSetup: TRxSpeedButton;
    btnMultiDrug: TRxSpeedButton;
    ToolButton9: TToolButton;
    ceNoStraws: TcxDBCurrencyEdit;
    pSingleDrugCombos: TPanel;
    lICBFCode: TLabel;
    lAdMinBy: TLabel;
    lApplicMethod: TLabel;
    lFarmCode: TLabel;
    lPrescribBy: TLabel;
    lAddToGroup: TLabel;
    ICBFCode: TRxDBLookupCombo;
    AdMinBy: TRxDBLookupCombo;
    ApplicMethod: TRxDBLookupCombo;
    FarmCode: TRxDBLookupCombo;
    PrescribedBy: TRxDBLookupCombo;
    GroupListing: TRxDBLookupCombo;
    MultiDrugGridDBTableViewICBFCode: TcxGridDBColumn;
    MultiDrugGridDBTableViewFarmCode: TcxGridDBColumn;
    MultiDrugGridDBTableViewPrescribedBy: TcxGridDBColumn;
    MultiDrugGridDBTableViewAdminBy: TcxGridDBColumn;
    MultiDrugGridDBTableViewApplicMethod: TcxGridDBColumn;
    MultiDrugGridDBTableViewGroupListing: TcxGridDBColumn;
    mdMultiDrugHealthCode: TIntegerField;
    mdMultiDrugFarmCode: TIntegerField;
    mdMultiDrugVetPresc: TIntegerField;
    mdMultiDrugGroupListing: TIntegerField;
    mdMultiDrugReportInDays: TIntegerField;
    MultiDrugGridDBTableViewDaysToRemind: TcxGridDBColumn;
    mdMultiDrugAdminBy: TIntegerField;
    mdMultiDrugApplicMethod: TIntegerField;
    Label22: TLabel;
    lMobility: TcxLabel;
    lCleanliness: TcxLabel;
    dbceMobility: TcxDBCurrencyEdit;
    dbceCleanliness: TcxDBCurrencyEdit;
    dbcbAbrasions: TcxDBCheckBox;
    lAbrasions: TcxLabel;
    btnBlockDeletion: TRxSpeedButton;
    ToolButton5: TToolButton;
    tsVaccination: TTabSheet;
    btnReport3: TcxButton;
    lCalfType: TLabel;
    dbcbCalfType: TcxDBComboBox;
    tsMilkTemperament: TTabSheet;
    lMilkTempDate: TLabel;
    deMilkTempDate: TcxDBDateEdit;
    lMilkTempScore: TLabel;
    dbcbMilkTempScore: TcxDBLookupComboBox;
    lTestDisease: TcxLabel;
    dbcbTestDisease: TcxDBComboBox;
    pVaccDisease: TPanel;
    lDisease: TcxLabel;
    dblcbVaccineType: TcxDBLookupComboBox;
    MultiDrugGridDBTableViewReportID: TcxGridDBColumn;
    mdMultiDrugReportID: TIntegerField;
    btnReport4: TcxButton;
    tsPlannedBull: TTabSheet;
    pBulling: TPanel;
    Label3: TLabel;
    HeatDate: TDBDateEdit;
    Label4: TLabel;
    dbComment: TDBEdit;
    Label1: TLabel;
    PlannedBull: TRxDBLookupCombo;
    Label2: TLabel;
    ObservedBy: TRxDBLookupCombo;
    mdMultiDrugDrugBatchNo: TStringField;
    lRepeatPregDiagStatus: TLabel;
    MultiDrugGridDBTableViewDisease: TcxGridDBColumn;
    mdMultiDrugDisease: TStringField;
    dbcbDrugBatchNo: TcxDBComboBox;
    RateOfApplicOld: TDBEdit;
    DrugUsedOld: TRxDBLookupCombo;
    DrugUsed: TcxDBLookupComboBox;
    pmAddOrEdit: TPopupMenu;
    pmiAddMedicine: TMenuItem;
    pmiEditMedicine: TMenuItem;
    lPregDiagEventsFound: TLabel;
    lJohnesResult: TcxLabel;
    dbluJohnesResult: TcxDBLookupComboBox;
    gbSexedSemen: TcxGroupBox;
    lSexedSemen: TLabel;
    cbSexedSemen: TRxDBLookupCombo;
    btnVetLinkDrugs: TRxSpeedButton;
    ToolButton10: TToolButton;
    StyleRepository: TcxStyleRepository;
    btnShowDefaultTreatmentTemplates: TRxSpeedButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    btnSortAnimals: TRxSpeedButton;
    pmSortAnimalGrid: TPopupMenu;
    pmiSortByAnimalNo: TMenuItem;
    pmiSortByNatID: TMenuItem;
    rgRecheck: TDBRadioGroup;
    tsToBeCulled: TTabSheet;
    lToBeCulledDate: TcxLabel;
    lToBeCulledDesc: TcxLabel;
    deToBeCulledDesc: TcxDBTextEdit;
    deToBeCulledDate: TcxDBDateEdit;
    btnDeleteTestDates: TRxSpeedButton;
    ToolButton13: TToolButton;
    TempAnimalsPWeight: TFloatField;
    lDefaultDaysInCalfInfo: TLabel;
    tsMastitis: TTabSheet;
    pAreaTreated: TPanel;
    lAreaTreated: TcxLabel;
    dbcbAreaTreatedFL: TcxDBCheckBox;
    dbcbAreaTreatedFR: TcxDBCheckBox;
    dbcbAreaTreatedBL: TcxDBCheckBox;
    dbcbAreaTreatedBR: TcxDBCheckBox;
    tsLameness: TTabSheet;
    lLameTreatment: TcxLabel;
    dblcLameTreatment: TRxDBLookupCombo;
    gbApplicRate: TcxGroupBox;
    lApplicRate: TLabel;
    lRateOfApplic: TLabel;
    rgUseWeightAsApplicRate: TcxRadioGroup;
    RateOfApplic: TcxDBCurrencyEdit;
    pDaysToRemind: TPanel;
    lNoDaysToRemind: TcxLabel;
    dbseDaysToRemind: TcxDBSpinEdit;
    lReportID: TcxLabel;
    dlcbReportID: TRxDBLookupCombo;
    btnLookupBatchQtys: TcxButton;
    DrugPurchActs: TActionList;
    actSelectBatchNo: TAction;
    actCancelSelBatch: TAction;
    pDupGrpsPerAnimals: TPanel;
    lDupGrpsPerAnimals: TcxLabel;
    TempAnimalsSearchNatId: TStringField;
    TempAnimalsLocateNatID: TStringField;
    SearchBevel: TBevel;
    btnPartNatIDSearch: TcxButton;
    actSearchByParNatId: TAction;
    imgSearchInfo: TcxImage;
    HintStyleController: TcxHintStyleController;
    HintTimer: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure eAnimalNoChange(Sender: TObject);
    procedure AnimalGridDblClick(Sender: TObject);
    procedure ObservedByCloseUp(Sender: TObject);
    procedure TempAnimalsNewRecord(DataSet: TDataSet);
    procedure sbHelpClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure WriteEventsAfterPost(DataSet: TDataSet);
    procedure WriteEventsNewRecord(DataSet: TDataSet);
    procedure pgEventsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgEventsChange(Sender: TObject);
    procedure WriteOtherBeforePost(DataSet: TDataSet);
    procedure WriteOtherAfterPost(DataSet: TDataSet);
    procedure WriteOtherBeforeEdit(DataSet: TDataSet);
    procedure AdMinByCloseUp(Sender: TObject);
    procedure ApplicMethodCloseUp(Sender: TObject);
    procedure ICBFCodeCloseUp(Sender: TObject);
    procedure sbDeSelectAllClick(Sender: TObject);
    procedure TempEventsYesNoValidate(Sender: TField);
    procedure UpdateAnimals(Sender : TObject);
    procedure OnEnteringControl(Sender: TObject);
    procedure ServiceTypesCloseUp(Sender: TObject);
    procedure ChangedItem(Sender: TObject);
    procedure dbpInfoProgress(Sender: TObject; var AbortQuery: Boolean);
    procedure dbdBullInChange(Sender: TObject);
    procedure dbdBullOutExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AnimalGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FarmCodeCloseUp(Sender: TObject);
    procedure DrugBatchNo2CloseUp(Sender: TObject; Accept: Boolean);
    procedure dblMoveToCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TempAnimalsFieldOnChange(Sender: TField);
    procedure DrugBatchNoPropertiesInitPopup(Sender: TObject);
    procedure DrugBatchNoPropertiesCloseUp(Sender: TObject);
    procedure teAnimalNoPropertiesChange(Sender: TObject);
    procedure teNatIDNumPropertiesChange(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure TempAnimalsBeforePost(DataSet: TDataSet);
    procedure btnSetupFertilityProgramsClick(Sender: TObject);
    procedure btnReport1Click(Sender: TObject);
    procedure btnReport2Click(Sender: TObject);
    procedure mdMultiDrugBeforeInsert(DataSet: TDataSet);
    procedure btnRemoveMultiDrugClick(Sender: TObject);
    procedure btnAddMultiDrugClick(Sender: TObject);
    procedure mdMultiDrugDrugPurchIDChange(Sender: TField);
    procedure mdMultiDrugDrugUsedChange(Sender: TField);
    procedure MultiDrugGridDBTableViewBatchNoPropertiesInitPopup(
      Sender: TObject);
    procedure TempAnimalsValueChange(Sender: TField);
    procedure TempEventsValueChange(Sender: TField);
    procedure dbcServBullExit(Sender: TObject);
    procedure InseminatorCloseUp(Sender: TObject);
    procedure btnShowMultiTreatClick(Sender: TObject);
    procedure btnMedicineSetupClick(Sender: TObject);
    procedure btnMultiDrugClick(Sender: TObject);
    procedure btnBlockDeletionClick(Sender: TObject);
    procedure btnReport3Click(Sender: TObject);
    procedure dlcbReportIDCloseUp(Sender: TObject);
    procedure btnReport4Click(Sender: TObject);
    procedure dbcbDrugBatchNoPropertiesCloseUp(Sender: TObject);
    procedure mdMultiDrugDrugBatchNoChange(Sender: TField);
    procedure dbcbCalfTypePropertiesCloseUp(Sender: TObject);
    procedure mdMultiDrugReportInDaysChange(Sender: TField);
    procedure dbseDaysToRemindPropertiesChange(Sender: TObject);
    procedure tsFertilityCheckShow(Sender: TObject);
    procedure HeatsShow(Sender: TObject);
    procedure ServiceShow(Sender: TObject);
    procedure PregDiagShow(Sender: TObject);
    procedure HealthShow(Sender: TObject);
    procedure tsHerdTestShow(Sender: TObject);
    procedure WeighingShow(Sender: TObject);
    procedure tsConditionScoreShow(Sender: TObject);
    procedure tsMilkTemperamentShow(Sender: TObject);
    procedure tsTempMovementShow(Sender: TObject);
    procedure PrescribedByCloseUp(Sender: TObject);
    procedure dbseDaysToRemindPropertiesEditValueChanged(Sender: TObject);
    procedure RateOfApplicPropertiesChange(Sender: TObject);
    procedure DrugUsedPropertiesCloseUp(Sender: TObject);
    procedure TempAnimalsSelectedChange(Sender: TField);
    procedure TempAnimalsAfterCancel(DataSet: TDataSet);
    procedure dbcbTestDiseasePropertiesChange(Sender: TObject);
    procedure TempAnimalsAfterPost(DataSet: TDataSet);
    procedure AnimalGridColExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnVetLinkDrugsClick(Sender: TObject);
    procedure mdMultiDrugNoDaysChange(Sender: TField);
    procedure btnShowDefaultTreatmentTemplatesClick(Sender: TObject);
    procedure btnSortAnimalsClick(Sender: TObject);
    procedure pmiSortByAnimalNoClick(Sender: TObject);
    procedure pmiSortByNatIDClick(Sender: TObject);
    procedure MultiDrugGridDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnDeleteTestDatesClick(Sender: TObject);
    procedure DaysInCalfEnter(Sender: TObject);
    procedure DaysInCalfExit(Sender: TObject);
    procedure AnimalGridCellClick(Column: TColumnEh);
    procedure AnimalGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure rgUseWeightAsApplicRatePropertiesChange(Sender: TObject);
    procedure actSelectBatchNoExecute(Sender: TObject);
    procedure actCancelSelBatchExecute(Sender: TObject);
    procedure actSearchByParNatIdExecute(Sender: TObject);
    procedure imgSearchInfoClick(Sender: TObject);
    procedure HintTimerTimer(Sender: TObject);
    procedure teAnimalNoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure teNatIDNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FBreedingDataHelper : TBreedingDataHelper;
    procedure ShowHideWeightColumn(AShow: Boolean);
    procedure GetTempAnimalsWeighingInfo;
    function HealthEventRecCreated (AEventType: TEventType; ADataSet: TDataSet) : Boolean;
    function CreatePregDiagEventRec : Boolean;
    procedure UpdateGridFromSavedPregDiagEvents;
    procedure UpdateTempAnimalPregDiagInfo(ADataSet : TDataSet);
    procedure UpdateTempAnimalsServiceInfo(ADataSet : TDataSet);
    procedure RemoveTempAnimals_PregDiag_BeforeCalved;
    procedure CreateTempWeighInfoDataSets;
    procedure CreateTempPurchInfoDataSets;
    procedure ChangeEventDesc_ApplicLabelByDrug;
    function DBGridColumnByName(AGrid: TDBGridEH; const AName: String): TColumnEH;
    procedure ChangeTotalApplicRateAmtTitleCaption;
    procedure HideHintStyleController;
    procedure CreateHintStyleController;
    procedure SelectDeSelectAnimal;
  private
    { Private declarations }
    ItemChanged,
    AllAnimalsSelected : Boolean;

    // Field for Bulling
    iBullCode : TIntegerField;
    iObservedBy : TIntegerField;
    sBullCode : TStringField;
    sObservedByName : TStringField;

    // Field for Service
    iServiceBull : TIntegerField;
    iServiceType : TIntegerField;
    fStrawsUsed  : TFloatField;
    iTechnician  : TIntegerField;
    iSexedSemen  : TIntegerField;
    sServiceBull : TStringField;
    sServiceType : TStringField;
    sTechnician  : TStringField;
    sSexedSemen  : TStringField;

    // Field for PregDiag
    iDaysInCalf : TIntegerField;
    iNoCalves   : TIntegerField;
    sPregnancyStatus : TStringField;
    sCalfType : TStringField;
    bRepeatPregDiag : TBooleanField;
    sRecheck : TStringField;

    // Field for Health Records
    iDrugUsed,
    iHealthCode,
    iADminby,
    iApplicMethod,
    iVetPresc,
    iGroupID,
    iTreatmentUsed  : TIntegerField;
    dMeatWDRLDate,
    dMilkWDRLDate,
    dOrganicMeatWDRLDate,
    dOrganicMilkWDRLDate : TDateTimeField;
    sDrugUsed,
    sHealthCode,
    sAdminby,
    sApplicMethod,
    sFarmCode,
    sVetPresc,
    sGroupName,
    sTreatmentUsed  : TStringField; // SP 30/07/2003
    fRateOfApplic,
    fLastWeighingWeight,
    fNoTimes,
    fNoDays,
    fTotalApplicRate  : TFloatField;
    sDrugBatchNo : TStringField;
    iDrugPurchID,
    iFarmCode,  // SP 30/12/2003
    iReportInDays  : TIntegerField;
    iReportID : TIntegerField;
    sReportID : TStringField;
    bManualComment,
    bAreaTreatedFL,
    bAreaTreatedFR,
    bAreaTreatedBL,
    bAreaTreatedBR : TBooleanField;

    iDamID, iSireID : TIntegerField;

    dLastCalveDate, dLastServiceDate : TDateTimeField;
    iNumOfServes : TIntegerField;
    sLastServiceBull : TStringField;
    bPrevPregDiagEvent : TBooleanField;

    fConditionScore : TFloatField;
    iAssociatedEventType : TIntegerField;
    sAssociatedEventType : TStringField;
    //   09/01/12 [V5.0 R3.3] /MK Additional Feature - New Fields For Tesco Scoring Event/
    fMobility,
    fCleanliness : TFloatField;
    bAbrasions : TBooleanField;

    // Field for Weighing Records
    fWeight,
    fLastWeight,
    fWeightGain,
    fWeightGainPerDay : TFloatField;
    dLastWeighDate : TDateTimeField;

    // CurrentField - This is set when the user focus on a control to be
    // the FieldName, this is usedthen to copy the info from the Form on
    // top to the Grid for all selected animals
    CurrentField : String;
    SavingInfo : Boolean;
    CountryOfReg : TCountry;

    iMovedTo : TIntegerField;
    sMovedTo : TStringField;

    iMilkTempScore : TIntegerField;
    iMilkTempScoreDesc : TStringField;

    FSelectAll : Boolean;
    FDataLoading : Boolean;
    FCountSelectedRecords : Integer;

    iDaysSinceService : TIntegerField;

    iFertilityCheck_Status : TIntegerField;
    sFertilityCheck_StatusDesc : TStringField;
    iFertilityCheck_Action : TIntegerField;
    sFertilityCheck_ActionDesc : TStringField;
    iFertilityCheck_FertProgram : TIntegerField;
    sFertilityCheck_FertProgramDesc : TStringField;

    sTestDisease : TStringField;
    sVaccDisease : TStringField;
    iJohnesResult : TIntegerField;
    sJohnesResult : TStringField;

    FLastDrugUsed : Integer; // used to store the drug used for each tempanimals record.

    FServiceTypeAutoSet : Boolean;

    bShowMultiTreatmentOptions,
    bShowMultiDrugs : Boolean;

    FAllTabsVisbile : Boolean;

    FHerdTestType : THerdTestType;

    FManualBatchNoQuery : TQuery;

    FBatchNoPickListDrugID : Integer;

    FFirstEntryOfEvent : Boolean;

    FPregDiagRepeatCount : Integer;

    FManualHealthComment : Boolean;

    FDrugBatchQty_EmptyCheck : Boolean;

    FDrugPurchID : Integer;

    FPregDiagEventCount : Integer;

    FHerdType : THerdType;

    FMultiDrugButton : TMultiDrugButtonType;

    FMultDrugOrigNoDays : Integer;

    FApplicRateByWeightAllowed : Boolean;

    FUpdateApplicRateByWeightMsgShown : Boolean;

    FSelectionType : TSelectionType;

    FHealthRec : THealthEvent;

    FPregDiagRec : TPregDiagEvent;

    FWeighInfoQuery : TQuery;

    FWeighingEvents : TTable;

    FPurchaseEvents : TTable;

    FPurchInfoQuery : TQuery;

    FUseApplicRateByKg : Boolean;

    FDupGrpsPerAnimals : TQuery;

    FPartNatIdSearchFound : Boolean;

    FPartNatIdSearchSelectedRecNo : Integer;

    procedure CreateTempTable;
    procedure CopyDetails;
    procedure ClearDetails;
    procedure CountSelectedRecords;
    procedure WriteTheOtherEvent(CID: Integer);
    procedure AddFields(TableToAddTo: TTable);
    procedure BullingSetUp;
    procedure ServiceSetUp;
    procedure HealthSetUp;
    procedure WeightSetUp;
    procedure PregDiagSetUp;
    procedure ConditionScoreSetup;
    procedure FertilityCheckSetup;
    procedure TempMovementSetup;
    procedure HerdTestSetup;
    procedure MilkTemperamentSetup;
    procedure ToBeCulledSetup;

    procedure DeActiveAllOtherPages;
    procedure SetDataSource(Sender: TTabSheet; DataSourceName: TDataSource);
    procedure CloseAndFree;
    procedure SelectAll;
    procedure DeSelectAll;
    procedure EnableDisableControls(Enabled: Boolean);
    procedure LookupBatchNo;
    procedure GetDrugExpiryDate;
    procedure SearchForBatchNo;
    procedure GetGroupInfo;
    procedure CheckForInBreeding;
    procedure CheckValidFertProgramSelected;
    procedure ResetGridCols;
    procedure LoadBreedingData(ADataset : TDataset; ACalvingData, AServiceData : Boolean);
    procedure TempEventsPregnancyStatusOnChange(Sender : TField);
    procedure TempEventsPregnancyNoCalvesOnChange(Sender : TField);
    procedure TempEventsPregnancyDaysInCalfOnChange(Sender : TField);

    procedure TempEventsHerdTestDiseaseOnChange(Sender : TField);
    procedure TempEventsVaccinationDiseaseOnChange(Sender : TField);

    procedure TempAnimalsDrugBatchNoOnChange(Sender : TField);
    procedure TempAnimalsRateOfApplicOnChange(Sender : TField);

    procedure TempAnimalsWeightOnChange(Sender : TField);

    procedure UpdateReportPanel;

    procedure WriteHealthEvent( AEventType : TEventType);

    procedure SetupMultiOrSingleDrugEntry;
    procedure ShowMultiTreatmentOptions;
    procedure LoadLastYearsMilkTempScore;
    procedure LoadPlannedBullsAsServiceBull;
    //   10/10/12 [V5.1 R0.3] /MK Bug Fix - Added Procedure UpdateGrid to update the grid if the user enters
    //                                      a value into the Animal Grid and then clicks Save - Weighings - Martin Brosnan.
    procedure UpdateGrid;

    procedure CheckActiveMedicines;
    function IsValidatorSelected(AValidator: String): Boolean;
    procedure FocusControl(AControl: TWinControl);

    function GetDrugPurchIdByBatchNumber(ABatchNo : string) : Integer;

    procedure CreateJohnesEvent ( AAnimalID, ALactNo, AHerdID, AResult : Integer;
       AEventDate : TDateTime );

    function GetTotalApplicRate ( const AAnimalID : Integer = 0 ) : Double;

    procedure SetupMultiDrugGrid(AButtonType : TMultiDrugButtonType);
    function CheckForDrugTreatmentSave ( AFieldName : String) : Boolean;

    procedure CheckSelectedAnimalsSoldBeforeEventDate(var AAbortSave : Boolean);

    procedure SortAnimalGrid(AIndexName : String);

    function GetAllAnimalsSelected : Boolean;

  public
    { Public declarations }
  end;

procedure ShowTheForm(EType: TEventType; const ASelectAll, APromptBackup : Boolean;
   const ASelectionType : TSelectionType = stNoSelection);

implementation
uses
   uMedicineSetUp,
   uMediAdminSetUp,
   uGenLookSetUp,
   Def,
   uMovedBy,
   KDbRoutines, uAnimalCart, uDataBackup, KRoutines,
   uSetupFertPrograms, uHeatServiceFilt, uFertilityCheckReport,
   HealthFilterU, uWeighingFilt, Drawing, uFertTreatmentsReview,
   uConditionScoreReport, uHerdStatistics, SCCAnalysis, uFertilityTreatmentsReport;

const
   cCopyingDetails = 'Copy Details to Selected Animal(s)';
   cLoadingAnimals = 'Loading Selected Animal(s) - Please wait';
   cNoLoaded       = ' Animal(s) Loaded';
   cNoSelection    = 'No Selection';

   // FieldNames
   fn_LastServiceDate = 'LastServiceDate';
   fn_DaysSinceService = 'DaysSinceService';
   fn_LastCalveDate = 'LastCalveDate';
   fn_EventDate = 'EventDate';

var
   fEventsByGroup: TfEventsByGroup;

{$R *.DFM}

procedure ShowTheForm(EType: TEventType; const ASelectAll, APromptBackup : Boolean;
   const ASelectionType : TSelectionType = stNoSelection);
begin

{
    if ( APromptBackup and ( MessageDLG('When using multiple events facility, quite often substantial changes'+cCRLF+
                                        'are made to your data which can be difficult to undo. A backup of the data'+cCRLF+
                                        'is recommended in case a mistake is made while recording events.'+cCRLFx2+
                                        'Do you want to backup your data before using multiple events?',
                                        mtWarning,[mbYes,mbNo],0) = mrYes ) ) then
       TfmDataBackup.execute(daBackup);
}

   Application.CreateForm(TfEventsByGroup, fEventsByGroup);
   try
      with fEventsByGroup do
         begin
            FSelectAll := FALSE;

            lGridFilter.Caption := '';
            pgEvents.Pages[16].Caption := cNoSelection;
            pgEvents.ActivePage := NoSelection;
            WinData.EventType := EType;
            WriteEvents.Open;

            //   07/07/17 [V5.6 R9.1] /MK Change - Only show administered by in use records.
            HerdLookup.QueryAdminBy.SQL.Clear;
            HerdLookup.QueryAdminBy.SQL.Add('SELECT *');
            HerdLookup.QueryAdminBy.SQL.Add('FROM MedAdmin');
            HerdLookup.QueryAdminBy.SQL.Add('WHERE (InUse = True)');
            HerdLookup.QueryAdminBy.SQL.Add('ORDER BY Name');
            HerdLookup.QueryAdminBy.Open;

            //   07/07/17 [V5.6 R9.1] /MK Change - Only show prescribed by in use records.
            HerdLookup.QueryPrescribedBy.SQL.Clear;
            HerdLookup.QueryPrescribedBy.SQL.Add('SELECT *');
            HerdLookup.QueryPrescribedBy.SQL.Add('FROM MedAdmin');
            HerdLookup.QueryPrescribedBy.SQL.Add('WHERE (IsVet = True)');
            HerdLookup.QueryPrescribedBy.SQL.Add('AND   (InUse = True)');
            HerdLookup.QueryPrescribedBy.SQL.Add('ORDER BY Name');
            HerdLookup.QueryPrescribedBy.Open;

            if ( ASelectionType = stNoSelection ) then
               begin
                  if ( not(AnimalCart.IsEmpty) ) then
                     FSelectionType := stCart
                  else if ( WinData.FilteredAnimals.RecordCount > 0 ) then
                     FSelectionType := stFilter;
               end
            else
               FSelectionType := ASelectionType;

            ShowModal;
         end;
   finally
      with fEventsByGroup do
         begin
            CloseAndFree;
            WriteEvents.Close;
            WriteOther.Close;
            Free;
         end;
   end;

end;

procedure TfEventsByGroup.CloseAndFree;
var
 i : Integer;
begin
   try
      try
         EnableDisableControls(FALSE);

         TempAnimals.Close;
         TempEvents.Close;

         //   09/01/20 [V5.9 R1.6] /MK Bug Fix - Need to close the FDupGrpsPerAnimal here as its tied to the Animal Grid - only caused issue for Fergal & Sylvia Daly.
         FDupGrpsPerAnimals.Close;

         if TempAnimals.Exists then
            TempAnimals.DeleteTable;
         if TempEvents.Exists then
            TempEvents.DeleteTable;
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError(e.Message);
            end;
      end;
   finally
      EnableDisableControls(TRUE);
   end;

   case WinData.EventType of
      TPlannedBull,
      TBulling : begin
                    iBullCode.Free;
                    iObservedBy.Free;
                    sBullCode.Free;

                    sObservedByName.Free;

//                    iLactNo.Free;
                    iDamID.Free;
                    iSireID.Free;
                    dLastCalveDate.Free;
                    dLastServiceDate.Free;
                    iNumOfServes.Free;
                    sLastServiceBull.Free;
                 end;
      TService : begin
                    iServiceBull.Free;
                    iServiceType.Free;
                    SafeFreeAndNil(fStrawsUsed);
                    iTechnician.Free;
                    iSexedSemen.Free;

                    sServiceType.Free;
                    sServiceBull.Free;
                    sTechnician.Free;
                    sSexedSemen.Free;
//                    iLactNo.Free;

                    iDamID.Free;
                    iSireID.Free;
                    dLastCalveDate.Free;
                    dLastServiceDate.Free;
                    iNumOfServes.Free;
                    sLastServiceBull.Free;
                    bPrevPregDiagEvent.Free;
                 end;
      TLameness,
      TMastitis,
      THerdVaccination,
      TDryOff,
      THealth  : begin
                    //if sBatchNo <> nil then
                       //sBatchNo.Free; { SP 04/10/2002 }
                    if sDrugBatchNo <> nil then
                       sDrugBatchNo.Free;
                    if iDrugPurchID <> nil then
                       iDrugPurchID.Free;
                    if iFarmCode <> nil then
                       iFarmCode.Free;
                    if iDrugUsed <> nil then
                       iDrugUsed.Free;
                    if iHealthCode <> nil then
                       iHealthCode.Free;
                    if iAdminBy <> nil then
                       iAdminBy.Free;
                    if iApplicMethod <> nil then
                       iApplicMethod.Free;
                    if iTreatmentUsed <> nil then
                       iTreatmentUsed.Free;
                    if sDrugUsed <> nil then
                       sDrugUsed.Free;
                    if sHealthCode <> nil then
                       sHealthCode.Free;
                    if sFarmCode <> nil then
                       sFarmCode.Free;
                    if sAdminBy <> nil then
                       sAdminBy.Free;
                    if sApplicMethod <> nil then
                       sApplicMethod.Free;
                    if sTreatmentUsed <> nil then
                       sTreatmentUsed.Free;

                    if fRateOfApplic <> nil then
                       fRateOfApplic.Free;
                    if fNoTimes <> nil then
                       fNoTimes.Free;
                    if fNoDays <> nil then
                       fNoDays.Free;
                    if fLastWeighingWeight <> nil then
                       fLastWeighingWeight.Free;
                    if fTotalApplicRate <> nil then
                       fTotalApplicRate.Free;

                    if iVetPresc <> nil then
                       iVetPresc.Free;
                    if sVetPresc <> nil then
                       sVetPresc.Free;

                    if iGroupID <> nil then
                       iGroupID.Free;
                    if sGroupName <> nil then
                       sGroupName.Free;

                    if iReportInDays <> nil then
                       iReportInDays.Free;

                    if sVaccDisease <> nil then
                       sVaccDisease.Free;

                    if iReportID <> nil then
                       iReportID.Free;

                    if sReportID <> nil then
                       sReportID.Free;

                    if bManualComment <> nil then
                       bManualComment.Free;

                    if bAreaTreatedFL <> nil then
                       bAreaTreatedFL.Free;

                    if bAreaTreatedFR <> nil then
                       bAreaTreatedFR.Free;

                    if bAreaTreatedBL <> nil then
                       bAreaTreatedBL.Free;

                    if bAreaTreatedBR <> nil then
                       bAreaTreatedBR.Free;

                    SafeFreeAndNil(dMeatWDRLDate);
                    SafeFreeAndNil(dMilkWDRLDate);

                    SafeFreeAndNil(dOrganicMeatWDRLDate);
                    SafeFreeAndNil(dOrganicMilkWDRLDate);
                 end;
      TWeight  : begin
                    fWeight.Free;
                    fLastWeight.Free;
                    fWeightGain.Free;
                    fWeightGainPerDay.Free;
                    dLastWeighDate.Free;
                 end;
      TPregDiag: begin
                    iNoCalves.Free;
                    iDaysInCalf.Free;
                    sPregnancyStatus.Free;
                    dLastServiceDate.Free;
                    iDaysSinceService.Free;
                    sCalfType.Free;
                    bRepeatPregDiag.Free;
                    sRecheck.Free;
                 end;
      TMovement: begin
                    iMovedTo.Free;
                    sMovedTo.Free;
                 end;
      TConditionScore :
         begin
            fConditionScore.Free;
            iAssociatedEventType.Free;
            sAssociatedEventType.Free;
            //   16/01/12 [V5.0 R3.4] /MK Bug Fix - Fix If Changing Between Tabs With New Condition Score Fields For UK Herds.
            fMobility.Free;
            fCleanliness.Free;
            bAbrasions.Free;
            HerdLookup.mdConditionScoreAssociatedEvents.Active := False;
         end;
      TFertilityCheck :
         begin
            SafeFreeAndNil(iFertilityCheck_Status);
            SafeFreeAndNil(sFertilityCheck_StatusDesc);
            SafeFreeAndNil(iFertilityCheck_Action);
            SafeFreeAndNil(sFertilityCheck_ActionDesc);
            SafeFreeAndNil(iFertilityCheck_FertProgram);
            SafeFreeAndNil(sFertilityCheck_FertProgramDesc);
         end;
      TMilkTemperament :
         begin
            iMilkTempScore.Free;
            iMilkTempScoreDesc.Free;
         end;
      THerdTest :
         begin
            sTestDisease.Free;
            iJohnesResult.Free;
            sJohnesResult.Free;
         end;
   end;
  if WinData.qDrugBatchNo.Active then
     WinData.qDrugBatchNo.Active := False;
end;

procedure TfEventsByGroup.CountSelectedRecords;
begin
   // Set the Filter if Breeding Events then females only
   TotalSelected.Text := '';
   with CountSelected do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT COUNT(AnimalID) CID FROM ' + TempAnimals.TableName);
         SQL.Add('WHERE (Selected=TRUE)');
         Open;
      end;
   FCountSelectedRecords := CountSelected.FieldByName('CID').AsInteger;
   TotalSelected.Text := IntToStr(FCountSelectedRecords);
end;

// Set up the Health Record  fields
procedure TfEventsByGroup.HealthSetUp;
var
   i : Integer;
begin
   //   25/02/14 [V5.2 R8.5] /MK Bug Fix - Code to set the LookupComboBox Lookup Source as this value was being blanked
   //                                      out after a Delphi crash.
   ICBFCode.LookupSource := HerdLookup.dsICBFHealthCodes;
   FarmCode.LookupSource := HerdLookup.dsNonICBFHealthCodes;
   ApplicMethod.LookupSource := WinData.dsApplicMethod;
   AdMinBy.LookupSource := HerdLookup.LookupAdminBy;
   PrescribedBy.LookupSource := HerdLookup.LookupPrescribedBy;
   DrugUsed.Properties.ListSource := HerdLookup.dsDrugList;
   dblcbVaccineType.Properties.ListSource := HerdLookup.dsHerdVaccineType;
   dlcbReportID.LookupSource := HerdLookup.dsLookupHealthReportDesc;
   dblcLameTreatment.LookupSource := HerdLookup.dsLookupTreatmentUsed;
   dbseDaysToRemind.DataBinding.DataSource := dsTempEvents;
   dlcbReportID.DataSource := dsTempEvents;

   {
   //   25/02/14 [V5.2 R8.5] /MK Bug Fix - Code to set the LookupComboBoxList source as this value was being blanked
   //                                      out after a Delphi crash.
   with MultiDrugGridDBTableView do
      begin
         for i := 0 to ColumnCount-1 do
            begin
               Columns[i].PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Columns[i].Properties) do
                  begin
                     if Columns[i].DataBinding.FieldName = 'ICBFHealthCode' then
                        ListSource := HerdLookup.dsICBFHealthCodes
                     else if Columns[i].DataBinding.FieldName = 'FarmHealthCode' then
                        ListSource := HerdLookup.dsNonICBFHealthCodes
                     else if Columns[i].DataBinding.FieldName = 'ApplicMethod' then
                        ListSource := WinData.dsApplicMethod
                     else if Columns[i].DataBinding.FieldName = 'PrescribedBy' then
                        ListSource := WinData.dsMediAdmin
                     else if Columns[i].DataBinding.FieldName = 'VetPresc' then
                        ListSource := WinData.dsLookupMediAdmin;
                  end;
            end;
      end;
   }

   iDrugUsed := TIntegerField.Create(TempAnimals);
   with iDrugUsed do
      begin
         FieldName := 'DrugUsed';
         DataSet := TempAnimals;
         OnChange := TempAnimalsValueChange;
      end;

   iHealthCode := TIntegerField.Create(TempAnimals);
   with iHealthCode do
      begin
         FieldName := 'HealthCode';
         DataSet := TempAnimals;
      end;

   iFarmCode := TIntegerField.Create(TempAnimals);
   with iFarmCode do
      begin
         FieldName := 'FarmCode';
         DataSet := TempAnimals;
      end;

   fRateOfApplic := TFloatField.Create(TempAnimals);
   with fRateOfApplic do
      begin
         FieldName := 'RateOfApplic';
         DataSet := TempAnimals;
         OnChange := TempAnimalsRateOfApplicOnChange;
      end;

   fNoTimes := TFloatField.Create(TempAnimals);
   with fNoTimes do
      begin
         FieldName := 'NoTimes';
         DataSet := TempAnimals;
      end;

   fNoDays := TFloatField.Create(TempAnimals);
   with fNoDays do
      begin
         FieldName := 'NoDays';
         DataSet := TempAnimals;
         OnChange := TempAnimalsValueChange;
      end;

   fLastWeighingWeight := TFloatField.Create(TempAnimals);
   with fLastWeighingWeight do
      begin
         FieldName := 'LastWeight';
         DataSet := TempAnimals;
      end;

   fTotalApplicRate := TFloatField.Create(TempAnimals);
   with fTotalApplicRate do
      begin
         FieldName := 'TotalApplicRate';
         DataSet := TempAnimals;
      end;

   iAdminBy := TIntegerField.Create(TempAnimals);
   with iAdminBy do
      begin
         FieldName := 'AdminBy';
         DataSet := TempAnimals;
      end;

   iApplicMethod := TIntegerField.Create(TempAnimals);
   with iApplicMethod do
      begin
         FieldName := 'ApplicMethod';
         DataSet := TempAnimals;
      end;

   iVetPresc := TIntegerField.Create(TempAnimals);
   with iVetPresc do
      begin
         FieldName := 'VetPresc';
         DataSet := TempAnimals;
      end;

   iGroupID := TIntegerField.Create(TempAnimals);
   with iGroupID do
      begin
         FieldName := 'GroupID';
         DataSet := TempAnimals;
      end;

   dMeatWDRLDate := TDateTimeField.Create(TempAnimals);
   with dMeatWDRLDate do
      begin
         FieldName := 'MeatWDRLDate';
         DataSet := TempAnimals;
      end;

   dMilkWDRLDate := TDateTimeField.Create(TempAnimals);
   with dMilkWDRLDate do
      begin
         FieldName := 'MilkWDRLDate';
         DataSet := TempAnimals;
      end;

   dOrganicMeatWDRLDate := TDateTimeField.Create(TempAnimals);
   with dOrganicMeatWDRLDate do
      begin
         FieldName := 'OrganicMeatWDRLDate';
         DataSet := TempAnimals;
      end;

   dOrganicMilkWDRLDate := TDateTimeField.Create(TempAnimals);
   with dOrganicMilkWDRLDate do
      begin
         FieldName := 'OrganicMilkWDRLDate';
         DataSet := TempAnimals;
      end;

   sDrugUsed := TStringField.Create(TempAnimals);
   with sDrugUsed do
      begin
         FieldName := 'DrugName';
         LookUpDataSet := HerdLookup.qDrugList;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Name';
         KeyFields := 'DrugUsed';
         LookUp    := TRUE;
         DataSet   := TempAnimals;
      end;

   sHealthCode := TStringField.Create(TempAnimals);
   with sHealthCode do
      begin
         FieldName := 'HealthCodeName';
         if CountryOfReg = Ireland then
            LookUpDataSet := HerdLookup.qICBFHealthCodes
         else
            LookUpDataSet := WinData.qHealthCodes;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'HealthCode';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   sAdminby := TStringField.Create(TempAnimals);
   with sAdminby do
      begin
         FieldName := 'AdminByName';
         LookUpDataSet := HerdLookup.QueryAdminBy;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Name';
         KeyFields := 'AdminBy';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   sApplicMethod := TStringField.Create(TempAnimals);
   with sApplicMethod do
      begin
         FieldName := 'ApplicMethodName';
         LookUpDataSet := WinData.qApplicMethod;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'ApplicMethod';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   { SP 18/11/2002 }
   iDrugPurchID := TIntegerField.Create(TempAnimals);
   with iDrugPurchID do
      begin
         FieldName := 'DrugPurchID';
         DataSet := TempAnimals;
      end;
   { SP 18/11/2002 }


   { SP 18/11/2002 }
   {
   sBatchNo := TStringField.Create(TempAnimals);
   with sBatchNo do
      begin
         FieldName := 'BatchNo';
         LookUpDataSet := WinData.qDrugBatchNo;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'BatchNo';
         KeyFields := 'DrugPurchID';
         LookUp    := TRUE;
         DataSet   := TempAnimals;
      end;
   }
   { SP 18/11/2002 }

   sDrugBatchNo := TStringField.Create(TempAnimals);
   with sDrugBatchNo do
      begin
         FieldName := 'DrugBatchNo';
         DataSet := TempAnimals;
         OnChange := TempAnimalsDrugBatchNoOnChange;
      end;

   { SP 18/11/2002 }
   sFarmCode := TStringField.Create(TempAnimals);
   with sFarmCode do
      begin
         FieldName := 'FarmCodeName';
         LookUpDataSet := HerdLookup.qNonICBFHealthCodes;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'FarmCode';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;
   { SP 18/11/2002 }

   sVetPresc := TStringField.Create(TempAnimals);
   with sVetPresc do
      begin
         FieldName := 'sPrescribedBy';
         LookUpDataSet := HerdLookup.QueryPrescribedBy;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Name';
         KeyFields := 'VetPresc';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   sGroupName := TStringField.Create(TempAnimals);
   with sGroupName do
      begin
         FieldName := 'sGroupName';
         LookUpDataSet := WinData.GroupManager.GroupListDatasource.DataSet;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'GroupID';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   iReportInDays := TIntegerField.Create(TempAnimals);
   with iReportInDays do
      begin
         FieldName := 'ReportInDays';
         DataSet := TempAnimals;
      end;

   sVaccDisease := TStringField.Create(TempAnimals);
   with sVaccDisease do
      begin
         FieldName := 'Disease';
         DataSet := TempAnimals;
         OnChange := TempEventsVaccinationDiseaseOnChange;
      end;

   iReportID := TIntegerField.Create(TempAnimals);
   with iReportID do
      begin
         FieldName := 'ReportID';
         DataSet := TempAnimals;
      end;

   sReportID := TStringField.Create(TempAnimals);
   with sReportID do
      begin
         FieldName := 'ReportIDDesc';
         LookUpDataSet := HerdLookup.LookupHealthReportDesc;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'ReportID';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   bManualComment := TBooleanField.Create(TempAnimals);
   with bManualComment do
      begin
         FieldName := 'ManualComment';
         DataSet := TempAnimals;
      end;

   bAreaTreatedFL := TBooleanField.Create(TempAnimals);
   with bAreaTreatedFL do
      begin
         FieldName := 'AreaTreatedFL';
         DataSet := TempAnimals;
      end;

   bAreaTreatedFR := TBooleanField.Create(TempAnimals);
   with bAreaTreatedFR do
      begin
         FieldName := 'AreaTreatedFR';
         DataSet := TempAnimals;
      end;

   bAreaTreatedBL := TBooleanField.Create(TempAnimals);
   with bAreaTreatedBL do
      begin
         FieldName := 'AreaTreatedBL';
         DataSet := TempAnimals;
      end;

   bAreaTreatedBR := TBooleanField.Create(TempAnimals);
   with bAreaTreatedBR do
      begin
         FieldName := 'AreaTreatedBR';
         DataSet := TempAnimals;
      end;

   iTreatmentUsed := TIntegerField.Create(TempAnimals);
   with iTreatmentUsed do
      begin
         FieldName := 'TreatmentUsed';
         DataSet := TempAnimals;
      end;

   sTreatmentUsed := TStringField.Create(TempAnimals);
   with sTreatmentUsed do
      begin
         FieldName := 'TreatmentUsedName';
         LookUpDataSet := HerdLookup.qLookupTreatmentUsed;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'TreatmentUsed';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   if ( WinData.EventType in [TMastitis, TLameness] ) then
      begin
         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'AreaTreatedFL';
               Title.Caption := 'FL';
               Width := AnimalGrid.Columns[0].Width;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'AreaTreatedFR';
               Title.Caption := 'FR';
               Width := AnimalGrid.Columns[0].Width;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'AreaTreatedBL';
               Title.Caption := 'BL';
               Width := AnimalGrid.Columns[0].Width;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'AreaTreatedBR';
               Title.Caption := 'BR';
               Width := AnimalGrid.Columns[0].Width;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'TreatmentUsedName';
               Title.Caption := 'Treatment';
               Width := AnimalGrid.Font.Size * 20;
               ButtonStyle := cbsAuto;
               HerdLookup.qLookupTreatmentUsed.Active := True;
               while ( not(HerdLookup.qLookupTreatmentUsed.Eof) ) do
                  begin
                     PickList.Add(HerdLookup.qLookupTreatmentUsed.FieldByName('Description').AsString);
                     HerdLookup.qLookupTreatmentUsed.Next;
                  end;
            end;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'DrugName';
         Title.Caption := lDrugUsed.Caption;
         Width := AnimalGrid.Font.Size * 20;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'NoDays';
         Title.Caption := 'No. Days';
         Width := AnimalGrid.Font.Size * 15;
         Visible := False;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'NoTimes';
         Title.Caption := 'No. per Day';
         Width := AnimalGrid.Font.Size * 15;
         Visible := False;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'MeatWDRLDate';
         Title.Caption := 'Meat Wdrl';
         Width := 85;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'MilkWDRLDate';
         Title.Caption := 'Milk Wdrl';
         Width := 85;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'OrganicMeatWDRLDate';
         Title.Caption := 'Organic Meat Wdrl';
         Width := 85;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'OrganicMilkWDRLDate';
         Title.Caption := 'Organic Milk Wdrl';
         Width := 85;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'DrugBatchNo';
         Title.Caption := lBatchNo.Caption;
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'RateOfApplic';
         Title.Caption := lApplicRate.Caption;
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'TotalApplicRate';
         Title.Caption := 'Total Amount';
         Width := AnimalGrid.Font.Size * 11;
         ReadOnly := True;
         Visible := False;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'LastWeight';
         Title.Caption := 'Last Weight';
         Width := AnimalGrid.Font.Size * 10;
         ReadOnly := True;
         Visible := False;
      end;

   if ( CountryOfReg = Ireland ) and ( WinData.EventType <> THerdVaccination ) then
      with AnimalGrid.Columns.Add do
         begin
            FieldName := 'HealthCodeName';
            Title.Caption := lICBFCode.Caption;
            Width := AnimalGrid.Font.Size * 20;
         end;

   if ( WinData.EventType <> THerdVaccination ) then
      with AnimalGrid.Columns.Add do
         begin
            FieldName := 'FarmCodeName';
            if ( CountryOfReg = NIreland ) then
               Title.Caption := 'Reason'
            else
               Title.Caption := lFarmCode.Caption;
            Width := AnimalGrid.Font.Size * 20;
         end;

   if ( WinData.EventType = THerdVaccination ) then
      with AnimalGrid.Columns.Add do
         begin
            FieldName := 'Disease';
            Title.Caption := 'Disease';
            Width := AnimalGrid.Font.Size * 20;
            ButtonStyle := cbsAuto;
            HerdLookup.qHerdVaccineType.Active := True;
            while ( not(HerdLookup.qHerdVaccineType.Eof) ) do
               begin
                  PickList.Add(HerdLookup.qHerdVaccineType.FieldByName('Description').AsString);
                  HerdLookup.qHerdVaccineType.Next;
               end;
         end;

   if ( WinData.EventType <> THerdVaccination ) then
      with AnimalGrid.Columns.Add do
         begin
            FieldName := 'ApplicMethodName';
            Title.Caption := lApplicMethod.Caption;
            Width := AnimalGrid.Font.Size * 20;
         end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'AdminByName';
         Title.Caption := lAdMinBy.Caption;
         Width := AnimalGrid.Font.Size * 20;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'sPrescribedBy';
         Title.Caption := lPrescribBy.Caption;
         Width := AnimalGrid.Font.Size * 20;
      end;

   if ( not(WinData.EventType in [THerdVaccination, TLameness]) ) then
      with AnimalGrid.Columns.Add do
         begin
            FieldName := 'sGroupName';
            Title.Caption := lAddToGroup.Caption;
            Width := AnimalGrid.Font.Size * 20;
         end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'ReportInDays';
         if ( CountryOfReg = Ireland  ) then
            begin
               if WinData.EventType = THerdVaccination then
                  begin
                     lNoDaysToRemind.Caption := 'Weeks to ' +#13+ 'Remind';
                     Title.Caption := lNoDaysToRemind.Caption;
                     MultiDrugGridDBTableViewDaysToRemind.Caption := 'Weeks to Remind';
                     MultiDrugGridDBTableViewDaysToRemind.Width := MultiDrugGridDBTableViewDaysToRemind.Width + 35;
                  end
               else
                  begin
                     lNoDaysToRemind.Caption := 'Days to ' +#13+ 'Remind';
                     Title.Caption := lNoDaysToRemind.Caption;
                     MultiDrugGridDBTableViewDaysToRemind.Caption := 'Days to Remind';
                  end;
            end
         else if ( CountryOfReg = NIreland ) then
            begin
               if WinData.EventType = THerdVaccination then
                  begin
                     lNoDaysToRemind.Caption := 'Weeks to ' +#13+ 'Remind';
                     Title.Caption := lNoDaysToRemind.Caption;
                     MultiDrugGridDBTableViewDaysToRemind.Caption := 'Weeks to Remind';
                     MultiDrugGridDBTableViewDaysToRemind.Width := MultiDrugGridDBTableViewDaysToRemind.Width + 35;
                  end
               else
                  begin
                     lNoDaysToRemind.Caption := 'Days to ' +#13+ 'Report';
                     Title.Caption := lNoDaysToRemind.Caption;
                     MultiDrugGridDBTableViewDaysToRemind.Caption := 'Days to Report';
                  end;
            end;
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'ReportIDDesc';
         Title.Caption := 'To Do Next';
         Width := 150;
      end;

   if WinData.EventType = THealth then
      SetDataSource(Health,dsTempEvents)
   else if WinData.EventType = TDryOff then
      SetDataSource(DryingOff,dsTempEvents)
   else if WinData.EventType = THerdVaccination then
      SetDataSource(tsVaccination,dsTempEvents)
   else if WinData.EventType = TMastitis then
      SetDataSource(tsMastitis,dsTempEvents)
   else if WinData.EventType = TLameness then
      SetDataSource(tsLameness,dsTempEvents);

   bShowMultiDrugs := False;
   SetupMultiOrSingleDrugEntry;

   MultiDrugGridDBTableView.DataController.DataSource := dsmdMultiDrug;

   bShowMultiTreatmentOptions := False;
   ShowMultiTreatmentOptions;

   HerdLookup.qDrugList.Active := True;

   if ( not(HerdLookup.QueryAdminBy.Active) ) then
      HerdLookup.QueryAdminBy.Active := True;
   if ( not(HerdLookup.QueryPrescribedBy.Active) ) then
      HerdLookup.QueryPrescribedBy.Active := True;

   HerdLookup.LookupHealthReportDesc.Active := True;

   HerdLookup.LookupJohnesResult.Active := True;

   DateHealth.SetFocus;

   FDrugBatchQty_EmptyCheck := False;

   if ( WinData.EventType in [TMastitis, TLameness] ) then
      begin
         dbcbAreaTreatedFL.DataBinding.DataField := 'AreaTreatedFL';
         dbcbAreaTreatedFR.DataBinding.DataField := 'AreaTreatedFR';
         dbcbAreaTreatedBL.DataBinding.DataField := 'AreaTreatedBL';
         dbcbAreaTreatedBR.DataBinding.DataField := 'AreaTreatedBR';
         dblcLameTreatment.DataField := 'TreatmentUsed';
      end;

   rgUseWeightAsApplicRate.Top := 12;
   lApplicRate.Top := 40;
   RateOfApplic.Top := 37;
   lRateOfApplic.Top := 40;
   rgUseWeightAsApplicRate.Visible := ( WinData.EventType = THealth );
   if ( not(rgUseWeightAsApplicRate.Visible) ) then
      begin
         lApplicRate.Top := 28;
         RateOfApplic.Top := 25;
         lRateOfApplic.Top := 28;
      end;
   Application.ProcessMessages;
   Update;

   FUseApplicRateByKg := False;
end;

// Set up the Weighing Record fields
procedure TfEventsByGroup.WeightSetUp;
begin
   fWeight := TFloatField.Create(TempAnimals);
   with fWeight do
      begin
         FieldName := 'Weight';
         DataSet := TempAnimals;
         OnChange := TempAnimalsWeightOnChange;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'Weight';
         Title.Caption := 'Current Weight';
         Width := 70;
      end;

   if ( FWeighingEvents.RecordCount > 0 ) then
      begin
         fLastWeight := TFloatField.Create(TempAnimals);
         with fLastWeight do
            begin
               FieldName := 'LastWeight';
               DataSet := TempAnimals;
            end;

         dLastWeighDate := TDateTimeField.Create(TempAnimals);
         with dLastWeighDate do
            begin
               FieldName := 'LastWeighDate';
               DataSet := TempAnimals;
            end;

         fWeightGain := TFloatField.Create(TempAnimals);
         with fWeightGain do
            begin
               FieldName := 'WeightGain';
               DataSet := TempAnimals;
            end;

         fWeightGainPerDay := TFloatField.Create(TempAnimals);
         with fWeightGainPerDay do
            begin
               FieldName := 'GainPerDay';
               DataSet := TempAnimals;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'LastWeighDate';
               Title.Caption := 'Previous Weight Date';
               Width := AnimalGrid.Font.Size * 10;
               ReadOnly := True;
               Color := clTeal;
               Visible := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'LastWeight';
               Title.Caption := 'Previous Weight';
               Width := AnimalGrid.Font.Size * 10;
               ReadOnly := True;
               Color := clTeal;
               Visible := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'WeightGain';
               Title.Caption := 'Weight Gain';
               Width := AnimalGrid.Font.Size * 10;
               ReadOnly := True;
               Color := clTeal;
               Visible := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'GainPerDay';
               Title.Caption := 'Gain Per Day';
               Width := AnimalGrid.Font.Size * 10;
               ReadOnly := True;
               Color := clTeal;
               Visible := True;
            end;
      end;

   SetDataSource ( Weighing, dsTempEvents );
end;

procedure TfEventsByGroup.HerdTestSetup;
begin
   dbluJohnesResult.Properties.ListSource := HerdLookup.dsLookupJohnesResult;

   sTestDisease := TStringField.Create(TempAnimals);
   with sTestDisease do
      begin
         FieldName := 'Disease';
         DataSet := TempAnimals;
         Size := 12;
         OnChange := TempEventsHerdTestDiseaseOnChange;
      end;

   iJohnesResult := TIntegerField.Create(TempAnimals);
   with iJohnesResult do
      begin
         FieldName := 'JohnesResult';
         DataSet := TempAnimals;
      end;

   sJohnesResult := TStringField.Create(TempAnimals);
   with sJohnesResult do
      begin
         FieldName := 'JohnesResultDesc';
         LookUpDataSet := HerdLookup.LookupJohnesResult;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'JohnesResult';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   AnimalGrid.Columns[7].Visible := False;

   SetDataSource ( tsHerdTest, dsTempEvents );
end;

// Set up the Bulling Record  fields
procedure TfEventsByGroup.BullingSetUp;
begin
   PlannedBull.LookupSource := dsPlannedBull;
   ObservedBy.LookupSource := WinData.dsObservedBy;

   WinData.qObservedBy.Active := True;

   iBullCode := TIntegerField.Create(TempAnimals);
   with iBullCode do
      begin
         FieldName := 'PlannedBull';
         DataSet := TempAnimals;
      end;
   iObservedBy := TIntegerField.Create(TempAnimals);
   with iObServedBy do
      begin
         FieldName := 'ObservedBy';
         DataSet := TempAnimals;
      end;
   sBullCode := TStringField.Create(TempAnimals);
   with sBullCode do
      begin
         FieldName := 'PBullNo';
         //LookUpDataSet := qPlanned;
         LookUpDataSet := HerdLookup.qPlannedBull;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'AnimalNo';
         KeyFields := 'PlannedBull';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;
   sObservedByName := TStringField.Create(TempAnimals);
   with sObservedByName do
      begin
         FieldName := 'ObservedName';
         LookUpDataSet := WinData.qObservedBy;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'ObservedBy';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   iDamID := TIntegerField.Create(TempAnimals);
   with iDamID do
      begin
         FieldName := 'DamID';
         DataSet := TempAnimals;
      end;

   iSireID := TIntegerField.Create(TempAnimals);
   with iSireID do
      begin
         FieldName := 'SireID';
         DataSet := TempAnimals;
      end;

   dLastCalveDate := TDateTimeField.Create(TempAnimals);
   with dLastCalveDate do
      begin
         FieldName := fn_LastCalveDate;
         DataSet := TempAnimals;
      end;

   dLastServiceDate := TDateTimeField.Create(TempAnimals);
   with dLastServiceDate do
      begin
         FieldName := fn_LastServiceDate;
         DataSet := TempAnimals;
      end;

   iNumOfServes := TIntegerField.Create(TempAnimals);
   with iNumOfServes do
      begin
         FieldName := 'NumOfServes';
         DataSet := TempAnimals;
      end;

   sLastServiceBull := TStringField.Create(TempAnimals);
   with sLastServiceBull do
      begin
         FieldName := 'sLastServiceBull';
         DataSet := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
          FieldName := 'PBullNo';
          Title.Caption := 'Planned Bull';
          Width := AnimalGrid.Font.Size * 10;
      end;

   if WinData.EventType = TBulling then
      begin
         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'ObservedName';
               Title.Caption := 'Observed By';
               Width := AnimalGrid.Font.Size * 30;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := fn_LastCalveDate;
               Title.Caption := 'Last Calving Date';
               Width := 105;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := fn_LastServiceDate;
               Title.Caption := 'Last Service Date';
               Width := 105;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'NumOfServes';
               Title.Caption := 'No of Serves';
               Width := 70;
               ReadOnly := True;
            end;

         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'sLastServiceBull';
               Title.Caption := 'Last Service Bull';
               Width := 105;
               ReadOnly := True;
            end;
      end
   else if ( WinData.EventType = TPlannedBull ) then
      begin
         with AnimalGrid.Columns.Add do
            begin
               FieldName := fn_LastCalveDate;
               Title.Caption := 'Last Calving Date';
               Width := 105;
               ReadOnly := True;
            end;
      end;

   // The Planned Bull Query
   qPlanned.Open;

   if WinData.EventType = TBulling then
      SetDataSource ( Heats, dsTempEvents )
   else if WinData.EventType = TPlannedBull then
      SetDataSource ( tsPlannedBull, dsTempEvents );
end;

// Set up the Service Record  fields
procedure TfEventsByGroup.ServiceSetUp;
begin
   ceNoStraws.DataBinding.DataField := 'StrawsUsed';
   ceNoStraws.DataBinding.DataSource := dsTempEvents;

   cbSexedSemen.DataSource := dsTempEvents;
   cbSexedSemen.LookupSource := HerdLookup.dsICBFSexedSemenType;

   ServiceTypes.LookupSource := WinData.dsServiceType;
   Inseminator.LookupSource := WinData.dsObservedBy;

   dbcServBull.LookupSource := dsPlannedBull;

   iServiceBull := TIntegerField.Create(TempAnimals);
   with iServiceBull do
      begin
         FieldName := 'ServiceBull';
         DataSet := TempAnimals;
      end;
   iServiceType := TIntegerField.Create(TempAnimals);
   with iServiceType do
      begin
         FieldName := 'ServiceType';
         DataSet := TempAnimals;
      end;
   fStrawsUsed := TFloatField.Create(TempAnimals);
   with fStrawsUsed do
      begin
         FieldName := 'StrawsUsed';
         DataSet := TempAnimals;
      end;
   iTechnician := TIntegerField.Create(TempAnimals);
   with iTechnician do
      begin
         FieldName := 'Technician';
         DataSet := TempAnimals;
      end;
   iSexedSemen := TIntegerField.Create(TempAnimals);
   with iSexedSemen do
      begin
         FieldName := 'SexedSemen';
         DataSet := TempAnimals;
      end;
   sServiceBull := TStringField.Create(TempAnimals);
   with sServiceBull do
      begin
         FieldName := 'PServiceBull';
         //LookUpDataSet := qPlanned;
         LookUpDataSet := HerdLookup.qServiceBullUsed;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'AnimalNo';
         KeyFields := 'ServiceBull';
         LookUp := TRUE;
         DataSet := TempAnimals;
         //OnChange := TempAnimalsFieldOnChange;
      end;
   sServiceType := TStringField.Create(TempAnimals);
   with sServiceType do
      begin
         FieldName := 'ServiceTypeName';
         DisplayWidth := 30;
         LookUpDataSet := WinData.qServiceType;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'ServiceType';
         LookUp := TRUE;
         DataSet := TempAnimals;
         //OnChange := TempAnimalsFieldOnChange;
      end;
   sTechnician := TStringField.Create(TempAnimals);
   with sTechnician do
      begin
         FieldName := 'TechnicianName';
         LookUpDataSet := WinData.qObservedBy;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'Technician';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;
   sSexedSemen := TStringField.Create(TempAnimals);
   with sSexedSemen do
      begin
         FieldName := 'SexedSemenType';
         LookUpDataSet := HerdLookup.qICBFSexedSemenType;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'SexedSemen';
         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   iDamID := TIntegerField.Create(TempAnimals);
   with iDamID do
      begin
         FieldName := 'DamID';
         DataSet := TempAnimals;
      end;

   iSireID := TIntegerField.Create(TempAnimals);
   with iSireID do
      begin
         FieldName := 'SireID';
         DataSet := TempAnimals;
      end;

   dLastCalveDate := TDateTimeField.Create(TempAnimals);
   with dLastCalveDate do
      begin
         FieldName := fn_LastCalveDate;
         DataSet := TempAnimals;
      end;

   dLastServiceDate := TDateTimeField.Create(TempAnimals);
   with dLastServiceDate do
      begin
         FieldName := fn_LastServiceDate;
         DataSet := TempAnimals;
      end;

   iNumOfServes := TIntegerField.Create(TempAnimals);
   with iNumOfServes do
      begin
         FieldName := 'NumOfServes';
         DataSet := TempAnimals;
      end;

   sLastServiceBull := TStringField.Create(TempAnimals);
   with sLastServiceBull do
      begin
         FieldName := 'sLastServiceBull';
         DataSet := TempAnimals;
      end;

   bPrevPregDiagEvent := TBooleanField.Create(TempAnimals);
   with bPrevPregDiagEvent do
      begin
         FieldName := 'PrevPregDiagEvent';
         DataSet := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'PServiceBull';
         Title.Caption := 'Service Bull';
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'SexedSemenType';
         Title.Caption := 'Sexed Semen';
         Width := 144;
         Visible := ( CountryOfReg = Ireland );
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'ServiceTypeName';
         Title.Caption := 'Service Type';
         Width := AnimalGrid.Font.Size * 30;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'StrawsUsed';
         Title.Caption := 'No. Of Straws';
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'TechnicianName';
         Title.Caption := 'Inseminator';
         Width := 105;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := fn_LastCalveDate;
         Title.Caption := 'Last Calving Date';
         Width := 105;
         ReadOnly := True;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := fn_LastServiceDate;
         Title.Caption := 'Last Service Date';
         Width := 105;
         ReadOnly := True;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'NumOfServes';
         Title.Caption := 'No of Serves';
         Width := 70;
         ReadOnly := True;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'sLastServiceBull';
         Title.Caption := 'Last Service Bull';
         Width := 105;
         ReadOnly := True;
      end;

   SetDataSource ( Service, dsTempEvents );

   // The Planned Bull Query
   qPlanned.Open;

   if ( not(HerdLookup.qStockBulls.Active) ) then
      HerdLookup.qStockBulls.Open;
end;

// Set up the Pregnancy Diagnosis Record  fields
procedure TfEventsByGroup.PregDiagSetUp;
begin
   iNoCalves := TIntegerField.Create(TempAnimals);
   with iNoCalves do
      begin
         FieldName := 'NoCalves';
         DataSet := TempAnimals;
         OnChange := TempEventsPregnancyNoCalvesOnChange;
      end;

   iDaysInCalf := TIntegerField.Create(TempAnimals);
   with iDaysInCalf do
      begin
         FieldName := 'DaysInCalf';
         DataSet := TempAnimals;
         OnChange := TempEventsPregnancyDaysInCalfOnChange;
      end;

   sPregnancyStatus := TStringField.Create(TempAnimals);
   with sPregnancyStatus do
      begin
         FieldName := 'PregnancyStatus';
         Size := 3;
         OnValidate := TempEventsYesNoValidate;
         DataSet := TempAnimals;
         OnChange := TempEventsPregnancyStatusOnChange;
      end;

   dLastServiceDate := TDateTimeField.Create(TempAnimals);
   with dLastServiceDate do
      begin
         FieldName := fn_LastServiceDate;
         DataSet := TempAnimals;
      end;

   iDaysSinceService := TIntegerField.Create(TempAnimals);
   with iDaysSinceService do
      begin
         FieldName := 'DaysSinceService';
         DataSet := TempAnimals;
      end;

   sCalfType := TStringField.Create(TempAnimals);
   with sCalfType do
      begin
         FieldName := 'CalfType';
         Size := 3;
         DataSet := TempAnimals;
      end;

   bRepeatPregDiag := TBooleanField.Create(TempAnimals);
   with bRepeatPregDiag do
      begin
         FieldName := 'RepeatPregDiag';
         DataSet := TempAnimals;
      end;

   sRecheck := TStringField.Create(TempAnimals);
   with sRecheck do
      begin
         FieldName := 'Recheck';
         Size := 3;
         OnValidate := TempEventsYesNoValidate;
         DataSet := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'PregnancyStatus';
         Title.Caption := 'Pregnant';
         ButtonStyle := cbsAuto;
         PickList.Add('Yes');
         PickList.Add('No');
         Width := AnimalGrid.Font.Size * 8;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'NoCalves';
         Title.Caption := 'No Of Calves';
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'CalfType';
         Title.Caption := 'Calf Type';
         ButtonStyle := cbsAuto;
         PickList.Add('M');
         PickList.Add('F');
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'DaysInCalf';
         Title.Caption := 'Days In Calf';
         Width := AnimalGrid.Font.Size * 10;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'Recheck';
         Title.Caption := 'Recheck';
         ButtonStyle := cbsAuto;
         PickList.Add('Yes');
         PickList.Add('No');
         Width := AnimalGrid.Font.Size * 8;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := fn_LastServiceDate;
         Title.Caption := 'Last Service Date';
         Width := 100;
         ReadOnly := True;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'DaysSinceService';
         Width := 90;
         Title.Caption := 'Days In Calf From Service';
         ReadOnly := True;
      end;
   SetDataSource ( PregDiag, dsTempEvents );

end;

// Kills all Datasource on all controls on the Page Control Componnet
procedure TfEventsByGroup.DeActiveAllOtherPages;
var
   i : Integer;
begin
   for i := 0 to pgEvents.ControlCount-1 do
      if (pgEvents.Controls[i] is TTabSheet) then
          SetDataSource((pgEvents.Controls[i] as TTabSheet),nil);
end;

// Add Fields to the Tables
procedure TfEventsByGroup.AddFields(TableToAddTo: TTable);
begin
   with TableToAddTo do
      case WinData.EventType of
         TTBTestDate: FieldDefs.Add('TBTestDate',ftDate,0,FALSE);
         TBruceTest : FieldDefs.Add('BruceTest',ftDate,0,FALSE);
         TBVDTest   : FieldDefs.Add('BVDDate',ftDate,0,FALSE);
         THerdTest  : begin
                         FieldDefs.Add('HerdTestDate',ftDate,0,FALSE);
                         FieldDefs.Add('Disease',ftString,12,FALSE);
                         FieldDefs.Add('JohnesResult',ftInteger,0,FALSE);
                      end;
         TPlannedBull,
         TBulling : begin
                       FieldDefs.Add('PlannedBull',ftInteger,0,FALSE);
                       FieldDefs.Add('ObservedBy',ftInteger,0,FALSE);
                    end;
         TService : begin
                       FieldDefs.Add('ServiceBull',ftInteger,0,FALSE);
                       FieldDefs.Add('StrawsUsed',ftFloat,0,FALSE);
                       FieldDefs.Add('ServiceType',ftInteger,0,FALSE);
                       FieldDefs.Add('Technician',ftInteger,0,FALSE);
                       FieldDefs.Add('PrevPregDiagEvent',ftBoolean,0,FALSE);
                       FieldDefs.Add('SexedSemen',ftInteger,0,FALSE);
                    end;
         TLameness,
         TMastitis,
         THerdVaccination,
         TDryOff,
         THealth  : begin
                       FieldDefs.Add('DrugUsed',ftInteger,0,FALSE);
                       FieldDefs.Add('HealthCode',ftInteger,0,FALSE);
                       FieldDefs.Add('RateOfApplic',ftFloat,0,FALSE);
                       FieldDefs.Add('NoTimes',ftFloat,0,FALSE);
                       FieldDefs.Add('NoDays',ftFloat,0,FALSE);
                       FieldDefs.Add('AdminBy',ftInteger,0,FALSE);
                       FieldDefs.Add('ApplicMethod',ftInteger,0,FALSE);
                       FieldDefs.Add('DrugPurchID',ftInteger,0,FALSE);
                       FieldDefs.Add('ReportInDays',ftInteger,0,FALSE);
                       FieldDefs.Add('FarmCode',ftInteger,0,FALSE);
                       FieldDefs.Add('VetPresc',ftInteger,0,FALSE);
                       FieldDefs.Add('GroupID',ftInteger,0,FALSE);
                       FieldDefs.Add('Disease',ftString,20,FALSE);
                       FieldDefs.Add('ReportID',ftInteger,0,FALSE);
                       FieldDefs.Add('DrugBatchNo',ftString,30,FALSE);
                       FieldDefs.Add('ManualComment',ftBoolean);
                       FieldDefs.Add('LastWeight',ftFloat,0,FALSE);
                       FieldDefs.Add('AreaTreatedFL',ftBoolean,0,FALSE);
                       FieldDefs.Add('AreaTreatedFR',ftBoolean,0,FALSE);
                       FieldDefs.Add('AreaTreatedBL',ftBoolean,0,FALSE);
                       FieldDefs.Add('AreaTreatedBR',ftBoolean,0,FALSE);
                       FieldDefs.Add('TreatmentUsed',ftInteger,0,FALSE);
                       FieldDefs.Add('TotalApplicRate',ftFloat,0,FALSE);
                    end;
         TWeight  : begin
                       FieldDefs.Add('Weight',ftFloat,0,FALSE);
                       FieldDefs.Add('LastWeight',ftFloat,0,FALSE);
                       FieldDefs.Add('LastWeighDate',ftDateTime,0,FALSE);
                       FieldDefs.Add('WeightGain',ftFloat,0,FALSE);
                       FieldDefs.Add('GainPerDay',ftFloat,0,FALSE);
                    end;
         TPregDiag: begin
                       FieldDefs.Add('NoCalves',ftInteger,0,FALSE);
                       FieldDefs.Add('DaysInCalf',ftInteger,0,FALSE);
                       FieldDefs.Add('PregnancyStatus',ftString,3,FALSE);
                       FieldDefs.Add('CalfType',ftString,3,FALSE);
                       FieldDefs.Add('RepeatPregDiag',ftBoolean);
                       FieldDefs.Add('Recheck',ftString,3,FALSE);
                    end;
         TMovement: begin
                       FieldDefs.Add('MovedTo',ftInteger,0,FALSE);
                    end;
         TConditionScore : begin
                              FieldDefs.Add('Score',ftFloat,0,FALSE);
                              FieldDefs.Add('AssociatedEventType',ftInteger,0,FALSE);
                              FieldDefs.Add('Mobility',ftFloat,0,FALSE);
                              FieldDefs.Add('Cleanliness',ftFloat,0,FALSE);
                              FieldDefs.Add('Abrasions',ftBoolean,0,FALSE);
                           end;
         TFertilityCheck :
            begin
               FieldDefs.Add('Status',ftInteger);
               FieldDefs.Add('StatusDesc',ftString,60);
               FieldDefs.Add('Action',ftInteger);
               FieldDefs.Add('ActionDesc',ftString,60);
               FieldDefs.Add('FertProgram',ftInteger);
               FieldDefs.Add('FertProgramDesc',ftString,60);
            end;
         TMilkTemperament :
            begin
               FieldDefs.Add('Score',ftInteger);
               FieldDefs.Add('ScoreDesc',ftString,30);
            end;
      end;
end;

procedure TfEventsByGroup.CreateTempTable;
var
   EDesc : String;
   sSelectAll : string;
   i : Integer;
begin
   FDataLoading := True;
   Screen.Cursor := crHourGlass;
   try
      if WinData.EventType <> TNoEvent then
        // Create the Tables
        try
          if not AnimalCart.IsEmpty then
             begin
                if WinData.ActiveFilter then
                   lGridFilter.Caption := 'Animal Grid Filter/Animals in Cart'
                else
                   lGridFilter.Caption := 'Animals in Cart';
             end
          else
             lGridFilter.Caption := 'Animal Grid Filter';

          if (AnimalCart.IsEmpty) and not(WinData.ActiveFilter) then
             begin
                lSelectedGridFilter.Visible := False;
                lGridFilter.Visible := False;
                LCartFilterReminder.Visible := True;
             end
          else
             begin
                lSelectedGridFilter.Visible := True;
                lGridFilter.Visible := True;
                LCartFilterReminder.Visible := False;
             end;

           EnableDisableControls(FALSE);
           with TempEvents do
              try
                 TableName := 'e';
                 FieldDefs.Clear;
                 FieldDefs.Add(fn_EventDate,ftDate,0,FALSE);
                 FieldDefs.Add('EventDesc',ftString,30,FALSE);
                 AddFields(TempEvents);

                 Close;
                 CreateTable;
                 Open;
                 Append;

                 FieldByName(fn_EventDate).AsDateTime := Now();
                 FieldByName(fn_EventDate).OnChange := TempEventsValueChange;

                 if ( not(WinData.EventType in [TTBTestDate, TBruceTest, TBVDTest, THerdTest]) ) then
                    begin
                       case WinData.EventType of
                          TService : begin
                                        FieldByName('EventDesc').AsString := 'Service';
                                        FieldByName('StrawsUsed').AsFloat := 1;
                                     end;
                          TPlannedBull : FieldByName('EventDesc').AsString := 'Planned Bull';
                          TBulling : FieldByName('EventDesc').AsString := 'Heat/Bulling';
                          TDryOff  : begin
                                        if ( FHerdType = htDairy ) then
                                           FieldByName('EventDesc').AsString := 'Dry Off'
                                        else if ( FHerdType = htSuckler ) then
                                           FieldByName('EventDesc').AsString := 'Weaning';
                                        FieldByName('NoTimes').AsFloat := 1;
                                        FieldByName('NoDays').AsFloat := 1;
                                        if ( CountryOfReg = England ) then
                                           FieldByName('ReportInDays').AsInteger := 7
                                        else
                                           FieldByName('ReportInDays').AsInteger := 0;
                                     end;
                          THealth  : begin
                                        FieldByName('EventDesc').AsString := 'Health';
                                        FieldByName('NoTimes').AsFloat := 1;
                                        FieldByName('NoDays').AsFloat := 1;
                                        if ( CountryOfReg = England ) then
                                           FieldByName('ReportInDays').AsInteger := 7
                                        else
                                           FieldByName('ReportInDays').AsInteger := 0;
                                     end;
                          TWeight  : FieldByName('EventDesc').AsString := 'Weighing';
                          TPregDiag: FieldByName('EventDesc').AsString := 'Pregnancy Diagnosis';
                          TMovement: FieldByName('EventDesc').AsString := 'Temporary Movement';
                          TConditionScore: FieldByName('EventDesc').AsString := 'Condition Score';
                          TFertilityCheck: FieldByName('EventDesc').AsString := 'Fertility Check';
                          TMilkTemperament : FieldByName('EventDesc').AsString := 'Milk Temperament';
                          THerdVaccination : begin
                                                FieldByName('EventDesc').AsString := 'Vaccination';
                                                FieldByName('NoTimes').AsFloat := 1;
                                                FieldByName('NoDays').AsFloat := 1;
                                                FieldByName('ReportInDays').AsInteger := 1;
                                             end;
                          TToBeCulled : FieldByName('EventDesc').AsString := 'To Be Culled';
                          TLameness,
                          TMastitis : begin
                                         if ( WinData.EventType = TMastitis ) then
                                            FieldByName('EventDesc').AsString := 'Mastitis'
                                         else
                                            FieldByName('EventDesc').AsString := 'Lameness';
                                         FieldByName('NoTimes').AsFloat := 1;
                                         FieldByName('NoDays').AsFloat := 1;
                                         FieldByName('ReportInDays').AsInteger := 1;
                                         FieldByName('AreaTreatedFL').AsBoolean := False;
                                         FieldByName('AreaTreatedFR').AsBoolean := False;
                                         FieldByName('AreaTreatedBL').AsBoolean := False;
                                         FieldByName('AreaTreatedBR').AsBoolean := False;
                                         FieldByName('TreatmentUsed').AsInteger := 0;
                                      end;
                       end;
                       EDesc := FieldByName('EventDesc').AsString;
                    end;
                 if ( WinData.EventType = TPregDiag) then
                    FieldByName('NoCalves').AsInteger := 1;
              except
                 on e : Exception do
                    ShowMessage(e.Message);
              end;

           with TempAnimals do
              begin
                 TableName := 'a';
                 FieldDefs.Clear;
                 FieldDefs.Add('ID',ftAutoInc,0,FALSE);
                 FieldDefs.Add('Selected',ftBoolean,0,FALSE);
                 FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
                 FieldDefs.Add('SireID',ftInteger,0,FALSE);
                 FieldDefs.Add('DamID',ftInteger,0,FALSE);
                 FieldDefs.Add('AnimalNo',ftString,10,FALSE);
                 FieldDefs.Add('SortAnimalNo',ftString,10,FALSE);
                 FieldDefs.Add('LactNo',ftInteger,0,FALSE);
                 FieldDefs.Add('NatIdNum',ftString,20,FALSE);
                 FieldDefs.Add('SortNatId',ftString,20,FALSE);
                 FieldDefs.Add('DateOfBirth',ftDate,0,FALSE);
                 FieldDefs.Add('PDate',ftDate,0,FALSE);   // Purchase Date
                 FieldDefs.Add('PWeight',ftFloat,0,FALSE);   // Purchase Weight
                 FieldDefs.Add('Sex',ftString,10,FALSE);
                 FieldDefs.Add('HerdID',ftInteger,0,FALSE);
                 FieldDefs.Add(fn_EventDate,ftDate,0,FALSE);
                 FieldDefs.Add('EventDesc',ftString,30,FALSE);
                 FieldDefs.Add(fn_LastCalveDate,ftDateTime,0,FALSE);
                 FieldDefs.Add(fn_LastServiceDate,ftDateTime,0,FALSE);
                 FieldDefs.Add('NumOfServes',ftInteger,0,FALSE);
                 FieldDefs.Add('LastServiceBull',ftInteger,0,FALSE);
                 FieldDefs.Add('sLastServiceBull',ftString,10,FALSE);
                 FieldDefs.Add('DaysSinceService',ftInteger);
                 FieldDefs.Add('MeatWDRLDate',ftDateTime);
                 FieldDefs.Add('MilkWDRLDate',ftDateTime);
                 FieldDefs.Add('OrganicMeatWDRLDate',ftDateTime);
                 FieldDefs.Add('OrganicMilkWDRLDate',ftDateTime);
                 FieldDefs.Add('SearchNatID',ftString,20);
                 FieldDefs.Add('LocateNatID',ftString,30);

                 AddFields(TempAnimals);

                 // added 27/7/00 - kr/sp
                 IndexDefs.Clear;
                 IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
                 IndexDefs.Add('iAnimalNo','SortAnimalNo',[ixCaseInsensitive]);
                 IndexDefs.Add('iNatIDNum','SortNatID',[ixCaseInsensitive]);
                 Close;
                 CreateTable;
                 Open;
                 FieldByName(fn_EventDate).OnChange := TempAnimalsValueChange;

                 Close;

                 IndexName := 'iAnimalNo';
                 pmiSortByAnimalNo.Checked := True;
                 pmiSortByNatID.Checked := False;

                 ceNoStraws.DataBinding.DataSource := nil;
                 ceNoStraws.DataBinding.DataField := '';
                 cbSexedSemen.DataSource := nil;

                 case WinData.EventType of
                    TService    : ServiceSetUp;
                    TPlannedBull,
                    TBulling    : BullingSetUp;
                    TLameness,
                    TMastitis,
                    THerdVaccination,
                    TDryOff,
                    THealth     : HealthSetUp;
                    TWeight     : WeightSetUp;
                    TPregDiag   : PregDiagSetUp;
                    TMovement   : TempMovementSetup;
                    TConditionScore :  ConditionScoreSetup;
                    TFertilityCheck : FertilityCheckSetup;
                    TMilkTemperament : MilkTemperamentSetup;
                    THerdTest : HerdTestSetup;
                    TToBeCulled : ToBeCulledSetup;
                 end;

                 Open;

                 sbMessage.Panels[0].Text := cLoadingAnimals;

                 try
                    with GenQuery do
                       begin
                          if FSelectAll then
                             sSelectAll := 'TRUE'
                          else
                             sSelectAll := 'FALSE';

                          SQL.Clear;
                          SQL.Add('INSERT INTO ' + TempAnimals.TableName);
                          SQL.Add('            (Selected, AnimalId, AnimalNo, SortAnimalNo, ');
                          SQL.Add('             NatIdNum, SortNatID, DateOfBirth, Sex, LactNo, HerdID, ');
                          SQL.Add('             EventDate, EventDesc, DamID, SireID,');
                          SQL.Add('             LocateNatID, SearchNatID)');
                          SQL.Add('SELECT '+sSelectAll+', A.ID, A.AnimalNo, A.SortAnimalNo, ');
                          SQL.Add('             A.NatIdNum, A.SortNatID, A.DateOfBirth, A.Sex, A.LactNo, ');
                          SQL.Add('             A.HerdID, "' + FormatDateTime(cUSDateStyle,Now()) + '", "' + EDesc + '", A.DamID, A.SireID,');
                          SQL.Add('             A.LocateNatID, A.SearchNatID');
                          SQL.Add('FROM Animals A, ' + WinData.FilteredAnimals.TableName + ' FA');
                          SQL.Add('WHERE (A.ID=FA.AID)                                         ');

                          //   27/11/18 [V5.8 R5.5] /MK Change - Only default to default herd if WinData.UserDefaultHerdID > 0 or not MultiHerd in same database system.
                          if ( WinData.UserDefaultHerdID > 0 ) or ( not(WinData.MultiHerd) ) then
                             SQL.Add('AND   (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')   ');

                          // if its a breeding event then Only include animals USED FOR BREEDING
                          if ( WinData.EventType in [TPregDiag,TDryOff,TPlannedBull,TBulling,TService,TConditionScore,TFertilityCheck,TMilkTemperament,TToBeCulled,TMastitis,TLameness] ) then
                             begin
                                SQL.Add('AND (A.Breeding=TRUE)');
                                // Limit to Females
                                SQL.Add('AND (A.Sex = "Female")');
                             end;

                          if ( WinData.EventType in [TDryOff, TMastitis, TLameness] ) then
                             begin
                                SQL.Add('AND (A.LactNo > 0)');
                                if ( WinData.EventType = TDryOff ) then
                                   begin
                                      SQL.Add('AND NOT (A.ID IN ');
                                      SQL.Add('(SELECT DelFA.AID FROM ' + WinData.FilteredAnimals.TableName + ' DelFA,Events E, Animals A');
                                      SQL.Add(' WHERE (DelFA.AID=E.AnimalID) And (DelFA.AID=A.ID) And (A.LactNo=E.AnimalLactNo) AND (E.EventType=' + IntToStr(CDryOffEvent) + ')))');
                                   end;
                             end
                          else if WinData.EventType = TBruceTest then
                             SQL.Add('AND (A.Sex <> "Steer") ')
                          else if WinData.EventType = TMovement then
                             begin
                                SQL.Add('AND NOT A.ID IN ( SELECT M.AID FROM ' + WinData.tMovements.TableName + ' M WHERE (M.StillOffFarm = True) )');
                             end
                          else if WinData.EventType = TMilkTemperament then
                             begin
                                SQL.Add('AND NOT (A.ID IN ');
                                SQL.Add('(SELECT DelFA.AID FROM ' + WinData.FilteredAnimals.TableName + ' DelFA,Events E, Animals A WHERE (DelFA.AID=E.AnimalID) And (DelFA.AID=A.ID) And (A.LactNo=E.AnimalLactNo) AND (E.EventType=' + IntToStr(CMilkTemperament) + ')))');
                             end
                          //   30/01/13 [V5.1 R4.0] /MK Additional Feature - If PregDiag then bring in animals that have no culling event
                          //                                                 or have a PD event in the current lact with a False result.
                          else if ( WinData.EventType = TPregDiag ) then
                             begin
                                SQL.Add('AND NOT (A.ID IN');
                                SQL.Add('                (SELECT DelFA.AID');
                                SQL.Add('                 FROM AFilters.DB DelFA');
                                SQL.Add('                 LEFT JOIN Events E ON (E.AnimalID = DelFA.AID)');
                                SQL.Add('                 LEFT JOIN Animals A ON (A.ID = DelFA.AID)');
                                SQL.Add('                 LEFT JOIN PregnancyDiag P ON (P.EventID = E.ID)');
                                SQL.Add('                 WHERE (A.LactNo=E.AnimalLactNo)');
                                SQL.Add('                 AND   (E.EventType='+IntToStr(CPregDiagEvent)+')');
                                SQL.Add('                 AND   (P.PregnancyStatus = TRUE)');
                                SQL.Add('                 AND   ((P.Recheck = FALSE) OR (P.Recheck IS NULL)) ))');

                                SQL.Add('AND NOT (A.ID IN');
                                SQL.Add('               (SELECT DelFA.AID');
                                SQL.Add('                FROM AFilters.DB DelFA');
                                SQL.Add('                LEFT JOIN Events E ON (E.AnimalID = DelFA.AID)');
                                SQL.Add('                LEFT JOIN Animals A ON (A.ID = DelFA.AID)');
                                SQL.Add('                WHERE (E.EventType='+IntToStr(CToBeCulledEvent)+')))');
                             end
                          else if ( WinData.EventType = TToBeCulled ) then
                             begin
                                SQL.Add('AND (A.LactNo > 0)');
                                SQL.Add('AND NOT (A.ID IN');
                                SQL.Add('                (SELECT DelFA.AID');
                                SQL.Add('                 FROM AFilters.DB DelFA');
                                SQL.Add('                 LEFT JOIN Events E ON (E.AnimalID = DelFA.AID)');
                                SQL.Add('                 LEFT JOIN Animals A ON (A.ID = DelFA.AID)');
                                SQL.Add('                 WHERE (A.LactNo=E.AnimalLactNo)');
                                SQL.Add('                 AND   (E.EventType='+IntToStr(CToBeCulledEvent)+')))');
                             end;

                          ExecSQL;

                          //   12/09/18 [V5.8 R2.8] /MK Change - If there are no animals in the TempAnimals table then give an error and exit this try/finally sequence.
                          SQL.Clear;
                          SQL.Add('SELECT *');
                          SQL.Add('FROM '+TempAnimals.TableName);
                          Open;
                          if ( RecordCount = 0 ) then
                             begin
                                MessageDlg('There are no animals to generate '+pgEvents.ActivePage.Caption+' events.',mtError,[mbOK],0);
                                Exit;
                             end;

                          //   23/03/18 [V5.7 R8.4] /MK Change - Remove from TempAnimals the animals that have calved less than the default no days since calving from DuePDDefaults.
                          if ( WinData.EventType = TPregDiag ) then
                             RemoveTempAnimals_PregDiag_BeforeCalved;

                          SQL.Clear;
                          SQL.Add('DELETE FROM '+TempAnimals.TableName);
                          //   08/12/17 [V5.7 R6.1] /MK Bug Fix - No need for HerdLookup.GetAnimalSelectionToArrayWideString when animals in filter are in AFilters table.
                          if ( FSelectionType = stFilter ) then
                             SQL.Add('WHERE NOT AnimalId IN (SELECT AID FROM AFilters)')
                          else
                             SQL.Add(Format('WHERE NOT AnimalId IN %s',[HerdLookup.GetAnimalSelectionToArrayWideString(FSelectionType)]));
                          ExecSQL;

                          //   07/07/21 [V6.0 R1.6] /MK Change - Moved this FWeighInfoQuery GET to after the TempAnimals table is created.
                          if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TWeight] ) then
                             if ( not(FWeighInfoQuery.Active) ) then
                                begin
                                   FWeighInfoQuery.Close;
                                   FWeighInfoQuery.SQL.Clear;
                                   FWeighInfoQuery.SQL.Add('SELECT T.AnimalID, T.DateOfBirth, E.EventDate WeighDate, W.Weight');
                                   FWeighInfoQuery.SQL.Add('FROM '+TempAnimals.TableName+' T');
                                   FWeighInfoQuery.SQL.Add('LEFT JOIN '+FWeighingEvents.TableName+' E ON (E.AnimalID = T.AnimalID)');
                                   FWeighInfoQuery.SQL.Add('LEFT JOIN Weights W On (W.EventID = E.EventID)');
                                   FWeighInfoQuery.SQL.Add('WHERE (E.EventDate >= T.DateOfBirth)');
                                   FWeighInfoQuery.SQL.Add('AND   ( W.Weight IS NOT NULL ) AND ( W.Weight > 0 )');
                                   FWeighInfoQuery.SQL.Add('ORDER BY T.AnimalID, E.EventDate DESC');
                                   FWeighInfoQuery.Open;
                                end;

                          //   07/07/21 [V6.0 R1.6] /MK Change - Moved this FPurchInfoQuery GET to after the TempAnimals table is created.
                          if ( not(FPurchInfoQuery.Active) ) then
                             begin
                                FPurchInfoQuery.Close;
                                FPurchInfoQuery.SQL.Clear;
                                FPurchInfoQuery.SQL.Add('SELECT A.AnimalID, E.EventDate, P.Weight');
                                FPurchInfoQuery.SQL.Add('FROM '+TempAnimals.TableName+' A');
                                FPurchInfoQuery.SQL.Add('LEFT JOIN '+FPurchaseEvents.TableName+' E ON (E.AnimalID = A.AnimalID)');
                                FPurchInfoQuery.SQL.Add('LEFT JOIN Purchases P ON (P.EventID = E.EventID)');
                                FPurchInfoQuery.Open;
                             end;

                          FPurchInfoQuery.First;
                          while ( not(FPurchInfoQuery.Eof) ) do
                             begin
                                if ( TempAnimals.Locate('AnimalID',FPurchInfoQuery.FieldByName('AnimalID').AsInteger,[]) ) then
                                   try
                                      TempAnimals.Edit;
                                      TempAnimals.FieldByName('PDate').AsDateTime := FPurchInfoQuery.FieldByName(fn_EventDate).AsDateTime;
                                      TempAnimals.FieldByName('PWeight').AsFloat := FPurchInfoQuery.FieldByName('Weight').AsFloat;
                                      TempAnimals.Post;
                                   except
                                      on e : Exception do
                                         ShowMessage(e.Message);
                                   end;
                                FPurchInfoQuery.Next;
                             end;

                          if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness] ) and ( TempAnimals.RecordCount > 0 ) then
                             begin
                                if ( not(WinData.EventType in [TMastitis, TLameness]) ) then
                                   begin
                                      FWeighInfoQuery.Close;
                                      FWeighInfoQuery.Open;
                                   end;

                                TempAnimals.First;
                                while ( not(TempAnimals.Eof) ) do
                                   begin
                                      TempAnimals.Edit;
                                      TempAnimals.FieldByName('NoTimes').AsFloat := 1;
                                      TempAnimals.FieldByName('NoDays').AsFloat := 1;
                                      if WinData.EventType = THerdVaccination then
                                         TempAnimals.FieldByName('ReportInDays').AsInteger := 1
                                      else
                                         begin
                                            if ( CountryOfReg = England ) then
                                               TempAnimals.FieldByName('ReportInDays').AsInteger := 7
                                            else
                                               TempAnimals.FieldByName('ReportInDays').AsInteger := 0;
                                         end;

                                      TempAnimals.FieldByName('LastWeight').Value := Null;
                                      TempAnimals.FieldByName('TotalApplicRate').Value := Null;

                                      if ( WinData.EventType in [TMastitis, TLameness] ) then
                                         begin
                                            TempAnimals.FieldByName('AreaTreatedFL').AsBoolean := False;
                                            TempAnimals.FieldByName('AreaTreatedFR').AsBoolean := False;
                                            TempAnimals.FieldByName('AreaTreatedBL').AsBoolean := False;
                                            TempAnimals.FieldByName('AreaTreatedBR').AsBoolean := False;
                                            TempAnimals.FieldByName('TreatmentUsed').AsInteger := 0;
                                         end
                                      else
                                         begin
                                            if ( WinData.EventType = THealth ) then
                                               begin
                                                  rgUseWeightAsApplicRate.ItemIndex := 0;
                                                  if ( FWeighInfoQuery.Locate('AnimalID',TempAnimals.FieldByName('AnimalID').AsInteger,[]) ) then
                                                     TempAnimals.FieldByName('LastWeight').Value := FWeighInfoQuery.FieldByName('Weight').AsFloat
                                                  //   07/07/21 [V6.0 R1.6] /MK Additional Feature - If the animal doesn't have a previous weighing weight then use the purchase weight if any - Una Carter.
                                                  else if ( TempAnimals.FieldByName('PWeight').AsFloat > 0 ) then
                                                     TempAnimals.FieldByName('LastWeight').Value := TempAnimals.FieldByName('PWeight').AsFloat;
                                               end;
                                         end;

                                      TempAnimals.Post;
                                      TempAnimals.Next;
                                   end;
                             end;

                          //   20/03/18 [V5.7 R8.4] /MK Additional Feature - Added progress bar to show user what the program is doing instead of just egg timer.
                          if ( WinData.EventType in [TBulling, TService, TPregDiag, TPlannedBull] ) and ( TempAnimals.RecordCount > 0 ) then
                             begin
                                pbInfo.Min := 0;
                                pbInfo.Max := TempAnimals.RecordCount;
                                pbInfo.Step := 1;
                                pInfo.Show;
                                pInfo.BringToFront;
                                pInfo.Refresh;
                                TempAnimals.First;
                                while ( not(TempAnimals.Eof) ) do
                                   begin
                                      LoadBreedingData(TempAnimals, True, True);
                                      if ( WinData.EventType in [TPregDiag, TService] ) then
                                         begin
                                            TempAnimals.Edit;
                                            if ( WinData.EventType = TService ) then
                                               TempAnimals.FieldByName('StrawsUsed').AsFloat := 1
                                            //   04/01/19 [V5.8 R6.0] /MK Bug Fix - TempAnimals NoCalves value should be defaulting to 1.
                                            else if ( WinData.EventType = TPregDiag ) then
                                               TempAnimals.FieldByName('NoCalves').AsInteger := 1;
                                            TempAnimals.Post;
                                         end;
                                      pbInfo.Position := TempAnimals.RecNo;
                                      TempAnimals.Next;
                                   end;
                                lRepeatPregDiagStatus.Visible := ( FPregDiagRepeatCount > 0 );
                                pInfo.Show;
                                pInfo.SendToBack;
                             end;

                          if ( WinData.EventType = TService ) then
                             lPregDiagEventsFound.Visible := ( FPregDiagEventCount > 0 );

                          if ( WinData.EventType = TMilkTemperament ) then
                             begin
                                // Load last years Milk Temperament Scores for ease of use.
                                LoadLastYearsMilkTempScore;
                                TempAnimals.Refresh;
                             end;

                          //   02/10/12 [V5.1 R0.1] /MK Change - If Service Event and Planned Bull events exist for the animal then LoadPlannedBullsAsServiceBull.
                          if ( WinData.EventType = TService ) then
                             begin
                                LoadPlannedBullsAsServiceBull;
                                TempAnimals.Refresh;
                             end;

                          if ( WinData.EventType = TWeight ) and ( TempAnimals.RecordCount > 0 ) then
                             begin
                                FWeighInfoQuery.Close;
                                FWeighInfoQuery.Open;
                                if ( FWeighInfoQuery.RecordCount > 0 ) then
                                   begin
                                      pbInfo.Min := 0;
                                      pbInfo.Max := TempAnimals.RecordCount;
                                      pbInfo.Step := 1;
                                      pInfo.Show;
                                      pInfo.BringToFront;
                                      pInfo.Refresh;
                                      TempAnimals.First;
                                      while ( not(TempAnimals.Eof) ) do
                                         begin
                                            TempAnimals.Edit;
                                            TempAnimals.FieldByName('LastWeighDate').Value := Null;
                                            TempAnimals.FieldByName('LastWeight').Value := Null;
                                            if ( FWeighInfoQuery.Locate('AnimalID',TempAnimals.FieldByName('AnimalID').AsInteger,[]) ) then
                                               begin
                                                  TempAnimals.FieldByName('LastWeighDate').Value := FWeighInfoQuery.FieldByName('WeighDate').AsDateTime;
                                                  TempAnimals.FieldByName('LastWeight').Value := FWeighInfoQuery.FieldByName('Weight').AsFloat;
                                               end;
                                            TempAnimals.Post;

                                            pbInfo.Position := TempAnimals.RecNo;

                                            TempAnimals.Next;
                                         end;
                                   end;
                                TempAnimals.Refresh;
                             end;
                          pInfo.Hide;

                          GenQuery.Close;
                          GenQuery.SQL.Clear;
                          GenQuery.SQL.Add('SELECT *');
                          GenQuery.SQL.Add('FROM '+TempAnimals.TableName);
                          GenQuery.Open;

                          AnimalGrid.DataSource.DataSet.Refresh;
                          TempAnimals.First;
                          AllAnimalsSelected := FSelectAll;

                          //   10/12/19 [V5.9 R1.5] /MK Change - If there are animals on the animal grid in multiple batch groups show orange warning box on Header section.
                          with FDupGrpsPerAnimals do
                             try
                                SQL.Clear;
                                SQL.Add('SELECT Count(GL.AnimalID) CountAID, GL.AnimalID AnimalID');
                                SQL.Add('FROM grps G, grplinks GL');
                                SQL.Add('WHERE ((G.Id= GL.GroupID) AND (UPPER(G.GroupType)= ' + UPPERCASE(QuotedStr(GroupTypesArray[gtBatch])) + '))');
                                SQL.Add('AND   (GL.AnimalID IN (SELECT AnimalID FROM '+TempAnimals.TableName+'))');
                                SQL.Add('GROUP BY GL.AnimalID');
                                SQL.Add('HAVING COUNT(GL.AnimalID) > 1');
                                Open;
                             except
                                on e : Exception do
                                   begin
                                      ApplicationLog.LogException(e);
                                      ApplicationLog.LogError(e.Message);
                                   end;
                             end;
                       end;
                 finally
                    //
                 end;
                 // SelectAll;

                 sbMessage.Panels[1].Text := IntToStr(TempAnimals.Recordcount) + cNoLoaded;

              end;

           // Open the Counter Query

           CountSelectedRecords;

           EnableDisableControls(TRUE);
           sbMessage.Panels[0].Text := '';

           Update;

        except
           on e : exception do
              begin
                 ShowMessage(E.Message+' - Unable to create Tables');
                 EnableDisableControls(TRUE);
              end;
        end

      else
        TempAnimals.Close;
   finally
      FDataLoading := False;
      Screen.Cursor := crDefault;
   end;

end;

procedure TfEventsByGroup.FormActivate(Sender: TObject);
begin
   HideHintStyleController();

   FHerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
   pInfo.Hide;
   // Hide Modules
   //Heats.TabVisible := FALSE;  // Leave this Hidden until its asked for !!

   if ( not(Def.Definition.dUseManCal) ) then
      begin
         PregDiag.TabVisible := False;
         Service.TabVisible := False;
         Heats.TabVisible := False;
         tsFertilityCheck.TabVisible := False;
         tsConditionScore.TabVisible := False;
         tsToBeCulled.TabVisible := False;
         tsMastitis.TabVisible := False;
         tsLameness.TabVisible := False;
      end;

   DryingOff.TabVisible := (FHerdType in [htDairy, htSuckler]);
   if ( FHerdType = htSuckler ) then
      DryingOff.Caption := 'Weaning'
   else
      DryingOff.Caption := 'Drying Off';

   //   12/09/12 [V5.0 R9.9] /MK Bug Fix - Set BVDTest and MilkTemperament TabVisible if FHerdType = Beef.
   //tsBVDTest.TabVisible := (FHerdType <> htBeef);
   tsMilkTemperament.TabVisible := (FHerdType = htDairy);
   tsPlannedBull.TabVisible := (FHerdType <> htBeef);
   Heats.TabVisible := (FHerdType <> htBeef);
   Service.TabVisible := (FHerdType <> htBeef);
   PregDiag.TabVisible := (FHerdType <> htBeef);
   DryingOff.TabVisible := (FHerdType <> htBeef);
   tsToBeCulled.TabVisible := (FHerdType <> htBeef);
   tsMastitis.TabVisible := (FHerdType = htDairy);
   tsLameness.TabVisible := (FHerdType = htDairy);

   if (Def.Definition.dUseQuotaMan) or
      (Def.Definition.dUseManCal) or
      (Def.Definition.dUseBeefMan) then
      Weighing.TabVisible := TRUE
   else
      Weighing.TabVisible := FALSE;

   Refresh;

   if ( WinData.EventType = TNoEvent ) then
      begin
         //   09/05/13 [V5.1 R7.1] /MK Change - Only show TempMovement tab if Temp Movement event.
         pgEvents.ActivePage := NoSelection;
         tsTempMovement.TabVisible := False;
      end
   else
      begin
         //   09/05/13 [V5.1 R7.1] /MK Change - Only show TempMovement tab if Temp Movement event.
         tsTempMovement.TabVisible := ( WinData.EventType = TMovement );
         case WinData.EventType of
            TPlannedBull     : pgEvents.ActivePageIndex := tsPlannedBull.PageIndex;
            TBulling         : pgEvents.ActivePageIndex := Heats.PageIndex;
            TService         : pgEvents.ActivePageIndex := Service.PageIndex;
            TDryOff          : pgEvents.ActivePageIndex := DryingOff.PageIndex;
            THealth          : pgEvents.ActivePageIndex := Health.PageIndex;
            THerdVaccination : pgEvents.ActivePageIndex := tsVaccination.PageIndex;
            TWeight          : pgEvents.ActivePageIndex := Weighing.PageIndex;
            TPregDiag        : pgEvents.ActivePageIndex := PregDiag.PageIndex;
            TMovement        : begin
                                 pgEvents.ActivePageIndex := tsTempMovement.PageIndex;
                                 //   05/08/12 [V5.0 R9.8] /MK Change - If Temp Movement Event then all other pages are not visible.
                                 NoSelection.TabVisible := False;
                                 Heats.TabVisible := False;
                                 Service.TabVisible := False;
                                 DryingOff.TabVisible := False;
                                 Health.TabVisible := False;
                                 Weighing.TabVisible := False;
                                 PregDiag.TabVisible := False;
                                 tsConditionScore.TabVisible := False;
                                 tsFertilityCheck.TabVisible := False;
                                 tsVaccination.TabVisible := False;
                                 tsMilkTemperament.TabVisible := False;
                                 tsPlannedBull.TabVisible := False;
                                 tsHerdTest.TabVisible := False;
                              end;
            TConditionScore  : pgEvents.ActivePageIndex := tsConditionScore.PageIndex;
            TFertilityCheck  : pgEvents.ActivePage := tsFertilityCheck;
            TMilkTemperament : pgEvents.ActivePageIndex := tsMilkTemperament.PageIndex;
            THerdTest        : pgEvents.ActivePageIndex := tsHerdTest.PageIndex;
            TToBeCulled      : pgEvents.ActivePageIndex := tsToBeCulled.PageIndex;
            TMastitis        : pgEvents.ActivePageIndex := tsMastitis.PageIndex;
            TLameness        : pgEvents.ActivePageIndex := tsLameness.PageIndex;
         end;
      end;

   pgEventsChange(pgEvents);

   // 07/09/12 [V5.0 R9.8] /MK Change - Set Mobility, Cleanliness and Abrasion components as visible if Country = England.
   lMobility.Visible := (CountryOfReg = England);
   dbceMobility.Visible := (CountryOfReg = England);
   lCleanliness.Visible := (CountryOfReg = England);
   dbceCleanliness.Visible := (CountryOfReg = England);
   lAbrasions.Visible := (CountryOfReg = England);
   dbcbAbrasions.Visible := (CountryOfReg = England);

   FUpdateApplicRateByWeightMsgShown := False;

   gbSexedSemen.Left := pStockBull.Left;

   OnActivate := nil;
end;

procedure TfEventsByGroup.eAnimalNoChange(Sender: TObject);
begin
end;

// Copy the details from the TabSheet to the Animals Grid Table
procedure TfEventsByGroup.CopyDetails;
var
   vActionDesc : Variant;
   ActionDescription : String;
begin
   try
      with TempAnimals do
         begin
            Edit;
            if SavingInfo then // Ensure all info is saved!!
               begin
                  if TempAnimals.FieldByName(fn_EventDate).AsDateTime <= 0 then
                     TempAnimals.FieldByName(fn_EventDate).AsDateTime := TempEvents.FieldByName(fn_EventDate).AsDateTime;

                  //if (WinData.EventType <> TTBTestDate) AND (WinData.EventType <> TBruceTest) AND (WinData.EventType <> TBVDTest) AND
                     //(WinData.EventType <> THerdTest) AND (Length(FieldByName('EventDesc').AsString) <= 0) then
                  if ( not(WinData.EventType in [TTBTestDate, TBruceTest, TBVDTest, THerdTest]) ) and
                     (Length(FieldByName('EventDesc').AsString) <= 0) then
                        FieldByName('EventDesc').AsString := TempEvents.FieldByName('EventDesc').AsString;

                  case WinData.EventType of
                     TPlannedBull,
                     TBulling : begin
                                  if FieldByName('PlannedBull').AsInteger <= 0 then
                                     FieldByName('PlannedBull').AsInteger := TempEvents.FieldByName('PlannedBull').AsInteger;
                                  if FieldByName('ObservedBy').AsInteger <= 0then
                                     FieldByName('ObservedBy').AsInteger := TempEvents.FieldByName('ObservedBy').AsInteger;
                                end;
                     TService : begin
                                  if FieldByName('ServiceBull').AsInteger <= 0 then
                                     FieldByName('ServiceBull').AsInteger := TempEvents.FieldByName('ServiceBull').AsInteger;
                                  if FieldByName('StrawsUsed').AsFloat <= 0 then
                                     FieldByName('StrawsUsed').AsFloat := TempEvents.FieldByName('StrawsUsed').AsFloat;
                                  if FieldByName('ServiceType').AsInteger <= 0 then
                                     FieldByName('ServiceType').AsInteger := TempEvents.FieldByName('ServiceType').AsInteger;
                                  if FieldByName('Technician').AsInteger <= 0 then
                                     FieldByName('Technician').AsInteger := TempEvents.FieldByName('Technician').AsInteger;
                                  if FieldByName('SexedSemen').AsInteger <= 0 then
                                     FieldByName('SexedSemen').AsInteger := TempEvents.FieldByName('SexedSemen').AsInteger;
                                end;
                     TLameness,
                     TMastitis,
                     THerdVaccination,
                     TDryOff,
                     THealth  : begin
                                  if ( not(Length(FieldByName('DrugBatchNo').AsString) > 0) ) then
                                     FieldByName('DrugBatchNo').AsString := TempEvents.FieldByName('DrugBatchNo').AsString;
                                  if FieldByName('DrugUsed').AsInteger <= 0 then
                                     FieldByName('DrugUsed').AsInteger := TempEvents.FieldByName('DrugUsed').AsInteger;
                                  if FieldByName('DrugPurchID').AsInteger <= 0 then
                                     FieldByName('DrugPurchID').AsInteger := TempEvents.FieldByName('DrugPurchID').AsInteger;
                                  if FieldByName('HealthCode').AsInteger <= 0 then
                                     FieldByName('HealthCode').AsInteger := TempEvents.FieldByName('HealthCode').AsInteger;
                                  if FieldByName('RateOfApplic').AsFloat <= 0 then
                                     FieldByName('RateOfApplic').AsFloat := TempEvents.FieldByName('RateOfApplic').AsFloat;
                                  if FieldByName('NoTimes').AsFloat <= 0 then
                                     FieldByName('NoTimes').AsFloat := TempEvents.FieldByName('NoTimes').AsFloat;
                                  if FieldByName('NoDays').AsFloat <= 0 then
                                     FieldByName('NoDays').AsFloat := TempEvents.FieldByName('NoDays').AsFloat;
                                  if FieldByName('AdminBy').AsInteger <= 0 then
                                     FieldByName('AdminBy').AsInteger := TempEvents.FieldByName('AdminBy').AsInteger;
                                  if FieldByName('ApplicMethod').AsInteger <= 0 then
                                     FieldByName('ApplicMethod').AsInteger := TempEvents.FieldByName('ApplicMethod').AsInteger;
                                  if FieldByName('FarmCode').AsInteger <= 0 then
                                     FieldByName('FarmCode').AsInteger := TempEvents.FieldByName('FarmCode').AsInteger;
                                  if FieldByName('VetPresc').AsInteger <= 0 then
                                     FieldByName('VetPresc').AsInteger := TempEvents.FieldByName('VetPresc').AsInteger;
                                  if FieldByName('GroupID').AsInteger <= 0 then
                                     FieldByName('GroupID').AsInteger := TempEvents.FieldByName('GroupID').AsInteger;
                                  if FieldByName('ReportInDays').AsInteger <= 0 then
                                     FieldByName('ReportInDays').AsInteger := TempEvents.FieldByName('ReportInDays').AsInteger;
                                  if Length(FieldByName('Disease').AsString) <= 0 then
                                     FieldByName('Disease').AsString := TempEvents.FieldByName('Disease').AsString;
                                  if FieldByName('ReportID').AsInteger <= 0 then
                                     FieldByName('ReportID').AsInteger := TempEvents.FieldByName('ReportID').AsInteger;
                                  if FieldByName('TreatmentUsed').AsInteger <= 0 then
                                     FieldByName('TreatmentUsed').AsInteger := TempEvents.FieldByName('TreatmentUsed').AsInteger;
                                  FieldByName('ManualComment').AsBoolean := FManualHealthComment;
                                end;
                     TWeight  : if FieldByName('Weight').AsFloat <= 0 then
                                   FieldByName('Weight').AsFloat := TempEvents.FieldByName('Weight').AsFloat;
                     TPregDiag: begin
                                  if FieldByName('NoCalves').AsInteger <= 0 then
                                     FieldByName('NoCalves').AsInteger := TempEvents.FieldByName('NoCalves').AsInteger;
                                  if FieldByName('DaysInCalf').AsInteger <= 0 then
                                     FieldByName('DaysInCalf').AsInteger := TempEvents.FieldByName('DaysInCalf').AsInteger;
                                  //   31/05/12 [V5.0 R6.0] /MK Bug Fix - Only Check If TempEvents PregnancyStatus Is Not Blank.
                                  if ( TempEvents.FieldByName('PregnancyStatus').AsString <> '' ) then
                                    if Length(FieldByName('PregnancyStatus').AsString) <= 0 then
                                       begin
                                          FieldByName('PregnancyStatus').AsString := TempEvents.FieldByName('PregnancyStatus').AsString;
                                          if ( UpperCase(TempEvents.FieldByName('PregnancyStatus').AsString) = 'YES' ) then
                                             FieldByName('EventDesc').AsString := 'Pregnant'
                                          else if ( UpperCase(TempEvents.FieldByName('PregnancyStatus').AsString) = 'NO' ) then
                                             FieldByName('EventDesc').AsString := 'Not Pregnant';
                                       end;
                                  if ( TempEvents.FieldByName('CalfType').AsString <> '' ) then
                                     if ( Length(FieldByName('CalfType').AsString) <= 0 ) then
                                          FieldByName('CalfType').AsString := TempEvents.FieldByName('CalfType').AsString;
                                  if ( TempEvents.FieldByName('Recheck').AsString <> '' ) then
                                     if ( Length(TempEvents.FieldByName('Recheck').AsString) <= 0 ) then
                                        FieldByName('Recheck').AsString := TempEvents.FieldByName('Recheck').AsString;
                                end;
                     TMovement: begin
                                  if FieldByName('MovedTo').AsInteger <= 0 then
                                     FieldByName('MovedTo').AsInteger := TempEvents.FieldByName('MovedTo').AsInteger;
                                end;
                     TConditionScore :
                                begin
                                   if FieldByName('Score').AsFloat <= 0 then
                                      FieldByName('Score').AsFloat := TempEvents.FieldByName('Score').AsFloat;
                                   FieldByName('AssociatedEventType').AsInteger := TempEvents.FieldByName('AssociatedEventType').AsInteger;
                                   if FieldByName('Score').AsFloat <= 0 then
                                      FieldByName('Score').AsFloat := TempEvents.FieldByName('Score').AsFloat;
                                   if ( CountryOfReg = England ) then
                                      begin
                                         if FieldByName('Mobility').AsFloat <= 0 then
                                            FieldByName('Mobility').AsFloat := TempEvents.FieldByName('Mobility').AsFloat;
                                         if FieldByName('Cleanliness').AsFloat <= 0 then
                                            FieldByName('Cleanliness').AsFloat := TempEvents.FieldByName('Cleanliness').AsFloat;
                                         FieldByName('Abrasions').AsBoolean := TempEvents.FieldByName('Abrasions').AsBoolean;
                                      end;
                                end;
                     TFertilityCheck :
                        begin
                           if FieldByName('Status').AsInteger <= 0 then
                              FieldByName('Status').AsInteger := TempEvents.FieldByName('Status').AsInteger;
                           if FieldByName('FertProgram').AsInteger <= 0 then
                              FieldByName('FertProgram').AsInteger := TempEvents.FieldByName('FertProgram').AsInteger;
                        end;
                     TMilkTemperament :
                        begin
                           if FieldByName('Score').AsInteger <= 0 then
                              FieldByName('Score').AsInteger := TempEvents.FieldByName('Score').AsInteger;
                        end;
                     THerdTest :
                        begin
                           if ( Length(FieldByName('Disease').AsString) <= 0 ) then
                              FieldByName('Disease').AsString := TempEvents.FieldByName('Disease').AsString;
                           if ( FieldByName('JohnesResult').AsInteger <= 0 ) then
                             FieldByName('JohnesResult').AsInteger := TempEvents.FieldByName('JohnesResult').AsInteger;
                        end;
                  end;
               end
            else
               begin
                  if CurrentField = FieldByName(fn_EventDate).FieldName then
                     FieldByName(fn_EventDate).AsDateTime := TempEvents.FieldByName(fn_EventDate).AsDateTime;

                  if not(WinData.EventType in [TTBTestDate, TBruceTest, TBVDTest, THerdTest]) then
                     if CurrentField = FieldByName('EventDesc').FieldName then
                        FieldByName('EventDesc').AsString := TempEvents.FieldByName('EventDesc').AsString;

                  if ( WinData.EventType = THealth ) and ( not(FManualHealthComment) ) then
                     if ( DrugUsed.EditValue > 0 ) and ( DrugUsed.EditValue <> Null ) and ( Length(RateOfApplic.Text) > 0 ) then
                        FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(DrugUsed.EditValue,StrToFloat(RateOfApplic.Text),WinData.EventType);

                  case WinData.EventType of
                     TPlannedBull,
                     TBulling : begin
                                  if CurrentField = FieldByName('PlannedBull').FieldName then
                                     FieldByName('PlannedBull').AsInteger := TempEvents.FieldByName('PlannedBull').AsInteger;
                                  if CurrentField = FieldByName('ObservedBy').FieldName then
                                     FieldByName('ObservedBy').AsInteger := TempEvents.FieldByName('ObservedBy').AsInteger;
                                end;
                     TService : begin
                                  if CurrentField = FieldByName('ServiceBull').FieldName then
                                     FieldByName('ServiceBull').AsInteger := TempEvents.FieldByName('ServiceBull').AsInteger;
                                  if CurrentField = FieldByName('StrawsUsed').FieldName then
                                     FieldByName('StrawsUsed').AsFloat := TempEvents.FieldByName('StrawsUsed').AsFloat;
                                  if CurrentField = FieldByName('ServiceType').FieldName then
                                     FieldByName('ServiceType').AsInteger := TempEvents.FieldByName('ServiceType').AsInteger;
                                  if CurrentField = FieldByName('Technician').FieldName then
                                     FieldByName('Technician').AsInteger := TempEvents.FieldByName('Technician').AsInteger;
                                  if CurrentField = FieldByName('SexedSemen').FieldName then
                                     FieldByName('SexedSemen').AsInteger := TempEvents.FieldByName('SexedSemen').AsInteger;
                                end;
                     TLameness,
                     TMastitis,
                     THerdVaccination,
                     TDryOff,
                     THealth  : begin
                                  if CurrentField = FieldByName('DrugUsed').FieldName then
                                     FieldByName('DrugUsed').AsInteger := TempEvents.FieldByName('DrugUsed').AsInteger;
                                  if CurrentField = FieldByName('DrugBatchNo').FieldName then
                                     FieldByName('DrugBatchNo').AsString := TempEvents.FieldByName('DrugBatchNo').AsString;
                                  if CurrentField = FieldByName('DrugPurchID').FieldName then
                                     FieldByName('DrugPurchID').AsInteger := TempEvents.FieldByName('DrugPurchID').AsInteger;
                                  if CurrentField = FieldByName('HealthCode').FieldName then
                                     FieldByName('HealthCode').AsInteger := TempEvents.FieldByName('HealthCode').AsInteger;
                                  if CurrentField = FieldByName('RateOfApplic').FieldName then
                                     FieldByName('RateOfApplic').AsFloat := TempEvents.FieldByName('RateOfApplic').AsFloat;
                                  if CurrentField = FieldByName('NoTimes').FieldName then
                                     FieldByName('NoTimes').AsFloat := TempEvents.FieldByName('NoTimes').AsFloat;
                                  if CurrentField = FieldByName('NoDays').FieldName then
                                     FieldByName('NoDays').AsFloat := TempEvents.FieldByName('NoDays').AsFloat;
                                  if CurrentField = FieldByName('AdminBy').FieldName then
                                     FieldByName('AdminBy').AsInteger := TempEvents.FieldByName('AdminBy').AsInteger;
                                  if CurrentField = FieldByName('ApplicMethod').FieldName then
                                     FieldByName('ApplicMethod').AsInteger := TempEvents.FieldByName('ApplicMethod').AsInteger;
                                  if CurrentField = 'FarmCode' then
                                     FieldByName('FarmCode').AsInteger := TempEvents.FieldByName('FarmCode').AsInteger;
                                  if CurrentField = 'VetPresc' then
                                     FieldByName('VetPresc').AsInteger := TempEvents.FieldByName('VetPresc').AsInteger;
                                  if CurrentField = 'GroupID' then
                                     FieldByName('GroupID').AsInteger := TempEvents.FieldByName('GroupID').AsInteger;
                                  if CurrentField = 'ReportInDays' then
                                     FieldByName('ReportInDays').AsInteger := TempEvents.FieldByName('ReportInDays').AsInteger;
                                  if CurrentField = 'Disease' then
                                     FieldByName('Disease').AsString := TempEvents.FieldByName('Disease').AsString;
                                  if CurrentField = 'ReportID' then
                                     FieldByName('ReportID').AsInteger := TempEvents.FieldByName('ReportID').AsInteger;
                                  FieldByName('ManualComment').AsBoolean := FManualHealthComment;
                                  if CurrentField = 'AreaTreatedFL' then
                                     FieldByName('AreaTreatedFL').AsBoolean := TempEvents.FieldByName('AreaTreatedFL').AsBoolean;
                                  if CurrentField = 'AreaTreatedFR' then
                                     FieldByName('AreaTreatedFR').AsBoolean := TempEvents.FieldByName('AreaTreatedFR').AsBoolean;
                                  if CurrentField = 'AreaTreatedBL' then
                                     FieldByName('AreaTreatedBL').AsBoolean := TempEvents.FieldByName('AreaTreatedBL').AsBoolean;
                                  if CurrentField = 'AreaTreatedBR' then
                                     FieldByName('AreaTreatedBR').AsBoolean := TempEvents.FieldByName('AreaTreatedBR').AsBoolean;
                                  if CurrentField = 'TreatmentUsed' then
                                     FieldByName('TreatmentUsed').AsInteger := TempEvents.FieldByName('TreatmentUsed').AsInteger;
                                end;
                     TWeight  : if CurrentField = FieldByName('Weight').FieldName then
                                   FieldByName('Weight').AsFloat := TempEvents.FieldByName('Weight').AsFloat;
                     TPregDiag: begin
                                   if CurrentField = FieldByName('NoCalves').FieldName then
                                      FieldByName('NoCalves').AsInteger := TempEvents.FieldByName('NoCalves').AsInteger;
                                   if CurrentField = FieldByName('DaysInCalf').FieldName then
                                      begin
                                         if ( TempEvents.FieldByName('DaysInCalf').AsInteger > 0 ) and
                                            ( TempEvents.FieldByName('DaysInCalf').AsInteger >= 20 ) then
                                            FieldByName('DaysInCalf').AsInteger := TempEvents.FieldByName('DaysInCalf').AsInteger
                                         else
                                            FieldByName('DaysInCalf').AsVariant := Null;
                                      end;
                                   if CurrentField = FieldByName('PregnancyStatus').FieldName then
                                      begin
                                         FieldByName('PregnancyStatus').AsString := TempEvents.FieldByName('PregnancyStatus').AsString;
                                         if ( UpperCase(TempEvents.FieldByName('PregnancyStatus').AsString) = 'YES' ) then
                                            FieldByName('EventDesc').AsString := 'Pregnant'
                                         else if ( UpperCase(TempEvents.FieldByName('PregnancyStatus').AsString) = 'NO' ) then
                                            FieldByName('EventDesc').AsString := 'Not Pregnant';
                                      end;
                                   if CurrentField = FieldByName('CalfType').FieldName then
                                      FieldByName('CalfType').AsString := TempEvents.FieldByName('CalfType').AsString;
                                   if CurrentField = FieldByName('Recheck').FieldName then
                                      FieldByName('Recheck').AsString := TempEvents.FieldByName('Recheck').AsString;
                                end;
                     TMovement: begin
                                   if CurrentField = 'MovedTo' then
                                     FieldByName('MovedTo').AsInteger := TempEvents.FieldByName('MovedTo').AsInteger;
                                end;
                     TConditionScore :
                                begin
                                   if CurrentField = 'Score' then
                                      FieldByName('Score').AsFloat := TempEvents.FieldByName('Score').AsFloat
                                   else if CurrentField = 'AssociatedEventType' then
                                      FieldByName('AssociatedEventType').AsInteger := TempEvents.FieldByName('AssociatedEventType').AsInteger;
                                   if ( CountryOfReg = England ) then
                                      begin
                                         if CurrentField = 'Mobility' then
                                            FieldByName('Mobility').AsFloat := TempEvents.FieldByName('Mobility').AsFloat;
                                         if CurrentField = 'Cleanliness' then
                                            FieldByName('Cleanliness').AsFloat := TempEvents.FieldByName('Cleanliness').AsFloat;
                                         if CurrentField = 'Abrasions' then
                                            FieldByName('Abrasions').AsBoolean := TempEvents.FieldByName('Abrasions').AsBoolean;
                                      end;
                                end;
                     TFertilityCheck :
                        begin
                           if (CurrentField = 'Status') then
                              FieldByName('Status').AsInteger := TempEvents.FieldByName('Status').AsInteger
                           else if (CurrentField = 'Action') then
                              begin
                                 FieldByName('Action').AsInteger := TempEvents.FieldByName('Action').AsInteger;
                                 //   29/11/18 [V5.8 R5.5] /MK Change - If action is not start program then clear the TempAnimals.FertProgram if it was previously set.
                                 ActionDescription := HerdLookup.GetFertilityCheckActionDescription(TempEvents.FieldByName('Action').AsInteger);
                                 if ( UpperCase(ActionDescription) <> 'START PROGRAM' ) and ( FieldByName('FertProgram').AsInteger > 0 ) then
                                    FieldByName('FertProgram').AsVariant := Null;
                              end
                           else if (CurrentField = 'FertProgram' ) then
                              FieldByName('FertProgram').AsInteger := TempEvents.FieldByName('FertProgram').AsInteger;
                        end;
                     TMilkTemperament :
                        begin
                           if (CurrentField = 'Score') then
                              FieldByName('Score').AsInteger := TempEvents.FieldByName('Score').AsInteger;
                        end;
                     THerdTest :
                        begin
                           if CurrentField = 'Disease' then
                              FieldByName('Disease').AsString := TempEvents.FieldByName('Disease').AsString;
                           if ( CurrentField = 'JohnesResult' ) then
                              FieldByName('JohnesResult').AsInteger := TempEvents.FieldByName('JohnesResult').AsInteger;
                        end;
               end;
            end;
         end;

   except
      on e : exception do
         begin
            ShowMessage('Error posting record - '+e.Message);
            Abort;
         end;
   end;
end;

// Copy the details from the TabSheet to the Animals Grid Table
procedure TfEventsByGroup.ClearDetails;
begin
   try
      with TempAnimals do
         begin
            Edit;
            FieldByName(fn_EventDate).AsVariant := Null;
            if not(WinData.EventType in [TTBTestDate, TBruceTest, TBVDTest, THerdTest])   then
               FieldByName('EventDesc').AsString := '';
            case WinData.EventType of
               TPlannedBull,
               TBulling : begin
                            FieldByName('PlannedBull').AsInteger := 0;
                            FieldByName('ObservedBy').AsInteger := 0;
                          end;
               TService : begin
                            FieldByName('ServiceBull').AsInteger := 0;
                            FieldByName('StrawsUsed').AsFloat := 0;
                            FieldByName('ServiceType').AsInteger := 0;
                            FieldByName('Technician').AsInteger := 0;
                            FieldByName('SexedSemen').AsInteger := 0;
                          end;
               TLameness,
               TMastitis,
               THerdVaccination,
               TDryOff,
               THealth  : begin
                            FieldByName('DrugPurchID').AsInteger := 0;
                            FieldByName('DrugBatchNo').AsString := NULL;
                            FieldByName('DrugUsed').AsInteger := 0;
                            FieldByName('HealthCode').AsInteger := 0;
                            FieldByName('RateOfApplic').AsVariant := NULL;
                            FieldByName('TotalApplicRate').AsVariant := NULL;
                            FieldByName('NoTimes').AsVariant := 0;
                            FieldByName('NoDays').AsVariant := 0;
                            FieldByName('AdminBy').AsInteger := 0;
                            FieldByName('ApplicMethod').AsInteger := 0;
                            if CountryOfReg = Ireland then
                               FieldByName('FarmCode').AsInteger := 0;
                            FieldByName('VetPresc').AsInteger := 0;
                            //FieldByName('GroupID').AsInteger := 0;
                            FieldByName('ReportInDays').AsInteger := 0;
                            FieldByName('ReportID').AsInteger := 0;
                            FManualHealthComment := False;
                            if ( WinData.EventType in [TMastitis, TLameness] ) then
                               begin
                                  FieldByName('AreaTreatedFL').AsBoolean := False;
                                  FieldByName('AreaTreatedFR').AsBoolean := False;
                                  FieldByName('AreaTreatedBL').AsBoolean := False;
                                  FieldByName('AreaTreatedBR').AsBoolean := False;
                                  FieldByName('TreatmentUsed').AsInteger := 0;
                               end;
                          end;
               TWeight  : FieldByName('Weight').AsVariant := NULL;
               TPregDiag: begin
                            FieldByName('NoCalves').AsVariant := 1;;
                            FieldByName('DaysInCalf').AsVariant := NULL;
                            FieldByName('PregnancyStatus').AsString := '';
                            FieldByName('CalfType').AsString := '';
                            FieldByName('Recheck').AsString := '';
                          end;
               TMovement: begin
                             FieldByName('MovedTo').AsInteger := 0;
                          end;
               TConditionScore :
                          begin
                             FieldByName('Score').Clear;
                             FieldByName('AssociatedEventType').Clear;
                             if ( CountryOfReg = England ) then
                                begin
                                   FieldByName('Mobility').Clear;
                                   FieldByName('Cleanliness').Clear;
                                   FieldByName('Abrasions').Clear;
                                end;
                          end;
               TFertilityCheck :
                  begin
                     FieldByName('Status').Clear;
                     FieldByName('Action').Clear;
                     FieldByName('FertProgram').Clear;
                  end;
               TMilkTemperament :
                  begin
                     FieldByName('Score').Clear;
                  end;
               THerdTest :
                  begin
                     FieldByName('Disease').Clear;
                     FieldByName('JohnesResult').AsInteger := 0;
                  end;
            end;
         end;
   except
      ShowMessage('Cannot Clear Details');
   end;
end;

// Set the Animal to be selected
procedure TfEventsByGroup.AnimalGridDblClick(Sender: TObject);
begin
   //   23/10/13 [V5.2 R3.8] /MK Bug Fix - Only allow double-click on "Selected" field column.
   if ( AnimalGrid.Col <> 1 ) then Exit;

   if not TempAnimalsSelected.AsBoolean then
      begin
         if NOT WinData.ActiveMovements(TempAnimals.FieldByName('AnimalID').AsInteger,
                                        TempAnimals.FieldByName('HerdID').AsInteger,
                                        TempAnimals.FieldByName('AnimalNo').AsString,
                                        TempAnimals.FieldByName('NatIdNum').AsString,FALSE,FALSE) then
            begin
               TempAnimals.Edit;
               {
               if TempAnimalsSelected.AsBoolean then
                  TempAnimalsSelected.AsBoolean := FALSE
               else
                  TempAnimalsSelected.AsBoolean := TRUE;
               }
               TempAnimals.Post;
               CountSelectedRecords;
               AllAnimalsSelected := FALSE;
            end;
      end
   else // allow deselection of record.
      begin
         TempAnimals.Edit;
         {
         if TempAnimalsSelected.AsBoolean then
            TempAnimalsSelected.AsBoolean := FALSE
         else
            TempAnimalsSelected.AsBoolean := TRUE;
         }
         TempAnimals.Post;
         CountSelectedRecords;
         AllAnimalsSelected := FALSE;
      end;
end;

// Bulling Observed by LookUp
procedure TfEventsByGroup.ObservedByCloseUp(Sender: TObject);
begin
   if ObservedBy.Value = '0' Then
      begin
         GenLookUpType := TObservedBy;
         uGenLookSetUp.ShowTheForm(TRUE);
      end;
end;

// Don;t allow records be added to the AnimalsTable
procedure TfEventsByGroup.TempAnimalsNewRecord(DataSet: TDataSet);
begin
   // Stop no Insert
   DataSet.Cancel;
end;

// Set the Help
procedure TfEventsByGroup.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('onfarmevents.htm');
end;

procedure TfEventsByGroup.sbExitClick(Sender: TObject);
begin
   Close;
end;

// Sets all animals in the Grid to selected
procedure TfEventsByGroup.SelectAll;

   procedure DoSelectAll;
   begin
   end;

var
   MyBookMark : TBookMark;
begin
   // Update the Selected Animals with the new info.
   try
      MyBookMark := TempAnimals.GetBookmark;
      EnableDisableControls(FALSE);
      // TempAnimals.DisableControls;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE ' + TempAnimals.TableName);
            // SQL.Add('UPDATE ' + TempAnimals.TableName + ' TA');
            SQL.Add('SET Selected=TRUE');
            ExecSQL;
         end;
   finally
      TempAnimals.GotoBookmark(MyBookMark);
      TempAnimals.FreeBookmark(MyBookMark);
      // TempAnimals.EnableControls;
      CountSelectedRecords;
      EnableDisableControls(TRUE);
   end;
end;

// Updates all animals that have been selected
procedure TfEventsByGroup.UpdateAnimals(Sender : TObject);
var
   MyBookMark : TBookMark;
   LastCalvingDate : TDateTime;
   iLastCalvingLact : Integer;
begin
   // Update the Selected Animals with the new info.
   if (TempAnimals.Active) and (TempEvents.Active) and (ItemChanged) then
      begin
         ItemChanged := FALSE;
         try
            //   19/06/13 [V5.1 R7.5] /MK Change - Set new boolean FManualHealthComment if TempEventsEventDesc changed by user
            //                                     so program does not update TempEventsEventDesc with Health + DrugCode.
            if ( Sender is TDBEdit ) then
               if ( (Sender as TDBEdit).DataField = 'EventDesc' ) then
                  begin
                     //   09/10/13 [V5.2 R2.0] /MK Bug Fix - Only setting FManualHealthComment if EventDesc <> Health and DrugUsed selected.
                     //                                      Did not work if EventDesc was changed before selecting a drug.
                     if ( WinData.EventType = THealth ) then
                        FManualHealthComment := ( TempEvents.FieldByName('EventDesc').AsString <> 'Health' );
                     if ( WinData.EventType = TDryOff ) then
                        begin
                           if ( FHerdType = htDairy ) then
                              FManualHealthComment := ( TempEvents.FieldByName('EventDesc').AsString <> 'Dry Off' )
                           else if ( FHerdType = htSuckler ) then
                              FManualHealthComment := ( TempEvents.FieldByName('EventDesc').AsString <> 'Weaning' );
                        end;
                     if ( WinData.EventType = THerdVaccination ) then
                        FManualHealthComment := ( TempEvents.FieldByName('EventDesc').AsString <> 'Vaccination' );
                     if ( WinData.EventType = TMastitis ) then
                        FManualHealthComment := ( TempEvents.FieldByName('EventDesc').AsString <> 'Mastitis' );
                     if ( WinData.EventType = TLameness ) then
                        FManualHealthComment := ( TempEvents.FieldByName('EventDesc').AsString <> 'Lameness' );
                  end;

            TempEvents.Post;
            TempEvents.Edit;
            EnableDisableControls(FALSE);
            MyBookMark := TempAnimals.GetBookmark;

            TempAnimals.First;
            // Show the Info Panel
            sbMessage.Panels[0].Text := cCopyingDetails;
            pbInfo.Min := 0;
            pbInfo.Max := TempAnimals.RecordCount;
            pbInfo.Step := 1;
            pInfo.Show;
            pInfo.BringToFront;
            pInfo.Refresh;
            while NOT TempAnimals.EOF do
               begin
                  if ( SavingInfo ) and (TempAnimalsSelected.AsBoolean) then
                     begin
                        { SP 27/01/2003 }
                        if ( TempEvents.FieldByName(fn_EventDate).AsDateTime < TempAnimals.FieldByName('DateOfBirth').AsDateTime ) then
                           begin
                              if MessageDLG(Format('Animal No %s'+#13#10 +
                                                   'National ID %s' + #13#10 + #13#10 +
                                                   'Date of Birth is after the event date' + #13#10 +
                                                   'Do you want to continue',
                                                   [TempAnimals.FieldByName('AnimalNo').AsString,
                                                    TempAnimals.FieldByName('NatIdNum').AsString]),mtWarning,[mbYes,MbNo],0) = mrYES then
                                 begin
                                    TempAnimals.Edit;
                                    TempAnimalsSelected.AsBoolean := FALSE;
                                    TempAnimals.Post;
                                 end
                              else
                                 Break;  // Break out of the Loop
                           end;

                        //   27/03/12 [V5.0 R4.5] /MK Change - Added Check For Dry Off Event If LastCalvingDate > DryOff Date Entered.
                        if ( WinData.EventType = TDryOff ) then
                           begin
                              LastCalvingDate := WinData.EventDataHelper.GetLastEventDate(TempAnimals.FieldByName('AnimalID').AsInteger,
                                                                                          TempAnimals.FieldByName('LactNo').AsInteger,
                                                                                          cCalvingEvent);
                              if ( TempEvents.FieldByName(fn_EventDate).AsDateTime < LastCalvingDate ) then
                                 begin
                                    //   28/01/16 [V5.5 R2.4] /MK Change - Get LactNo of last calving date and check that no drying off was created in this lactno.
                                    iLastCalvingLact := 0;
                                    iLastCalvingLact := WinData.EventDataHelper.GetLastCalvingLactationNum(TempAnimals.FieldByName('AnimalID').AsInteger,
                                                                                                           TempAnimals.FieldByName('LactNo').AsInteger,
                                                                                                           LastCalvingDate);
                                    if ( WinData.EventDataHelper.GetLastEventDate(TempAnimals.FieldByName('AnimalID').AsInteger,
                                                                                  iLastCalvingLact,
                                                                                  CDryOffEvent) > 0 ) then
                                       begin
                                          MessageDlg(Format('Animal No %s,'+cCRLF+
                                                            'National ID %s,'+cCRLF+
                                                            'already has a drying off event in the lactation %s.'+cCRLF+
                                                            'This animal will be ignored.',
                                                            [TempAnimals.FieldByName('AnimalNo').AsString,
                                                             TempAnimals.FieldByName('NatIdNum').AsString,
                                                             IntToStr(iLastCalvingLact)]),mtError,[mbOK],0);
                                          TempAnimals.Edit;
                                          TempAnimalsSelected.AsBoolean := FALSE;
                                          TempAnimals.Post;
                                       end
                                    else if ( MessageDlg(Format('Animal No %s'+#13#10 +
                                                                'National ID %s' + #13#10 + #13#10 +
                                                                'Dry Off Date entered is prior to last Calving date.' + #13#10 +
                                                                'Do you want to continue',
                                                                [TempAnimals.FieldByName('AnimalNo').AsString,
                                                                 TempAnimals.FieldByName('NatIdNum').AsString]),mtWarning,[mbYes,MbNo],0) = mrNo ) then
                                       begin
                                          TempAnimals.Edit;
                                          TempAnimalsSelected.AsBoolean := FALSE;
                                          TempAnimals.Post;
                                       end
                                    else
                                       Break;  // Break out of the Loop
                                 end
                           end;

                        if ( not(WinData.EventType in [TTBTestDate, TBruceTest]) ) then // Allow test dates to enter before Purchase date
                           begin
                              if ( (not TempAnimals.FieldByName('PDate').IsNull ) and (TempEvents.FieldByName(fn_EventDate).AsDateTime <
                                                                                     TempAnimals.FieldByName('PDate').AsDateTime) ) then
                                  begin
                                      if MessageDLG(Format('Animal No.: %s'+#13#10 +
                                                           'National Id. No.: %s' + #13#10 + #13#10 +
                                                           'The chosen event date is prior to this animals purchase date.' +#13#10+#13#10+
                                                           'Do you want to save the event for this animal?',
                                                           [TempAnimals.FieldByName('AnimalNo').AsString,
                                                            TempAnimals.FieldByName('NatIdNum').AsString]),mtWarning,[mbYes,MbNo],0) = mrNo then
                                         begin
                                            TempAnimals.Edit;
                                            TempAnimalsSelected.AsBoolean := FALSE;
                                            TempAnimals.Post;
                                         end
                                  end;
                           end;

                        if ( WinData.EventType = THerdTest ) then
                           begin
                              if ( Length(TempAnimals.FieldByName('Disease').AsString) <= 0 ) then
                                 begin
                                    MessageDLG(Format('Animal No %s'+#13#10 +
                                                      'National ID %s' + #13#10 + #13#10 +
                                                      'No Disease has been selected.',
                                                      [TempAnimals.FieldByName('AnimalNo').AsString,
                                                       TempAnimals.FieldByName('NatIdNum').AsString]),mtError,[mbOK],0);
                                    TempAnimals.Edit;
                                    TempAnimalsSelected.AsBoolean := False;
                                    TempAnimals.Post;
                                 end;
                           end;

                        if ( WinData.EventType = TPlannedBull ) then
                           begin
                              if ( TempAnimals.FieldByName('PlannedBull').AsInteger <= 0 ) then
                                 begin
                                    MessageDLG(Format('Animal No %s'+#13#10 +
                                                      'National ID %s' + #13#10 + #13#10 +
                                                      'No planned bull has been selected.',
                                                      [TempAnimals.FieldByName('AnimalNo').AsString,
                                                       TempAnimals.FieldByName('NatIdNum').AsString]),mtError,[mbOK],0);
                                    TempAnimals.Edit;
                                    TempAnimalsSelected.AsBoolean := False;
                                    TempAnimals.Post;
                                 end;
                           end;

                     end;
                  CopyDetails;
                  // ClearDetails;
                  pbInfo.Position := TempAnimals.RecNo;

                  TempAnimals.Next;
               end;
         finally
            CountSelectedRecords;
            sbMessage.Panels[0].Text := '';
            pInfo.Hide;
            Refresh;
            TempAnimals.GotoBookmark(MyBookMark);
            TempAnimals.FreeBookmark(MyBookMark);
            EnableDisableControls(TRUE);
         end;
      end;
end;

// Write the other event record i.e. Bulling a bulling record e.t.c.
procedure TfEventsByGroup.WriteTheOtherEvent(CID : Integer);
var
   iDrugPurchID : Integer;
begin
   with WriteOther do
      begin
         // Do the Other Tables Info
         Append;
         FieldByName('EventID').AsInteger := CID;
         case WinData.EventType of
            TBulling :  begin
                           FieldByName('PlannedBull').AsInteger := GenQuery.FieldByName('PlannedBull').AsInteger;
                           FieldByName('ObservedBy').AsInteger := GenQuery.FieldByName('ObservedBy').AsInteger;
                        end;
            TService :  begin
                           FieldByName('ServiceBull').AsInteger := GenQuery.FieldByName('ServiceBull').AsInteger;
                           FieldByName('AmountOfStraw').AsFloat := GenQuery.FieldByName('StrawsUsed').AsFloat;
                           FieldByName('ServiceType').AsInteger := GenQuery.FieldByName('ServiceType').AsInteger;
                           FieldByName('Technician').AsInteger := GenQuery.FieldByName('Technician').AsInteger;
                           //   09/09/13 [V5.2 R1.0] /MK Change - If animal served and has previous PD event then
                           //                                     change PregStatus of PD Event to False.
                           WinData.ClearPostivePregDiag(GenQuery.FieldByName('AnimalID').AsInteger,
                                                        GenQuery.FieldByName('LactNo').AsInteger,
                                                        GenQuery.FieldByName('EventDate').AsDateTime,False);
                           FieldByName('SexedSemen').AsInteger := GenQuery.FieldByName('SexedSemen').AsInteger;
                        end;
            TLameness,
            TMastitis,
            THerdVaccination,
            TDryOff,
            THealth  :  begin
                           FieldByName('DrugUsed').AsInteger := GenQuery.FieldByName('DrugUsed').AsInteger;
                           FieldByName('DrugBatchNo').AsString := GenQuery.FieldByName('DrugBatchNo').AsString;

                           if ( GenQuery.FieldByName('DrugPurchID').AsInteger <= 0 ) then
                              begin
                                 iDrugPurchID := WinData.GetDrugPurchID(GenQuery.FieldByName('DrugUsed').AsInteger,
                                                                        GenQuery.FieldByName('DrugBatchNo').AsString,
                                                                        GenQuery.FieldByName(fn_EventDate).AsDateTime);
                                 if ( iDrugPurchID > 0 ) then
                                    FieldByName('DrugPurchID').AsInteger := iDrugPurchID;
                              end
                           else
                              FieldByName('DrugPurchID').AsInteger := GenQuery.FieldByName('DrugPurchID').AsInteger;

                           FieldByName('HealthCode').AsInteger := GenQuery.FieldByName('HealthCode').AsInteger;
                           FieldByName('RateApplic').AsFloat := GenQuery.FieldByName('RateOfApplic').AsFloat;
                           FieldByName('NoTimes').AsFloat := GenQuery.FieldByName('NoTimes').AsFloat;
                           FieldByName('NoDays').AsFloat := GenQuery.FieldByName('NoDays').AsFloat;
                           FieldByName('AdminBy').AsInteger := GenQuery.FieldByName('AdminBy').AsInteger;
                           FieldByName('ApplicMethod').AsInteger := GenQuery.FieldByName('ApplicMethod').AsInteger;
                           FieldByName('VetPresc').AsInteger := GenQuery.FieldByName('VetPresc').AsInteger;
                           FieldByName('FarmCode').AsInteger := GenQuery.FieldByName('FarmCode').AsInteger;

                           //   03/06/16 [V5.5 R5.8] /MK Bug Fix - HealthDoseUnitUsed/HealthPurchUnitUsed were never updated by block health event.
                           FieldByName('DoseUnitUsed').AsFloat := HerdLookup.MedicineUnitUsed(GenQuery.FieldByName('DrugUsed').AsInteger,utDose);
                           FieldByName('PurchUnitUsed').AsFloat := HerdLookup.MedicineUnitUsed(GenQuery.FieldByName('DrugUsed').AsInteger,utPurchase);

                           if ( WinData.EventType = THerdVaccination ) then
                              begin
                                 FieldByName('ReportInDays').AsInteger := GenQuery.FieldByName('ReportInDays').AsInteger * 7;
                                 //   04/11/15 [V5.5 R0.1] /MK Bug Fix - Non multi drug vaccination was not saving disease to health table.
                                 if ( CountryOfReg = Ireland ) then
                                    begin
                                       if ( HerdLookup.qHerdVaccineType.Locate('Description',GenQuery.FieldByName('Disease').AsString,[]) ) then
                                          FieldByName('HealthCode').AsInteger := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
                                    end
                                 else
                                    begin
                                       if ( HerdLookup.qHerdVaccineType.Locate('Description',GenQuery.FieldByName('Disease').AsString,[]) ) then
                                          FieldByName('FarmCode').AsInteger := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
                                    end
                              end
                           else
                              FieldByName('ReportInDays').AsInteger := GenQuery.FieldByName('ReportInDays').AsInteger;

                           FieldByName('ReportID').AsInteger := GenQuery.FieldByName('ReportID').AsInteger;
                           FieldByName('ManualComment').AsBoolean := GenQuery.FieldByName('ManualComment').AsBoolean;
                        end;
            TWeight  :  FieldByName('Weight').AsFloat := GenQuery.FieldByName('Weight').AsFloat;
            TPregDiag:  begin
                           FieldByName('NoCalves').AsInteger := GenQuery.FieldByName('NoCalves').AsInteger;
                           FieldByName('DaysInCalf').AsInteger := GenQuery.FieldByName('DaysInCalf').AsInteger;
                           if UPPERCASE(GenQuery.FieldByName('PregnancyStatus').AsString) = 'YES' then
                              FieldByName('PregnancyStatus').AsBoolean := TRUE
                           else
                              FieldByName('PregnancyStatus').AsBoolean := FALSE;
                           FieldByName('CalfType').AsString := GenQuery.FieldByName('CalfType').AsString;
                           if UPPERCASE(GenQuery.FieldByName('Recheck').AsString) = 'YES' then
                              FieldByName('Recheck').AsBoolean := TRUE
                           else
                              FieldByName('Recheck').AsBoolean := FALSE;
                        end;
            TMovement: begin
                           FieldByName('AID').AsInteger := WriteEvents.FieldByName('AnimalID').AsInteger;
                           FieldByName('MovedTo').AsInteger := GenQuery.FieldByName('MovedTo').AsInteger;
                           FieldByName('StillOffFarm').AsBoolean := True;
                       end;
            TConditionScore :
                       begin
                           FieldByName('Score').AsFloat := GenQuery.FieldByName('Score').AsFloat;
                           FieldByName('AssociatedEventType').AsFloat := GenQuery.FieldByName('Score').AsFloat;
                           if ( CountryOfReg = England ) then
                              begin
                                 FieldByName('Mobility').AsFloat := GenQuery.FieldByName('Mobility').AsFloat;
                                 FieldByName('Cleanliness').AsFloat := GenQuery.FieldByName('Cleanliness').AsFloat;
                                 FieldByName('Abrasions').AsBoolean := GenQuery.FieldByName('Abrasions').AsBoolean;
                              end;
                       end;
            TFertilityCheck :
               begin
                  FieldByName('Status').AsInteger := GenQuery.FieldByName('Status').AsInteger;
                  FieldByName('Action').AsInteger := GenQuery.FieldByName('Action').AsInteger;
                  FieldByName('FertProgram').AsInteger := GenQuery.FieldByName('FertProgram').AsInteger;
               end;
            TMilkTemperament :
               begin
                  FieldByName('Score').AsInteger := GenQuery.FieldByName('Score').AsInteger;
               end;
            TPlannedBull : begin
                              FieldByName('PlannedBull').AsInteger := GenQuery.FieldByName('PlannedBull').AsInteger;
                              //   27/04/17 [V5.6 R7.1] /MK Change - Set new indicator of the recommended (by ICBF) bull to next available indicator.
                              FieldByName('RcmdBullInd').AsInteger := WinData.FEventDataHelper.GetPlannedBullRcmdBullInd(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                                                         GenQuery.FieldByName('LactNo').AsInteger,
                                                                                                                         GenQuery.FieldByName('EventDate').AsDateTime);
                           end;
         end;
         Post;
      end;
end;

// Save all ticked animals with an event of the specified type
procedure TfEventsByGroup.sbSaveClick(Sender: TObject);
var
   i,
   CountOfRecords,
   CurrentID,
   AnimalPostCount,
   PregBoolCount,
   iCalvingLactNo,
   iRcmdBullInd : Integer;
   OkToUpdate : Boolean;
   ActionDescription : string;
   sServiceCount : String;
   bMessageShown : Boolean;
   bMessageCancelled : Boolean;
   SaleDate : TDateTime;
   iaAnimalsDry : array of Integer;

const
   cNoDrugSelected = 'No drug selected. Do you wish to continue saving this event?';
   cNoDrugSelectedButApplicRate = 'Application rate entered but No Drug Used selected.'+cCRLF+
                                  'Please select a drug used.';
   cNoDrugSelectedButReasonNI = 'Reason for treatment is selected but No Drug Used was selected.'+cCRLF+
                                 'Please select a drug used.';
   cNoDrugSelectedButAdminBy = 'Administered By selected but No Drug Used selected.'+cCRLF+
                               'Please select a drug used.';
   cDrugSelectedNoApplicRate = 'Drug selected but no application rate entered.'+cCRLF+
                               'Please enter an application rate.';
   cDrugSelectedNoReasonNI = 'Drug selected but no Reason for treatment selected.'+cCRLF+
                             'Please select a Reason for treatment.';
   cDrugSelectedNoAdminBy = 'Drug selected but no administered by selected.'+cCRLF+
                            'Please select an administered by.';
   cDrugSelectedNoPrescBy = 'Drug selected but no prescribed by selected.'+cCRLF+
                            'Please select a prescribed by.';
   cNoDiseaseSelected = 'No disease selected. Please select a disease.';
   cDiseaseSelectedNoDrug = 'Disease selected but no drug selected'+cCRLF+
                            'Please select a drug used.';
   cDrugSelectedSaleWithinWithdrawal = 'This animal has been sold within this treatment withdrawal period.'+cCRLF+
                                       'Do you wish to continue?';
   cMastLameNoAreaTreated = 'No area treated selected. Please select an area treated.';

   function DoNotSaveEventsForThisDrug(ADrugPurchID, AMedicineID : Integer; AApplicRate : Double) : Boolean;
   var
      dDoseMultiplier,dPurchMultiplier,
      dTotalDoseRate,
      dQtyRemaing : Double;
      iDoseUnitID, iPurchUnitID : Integer;
      sBatchNo : String;
   begin
      Result := False;
      if ( AApplicRate = 0 ) or
         ( AMedicineID = 0 ) or
         ( ADrugPurchID = 0 ) then Exit;

      sBatchNo := 'Unknown Batch No';
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT BatchNo');
            SQL.Add('FROM MediPur');
            SQL.Add('WHERE ID = :DrugPurchID');
            Params[0].AsInteger := ADrugPurchID;
            Open;
            if ( RecordCount > 0 ) and ( Length(Fields[0].AsString) > 0 ) then
               sBatchNo := Fields[0].AsString;

            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM '+WinData.Medicine.TableName+'');
            SQL.Add('WHERE ID = '+IntToStr(AMedicineID)+'');
            try
               Open;
               iDoseUnitID := 0;
               iDoseUnitID := FieldByName('DoseUnit').AsInteger;
               iPurchUnitID := 0;
               iPurchUnitID := FieldByName('PurchUnit').AsInteger;
               Close;
               SQL.Clear;

               dDoseMultiplier := 1;
               if ( iDoseUnitID > 0 ) then
                  begin
                     SQL.Add('SELECT Multiplier');
                     SQL.Add('FROM Units');
                     SQL.Add('WHERE ID = '+IntToStr(iDoseUnitID)+'');
                     try
                        Open;
                        if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                           dDoseMultiplier := Fields[0].AsFloat;
                        Close;
                        SQL.Clear;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end;

               dPurchMultiplier := 1;
               if ( iPurchUnitID > 0 ) then
                  begin
                     SQL.Add('SELECT Multiplier');
                     SQL.Add('FROM Units');
                     SQL.Add('WHERE ID = '+IntToStr(iPurchUnitID)+'');
                     try
                        Open;
                        if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
                           dPurchMultiplier := Fields[0].AsFloat;
                        Close;
                        SQL.Clear;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end;

               dTotalDoseRate := ( AApplicRate * (dDoseMultiplier/dPurchMultiplier) );

               dQtyRemaing := WinData.DrugBatchQtyRemaining(ADrugPurchID) - dTotalDoseRate;

               if ( dQtyRemaing < 0 ) then
                  Result := ( MessageDlg(Format(cDrugBatchQty_Remain_Warning,[sBatchNo]),mtConfirmation,[mbYes,mbNo],0) = mrNo );
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

   procedure CheckDrugPurchQuantity;
   var
      qCheckDrugPurchQty : TQuery;
      iaDrugIDs : array of Integer;
      i, iDrugPurchDeficityQtyCount : Integer;
      bDontSave : Boolean;
   begin
      if ( TempEvents.FieldByName('DrugPurchID').AsInteger > 0 ) then
         begin
            bDontSave := ( DoNotSaveEventsForThisDrug(TempEvents.FieldByName('DrugPurchID').AsInteger,
                                                      TempEvents.FieldByName('DrugUsed').AsInteger,
                                                      TempEvents.FieldByName('RateOfApplic').AsFloat) );
            if bDontSave then
               SysUtils.Abort;
            Exit;
         end;

      qCheckDrugPurchQty := TQuery.Create(nil);
      with qCheckDrugPurchQty do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(DrugUsed)');
            SQL.Add('FROM '+TempAnimals.TableName+'');
            SQL.Add('WHERE Selected = True');
            SQL.Add('AND DrugPurchID > 0');
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               First;
               SetLength(iaDrugIDs,0);
               while ( not(Eof) ) do
                  begin
                     SetLength(iaDrugIDs,Length(iaDrugIDs)+1);
                     iaDrugIDs[Length(iaDrugIDs)-1] := Fields[0].AsInteger;
                     Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;

            for i := 0 to Length(iaDrugIDs)-1 do
               begin
                  SQL.Clear;

                  if ( FUseApplicRateByKg ) then
                     SQL.Add('SELECT Distinct(DrugPurchID), Sum(TotalApplicRate) AS TotalApplicRate')
                  else
                     SQL.Add('SELECT DISTINCT(DrugPurchID), Sum(RateOfApplic) AS RateOfApplic');

                  SQL.Add('FROM '+TempAnimals.TableName+'');
                  SQL.Add('WHERE DrugUsed = '+IntToStr(iaDrugIDs[i])+'');
                  SQL.Add('AND Selected = True');
                  SQL.Add('AND DrugPurchID > 0');

                  if ( FUseApplicRateByKg ) then
                     SQL.Add('GROUP BY DrugPurchID')
                  else
                     SQL.Add('GROUP BY DrugPurchID');

                  try
                     Open;
                     if ( RecordCount = 0 ) then Exit;
                     First;
                     iDrugPurchDeficityQtyCount := 0;
                     while ( not(Eof) ) do
                        begin
                           if ( FUseApplicRateByKg ) then
                              bDontSave := ( DoNotSaveEventsForThisDrug(FieldByName('DrugPurchID').AsInteger,
                                                                        iaDrugIDs[i],
                                                                        FieldByName('TotalApplicRate').AsFloat) )
                           else
                              bDontSave := ( DoNotSaveEventsForThisDrug(FieldByName('DrugPurchID').AsInteger,
                                                                        iaDrugIDs[i],
                                                                        FieldByName('RateOfApplic').AsFloat) );

                           if bDontSave then
                              Inc(iDrugPurchDeficityQtyCount);

                           Next;
                        end;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
            if ( iDrugPurchDeficityQtyCount > 0 ) then
               SysUtils.Abort;
         finally
            Free;
         end;
   end;

   procedure CheckTreatmentInSaleWithdrawalPeriod ( const ADrugID : Integer = 0; const ATreatDays : Integer = 0 );
   var
      i, DrugID,
      TreatDays : Integer;
      qAnimals : TQuery;
      iaAnimalsToDeSelect : array of Integer;
   begin
      qAnimals := TQuery.Create(nil);
      with qAnimals do
         try
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT AA.AnimalID, AA.LactNo, AA.NoDays, AA.DrugUsed, AA.EventDate TreatDate, E.EventDate SaleDate');
               SQL.Add('FROM a AA');
               SQL.Add('LEFT JOIN Events E ON (AA.AnimalID = E.AnimalID)');
               SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID = S.EventID)');
               SQL.Add('WHERE (AA.Selected = TRUE)');
               SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
               SQL.Add('AND   (S.Sold = TRUE)');
               Open;
               First;
               SetLength(iaAnimalsToDeSelect,0);
               while ( not(Eof) ) do
                  begin
                     DrugID := ADrugID;
                     if ( DrugID = 0 ) then
                        DrugID := FieldByName('DrugUsed').AsInteger;
                     TreatDays := ATreatDays;
                     if ( TreatDays = 0 ) then
                        TreatDays := FieldByName('NoDays').AsInteger;
                     //   07/12/17 [V5.7 R6.0] /MK Bug Fix - Changed this function to new ThisTreatmentWithdrawalAfterSaleDate.
                     if ( HerdLookup.ThisTreatmentWithdrawalAfterSaleDate(FieldByName('AnimalID').AsInteger,
                                                                          DrugID,
                                                                          Trunc(TreatDays),
                                                                          FieldByName('TreatDate').AsDateTime,
                                                                          FieldByName('SaleDate').AsDateTime) ) then
                        begin
                           SetLength(iaAnimalsToDeSelect,Length(iaAnimalsToDeSelect)+1);
                           iaAnimalsToDeSelect[Length(iaAnimalsToDeSelect)-1] := qAnimals.FieldByName('AnimalID').AsInteger;
                        end;
                     Next;
                  end;
               if ( Length(iaAnimalsToDeSelect) > 0 ) then
                  begin
                     MessageDlg('Some animals have been sold within this treatment withdrawal period.'+cCRLF+
                                'These animals will be ignored when saving this treatment?',mtWarning,[mbOK],0);
                     for i := 0 to Length(iaAnimalsToDeSelect)-1 do
                        begin
                           if ( TempAnimals.Locate('AnimalID',iaAnimalsToDeSelect[i],[]) ) then
                              begin
                                 TempAnimals.Edit;
                                 TempAnimals.FieldByName('Selected').AsBoolean := False;
                                 TempAnimals.Post;
                              end;
                        end;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Close;
         end;
   end;

   procedure ValidateMultiDrugGridInput (var AMessageShown : Boolean);
   var
      i : Integer;
      iaDrugIDs : array of Integer;
      bShowMessage : Boolean;

      procedure CheckMultiDrugPurchQuantity;
      var
         ttMultiDrugStockCtrl : TTable;
         iDrugPurchDeficityQtyCount,
         iDrugApplicRate : Integer;
      begin
         bShowMessage := False;
         if ( Length(iaDrugIDs) = 0 ) then Exit;

         ttMultiDrugStockCtrl := TTable.Create(nil);
         with ttMultiDrugStockCtrl do
            try
               DatabaseName := AliasName;
               TableName := 'tMultiDrugStockCtrlData';
               FieldDefs.Add('ID',ftAutoInc);
               FieldDefs.Add('DrugID',ftInteger);
               FieldDefs.Add('ApplicRate',ftInteger);
               FieldDefs.Add('DrugPurchID',ftInteger);
               FieldDefs.Add('DrugBatchNo',ftString,30);
               try
                  CreateTable;
                  Open;
                  iDrugApplicRate := 0;
                  mdMultiDrug.First;
                  while ( not(mdMultiDrug.Eof) ) do
                     begin
                        if ( ttMultiDrugStockCtrl.RecordCount = 0 ) or
                           ( not(ttMultiDrugStockCtrl.Locate('DrugID',mdMultiDrug.FieldByName('DrugUsed').AsInteger,[])) ) or
                           ( not(ttMultiDrugStockCtrl.Locate('DrugPurchID',mdMultiDrug.FieldByName('DrugPurchID').AsInteger,[])) ) then
                           begin
                              ttMultiDrugStockCtrl.Append;
                              ttMultiDrugStockCtrl.FieldByName('DrugID').AsInteger := mdMultiDrug.FieldByName('DrugUsed').AsInteger;
                              ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger := mdMultiDrug.FieldByName('RateOfApplic').AsInteger;
                              ttMultiDrugStockCtrl.FieldByName('DrugPurchID').AsInteger := mdMultiDrug.FieldByName('DrugPurchID').AsInteger;
                              ttMultiDrugStockCtrl.FieldByName('DrugBatchNo').AsString := mdMultiDrug.FieldByName('BatchNo').AsString;
                              ttMultiDrugStockCtrl.Post;
                           end
                        else if ( ttMultiDrugStockCtrl.Locate('DrugPurchID',mdMultiDrug.FieldByName('DrugPurchID').AsInteger,[]) ) then
                           begin
                              ttMultiDrugStockCtrl.Edit;
                              if ( iDrugApplicRate = 0 ) and ( ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger > 0 ) then
                                 begin
                                    ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger := mdMultiDrug.FieldByName('RateOfApplic').AsInteger;
                                    iDrugApplicRate := ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger;
                                 end
                              else if ( iDrugApplicRate > 0 ) and ( ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger > 0 ) then
                                 ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger := iDrugApplicRate + mdMultiDrug.FieldByName('RateOfApplic').AsInteger;
                              ttMultiDrugStockCtrl.Post;
                           end;
                        mdMultiDrug.Next;
                     end;

                  ttMultiDrugStockCtrl.First;
                  while ( not(ttMultiDrugStockCtrl.Eof) ) do
                     begin
                        if ( DoNotSaveEventsForThisDrug(ttMultiDrugStockCtrl.FieldByName('DrugPurchID').AsInteger,
                                                        iaDrugIDs[i],
                                                        ttMultiDrugStockCtrl.FieldByName('ApplicRate').AsInteger) ) then
                           Inc(iDrugPurchDeficityQtyCount);
                        ttMultiDrugStockCtrl.Next;
                     end;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
               bShowMessage := iDrugPurchDeficityQtyCount > 0;
            finally
               Free;
            end;
      end;

   begin
      if ( not(mdMultiDrug.Active) ) then
         mdMultiDrug.Active := True;

      if ( mdMultiDrug.RecordCount = 0 ) then Exit;

      SetLength(iaDrugIDs,0);

      mdMultiDrug.First;
      while ( not(mdMultiDrug.Eof) ) do
         begin
            if ( WinData.EventType in [THealth, TDryOff] ) then
               begin
                  //   28/09/17 [V5.7 R3.3] /MK Change - If user has not selected an administered by but hasn't selected a drug give error and stop saving of event.
                  if ( mdMultiDrug.FieldByName('DrugUsed').AsVariant = Null ) or ( mdMultiDrug.FieldByName('DrugUsed').AsInteger = 0 ) then
                     if ( MessageDlg(cNoDrugSelected,mtWarning,[mbYes,mbNo],0) = mrNo ) then
                        begin
                           MultiDrugGridDBTableViewDrugId.FocusWithSelection;
                           AMessageShown := True;
                           Exit;
                        end;

                  //   28/09/17 [V5.7 R3.3] /MK Change - If user has entered an application rate but hasn't selected a drug give error and stop saving of event.
                  if ( mdMultiDrug.FieldByName('RateOfApplic').AsFloat > 0 ) then
                     if ( mdMultiDrug.FieldByName('DrugUsed').AsVariant = Null ) or ( mdMultiDrug.FieldByName('DrugUsed').AsInteger = 0 ) then
                        begin
                           MessageDlg(cNoDrugSelectedButApplicRate,mtError,[mbOK],0);
                           MultiDrugGridDBTableViewDrugId.FocusWithSelection;
                           AMessageShown := True;
                           Exit;
                        end;

                  if ( (WinData.EventType = THealth) and (CountryOfReg = NIreland) ) then
                     if ( mdMultiDrug.FieldByName('FarmCode').AsInteger > 0 ) then
                        if ( mdMultiDrug.FieldByName('DrugUsed').AsVariant = Null ) or ( mdMultiDrug.FieldByName('DrugUsed').AsInteger = 0 ) then
                           begin
                              MessageDlg(cNoDrugSelectedButReasonNI,mtError,[mbOK],0);
                              MultiDrugGridDBTableViewFarmCode.FocusWithSelection;
                              AMessageShown := True;
                              Exit;
                           end;

                  //   28/09/17 [V5.7 R3.3] /MK Change - If user has selected an administered by but hasn't selected a drug give error and stop saving of event.
                  if ( mdMultiDrug.FieldByName('VetPresc').AsInteger > 0 ) then
                     if ( mdMultiDrug.FieldByName('DrugUsed').AsVariant = Null ) or ( mdMultiDrug.FieldByName('DrugUsed').AsInteger = 0 ) then
                        begin
                           MessageDlg(cNoDrugSelectedButAdminBy,mtError,[mbOK],0);
                           MultiDrugGridDBTableViewDrugId.FocusWithSelection;
                           AMessageShown := True;
                           Exit;
                        end;
               end;

            if ( WinData.EventType = THerdVaccination ) then
               //   07/06/16 [V5.5 R5.9] /MK Bug Fix - If HerdVaccination and disease selected then check that DrugUsed is selected - Michael Slattery after Bord Bia inspection.
               if ( Length(mdMultiDrug.FieldByName('Disease').AsString) > 0 ) then
                  if ( mdMultiDrug.FieldByName('DrugUsed').AsVariant = Null ) or ( mdMultiDrug.FieldByName('DrugUsed').AsInteger = 0 ) then
                     begin
                        MessageDlg(cDiseaseSelectedNoDrug,mtError,[mbOK],0);
                        MultiDrugGridDBTableViewDrugId.FocusWithSelection;
                        AMessageShown := True;
                        Exit;
                     end;

            if ( mdMultiDrug.FieldByName('DrugUsed').AsVariant <> Null ) or ( mdMultiDrug.FieldByName('DrugUsed').AsInteger > 0 ) then
               begin
                  //   17/08/15 [V5.4 R7.4] /MK Additional Feature - If the animal was sold check to see if the sale date falls
                  //                                                 within the withdrawal period then show warning before saving event.
                  CheckTreatmentInSaleWithdrawalPeriod();

                  if ( WinData.EventType = THerdVaccination ) then
                     if ( mdMultiDrug.FieldByName('Disease').AsString = '' ) then
                        begin
                           MessageDlg(cNoDiseaseSelected,mtError,[mbOK],0);
                           MultiDrugGridDBTableViewDisease.FocusWithSelection;
                           AMessageShown := True;
                           Exit;
                        end;

                  if ( mdMultiDrug.FieldByName('DrugPurchID').AsInteger > 0 ) then
                     if ( not(InArray(mdMultiDrug.FieldByName('DrugUsed').AsInteger,iaDrugIDs)) ) then
                        begin
                           SetLength(iaDrugIDs,Length(iaDrugIDs)+1);
                           iaDrugIDs[Length(iaDrugIDs)-1] := mdMultiDrug.FieldByName('DrugUsed').AsInteger;
                        end;

                  //   29/11/16 [V5.6 R3.6] /MK Bug Fix - Using AsInteger instead of AsFloat for ApplicRate.
                  if ( mdMultiDrug.FieldByName('RateOfApplic').AsFloat <= 0 ) then
                     begin
                        MessageDlg(cDrugSelectedNoApplicRate,mtError,[mbOK],0);
                        MultiDrugGridDBTableViewApplicRate.FocusWithSelection;
                        AMessageShown := True;
                        Exit;
                     end;

                  if ( (WinData.EventType = THealth) and (CountryOfReg = NIreland) ) then
                     if ( mdMultiDrug.FieldByName('FarmCode').AsInteger = 0 ) then
                        begin
                           MessageDlg(cDrugSelectedNoReasonNI,mtError,[mbOK],0);
                           MultiDrugGridDBTableViewFarmCode.FocusWithSelection;
                           AMessageShown := True;
                           Exit;
                        end;

                  if ( mdMultiDrug.FieldByName('AdminBy').AsInteger = 0 ) then
                     begin
                        MessageDlg(cDrugSelectedNoAdminBy,mtError,[mbOK],0);
                        MultiDrugGridDBTableViewAdminBy.FocusWithSelection;
                        AMessageShown := True;
                        Exit;
                     end;

                  {
                  //   02/12/15 [V5.5 R1.4] /MK Change - Removed the requirement to enter the prescribed by - GL/SP/Peter Maguire.
                  if ( mdMultiDrug.FieldByName('VetPresc').AsInteger = 0 ) then
                     begin
                        MessageDlg(cDrugSelectedNoPrescBy,mtError,[mbOK],0);
                        MultiDrugGridDBTableViewPrescribedBy.FocusWithSelection;
                        AMessageShown := True;
                        Exit;
                     end;
                  }
               end;
            mdMultiDrug.Next;
         end;

      //   07/05/15 [V5.4 R5.4] /MK Additional Feature - Check MediPurch quantity of each drug in MultiDrug grid.
      CheckMultiDrugPurchQuantity;
      AMessageShown := bMessageShown;
   end;

begin
   AnimalPostCount := 0;
   if (FCountSelectedRecords = 0) then
      begin
         MessageDlg('There are no records selected.',mtWarning,[mbOk],0);
         Exit;
      end;

   try
      UpdateAnimals(nil);
      //   31/05/12 [V5.0 R6.0] /MK Bug Fix - Remove This Check So User Can Use Grid Without Having To Select Pregnant.ItemIndex.
      {
      if (WinData.EventType = TPregDiag ) and (Pregnant.ItemIndex = -1) then
         begin
            MessageDlg('WARNING: Pregnancy status undefined, please indicate pregnancy status as Yes or No',mtWarning,[mbOk],0);
            Pregnant.SetFocus;
            Exit;
         end
      else
      }

      //   18/08/15 [V5.4 R7.4] /MK Bug Fix - Move validation of combo boxes after UpdateAnimals as IsValidatorSelected looks at TempAnimals table
      //                                      which is not updated until after UpdateAnimals.
      //   03/10/12 [V5.1 R0.1] /MK Additional Feature - Give warning if no bull selected.
      if ( WinData.EventType = TPlannedBull ) then
         if ( not(IsValidatorSelected('PlannedBull')) ) then
            begin
               MessageDlg('No planned bull selected. Please select a planned bull.',mtError,[mbOK],0);
               Exit;
            end;

      if ( WinData.EventType = THerdTest ) and ( FHerdTestType = htJohnes ) then
         if ( not(IsValidatorSelected('JohnesResult')) ) then
            begin
               MessageDlg('No result selected. Please select a result.',mtError,[mbOK],0);
               Exit;
            end;

      //   03/01/14 [V5.2 R7.4] /MK Bug Fix - Add validation for HerdTest if no disease selected.
      if ( WinData.EventType = THerdTest ) then
         if ( not(IsValidatorSelected('Disease')) ) then
            begin
               //   23/07/14 [V5.3 R4.0] /MK Change - If user has selected diease but has not tabbed from box then fill disease
               //                                     in TempAnimals from disease in dbcbTestDisease.Text.
               if ( dbcbTestDisease.ItemIndex > -1 ) then
                  begin
                     with GetQuery do
                        try
                           SQL.Clear;
                           SQL.Add('UPDATE '+TempAnimals.TableName+'');
                           SQL.Add('SET Disease = "'+dbcbTestDisease.Text +'"');
                           try
                              ExecSQL;
                           except
                              on e : Exception do
                                 ShowMessage(e.Message);
                           end;
                        finally
                           Free;
                        end;
                  end
               else
                  begin
                     MessageDlg(cNoDiseaseSelected,mtError,[mbOK],0);
                     Exit;
                  end;
            end;

      if ( WinData.EventType in [TService, TBulling, TPlannedBull] ) then
         CheckForInBreeding
      else if (WinData.EventType = TFertilityCheck ) then
         CheckValidFertProgramSelected;

      // Always UpdateGrid if any fields are entered manually on the grid.
      UpdateGrid;

      //   18/08/15 [V5.4 R7.4] /MK Bug Fix - Check that sale event is before EventDate. If Service Event then give Yes/No confirmation message
      //                                      else give strict error and abort.
      CheckSelectedAnimalsSoldBeforeEventDate(bMessageShown);
      if ( bMessageShown ) then
         SysUtils.Abort;

      // Added UpdateAnimals here so grid is set by event grid but only after manually entered data is saved.
      //UpdateAnimals(nil);

      //   27/08/15 [V5.4 R7.4] /MK Change - Don't allow service to be saved without a bull being selected - GL request.
      if ( WinData.EventType = TService ) then
         if ( not(IsValidatorSelected('ServiceBull')) ) then
            begin
               MessageDlg('Bull Used must be selected before saving.',mtError,[mbOK],0);
               SysUtils.Abort;
            end;

      //   21/03/18 [V5.7 R8.4] /MK Change - Don't allow PregDiag event to be saved if PregStatus is True and there is no DaysInCalf or DaysSinceLastService.
      //   21/11/18 [V5.8 R4.6] /MK Change - If no days in calf specified then give warning, like single PD event, that service days will be used.
      if ( WinData.EventType = TPregDiag ) then
         if ( not(IsValidatorSelected('DaysInCalf')) ) then
            begin
               if ( MessageDlg('Animal marked as Pregnant but Days In Calf is blank.'+#10#13+
                               'Service Days in Calf will be used to predict Calving Date.'+#10#13+
                               'Do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo ) then
                  SysUtils.Abort;
            end;

      if ( WinData.EventType in [TMastitis, TLameness] ) then
         begin
            with GetQuery do
               begin
                  SQL.Clear;
                  SQL.Add('SELECT *');
                  SQL.Add('FROM '+TempAnimals.TableName);
                  SQL.Add('WHERE Selected = True');
                  SQL.Add('AND   ( (AreaTreatedFL = False) AND (AreaTreatedFR = False) AND');
                  SQL.Add('        (AreaTreatedBL = False) AND (AreaTreatedBR = False) )');
                  Open;
                  if ( RecordCount > 0 ) then
                     begin
                        MessageDlg(cMastLameNoAreaTreated,mtError,[mbOK],0);
                        Exit;
                     end;
               end;
         end;

      //   27/11/14 [V5.4 R0.1] /MK Bug Fix - Better checking for drugs selected without an ApplicRate.
      if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness] ) then
         begin
            if ( pMultiDrug.Visible ) then
               begin
                  //   01/05/15 [V5.4 R5.3] /MK Change - Added same validation to MultiDrug as SingleDrug when saving events.
                  ValidateMultiDrugGridInput(bMessageShown);
                  if ( bMessageShown ) then
                     Exit;
               end
            else
               begin
                  if ( WinData.EventType = THealth ) and ( FUseApplicRateByKg ) then
                     begin
                        bMessageCancelled := False;
                        with TQuery.Create(nil) do
                           try
                              DatabaseName := AliasName;
                              SQL.Clear;
                              SQL.Add('SELECT A.*');
                              SQL.Add('FROM '+TempAnimals.TableName+' A');
                              SQL.Add('WHERE (Selected = True)');
                              SQL.Add('AND ( (TotalApplicRate = 0) OR (TotalApplicRate IS NULL) )');
                              try
                                 Open;
                                 if ( RecordCount > 0 ) then
                                    begin
                                       MessageDlg('You have chosen Application Rate Per Kilo.'+cCRLF+
                                                  'Some selected animals do not have a last weight.'+cCRLF+
                                                  'These animals will be deselected and not treated.',mtInformation,[mbOK],0);
                                       Close;
                                       SQL.Clear;
                                       SQL.Add('UPDATE '+TempAnimals.TableName);
                                       SQL.Add('SET Selected = False');
                                       SQL.Add('WHERE (Selected = True)');
                                       SQL.Add('AND ( (TotalApplicRate = 0) OR (TotalApplicRate IS NULL) )');
                                       ExecSQL;
                                       TempAnimals.Close;
                                       TempAnimals.Open;
                                    end
                                 else
                                    bMessageCancelled := ( RecordCount <= 0 ) and
                                                         ( TfmMessageScr.ConfirmMessage(mtDoseByKgConfirm) = mrCancel );
                              except
                                 on e : Exception do
                                    ShowMessage(e.Message);
                              end;
                           finally
                              Free;
                           end;
                        if bMessageCancelled then Exit;
                     end;

                  //   17/08/15 [V5.4 R7.4] /MK Additional Feature - If the animal was sold check to see if the sale date falls
                  //                                                 within the withdrawal period then show warning before saving event.
                  CheckTreatmentInSaleWithdrawalPeriod(TempEvents.FieldByName('DrugUsed').AsInteger,TempEvents.FieldByName('NoDays').AsInteger);

                  if ( WinData.EventType in [THealth, TDryOff] ) then
                     begin
                        //   28/09/17 [V5.7 R3.3] /MK Change - If user has not selected a drug give warning and stop if user clicks No to warning.
                        if ( not(IsValidatorSelected('DRUGUSED')) ) then
                           if ( MessageDlg(cNoDrugSelected,mtWarning,[mbYes,mbNo],0) = mrNo ) then Exit;

                        //   28/09/17 [V5.7 R3.3] /MK Change - If user has entered an application rate but hasn't selected a drug give error and stop saving of event.
                        if ( IsValidatorSelected('APPLICRATE') ) and ( not(IsValidatorSelected('DRUGUSED')) ) then
                           begin
                              MessageDlg(cNoDrugSelectedButApplicRate,mtError,[mbOK],0);
                              Exit;
                           end;

                        if ( (WinData.EventType = THealth) and (CountryOfReg = NIreland) ) then
                           if ( IsValidatorSelected('FARMCODE') ) and ( not(IsValidatorSelected('DRUGUSED')) ) then
                               begin
                                  MessageDlg(cNoDrugSelectedButReasonNI,mtError,[mbOK],0);
                                  Exit;
                               end;

                        //   28/09/17 [V5.7 R3.3] /MK Change - If user has selected an administered by but hasn't selected a drug give error and stop saving of event.
                        if ( IsValidatorSelected('ADMINBY') ) and ( not(IsValidatorSelected('DRUGUSED')) ) then
                           begin
                              MessageDlg(cNoDrugSelectedButAdminBy,mtError,[mbOK],0);
                              Exit;
                           end;
                     end;

                  if ( IsValidatorSelected('DRUGUSED') ) then
                     begin
                        if ( not(IsValidatorSelected('APPLICRATE')) ) then
                           begin
                              MessageDlg(cDrugSelectedNoApplicRate,mtError,[mbOK],0);
                              Exit;
                           end;

                        if ( (WinData.EventType = THealth) and (CountryOfReg = NIreland) ) then
                           if ( not(IsValidatorSelected('FARMCODE')) ) then
                               begin
                                  MessageDlg(cDrugSelectedNoReasonNI,mtError,[mbOK],0);
                                  Exit;
                               end;

                        //   23/03/15 [V5.4 R3.4] /MK Additional Feature - Don't allow user to save treatment if drug entered and no admin by - GL/TOK request.
                        if ( not(IsValidatorSelected('ADMINBY')) ) then
                           begin
                              MessageDlg(cDrugSelectedNoAdminBy,mtError,[mbOK],0);
                              Exit;
                           end;

                        //   23/03/15 [V5.4 R3.4] /MK Additional Feature - Don't allow user to save treatment if drug entered and no prescribed by - GL/TOK request.
                        //   02/12/15 [V5.5 R1.4] /MK Change - Removed the requirement to enter the prescribed by - GL/SP/Peter Maguire.
                        {
                        if ( not(IsValidatorSelected('VETPRESC')) ) then
                           begin
                              MessageDlg(cDrugSelectedNoPrescBy,mtError,[mbOK],0);
                              Exit;
                           end;
                        }
                     end;

                  //   27/04/15 [V5.4 R4.0] /MK Change - Added check for drug purchase quantity before events are saved instead of when animals are selected
                  //                                     or when the batch number is selected - SP request.
                  CheckDrugPurchQuantity;

                  //   25/09/12 [V5.1 R0.0] /MK Bug Fix - If HerdVaccination then check that disease is selected before Save.
                  if ( WinData.EventType = THerdVaccination ) then
                     begin
                        if ( not(IsValidatorSelected('Disease')) ) then
                           begin
                              if ( dblcbVaccineType.ItemIndex > -1 ) then
                                 begin
                                    with GetQuery do
                                       try
                                          SQL.Clear;
                                          SQL.Add('UPDATE '+TempAnimals.TableName+'');
                                          SQL.Add('SET Disease = "'+dblcbVaccineType.Text +'"');
                                          try
                                             ExecSQL;
                                          except
                                             on e : Exception do
                                                ShowMessage(e.Message);
                                          end;
                                       finally
                                          Free;
                                       end;
                                 end
                              else
                                 begin
                                    MessageDlg(cNoDiseaseSelected,mtError,[mbOK],0);
                                    Exit;
                                 end;
                           end;

                        //   07/06/16 [V5.5 R5.9] /MK Bug Fix - If HerdVaccination and disease selected then check that DrugUsed is selected - Michael Slattery after Bord Bia inspection.
                        if ( not(IsValidatorSelected('DRUGUSED')) ) then
                           begin
                              if ( DrugUsed.EditValue > 0 ) and ( DrugUsed.EditValue <> Null ) then
                                 begin
                                    with GetQuery do
                                       try
                                          SQL.Clear;
                                          SQL.Add('UPDATE '+TempAnimals.TableName+'');
                                          SQL.Add('SET DrugUsed = "'+DrugUsed.EditValue +'"');
                                          try
                                             ExecSQL;
                                          except
                                             on e : Exception do
                                                ShowMessage(e.Message);
                                          end;
                                       finally
                                          Free;
                                       end;
                                 end
                              else
                                 begin
                                    MessageDlg(cDiseaseSelectedNoDrug,mtError,[mbOK],0);
                                    Exit;
                                 end;
                           end;
                     end;
               end;
         end;

      // Save the Selected Records into the Events table
      if (Screen.ActiveControl is TDBDateEdit) then
         (Screen.ActiveControl as TDBDateEdit).OnExit(Sender)
      else if (Screen.ActiveControl is TDBEDit) then
         (Screen.ActiveControl as TDBEDit).OnExit(Sender)
      else if (Screen.ActiveControl is TRxDBLookupCombo) then
         (Screen.ActiveControl as TRxDBLookupCombo).OnExit(Sender)
      else if (Screen.ActiveControl is TDBLookupComboboxEh) then
         (Screen.ActiveControl as TDBLookupComboboxEh).OnExit(Sender)
      else if (Screen.ActiveControl is TDBCheckBox) then
         (Screen.ActiveControl as TDBCheckBox).OnExit(Sender)
      else if (Screen.ActiveControl is TRadioButton) and (WinData.EventType = TPregDiag) then
         // Call the Exit routine
         UpdateAnimals(nil)
      else if (Screen.ActiveControl is TDBRadioGroup) then
         (Screen.ActiveControl as TDBRadioGroup).OnExit(Sender)
      else if (Screen.ActiveControl is TcxDBLookupComboBox) then
         (Screen.ActiveControl as TcxDBLookupComboBox).OnExit(Screen.ActiveControl);
      OKToUpdate := TRUE;

      if AllAnimalsSelected then
         OKtoUpdate := (MessageDLG('Are you sure you want to update ALL these Animals?',mtWarning,[mbYes,mbNo],0) = mrYes );

      if OKToUpdate then
         try
            //   26/08/20 [V5.9 R5.8] /MK Bug Fix - Set FDrugBatchQty_EmptyCheck before UpdateAnimals/CopyDetails so not to check quantity remaining for batch in MultiDrug - George (TGM).
            FDrugBatchQty_EmptyCheck := True;
            SavingInfo := True;
            ItemChanged := True;
            UpdateAnimals(nil);
            with GenQuery do
               begin
                  SQL.Clear;
                  SQL.Add('SELECT *');
                  SQL.Add('FROM '+TempAnimals.TableName);
                  SQL.Add('WHERE (Selected=TRUE)');
                  SQL.Add('AND   (EventDate IS NOT NULL)');
                  SQL.Add('AND   (AnimalID > 0)');
                  SQL.Add('AND   (LactNo >= 0)');
                  SQL.Add('AND   (HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');
                  Open;
               end;

            if GenQuery.IsEmpty then
               MessageDlg('An invalid selection has been made.'+#13#10+#13#10+
                          'Check that the correct information has been filled'+#13#10+
                          'and there is at least 1 animal selected.',mtInformation,[mbOK],0)
            else
               begin
                  CountOfRecords := 0;

                  if ( WinData.EventType in [TTBTestDate, TBruceTest, TBVDTest, THerdTest] ) then
                     try
                        pInfo.Show;
                        pInfo.BringToFront;
                        pInfo.Refresh;
                        with qTestUpdate do
                           begin
                              SQL.Clear;
                              SQL.Add('SELECT TA.AnimalID, TA.EventDate, TA.LactNo,');
                              SQL.Add('       TA.HerdID, TA.JohnesResult');
                              SQL.Add('FROM ' + TempAnimals.TableName + ' TA' );
                              SQL.Add('WHERE (TA.Selected=TRUE)');
                              SQL.Add('AND   (TA.EventDate IS NOT NULL)');
                              SQL.Add('AND   (TA.HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');
                              Open;

                              if NOT IsEmpty then
                                 begin
                                    pbInfo.Min := 0;
                                    pbInfo.Step := 1;
                                    pbInfo.Max := RecordCount;
                                    CountOfRecords := RecordCount;
                                    First;
                                    tAnimals.Open;
                                    while NOT EOF do
                                       begin
                                          if tAnimals.Locate('ID', FieldByName('AnimalID').AsInteger,[] ) then
                                             begin
                                                tAnimals.Edit;
                                                if ( WinData.EventType = THerdTest ) then
                                                   begin
                                                      if ( FHerdTestType = htTB ) then
                                                         begin
                                                            tAnimals.FieldByName('TBTestDate').AsDateTime := FieldByName(fn_EventDate).AsDateTime
                                                         end
                                                      else if ( FHerdTestType = htBrucellosis ) then
                                                         begin
                                                             tAnimals.FieldByName('Brucellosis').AsDateTime := FieldByName(fn_EventDate).AsDateTime
                                                          end
                                                      else if ( FHerdTestType = htBVD ) then
                                                         begin
                                                            tAnimals.FieldByName('BVDDate').AsDateTime := FieldByName(fn_EventDate).AsDateTime;
                                                         end
                                                      else if ( FHerdTestType = htJohnes ) then
                                                         begin
                                                            CreateJohnesEvent(FieldByName('AnimalId').AsInteger, FieldByName('LactNo').AsInteger,
                                                                              FieldByName('HerdId').AsInteger, FieldByName('JohnesResult').AsInteger,
                                                                              FieldByName('EventDate').AsDateTime);
                                                         end;
                                                   end;
                                                tAnimals.Post;
                                             end;
                                          pbInfo.Position := RecNo;
                                          Next;
                                      end;
                                 end;
                                 Close;
                              end;
                     finally
                        // Close the Temp
                        tAnimals.Close;
                        pInfo.Hide;
                        pbInfo.Show;
                     end
                  else
                     try
                        if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) and ( mdMultiDrug.RecordCount > 0 ) then
                           if ( VetLinkDataExists ) then
                              with GetQuery do
                                 try
                                    SQL.Clear;
                                    SQL.Add('DELETE FROM DrugsRegImportDetail');
                                    SQL.Add('WHERE Selected = TRUE');
                                    try
                                       ExecSQL;
                                    except
                                       on e : Exception do
                                          ShowMessage(e.Message);
                                    end;
                                 finally
                                    Free;
                                 end;

                        pbInfo.Min := 0;
                        pbInfo.Max := GenQuery.RecordCount;
                        pbInfo.Step := 1;
                        pInfo.Show;
                        pInfo.BringToFront;
                        pInfo.Refresh;

                        if ( GenQuery.RecordCount > 0 ) then
                           try
                              if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
                                 begin
                                    FHealthRec := THealthEvent.Create('GEHDRec');
                                    FHealthRec.Database.StartTransaction;
                                 end;

                              if ( WinData.EventType = TPregDiag ) then
                                 begin
                                    FPregDiagRec := TPregDiagEvent.Create('GEPRec');
                                    FPregDiagRec.Database.StartTransaction;
                                 end;

                              GenQuery.First;
                              while ( not(GenQuery.Eof) ) do
                                 try
                                    if ( WinData.EventType = TMovement ) then
                                       begin
                                          if WinData.ActiveMovements(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                     GenQuery.FieldByName('HerdID').AsInteger,
                                                                     GenQuery.FieldByName('AnimalNo').AsString,
                                                                     GenQuery.FieldByName('NatIdNum').AsString,FALSE,FALSE) then
                                             Next;
                                       end;

                                    if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
                                       begin
                                          if ( mdMultiDrug.RecordCount > 0 ) then
                                             begin
                                                mdMultiDrug.First;
                                                while ( not(mdMultiDrug.Eof) ) do
                                                   begin
                                                      if ( HealthEventRecCreated(WinData.EventType,mdMultiDrug) ) then
                                                         Inc(CountOfRecords);
                                                      if ( mdMultiDrugGroupListing.AsInteger > 0 ) then
                                                        if ( not(WinData.GroupManager.AnimalInThisGroup( GenQuery.FieldByName('AnimalID').AsInteger, mdMultiDrugGroupListing.AsInteger)) ) then
                                                           WinData.GroupManager.AddToGroup(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                           mdMultiDrugGroupListing.AsInteger, TRUE,
                                                                                           GenQuery.FieldByName(fn_EventDate).AsDateTime,
                                                                                           TempAnimals.FieldByName('NatIdNum').AsString, False);
                                                      mdMultiDrug.Next;
                                                   end;
                                             end
                                          else
                                             begin
                                                if ( HealthEventRecCreated(WinData.EventType,GenQuery) ) then
                                                   Inc(CountOfRecords);
                                                if ( GenQuery.FieldByName('GroupID').AsInteger > 0 ) then
                                                   if ( not(WinData.GroupManager.AnimalInThisGroup( GenQuery.FieldByName('AnimalID').AsInteger, GenQuery.FieldByName('GroupID').AsInteger)) ) then
                                                      WinData.GroupManager.AddToGroup(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                      GenQuery.FieldByName('GroupID').AsInteger,TRUE,
                                                                                      GenQuery.FieldByName(fn_EventDate).AsDateTime,
                                                                                      TempAnimals.FieldByName('NatIdNum').AsString, False);
                                             end;
                                       end
                                    else if ( WinData.EventType = TPregDiag ) then
                                       begin
                                          if CreatePregDiagEventRec then
                                             Inc(CountOfRecords);
                                       end
                                    else
                                       //   30/10/15 [V5.4 R9.8] /MK Change - No need to check for whether the RepeatPregDiag boolean here.
                                       with WriteEvents do
                                          try
                                             Append;
                                             CurrentID                             := FieldByName('ID').AsInteger;
                                             FieldByName('AnimalID').AsInteger     := GenQuery.FieldByName('AnimalID').AsInteger;
                                             FieldByName(fn_EventDate).AsDateTime  := GenQuery.FieldByName(fn_EventDate).AsDateTime;

                                             //   28/01/16 [V5.5 R2.4] /MK Change - Check if event date is before last calving date and save to last calving lactation-1
                                             iCalvingLactNo := WinData.EventDataHelper.GetLastCalvingLactationNum(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                                                  GenQuery.FieldByName('LactNo').AsInteger,
                                                                                                                  GenQuery.FieldByName(fn_EventDate).AsDateTime);
                                             if ( iCalvingLactNo <> GenQuery.FieldByName('LactNo').AsInteger ) then
                                                begin
                                                   if ( WinData.EventType = TDryOff ) then
                                                      begin
                                                         //   28/01/16 [V5.5 R2.4] /MK Change - If DryOff event then make sure that there is no dry off event in calving lactation-1.
                                                         if ( WinData.EventDataHelper.GetLastEventDate(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                                       iCalvingLactNo,
                                                                                                       CDryOffEvent) = 0 ) then
                                                            FieldByName('AnimalLactNo').AsInteger := iCalvingLactNo;
                                                      end
                                                   else
                                                      FieldByName('AnimalLactNo').AsInteger := iCalvingLactNo;
                                                end
                                             else
                                                FieldByName('AnimalLactNo').AsInteger := GenQuery.FieldByName('LactNo').AsInteger;

                                             if ( WinData.EventType in [TService, TPlannedBull] ) then
                                                begin
                                                   tAnimals.Open;
                                                   if ( WinData.EventType = TService ) then
                                                      begin
                                                        sServiceCount := FBreedingDataHelper.GetServiceCount(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                                             GenQuery.FieldByName('LactNo').AsInteger);
                                                        if ( sServiceCount <> '' ) and ( GenQuery.FieldByName('ServiceBull').AsInteger > 0 ) then
                                                           begin
                                                              if ( tAnimals.Locate('ID',GenQuery.FieldByName('ServiceBull').AsInteger,[]) ) then
                                                                 FieldByName('EventDesc').AsString := Format(GenQuery.FieldByName('EventDesc').AsString +
                                                                                                             ' %s', [sServiceCount]) + ' / ' +
                                                                                                             tAnimals.FieldByName('AnimalNo').AsString;
                                                           end
                                                        else if ( sServiceCount <> '' ) and ( GenQuery.FieldByName('ServiceBull').AsInteger <= 0 ) then
                                                           begin
                                                              FieldByName('EventDesc').AsString := Format(GenQuery.FieldByName('EventDesc').AsString +
                                                                                                          ' %s', [sServiceCount]) + ' / ';
                                                           end
                                                        else
                                                           FieldByName('EventDesc').AsString := GenQuery.FieldByName('EventDesc').AsString;
                                                      end
                                                   else if ( WinData.EventType = TPlannedBull ) then
                                                      begin
                                                         if ( GenQuery.FieldByName('PlannedBull').AsInteger > 0 ) then
                                                            begin
                                                               //   27/04/17 [V5.6 R7.1] /MK Change - Set comment of Planned Bull event to include preferred bull (by ICBF ) indicator.
                                                               iRcmdBullInd := WinData.FEventDataHelper.GetPlannedBullRcmdBullInd(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                                                                  GenQuery.FieldByName('LactNo').AsInteger,
                                                                                                                                  GenQuery.FieldByName('EventDate').AsDateTime);
                                                               if ( tAnimals.Locate('ID',GenQuery.FieldByName('PlannedBull').AsInteger,[]) ) then
                                                                   FieldByName('EventDesc').AsString := 'Bull '+IntToStr(iRcmdBullInd)+' : ' + Format('%s', [tAnimals.FieldByName('AnimalNo').AsString]);
                                                            end
                                                         else
                                                            FieldByName('EventDesc').AsString := GenQuery.FieldByName('EventDesc').AsString;
                                                      end;
                                                end
                                             else
                                                FieldByName('EventDesc').AsString  := GenQuery.FieldByName('EventDesc').AsString;

                                             FieldByName('HerdID').AsInteger       := GenQuery.FieldByName('HerdID').AsInteger;
                                             FieldByName('ICBFNotified').AsBoolean := FALSE; // added 28/2/2000 KR
                                             FieldByName('ICBFAction').AsString    := 'A'; // added 20/11/00 KR

                                             { SP 12/12/2003 For Moorepark }
                                             FieldByName('MPNotified').AsBoolean := FALSE;
                                             FieldByName('MPAction').AsString    := 'A';

                                             //   10/09/15 [V5.4 R8.5] /MK Bug Fix - Default IsSynchronized to False for all events.
                                             FieldByName('IsSynchronized').AsBoolean := False;

                                             //   15/09/15 [V5.4 R8.5] /MK Bug Fix - Default Modified to False for all events.
                                             FieldByName('Modified').AsBoolean := False;

                                             FieldByName('EventSource').AsInteger := sINTERNAL_BLOCKEVENT;

                                             //   17/04/18 [V5.7 R8.8] /MK Bug Fix - WriteTheOtherEvent was removed when new TPregDiagEvent class was added.
                                             WriteTheOtherEvent(CurrentID);

                                             Post;
                                             if (WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness]) then
                                                begin
                                                   if (GenQuery.FieldByName('GroupID').AsInteger > 0) then
                                                     if ( not(WinData.GroupManager.AnimalInThisGroup(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                                   GenQuery.FieldByName('GroupID').AsInteger)) ) then
                                                        WinData.GroupManager.AddToGroup(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                        GenQuery.FieldByName('GroupID').AsInteger, TRUE,
                                                                                        GenQuery.FieldByName(fn_EventDate).AsDateTime,
                                                                                        TempAnimals.FieldByName('NatIdNum').AsString, False);
                                                end
                                             else if ( WinData.EventType = TService ) then
                                                LoadBreedingData(GenQuery, False, True);

                                             Inc(CountOfRecords);
                                          finally
                                          end;

                                    if ( WinData.EventType = TFertilityCheck) then
                                       begin
                                          // 1. Create Culling Events where required
                                          // 2. Start Animals on Fertility Program where required.
                                          ActionDescription := HerdLookup.GetFertilityCheckActionDescription(GenQuery.FieldByName('Action').AsInteger);
                                          if UPPERCASE(ActionDescription) = 'START PROGRAM' then
                                             begin
                                                WinData.FertilityPrograms.StartAnimalOnProgram
                                                (
                                                   GenQuery.FieldByName('AnimalId').AsInteger,
                                                   GenQuery.FieldByName('LactNo').AsInteger,
                                                   GenQuery.FieldByName('FertProgram').AsInteger,
                                                   CurrentID,
                                                   GenQuery.FieldByName('EventDate').AsDateTime
                                                );
                                             end
                                          else if UPPERCASE(ActionDescription) = 'CULL' then
                                             begin
                                                WinData.UpdateCowFertilityCulledStatus
                                                (
                                                   GenQuery.FieldByName('AnimalID').AsInteger,
                                                   GenQuery.FieldByName('LactNo').AsInteger,
                                                   GenQuery.FieldByName('HerdID').AsInteger,
                                                   True,
                                                   GenQuery.FieldByName('EventDate').AsDateTime
                                                );
                                             end;
                                       end
                                    else if ( WinData.EventType = TConditionScore) then
                                       begin
                                          WinData.AddToEventLookupData(GenQuery.FieldByName('AnimalID').AsInteger, CCondScoreEvent);
                                       end
                                    else if ( WinData.EventType = TService ) then
                                       begin
                                          WinData.AddToEventLookupData(GenQuery.FieldByName('AnimalID').AsInteger, cServiceEvent);
                                       end
                                     else if ( WinData.EventType = TDryOff ) and ( FHerdType = htSuckler ) and ( CountryOfReg = Ireland ) then
                                        begin
                                           WinData.CreateCalfWeaningEvent(GenQuery.FieldByName('AnimalId').AsInteger,
                                                                          GenQuery.FieldByName('LactNo').AsInteger,
                                                                          DateHealth.Date);
                                        end;

                                    pbInfo.Position := GenQuery.RecNo;

                                    AnimalPostCount := AnimalPostCount + 1;
                                    GenQuery.Next;
                                 except
                                    on e : Exception do
                                        ApplicationLog.LogException(e);
                                 end;
                           finally
                              if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
                                 begin
                                    if ( FHealthRec <> nil ) then
                                       begin
                                          if FHealthRec.Database.InTransaction then
                                             FHealthRec.Database.Commit;
                                          FHealthRec.Free;
                                       end;
                                 end;
                              if ( WinData.EventType = TPregDiag ) then
                                 begin
                                    if ( FPregDiagRec <> nil ) then
                                       begin
                                          if FPregDiagRec.Database.InTransaction then
                                             FPregDiagRec.Database.Commit;
                                          FPregDiagRec.Free;
                                       end;
                                 end;
                           end;
                     finally
                        pInfo.Hide;
                     end;

                  if ( CountOfRecords > 0 ) then
                     begin
                        MessageDLG(IntToStr(CountOfRecords) + ' Record(s) written',mtInformation,[mbOK],0);
                        if ( WinData.EventType = TPregDiag ) then
                           UpdateGridFromSavedPregDiagEvents;
                     end;

                  SavingInfo := False;
               end;

         // finally, save stock bull changes for service record - 20/11/00 - kr
         if (WinData.EventType = TService) and (dbdBullIn.Date > 0) then
            begin
               // get bull details
               if WinData.LookUpDamSire.Locate('ID',dbcServBull.Value,[]) then
                  // farm bulls only included
                  if NOT (WinData.LookUpDamSire.FieldByName('HerdID').AsInteger = WinData.NONEHerdID) then
                     begin
                        WinData.EventType := TStockBull;
                        with WriteEvents do
                           begin
                              // Bull in event
                              Append;
                              FieldByName('AnimalID').AsInteger     := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                              FieldByName('AnimalLactNo').AsInteger := 0;
                              FieldByName(fn_EventDate).AsDateTime   := dbdBullIn.Date;
                              FieldByName('EventDesc').AsString     := 'Stock Bull In';
                              FieldByName('HerdID').AsInteger       := WinData.LookUpDamSire.FieldByName('HerdID').AsInteger;
                              FieldByName('ICBFNotified').AsBoolean := FALSE;
                              FieldByName('ICBFAction').AsString    := 'A';
                              Post;
                              // Bull out event
                              Append;
                              FieldByName('AnimalID').AsInteger     := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                              FieldByName('AnimalLactNo').AsInteger := 0;
                              FieldByName(fn_EventDate).AsDateTime   := dbdBullOut.Date;
                              FieldByName('EventDesc').AsString     := 'Stock Bull Out';
                              FieldByName('HerdID').AsInteger       := WinData.LookUpDamSire.FieldByName('HerdID').AsInteger;
                              FieldByName('ICBFNotified').AsBoolean := FALSE;
                              FieldByName('ICBFAction').AsString    := 'A';

                              Post;
                           end;
                     end;

               // return to service event type
               WinData.EventType := TService;
            end;

         except
            // 12/01/12 [V5.0 R3.3] /MK Change -
            // If TConditionScore.Score Less Than 1 And Greater Than 5 Program Hits Here.
            // No Need To Show This Message On Condition Score Event.
            ShowMessage('Error occurred - please contact Kingswood');
         end;
      DeSelectAll;

      //   23/07/14 [V5.3 R4.0] /MK Change - If HerdTest event then clear disease in TempAnimals.TableName for next disease if any.
      if ( WinData.EventType = THerdTest ) then
         begin
            with GetQuery do
               try
                  SQL.Clear;
                  SQL.Add('UPDATE '+TempAnimals.TableName+'');
                  SQL.Add('SET Disease = NULL');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               finally
                  Free;
               end;
         end;

   finally
      TempAnimals.First;
   end;
end;

// Post the changes. ( Cached Updates - so apply to the Database )
procedure TfEventsByGroup.WriteEventsAfterPost(DataSet: TDataSet);
begin
   try
      WinData.KingData.ApplyUpdates([WriteEvents,WriteOther]);
      //   23/09/19 [V5.9 R0.6] /MK Change - Add ToBeCulled to this array of events that need to update the IsSynchronized boolean for animal syncing - SP request.
      if ( WinData.EventType in [TBulling, TPlannedBull, TToBeCulled] ) then
         WinData.SetIsSynchronizedFlag(WriteEvents.FieldByName('AnimalID').AsInteger);
   except
      WriteEvents.CancelUpdates;
      WriteOther.CancelUpdates;
   end;
end;

procedure TfEventsByGroup.WriteEventsNewRecord(DataSet: TDataSet);
const
    EventType = 'EventType';
begin
   DataSet.FieldByName('ID').AsInteger := WinData.NextEventID;
   case WinData.EventType of
      THealth  : DataSet.FieldByName(EventType).Value := CHealthEvent;
      TDryOff  : DataSet.FieldByName(EventType).Value := CDryOffEvent;
      THerdVaccination: DataSet.FieldByName(EventType).Value := CHerdVaccination;
      TWeight  : DataSet.FieldByName(EventType).Value := CWeightEvent;
      TBulling : DataSet.FieldByName(EventType).Value := CBullingEvent;
      TService : DataSet.FieldByName(EventType).Value := CServiceEvent;
      TPregDiag: DataSet.FieldByName(EventType).Value := CPregDiagEvent;
      TSaleDeath: DataSet.FieldByName(EventType).Value := CSaleDeathEvent;
      TPurchase: DataSet.FieldByName(EventType).Value := CPurchaseEvent;
      TStockBull: DataSet.FieldByName(EventType).Value := CStockBullEvent;
      TMovement: DataSet.FieldByName(EventType).Value := CMovementEvent;
      TConditionScore: DataSet.FieldByName(EventType).Value := CCondScoreEvent;
      TFertilityCheck: DataSet.FieldByName(EventType).Value := CFertilityCheck;
      TMilkTemperament: DataSet.FieldByName(EventType).Value := CMilkTemperament;
      TPlannedBull : DataSet.FieldByName(EventType).Value := CPlannedBull;
      TToBeCulled : DataSet.FieldByName(EventType).Value := CToBeCulledEvent;
      TMastitis : DataSet.FieldByName(EventType).Value := CNewMastitisEvent;
      TLameness : DataSet.FieldByName(EventType).Value := CLamenessEvent;
   end;
end;

procedure TfEventsByGroup.SetDataSource(Sender: TTabSheet; DataSourceName: TDataSource);

   procedure SetControlSetDataSource(AControl : TWinControl);
   var
      i : Integer;
   begin
      for i := 0 to AControl.ControlCount-1 do
         begin
            if (AControl.Controls[i] is TDBEDit) then
               (AControl.Controls[i] as TDBEDit).DataSource := DataSourceName
            else if (AControl.Controls[i] is TRxDBLookupCombo) then
               (AControl.Controls[i] as TRxDBLookupCombo).DataSource := DataSourceName
            else if (AControl.Controls[i] is TDBLookupComboboxEh) then
               (AControl.Controls[i] as TDBLookupComboboxEh).DataSource := DataSourceName
            else if (AControl.Controls[i] is TDBCheckBox) then
               (AControl.Controls[i] as TDBCheckBox).DataSource := DataSourceName
            else if (AControl.Controls[i] is TDBRadioGroup) then
               (AControl.Controls[i] as TDBRadioGroup).DataSource := DataSourceName
            else if (AControl.Controls[i] is TDBDateEdit) then
               (AControl.Controls[i] as TDBDateEdit).DataSource := DataSourceName
            else if (AControl.Controls[i] is TcxDBLookupComboBox) then
               (AControl.Controls[i] as TcxDBLookupComboBox).DataBinding.DataSource := DataSourceName
            else if (AControl.Controls[i] is TcxDBSpinEdit) then
               (AControl.Controls[i] as TcxDBSpinEdit).DataBinding.DataSource := DataSourceName
            else if (AControl.Controls[i] is TcxDBTextEdit) then
               (AControl.Controls[i] as TcxDBTextEdit).DataBinding.DataSource := DataSourceName
            else if (AControl.Controls[i] is TcxDBComboBox) then
               (AControl.Controls[i] as TcxDBComboBox).DataBinding.DataSource := DataSourceName
            else if (AControl.Controls[i] is TcxDBCurrencyEdit) then
               (AControl.Controls[i] as TcxDBCurrencyEdit).DataBinding.DataSource := DataSourceName
            else if (AControl.Controls[i] is TcxDBCheckBox) then
               (AControl.Controls[i] as TcxDBCheckBox).DataBinding.DataSource := DataSourceName
         end;
   end;

begin
   if (UPPERCASE((Sender as TTabSheet).Name) = 'HEALTH') or (UPPERCASE((Sender as TTabSheet).Name) = 'DRYINGOFF') or
      (UPPERCASE((Sender as TTabSheet).Name) = 'TSVACCINATION') or (UPPERCASE((Sender as TTabSheet).Name) = 'TSMASTITIS') or
      (UPPERCASE((Sender as TTabSheet).Name) = 'TSLAMENESS')then
      begin
         // Health/DryOff controls are contained on TPanel not TTabSheet,
         SetControlSetDataSource(pHealthDryoff);
         SetControlSetDataSource(pSingleDrugEntry);
         SetControlSetDataSource(pSingleDrugCombos);
         SetControlSetDataSource(pVaccDisease);
         SetControlSetDataSource(pAreaTreated);
         SetControlSetDataSource(pDaysToRemind);
         SetControlSetDataSource(gbApplicRate);
      end
   //   02/10/12 [V5.1 R0.1] /MK Additional Feature - Added exception for new pBulling panel for Planned Bull and Bulling events.
   else if (UPPERCASE((Sender as TTabSheet).Name) = 'HEATS') or (UPPERCASE((Sender as TTabSheet).Name) = 'TSPLANNEDBULL') then
      SetControlSetDataSource(pBulling)
   else
      SetControlSetDataSource(Sender);
end;

procedure TfEventsByGroup.pgEventsChanging(Sender: TObject; var AllowChange: Boolean);
var
   NoQuest : Boolean;
   TabName : String;
begin
   try
      EnableDisableControls(FALSE);
      dlcbReportID.Enabled := False;
      if (Sender is TPageControl) then
         TabName := (Sender as TPageControl).ActivePage.Caption;
      NoQuest := FALSE;
      if (Sender is TPageControl) then
         if (Sender as TPageControl).ActivePage.Caption = cNoSelection then // No Selection
            NoQuest := TRUE;
      if NOT NoQuest then
         begin
            if MessageDLG('Are you finished with ' + TabName + ' events',mtInformation,[mbYes,mbNo],0) = mrNo then
               AllowChange := FALSE
            else
               // Recreate the TempEvents and regenerate the TempAnimals
               begin
                  CloseAndFree;
                  ResetGridCols;
               end;
         end;
   finally
      EnableDisableControls(TRUE);
   end;
end;

procedure TfEventsByGroup.pgEventsChange(Sender: TObject);
var
   i : Integer;
begin
   // 25/09/12 [V5.1 R0.0] /MK Bug Fix - *** DO NOT DELETE ***
   // Close and Open these WinData Queries as Access Violation appears in form if
   // the user clicks into a lookup field with these datasets  
   // Start
   WinData.qObservedBy.Active := False;
   WinData.qObservedBy.Active := True;

   WinData.qServiceType.Active := False;
   WinData.qServiceType.Active := True;

   WinData.qApplicMethod.Active := False;
   WinData.qApplicMethod.Active := True;
   // End

   HerdLookup.qICBFHealthCodes.Active := False;
   HerdLookup.qNonICBFHealthCodes.Active := False;
   HerdLookup.qLookupTreatmentUsed.Active := False;

   FServiceTypeAutoSet := False;
   try
      EnableDisableControls(FALSE);

      lGridFilter.Visible := pgEvents.ActivePage <> NoSelection;
      TotalSelected.Visible := pgEvents.ActivePage <> NoSelection;
      Label6.Visible := pgEvents.ActivePage <> NoSelection;
      teAnimalNo.Visible := pgEvents.ActivePage <> NoSelection;
      teNatIDNum.Visible := pgEvents.ActivePage <> NoSelection;
      Label5.Visible := pgEvents.ActivePage <> NoSelection;
      Image1.Visible := pgEvents.ActivePage <> NoSelection;
      SearchBevel.Visible := pgEvents.ActivePage <> NoSelection;
      btnPartNatIDSearch.Visible := pgEvents.ActivePage <> NoSelection;
      lPressEnterKeyTxt.Visible := pgEvents.ActivePage <> NoSelection;
      lPartNatIDTxt.Visible := pgEvents.ActivePage <> NoSelection;
      imgSearchInfo.Visible := pgEvents.ActivePage <> NoSelection;

      //   17/01/12 [V5.0 R3.5] /MK Change - New Check To Show New Block Deletion Button
      if ( pgEvents.ActivePage = NoSelection ) then
         begin
            ToolButton5.Visible := True;
            ToolButton5.Style := tbsDivider;
            ToolButton5.Width := 0;
            btnBlockDeletion.Visible := True;
            btnBlockDeletion.Enabled := True;
            btnBlockDeletion.Width := 97;
            btnBlockDeletion.Caption := 'Block Deletion';
            WinData.LoadBtnImage(WinData.Images,btnBlockDeletion.Glyph,cBtnImgCancel);
            ToolButton2.Visible := True;
            ToolButton2.Style := tbsDivider;
            ToolButton2.Width := 0;
            sbSave.Enabled := False;
            sbSave.Width := 0;
            sbSave.Caption := '';
            sbSave.Glyph := nil;
            ToolButton1.Visible := False;
            ToolButton1.Style := tbsSeparator;
            ToolButton1.Width := 0;
            btnSelectAll.Enabled := False;
            btnSelectAll.Width := 0;
            btnSelectAll.Caption := '';
            ToolButton6.Style := tbsSeparator;
            ToolButton6.Width := 0;
            sbDeSelectAll.Enabled := False;
            sbDeSelectAll.Width := 0;
            sbDeSelectAll.Caption := '';
            ToolButton12.Style := tbsSeparator;
            ToolButton12.Width := 0;
            btnSortAnimals.Enabled := False;
            btnSortAnimals.Width := 0;
            btnSortAnimals.Caption := '';
            ToolButton4.Style := tbsSeparator;
            ToolButton4.Width := 0;
         end
      else
         begin
            ToolButton5.Visible := False;
            ToolButton5.Style := tbsSeparator;
            ToolButton5.Width := 0;
            btnBlockDeletion.Visible := False;
            btnBlockDeletion.Enabled := False;
            btnBlockDeletion.Width := 0;
            btnBlockDeletion.Caption := '';
            btnBlockDeletion.Glyph := nil;
            ToolButton2.Visible := True;
            ToolButton2.Style := tbsDivider;
            ToolButton2.Width := 0;
            sbSave.Enabled := True;
            sbSave.Width := 72;
            sbSave.Caption := 'Save';
            WinData.LoadBtnImage(WinData.Images,sbSave.Glyph,cBtnImgSave);
            ToolButton1.Visible := True;
            ToolButton1.Style := tbsDivider;
            ToolButton1.Width := 0;
            btnSelectAll.Enabled := True;
            btnSelectAll.Width := 91;
            btnSelectAll.Caption := 'Select All';
            ToolButton6.Style := tbsDivider;
            ToolButton6.Width := 0;
            sbDeSelectAll.Enabled := True;
            sbDeSelectAll.Width := 91;
            sbDeSelectAll.Caption := 'De-select All';
            ToolButton12.Style := tbsDivider;
            ToolButton12.Width := 0;
            btnSortAnimals.Enabled := True;
            btnSortAnimals.Width := 80;
            btnSortAnimals.Caption := 'Sort Animals';
            ToolButton4.Style := tbsDivider;
            ToolButton4.Width := 0;
         end;

      lDrugExpires.Caption := '';

      if ( pgEvents.ActivePage.Name <> 'Health' ) or ( pgEvents.ActivePage.Name <> 'DryingOff' ) or
         ( pgEvents.ActivePage.Name <> 'tsVaccination' ) or ( pgEvents.ActivePage.Name <> 'tsMastitis' ) or
         ( pgEvents.ActivePage.Name <> 'tsLameness' ) then
         begin
            btnShowMultiTreat.Enabled := False;
            btnShowMultiTreat.Width := 0;
            btnShowMultiTreat.Caption := '';

            ToolButton7.Visible := False;
            ToolButton7.Style := tbsSeparator;
            ToolButton7.Width := 0;

            btnMultiDrug.Enabled := False;
            btnMultiDrug.Width := 0;
            btnMultiDrug.Caption := '';

            ToolButton8.Visible := False;
            ToolButton8.Style := tbsSeparator;
            ToolButton8.Width := 0;

            btnMedicineSetup.Enabled := False;
            btnMedicineSetup.Width := 0;
            btnMedicineSetup.Caption := '';

            ToolButton9.Visible := False;
            ToolButton9.Style := tbsSeparator;
            ToolButton9.Width := 0;

            btnVetLinkDrugs.Enabled := False;
            btnVetLinkDrugs.Width := 0;
            btnVetLinkDrugs.Caption := '';

            ToolButton10.Visible := False;
            ToolButton10.Style := tbsSeparator;
            ToolButton10.Width := 0;

            btnShowDefaultTreatmentTemplates.Enabled := False;
            btnShowDefaultTreatmentTemplates.Width := 0;
            btnShowDefaultTreatmentTemplates.Caption := '';

            ToolButton11.Visible := False;
            ToolButton11.Style := tbsSeparator;
            ToolButton11.Width := 0;

            btnDeleteTestDates.Enabled := False;
            btnDeleteTestDates.Width := 0;
            btnDeleteTestDates.Caption := '';

            ToolButton13.Visible := False;
            ToolButton13.Style := tbsSeparator;
            ToolButton13.Width := 0;
         end;

      pVaccDisease.Top := 0;
      pVaccDisease.Left := 875;
      pAreaTreated.Left := 875;
      pAreaTreated.Height := 53;
      lLameTreatment.Visible := ( pgEvents.ActivePageIndex = tsLameness.PageIndex );
      dblcLameTreatment.Visible := lLameTreatment.Visible;
      if pgEvents.ActivePage.Name = 'Heats' then
         begin
            WinData.EventType := TBulling;
            pBulling.Parent := Heats;
            Label2.Visible := True;
            ObservedBy.Visible := True;
         end
      else if pgEvents.ActivePage = tsPlannedBull then
         begin
            WinData.EventType := TPlannedBull;
            pBulling.Parent := tsPlannedBull;
            Label2.Visible := False;
            ObservedBy.Visible := False;
         end
      else if pgEvents.ActivePage.Name = 'Service' then
         WinData.EventType := TService
      else if pgEvents.ActivePage.Name = 'Health' then
         begin
            pHealthDryoff.Parent := pgEvents.ActivePage;
            WinData.EventType := THealth;
            pSingleDrugCombos.Visible := True;
            pVaccDisease.Visible := False;
            pAreaTreated.Visible := False;
         end
      else if pgEvents.ActivePage.Name = 'DryingOff' then
         begin
            pHealthDryoff.Parent := pgEvents.ActivePage;
            WinData.EventType := TDryOff;
            pSingleDrugCombos.Visible := True;
            pVaccDisease.Visible := False;
            pAreaTreated.Visible := False;
         end
      else if pgEvents.ActivePage.Name = 'tsVaccination' then
         begin
            pHealthDryOff.Parent := pgEvents.ActivePage;
            WinData.EventType := THerdVaccination;
            pSingleDrugCombos.Visible := True;
            pVaccDisease.Visible := True;
            pVaccDisease.Left := 402;
            pVaccDisease.Top := 3;
            pAreaTreated.Visible := False;
         end
      else if ( pgEvents.ActivePage.Name = 'tsMastitis' ) or
              ( pgEvents.ActivePage.Name = 'tsLameness' ) then
         begin
            pHealthDryoff.Parent := pgEvents.ActivePage;
            if ( pgEvents.ActivePage.Name = 'tsMastitis' ) then
               WinData.EventType := TMastitis
            else
               WinData.EventType := TLameness;
            pSingleDrugCombos.Visible := True;
            pVaccDisease.Visible := False;
            pAreaTreated.Visible := True;
            pAreaTreated.Left := 402;
            pAreaTreated.Top := 3;
            if ( pgEvents.ActivePage.Name = 'tsMastitis' ) then
               pAreaTreated.Height := 26;
         end
      else if pgEvents.ActivePage.Name = 'Weighing' then
         WinData.EventType := TWeight
      else if pgEvents.ActivePage.Name = 'PregDiag' then
         WinData.EventType := TPregDiag
      else if pgEvents.ActivePage.Name = 'tsTempMovement' then
         WinData.EventType := TMovement
      else if pgEvents.ActivePage.Name = 'tsConditionScore' then
         WinData.EventType := TConditionScore
      else if pgEvents.ActivePage = tsFertilityCheck then
         WinData.EventType := TFertilityCheck
      else if pgEvents.ActivePage = tsMilkTemperament then
         WinData.EventType := TMilkTemperament
      else if pgEvents.ActivePage = tsHerdTest then
         WinData.EventType := THerdTest
      else if pgEvents.ActivePage = tsVaccination then
         WinData.EventType := THerdVaccination
      else if pgEvents.ActivePage = tsToBeCulled then
         WinData.EventType := TToBeCulled
      else if pgEvents.Activepage = tsMastitis then
         WinData.EventType := TMastitis
      else if pgEvents.ActivePage = tsLameness then
         WinData.EventType := TLameness
      else if pgEvents.ActivePage = NoSelection then
         WinData.EventType := TNoEvent;

      // 24/05/11 [V4.1 R1.5] /MK Bug Fix - Only Show MultiTreat, MultiDrug If Health or DryingOff Event.
      //if ( pgEvents.ActivePage.Name = 'Health' ) or ( pgEvents.ActivePage.Name = 'DryingOff' ) then
      if ( pgEvents.ActivePage = Health ) or ( pgEvents.ActivePage = DryingOff ) or
         ( pgEvents.ActivePage = tsVaccination ) or ( pgEvents.ActivePage = tsMastitis ) or
         ( pgEvents.ActivePage = tsLameness ) then
         begin
            btnShowMultiTreat.Enabled := True;
            btnShowMultiTreat.Width := 116;
            btnShowMultiTreat.Caption := 'Repeat Treatment';

            ToolButton7.Visible := True;
            ToolButton7.Width := 8;
            ToolButton7.Style := tbsDivider;

            btnMultiDrug.Font.Style := [];
            btnMultiDrug.Enabled := True;
            btnMultiDrug.Width := 116;
            btnMultiDrug.Caption := 'Multi-Drug';

            ToolButton8.Visible := True;
            ToolButton8.Width := 8;
            ToolButton8.Style := tbsDivider;

            btnMedicineSetup.Enabled := True;
            btnMedicineSetup.Width := 116;
            btnMedicineSetup.Caption := 'Medicine Setup';

            ToolButton10.Visible := True;
            ToolButton10.Width := 8;
            ToolButton10.Style := tbsDivider;

            if ( VetLinkDataExists ) then
               begin
                  btnVetLinkDrugs.Font.Style := [];
                  btnVetLinkDrugs.Enabled := True;
                  btnVetLinkDrugs.Width := 116;
                  btnVetLinkDrugs.Caption := 'Vet Link Drugs';

                  ToolButton9.Visible := True;
                  ToolButton9.Width := 8;
                  ToolButton9.Style := tbsDivider;
               end;
         end;

      if ( pgEvents.ActivePage.Name = 'Weighing' ) then
         begin
            ToolButton10.Visible := True;
            ToolButton10.Width := 8;
            ToolButton10.Style := tbsDivider;

            btnShowDefaultTreatmentTemplates.Enabled := True;
            btnShowDefaultTreatmentTemplates.Width := 140;
            btnShowDefaultTreatmentTemplates.Caption := 'Treatment Templates';

            ToolButton11.Visible := True;
            ToolButton11.Style := tbsDivider;
            ToolButton11.Width := 8;
         end;

      //   15/10/18 [V5.8 R3.1] /MK Additional Feature - Show new Clear Disease Test Dates button if Herd Test tab is active.
      if ( pgEvents.ActivePageIndex = tsHerdTest.PageIndex ) then
         begin
            ToolButton11.Visible := True;
            ToolButton11.Style := tbsDivider;
            ToolButton11.Width := 8;

            btnDeleteTestDates.Enabled := True;
            btnDeleteTestDates.Caption := 'Clear Disease'+cCRLF+'Test Dates';
            btnDeleteTestDates.Width := 96;

            ToolButton13.Visible := True;
            ToolButton13.Style := tbsDivider;
            ToolButton13.Width := 8;
         end;

      //   12/11/11 [V5.0 R2.0] /MK Bug Fix - Do Not Allow Multi Drug For Drying Off.
      //   17/01/12 [V5.0 R3.5] /MK Change - Changed Check For If Drying Off And Not Health To Better Understand Code.
      //   10/04/13 [V5.1 R6.2] /MK Change - Enabled for Dry Off - If MultiDrug then create Health Event for second drug.
      {
      if ( pgEvents.ActivePage.Name = 'DryingOff' ) then
         begin
            btnMultiDrug.Enabled := False;
            btnMultiDrug.Width := 0;
            btnMultiDrug.Caption := '';
            //btnMultiDrug.Left := 475;
            ToolButton8.Width := 0;
            ToolButton8.Style := tbsSeparator;
         end;
      }

      UpdateReportPanel;

      AnimalGrid.FrozenCols := 0;
      AnimalGrid.Columns[3].Visible := not (WinData.EventType in [TBulling,TService,TDryOff,TPregDiag,TPlannedBull]);
      AnimalGrid.Columns[4].Visible := AnimalGrid.Columns[3].Visible;

      //   10/01/12 [V5.0 R3.2] /MK Additional Feature - Moved CountryOfReg Defintion To All Events.
      CountryOfReg := WinData.DefCountry(WinData.UserDefaultHerdID);

      FarmCode.Color := clWhite;
      FarmCode.Font.Color := clBlack;

      GroupListing.Visible := True;
      lAddToGroup.Visible := True;

      if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
         begin
            GetGroupInfo;
            WinData.LookupMediAdmin.Active := True;
            HerdLookup.qLookupTreatmentUsed.Active := True;
            if CountryOfReg = Ireland then
               begin
                  lICBFCode.Visible := True;
                  ICBFCode.Visible := True;
                  ICBFCode.Top := 8;
                  lICBFCode.Top := ICBFCode.Top+3;
                  HerdLookup.qICBFHealthCodes.Active := True;
                  HerdLookup.qNonICBFHealthCodes.Active := True;
                  MultiDrugGridDBTableViewICBFCode.Visible := True;
                  MultiDrugGridDBTableViewFarmCode.Caption := 'Health Code (Farm)';

                  lFarmCode.Caption := 'Health Code (Farm)';
                  FarmCode.Top := 35;
                  lFarmCode.Top := FarmCode.Top+3;

                  //   01/05/15 [V5.4 R5.3] /MK Change - Applic Method should be after FarmCode like singe treatment screen.
                  ApplicMethod.Top := 62;
                  lApplicMethod.Top := ApplicMethod.Top+3;

                  AdMinBy.Top := 89;
                  lAdMinBy.Top := AdMinBy.Top+3;

                  PrescribedBy.Top := 116;
                  lPrescribBy.Top := PrescribedBy.Top+3;

                  GroupListing.Top := 143;
                  lAddToGroup.Top := GroupListing.Top+3;
               end
            else
               begin
                  lICBFCode.Visible := False;
                  ICBFCode.Visible := False;
                  HerdLookup.qICBFHealthCodes.Active := False;
                  HerdLookup.qNonICBFHealthCodes.Active := True;
                  MultiDrugGridDBTableViewICBFCode.Visible := False;
                  MultiDrugGridDBTableViewFarmCode.Caption := 'Reason';

                  lFarmCode.Caption := 'Reason';
                  FarmCode.Top := 8;
                  //   07/03/18 [V5.7 R8.2] /MK Change - As Reason/FarmCode is a required field in Northern Ireland then set colour to teal and font colour to white.
                  if ( CountryOfReg = NIreland ) and ( WinData.EventType = THealth ) then
                     begin
                        FarmCode.Color := clTeal;
                        FarmCode.Font.Color := clWhite;
                     end;
                  lFarmCode.Top := FarmCode.Top+3;

                  //   01/05/15 [V5.4 R5.3] /MK Change - Applic Method should be after FarmCode like singe treatment screen.
                  ApplicMethod.Top := 35;
                  lApplicMethod.Top := ApplicMethod.Top+3;

                  AdMinBy.Top := 62;
                  lAdMinBy.Top := AdMinBy.Top+3;

                  PrescribedBy.Top := 89;
                  lPrescribBy.Top := PrescribedBy.Top+3;

                  GroupListing.Top := 116;
                  lAddToGroup.Top := GroupListing.Top+3;
               end;

            lICBFCode.Visible := ( CountryOfReg = Ireland ) and ( pSingleDrugEntry.Visible ) and ( WinData.EventType <> THerdVaccination );
            ICBFCode.Visible := lICBFCode.Visible;
            lFarmCode.Visible := ( pSingleDrugEntry.Visible ) and ( WinData.EventType <> THerdVaccination );
            FarmCode.Visible := lFarmCode.Visible;
            lApplicMethod.Visible := lFarmCode.Visible;
            ApplicMethod.Visible := lFarmCode.Visible;
            lAddToGroup.Visible := lFarmCode.Visible;
            GroupListing.Visible := lFarmCode.Visible;

            if ( not(ICBFCode.Visible) ) then
               begin
                  //   01/05/15 [V5.4 R5.3] /MK Bug Fix - AdminBy was not showing where CountryOfReg <> Ireland - Andrew Smith reported.
                  if ( WinData.EventType = THerdVaccination ) then
                     begin
                        lAdMinBy.Top := lDisease.Top + 27;
                        AdMinBy.Top := dblcbVaccineType.Top + 27;
                        lPrescribBy.Top := lAdMinBy.Top + 27;
                        PrescribedBy.Top := AdminBy.Top + 27;
                     end
                  else
                     begin
                        lAdMinBy.Top := lApplicMethod.Top + 27;
                        AdMinBy.Top := ApplicMethod.Top + 27;
                        lPrescribBy.Top := lAdMinBy.Top + 27;
                        PrescribedBy.Top := AdminBy.Top + 27;
                     end;
               end
            else
               begin
                  AdMinBy.Top := 89;
                  lAdMinBy.Top := AdMinBy.Top+3;
                  PrescribedBy.Top := 116;
                  lPrescribBy.Top := PrescribedBy.Top+3;
               end;

            if ( CountryOfReg = NIreland ) then
               lFarmCode.Caption := 'Reason';

            if ( WinData.EventType in [TMastitis, TLameness] ) then
               begin
                  lICBFCode.Visible := ( CountryOfReg = Ireland );
                  ICBFCode.Visible := lICBFCode.Visible;
                  lFarmCode.Visible := ( not(lICBFCode.Visible) );
                  FarmCode.Visible := lFarmCode.Visible;
                  if ( lICBFCode.Visible ) then
                     begin
                        if ( WinData.EventType = TMastitis ) then
                           begin
                              ICBFCode.Top := 35;
                              lICBFCode.Top := ICBFCode.Top + 3;
                           end
                        else if ( WinData.EventType = TLameness ) then
                           begin
                              ICBFCode.Top := 62;
                              lICBFCode.Top := ICBFCode.Top + 3;
                           end;
                     end;
                  if ( lFarmCode.Visible ) then
                     begin
                        if ( WinData.EventType = TMastitis ) then
                           begin
                              FarmCode.Top := 35;
                              lFarmCode.Top := FarmCode.Top + 3;
                           end
                        else if ( WinData.EventType = TLameness ) then
                           begin
                              FarmCode.Top := 62;
                              lFarmCode.Top := FarmCode.Top + 3;
                           end;
                     end;
                  pAreaTreated.Top := 8;
                  if ( CountryOfReg <> Ireland ) then
                     begin
                        ApplicMethod.Top := 62;
                        lApplicMethod.Top := ApplicMethod.Top+3;

                        AdMinBy.Top := 89;
                        lAdMinBy.Top := AdMinBy.Top+3;

                        PrescribedBy.Top := 116;
                        lPrescribBy.Top := PrescribedBy.Top+3;

                        GroupListing.Top := 143;
                        lAddToGroup.Top := GroupListing.Top+3;
                     end;

                  if ( WinData.EventType = TLameness ) then
                     begin
                        ApplicMethod.Top := 89;
                        lApplicMethod.Top := ApplicMethod.Top+3;

                        AdMinBy.Top := 116;
                        lAdMinBy.Top := AdMinBy.Top+3;

                        PrescribedBy.Top := 143;
                        lPrescribBy.Top := PrescribedBy.Top+3;

                        GroupListing.Visible := False;
                        lAddToGroup.Visible := False;
                     end;
               end;

            if ( WinData.EventType in [THealth, TDryOff, THerdVaccination] ) then
               begin
                  DrugUsed.Style.Color := clTeal;
                  DrugUsed.Style.Font.Color := clWhite;
                  DrugUsed.Update;
                  RateOfApplic.Style.Color := clTeal;
                  RateOfApplic.Style.Font.Color := clWhite;
                  RateOfApplic.Update;
                  AdminBy.Color := clTeal;
                  AdminBy.Font.Color := clWhite;
                  AdminBy.Update;
                  PrescribedBy.Color := clTeal;
                  PrescribedBy.Font.Color := clWhite;
                  PrescribedBy.Update;
                  Application.ProcessMessages;
               end
            else
               begin
                  DrugUsed.Style.Color := clWindow;
                  DrugUsed.Style.Font.Color := clWindowText;
                  DrugUsed.Update;
                  RateOfApplic.Style.Color := clWindow;
                  RateOfApplic.Style.Font.Color := clWindowText;
                  RateOfApplic.Update;
                  AdminBy.Color := clWindow;
                  AdminBy.Font.Color := clWindowText;
                  AdminBy.Update;
                  PrescribedBy.Color := clWindow;
                  PrescribedBy.Font.Color := clWindowText;
                  PrescribedBy.Update;
                  Application.ProcessMessages;
               end;
         end;

      DeActiveAllOtherPages;

      // Open the Write Others Table Component
      WriteOther.Close;

      case WinData.EventType of
         TService :  WriteOther.TableName := WinData.Services.TableName;
         TPlannedBull,
         TBulling :  WriteOther.TableName := WinData.Bullings.TableName;
         TLameness,
         TMastitis,
         THerdVaccination,
         TDryOff,
         THealth  :  begin
                        lDrugExpires.Caption := '';
                        WriteOther.TableName := WinData.Health.TableName;
                        bShowMultiDrugs := False;
                        pMultiDrug.Visible := False;
                        pSingleDrugEntry.Visible := True;
                     end;
         TWeight  :  WriteOther.TableName := WinData.Weighings.TableName;
         TPregDiag:  WriteOther.TableName := WinData.PregDiag.TableName;
         TBVDTest,
         TTBTestDate,
         TBruceTest,
         THerdTest : begin
                         WinData.LookUpDamSire.Close;
                         WinData.LookUpDamSire.ReadOnly := FALSE;
                         WinData.LookUpDamSire.Open;
                      end;
         TMovement : WriteOther.TableName := WinData.tMovements.TableName;
         TConditionScore : WriteOther.TableName := WinData.ConditionScore.TableName;
         TFertilityCheck : WriteOther.TableName := WinData.FertilityCheck.TableName;
         TMilkTemperament : WriteOther.TableName := WinData.MilkTemperament.TableName;
      end;

      //if (WinData.EventType <> TTBTestDate) And (WinData.EventType <> TBruceTest) And ( WinData.EventType <> TBVDTest )
      if ( not(WinData.EventType in [TTBTestDate,TBruceTest,TBVDTest,THerdTest]) )
         And (WinData.EventType <> TNoEvent) then
            WriteOther.Open;
      Refresh;
      CreateTempTable;

      AnimalGrid.FrozenCols := 0;
      if ( WinData.EventType in [TFertilityCheck, TBulling, TService, TPregDiag, TDryOff,
                                 TConditionScore, THealth, TWeight, TTBTestDate, TBruceTest,
                                 TMovement, TBVDTest, TMilkTemperament, THerdTest,
                                 THerdVaccination, TPlannedBull, TMastitis, TLameness] ) then
         AnimalGrid.FrozenCols := 6;
      {
      if WinData.EventType = TFertilityCheck then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TBulling then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TService then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TPregDiag then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TDryOff then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TConditionScore then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = THealth then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TWeight then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TTBTestDate then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TBruceTest then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TMovement then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TBVDTest then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TMilkTemperament then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = THerdTest then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = THerdVaccination then
         AnimalGrid.FrozenCols := 6
      else if WinData.EventType = TPlannedBull then
         AnimalGrid.FrozenCols := 6;
      }

      pgEvents.ActivePage.SetFocus;

      // GL - Don't allow HerdVaccination Animal Grid to be edited.
      if ( WinData.EventType = THerdVaccination ) then
         AnimalGrid.Options := [dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit]
      else
         AnimalGrid.Options := [dgEditing,dgTitles,dgIndicator,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];

      //   17/10/12 [V5.1 R0.4] /MK Additional Feature - Added check for active medicines if EventType is Health, DryOff or Vaccination.
      if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness] ) then
         CheckActiveMedicines;

      FFirstEntryOfEvent := False;

      if ( pgEvents.ActivePage.PageIndex <> NoSelection.PageIndex ) then
         Caption := 'On-Farm Events - ' + pgEvents.ActivePage.Caption;

   finally
      EnableDisableControls(TRUE);
      //   10/12/19 [V5.9 R1.5] /MK Change - If there are animals on the animal grid in multiple batch groups show orange warning box on Header section.
      try
         pDupGrpsPerAnimals.Visible := ( pgEvents.ActivePageIndex <> NoSelection.PageIndex ) and ( FDupGrpsPerAnimals.RecordCount > 0 );
      except
         on e : Exception do
            begin
               ApplicationLog.LogException(e);
               ApplicationLog.LogError(e.Message);
            end;
      end;
   end;
end;

procedure TfEventsByGroup.WriteOtherBeforePost(DataSet: TDataSet);
begin
   if (WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness]) then
      // Calculate the Drug Quantity;
      WinData.CalcCostAndQtyUsed(DataSet.FieldByName('DrugUsed').AsInteger,DataSet.FieldByName('RateApplic').AsFloat,DataSet);
end;

procedure TfEventsByGroup.WriteOtherAfterPost(DataSet: TDataSet);
begin
   if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
      begin
         if ( ( DataSet.FieldByName('NoTimes').AsFloat > 0 ) and ( DataSet.FieldByName('NoDays').AsFloat > 0) ) then
            begin
               WinData.UpdateMedicine(DataSet.FieldByName('DrugUsed').AsInteger,( ( DataSet.FieldByName('NoTimes').AsFloat * -WinData.DrugQtyUsed) * DataSet.FieldByName('NoDays').AsFloat),0);
               WinData.UpdateMediPurchQty(DataSet.FieldByName('DrugPurchID').AsInteger, DataSet.FieldByName('DrugUsed').AsInteger,
                                          ( ( DataSet.FieldByName('NoTimes').AsFloat * WinData.DrugQtyUsed) * DataSet.FieldByName('NoDays').AsFloat));
            end
         else
            begin
               WinData.UpdateMedicine(DataSet.FieldByName('DrugUsed').AsInteger,-WinData.DrugQtyUsed,0);
               WinData.UpdateMediPurchQty(DataSet.FieldByName('DrugPurchID').AsInteger,DataSet.FieldByName('DrugUsed').AsInteger,
                                          WinData.DrugQtyUsed);
            end;
      end
   else if ( WinData.EventType = TService ) then
      begin
         if ( WinData.SemenStockControl <> nil ) then
            begin
               WinData.SemenStockControl.BullId := DataSet.FieldByName('ServiceBull').AsInteger;
               WinData.SemenStockControl.AmountOfStraw := DataSet.FieldByName('AmountOfStraw').AsFloat;
               WinData.SemenStockControl.Update();
            end;
      end;

      {if NOT ((WinData.OrigDrug = DataSet.FieldByName('DrugUsed').AsInteger) And (WinData.OrigQty = DataSet.FieldByName('RateApplic').AsFloat)) then
         begin
            //WinData.UpdateMedicine(WinData.OrigDrug,WinData.OrigQty,0);
            WinData.UpdateMedicine(DataSet.FieldByName('DrugUsed').AsInteger,-WinData.DrugQtyUsed,0);
         end;  }
end;

procedure TfEventsByGroup.WriteOtherBeforeEdit(DataSet: TDataSet);
begin
   if (WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness]) then
      begin
         // Set the Originals to Zero
         WinData.OrigQty := 0;
         WinData.OrigDrug:= 0;
      end;
end;

// Administered by LookUp
procedure TfEventsByGroup.AdMinByCloseUp(Sender: TObject);
begin
   if ((Sender as TRxDBLookUpCombo).Value = '0') Then        //SP 05/12/00
      begin
         uMediAdminSetUp.ShowTheForm(TRUE,adAdministrator);      //Due to Delphi 3-5 conversion.
         //   13/01/16 [V5.5 R2.2] /MK Bug Fix - Refresh both AdminBy and Prescribed query's just in case user adds both types.
         HerdLookup.QueryAdminBy.Close;
         HerdLookup.QueryAdminBy.Open;

         HerdLookup.QueryPrescribedBy.Close;
         HerdLookup.QueryPrescribedBy.Open;
      end;
end;

// Application Method LookUP
procedure TfEventsByGroup.ApplicMethodCloseUp(Sender: TObject);
begin
   If ((Sender as TRxDBLookUpCombo).Value = '0') Then        //SP 05/12/00 ApplicMethod changed to ApplicMethod2
      begin                                                  //Due to Delphi 3-5 conversion.
         GenLookUpType := TApplicMethod;
         uGenLookSetUp.ShowTheForm(TRUE);
         //   13/01/16 [V5.5 R2.2] /MK Bug Fix - Refresh query to get newly added applic methods.
         WinData.qApplicMethod.Close;
         WinData.qApplicMethod.Open;
      end;
end;

// Health Code LookUp
procedure TfEventsByGroup.ICBFCodeCloseUp(Sender: TObject);
begin
   If ((Sender as TRxDBLookUpCombo).Value = '0') Then
      begin
         GenLookUpType := THealthCode;                       //SP 05/12/00
         uGenLookSetUp.ShowTheForm(TRUE);                    //Due to Delphi 3-5 conversion.
         if CountryOfReg = Ireland then
            begin
               HerdLookup.qICBFHealthCodes.Close;
               HerdLookup.qICBFHealthCodes.Open;
            end
         else
            begin
               WinData.qHealthCodes.Close;
               WinData.qHealthCodes.Open;
            end;
      end;
end;

procedure TfEventsByGroup.sbDeSelectAllClick(Sender: TObject);
begin
   // Run Query to Clear the Tick Boxes
   if MessageDlg( 'Are you sure you want to de-select all animals?',mtConfirmation,[mbYes,mbNo],0) = idNo then Exit;

   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE ' + TempAnimals.TableName);
            SQL.Add('SET Selected = FALSE');
            ExecSQL;
         end;
      AllAnimalsSelected := FALSE;
      AnimalGrid.DataSource.DataSet.Refresh;
      AnimalGrid.DataSource.DataSet.First;
      CountSelectedRecords;
   except
      ShowMessage('Cannot Clear the selection');
   end;
end;

procedure TfEventsByGroup.TempEventsYesNoValidate(Sender: TField);
begin
   if NOT ((UPPERCASE((Sender as TField).AsString) = 'YES') or (UPPERCASE((Sender as TField).AsString) = 'NO')) then
      raise ErrorMsg.CreateFmt('%s is not a valid Status - must be %s or %s',[(Sender As TField).AsString,'Yes','No']);
end;

procedure TfEventsByGroup.OnEnteringControl(Sender: TObject);
begin
   // check the TempAnimals and TempEvents are Active
   if (TempAnimals.Active) And (TempEvents.Active) then
      begin
         EnableDisableControls(TRUE);
         if (Sender is TDBEDit) then
            CurrentField := (Sender as TDBEDit).Field.FieldName
         else if (Sender is TRxDBLookupCombo) then
            CurrentField := (Sender as TRxDBLookupCombo).Field.FieldName
         else if (Sender is TDBLookupComboboxEh) then
            CurrentField := (Sender as TDBLookupComboboxEh).DataField
         else if (Sender is TDBCheckBox) then
            CurrentField := (Sender as TDBCheckBox).Field.FieldName
         else if (Sender is TDBRadioGroup) then
            CurrentField := (Sender as TDBRadioGroup).Field.FieldName
         else if (Sender is TDBDateEdit) then
            CurrentField := (Sender as TDBDateEdit).Field.FieldName
         else if (Sender is TcxDBLookupComboBox) then
            CurrentField := (Sender as TcxDBLookupComboBox).DataBinding.DataField
         else if (Sender is TcxDBDateEdit) then
            CurrentField := (Sender as TcxDBDateEdit).DataBinding.DataField
         else if (Sender is TcxDBSpinEdit) then
            CurrentField := (Sender as TcxDBSpinEdit).DataBinding.DataField
         else if (Sender is TcxDBTextEdit) then
            CurrentField := (Sender as TcxDBTextEdit).DataBinding.DataField
         else if (Sender is TcxDBCurrencyEdit) then
            CurrentField := (Sender as TcxDBCurrencyEdit).DataBinding.DataField
         else if (Sender is TcxDBCheckBox) then
            CurrentField := (Sender as TcxDBCheckBox).DataBinding.DataField
         else if (Sender is TcxDBComboBox) then
            CurrentField := (Sender as TcxDBComboBox).DataBinding.DataField;
      end;
end;

procedure TfEventsByGroup.ServiceTypesCloseUp(Sender: TObject);
begin
   if (ServiceTypes.Value = '0') then
      begin
         GenLookUpType := TServiceType;
         uGenLookSetUp.ShowTheForm(TRUE);
      end;
end;

procedure TfEventsByGroup.ChangedItem(Sender: TObject);
const
   CSMinValue = 1;
   CSMaxValue = 5;
var
   GenlookID : Variant;
   i : Integer;
   ActiveAIBull : Boolean;
   ActionDescription : String;
begin
   ItemChanged := TRUE;

   lStockBull.Caption := '';
   dbdBullIn.Date := 0;
   pStockBull.Visible := False;
   gbSexedSemen.Visible := False;
   if ( WinData.EventType = TService ) then
      if ( Sender is TRxDBLookupCombo ) then
         if ( (Sender as TRxDBLookupCombo).DataField = 'ServiceBull' ) then
            begin
               if ( TempEvents.FindField('ServiceType') <> nil ) then
                  TempEvents.FieldByName('ServiceType').AsVariant := Null;

               //   07/06/11 [V4.1 R1.8] /MK Bug Fix - Error If Not Locate Of AI LookupCode.
               if ( TempEvents.FieldByName('ServiceBull').AsInteger > 0 ) then
                  begin
                     if ( WinData.IsActiveAIBull(TempEvents.FieldByName('ServiceBull').AsInteger) ) then
                        begin
                           if WinData.GenLookUp.Locate('LookupCode', 'AI', []) then
                              begin
                                 GenlookID := WinData.GenLookUp.Lookup('LookupCode', 'AI', 'ID');
                                 if (( not VarIsNull(GenlookID)) and (GenlookID > 0 )) then
                                    begin
                                       ServiceTypes.KeyValue := GenlookID;
                                       FServiceTypeAutoSet := True;
                                    end;
                              end;
                        end
                     //   08/04/16 [V5.5 R5.7] /MK Change - If user selects a Stock Bull from Bull List then default Service Type to Natural Service.
                     else if ( HerdLookup.qStockBulls.Locate('ID',TempEvents.FieldByName('ServiceBull').AsInteger,[]) ) then
                        begin
                           if WinData.GenLookUp.Locate('Description', cServiceType_Naturual, [loCaseInsensitive]) then
                              begin
                                 GenlookID := WinData.GenLookUp.FieldByName('ID').AsInteger;
                                 if (( not VarIsNull(GenlookID)) and (GenlookID > 0 )) then
                                    begin
                                       ServiceTypes.KeyValue := GenlookID;
                                       FServiceTypeAutoSet := True;
                                    end;
                              end;
                        end;

                     pStockBull.Visible := ( ServiceTypes.Text = cServiceType_Naturual );
                     if ( pStockBull.Visible ) then
                        begin
                           lStockBull.Caption := dbcServBull.Text;
                           dbdBullIn.Date := ServiceDate.Date;
                        end;

                    //   18/03/16 [V5.5 R4.4] /MK Bug Fix - pStockBull was being overwritten by gbSexedSemen when a StockBull and Natural Service were selected.
                    gbSexedSemen.Visible := ( not(pStockBull.Visible) );
                    if ( gbSexedSemen.Visible ) then
                       gbSexedSemen.Left := pStockBull.Left;
                  end;
            end;

   if ( WinData.EventType = TFertilityCheck ) then
      if ( Sender is TcxDBLookupComboBox ) then
         if ( UpperCase((Sender as TcxDBLookupComboBox).DataBinding.DataField) = 'ACTION' ) then
            try
               ActionDescription := HerdLookup.GetFertilityCheckActionDescription(TempEvents.FieldByName('Action').AsInteger);
               lFertProgram.Visible := ( UPPERCASE(ActionDescription) = 'START PROGRAM' );
               cmboFertilityCheckFertilityProgram.Visible := lFertProgram.Visible;
            except
            end;

   if ( WinData.EventType in [THealth, THerdVaccination, TDryOff, TMastitis, TLameness] ) then
     if ( Sender is TDBDateEdit ) then
        if ( UpperCase((Sender as TDBDateEdit).DataField) = 'EVENTDATE' ) then
           if ( DrugUsed.EditValue > 0 ) then
              LookupBatchNo; 
end;

procedure TfEventsByGroup.EnableDisableControls(Enabled: Boolean);
begin
   if Enabled then
      try
         TempAnimals.EnableControls;
         TempEvents.EnableControls;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end
   else
      try
         TempAnimals.DisableControls;
         TempEvents.DisableControls;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;
end;

procedure TfEventsByGroup.dbpInfoProgress(Sender: TObject; var AbortQuery: Boolean);
begin
   pbInfo.Position := pbInfo.Position + 1;
   if (pbInfo.Position > pbInfo.max) then
      pbInfo.Position := 1;
end;

procedure TfEventsByGroup.dbdBullInChange(Sender: TObject);
begin
   if (dbdBullIn.Date > ServiceDate.Date) then
      begin
         dbdBullIn.SetFocus;
         messagedlg('Date In cannot be after Service Date',mtError,[mbOK],0);
      end;
   // activate date to if datefrom > 0
   if (dbdBullIn.Date > 0) then
      begin
         dbdBullOut.Enabled := True;
         dbdBullOut.Date    := dbdBullIn.Date;
      end
   else
      begin
         dbdBullOut.Enabled := False;
         // blank component text
      end;
end;

procedure TfEventsByGroup.dbdBullOutExit(Sender: TObject);
begin
   if (dbdBullOut.Date < dbdBullIn.Date) or (dbdBullOut.Date < ServiceDate.Date) then
      begin
         dbdBullOut.SetFocus;
         messagedlg('Date out cannot be before Date In, or Service Date',mtError,[mbOK],0);
      end;
end;

procedure TfEventsByGroup.DeSelectAll;
var
   MyBookMark : TBookMark;
begin
   // Update the Selected Animals with the new info.
   try
      MyBookMark := TempAnimals.GetBookmark;
      EnableDisableControls(FALSE);
      // TempAnimals.DisableControls;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE ' + TempAnimals.TableName);
            // SQL.Add('UPDATE ' + TempAnimals.TableName + ' TA');
            SQL.Add('SET Selected=FALSE');
            ExecSQL;
         end;
   finally
      TempAnimals.GotoBookmark(MyBookMark);
      TempAnimals.FreeBookmark(MyBookMark);
      // TempAnimals.EnableControls;
      CountSelectedRecords;
      EnableDisableControls(TRUE);
   end;
end;

procedure TfEventsByGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   HideHintStyleController();

   with WinData do
      if (WinData.EventType in [TTBTestDate, TBruceTest, TBVDTest, THerdTest]) then
         begin
            AnimalFileByID.Close;
            AnimalFileByID.Open;
         end;

   if WinData.qDrugBatchNo.Active then
      WinData.qDrugBatchNo.Active := False;
end;

procedure TfEventsByGroup.LookupBatchNo;
var
   qBatchCounts : TQuery;
begin
   qBatchCounts := TQuery.Create(nil);
   try
      qBatchCounts.DatabaseName := AliasName;
      qBatchCounts.SQL.Clear;
      qBatchCounts.SQL.Add('SELECT Distinct(BatchNo), Count(BatchNo) BatchCount');
      qBatchCounts.SQL.Add('FROM MediPur');
      qBatchCounts.SQL.Add('WHERE DrugID = :DrugID');
      qBatchCounts.SQL.Add('AND   QtyRemaining > 0');
      qBatchCounts.SQL.Add('AND   InUse = True');
      qBatchCounts.SQL.Add('AND   PurchDate <= :TreatDate');
      qBatchCounts.SQL.Add('GROUP BY BatchNo');

      WinData.qDrugBatchNo.Filter := '';
      WinData.qDrugBatchNo.Filtered := False;
      WinData.qDrugBatchNo.Active := False;
      WinData.qDrugBatchNo.Active := True;
      if ( DrugUsed.EditValue > 0 ) then
         begin
            dbcbDrugBatchNo.Enabled := True;
            btnLookupBatchQtys.Visible := True;
            actSelectBatchNo.Enabled := True;
            actSelectBatchNo.Visible := True;
            dbcbDrugBatchNo.Width := 172;
            Application.ProcessMessages;
            Update;

            //   07/06/19 [V5.8 R9.3] /MK Change - Filter out those drugs that have Quantity Remaining - this also helps where two batchs of same number, one has quantity and the other doesn't - Una Carter.
            // WinData.qDrugBatchNo is used to get all drug purchases in the database for the selected drug.
            WinData.qDrugBatchNo.Filter := 'DrugID='+IntToStr(DrugUsed.EditValue);
            WinData.qDrugBatchNo.Filtered := True;
            WinData.qDrugBatchNo.First;

            HerdLookup.qDrugBatchNos.Close;
            HerdLookup.qDrugBatchNos.Params[0].AsInteger := DrugUsed.EditValue;
            HerdLookup.qDrugBatchNos.Params[1].AsDateTime := TempEvents.FieldByName('EventDate').AsDateTime;
            HerdLookup.qDrugBatchNos.Open;
            HerdLookup.qDrugBatchNos.First;

            qBatchCounts.Close;
            qBatchCounts.Params[0].AsInteger := DrugUsed.EditValue;
            qBatchCounts.Params[1].AsDateTime := TempEvents.FieldByName('EventDate').AsDateTime;
            qBatchCounts.Open;

            dbcbDrugBatchNo.Properties.Items.Clear;
            // Now go through BatchNo's in Medicine Purchases that are active and add them to the list.
            while ( not(HerdLookup.qDrugBatchNos.Eof) ) do
               begin
                  if ( qBatchCounts.Locate('BatchNo',HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString,[loCaseInsensitive]) ) then
                     begin
                        if ( qBatchCounts.FieldByName('BatchCount').AsInteger = 1 ) then
                           begin
                              if (dbcbDrugBatchNo.Properties.Items.IndexOf(HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString) = -1) then
                                 dbcbDrugBatchNo.Properties.Items.AddObject(HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString,
                                                                            Pointer(HerdLookup.qDrugBatchNos.FieldByName('ID').AsInteger));
                           end
                        else if ( qBatchCounts.FieldByName('BatchCount').AsInteger > 1 ) then
                           begin
                              if (dbcbDrugBatchNo.Properties.Items.IndexOf(HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString) = -1) then
                                 dbcbDrugBatchNo.Properties.Items.Add(HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString);
                           end;
                     end;

                  HerdLookup.qDrugBatchNos.Next;
               end;

            //   03/08/12 [V5.0 R8.4] /MK Bug Fix - SQL was adding all BatchNo's from Health.db instead of only those that were entered manually.
            // Now query the Health database for BatchNo's that were entered manually and add them to the list.
            with FManualBatchNoQuery do
               begin
                  Params[0].AsInteger := DrugUsed.EditValue;
                  Open;
                  try
                     First;
                     while not Eof do
                        begin
                           dbcbDrugBatchNo.Properties.Items.Add(Fields[0].AsString);
                           Next;
                        end;
                  finally
                     Close;
                  end;
               end;

            // Add blank line to the list for manual entry.
            dbcbDrugBatchNo.Properties.Items.Add('');
        end
      else if ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
         begin
            {
            WinData.qDrugBatchNo.Filter := 'DrugID='+IntToStr(mdMultiDrugDrugUsed.AsInteger);
            WinData.qDrugBatchNo.Filtered := True;
            WinData.qDrugBatchNo.First;
            }

            HerdLookup.qDrugBatchNos.Close;
            HerdLookup.qDrugBatchNos.Params[0].AsInteger := mdMultiDrugDrugUsed.AsInteger;
            HerdLookup.qDrugBatchNos.Params[1].AsDateTime := TempEvents.FieldByName('EventDate').AsDateTime;
            HerdLookup.qDrugBatchNos.Open;
            HerdLookup.qDrugBatchNos.First;

            with MultiDrugGridDBTableView do
               begin
                  with GetColumnByFieldName('DrugBatchNo') do
                     begin
                        PropertiesClass := TcxComboBoxProperties;
                        with TcxComboBoxProperties(Properties) do
                           begin
                              Items.Clear;
                              // Now go through BatchNo's in Medicine Purchases that are active and add them to the list.
                              while ( not(HerdLookup.qDrugBatchNos.Eof) ) do
                                 begin
                                    //    30/04/15 [V5.4 R5.3] /MK Bug Fix - Check if BatchNo/DrugPurchID Index already added and don't add again.
                                    //Items.Add(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString);
                                    if (Items.IndexOf(HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString) = -1) then
                                       Items.AddObject(HerdLookup.qDrugBatchNos.FieldByName('BatchNo').AsString,
                                                       Pointer(HerdLookup.qDrugBatchNos.FieldByName('ID').AsInteger));
                                    HerdLookup.qDrugBatchNos.Next;
                                 end;

                              // Now query the Health database for BatchNo's that were entered manually and add them to the list.
                              with FManualBatchNoQuery do
                                 begin
                                    Params[0].AsInteger := mdMultiDrugDrugUsed.AsInteger;
                                    Open;
                                    try
                                       First;
                                       while not Eof do
                                          begin
                                             Items.Add(Fields[0].AsString);
                                             Next;
                                          end;
                                    finally
                                       Close;
                                    end;
                                 end;

                              // Add blank line to the list for manual entry.
                              Items.Add('');
                           end;
                     end;
               end;
        end;
   finally
      if ( qBatchCounts <> nil ) then
         FreeAndNil(qBatchCounts);
   end;
end;

procedure TfEventsByGroup.AnimalGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   try
      if (TempAnimalsSelected.AsBoolean) then
         Background := clBtnShadow
      else
         Background := clWindow;

      if ( WinData.EventType = TPregDiag ) then
         if ( TempAnimals.FieldByName('RepeatPregDiag').AsBoolean ) then
            Background := clYellow;

      if ( WinData.EventType = TService ) then
         if ( TempAnimals.FieldByName('PrevPregDiagEvent').AsBoolean ) then
               Background := clYellow;

      if ( FDupGrpsPerAnimals.RecordCount > 0 ) then
         if ( FDupGrpsPerAnimals.Locate('AnimalID',TempAnimals.FieldByName('AnimalID').AsInteger,[]) ) then
            Background := $0000A5FF;
   except
      Background := clWindow;
   end;
end;

procedure TfEventsByGroup.GetDrugExpiryDate;
var
   i,
   MediPurchID : Integer;
begin
   if (WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness]) then
      begin
         lDrugExpires.Caption := '';
         if ( (DrugUsed.EditValue = 0) or (DrugUsed.EditValue = Null) ) then
            begin
               dbcbDrugBatchNo.Text := Null;
               MessageDlg('Medicine must be entered before batch number',mtWarning,[mbOk],0);
            end
         else
            begin
               if ( Length(dbcbDrugBatchNo.Text) > 0 ) then
               begin
                 MediPurchID := Integer(dbcbDrugBatchNo.ItemObject);
                 if ( MediPurchID > 0 ) then
                    try
                       //   23/08/13 [V5.2 R0.2] /MK Bug Fix - Search by DrugPurchID to locate correct Expiry Date.
                       if WinData.dsDrugBatchNo.DataSet.Locate('ID;DrugID;BatchNo',VarArrayOf([MediPurchID,DrugUsed.EditValue,dbcbDrugBatchNo.Text]),[]) then
                          begin
                             if WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime > 0 then
                                begin
                                   lDrugExpires.Caption := 'Expires: '+cCRLF+FormatDateTime(cIrishDateStyle,  WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime)+'';
                                   if WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime <= Date then
                                      begin
                                         lDrugExpires.Font.Color := clRed;
                                         MessageDlg('The drug batch number you have selected has expired.',mtWarning,[mbOk],0);
                                      end
                                   else
                                      lDrugExpires.Font.Color := clWindowText;
                                end;

                             //   23/08/13 [V5.2 R0.2] /MK Bug Fix - If DrugPurchID/ExpiryDate found then update TempAnimals with correct DrugPurchID. 
                             with TQuery.Create(nil) do
                                try
                                   DatabaseName := AliasName;
                                   SQL.Clear;
                                   SQL.Add('UPDATE '+TempAnimals.TableName+'');
                                   SQL.Add('SET DrugPurchID = '+IntToStr(MediPurchID)+'');
                                   try
                                      try
                                         ExecSQL;
                                      except
                                         on e : Exception do
                                            ShowMessage(e.Message);
                                      end;
                                   finally
                                      Close;
                                   end;
                                finally
                                   Free;
                                end;

                          end;
                     except
                        MessageDlg('Error: Unable to locate Drug Expiry Date',mtWarning,[mbOk],0);
                     end;
               end;
            end;
      end;
end;

procedure TfEventsByGroup.SearchForBatchNo;
begin
end;

procedure TfEventsByGroup.FarmCodeCloseUp(Sender: TObject);
begin
   if ( (Sender as TRxDBLookUpCombo).Value = '0' ) then
      begin
         GenLookUpType := THealthCode;                       // SP 05/12/00
         uGenLookSetUp.ShowTheForm(TRUE);                    // Due to Delphi 3-5 conversion.
         if CountryOfReg = Ireland then
            begin
               HerdLookup.qNonICBFHealthCodes.Close;
               HerdLookup.qNonICBFHealthCodes.Open;
            end
         else
            begin
               WinData.qHealthCodes.Close;
               WinData.qHealthCodes.Open;
            end;
      end
   else
      begin
         //   01/03/18 [V5.7 R8.2] /MK Change - If user has enabled preference to default health comment to farm code and farm code has value then
         //                                     use farm code as EventDesc - Brendan Meade.
         if ( WinData.EventType = THealth ) and ( WinData.GlobalSettings.HealthCodeDefaultCommentIndex = cDefaultHealthCommentFarmCode ) then
            begin
               if ((FarmCode.Value <> '0') and (FarmCode.Value <> '')) then
                  TempEvents.FieldByName('EventDesc').AsString := FarmCode.Text
               else
                  TempEvents.FieldByName('EventDesc').AsString := 'Health';
               UpdateAnimals(Sender);
               CurrentField := 'EventDesc';
               ItemChanged := True;
               UpdateAnimals(Sender);
            end;
      end;
end;

procedure TfEventsByGroup.DrugBatchNo2CloseUp(Sender: TObject;
  Accept: Boolean);
begin
   // ItemChanged always true,
   ItemChanged := TRUE;
   if ( Sender is TDBLookupComboboxEh ) and (( Sender as TDBLookupComboboxEh ).DataField = 'DrugPurchID') then
      if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
         GetDrugExpiryDate;
end;

procedure TfEventsByGroup.dbcbDrugBatchNoPropertiesCloseUp(
  Sender: TObject);
var
   SelectedItem : Integer;
   AnimalArray : PIntegerArray;
begin
   FDrugPurchID := 0;
   ItemChanged := TRUE;
   if ( Sender is TcxDBComboBox ) and ( (Sender as TcxDBComboBox).DataBinding.DataField = 'DrugBatchNo' ) and
      ( Length((Sender as TcxDBComboBox).Text) > 0 ) then 
      begin
         FDrugBatchQty_EmptyCheck := False;
         if ( Integer((Sender as TcxDBComboBox).ItemObject) > 0 ) then
            FDrugPurchID := Integer((Sender as TcxDBComboBox).ItemObject);
         SelectedItem := Integer((Sender as TcxDBComboBox).ItemObject);
         if ( SelectedItem > 0 ) then
            AnimalArray := TfmDrugPurchTagDetails.GetTagNoDescArray(SelectedItem);

         //   05/09/13 [V5.2 R1.0] /MK Additional Feature - Check if quantity remaining of selected batch no is zero.
         if ( WinData.DrugBatchQtyRemaining(Integer(dbcbDrugBatchNo.ItemObject),dbcbDrugBatchNo.Text) <= 0 ) then
            begin
               MessageDlg(Format('This batch, %s , has a zero quantity.',[dbcbDrugBatchNo.EditValue]),mtInformation,[mbOK],0);
               FDrugBatchQty_EmptyCheck := True;
            end;

         if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
            GetDrugExpiryDate;
      end;
end;

procedure TfEventsByGroup.TempMovementSetup;
begin
   //   16/01/15 [V5.4 R0.6] /MK Bug Fix - Assign LookupSource in code as component property lost by Delphi crash
   dblMoveTo.LookupSource := Windata.dsMovedTo;

   iMovedTo := TIntegerField.Create(TempAnimals);
   with iMovedTo do
      begin
         FieldName := 'MovedTo';
         DataSet := TempAnimals;
      end;

   sMovedTo := TStringField.Create(TempAnimals);
   with sMovedTo do
      begin
         FieldName := 'MovedToName';
         LookUpDataSet := WinData.tMovedTo;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Name';
         KeyFields := 'MovedTo';
         LookUp    := TRUE;
         DataSet   := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'MovedToName';
         Title.Caption := 'Moved To';
         Width := 180;
      end;

   SetDataSource(tsTempMovement, dsTempEvents)
end;

procedure TfEventsByGroup.dblMoveToCloseUp(Sender: TObject);
begin
   ItemChanged := TRUE;
   if WinData.EventType = TMovement then
      begin
         if ( dblMoveTo.Value = '0' ) then
            uMovedBy.ShowTheForm(TRUE);
      end;
end;

procedure TfEventsByGroup.FormCreate(Sender: TObject);
var
   i : Integer;
begin
   lSelectedGridFilter.Visible := False;
   lGridFilter.Visible := False;
   LCartFilterReminder.Visible := False;

   with MultiDrugGridDBTableView do
      begin
         with GetColumnByFieldName('GroupListing') do
            begin
               Caption := 'Add to Batch Group';
               Width := 170;
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.GroupManager.GroupListDatasource;
                     KeyFieldNames := 'ID';
                     ListFieldNames := 'Code;Description';
                  end;
            end;

         //   18/08/14 [V5.3 R4.5] /MK Bug Fix - Lookup source for DrugID in MultiDrug was blanked out after Delphi crash.
         with GetColumnByFieldName('DrugUsed') do
            begin
               HeaderAlignmentHorz := taLeftJustify;
               HeaderAlignmentVert := vaCenter;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := HerdLookup.dsDrugList;
                     KeyFieldNames := 'ID';
                     ListFieldNames := 'Name;DrugCode';
                     DropDownWidth := 220;
                     DropDownListStyle := lsFixedList;
                     for i := 0 to ListColumns.Count-1 do
                        begin
                           if ListColumns[i].FieldName = 'DrugCode' then
                              ListColumns[i].Caption := 'Code';
                        end;
                  end;
            end;

         //   25/02/14 [V5.2 R8.5] /MK Bug Fix - HealthSetup/FormCreate - Code to set the LookupComboBox Lookup Source as this value was being blanked
         //                                      out after a Delphi crash.
         with GetColumnByFieldName('ReportID') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := HerdLookup.dsLookupHealthReportDesc;
                  end;
            end;

         with GetColumnByFieldName('HealthCode') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := HerdLookup.dsICBFHealthCodes;
                  end;
            end;

         with GetColumnByFieldName('FarmCode') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := HerdLookup.dsNonICBFHealthCodes;
                  end;
            end;

         with GetColumnByFieldName('Disease') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := HerdLookup.dsHerdVaccineType;
                  end;
            end;

         with GetColumnByFieldName('VetPresc') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := HerdLookup.LookupPrescribedBy;
                  end;
            end;

         with GetColumnByFieldName('AdminBy') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := HerdLookup.LookupAdminBy;
                  end;
            end;

         with GetColumnByFieldName('ApplicMethod') do
            begin
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     ListSource := WinData.dsApplicMethod;
                  end;
            end;

      end;

   lRateOfApplic.Caption := '';
   FDataLoading := False;
   FBreedingDataHelper := TBreedingDataHelper.Create();
   //   28/10/20 [V5.9 R6.5] /MK Bug Fix - Breeding Data Temp Tables were being created but not being filled. This was separated from BreedingData.Create.
   FBreedingDataHelper.CreateTempBreedingDataTables;
   //dbcbDrugBatchNo.RepositoryItem := HerdLookup.erDrugBatchNoLookup;
   WinData.qDrugBatchNo.Active := False;
   dbcbDrugBatchNo.Enabled := False;
   btnLookupBatchQtys.Visible := False;
   actSelectBatchNo.Visible := False;
   dbcbDrugBatchNo.Width := 198;
   Application.ProcessMessages;
   Update;

   btnLookupBatchQtys.Action := actSelectBatchNo;
   MultiDrugGridDBTableViewDrugBatchNo.RepositoryItem := nil;

   if ( not(HerdLookup.qPlannedBull.Active) ) then
      HerdLookup.qPlannedBull.Active := True;
   if ( not(HerdLookup.qServiceBullUsed.Active) ) then
      HerdLookup.qServiceBullUsed.Active := True;
   HerdLookup.dsDrugList.DataSet := HerdLookup.qDrugList;
   if ( not(HerdLookup.qDrugList.Active) ) then
      HerdLookup.qDrugList.Active := True;

   dsPlannedBull.DataSet := nil;

   if not(WinData.mdMilkTemperamentScores.Active) then
      WinData.mdMilkTemperamentScores.Active := True;

   FManualBatchNoQuery := TQuery.Create(nil);
   with FManualBatchNoQuery do
      begin
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Distinct(H.DrugBatchNo)');
         SQL.Add('FROM Health H');
         SQL.Add('WHERE H.DrugBatchNo NOT IN (SELECT MP.BatchNo FROM MediPur MP)');
         SQL.Add('AND H.DrugBatchNo IS NOT Null');
         SQL.Add('AND H.DrugUsed = :DrugID');
      end;

   FBatchNoPickListDrugID := 0;

   FPregDiagRepeatCount := 0;

   FPregDiagEventCount := 0;

   FManualHealthComment := False;

   lJohnesResult.Visible := False;
   dbluJohnesResult.Visible := False;

   if ( not(HerdLookup.qICBFSexedSemenType.Active) ) then
      HerdLookup.qICBFSexedSemenType.Active := True;

   pStockBull.Visible := False;
   gbSexedSemen.Visible := False;

   FWeighInfoQuery := TQuery.Create(nil);
   FWeighInfoQuery.DatabaseName := AliasName;

   FWeighingEvents := TTable.Create(nil);
   FWeighingEvents.DatabaseName := AliasName;

   CreateTempWeighInfoDataSets;

   FPurchaseEvents := TTable.Create(nil);
   FPurchaseEvents.DatabaseName := AliasName;

   FPurchInfoQuery := TQuery.Create(nil);
   FPurchInfoQuery.DatabaseName := AliasName;

   CreateTempPurchInfoDataSets;

   dbcbAreaTreatedFL.Checked := False;
   dbcbAreaTreatedFR.Checked := False;
   dbcbAreaTreatedBL.Checked := False;
   dbcbAreaTreatedBR.Checked := False;

   FDupGrpsPerAnimals := TQuery.Create(nil);
   FDupGrpsPerAnimals.DatabaseName := AliasName;
   pDupGrpsPerAnimals.Visible := False;
end;

procedure TfEventsByGroup.GetGroupInfo;
var
   HealthEvent : Boolean;
   GroupType : TGroupType;
begin
   if WinData.EventType = THealth then
      GroupType := gtBatch // allow change of batch group
   else
      GroupType := gtFeed;// allow change of feed group
   lAddToGroup.Caption := 'Add to '+GroupTypesArray[GroupType]+' Group';
   MultiDrugGridDBTableViewGroupListing.Caption := lAddToGroup.Caption;

   //   05/12/12 [V5.1 R3.4] /MK Change - Changed GroupListing LookupField to just Description instead of ID;Description
   GroupListing.DisplayEmpty := Format('<Add to %s Group>', [ GroupTypesArray[GroupType] ] );
   WinData.GroupManager.QueryGroupList([GroupType]);
   GroupListing.LookupSource := WinData.GroupManager.GroupListDatasource;
   GroupListing.LookupDisplayIndex := 0;
   GroupListing.EmptyValue := '';
end;

procedure TfEventsByGroup.ConditionScoreSetup;
begin
   cmboConditionScoreAssociatedEvent.LookupSource := HerdLookup.dsmdConditionScoreAssociatedEvents;
   HerdLookup.mdConditionScoreAssociatedEvents.Active := True;

   fConditionScore := TFloatField.Create(TempAnimals);
   with fConditionScore do
      begin
         FieldName := 'Score';
         DataSet := TempAnimals;
         OnChange := TempAnimalsValueChange;
      end;

   iAssociatedEventType := TIntegerField.Create(TempAnimals);
   with iAssociatedEventType do
      begin
         FieldName := 'AssociatedEventType';
         DataSet := TempAnimals;
      end;

   sAssociatedEventType := TStringField.Create(TempAnimals);
   with sAssociatedEventType do
      begin
         FieldName := 'sAssociatedEventType';
         LookUpDataSet := HerdLookup.mdConditionScoreAssociatedEvents;
         LookUpKeyFields := 'EventType';
         LookUpResultField := 'Description';
         KeyFields := 'AssociatedEventType';
         LookUp    := TRUE;
         DataSet   := TempAnimals;
      end;

   //   10/01/12 [V5.0 R3.3] /MK Change - Only Show Tesco HerdScoring Fields If Entering CondtionScore Event in English Herd.
   fMobility := TFloatField.Create(TempAnimals);
   with fMobility do
      begin
         FieldName := 'Mobility';
         DataSet := TempAnimals;
      end;

   fCleanliness := TFloatField.Create(TempAnimals);
   with fCleanliness do
      begin
         FieldName := 'Cleanliness';
         DataSet := TempAnimals;
      end;

   bAbrasions := TBooleanField.Create(TempAnimals);
   with bAbrasions do
      begin
         FieldName := 'Abrasions';
         DataSet := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'Score';
         Title.Caption := 'Score';
         Width := 100;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'sAssociatedEventType';
         Title.Caption := 'Associated Event Type';
         Width := 180;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'Mobility';
         Title.Caption := 'Mobility';
         Width := 100;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'Cleanliness';
         Title.Caption := 'Cleanliness';
         Width := 100;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'Abrasions';
         Title.Caption := 'Abrasions';
         Width := 80;
      end;

   SetDataSource(tsConditionScore, dsTempEvents)
end;

procedure TfEventsByGroup.FormDestroy(Sender: TObject);
begin
   HideHintStyleController();

   HerdLookup.mdConditionScoreAssociatedEvents.Active := False;
   if HerdLookup.QueryFertilityCheckStatus.Active then
      HerdLookup.QueryFertilityCheckStatus.Active := False;
   if HerdLookup.QueryFertilityCheckAction.Active then
      HerdLookup.QueryFertilityCheckAction.Active := False;
   if HerdLookup.QueryFertPrograms.Active then
      HerdLookup.QueryFertPrograms.Active := False;
   if mdMultiDrug.Active then
      mdMultiDrug.Active := False;
   HerdLookup.qDrugList.Active := False;
   HerdLookup.LookupHealthReportDesc.Active := False;
   HerdLookup.LookupJohnesResult.Active := False;

   if ( HerdLookup.qPlannedBull.Active ) then
      HerdLookup.qPlannedBull.Active := False;
   if ( HerdLookup.qServiceBullUsed.Active ) then
      HerdLookup.qServiceBullUsed.Active := False;
   if ( WinData.mdMilkTemperamentScores.Active ) then
      WinData.mdMilkTemperamentScores.Active := False;
   if ( HerdLookup.qHerdVaccineType.Active ) then
      HerdLookup.qHerdVaccineType.Active := False;

   if ( FManualBatchNoQuery.Active ) then
      FManualBatchNoQuery.Active := False;
   FreeAndNil(FManualBatchNoQuery);

   if ( HerdLookup.QueryAdminBy.Active ) then
      HerdLookup.QueryAdminBy.Active := False;
   if ( HerdLookup.QueryPrescribedBy.Active ) then
      HerdLookup.QueryPrescribedBy.Active := False;

   if ( HerdLookup.qStockBulls.Active ) then
      HerdLookup.qStockBulls.Close;

   if ( HerdLookup.qLookupTreatmentUsed.Active ) then
      HerdLookup.qLookupTreatmentUsed.Close;

   if ( FBreedingDataHelper <> nil ) then
      FreeAndNil(FBreedingDataHelper);

   if ( FWeighInfoQuery <> nil ) then
      begin
         FWeighInfoQuery.Close;
         FreeAndNil(FWeighInfoQuery);
      end;

   if ( FWeighingEvents <> nil ) then
      begin
         FWeighingEvents.Close;
         FWeighingEvents.DeleteTable;
         FreeAndNil(FWeighingEvents);
      end;

   if ( FPurchaseEvents <> nil ) then
      begin
         FPurchaseEvents.Close;
         FPurchaseEvents.DeleteTable;
         FreeAndNil(FPurchaseEvents);
      end;

   if ( FPurchInfoQuery <> nil ) then
      begin
         FPurchInfoQuery.Close;
         FreeAndNil(FPurchInfoQuery);
      end;

   if ( FDupGrpsPerAnimals <> nil ) then
      FreeAndNil(FDupGrpsPerAnimals);
end;

procedure TfEventsByGroup.TempAnimalsFieldOnChange(Sender: TField);

   {procedure SetSelected;
   begin
      if not TempAnimals.FieldByName('Selected').AsBoolean then
         TempAnimals.FieldByName('Selected').AsBoolean := True;
   end;}
var
   ActionDescription : String;
begin
{   if FDataLoading then exit;

   if WinData.EventType = TService then
      begin
         if (Sender.FieldName = 'PServiceBull') then
            begin
               if TempAnimals.FieldByName('ServiceBull').AsInteger > 0 then
                  SetSelected;
            end
         else if (Sender.FieldName = 'ServiceTypeName')  then
            begin
               if TempAnimals.FieldByName('ServiceType').AsInteger > 0 then
                  SetSelected;
            end
      end;  }
   case WinData.EventType of
      TFertilityCheck :
      begin
         if ( UPPERCASE(Sender.FieldName) = 'ACTION' ) then
            begin
               if (TempAnimals.FieldByName('FertProgram').AsInteger <= 0) then
                   begin
                      ActionDescription := HerdLookup.GetFertilityCheckActionDescription(TempAnimals.FieldByName('Action').AsInteger);
                      if UPPERCASE(ActionDescription) = 'START PROGRAM' then
                        // only populate FertProgram if non was previously selected and ACTION is 'Start Program'.
                        TempAnimals.FieldByName('FertProgram').AsInteger := TempEvents.FieldByName('FertProgram').AsInteger;
                   end;
            end;
      end;
   end;
end;

procedure TfEventsByGroup.CheckForInBreeding;
var
   BullID : Integer;
begin
   with TempAnimals do
      begin
         First;
         while not eof do
            begin
               if FieldByName('Selected').AsBoolean then
                  begin
                     BullID := 0;
                     if ( WinData.EventType = TService ) then
                        BullID := FieldByName('ServiceBull').AsInteger
                     else if ( WinData.EventType in [TBulling, TPlannedBull] ) then
                        BullID := FieldByName('PlannedBull').AsInteger;
                     if (BullID>0) then
                        WinData.CheckInBreeding(FieldByName('NatIDNum').AsString,BullID,FieldByName('DamId').AsInteger,FieldByName('SireId').AsInteger);
                  end;
               Next;
            end;
      end;
end;

procedure TfEventsByGroup.ResetGridCols;
var
   i : Integer;
begin
   AnimalGrid.FrozenCols := 1;

   // Selected
   AnimalGrid.Columns[0].Visible := True;
   AnimalGrid.Columns[0].Width := 21;
   // AnimalNo
   AnimalGrid.Columns[1].Visible := True;
   AnimalGrid.Columns[1].Width := 70;
   // NatIdNum
   AnimalGrid.Columns[2].Visible := True;
   AnimalGrid.Columns[2].Width := 145;
   // Sex
   AnimalGrid.Columns[3].Visible := True;
   AnimalGrid.Columns[3].Width := 65;
   // DateOfBirth
   AnimalGrid.Columns[4].Visible := True;
   AnimalGrid.Columns[4].Width := 82;
   // LactNo
   AnimalGrid.Columns[5].Visible := True;
   AnimalGrid.Columns[5].Width := 50;
   // EventDate
   AnimalGrid.Columns[6].Visible := True;
   AnimalGrid.Columns[6].Width := 82;
   // EventComment
   AnimalGrid.Columns[7].Visible := True;
   AnimalGrid.Columns[7].Width := 150;

   for i := AnimalGrid.Columns.Count-1 downto 8 do
      begin
         AnimalGrid.Columns[i].Free;
      end;
end;

procedure TfEventsByGroup.LoadBreedingData(ADataset : TDataset; ACalvingData, AServiceData : Boolean);
begin
   if TempAnimals.Locate('AnimalID', ADataset.FieldByName('AnimalID').AsInteger, []) then
      begin
         TempAnimals.Edit;
         try
            if AServiceData then
               UpdateTempAnimalsServiceInfo(ADataset);

            if ( (TempAnimals.FieldByName('LactNo').AsInteger > 0) and (ACalvingData) ) then
               begin
                  if TempAnimals.FindField(fn_LastCalveDate) <> nil then
                     begin
                        TempAnimals.FieldByName(fn_LastCalveDate).AsDateTime := WinData.EventDataHelper.GetLastEventDate(TempAnimals.FieldByName('AnimalID').AsInteger,
                                                                                                                         TempAnimals.FieldByName('LactNo').AsInteger,cCalvingEvent);
                        if TempAnimals.FieldByName(fn_LastCalveDate).AsDateTime <= 0 then
                           TempAnimals.FieldByName(fn_LastCalveDate).Clear;
                     end;
               end;

            if ( WinData.EventType in [TPregDiag, TService] ) then
               UpdateTempAnimalPregDiagInfo(ADataset);

            TempAnimals.Post;
         except
            on e : exception do
               begin
                  TempAnimals.Cancel;
                  ShowMessage(e.message)
               end;
         end;
      end;
end;

procedure TfEventsByGroup.DrugBatchNoPropertiesInitPopup(Sender: TObject);
begin
   if ( WinData.qDrugBatchNo.Active ) then
      begin
         if ( not WinData.qDrugBatchNo.Filtered) then
            begin
               SysUtils.Abort;
            end
         else if (WinData.qDrugBatchNo.RecordCount<=0) then
            MessageDlg('No batch number''s have been found for selected drug.',mtInformation,[mbOK],0);
      end
   else
      SysUtils.Abort;
end;

procedure TfEventsByGroup.DrugBatchNoPropertiesCloseUp(Sender: TObject);
begin
   // ItemChanged always true,
   ItemChanged := TRUE;
   if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
      GetDrugExpiryDate;
end;

procedure TfEventsByGroup.TempEventsPregnancyStatusOnChange(
  Sender: TField);
begin
   if ( UPPERCASE(Sender.AsString) = 'YES' ) then
      begin
         if ( TempAnimals.FindField(fn_DaysSinceService) <> nil ) then
            begin
               if ( TempAnimals.FieldByName(fn_LastServiceDate).AsDateTime > 0 ) then
                  begin
                     TempAnimals.FieldByName(fn_DaysSinceService).AsInteger := Trunc(TempAnimals.FieldByName(fn_EventDate).AsDateTime - TempAnimals.FieldByName(fn_LastServiceDate).AsDateTime);
                     if ( TempAnimals.FieldByName(fn_DaysSinceService).AsInteger < 0 ) then
                        TempAnimals.FieldByName(fn_DaysSinceService).Clear;
                  end
               else
                  TempAnimals.FieldByName(fn_DaysSinceService).Clear;
            end;

         if ( TempAnimals.FieldByName('DaysInCalf').AsInteger > 0 ) then
            TempAnimals.FieldByName('EventDesc').AsString := 'Pregnant/'+IntToStr(TempAnimals.FieldByName('DaysInCalf').AsInteger)
         else if ( TempAnimals.FieldByName('DaysInCalf').AsInteger = 0 ) then
            TempAnimals.FieldByName('EventDesc').AsString := 'Pregnant';
      end
   else if ( UPPERCASE(Sender.AsString) = 'NO' ) then
      TempAnimals.FieldByName('EventDesc').AsString := 'Not Pregnant';
   {else
      TempAnimals.FieldByName(fn_DaysSinceService).Clear;}
end;


procedure TfEventsByGroup.teAnimalNoPropertiesChange(Sender: TObject);
begin
   // Start to Search for this Animals No
   if Length(teAnimalNo.Text) > 0 then
      begin
         teNatIDNum.Text := '';
         if NOT AnimalGrid.DataSource.DataSet.Locate('AnimalNo',teAnimalNo.Text,[loPartialKey] ) then
            begin
               MessageDLG('Cannot find Animal No ' + teAnimalNo.Text,mtInformation,[mbOK],0 );
            end
      end;

end;

procedure TfEventsByGroup.teNatIDNumPropertiesChange(Sender: TObject);
begin
   FPartNatIdSearchFound := False;
   // Start to Search for this Animals National ID
   {
   if Length(teNatIDNum.Text) > 0 then
      begin
         teAnimalNo.Text := '';
         if NOT AnimalGrid.DataSource.DataSet.Locate('NatIdNum',teNatIDNum.Text,[loPartialKey] ) then
            begin
               ShowMessage('Cannot find Animal National ID ' + teNatIDNum.Text);
            end
      end;
   }
end;

procedure TfEventsByGroup.btnSelectAllClick(Sender: TObject);
begin
   UpdateAnimals(Sender);

   if MessageDlg( 'Are you sure you want to select all animals?',mtConfirmation,[mbYes,mbNo],0) = idNo then Exit;

   // Run Query to Clear the Tick Boxes
   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('UPDATE ' + TempAnimals.TableName);
            SQL.Add('SET Selected = TRUE');
            ExecSQL;
         end;

      AllAnimalsSelected := TRUE;
      AnimalGrid.DataSource.DataSet.Refresh;
      AnimalGrid.DataSource.DataSet.First;
      CountSelectedRecords;
   except
      ShowMessage('Cannot make the selection');
   end;
end;

procedure TfEventsByGroup.FertilityCheckSetup;
begin
   HerdLookup.QueryFertilityCheckStatus.Active := True;
   HerdLookup.QueryFertilityCheckAction.Active := True;
   HerdLookup.QueryFertPrograms.Active := True;
   cmboFertilityCheckStatus.RepositoryItem := HerdLookup.erFertilityCheckStatus;
   cmboFertilityCheckAction.RepositoryItem := HerdLookup.erFertilityCheckAction;

   lFertProgram.Visible := False;
   cmboFertilityCheckFertilityProgram.Visible := False;
   cmboFertilityCheckFertilityProgram.Properties.ListSource := HerdLookup.dsQueryFertPrograms;
   cmboFertilityCheckFertilityProgram.Properties.KeyFieldNames := 'ID';
   cmboFertilityCheckFertilityProgram.Properties.ListFieldNames := 'Description';

   iFertilityCheck_Status := TIntegerField.Create(TempAnimals);
   with iFertilityCheck_Status do
      begin
         FieldName := 'Status';
         DataSet := TempAnimals;
      end;

   sFertilityCheck_StatusDesc := TStringField.Create(TempAnimals);
   with sFertilityCheck_StatusDesc do
      begin
         FieldName := 'StatusDesc';
         LookUpDataSet := HerdLookup.QueryFertilityCheckStatus;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'Status';

         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   iFertilityCheck_Action := TIntegerField.Create(TempAnimals);
   with iFertilityCheck_Action do
      begin
         FieldName := 'Action';
         DataSet := TempAnimals;
         OnChange := TempAnimalsFieldOnChange;
      end;

   sFertilityCheck_ActionDesc := TStringField.Create(TempAnimals);
   with sFertilityCheck_ActionDesc do
      begin
         FieldName := 'ActionDesc';
         LookUpDataSet := HerdLookup.QueryFertilityCheckAction;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'Action';

         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   iFertilityCheck_FertProgram := TIntegerField.Create(TempAnimals);
   with iFertilityCheck_FertProgram do
      begin
         FieldName := 'FertProgram';
         DataSet := TempAnimals;
      end;

   sFertilityCheck_FertProgramDesc := TStringField.Create(TempAnimals);
   with sFertilityCheck_FertProgramDesc do
      begin
         FieldName := 'FertProgramDesc';
         LookUpDataSet := HerdLookup.QueryFertPrograms;
         LookUpKeyFields := 'ID';
         LookUpResultField := 'Description';
         KeyFields := 'FertProgram';

         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'StatusDesc';
         Title.Caption := 'Status';
         Width := 220;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'ActionDesc';
         Title.Caption := 'Action To Take';
         Width := 120;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'FertProgramDesc';
         Title.Caption := 'Fertility Program';
         Width := 220;
      end;

   SetDataSource(tsFertilityCheck,dsTempEvents)
end;

procedure TfEventsByGroup.MilkTemperamentSetup;
begin
   dbcbMilkTempScore.Properties.ListSource := WinData.dsMilkTemperamentScores;

   iMilkTempScore := TIntegerField.Create(TempAnimals);
   with iMilkTempScore do
      begin
         FieldName := 'Score';
         DataSet := TempAnimals;
      end;

   iMilkTempScoreDesc := TStringField.Create(TempAnimals);
   with iMilkTempScoreDesc do
      begin
         FieldName := 'ScoreDesc';
         LookUpDataSet := WinData.mdMilkTemperamentScores;
         LookUpKeyFields := 'Score';
         LookUpResultField := 'Description';
         KeyFields := 'Score';

         LookUp := TRUE;
         DataSet := TempAnimals;
      end;

   with AnimalGrid.Columns.Add do
      begin
         FieldName := 'ScoreDesc';
         Title.Caption := 'Score';
         Width := 100;
      end;

   SetDataSource(tsMilkTemperament,dsTempEvents)
end;

procedure TfEventsByGroup.TempAnimalsBeforePost(DataSet: TDataSet);
begin
   {case WinData.EventType of
      TFertilityCheck :
      begin
         if ((TempAnimals.FieldByName('FertProgram').AsInteger <= 0) and
             (HerdLookup.FertilityCheckActionIsFertProgram(TempAnimals.FieldByName('Action').AsInteger))) then

            // only populate FertProgram if non was previously selected and ACTION is 'Start Program'.
            TempAnimals.FieldByName('FertProgram').AsInteger := TempEvents.FieldByName('FertProgram').AsInteger;
      end;
   end;}

end;

procedure TfEventsByGroup.btnSetupFertilityProgramsClick(Sender: TObject);
begin
   TfmSetupFertPrograms.Execute;
   HerdLookup.QueryFertPrograms.Active := False;
   HerdLookup.QueryFertPrograms.Active := True;
end;

procedure TfEventsByGroup.UpdateReportPanel;
begin
   btnReport1.Visible := False;
   btnReport2.Visible := False;
   btnReport3.Visible := False;
   btnReport4.Visible := False;
   btnReport1.Caption := '';
   btnReport2.Caption := '';
   btnReport3.Caption := '';
   btnReport4.Caption := '';

   case WinData.EventType of
      TBulling,
      TService : begin
                    btnReport1.Caption := 'Breeding Chart';
                    btnReport2.Caption := 'Breeding Statistics';
                 end;
      TDryOff : btnReport1.Caption := 'Vet. Register';
      THealth : begin
                   btnReport1.Caption := 'Vet. Register';
                   btnReport2.Caption := 'Veterinary Due To List';
                   btnReport3.Caption := 'Herd Dosing Review';
                   btnReport4.Caption := 'Somatic Cell Counts';
                end;
      THerdVaccination : begin
                           btnReport1.Caption := 'Vaccination Due To List';
                           btnReport2.Caption := 'Herd Vaccination Report';
                         end;
      TPregDiag : btnReport1.Caption  := 'Breeding Chart';
      TWeight  : btnReport1.Caption  := 'Weighing Report';
      TFertilityCheck: begin
                          btnReport1.Caption := 'Fertility Check Report';
                          btnReport2.Caption := 'Fertility Treatment Chart';
                       end;
      TConditionScore: begin
                          btnReport1.Caption := 'Cond. Score - By Cow';
                          btnReport2.Caption := 'Cond. Score - Herd Summary';
                       end;
      THerdTest : begin
                     btnReport1.Caption := 'Restricted Animals';
                     btnReport2.Caption := 'Disease Status';
                  end;
   end;
   btnReport1.Visible := btnReport1.Caption <> '';
   btnReport2.Visible := btnReport2.Caption <> '';
   btnReport3.Visible := btnReport3.Caption <> '';
   btnReport4.Visible := btnReport4.Caption <> '';

   pReports.Visible := (WinData.EventType in ([TBulling,TService,TPregDiag,TConditionScore,TBulling,
                                              TDryOff,THealth,TWeight,TFertilityCheck,THerdVaccination,THerdTest]));
   if pReports.Visible then
      GradVertical(Image2.Canvas, Image2.ClientRect, $00FEEAD8, clWhite);
end;

procedure TfEventsByGroup.btnReport1Click(Sender: TObject);
begin
   case WinData.EventType of
      TService,
      TPregDiag,
      TBulling : uHeatServiceFilt.ShowTheForm;
      TDryOff ,
      THealth  :
        begin
           try
              HealthFilterU.ReportType := rtMediTreat;
              Application.CreateForm(THeatlthFilter, HeatlthFilter);
              HeatlthFilter.ShowModal;
           finally
              HeatlthFilter.Free;
           end;
        end;
      TWeight  : uWeighingFilt.ShowTheForm(wrtWeightGain);

      //   02/11/11 [V5.0 R1.7] /MK Bug Fix - Set Querys.Active For Status & Action To True After Report Is Shown.
      TFertilityCheck:  begin
                           TfmFertilityCheckReport.ShowReport;
                           if not(HerdLookup.QueryFertilityCheckStatus.Active) then
                              HerdLookup.QueryFertilityCheckStatus.Active := True;
                           if not(HerdLookup.QueryFertilityCheckAction.Active) then
                              HerdLookup.QueryFertilityCheckAction.Active := True;
                        end;

      TConditionScore : TfmConditionScoreReport.ShowReport;
      THerdVaccination : TfmFertilityTreatmentsReport.ShowReportScreen(retVaccination);
      THerdTest : WinData.CreateAndShowForm(TfRestrictAnimals);
   end;
end;

procedure TfEventsByGroup.btnReport2Click(Sender: TObject);
begin
   case WinData.EventType of
      TBulling,
      TService : TfmHerdStatistics.ShowForm(dvBreedingStats);
      TFertilityCheck : TfmFertTreatmentsReview.Execute;
      TConditionScore : TfmHerdStatistics.ShowForm(dvCSHerdSummary);
      THealth :  TfmFertilityTreatmentsReport.ShowReportScreen(retHealth);
      THerdTest : uTBTestDtRep.ShowTheForm;
      THerdVaccination : TfmVaccineDueOn.ShowForm(WinData.EventType);
   end;
end;

procedure TfEventsByGroup.btnReport3Click(Sender: TObject);
begin
   case WinData.EventType of
      THealth : TfmVaccineDueOn.ShowForm(WinData.EventType);
   end;
end;

procedure TfEventsByGroup.btnReport4Click(Sender: TObject);
begin
   case WinData.EventType of
      THealth : SCCAnalysis.ShowForm;
   end;
end;

procedure TfEventsByGroup.CheckValidFertProgramSelected;
var
   ActionDescription : string;
begin
   with TempAnimals do
      begin
         First;
         while not eof do
            begin
               if FieldByName('Selected').AsBoolean then
                  begin
                     ActionDescription := HerdLookup.GetFertilityCheckActionDescription(TempAnimals.FieldByName('Action').AsInteger);
                     if ((UPPERCASE(ActionDescription) = 'START PROGRAM') and (TempAnimals.FieldByName('FertProgram').AsInteger <= 0)) then
                        begin
                           MessageDlg(Format('Animal "%s" has been selected to "Start Program" but no'+ #13#10 +
                                             'Fertility Program has been entered.' + cCRLFx2 +
                                             'If you choose the Action "Start Program" you should select the'+ #13#10 +
                                             'appropriate Program in the "Fertility Program" column on the grid.',
                                             [TempAnimals.FieldByName('NatIdNum').AsString]),mtWarning,[mbOK],0);
                           Abort;
                        end;
                  end;
               Next;
            end;
      end;
end;

procedure TfEventsByGroup.mdMultiDrugBeforeInsert(DataSet: TDataSet);
begin
   if ( mdMultiDrug.RecordCount >= 4 ) then
      begin
         MessageDlg('The maximum number of drugs (4) per treatment has already been reached.',mtInformation,[mbOK],0);
         Abort;
      end;
end;

procedure TfEventsByGroup.btnRemoveMultiDrugClick(Sender: TObject);
begin
   if ( mdMultiDrug.RecordCount >= 1 ) then
      begin
         if MessageDlg('Are you sure you want to delete the selected drug record?',mtWarning,[mbYes,mbNo],0) = idYes then
            mdMultiDrug.Delete;
      end;
end;

procedure TfEventsByGroup.btnAddMultiDrugClick(Sender: TObject);
begin
   if not mdMultiDrug.Active then
      mdMultiDrug.Active := True;

   mdMultiDrug.Append;

   mdMultiDrugNoDays.AsFloat := 1;
   mdMultiDrugNoTimes.AsFloat := 1;
   if WinData.EventType = THerdVaccination then
      mdMultiDrugReportInDays.AsInteger := 1
   else
      begin
         if ( CountryOfReg = England ) then
            mdMultiDrugReportInDays.AsInteger := 7
         else
            mdMultiDrugReportInDays.AsInteger := 0;
      end;

   mdMultiDrug.Post;

   MultiDrugGridDBTableView.Controller.FocusedRowIndex := mdMultiDrug.RecNo -1;
   MultiDrugGridDBTableView.Controller.FocusedItemIndex := 0;

{
   if MultiDrugGridDBTableView.Controller.FocusedItem <> nil then
   MultiDrugGridDBTableView.Controller.FocusedItem. Focused := True;
//      TcxLookupComboBox(MultiDrugGridDBTableView.Controller.FocusedItem.).DroppedDown := True;

}
end;

procedure TfEventsByGroup.mdMultiDrugDrugPurchIDChange(Sender: TField);
begin
   if ( mdMultiDrugDrugPurchID.AsInteger > 0 ) and ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
      begin
         try
           if WinData.dsDrugBatchNo.DataSet.Locate('ID', mdMultiDrugDrugPurchID.AsInteger, []) then
              begin
                 if WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime > 0 then
                    begin
                       mdMultiDrugBatchNoExpiryDate.AsDateTime := WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime;
                       if WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime <= Date then
                          begin
                             MessageDlg('The drug batch number you have selected has expired.',mtWarning,[mbOk],0);
                          end;
                    end;
              end;
         except
            MessageDlg('Error: Unable to locate Drug Expiry Date',mtWarning,[mbOk],0);
         end;
      end;
end;

procedure TfEventsByGroup.mdMultiDrugDrugBatchNoChange(Sender: TField);
var
   DrugPurchId : Integer;
begin
   if ( mdMultiDrugDrugUsed.AsInteger > 0 ) and ( Length(Sender.AsString) > 0 ) then
      begin
         {
         //   03/06/16 [V5.5 R5.8] /MK Bug Fix - No need to do this check for expiry date as setting mdMultiDrugDrugPurchID does this check.
         if WinData.dsDrugBatchNo.DataSet.Locate('DrugID;BatchNo',VarArrayOf([mdMultiDrugDrugUsed.AsInteger,Sender.AsString]),[]) then
            begin
               if WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime > 0 then
                  begin
                     mdMultiDrugBatchNoExpiryDate.AsDateTime := WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime;
                     if WinData.dsDrugBatchNo.DataSet.FieldByName('ExpiryDate').AsDateTime <= Date then
                        begin
                           MessageDlg('The drug batch number you have selected has expired.',mtWarning,[mbOk],0);
                        end;
                  end;
            end;
         }

         DrugPurchId := GetDrugPurchIdByBatchNumber(Sender.Text);
         if ( DrugPurchId <= 0 ) then
            Sender.DataSet.FieldByName('DrugPurchID').Value := Null;

         if ( DrugPurchID > 0 ) then
            Sender.DataSet.FieldByName('DrugPurchID').Value := DrugPurchID;

         if ( WinData.DrugBatchQtyRemaining(DrugPurchId,Sender.Text) <= 0 ) then
            begin
               if ( not(FDrugBatchQty_EmptyCheck) ) then
                  if ( MessageDlg(Format('This batch, %s , has a zero quantity.',[Sender.DataSet.FieldByName('DrugBatchNo').AsString]),
                                         mtInformation,[mbOK],0) = mrOK ) then
                  FDrugBatchQty_EmptyCheck := True;
            end;
      end;
end;

procedure TfEventsByGroup.mdMultiDrugDrugUsedChange(Sender: TField);
var
  DrugWithdrawalDates : TDrugWithdrawalDates;
begin
   HerdLookup.erDrugBatchNoLookup.Properties.OnInitPopup := MultiDrugGridDBTableViewBatchNoPropertiesInitPopup;
   mdMultiDrugDrugPurchID.Clear;
   mdMultiDrugRateOfApplic.Clear;
   mdMultiDrugBatchNoExpiryDate.Clear;
   mdMultiDrugMeatWithdrawal.Clear;
   mdMultiDrugMilkWithdrawal.Clear;
   mdMultiDrugOrganicMeatWithdrawal.Clear;
   mdMultiDrugOrganicMilkWithdrawal.Clear;

   if ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
      begin
         LookupBatchNo;
         DrugWithdrawalDates := HerdLookup.CalculateDrugWithDrawalDates(mdMultiDrugDrugUsed.AsInteger,
                                                                        TempEvents.FieldByName('EventDate').AsDateTime,
                                                                        mdMultiDrugNoDays.AsInteger);
         if ( DrugWithdrawalDates.MeatWithdrawalDate > 0 ) then
            mdMultiDrugMeatWithdrawal.AsDateTime := DrugWithdrawalDates.MeatWithdrawalDate;
         if ( DrugWithdrawalDates.MilkWithdrawalDate > 0 ) then
            mdMultiDrugMilkWithdrawal.AsDateTime := DrugWithdrawalDates.MilkWithdrawalDate;
         if ( DrugWithdrawalDates.OrganicMeatWithdrawalDate > 0 ) then
            mdMultiDrugOrganicMeatWithdrawal.AsDateTime := DrugWithdrawalDates.OrganicMeatWithdrawalDate;
         if ( DrugWithdrawalDates.OrganicMilkWithdrawalDate > 0 ) then
            mdMultiDrugOrganicMilkWithdrawal.AsDateTime := DrugWithdrawalDates.OrganicMilkWithdrawalDate;
      end;
end;

procedure TfEventsByGroup.MultiDrugGridDBTableViewBatchNoPropertiesInitPopup(Sender: TObject);
var
   LGrid: TcxCustomLookupDBGrid;
   colListType : TcxLookupDBGridColumn;
begin
   inherited;
   if (Sender is TcxDBLookupComboBox) or (Sender is TcxLookupComboBox) then
      begin
         LGrid := TcxLookupComboBox(Sender).Properties.Grid;
         colListType := LGrid.Columns.ColumnByFieldName('DrugUsed');
         if ( colListType <> nil ) then
            with LGrid.DataController.Filter do
               begin
                  Root.AddItem(colListType, foEqual, mdMultiDrugDrugUsed.AsInteger, '');
                  Active := True;
               end;
      end;
end;

procedure TfEventsByGroup.WriteHealthEvent(AEventType: TEventType);
var
   CurrentID,
   iDrugPurchID,
   iCalvingLactNo : Integer;
begin
  with WriteEvents do
     begin
        Append;
        CurrentID                             := FieldByName('ID').AsInteger;
        FieldByName('AnimalID').AsInteger     := GenQuery.FieldByName('AnimalID').AsInteger;
        FieldByName(fn_EventDate).AsDateTime  := GenQuery.FieldByName(fn_EventDate).AsDateTime;

        //   28/01/16 [V5.5 R2.4] /MK Change - Check if event date is before last calving date and save to last calving lactation-1
        iCalvingLactNo := WinData.EventDataHelper.GetLastCalvingLactationNum(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                             GenQuery.FieldByName('LactNo').AsInteger,
                                                                             GenQuery.FieldByName(fn_EventDate).AsDateTime);
        if ( iCalvingLactNo <> GenQuery.FieldByName('LactNo').AsInteger ) then
           begin
              if ( WinData.EventType = TDryOff ) then
                 begin
                    if ( WinData.EventDataHelper.GetLastEventDate(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                  iCalvingLactNo,
                                                                  CDryOffEvent) = 0 ) then
                       FieldByName('AnimalLactNo').AsInteger := iCalvingLactNo;
                 end
              else
                 FieldByName('AnimalLactNo').AsInteger := iCalvingLactNo;
           end
        else
           FieldByName('AnimalLactNo').AsInteger := GenQuery.FieldByName('LactNo').AsInteger;

        if ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
           begin
              if ( WinData.EventType = THealth ) then
                 FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(mdMultiDrugDrugUsed.AsInteger,
                                                                                             mdMultiDrugRateOfApplic.AsFloat,WinData.EventType);
              if ( WinData.EventType = THerdVaccination ) and ( mdMultiDrugDisease.AsString <> '' ) then
                 FieldByName('EventDesc').AsString := mdMultiDrugDisease.AsString + ' Vaccination';
              if ( FManualHealthComment ) then
                 FieldByName('EventDesc').AsString  := GenQuery.FieldByName('EventDesc').AsString;
           end
        else
           FieldByName('EventDesc').AsString := GenQuery.FieldByName('EventDesc').AsString;

        FieldByName('HerdID').AsInteger       := GenQuery.FieldByName('HerdID').AsInteger;
        FieldByName('ICBFNotified').AsBoolean := FALSE; // added 28/2/2000 KR
        FieldByName('ICBFAction').AsString    := 'A'; // added 20/11/00 KR

        { SP 12/12/2003 For Moorepark }
        FieldByName('MPNotified').AsBoolean := FALSE;
        FieldByName('MPAction').AsString    := 'A';

        FieldByName('IsSynchronized').AsBoolean := False;

        FieldByName('EventSource').AsInteger := sINTERNAL_BLOCKEVENT;

        //   10/04/13 [V5.1 R6.2] /MK Change - If MultiDrug and EventType is DryOff then create Health Event for second drug.
        if ( AEventType = TDryOff ) and ( mdMultiDrug.CurRec = 0 ) then
           begin
              FieldByName('EventType').AsInteger := CDryOffEvent;
              FieldByName('EventDesc').AsString := 'Dry Off';
           end
        else if ( AEventType = TDryOff ) and ( mdMultiDrug.CurRec >= 1 ) then
           begin
              FieldByName('EventType').AsInteger := CHealthEvent;
              if ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
                 FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(mdMultiDrugDrugUsed.AsInteger,
                                                                                             mdMultiDrugRateOfApplic.AsFloat,THealth);
           end;

        with WriteOther do
           begin
              // Do the Other Tables Info
              Append;
              if ( mdMultiDrug.RecordCount > 0 ) then
                 begin
                    FieldByName('EventID').AsInteger := CurrentID;
                    FieldByName('DrugUsed').AsInteger := mdMultiDrugDrugUsed.AsInteger;
                    FieldByName('DrugBatchNo').AsString := mdMultiDrugDrugBatchNo.AsString;

                    iDrugPurchID := WinData.GetDrugPurchID(mdMultiDrugDrugUsed.AsInteger,mdMultiDrugDrugBatchNo.AsString,
                                                           TempEvents.FieldByName('EventDate').AsDateTime);
                    if ( iDrugPurchID > 0 ) then
                       FieldByName('DrugPurchID').AsInteger := iDrugPurchID
                    else
                       FieldByName('DrugPurchID').AsInteger := mdMultiDrugDrugPurchID.AsInteger;

                    FieldByName('HealthCode').AsInteger := mdMultiDrugHealthCode.AsInteger;
                    FieldByName('RateApplic').AsFloat := mdMultiDrugRateOfApplic.AsFloat;
                    FieldByName('NoDays').AsFloat := mdMultiDrugNoDays.AsFloat;
                    FieldByName('NoTimes').AsFloat := mdMultiDrugNoTimes.AsFloat;
                    FieldByName('AdminBy').AsInteger := mdMultiDrugAdminBy.AsInteger;
                    FieldByName('ApplicMethod').AsInteger := mdMultiDrugApplicMethod.AsInteger;
                    FieldByName('VetPresc').AsInteger := mdMultiDrugVetPresc.AsInteger;
                    FieldByName('FarmCode').AsInteger := mdMultiDrugFarmCode.AsInteger;

                    //   03/06/16 [V5.5 R5.8] /MK Bug Fix - WinData.HealthDoseUnitUsed/WinData.HealthPurchUnitUsed were never set by block health event.
                    FieldByName('DoseUnitUsed').AsFloat := HerdLookup.MedicineUnitUsed(GenQuery.FieldByName('DrugUsed').AsInteger,utDose);
                    FieldByName('PurchUnitUsed').AsFloat := HerdLookup.MedicineUnitUsed(GenQuery.FieldByName('DrugUsed').AsInteger,utPurchase);

                    if ( WinData.EventType = THerdVaccination ) then
                       begin
                          if ( Length(mdMultiDrugDisease.AsString) > 0 ) then
                             begin
                                if ( CountryOfReg = Ireland ) then
                                   begin
                                      if HerdLookup.qHerdVaccineType.Locate('Description',mdMultiDrugDisease.AsString,[]) then
                                         FieldByName('HealthCode').AsInteger := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
                                   end
                                else
                                   begin
                                      if HerdLookup.qHerdVaccineType.Locate('Description',mdMultiDrugDisease.AsString,[]) then
                                         FieldByName('FarmCode').AsInteger := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
                                   end
                             end
                          else
                          FieldByName('ReportInDays').AsInteger := mdMultiDrugReportInDays.AsInteger * 7
                       end
                    else
                       FieldByName('ReportInDays').AsInteger := mdMultiDrugReportInDays.AsInteger;

                    FieldByName('ReportID').AsInteger := mdMultiDrugReportID.AsInteger;
                 end
              else
                 begin

                 end;
              Post;
           end;
        Post;
     end;
end;

procedure TfEventsByGroup.TempAnimalsValueChange(Sender: TField);
var
   DrugWithdrawalDates : TDrugWithdrawalDates;
   i : Integer;
begin
   if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
      if ( TempAnimals.FieldByName('DrugUsed').AsInteger > 0 ) then
         begin
            if ( UPPERCASE(Sender.FieldName) = 'DRUGUSED') or ( UPPERCASE(Sender.FieldName) = 'NODAYS') or ( UpperCase(Sender.FieldName) = 'EVENTDATE' ) then
               begin
                  TempAnimals.FieldByName('MeatWDRLDate').Clear;
                  TempAnimals.FieldByName('MilkWDRLDate').Clear;
                  TempAnimals.FieldByName('OrganicMeatWDRLDate').Clear;
                  TempAnimals.FieldByName('OrganicMilkWDRLDate').Clear;

                  if (WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness]) then
                     begin
                        // MK 26/08/13
                        DrugWithdrawalDates := HerdLookup.CalculateDrugWithDrawalDates(TempAnimals.FieldByName('DrugUsed').AsInteger,
                                                                                       TempAnimals.FieldByName('EventDate').AsDateTime,
                                                                                       TempAnimals.FieldByName('NoDays').AsInteger);
                        if ( DrugWithdrawalDates.MeatWithdrawalDate > 0 ) then
                           TempAnimals.FieldByName('MeatWDRLDate').AsDateTime := DrugWithdrawalDates.MeatWithdrawalDate;
                        if ( DrugWithdrawalDates.MilkWithdrawalDate > 0 ) then
                           TempAnimals.FieldByName('MilkWDRLDate').AsDateTime := DrugWithdrawalDates.MilkWithdrawalDate;
                        if ( DrugWithdrawalDates.OrganicMeatWithdrawalDate > 0 ) then
                           TempAnimals.FieldByName('OrganicMeatWDRLDate').AsDateTime := DrugWithdrawalDates.OrganicMeatWithdrawalDate;
                        if ( DrugWithdrawalDates.OrganicMilkWithdrawalDate > 0 ) then
                           TempAnimals.FieldByName('OrganicMilkWDRLDate').AsDateTime := DrugWithdrawalDates.OrganicMilkWithdrawalDate;
                     end;
               end;

            if ( UPPERCASE(Sender.FieldName) = 'DRUGUSED') and ( Sender.AsInteger > 0 ) then
               begin
                  //   05/12/12 [V5.1 R3.4] /MK Change - Default Health Event EventDesc to Health - DrugCode.
                  if ( WinData.EventType = THealth ) then
                     begin
                        if ( not(FManualHealthComment) ) then
                           TempAnimals.FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(Sender.AsInteger,
                                                                                                                   TempAnimals.FieldByName('RateOfApplic').AsFloat,
                                                                                                                   WinData.EventType);
                     end;

                  // Added Variable to store last DrugID that was used to generate BatchNo pick list.
                  if ( not(Sender.AsInteger = FBatchNoPickListDrugID) ) then
                     begin
                        FBatchNoPickListDrugID := Sender.AsInteger;
                        for i := 0 to AnimalGrid.Columns.Count-1 do
                           begin
                              if ( AnimalGrid.Columns[i].Field.FieldName = 'DrugBatchNo' ) then
                                 begin
                                    WinData.qDrugBatchNo.Filter := 'DrugID='+IntToStr(Sender.AsInteger);
                                    WinData.qDrugBatchNo.Filtered := True;

                                    WinData.qDrugBatchNo.First;
                                    AnimalGrid.Columns[i].PickList.Clear;

                                    // Now go through BatchNo's in Medicine Purchases that are active and add them to the list.
                                    while not WinData.qDrugBatchNo.Eof do
                                       begin
                                          //AnimalGrid.Columns[i].PickList.Add(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString);
                                          //   30/04/15 [V5.4 R5.3] /MK Bug Fix - Check if BatchNo/DrugPurchID Index already added and don't add again.
                                          if (AnimalGrid.Columns[i].PickList.IndexOf(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString) = -1) then
                                             AnimalGrid.Columns[i].PickList.AddObject(WinData.qDrugBatchNo.FieldByName('BatchNo').AsString,
                                                                                      Pointer(WinData.qDrugBatchNo.FieldByName('ID').AsInteger));
                                          WinData.qDrugBatchNo.Next;
                                       end;

                                    //   03/08/12 [V5.0 R8.4] /MK Bug Fix - SQL was adding all BatchNo's from Health.db instead of only those that were entered manually.
                                    // Now query the Health database for BatchNo's that were entered manually and add them to the list.
                                    with FManualBatchNoQuery do
                                       begin
                                          Params[0].AsInteger := Sender.AsInteger;
                                          Open;
                                          try
                                             First;
                                             while not Eof do
                                                begin
                                                   AnimalGrid.Columns[i].PickList.Add(Fields[0].AsString);
                                                   Next;
                                                end;
                                          finally
                                             Close;
                                          end;
                                       end;

                                    // Add blank line to the list for manual entry.
                                    AnimalGrid.Columns[i].PickList.Add('');
                                 end;
                           end
                     end;
               end;

            if ( UPPERCASE(Sender.FieldName) = 'RateApplic') and ( Sender.AsFloat > 0 ) then
               if ( WinData.EventType = THealth ) then
                  if ( not(FManualHealthComment) ) then
                     TempAnimals.FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(Sender.AsInteger,
                                                                                                             TempAnimals.FieldByName('RateOfApplic').AsFloat,
                                                                                                             WinData.EventType);
         end;

   if ( WinData.EventType = TWeight ) and ( UPPERCASE(Sender.FieldName) = 'EVENTDATE') and ( FWeighingEvents.RecordCount > 0 ) then
      GetTempAnimalsWeighingInfo;
end;

procedure TfEventsByGroup.SetupMultiOrSingleDrugEntry;
var
   i : Integer;
   IsOrganicHerd : Boolean;
begin
   pMultiDrug.Visible := bShowMultiDrugs;

   pSingleDrugCombos.Visible := ( not(bShowMultiDrugs) );

   pSingleDrugEntry.Visible := ( not(bShowMultiDrugs) );

   MultiDrugGridDBTableViewICBFCode.Visible := not(WinData.EventType = THerdVaccination) and (CountryOfReg = Ireland);
   MultiDrugGridDBTableViewFarmCode.Visible := not(WinData.EventType = THerdVaccination);
   MultiDrugGridDBTableViewDisease.Visible := WinData.EventType = THerdVaccination;
   MultiDrugGridDBTableViewApplicMethod.Visible := not(WinData.EventType = THerdVaccination);
   MultiDrugGridDBTableViewGroupListing.Visible := not(WinData.EventType in [THerdVaccination, TLameness]);
   MultiDrugGridDBTableViewOrganicMeatWithdrawal.Visible := IsOrganicHerd;
   MultiDrugGridDBTableViewOrganicMilkWithdrawal.Visible := IsOrganicHerd;

   pVaccDisease.Visible := ( WinData.EventType = THerdVaccination ) and ( not(bShowMultiDrugs) );
   pAreaTreated.Visible := ( WinData.EventType in [TMastitis, TLameness] ) and ( not(bShowMultiDrugs) );
   //   07/05/15 [V5.4 R5.4] /MK Bug Fix - pVaccDisease - Set to show on top as it was sent to back in previous version.
   if ( pVaccDisease.Visible ) then
      pVaccDisease.BringToFront;
   if ( pAreaTreated.Visible ) then
      pAreaTreated.BringToFront;

   WinData.qDrugBatchNo.Filter := '';
   WinData.qDrugBatchNo.Filtered := False;
   WinData.qDrugBatchNo.Active := False;
   WinData.qDrugBatchNo.Active := True;

   HerdLookup.HerdOwnerData.HerdID := WinData.UserDefaultHerdID;
   IsOrganicHerd := HerdLookup.HerdOwnerData.OrganicHerd;

   for i := 0 to AnimalGrid.Columns.Count-1 do
      begin
         if (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'DRUGNAME') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'BATCHNO') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'DRUGBATCHNO') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'MEATWDRLDATE') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'MILKWDRLDATE') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'RATEOFAPPLIC') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'DISEASE') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'REPORTIDDESC') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'REPORTINDAYS') or
            //   20/02/18 [V5.7 R8.2] /MK Change - Remove other irrelevant fields when MultiDrug grid is enabled.
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'HEALTHCODENAME') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'FARMCODENAME') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'APPLICMETHODNAME') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'ADMINBYNAME') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'SPRESCRIBEDBY') then
           AnimalGrid.Columns[i].Visible := not bShowMultiDrugs;

         if (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'TOTALAPPLICRATE') or
            (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'LASTWEIGHT') then
           AnimalGrid.Columns[i].Visible := ( not(bShowMultiDrugs) ) and ( FUseApplicRateByKg );

           { Check Organic Herd }
           if IsOrganicHerd then
              begin
                 if (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'ORGANICMEATWDRLDATE') or
                    (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'ORGANICMILKWDRLDATE') then
                    AnimalGrid.Columns[i].Visible := bShowMultiDrugs;
              end
           else
              begin
                 if (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'ORGANICMEATWDRLDATE') or
                    (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'ORGANICMILKWDRLDATE') then
                   AnimalGrid.Columns[i].Visible := False;
              end;
      end;

   pDaysToRemind.Visible := ( not(bShowMultiDrugs) );

   mdMultiDrug.Active := bShowMultiDrugs;
end;

procedure TfEventsByGroup.TempEventsValueChange(Sender: TField);
var
   DrugWithdrawalDates : TDrugWithdrawalDates;
   AnimalBookmark : TBookmark;
begin
   if ( WinData.EventType in [THealth,TDryOff,THerdVaccination,TMastitis,TLameness] ) then
      if ( UPPERCASE(Sender.FieldName) = 'EVENTDATE' ) then
         if ( bShowMultiDrugs ) then
            begin
               // Recalc the drug withdrawal dates
               with mdMultiDrug do
                  begin
                     First;
                     while ( not(Eof) ) do
                         begin
                            Edit;
                            mdMultiDrugMeatWithdrawal.Clear;
                            mdMultiDrugMilkWithdrawal.Clear;
                            mdMultiDrugOrganicMeatWithdrawal.Clear;
                            mdMultiDrugOrganicMilkWithdrawal.Clear;
                            if ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
                                begin
                                   DrugWithdrawalDates := HerdLookup.CalculateDrugWithDrawalDates(mdMultiDrugDrugUsed.AsInteger,
                                                                                                  TempEvents.FieldByName('EventDate').AsDateTime,
                                                                                                  mdMultiDrugNoDays.AsInteger);
                                   if ( DrugWithdrawalDates.MeatWithdrawalDate > 0 ) then
                                      mdMultiDrugMeatWithdrawal.AsDateTime := DrugWithdrawalDates.MeatWithdrawalDate;
                                   if ( DrugWithdrawalDates.MilkWithdrawalDate > 0 ) then
                                      mdMultiDrugMilkWithdrawal.AsDateTime := DrugWithdrawalDates.MilkWithdrawalDate;
                                   if ( DrugWithdrawalDates.OrganicMeatWithdrawalDate > 0 ) then
                                      mdMultiDrugOrganicMeatWithdrawal.AsDateTime := DrugWithdrawalDates.OrganicMeatWithdrawalDate;
                                   if ( DrugWithdrawalDates.OrganicMilkWithdrawalDate > 0 ) then
                                      mdMultiDrugOrganicMilkWithdrawal.AsDateTime := DrugWithdrawalDates.OrganicMilkWithdrawalDate;
                                end;
                            Post;
                            Next;
                         end;
                  end;
            end
         else
            //   18/08/15 [V5.4 R7.4] /MK Bug Fix - For Health, DryOff & HerdVaccination events, if the TempEvents.EventDate was changed the
            //                                      withdrawal dates were not changed.
            if ( TempEvents.FieldByName('DrugUsed').AsInteger > 0 ) then
               begin
                  AnimalBookmark := TempAnimals.GetBookmark;
                  TempAnimals.Close;
                  DrugWithdrawalDates := HerdLookup.CalculateDrugWithDrawalDates(TempEvents.FieldByName('DrugUsed').AsInteger,
                                                                                 TempEvents.FieldByName('EventDate').AsDateTime,
                                                                                 TempEvents.FieldByName('NoDays').AsInteger);
                  with TQuery.Create(nil) do
                     try
                        try
                           DatabaseName := AliasName;
                           SQL.Clear;
                           SQL.Add('UPDATE '+TempAnimals.TableName+'');
                           if ( DrugWithdrawalDates.MeatWithdrawalDate > 0 ) then
                              SQL.Add('SET MeatWDRLDate = "'+FormatDateTime(cUSDateStyle,DrugWithdrawalDates.MeatWithdrawalDate)+'",')
                           else
                              SQL.Add('SET MeatWDRLDate = NULL,');
                           if ( DrugWithdrawalDates.MilkWithdrawalDate > 0 ) then
                              SQL.Add('    MilkWDRLDate = "'+FormatDateTime(cUSDateStyle,DrugWithdrawalDates.MilkWithdrawalDate)+'",')
                           else
                              SQL.Add('    MilkWDRLDate = NULL,');
                           if ( DrugWithdrawalDates.OrganicMeatWithdrawalDate > 0 ) then
                              SQL.Add('    OrganicMeatWDRLDate = "'+FormatDateTime(cUSDateStyle,DrugWithdrawalDates.OrganicMeatWithdrawalDate)+'",')
                           else
                              SQL.Add('    OrganicMeatWDRLDate = NULL,');
                           if ( DrugWithdrawalDates.OrganicMilkWithdrawalDate > 0 ) then
                              SQL.Add('    OrganicMilkWDRLDate = "'+FormatDateTime(cUSDateStyle,DrugWithdrawalDates.OrganicMilkWithdrawalDate)+'"')
                           else
                              SQL.Add('    OrganicMilkWDRLDate = NULL');
                           SQL.Add('WHERE DrugUsed = :DrugUsed');
                           Params[0].AsInteger := TempEvents.FieldByName('DrugUsed').AsInteger;
                           ExecSQL;
                        except
                           on e : Exception do
                              ShowMessage(e.Message);
                        end;
                     finally
                        Free;
                     end;
                  TempAnimals.Open;
                  if TempAnimals.BookmarkValid(AnimalBookmark) then
                     begin
                        TempAnimals.GotoBookmark(AnimalBookmark);
                        TempAnimals.FreeBookmark(AnimalBookmark);
                     end;
               end;
end;

procedure TfEventsByGroup.dbcServBullExit(Sender: TObject);
begin
   UpdateAnimals(sender);
   if ( FServiceTypeAutoSet ) then
       begin
          FServiceTypeAutoSet := False;
          ItemChanged := True;
          CurrentField := 'ServiceType';
          UpdateAnimals(ServiceTypes);
       end;
end;

procedure TfEventsByGroup.InseminatorCloseUp(Sender: TObject);
begin
   if Inseminator.Value = '0' Then
      begin
         GenLookUpType := TObservedBy;
         uGenLookSetUp.ShowTheForm(TRUE);
      end;
end;

procedure TfEventsByGroup.ShowMultiTreatmentOptions;
var
   i : Integer;
begin
   btnShowMultiTreat.Font.Style := [];
   if ( bShowMultiTreatmentOptions ) or ( not(bShowMultiDrugs) ) then
      begin
         lNoDaysBy.Visible := bShowMultiTreatmentOptions;
         cxdbseNoDays.Visible := bShowMultiTreatmentOptions;
         lNoDays.Visible := bShowMultiTreatmentOptions;

         lPerDayBy.Visible := bShowMultiTreatmentOptions;
         cxdbseNoTimes.Visible := bShowMultiTreatmentOptions;
         lNoPerDay.Visible := bShowMultiTreatmentOptions;

         if ( bShowMultiTreatmentOptions ) then
            btnShowMultiTreat.Font.Style := [fsBold];
      end;

   if ( not(bShowMultiDrugs) ) then
      begin
         for i := 0 to AnimalGrid.Columns.Count-1 do
            if AnimalGrid.Columns[i].Field.FieldName = 'NoDays' then
               AnimalGrid.Columns[i].Visible := bShowMultiTreatmentOptions;

         for i := 0 to AnimalGrid.Columns.Count-1 do
            if AnimalGrid.Columns[i].Field.FieldName = 'NoTimes' then
               AnimalGrid.Columns[i].Visible := bShowMultiTreatmentOptions;
      end;

   if bShowMultiDrugs then
      begin
         lNoDaysBy.Visible := False;
         cxdbseNoDays.Visible := False;
         lNoDays.Visible := False;
         MultiDrugGridDBTableViewNoTimes.Visible := bShowMultiTreatmentOptions;
         MultiDrugGridDBTableViewNoDays.Visible := bShowMultiTreatmentOptions;
      end;

   Application.ProcessMessages;
   Update;
end;

procedure TfEventsByGroup.btnShowMultiTreatClick(Sender: TObject);
begin
   if bShowMultiTreatmentOptions then
      begin
         bShowMultiTreatmentOptions := False;
         ShowMultiTreatmentOptions;
      end
   else
      begin
         bShowMultiTreatmentOptions := True;
         ShowMultiTreatmentOptions;
      end;
end;

procedure TfEventsByGroup.btnMedicineSetupClick(Sender: TObject);
var
   iDrugUsed : Integer;
begin
   iDrugUsed := 0;

   HerdLookup.qDrugList.Close;
   if ( bShowMultiDrugs ) and ( not(VarIsNull(mdMultiDrugDrugUsed.Value)) ) then
      iDrugUsed := mdMultiDrugDrugUsed.Value
   else if ( DrugUsed.EditValue > 0 ) and ( DrugUsed.EditValue <> Null ) then
      iDrugUsed := DrugUsed.EditValue;

   if ( iDrugUsed > 0 ) then
      uMedicineSetUp.ShowTheForm(iDrugUsed)
   else
      uMedicineSetUp.ShowTheForm(0);

   HerdLookup.qDrugList.Open;

   if ( iDrugUsed > 0 ) then
      begin
         if ( bShowMultiDrugs ) and ( not(VarIsNull(mdMultiDrugDrugUsed.Value)) ) then
            mdMultiDrugDrugUsed.Value := iDrugUsed
         else
            begin
               DrugUsed.EditValue := iDrugUsed;
               ChangeEventDesc_ApplicLabelByDrug;
            end;
      end;
end;

procedure TfEventsByGroup.btnMultiDrugClick(Sender: TObject);
begin
   SetupMultiDrugGrid(mtbtMultiDrug);
   btnVetLinkDrugs.Enabled := ( not(pMultiDrug.Visible) );
end;

procedure TfEventsByGroup.btnBlockDeletionClick(Sender: TObject);
begin
   if ( btnBlockDeletion.Caption = 'Block Deletion' ) then
      uEventFilter.ShowTheForm(True);
end;

procedure TfEventsByGroup.TempEventsPregnancyNoCalvesOnChange(
  Sender: TField);
var
   i : Integer;
begin
   if ( Sender.AsInteger = 1 ) then
      begin
         dbcbCalfType.RepositoryItem := HerdLookup.erSingleCalfTypeCombo;
         for i := 0 to AnimalGrid.Columns.Count-1 do
            begin
               if ( AnimalGrid.Columns[i].Field.FieldName = 'CalfType' ) then
                  begin
                     AnimalGrid.Columns[i].PickList.Clear;
                     AnimalGrid.Columns[i].PickList.Add('M');
                     AnimalGrid.Columns[i].PickList.Add('F');
                  end;
            end
      end
   else if ( Sender.AsInteger > 1 ) then
      begin
         dbcbCalfType.RepositoryItem := HerdLookup.erMultipleCalfTypeCombo;
         for i := 0 to AnimalGrid.Columns.Count-1 do
            begin
               if ( AnimalGrid.Columns[i].Field.FieldName = 'CalfType' ) then
                  begin
                     AnimalGrid.Columns[i].PickList.Clear;
                     AnimalGrid.Columns[i].PickList.Add('M/M');
                     AnimalGrid.Columns[i].PickList.Add('F/F');
                     AnimalGrid.Columns[i].PickList.Add('M/F');
                  end
            end;
      end;
end;

procedure TfEventsByGroup.LoadLastYearsMilkTempScore;
var
   dFromDate, dToDate : TDateTime;
   qMilkTempEvents : TQuery;

   procedure UpdateScore (AAnimalID, AScore : Integer);
   begin
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE '+TempAnimals.TableName+' ');
            SQL.Add('SET Score = :AScore');
            SQL.Add('WHERE AnimalID = :AnimalID');
            Params[0].AsInteger := AScore;
            Params[1].AsInteger := AAnimalID;
            try
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
   //   09/01/13 [V5.1 R3.7] /MK Change - No need for date restriction as screen already only shows animals that don't have
   //                                     a Milk Temperament event in their current lactation.
   //dFromDate := IncYear(TempEvents.FieldByName('EventDate').AsDateTime,-1);
   //dToDate := TempEvents.FieldByName('EventDate').AsDateTime;

   qMilkTempEvents := TQuery.Create(nil);
   with qMilkTempEvents do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MT.Score, E.AnimalID');
         SQL.Add('FROM '+WinData.MilkTemperament.TableName+' MT ');
         SQL.Add('LEFT JOIN Events E ON (E.ID = MT.EventID)');
         //SQL.Add('WHERE (E.EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,dFromDate)+'" AND "'+FormatDateTime(cUSDateStyle,dToDate)+'")');
         SQL.Add('WHERE E.EventType = :MilkTemperament');
         Params[0].AsInteger := CMilkTemperament;
         Open;
         try
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( not(Eof) ) do
                     begin
                        if TempAnimals.Locate('AnimalID',FieldByName('AnimalID').AsInteger,[]) then
                           UpdateScore(FieldByName('AnimalID').AsInteger,FieldByName('Score').AsInteger);
                        Next;
                     end;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.TempEventsHerdTestDiseaseOnChange(
  Sender: TField);
begin
   if ( UpperCase(Sender.AsString) = 'TB' ) then
      FHerdTestType := htTB
   else if ( UpperCase(Sender.AsString) = 'BRUCELLOSIS' ) then
      FHerdTestType := htBrucellosis
   else if ( UpperCase(Sender.AsString) = 'BVD' ) then
      FHerdTestType := htBVD
   else if ( UpperCase(Sender.AsString) = 'JOHNES' ) then
      FHerdTestType := htJohnes;
end;

procedure TfEventsByGroup.TempEventsVaccinationDiseaseOnChange(
  Sender: TField);
begin
   if ( WinData.EventType = THerdVaccination ) and ( not(FManualHealthComment) ) then
      begin
         if ( not(TempAnimals.State = dsEdit) ) then
            TempAnimals.Edit;
         TempAnimals.FieldByName('EventDesc').AsString := Sender.AsString + ' Vaccination';
         if ( CountryOfReg = Ireland ) then
            begin
               if HerdLookup.qHerdVaccineType.Locate('Description',Sender.AsString,[]) then
                  TempAnimals.FieldByName('HealthCode').AsInteger := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
            end
         else
            begin
               if HerdLookup.qHerdVaccineType.Locate('Description',Sender.AsString,[]) then
                  TempAnimals.FieldByName('FarmCode').AsInteger := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
            end
      end;
end;

procedure TfEventsByGroup.dlcbReportIDCloseUp(Sender: TObject);
begin
   if dlcbReportID.Value = '0' then
      begin
         HerdLookup.LookupHealthReportDesc.Active := False;
         GenLookUpType := THealthReportDesc;
         uGenLookSetUp.ShowTheForm(TRUE);
         HerdLookup.LookupHealthReportDesc.Active := True;
      end;
end;

procedure TfEventsByGroup.LoadPlannedBullsAsServiceBull;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT A.ID AnimalID, A.LactNo,');
         SQL.Add('       B.PlannedBull');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Events E On (A.ID = E.AnimalID)');
         SQL.Add('LEFT JOIN Bullings B On (E.ID = B.EventID)');
         SQL.Add('WHERE (E.EventType = '+IntToStr(CPlannedBull)+') ');
         SQL.Add('AND   (A.LactNo = E.AnimalLactNo)');
         Open;
         try
            First;
            while not(Eof) do
               try
                  if TempAnimals.Locate('AnimalID',FieldByName('AnimalID').AsInteger,[]) then
                     begin
                        TempAnimals.Edit;
                        TempAnimals.FieldByName('ServiceBull').AsInteger := FieldByName('PlannedBull').AsInteger;
                        TempAnimals.Post;
                     end;
                  Next;
               except
                  TempAnimals.Cancel;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.UpdateGrid;
begin
   with TempAnimals do
      begin
         First;
         while ( not(Eof) ) do
            begin
               if ( FieldByName('Selected').AsBoolean ) then
                  try
                     Edit;
                     Post;
                  except
                     Cancel;
                  end;
               Next;
            end;
      end;
end;

procedure TfEventsByGroup.CheckActiveMedicines;
begin
   if ( WinData.ActiveMedicineCount = 0 ) then
      begin
         MessageDlg('No active medicines have been found.'+CCRLF+
                    'Please set up your active medicine(s)',mtInformation,[mbOK],0);
         uMedicineSetUp.ShowTheForm(0);
         HerdLookup.qDrugList.Close;
         HerdLookup.qDrugList.Open;
      end;
end;

procedure TfEventsByGroup.dbcbCalfTypePropertiesCloseUp(Sender: TObject);
begin
   UpdateAnimals(Sender);
end;

procedure TfEventsByGroup.mdMultiDrugReportInDaysChange(Sender: TField);
begin
   MultiDrugGridDBTableViewReportID.Options.Editing := ( mdMultiDrugReportInDays.AsInteger > 0 );
end;

function TfEventsByGroup.IsValidatorSelected ( AValidator : String ) : Boolean;
var
   qValidation : TQuery;
   i : Integer;
begin
   if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness] ) then
      begin
         if ( pMultiDrug.Visible ) then
            begin
               if ( mdMultiDrug.RecordCount > 0 ) then
                  begin
                     if ( WinData.EventType = THerdVaccination ) and ( UpperCase(AValidator) = 'DISEASE' ) then
                        begin
                           mdMultiDrug.First;
                           while ( not(mdMultiDrug.Eof) ) do
                              begin
                                 Result := ( not(mdMultiDrug.FieldByName('Disease').AsString = '') );
                                 if ( not(Result) ) then
                                    Exit;
                                 mdMultiDrug.Next;
                              end;
                        end;

                     //   19/08/14 [V5.3 R4.6] /MK Bug Fix - Check MultiDrug grid for Drugs that have no application rate.
                     if ( UpperCase(AValidator) = 'DRUGUSED' ) then
                        begin
                           mdMultiDrug.First;
                           while ( not(mdMultiDrug.Eof) ) do
                              begin
                                 Result := ( mdMultiDrug.FieldByName('DrugUsed').AsInteger > 0 ) and ( mdMultiDrug.FieldByName('RateOfApplic').AsInteger > 0 );
                                 if ( not(Result) ) then
                                    Exit;
                                 mdMultiDrug.Next;
                              end;
                        end;

                     AValidator := '';
                  end;
            end
      end;

   if ( AValidator = '' ) then Exit;
   qValidation := TQuery.Create(nil);
   with qValidation do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ID)');
         SQL.Add('FROM '+TempAnimals.TableName+' ');
         SQL.Add('WHERE Selected = TRUE');
         if ( UpperCase(AValidator) = 'DISEASE' ) then
            SQL.Add('AND Disease Is Not Null')
         else if ( UpperCase(AValidator) = 'PLANNEDBULL' ) then
            SQL.Add('AND PlannedBull > 0')
         else if ( UpperCase(AValidator) = 'JOHNESRESULT' ) then
            SQL.Add('AND JohnesResult > 0')
         else if ( UpperCase(AValidator) = 'DRUGUSED' ) then
            SQL.Add('AND DrugUsed > 0')
         else if ( UpperCase(AValidator) = 'APPLICRATE' ) then
            SQL.Add('AND RateOfApplic > 0')
         else if ( UpperCase(AValidator) = 'ADMINBY' ) then
            SQL.Add('AND AdminBy > 0')
         else if ( UpperCase(AValidator) = 'VETPRESC' ) then
            SQL.Add('AND VetPresc > 0')
         else if ( UpperCase(AValidator) = 'FARMCODE' ) then
            SQL.Add('AND FarmCode > 0')
         else if ( WinData.EventType = TService ) and ( UpperCase(AValidator) = 'SERVICEBULL' ) then
            SQL.Add('AND ServiceBull > 0')
         else if ( WinData.EventType = TPregDiag ) and ( UpperCase(AValidator) = 'DAYSINCALF' ) then
            begin
               SQL.Add('AND ( ((Upper(PregnancyStatus) = "YES") AND ((DaysInCalf > 0) OR (DaysSinceService > 0))) OR');
               SQL.Add('       (Upper(PregnancyStatus) = "NO") )');
            end;
         Open;
         try
            First;
            Result := ( Fields[0].AsInteger > 0 );
            if ( Result ) and ( WinData.EventType = TPregDiag ) and ( UpperCase(AValidator) = 'DAYSINCALF' ) then
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT COUNT(ID)');
                  SQL.Add('FROM '+TempAnimals.TableName+'');
                  SQL.Add('WHERE Selected = TRUE');
                  SQL.Add('AND ( (Upper(PregnancyStatus) = "YES") AND ((DaysInCalf IS NULL) AND (DaysSinceService IS NULL)) )');
                  Open;
                  Result := ( Fields[0].AsInteger = 0 );
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.dbseDaysToRemindPropertiesChange(
  Sender: TObject);
begin
   ChangedItem(Sender);
   if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness] ) then
      begin
         lReportID.Enabled := ( dbseDaysToRemind.Value > 0 );
         dlcbReportID.Enabled := lReportID.Enabled;
      end;
end;

procedure TfEventsByGroup.tsFertilityCheckShow(Sender: TObject);
begin
   FocusControl(deFertilityCheckEventDate);
end;

procedure TfEventsByGroup.HeatsShow(Sender: TObject);
begin
   dsPlannedBull.DataSet := HerdLookup.qPlannedBull;
   FocusControl(HeatDate);
end;

procedure TfEventsByGroup.ServiceShow(Sender: TObject);
begin
   dsPlannedBull.DataSet := HerdLookup.qServiceBullUsed;
   FocusControl(ServiceDate);
end;

procedure TfEventsByGroup.PregDiagShow(Sender: TObject);
begin
   FocusControl(PDDate);
end;

procedure TfEventsByGroup.HealthShow(Sender: TObject);
begin
   FocusControl(DateHealth);
end;

procedure TfEventsByGroup.tsHerdTestShow(Sender: TObject);
begin
   FocusControl(deTestDate);
end;

procedure TfEventsByGroup.WeighingShow(Sender: TObject);
begin
   FocusControl(WeighingDate);
end;

procedure TfEventsByGroup.tsConditionScoreShow(Sender: TObject);
begin
   FocusControl(DBDateEdit2);
end;

procedure TfEventsByGroup.tsMilkTemperamentShow(Sender: TObject);
begin
   FocusControl(deMilkTempDate);
end;

procedure TfEventsByGroup.tsTempMovementShow(Sender: TObject);
begin
   FocusControl(dbdMoved);
end;

procedure TfEventsByGroup.FocusControl ( AControl : TWinControl );
begin
   try
      AControl.SetFocus;
   except
   end;
end;

procedure TfEventsByGroup.PrescribedByCloseUp(Sender: TObject);
begin
   if ((Sender as TRxDBLookUpCombo).Value = '0') then
      begin
         uMediAdminSetUp.ShowTheForm(TRUE,adPrescribingVet);
         //   13/01/16 [V5.5 R2.2] /MK Bug Fix - Refresh both AdminBy and Prescribed query's just in case user adds both types.
         HerdLookup.QueryAdminBy.Close;
         HerdLookup.QueryAdminBy.Open;

         HerdLookup.QueryPrescribedBy.Close;
         HerdLookup.QueryPrescribedBy.Open;
      end;
end;

procedure TfEventsByGroup.TempEventsPregnancyDaysInCalfOnChange(
  Sender: TField);
begin
   //   31/01/13 [V5.1 R4.0] /MK Additional Feature - Change EventDesc if Pregnant and DaysInCalf > 0.
   if ( TempAnimals.FieldByName('PregnancyStatus').AsBoolean ) then
      begin
         if ( TempAnimals.FieldByName('DaysInCalf').AsInteger > 0 ) then
            TempAnimals.FieldByName('EventDesc').AsString := 'Pregnant/'+IntToStr(TempAnimals.FieldByName('DaysInCalf').AsInteger)
         else if ( TempAnimals.FieldByName('DaysInCalf').AsInteger = 0 ) then
            TempAnimals.FieldByName('EventDesc').AsString := 'Pregnant';
      end
   else if ( not(TempAnimals.FieldByName('PregnancyStatus').AsBoolean) ) then
      TempAnimals.FieldByName('EventDesc').AsString := 'Not Pregnant';
end;

procedure TfEventsByGroup.dbseDaysToRemindPropertiesEditValueChanged(
  Sender: TObject);
begin
   UpdateAnimals(nil);
end;

procedure TfEventsByGroup.RateOfApplicPropertiesChange(Sender: TObject);
begin
   ChangedItem(Sender);

   if ( not(TempEvents.State in [dsEdit, dsInsert]) ) then Exit;
   if ( (DrugUsed.EditValue = 0) or (DrugUsed.EditValue = Null) )then Exit;

   //   13/09/13 [V5.2 R1.2] /MK Bug Fix - Check for null values before CheckDrugBatchQtyRemaining.
   {
   if ( not( (RateOfApplic.Text = '') or (RateOfApplic.Text = '0') ) ) and ( FDrugPurchID > 0 ) and ( DrugUsed.EditValue > 0 ) then
      WinData.CheckDrugBatchQtyRemaining(FDrugPurchID,DrugUsed.EditValue,StrToFloat(RateOfApplic.Text),
                                         dbcbDrugBatchNo.EditValue,RateOfApplic.DataBinding.DataSource.DataSet);
   }

   if ( lRateOfApplic.Caption = 'lRateOfApplic' ) then Exit;
   if ( FManualHealthComment ) then Exit;

   if ( WinData.EventType = THealth ) then
      if ( HerdLookup.qDrugList.Locate('ID',DrugUsed.EditValue,[]) ) then
         //   25/01/19 [V5.8 R6.4] /MK Bug Fix - Only create comment based on Application Rate if Application Rate.Text has a value - backspace caused "invalid variant type conversion error".
         if ( Length(RateOfApplic.Text) > 0 ) then
            TempEvents.FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(DrugUsed.EditValue,StrToFloat(RateOfApplic.Text),WinData.EventType);
end;

// Drug Used LookUP
procedure TfEventsByGroup.DrugUsedPropertiesCloseUp(Sender: TObject);
begin
   {
   if ((Sender as TcxDBLookupComboBox).EditValue = 0 ) or //SP 05/12/00
      ((Sender as TcxDBLookupComboBox).EditValue = Null ) then
      begin
         HerdLookup.qDrugList.Close;
         uMedicineSetUp.ShowTheForm(0);                      //Due to Delphi 3-5 conversion.
         HerdLookup.qDrugList.Open;
      end
   else
      LookupBatchNo;
   }
   ChangeEventDesc_ApplicLabelByDrug;
end;

procedure TfEventsByGroup.TempAnimalsDrugBatchNoOnChange(Sender: TField);
var
   DrugPurchId : Integer;
begin
   if ( Sender.DataSet.FieldByName('Selected').AsBoolean ) then
      begin
         DrugPurchId := GetDrugPurchIdByBatchNumber(Sender.Text);
         if ( DrugPurchId <= 0 ) then
            Sender.DataSet.FieldByName('DrugPurchID').Value := Null;

         if ( DrugPurchID > 0 ) then
            Sender.DataSet.FieldByName('DrugPurchID').Value := DrugPurchID;

         if ( WinData.DrugBatchQtyRemaining(DrugPurchId,Sender.Text) <= 0 ) then
            begin
               //   05/09/13 [V5.2 R1.0] /MK Additional Feature - Check if quantity remaining of selected batch no is zero.
               if ( not(FDrugBatchQty_EmptyCheck) ) then
                  if ( MessageDlg(Format('This batch, %s , has a zero quantity.',[Sender.DataSet.FieldByName('DrugBatchNo').AsString]),
                                         mtInformation,[mbOK],0) = mrOK ) then
                  FDrugBatchQty_EmptyCheck := True;
            end;
      end;
end;

procedure TfEventsByGroup.TempAnimalsRateOfApplicOnChange(Sender: TField);
var
   TotalApplicRate : Double;
begin
   if ( Sender.DataSet.FieldByName('Selected').AsBoolean ) then
      begin
         {
         if ( Sender.DataSet.FieldByName('DrugPurchID').AsInteger > 0 ) and ( Sender.DataSet.FieldByName('DrugUsed').AsInteger > 0 ) and
            ( Sender.AsFloat > 0 ) and ( Sender.DataSet.FieldByName('DrugBatchNo').AsString <> '' ) then
            //   13/09/13 [V5.2 R1.2] /MK Bug Fix - Check for null values before CheckDrugBatchQtyRemaining.
            begin
               TotalApplicRate := GetTotalApplicRate(Sender.DataSet.FieldByName('AnimalID').AsInteger)+Sender.AsFloat;
               WinData.CheckDrugBatchQtyRemaining(Sender.DataSet.FieldByName('DrugPurchID').AsInteger,
                                                  Sender.DataSet.FieldByName('DrugUsed').AsInteger,
                                                  TotalApplicRate,
                                                  Sender.DataSet.FieldByName('DrugBatchNo').AsString,
                                                  Sender.DataSet);
            end;
         }
      end;
   Sender.DataSet.FieldByName('TotalApplicRate').AsFloat := 0;
   if ( Sender.DataSet.FieldByName('RateOfApplic').AsFloat > 0 ) then
      Sender.DataSet.FieldByName('TotalApplicRate').AsFloat := ( Sender.DataSet.FieldByName('RateOfApplic').AsFloat *
                                                                 Sender.DataSet.FieldByName('LastWeight').AsFloat );
end;

function TfEventsByGroup.GetDrugPurchIdByBatchNumber(ABatchNo: string): Integer;
begin
   Result := 0;
   if ( Length(ABatchNo) > 0) then
      begin
         if (WinData.qDrugBatchNo.Filtered) then
            WinData.qDrugBatchNo.Filtered := False;
         if (WinData.qDrugBatchNo.Locate('BatchNo',ABatchNo,[])) then
            Result := WinData.qDrugBatchNo.FieldByName('Id').AsInteger;
      end;
end;

procedure TfEventsByGroup.TempAnimalsSelectedChange(Sender: TField);
begin
   if ( not(Sender.DataSet.FieldByName('Selected').AsBoolean) ) then Exit;
   if ( not(WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness]) ) then Exit;
end;

procedure TfEventsByGroup.TempAnimalsAfterCancel(DataSet: TDataSet);
begin
   if ( not(DataSet.FieldByName('Selected').AsBoolean) ) then
      Dec(FCountSelectedRecords);
end;

procedure TfEventsByGroup.CreateJohnesEvent ( AAnimalID, ALactNo, AHerdID, AResult : Integer;
  AEventDate : TDateTime );
var
   JohnesEvent : TJohnesEventRec;
begin
   if ( AAnimalID = 0 ) then Exit;

   JohnesEvent := TJohnesEventRec.Create('Joev');
   with JohnesEvent do
      try
         try
            Append;
            AnimalID := AAnimalID;
            AnimalLactNo := ALactNo;
            AnimalHerdID := AHerdID;
            EventDate := AEventDate;
            JohnesResult := AResult;
            EventSource := sKINGSWOOD;
            if ( WinData.GenLookUp.Locate('ID',AResult,[]) ) then
               begin
                  if ( UpperCase(WinData.GenLookUpDescription.AsString) = 'HIGH' ) then
                     EventComment := 'High Risk'
                  else if ( UpperCase(WinData.GenLookUpDescription.AsString) = 'MEDIUM' ) then
                     EventComment := 'Medium Risk'
                  else if ( UpperCase(WinData.GenLookUpDescription.AsString) = 'LOW' ) then
                     EventComment := 'Low Risk';
               end;
            Post;
         except
            Cancel;
         end;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.dbcbTestDiseasePropertiesChange(Sender: TObject);
var
   i : Integer;
begin
   ChangedItem(Sender);
   if ( UpperCase(dbcbTestDisease.Text) = 'JOHNES' ) then
      begin
         with AnimalGrid.Columns.Add do
            begin
               FieldName := 'JohnesResultDesc';
               Title.Caption := 'Result';
               Width := AnimalGrid.Font.Size * 20;
            end;
         lJohnesResult.Visible := True;
         dbluJohnesResult.Visible := True;
      end
   else if ( UpperCase(dbcbTestDisease.Text) <> '' ) and
      ( UpperCase(dbcbTestDisease.Text) <> 'JOHNES' ) then
      begin
         for i := 0 to AnimalGrid.Columns.Count-1 do
            begin
               if ( AnimalGrid.Columns[i].FieldName = 'JohnesResultDesc' ) then
                  AnimalGrid.Columns[i].Visible := False;
            end;
         lJohnesResult.Visible := False;
         dbluJohnesResult.Visible := False;
      end;
end;

function TfEventsByGroup.GetTotalApplicRate ( const AAnimalID : Integer = 0 ) : Double;
var
   qTotalApplicRate : TQuery;
begin
   Result := 0;
   qTotalApplicRate := TQuery.Create(nil);
   with qTotalApplicRate do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT SUM(RateOfApplic)');
         SQL.Add('FROM '+TempAnimals.TableName+'');
         SQL.Add('WHERE Selected = True');
         SQL.Add('AND RateOfApplic IS NOT NULL');
         if AAnimalID > 0 then
            SQL.Add('AND NOT AnimalID = '+IntToStr(AAnimalID)+'');
         try
            Open;
            Result := Fields[0].AsFloat;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
         Close;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.TempAnimalsAfterPost(DataSet: TDataSet);
begin
//
end;

procedure TfEventsByGroup.AnimalGridColExit(Sender: TObject);
var
   i : Integer;
begin
   if ( WinData.EventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness] ) then
      for i := 0 to AnimalGrid.Columns.Count-1 do
         begin
            if ( AnimalGrid.Columns[i].FieldName = 'RateOfApplic' ) then
               begin
                  if ( AnimalGrid.DataSource.DataSet.State in [dsInsert,dsEdit] ) then
                     begin
                        AnimalGrid.DataSource.DataSet.Post;
                        AnimalGrid.DataSource.DataSet.Edit;
                     end;
               end;
         end;
end;

procedure TfEventsByGroup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ( HerdLookup.qICBFSexedSemenType.Active ) then
      HerdLookup.qICBFSexedSemenType.Active := False;
end;

//   06/10/14 [V5.3 R7.4] /MK Additional Feature - New procedure used in both MultiDrug and VetLinkDrugs to
//                                                 process the click of either button as both bring up the multi drug screen.
procedure TfEventsByGroup.SetupMultiDrugGrid(AButtonType : TMultiDrugButtonType);
var
   i : Integer;
   bVetLinkDrugsSelected : Boolean;
begin
   if ( FMultiDrugButton <> AButtonType ) then
      begin
         bShowMultiDrugs := False;
         FMultiDrugButton := AButtonType;
      end;

   btnMultiDrug.Font.Style := [];
   btnVetLinkDrugs.Font.Style := [];
   if ( not(bShowMultiDrugs) ) then
      begin
         FMultiDrugButton := AButtonType;
         bShowMultiDrugs := True;
         if ( AButtonType = mtbtVetLink ) then
            btnVetLinkDrugs.Font.Style := [fsBold]
         else
            btnMultiDrug.Font.Style := [fsBold];
      end
   else
      bShowMultiDrugs := False;

   SetupMultiOrSingleDrugEntry;
   ShowMultiTreatmentOptions;

   if ( bShowMultiDrugs ) then
      begin
         for i := 0 to AnimalGrid.Columns.Count-1 do
            if (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'NODAYS') or
               (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'NOTIMES') then
              AnimalGrid.Columns[i].Visible := False
      end
   else
      begin
         for i := 0 to AnimalGrid.Columns.Count-1 do
            if (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'NODAYS') or
               (UPPERCASE(AnimalGrid.Columns[i].FieldName) = 'NOTIMES') then
              AnimalGrid.Columns[i].Visible := bShowMultiTreatmentOptions;
      end;

   btnAddMultiDrug.Visible := ( (AButtonType <> mtbtVetLink) and (bShowMultiDrugs) );

   bVetLinkDrugsSelected := False;
   if ( (AButtonType = mtbtVetLink) and (bShowMultiDrugs) ) then
      begin
         TfmVetLinkSelect.ShowTheForm;
         with GetQuery do
            try
               SQL.Clear;
               SQL.Add('SELECT *');
               SQL.Add('FROM DrugsRegImportDetail');
               SQL.Add('WHERE Selected = TRUE');
               try
                  Open;
                  bVetLinkDrugsSelected := ( RecordCount > 0 );
                  First;
                  while ( not(Eof) ) do
                     begin
                        try
                           mdMultiDrug.Append;
                           mdMultiDrug.FieldByName('DrugUsed').AsInteger := FieldByName('DrugID').AsInteger;
                           mdMultiDrug.FieldByName('RateOfApplic').AsFloat := FieldByName('DrugQuantity').AsFloat;
                           mdMultiDrug.FieldByName('NoTimes').AsFloat := FieldByName('NoTimes').AsFloat;
                           mdMultiDrug.FieldByName('NoTimes').AsFloat := FieldByName('NoDays').AsFloat;
                           mdMultiDrug.FieldByName('DrugBatchNo').AsString := FieldByName('BatchNo').AsString;
                           mdMultiDrug.Post;
                        except
                           on e : Exception do
                              ShowMessage(e.Message);
                        end;
                        Next;
                     end;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Close;
            end;
         if ( not(bVetLinkDrugsSelected) ) then
            begin
               btnVetLinkDrugs.Font.Style := [];
               bShowMultiDrugs := False;
               SetupMultiOrSingleDrugEntry;
               btnMultiDrug.Enabled := True;
            end;
      end;
end;

function TFEventsByGroup.CheckForDrugTreatmentSave( AFieldName : String) : Boolean;
var
   qTempAnimalsDrugQuery : TQuery;
   iTempAnimalsDrugSelectCount : Integer;
begin
   Result := False;
   qTempAnimalsDrugQuery := TQuery.Create(nil);
   with qTempAnimalsDrugQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(AnimalID)');
         SQL.Add('FROM '+TempAnimals.TableName+'');
         SQL.Add('WHERE (DrugUsed > 0)');
         try
            Open;
            iTempAnimalsDrugSelectCount := Fields[0].AsInteger;
            if ( iTempAnimalsDrugSelectCount > 0 ) then
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT Count(AnimalID)');
                  SQL.Add('FROM '+TempAnimals.TableName+'');
                  SQL.Add('WHERE (DrugUsed > 0)');
                  SQL.Add('AND   (('+AFieldName+' = 0) OR ('+AFieldName+' IS NULL))');
                  try
                     Open;
                     Result := ( Fields[0].AsInteger > 0 );
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TfEventsByGroup.CheckSelectedAnimalsSoldBeforeEventDate(var AAbortSave : Boolean);
var
   SaleDate : TDateTime;
   bAbortSave : Boolean;
begin
   bAbortSave := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT TA.AnimalID, TA.EventDate EventDate, E.EventDate SaleDate');
         SQL.Add('FROM '+TempAnimals.TableName+' TA');
         SQL.Add('LEFT JOIN Animals AA ON (TA.AnimalID = AA.ID)');
         SQL.Add('LEFT JOIN Events E ON (AA.ID = E.AnimalID)');
         SQL.Add('WHERE (TA.Selected = TRUE)');
         SQL.Add('AND   (E.EventType = '+IntToStr(CSaleDeathEvent)+')');
         SQL.Add('AND   (AA.InHerd = FALSE)');
         try
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  if ( FieldByName('SaleDate').AsDateTime > 0 ) then
                     begin
                        if ( FieldByName('EventDate').AsDateTime > FieldByName('SaleDate').AsDateTime ) then
                           begin
                              if ( WinData.EventType = TService ) then
                                 bAbortSave := ( MessageDlg(Format('Event date %s is after Sale/Death date %s ',
                                                            [FormatDate(FieldByName('EventDate').AsDateTime, dsIrish),
                                                             FormatDate(FieldByName('SaleDate').AsDateTime, dsIrish)]) + cCRLFx2 +
                                                            'Are you sure you want to record Service Event for this date?',mtWarning,[mbYes,mbNo],0) = idNo )
                              else
                                 bAbortSave := ( MessageDlg(Format('Event date %s cannot be after Sale/Death date %s ',
                                                            [FormatDate(FieldByName('EventDate').AsDateTime, dsIrish),
                                                             FormatDate(FieldByName('SaleDate').AsDateTime, dsIrish)]),mtError,[mbOk],0) = mrOK );
                           end;
                     end;
                  if ( not(bAbortSave) ) then
                     Next
                  else
                     Break;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
         AAbortSave := bAbortSave;
      end;
end;

procedure TfEventsByGroup.btnVetLinkDrugsClick(Sender: TObject);
begin
   SetupMultiDrugGrid(mtbtVetLink);
   btnMultiDrug.Enabled := ( not(pMultiDrug.Visible) );
   //   02/11/15 [V5.4 R9.9] /MK Change - Don't show VetLink button if user has deleted all items in VetLink data table.
   if ( not(VetLinkDataExists) ) then
      begin
         btnVetLinkDrugs.Enabled := False;
         btnVetLinkDrugs.Width := 0;
         btnVetLinkDrugs.Caption := '';

         ToolButton9.Visible := False;
         ToolButton9.Style := tbsSeparator;
         ToolButton9.Width := 0;
      end;
end;

procedure TfEventsByGroup.mdMultiDrugNoDaysChange(Sender: TField);
var
  DrugWithdrawalDates : TDrugWithdrawalDates;
begin
   if ( mdMultiDrugDrugUsed.AsInteger > 0 ) then
      begin
         DrugWithdrawalDates := HerdLookup.CalculateDrugWithDrawalDates(mdMultiDrugDrugUsed.AsInteger,
                                                                        TempEvents.FieldByName('EventDate').AsDateTime,
                                                                        mdMultiDrugNoDays.AsInteger);
         if ( DrugWithdrawalDates.MeatWithdrawalDate > 0 ) then
            mdMultiDrugMeatWithdrawal.AsDateTime := DrugWithdrawalDates.MeatWithdrawalDate;
         if ( DrugWithdrawalDates.MilkWithdrawalDate > 0 ) then
            mdMultiDrugMilkWithdrawal.AsDateTime := DrugWithdrawalDates.MilkWithdrawalDate;
         if ( DrugWithdrawalDates.OrganicMeatWithdrawalDate > 0 ) then
            mdMultiDrugOrganicMeatWithdrawal.AsDateTime := DrugWithdrawalDates.OrganicMeatWithdrawalDate;
         if ( DrugWithdrawalDates.OrganicMilkWithdrawalDate > 0 ) then
            mdMultiDrugOrganicMilkWithdrawal.AsDateTime := DrugWithdrawalDates.OrganicMilkWithdrawalDate;
      end;
end;

procedure TfEventsByGroup.ShowHideWeightColumn ( AShow : Boolean );
var
   i : Integer;
begin
   for i := 0 to AnimalGrid.Columns.Count-1 do
      if AnimalGrid.Columns[i].Title.Caption = 'Last Weight' then
         AnimalGrid.Columns[i].Visible := AShow;
end;

procedure TfEventsByGroup.btnShowDefaultTreatmentTemplatesClick(Sender: TObject);
begin
  TfmMovementsInHealthDefaultsGrid.ShowMovementsInHealthDefaultGrid;
end;

procedure TfEventsByGroup.btnSortAnimalsClick(Sender: TObject);
var
   pt : tPoint;
begin
   GetCursorPos(pt);
   pmSortAnimalGrid.Popup(pt.x,pt.y);
end;

procedure TfEventsByGroup.SortAnimalGrid(AIndexName: String);
begin
   if ( Length(AIndexName) = 0 ) then Exit;
   try
      if ( TempAnimals.Active ) then
         TempAnimals.Close;
      TempAnimals.IndexName := AIndexName;
      TempAnimals.Open;
   except
      on e : Exception do
         ShowMessage(e.Message);
   end;
end;

procedure TfEventsByGroup.pmiSortByAnimalNoClick(Sender: TObject);
begin
   SortAnimalGrid('iAnimalNo');
   pmiSortByAnimalNo.Checked := True;
   pmiSortByNatID.Checked := False;
end;

procedure TfEventsByGroup.pmiSortByNatIDClick(Sender: TObject);
begin
   SortAnimalGrid('iNatIDNum');
   pmiSortByAnimalNo.Checked := False;
   pmiSortByNatID.Checked := True;
end;

procedure TfEventsByGroup.TempAnimalsWeightOnChange(Sender: TField);
begin
   TempAnimals.Edit;
   GetTempAnimalsWeighingInfo;
   TempAnimals.Post;
end;

procedure TfEventsByGroup.GetTempAnimalsWeighingInfo;
var
   iDaysDiff : Integer;
   fWeightGain,
   fGainPerDay : Double;
begin
   try
      TempAnimals.FieldByName('WeightGain').AsFloat := 0;
      TempAnimals.FieldByName('GainPerDay').AsFloat := 0;
      if ( TempAnimals.FieldByName('EventDate').AsDateTime > TempAnimals.FieldByName('LastWeighDate').AsDateTime ) then
         begin
            iDaysDiff := Trunc(TempAnimals.FieldByName('EventDate').AsDateTime - TempAnimals.FieldByName('LastWeighDate').AsDateTime);
            if ( TempAnimals.FieldByName('LastWeight').AsFloat > 0 ) and
               ( TempAnimals.FieldByName('Weight').AsFloat > TempAnimals.FieldByName('LastWeight').AsFloat ) then
               begin
                  fWeightGain := ( TempAnimals.FieldByName('Weight').AsFloat - TempAnimals.FieldByName('LastWeight').AsFloat );
                  fGainPerDay := ( fWeightGain / iDaysDiff );
                  TempAnimals.FieldByName('WeightGain').AsFloat := StrToFloat(FormatFloat('0.##',fWeightGain));
                  TempAnimals.FieldByName('GainPerDay').AsFloat := StrToFloat(FormatFloat('0.##',fGainPerDay));
               end;
         end;
   except
   end;
end;

function TfEventsByGroup.HealthEventRecCreated(AEventType : TEventType; ADataSet : TDataSet) : Boolean;
var
   iEventLactNo,
   iDrugPurch : Integer;
   sError,
   sFarmCodeDesc : String;
begin
   Result := False;
   if ( not(AEventType in [THealth, TDryOff, THerdVaccination, TMastitis, TLameness]) ) or ( ADataSet = nil ) then Exit;

   with FHealthRec do
      try
         Append;

         //Event Header Info
         if ( (AEventType = TDryOff) and ( (WinData.EventDataHelper.GetLastEventDate(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                                     GenQuery.FieldByName('LactNo').AsInteger,
                                                                                     CDryOffEvent) > 0) or
                                           ( (ADataSet = mdMultiDrug) and (ADataSet.RecNo > 1) ) ) ) then
            EventType := THealth
         else
            EventType := AEventType;

         //   28/11/18 [V5.8 R5.5] /MK Bug Fix - Regardless of event type, if the user enters a manual comment then save event description as this comment.
         if ( EventType in [THealth, TDryOff, THerdVaccination] ) then
            begin
               if FManualHealthComment then
                  EventComment := GenQuery.FieldByName('EventDesc').AsString
               else if ( EventType = TDryOff ) then
                  EventComment := 'Dry Off'
               else if ( EventType = THerdVaccination ) and ( ADataSet.FieldByName('Disease').AsString <> '' ) then
                  EventComment := ADataSet.FieldByName('Disease').AsString + ' Vaccination'
               else if ( EventType = THealth ) then
                  if ( ADataSet.FieldByName('DrugUsed').AsInteger > 0 ) then
                     begin
                        //   25/08/20 [V5.9 R5.7] /MK Bug Fix - Check if Multi Drug panel is not showing and rgUseWeightAsApplicRate.ItemIndex is 1 before using TotalApplicRate. 
                        if ( not(pMultiDrug.Visible) ) and ( rgUseWeightAsApplicRate.ItemIndex = 1 ) then
                           EventComment := GetHealthCommentByName_Unit_ApplicRate(ADataSet.FieldByName('DrugUsed').AsInteger,
                                                                                  ADataSet.FieldByName('TotalApplicRate').AsFloat,AEventType)
                        else
                           EventComment := GetHealthCommentByName_Unit_ApplicRate(ADataSet.FieldByName('DrugUsed').AsInteger,
                                                                                  ADataSet.FieldByName('RateOfApplic').AsFloat,AEventType);
                     end;
            end;

         AnimalID := GenQuery.FieldByName('AnimalID').AsInteger;

         iEventLactNo := genQuery.FieldByName('LactNo').AsInteger;
         iEventLactNo := WinData.FBreedingDataHelper.BreedingEventLactNo(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                         iEventLactNo,
                                                                         GenQuery.FieldByName('EventDate').AsDateTime);
         AnimalLactNo := iEventLactNo;

         AnimalHerdID := GenQuery.FieldByName('HerdID').AsInteger;
         EventDate := GenQuery.FieldByName('EventDate').AsDateTime;

         // Event Detail Info
         DrugUsed := ADataSet.FieldByName('DrugUsed').AsInteger;
         DoseUnitUsed := HerdLookup.MedicineUnitUsed(ADataSet.FieldByName('DrugUsed').AsInteger,utDose);
         PurchUnitUsed := HerdLookup.MedicineUnitUsed(ADataSet.FieldByName('DrugUsed').AsInteger,utPurchase);

         if ( WinData.EventType = THealth ) and ( rgUseWeightAsApplicRate.ItemIndex = 1 ) then
            RateApplic := ADataSet.FieldByName('TotalApplicRate').AsFloat
         else
            RateApplic := ADataSet.FieldByName('RateOfApplic').AsFloat;

         DrugBatchNo := ADataSet.FieldByName('DrugBatchNo').AsString;

         if ( ADataSet.FieldByName('DrugPurchID').AsInteger <= 0 ) then
            begin
               iDrugPurch := WinData.GetDrugPurchID(ADataSet.FieldByName('DrugUsed').AsInteger,
                                                    ADataSet.FieldByName('DrugBatchNo').AsString,
                                                    GenQuery.FieldByName('EventDate').AsDateTime);
               if ( iDrugPurch > 0 ) then
                  DrugPurchID := iDrugPurch;
            end
         else
            DrugPurchID := ADataSet.FieldByName('DrugPurchID').AsInteger;

         HealthCode := ADataSet.FieldByName('HealthCode').AsInteger;
         FarmCode := ADataSet.FieldByName('FarmCode').AsInteger;
         NoTimes := ADataSet.FieldByName('NoTimes').AsInteger;
         NoDays := ADataSet.FieldByName('NoDays').AsInteger;
         AdminBy := ADataSet.FieldByName('AdminBy').AsInteger;
         ApplicMethod := ADataSet.FieldByName('ApplicMethod').AsInteger;
         PrescribingVet := ADataSet.FieldByName('VetPresc').AsInteger;
         ManualComment := FManualHealthComment;
         EventSource := sNEWGRPEVENTHEALTHDRYSAVE;

         if ( EventType = THerdVaccination ) then
            begin
               ReportInDays := ADataSet.FieldByName('ReportInDays').AsInteger * 7;
               if ( CountryOfReg = Ireland ) then
                  begin
                     if ( HerdLookup.qHerdVaccineType.Locate('Description',ADataSet.FieldByName('Disease').AsString,[]) ) then
                        HealthCode := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
                  end
               else
                  begin
                     if ( HerdLookup.qHerdVaccineType.Locate('Description',ADataSet.FieldByName('Disease').AsString,[]) ) then
                        FarmCode := HerdLookup.qHerdVaccineType.FieldByName('ID').AsInteger;
                  end
            end
         else
            ReportInDays := ADataSet.FieldByName('ReportInDays').AsInteger;

         ReportID := ADataSet.FieldByName('ReportID').AsInteger;

         if ( WinData.EventType in [TMastitis, TLameness] ) then
            try
              EventComment := '';
              AreaTreated1 := ADataSet.FieldByName('AreaTreatedFL').AsBoolean;
              AreaTreated2 := ADataSet.FieldByName('AreaTreatedFR').AsBoolean;
              AreaTreated3 := ADataSet.FieldByName('AreaTreatedBL').AsBoolean;
              AreaTreated4 := ADataSet.FieldByName('AreaTreatedBR').AsBoolean;
              if AreaTreated1 then
                 EventComment := 'FL';
              if AreaTreated2 then
                 begin
                    if ( Length(EventComment) > 0 ) then
                       EventComment := EventComment + ' ';
                    EventComment := EventComment + 'FR';
                 end;
              if AreaTreated3 then
                 begin
                    if ( Length(EventComment) > 0 ) then
                       EventComment := EventComment + ' ';
                    EventComment := EventComment + 'BL';
                 end;
              if AreaTreated4 then
                 begin
                    if ( Length(EventComment) > 0 ) then
                       EventComment := EventComment + ' ';
                    EventComment := EventComment + 'BR';
                 end;
              TreatmentUsed := ADataSet.FieldByName('TreatmentUsed').AsInteger;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;

         Post;
         Result := True;
      except
         on e : Exception do
            begin
               if Database.InTransaction then
                  Database.Rollback;
               ApplicationLog.LogException(e);
               sError := '';
               case AEventType of
                  THealth : sError := 'Error saving block health event';
                  THerdVaccination : sError := 'Error saving block herd vaccination event';
                  TDryOff : sError := 'Error saving block dry off event';
                  TMastitis : sError := 'Error saving block mastitis event';
                  TLameness : sError := 'Error saving block lameness event';
               end;
               ApplicationLog.LogError(sError + ' for animal '+IntToStr(GenQuery.FieldByName('AnimalID').AsInteger));
            end;
      end;
end;

procedure TfEventsByGroup.MultiDrugGridDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   //   20/02/18 [V5.7 R8.2] /MK Bug Fix - When user changes the record on MultiDrug grid then get batchno items.
   LookupBatchNo;
end;

function TfEventsByGroup.CreatePregDiagEventRec : Boolean;
var
   iEventLactNo : Integer;
begin
   Result := False;
   if ( WinData.EventType <> TPregDiag ) then Exit;

   if ( not(GenQuery.FieldByName('PregnancyStatus').AsString <> '') ) then
      begin
         MessageDlg(Format('Animal %s is selected with no Pregnancy Status.',
                           [GenQuery.FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
         Exit;
      end
   else
      begin
         if ( GenQuery.FieldByName('RepeatPregDiag').AsBoolean ) then
            WinData.UpdatePregDiagEvent(GenQuery.FieldByName('AnimalID').AsInteger,
                                        GenQuery.FieldByName('LactNo').AsInteger);
      end;

   iEventLactNo := genQuery.FieldByName('LactNo').AsInteger;
   iEventLactNo := WinData.FBreedingDataHelper.BreedingEventLactNo(GenQuery.FieldByName('AnimalID').AsInteger,
                                                                   iEventLactNo,
                                                                   GenQuery.FieldByName('EventDate').AsDateTime);

   with FPregDiagRec do
      try
         Append;
         // Event Header Info
         EventType := WinData.EventType;

         if ( GenQuery.FieldByName('PregnancyStatus').AsBoolean ) then
            begin
               EventComment := 'Pregnant';
               if ( GenQuery.FieldByName('DaysInCalf').AsInteger > 0 ) then
                  EventComment := EventComment + '/'+IntToStr(GenQuery.FieldByName('DaysInCalf').AsInteger);
            end
         else
            EventComment := 'Not Pregnant';

         AnimalID := GenQuery.FieldByName('AnimalID').AsInteger;

         AnimalLactNo := iEventLactNo;

         AnimalHerdID := GenQuery.FieldByName('HerdID').AsInteger;
         EventDate := GenQuery.FieldByName('EventDate').AsDateTime;

         //Event Detail Info
         PregnancyStatus := GenQuery.FieldByName('PregnancyStatus').AsBoolean;
         DaysInCalf := GenQuery.FieldByName('DaysInCalf').AsInteger;
         NoCalves := GenQuery.FieldByName('NoCalves').AsInteger;
         CalfType := GenQuery.FieldByName('CalfType').AsString;
         IsRecheck := GenQuery.FieldByName('Recheck').AsBoolean;
         Post;
         Result := True;
      except
         on e : Exception do
            begin
               if Database.InTransaction then
                  Database.Rollback;
               ApplicationLog.LogException(e);
               ApplicationLog.LogError('Error saving block PD event for animal '+IntToStr(GenQuery.FieldByName('AnimalID').AsInteger));
            end;
      end;
end;

procedure TfEventsByGroup.UpdateGridFromSavedPregDiagEvents;
var
   qPregDiags : TQuery;

const
   cPregSQLStr = '(SELECT DelFA.AID'+cCRLF+
                 ' FROM AFilters.DB DelFA'+cCRLF+
                 ' LEFT JOIN Events E ON (E.AnimalID = DelFA.AID)'+cCRLF+
                 ' LEFT JOIN Animals A ON (A.ID = DelFA.AID)'+cCRLF+
                 ' LEFT JOIN PregnancyDiag P ON (P.EventID = E.ID)'+cCRLF+
                 ' WHERE (A.LactNo=E.AnimalLactNo)'+cCRLF+
                 ' AND   (E.EventType = :PregDiagEve)';

begin
   qPregDiags := TQuery.Create(nil);
   with qPregDiags do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT A.AnimalID');
         SQL.Add('FROM '+TempAnimals.TableName+' A');
         SQL.Add('WHERE (A.AnimalID IN');
         SQL.Text := SQL.Text + cPregSQLStr + 'AND   ( (P.PregnancyStatus = FALSE) OR ((P.PregnancyStatus = TRUE) AND (P.Recheck = TRUE)) ) ))';

         Params[0].AsInteger := CPregDiagEvent;
         Open;
         if ( RecordCount > 0 ) then
            begin
               First;
               while (not(Eof) ) do
                  begin
                     if ( TempAnimals.Locate('AnimalID',FieldByName('AnimalID').AsInteger,[]) ) then
                        begin
                           TempAnimals.Edit;
                           TempAnimals.FieldByName('RepeatPregDiag').AsBoolean := True;
                           TempAnimals.Post;
                        end;
                     Next;
                  end;
            end;

         SQL.Clear;
         SQL.Add('DELETE FROM '+TempAnimals.TableName+' A');
         SQL.Add('WHERE (A.AnimalID IN');
         SQL.Text := SQL.Text + cPregSQLStr + 'AND   ( (P.PregnancyStatus = TRUE) AND ((P.Recheck = FALSE) OR (P.Recheck IS NULL)) ) ))';
         Params[0].AsInteger := CPregDiagEvent;
         try
            ExecSQL;
            TempAnimals.Close;
            TempAnimals.Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.UpdateTempAnimalPregDiagInfo(ADataSet : TDataSet);
var
   PregDiagDate : TDateTime;
   IsPregnant, IsRecheck : Boolean;
   NoOfCalves, DaysInCalf : Integer;
begin
   if ( not(WinData.EventType in [TPregDiag, TService]) ) then Exit;

   PregDiagDate := 0;
   IsPregnant := False;
   NoOfCalves := 0;
   DaysInCalf := 0;

   try
      //   20/03/18 [V5.7 R8.4] /MK Change - Use new BreedingDataHelper procedure to get preg diag info by SQL for speed purposes.
      FBreedingDataHelper.GetPregDiagInfo(ADataSet.FieldByName('AnimalID').AsInteger,
                                          ADataSet.FieldByName('LactNo').AsInteger,
                                          IsPregnant,IsRecheck,PregDiagDate,NoOfCalves,DaysInCalf);
      if ( PregDiagDate > 0 ) then
         begin
            if ( WinData.EventType = TPregDiag ) then
               begin
                  TempAnimals.FieldByName('RepeatPregDiag').AsBoolean := not(IsPregnant) or IsRecheck;
                  Inc(FPregDiagRepeatCount);
               end
            else if ( WinData.EventType = TService ) then
               begin
                  if ( bPrevPregDiagEvent <> nil ) then
                     begin
                        TempAnimals.FieldByName('PrevPregDiagEvent').AsBoolean := IsPregnant;
                        Inc(FPregDiagEventCount);
                     end;
               end;
         end;
   except
   end;
end;

procedure TfEventsByGroup.UpdateTempAnimalsServiceInfo(ADataSet : TDataSet);
var
   IsServed: Boolean;
   NoServes, DaysToService: Integer;
   LastService, DueAfter: TDateTime;
   LastBull, ServeType: String;
begin
   if ( not(WinData.EventType in [TPregDiag, TService]) ) then Exit;

   //   20/03/18 [V5.7 R8.4] /MK Change - Use new BreedingDataHelper procedure to get service info by SQL for speed purposes.
   FBreedingDataHelper.GetServiceInfo(ADataSet.FieldByName('AnimalID').AsInteger,
                                      ADataSet.FieldByName('LactNo').AsInteger,
                                      IsServed, NoServes, DaysToService,
                                      LastService, DueAfter, LastBull, ServeType);

   if ( TempAnimals.FindField(fn_LastServiceDate) <> nil ) then
      begin
         TempAnimals.FieldByName(fn_LastServiceDate).AsDateTime := LastService;
         if ( TempAnimals.FieldByName(fn_LastServiceDate).AsDateTime <= 0 ) then
            TempAnimals.FieldByName(fn_LastServiceDate).Clear;

         if ( TempAnimals.FindField(fn_DaysSinceService) <> nil ) then
            begin
               if ( LastService > 0 ) then
                  begin
                     TempAnimals.FieldByName(fn_DaysSinceService).AsInteger := Trunc(TempAnimals.FieldByName('EventDate').AsDateTime - LastService);
                     if ( TempAnimals.FieldByName(fn_DaysSinceService).AsInteger < 0 ) then
                        TempAnimals.FieldByName(fn_DaysSinceService).Clear;
                  end
               else
                  TempAnimals.FieldByName(fn_DaysSinceService).Clear;
            end;
      end;

   if TempAnimals.FindField('NumOfServes') <> nil then
      TempAnimals.FieldByName('NumOfServes').AsInteger := NoServes;
   if TempAnimals.FindField('sLastServiceBull') <> nil then
      TempAnimals.FieldByName('sLastServiceBull').AsString := LastBull;
end;

procedure TfEventsByGroup.RemoveTempAnimals_PregDiag_BeforeCalved;
var
   qPregDiagAnimals : TQuery;
   DuePDDefaults : TDuePregDiagDefaults;
   iDaysToCalving : Integer;
   iaAnimalsToDelete : Array Of Integer;
begin
   qPregDiagAnimals := TQuery.Create(nil);
   with qPregDiagAnimals do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT TA.AnimalID, TA.LactNo, EC.EventDate CalvingDate');
         SQL.Add('FROM '+TempAnimals.TableName+' TA');
         SQL.Add('LEFT JOIN Events EC ON ( (EC.AnimalID = TA.AnimalID) AND (EC.AnimalLactNo = TA.LactNo) )');
         SQL.Add('WHERE (EC.EventType = :Calving)');
         SQL.Add('AND   (EC.EventDate < "'+FormatDateTime(CUSDateStyle,TempEvents.FieldByName('EventDate').AsDateTime)+'")');
         SQL.Add('AND   (TA.LactNo > 0)');
         Params[0].AsInteger := CCalvingEvent;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  SetLength(iaAnimalsToDelete,0);

                  DuePDDefaults := TDuePregDiagDefaults.Create(cRD_DuePregDiag);
                  try
                     iDaysToCalving := DuePDDefaults.NotServedDaysToCalving;
                  finally
                     FreeAndNil(DuePDDefaults);
                  end;

                  qPregDiagAnimals.First;
                  while ( not(qPregDiagAnimals.Eof) ) do
                     begin
                        if ( Trunc(Date - qPregDiagAnimals.FieldByName('CalvingDate').AsDateTime) < iDaysToCalving ) then
                           begin
                              SetLength(iaAnimalsToDelete,Length(iaAnimalsToDelete)+1);
                              iaAnimalsToDelete[Length(iaAnimalsToDelete)-1] := qPregDiagAnimals.FieldByName('AnimalID').AsInteger;
                           end;
                        qPregDiagAnimals.Next;
                     end;

                  if ( Length(iaAnimalsToDelete) > 0 ) then
                     begin
                        qPregDiagAnimals.Close;
                        qPregDiagAnimals.SQL.Clear;
                        qPregDiagAnimals.SQL.Add('DELETE FROM '+TempAnimals.TableName+'');
                        qPregDiagAnimals.SQL.Add('WHERE AnimalID IN '+IntArrayToSQLInString(iaAnimalsToDelete)+'');
                        qPregDiagAnimals.ExecSQL;
                     end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfEventsByGroup.ToBeCulledSetup;
begin
   deToBeCulledDate.DataBinding.DataSource := dsTempEvents;
   deToBeCulledDate.DataBinding.DataField := 'EventDate';

   deToBeCulledDesc.DataBinding.DataSource := dsTempEvents;
   deToBeCulledDesc.DataBinding.DataField := 'EventDesc';

   SetDataSource(tsToBeCulled,dsTempEvents);
end;

procedure TfEventsByGroup.btnDeleteTestDatesClick(Sender: TObject);
begin
   HerdPassword.CreateAndShow(paClearDiseaseTestDates);
end;

procedure TfEventsByGroup.CreateTempWeighInfoDataSets;
begin
   if ( not(FWeighingEvents.Exists) ) then
      begin
         FWeighingEvents.TableName := 'tmpWeights';
         FWeighingEvents.FieldDefs.Add('ID',ftAutoInc);
         FWeighingEvents.FieldDefs.Add('EventID',ftInteger);
         FWeighingEvents.FieldDefs.Add('AnimalID',ftInteger);
         FWeighingEvents.FieldDefs.Add('AnimalLactNo',ftInteger);
         FWeighingEvents.FieldDefs.Add('EventDate',ftDate);
         FWeighingEvents.IndexDefs.Add('','ID',[ixPrimary]);
         FWeighingEvents.IndexDefs.Add('iEventID','EventID',[ixCaseInsensitive] );
         FWeighingEvents.IndexDefs.Add('iAnimalID','AnimalID',[ixCaseInsensitive] );
         FWeighingEvents.IndexDefs.Add('iEventDate','EventDate',[ixCaseInsensitive] );
         FWeighingEvents.IndexDefs.Add('iIDLactDate','AnimalId;AnimalLactNo;EventDate',[ixCaseInsensitive] );
         FWeighingEvents.IndexName := 'iEventDate';
         FWeighingEvents.CreateTable;
      end;
   if ( not(FWeighingEvents.Active) ) then
      FWeighingEvents.Open;

   if ( FWeighingEvents.RecordCount = 0 ) then
      begin
         FWeighInfoQuery.Close;
         FWeighInfoQuery.SQL.Clear;
         FWeighInfoQuery.SQL.Add('INSERT INTO '+FWeighingEvents.TableName+'(EventID, AnimalID, AnimalLactNo, EventDate)');
         FWeighInfoQuery.SQL.Add('SELECT ID, AnimalID, AnimalLactNo, EventDate');
         FWeighInfoQuery.SQL.Add('FROM Events');
         FWeighInfoQuery.SQL.Add('WHERE EventType = '+IntToStr(CWeightEvent)+'');
         FWeighInfoQuery.ExecSQL;
      end;
end;

procedure TfEventsByGroup.CreateTempPurchInfoDataSets;
begin
   if ( not(FPurchaseEvents.Exists) ) then
      begin
         FPurchaseEvents.TableName := 'tmpPurchases';
         FPurchaseEvents.FieldDefs.Add('ID',ftAutoInc);
         FPurchaseEvents.FieldDefs.Add('EventID',ftInteger);
         FPurchaseEvents.FieldDefs.Add('AnimalID',ftInteger);
         FPurchaseEvents.FieldDefs.Add('AnimalLactNo',ftInteger);
         FPurchaseEvents.FieldDefs.Add('EventDate',ftDate);
         FPurchaseEvents.IndexDefs.Add('','ID',[ixPrimary]);
         FPurchaseEvents.IndexDefs.Add('iEventID','EventID',[ixCaseInsensitive] );
         FPurchaseEvents.IndexDefs.Add('iAnimalID','AnimalID',[ixCaseInsensitive] );
         FPurchaseEvents.IndexDefs.Add('iEventDate','EventDate',[ixCaseInsensitive] );
         FPurchaseEvents.IndexDefs.Add('iIDLactDate','AnimalId;AnimalLactNo;EventDate',[ixCaseInsensitive] );
         FPurchaseEvents.IndexName := 'iEventDate';
         FPurchaseEvents.CreateTable;
      end;
   if ( not(FPurchaseEvents.Active) ) then
      FPurchaseEvents.Open;

   if ( FPurchaseEvents.RecordCount = 0 ) then
      begin
         FPurchInfoQuery.Close;
         FPurchInfoQuery.SQL.Clear;
         FPurchInfoQuery.SQL.Add('INSERT INTO '+FPurchaseEvents.TableName+'(EventID, AnimalID, AnimalLactNo, EventDate)');
         FPurchInfoQuery.SQL.Add('SELECT ID, AnimalID, AnimalLactNo, EventDate');
         FPurchInfoQuery.SQL.Add('FROM Events');
         FPurchInfoQuery.SQL.Add('WHERE EventType = '+IntToStr(CPurchaseEvent)+'');
         FPurchInfoQuery.ExecSQL;
      end;
end;

procedure TfEventsByGroup.DaysInCalfEnter(Sender: TObject);
begin
   OnEnteringControl(Sender);
end;

procedure TfEventsByGroup.DaysInCalfExit(Sender: TObject);
begin
   UpdateAnimals(Sender);
   try
      if ( TempEvents.FieldByName('DaysInCalf') <> nil ) and
         ( TempEvents.FieldByName('DaysInCalf').AsInteger = 0 ) then
         begin
            TempEvents.FieldByName('DaysInCalf').AsVariant := Null;
            Exit;
         end;

      if ( TempEvents.FieldByName('DaysInCalf') <> nil ) and
         ( TempEvents.FieldByName('DaysInCalf').AsInteger > 0 ) and
         ( TempEvents.FieldByName('DaysInCalf').AsInteger < 20 ) then
         begin
            MessageDlg('Default Days In Calf must be greater than 20.'+cCRLF+
                       'Leave blank if you want service dates'+cCRLF+
                       'to take precedence over PD results.',mtError,[mbOK],0);
            DaysInCalf.SetFocus;
            SysUtils.Abort;
         end;
   except
   end;
end;

procedure TfEventsByGroup.AnimalGridCellClick(Column: TColumnEh);
begin
   if ( Column.Field.DataType = ftBoolean ) then
      begin
         {toggle True and False}
         Column.Grid.DataSource.DataSet.Edit;
         Column.Field.Value:= not Column.Field.AsBoolean;
         {immediate post - see for yourself whether you want this}
         Column.Grid.DataSource.DataSet.Post;
         {you may add additional functionality here,    to be processed after the change was made}
         if ( UpperCase(Column.FieldName) = 'SELECTED' ) then
            begin
               CountSelectedRecords;
               AllAnimalsSelected := GetAllAnimalsSelected;
               AnimalGrid.SelectedField := AnimalGrid.Fields[1];
            end;
      end;
end;

procedure TfEventsByGroup.AnimalGridDrawColumnCell(Sender: TObject;
   const Rect: TRect; DataCol: Integer; Column: TColumnEh;
   State: TGridDrawState);
const
  CtrlState: array[Boolean] of integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED) ;
begin
   if ( Column.Field.DataType = ftBoolean ) then
      begin
         AnimalGrid.Canvas.FillRect(Rect) ;
         if VarIsNull(Column.Field.Value) then
            DrawFrameControl(AnimalGrid.Canvas.Handle,Rect, DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_INACTIVE) {grayed}
         else
            DrawFrameControl(AnimalGrid.Canvas.Handle,Rect, DFC_BUTTON, CtrlState[Column.Field.AsBoolean]) ; {checked or unchecked}
      end;
end;

procedure TfEventsByGroup.ChangeEventDesc_ApplicLabelByDrug;
begin
   if ( (DrugUsed.EditValue > 0) and (DrugUsed.EditValue <> Null) ) then
      begin
         LookupBatchNo;
         lRateOfApplic.Caption := HerdLookup.LookupDrugDosePurchUnitCode(DrugUsed.EditValue,utDose);
         ChangeTotalApplicRateAmtTitleCaption;
         if ( not(FManualHealthComment) ) and ( WinData.EventType = THealth ) and ( Length(RateOfApplic.Text) > 0 ) then
            TempEvents.FieldByName('EventDesc').AsString := GetHealthCommentByName_Unit_ApplicRate(DrugUsed.EditValue,
                                                                                                   StrToFloat(RateOfApplic.Text),
                                                                                                   WinData.EventType);
      end;
end;

function TfEventsByGroup.GetAllAnimalsSelected: Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM '+TempAnimals.TableName);
         SQL.Add('WHERE Selected = True');
         try
            Open;
            Result := ( RecordCount > 0 ) and ( RecordCount = TempAnimals.RecordCount ); 
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TfEventsByGroup.DBGridColumnByName(AGrid : TDBGridEH; const AName : String) : TColumnEH;
var
   i : Integer;
begin
   Result := Nil;
   for i := 0 to AGrid.Columns.Count - 1 do begin
   if ( AGrid.Columns[i].Field <> Nil ) and ( UpperCase(AName) = UpperCase(AGrid.Columns[i].FieldName) ) then
      begin
         Result := AGrid.Columns[i];
         Exit;
      end;
   end;
end;

procedure TfEventsByGroup.rgUseWeightAsApplicRatePropertiesChange(Sender: TObject);
begin
   FUseApplicRateByKg := ( rgUseWeightAsApplicRate.ItemIndex = 1 ) and ( not(pMultiDrug.Visible) );
   AnimalGrid.Columns[DBGridColumnByName(AnimalGrid, 'LastWeight').Index].Visible := FUseApplicRateByKg;
   AnimalGrid.Columns[DBGridColumnByName(AnimalGrid, 'TotalApplicRate').Index].Visible := FUseApplicRateByKg;
   ChangeTotalApplicRateAmtTitleCaption;
   if ( FUseApplicRateByKg ) then
      TfmMessageScr.ShowTheForm(mtDoseByKgSelect);
end;

procedure TfEventsByGroup.ChangeTotalApplicRateAmtTitleCaption;
begin
   if ( (DrugUsed.EditValue > 0) and (DrugUsed.EditValue <> Null) ) then
      begin
         lRateOfApplic.Caption := HerdLookup.LookupDrugDosePurchUnitCode(DrugUsed.EditValue,utDose);
         AnimalGrid.Columns[DBGridColumnByName(AnimalGrid, 'RateOfApplic').Index].Title.Caption := 'Rate';
      end;
   if ( FUseApplicRateByKg ) and ( Length(lRateOfApplic.Caption) > 0 ) then
      begin
         AnimalGrid.Columns[DBGridColumnByName(AnimalGrid, 'TotalApplicRate').Index].Title.Caption :=
            'Total Amount' + ' ('+lRateOfApplic.Caption+')';
         lRateOfApplic.Caption := lRateOfApplic.Caption + '/kg';
         AnimalGrid.Columns[DBGridColumnByName(AnimalGrid, 'RateOfApplic').Index].Title.Caption :=
            'Rate' +#13+ '('+lRateOfApplic.Caption+')';
      end;
end;

procedure TfEventsByGroup.actSelectBatchNoExecute(Sender: TObject);
var
   iDrugPurchID : Integer;
begin
   if ( TempEvents.FieldByName('DrugUsed').AsInteger <= 0 ) then Exit;
   iDrugPurchID := TfmLookupDrugBatchNo.GetMediPurchID(TempEvents.FieldByName('DrugUsed').AsInteger,
                                                       TempEvents.FieldByName('EventDate').AsDateTime,
                                                       dbcbDrugBatchNo.Text);
   if ( iDrugPurchID = 0 ) then Exit;
   TempEvents.FieldByName('DrugPurchID').AsInteger := iDrugPurchID;
   btnLookupBatchQtys.Glyph := nil;
   btnLookupBatchQtys.Action := actCancelSelBatch;
   dbcbDrugBatchNo.Enabled := False;
   if ( WinData.qDrugBatchNo.Locate('ID',iDrugPurchID,[]) ) then
      begin
         TempEvents.FieldByName('DrugPurchID').AsInteger := iDrugPurchID;
         dbcbDrugBatchNo.Text := WinData.qDrugBatchNo.FieldByName('BatchNo').AsString;
         lDrugExpires.Caption := 'Expires: '+cCRLF+FormatDateTime(cIrishDateStyle,  WinData.qDrugBatchNo.FieldByName('ExpiryDate').AsDateTime)+'';
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('UPDATE '+TempAnimals.TableName);
               SQL.Add('SET DrugPurchID = :PurchID,');
               SQL.Add('    DrugBatchNo = :BatchNo');
               Params[0].AsInteger := iDrugPurchID;
               Params[1].AsString := dbcbDrugBatchNo.Text;
               ExecSQL;
            finally
               Free;
            end;
      end;
end;

procedure TfEventsByGroup.actCancelSelBatchExecute(Sender: TObject);
begin
   btnLookupBatchQtys.Glyph := nil;
   btnLookupBatchQtys.Action := actSelectBatchNo;
   TempEvents.FieldByName('DrugPurchID').AsVariant := Null;
   dbcbDrugBatchNo.Text := '';
   lDrugExpires.Caption := '';
   dbcbDrugBatchNo.Enabled := True;
end;

procedure TfEventsByGroup.actSearchByParNatIdExecute(Sender: TObject);
var
   iSearchStrLength,
   iStartPos,
   iCurrGridPos,
   iLoopCount : Integer;
   sTableStr,
   sSearchTxt : String;
begin
   if ( Length(teNatIDNum.Text) = 0 ) then Exit;
   FPartNatIdSearchFound := False;
   sSearchTxt := StripAllAlphaButNum(teNatIDNum.Text);
   iSearchStrLength := Length(teNatIDNum.Text);
   iLoopCount := 0;
   while ( not(TempAnimals.Eof) ) do
      begin
         sTableStr := Copy(TempAnimals.FieldByName('SearchNatID').AsString,Length(TempAnimals.FieldByName('SearchNatID').AsString)-iSearchStrLength+1,iSearchStrLength);
         if ( sSearchTxt = sTableStr ) then
            begin
               FPartNatIdSearchFound := True;
               FPartNatIdSearchSelectedRecNo := TempAnimals.RecNo;
               Break;
            end;
         TempAnimals.Next;
         if ( TempAnimals.Eof ) then
            begin
               if ( iLoopCount = 1 ) then
                  begin
                     MessageDlg('Unable to locate animal.',mtInformation,[mbOK],0);
                     TempAnimals.First;
                     Break;
                  end;
               Inc(iLoopCount);
               TempAnimals.First;
            end;
      end;
end;

procedure TfEventsByGroup.imgSearchInfoClick(Sender: TObject);
var
   pt : TPoint;
begin
   try
      pt.x := 0;
      pt.y := 0;
      pt := imgSearchInfo.ClientToScreen(pt);
      HideHintStyleController();
      CreateHintStyleController();
      HintTimer.Enabled := True;
      HintStyleController.ShowHint(pt.x, pt.y, 'Enter Key', 'When searching by Part Nat Id. pressing enter in the Part Nat ID'+cCRLF+
                                                            'will be begin the search of the number entered.'+cCRLF+
                                                            'Press enter again to select/tick the animal that was found.');
   finally
   end;
end;

procedure TfEventsByGroup.HideHintStyleController;
begin
   if ( HintStyleController <> nil ) then
      HintStyleController.HideHint;
end;

procedure TfEventsByGroup.HintTimerTimer(Sender: TObject);
begin
   HintTimer.Enabled := False;
   HideHintStyleController;
end;

procedure TfEventsByGroup.CreateHintStyleController;
begin
   HintStyleController.HintStyle.Standard := False;
   HintStyleController.HintStyle.Color := $00FCD6B4;
   HintStyleController.HintStyle.IconType := cxhiInformation;
   HintStyleController.HintStyle.Animate := cxhaNone;
   HintStyleController.HintStyle.AnimationDelay := 500;
   HintStyleController.HintStyle.CallOutPosition := cxbpNone;
   HintStyleController.HintStyle.CaptionFont.Name := 'Segoe UI';
   HintStyleController.HintStyle.CaptionFont.Size := 10;
   HintStyleController.HintStyle.CaptionFont.Style := [fsBold];
   HintStyleController.HintStyle.CaptionFont.Color := clWindowText;
   HintStyleController.HintStyle.Font.Name := 'Segoe UI';
   HintStyleController.HintStyle.Font.Size := 8;
   HintStyleController.HintStyle.Font.Style := [];
   HintStyleController.HintStyle.Font.Color := clWindowText;
   HintStyleController.HintStyle.Rounded := True;
   HintStyleController.HintStyle.RoundRadius := 12;
end;

procedure TfEventsByGroup.teAnimalNoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_RETURN ) then
      begin
         SelectDeSelectAnimal;
         if Sender is TcxTextEdit then
            (Sender as TcxTextEdit).SelectAll;
      end;
end;

procedure TfEventsByGroup.teNatIDNumKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_RETURN ) then
      begin
         if ( FPartNatIdSearchFound ) and ( FPartNatIdSearchSelectedRecNo = TempAnimals.RecNo ) then
            begin
               SelectDeSelectAnimal;
               if Sender is TcxTextEdit then
                  (Sender as TcxTextEdit).SelectAll;
            end
         else
            actSearchByParNatId.Execute;
      end;
end;

procedure TfEventsByGroup.SelectDeSelectAnimal;
begin
   with AnimalGrid.DataSource.DataSet do
      begin
         if not eof or bof then
            begin
               AnimalGrid.DataSource.DataSet.Edit;
               try
                  AnimalGrid.DataSource.DataSet.FieldByName('Selected').AsBoolean := not AnimalGrid.DataSource.DataSet.FieldByName('Selected').AsBoolean;
                  AnimalGrid.DataSource.DataSet.Post;
                  CountSelectedRecords;
               except
                  MessageDlg('Animal selection could not be made.',mtError,[mbOK],0);
               end;
            end;
      end;
end;

end.
